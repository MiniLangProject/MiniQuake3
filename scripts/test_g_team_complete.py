"""Complete g_team.c surface, unchanged-C differential and Retail contracts."""
import argparse
import json
import re
import subprocess
import sys
import zipfile

from inventory import sha
from test_rejections import tiny_bsp
from toolchain import ROOT, msvc_env, run


def build_native(out):
    source = ROOT / 'tests/reference/g_team_complete_oracle.c'
    exe = out / 'g_team_complete_oracle.exe'
    run(['cl', '/nologo', '/Od', '/Gy', '/fp:strict', '/MT', '/DWIN32', '/DNDEBUG',
         source, '/Fe:' + str(exe), '/link', '/OPT:REF', '/Brepro'], out,
        msvc_env('x86'), out / 'oracle-build.log')
    return exe


def retail_map(data_root, out):
    archives = sorted((data_root / 'baseq3').glob('*.pk3'))
    if not archives:
        raise RuntimeError('No Retail baseq3/*.pk3 archives')
    found_qvm = False
    bsp = out / 'q3dm1.bsp'
    for path in archives:
        with zipfile.ZipFile(path) as archive:
            names = {name.lower(): name for name in archive.namelist()}
            found_qvm = found_qvm or 'vm/qagame.qvm' in names
            if not bsp.exists() and 'maps/q3dm1.bsp' in names:
                bsp.write_bytes(archive.read(names['maps/q3dm1.bsp']))
    if not bsp.exists() or not found_qvm:
        raise RuntimeError('Retail q3dm1 BSP or qagame QVM missing')
    return bsp, archives


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', default='D:/Quake3')
    args = parser.parse_args()
    out = ROOT / 'build/reference/g_team_complete'
    out.mkdir(parents=True, exist_ok=True)
    ledger = json.loads((ROOT / 'PORT_LEDGER.json').read_text(encoding='utf-8'))
    entry = next(item for item in ledger['files'] if item['source'] == 'code/game/g_team.c')
    target = ROOT / 'src/mq3/game/g_team.ml'
    text = target.read_text(encoding='utf-8')
    missing = [name for name in entry['symbol_candidates']
               if re.search(r'\bfunction\s+' + re.escape(name) + r'\s*\(', text) is None]
    if missing:
        raise RuntimeError('g_team symbols missing: ' + ', '.join(missing))

    native = build_native(out)
    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_team_complete_oracle.ml', '--output', 'g_team_complete_oracle_ml.exe'], check=True)
    expected = run([native], out, log=out / 'oracle.log')
    actual = run([ROOT / 'build/g_team_complete_oracle_ml.exe'], ROOT / 'build', log=out / 'mini-oracle.log')
    if actual != expected:
        raise RuntimeError('unchanged-C helper differential mismatch')

    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_team_complete_contracts.ml', '--output', 'g_team_complete_contracts.exe'], check=True)
    empty = out / 'empty.bsp'
    empty.write_bytes(tiny_bsp())
    native_contracts = run([ROOT / 'build/g_team_complete_contracts.exe', empty], ROOT / 'build',
                           log=out / 'contracts.log').strip()
    if native_contracts != 'PASS: 19 g_team complete contracts':
        raise RuntimeError(native_contracts)

    from pathlib import Path
    retail_bsp, archives = retail_map(Path(args.data_root), out)
    retail_contracts = run([ROOT / 'build/g_team_complete_contracts.exe', retail_bsp], ROOT / 'build',
                           log=out / 'retail-contracts.log').strip()
    if retail_contracts != native_contracts:
        raise RuntimeError(retail_contracts)

    sources = [ROOT / 'Quake-III-Arena-original-source/code/game/g_team.c', target,
               ROOT / 'src/mq3/game/team_missionpack.ml', ROOT / 'src/mq3/game/entities.ml',
               ROOT / 'src/mq3/game/combat.ml', ROOT / 'src/mq3/game/spawn_functions.ml',
               ROOT / 'src/mq3/game/spawn_tables.ml', ROOT / 'tests/g_team_complete_contracts.ml',
               ROOT / 'tests/g_team_complete_oracle.ml', ROOT / 'tests/reference/g_team_complete_oracle.c']
    result = dict(passed=True, symbols=len(entry['symbol_candidates']), differential_lines=len(expected.splitlines()),
                  contracts=19, retail_contracts=19, retail_map_sha256=sha(retail_bsp),
                  retail_archives={p.name: sha(p) for p in archives},
                  scope='All g_team.c symbols, Baseq3 delegated production rules, and MISSIONPACK One Flag/Overload/Harvester obelisk state. Pure helper output is compiled directly from unchanged g_team.c; native contracts run on synthetic and Retail q3dm1 BSPs.',
                  sources={p.relative_to(ROOT).as_posix(): sha(p) for p in sources},
                  oracle_sha256=sha(native), test_sha256=sha(ROOT / 'build/g_team_complete_contracts.exe'))
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8', newline='\n')
    print(f"PASS: {result['symbols']} g_team symbols / {result['differential_lines']} unchanged-C lines / {result['contracts']} native + {result['retail_contracts']} Retail contracts")


if __name__ == '__main__':
    main()
