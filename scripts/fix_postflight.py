#!/usr/bin/env python3
"""Rewrite deprecated `postflight do` quarantine hooks (as emitted by GoReleaser) to `postflight_steps`."""
import pathlib
import re
import sys

PATTERN = re.compile(r'^  postflight do\n.*?\n  end\n', re.S | re.M)
BIN = re.compile(r'staged_path\}/([\w.-]+)')

for path in map(pathlib.Path, sys.argv[1:]):
    text = path.read_text()
    new = text

    def repl(m):
        b = BIN.search(m.group(0))
        if not b:
            return m.group(0)
        return (
            '  postflight_steps do\n    on_macos do\n'
            f'      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{b.group(1)}"], chdir: "."\n'
            '    end\n  end\n'
        )

    new = PATTERN.sub(repl, text)
    if new != text:
        path.write_text(new)
        print(f"rewrote {path}")
