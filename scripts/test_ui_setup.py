#!/usr/bin/env python3
"""Complete symbol inventory and native contracts for ui_setup.c."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run
FUNCTIONS=['Setup_ResetDefaults_Action','Setup_ResetDefaults_Draw','UI_SetupMenu','UI_SetupMenu_Cache','UI_SetupMenu_Event','UI_SetupMenu_Init']
def main():
    source=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_setup.c';text=source.read_text(encoding='utf-8',errors='replace')
    for name in FUNCTIONS: assert name in text,name
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ui_setup_contracts.ml','--output','ui_setup_contracts.exe'],cwd=ROOT,check=True)
    out=ROOT/'build/reference/ui_setup';out.mkdir(parents=True,exist_ok=True);actual=run([ROOT/'build/ui_setup_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert actual=='PASS: 14 native UI setup contracts (6 symbols)',actual
    files=[source,ROOT/'src/mq3/client/ui_setup.ml',ROOT/'tests/ui_setup_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'contracts':14,'source_functions':6,'functions':FUNCTIONS,'scope':'Complete setup menu layout/navigation, paused default visibility, reset confirmation/warning, exact default.cfg/cvar/video restart command sequence, cache and stack lifecycle.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n')
    print('PASS: 6 original UI setup functions + 14 contracts')
if __name__=='__main__':main()
