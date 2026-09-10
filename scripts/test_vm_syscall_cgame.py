"""Verify the client-specific cgame syscall ABI and safe service bridge."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env

def main():
    out=ROOT/'build/reference/vm_syscall_cgame';out.mkdir(parents=True,exist_ok=True)
    harness=ROOT/'tests/reference/vm_syscall_cgame_oracle.c';oracle=out/'oracle.exe'
    original=ROOT/'Quake-III-Arena-original-source/code'
    client_source=original/'client/cl_cgame.c'
    source_text=client_source.read_text(encoding='utf-8',errors='replace')
    covered_cases=['CG_ADDCOMMAND','CG_REMOVECOMMAND','CG_SENDCLIENTCOMMAND','CG_UPDATESCREEN',
      'CG_R_LOADWORLDMAP','CG_R_REGISTERMODEL','CG_R_REGISTERSKIN','CG_R_REGISTERSHADER',
      'CG_R_REGISTERSHADERNOMIP','CG_R_CLEARSCENE','CG_GETGLCONFIG','CG_GETGAMESTATE',
      'CG_GETCURRENTSNAPSHOTNUMBER','CG_GETSNAPSHOT','CG_GETSERVERCOMMAND',
      'CG_GETCURRENTCMDNUMBER','CG_GETUSERCMD','CG_SETUSERCMDVALUE','CG_MEMORY_REMAINING']
    missing=[name for name in covered_cases if f'case {name}:' not in source_text]
    if missing:raise RuntimeError('covered CL_CgameSystemCalls cases missing: '+', '.join(missing))
    includes=[f'/I{original/name}' for name in ('game','cgame','qcommon','renderer')]
    run(['cl','/nologo','/Od','/MT','/DWIN32',*includes,harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/vm_syscall_cgame_oracle.ml','--output','vm_syscall_cgame_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/vm_syscall_cgame_oracle.exe'],ROOT/'build',log=out/'minilang-oracle.log')
    if native!=mini:raise RuntimeError('cgame public ABI mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/vm_syscall_cgame_contracts.ml','--output','vm_syscall_cgame_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/vm_syscall_cgame_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 37 cgame-specific syscall contracts':raise RuntimeError(value)
    files=[client_source,original/'cgame/cg_public.h',harness,ROOT/'tests/vm_syscall_cgame_oracle.ml',ROOT/'src/mq3/vm/syscall_cgame.ml',ROOT/'tests/vm_syscall_cgame_contracts.ml']
    report={'passed':True,'records':4,'contracts':37,
      'scope':'cgame command registration/submission, screen updates, world and model/skin/shader registration, GL config, game state, snapshot sequencing/data, reliable server commands, usercmd history/control and memory reporting.',
      'oracle':'Original Baseq3 cg_public.h is compiled directly for API version, 19 trap ordinals, and exact x86 gameState_t, snapshot_t, usercmd_t and glconfig_t byte sizes; every trap is also required in unchanged cl_cgame.c.',
      'safety':'Argument vectors, masked pointers, fixed binary layouts, absent history records, callback availability, strings and output spans are checked before host services or VM-memory copies.',
      'remaining':'Collision traces, sound, full scene submission, keys, parser, cinematic and math traps require their subsystem adapters or additional binary layouts.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {report['records']} exact Baseq3 cgame-ABI records + {report['contracts']} cgame-specific syscall contracts")
if __name__=='__main__':main()
