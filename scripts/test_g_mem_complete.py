"""Complete code/game/g_mem.c facade, unchanged-C replay and Retail contracts."""
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


SYMBOLS = ['G_Alloc', 'G_InitMemory', 'Svcmd_GameMem_f']


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
    out = ROOT / 'build/reference/g_mem_complete'
    out.mkdir(parents=True, exist_ok=True)
    facade = ROOT / 'src/mq3/game/g_mem.ml'
    text = facade.read_text(encoding='utf-8')
    missing = [name for name in SYMBOLS if re.search(
        r'\bfunction\s+' + re.escape(name) + r'\s*\(', text) is None]
    if missing:
        raise RuntimeError('g_mem symbols missing: ' + ', '.join(missing))

    # This established differential compiles unchanged g_mem.c directly and
    # compares every pool byte, pointer offset, diagnostic and failure order.
    output = run([sys.executable, ROOT / 'scripts/test_game_memory.py'], ROOT,
                 log=out / 'unchanged-c.log')
    match = re.search(r'PASS: (\d+) scenarios / (\d+) actions / (\d+) exact words / (\d+) ordered effects', output)
    if not match:
        raise RuntimeError(output)

    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_mem_complete_contracts.ml', '--output',
                    'g_mem_complete_contracts.exe'], check=True)
    empty = out / 'empty.bsp'
    empty.write_bytes(tiny_bsp())
    synthetic = run([ROOT / 'build/g_mem_complete_contracts.exe', empty],
                    ROOT / 'build', log=out / 'contracts.log').strip()
    if synthetic != 'PASS: 8 g_mem complete contracts':
        raise RuntimeError(synthetic)
    retail_bsp, archives = retail(Path(args.data_root), out)
    retail_output = run([ROOT / 'build/g_mem_complete_contracts.exe', retail_bsp],
                        ROOT / 'build', log=out / 'retail-contracts.log').strip()
    if retail_output != synthetic:
        raise RuntimeError(retail_output)

    sources = [ROOT / 'Quake-III-Arena-original-source/code/game/g_mem.c',
               facade, ROOT / 'src/mq3/game/memory.ml',
               ROOT / 'tests/g_mem_complete_contracts.ml',
               ROOT / 'tests/game_memory_tests.ml',
               ROOT / 'tests/reference/game_memory_oracle.c']
    result = dict(
        passed=True, symbols=len(SYMBOLS), scenarios=int(match[1]),
        actions=int(match[2]), exact_words=int(match[3]),
        ordered_effects=int(match[4]), contracts=8, retail_contracts=8,
        retail_map_sha256=sha(retail_bsp),
        retail_archives={path.name: sha(path) for path in archives},
        scope=('All three g_mem.c symbols through a C-named facade; unchanged-source '
               '256 KiB arena differential including byte retention, 32-byte alignment, '
               'zero-size aliases, diagnostics and capacity failures; facade contracts '
               'on synthetic and Retail q3dm1 BSPs.'),
        sources={path.relative_to(ROOT).as_posix(): sha(path) for path in sources},
        test_sha256=sha(ROOT / 'build/g_mem_complete_contracts.exe'))
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                     encoding='utf-8', newline='\n')
    print(f"PASS: {result['symbols']} g_mem symbols / {result['scenarios']} unchanged-C scenarios / "
          f"{result['actions']} actions / {result['exact_words']} exact words / "
          f"{result['contracts']} native + {result['retail_contracts']} Retail contracts")


if __name__ == '__main__':
    main()
