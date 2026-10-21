#!/usr/bin/env python3
"""Source-shape and native contracts for ui_network.c and ui_options.c."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run
def main():
    network=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_network.c';options=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_options.c'
    nt=network.read_text(encoding='utf-8',errors='replace');ot=options.read_text(encoding='utf-8',errors='replace')
    for name in ['UI_NetworkOptionsMenu_Event','UI_NetworkOptionsMenu_Init','UI_NetworkOptionsMenu_Cache','UI_NetworkOptionsMenu']: assert name in nt,name
    for name in ['Options_Event','Options_MenuInit','SystemConfig_Cache','UI_SystemConfigMenu']: assert name in ot,name
    for number in ['2500','3000','4000','5000','25000']: assert number in nt,number
    assert 'cstate.connState >= CA_CONNECTED' in ot
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ui_network_options_contracts.ml','--output','ui_network_options_contracts.exe'],cwd=ROOT,check=True)
    out=ROOT/'build/reference/ui_network_options';out.mkdir(parents=True,exist_ok=True);actual=run([ROOT/'build/ui_network_options_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert actual=='PASS: 10 UI network/system contracts',actual
    files=[network,options,ROOT/'src/mq3/client/ui_network_options.ml',ROOT/'src/mq3/client/ui_system_config.ml',ROOT/'tests/ui_network_options_contracts.ml']
    (out/'result.json').write_text(json.dumps({'passed':True,'source_functions':8,'contracts':10,'scope':'Complete network rate mapping and system configuration menu routing, topology, cache and connection-dependent fullscreen state.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n')
    print('PASS: 8 original UI network/system functions + 10 contracts')
if __name__=='__main__':main()
