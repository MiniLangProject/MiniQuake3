#!/usr/bin/env python3
"""Complete nine-header Botlib ABI, unchanged-C, productive wiring and Retail gate."""
from __future__ import annotations
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
HEADERS=('be_aas.h','be_ai_char.h','be_ai_chat.h','be_ai_gen.h','be_ai_goal.h','be_ai_move.h','be_ai_weap.h','be_ea.h','botlib.h')
def clean(text:str)->str:
 text=re.sub(r'/\*.*?\*/',' ',text,flags=re.S);text=re.sub(r'//[^\n]*',' ',text);return text.replace('\\\n',' ')
def parse():
 root=ROOT/'Quake-III-Arena-original-source/code/game';constants=[];types=[];declarations=[];structs={}
 for name in HEADERS:
  text=clean((root/name).read_text(encoding='latin1'))
  for match in re.finditer(r'^\s*#\s*define\s+([A-Za-z_]\w*)(?!\s*\()\s*([^\n]*)',text,re.M):
   symbol,value=match.group(1),match.group(2).strip()
   if symbol!='BSPTRACE' and value and not value.startswith('typedef'): constants.append(symbol)
  for match in re.finditer(r'typedef\s+(?:struct(?:\s+\w+)?|enum)\s*\{(.*?)\}\s*([A-Za-z_]\w*)\s*;',text,re.S):
   body,type_name=match.groups();types.append(type_name);fields=[]
   if not match.group(0).lstrip().startswith('typedef enum'):
    fields+=re.findall(r'\(\s*(?:QDECL\s*)?\*\s*([A-Za-z_]\w*)\s*\)',body)
    for statement in body.split(';'):
     if '(*' in statement or '(QDECL *' in statement or not statement.strip():continue
     parts=' '.join(statement.split()).split(None,1)
     if len(parts)<2:continue
     for item in parts[1].split(','):
      field=re.search(r'\**\s*([A-Za-z_]\w*)\s*(?:\[[^]]*\])?\s*$',item.strip())
      if field:fields.append(field.group(1))
    structs[type_name]=fields
  declarations+=re.findall(r'^\s*(?!typedef)(?:[A-Za-z_]\w*[\s*]+)+([A-Za-z_]\w*)\s*\([^;]*\)\s*;',text,re.M)
 return constants,types,declarations,structs
def exported(text:str,function:str)->list[str]:
 match=re.search(r'function\s+'+re.escape(function)+r'\(\)\s+return\s+\[(.*?)\]\s+end function',text,re.S)
 if not match:raise RuntimeError(f'missing {function}')
 return re.findall(r'"([A-Za-z_]\w*)"',match.group(1))
def build(source:str,output:str)->Path:
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def invoke(script:str,*args:object)->str:
 result=subprocess.run([sys.executable,ROOT/'scripts'/script,*map(str,args)],cwd=ROOT,text=True,capture_output=True,check=True,timeout=900);return result.stdout.strip()
