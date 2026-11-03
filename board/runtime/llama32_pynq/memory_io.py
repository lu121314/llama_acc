"""Small native aligned-MMIO copier, compiled for the executing board's CPU."""
import ctypes
from pathlib import Path
import shutil
import subprocess
import tempfile
import threading

_library = None
_lock = threading.Lock()


def prepare_memory_io():
    """Compile once into a private temporary directory before any physical write."""
    global _library
    with _lock:
        if _library is not None:
            return _library
        compiler = shutil.which('cc') or shutil.which('gcc')
        if compiler is None:
            raise RuntimeError('DDR access requires the board C compiler (cc or gcc) for aligned ARM MMIO copies')
        source = Path(__file__).with_name('memory_io.c')
        with tempfile.TemporaryDirectory(prefix='llama-memory-io-') as folder:
            library = Path(folder) / 'memory_io.so'
            try:
                result = subprocess.run([compiler, '-std=c11', '-O2', '-shared', '-fPIC',
                                         '-Wall', '-Wextra', '-Werror', str(source), '-o', str(library)],
                                        capture_output=True, text=True, timeout=60)
            except subprocess.TimeoutExpired as exc:
                raise RuntimeError('The aligned DDR copier compiler did not finish within 60 seconds') from exc
            if result.returncode:
                raise RuntimeError(f'Could not build aligned DDR copier: {result.stderr.strip()}')
            loaded = ctypes.CDLL(str(library))
            for name in ('llama_write_words', 'llama_read_words'):
                function = getattr(loaded, name)
                function.argtypes = [ctypes.c_void_p, ctypes.c_void_p, ctypes.c_size_t]
                function.restype = ctypes.c_int
            # Linux keeps the loaded shared-object mappings after unlinking it.
            _library = loaded
    return _library


def write_words(mapping, data):
    if len(data) % 4 or len(data) > len(mapping):
        raise ValueError('DDR writes require a whole number of aligned 32-bit words')
    library = prepare_memory_io()
    address = ctypes.c_char.from_buffer(mapping)
    try:
        if library.llama_write_words(ctypes.addressof(address), ctypes.c_char_p(data), len(data)):
            raise ValueError('DDR mapping is not aligned to 32 bits')
    finally:
        del address


def read_words(mapping, count):
    if count < 0 or count % 4 or count > len(mapping):
        raise ValueError('DDR reads require a whole number of aligned 32-bit words')
    library = prepare_memory_io()
    address = ctypes.c_char.from_buffer(mapping)
    output = ctypes.create_string_buffer(count)
    try:
        if library.llama_read_words(output, ctypes.addressof(address), count):
            raise ValueError('DDR mapping is not aligned to 32 bits')
        return output.raw
    finally:
        del address
