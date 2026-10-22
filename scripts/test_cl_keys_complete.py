#!/usr/bin/env python3
"""Complete cl_keys.c facade, unchanged-C, native and Retail gate."""
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run

SYMBOLS=['CL_AddKeyUpCommands','CL_CharEvent','CL_InitKeyCommands','CL_KeyEvent','Console_Key','Field_BigDraw','Field_CharEvent','Field_Draw','Field_KeyDownEvent','Field_Paste','Field_VariableSizeDraw','Key_Bind_f','Key_Bindlist_f','Key_ClearStates','Key_GetBinding','Key_GetKey','Key_GetOverstrikeMode','Key_IsDown','Key_SetBinding','Key_SetOverstrikeMode','Key_StringToKeynum','Key_Unbind_f','Key_Unbindall_f','Key_WriteBindings','Message_Key','Key_KeynumToString']
def build(source,output): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def invoke(name,*args): subprocess.run([sys.executable,ROOT/'scripts'/name,*map(str,args)],cwd=ROOT,check=True)
def main():
 parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path,default=Path('D:/Quake3'));parser.add_argument('--full-regression',action='store_true');args=parser.parse_args();out=ROOT/'build/reference/cl_keys_complete';out.mkdir(parents=True,exist_ok=True)
 original=ROOT/'Quake-III-Arena-original-source/code/client/cl_keys.c';facade=ROOT/'src/mq3/client/cl_keys_runtime.ml';source=facade.read_text(encoding='utf-8');missing=[name for name in SYMBOLS if not re.search(rf'\bfunction\s+{name}\s*\(',source)]
 if missing: raise RuntimeError('missing cl_keys facade symbols: '+', '.join(missing))
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
 files=[original,facade,ROOT/'src/mq3/vm/cgame_key_traps.ml',ROOT/'src/mq3/client/console_input.ml',ROOT/'src/mq3/client/key_binding_dispatch.ml',ROOT/'src/mq3/client/key_bindings_config.ml',ROOT/'tests/cl_keys_complete_contracts.ml',ROOT/'tests/cl_keys_retail_probe.ml']
 report={'passed':True,'symbols':len(SYMBOLS),'unchanged_c_records':sum(exact),'contracts':32,'retail':retail,'retail_pak_sha256':sha(pak),'scope':'All 26 cl_keys.c symbols through a C-named native facade: exact Baseq3 connstate_t ABI, textual key ABI, binding commands and persistence, field drawing/editing/paste, state-sensitive console/UI/cinematic routing, timestamped key events and catcher ownership, checked against unchanged C and Retail default.cfg.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: 26/26 cl_keys symbols + {sum(exact)} unchanged-C records + 32 native contracts + Retail default.cfg")
if __name__=='__main__': main()
