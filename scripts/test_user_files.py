#!/usr/bin/env python3
"""Test the user-file component on Windows without touching player data.

The component is not yet wired into the normal desktop host. This gate proves
file contracts and process-to-process persistence, not the full game lifecycle.
No retail data is downloaded, required, or included in the output.
"""
from __future__ import annotations
import ctypes
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
import time
from toolchain import ROOT, msvc_env


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def native_contracts(dll: Path, root: Path) -> dict:
    api = ctypes.WinDLL(str(dll))
    write = api.mq3_user_write_atomic
    write.argtypes = [ctypes.c_char_p, ctypes.c_int, ctypes.c_char_p, ctypes.c_int, ctypes.c_char_p, ctypes.c_int]
    write.restype = ctypes.c_int
    size = api.mq3_user_size
    size.argtypes = [ctypes.c_char_p, ctypes.c_int, ctypes.c_char_p, ctypes.c_int]
    size.restype = ctypes.c_int
    same = api.mq3_user_same_path
    same.argtypes = write.argtypes
    same.restype = ctypes.c_int
    encoded = str(root).encode('utf-8')
    def put(name: str, data: bytes = b'new') -> bool:
        name_bytes = name.encode('utf-8')
        return bool(write(encoded, len(encoded), name_bytes, len(name_bytes), data, len(data)))
    def identical(first: str, second: str) -> int:
        a, b = first.encode('utf-8'), second.encode('utf-8')
        return same(encoded, len(encoded), a, len(a), b, len(b))
    assert put('nested/Grüße.dat', b'original')
    assert (root / 'nested/Grüße.dat').read_bytes() == b'original'
    assert identical('nested/Grüße.dat', 'NESTED\\GRÜßE.DAT') == 1
    assert identical('nested/Grüße.dat', 'new-folder/different.dat') == 0
    assert identical('nested/Grüße.dat', '../escape') == -1
    forbidden = ['../escape', 'nested/../../escape', '/absolute', '\\absolute', 'C:/absolute',
                 'name:ads', 'NUL', 'CON.txt', 'COM1', 'LPT9.txt', 'COM¹.txt',
                 'bad//file', 'bad/./file', 'bad/../file', 'tail.', 'tail ', 'nul\0hidden']
    for name in forbidden:
        assert not put(name), name
    outside = root.parent / 'outside'
    outside.mkdir()
    subprocess.run(['cmd', '/c', 'mklink', '/J', str(root / 'junction'), str(outside)],
                   check=True, capture_output=True, text=True, timeout=30)
    try:
        assert not put('junction/escape.dat')
        assert not (outside / 'escape.dat').exists()
    finally:
        os.rmdir(root / 'junction')
    assert put('protected.cfg', b'keep-me')
    kernel = ctypes.WinDLL('kernel32', use_last_error=True)
    kernel.CreateFileW.argtypes = [ctypes.c_wchar_p, ctypes.c_uint32, ctypes.c_uint32,
                                  ctypes.c_void_p, ctypes.c_uint32, ctypes.c_uint32, ctypes.c_void_p]
    kernel.CreateFileW.restype = ctypes.c_void_p
    kernel.CloseHandle.argtypes = [ctypes.c_void_p]
    handle = kernel.CreateFileW(str(root / 'protected.cfg'), 0x80000000, 1, None, 3, 0, None)
    assert handle not in (None, ctypes.c_void_p(-1).value)
    try:
        assert not put('protected.cfg', b'overwrite')
        assert (root / 'protected.cfg').read_bytes() == b'keep-me'
    finally:
        kernel.CloseHandle(handle)
    assert not list(root.glob('*.mq3-*.tmp')), 'atomic failure leaked a temporary file'
    assert put('protected.cfg', b'after-release')
    assert put('zero.dat', b'')
    name = b'zero.dat'
    assert size(encoded, len(encoded), name, len(name)) == 0
    name = b'absent.dat'
    assert size(encoded, len(encoded), name, len(name)) == -2
    # Short names may be disabled on the runner; report, do not fabricate coverage.
    kernel.GetShortPathNameW.argtypes = [ctypes.c_wchar_p, ctypes.c_wchar_p, ctypes.c_uint32]
    kernel.GetShortPathNameW.restype = ctypes.c_uint32
    assert put('long-file-name-for-alias-test.dat', b'alias')
    path = root / 'long-file-name-for-alias-test.dat'
    buffer = ctypes.create_unicode_buffer(32768)
    length = kernel.GetShortPathNameW(str(path), buffer, len(buffer))
    short_alias = 'unavailable'
    if 0 < length < len(buffer) and Path(buffer.value).name.lower() != path.name.lower():
        assert identical(path.name, Path(buffer.value).name) == 1
        short_alias = 'passed'
    return {'invalid_names_rejected': len(forbidden), 'unicode_and_separator_identity': 'passed',
            'junction_rejection': 'passed', 'atomic_failure_preserves_previous_file': 'passed',
            'empty_and_absent_are_distinct': 'passed', 'short_alias': short_alias}


