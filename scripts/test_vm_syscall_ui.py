"""Verify the UI-specific syscall ABI and memory-safe service bridge."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env

def main():
    out=ROOT/'build/reference/vm_syscall_ui';out.mkdir(parents=True,exist_ok=True)
    harness=ROOT/'tests/reference/vm_syscall_ui_oracle.c';oracle=out/'oracle.exe'
    original=ROOT/'Quake-III-Arena-original-source/code'
    client_source=original/'client/cl_ui.c'
    source_text=client_source.read_text(encoding='utf-8',errors='replace')
    covered_cases=['UI_FS_GETFILELIST','UI_R_REGISTERMODEL','UI_R_REGISTERSKIN','UI_R_REGISTERSHADERNOMIP','UI_R_CLEARSCENE','UI_R_SETCOLOR','UI_R_DRAWSTRETCHPIC','UI_UPDATESCREEN',
      'UI_KEY_KEYNUMTOSTRINGBUF','UI_KEY_GETBINDINGBUF','UI_KEY_SETBINDING','UI_KEY_ISDOWN','UI_KEY_GETOVERSTRIKEMODE','UI_KEY_SETOVERSTRIKEMODE','UI_KEY_CLEARSTATES','UI_KEY_GETCATCHER','UI_KEY_SETCATCHER',
      'UI_GETCLIPBOARDDATA','UI_GETGLCONFIG','UI_GETCLIENTSTATE','UI_GETCONFIGSTRING','UI_LAN_GETPINGQUEUECOUNT','UI_LAN_CLEARPING','UI_LAN_GETPING','UI_LAN_GETPINGINFO','UI_MEMORY_REMAINING',
      'UI_LAN_GETSERVERCOUNT','UI_LAN_GETSERVERADDRESSSTRING','UI_LAN_GETSERVERINFO','UI_LAN_MARKSERVERVISIBLE','UI_LAN_UPDATEVISIBLEPINGS','UI_LAN_RESETPINGS','UI_LAN_LOADCACHEDSERVERS','UI_LAN_SAVECACHEDSERVERS','UI_LAN_ADDSERVER','UI_LAN_REMOVESERVER','UI_LAN_SERVERSTATUS','UI_LAN_GETSERVERPING','UI_LAN_SERVERISVISIBLE','UI_LAN_COMPARESERVERS']
    missing=[name for name in covered_cases if f'case {name}:' not in source_text]
    if missing:raise RuntimeError('covered CL_UISystemCalls cases missing: '+', '.join(missing))
    includes=[f'/I{original/name}' for name in ('client','ui','qcommon','renderer')]
    run(['cl','/nologo','/Od','/MT','/DWIN32',*includes,harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/vm_syscall_ui_oracle.ml','--output','vm_syscall_ui_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/vm_syscall_ui_oracle.exe'],ROOT/'build',log=out/'minilang-oracle.log')
    if native!=mini:raise RuntimeError('UI public ABI mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/vm_syscall_ui_contracts.ml','--output','vm_syscall_ui_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/vm_syscall_ui_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 64 UI-specific syscall contracts':raise RuntimeError(value)
    files=[client_source,original/'ui/ui_public.h',harness,ROOT/'tests/vm_syscall_ui_oracle.ml',ROOT/'src/mq3/vm/syscall_ui.ml',ROOT/'tests/vm_syscall_ui_contracts.ml']
    report={'passed':True,'records':7,'contracts':64,
      'scope':'UI PK3 file listing, renderer registration and 2D draw boundary, key bindings/catcher, clipboard, GL/client/config state, ping queue, cached and live server-browser queries and memory reporting.',
      'oracle':'Original Baseq3 ui_public.h is compiled directly for API version, 39 trap ordinals, and exact x86 uiClientState_t and glconfig_t byte sizes; every trap name is required in unchanged cl_ui.c.',
      'safety':'VM argument vectors, masked pointers, fixed binary layouts, bounded strings, nullable color input, booleans, unavailable services and output spans are checked at the host boundary.',
      'remaining':'Scene entity/poly/light submission, model bounds and tags are connected in the retail host; reusable font, parser, cinematic and native presentation adapters still need completion.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {report['records']} exact Baseq3 UI-ABI records + {report['contracts']} UI-specific syscall contracts")
if __name__=='__main__':main()
