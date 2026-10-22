"""Full symbol, unchanged-C, native contract and retail gates for ui/ui_main.c."""
import argparse
import json
import re
import subprocess
import sys
from pathlib import Path
from zipfile import ZipFile

from inventory import sha
from toolchain import ROOT, msvc_env, run


def ledger_symbols() -> list[str]:
    ledger = json.loads((ROOT / 'PORT_LEDGER.json').read_text(encoding='utf-8'))
    return next(row['symbol_candidates'] for row in ledger['files']
                if row.get('source') == 'code/ui/ui_main.c')


def extract_unchanged(source: Path, names: list[str]) -> str:
    text = source.read_text(encoding='utf-8')
    result = []
    for name in names:
        match = re.search(r'^[\w* \t]+\b' + re.escape(name) +
                          r'\s*\([^;{}]*\)\s*\{', text, re.M)
        if not match:
            raise RuntimeError(f'Missing original function {name}')
        close = re.search(r'^\}\s*$', text[match.end():], re.M)
        if not close:
            raise RuntimeError(f'Missing close for original function {name}')
        result.append(text[match.start():match.end() + close.end()])
    return '\n\n'.join(result) + '\n'


def check_cvars(source_text: str, port_text: str) -> int:
    table = re.search(r'cvarTable_t\s+cvarTable\[\]\s*=\s*\{(.*?)\n\};',
                      source_text, re.S)
    if not table:
        raise RuntimeError('Original cvarTable not found')
    rows = re.findall(r'\{\s*&?[^,]+,\s*"([^"]+)"\s*,\s*"([^"]*)"\s*,',
                      table.group(1))
    generated = {f'server{i}' for i in range(1, 17)}
    generated |= {f'{prefix}{i}' for prefix in ('ui_redteam', 'ui_blueteam')
                  for i in range(1, 6)}
    missing = [name for name, _ in rows
               if f'"{name}"' not in port_text and name not in generated]
    if missing:
        raise RuntimeError(f'Missing original UI cvars: {missing}')
    if len(rows) != 110:
        raise RuntimeError(f'Expected 110 original UI cvars, got {len(rows)}')
    return len(rows)


def retail_probe(data_root: Path) -> dict:
    pak = data_root / 'baseq3' / 'pak0.pk3'
    if not pak.is_file():
        raise RuntimeError(f'Retail pak missing: {pak}')
    with ZipFile(pak) as archive:
        names = set(archive.namelist())
        required = {'vm/ui.qvm', 'scripts/arenas.txt', 'scripts/bots.txt'}
        missing = sorted(required - names)
        if missing:
            raise RuntimeError(f'Retail UI data missing: {missing}')
        qvm = archive.read('vm/ui.qvm')
        arena = archive.read('scripts/arenas.txt')
        bots = archive.read('scripts/bots.txt')
    command_ids = ['globalservers', 'localservers', 'ui_cache']
    missing_ids = [value for value in command_ids if value.encode() not in qvm]
    if missing_ids:
        raise RuntimeError(f'Retail ui.qvm commands missing: {missing_ids}')
    if b'q3dm1' not in arena or b'Sarge' not in bots:
        raise RuntimeError('Retail arena/bot catalogs failed semantic probe')
    return {'pak': str(pak), 'uiQvmBytes': len(qvm), 'arenaBytes': len(arena),
            'botBytes': len(bots), 'commands': command_ids}


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', type=Path)
    args = parser.parse_args()
    source = ROOT / 'Quake-III-Arena-original-source/code/ui/ui_main.c'
    module = ROOT / 'src/mq3/client/ui_main_missionpack.ml'
    source_text = source.read_text(encoding='utf-8')
    port_text = module.read_text(encoding='utf-8')
    symbols = ledger_symbols()
    missing = [name for name in symbols if not re.search(
        rf'^function\s+{re.escape(name)}\s*\(', port_text, re.M)]
    if missing:
        raise RuntimeError(f'Missing MiniLang symbols: {missing}')
    cvars = check_cvars(source_text, port_text)

    output = ROOT / 'build/reference/ui_main_missionpack'
    output.mkdir(parents=True, exist_ok=True)
    oracle_names = ['vmMain', 'stristr', 'UI_ReadableSize', 'UI_PrintTime']
    include = output / 'ui_main_missionpack_under_test.inc'
    include.write_text(extract_unchanged(source, oracle_names), encoding='utf-8',
                       newline='\n')
    harness = ROOT / 'tests/reference/ui_main_missionpack_oracle.c'
    native_exe = output / 'ui_main_missionpack_oracle.exe'
    run(['cl', '/nologo', '/O2', '/MT', '/W4',
         '/D_CRT_SECURE_NO_WARNINGS', f'/I{output}', harness,
         f'/Fe:{native_exe}', '/link', '/Brepro'], output, msvc_env('x64'),
        output / 'oracle-build.log')
    native = run([native_exe], output, log=output / 'oracle.log')
    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/ui_main_missionpack_oracle.ml', '--output',
                    'ui_main_missionpack_oracle.exe'], check=True)
    mini = run([ROOT / 'build/ui_main_missionpack_oracle.exe'], ROOT / 'build',
               log=output / 'minilang.log')
    if native != mini:
        raise RuntimeError(f'ui_main differential mismatch\nnative={native!r}\nmini={mini!r}')

    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/ui_main_missionpack_contracts.ml', '--output',
                    'ui_main_missionpack_contracts.exe'], check=True)
    contracts = run([ROOT / 'build/ui_main_missionpack_contracts.exe'],
                    ROOT / 'build', log=output / 'contracts.log').strip()
    if contracts != 'PASS: 42 ui_main missionpack contracts':
        raise RuntimeError(contracts)
    retail = retail_probe(args.data_root.resolve()) if args.data_root else None
    files = [source, module, harness, ROOT / 'tests/ui_main_missionpack_oracle.ml',
             ROOT / 'tests/ui_main_missionpack_contracts.ml']
    result = {'passed': True, 'symbols': len(symbols), 'cvars': cvars,
              'differentialRecords': len(native.splitlines()), 'contracts': 42,
              'retail': retail,
              'sources': {str(path.relative_to(ROOT)).replace('\\', '/'): sha(path)
                          for path in files}}
    (output / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                        encoding='utf-8', newline='\n')
    retail_text = '' if retail is None else ' + retail ui.qvm/arena/bot catalogs'
    print(f"PASS: {len(symbols)} ui_main symbols, {cvars} cvars, "
          f"{result['differentialRecords']} exact records, 42 contracts{retail_text}")


if __name__ == '__main__':
    main()
