"""Complete g_items.c facade, unchanged-C Baseq3 replay and Team Arena contracts."""
import argparse, json, re, subprocess, sys, zipfile
from pathlib import Path
from inventory import sha
from test_rejections import tiny_bsp
from toolchain import ROOT, msvc_env, run


def retail(root, out):
    archives=sorted((root/'baseq3').glob('*.pk3'));bsp=out/'q3dm1.bsp';qvm=False
    for path in archives:
        with zipfile.ZipFile(path) as archive:
            names={n.lower():n for n in archive.namelist()};qvm=qvm or 'vm/qagame.qvm' in names
            if not bsp.exists() and 'maps/q3dm1.bsp' in names:bsp.write_bytes(archive.read(names['maps/q3dm1.bsp']))
    if not archives or not bsp.exists() or not qvm:raise RuntimeError('Retail Baseq3 PK3, q3dm1 BSP or qagame QVM missing')
    return bsp,archives


def main():
    p=argparse.ArgumentParser();p.add_argument('--data-root',default='D:/Quake3');a=p.parse_args()
    out=ROOT/'build/reference/g_items_complete';out.mkdir(parents=True,exist_ok=True)
    ledger=json.loads((ROOT/'PORT_LEDGER.json').read_text(encoding='utf-8'));entry=next(x for x in ledger['files'] if x['source']=='code/game/g_items.c')
    facade=ROOT/'src/mq3/game/g_items.ml';text=facade.read_text(encoding='utf-8')
    missing=[name for name in entry['symbol_candidates'] if re.search(r'\bfunction\s+'+re.escape(name)+r'\s*\(',text) is None]
    if missing:raise RuntimeError('g_items symbols missing: '+', '.join(missing))
    # The unchanged pinned file drives both existing suites: 20 pickup/physics
    # scenarios and the registration/team-initialization action stream.
    run([sys.executable,ROOT/'scripts/test_items.py'],ROOT,log=out/'baseq3-items.log',timeout=600)
    run([sys.executable,ROOT/'scripts/test_initialization.py'],ROOT,log=out/'baseq3-registration.log',timeout=600)
    native=out/'g_items_complete_oracle.exe';native_src=ROOT/'tests/reference/g_items_complete_oracle.c'
    run(['cl','/nologo','/Od','/fp:strict','/MT',native_src,'/Fe:'+str(native),'/link','/OPT:REF','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/g_items_complete_oracle.ml','--output','g_items_complete_oracle_ml.exe'],check=True)
    expected=run([native],out,log=out/'oracle.log');actual=run([ROOT/'build/g_items_complete_oracle_ml.exe'],ROOT/'build',log=out/'mini-oracle.log')
    if expected!=actual:raise RuntimeError('Missionpack item differential mismatch')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/g_items_complete_contracts.ml','--output','g_items_complete_contracts.exe'],check=True)
    empty=out/'empty.bsp';empty.write_bytes(tiny_bsp());contracts=run([ROOT/'build/g_items_complete_contracts.exe',empty],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 12 g_items complete contracts':raise RuntimeError(contracts)
    bsp,archives=retail(Path(a.data_root),out);retail_result=run([ROOT/'build/g_items_complete_contracts.exe',bsp],ROOT/'build',log=out/'retail-contracts.log').strip()
    if retail_result!=contracts:raise RuntimeError(retail_result)
    files=[facade,ROOT/'src/mq3/game/items.ml',ROOT/'src/mq3/game/spawn_tables.ml',ROOT/'src/mq3/game/constants.ml',ROOT/'tests/g_items_complete_contracts.ml',ROOT/'tests/g_items_complete_oracle.ml',native_src]
    result=dict(passed=True,symbols=len(entry['symbol_candidates']),baseq3_scenarios=20,missionpack_differential_lines=len(expected.splitlines()),contracts=12,retail_contracts=12,retail_map_sha256=sha(bsp),retail_archives={x.name:sha(x) for x in archives},scope='All 22 g_items.c symbols through the productive C-named facade; unchanged-C Baseq3 pickup, spawn, registration and physics suites; Team Arena persistent powerups, holdables, expanded catalog, team checks and dropped neutral flags; Retail q3dm1 and qagame QVM acceptance.',sources={x.relative_to(ROOT).as_posix():sha(x) for x in files},oracle_sha256=sha(native),test_sha256=sha(ROOT/'build/g_items_complete_contracts.exe'))
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['symbols']} g_items symbols / {result['baseq3_scenarios']} unchanged-C item scenarios + registration stream / {result['missionpack_differential_lines']} Missionpack lines / {result['contracts']} native + {result['retail_contracts']} Retail contracts")
if __name__=='__main__':main()
