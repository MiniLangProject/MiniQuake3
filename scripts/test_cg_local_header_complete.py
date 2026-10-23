#!/usr/bin/env python3
"""Complete cg_local.h ABI, record and declaration parity gate."""
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run

def build(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
 return ROOT/'build'/output

def string_inventory(source,name):
 match=re.search(r'function\s+'+re.escape(name)+r'\(\)\s+return\s*\[(.*?)\]\s*end function',source,re.S)
 if not match: raise RuntimeError(f'cg_local.h missing {name} inventory')
 return re.findall(r'"([^"]*)"',match.group(1))

def parse_header(source):
 clean=re.sub(r'/\*.*?\*/','',source,flags=re.S);clean=re.sub(r'//[^\n]*','',clean)
 defines=list(dict.fromkeys(re.findall(r'^\s*#define\s+(\w+)\b',clean,re.M)))
 no_pp=re.sub(r'^\s*#.*$','',clean,flags=re.M)
 enums=[];types=[];structs={}
 for match in re.finditer(r'typedef\s+(struct(?:\s+\w+)?|enum)\s*\{(.*?)\}\s*(\w+)\s*;',no_pp,re.S):
  kind,body,name=match.groups();types.append(name)
  if kind=='enum': enums.extend(re.findall(r'^\s*([A-Z][A-Z0-9_]*)\s*(?:=\s*[^,]+)?\s*,?',body,re.M));continue
  fields=[]
  for statement in body.split(';'):
   statement=' '.join(statement.split())
   if not statement: continue
   pointer=re.search(r'\(\s*\*\s*(\w+)\s*\)',statement)
   if pointer: fields.append(pointer.group(1));continue
   statement=re.sub(r'\[[^]]*\]','',statement)
   for part in statement.split(','):
    field=re.search(r'([A-Za-z_]\w*)\s*$',part)
    if field: fields.append(field.group(1))
  structs[name]=fields
 statements=[];start=0;depth=0
 for index,char in enumerate(no_pp):
  if char=='{': depth+=1
  elif char=='}': depth-=1
  elif char==';' and depth==0:
   value=' '.join(no_pp[start:index+1].split());start=index+1
   if value: statements.append(value)
 functions=[];globals=[]
 for value in statements:
  if value.startswith('typedef '): continue
  if '(' in value:
   name=re.search(r'([A-Za-z_]\w*)\s*$',value[:value.find('(')])
   if name and name.group(1) not in functions:functions.append(name.group(1))
  elif value.startswith('extern '):
   name=re.search(r'([A-Za-z_]\w*)\s*(?:\[[^]]*\])?\s*;$',value)
   if name and name.group(1) not in globals:globals.append(name.group(1))
 return defines,list(dict.fromkeys(enums)),types,structs,functions,globals

def main():
 out=ROOT/'build/reference/cg_local_header';out.mkdir(parents=True,exist_ok=True)
 header=ROOT/'Quake-III-Arena-original-source/code/cgame/cg_local.h';facade=ROOT/'src/mq3/client/cg_local.ml'
 original=header.read_text(encoding='latin1');ported=facade.read_text(encoding='utf-8')
 defines,enums,types,structs,functions,globals=parse_header(original)
 missing=[name for name in defines+enums if not re.search(r'\bconst\s+'+re.escape(name)+r'\s*=',ported)]
 if missing: raise RuntimeError(f'cg_local.h missing constants/enums: {missing}')
 if string_inventory(ported,'typeNames')!=types: raise RuntimeError('cg_local.h type inventory mismatch')
 for name,fields in structs.items():
  inventory=name.replace('_t','')+'FieldNames'
  if string_inventory(ported,inventory)!=fields: raise RuntimeError(f'cg_local.h {name} field inventory mismatch')
 if string_inventory(ported,'declarationNames')!=functions: raise RuntimeError('cg_local.h function declaration inventory mismatch')
 if string_inventory(ported,'globalNames')!=globals: raise RuntimeError('cg_local.h global declaration inventory mismatch')
 expected=''
 for mode,define in [('base',None),('missionpack','/DMISSIONPACK')]:
  oracle=out/f'cg_local_header_{mode}_oracle.exe';command=['cl','/nologo','/Od','/MT','/W4','/WX','/DWIN32']
  if define: command.append(define)
  command += [ROOT/'tests/reference/cg_local_header_oracle.c',f'/Fe:{oracle}','/link','/Brepro']
  run(command,ROOT,msvc_env('x86'),out/f'{mode}-oracle-build.log')
  expected+=run([oracle],out,log=out/f'{mode}-oracle.log').replace('\r\n','\n')
 actual=run([build('tests/cg_local_header_oracle.ml','cg_local_header_oracle.exe')],ROOT/'build',log=out/'minilang.log').replace('\r\n','\n')
 if expected!=actual:
  (out/'expected.txt').write_text(expected,encoding='utf-8');(out/'actual.txt').write_text(actual,encoding='utf-8');raise RuntimeError('cg_local.h unchanged 32-bit C ABI mismatch')
 contracts=run([build('tests/cg_local_header_contracts.ml','cg_local_header_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 15 cg_local.h ABI contracts': raise RuntimeError(contracts)
 productive=[ROOT/'src/mq3/client'/name for name in ['cgame_localents.ml','cgame_effects.ml','cgame_weapons.ml','cgame_view.ml','cgame_players.ml','cgame_playerstate.ml','cgame_event.ml','cgame_marks.ml','cgame_servercmds.ml']]
 files=[header,facade,*productive,ROOT/'tests/reference/cg_local_header_oracle.c',ROOT/'tests/cg_local_header_oracle.ml',ROOT/'tests/cg_local_header_contracts.ml']
 result={'passed':True,'defines':len(defines),'enum_members':len(enums),'types':len(types),'struct_fields':sum(map(len,structs.values())),'declarations':len(functions),'globals':len(globals),'exact_records':len(expected.splitlines()),'contracts':15,'sources':{str(path.relative_to(ROOT)).replace('\\','/'):sha(path) for path in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f'PASS: cg_local.h {len(defines)} defines + {len(enums)} enum members + {len(types)} types / {sum(map(len,structs.values()))} fields + {len(functions)} functions + {len(globals)} globals + {len(expected.splitlines())} exact ABI records + 15 contracts')
if __name__=='__main__':main()
