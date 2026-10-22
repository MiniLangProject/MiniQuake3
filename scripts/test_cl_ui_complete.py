#!/usr/bin/env python3
"""Complete native, unchanged-C and Retail gate for client/cl_ui.c."""
from __future__ import annotations
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SOURCE=ROOT/'Quake-III-Arena-original-source/code/client/cl_ui.c';PORT=ROOT/'src/mq3/client/cl_ui_runtime.ml'
EXPECTED=['CLUI_GetCDKey','CLUI_SetCDKey','CL_GetGlconfig','CL_InitUI','CL_ShutdownUI','CL_UISystemCalls','FloatAsInt','GetClientState','GetClipboardData','GetConfigString','Key_GetBindingBuf','Key_GetCatcher','Key_KeynumToStringBuf','Key_SetCatcher','LAN_AddServer','LAN_ClearPing','LAN_CompareServers','LAN_GetPing','LAN_GetPingInfo','LAN_GetPingQueueCount','LAN_GetServerAddressString','LAN_GetServerCount','LAN_GetServerInfo','LAN_GetServerPing','LAN_GetServerPtr','LAN_GetServerStatus','LAN_LoadCachedServers','LAN_MarkServerVisible','LAN_RemoveServer','LAN_ResetPings','LAN_SaveServersToCache','LAN_ServerIsVisible','LAN_UpdateVisiblePings','UI_GameCommand','UI_usesUniqueCDKey']
def functions(text:str)->set[str]: return set(re.findall(r'\bfunction\s+([A-Za-z_]\w*)\s*\(',text))
def invoke(script:str,*args:object)->None: subprocess.run([sys.executable,ROOT/'scripts'/script,*map(str,args)],cwd=ROOT,check=True)
def main()->int:
  parser=argparse.ArgumentParser();parser.add_argument('--data-root',default='D:/Quake3');args=parser.parse_args();source=SOURCE.read_text(encoding='utf-8',errors='replace');ports=functions(PORT.read_text(encoding='utf-8'))
  missing_source=sorted(name for name in EXPECTED if not re.search(r'\b'+re.escape(name)+r'\s*\(',source));missing_port=sorted(set(EXPECTED)-ports)
  if missing_source or missing_port: raise RuntimeError(f'cl_ui symbol mismatch source={missing_source} port={missing_port}')
  out=ROOT/'build/reference/cl_ui_complete';out.mkdir(parents=True,exist_ok=True)
  invoke('build.py','--source','tests/cl_ui_complete_contracts.ml','--output','cl_ui_complete_contracts.exe');contracts=run([ROOT/'build/cl_ui_complete_contracts.exe'],ROOT/'build').strip()
  if contracts!='PASS: 36 complete cl_ui contracts': raise RuntimeError(contracts)
  (out/'cl_ui_under_test.inc').write_text(extract(SOURCE,['FloatAsInt']),encoding='utf-8',newline='\n');harness=ROOT/'tests/reference/cl_ui_oracle.c';oracle=out/'oracle.exe'
  run(['cl','/nologo','/Od','/MT','/W4','/WX','/fp:strict',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log');unchanged=run([oracle],out,log=out/'oracle.log')
  invoke('build.py','--source','tests/cl_ui_oracle.ml','--output','cl_ui_oracle.exe');native=run([ROOT/'build/cl_ui_oracle.exe'],ROOT/'build',log=out/'minilang.log')
  if unchanged!=native: raise RuntimeError('cl_ui unchanged-C mismatch\nC:\n'+unchanged+'MiniLang:\n'+native)
  pak=Path(args.data_root)/'baseq3/pak0.pk3'
  if not pak.is_file(): raise RuntimeError(f'Retail pak0.pk3 not found: {pak}')
  invoke('build.py','--source','tests/cl_ui_retail_probe.ml','--output','cl_ui_retail_probe.exe');retail=run([ROOT/'build/cl_ui_retail_probe.exe',pak],ROOT/'build').strip()
  if retail!='PASS: 7 Retail cl_ui contracts': raise RuntimeError(retail)
  invoke('test_ui_vm_lifecycle.py');invoke('test_vm_syscall_ui.py');invoke('test_ui_lan_browser.py');invoke('test_ui_lan_queries.py')
  files=[SOURCE,PORT,ROOT/'src/mq3/client/ui_lan_cache.ml',harness,ROOT/'tests/cl_ui_oracle.ml',ROOT/'tests/cl_ui_complete_contracts.ml',ROOT/'tests/cl_ui_retail_probe.ml']
  report={'passed':True,'symbols':35,'contracts':36,'unchanged_c_records':len(unchanged.splitlines()),'retail':retail,'scope':'Complete cl_ui facade over client state, authoritative host key-catcher ownership, key/clipboard/CD-key/config/glconfig services, UI QVM lifecycle and syscall dispatch, exact LAN cache/catalog/ping/status/query integration, plus direct execution of the real Retail ui.qvm API export and catalogs.','sources':{str(path.relative_to(ROOT)).replace('\\','/'):sha(path) for path in files}}
  (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print('PASS: 35/35 cl_ui symbols + 36 native contracts + 6 unchanged-C records + Retail ui.qvm');return 0
if __name__=='__main__': raise SystemExit(main())
