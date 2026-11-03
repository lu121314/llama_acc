"""Bounded, uncached access to memory explicitly reserved at boot."""
import hashlib
import mmap
import os
from pathlib import Path
import struct

from .config import PS_BASE, PS_SIZE
from .memory_io import prepare_memory_io, read_words, write_words
from .progress import ByteProgress, log


def _cell_count(path, default):
    if not path.exists():
        return default
    data = path.read_bytes()
    if len(data) != 4:
        raise RuntimeError(f'Invalid device-tree cell count: {path}')
    value = struct.unpack('>I', data)[0]
    if value not in (1, 2):
        raise RuntimeError(f'Unsupported device-tree cell count {value}')
    return value


def _ranges(data, address_cells, size_cells):
    width = 4 * (address_cells + size_cells)
    if len(data) % width:
        raise RuntimeError('Malformed device-tree reg property')
    for offset in range(0, len(data), width):
        a = int.from_bytes(data[offset:offset + 4 * address_cells], 'big')
        s = int.from_bytes(data[offset + 4 * address_cells:offset + width], 'big')
        yield a, s


def assert_ps_reserved(dt_root='/sys/firmware/devicetree/base'):
    root = Path(dt_root)
    reserved = root / 'reserved-memory'
    if not reserved.is_dir():
        raise RuntimeError('No boot-time reserved-memory found; matching high-address hardware and a boot-time no-map PS DDR reservation are required for inference')
    if (reserved / 'status').exists() and (reserved / 'status').read_bytes().rstrip(b'\0') not in (b'okay', b'ok'):
        raise RuntimeError('Boot-time reserved-memory is disabled')
    root_ac = _cell_count(root / '#address-cells', 2)
    root_sc = _cell_count(root / '#size-cells', 1)
    ac = _cell_count(reserved / '#address-cells', root_ac)
    sc = _cell_count(reserved / '#size-cells', root_sc)
    if ac != root_ac or sc != root_sc or not (reserved / 'ranges').is_file() or (reserved / 'ranges').read_bytes():
        raise RuntimeError('reserved-memory must use root address/size cells and an empty ranges property')
    def enabled(node):
        return not (node / 'status').exists() or (node / 'status').read_bytes().rstrip(b'\0') in (b'okay', b'ok')
    memory_banks = []
    for node in root.iterdir():
        if (node.is_dir() and enabled(node) and (node / 'device_type').is_file()
                and (node / 'device_type').read_bytes().rstrip(b'\0') == b'memory'
                and (node / 'reg').is_file()):
            memory_banks.extend(_ranges((node / 'reg').read_bytes(), root_ac, root_sc))
    if not any(base <= PS_BASE and PS_BASE + PS_SIZE <= base + size for base, size in memory_banks):
        raise RuntimeError('The reserved high PS DDR pool is not inside a declared physical memory bank')
    active = [(node, list(_ranges((node / 'reg').read_bytes(), ac, sc)))
              for node in reserved.iterdir() if node.is_dir() and enabled(node) and (node / 'reg').is_file()]
    for node, ranges in active:
        if not (node / 'no-map').is_file() or (node / 'no-map').read_bytes():
            continue
        if any((node / flag).exists() for flag in ('reusable', 'linux,cma-default', 'linux,dma-default',
                                                  'compatible', 'size', 'alignment', 'alloc-ranges')):
            continue
        if ranges == [(PS_BASE, PS_SIZE)]:
            for other, intervals in active:
                if other != node and any(base < PS_BASE + PS_SIZE and PS_BASE < base + size for base, size in intervals):
                    raise RuntimeError(f'PS model reservation overlaps {other}')
            return {'node': str(node), 'base': PS_BASE, 'size': PS_SIZE, 'no_map': True}
    raise RuntimeError('PS high DDR 0x800000000..0x87fffffff is not a dedicated 2 GiB no-map reservation; refusing physical writes')


