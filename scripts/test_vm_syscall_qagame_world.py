"""Verify binary qagame world-query/usercmd traps and exact VM layouts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env

def main():
    out=ROOT/'build/reference/vm_syscall_qagame_world';out.mkdir(parents=True,exist_ok=True)
    harness=ROOT/'tests/reference/vm_syscall_qagame_world_oracle.c';oracle=out/'oracle.exe'
    original=ROOT/'Quake-III-Arena-original-source/code';server_source=original/'server/sv_game.c'
    source_text=server_source.read_text(encoding='utf-8',errors='replace')
    covered=['G_TRACE','G_POINT_CONTENTS','G_ENTITIES_IN_BOX','G_ENTITY_CONTACT','G_GET_USERCMD','G_TRACECAPSULE','G_ENTITY_CONTACTCAPSULE']
    missing=[name for name in covered if f'case {name}:' not in source_text]
    if missing:raise RuntimeError('covered SV_GameSystemCalls cases missing: '+', '.join(missing))
    run(['cl','/nologo','/Od','/MT','/DWIN32',f'/I{original/"game"}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/vm_syscall_qagame_world_oracle.ml','--output','vm_syscall_qagame_world_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/vm_syscall_qagame_world_oracle.exe'],ROOT/'build',log=out/'minilang-oracle.log')
    if native!=mini:raise RuntimeError('qagame binary ABI mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/vm_syscall_qagame_world_contracts.ml','--output','vm_syscall_qagame_world_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/vm_syscall_qagame_world_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 37 qagame binary-world syscall contracts':raise RuntimeError(value)
    files=[server_source,original/'game/q_shared.h',original/'game/g_public.h',harness,ROOT/'tests/vm_syscall_qagame_world_oracle.ml',ROOT/'src/mq3/vm/syscall_qagame_world.ml',ROOT/'tests/vm_syscall_qagame_world_contracts.ml']
    report={'passed':True,'records':5,'contracts':37,
      'scope':'G_TRACE/G_TRACECAPSULE, G_POINT_CONTENTS, G_ENTITIES_IN_BOX, G_ENTITY_CONTACT/G_ENTITY_CONTACTCAPSULE and G_GET_USERCMD.',
      'oracle':'Original Baseq3 q_shared.h and g_public.h compiled for exact trap ordinals, trace_t/usercmd_t layouts and representative binary records; every dispatcher case is required in unchanged sv_game.c.',
      'safety':'All vectors, fixed-size outputs, optional trace bounds, entity-list spans, service result counts and masked entity pointers are checked before access.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {report['records']} exact Baseq3 binary-ABI records + {report['contracts']} qagame binary-world syscall contracts")
if __name__=='__main__':main()
