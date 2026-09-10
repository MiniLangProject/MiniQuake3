"""Verify Baseq3 client-side cgame VM initialization, exports and shutdown."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env
def main():
    out=ROOT/'build/reference/cgame_vm_lifecycle';out.mkdir(parents=True,exist_ok=True)
    harness=ROOT/'tests/reference/cgame_vm_lifecycle_oracle.c';oracle=out/'oracle.exe';original=ROOT/'Quake-III-Arena-original-source/code'
    run(['cl','/nologo','/Od','/MT','/DWIN32',f'/I{original / "game"}',f'/I{original / "cgame"}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cgame_vm_lifecycle_oracle.ml','--output','cgame_vm_lifecycle_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/cgame_vm_lifecycle_oracle.exe'],ROOT/'build',log=out/'minilang-oracle.log')
    if native!=mini:raise RuntimeError('cgame export ABI mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cgame_vm_lifecycle_contracts.ml','--output','cgame_vm_lifecycle_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/cgame_vm_lifecycle_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 20 cgame VM lifecycle contracts':raise RuntimeError(value)
    files=[harness,ROOT/'tests/cgame_vm_lifecycle_oracle.ml',ROOT/'src/mq3/client/cgame_vm.ml',ROOT/'tests/cgame_vm_lifecycle_contracts.ml']
    report={'passed':True,'records':12,'contracts':20,'scope':'CL_InitCGame, every cgameExport_t wrapper, and CL_ShutdownCGame with explicit host service boundaries.','oracle':'Original Baseq3 q_shared.h and cg_public.h compiled directly.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {report['records']} exact Baseq3 cgame-export records + {report['contracts']} cgame VM lifecycle contracts")
if __name__=='__main__':main()
