"""Replace this session's idle accelerator with the independent PL idle image."""
import hashlib
import json
from pathlib import Path

from .config import PART
from .overlay import bit_header


def clear_accelerator(session):
    """Remove the accelerator by full reconfiguration, leaving Linux/PS running.

    This loads an actual idle image; it does not claim PL.reset() erases fabric.
    Call only from the serialized UI hardware operation, after inference finishes.
    """
    if session is None or session.overlay is None:
        raise RuntimeError('请先在本服务初始化加速器，再清除；不操作其他进程的未知硬件。')
    session._idle()
    folder = Path(__file__).resolve().parents[1] / 'hw/idle'
    manifest = json.loads((folder / 'manifest.json').read_text(encoding='utf-8'))
    bitfile = folder / 'pl_idle.bit'
    header = bit_header(bitfile)
    if manifest['part'] != PART or header['part'] != PART:
        raise ValueError('空闲配置器件与当前 ZU7CG 不匹配')
    with bitfile.open('rb') as stream:
        digest = hashlib.file_digest(stream, 'sha256').hexdigest()
    if digest != manifest['sha256']:
        raise ValueError('空闲配置文件与 manifest 不匹配')
    from pynq import Bitstream
    idle = Bitstream(str(bitfile), device=session.overlay.device)
    # Even a failed reconfiguration must never leave old MMIO usable in software.
    session._invalidate('加速器已移除或正在重新配置；请创建新会话并重新上传权重。')
    idle.download()
    return {'method': 'full_reconfiguration_to_idle', 'bitfile': str(bitfile),
            'sha256': digest, 'accelerator_removed': True, 'fabric_unconfigured': False,
            'weights_erased': False, 'reload_required': True}
