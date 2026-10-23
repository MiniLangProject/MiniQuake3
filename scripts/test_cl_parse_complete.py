#!/usr/bin/env python3
"""Complete client/cl_parse.c facade, unchanged-C, native, productive and Retail gate."""
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def build(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output
def invoke(name,*args): subprocess.run([sys.executable,ROOT/'scripts'/name,*map(str,args)],cwd=ROOT,check=True)

def main():
    ap=argparse.ArgumentParser();ap.add_argument('--data-root',type=Path,default=Path('D:/Quake3'));ap.add_argument('--full-regression',action='store_true');args=ap.parse_args()
    out=ROOT/'build/reference/cl_parse_complete';out.mkdir(parents=True,exist_ok=True)
    ledger=json.loads((ROOT/'PORT_LEDGER.json').read_text(encoding='utf-8'));entry=next(x for x in ledger['files'] if x['source']=='code/client/cl_parse.c')
    facade=ROOT/'src/mq3/client/cl_parse_runtime.ml';text=facade.read_text(encoding='utf-8')
    missing=[name for name in entry['symbol_candidates'] if not re.search(rf'\bfunction\s+{re.escape(name)}\s*\(',text)]
    if missing: raise RuntimeError('missing cl_parse facade symbols: '+', '.join(missing))

    original=ROOT/'Quake-III-Arena-original-source/code/client/cl_parse.c'
    (out/'cl_parse_shownet_under_test.inc').write_text(extract(original,['SHOWNET']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/cl_parse_shownet_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/W3',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log');mini=run([build('tests/cl_parse_shownet_oracle.ml','cl_parse_shownet_oracle.exe')],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('SHOWNET unchanged-C mismatch\nC:\n'+native+'MiniLang:\n'+mini)

    contracts=run([build('tests/cl_parse_complete_contracts.ml','cl_parse_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 20 complete cl_parse contracts': raise RuntimeError(contracts)
    pak=(args.data_root/'baseq3/pak0.pk3').resolve()
    if not pak.is_file(): raise RuntimeError(f'missing Retail pak0.pk3: {pak}')
    retail=run([build('tests/cl_parse_retail_probe.ml','cl_parse_retail_probe.exe'),pak],ROOT/'build',log=out/'retail.log').strip()
    if not retail.startswith('PASS: retail cl_parse 5 checks '): raise RuntimeError(retail)

    dependencies=['test_snapshot_parse.py','test_snapshot_command.py','test_server_message.py','test_download.py','test_gamestate.py','test_protocol_runtime.py','test_system_info.py','test_client_network_ingress.py']
    for script in dependencies: invoke(script)
    exact=1
    for name in ['snapshot_parse','snapshot_command','server_message','download','gamestate','system_info']:
        report=json.loads((ROOT/f'build/reference/{name}/result.json').read_text(encoding='utf-8'));exact+=report.get('records',0)
    if args.full_regression: invoke('test_packet_event.py')
    files=[original,facade,ROOT/'src/mq3/client/server_message.ml',ROOT/'src/mq3/client/snapshot_command.ml',ROOT/'src/mq3/client/snapshot_parse.ml',harness,ROOT/'tests/cl_parse_shownet_oracle.ml',ROOT/'tests/cl_parse_complete_contracts.ml',ROOT/'tests/cl_parse_retail_probe.ml']
    report={'passed':True,'symbols':len(entry['symbol_candidates']),'unchanged_c_records':exact,'contracts':20,'retail':retail,'productive_ingress_contracts':21,'scope':'All client/cl_parse.c symbols through a C-named facade over the productive snapshot, server-message, gamestate, download and systeminfo paths. SHOWNET is integrated in the productive ServerMessage dispatcher at levels 1/2/3, including playerstate, packet-entity and snapshot summary lines; malformed area-mask and packet-entity tails propagate without promoting or advancing snapshot state; real localhost UDP ingress executes that dispatcher. Retail pak0 arenas bytes survive an outer gamestate message exactly.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {report['symbols']}/{report['symbols']} cl_parse symbols + {exact} unchanged-C records + 20 native contracts + 21 productive UDP contracts + Retail gamestate")
if __name__=='__main__': main()
