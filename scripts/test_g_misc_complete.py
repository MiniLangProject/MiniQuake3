"""Complete g_misc.c facade, productive dispatch and focused C differentials."""
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


def build_ml(source, output):
    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source', source,
                    '--output', output], cwd=ROOT, check=True)
    return ROOT / 'build' / output


def last_pass(command, cwd, log, timeout=1800):
    value = run(command, cwd, log=log, timeout=timeout).strip().splitlines()[-1]
    if 'PASS:' not in value:
        raise RuntimeError(value)
    return value


def map_differentials(out):
    # Run only the selected unchanged-C oracle records.  The generic map-object
    # driver appends broad contracts after every selected case; those are kept
    # in its own gate and are intentionally not swallowed here.
    import test_map_objects as objects
    from spawn_oracle import build
    from test_bodies import map_bytes
    from test_game_lifecycle import artifact_stem, pack

    target = out / 'map_oracle'
    target.mkdir(parents=True, exist_ok=True)
    build(target, lifecycle=True)
    mini = build_ml('tests/map_object_tests.ml', 'g_misc_map_object_tests.exe')
    native = target / 'spawn_oracle.exe'
    bsp = target / 'empty.bsp'
    bsp.write_bytes(map_bytes())
    build_date = run([native, '--build-date'], target).strip()
    selected = {row['name']: row for row in objects.scenarios()
                if row['name'] in ('portal_mirror', 'portal_camera_fallback')}
    records = []
    for name in ('portal_mirror', 'portal_camera_fallback'):
        scenario = selected[name]
        stem = artifact_stem(name)
        inp, expected = target / (stem + '.bin'), target / (stem + '.expected')
        raw = target / (stem + '.raw.jsonl')
        inp.write_bytes(pack(scenario['actions'], build_date))
        run([native, bsp, inp, expected, '0', '--map-objects', raw], target,
            log=target / (stem + '.oracle.log'))
        parsed = objects.inspect(expected.read_bytes())
        proof = objects.semantic_proof(scenario, parsed)
        output = run([mini, bsp, inp, expected], ROOT / 'build',
                     log=target / (stem + '.test.log'), timeout=600).strip()
        if not re.search(r'PASS: \d+ map-object actions / \d+ exact words / \d+ ordered effects', output):
            raise RuntimeError(output)
        records.append(f'{name}: {output}; assertions={",".join(proof["assertions"])}')
    return records


