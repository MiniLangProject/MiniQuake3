"""Differential and contract tests for Cvar/config persistence."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run

def main():
    out=ROOT/'build/reference/cvar_config';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code';harness=ROOT/'tests/reference/cvar_config_oracle.c'
    oracle=out/'cvar_config_oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/MT','/DWIN32','/DNDEBUG','/D_CRT_SECURE_NO_WARNINGS',
         f'/I{source / "game"}',f'/I{source / "qcommon"}',harness,source/'qcommon/cvar.c',source/'game/q_shared.c',
         f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cvar_config_oracle.ml','--output','cvar_config_oracle.exe'],check=True)
    mini=run([ROOT/'build/cvar_config_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('Cvar_WriteVariables differential mismatch\nnative:\n'+native+'\nMiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cvar_config_contracts.ml','--output','cvar_config_contracts.exe'],check=True)
    contracts=run([ROOT/'build/cvar_config_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 17 cvar config persistence contracts':raise RuntimeError(contracts)
    files=[source/'qcommon/cvar.c',source/'qcommon/common.c',harness,ROOT/'src/mq3/qcommon/cvar.ml',
           ROOT/'src/mq3/qcommon/config_persistence.ml',ROOT/'tests/cvar_config_oracle.ml',ROOT/'tests/cvar_config_contracts.ml']
    result={'passed':True,'differential_records':3,'contracts':17,
            'scope':'Unchanged Baseq3 Cvar_WriteVariables ordering, archive selection, cl_cdkey exclusion, latched-value preference and forced-value updates; MiniLang contracts cover Com_WriteConfiguration gating, payload assembly, failure semantics and writeconfig filename handling.',
            'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 3 exact Baseq3 Cvar_WriteVariables records + 17 config persistence contracts')
if __name__=='__main__':main()
