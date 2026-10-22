"""Complete g_svcmds.c facade, unchanged-C server suite and Retail proof."""
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


SYMBOLS = ['StringToFilter', 'UpdateIPBans', 'G_FilterPacket', 'AddIP',
           'G_ProcessIPBans', 'Svcmd_AddIP_f', 'Svcmd_RemoveIP_f',
           'Svcmd_EntityList_f', 'ClientForString', 'Svcmd_ForceTeam_f',
           'ConsoleCommand']


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


def pass_line(command, cwd, log, timeout=3600):
    line = run(command, cwd, log=log, timeout=timeout).strip().splitlines()[-1]
    if 'PASS:' not in line:
        raise RuntimeError(line)
    return line


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data-root', type=Path, default=Path('D:/Quake3'))
    args = parser.parse_args()
    out = ROOT / 'build/reference/g_svcmds_complete'
    out.mkdir(parents=True, exist_ok=True)

    facade = ROOT / 'src/mq3/game/g_svcmds.ml'
    text = facade.read_text(encoding='utf-8')
    missing = [name for name in SYMBOLS if not re.search(
        r'\bfunction\s+' + re.escape(name) + r'\s*\(', text)]
    if missing:
        raise RuntimeError('missing g_svcmds symbols: ' + ', '.join(missing))
    source = (ROOT / 'Quake-III-Arena-original-source/code/game/g_svcmds.c').read_text(encoding='utf-8')
    for name in SYMBOLS:
        if not re.search(r'\b' + re.escape(name) + r'\s*\(', source):
            raise RuntimeError('original g_svcmds symbol missing: ' + name)
    production = (ROOT / 'src/mq3/game/lifecycle.ml').read_text(encoding='utf-8')
    if 'serverCommands.attach(level,populationAddCommand,populationListCommand' not in production:
        raise RuntimeError('productive bot/server command attachment missing')

    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/g_svcmds_complete_contracts.ml', '--output',
                    'g_svcmds_complete_contracts.exe'], cwd=ROOT, check=True)
    synthetic_bsp = out / 'empty.bsp'
    synthetic_bsp.write_bytes(tiny_bsp())
    executable = ROOT / 'build/g_svcmds_complete_contracts.exe'
    synthetic = pass_line([executable, synthetic_bsp], ROOT / 'build', out / 'contracts.log')
    retail_bsp, archives = retail_map(args.data_root, out)
    retail = pass_line([executable, retail_bsp], ROOT / 'build', out / 'retail.log')
    if synthetic != retail:
        raise RuntimeError('Retail server command contracts differ: ' + retail)
    differential = pass_line([sys.executable, ROOT / 'scripts/test_server_commands.py'], ROOT,
                             out / 'unchanged-c.log')
    match = re.search(r'PASS: (\d+) server command scenarios / (\d+) actions / '
                      r'(\d+) exact words / (\d+) ordered effects', differential)
    if not match:
        raise RuntimeError(differential)

    sources = [ROOT / 'Quake-III-Arena-original-source/code/game/g_svcmds.c',
               facade, ROOT / 'src/mq3/game/ip_filters.ml',
               ROOT / 'src/mq3/game/server_commands.ml',
               ROOT / 'tests/g_svcmds_complete_contracts.ml', Path(__file__)]
    result = dict(passed=True, symbols=len(SYMBOLS), contracts=10,
                  retail_contracts=10, unchanged_c_scenarios=int(match.group(1)),
                  unchanged_c_actions=int(match.group(2)), exact_words=int(match.group(3)),
                  ordered_effects=int(match.group(4)), retail_map_sha256=sha(retail_bsp),
                  retail_archives={p.name: sha(p) for p in archives},
                  scope=('All eleven g_svcmds.c functions, IP persistence/filtering, entity and '
                         'client administration, force-team integration, bot/podium dispatch and '
                         'dedicated-console chat.'),
                  sources={p.relative_to(ROOT).as_posix(): sha(p) for p in sources})
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                     encoding='utf-8', newline='\n')
    print(f"PASS: {len(SYMBOLS)} g_svcmds symbols / 10 native + 10 Retail contracts / {differential}")


if __name__ == '__main__':
    main()
