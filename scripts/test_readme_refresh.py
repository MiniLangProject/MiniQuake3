#!/usr/bin/env python3
"""Check README links, authentic frame metadata and retained startup fixes.

Asset-free and cross-platform. Run from any directory after the gallery and
README have been committed: python scripts/test_readme_refresh.py
"""
from __future__ import annotations
import hashlib
import json
from pathlib import Path
import re
import struct

ROOT = Path(__file__).resolve().parents[1]


def check(root: Path) -> None:
    readme = (root / 'README.md').read_text(encoding='utf-8')
    if readme.count('```') % 2:
        raise AssertionError('Unclosed Markdown code fence')
    targets = re.findall(r'\]\(([^)]+)\)', readme)
    for target in targets:
        if target.startswith(('https://', 'http://', '#')):
            continue
        path = (root / target.split('#', 1)[0]).resolve()
        if not path.is_relative_to(root.resolve()) or not path.exists():
            raise AssertionError('Broken or out-of-tree README link: ' + target)
    gallery = root / 'docs/screenshots'
    manifest = json.loads((gallery / 'capture-manifest.json').read_text(encoding='utf-8'))
    entries = {row['file']: row for row in manifest['captures']}
    for name in ('main-menu.png', 'q3dm0.png', 'q3dm1.png'):
        data = (gallery / name).read_bytes()
        if data[:8] != b'\x89PNG\r\n\x1a\n' or data[12:16] != b'IHDR':
            raise AssertionError('Not a PNG framebuffer: ' + name)
        dimensions = struct.unpack('>II', data[16:24])
        if dimensions != (1280, 720) or entries[name]['dimensions'] != [1280, 720]:
            raise AssertionError('Clipped or resized framebuffer: ' + name)
        if hashlib.sha256(data).hexdigest() != entries[name]['sha256']:
            raise AssertionError('Capture provenance mismatch: ' + name)
    for name in ('q3dm0.png', 'q3dm1.png'):
        if entries[name]['frames_completed'] < 30 or entries[name]['termination'] != 'natural exit 0 after completed replay':
            raise AssertionError('Missing completed replay evidence: ' + name)
    expected = 'audioStarted=try(audioOutput.init(22050));'
    for name in ('qvm_menu_app.ml', 'qvm_preview_app.ml'):
        text = (root / 'src/mq3/client' / name).read_text(encoding='utf-8')
        if text.count(expected) != 1:
            raise AssertionError('Missing explicit audio error capture: ' + name)
    preview = (root / 'src/mq3/client/qvm_preview_app.ml').read_text(encoding='utf-8')
    for fragment in ('import std.ds.list as lists',
                     'window.showLoading(78,"Building "+mapName+" world materials")',
                     'fpsTitle.create("Original QVM "+mapName,window.milliseconds())'):
        if fragment not in preview:
            raise AssertionError('Startup/map-label regression: ' + fragment)
    print(f'PASS: {len(targets)} README links, 3 full framebuffer hashes and startup regression guards')


if __name__ == '__main__':
    check(ROOT)
