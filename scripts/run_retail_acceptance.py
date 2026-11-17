#!/usr/bin/env python3
"""Validate the committed core with retail maps and package matched evidence.

Requires Windows, MSVC, the pinned published compiler and an existing, verified
build/baseq3/pak0.pk3. This script never downloads game data or changes sources.
It verifies the existing menu and bounded arena rendering, not the unpublished
map/menu lifecycle candidate. Screenshots are evidence, not benchmarks.
"""
from __future__ import annotations
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import time
import zipfile
from toolchain import ROOT

BUILD = ROOT / 'build'
OUT = BUILD / 'retail-acceptance'


def digest(path: Path) -> str:
    value = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            value.update(block)
    return value.hexdigest()


def run(name: str, command: list, report: dict, env: dict) -> None:
    log = OUT / (name + '.log')
    start = time.monotonic()
    code = None
    try:
        with log.open('w', encoding='utf-8') as stream:
            result = subprocess.run([str(x) for x in command], cwd=ROOT, env=env,
                                    stdout=stream, stderr=subprocess.STDOUT, timeout=1800)
        code = result.returncode
        print(log.read_text(encoding='utf-8', errors='replace')[-20000:], flush=True)
        if code:
            raise RuntimeError(name + ' failed; see ' + str(log))
    finally:
        report['steps'].append({'name': name, 'exit_code': code,
                                'seconds': round(time.monotonic()-start, 3)})


def package(report: dict) -> None:
    required = [BUILD / 'MiniQuake3.exe', *[BUILD / 'qvms' / name for name in
                ('ui.qvm', 'cgame.qvm', 'qagame.qvm')]]
    dlls = sorted(BUILD.glob('*.dll'))
    if not dlls or not all(path.is_file() for path in required):
        raise RuntimeError('Missing built runtime files')
    binaries = required + dlls
    report['binary_sha256'] = {path.relative_to(BUILD).as_posix(): digest(path) for path in binaries}
    report['package_scope'] = ('Existing normal menu + bounded arena path. The separate user-file '
                               'component and full desktop lifecycle candidate are not integrated.')
    report_path = OUT / 'report.json'
    report_path.write_text(json.dumps(report, indent=2)+'\n', encoding='utf-8')
    with zipfile.ZipFile(OUT / 'MiniQuake3-tested-build.zip', 'w', zipfile.ZIP_DEFLATED) as archive:
        for path in binaries:
            archive.write(path, path.relative_to(BUILD).as_posix())
        archive.write(ROOT / 'LICENSE', 'LICENSE')
        archive.write(ROOT / 'NOTICE.md', 'NOTICE.md')
        archive.write(report_path, 'TEST-REPORT.json')
        archive.writestr('START.txt',
            'Supply your own legally obtained baseq3/pak*.pk3 beside MiniQuake3.exe.\n'
            'This package contains no retail game data.\n'
            'Validated scope: normal main menu and bounded q3dm0/q3dm1 rendering;\n'
            'not the unpublished desktop lifecycle/persistence/culling candidate.\n'
            'Hosted software-renderer timings are not GPU performance measurements.\n'
            'Matching source including the pinned upstream submodule is provided separately.\n')
    # Include the upstream source used to build QVMs, not just an empty gitlink.
    with tempfile.TemporaryDirectory(prefix='mq3-source-package-') as temp:
        temp = Path(temp)
        own, upstream = temp / 'own.zip', temp / 'upstream.zip'
        subprocess.run(['git', 'archive', '--format=zip', '--output', str(own), 'HEAD'], cwd=ROOT, check=True)
        subprocess.run(['git', 'archive', '--format=zip', '--output', str(upstream), 'HEAD'],
                       cwd=ROOT / 'Quake-III-Arena-original-source', check=True)
        with zipfile.ZipFile(OUT / 'MiniQuake3-matching-source.zip', 'w', zipfile.ZIP_DEFLATED) as output:
            for source, prefix in [(own, ''), (upstream, 'Quake-III-Arena-original-source/')]:
                with zipfile.ZipFile(source) as archive:
                    for entry in archive.infolist():
                        if entry.is_dir():
                            continue
                        # Packaging is an allowlist of tracked source, never build assets.
                        if Path(entry.filename).suffix.lower() in ('.pk3', '.pak', '.iso', '.cue'):
                            raise RuntimeError('Retail asset unexpectedly tracked: ' + entry.filename)
                        output.writestr(prefix + entry.filename, archive.read(entry))
            output.writestr('SOURCE-REVISION.json', json.dumps({
                'source_commit': report['source_commit'], 'upstream_commit': report['upstream_commit']}, indent=2)+'\n')


