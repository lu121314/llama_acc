#!/usr/bin/env python3
"""Web interface for one PYNQ accelerator session."""
import argparse
import asyncio
from contextlib import contextmanager, redirect_stderr
from copy import deepcopy
from datetime import datetime
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from ipaddress import ip_address
import json
from pathlib import Path
import subprocess
import sys
from threading import Lock, RLock
import time

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from llama32_pynq import BoardConfig
from llama32_pynq.board import PynqSession
from llama32_pynq.config import IMAGE_BYTES
from llama32_pynq.control import Accelerator
from llama32_pynq.generation import generate as generate_response
from llama32_pynq.tokenizer import Tokenizer

def available_hardware():
    """List delivered and pending context/clock combinations in this project."""
    versions = {}
    for path in sorted((ROOT / 'config').glob('pynq*.json')):
        config = json.loads(path.read_text(encoding='utf-8'))
        context = int(str(config.get('context_tokens', Accelerator.CONTEXT)), 0)
        image_bytes = int(str(config.get('image_bytes', IMAGE_BYTES)), 0)
        bitfile = ROOT / config['bitfile']
        manifest = bitfile.with_name('manifest.json')
        data = json.loads(manifest.read_text(encoding='utf-8')) if manifest.is_file() else {}
        raw_clock = data.get('hardware', {}).get('clock_hz', data.get('clock_hz'))
        actual_clock = int(raw_clock) if raw_clock is not None else None
        preset_clock = config.get('clock_hz')
        clock = actual_clock if actual_clock is not None else (
            int(str(preset_clock), 0) if preset_clock is not None else None)
        missing = [str(asset.relative_to(ROOT)) if asset.is_relative_to(ROOT) else str(asset) for asset in
                   (bitfile, bitfile.with_suffix('.hwh'), manifest) if not asset.is_file()]
        if actual_clock is None:
            missing.append('manifest.hardware.clock_hz')
        identifier = config.get('variant_id')
        if not identifier:
            legacy = {187500000: '187m5', 250000000: '250m'}.get(clock)
            identifier = legacy if context == Accelerator.CONTEXT and legacy not in versions else path.stem
            identifier = identifier or path.stem
        if identifier in versions:
            raise ValueError(f'重复的硬件 variant_id：{identifier}；请为每个配置使用不同标识')
        label = f'{context} context · ' + (f'{clock / 1e6:g} MHz' if clock is not None else '时钟未交付')
        if missing:
            label += '（预设，硬件尚未交付）' if actual_clock is None and clock is not None else '（硬件尚未交付）'
        versions[identifier] = {'label': label, 'clock_hz': clock, 'config': path.name,
                                'context_tokens': context, 'image_bytes': image_bytes,
                                'clock_source': 'manifest' if actual_clock is not None else
                                                'config' if clock is not None else 'unknown',
                                'available': not missing, 'missing': missing}
    return versions


def clear_accelerator(session):
    from llama32_pynq.pl_lifecycle import clear_accelerator as clear
    return clear(session)


class OperationBusy(RuntimeError):
    pass


