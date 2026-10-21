#!/usr/bin/env python3
"""Unchanged UI_CreditMenu_Key differential and native credits contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
 out=ROOT/'build/reference/ui_credits';out.mkdir(parents=True,exist_ok=True);src=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_credits.c';inc=out/'ui_credits_under_test.inc';inc.write_text(extract(src,['UI_CreditMenu_Key']),encoding='utf-8',newline='\n');host=ROOT/'tests/reference/ui_credits_oracle.c';native=out/'oracle.exe';run(['cl','/nologo','/O2','/MT','/W4','/WX',f'/I{out}',host,f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'build.log');expected=run([native],out,log=out/'native.log')
 for source,name in [('tests/ui_credits_oracle.ml','ui_credits_oracle.exe'),('tests/ui_credits_contracts.ml','ui_credits_contracts.exe')]:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',name],cwd=ROOT,check=True)
 actual=run([ROOT/'build/ui_credits_oracle.exe'],ROOT/'build',log=out/'minilang.log');assert expected==actual,(expected,actual);contracts=run([ROOT/'build/ui_credits_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert contracts=='PASS: 7 UI credits contracts',contracts
 files=[src,host,ROOT/'src/mq3/client/ui_credits.ml',ROOT/'tests/ui_credits_oracle.ml',ROOT/'tests/ui_credits_contracts.ml'];result={'passed':True,'differential_records':3,'contracts':7,'functions':['UI_CreditMenu','UI_CreditMenu_Draw','UI_CreditMenu_Key'],'scope':'Complete credit-menu draw list, original integer y progression, key filtering, quit command and fullscreen wiring.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}};(out/'result.json').write_text(json.dumps(result,indent=2)+'\n');print('PASS: 3 unchanged C credits key records + 7 contracts')
if __name__=='__main__':main()
