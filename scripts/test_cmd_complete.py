#!/usr/bin/env python3
"""Complete coverage gate for qcommon/cmd.c."""
from __future__ import annotations
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT

SOURCE=ROOT/'Quake-III-Arena-original-source/code/qcommon/cmd.c'
PORT=ROOT/'src/mq3/qcommon/command_buffer.ml'
SURFACES={
 'Cmd_Wait_f':'waitCommand','Cbuf_Init':'create','Cbuf_AddText':'addText',
 'Cbuf_InsertText':'insertText','Cbuf_ExecuteText':'executeText','Cbuf_Execute':'execute',
 'Cmd_Exec_f':'execCommand','Cmd_Vstr_f':'vstrCommand','Cmd_Echo_f':'echoCommand',
 'Cmd_Argc':'argc','Cmd_Argv':'argv','Cmd_ArgvBuffer':'argvBuffer','Cmd_Args':'args',
 'Cmd_ArgsFrom':'argsFrom','Cmd_ArgsBuffer':'argsBuffer','Cmd_Cmd':'cmd',
 'Cmd_TokenizeString':'tokenizeString','Cmd_AddCommand':'addCommand',
 'Cmd_RemoveCommand':'removeCommand','Cmd_CommandCompletion':'commandCompletion',
 'Cmd_ExecuteString':'executeString','Cmd_List_f':'listCommand','Cmd_Init':'initCommands',
}

def main()->int:
  original=SOURCE.read_text(encoding='utf-8');ported=PORT.read_text(encoding='utf-8')
  absent=[name for name in SURFACES if not re.search(r'\b'+re.escape(name)+r'\s*\(',original)]
  missing=[name for name,target in SURFACES.items() if not re.search(r'\bfunction\s+'+re.escape(target)+r'\s*\(',ported)]
  if absent or missing:raise RuntimeError(f'cmd surface drift original={absent} port={missing}')
  subprocess.run([sys.executable,ROOT/'scripts/test_command_buffer.py'],cwd=ROOT,check=True)
  subprocess.run([sys.executable,ROOT/'scripts/test_command_registry.py'],cwd=ROOT,check=True)
  first=json.loads((ROOT/'build/reference/command_buffer/result.json').read_text(encoding='utf-8'))
  second=json.loads((ROOT/'build/reference/command_registry/result.json').read_text(encoding='utf-8'))
  if not first.get('passed') or not second.get('passed'):raise RuntimeError('component cmd gate failed')
  out=ROOT/'build/reference/cmd_complete';out.mkdir(parents=True,exist_ok=True)
  result={'passed':True,'symbols':len(SURFACES),'unchanged_c_records':first['records']+second['records'],'contracts':second['contracts'],'scope':'All cmd.c command-buffer, tokenizer, argv, registry, dispatch, completion and builtin surfaces. Filesystem, Cvar and VM dispatch remain explicit productive services.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in [SOURCE,PORT,ROOT/'scripts/test_command_buffer.py',ROOT/'scripts/test_command_registry.py']}}
  (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
  print(f"PASS: {len(SURFACES)}/{len(SURFACES)} cmd.c functions + {result['unchanged_c_records']} unchanged-C records + {result['contracts']} native contracts")
  return 0
if __name__=='__main__':raise SystemExit(main())
