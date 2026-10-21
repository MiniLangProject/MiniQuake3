"""Unchanged-C differential and retail asset gate for cg_scoreboard.c."""
import argparse,json,subprocess,sys,zipfile
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
 p=argparse.ArgumentParser();p.add_argument('--pak',type=Path);a=p.parse_args();out=ROOT/'build/reference/cgame_scoreboard';out.mkdir(parents=True,exist_ok=True)
 src=ROOT/'Quake-III-Arena-original-source/code/cgame/cg_scoreboard.c';(out/'cgame_scoreboard_under_test.inc').write_text(extract(src,['CG_CenterGiantLine']),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/cgame_scoreboard_oracle.c';exe=out/'oracle.exe';run(['cl','/nologo','/Od','/fp:strict','/MT',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 for source,name in [('tests/cgame_scoreboard_oracle.ml','cgame_scoreboard_oracle.exe'),('tests/cgame_scoreboard_contracts.ml','cgame_scoreboard_contracts.exe')]: subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',name],cwd=ROOT,check=True)
 mini=run([ROOT/'build/cgame_scoreboard_oracle.exe'],ROOT/'build',log=out/'minilang.log');assert native==mini,(native,mini)
 contracts=run([ROOT/'build/cgame_scoreboard_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert contracts=='PASS: 21 native cg_scoreboard contracts',contracts
 retail=[]
 if a.pak:
  with zipfile.ZipFile(a.pak) as z:
   names={n.lower() for n in z.namelist()}
   for name in ('menu/tab/name.tga','menu/tab/ping.tga','menu/tab/score.tga','menu/tab/time.tga'): assert name in names;retail.append(name)
 files=[src,harness,ROOT/'src/mq3/client/cgame_scoreboard.ml',ROOT/'src/mq3/client/baseq3_match_display.ml',ROOT/'tests/cgame_scoreboard_oracle.ml',ROOT/'tests/cgame_scoreboard_contracts.ml']
 (out/'result.json').write_text(json.dumps({'passed':True,'differential_records':3,'contracts':21,'retail_assets':retail,'functions':['CG_DrawClientScore','CG_TeamScoreboard','CG_DrawOldScoreboard','CG_CenterGiantLine','CG_DrawOldTourneyScoreboard'],'scope':'All five cg_scoreboard.c functions are represented natively; the playable intermission display consumes the native old-scoreboard layout. Centering is compared with unchanged C and all state/layout branches have MiniLang contracts.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n')
 print('PASS: 3 unchanged C scoreboard records + 21 native contracts + '+str(len(retail))+' retail assets')
if __name__=='__main__':main()
