"""Complete g_target.c facade, unchanged-C differentials and Retail map probe."""
import argparse
import json
import py_compile
import re
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from test_rejections import tiny_bsp
from toolchain import ROOT, run


def build_contracts():
    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_target_complete_contracts.ml', '--output',
                    'g_target_complete_contracts.exe'], cwd=ROOT, check=True)
    return ROOT / 'build/g_target_complete_contracts.exe'


def retail_bsp(data_root, out):
    destination = out / 'q3dm1.bsp'
    archives = sorted((data_root / 'baseq3').glob('*.pk3'))
    for path in archives:
        with zipfile.ZipFile(path) as archive:
            names = {name.lower(): name for name in archive.namelist()}
            if 'maps/q3dm1.bsp' in names:
                destination.write_bytes(archive.read(names['maps/q3dm1.bsp']))
                return destination, archives
    raise RuntimeError('Retail maps/q3dm1.bsp missing from baseq3 PK3 files')


def last_pass(command, cwd, log, timeout=1800):
    value = run(command, cwd, log=log, timeout=timeout).strip().splitlines()[-1]
    if 'PASS' not in value:
        raise RuntimeError(value)
    return value


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', type=Path, default=Path('D:/Quake3'))
    parser.add_argument('--full-regression', action='store_true')
    args = parser.parse_args()
    py_compile.compile(__file__, doraise=True)
    out = ROOT / 'build/reference/g_target_complete'
    out.mkdir(parents=True, exist_ok=True)

    ledger = json.loads((ROOT / 'PORT_LEDGER.json').read_text(encoding='utf-8'))
    entry = next(row for row in ledger['files'] if row['source'] == 'code/game/g_target.c')
    symbols = entry['symbol_candidates']
    facade = ROOT / 'src/mq3/game/g_target.ml'
    text = facade.read_text(encoding='utf-8')
    missing = [name for name in symbols if re.search(r'\bfunction\s+' + re.escape(name) + r'\s*\(', text) is None]
    if missing:
        raise RuntimeError('missing g_target symbols: ' + ', '.join(missing))
    source = (ROOT / entry['source'].replace('code/', 'Quake-III-Arena-original-source/code/', 1)).read_text(encoding='utf-8')
    source_symbols = re.findall(r'^(?:static\s+)?(?:void|int|qboolean|gentity_t\s*\*)\s+(\w+)\s*\(', source, re.M)
    if sorted(set(source_symbols)) != sorted(symbols):
        raise RuntimeError('ledger/source g_target symbol set differs')

    spawn_text = (ROOT / 'src/mq3/game/spawn_functions.ml').read_text(encoding='utf-8')
    required_spawns = ['give', 'remove_powerups', 'delay', 'score', 'print', 'speaker', 'laser',
                       'teleporter', 'relay', 'kill', 'position', 'location']
    bypassed = [name for name in required_spawns
                if f'gTarget.SP_target_{name}(level,ent)' not in spawn_text]
    if bypassed:
        raise RuntimeError('productive target spawns bypass facade: ' + ', '.join(bypassed))

    contracts = build_contracts()
    empty = out / 'empty.bsp'
    empty.write_bytes(tiny_bsp())
    contract_line = last_pass([contracts, empty], ROOT / 'build', out / 'contracts.log')
    match = re.search(r'PASS: (\d+) complete g_target contracts', contract_line)
    if not match:
        raise RuntimeError(contract_line)

    retail, archives = retail_bsp(args.data_root, out)
    retail_line = last_pass([contracts, retail], ROOT / 'build', out / 'retail-contracts.log')
    if retail_line != contract_line:
        raise RuntimeError(retail_line)

    # This established suite extracts the 28 named bodies from the unchanged
    # upstream g_target.c into its MSVC oracle and compares target chains,
    # callbacks, speakers, locations, teleporters and laser state word-for-word.
    differentials = [last_pass([sys.executable, ROOT / 'scripts/test_targets.py'], ROOT,
                               out / 'targets-differential.log')]
    # Map target item/flag/score/print callbacks are also exercised through
    # unchanged g_target.c. One focused case per independently delegated family
    # keeps this gate bounded; the complete suite remains in verify.py.
    cases = ['target_give_real_target_chain', 'target_remove_priority_7',
             'target_score_spawn_count_20', 'target_print_flags_7']
    for index, case in enumerate(cases):
        command = [sys.executable, ROOT / 'scripts/test_map_objects.py', '--case', case]
        if index:
            command.append('--reuse-build')
        differentials.append(last_pass(command, ROOT, out / f'map-target-{index}.log'))

    retail_replays = []
    if args.full_regression:
        retail_replays.append(last_pass([sys.executable, ROOT / 'scripts/test_spawn.py',
                                         args.data_root, '--map', 'q3dm1'], ROOT,
                                        out / 'retail-spawn.log', timeout=3600))

    sources = [ROOT / 'Quake-III-Arena-original-source/code/game/g_target.c', facade,
               ROOT / 'src/mq3/game/targets.ml', ROOT / 'src/mq3/game/map_targets.ml',
               ROOT / 'src/mq3/game/hazards.ml', ROOT / 'src/mq3/game/spawn_functions.ml',
               ROOT / 'tests/g_target_complete_contracts.ml', Path(__file__)]
    result = dict(passed=True, symbols=len(symbols), contracts=int(match.group(1)),
                  retail_contracts=int(match.group(1)), differential_gates=differentials,
                  retail_spawn_replays=retail_replays, retail_map_sha256=sha(retail),
                  retail_archives={p.name: sha(p) for p in archives},
                  scope='All 28 Baseq3 g_target.c symbols and all twelve target_* spawn classes. target_push belongs to g_trigger.c; Baseq3 has no target_counter function/entity.',
                  sources={p.relative_to(ROOT).as_posix(): sha(p) for p in sources})
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8', newline='\n')
    print(f"PASS: {len(symbols)} g_target symbols + {result['contracts']} native/retail contracts + {len(differentials)} unchanged-C differential gates + {len(retail_replays)} retail replays")


if __name__ == '__main__':
    main()
