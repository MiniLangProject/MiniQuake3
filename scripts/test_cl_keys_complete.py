#!/usr/bin/env python3
"""Complete cl_keys.c facade, unchanged-C, native and Retail gate."""
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run

SYMBOLS=['CL_AddKeyUpCommands','CL_CharEvent','CL_InitKeyCommands','CL_KeyEvent','Console_Key','Field_BigDraw','Field_CharEvent','Field_Draw','Field_KeyDownEvent','Field_Paste','Field_VariableSizeDraw','Key_Bind_f','Key_Bindlist_f','Key_ClearStates','Key_GetBinding','Key_GetKey','Key_GetOverstrikeMode','Key_IsDown','Key_SetBinding','Key_SetOverstrikeMode','Key_StringToKeynum','Key_Unbind_f','Key_Unbindall_f','Key_WriteBindings','Message_Key','Key_KeynumToString']
HEADER_FUNCTIONS=['Field_KeyDownEvent','Field_CharEvent','Field_Draw','Field_BigDraw','Key_WriteBindings','Key_SetBinding','Key_GetBinding','Key_IsDown','Key_GetOverstrikeMode','Key_SetOverstrikeMode','Key_ClearStates','Key_GetKey']
HEADER_GLOBALS=['key_overstrikeMode','keys','historyEditLines','g_consoleField','chatField','anykeydown','chat_team','chat_playerNum']
def build(source,output): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def invoke(name,*args): subprocess.run([sys.executable,ROOT/'scripts'/name,*map(str,args)],cwd=ROOT,check=True)
def main():
 parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path,default=Path('D:/Quake3'));parser.add_argument('--full-regression',action='store_true');args=parser.parse_args();out=ROOT/'build/reference/cl_keys_complete';out.mkdir(parents=True,exist_ok=True)
 original=ROOT/'Quake-III-Arena-original-source/code/client/cl_keys.c';header=ROOT/'Quake-III-Arena-original-source/code/client/keys.h';facade=ROOT/'src/mq3/client/cl_keys_runtime.ml';source=facade.read_text(encoding='utf-8');missing=[name for name in SYMBOLS if not re.search(rf'\bfunction\s+{name}\s*\(',source)]
 if missing: raise RuntimeError('missing cl_keys facade symbols: '+', '.join(missing))
 header_text=header.read_text(encoding='latin1')
 missing_header=[name for name in HEADER_FUNCTIONS+HEADER_GLOBALS if not re.search(rf'\b{re.escape(name)}\b',header_text)]
 missing_header += [name for name in HEADER_FUNCTIONS if not re.search(rf'\bfunction\s+{re.escape(name)}\s*\(',source)]
 runtime_surface=(source+(ROOT/'src/mq3/client/console_input.ml').read_text(encoding='utf-8')).lower()
 managed_globals={'key_overstrikeMode':'overstrike','keys':'keyState','historyEditLines':'history','g_consoleField':'console','chatField':'chat','anykeydown':'anyKeyDown','chat_team':'chatTeam','chat_playerNum':'chatPlayerNum'}
 missing_header += [name for name,target in managed_globals.items() if target.lower() not in runtime_surface]
 if missing_header: raise RuntimeError('missing keys.h surface: '+', '.join(sorted(set(missing_header))))
 for define,value in [('MAX_KEYS','256'),('COMMAND_HISTORY','32')]:
  if not re.search(rf'#define\s+{define}\s+{value}\b',header_text): raise RuntimeError(f'keys.h {define} drift')
 if not all(re.search(rf'\b{name}\b',header_text) for name in ['qkey_t','down','repeats','binding']): raise RuntimeError('keys.h qkey_t drift')
 contracts=run([build('tests/cl_keys_complete_contracts.ml','cl_keys_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 32 complete cl_keys contracts': raise RuntimeError(contracts)
 pak=(args.data_root/'baseq3/pak0.pk3').resolve()
 if not pak.is_file(): raise RuntimeError(f'Retail pak0.pk3 missing: {pak}')
 retail=run([build('tests/cl_keys_retail_probe.ml','cl_keys_retail_probe.exe'),pak],ROOT/'build',log=out/'retail.log').strip()
 if not retail.startswith('PASS: retail cl_keys default.cfg '): raise RuntimeError(retail)
 invoke('test_cgame_key_traps.py');invoke('test_key_binding_dispatch.py');invoke('test_console_input.py')
 exact=[]
 for name in ['cgame_key_traps','key_binding_dispatch','console_input']: exact.append(json.loads((ROOT/f'build/reference/{name}/result.json').read_text(encoding='utf-8'))['records'])
 if args.full_regression: invoke('test_cgame_syscalls.py');invoke('test_cvar_config.py')
 files=[original,header,facade,ROOT/'src/mq3/vm/cgame_key_traps.ml',ROOT/'src/mq3/client/console_input.ml',ROOT/'src/mq3/client/key_binding_dispatch.ml',ROOT/'src/mq3/client/key_bindings_config.ml',ROOT/'tests/cl_keys_complete_contracts.ml',ROOT/'tests/cl_keys_retail_probe.ml']
 report={'passed':True,'symbols':len(SYMBOLS),'header_functions':len(HEADER_FUNCTIONS),'header_globals':len(HEADER_GLOBALS),'unchanged_c_records':sum(exact),'contracts':32,'retail':retail,'retail_pak_sha256':sha(pak),'scope':'All 26 cl_keys.c symbols and the complete keys.h declaration surface through a C-named native facade: qkey state, globals, field editing/drawing, exact Baseq3 connstate_t ABI, textual key ABI, binding commands and persistence, state-sensitive console/UI/cinematic routing, timestamped key events and catcher ownership, checked against unchanged C and Retail default.cfg.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: 26/26 cl_keys symbols + keys.h 12 functions/8 globals + {sum(exact)} unchanged-C records + 32 native contracts + Retail default.cfg")
if __name__=='__main__': main()
