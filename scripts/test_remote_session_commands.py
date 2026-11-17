#!/usr/bin/env python3
"""Compile command integration contracts and compare packed state with original C."""
from __future__ import annotations
import json
import subprocess
import sys
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract
from inventory import sha


def main() -> None:
    output = ROOT / 'build/reference/remote_commands'
    output.mkdir(parents=True, exist_ok=True)
    original = ROOT / 'Quake-III-Arena-original-source/code/client/cl_cgame.c'
    include = output / 'configstring_update_under_test.inc'
    include.write_text(extract(original, ['CL_ConfigstringModified']), encoding='utf-8', newline='\n')
    native = output / 'configstring_update_oracle.exe'
    run(['cl', '/nologo', '/Od', '/MT', '/DWIN32', '/D_CRT_SECURE_NO_WARNINGS',
         f'/I{output}', f'/I{ROOT / "Quake-III-Arena-original-source/code/game"}',
         ROOT / 'tests/reference/configstring_update_oracle.c', f'/Fe:{native}', '/link', '/Brepro'],
        output, msvc_env('x86'), output / 'oracle-build.log')
    reference = run([native], output, log=output / 'original.log')
    for entry in ('configstring_update_oracle', 'remote_session_commands_contracts'):
        subprocess.run([sys.executable, ROOT / 'scripts/build_release.py', '--source',
                        f'tests/{entry}.ml', '--output', entry + '.exe'], cwd=ROOT, check=True)
    mini = run([ROOT / 'build/configstring_update_oracle.exe'], ROOT / 'build', log=output / 'minilang.log')
    if reference != mini:
        raise RuntimeError('CL_ConfigstringModified packed state differs; see original.log and minilang.log')
    if len(reference.splitlines()) != 8:
        raise RuntimeError('Missing original configstring comparison records')
    contracts = run([ROOT / 'build/remote_session_commands_contracts.exe'], ROOT / 'build', log=output / 'contracts.log').strip()
    expected = 'PASS: 46 remote-session command and packed-gamestate contracts'
    if contracts != expected:
        raise RuntimeError(contracts)
    sources = [original, include, ROOT / 'src/mq3/client/remote_session.ml',
               ROOT / 'src/mq3/client/gamestate.ml', ROOT / 'src/mq3/client/server_command_stream.ml',
               ROOT / 'tests/remote_session_commands_contracts.ml', ROOT / 'tests/configstring_update_oracle.ml',
               ROOT / 'tests/reference/configstring_update_oracle.c']
    report = {'passed': True, 'contracts': 46, 'original_c_records': 8,
              'comparison': 'All configstring offsets and all occupied packed-string bytes, including exact storage limit.',
              'oracle': 'Unchanged CL_ConfigstringModified body extracted from pinned id Software cl_cgame.c; host supplies already parsed arguments.',
              'limits': ['Component tests, not desktop multiplayer acceptance.', 'Malformed update rollback is a port robustness test, not original fatal-error parity.'],
              'sources': {p.relative_to(ROOT).as_posix(): sha(p) for p in sources}}
    (output / 'result.json').write_text(json.dumps(report, indent=2)+'\n', encoding='utf-8')
    print(contracts)
    print('PASS: 8 unchanged-original-C packed configstring comparisons')


if __name__ == '__main__':
    main()
