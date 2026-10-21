"""Unchanged CG_SetLerpFrameAnimation/CG_RunLerpFrame differential gate."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
    out=ROOT/'build/reference/cgame_player_lerp';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code/cgame/cg_players.c'
    (out/'cgame_player_lerp_under_test.inc').write_text(extract(source,['CG_SetLerpFrameAnimation','CG_RunLerpFrame']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/cgame_player_lerp_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/arch:SSE2','/MT','/W4',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cgame_player_lerp_oracle.ml','--output','cgame_player_lerp_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/cgame_player_lerp_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('cgame player lerp mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cgame_player_lerp_contracts.ml','--output','cgame_player_lerp_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/cgame_player_lerp_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 10 cgame-player-lerp contracts':raise RuntimeError(contracts)
    files=[source,harness,ROOT/'src/mq3/format/player_animation.ml',ROOT/'tests/cgame_player_lerp_oracle.ml',ROOT/'tests/cgame_player_lerp_contracts.ml']
    report={'passed':True,'records':len(native.splitlines()),'contracts':10,'functions':['CG_SetLerpFrameAnimation','CG_RunLerpFrame'],'scope':'Stateful initial lerp, animation switches/toggle bit, loops, reverse/flipflop, haste scale, hitch clamps, backlerp and disabled animation behavior, productively used by preview enemy lower/upper animation.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {len(native.splitlines())} exact Cgame lerp records + 10 contracts")
if __name__=='__main__':main()
