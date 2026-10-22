"""Complete g_utils.c facade, unchanged-C differential and Retail contracts."""
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


SYMBOLS = [
    'AddRemap', 'BuildShaderStateConfig', 'G_FindConfigstringIndex',
    'G_ModelIndex', 'G_SoundIndex', 'G_TeamCommand', 'G_Find',
    'G_PickTarget', 'G_UseTargets', 'tv', 'vtos', 'G_SetMovedir',
    'vectoyaw', 'G_InitGentity', 'G_Spawn', 'G_EntitiesFree',
    'G_FreeEntity', 'G_TempEntity', 'G_KillBox', 'G_AddPredictableEvent',
    'G_AddEvent', 'G_Sound', 'G_SetOrigin', 'DebugLine',
]


def build_native(out):
    source = ROOT / 'tests/reference/g_utils_complete_oracle.c'
    exe = out / 'g_utils_complete_oracle.exe'
    run(['cl', '/nologo', '/Od', '/Gy', '/fp:strict', '/MT', '/DWIN32',
         '/DNDEBUG', source, '/Fe:' + str(exe), '/link', '/OPT:REF',
         '/Brepro'], out, msvc_env('x86'), out / 'oracle-build.log')
    return exe


def retail_map(data_root, out):
    archives = sorted((data_root / 'baseq3').glob('*.pk3'))
    if not archives:
        raise RuntimeError('No Retail baseq3/*.pk3 archives')
    bsp = out / 'q3dm1.bsp'
    qvm = False
    for archive_path in archives:
        with zipfile.ZipFile(archive_path) as archive:
            names = {name.lower(): name for name in archive.namelist()}
            qvm = qvm or 'vm/qagame.qvm' in names
            if not bsp.exists() and 'maps/q3dm1.bsp' in names:
                bsp.write_bytes(archive.read(names['maps/q3dm1.bsp']))
    if not bsp.exists() or not qvm:
        raise RuntimeError('Retail q3dm1 BSP or qagame QVM missing')
    return bsp, archives


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', default='D:/Quake3')
    args = parser.parse_args()
    out = ROOT / 'build/reference/g_utils_complete'
    out.mkdir(parents=True, exist_ok=True)

    target = ROOT / 'src/mq3/game/g_utils.ml'
    text = target.read_text(encoding='utf-8')
    missing = [name for name in SYMBOLS if re.search(
        r'\bfunction\s+' + re.escape(name) + r'\s*\(', text) is None]
    if missing:
        raise RuntimeError('g_utils symbols missing: ' + ', '.join(missing))

    integrations = {
        ROOT / 'src/mq3/game/client_spawn.ml': ['gUtils.G_KillBox', 'gUtils.G_UseTargets'],
        ROOT / 'src/mq3/game/items.ml': ['gUtils.G_AddPredictableEvent'],
        ROOT / 'src/mq3/game/map_targets.ml': ['gUtils.G_TeamCommand'],
    }
    for path, needles in integrations.items():
        production = path.read_text(encoding='utf-8')
        for needle in needles:
            if needle not in production:
                raise RuntimeError(f'productive integration missing: {needle}')

    native = build_native(out)
    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_utils_complete_oracle.ml', '--output',
                    'g_utils_complete_oracle_ml.exe'], check=True)
    empty = out / 'empty.bsp'
    empty.write_bytes(tiny_bsp())
    expected = run([native], out, log=out / 'oracle.log')
    actual = run([ROOT / 'build/g_utils_complete_oracle_ml.exe', empty],
                 ROOT / 'build', log=out / 'mini-oracle.log')
    if actual != expected:
        raise RuntimeError('unchanged-C helper differential mismatch')

    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_utils_complete_contracts.ml', '--output',
                    'g_utils_complete_contracts.exe'], check=True)
    synthetic = run([ROOT / 'build/g_utils_complete_contracts.exe', empty],
                    ROOT / 'build', log=out / 'contracts.log').strip()
    if synthetic != 'PASS: 23 g_utils complete contracts':
        raise RuntimeError(synthetic)

    retail_bsp, archives = retail_map(Path(args.data_root), out)
    retail = run([ROOT / 'build/g_utils_complete_contracts.exe', retail_bsp],
                 ROOT / 'build', log=out / 'retail-contracts.log').strip()
    if retail != synthetic:
        raise RuntimeError(retail)

    sources = [ROOT / 'Quake-III-Arena-original-source/code/game/g_utils.c',
               target, ROOT / 'src/mq3/game/client_spawn.ml',
               ROOT / 'src/mq3/game/items.ml', ROOT / 'src/mq3/game/map_targets.ml',
               ROOT / 'tests/g_utils_complete_contracts.ml',
               ROOT / 'tests/g_utils_complete_oracle.ml',
               ROOT / 'tests/reference/g_utils_complete_oracle.c']
    result = dict(
        passed=True, symbols=len(SYMBOLS),
        differential_lines=len(expected.splitlines()), contracts=23,
        retail_contracts=23, retail_map_sha256=sha(retail_bsp),
        retail_archives={path.name: sha(path) for path in archives},
        scope=('All 24 g_utils.c functions through C-named typed facades; '
               'productive ClientSpawn, item-prediction and target-print paths; '
               'unchanged-C helpers plus synthetic and Retail q3dm1 contracts.'),
        sources={path.relative_to(ROOT).as_posix(): sha(path) for path in sources},
        oracle_sha256=sha(native),
        test_sha256=sha(ROOT / 'build/g_utils_complete_contracts.exe'))
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                     encoding='utf-8', newline='\n')
    print(f"PASS: {result['symbols']} g_utils symbols / "
          f"{result['differential_lines']} unchanged-C lines / "
          f"{result['contracts']} native + {result['retail_contracts']} Retail contracts")


if __name__ == '__main__':
    main()
