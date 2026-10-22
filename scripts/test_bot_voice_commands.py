"""Differential, contract, symbol and retail gates for game/ai_vcmd.c."""
import argparse
import json
import re
import subprocess
import sys
from pathlib import Path
from zipfile import ZipFile

from inventory import sha
from toolchain import ROOT, msvc_env, run

SYMBOLS = [
    'BotVoiceChatCommand', 'BotVoiceChat_Camp', 'BotVoiceChat_Defend',
    'BotVoiceChat_DefendFlag', 'BotVoiceChat_Dummy',
    'BotVoiceChat_FollowFlagCarrier', 'BotVoiceChat_FollowMe',
    'BotVoiceChat_GetFlag', 'BotVoiceChat_Offense', 'BotVoiceChat_Patrol',
    'BotVoiceChat_ReturnFlag', 'BotVoiceChat_StartLeader',
    'BotVoiceChat_StopLeader', 'BotVoiceChat_WantOnDefense',
    'BotVoiceChat_WantOnOffense', 'BotVoiceChat_WhoIsLeader',
]
PORT_FUNCTIONS = [
    'voiceChatCommand', 'camp', 'defend', 'defendFlag', 'dummy',
    'followFlagCarrier', 'followMe', 'getFlag', 'offense', 'patrol',
    'returnFlag', 'startLeader', 'stopLeader', 'wantOnDefense',
    'wantOnOffense', 'whoIsLeader',
]


def extract_unchanged(source: Path, names: list[str]) -> str:
    """Extract top-level C bodies verbatim; comments in Camp contain stray braces."""
    text = source.read_text(encoding='utf-8')
    bodies = []
    for name in names:
        match = re.search(
            r'^[\w* \t]+\b' + re.escape(name) + r'\s*\([^;{}]*\)\s*\{',
            text,
            re.M,
        )
        if not match:
            raise RuntimeError(f'Missing original function {name}')
        close = re.search(r'^\}\s*$', text[match.end():], re.M)
        if not close:
            raise RuntimeError(f'Missing top-level close for {name}')
        bodies.append(text[match.start():match.end() + close.end()])
    return '\n\n'.join(bodies) + '\n'


def retail_probe(data_root: Path) -> dict:
    pak = data_root / 'baseq3' / 'pak0.pk3'
    if not pak.is_file():
        raise RuntimeError(f'Retail pak missing: {pak}')
    with ZipFile(pak) as archive:
        qvm = archive.read('vm/qagame.qvm')
    # The retail 1.11 QVM predates the later missionpack command table. These
    # exact compiled command/chat identifiers still prove the shipped Bot AI
    # paths which this module drives (orders, patrol, camping and flag return).
    identifiers = [
        'getflag', 'followme', 'defend_start', 'defend_stop', 'patrol_start',
        'patrol_stop', 'camp_start', 'camp_arrive', 'camp_stop',
        'returnflag_start',
    ]
    missing = [value for value in identifiers if value.encode() + b'\0' not in qvm]
    if missing:
        raise RuntimeError(f'Retail qagame voice identifiers missing: {missing}')
    return {'pak': str(pak), 'qvmBytes': len(qvm), 'identifiers': identifiers}


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', type=Path)
    args = parser.parse_args()
    source = ROOT / 'Quake-III-Arena-original-source/code/game/ai_vcmd.c'
    module = ROOT / 'src/mq3/game/bot_voice_commands.ml'
    module_text = module.read_text(encoding='utf-8')
    missing = [name for name in PORT_FUNCTIONS if not re.search(
        rf'^function\s+{re.escape(name)}\s*\(', module_text, re.M)]
    if missing:
        raise RuntimeError(f'Missing MiniLang functions: {missing}')

    output = ROOT / 'build/reference/bot_voice_commands'
    output.mkdir(parents=True, exist_ok=True)
    extracted_names = [name for name in SYMBOLS if name != 'BotVoiceChatCommand'] + ['BotVoiceChatCommand']
    include = output / 'bot_voice_commands_under_test.inc'
    include.write_text(extract_unchanged(source, extracted_names), encoding='utf-8', newline='\n')
    harness = ROOT / 'tests/reference/bot_voice_commands_oracle.c'
    native_exe = output / 'bot_voice_commands_oracle.exe'
    run([
        'cl', '/nologo', '/O2', '/MT', '/W4', '/D_CRT_SECURE_NO_WARNINGS',
        f'/I{output}', harness, f'/Fe:{native_exe}', '/link', '/Brepro',
    ], output, msvc_env('x64'), output / 'oracle-build.log')
    native = run([native_exe], output, log=output / 'oracle.log')

    subprocess.run([
        sys.executable, ROOT / 'scripts/build.py', '--source',
        'tests/bot_voice_commands_oracle.ml', '--output',
        'bot_voice_commands_oracle.exe',
    ], check=True)
    mini = run([ROOT / 'build/bot_voice_commands_oracle.exe'], ROOT / 'build',
               log=output / 'minilang.log')
    if native != mini:
        raise RuntimeError(f'ai_vcmd differential mismatch\nnative: {native!r}\nmini: {mini!r}')

    subprocess.run([
        sys.executable, ROOT / 'scripts/build.py', '--source',
        'tests/bot_voice_commands_contracts.ml', '--output',
        'bot_voice_commands_contracts.exe',
    ], check=True)
    contracts = run([ROOT / 'build/bot_voice_commands_contracts.exe'], ROOT / 'build',
                    log=output / 'contracts.log').strip()
    if contracts != 'PASS: 25 ai_vcmd contracts':
        raise RuntimeError(contracts)

    retail = None
    if args.data_root is not None:
        retail = retail_probe(args.data_root.resolve())
    result = {
        'passed': True,
        'symbols': len(SYMBOLS),
        'differentialRecords': len(native.splitlines()),
        'contracts': 25,
        'retail': retail,
        'sources': {
            str(path.relative_to(ROOT)).replace('\\', '/'): sha(path)
            for path in [source, module, harness,
                         ROOT / 'tests/bot_voice_commands_oracle.ml',
                         ROOT / 'tests/bot_voice_commands_contracts.ml']
        },
    }
    (output / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                        encoding='utf-8', newline='\n')
    retail_text = '' if retail is None else f" + retail qagame ({len(retail['identifiers'])} ids)"
    print(f"PASS: {len(SYMBOLS)} ai_vcmd symbols, {result['differentialRecords']} exact records, 25 contracts{retail_text}")


if __name__ == '__main__':
    main()
