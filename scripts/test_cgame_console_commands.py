"""Unchanged CG_ConsoleCommand differential and productive retail-QVM gate."""
from __future__ import annotations
import argparse,json,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

COMMANDS=("sizeup","SIZEDOWN","+scores","-scores","+zoom","-zoom","startOrbit","unknown","kill")
BODY_FUNCTIONS=('CG_TargetCommand_f','CG_SizeUp_f','CG_SizeDown_f','CG_Viewpos_f','CG_ScoresDown_f','CG_ScoresUp_f','CG_TellTarget_f','CG_TellAttacker_f','CG_VoiceTellTarget_f','CG_VoiceTellAttacker_f','CG_StartOrbit_f')
MISSION_FUNCTIONS=('CG_LoadHud_f','CG_scrollScoresDown_f','CG_scrollScoresUp_f','CG_spWin_f','CG_spLose_f','CG_NextTeamMember_f','CG_PrevTeamMember_f','CG_NextOrder_f','CG_ConfirmOrder_f','CG_DenyOrder_f','CG_TaskOffense_f','CG_TaskDefense_f','CG_TaskPatrol_f','CG_TaskCamp_f','CG_TaskFollow_f','CG_TaskRetrieve_f','CG_TaskEscort_f','CG_TaskOwnFlag_f','CG_TaskSuicide_f','CG_TauntKillInsult_f','CG_TauntPraise_f','CG_TauntTaunt_f','CG_TauntDeathInsult_f','CG_TauntGauntlet_f')
LEDGER_FUNCTIONS=('CG_Camera_f','CG_ConfirmOrder_f','CG_DenyOrder_f','CG_EditHud_f','CG_InitConsoleCommands','CG_LoadHud_f','CG_NextOrder_f','CG_NextTeamMember_f','CG_PrevTeamMember_f','CG_ScoresDown_f','CG_ScoresUp_f','CG_SizeDown_f','CG_SizeUp_f','CG_StartOrbit_f','CG_TargetCommand_f','CG_TaskCamp_f','CG_TaskDefense_f','CG_TaskEscort_f','CG_TaskFollow_f','CG_TaskOffense_f','CG_TaskOwnFlag_f','CG_TaskPatrol_f','CG_TaskRetrieve_f','CG_TaskSuicide_f','CG_TauntDeathInsult_f','CG_TauntGauntlet_f','CG_TauntKillInsult_f','CG_TauntPraise_f','CG_TauntTaunt_f','CG_TeamMenu_f','CG_TellAttacker_f','CG_TellTarget_f','CG_Viewpos_f','CG_VoiceTellAttacker_f','CG_VoiceTellTarget_f','CG_scrollScoresDown_f','CG_scrollScoresUp_f','CG_spLose_f','CG_spWin_f','Cmd_Argv')

