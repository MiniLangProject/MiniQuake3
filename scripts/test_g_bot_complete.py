"""Complete g_bot.c facade, unchanged-C helpers and Retail bot path."""
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


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', type=Path, default=Path('D:/Quake3'))
    parser.add_argument('--skip-existing', action='store_true')
    args = parser.parse_args()
    out = ROOT / 'build/reference/g_bot_complete'
    out.mkdir(parents=True, exist_ok=True)
    ledger = json.loads((ROOT / 'PORT_LEDGER.json').read_text(encoding='utf-8'))
    entry = next(x for x in ledger['files'] if x['source'] == 'code/game/g_bot.c')
    facade = ROOT / 'src/mq3/game/g_bot.ml'
    text = facade.read_text(encoding='utf-8')
    missing = [name for name in entry['symbol_candidates']
               if re.search(r'\bfunction\s+' + re.escape(name) + r'\s*\(', text) is None]
    if missing:
        raise RuntimeError('g_bot facade symbols missing: ' + ', '.join(missing))

    code = ROOT / 'Quake-III-Arena-original-source/code'
    native = out / 'g_bot_complete_oracle.exe'
    run(['cl', '/nologo', '/Od', '/Gy', '/fp:strict', '/MT', '/DWIN32', '/DNDEBUG',
         f'/I{code / "game"}', ROOT / 'tests/reference/g_bot_complete_oracle.c',
         code / 'game/q_shared.c', f'/Fe:{native}', '/link', '/OPT:REF', '/Brepro'],
        out, msvc_env('x86'), out / 'oracle-build.log')
    empty = out / 'empty.bsp'
    empty.write_bytes(tiny_bsp())
    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_bot_complete_oracle.ml', '--output', 'g_bot_complete_oracle_ml.exe'],
                   cwd=ROOT, check=True)
    expected = [x for x in run([native], out, log=out / 'oracle.log').splitlines() if x]
    actual = [x for x in run([ROOT / 'build/g_bot_complete_oracle_ml.exe', empty], ROOT,
                              log=out / 'mini-oracle.log').splitlines() if x]
    if actual != expected:
        raise RuntimeError(f'unchanged-C helper mismatch: {actual!r} != {expected!r}')

    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_bot_complete_contracts.ml', '--output', 'g_bot_complete_contracts.exe'],
                   cwd=ROOT, check=True)
    contract = run([ROOT / 'build/g_bot_complete_contracts.exe', empty], ROOT,
                   log=out / 'contracts.log').strip()
    if contract != 'PASS: 7 g_bot complete contracts':
        raise RuntimeError(contract)

    existing = []
    if not args.skip_existing:
        for script in ('test_bot_registry.py', 'test_bot_clients.py', 'test_bot_population.py',
                       'test_bot_ai_clients.py'):
            result = run([sys.executable, ROOT / 'scripts' / script], ROOT,
                         timeout=300, log=out / (script + '.log')).strip()
            existing.append(result.splitlines()[-1])

    pak = args.data_root / 'baseq3/pak0.pk3'
    with zipfile.ZipFile(pak) as archive:
        names = {x.lower() for x in archive.namelist()}
        required = {'vm/qagame.qvm', 'scripts/bots.txt', 'botfiles/bots/sarge_c.c',
                    'botfiles/bots/sarge_i.c', 'botfiles/bots/sarge_w.c', 'maps/q3dm1.aas'}
        absent = sorted(required - names)
        if absent:
            raise RuntimeError('Retail bot assets missing: ' + ', '.join(absent))
    retail = run([sys.executable, ROOT / 'scripts/test_bot_spawn_retail.py',
                  '--data-root', args.data_root], ROOT, timeout=360,
                 log=out / 'retail.log').strip().splitlines()[-1]
    if not retail.startswith('PASS: 18 retail original-bot spawn contracts'):
        raise RuntimeError(retail)

    sources = [facade, ROOT / 'src/mq3/game/lifecycle.ml',
               ROOT / 'src/mq3/game/bot_registry.ml', ROOT / 'src/mq3/game/bot_clients.ml',
               ROOT / 'src/mq3/game/bot_population.ml',
               ROOT / 'tests/g_bot_complete_contracts.ml',
               ROOT / 'tests/g_bot_complete_oracle.ml',
               ROOT / 'tests/reference/g_bot_complete_oracle.c']
    result = {'passed': True, 'symbols': len(entry['symbol_candidates']),
              'unchanged_c_lines': len(expected), 'contracts': 7,
              'existing_gates': existing, 'retail': retail,
              'retail_pak_sha256': sha(pak),
              'scope': 'All g_bot.c symbols through the production facade, lifecycle/server console wiring, unchanged-C intro/Cvar helpers, existing registry/client/population/resource gates, and a 512-frame Retail qagame/AAS/Sarge bot match.',
              'sources': {x.relative_to(ROOT).as_posix(): sha(x) for x in sources}}
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                     encoding='utf-8', newline='\n')
    print(f"PASS: {result['symbols']} g_bot symbols / {result['unchanged_c_lines']} unchanged-C lines / 7 facade contracts / 18 Retail bot contracts")


if __name__ == '__main__':
    main()
