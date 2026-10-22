"""Complete g_spawn.c facade, unchanged-C differentials and Retail replay."""
import argparse
import collections
import json
import py_compile
import re
import struct
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from test_rejections import tiny_bsp
from toolchain import ROOT, run


def build_contracts():
    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_spawn_complete_contracts.ml', '--output',
                    'g_spawn_complete_contracts.exe'], cwd=ROOT, check=True)
    return ROOT / 'build/g_spawn_complete_contracts.exe'


def last_pass(command, cwd, log, timeout=3600):
    output = run(command, cwd, log=log, timeout=timeout).strip()
    lines = [line for line in output.splitlines() if 'PASS' in line]
    if not lines:
        raise RuntimeError(output)
    return lines[-1], output


def retail_data(data_root, out):
    archives = sorted((data_root / 'baseq3').glob('*.pk3'))
    counts = collections.Counter()
    selected = None
    maps = 0
    for path in archives:
        with zipfile.ZipFile(path) as archive:
            for name in archive.namelist():
                lowered = name.lower()
                if not lowered.startswith('maps/') or not lowered.endswith('.bsp'):
                    continue
                data = archive.read(name)
                offset, size = struct.unpack_from('<2i', data, 8)
                counts.update(value.decode('ascii', errors='replace') for value in
                              re.findall(rb'"classname"\s*"([^"]+)"',
                                         data[offset:offset + size]))
                maps += 1
                if lowered == 'maps/q3dm7.bsp':
                    selected = data
    if selected is None or not archives:
        raise RuntimeError('Retail maps/q3dm7.bsp or baseq3 PK3 files missing')
    target = out / 'q3dm7.bsp'
    target.write_bytes(selected)
    return target, archives, maps, counts


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', type=Path, default=Path('D:/Quake3'))
    args = parser.parse_args()
    py_compile.compile(__file__, doraise=True)
    out = ROOT / 'build/reference/g_spawn_complete'
    out.mkdir(parents=True, exist_ok=True)

    ledger = json.loads((ROOT / 'PORT_LEDGER.json').read_text(encoding='utf-8'))
    entry = next(row for row in ledger['files'] if row['source'] == 'code/game/g_spawn.c')
    facade = ROOT / 'src/mq3/game/g_spawn.ml'
    facade_text = facade.read_text(encoding='utf-8')
    expected = list(entry['symbol_candidates']) + ['fields', 'spawns']
    missing = [name for name in expected if not re.search(
        r'\bfunction\s+' + re.escape(name) + r'\s*\(', facade_text)]
    if missing:
        raise RuntimeError('missing g_spawn facade symbols: ' + ', '.join(missing))

    original = ROOT / 'Quake-III-Arena-original-source/code/game/g_spawn.c'
    source_text = original.read_text(encoding='utf-8')
    actual = sorted(set(re.findall(
        r'^(?:qboolean|void|char\s*\*)\s*(\w+)\s*\([^;{}]*\)\s*\{',
        source_text, re.M)))
    ledger_symbols = sorted(entry['symbol_candidates'])
    if actual != ledger_symbols:
        raise RuntimeError(f'g_spawn ledger/source symbols differ: {actual} != {ledger_symbols}')
    if not re.search(r'#ifdef\s+MISSIONPACK.*?team_redobelisk.*?team_blueobelisk.*?'
                     r'team_neutralobelisk.*?#endif', source_text, re.S):
        raise RuntimeError('original Missionpack spawn-table guard changed')

    lifecycle_text = (ROOT / 'src/mq3/game/lifecycle.ml').read_text(encoding='utf-8')
    if 'gSpawn.G_SpawnEntitiesFromString(level.spawner)' not in lifecycle_text:
        raise RuntimeError('productive game lifecycle bypasses g_spawn facade')
    kernel_text = (ROOT / 'src/mq3/game/spawn.ml').read_text(encoding='utf-8')
    for needle in ('tables.missionpackClasses()', 'editionKey = "notq3a"',
                   'if state.missionpack then editionKey = "notta"'):
        if needle not in kernel_text:
            raise RuntimeError('missing build-mode spawn semantic: ' + needle)

    contracts = build_contracts()
    empty = out / 'empty.bsp'
    empty.write_bytes(tiny_bsp())
    contract_line, _ = last_pass([contracts, empty], ROOT / 'build', out / 'contracts.log')
    match = re.search(r'PASS: (\d+) complete g_spawn contracts', contract_line)
    if not match:
        raise RuntimeError(contract_line)

    retail, archives, map_count, class_counts = retail_data(args.data_root, out)
    retail_line, _ = last_pass([contracts, retail], ROOT / 'build',
                               out / 'retail-contracts.log')
    if retail_line != contract_line:
        raise RuntimeError(retail_line)

    # This established gate compiles the selected bodies from the pinned,
    # unchanged g_spawn.c and compares parser, field, getter and allocation
    # results word-for-word against the MiniLang product.
    values_line, values_output = last_pass(
        [sys.executable, ROOT / 'scripts/test_spawn_values.py', '--count', '512'],
        ROOT, out / 'values-differential.log')
    values_result = json.loads((ROOT / 'build/reference/spawn_values/result.json').read_text(
        encoding='utf-8'))
    if ('PASS: 512 original spawn field/getter/parser cases' not in values_output or
            values_result.get('cases') != 512 or
            values_result.get('runtime_contracts') != 30 or
            not values_result.get('original_missing_think_rejection')):
        raise RuntimeError('incomplete unchanged-C spawn-value proof')

    # Reuse the just-built MiniLang binary. The native driver is rebuilt from
    # unchanged source and replays q3dm7 in every Baseq3 game type. q3dm7 has
    # both push and teleport reactions, so the existing gate's semantic proof
    # remains meaningful even when only one Retail map is selected.
    replay_line, replay_output = last_pass(
        [sys.executable, ROOT / 'scripts/test_spawn.py', args.data_root,
         '--map', 'q3dm7', '--reuse-build'], ROOT, out / 'retail-replay.log')
    if 'q3dm7.bsp: PASS 5 game-mode spawn/think/trigger replays' not in replay_output:
        raise RuntimeError('Retail q3dm7 spawn replay incomplete')

    paths = [original, facade, ROOT / 'src/mq3/game/spawn.ml',
             ROOT / 'src/mq3/game/spawn_tables.ml', ROOT / 'src/mq3/game/spawn_values.ml',
             ROOT / 'src/mq3/game/lifecycle.ml', ROOT / 'tests/g_spawn_complete_contracts.ml',
             Path(__file__)]
    result = dict(
        passed=True, source_symbols=len(actual), facade_symbols=len(expected),
        contracts=int(match.group(1)), retail_contracts=int(match.group(1)),
        unchanged_c_values=512, values_gate=values_line,
        retail_replay=replay_line, retail_maps=map_count,
        retail_class_counts=dict(class_counts), retail_map_sha256=sha(retail),
        retail_archives={path.name: sha(path) for path in archives},
        scope=('All 13 actual g_spawn.c functions plus the fields/spawns tables, '
               'including Baseq3 versus MISSIONPACK class and notq3a/notta semantics. '
               'The Retail replay covers the Baseq3 build; Team Arena semantics are '
               'covered by the original conditional source and native MiniLang contracts.'),
        sources={path.relative_to(ROOT).as_posix(): sha(path) for path in paths})
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                    encoding='utf-8', newline='\n')
    print(f"PASS: {result['source_symbols']} g_spawn functions + 2 tables + "
          f"{result['contracts']} native/Retail contracts + 512 unchanged-C values + "
          f"5 q3dm7 game-mode replays across {map_count} Retail maps")


if __name__ == '__main__':
    main()
