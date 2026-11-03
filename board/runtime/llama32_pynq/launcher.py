"""Select the terminal or browser entry point without loading board hardware."""
import argparse
import sys


def main(argv=None):
    argv = list(sys.argv[1:] if argv is None else argv)
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--mode', choices=('prompt', 'chat', 'ui'), default='chat')
    args, remaining = parser.parse_known_args(argv)
    if args.mode == 'ui':
        from ui.server import main as run_ui
        return run_ui(remaining)
    if '-h' in argv or '--help' in argv:
        print('浏览器界面：bash run.sh --mode ui [--host 0.0.0.0] [--port 8088]\n')
    from .interactive import main as run_terminal
    return run_terminal(argv)


if __name__ == '__main__':
    raise SystemExit(main())
