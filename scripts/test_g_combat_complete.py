"""Complete g_combat.c facade, unchanged-C helper differential and Retail contracts."""
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
    out = ROOT / 'build/reference/g_combat_complete'
    out.mkdir(parents=True, exist_ok=True)
    ledger = json.loads((ROOT / 'PORT_LEDGER.json').read_text(encoding='utf-8'))
    entry = next(item for item in ledger['files'] if item['source'] == 'code/game/g_combat.c')
    facade = ROOT / 'src/mq3/game/g_combat.ml'
    text = facade.read_text(encoding='utf-8')
    missing = [name for name in entry['symbol_candidates']
               if re.search(r'\bfunction\s+' + re.escape(name) + r'\s*\(', text) is None]
    if missing:
        raise RuntimeError('g_combat symbols missing: ' + ', '.join(missing))

    native_src = ROOT / 'tests/reference/g_combat_complete_oracle.c'
    native = out / 'g_combat_complete_oracle.exe'
    run(['cl', '/nologo', '/Od', '/fp:strict', '/MT', native_src,
         '/Fe:' + str(native), '/link', '/OPT:REF', '/Brepro'], out,
        msvc_env('x86'), out / 'oracle-build.log')
    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_combat_complete_oracle.ml', '--output',
                    'g_combat_complete_oracle_ml.exe'], check=True)
    expected = run([native], out, log=out / 'oracle.log')
    actual = run([ROOT / 'build/g_combat_complete_oracle_ml.exe'], ROOT / 'build',
                 log=out / 'mini-oracle.log')
    if actual != expected:
        raise RuntimeError('RaySphere unchanged-C differential mismatch')

    # The established Baseq3 harness compiles the pinned g_combat.c itself.
    subprocess.run([sys.executable, ROOT / 'scripts/test_combat.py', '--case',
                    'protection_and_self', '--reuse-build'], check=True)
    subprocess.run([sys.executable, ROOT / 'scripts/test_deaths.py', '--case',
                    'damage_to_player_die', '--reuse-build'], check=True)

    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_combat_complete_contracts.ml', '--output',
                    'g_combat_complete_contracts.exe'], check=True)
    empty = out / 'empty.bsp'
    empty.write_bytes(tiny_bsp())
    contracts = run([ROOT / 'build/g_combat_complete_contracts.exe', empty],
                    ROOT / 'build', log=out / 'contracts.log').strip()
    if contracts != 'PASS: 20 g_combat complete contracts':
        raise RuntimeError(contracts)
    retail_bsp, archives = retail(Path(args.data_root), out)
    retail_contracts = run([ROOT / 'build/g_combat_complete_contracts.exe', retail_bsp],
                           ROOT / 'build', log=out / 'retail-contracts.log').strip()
    if retail_contracts != contracts:
        raise RuntimeError(retail_contracts)

    sources = [ROOT / 'Quake-III-Arena-original-source/code/game/g_combat.c', facade,
               ROOT / 'src/mq3/game/combat.ml', ROOT / 'src/mq3/game/combat_missionpack.ml',
               ROOT / 'src/mq3/game/deaths.ml', ROOT / 'src/mq3/game/entities.ml',
               ROOT / 'tests/g_combat_complete_contracts.ml',
               ROOT / 'tests/g_combat_complete_oracle.ml', native_src]
    result = dict(passed=True, symbols=len(entry['symbol_candidates']),
                  ray_sphere_differential_cases=len(expected.splitlines()),
                  unchanged_c_baseq3_cases=2, contracts=20, retail_contracts=20,
                  retail_map_sha256=sha(retail_bsp),
                  retail_archives={p.name: sha(p) for p in archives},
                  scope='All 19 g_combat.c symbols. Established unchanged-source Baseq3 damage/death replays, bit-exact RaySphere helper differential, productive Team Arena invulnerability/Guard/Prox/Cube/Persistent-Powerup/Kamikaze contracts on synthetic and Retail q3dm1 BSPs.',
                  sources={p.relative_to(ROOT).as_posix(): sha(p) for p in sources},
                  oracle_sha256=sha(native),
                  test_sha256=sha(ROOT / 'build/g_combat_complete_contracts.exe'))
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                     encoding='utf-8', newline='\n')
    print(f"PASS: {result['symbols']} g_combat symbols / {result['ray_sphere_differential_cases']} RaySphere lines / {result['unchanged_c_baseq3_cases']} unchanged-C Baseq3 cases / {result['contracts']} native + {result['retail_contracts']} Retail contracts")


if __name__ == '__main__':
    main()
