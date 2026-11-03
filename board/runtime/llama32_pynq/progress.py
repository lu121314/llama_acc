"""Timestamped progress for source hashing and verified DDR transfers."""
from datetime import datetime
import sys
import time


def log(message):
    timestamp = datetime.now().astimezone().isoformat(timespec='seconds')
    print(f'[{timestamp}] {message}', file=sys.stderr, flush=True)


class ByteProgress:
    def __init__(self, label):
        self.label = label
        self.started = time.monotonic()
        self.last_print = self.started
        self.first_chunk = True

    def __call__(self, done, total):
        now = time.monotonic()
        if done == 0 or done == total or self.first_chunk or now - self.last_print >= 1:
            elapsed = now - self.started
            percent = 100 * done / total if total else 100
            rate = done / 2**20 / elapsed if elapsed else 0
            log(f'{self.label}: {done / 2**20:.1f}/{total / 2**20:.1f} MiB '
                f'({percent:.1f}%), elapsed={elapsed:.1f}s, {rate:.2f} MiB/s')
            self.last_print = now
            if done:
                self.first_chunk = False
