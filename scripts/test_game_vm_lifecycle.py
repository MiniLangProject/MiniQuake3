"""Verify Baseq3 server-side qagame VM startup, restart, exports and shutdown."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env

def main():
    out=ROOT/'build/reference/game_vm_lifecycle';out.mkdir(parents=True,exist_ok=True)
    harness=ROOT/'tests/reference/game_vm_lifecycle_oracle.c';oracle=out/'oracle.exe'
    original=ROOT/'Quake-III-Arena-original-source/code'
    run(['cl','/nologo','/Od','/MT','/DWIN32',f'/I{original / "qcommon"}',f'/I{original / "game"}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/game_vm_lifecycle_oracle.ml','--output','game_vm_lifecycle_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/game_vm_lifecycle_oracle.exe'],ROOT/'build',log=out/'minilang-oracle.log')
    if native!=mini:raise RuntimeError('game export ABI mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/game_vm_lifecycle_contracts.ml','--output','game_vm_lifecycle_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/game_vm_lifecycle_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 22 game VM lifecycle contracts':raise RuntimeError(value)
    files=[harness,ROOT/'tests/game_vm_lifecycle_oracle.ml',ROOT/'src/mq3/server/game_vm.ml',ROOT/'tests/game_vm_lifecycle_contracts.ml']
    report={'passed':True,'records':11,'contracts':22,
      'scope':'SV_InitGameProgs, SV_InitGameVM, SV_RestartGameProgs and SV_ShutdownGameProgs order plus every qagame vmMain export wrapper.',
      'oracle':'Original Baseq3 g_public.h compiled directly for all gameExport_t ordinals.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {report['records']} exact Baseq3 game-export records + {report['contracts']} game VM lifecycle contracts")
if __name__=='__main__':main()
