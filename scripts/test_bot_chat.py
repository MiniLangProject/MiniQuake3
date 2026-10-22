"""Differential, contract, symbol and retail gates for game/ai_chat.c."""
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
    'BotChatTest', 'BotChatTime', 'BotChat_Death', 'BotChat_EndLevel',
    'BotChat_EnemySuicide', 'BotChat_EnterGame', 'BotChat_ExitGame',
    'BotChat_HitNoDeath', 'BotChat_HitNoKill', 'BotChat_HitTalking',
    'BotChat_Kill', 'BotChat_Random', 'BotChat_StartLevel',
    'BotFirstClientInRankings', 'BotIsFirstInRankings',
    'BotIsLastInRankings', 'BotLastClientInRankings', 'BotMapTitle',
    'BotNumActivePlayers', 'BotRandomOpponentName', 'BotRandomWeaponName',
    'BotValidChatPosition', 'BotVisibleEnemies',
    'BotWeaponNameForMeansOfDeath',
]
PORT_FUNCTIONS = [
    'chatTest', 'chatTime', 'chatDeath', 'chatEndLevel',
    'chatEnemySuicide', 'chatEnterGame', 'chatExitGame', 'chatHitNoDeath',
    'chatHitNoKill', 'chatHitTalking', 'chatKill', 'chatRandom',
    'chatStartLevel', 'firstClientInRankings', 'isFirstInRankings',
    'isLastInRankings', 'lastClientInRankings', 'mapTitle',
    'numActivePlayers', 'randomOpponentName', 'randomWeaponName',
    'validChatPosition', 'visibleEnemies', 'weaponNameForMeansOfDeath',
]
ORACLE_FUNCTIONS = [
    'BotNumActivePlayers', 'BotIsFirstInRankings', 'BotIsLastInRankings',
    'BotFirstClientInRankings', 'BotLastClientInRankings', 'BotMapTitle',
    'BotWeaponNameForMeansOfDeath', 'BotRandomWeaponName', 'BotChatTime',
]
CHAT_TYPES = [
    'game_enter', 'game_exit', 'level_start', 'level_end_victory',
    'level_end_lose', 'level_end', 'death_drown', 'death_slime',
    'death_lava', 'death_cratered', 'death_suicide', 'death_telefrag',
    'death_gauntlet', 'death_rail', 'death_bfg', 'death_insult',
    'death_praise', 'kill_gauntlet', 'kill_rail', 'kill_telefrag',
    'kill_insult', 'kill_praise', 'enemy_suicide', 'hit_talking',
    'hit_nodeath', 'hit_nokill', 'random_misc', 'random_insult',
]


def extract_function(text: str, name: str) -> str:
    match = re.search(
        r'^[\w* \t]+\b' + re.escape(name) + r'\s*\([^;{}]*\)\s*\{',
        text, re.M,
    )
    if not match:
        raise RuntimeError(f'Missing original function {name}')
    depth = 1
    i = match.end()
    in_string = False
    in_char = False
    escape = False
    while i < len(text) and depth:
        ch = text[i]
        if escape:
            escape = False
        elif ch == '\\' and (in_string or in_char):
            escape = True
        elif ch == '"' and not in_char:
            in_string = not in_string
        elif ch == "'" and not in_string:
            in_char = not in_char
        elif not in_string and not in_char:
            if ch == '{':
                depth += 1
            elif ch == '}':
                depth -= 1
        i += 1
    if depth:
        raise RuntimeError(f'Unterminated original function {name}')
    return text[match.start():i]


