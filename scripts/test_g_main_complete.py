"""Complete g_main.c facade, unchanged vmMain switch, native and Retail gates."""
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


def build_minilang(source, output):
    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source', source,
                    '--output', output], cwd=ROOT, check=True)


def retail_files(root, out):
    archives = sorted((root / 'baseq3').glob('*.pk3'))
    bsp = out / 'q3dm1.bsp'
    qvm = out / 'qagame.qvm'
    for path in archives:
        with zipfile.ZipFile(path) as archive:
            names = {name.lower(): name for name in archive.namelist()}
            if not bsp.exists() and 'maps/q3dm1.bsp' in names:
                bsp.write_bytes(archive.read(names['maps/q3dm1.bsp']))
            if not qvm.exists() and 'vm/qagame.qvm' in names:
                qvm.write_bytes(archive.read(names['vm/qagame.qvm']))
    if not bsp.exists() or not qvm.exists():
        raise RuntimeError('Retail q3dm1 BSP or qagame.qvm missing')
    return archives, bsp, qvm


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', default='D:/Quake3')
    args = parser.parse_args()
    out = ROOT / 'build/reference/g_main_complete'
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / 'Quake-III-Arena-original-source/code/game/g_main.c'
    module = ROOT / 'src/mq3/game/g_main.ml'

    ledger = json.loads((ROOT / 'PORT_LEDGER.json').read_text(encoding='utf-8'))
    entry = next(item for item in ledger['files'] if item['source'] == 'code/game/g_main.c')
    text = module.read_text(encoding='utf-8')
    missing = [name for name in entry['symbol_candidates']
               if re.search(r'\bfunction\s+' + re.escape(name) + r'\s*\(', text) is None]
    if missing:
        raise RuntimeError('g_main symbols missing: ' + ', '.join(missing))

    (out / 'g_main_under_test.inc').write_text(extract(source, ['vmMain']),
                                               encoding='utf-8', newline='\n')
    native = out / 'g_main_complete_oracle.exe'
    run(['cl', '/nologo', '/Od', '/MT', '/W4', '/WX', '/wd4100', '/wd4311',
         f'/I{out}', ROOT / 'tests/reference/g_main_complete_oracle.c',
         f'/Fe:{native}', '/link', '/Brepro'], out, msvc_env('x86'), out / 'oracle-build.log')

    empty = out / 'empty.bsp'
    empty.write_bytes(tiny_bsp())
    build_minilang('tests/g_main_complete_oracle.ml', 'g_main_complete_oracle_ml.exe')
    build_minilang('tests/g_main_complete_contracts.ml', 'g_main_complete_contracts.exe')
    expected = run([native], out, log=out / 'oracle.log')
    actual = run([ROOT / 'build/g_main_complete_oracle_ml.exe', empty], ROOT / 'build',
                 log=out / 'mini-oracle.log')
    if actual != expected:
        raise RuntimeError('unchanged-C vmMain differential mismatch')
    contracts = run([ROOT / 'build/g_main_complete_contracts.exe', empty], ROOT / 'build',
                    log=out / 'contracts.log').strip()
    if contracts != 'PASS: 11 g_main complete contracts':
        raise RuntimeError(contracts)

    archives, retail_bsp, retail_qvm = retail_files(Path(args.data_root), out)
    retail = run([ROOT / 'build/g_main_complete_contracts.exe', retail_bsp], ROOT / 'build',
                 log=out / 'retail-contracts.log').strip()
    if retail != contracts:
        raise RuntimeError(retail)

    dependent = {}
    for name in ['full_frame', 'scores', 'tournament', 'votes', 'game_cvars',
                 'intermission', 'game_lifecycle']:
        result_path = ROOT / 'build/reference' / name / 'result.json'
        if result_path.exists():
            result = json.loads(result_path.read_text(encoding='utf-8'))
            if result.get('passed'):
                dependent[name] = sha(result_path)

    sources = [source, module, ROOT / 'tests/g_main_complete_oracle.ml',
               ROOT / 'tests/g_main_complete_contracts.ml',
               ROOT / 'tests/reference/g_main_complete_oracle.c']
    result = dict(
        passed=True,
        symbols=len(entry['symbol_candidates']),
        vm_dispatch_records=len(expected.splitlines()),
        contracts=11,
        retail_contracts=11,
        retail_bsp_sha256=sha(retail_bsp),
        retail_qagame_qvm_sha256=sha(retail_qvm),
        retail_archives={path.name: sha(path) for path in archives},
        dependent_differential_evidence=dependent,
        scope=('All g_main.c candidates have a C-named facade. The unchanged native vmMain switch '
               'is compared command-for-command; native and Retail BSP contracts exercise diagnostics, '
               'think, frame, console and score routing. Existing unchanged-C suites remain the detailed '
               'proof for lifecycle, ranks, intermission, tournaments, votes and Cvars.'),
        sources={path.relative_to(ROOT).as_posix(): sha(path) for path in sources},
        oracle_sha256=sha(native),
        test_sha256=sha(ROOT / 'build/g_main_complete_contracts.exe'))
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                     encoding='utf-8', newline='\n')
    print(f"PASS: {result['symbols']} g_main symbols / {result['vm_dispatch_records']} unchanged-C vmMain records / {result['contracts']} native + {result['retail_contracts']} Retail contracts")


if __name__ == '__main__':
    main()
