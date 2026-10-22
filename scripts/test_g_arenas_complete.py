"""Complete g_arenas.c facade, Baseq3/Missionpack contracts and Retail proof."""
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


SYMBOLS = ['UpdateTournamentInfo', 'SpawnModelOnVictoryPad', 'CelebrateStop',
           'CelebrateStart', 'PodiumPlacementThink', 'SpawnPodium',
           'SpawnModelsOnVictoryPads', 'Svcmd_AbortPodium_f']


def retail_map(data_root, out):
    archives = sorted((data_root / 'baseq3').glob('*.pk3'))
    destination = out / 'q3dm1.bsp'
    has_qvm = False
    for path in archives:
        with zipfile.ZipFile(path) as archive:
            names = {name.lower(): name for name in archive.namelist()}
            has_qvm |= 'vm/qagame.qvm' in names
            if not destination.exists() and 'maps/q3dm1.bsp' in names:
                destination.write_bytes(archive.read(names['maps/q3dm1.bsp']))
    if not destination.exists() or not has_qvm:
        raise RuntimeError('Retail q3dm1 BSP or qagame QVM missing')
    return destination, archives


def pass_line(command, cwd, log, timeout=1800):
    line = run(command, cwd, log=log, timeout=timeout).strip().splitlines()[-1]
    if 'PASS:' not in line:
        raise RuntimeError(line)
    return line


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', type=Path, default=Path('D:/Quake3'))
    args = parser.parse_args()
    out = ROOT / 'build/reference/g_arenas_complete'
    out.mkdir(parents=True, exist_ok=True)

    facade = ROOT / 'src/mq3/game/g_arenas.ml'
    text = facade.read_text(encoding='utf-8')
    missing = [name for name in SYMBOLS if not re.search(
        r'\bfunction\s+' + re.escape(name) + r'\s*\(', text)]
    if missing:
        raise RuntimeError('missing g_arenas symbols: ' + ', '.join(missing))
    source = (ROOT / 'Quake-III-Arena-original-source/code/game/g_arenas.c').read_text(encoding='utf-8')
    for name in SYMBOLS:
        if not re.search(r'\b' + re.escape(name) + r'\s*\(', source):
            raise RuntimeError('original g_arenas symbol missing: ' + name)

    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_arenas_complete_contracts.ml', '--output',
                    'g_arenas_complete_contracts.exe'], cwd=ROOT, check=True)
    synthetic_bsp = out / 'empty.bsp'
    synthetic_bsp.write_bytes(tiny_bsp())
    executable = ROOT / 'build/g_arenas_complete_contracts.exe'
    synthetic = pass_line([executable, synthetic_bsp], ROOT / 'build', out / 'contracts.log')
    retail_bsp, archives = retail_map(args.data_root, out)
    retail = pass_line([executable, retail_bsp], ROOT / 'build', out / 'retail.log')
    if synthetic != retail:
        raise RuntimeError('Retail arena contracts differ: ' + retail)
    differential = pass_line([sys.executable, ROOT / 'scripts/test_arenas.py'], ROOT,
                             out / 'unchanged-c.log')
    if '5 arena scenarios / 1343 exact words' not in differential:
        raise RuntimeError(differential)

    sources = [ROOT / 'Quake-III-Arena-original-source/code/game/g_arenas.c',
               facade, ROOT / 'src/mq3/game/arenas.ml',
               ROOT / 'tests/g_arenas_complete_contracts.ml', Path(__file__)]
    result = dict(passed=True, symbols=len(SYMBOLS), contracts=7,
                  retail_contracts=7, unchanged_c=differential,
                  retail_map_sha256=sha(retail_bsp),
                  retail_archives={p.name: sha(p) for p in archives},
                  scope=('All eight g_arenas.c functions, Baseq3 and Missionpack postgame payloads, '
                         'victory podium/celebration and productive server abort dispatch.'),
                  sources={p.relative_to(ROOT).as_posix(): sha(p) for p in sources})
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                     encoding='utf-8', newline='\n')
    print(f"PASS: {len(SYMBOLS)} g_arenas symbols / 7 native + 7 Retail contracts / {differential}")


if __name__ == '__main__':
    main()