def retail_maps(data_root, out):
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
                              re.findall(rb'"classname"\s*"([^"]+)"', data[offset:offset + size]))
                maps += 1
                if lowered == 'maps/q3dm1.bsp':
                    selected = data
    if selected is None or not archives:
        raise RuntimeError('Retail q3dm1 BSP/baseq3 PK3 files missing')
    required = ['misc_teleporter_dest', 'misc_portal_surface', 'misc_portal_camera',
                'shooter_grenade', 'func_static']
    missing = [name for name in required if not counts[name]]
    if missing:
        raise RuntimeError('Retail map class proof missing: ' + ', '.join(missing))
    target = out / 'q3dm1.bsp'
    target.write_bytes(selected)
    return target, archives, maps, counts


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', type=Path, default=Path('D:/Quake3'))
    parser.add_argument('--full-regression', action='store_true')
    args = parser.parse_args()
    py_compile.compile(__file__, doraise=True)
    out = ROOT / 'build/reference/g_misc_complete'
    out.mkdir(parents=True, exist_ok=True)

    ledger = json.loads((ROOT / 'PORT_LEDGER.json').read_text(encoding='utf-8'))
    entry = next(row for row in ledger['files'] if row['source'] == 'code/game/g_misc.c')
    facade = ROOT / 'src/mq3/game/g_misc.ml'
    facade_text = facade.read_text(encoding='utf-8')
    missing = [name for name in entry['symbol_candidates']
               if not re.search(r'\bfunction\s+' + re.escape(name) + r'\s*\(', facade_text)]
    if missing:
        raise RuntimeError('missing g_misc ledger symbols: ' + ', '.join(missing))

    original = ROOT / 'Quake-III-Arena-original-source/code/game/g_misc.c'
    original_symbols = sorted(set(re.findall(
        r'^(?:static\s+)?void\s+(\w+)\s*\(', original.read_text(encoding='utf-8'), re.M)))
    missing_original = [name for name in original_symbols
                        if not re.search(r'\bfunction\s+' + re.escape(name) + r'\s*\(', facade_text)]
    if missing_original:
        raise RuntimeError('missing actual g_misc source symbols: ' + ', '.join(missing_original))

    spawn_text = (ROOT / 'src/mq3/game/spawn_functions.ml').read_text(encoding='utf-8')
    for name in ('info_null', 'info_notnull', 'info_camp', 'light', 'misc_model',
                 'misc_teleporter_dest', 'misc_portal_surface', 'misc_portal_camera',
                 'shooter_rocket', 'shooter_grenade', 'shooter_plasma'):
        expected = 'gMisc.SP_' + name + '(level,ent)'
        if expected not in spawn_text:
            raise RuntimeError('productive spawn bypasses g_misc facade: ' + name)
    active_text = (ROOT / 'src/mq3/game/client_active.ml').read_text(encoding='utf-8')
    if 'gMisc.UsePortalHoldable(level,ent)' not in active_text:
        raise RuntimeError('productive Team Arena portal holdable bypasses g_misc facade')
    mover_text = (ROOT / 'src/mq3/game/g_mover.ml').read_text(encoding='utf-8')
    for symbol in ('SP_func_static', 'SP_func_train', 'SP_path_corner'):
        if not re.search(r'\bfunction\s+' + symbol + r'\s*\(', mover_text):
            raise RuntimeError('related mover facade missing ' + symbol)

    tiny = out / 'empty.bsp'
    tiny.write_bytes(tiny_bsp())
    contracts = build_ml('tests/g_misc_complete_contracts.ml', 'g_misc_complete_contracts.exe')
    contract_line = last_pass([contracts, tiny], ROOT / 'build', out / 'contracts.log')
    match = re.search(r'PASS: (\d+) complete g_misc contracts', contract_line)
    if not match:
        raise RuntimeError(contract_line)

    retail, archives, map_count, class_counts = retail_maps(args.data_root, out)
    retail_line = last_pass([contracts, retail], ROOT / 'build', out / 'retail-contracts.log')
    if retail_line != contract_line:
        raise RuntimeError(retail_line)

    # Both suites build the selected functions from the pinned, unchanged C
    # game source and compare their serialized game state to MiniLang.
    differentials = map_differentials(out)
    shooter_output = run([sys.executable, ROOT / 'scripts/test_missiles.py', '--case',
                          'shooter_precision'], ROOT, log=out / 'shooter.log', timeout=3600)
    shooter_lines = [line.strip() for line in shooter_output.splitlines()
                     if line.startswith('shooter_precision: PASS ')]
    if len(shooter_lines) != 1 or 'PASS: 8 missile runtime contracts' not in shooter_output:
        raise RuntimeError('shooter_precision unchanged-C differential failed')
    differentials.append(shooter_lines[0])

    regressions = []
    if args.full_regression:
        regressions.append(last_pass([sys.executable, ROOT / 'scripts/test_transitions.py',
                                      args.data_root, '--map', 'q3dm1'], ROOT,
                                     out / 'teleport-regression.log', 3600))
        regressions.append(last_pass([sys.executable, ROOT / 'scripts/test_spawn.py',
                                      args.data_root, '--map', 'q3dm1'], ROOT,
                                     out / 'spawn-regression.log', 3600))

    paths = [original, facade, ROOT / 'src/mq3/game/active_portals.ml',
             ROOT / 'src/mq3/game/portals.ml', ROOT / 'src/mq3/game/shooters.ml',
             ROOT / 'src/mq3/game/teleport.ml', ROOT / 'src/mq3/game/spawn_functions.ml',
             ROOT / 'src/mq3/game/client_active.ml', ROOT / 'src/mq3/game/g_mover.ml',
             ROOT / 'tests/g_misc_complete_contracts.ml', Path(__file__)]
    result = dict(
        passed=True, ledger_symbols=len(entry['symbol_candidates']),
        actual_original_symbols=len(original_symbols), contracts=int(match.group(1)),
        retail_contracts=int(match.group(1)), differential_gates=differentials,
        regressions=regressions, retail_maps=map_count,
        retail_class_counts={name: class_counts[name] for name in
                             ('misc_teleporter_dest', 'misc_portal_surface',
                              'misc_portal_camera', 'shooter_grenade', 'func_static')},
        retail_map_sha256=sha(retail),
        retail_archives={path.name: sha(path) for path in archives},
        scope=('Every actual Baseq3/Team Arena g_misc.c function and all 20 historical '
               'ledger candidates through the C-named facade. Productive map spawns and '
               'the portal holdable event enter the facade; static/train/path remain '
               'owned by the complete g_mover facade. func_explosive does not exist in '
               'the pinned original source.'),
        sources={path.relative_to(ROOT).as_posix(): sha(path) for path in paths})
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                    encoding='utf-8', newline='\n')
    print(f"PASS: {result['ledger_symbols']} ledger/"
          f"{result['actual_original_symbols']} actual g_misc symbols + "
          f"{result['contracts']} native/Retail contracts + "
          f"{len(differentials)} unchanged-C gates + {map_count} Retail maps")


if __name__ == '__main__':
    main()
