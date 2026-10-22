"""Complete g_client.c facade, unchanged-C differential and Retail contracts."""
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


def build_ml(source, output):
    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source', source,
                    '--output', output], cwd=ROOT, check=True)
    return ROOT / 'build' / output


def retail_assets(data_root, out):
    archives = sorted((data_root / 'baseq3').glob('*.pk3'))
    qvm = out / 'qagame.qvm'
    bsp = out / 'q3dm1.bsp'
    for path in archives:
        with zipfile.ZipFile(path) as archive:
            names = {name.lower(): name for name in archive.namelist()}
            if not qvm.exists() and 'vm/qagame.qvm' in names:
                qvm.write_bytes(archive.read(names['vm/qagame.qvm']))
            if not bsp.exists() and 'maps/q3dm1.bsp' in names:
                bsp.write_bytes(archive.read(names['maps/q3dm1.bsp']))
    if not qvm.exists() or not bsp.exists():
        raise RuntimeError('Retail qagame.qvm or q3dm1.bsp missing')
    return bsp, qvm, archives


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', type=Path, default=Path('D:/Quake3'))
    parser.add_argument('--full-regression', action='store_true')
    args = parser.parse_args()
    py_compile.compile(__file__, doraise=True)
    out = ROOT / 'build/reference/g_client_complete'
    out.mkdir(parents=True, exist_ok=True)

    ledger = json.loads((ROOT / 'PORT_LEDGER.json').read_text(encoding='utf-8'))
    entry = next(row for row in ledger['files'] if row['source'] == 'code/game/g_client.c')
    facade = ROOT / 'src/mq3/game/g_client.ml'
    text = facade.read_text(encoding='utf-8')
    missing = [name for name in entry['symbol_candidates']
               if not re.search(r'\bfunction\s+' + re.escape(name) + r'\s*\(', text)]
    if missing:
        raise RuntimeError('g_client symbols missing: ' + ', '.join(missing))

    gmain = (ROOT / 'src/mq3/game/g_main.ml').read_text(encoding='utf-8')
    lifecycle = (ROOT / 'src/mq3/game/lifecycle.ml').read_text(encoding='utf-8')
    required = ['gClient.ClientConnect', 'gClient.ClientUserinfoChanged',
                'gClient.ClientDisconnect', 'gClient.ClientBegin']
    if any(name not in gmain for name in required) or 'gClient.ClientConnect' not in lifecycle:
        raise RuntimeError('productive qagame path bypasses g_client facade')

    # This existing focused suite extracts the functions directly from the
    # pinned g_client.c and compiles them unchanged into the native oracle.
    differential = run([sys.executable, ROOT / 'scripts/test_client_info.py',
                        '--case', 'clean_name_capacity_36'], ROOT,
                       log=out / 'unchanged-c.log', timeout=1800)
    if 'PASS:' not in differential:
        raise RuntimeError(differential)

    contract = build_ml('tests/g_client_complete_contracts.ml', 'g_client_complete_contracts.exe')
    empty = out / 'empty.bsp'
    empty.write_bytes(tiny_bsp())
    native_line = run([contract, empty], ROOT / 'build', log=out / 'contracts.log').strip()
    if native_line != 'PASS: 12 g_client complete contracts':
        raise RuntimeError(native_line)

    bsp, qvm, archives = retail_assets(args.data_root, out)
    retail_line = run([contract, bsp], ROOT / 'build', log=out / 'retail-contracts.log').strip()
    if retail_line != native_line:
        raise RuntimeError(retail_line)

    regressions = []
    if args.full_regression:
        commands = [
            [sys.executable, ROOT / 'scripts/test_client_spawn.py'],
            [sys.executable, ROOT / 'scripts/test_client_begin.py'],
            [sys.executable, ROOT / 'scripts/test_client_connect.py'],
            [sys.executable, ROOT / 'scripts/test_bodies.py', '--data-root', args.data_root],
            [sys.executable, ROOT / 'scripts/test_deaths.py'],
            [sys.executable, ROOT / 'scripts/test_game_vm_lifecycle.py'],
        ]
        for index, command in enumerate(commands):
            output = run(command, ROOT, log=out / f'regression-{index}.log', timeout=3600)
            last = output.strip().splitlines()[-1]
            if 'PASS:' not in last:
                raise RuntimeError(last)
            regressions.append(last)

    paths = [ROOT / 'Quake-III-Arena-original-source/code/game/g_client.c', facade,
             ROOT / 'src/mq3/game/g_main.ml', ROOT / 'src/mq3/game/lifecycle.ml',
             ROOT / 'tests/g_client_complete_contracts.ml']
    result = {
        'passed': True,
        'symbols': len(entry['symbol_candidates']),
        'unchanged_c_suite': 'clean_name_capacity_36',
        'contracts': 12,
        'retail_contracts': 12,
        'retail_qagame_sha256': sha(qvm),
        'retail_map_sha256': sha(bsp),
        'retail_archives': {path.name: sha(path) for path in archives},
        'regressions': regressions,
        'scope': ('All ledger symbols and productive qagame connect/begin/userinfo/disconnect routing. '
                  'Existing unchanged-C suites remain the authoritative exhaustive differentials for '
                  'spawn, body queue, lifecycle, session and disconnect behavior.'),
        'sources': {path.relative_to(ROOT).as_posix(): sha(path) for path in paths},
    }
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8', newline='\n')
    print(f"PASS: {result['symbols']} g_client symbols + unchanged-C differential + "
          f"{result['contracts']} native + {result['retail_contracts']} Retail contracts")


if __name__ == '__main__':
    main()
