"""Complete g_trigger.c facade, unchanged-C differentials and Retail BSP contracts."""
import argparse
import json
import py_compile
import re
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from toolchain import ROOT, run

ACTUAL = ['InitTrigger', 'multi_wait', 'multi_trigger', 'Use_Multi', 'Touch_Multi',
          'SP_trigger_multiple', 'trigger_always_think', 'SP_trigger_always',
          'trigger_push_touch', 'AimAtTarget', 'SP_trigger_push', 'Use_target_push',
          'SP_target_push', 'trigger_teleporter_touch', 'SP_trigger_teleport',
          'hurt_use', 'hurt_touch', 'SP_trigger_hurt', 'func_timer_think',
          'func_timer_use', 'SP_func_timer']


def last_pass(command, cwd, log, timeout=1200):
    line = run(command, cwd, log=log, timeout=timeout).strip().splitlines()[-1]
    if 'PASS' not in line:
        raise RuntimeError(line)
    return line


def retail_bsp(root, out):
    with zipfile.ZipFile(root / 'baseq3/pak0.pk3') as archive:
        data = archive.read('maps/q3dm0.bsp')
    path = out / 'q3dm0.bsp'; path.write_bytes(data)
    return path


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', type=Path, default=Path('D:/Quake3'))
    args = parser.parse_args(); py_compile.compile(__file__, doraise=True)
    out = ROOT / 'build/reference/g_trigger_complete'; out.mkdir(parents=True, exist_ok=True)
    source = ROOT / 'Quake-III-Arena-original-source/code/game/g_trigger.c'
    facade = ROOT / 'src/mq3/game/g_trigger.ml'
    original = source.read_text(encoding='utf-8'); ported = facade.read_text(encoding='utf-8')
    functions = re.findall(r'^void\s+(\w+)\s*\(', original, re.M)
    if functions != ACTUAL:
        raise RuntimeError('unexpected upstream g_trigger symbol order: ' + repr(functions))
    missing = [name for name in ACTUAL if re.search(r'\bfunction\s+' + re.escape(name) + r'\s*\(', ported) is None]
    if missing:
        raise RuntimeError('missing g_trigger facade symbols: ' + ', '.join(missing))
    dispatch = (ROOT / 'src/mq3/game/spawn_functions.ml').read_text(encoding='utf-8')
    spawns = ['trigger_multiple', 'trigger_always', 'trigger_push', 'trigger_teleport',
              'trigger_hurt', 'target_push', 'func_timer']
    bypass = [name for name in spawns if f'gTrigger.SP_{name}(level,ent)' not in dispatch]
    if bypass:
        raise RuntimeError('productive spawn bypasses g_trigger facade: ' + ', '.join(bypass))

    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_trigger_complete_contracts.ml', '--output',
                    'g_trigger_complete_contracts.exe'], cwd=ROOT, check=True)
    retail = retail_bsp(args.data_root, out)
    contract = last_pass([ROOT / 'build/g_trigger_complete_contracts.exe', retail],
                         ROOT / 'build', out / 'contracts.log')
    match = re.search(r'PASS: (\d+) complete g_trigger contracts', contract)
    if not match:
        raise RuntimeError(contract)

    # spawn_oracle.py extracts these bodies verbatim from the pristine upstream
    # file. Each family is compared word-for-word against productive MiniLang.
    cases = ['multiple_cooldown', 'teleporter_and_expiry',
             'push_modes_apex_and_sound', 'timer_toggle_and_start']
    differentials = []
    for index, case in enumerate(cases):
        cmd = [sys.executable, ROOT / 'scripts/test_targets.py', '--case', case]
        if index:
            cmd.append('--reuse-build')
        differentials.append(last_pass(cmd, ROOT, out / f'{case}.log', timeout=1800))

    sources = [source, facade, ROOT / 'src/mq3/game/spawn_functions.ml',
               ROOT / 'tests/g_trigger_complete_contracts.ml', Path(__file__)]
    result = {'passed': True, 'upstream_functions': len(ACTUAL),
              'ledger_candidates': 20, 'inventory_comment_candidate': 'between',
              'contracts': int(match.group(1)), 'retail_map_sha256': sha(retail),
              'unchanged_c_gates': differentials,
              'scope': 'All 21 real g_trigger.c functions, the legacy between inventory token, all seven productive spawn classes, team/spectator/PM/flight gates, deferred free, timers, damage and door-touch compatibility.',
              'sources': {p.relative_to(ROOT).as_posix(): sha(p) for p in sources}}
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8', newline='\n')
    print(f"PASS: {len(ACTUAL)} real g_trigger functions / 20 ledger candidates + {result['contracts']} Retail contracts + {len(differentials)} unchanged-C gates")


if __name__ == '__main__':
    main()
