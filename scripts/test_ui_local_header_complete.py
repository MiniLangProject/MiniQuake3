#!/usr/bin/env python3
"""Complete q3_ui/ui_local.h ABI, declaration and retail-data gate."""
import argparse,json,re,subprocess,sys,zipfile
from inventory import sha
from toolchain import ROOT,msvc_env,run

def build(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
 return ROOT/'build'/output

def main():
 parser=argparse.ArgumentParser();parser.add_argument('--data-root');args=parser.parse_args()
 out=ROOT/'build/reference/ui_local_header';out.mkdir(parents=True,exist_ok=True)
 header=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_local.h';module=ROOT/'src/mq3/client/ui_local.ml';qmenu=ROOT/'src/mq3/client/ui_qmenu.ml';original=header.read_text(encoding='latin1');clean=re.sub(r'/\*.*?\*/|//[^\n]*','',original,flags=re.S);ported=module.read_text(encoding='utf-8')
 defines=[n for n in re.findall(r'^\s*#define\s+(\w+)',clean,re.M) if n!='__UI_LOCAL_H__'];types=re.findall(r'typedef\s+[^;]*?\(\s*\*\s*(\w+)\s*\)\s*\([^;]*\)\s*;',clean,re.S)
 for n in re.findall(r'}\s*(\w+)\s*;',clean):
  if n not in types:types.append(n)
 functions=[]
 for m in re.finditer(r'^\s*(?:extern\s+)?(?:[\w*]+(?:\s+|\s*\*\s*))+([A-Za-z_]\w*)\s*\([^;{}]*\)\s*;',clean,re.M):
  n=m.group(1)
  if n!='void' and n not in functions:functions.append(n)
 globals=[]
 for line in clean.splitlines():
  if not line.strip().startswith('extern ') or '(' in line:continue
  m=re.search(r'\b([A-Za-z_]\w*)\s*(?:\[[^;]*\])?\s*;',line)
  if m and m.group(1) not in globals:globals.append(m.group(1))
 missing_defines=[n for n in defines if not re.search(r'\bconst\s+'+re.escape(n)+r'\s*=',ported)]
 missing_types=[n for n in types if '"'+n+'"' not in ported]
 missing_functions=[n for n in functions if '"'+n+'"' not in ported]
 missing_globals=[n for n in globals if '"'+n+'"' not in ported]
 if any((missing_defines,missing_types,missing_functions,missing_globals)):raise RuntimeError(f'ui_local.h coverage defines={missing_defines} types={missing_types} functions={missing_functions} globals={missing_globals}')
 oracle=out/'oracle.exe';run(['cl','/nologo','/Od','/MT','/W4','/WX','/DWIN32',ROOT/'tests/reference/ui_local_header_oracle.c',f'/Fe:{oracle}','/link','/Brepro'],ROOT,msvc_env('x86'),out/'oracle-build.log')
 expected=run([oracle],out,log=out/'oracle.log').replace('\r\n','\n');actual=run([build('tests/ui_local_header_oracle.ml','ui_local_header_oracle.exe')],ROOT/'build',log=out/'minilang.log').replace('\r\n','\n')
 if expected!=actual:raise RuntimeError(f'ui_local.h unchanged-C mismatch\n--- C ---\n{expected}\n--- MiniLang ---\n{actual}')
 contracts=run([build('tests/ui_local_header_contracts.ml','ui_local_header_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 12 ui_local.h ABI contracts':raise RuntimeError(contracts)
 retail=[]
 if args.data_root:
  pak=ROOT/args.data_root if not __import__('pathlib').Path(args.data_root).is_absolute() else __import__('pathlib').Path(args.data_root);pak=pak/'baseq3/pak0.pk3'
  if not pak.is_file():raise RuntimeError(f'missing retail pak: {pak}')
  with zipfile.ZipFile(pak) as z:names={n.lower() for n in z.namelist()}
  retail=['vm/ui.qvm','menu/art/3_cursor2.tga','menu/art/font1_prop.tga','sound/misc/menu1.wav']
  missing=[n for n in retail if n not in names]
  if missing:raise RuntimeError(f'missing retail UI payload: {missing}')
 files=(header,module,qmenu,ROOT/'tests/reference/ui_local_header_oracle.c',ROOT/'tests/ui_local_header_oracle.ml',ROOT/'tests/ui_local_header_contracts.ml')
 result={'passed':True,'defines':len(defines),'types':len(types),'functions':len(functions),'globals':len(globals),'exact_records':len(expected.splitlines()),'contracts':12,'retail_files':retail,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');suffix=f' + {len(retail)} retail UI files' if retail else '';print(f'PASS: ui_local.h {len(defines)} defines + {len(types)} types + {len(functions)} functions + {len(globals)} globals + {len(expected.splitlines())} exact records + 12 contracts{suffix}')
if __name__=='__main__':main()
