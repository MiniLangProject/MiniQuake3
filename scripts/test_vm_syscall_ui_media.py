"""Verify sound, cinematic and platform UI traps against Baseq3's public ABI."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env

def main():
    out=ROOT/'build/reference/vm_syscall_ui_media';out.mkdir(parents=True,exist_ok=True)
    harness=ROOT/'tests/reference/vm_syscall_ui_media_oracle.c';oracle=out/'oracle.exe'
    original=ROOT/'Quake-III-Arena-original-source/code'
    client_source=original/'client/cl_ui.c'
    source_text=client_source.read_text(encoding='utf-8',errors='replace')
    covered_cases=['UI_S_REGISTERSOUND','UI_S_STARTLOCALSOUND','UI_GET_CDKEY','UI_SET_CDKEY',
      'UI_S_STOPBACKGROUNDTRACK','UI_S_STARTBACKGROUNDTRACK','UI_REAL_TIME',
      'UI_CIN_PLAYCINEMATIC','UI_CIN_STOPCINEMATIC','UI_CIN_RUNCINEMATIC',
      'UI_CIN_DRAWCINEMATIC','UI_CIN_SETEXTENTS','UI_R_REMAP_SHADER','UI_VERIFY_CDKEY',
      'UI_FS_SEEK','UI_SET_PBCLSTATUS']
    missing=[name for name in covered_cases if f'case {name}:' not in source_text]
    if missing:raise RuntimeError('covered CL_UISystemCalls cases missing: '+', '.join(missing))
    includes=[f'/I{original/name}' for name in ('client','ui','qcommon','renderer')]
    run(['cl','/nologo','/Od','/MT','/DWIN32',*includes,harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/vm_syscall_ui_media_oracle.ml','--output','vm_syscall_ui_media_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/vm_syscall_ui_media_oracle.exe'],ROOT/'build',log=out/'minilang-oracle.log')
    if native!=mini:raise RuntimeError('UI media public ABI mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/vm_syscall_ui_media_contracts.ml','--output','vm_syscall_ui_media_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/vm_syscall_ui_media_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 42 UI media syscall contracts'
    if value!=expected:raise RuntimeError(value+' (expected '+expected+')')
    files=[client_source,original/'ui/ui_public.h',original/'game/q_shared.h',harness,
      ROOT/'tests/vm_syscall_ui_media_oracle.ml',ROOT/'src/mq3/vm/syscall_ui_media.ml',ROOT/'tests/vm_syscall_ui_media_contracts.ml']
    report={'passed':True,'records':5,'contracts':42,
      'scope':'UI sound, background music, real time, cinematics, shader remapping, CD-key access and validation, FS seek and the legacy PB status no-op.',
      'oracle':'Original Baseq3 ui_public.h is compiled directly for 16 trap ordinals and the exact x86 qtime_t byte size; every trap name is required in unchanged cl_ui.c.',
      'safety':'VM argument vectors, strings, fixed 16-byte CD keys, bounded output spans, masked pointers and the 36-byte qtime_t layout are checked at the host boundary.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {report['records']} exact Baseq3 UI-media ABI records + {report['contracts']} UI media syscall contracts")
if __name__=='__main__':main()
