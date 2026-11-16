#!/usr/bin/env python3
"""Reconstruct the frozen compiler and run isolated Windows retail startup checks.

Retail assets are never included in evidence/build archives. Tracked provenance
is restored even on failure. A non-identical reconstructed compiler is reported
as a candidate, never represented as the original frozen binary.
"""
from __future__ import annotations
import argparse
import ctypes
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import time
import traceback
import urllib.request
import zipfile

ROOT = Path(__file__).resolve().parents[1]
BUILD = ROOT / 'build'
EVIDENCE = BUILD / 'retail-evidence'
RELEASE = 'v1.2.8'
PACKAGE_URL = ('https://github.com/MiniLangProject/MiniLangCompilerML/releases/download/'
               'v1.2.8/MiniLangCompilerML-1.2.8-windows-x64.zip')
PACKAGE_SHA = '0ca1d2c37ab0d35fe123666c9a226db3f43b4772fa913e9bdd01b84f08046e09'
BOOTSTRAP_SHA = '60db15723f1d33afccbaf81657e91569811c38cf54a320117857c29027700e0b'
BASE = '738d830fa604de884d7e488fde0991a19c034016'
PATCH_SHA = '95c7f1e5e2ad7aed03f2642379185f9b8e7f89fccf3dd52d25eaa436d20645e3'
SOURCE_SHA = '2287c63faecfc914e4e1143df56cb1adf86dfdccf819060f70606676cbcbadae'
REPORT = {'status': 'running', 'steps': [], 'limits': [
    'Automated hosted Windows runner, not an interactive human playtest.',
    'Hosted-runner FPS is not a measurement of the user PC.',
    'Retail assets are excluded from all uploaded artifacts.']}


