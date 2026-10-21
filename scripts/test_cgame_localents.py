"""Unchanged-C differential and native contracts for cg_localents.c."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/cgame_localents';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code/cgame/cg_localents.c'
    functions=['CG_InitLocalEntities','CG_FreeLocalEntity','CG_AllocLocalEntity','CG_ReflectVelocity','CG_AddFadeRGB','CG_AddExplosion','CG_AddSpriteExplosion','CG_AddScorePlum']
    (out/'cgame_localents_under_test.inc').write_text(extract(source,functions),encoding='utf-8',newline='\n')
    host=ROOT/'tests/reference/cgame_localents_oracle.c';exe=out/'oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/arch:SSE2','/MT','/W4','/WX','/wd4100','/wd4244',f'/I{out}',host,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([exe],out,log=out/'oracle.log')
    for test,name in [('tests/cgame_localents_oracle.ml','cgame_localents_oracle.exe'),('tests/cgame_localents_contracts.ml','cgame_localents_contracts.exe')]:
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',test,'--output',name],cwd=ROOT,check=True)
    mini=run([ROOT/'build/cgame_localents_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError(f'cg_localents differential mismatch\nC:\n{native}\nMiniLang:\n{mini}')
    contracts=run([ROOT/'build/cgame_localents_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 27 cgame local-entity contracts': raise RuntimeError(contracts)
    files=[source,host,ROOT/'src/mq3/client/cgame_localents.ml',ROOT/'tests/cgame_localents_oracle.ml',ROOT/'tests/cgame_localents_contracts.ml']
    result={'passed':True,'differential_records':6,'contracts':27,
            'functions':['CG_InitLocalEntities','CG_FreeLocalEntity','CG_AllocLocalEntity','CG_BloodTrail','CG_FragmentBounceMark','CG_FragmentBounceSound','CG_ReflectVelocity','CG_AddFragment','CG_AddFadeRGB','CG_AddMoveScaleFade','CG_AddScaleFade','CG_AddFallScaleFade','CG_AddExplosion','CG_AddSpriteExplosion','CG_AddKamikaze','CG_AddInvulnerabilityImpact','CG_AddInvulnerabilityJuiced','CG_AddRefEntity','CG_AddScorePlum','CG_AddLocalEntities'],
            'scope':'Complete bounded local-entity pool and oldest-first lifecycle, fragment trajectories, marks and bounce audio, fade variants, explosions and lights, score plums, plus Missionpack kamikaze and invulnerability behavior. Six unchanged-C records cover allocation, byte modulation, reflection, explosion light curves, sprite expansion and score digits. Typed boundary actions remain observational while the Retail cgame QVM is active.',
            'sources':{str(path.relative_to(ROOT)).replace('\\','/'):sha(path) for path in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8')
    print('PASS: 6 unchanged C local-entity records + 27 native contracts')

if __name__=='__main__': main()
