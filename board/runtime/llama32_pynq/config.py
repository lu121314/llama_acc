"""Memory contracts for the original diagnostic and relocated PYNQ images."""
from dataclasses import dataclass
import json
import math
from pathlib import Path

PS_BASE = 0x800000000
PS_SIZE = 0x80000000
PS_LOGICAL_BASE = 0x36000
PL_BASE = 0x400000000
PL_SIZE = 0x100000000
CONTROL_BASE = 0x500000000
IMAGE_BYTES = 0x7AFDE000
PROJECT_NAME = 'llama32_3b_ctx8192_250mhz'
CONTEXT_TOKENS = 8192
LAYOUT_ID = 0x3342384B
PART = 'xczu7cg-ffvc1156-1-e'
BAREMETAL_INFERENCE_ERROR = (
    'This DataPath_xN bitstream is diagnostic-only under Linux: its PS model '
    'starts at physical 0x36000 and would overlap Linux memory. Model loading '
    'and inference are disabled. A high-DDR address-relocation hardware build '
    'and a boot-time no-map reservation are required for PYNQ inference; '
    'changing board.json cannot relocate the compiled hardware.'
)


@dataclass(frozen=True)
class BoardConfig:
    root: Path
    bitfile: Path
    model_ps: Path
    model_pl: Path
    tokenizer: Path
    timeout_s: float = 60.0
    poll_interval_s: float = 0.001
    chunk_bytes: int = 4 * 1024 * 1024
    profile: str = 'baremetal'

    @property
    def context_tokens(self):
        return CONTEXT_TOKENS

    @property
    def image_bytes(self):
        return IMAGE_BYTES

    @property
    def layout_id(self):
        return LAYOUT_ID

    @property
    def model_manifest(self):
        return self.model_ps.parent / 'model_manifest.json'

    @property
    def inference_supported(self):
        return self.profile == 'pynq'

    def require_inference(self):
        if not self.inference_supported:
            raise RuntimeError(BAREMETAL_INFERENCE_ERROR)

    @classmethod
    def load(cls, path):
        path = Path(path).resolve()
        data = json.loads(path.read_text())
        profile = data.get('profile')
        if profile not in ('baremetal', 'pynq'):
            raise ValueError(f'Unsupported hardware profile: {profile!r}')
        required = {
            'part': PART,
            'control_base': CONTROL_BASE,
            'ps_base': PS_BASE if profile == 'pynq' else PS_LOGICAL_BASE,
            'ps_size': PS_SIZE if profile == 'pynq' else PS_SIZE - PS_LOGICAL_BASE,
            'ps_logical_base': PS_LOGICAL_BASE,
            'pl_base': PL_BASE, 'pl_size': PL_SIZE, 'image_bytes': IMAGE_BYTES,
        }
        for key, value in required.items():
            actual = data.get(key)
            if isinstance(value, int) and isinstance(actual, str):
                actual = int(actual, 0)
            if isinstance(actual, bool) or actual != value:
                raise ValueError(f'{key}: expected {value!r}, got {actual!r}; rebuild hardware to change the memory contract')
        root = path.parent.parent
        def local(key):
            return (root / data[key]).resolve()
        obj = cls(root, local('bitfile'), local('model_ps'), local('model_pl'),
                  local('tokenizer'), float(data.get('timeout_s', 60)),
                  float(data.get('poll_interval_s', 0.001)),
                  int(data.get('chunk_bytes', 4 * 1024 * 1024)), profile)
        if (not math.isfinite(obj.timeout_s) or not math.isfinite(obj.poll_interval_s)
                or obj.timeout_s <= 0 or not 0 < obj.poll_interval_s <= obj.timeout_s):
            raise ValueError('Invalid timeout/poll interval')
        if obj.chunk_bytes <= 0 or obj.chunk_bytes % 4096:
            raise ValueError('chunk_bytes must be a positive multiple of 4096')
        return obj
