"""Offline validation shared by the exporter and board-side preflight."""
import hashlib
import json
from pathlib import Path
import struct
import xml.etree.ElementTree as ET

from .config import (CONTEXT_TOKENS, CONTROL_BASE, LAYOUT_ID, PART, PL_BASE,
                     PL_SIZE, PROJECT_NAME, PS_BASE, PS_SIZE)

PROFILE_MODULES = {'baremetal': 'DataPath_xN', 'pynq': 'DataPath_Pynq'}


def _validate_reset_network(modules):
    """Reject reset configurations which can leave every AXI access stalled.

    A matching checksum only proves that metadata and bitstream were exported
    together. It cannot make an asserted reset safe. Check actual connected
    constant drivers rather than relying on names such as ``zero`` or ``one``.
    """
    def fail(description):
        raise ValueError(f'Unsafe HWH reset network: {description}; rebuild the bitstream '
                         'with corrected reset wiring before downloading it')

    def pin(instance, name):
        module = modules.get(instance)
        ports = [] if module is None else module.findall(f'./PORTS/PORT[@NAME="{name}"]')
        if len(ports) != 1:
            fail(f'missing or ambiguous {instance}/{name}')
        return ports[0]

    def parameter(instance, name):
        values = modules[instance].findall(f'./PARAMETERS/PARAMETER[@NAME="{name}"]')
        try:
            if len(values) != 1:
                raise ValueError
            return int(values[0].get('VALUE', ''), 0)
        except ValueError:
            fail(f'missing or invalid {instance}/{name}')

    def driver(instance, name):
        target = pin(instance, name)
        if target.get('DIR') != 'I' or not target.get('SIGNAME'):
            fail(f'{instance}/{name} has no input signal')
        candidates = []
        for connection in target.findall('./CONNECTIONS/CONNECTION'):
            source_instance, source_name = connection.get('INSTANCE'), connection.get('PORT')
            source = pin(source_instance, source_name)
            if source.get('DIR') == 'O':
                candidates.append((source_instance, source_name, source))
        if len(candidates) != 1:
            fail(f'{instance}/{name} must have one known output driver')
        source_instance, source_name, source = candidates[0]
        if source.get('SIGNAME') != target.get('SIGNAME') or not any(
                c.get('INSTANCE') == instance and c.get('PORT') == name
                for c in source.findall('./CONNECTIONS/CONNECTION')):
            fail(f'{instance}/{name} has inconsistent driver metadata')
        return target, source_instance, source_name, source

    def constant(source_instance, source_name):
        if modules[source_instance].get('MODTYPE') != 'xlconstant':
            return None
        width = parameter(source_instance, 'CONST_WIDTH')
        value = parameter(source_instance, 'CONST_VAL')
        if source_name != 'dout' or width != 1 or value not in (0, 1):
            fail(f'{source_instance}/{source_name} is not a one-bit constant')
        return value

    def reset_input(instance, name, active_high, *, require_constant=False):
        target, source_instance, source_name, source = driver(instance, name)
        polarity = 'ACTIVE_HIGH' if active_high else 'ACTIVE_LOW'
        if target.get('POLARITY') != polarity:
            fail(f'{instance}/{name} polarity disagrees with its configuration')
        value = constant(source_instance, source_name)
        if value is None:
            if require_constant:
                fail(f'{instance}/{name} needs a known inactive constant')
            if source.get('POLARITY') not in (None, polarity):
                fail(f'{instance}/{name} driver polarity disagrees with its input')
        elif value == int(active_high):
            fail(f'{instance}/{name} is permanently asserted '
                 f'({polarity}, constant {value})')

    # These generators reset the accelerator, DDR and AXI fabric respectively.
    for instance in ('reset_accelerator', 'reset_ddr', 'reset_fabric'):
        if instance not in modules or modules[instance].get('MODTYPE') != 'proc_sys_reset':
            fail(f'missing critical proc_sys_reset {instance}')
        aux_high = parameter(instance, 'C_AUX_RESET_HIGH')
        ext_high = parameter(instance, 'C_EXT_RESET_HIGH')
        if aux_high not in (0, 1) or ext_high not in (0, 1):
            fail(f'{instance} reset polarity is unknown')
        reset_input(instance, 'aux_reset_in', bool(aux_high), require_constant=True)
        reset_input(instance, 'mb_debug_sys_rst', True)
        reset_input(instance, 'ext_reset_in', bool(ext_high))
        _, source_instance, source_name, _ = driver(instance, 'dcm_locked')
        if constant(source_instance, source_name) == 0:
            fail(f'{instance}/dcm_locked is permanently low')
        target, _, _, source = driver(instance, 'slowest_sync_clk')
        if target.get('SIGIS') != 'clk' or source.get('SIGIS') != 'clk':
            fail(f'{instance}/slowest_sync_clk has no known clock driver')

    consumers = (('accelerator', 'S00_ARESETN', 'reset_accelerator'),
                 ('pl_ddr4', 'c0_ddr4_aresetn', 'reset_ddr'),
                 *((name, 'aresetn', 'reset_fabric') for name in (
                     'control', 'pl_memory', 'ps_hp0', 'ps_hp1', 'ps_hp2', 'ps_hp3')))
    for instance, name, expected in consumers:
        target, source_instance, source_name, source = driver(instance, name)
        if ((source_instance, source_name) != (expected, 'peripheral_aresetn')
                or target.get('POLARITY') != 'ACTIVE_LOW'
                or source.get('POLARITY') != 'ACTIVE_LOW'):
            fail(f'{instance}/{name} is not driven by {expected}/peripheral_aresetn')


