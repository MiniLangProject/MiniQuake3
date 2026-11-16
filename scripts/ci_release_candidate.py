#!/usr/bin/env python3
"""Test a pinned published compiler without claiming frozen-toolchain parity."""
import json
import ctypes
import re
import subprocess
import time
import shutil
import sys
from pathlib import Path
import ci_retail_start as ci

ci.RELEASE = 'v1.3.9'
ci.PACKAGE_URL = ('https://github.com/MiniLangProject/MiniLangCompilerML/releases/download/'
                  'v1.3.9/MiniLangCompilerML-1.3.9-windows-x64.zip')
ci.PACKAGE_SHA = '46cbe327d0b42085045ba4f5e1a71bfb395ebc7b10bb3956285db6e469fbfc70'


def release_compiler(profile: dict) -> dict:
    package = ci.BUILD / 'compiler-release.zip'
    ci.download_package(package)
    ci.unpack(package, ci.BUILD / 'compiler-release')
    candidates = [p for p in (ci.BUILD / 'compiler-release').rglob('*.exe')
                  if p.name in ('mlc.exe', 'mlc_win64.exe')]
    if len(candidates) != 1:
        raise RuntimeError('Expected one published compiler, found ' + str(candidates))
    compiler = candidates[0]
    standards = [p for p in (ci.BUILD / 'compiler-release').rglob('std') if p.is_dir() and (p / 'fs.ml').is_file()]
    if len(standards) != 1:
        raise RuntimeError('Cannot resolve published standard library')
    frozen = ci.ROOT / 'artifacts/toolchain'
    (frozen / 'build').mkdir(parents=True, exist_ok=True)
    shutil.copy2(compiler, frozen / 'build/mlc_win64.exe')
    shutil.copytree(standards[0], frozen / 'std', dirs_exist_ok=True)
    used = json.loads(json.dumps(profile))
    used['inputs'] = [{'path': 'build/mlc_win64.exe', 'sha256': ci.digest(compiler)}]
    used['inputs'] += [{'path': p.relative_to(frozen).as_posix(), 'sha256': ci.digest(p)}
                      for p in sorted((frozen / 'std').rglob('*.ml'))]
    expected = next(item['sha256'] for item in profile['inputs'] if item['path']=='build/mlc_win64.exe')
    proof = {'mode': 'published-release-candidate', 'release': ci.RELEASE,
             'package_sha256': ci.PACKAGE_SHA, 'compiler_sha256': ci.digest(compiler),
             'expected_frozen_sha256': expected, 'exact_frozen_binary': False,
             'all_frozen_stdlib_inputs_verified': False}
    ci.REPORT['toolchain'] = proof
    ci.REPORT['limits'].append('Published 1.3.9 compiler and its standard library; NOT the historical frozen 1.2.8 toolchain.')
    used['ci_reconstructed_candidate'] = proof
    used['note'] = 'Temporary CI profile for pinned published compiler 1.3.9; original tracked profile restored after tests.'
    ci.save_report()
    return used


def window_title(hwnd: int) -> str:
    from ctypes import wintypes as w
    user = ctypes.WinDLL('user32', use_last_error=True)
    user.GetWindowTextW.argtypes = [w.HWND, w.LPWSTR, ctypes.c_int]
    buffer = ctypes.create_unicode_buffer(512)
    user.GetWindowTextW(hwnd, buffer, len(buffer))
    return buffer.value


def checked_window_test(name: str, command, *, menu=False) -> None:
    """Require the actual menu title or a completed 300-frame retail replay."""
    command = [str(value) for value in command]
    if not menu:
        command[3] = '300'
    log = ci.EVIDENCE / (name + '.log')
    started = time.monotonic()
    ready_at = None
    seen = False
    captured = []
    titles = []
    record = {'command': command, 'visible_window': False, 'screenshots': captured,
              'window_titles': titles, 'frames_requested': None if menu else 300}
    ci.REPORT['menu' if menu else 'graphics'] = record
    with log.open('w', encoding='utf-8') as output:
        process = subprocess.Popen(command, cwd=ci.ROOT, stdout=output,
                                   stderr=subprocess.STDOUT)
        try:
            while time.monotonic() - started < (75 if menu else 300):
                if process.poll() is not None:
                    break
                hwnd = ci.visible_window(process.pid)
                seen = seen or bool(hwnd)
                record['visible_window'] = seen
                title = window_title(hwnd) if hwnd else ''
                if title and title not in titles and len(titles) < 20:
                    titles.append(title)
                text = log.read_text(encoding='utf-8', errors='replace')
                ready = ('Quake III Arena Main Menu' in title) if menu else ('QVM startup profile:' in text)
                if ready and ready_at is None:
                    ready_at = time.monotonic()
                    record['ready_after_seconds'] = round(ready_at - started, 3)
                    print(f'READY {name}: {title}', flush=True)
                elapsed_ready = time.monotonic() - ready_at if ready_at else 0
                capture_due = ready_at is not None and hwnd and (
                    (not captured and elapsed_ready >= 0.4) or
                    (not menu and len(captured) == 1 and elapsed_ready >= 5))
                if capture_due:
                    capture_name = name + '-screen-' + str(len(captured) + 1)
                    ci.screenshot(capture_name)
                    captured.append(capture_name + '.png')
                    ci.save_report()
                if menu and ready_at is not None and elapsed_ready >= 5:
                    if not captured:
                        raise RuntimeError('Menu screenshot is missing')
                    record['title_confirmed'] = True
                    record['alive_after_ready_seconds'] = round(elapsed_ready, 3)
                    record['termination'] = 'Intentional harness stop after menu observation; not natural exit.'
                    print('PASS: original main-menu title, visible window and screenshot', flush=True)
                    return
                time.sleep(0.15)
            text = log.read_text(encoding='utf-8', errors='replace')
            print(text[-16000:], flush=True)
            record['exit_code'] = process.poll()
            if menu:
                raise RuntimeError(f'Menu did not reach stable titled state: exit={process.poll()}')
            if process.poll() is None:
                raise TimeoutError('Graphical replay exceeded 300 seconds')
            frames = re.search(r'QVM preview:[^\r\n]*\bframes=(\d+)', text)
            record['frames_completed'] = int(frames.group(1)) if frames else None
            renderer = re.search(r'QVM renderer: ([^\r\n]+)', text)
            record['renderer'] = renderer.group(1) if renderer else None
            record['audio_unavailable'] = 'audio output unavailable' in text
            if process.returncode or not seen or record['frames_completed'] != 300 or 'QVM loop profile:' not in text:
                raise RuntimeError(f'Graphical replay failed: exit={process.returncode}, visible={seen}, frames={record["frames_completed"]}')
            if not captured:
                raise RuntimeError('Completed graphical replay has no screenshot evidence')
            print('PASS: 300 retail graphics frames, exit 0 and captured screen', flush=True)
        finally:
            if process.poll() is None:
                process.terminate()
                try:
                    process.wait(timeout=10)
                except subprocess.TimeoutExpired:
                    process.kill()
                    process.wait(timeout=10)
            record['observed_seconds'] = round(time.monotonic() - started, 3)
            ci.save_report()


if __name__ == '__main__':
    ci.restore_compiler = release_compiler
    ci.window_test = checked_window_test
    result = ci.main()
    source_archive = ci.EVIDENCE / 'MiniQuake3-tested-source.zip'
    subprocess.run(['git', 'archive', '--format=zip', '--output=' + str(source_archive), 'HEAD'],
                   cwd=ci.ROOT, check=True, timeout=60)
    raise SystemExit(result)