def main()->int:
 parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path,default=Path('D:/Quake3'));args=parser.parse_args()
 constants,types,declarations,structs=parse();facade=ROOT/'src/mq3/botlib/public_headers.ml';text=facade.read_text(encoding='utf-8')
 expected=(156,25,113,24,333);actual=(len(constants),len(types),len(declarations),len(structs),sum(map(len,structs.values())))
 if actual!=expected:raise RuntimeError(f'original Botlib header inventory drift: {actual}')
 if exported(text,'constantNames')!=constants:raise RuntimeError('constant inventory differs from original header order')
 if exported(text,'typeNames')!=types:raise RuntimeError('type inventory differs from original header order')
 if exported(text,'declarationNames')!=declarations:raise RuntimeError('declaration inventory differs from original header order')
 if exported(text,'structNames')!=list(structs):raise RuntimeError('struct inventory differs from original header order')
 for name,fields in structs.items():
  if exported(text,name+'Fields')!=fields:raise RuntimeError(f'{name} fields differ from original header')
 wiring={
  'src/mq3/botlib/be_interface.ml':['BOTLIB_API_VERSION','BLERR_LIBRARYNOTSETUP'],
  'src/mq3/botlib/aas_routing.ml':['TFL_DEFAULT','TFL_ELEVATOR'],
  'src/mq3/botlib/elementary_actions.ml':['ACTION_ATTACK','ACTION_FOLLOWME'],
  'src/mq3/botlib/ai_move_runtime.ml':['MOVE_WALK','MFL_ACTIVEGRAPPLE'],
  'src/mq3/botlib/ai_resource_pools.ml':['MAX_GOALSTACK','MAX_AVOIDGOALS'],
  'src/mq3/botlib/ai_chat_profiles.ml':['CHAT_GENDERMALE','MAX_MESSAGE_SIZE'],
 }
 for relative,names in wiring.items():
  product=(ROOT/relative).read_text(encoding='utf-8')
  if 'mq3.botlib.public_headers' not in product:raise RuntimeError(f'missing public header wiring in {relative}')
  for name in names:
   if not re.search(r'^const\s+'+name+r'=publicHeaders\.'+name+r'$',product,re.M):raise RuntimeError(f'{relative} does not consume {name}')
 # Regression guard: previous routing constant omitted TFL_ELEVATOR.
 if not re.search(r'^const TFL_DEFAULT=publicHeaders\.TFL_DEFAULT$',(ROOT/'src/mq3/botlib/aas_routing.ml').read_text(),re.M):raise RuntimeError('TFL_DEFAULT regression')
 out=ROOT/'build/reference/botlib_public_headers';out.mkdir(parents=True,exist_ok=True);oracle=out/'botlib_public_headers_oracle.exe'
 run(['cl','/nologo','/Od','/MT','/W4','/WX',ROOT/'tests/reference/botlib_public_headers_oracle.c',f'/Fe:{oracle}','/link','/Brepro'],ROOT,msvc_env('x86'),out/'oracle-build.log')
 expected_out=run([oracle],out,log=out/'oracle.log').replace('\r\n','\n');actual_out=run([build('tests/botlib_public_headers_oracle.ml','botlib_public_headers_oracle_ml.exe')],ROOT/'build',log=out/'minilang.log').replace('\r\n','\n')
 if expected_out!=actual_out:
  (out/'expected.txt').write_text(expected_out,encoding='utf-8');(out/'actual.txt').write_text(actual_out,encoding='utf-8');raise RuntimeError('unchanged x86 C ABI mismatch')
 contracts=run([build('tests/botlib_public_headers_contracts.ml','botlib_public_headers_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 20 Botlib public header contracts':raise RuntimeError(contracts)
 pak=args.data_root/'baseq3/pak0.pk3'
 if not pak.is_file():raise RuntimeError(f'Retail pak0.pk3 missing: {pak}')
 retail=invoke('test_aas_routing.py','--pak',pak)
 interface=invoke('test_be_interface_complete.py')
 chat=invoke('test_ai_chat_profiles.py','--pak',pak)
 movement=invoke('test_ai_move_runtime.py')
 files=[ROOT/'Quake-III-Arena-original-source/code/game'/x for x in HEADERS]+[facade,ROOT/'tests/reference/botlib_public_headers_oracle.c',ROOT/'tests/botlib_public_headers_oracle.ml',ROOT/'tests/botlib_public_headers_contracts.ml']+[ROOT/x for x in wiring]
 result={'passed':True,'headers':9,'constants':156,'types':25,'declarations':113,'structs':24,'fields':333,'exact_records':len(expected_out.splitlines()),'contracts':20,'retail_routing':retail.splitlines()[-1],'interface':interface.splitlines()[-1],'retail_chat':chat.splitlines()[-1],'movement':movement.splitlines()[-1],'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print('PASS: 9 Botlib public headers / 156 constants + 25 types + 113 declarations + 24 structs + 333 fields + 181 EC records + 20 contracts + Retail routing/chat')
 return 0
if __name__=='__main__':raise SystemExit(main())