def sha256_file(path, progress=None):
    digest = hashlib.sha256()
    total = Path(path).stat().st_size if progress is not None else None
    done = 0
    if progress is not None:
        progress(0, total)
    with Path(path).open('rb') as stream:
        for chunk in iter(lambda: stream.read(4 * 1024 * 1024), b''):
            digest.update(chunk)
            if progress is not None:
                done += len(chunk)
                progress(done, total)
    return digest.hexdigest()


def bit_header(path):
    """Read the Xilinx .bit header without importing PYNQ or loading the payload."""
    with Path(path).open('rb') as stream:
        def read(count):
            value = stream.read(count)
            if len(value) != count:
                raise ValueError('Truncated Xilinx bitstream header')
            return value
        def u16():
            return struct.unpack('>H', read(2))[0]
        if read(u16()) != b'\x0f\xf0\x0f\xf0\x0f\xf0\x0f\xf0\0' or u16() != 1:
            raise ValueError('Not a supported Xilinx .bit file')
        result = {}
        for key, name in ((b'a', 'design'), (b'b', 'part'), (b'c', 'date'), (b'd', 'time')):
            if read(1) != key:
                raise ValueError(f'Missing bitstream {name} field')
            result[name] = read(u16()).rstrip(b'\0').decode('ascii')
        if read(1) != b'e':
            raise ValueError('Missing bitstream payload')
        result['payload_bytes'] = struct.unpack('>I', read(4))[0]
        if result['payload_bytes'] <= 0 or stream.tell() + result['payload_bytes'] != Path(path).stat().st_size:
            raise ValueError('Bitstream payload length mismatch')
    if result['part'] != PART:
        raise ValueError(f'Bitstream device mismatch: {result["part"]!r}, expected {PART}')
    return result


