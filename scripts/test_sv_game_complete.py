"""Complete focused parity gate for server/sv_game.c engine-facing helpers."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env
from transition_oracle import extract

SYMBOLS=['SV_GameError','SV_GamePrint','SV_NumForGentity','SV_GentityNum','SV_GameClientNum','SV_SvEntityForGentity','SV_GEntityForSvEntity','SV_GameSendServerCommand','SV_GameDropClient','SV_inPVSIgnorePortals','SV_AdjustAreaPortalState','SV_GetServerinfo','SV_LocateGameData','SV_GetUsercmd','FloatAsInt','SV_GameCommand']

def main():
    out=ROOT/'build/reference/sv_game_complete';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code/server/sv_game.c'
    (out/'sv_game_interface_under_test.inc').write_text(extract(source,SYMBOLS),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/sv_game_interface_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/sv_game_interface_oracle.ml','--output','sv_game_interface_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/sv_game_interface_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('sv_game interface mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/sv_game_interface_contracts.ml','--output','sv_game_interface_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/sv_game_interface_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 33 sv_game interface contracts':raise RuntimeError(contracts)
    files=[source,harness,ROOT/'tests/sv_game_interface_oracle.ml',ROOT/'tests/sv_game_interface_contracts.ml',ROOT/'src/mq3/server/game_interface.ml',ROOT/'src/mq3/vm/syscall_qagame.ml',ROOT/'src/mq3/vm/syscall_qagame_world.ml']
    report={'passed':True,'symbols':SYMBOLS,'records':len(native.splitlines()),'contracts':33,
      'scope':'All previously unmapped sv_game helpers: error/print forwarding, stride-based entity/client addressing, entity conversion validation, command/drop bounds, serverinfo truncation, game-data location, usercmd retrieval, PVS without portal connectivity, area portal adjustment, float ABI and GAME_CONSOLE_COMMAND state gating. Productive qagame traps cover locate, command, serverinfo, PVS, portal and usercmd paths.',
      'oracle':'Seven transcript records execute 16 unchanged functions extracted from pinned Baseq3 sv_game.c.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {report['records']} exact Baseq3 sv_game records + {contracts[6:]}")
if __name__=='__main__':main()
