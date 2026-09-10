"""Build and run Baseq3 bot navigation native oracle and MiniLang contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
def main():
 out=ROOT/'build/reference/bot_navigation';out.mkdir(parents=True,exist_ok=True);src=ROOT/'tests/reference/bot_navigation_oracle.c';exe=out/'bot_navigation_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',src,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log').strip()
 if native!='PASS: 16 native Baseq3 bot navigation scenarios / 62 exact observations':raise RuntimeError(native)
 activation_src=ROOT/'tests/reference/bot_activation_oracle.c';activation_exe=out/'bot_activation_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',activation_src,f'/Fe:{activation_exe}','/link','/Brepro'],out,msvc_env('x64'),out/'activation-build.log');activation=run([activation_exe],out,log=out/'activation.log').strip()
 if activation!='PASS: 11 native Baseq3 activation-stack scenarios / 44 exact observations':raise RuntimeError(activation)
 discovery_src=ROOT/'tests/reference/bot_activate_discovery_oracle.c';discovery_exe=out/'bot_activate_discovery_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',discovery_src,f'/Fe:{discovery_exe}','/link','/Brepro'],out,msvc_env('x64'),out/'discovery-build.log');discovery=run([discovery_exe],out,log=out/'discovery.log').strip()
 if discovery!='PASS: 9 native Baseq3 activate-discovery scenarios / 30 exact observations':raise RuntimeError(discovery)
 item_src=ROOT/'tests/reference/bot_item_goals_oracle.c';item_exe=out/'bot_item_goals_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',item_src,f'/Fe:{item_exe}','/link','/Brepro'],out,msvc_env('x64'),out/'item-build.log');item=run([item_exe],out,log=out/'item.log').strip()
 if item!='PASS: 11 native Baseq3 item-goal scenarios / 27 exact observations':raise RuntimeError(item)
 route_src=ROOT/'tests/reference/bot_route_goals_oracle.c';route_exe=out/'bot_route_goals_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',route_src,f'/Fe:{route_exe}','/link','/Brepro'],out,msvc_env('x64'),out/'route-build.log');route_goals=run([route_exe],out,log=out/'route.log').strip()
 if route_goals!='PASS: 19 native Baseq3 route-goal scenarios / 55 exact observations':raise RuntimeError(route_goals)
 longterm_src=ROOT/'tests/reference/bot_long_term_oracle.c';longterm_exe=out/'bot_long_term_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',longterm_src,f'/Fe:{longterm_exe}','/link','/Brepro'],out,msvc_env('x64'),out/'longterm-build.log');longterm=run([longterm_exe],out,log=out/'longterm.log').strip()
 if longterm!='PASS: 13 native Baseq3 long-term-goal scenarios / 26 exact observations':raise RuntimeError(longterm)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_navigation_contracts.ml','--output','bot_navigation_contracts.exe'],check=True);mini=run([ROOT/'build/bot_navigation_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if mini!='PASS: 63 bot navigation contracts':raise RuntimeError(mini)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_route_goal_contracts.ml','--output','bot_route_goal_contracts.exe'],check=True);route_mini=run([ROOT/'build/bot_route_goal_contracts.exe'],ROOT/'build',log=out/'route-contracts.log').strip()
 if route_mini!='PASS: 23 bot route-goal contracts':raise RuntimeError(route_mini)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_long_term_goal_contracts.ml','--output','bot_long_term_goal_contracts.exe'],check=True);longterm_mini=run([ROOT/'build/bot_long_term_goal_contracts.exe'],ROOT/'build',log=out/'longterm-contracts.log').strip()
 if longterm_mini!='PASS: 18 bot long-term-goal contracts':raise RuntimeError(longterm_mini)
 longterm_body=ROOT/'tests/reference/bot_long_term_original.inc';files=[ROOT/'Quake-III-Arena-original-source/code/game/ai_dmq3.c',ROOT/'Quake-III-Arena-original-source/code/game/ai_dmnet.c',src,activation_src,discovery_src,item_src,route_src,longterm_src,longterm_body,ROOT/'src/mq3/game/bot_navigation.ml',ROOT/'tests/bot_navigation_contracts.ml',ROOT/'tests/bot_route_goal_contracts.ml',ROOT/'tests/bot_long_term_goal_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'native':native,'activation':activation,'discovery':discovery,'itemGoals':item,'routeGoals':route_goals,'longTermGoals':longterm,'minilang':mini,'routeMinilang':route_mini,'longTermMinilang':longterm_mini,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}},indent=2)+'\n')
 print('PASS: 79 native scenarios / 244 exact observations + 104 MiniLang bot navigation contracts')
if __name__=='__main__':main()
