"""Verify the shared QVM syscall ABI and memory-safe service contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env

def main():
    out=ROOT/'build/reference/vm_syscall_common';out.mkdir(parents=True,exist_ok=True)
    harness=ROOT/'tests/reference/vm_syscall_common_oracle.c';oracle=out/'oracle.exe'
    original=ROOT/'Quake-III-Arena-original-source/code'
    includes=[original/'game',original/'cgame',original/'ui']
    run(['cl','/nologo','/Od','/MT','/DWIN32',*[f'/I{x}' for x in includes],harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/vm_syscall_common_oracle.ml','--output','vm_syscall_common_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/vm_syscall_common_oracle.exe'],ROOT/'build',log=out/'minilang-oracle.log')
    if native!=mini:raise RuntimeError('public QVM ABI mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/vm_syscall_common_contracts.ml','--output','vm_syscall_common_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/vm_syscall_common_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 32 common QVM syscall contracts':raise RuntimeError(value)
    files=[harness,ROOT/'tests/vm_syscall_common_oracle.ml',ROOT/'src/mq3/vm/syscall_common.ml',ROOT/'tests/vm_syscall_common_contracts.ml']
    report={'passed':True,'records':4,'contracts':32,
      'scope':'Shared productive qagame/cgame/UI print, error, milliseconds, cvar, argv, console-command and file-handle traps with vmCvar_t serialization.',
      'oracle':'Original Baseq3 public headers compiled directly to freeze all covered trap ordinals and the native vmCvar_t layout.',
      'safety':'NULL, argument-vector, masked pointer span, unterminated string, output capacity, negative length, short read, invalid handle and unsupported trap checks.',
      'remaining':'Renderer, collision, sound, snapshot, LAN and botlib traps remain ABI-specific follow-up dispatchers.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {report['records']} exact Baseq3 public-ABI records + {report['contracts']} common QVM syscall contracts")
if __name__=='__main__':main()
