"""Complete symbol/adapter, unchanged-C and retail gate for game/ai_dmq3.c."""
import argparse
import json
import re
import subprocess
import sys
from pathlib import Path
from zipfile import ZipFile

from inventory import sha
from toolchain import ROOT, msvc_env, run

ORACLE_FUNCTIONS = [
    'EntityCarriesFlag', 'EntityIsInvisible', 'EntityIsShooting',
    'EntityIsChatting', 'EntityHasQuad', 'stristr',
]


def ledger_symbols() -> list[str]:
    ledger = json.loads((ROOT / 'PORT_LEDGER.json').read_text(encoding='utf-8'))
    record = next(x for x in ledger['files'] if x['source'] == 'code/game/ai_dmq3.c')
    return record['symbol_candidates']


def extract_function(text: str, name: str) -> str:
    match = re.search(r'^[\w* \t]+\b' + re.escape(name) +
                      r'\s*\([^;{}]*\)\s*\{', text, re.M)
    if not match:
        raise RuntimeError(f'Missing original function {name}')
    depth = 1
    i = match.end()
    string = char = escape = False
    while i < len(text) and depth:
        value = text[i]
        if escape:
            escape = False
        elif value == '\\' and (string or char):
            escape = True
        elif value == '"' and not char:
            string = not string
        elif value == "'" and not string:
            char = not char
        elif not string and not char:
            if value == '{':
                depth += 1
            elif value == '}':
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
        qvm = archive.read('vm/qagame.qvm')
        aas = [n for n in names if n.startswith('maps/') and n.endswith('.aas')]
        botfiles = [n for n in names if n.startswith('botfiles/')]
    identifiers = [
        'Red Flag', 'Blue Flag', 'Quad Damage', 'Regeneration',
        'Battle Suit', 'Invisibility', 'q3tourney6', 'team_redobelisk',
    ]
    missing = [x for x in identifiers if x.encode() + b'\0' not in qvm]
    # Missionpack-only identifiers are intentionally absent from baseq3 QVM;
    # all base AI identifiers must be compiled into the shipped qagame.
    required = [x for x in missing if x not in {'team_redobelisk'}]
    if required:
        raise RuntimeError(f'Retail qagame AI identifiers missing: {required}')
    if not aas or len(botfiles) < 100:
        raise RuntimeError('Retail AAS/bot data set incomplete')
    return {
        'pak': str(pak), 'qvmBytes': len(qvm), 'aasMaps': len(aas),
        'botFiles': len(botfiles), 'compiledIdentifiers': len(identifiers)-len(missing),
        'missionpackOnlyAbsent': missing,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', type=Path)
    args = parser.parse_args()
    source = ROOT / 'Quake-III-Arena-original-source/code/game/ai_dmq3.c'
    module = ROOT / 'src/mq3/game/bot_deathmatch.ml'
    source_text = source.read_text(encoding='utf-8')
    module_text = module.read_text(encoding='utf-8')
    symbols = ledger_symbols()
    source_missing = [s for s in symbols if re.search(
        r'\b' + re.escape(s) + r'\s*\(', source_text) is None]
    if source_missing:
        raise RuntimeError(f'Original ai_dmq3 symbols missing: {source_missing}')
    ports = {m.group(1) for m in re.finditer(r'^function\s+(\w+)', module_text, re.M)}
    missing = [s for s in symbols if s[0].lower() + s[1:] not in ports]
    if missing:
        raise RuntimeError(f'MiniLang ai_dmq3 adapters missing: {missing}')

    output = ROOT / 'build/reference/bot_deathmatch_full'
    output.mkdir(parents=True, exist_ok=True)
    (output / 'bot_deathmatch_under_test.inc').write_text(
        '\n\n'.join(extract_function(source_text, n) for n in ORACLE_FUNCTIONS) + '\n',
        encoding='utf-8', newline='\n')
    harness = ROOT / 'tests/reference/bot_deathmatch_oracle.c'
    native_exe = output / 'bot_deathmatch_oracle.exe'
    run(['cl', '/nologo', '/O2', '/MT', '/W4',
         '/D_CRT_SECURE_NO_WARNINGS', f'/I{output}', harness,
         f'/Fe:{native_exe}', '/link', '/Brepro'], output, msvc_env('x64'),
        output / 'oracle-build.log')
    native = run([native_exe], output, log=output / 'oracle.log')
    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/bot_deathmatch_oracle.ml', '--output',
                    'bot_deathmatch_oracle.exe'], check=True)
    mini = run([ROOT / 'build/bot_deathmatch_oracle.exe'], ROOT / 'build',
               log=output / 'minilang.log')
    if native != mini:
        raise RuntimeError(f'ai_dmq3 differential mismatch\n{native!r}\n{mini!r}')

    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/bot_deathmatch_contracts.ml', '--output',
                    'bot_deathmatch_contracts.exe'], check=True)
    contracts = run([ROOT / 'build/bot_deathmatch_contracts.exe'], ROOT / 'build',
                    log=output / 'contracts.log').strip()
    match = re.fullmatch(r'PASS: (\d+) ai_dmq3 adapter contracts', contracts)
    if not match or int(match.group(1)) < 35:
        raise RuntimeError(contracts)
    retail = retail_probe(args.data_root.resolve()) if args.data_root else None
    paths = [source, module, harness, ROOT / 'tests/bot_deathmatch_oracle.ml',
             ROOT / 'tests/bot_deathmatch_contracts.ml']
    result = {
        'passed': True, 'symbols': len(symbols),
        'differentialRecords': len(native.splitlines()),
        'contracts': int(match.group(1)), 'retail': retail,
        'delegates': [
            'bot_combat_ai', 'bot_inventory_ai', 'bot_navigation',
            'bot_team_helpers', 'bot_lifecycle', 'bot_ai_commands',
        ],
        'sources': {str(p.relative_to(ROOT)).replace('\\', '/'): sha(p)
                    for p in paths},
    }
    (output / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                        encoding='utf-8', newline='\n')
    retail_text = '' if retail is None else (
        f" + retail ({retail['aasMaps']} AAS, {retail['botFiles']} bot files)")
    print(f"PASS: {len(symbols)} ai_dmq3 symbols, "
          f"{result['differentialRecords']} exact records, "
          f"{result['contracts']} contracts{retail_text}")


if __name__ == '__main__':
    main()