class InferenceApp:
    def __init__(self, demo=False):
        self.demo = demo
        self.session = None
        self.tokenizer = None
        self.history = []
        self.mode = 'chat'
        self.system_prompt = ''
        self.hardware = available_hardware()
        self.operation_lock = Lock()
        self.state_lock = RLock()
        self.message_id = 0
        selected = next(iter(self.hardware))
        self.state = {
            'revision': 0, 'ready': False, 'bit_loaded': False, 'busy': False,
            'phase': 'unloaded', 'message': '请先初始化模型', 'clock_hz': None,
            'demo': demo, 'history_turns': 0, 'last_result': None, 'progress': None,
            'mode': self.mode, 'system_prompt': self.system_prompt, 'draft': '',
            'max_new_tokens': 64,
            'context_limit': self.hardware[selected].get('context_tokens', Accelerator.CONTEXT),
            'conversation': [], 'logs': [],
            'hardware_version': selected,
            'hardware_versions': [{'id': key, 'label': value['label'], 'clock_hz': value['clock_hz'],
                                   'context_tokens': value.get('context_tokens', Accelerator.CONTEXT),
                                   'clock_source': value.get('clock_source', 'manifest'),
                                   'available': value['available'], 'missing': value['missing']}
                                  for key, value in self.hardware.items()],
        }

    def snapshot(self):
        with self.state_lock:
            return deepcopy(self.state)

    def _update(self, **changes):
        with self.state_lock:
            self.state.update(changes)
            self.state['revision'] += 1

    def _log(self, message):
        with self.state_lock:
            self.state['logs'].append({'sequence': len(self.state['logs']) + 1,
                                      'time': datetime.now().astimezone().isoformat(),
                                      'message': message})
            self.state['revision'] += 1

    def emit(self, consumer, event):
        if event['event'] in ('step', 'error', 'ready', 'reset', 'cleared') and event.get('message'):
            self._log(event['message'])
        consumer(event)

    @contextmanager
    def _operation(self, name, emit=None):
        if not self.operation_lock.acquire(blocking=False):
            raise OperationBusy('加速器正在执行操作，请等待完成')
        if name != 'settings':
            self._update(busy=True)
        try:
            if emit is None:
                yield
            else:
                # Acquire the hardware operation lock before redirecting this
                # process-wide stream. A second browser never nests redirects.
                with redirect_stderr(StreamLog(lambda event: self.emit(emit, event), sys.stderr)):
                    yield
        except Exception as error:
            self.operation_failed(name, error)
            raise
        finally:
            if name != 'settings':
                self._update(busy=False)
            self.operation_lock.release()

    def _validate_settings(self, request):
        current = self.snapshot()
        mode = request.get('mode', current['mode'])
        system = request.get('system_prompt', current['system_prompt'])
        count = request.get('max_new_tokens', current['max_new_tokens'])
        draft = request.get('draft', current['draft'])
        version = request.get('hardware_version', current['hardware_version'])
        if mode not in ('prompt', 'chat') or not isinstance(system, str):
            raise ValueError('mode 必须为 prompt 或 chat，system_prompt 必须为文本')
        if not isinstance(draft, str):
            raise ValueError('draft 必须为文本')
        if version not in self.hardware:
            raise ValueError('请选择工程包含的硬件版本')
        context = self.hardware[version].get('context_tokens', Accelerator.CONTEXT)
        if 'max_new_tokens' not in request:
            count = min(count, context)
        if isinstance(count, bool) or not isinstance(count, int) or not 1 <= count <= context:
            raise ValueError(f'最大输出必须为 1 到 {context} 之间的整数')
        if (current['bit_loaded'] is not False or current['ready']) and version != current['hardware_version']:
            raise ValueError('请先清除 bit，再更换硬件版本')
        return dict(mode=mode, system_prompt=system, max_new_tokens=count, draft=draft,
                    hardware_version=version, context_limit=context)

    def settings(self, request, emit):
        # Settings share the operation lock so a second client cannot change
        # the prompt or hardware selection half way through initialization.
        with self._operation('settings'):
            changes = self._validate_settings(request)
            if changes['mode'] != self.mode or changes['system_prompt'] != self.system_prompt:
                self.history = []
                changes.update(history_turns=0, conversation=[], last_result=None)
            self.mode, self.system_prompt = changes['mode'], changes['system_prompt']
            self._update(**changes)
            emit({'event': 'settings', 'revision': self.snapshot()['revision']})
            return {'settings': changes}

    def load(self, emit, hardware_version=None):
        with self._operation('load', emit):
            return self._load(emit, hardware_version)

    def _load(self, emit, hardware_version):
        current = self.snapshot()
        version = hardware_version or current['hardware_version']
        settings = self._validate_settings({'hardware_version': version})
        if current['ready']:
            self.emit(emit, {'event': 'ready', 'message': '模型已经就绪，无需重复上传权重',
                             'clock_hz': current['clock_hz'], 'demo': self.demo,
                             'hardware_version': version})
            return {'already_loaded': True, 'demo': self.demo}
        hardware = self.hardware[version]
        if not self.demo and not hardware['available']:
            raise FileNotFoundError('硬件尚未交付，缺少：' + '、'.join(hardware['missing']))
        self._update(ready=False, phase='loading', message='正在初始化和上传权重',
                     hardware_version=settings['hardware_version'],
                     context_limit=settings['context_limit'],
                     max_new_tokens=settings['max_new_tokens'], progress=None)
        self.emit(emit, {'event': 'step', 'message': '模拟模式：不访问 FPGA、DDR 或模型文件' if self.demo
                        else '初始化 Overlay，并检查控制寄存器和启动内存预留'})
        started = time.monotonic()
        completed = {'ps': 0, 'pl': 0}
        image_bytes = hardware.get('image_bytes', IMAGE_BYTES)

        def progress(bank, done, total):
            completed[bank] = done
            elapsed = time.monotonic() - started
            uploaded = sum(completed.values())
            update = {'bank': bank, 'done': uploaded, 'total': image_bytes * 2,
                      'percent': 100 * uploaded / (image_bytes * 2), 'elapsed_s': elapsed,
                      'mib_per_s': uploaded / 2**20 / elapsed if elapsed else 0,
                      'bank_done': done, 'bank_total': total}
            self._update(progress=update, message=f'正在上传 {bank.upper()} 权重：{update["percent"]:.1f}%')
            if done == total:
                self._log(f'{bank.upper()} 权重上传完成；累计 {update["percent"]:.1f}%，'
                          f'{update["mib_per_s"]:.2f} MiB/s')
            emit({'event': 'progress', **update})

        if self.demo:
            connected = {'demo': True, 'hardware': {'clock_hz': hardware['clock_hz']}}
            self._update(bit_loaded=True, clock_hz=hardware['clock_hz'])
            progress('ps', 0, image_bytes)
            for bank in ('ps', 'pl'):
                for part in range(1, 5):
                    time.sleep(0.02)
                    progress(bank, image_bytes * part // 4, image_bytes)
            loaded = {'demo': True}
        else:
            config = BoardConfig.load(ROOT / 'config' / hardware['config'])
            self.session = PynqSession(config)
            connected = self.session.connect()
            self._update(bit_loaded=True, clock_hz=connected['hardware']['clock_hz'])
            self.emit(emit, {'event': 'step', 'message': '加载本地 tokenizer'})
            self.tokenizer = Tokenizer.from_file(config.tokenizer)
            self.emit(emit, {'event': 'step', 'message': '上传双 DDR 权重；不计算权重哈希，不进行 DDR 回读'})
            started = time.monotonic()
            progress('ps', 0, image_bytes)
            loaded = self.session.load_models(progress=progress, verify=False, verbose=False)
        self.reset_history()
        message = '模拟模型已就绪：界面数据为演示值' if self.demo else '模型已加载，可以开始对话'
        self._update(ready=True, phase='ready', message=message, clock_hz=connected['hardware']['clock_hz'])
        self.emit(emit, {'event': 'ready', 'message': message, 'clock_hz': connected['hardware']['clock_hz'],
                         'demo': self.demo, 'hardware_version': version})
        return {'connect': connected, 'load': loaded, 'demo': self.demo,
                'weight_verification': False, 'hardware_version': version}

    def reset_history(self):
        """Clear host chat; the next generation performs its usual soft reset."""
        self.history = []
        self._update(history_turns=0, last_result=None, conversation=[], draft='')

    def reset(self, emit, request=None):
        with self._operation('reset', emit):
            changes = self._validate_settings({} if request is None else request)
            self.mode, self.system_prompt = changes['mode'], changes['system_prompt']
            self.reset_history()
            changes['draft'] = ''
            if self.snapshot()['ready']:
                changes.update(phase='ready', message='对话已清空，模型仍然就绪')
            self._update(**changes)
            self.emit(emit, {'event': 'reset', 'message': '对话已清空', 'ready': self.snapshot()['ready'],
                             'mode': self.mode, 'system_prompt': self.system_prompt})
            return {'history_turns': 0, 'mode': self.mode, 'system_prompt': self.system_prompt}

    def clear(self, emit):
        with self._operation('clear', emit):
            if not self.snapshot()['bit_loaded']:
                raise ValueError('本服务尚未加载 bit，请先初始化模型')
            self._update(phase='clearing', message='正在移除加速器并加载空闲 PL 配置')
            self.emit(emit, {'event': 'step', 'message': '模拟移除加速器并加载空闲配置' if self.demo else
                            '停止使用加速器，下载同器件空闲 bit；DDR 权重不会被擦除'})
            result = {'demo': True} if self.demo else clear_accelerator(self.session)
            self.session = self.tokenizer = None
            self.reset_history()
            self._update(ready=False, bit_loaded=False, phase='unloaded', clock_hz=None,
                         progress=None, message='加速器已移除，PL 已加载空闲配置；请重新初始化并上传权重')
            self.emit(emit, {'event': 'cleared', 'message': '加速器已移除，PL 已加载空闲配置；可重新演示启动和权重上传',
                             'demo': self.demo})
            return {'clear': result, 'demo': self.demo}

    def generate(self, request, emit):
        with self._operation('generate', emit):
            return self._generate(request, emit)

    def _generate(self, request, emit):
        current = self.snapshot()
        if not current['ready']:
            raise RuntimeError('请先初始化模型')
        prompt = request.get('prompt', current['draft'])
        settings = self._validate_settings(request)
        mode, system, count = (settings[key] for key in ('mode', 'system_prompt', 'max_new_tokens'))
        if not isinstance(prompt, str) or not prompt.strip():
            raise ValueError('请输入提示词')
        history = self.history if mode == 'chat' and mode == self.mode and system == self.system_prompt else []
        messages = ([{'role': 'system', 'content': system}] if system else [])
        messages += [dict(message) for message in history]
        messages.append({'role': 'user', 'content': prompt})
        with self.state_lock:
            self.message_id += 1
            self.state['conversation'].append({'id': self.message_id, 'role': 'user', 'text': prompt})
            self.message_id += 1
            self.state['conversation'].append({'id': self.message_id, 'role': 'assistant', 'text': ''})
            self._update(phase='generating', message='正在处理输入，等待首 token', draft='', last_result=None)
        self._log(f'开始 {mode} 推理；最大输出 {count} token，已有 {len(history) // 2} 轮历史')
        emit({'event': 'started', 'mode': mode, 'max_new_tokens': count,
              'history_turns': len(history) // 2, 'demo': self.demo})
        arrivals = []

        def received(token, text, elapsed_s):
            arrivals.append(elapsed_s)
            amount = len(arrivals)
            rate = ((amount - 1) / (elapsed_s - arrivals[0])
                    if amount > 1 and elapsed_s > arrivals[0] else None)
            live = {'text': text, 'input_tokens': None, 'output_tokens': amount,
                    'elapsed_s': elapsed_s, 'time_to_first_token_s': arrivals[0],
                    'decode_tokens_per_s': rate,
                    'overall_tokens_per_s': amount / elapsed_s if elapsed_s else None,
                    'stop_reason': None}
            with self.state_lock:
                self.state['conversation'][-1]['text'] = text
                self._update(last_result=live, message=f'正在生成回答：{amount} token')
            emit({'event': 'token', 'token_id': token, 'text': text, 'elapsed_s': elapsed_s})

        try:
            result = (self._demo_generate(messages, count, received) if self.demo else
                      generate_response(self.session, self.tokenizer, messages, count, on_token=received))
        except Exception as error:
            with self.state_lock:
                self.state['conversation'][-1]['error'] = str(error)
                self.state['revision'] += 1
            self._log(f'本次推理失败；未加入 Chat 历史：{error}')
            raise
        self.mode, self.system_prompt = mode, system
        self.history = (history + [{'role': 'user', 'content': prompt},
                                   {'role': 'assistant', 'content': result['text']}]) if mode == 'chat' else []
        with self.state_lock:
            self.state['conversation'][-1].update(text=result['text'], metrics=deepcopy(result))
            self._update(phase='ready', message='回答已完成，可以继续输入',
                         history_turns=len(self.history) // 2, last_result=deepcopy(result),
                         mode=mode, system_prompt=system, max_new_tokens=count)
        rate, first = result['decode_tokens_per_s'], result['time_to_first_token_s']
        decode = f'{rate:.2f} token/s' if rate is not None else 'N/A'
        ttft = f'{first:.3f}s' if first is not None else 'N/A'
        summary = (f'[UI{" DEMO" if self.demo else ""}] 完成：输入={result["input_tokens"]} token，'
                   f'输出={result["output_tokens"]} token，耗时={result["elapsed_s"]:.3f}s，'
                   f'首 token={ttft}，解码={decode}，停止原因={result["stop_reason"]}')
        print(summary, file=sys.stderr, flush=True)
        emit({'event': 'result', **result, 'mode': mode,
              'history_turns': len(self.history) // 2, 'demo': self.demo})
        return {'prompt': prompt, 'mode': mode, 'max_new_tokens': count,
                'system_prompt': system, 'inference': result, 'demo': self.demo}

    def _demo_generate(self, messages, count, on_token):
        input_count = sum(max(1, len(message['content']) // 3) + 4 for message in messages)
        Accelerator.validate_generation([128000] * input_count, count,
                                        context_tokens=self.snapshot()['context_limit'])
        prompt = messages[-1]['content']
        text = ('这是界面模拟回答，用于预览多语言显示、流式输出和性能面板。实际回答需要在开发板上加载模型。'
                if any(ord(character) > 127 for character in prompt) else
                'This is a simulated response for the UI preview. Load the model on the board for real inference.')
        chunks = [text[offset:offset + 3] for offset in range(0, len(text), 3)]
        started = time.monotonic()
        arrivals, tokens, answer = [], [], ''
        for index, chunk in enumerate(chunks[:count]):
            time.sleep(0.015)
            arrivals.append(time.monotonic())
            tokens.append(1000 + index)
            answer += chunk
            on_token(tokens[-1], answer, arrivals[-1] - started)
        elapsed = time.monotonic() - started
        rate = ((len(tokens) - 1) / (arrivals[-1] - arrivals[0])) if len(tokens) > 1 else None
        return {'text': answer, 'tokens': tokens, 'input_tokens': input_count,
                'output_tokens': len(tokens), 'elapsed_s': elapsed,
                'time_to_first_token_s': arrivals[0] - started,
                'decode_tokens_per_s': rate, 'overall_tokens_per_s': len(tokens) / elapsed,
                'stop_reason': 'eos' if len(tokens) == len(chunks) else 'max_new_tokens'}

    def operation_failed(self, operation, error):
        if isinstance(error, OperationBusy) or operation.rstrip('/').endswith('settings'):
            return
        if operation.rstrip('/').endswith('clear'):
            self._update(ready=False, bit_loaded=None, phase='error',
                         message=f'bit 清除未确认：{error}')
            return
        accelerator = getattr(self.session, 'accelerator', None)
        tainted = self.session is not None and (
            getattr(accelerator, 'tainted', False) or getattr(self.session, '_invalid_reason', None))
        current = self.snapshot()
        bit_loaded = current['bit_loaded'] or getattr(self.session, 'overlay', None) is not None
        invalid = tainted or not current['ready']
        self._update(ready=not invalid, bit_loaded=bool(bit_loaded),
                     phase='error' if invalid else 'ready', message=str(error))


class StreamLog:
    def __init__(self, emit, terminal):
        self.emit, self.terminal, self.buffer = emit, terminal, ''

    def write(self, text):
        self.terminal.write(text)
        self.terminal.flush()
        self.buffer += text
        while '\n' in self.buffer:
            line, self.buffer = self.buffer.split('\n', 1)
            if line:
                self.emit({'event': 'step', 'message': line})
        return len(text)

    def flush(self):
        self.terminal.flush()


class Handler(BaseHTTPRequestHandler):
    def log_message(self, format, *args):
        # GET polling is deliberately quiet; hardware steps are shared UI logs.
        if not self.path.startswith('/api/status'):
            print(f'{self.address_string()} {format % args}', file=sys.__stderr__, flush=True)

    def do_GET(self):
        if self.path.split('?', 1)[0] == '/api/status':
            payload = json.dumps(self.server.app.snapshot(), ensure_ascii=False).encode()
            content_type = 'application/json; charset=utf-8'
        elif self.path in ('/', '/index.html'):
            payload = Path(__file__).with_name('index.html').read_bytes()
            content_type = 'text/html; charset=utf-8'
        else:
            self.send_error(404)
            return
        self.send_response(200)
        self.send_header('Content-Type', content_type)
        self.send_header('Content-Length', str(len(payload)))
        self.send_header('Cache-Control', 'no-store')
        self.end_headers()
        self.wfile.write(payload)

    def do_POST(self):
        routes = ('/api/load', '/api/generate', '/api/reset', '/api/settings', '/api/clear')
        if self.path not in routes:
            self.send_error(404)
            return
        # Operation methods own the nonblocking lock; the stream includes an
        # error event when another browser already owns the accelerator.
        self.send_response(200)
        self.send_header('Content-Type', 'application/x-ndjson; charset=utf-8')
        self.send_header('Cache-Control', 'no-store')
        self.send_header('Connection', 'close')
        self.end_headers()
        connected = True

        def send(event):
            nonlocal connected
            if connected:
                try:
                    self.wfile.write((json.dumps(event, ensure_ascii=False) + '\n').encode())
                    self.wfile.flush()
                except (BrokenPipeError, ConnectionResetError):
                    # Closing the browser cannot interrupt a hardware write.
                    connected = False

        app = self.server.app
        record = {'started_at': datetime.now().astimezone().isoformat(), 'operation': self.path,
                  'demo': app.demo}
        try:
            request = json.loads(self.rfile.read(int(self.headers.get('Content-Length', '0'))) or b'{}')
            if not isinstance(request, dict):
                raise ValueError('请求必须为 JSON 对象')
            if self.path == '/api/load':
                record.update(app.load(send, request.get('hardware_version')))
            elif self.path == '/api/reset':
                record.update(app.reset(send, request))
            elif self.path == '/api/clear':
                record.update(app.clear(send))
            elif self.path == '/api/settings':
                record.update(app.settings(request, send))
            else:
                record.update(app.generate(request, send))
            record['status'] = {'/api/load': 'MODEL_READY', '/api/reset': 'HISTORY_RESET',
                                '/api/generate': 'INFERENCE_RETURNED', '/api/clear': 'BIT_CLEARED',
                                '/api/settings': 'SETTINGS_UPDATED'}[self.path]
        except Exception as error:
            if not isinstance(error, OperationBusy) and not app.snapshot()['busy']:
                app.operation_failed(self.path, error)
            message = str(error)
            record.update(status='FAILED', error={'type': type(error).__name__, 'message': message})
            event = {'event': 'error', 'message': message, 'ready': app.snapshot()['ready']}
            if isinstance(error, OperationBusy):
                send(event)
            else:
                app.emit(send, event)
            print(f'UI operation failed: {message}', file=sys.__stderr__, flush=True)
        finally:
            # Draft synchronization does not produce thousands of report files.
            if self.path != '/api/settings':
                folder = ROOT / 'logs/ui'
                folder.mkdir(parents=True, exist_ok=True)
                output = folder / (datetime.now().strftime('%Y%m%d_%H%M%S_%f') + '.json')
                output.write_text(json.dumps(record, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
            self.close_connection = True


def browser_urls(host, port):
    """Return browser addresses for the bound interface, without network requests."""
    addresses = [host]
    if host == '0.0.0.0':
        try:
            result = subprocess.run(['hostname', '-I'], capture_output=True, text=True, check=True)
            addresses = []
            for address in result.stdout.split():
                parsed = ip_address(address)
                if (parsed.version == 4 and not parsed.is_loopback and not parsed.is_link_local
                        and address not in addresses):
                    addresses.append(address)
        except (OSError, subprocess.CalledProcessError):
            addresses = []
        if not addresses:
            addresses = ['127.0.0.1']
    return [f'http://{address}:{port}/' for address in addresses]


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--host', default='0.0.0.0')
    parser.add_argument('--port', type=int, default=8088)
    parser.add_argument('--demo', action='store_true', help='界面模拟：不访问 PYNQ、DDR 或模型文件')
    args = parser.parse_args(argv)
    server = ThreadingHTTPServer((args.host, args.port), Handler)
    pynq_loop = None
    try:
        if not args.demo:
            # PYNQ caches its first Device, including the XRT event loop.
            # Probe once on the long-lived main thread before HTTP workers.
            pynq_loop = asyncio.new_event_loop()
            asyncio.set_event_loop(pynq_loop)
            from pynq import Device
            print('正在初始化 PYNQ 设备（尚未下载 bit 或上传权重）…', flush=True)
            Device.active_device
            print('PYNQ 设备已就绪。', flush=True)
        server.app = InferenceApp(demo=args.demo)
        host, port = server.server_address[:2]
        urls = browser_urls(host, port)
        print('网页 UI 已启动；点击下方网址打开，按 Ctrl+C 停止服务：', flush=True)
        for url in urls:
            print(f'  {url}', flush=True)
        if host == '0.0.0.0' and urls == [f'http://127.0.0.1:{port}/']:
            print('未检测到局域网 IPv4；远程访问时请将 127.0.0.1 替换为板卡 IP。', flush=True)
        print('模拟模式：显示演示数据，不访问硬件。' if args.demo else
              '网页控制加速器；初始化上传一次权重，清除 bit 后可重新演示。', flush=True)
        server.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        server.server_close()
        if pynq_loop is not None:
            pynq_loop.close()
            asyncio.set_event_loop(None)


if __name__ == '__main__':
    main()
