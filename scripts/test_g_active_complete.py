"""Complete g_active.c facade, unchanged-C helper and Missionpack contracts."""
import argparse
import json
import re
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from test_rejections import tiny_bsp
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


def build_ml(source, output):
    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source', source,
                    '--output', output], cwd=ROOT, check=True)
    return ROOT / 'build' / output


def retail(data_root, out):
    archives = sorted((data_root / 'baseq3').glob('*.pk3'))
    if not archives:
        raise RuntimeError('No Retail baseq3/*.pk3 archives')
    bsp = out / 'q3dm1.bsp'
    qvm = False
    for path in archives:
        with zipfile.ZipFile(path) as archive:
            names = {name.lower(): name for name in archive.namelist()}
            qvm = qvm or 'vm/qagame.qvm' in names
            if not bsp.exists() and 'maps/q3dm1.bsp' in names:
                bsp.write_bytes(archive.read(names['maps/q3dm1.bsp']))
    if not bsp.exists() or not qvm:
        raise RuntimeError('Retail q3dm1 BSP or qagame QVM missing')
    return bsp, archives


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', type=Path, default=Path('D:/Quake3'))
    parser.add_argument('--full-regression', action='store_true')
    args = parser.parse_args()
    out = ROOT / 'build/reference/g_active_complete'
    out.mkdir(parents=True, exist_ok=True)

    original = ROOT / 'Quake-III-Arena-original-source/code/game/g_active.c'
    facade = ROOT / 'src/mq3/game/g_active.ml'
    ledger = json.loads((ROOT / 'PORT_LEDGER.json').read_text(encoding='utf-8'))
    entry = next(row for row in ledger['files'] if row['source'] == 'code/game/g_active.c')
    source = facade.read_text(encoding='utf-8')
    missing = [name for name in entry['symbol_candidates']
               if re.search(r'\bfunction\s+' + re.escape(name) + r'\s*\(', source) is None]
    if missing:
        raise RuntimeError('g_active symbols missing: ' + ', '.join(missing))

    include = out / 'g_active_stuck_under_test.inc'
    include.write_text(extract(original, ['StuckInOtherClient']), encoding='utf-8', newline='\n')
    harness = ROOT / 'tests/reference/g_active_complete_oracle.c'
    oracle = out / 'g_active_complete_oracle.exe'
    run(['cl', '/nologo', '/O2', '/fp:strict', '/MT', '/W4', f'/I{out}', harness,
         f'/Fe:{oracle}', '/link', '/Brepro'], out, msvc_env('x64'), out / 'oracle-build.log')
    native = run([oracle], out, log=out / 'oracle.log')

    empty = out / 'empty.bsp'
    empty.write_bytes(tiny_bsp())
    mini_oracle = build_ml('tests/g_active_complete_oracle.ml', 'g_active_complete_oracle_ml.exe')
    actual = run([mini_oracle, empty], ROOT / 'build', log=out / 'mini-oracle.log')
    if actual != native:
        raise RuntimeError('unchanged-C StuckInOtherClient mismatch\nC: ' + repr(native) + '\nMiniLang: ' + repr(actual))

    contracts_exe = build_ml('tests/g_active_complete_contracts.ml', 'g_active_complete_contracts.exe')
    contracts = run([contracts_exe, empty], ROOT / 'build', log=out / 'contracts.log').strip()
    if contracts != 'PASS: 11 complete g_active Missionpack contracts':
        raise RuntimeError(contracts)

    retail_bsp, archives = retail(args.data_root, out)
    retail_contracts = run([contracts_exe, retail_bsp], ROOT / 'build', log=out / 'retail-contracts.log').strip()
    if retail_contracts != contracts:
        raise RuntimeError(retail_contracts)

    regressions = []
    if args.full_regression:
        for index, command in enumerate((
            [sys.executable, ROOT / 'scripts/test_client_think.py'],
            [sys.executable, ROOT / 'scripts/test_client_frame.py'],
            [sys.executable, ROOT / 'scripts/test_follow_tournament.py'],
        )):
            value = run(command, ROOT, log=out / f'regression-{index}.log', timeout=900).strip().splitlines()[-1]
            if 'PASS:' not in value:
                raise RuntimeError(value)
            regressions.append(value)

    sources = [original, facade, ROOT / 'src/mq3/game/client_active.ml',
               ROOT / 'src/mq3/game/client_frame.ml', ROOT / 'src/mq3/game/active_portals.ml',
               ROOT / 'src/mq3/game/entities.ml', ROOT / 'src/mq3/game/spawn.ml', harness,
               ROOT / 'tests/g_active_complete_oracle.ml', ROOT / 'tests/g_active_complete_contracts.ml']
    result = dict(passed=True, symbols=len(entry['symbol_candidates']), unchanged_c_records=5,
                  contracts=11, retail_contracts=11, regressions=regressions,
                  retail_map_sha256=sha(retail_bsp),
                  retail_archives={path.name: sha(path) for path in archives},
                  scope=('All g_active.c names through a C-compatible facade; existing unchanged-C Baseq3 ClientThink/ClientEndFrame suites remain authoritative. '
                         'This completion gate adds verbatim StuckInOtherClient differential coverage and productive Team Arena Guard/Scout/Doubler/Ammo Regen, '
                         'Invulnerability, Harvester, Kamikaze, Portal and queued single-player intermission contracts on synthetic and Retail q3dm1 BSPs.'),
                  sources={str(path.relative_to(ROOT)).replace('\\', '/'): sha(path) for path in sources},
                  oracle_sha256=sha(oracle), test_sha256=sha(contracts_exe))
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8', newline='\n')
    print(f"PASS: {result['symbols']} g_active symbols + 5 unchanged-C records + 11 native + 11 Retail Missionpack contracts")


if __name__ == '__main__':
    main()
