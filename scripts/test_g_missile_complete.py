"""Complete g_missile.c gate: unchanged-C Baseq3, Team Arena and Retail."""
import argparse
import json
import re
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from test_rejections import tiny_bsp
from toolchain import ROOT, run


def retail(data_root: Path, out: Path):
    archives = sorted((data_root / 'baseq3').glob('*.pk3'))
    bsp = out / 'q3dm1.bsp'
    qagame = False
    for path in archives:
        with zipfile.ZipFile(path) as archive:
            names = {name.lower(): name for name in archive.namelist()}
            qagame = qagame or 'vm/qagame.qvm' in names
            if not bsp.exists() and 'maps/q3dm1.bsp' in names:
                bsp.write_bytes(archive.read(names['maps/q3dm1.bsp']))
    if not archives or not bsp.exists() or not qagame:
        raise RuntimeError('Retail BaseQ3 PK3, q3dm1 or qagame.qvm missing')
    return bsp, archives


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', default='D:/Quake3')
    args = parser.parse_args()
    out = ROOT / 'build/reference/g_missile_complete'
    out.mkdir(parents=True, exist_ok=True)
    ledger = json.loads((ROOT / 'PORT_LEDGER.json').read_text(encoding='utf-8'))
    entry = next(item for item in ledger['files'] if item['source'] == 'code/game/g_missile.c')
    facade = ROOT / 'src/mq3/game/g_missile.ml'
    text = facade.read_text(encoding='utf-8')
    missing = [name for name in entry['symbol_candidates']
               if re.search(r'\bfunction\s+' + re.escape(name) + r'\s*\(', text) is None]
    if missing:
        raise RuntimeError('g_missile symbols missing: ' + ', '.join(missing))
    frame = (ROOT / 'src/mq3/game/frame.ml').read_text(encoding='utf-8')
    if 'import mq3.game.g_missile as completeMissiles' not in frame or 'completeMissiles.G_RunMissile(level,ent)' not in frame:
        raise RuntimeError('Productive frame does not dispatch complete G_RunMissile')

    # test_missiles builds the selected functions directly from the pinned,
    # unchanged g_missile.c and compares exact native records.
    cases = ['fire_parameters', 'bounce_stop_and_continue', 'impact_direct_splash_5']
    for index, case in enumerate(cases):
        command = [sys.executable, ROOT / 'scripts/test_missiles.py', '--case', case]
        if index:
            command.append('--reuse-build')
        run(command, ROOT, log=out / f'unchanged-c-{case}.log', timeout=600)

    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_missile_complete_contracts.ml', '--output',
                    'g_missile_complete_contracts.exe'], check=True)
    empty = out / 'empty.bsp'
    empty.write_bytes(tiny_bsp())
    expected = 'PASS: 18 g_missile complete contracts'
    synthetic = run([ROOT / 'build/g_missile_complete_contracts.exe', empty],
                    ROOT / 'build', log=out / 'contracts.log').strip()
    if synthetic != expected:
        raise RuntimeError(synthetic)
    retail_bsp, archives = retail(Path(args.data_root), out)
    retail_result = run([ROOT / 'build/g_missile_complete_contracts.exe', retail_bsp],
                        ROOT / 'build', log=out / 'retail-contracts.log').strip()
    if retail_result != expected:
        raise RuntimeError(retail_result)

    sources = [ROOT / 'Quake-III-Arena-original-source/code/game/g_missile.c',
               facade, ROOT / 'src/mq3/game/missiles.ml',
               ROOT / 'src/mq3/game/frame.ml',
               ROOT / 'tests/g_missile_complete_contracts.ml']
    result = dict(
        passed=True, symbols=len(entry['symbol_candidates']),
        unchanged_c_cases=cases, contracts=18, retail_contracts=18,
        retail_map_sha256=sha(retail_bsp),
        retail_archives={path.name: sha(path) for path in archives},
        scope=('All 17 g_missile.c symbols, unchanged-C Baseq3 fire/bounce/direct-impact '
               'differentials, productive Team Arena prox stick/stack/trigger/explode and '
               'invulnerability reflection, frame dispatch, synthetic and Retail q3dm1 contracts.'),
        sources={path.relative_to(ROOT).as_posix(): sha(path) for path in sources},
        test_sha256=sha(ROOT / 'build/g_missile_complete_contracts.exe'))
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                     encoding='utf-8', newline='\n')
    print(f"PASS: {result['symbols']} g_missile symbols / {len(cases)} unchanged-C cases / "
          f"{result['contracts']} native + {result['retail_contracts']} Retail contracts")


if __name__ == '__main__':
    main()

