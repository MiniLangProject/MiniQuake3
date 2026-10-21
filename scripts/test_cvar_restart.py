"""Exact Baseq3 cvar_restart differential and productive command contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run

def main():
    out=ROOT/'build/reference/cvar_restart';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code';harness=ROOT/'tests/reference/cvar_restart_oracle.c'
    oracle=out/'cvar_restart_oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/MT','/DWIN32','/DNDEBUG','/D_CRT_SECURE_NO_WARNINGS',
         f'/I{source / "game"}',f'/I{source / "qcommon"}',harness,source/'qcommon/cvar.c',source/'game/q_shared.c',
         f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cvar_restart_oracle.ml','--output','cvar_restart_oracle.exe'],check=True)
    mini=run([ROOT/'build/cvar_restart_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('Cvar_Restart differential mismatch\nnative:\n'+native+'\nMiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cvar_restart_contracts.ml','--output','cvar_restart_contracts.exe'],check=True)
    contracts=run([ROOT/'build/cvar_restart_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 17 cvar restart contracts': raise RuntimeError(contracts)
    files=[source/'qcommon/cvar.c',harness,ROOT/'src/mq3/qcommon/cvar.ml',ROOT/'src/mq3/qcommon/cvar_commands.ml',
           ROOT/'src/mq3/platform/engine_loop.ml',ROOT/'src/mq3/engine/local_qvm_match.ml',
           ROOT/'tests/cvar_restart_oracle.ml',ROOT/'tests/cvar_restart_contracts.ml']
    (out/'result.json').write_text(json.dumps({'passed':True,'differential_records':13,'contracts':17,
      'scope':'Exact Cvar_Restart deletion, protected flags, reset/latch behavior, stable VM handles and productive command-buffer integration.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}},indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 13 exact Baseq3 cvar_restart records + 17 contracts')
if __name__=='__main__': main()
