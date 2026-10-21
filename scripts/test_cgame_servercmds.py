"""Unchanged-C cg_servercmds decisions and complete native command contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    'CG_AddBufferedVoiceChat', 'CG_AddToTeamChat',
    'CG_ConfigStringModified', 'CG_ExecuteNewServerCommands',
    'CG_GetVoiceChat', 'CG_HeadModelVoiceChats', 'CG_LoadVoiceChats',
    'CG_MapRestart', 'CG_ParseScores', 'CG_ParseServerinfo',
    'CG_ParseTeamInfo', 'CG_ParseVoiceChats', 'CG_ParseWarmup',
    'CG_PlayBufferedVoiceChats', 'CG_PlayVoiceChat',
    'CG_RemoveChatEscapeChar', 'CG_SetConfigValues',
    'CG_ShaderStateChanged', 'CG_ValidOrder', 'CG_VoiceChat',
    'CG_VoiceChatListForClient', 'CG_VoiceChatLocal', 'Cmd_Argv',
]


def main():
    out = ROOT / 'build/reference/cgame_servercmds'
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / 'Quake-III-Arena-original-source/code/cgame/cg_servercmds.c'
    compared = ['CG_ValidOrder', 'CG_RemoveChatEscapeChar']
    (out / 'cgame_servercmds_under_test.inc').write_text(
        extract(source, compared), encoding='utf-8', newline='\n')
    host = ROOT / 'tests/reference/cgame_servercmds_oracle.c'
    exe = out / 'oracle.exe'
    run(['cl', '/nologo', '/Od', '/MT', '/W4', '/WX', f'/I{out}', host,
         f'/Fe:{exe}', '/link', '/Brepro'], out, msvc_env('x86'),
        out / 'oracle-build.log')
    native = run([exe], out, log=out / 'oracle.log')
    for mini_source, name in [
        ('tests/cgame_servercmds_oracle.ml', 'cgame_servercmds_oracle.exe'),
        ('tests/cgame_servercmds_contracts.ml', 'cgame_servercmds_contracts.exe'),
    ]:
        subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                        mini_source, '--output', name], cwd=ROOT, check=True)
    mini = run([ROOT / 'build/cgame_servercmds_oracle.exe'], ROOT / 'build',
               log=out / 'minilang.log')
    assert native == mini, (native, mini)
    contracts = run([ROOT / 'build/cgame_servercmds_contracts.exe'],
                    ROOT / 'build', log=out / 'contracts.log').strip()
    assert contracts == 'PASS: 35 native cg_servercmds contracts', contracts
    files = [source, host, ROOT / 'src/mq3/client/cgame_servercmds.ml',
             ROOT / 'tests/cgame_servercmds_oracle.ml',
             ROOT / 'tests/cgame_servercmds_contracts.ml']
    result = {
        'passed': True,
        'differential_records': 14,
        'contracts': 35,
        'functions': FUNCTIONS,
        'scope': ('Complete native cg_servercmds state transitions: scores and '
                  'team info, configstrings and shader remaps, chat wrapping, '
                  'restart, voice parsing/routing/buffering, and sequenced '
                  'server-command dispatch with suppressible host boundaries.'),
        'sources': {str(path.relative_to(ROOT)).replace('\\', '/'): sha(path)
                    for path in files},
    }
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                     encoding='utf-8', newline='\n')
    print('PASS: 14 unchanged C cg_servercmds records + 35 native contracts')


if __name__ == '__main__':
    main()