def validate_hwh(path, expected_profile=None):
    root = ET.parse(path).getroot()
    info = root.find('SYSTEMINFO')
    if info is None or any(info.get(k) != v for k, v in (
            ('ARCH', 'zynquplus'), ('DEVICE', 'xczu7cg'),
            ('PACKAGE', 'ffvc1156'), ('SPEEDGRADE', '-1'))):
        raise ValueError('HWH device/package/speed grade does not match the ZU7CG board')
    modules = {m.get('INSTANCE'): m for m in root.iter('MODULE')}
    accelerator = modules.get('accelerator')
    if accelerator is None:
        raise ValueError('HWH is missing accelerator')
    profile = next((p for p, m in PROFILE_MODULES.items() if m == accelerator.get('MODTYPE')), None)
    if profile is None or (expected_profile is not None and profile != expected_profile):
        raise ValueError(f'HWH hardware profile mismatch: {accelerator.get("MODTYPE")!r}, expected {expected_profile!r}')
    ps = modules.get('ps')
    if ps is None or ps.get('MODTYPE') != 'zynq_ultra_ps_e':
        raise ValueError('HWH is missing the expected Zynq UltraScale+ PS')

    def require_range(module, master, instance, slave, base, size):
        matches = [r for r in module.iter('MEMRANGE') if
                   r.get('MASTERBUSINTERFACE') == master and r.get('INSTANCE') == instance
                   and r.get('SLAVEBUSINTERFACE') == slave]
        if len(matches) != 1 or (int(matches[0].get('BASEVALUE', '-1'), 0),
                                 int(matches[0].get('HIGHVALUE', '-1'), 0)) != (base, base + size - 1):
            raise ValueError(f'HWH {master}->{instance}/{slave} must map {base:#x}..{base + size - 1:#x}')

    require_range(ps, 'M_AXI_HPM1_FPD', 'accelerator', 'S00_AXIL', CONTROL_BASE, 0x100000000)
    require_range(ps, 'M_AXI_HPM0_FPD', 'pl_ddr4', 'C0_DDR4_S_AXI', PL_BASE, PL_SIZE)
    require_range(accelerator, 'M01_AXI', 'pl_ddr4', 'C0_DDR4_S_AXI', 0, PL_SIZE)
    for index in range(4):
        require_range(accelerator, f'm_axi_hp_0_{index}', 'ps', f'S_AXI_HP{index}_FPD',
                      PS_BASE if profile == 'pynq' else 0, PS_SIZE)
        for channel in ('ar', 'aw'):
            port = accelerator.find(f'./PORTS/PORT[@NAME="m_axi_hp_0_{index}_{channel}addr"]')
            if port is None or (port.get('LEFT'), port.get('RIGHT')) != ('39' if profile == 'pynq' else '31', '0'):
                raise ValueError('HWH PS AXI address width does not match the hardware profile')
    clock = accelerator.find('./PORTS/PORT[@NAME="S00_ACLK"]')
    ps_clock = ps.find('./PORTS/PORT[@NAME="pl_clk0"]')
    try:
        clock_hz = int(clock.get('CLKFREQUENCY', '')) if clock is not None else None
    except ValueError as exc:
        raise ValueError('HWH accelerator/S00_ACLK has an invalid clock frequency') from exc
    if clock_hz not in (187500000, 250000000):
        raise ValueError('HWH accelerator/S00_ACLK clock must be 187.5 or 250 MHz')
    if ps_clock is None or ps_clock.get('CLKFREQUENCY') != str(clock_hz):
        raise ValueError('HWH ps/pl_clk0 frequency does not match accelerator/S00_ACLK')
    if not clock.get('SIGNAME') or clock.get('SIGNAME') != ps_clock.get('SIGNAME'):
        raise ValueError('HWH accelerator/S00_ACLK and ps/pl_clk0 must share the same clock signal')
    for name in ('M01_AXI', 'S00_AXIL', *(f'm_axi_hp_0_{index}' for index in range(4))):
        frequencies = accelerator.findall(
            f'./BUSINTERFACES/BUSINTERFACE[@NAME="{name}"]/PARAMETER[@NAME="FREQ_HZ"]')
        if len(frequencies) != 1 or frequencies[0].get('VALUE') != str(clock_hz):
            raise ValueError(f'HWH accelerator/{name} FREQ_HZ must match S00_ACLK ({clock_hz} Hz)')
    _validate_reset_network(modules)
    return {'profile': profile, 'accelerator': accelerator.get('MODTYPE'),
            'control_base': CONTROL_BASE, 'pl_base': PL_BASE, 'pl_size': PL_SIZE,
            'ps_ddr_base': PS_BASE if profile == 'pynq' else 0, 'ps_ddr_size': PS_SIZE,
            'clock_hz': clock_hz, 'vivado_version': root.get('VIVADOVERSION')}


def validate_overlay(bitfile, expected_profile=None):
    bitfile = Path(bitfile)
    hwh = bitfile.with_suffix('.hwh')
    manifest_path = bitfile.parent / 'manifest.json'
    for path in (bitfile, hwh, manifest_path):
        if not path.is_file():
            raise FileNotFoundError(f'{path} is missing; re-export the matching build on the host with tools/pynq_ctx8192_250m/export_ctx8192_250_checkpoint_overlay.py')
    manifest = json.loads(manifest_path.read_text())
    profile = manifest.get('profile')
    if (manifest.get('schema_version') != 1 or profile not in PROFILE_MODULES
            or manifest.get('part') != PART
            or (expected_profile is not None and profile != expected_profile)):
        raise ValueError('Overlay manifest schema/profile/device mismatch')
    if manifest.get('inference_supported') is not (profile == 'pynq'):
        raise ValueError('Overlay manifest inference mode does not match its hardware profile')
    if any(manifest.get(key) != expected for key, expected in (
            ('project_name', PROJECT_NAME), ('context_tokens', CONTEXT_TOKENS),
            ('layout_id', LAYOUT_ID))):
        raise ValueError('Overlay context/layout mismatch: this runtime requires '
                         'llama32_3b_ctx8192_250mhz (8192 tokens, layout 0x3342384b)')
    try:
        for kind, path in (('bit', bitfile), ('hwh', hwh)):
            record = manifest['files'][kind]
            if (record['name'] != path.name or record['bytes'] != path.stat().st_size
                    or sha256_file(path) != record['sha256']):
                raise ValueError(f'{kind} checksum/name/size differs from the exported overlay manifest')
    except (KeyError, TypeError) as exc:
        raise ValueError('Malformed overlay file records') from exc
    header = bit_header(bitfile)
    hardware = validate_hwh(hwh, profile)
    if manifest.get('bit_header') != header or manifest.get('hardware') != hardware:
        raise ValueError('Overlay metadata differs from its bitstream/HWH')
    return manifest