def digest(path: Path) -> str:
    h = hashlib.sha256()
    with path.open('rb') as f:
        for block in iter(lambda: f.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()


def match_expected_bytes(path: Path, expected: str) -> None:
    """Restore manifest bytes only when the sole difference is CRLF versus LF."""
    data = path.read_bytes()
    if hashlib.sha256(data).hexdigest() == expected:
        return
    lf = data.replace(b"\r\n", b"\n")
    candidates = {"LF": lf, "CRLF": lf.replace(b"\n", b"\r\n")}
    for style, candidate in candidates.items():
        if hashlib.sha256(candidate).hexdigest() == expected:
            path.write_bytes(candidate)
            REPORT.setdefault('line_endings_restored', []).append({
                'path': str(path.relative_to(ROOT)), 'style': style, 'sha256': expected})
            print(f'PASS: restored exact {style} manifest bytes for {path.name}', flush=True)
            return
    REPORT['source_mismatch'] = {'path': str(path), 'expected': expected,
        'actual': hashlib.sha256(data).hexdigest(),
        'variants': {style: hashlib.sha256(value).hexdigest() for style, value in candidates.items()}}
    (EVIDENCE / ('mismatch-' + path.name)).write_bytes(data)
    save_report()
    raise RuntimeError('Manifest mismatch is not explained by line endings: ' + str(path))


def save_report() -> None:
    EVIDENCE.mkdir(parents=True, exist_ok=True)
    (EVIDENCE / 'startup-report.json').write_text(json.dumps(REPORT, indent=2), encoding='utf-8')


def run(name: str, args, *, cwd=ROOT, timeout=900) -> str:
    command = [str(x) for x in args]
    print(f'RUN {name}: {subprocess.list2cmdline(command)}', flush=True)
    log = EVIDENCE / (name + '.log')
    started = time.monotonic()
    code = None
    try:
        with log.open('w', encoding='utf-8') as stream:
            process = subprocess.run(command, cwd=cwd, stdout=stream,
                                     stderr=subprocess.STDOUT, timeout=timeout)
        code = process.returncode
    finally:
        REPORT['steps'].append({'name': name, 'command': command,
                                'exit_code': code, 'seconds': round(time.monotonic()-started, 3)})
        save_report()
        if log.exists():
            print(log.read_text(encoding='utf-8', errors='replace')[-16000:], flush=True)
    if code:
        raise RuntimeError(f'{name} failed with exit {code}; see {log.name}')
    return log.read_text(encoding='utf-8', errors='replace')


def download_package(target: Path) -> None:
    request = urllib.request.Request(PACKAGE_URL, headers={'User-Agent': 'MiniQuake3-build-test'})
    for attempt in range(3):
        try:
            with urllib.request.urlopen(request, timeout=60) as response, target.open('wb') as out:
                shutil.copyfileobj(response, out, length=1024*1024)
            if digest(target) != PACKAGE_SHA:
                raise RuntimeError('Published compiler package SHA-256 mismatch')
            return
        except Exception:
            if attempt == 2:
                raise
            time.sleep(2)


def unpack(source: Path, destination: Path) -> None:
    destination.mkdir(parents=True, exist_ok=True)
    root = destination.resolve()
    with zipfile.ZipFile(source) as archive:
        for info in archive.infolist():
            path = (root / info.filename).resolve()
            if not path.is_relative_to(root):
                raise RuntimeError('Unsafe path in compiler package')
        archive.extractall(root)


def restore_compiler(profile: dict) -> dict:
    package = BUILD / 'compiler-bootstrap.zip'
    download_package(package)
    unpack(package, BUILD / 'compiler-bootstrap')
    candidates = [p for p in (BUILD / 'compiler-bootstrap').rglob('*.exe')
                  if p.name in ('mlc.exe', 'mlc_win64.exe') and digest(p) == BOOTSTRAP_SHA]
    if len(candidates) != 1:
        raise RuntimeError(f'Expected one release compiler, found {len(candidates)}')
    bootstrap = candidates[0]
    tree = BUILD / 'compiler-frozen-source'
    run('compiler-checkout', ['git', '-c', 'core.autocrlf=false', 'clone', '--no-checkout',
        'https://github.com/MiniLangProject/MiniLangCompilerML.git', tree], timeout=180)
    run('compiler-base', ['git', '-C', tree, '-c', 'core.autocrlf=false', 'checkout', '--detach', BASE])
    patch = ROOT / 'patches/minilang-738d830-gc-boundaries.patch'
    if digest(patch) != PATCH_SHA:
        raise RuntimeError('Allocator/GC patch hash mismatch')
    source = tree / 'mlc/codegen/codegen_memory.ml'
    source.write_bytes(source.read_bytes().replace(b'\r\n', b'\n'))
    run('compiler-patch', ['git', '-C', tree, 'apply', '--check', patch])
    run('compiler-apply', ['git', '-C', tree, 'apply', patch])
    match_expected_bytes(source, SOURCE_SHA)
    for record in profile.get('compiler_sources', []):
        name = record['path']
        if name == 'mlc_win64.ml' or (name.startswith('mlc/') and name.endswith('.ml')):
            match_expected_bytes(tree / name, record['sha256'])
    for record in profile['inputs']:
        if record['path'] != 'build/mlc_win64.exe':
            match_expected_bytes(tree / record['path'], record['sha256'])
    output = tree / 'build'
    output.mkdir(exist_ok=True)
    flags = ['-I', tree, '--heap-reserve', '8g', '--heap-commit', '512m',
             '--heap-shrink', '--heap-shrink-min', '16m', '--gc-limit', '1536m', '--object-pipeline']
    stage1, stage2 = output / 'stage1.exe', output / 'stage2.exe'
    run('compiler-stage1', [bootstrap, tree / 'mlc_win64.ml', stage1, *flags], timeout=1200)
    run('compiler-stage2', [stage1, tree / 'mlc_win64.ml', stage2, *flags], timeout=1200)
    frozen = ROOT / 'artifacts/toolchain'
    (frozen / 'build').mkdir(parents=True, exist_ok=True)
    shutil.copytree(tree / 'std', frozen / 'std', dirs_exist_ok=True)
    shutil.copy2(stage2, frozen / 'build/mlc_win64.exe')
    changed = json.loads(json.dumps(profile))
    original_hash = next(item['sha256'] for item in profile['inputs'] if item['path']=='build/mlc_win64.exe')
    for record in changed['inputs']:
        actual = digest(frozen / record['path'])
        if record['path'] != 'build/mlc_win64.exe' and actual != record['sha256']:
            raise RuntimeError('Frozen standard-library hash mismatch: ' + record['path'])
        record['sha256'] = actual
    compiler_hash = digest(stage2)
    proof = {'bootstrap_release': RELEASE, 'bootstrap_package_sha256': PACKAGE_SHA,
             'base_commit': BASE, 'patch_sha256': PATCH_SHA, 'compiler_sha256': compiler_hash,
             'expected_frozen_sha256': original_hash, 'exact_frozen_binary': compiler_hash == original_hash,
             'all_frozen_stdlib_inputs_verified': True}
    REPORT['toolchain'] = proof
    if compiler_hash != original_hash:
        changed['ci_reconstructed_candidate'] = proof
        REPORT['limits'].append('Reconstructed compiler differs from frozen binary; this is a candidate build.')
    else:
        print('PASS: reconstructed compiler matches original frozen binary exactly', flush=True)
    save_report()
    smoke = BUILD / 'ci-compiler-smoke.ml'
    smoke.write_text('function main(args)\nkeep=["safe",[1,2,3]]\ngc_collect()\nif keep[1][2]!=3 then return 1 end if\nprint "PASS: allocator compiler smoke"\nreturn 0\nend function\n', encoding='utf-8')
    exe = smoke.with_suffix('.exe')
    run('compiler-smoke-build', [frozen / 'build/mlc_win64.exe', smoke, exe, '-I', frozen], timeout=120)
    if 'PASS: allocator compiler smoke' not in run('compiler-smoke-run', [exe], timeout=60):
        raise RuntimeError('Reconstructed compiler failed its GC smoke test')
    return changed


def visible_window(pid: int) -> int:
    from ctypes import wintypes as w
    user = ctypes.WinDLL('user32', use_last_error=True)
    callback_type = ctypes.WINFUNCTYPE(w.BOOL, w.HWND, w.LPARAM)
    user.EnumWindows.argtypes = [callback_type, w.LPARAM]
    user.GetWindowThreadProcessId.argtypes = [w.HWND, ctypes.POINTER(w.DWORD)]
    user.IsWindowVisible.argtypes = [w.HWND]
    found = []
    @callback_type
    def visit(hwnd, _):
        owner = w.DWORD()
        user.GetWindowThreadProcessId(hwnd, ctypes.byref(owner))
        if owner.value == pid and user.IsWindowVisible(hwnd):
            found.append(int(hwnd))
        return True
    user.EnumWindows(visit, 0)
    return found[0] if found else 0


def screenshot(name: str) -> None:
    target = str(EVIDENCE / (name + '.png')).replace("'", "''")
    script = """$ErrorActionPreference='Stop'; Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing;
$r=[System.Windows.Forms.SystemInformation]::VirtualScreen;
$b=New-Object System.Drawing.Bitmap $r.Width,$r.Height;
$g=[System.Drawing.Graphics]::FromImage($b);
try {$g.CopyFromScreen($r.Left,$r.Top,0,0,$b.Size); $b.Save('TARGET',[System.Drawing.Imaging.ImageFormat]::Png)}
finally {$g.Dispose(); $b.Dispose()}""".replace('TARGET', target)
    run(name, ['powershell.exe', '-NoProfile', '-NonInteractive', '-Command', script], timeout=30)
    if not (EVIDENCE / (name + '.png')).is_file():
        raise RuntimeError('Screenshot was not produced')


def window_test(name: str, command, *, menu=False) -> None:
    log = EVIDENCE / (name + '.log')
    started = time.monotonic()
    seen = False
    captured = False
    with log.open('w', encoding='utf-8') as output:
        process = subprocess.Popen([str(x) for x in command], cwd=ROOT,
                                   stdout=output, stderr=subprocess.STDOUT)
        try:
            while time.monotonic()-started < 180:
                if process.poll() is not None:
                    break
                seen = seen or bool(visible_window(process.pid))
                if seen and not captured and time.monotonic()-started >= 5:
                    screenshot(name + '-screen')
                    captured = True
                if menu and seen and time.monotonic()-started >= 10:
                    REPORT['menu'] = {'visible_window': True, 'alive_after_seconds': 10,
                                      'termination': 'intentional harness stop, not natural exit'}
                    return
                time.sleep(0.2)
            if menu:
                raise RuntimeError(f'Menu exited or failed to create a visible window: {process.poll()}')
            if process.poll() is None:
                raise TimeoutError('Graphical replay exceeded 180 seconds')
            text = log.read_text(encoding='utf-8', errors='replace')
            print(text[-16000:], flush=True)
            if process.returncode or not seen or 'QVM loop profile:' not in text:
                raise RuntimeError(f'Graphical replay failed: exit={process.returncode}, visible={seen}')
            REPORT['graphics'] = {'exit_code': process.returncode, 'visible_window': seen,
                                  'screenshot_captured': captured, 'frames_requested': 180}
        finally:
            if process.poll() is None:
                process.terminate()
                try:
                    process.wait(timeout=10)
                except subprocess.TimeoutExpired:
                    process.kill()
                    process.wait(timeout=10)
            save_report()


def package_build() -> None:
    paths = [BUILD / 'MiniQuake3.exe', *BUILD.glob('*.dll'), * (BUILD / 'qvms').glob('*.qvm')]
    with zipfile.ZipFile(EVIDENCE / 'MiniQuake3-tested-build.zip', 'w', zipfile.ZIP_DEFLATED) as archive:
        for path in paths:
            archive.write(path, path.relative_to(BUILD))
        for name in ('LICENSE', 'NOTICE.md'):
            archive.write(ROOT / name, name)
        archive.writestr('START.txt', 'Place your Quake III baseq3/pak*.pk3 beside MiniQuake3.exe in a baseq3 folder.\nThis archive intentionally contains no retail assets.\nSee startup-report.json for measured checks and limitations.\n')
        archive.write(EVIDENCE / 'startup-report.json', 'startup-report.json')


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--candidate-release', choices=[RELEASE], default=RELEASE)
    parser.parse_args()
    if sys.platform != 'win32':
        raise RuntimeError('This harness requires Windows with MSVC, Python and Git')
    EVIDENCE.mkdir(parents=True, exist_ok=True)
    profile_path = ROOT / 'docs/reference/toolchain.json'
    original = profile_path.read_bytes()
    try:
        REPORT['source_commit'] = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip()
        profile = json.loads(original)
        updated = restore_compiler(profile)
        if not REPORT['toolchain']['exact_frozen_binary']:
            profile_path.write_text(json.dumps(updated, indent=2)+'\n', encoding='utf-8')
        run('game-build', [sys.executable, ROOT / 'scripts/build.py'], timeout=1200)
        run('retail-bot-contracts', [sys.executable, ROOT / 'scripts/test_singleplayer_bot_retail.py',
                                   '--data-root', BUILD], timeout=900)
        window_test('main-menu', [BUILD / 'MiniQuake3.exe'], menu=True)
        run('graphics-build', [sys.executable, ROOT / 'scripts/build.py', '--source',
                              'tests/singleplayer_graphics_replay.ml', '--output',
                              'singleplayer_graphics_replay.exe'], timeout=900)
        window_test('q3dm0-graphics', [BUILD / 'singleplayer_graphics_replay.exe',
                    BUILD / 'baseq3/pak0.pk3', BUILD / 'reference/qvms', '180', 'q3dm0'])
        profile_path.write_bytes(original)
        REPORT['tracked_profile_restored'] = profile_path.read_bytes() == original
        REPORT['status'] = 'passed'
        save_report()
        package_build()
        return 0
    except Exception as exc:
        REPORT['status'] = 'failed'
        REPORT['error'] = str(exc)
        (EVIDENCE / 'exception.txt').write_text(traceback.format_exc(), encoding='utf-8')
        traceback.print_exc()
        return 1
    finally:
        profile_path.write_bytes(original)
        REPORT['tracked_profile_restored'] = profile_path.read_bytes() == original
        save_report()


if __name__ == '__main__':
    raise SystemExit(main())