def retail_probe(data_root: Path) -> dict:
    pak = data_root / 'baseq3' / 'pak0.pk3'
    if not pak.is_file():
        raise RuntimeError(f'Retail pak missing: {pak}')
    with ZipFile(pak) as archive:
        names = archive.namelist()
        team_files = [n for n in names if re.fullmatch(r'botfiles/bots/.+_t\.c', n)]
        combined = b'\n'.join(archive.read(n) for n in team_files)
        qvm = archive.read('vm/qagame.qvm')
        shared = {n: len(archive.read(n)) for n in
                  ['botfiles/rchat.c', 'botfiles/rnd.c', 'botfiles/syn.c']}
    missing_types = [name for name in CHAT_TYPES
                     if re.search(rb'\btype\s+"' + name.encode() + rb'"', combined) is None]
    # A few generic types live in included/shared chat sources rather than every
    # per-bot team chat; resolve them across all retail bot text files.
    if missing_types:
        with ZipFile(pak) as archive:
            all_chat = b'\n'.join(archive.read(n) for n in names
                                  if n.startswith('botfiles/') and n.endswith('.c'))
        missing_types = [name for name in CHAT_TYPES
                         if re.search(rb'\btype\s+"' + name.encode() + rb'"', all_chat) is None]
    if missing_types:
        raise RuntimeError(f'Retail initial-chat templates missing: {missing_types}')
    qvm_missing = [value for value in
                   ['game_enter', 'death_insult', 'kill_praise', 'random_misc']
                   if value.encode() + b'\0' not in qvm]
    if qvm_missing:
        raise RuntimeError(f'Retail qagame chat identifiers missing: {qvm_missing}')
    return {
        'pak': str(pak), 'teamChatFiles': len(team_files),
        'templateTypes': len(CHAT_TYPES), 'sharedFiles': shared,
        'qvmBytes': len(qvm),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', type=Path)
    args = parser.parse_args()
    source = ROOT / 'Quake-III-Arena-original-source/code/game/ai_chat.c'
    module = ROOT / 'src/mq3/game/bot_chat.ml'
    source_text = source.read_text(encoding='utf-8')
    module_text = module.read_text(encoding='utf-8')
    for symbol in SYMBOLS:
        if re.search(r'\b' + re.escape(symbol) + r'\s*\(', source_text) is None:
            raise RuntimeError(f'Missing source symbol {symbol}')
    missing = [name for name in PORT_FUNCTIONS if re.search(
        rf'^function\s+{re.escape(name)}\s*\(', module_text, re.M) is None]
    if missing:
        raise RuntimeError(f'Missing MiniLang functions: {missing}')

    output = ROOT / 'build/reference/bot_chat'
    output.mkdir(parents=True, exist_ok=True)
    include = output / 'bot_chat_under_test.inc'
    include.write_text('\n\n'.join(extract_function(source_text, n)
                                     for n in ORACLE_FUNCTIONS) + '\n',
                       encoding='utf-8', newline='\n')
    harness = ROOT / 'tests/reference/bot_chat_oracle.c'
    native_exe = output / 'bot_chat_oracle.exe'
    run(['cl', '/nologo', '/O2', '/MT', '/W4',
         '/D_CRT_SECURE_NO_WARNINGS', f'/I{output}', harness,
         f'/Fe:{native_exe}', '/link', '/Brepro'],
        output, msvc_env('x64'), output / 'oracle-build.log')
    native = run([native_exe], output, log=output / 'oracle.log')

    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/bot_chat_oracle.ml', '--output',
                    'bot_chat_oracle.exe'], check=True)
    mini = run([ROOT / 'build/bot_chat_oracle.exe'], ROOT / 'build',
               log=output / 'minilang.log')
    if native != mini:
        raise RuntimeError(f'ai_chat differential mismatch\nnative: {native!r}\nmini: {mini!r}')

    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/bot_chat_contracts.ml', '--output',
                    'bot_chat_contracts.exe'], check=True)
    contracts = run([ROOT / 'build/bot_chat_contracts.exe'], ROOT / 'build',
                    log=output / 'contracts.log').strip()
    match = re.fullmatch(r'PASS: (\d+) ai_chat contracts', contracts)
    if not match or int(match.group(1)) < 28:
        raise RuntimeError(contracts)
    retail = retail_probe(args.data_root.resolve()) if args.data_root else None
    result = {
        'passed': True, 'symbols': len(SYMBOLS),
        'differentialRecords': len(native.splitlines()),
        'contracts': int(match.group(1)), 'retail': retail,
        'sources': {str(p.relative_to(ROOT)).replace('\\', '/'): sha(p)
                    for p in [source, module, harness,
                              ROOT / 'tests/bot_chat_oracle.ml',
                              ROOT / 'tests/bot_chat_contracts.ml']},
    }
    (output / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                        encoding='utf-8', newline='\n')
    retail_text = '' if retail is None else (
        f" + retail ({retail['teamChatFiles']} chat files, "
        f"{retail['templateTypes']} types)")
    print(f"PASS: {len(SYMBOLS)} ai_chat symbols, "
          f"{result['differentialRecords']} exact records, "
          f"{result['contracts']} contracts{retail_text}")


if __name__ == '__main__':
    main()
