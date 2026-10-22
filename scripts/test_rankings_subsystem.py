#!/usr/bin/env python3
"""Unchanged-C and native contracts for the legacy server/game rankings subsystem."""
import json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SERVER=['SV_RankActive','SV_RankBegin','SV_RankCheckInit','SV_RankCleanupCBF','SV_RankCloseContext','SV_RankDecodePlayerID','SV_RankDecodePlayerKey','SV_RankEncodeGameID','SV_RankEnd','SV_RankError','SV_RankJoinGameCBF','SV_RankNewGameCBF','SV_RankPoll','SV_RankQuit','SV_RankReportInt','SV_RankReportStr','SV_RankSendReportsCBF','SV_RankStatusString','SV_RankUserCBF','SV_RankUserCreate','SV_RankUserGrank','SV_RankUserLogin','SV_RankUserLogout','SV_RankUserReset','SV_RankUserSpectate','SV_RankUserStatus','SV_RankUserValidate','least']
GAME=['G_RankCapture','G_RankClientDisconnect','G_RankDamage','G_RankFireWeapon','G_RankGameOver','G_RankPickupAmmo','G_RankPickupArmor','G_RankPickupHealth','G_RankPickupHoldable','G_RankPickupPowerup','G_RankPickupWeapon','G_RankPlayerDie','G_RankReward','G_RankRunFrame','G_RankUseHoldable','G_RankUserTeamName','G_RankWeaponTime']
def build(source,output): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def main():
 ss=ROOT/'Quake-III-Arena-original-source/code/server/sv_rankings.c';gs=ROOT/'Quake-III-Arena-original-source/code/game/g_rankings.c';sp=ROOT/'src/mq3/server/rankings.ml';gp=ROOT/'src/mq3/game/rankings.ml';st=ss.read_text(errors='replace');gt=gs.read_text(errors='replace');spt=sp.read_text();gpt=gp.read_text()
 if len(SERVER)!=28 or len(GAME)!=17:raise RuntimeError('ledger inventory changed')
 for name in SERVER:
  if name!='least' and name not in st:raise RuntimeError('missing server original '+name)
  if not re.search(r'(?m)^function\s+'+re.escape(name)+r'\s*\(',spt):raise RuntimeError('missing server port '+name)
 for name in GAME:
  if name not in gt:raise RuntimeError('missing game original '+name)
  if not re.search(r'(?m)^function\s+'+re.escape(name)+r'\s*\(',gpt):raise RuntimeError('missing game port '+name)
 for marker in ['QGR_STATUS_PENDING','send-reports','join-game','GR_STATUS_BADPASSWORD','rankingsGameID','SV_RankAsciiEncode']:
  if marker not in spt:raise RuntimeError('missing server semantic '+marker)
 for marker in ['QGR_KEY_PLAYED_WITH','TEAMMATE_SPLASH_GIVEN','weaponForMod','warmupTime','rank_menu','MATCH_RATING']:
  if marker not in gpt:raise RuntimeError('missing game semantic '+marker)
 out=ROOT/'build/reference/rankings_subsystem';out.mkdir(parents=True,exist_ok=True)
 (out/'rankings_server_under_test.inc').write_text(extract(ss,['SV_RankAsciiEncode','SV_RankAsciiDecode','SV_RankStatusString']),encoding='utf-8',newline='\n')
 simple=['G_RankFireWeapon','G_RankPickupHealth','G_RankPickupArmor','G_RankPickupPowerup','G_RankPickupHoldable','G_RankUseHoldable','G_RankReward','G_RankCapture','G_RankUserTeamName']
 (out/'rankings_game_under_test.inc').write_text(extract(gs,simple),encoding='utf-8',newline='\n')
 native=[];mini=[]
 for stem in ('rankings_server','rankings_game'):
  harness=ROOT/f'tests/reference/{stem}_oracle.c';exe=out/f'{stem}_oracle.exe';run(['cl','/nologo','/Od','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/f'{stem}-build.log');n=run([exe],out,log=out/f'{stem}-native.log');m=run([build(f'tests/{stem}_oracle.ml',f'{stem}_oracle.exe')],ROOT/'build',log=out/f'{stem}-mini.log');
  if n!=m:raise RuntimeError(stem+' unchanged-C mismatch\nC:\n'+n+'ML:\n'+m)
  native+=n.splitlines();mini+=m.splitlines()
 server=run([build('tests/rankings_server_contracts.ml','rankings_server_contracts.exe')],ROOT/'build',log=out/'server-contracts.log').strip();game=run([build('tests/rankings_game_contracts.ml','rankings_game_contracts.exe')],ROOT/'build',log=out/'game-contracts.log').strip()
 if server!='PASS: 21 server ranking contracts':raise RuntimeError(server)
 if game!='PASS: 23 game ranking contracts':raise RuntimeError(game)
 files=[ss,gs,sp,gp,ROOT/'tests/reference/rankings_server_oracle.c',ROOT/'tests/reference/rankings_game_oracle.c',ROOT/'tests/rankings_server_oracle.ml',ROOT/'tests/rankings_game_oracle.ml',ROOT/'tests/rankings_server_contracts.ml',ROOT/'tests/rankings_game_contracts.ml']
 report={'passed':True,'server_symbols':28,'game_symbols':17,'unchanged_c_records':len(native),'server_contracts':21,'game_contracts':23,'scope':'Complete legacy ranking lifecycle, codec, callbacks, reports, frame/login policy and gameplay statistic emission.','offline_behavior':'The removed proprietary GRank service is represented by typed requests and caller-driven callbacks. Without a backend, pending operations remain pending exactly as an asynchronous unavailable service would; disabled/single-player gates stay local.','remaining':'No compatible public endpoint or original GRank client library ships with the GPL source. Network submission therefore requires an optional backend implementation; all local state, validation, report fan-out and callback semantics remain executable.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8');print(f'PASS: 28+17 ranking symbols + {len(native)} unchanged-C records + 21 server + 23 game contracts')
if __name__=='__main__':main()