class PhysicalMemory:
    """No allocator and no mapping of Linux-owned RAM.

    The caller checks the live boot-time reservation before creating the PS
    instance. O_SYNC + a no-map region avoids cached Linux aliases; buffers are
    copied in bounded mappings, never into one multi-gigabyte Python object.
    """
    def __init__(self, base, size, device='/dev/mem', chunk_bytes=4 * 1024 * 1024):
        if base < 0 or base % mmap.PAGESIZE or size <= 0 or chunk_bytes <= 0 or chunk_bytes % mmap.PAGESIZE:
            raise ValueError('Memory base/chunk must be page aligned and sizes positive')
        self.base, self.size, self.device = base, size, str(device)
        self.chunk_bytes = chunk_bytes

    def _bounds(self, offset, size):
        if offset < 0 or size < 0 or offset + size > self.size:
            raise ValueError('Access is outside the configured memory region')

    def load_file(self, path, expected_size, expected_sha256=None, progress=None,
                  *, verify=True, verbose=True):
        """Upload a packed image; diagnostic loads also hash and read it back.

        ``verify=False`` copies directly to DDR without computing hashes or
        reading DDR back. The progress callback still receives each completed
        chunk as ``(written_bytes, total_bytes)``.
        """
        path = Path(path)
        actual_size = path.stat().st_size
        if actual_size != expected_size:
            raise ValueError(f'{path.name}: expected {expected_size} bytes, got {actual_size}; use PS/PL two-core packed images')
        self._bounds(0, actual_size)
        if actual_size % 4:
            raise ValueError('Model image size must be a multiple of 4 bytes for aligned DDR access')
        if verify and expected_sha256 is not None:
            digest = hashlib.sha256()
            hash_progress = ByteProgress(f'{path.name} SHA256 before DDR write') if verbose else None
            if hash_progress is not None:
                hash_progress(0, actual_size)
            hashed = 0
            with path.open('rb') as source:
                for chunk in iter(lambda: source.read(self.chunk_bytes), b''):
                    digest.update(chunk)
                    hashed += len(chunk)
                    if hash_progress is not None:
                        hash_progress(hashed, actual_size)
            if digest.hexdigest().lower() != expected_sha256.lower():
                raise ValueError('Model SHA-256 does not match the expected digest; no memory was written')
            if verbose:
                log(f'{path.name} source SHA256 passed; no DDR written yet')
        if verbose:
            log(f'{path.name}: preparing aligned DDR copier')
        prepare_memory_io()
        written = hashlib.sha256() if verify else None
        readback = hashlib.sha256() if verify else None
        fd = os.open(self.device, os.O_RDWR | os.O_SYNC)
        transfer_name = 'DDR write+readback' if verify else 'DDR upload'
        transfer_progress = ByteProgress(f'{path.name} {transfer_name}') if verbose else None
        if transfer_progress is not None:
            transfer_progress(0, actual_size)
        try:
            with path.open('rb', buffering=0) as source:
                for offset in range(0, actual_size, self.chunk_bytes):
                    count = min(self.chunk_bytes, actual_size - offset)
                    with mmap.mmap(fd, count, flags=mmap.MAP_SHARED,
                                   prot=mmap.PROT_READ | mmap.PROT_WRITE,
                                   offset=self.base + offset) as mapped:
                        original = source.read(count)
                        if len(original) != count:
                            raise IOError('Model image changed or ended during loading')
                        if verbose and offset == 0:
                            log(f'{path.name}: first DDR write, {count} bytes at {self.base:#x}')
                        write_words(mapped, original)
                        if verify:
                            written.update(original)
                            if verbose and offset == 0:
                                log(f'{path.name}: first DDR readback, {count} bytes at {self.base:#x}')
                            readback.update(read_words(mapped, count))
                    if transfer_progress is not None:
                        transfer_progress(offset + count, actual_size)
                    if progress is not None:
                        progress(offset + count, actual_size)
                if source.read(1):
                    raise IOError('Model image grew during loading')
        finally:
            os.close(fd)
        digest = None
        if verify:
            digest = written.hexdigest()
            if digest != readback.hexdigest():
                raise IOError('Memory readback SHA-256 does not match the input image')
            if expected_sha256 is not None and digest.lower() != expected_sha256.lower():
                raise ValueError('Model SHA-256 does not match the expected digest')
        if verbose:
            if verify:
                log(f'{path.name}: full DDR readback SHA256 passed, sha256={digest}')
            else:
                log(f'{path.name}: DDR upload complete')
        return {'path': str(path), 'bytes': actual_size, 'sha256': digest, 'readback_verified': verify}

    def smoke_test(self):
        """Read/write/restore the final page, beyond the packed model image."""
        offset = self.size - mmap.PAGESIZE
        self._bounds(offset, 64)
        prepare_memory_io()
        fd = os.open(self.device, os.O_RDWR | os.O_SYNC)
        try:
            with mmap.mmap(fd, mmap.PAGESIZE, flags=mmap.MAP_SHARED,
                           prot=mmap.PROT_READ | mmap.PROT_WRITE,
                           offset=self.base + offset) as mapped:
                original = read_words(mapped, 64)
                try:
                    pattern = bytes(range(64))
                    write_words(mapped, pattern)
                    if read_words(mapped, 64) != pattern:
                        raise IOError('DDR smoke test readback failed')
                finally:
                    write_words(mapped, original)
        finally:
            os.close(fd)
        return {'address': self.base + offset, 'bytes': 64, 'restored': True}
