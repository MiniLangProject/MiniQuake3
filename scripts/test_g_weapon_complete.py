"""Complete g_weapon.c facade, Missionpack native differential and Retail contracts."""
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


def retail(data_root, out):
    archives = sorted((data_root / 'baseq3').glob('*.pk3'))
    bsp = out / 'q3dm1.bsp'
    qvm = False
    for path in archives:
        with zipfile.ZipFile(path) as archive:
            names = {name.lower(): name for name in archive.namelist()}
            qvm = qvm or 'vm/qagame.qvm' in names
            if not bsp.exists() and 'maps/q3dm1.bsp' in names:
                bsp.write_bytes(archive.read(names['maps/q3dm1.bsp']))
    if not archives or not bsp.exists() or not qvm:
        raise RuntimeError('Retail baseq3 PK3, q3dm1 BSP or qagame QVM missing')
    return bsp, archives


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', default='D:/Quake3')
    args = parser.parse_args()
    out = ROOT / 'build/reference/g_weapon_complete'
    out.mkdir(parents=True, exist_ok=True)
    ledger = json.loads((ROOT / 'PORT_LEDGER.json').read_text(encoding='utf-8'))
    entry = next(item for item in ledger['files'] if item['source'] == 'code/game/g_weapon.c')
    facade = ROOT / 'src/mq3/game/g_weapon.ml'
    text = facade.read_text(encoding='utf-8')
    missing = [name for name in entry['symbol_candidates']
               if re.search(r'\bfunction\s+' + re.escape(name) + r'\s*\(', text) is None]
    if missing:
        raise RuntimeError('g_weapon symbols missing: ' + ', '.join(missing))

    # Existing weapon oracle compiles the selected functions directly from the
    # pinned, unchanged Baseq3 g_weapon.c and compares the production kernels.
    run([sys.executable, ROOT / 'scripts/test_weapons.py', '--case',
         'muzzle_truncation_and_ignored_origin_0'], ROOT, log=out / 'baseq3-unchanged-c.log', timeout=180)

    native_src = ROOT / 'tests/reference/g_weapon_complete_oracle.c'
    native = out / 'g_weapon_complete_oracle.exe'
    run(['cl', '/nologo', '/Od', '/fp:strict', '/MT', native_src,
         '/Fe:' + str(native), '/link', '/OPT:REF', '/Brepro'], out,
        msvc_env('x86'), out / 'oracle-build.log')
    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_weapon_complete_oracle.ml', '--output',
                    'g_weapon_complete_oracle_ml.exe'], check=True)
    empty = out / 'empty.bsp'
    empty.write_bytes(tiny_bsp())
    expected = run([native], out, log=out / 'oracle.log')
    actual = run([ROOT / 'build/g_weapon_complete_oracle_ml.exe', empty],
                 ROOT / 'build', log=out / 'mini-oracle.log')
    if actual != expected:
        raise RuntimeError('Missionpack native differential mismatch\nEXPECTED:\n' + expected + '\nACTUAL:\n' + actual)

    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_weapon_complete_contracts.ml', '--output',
                    'g_weapon_complete_contracts.exe'], check=True)
    contracts = run([ROOT / 'build/g_weapon_complete_contracts.exe', empty],
                    ROOT / 'build', log=out / 'contracts.log').strip()
    if contracts != 'PASS: 18 g_weapon complete contracts':
        raise RuntimeError(contracts)
    retail_bsp, archives = retail(Path(args.data_root), out)
    retail_result = run([ROOT / 'build/g_weapon_complete_contracts.exe', retail_bsp],
                        ROOT / 'build', log=out / 'retail-contracts.log').strip()
    if retail_result != contracts:
        raise RuntimeError(retail_result)

    sources = [ROOT / 'Quake-III-Arena-original-source/code/game/g_weapon.c', facade,
               ROOT / 'src/mq3/game/weapon_state.ml', ROOT / 'src/mq3/game/combat.ml',
               ROOT / 'tests/g_weapon_complete_contracts.ml',
               ROOT / 'tests/g_weapon_complete_oracle.ml', native_src]
    result = dict(passed=True, symbols=len(entry['symbol_candidates']),
                  unchanged_c_cases=1, missionpack_differential_lines=len(expected.splitlines()),
                  contracts=18, retail_contracts=18,
                  retail_map_sha256=sha(retail_bsp),
                  retail_archives={path.name: sha(path) for path in archives},
                  scope='All 27 g_weapon.c symbols. Existing unchanged-C Baseq3 weapon replay plus native Missionpack Nail/Prox/Kamikaze arithmetic, productive contracts on synthetic and Retail q3dm1 BSP, and Retail qagame presence.',
                  sources={path.relative_to(ROOT).as_posix(): sha(path) for path in sources},
                  oracle_sha256=sha(native),
                  test_sha256=sha(ROOT / 'build/g_weapon_complete_contracts.exe'))
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8', newline='\n')
    print(f"PASS: {result['symbols']} g_weapon symbols / {result['unchanged_c_cases']} unchanged-C Baseq3 case / {result['missionpack_differential_lines']} Missionpack lines / {result['contracts']} native + {result['retail_contracts']} Retail contracts")


if __name__ == '__main__':
    main()
