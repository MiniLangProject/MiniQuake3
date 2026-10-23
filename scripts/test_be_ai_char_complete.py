#!/usr/bin/env python3
"""Complete be_ai_char.c symbol, unchanged-C, contract and Retail gate."""
import argparse,json,py_compile,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SYMBOLS=['BotCharacterFromHandle','BotDefaultCharacteristics','BotDumpCharacter','BotFindCachedCharacter','BotFreeCharacter','BotFreeCharacter2','BotFreeCharacterStrings','BotInterpolateCharacters','BotLoadCachedCharacter','BotLoadCharacter','BotLoadCharacterFromFile','BotLoadCharacterSkill','BotShutdownCharacters','Characteristic_BFloat','Characteristic_BInteger','Characteristic_Float','Characteristic_Integer','Characteristic_String','CheckCharacteristicIndex']
ORACLE=['BotCharacterFromHandle','BotDumpCharacter','BotFreeCharacterStrings','BotFreeCharacter2','BotFreeCharacter','BotDefaultCharacteristics','BotFindCachedCharacter','BotInterpolateCharacters','CheckCharacteristicIndex','Characteristic_Float','Characteristic_BFloat','Characteristic_Integer','Characteristic_BInteger','Characteristic_String','BotShutdownCharacters']
def build(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def normalize(value): return re.sub(r'(?<=\d)\.0?(?=,|\n|$)','',value.strip().replace('-0\n','0\n').replace('-0,','0,'))
def main():
 p=argparse.ArgumentParser();p.add_argument('--data-root',type=Path);a=p.parse_args();py_compile.compile(__file__,doraise=True)
 out=ROOT/'build/reference/be_ai_char_complete';out.mkdir(parents=True,exist_ok=True);original=ROOT/'Quake-III-Arena-original-source/code/botlib/be_ai_char.c';module=ROOT/'src/mq3/botlib/be_ai_char.ml';text=module.read_text(encoding='utf-8')
 missing=[name for name in SYMBOLS if not re.search(r'\bfunction\s+'+re.escape(name)+r'\s*\(',text)]
 if missing:raise RuntimeError('missing be_ai_char symbols: '+', '.join(missing))
 (out/'be_ai_char_complete_under_test.inc').write_text(extract(original,ORACLE),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/be_ai_char_complete_oracle.c';native=out/'oracle.exe';run(['cl','/nologo','/O2','/fp:strict','/MT','/W4','/WX','/wd4100','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
 c=run([native],out,log=out/'oracle.log');mini=run([build('tests/be_ai_char_complete_oracle.ml','be_ai_char_complete_oracle.exe')],ROOT/'build',log=out/'minilang.log')
 if normalize(c)!=normalize(mini):raise RuntimeError('be_ai_char unchanged-C mismatch\nC='+repr(c)+'\nMini='+repr(mini))
 contracts=run([build('tests/be_ai_char_complete_contracts.ml','be_ai_char_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 15 complete be_ai_char contracts':raise RuntimeError(contracts)
 retail='not requested'
 if a.data_root:
  pak=a.data_root/'baseq3/pak0.pk3';subprocess.run([sys.executable,ROOT/'scripts/test_ai_characters.py','--pak',pak],cwd=ROOT,check=True);subprocess.run([sys.executable,ROOT/'scripts/test_botlib_retail_qagame.py','--data-root',a.data_root],cwd=ROOT,check=True);retail='Sarge + qagame lifecycle'
 paths=[original,module,harness,ROOT/'tests/be_ai_char_complete_oracle.ml',ROOT/'tests/be_ai_char_complete_contracts.ml'];result={'passed':True,'symbols':len(SYMBOLS),'oracleFunctions':ORACLE,'differentialRecords':len(c.strip().splitlines()),'contracts':15,'retail':retail,'sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in paths}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');suffix=' + Retail qagame' if a.data_root else '';print(f"PASS: {len(SYMBOLS)}/19 be_ai_char symbols + {result['differentialRecords']} unchanged-C records + 15 contracts{suffix}")
if __name__=='__main__':main()