def main() -> int:
    if sys.platform != 'win32':
        raise RuntimeError('This gate requires Windows and MSVC')
    out = ROOT / 'build/user-file-acceptance'
    out.mkdir(parents=True, exist_ok=True)
    report = {'status': 'running', 'steps': [], 'scope': 'User-file component, not desktop host integration',
              'limits': ['No retail game data or graphical playthrough.',
                         'Local path checks are not a sandbox against a hostile concurrent directory-link swap.']}
    def run(name: str, command: list, env: dict | None = None) -> str:
        log = out / (name + '.log')
        start = time.monotonic()
        code = None
        command = [str(x) for x in command]
        command[0] = shutil.which(command[0], path=(env or os.environ).get('PATH')) or command[0]
        try:
            with log.open('w', encoding='utf-8') as stream:
                result = subprocess.run(command, cwd=ROOT, env=env,
                                        stdout=stream, stderr=subprocess.STDOUT, timeout=900)
            code = result.returncode
            text = log.read_text(encoding='utf-8', errors='replace')
            print(text[-16000:], flush=True)
            if code:
                raise RuntimeError(name + ' failed; see ' + str(log))
            return text
        finally:
            report['steps'].append({'name': name, 'exit_code': code,
                                    'seconds': round(time.monotonic() - start, 3)})
    try:
        native = out / 'miniquake3_userfiles.dll'
        env = msvc_env('x64')
        run('native-build', ['cl', '/nologo', '/LD', '/O2', '/W4', '/WX', '/MT', '/Brepro',
                            ROOT / 'native/user_files_win32.c', '/Fo:' + str(out / 'user_files.obj'),
                            '/link', '/out:' + str(native)], env)
        exe = out / 'user_files_contracts.exe'
        run('minilang-build', [sys.executable, ROOT / 'scripts/build_release.py', '--source',
                              'tests/user_files_contracts.ml', '--output', exe])
        with tempfile.TemporaryDirectory(prefix='mq3-user-files-') as temporary:
            directory = Path(temporary)
            report['native'] = native_contracts(native, directory / 'native')
            env = os.environ.copy()
            env['MINIQUAKE3_HOME'] = str(directory / 'unused-default')
            first = run('minilang-exercise', [exe, directory / 'minilang', 'exercise'], env)
            if not re.search(r'^PASS: 98 user-file contracts\s*$', first, re.MULTILINE):
                raise RuntimeError('Missing complete MiniLang contract result')
            second = run('minilang-reopen', [exe, directory / 'minilang', 'reopen'], env)
            if not re.search(r'^PASS: 2 cross-process user-file contracts\s*$', second, re.MULTILINE):
                raise RuntimeError('Missing second-process persistence result')
        report['sources'] = {name: digest(ROOT / name) for name in
                             ['native/user_files_win32.c', 'src/mq3/engine/user_files.ml',
                              'tests/user_files_contracts.ml', 'scripts/test_user_files.py']}
        report['binaries'] = {native.name: digest(native), exe.name: digest(exe)}
        report['status'] = 'passed'
        print('PASS: user-file acceptance; component only, not full desktop integration')
        return 0
    except (OSError, AssertionError, RuntimeError, subprocess.SubprocessError) as error:
        report['status'] = 'failed'
        report['error'] = str(error)
        raise
    finally:
        (out / 'report.json').write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')


if __name__ == '__main__':
    raise SystemExit(main())