def main() -> int:
    if sys.platform != 'win32':
        raise RuntimeError('Windows is required')
    OUT.mkdir(parents=True, exist_ok=True)
    pak = BUILD / 'baseq3/pak0.pk3'
    if not pak.is_file():
        raise RuntimeError('Verified retail data must be supplied before this test')
    tracked = subprocess.check_output(['git', 'ls-files', '-z'], cwd=ROOT).decode().split('\0')
    hashes = {name: digest(ROOT / name) for name in tracked if name and (ROOT / name).is_file()}
    report = {'status': 'running', 'steps': [],
              'source_commit': subprocess.check_output(['git','rev-parse','HEAD'], cwd=ROOT, text=True).strip(),
              'upstream_commit': subprocess.check_output(['git','rev-parse','HEAD'], cwd=ROOT / 'Quake-III-Arena-original-source', text=True).strip(),
              'pak0_sha256': digest(pak),
              'limits': ['Normal menu and bounded arena checks, not a complete interactive playthrough.',
                         'The desktop lifecycle/persistence/culling candidate is not included.',
                         'Software-renderer hosted runner; no hardware-rendering or audible-audio acceptance.',
                         'Screenshot I/O enabled: these timings are not performance benchmarks.']}
    try:
        with tempfile.TemporaryDirectory(prefix='mq3-retail-home-') as home:
            env = os.environ.copy()
            env.update(MQ3_BUILD_TOOLCHAIN='release', MQ3_RENDERER='software', MINIQUAKE3_HOME=home)
            steps = [
                ('original-source', [sys.executable, 'scripts/test_parity_inventory.py']),
                ('game-build', [sys.executable, 'scripts/build_release.py']),
                ('retail-bots', [sys.executable, 'scripts/test_singleplayer_bot_retail.py', '--data-root', 'build']),
                ('retained-retail', [sys.executable, 'scripts/test_retained_world_batch.py', '--data-root', 'build']),
                ('replay-build', [sys.executable, 'scripts/build_release.py', '--source', 'tests/singleplayer_graphics_replay.ml', '--output', 'singleplayer_graphics_replay.exe']),
                ('graphics', [sys.executable, 'scripts/capture_readme.py', '--output', OUT / 'screenshots', '--frames', '120'])]
            for name, command in steps:
                run(name, command, report, env)
        changed = [name for name, expected in hashes.items()
                   if not (ROOT/name).is_file() or digest(ROOT/name) != expected]
        if changed:
            raise RuntimeError('Tests changed tracked sources: ' + ', '.join(changed))
        report['source_files_unchanged'] = True
        report['status'] = 'passed'
        package(report)
        (OUT / 'source-hashes.json').write_text(json.dumps(hashes, indent=2)+'\n', encoding='utf-8')
        print('PASS: retail core regression and matched build/source packaging')
        return 0
    except BaseException as error:
        report['status'] = 'failed'
        report['error'] = str(error)
        # Do not leave a success-named package behind after packaging fails.
        for name in ('MiniQuake3-tested-build.zip', 'MiniQuake3-matching-source.zip'):
            (OUT / name).unlink(missing_ok=True)
        raise
    finally:
        (OUT / 'report.json').write_text(json.dumps(report, indent=2)+'\n', encoding='utf-8')


if __name__ == '__main__':
    raise SystemExit(main())
