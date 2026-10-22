"""Complete code/game/g_session.c facade, unchanged-C cases and Retail contracts."""
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


SYMBOLS = ['G_InitSessionData', 'G_InitWorldSession', 'G_ReadSessionData',
           'G_WriteClientSessionData', 'G_WriteSessionData']
CASES = ['first_connect_ffa', 'session_roundtrip_0', 'world_init_3_0',
         'write_world_connected_2', 'init_preserves_other_session_fields',
         'shutdown_reset_reconnect']


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
    out = ROOT / 'build/reference/g_session_complete'
    out.mkdir(parents=True, exist_ok=True)
    facade = ROOT / 'src/mq3/game/g_session.ml'
    text = facade.read_text(encoding='utf-8')
    missing = [name for name in SYMBOLS if re.search(
        r'\bfunction\s+' + re.escape(name) + r'\s*\(', text) is None]
    if missing:
        raise RuntimeError('g_session symbols missing: ' + ', '.join(missing))

    actions = words = effects = 0
    for index, case in enumerate(CASES):
        command = [sys.executable, ROOT / 'scripts/test_client_connect.py',
                   '--case', case]
        if index:
            command.append('--reuse-build')
        output = run(command, ROOT, log=out / f'{case}.log')
        match = re.search(r'PASS: 1 scenarios / (\d+) actions / (\d+) exact words / (\d+) ordered effects', output)
        if not match:
            raise RuntimeError(output)
        actions += int(match[1]); words += int(match[2]); effects += int(match[3])

    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_session_complete_contracts.ml', '--output',
                    'g_session_complete_contracts.exe'], check=True)
    empty = out / 'empty.bsp'
    empty.write_bytes(tiny_bsp())
    synthetic = run([ROOT / 'build/g_session_complete_contracts.exe', empty],
                    ROOT / 'build', log=out / 'contracts.log').strip()
    if synthetic != 'PASS: 9 g_session complete contracts':
        raise RuntimeError(synthetic)
    retail_bsp, archives = retail(Path(args.data_root), out)
    retail_output = run([ROOT / 'build/g_session_complete_contracts.exe', retail_bsp],
                        ROOT / 'build', log=out / 'retail-contracts.log').strip()
    if retail_output != synthetic:
        raise RuntimeError(retail_output)

    sources = [ROOT / 'Quake-III-Arena-original-source/code/game/g_session.c',
               facade, ROOT / 'src/mq3/game/session.ml',
               ROOT / 'src/mq3/compat/textnumbers.ml',
               ROOT / 'tests/g_session_complete_contracts.ml',
               ROOT / 'tests/client_connect_tests.ml']
    result = dict(
        passed=True, symbols=len(SYMBOLS), unchanged_c_cases=len(CASES),
        actions=actions, exact_words=words, ordered_effects=effects,
        contracts=9, retail_contracts=9,
        retail_map_sha256=sha(retail_bsp),
        retail_archives={path.name: sha(path) for path in archives},
        scope=('All five g_session.c symbols through a C-named facade; selected '
               'unchanged-source session/connect differential cases cover first-connect '
               'initialization, native %i roundtrip, world-session invalidation, connected-only '
               'shutdown writes and level reconstruction; facade contracts run on synthetic '
               'and Retail q3dm1 BSPs.'),
        sources={path.relative_to(ROOT).as_posix(): sha(path) for path in sources},
        test_sha256=sha(ROOT / 'build/g_session_complete_contracts.exe'))
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                     encoding='utf-8', newline='\n')
    print(f"PASS: {result['symbols']} g_session symbols / {result['unchanged_c_cases']} unchanged-C cases / "
          f"{result['actions']} actions / {result['exact_words']} exact words / "
          f"{result['contracts']} native + {result['retail_contracts']} Retail contracts")


if __name__ == '__main__':
    main()
