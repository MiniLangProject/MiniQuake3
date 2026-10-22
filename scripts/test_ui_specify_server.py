#!/usr/bin/env python3
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run
FUNCTIONS=['SpecifyServer_Cache','SpecifyServer_Event','SpecifyServer_MenuInit','UI_SpecifyServerMenu']
def main():
 s=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_specifyserver.c';t=s.read_text(errors='replace');[(_ for _ in ()).throw(AssertionError(n)) for n in FUNCTIONS if n not in t]
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ui_specify_server_contracts.ml','--output','ui_specify_server_contracts.exe'],cwd=ROOT,check=True);out=ROOT/'build/reference/ui_specify_server';out.mkdir(parents=True,exist_ok=True);a=run([ROOT/'build/ui_specify_server_contracts.exe'],ROOT/'build').strip();assert a=='PASS: 8 native UI specify server contracts (4 symbols)',a
 files=[s,ROOT/'src/mq3/client/ui_specify_server.ml',ROOT/'tests/ui_specify_server_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'contracts':8,'functions':FUNCTIONS,'sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n');print('PASS: 4 original UI specify server functions + 8 contracts')
if __name__=='__main__':main()
