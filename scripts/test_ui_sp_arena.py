#!/usr/bin/env python3
"""Unchanged UI_SPArena_Start differential and MiniLang contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
 out=ROOT/'build/reference/ui_sp_arena';out.mkdir(parents=True,exist_ok=True);src=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_sparena.c';inc=out/'ui_sparena_under_test.inc';inc.write_text(extract(src,['UI_SPArena_Start']),encoding='utf-8',newline='\n');host=ROOT/'tests/reference/ui_sp_arena_oracle.c';native=out/'oracle.exe';run(['cl','/nologo','/O2','/MT','/W4','/WX','/wd4090','/wd4244','/wd4996',f'/I{out}',host,f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'build.log');expected=run([native],out,log=out/'native.log')
 for source,name in [('tests/ui_sp_arena_oracle.ml','ui_sp_arena_oracle.exe'),('tests/ui_sp_arena_contracts.ml','ui_sp_arena_contracts.exe')]:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',name],cwd=ROOT,check=True)
 actual=run([ROOT/'build/ui_sp_arena_oracle.exe'],ROOT/'build',log=out/'minilang.log');assert expected==actual,(expected,actual);contracts=run([ROOT/'build/ui_sp_arena_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert contracts=='PASS: 7 UI single-player arena contracts',contracts
 files=[src,host,ROOT/'src/mq3/client/ui_sp_arena.ml',ROOT/'tests/ui_sp_arena_oracle.ml',ROOT/'tests/ui_sp_arena_contracts.ml'];result={'passed':True,'differential_records':4,'contracts':7,'function':'UI_SPArena_Start','scope':'Exact sv_maxclients minimum, arena number/training/final selection, tier lookup, ui_spSelection write and appended spmap command.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}};(out/'result.json').write_text(json.dumps(result,indent=2)+'\n');print('PASS: 4 unchanged C UI_SPArena_Start records + 7 contracts')
if __name__=='__main__':main()
