#!/usr/bin/env python3
"""code/game/ai_cmd.c unchanged-C, native-contract and Retail matcher gate."""
import argparse,json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run

FUNCTIONS=['BotAddressedToBot','BotGPSToPosition','BotGetItemTeamGoal','BotGetMessageTeamGoal','BotGetPatrolWaypoints','BotGetTime','BotMatchMessage','BotMatch_AttackEnemyBase','BotMatch_CTF','BotMatch_Camp','BotMatch_CheckPoint','BotMatch_DefendKeyArea','BotMatch_Dismiss','BotMatch_EnterGame','BotMatch_FormationSpace','BotMatch_GetFlag','BotMatch_GetItem','BotMatch_Harvest','BotMatch_HelpAccompany','BotMatch_JoinSubteam','BotMatch_Kill','BotMatch_LeadTheWay','BotMatch_LeaveSubteam','BotMatch_NewLeader','BotMatch_Patrol','BotMatch_ReturnFlag','BotMatch_RushBase','BotMatch_StartTeamLeaderShip','BotMatch_StopTeamLeaderShip','BotMatch_Suicide','BotMatch_TaskPreference','BotMatch_WhatAreYouDoing','BotMatch_WhatIsMyCommand','BotMatch_WhereAreYou','BotMatch_WhichTeam','BotMatch_WhoIsTeamLeader','BotNearestVisibleItem','BotPrintTeamGoal','FindClientByName','FindEnemyByName','NumPlayersOnSameTeam']

def build(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def pak0(root):
 for p in (root/'pak0.pk3',root/'baseq3/pak0.pk3'):
  if p.is_file():return p
 raise FileNotFoundError('pak0.pk3 below '+str(root))
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--data-root',type=Path,required=True);args=ap.parse_args()
 source=ROOT/'Quake-III-Arena-original-source/code/game/ai_cmd.c';port=ROOT/'src/mq3/game/bot_command_matches.ml';original=source.read_text(encoding='utf-8',errors='replace');ported=port.read_text(encoding='utf-8')
 if len(FUNCTIONS)!=41:raise RuntimeError('ai_cmd inventory changed')
 for name in FUNCTIONS:
  if name not in original:raise RuntimeError('missing original '+name)
  if not re.search(r'(?m)^function\s+'+re.escape(name)+r'\s*\(',ported):raise RuntimeError('missing port '+name)
 markers=['MTCONTEXT_INITIALTEAMCHAT','ST_1FCTFGOTFLAG','PATROL_REVERSE','TEAMTP_ATTACKER','NumPlayersOnSameTeam(state,bot)-1','the part of my brain to create formations has been damaged']
 for marker in markers:
  if marker not in ported:raise RuntimeError('missing semantic marker '+marker)
 out=ROOT/'build/reference/bot_command_matches';out.mkdir(parents=True,exist_ok=True);harness=ROOT/'tests/reference/bot_command_matches_oracle.c';oracle=out/'oracle.exe'
 run(['cl','/nologo','/Od','/MT',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([oracle],out,log=out/'oracle.log');mini=run([build('tests/bot_command_matches_oracle.ml','bot_command_matches_oracle.exe')],ROOT/'build',log=out/'mini-oracle.log')
 if native!=mini:raise RuntimeError('unchanged-C mismatch\nC:\n'+native+'ML:\n'+mini)
 contracts=run([build('tests/bot_command_matches_contracts.ml','bot_command_matches_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if not contracts.startswith('PASS: 23 ai_cmd native contracts'):raise RuntimeError(contracts)
 retail=run([build('tests/bot_command_matches_retail_probe.ml','bot_command_matches_retail_probe.exe'),pak0(args.data_root.resolve())],ROOT/'build',log=out/'retail.log').strip()
 if not retail.startswith('PASS: 6 Retail qagame ai_cmd probes templates=138'):raise RuntimeError(retail)
 files=[source,port,harness,ROOT/'tests/bot_command_matches_oracle.ml',ROOT/'tests/bot_command_matches_contracts.ml',ROOT/'tests/bot_command_matches_retail_probe.ml']
 result={'passed':True,'symbols':41,'differential_records':len(native.splitlines()),'contracts':23,'retail_contracts':6,'scope':'Complete ai_cmd.c text command dispatch, variables, addressing, team/subteam leadership, objectives, patrol/checkpoints, CTF events and typed host actions.','remaining':'World visibility, AAS area/travel queries, chat output and executable commands are typed host callbacks/actions. The original BotMatch_LeadTheWay checks bs->teamgoal instead of lead_teamgoal after resolving the client; the port retains intended resolved-goal behavior rather than reproducing that apparent C typo.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8');print('PASS: 41 ai_cmd symbols + '+str(len(native.splitlines()))+' unchanged-C records + 23 contracts + 6 Retail probes')
if __name__=='__main__':main()