def main() -> int:
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path,required=True);parser.add_argument('--qvms',type=Path,default=ROOT/'build/reference/qvms');args=parser.parse_args()
    source=ROOT/'Quake-III-Arena-original-source/code/cgame/cg_consolecmds.c'
    port=ROOT/'src/mq3/client/cgame_console_commands.ml';original=source.read_text(encoding='latin-1');ported=port.read_text(encoding='utf-8')
    for name in LEDGER_FUNCTIONS:
        if name not in original or f'function {name}(' not in ported: raise RuntimeError('missing Ledger symbol '+name)
    output=ROOT/'build/reference/cgame_console_commands';output.mkdir(parents=True,exist_ok=True)
    (output/'cgame_console_command_under_test.inc').write_text(extract(source,['CG_ConsoleCommand']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/cgame_console_command_oracle.c';oracle=output/'oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/MT','/W4',f'/I{output}',harness,f'/Fe:{oracle}','/link','/Brepro'],output,msvc_env('x86'),output/'oracle-build.log')
    native=run([oracle],output,log=output/'oracle.log')
    (output/'cgame_console_bodies_under_test.inc').write_text(extract(source,BODY_FUNCTIONS),encoding='utf-8',newline='\n')
    body_harness=ROOT/'tests/reference/cgame_console_bodies_oracle.c';body_oracle=output/'bodies-oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{output}',body_harness,f'/Fe:{body_oracle}','/link','/Brepro'],output,msvc_env('x86'),output/'bodies-oracle-build.log')
    native_bodies=run([body_oracle],output,log=output/'bodies-oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cgame_console_bodies_oracle.ml','--output','cgame_console_bodies_oracle.exe'],cwd=ROOT,check=True)
    mini_bodies=run([ROOT/'build/cgame_console_bodies_oracle.exe'],ROOT/'build',log=output/'bodies-minilang.log')
    if native_bodies!=mini_bodies: raise RuntimeError('Cgame console body mismatch\nC:\n'+native_bodies+'MiniLang:\n'+mini_bodies)
    (output/'cgame_console_missionpack_under_test.inc').write_text(extract(source,MISSION_FUNCTIONS),encoding='utf-8',newline='\n')
    mission_harness=ROOT/'tests/reference/cgame_console_missionpack_oracle.c';mission_oracle=output/'missionpack-oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{output}',mission_harness,f'/Fe:{mission_oracle}','/link','/Brepro'],output,msvc_env('x86'),output/'missionpack-oracle-build.log')
    native_mission=run([mission_oracle],output,log=output/'missionpack-oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cgame_console_missionpack_oracle.ml','--output','cgame_console_missionpack_oracle.exe'],cwd=ROOT,check=True)
    mini_mission=run([ROOT/'build/cgame_console_missionpack_oracle.exe'],ROOT/'build',log=output/'missionpack-minilang.log')
    if native_mission!=mini_mission: raise RuntimeError('Cgame missionpack console body mismatch\nC:\n'+native_mission+'MiniLang:\n'+mini_mission)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cgame_console_commands_contracts.ml','--output','cgame_console_commands_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/cgame_console_commands_contracts.exe'],ROOT/'build',log=output/'contracts.log').strip()
    if contracts!='PASS: 27 Cgame console command contracts': raise RuntimeError(contracts)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cgame_console_command_retail_probe.ml','--output','cgame_console_command_retail_probe.exe'],cwd=ROOT,check=True)
    pak=(args.data_root/'baseq3/pak0.pk3').resolve()
    result=run([ROOT/'build/cgame_console_command_retail_probe.exe',pak,args.qvms.resolve()],ROOT/'build',log=output/'minilang.log',timeout=240)
    lines=result.splitlines();mini='\n'.join(lines[:len(COMMANDS)])+'\n'
    if native!=mini: raise RuntimeError('Cgame console dispatch mismatch\nC:\n'+native+'MiniLang/QVM:\n'+mini)
    if len(lines)!=len(COMMANDS)+1 or not lines[-1].startswith('PASS: retail Cgame console commands registered='): raise RuntimeError(result)
    table=source.read_text(encoding='latin-1')
    for name in ('sizeup','sizedown','+scores','-scores','weapnext','weapon','tell_target','startOrbit','kill','say','callvote'):
        if f'{{ "{name}"' not in table and f'trap_AddCommand ("{name}")' not in table: raise RuntimeError('original command table anchor drift: '+name)
    files=[source,harness,body_harness,mission_harness,ROOT/'src/mq3/client/cgame_console_commands.ml',ROOT/'src/mq3/engine/local_qvm_match.ml',ROOT/'src/mq3/qcommon/command_buffer.ml',ROOT/'tests/cgame_console_bodies_oracle.ml',ROOT/'tests/cgame_console_missionpack_oracle.ml',ROOT/'tests/cgame_console_command_retail_probe.ml']
    files.append(ROOT/'tests/cgame_console_commands_contracts.ml')
    report={'passed':True,'records':len(COMMANDS)+native_bodies.count('\n')+native_mission.count('\n'),'contracts':27,'retail':lines[-1],'functions':list(LEDGER_FUNCTIONS),'scope':'All 40 Ledger candidates have named native implementations. Completion registrations and dispatch share the productive Cmd token state; typed suppressible host actions cover commands, client commands, Cvars, console, audio, menu and camera boundaries. Eleven active Baseq3 and all 24 missionpack command bodies retain unchanged-C differential coverage; dormant documented bodies are checked by native contracts.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (output/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f'PASS: {len(COMMANDS)} dispatch + {native_bodies.count(chr(10))} Baseq3 body records + {native_mission.count(chr(10))} missionpack body records + 27 native contracts / 40 Ledger functions + {lines[-1]}')
    return 0
if __name__=='__main__': raise SystemExit(main())
