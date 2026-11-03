#!/usr/bin/env python3
"""Compatibility entry point; the diagnostic implementation is in test/."""
from test.board_repeat_terminal import main


if __name__ == '__main__':
    raise SystemExit(main())
