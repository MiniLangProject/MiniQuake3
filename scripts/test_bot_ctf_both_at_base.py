"""Direct extracted Baseq3 both-flags-at-base CTF order oracle and contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
 out=ROOT/'build/reference/bot_ctf_both_at_base';out.mkdir(parents=True,exist_ok=True);original=ROOT/'Quake-III-Arena-original-source/code/game/ai_team.c';(out/'bot_ctf_both_at_base_under_test.inc').write_text(extract(original,['BotCTFOrders_BothFlagsAtBase']),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/bot_ctf_both_at_base_oracle.c';exe=out/'bot_ctf_both_at_base_oracle.exe';run(['cl','/nologo','/O2','/MT','/W4',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 expected='\n'.join([
  'p1=','a1=',
  'p2=C:cmd_defendbase:P0|O:0|C:cmd_getflag:P1|O:1','a2=C:cmd_defendbase:P0|O:0|C:cmd_getflag:P1|O:1',
  'p3=C:cmd_defendbase:P0|O:0|C:cmd_defendbase:P1|O:1|C:cmd_getflag:P2|O:2','a3=C:cmd_defendbase:P0|O:0|C:cmd_getflag:P1|O:1|C:cmd_getflag:P2|O:2',
  'p4=C:cmd_defendbase:P0|O:0|C:cmd_defendbase:P1|O:1|C:cmd_getflag:P3|O:3|C:cmd_getflag:P2|O:2','a4=C:cmd_defendbase:P0|O:0|C:cmd_defendbase:P1|O:1|C:cmd_getflag:P3|O:3|C:cmd_getflag:P2|O:2',
  'p5=C:cmd_defendbase:P0|O:0|C:cmd_defendbase:P1|O:1|C:cmd_defendbase:P2|O:2|C:cmd_getflag:P4|O:4|C:cmd_getflag:P3|O:3','a5=C:cmd_defendbase:P0|O:0|C:cmd_defendbase:P1|O:1|C:cmd_getflag:P4|O:4|C:cmd_getflag:P3|O:3|C:cmd_getflag:P2|O:2',
  'p6=C:cmd_defendbase:P0|O:0|C:cmd_defendbase:P1|O:1|C:cmd_defendbase:P2|O:2|C:cmd_getflag:P5|O:5|C:cmd_getflag:P4|O:4','a6=C:cmd_defendbase:P0|O:0|C:cmd_defendbase:P1|O:1|C:cmd_getflag:P5|O:5|C:cmd_getflag:P4|O:4|C:cmd_getflag:P3|O:3',
  'p12=C:cmd_defendbase:P0|O:0|C:cmd_defendbase:P1|O:1|C:cmd_defendbase:P2|O:2|C:cmd_defendbase:P3|O:3|C:cmd_defendbase:P4|O:4|C:cmd_getflag:P11|O:11|C:cmd_getflag:P10|O:10|C:cmd_getflag:P9|O:9|C:cmd_getflag:P8|O:8',
  'a12=C:cmd_defendbase:P0|O:0|C:cmd_defendbase:P1|O:1|C:cmd_defendbase:P2|O:2|C:cmd_defendbase:P3|O:3|C:cmd_getflag:P11|O:11|C:cmd_getflag:P10|O:10|C:cmd_getflag:P9|O:9|C:cmd_getflag:P8|O:8|C:cmd_getflag:P7|O:7',''])
 if native!=expected:raise RuntimeError('native oracle mismatch\nEXPECTED:\n'+expected+'ACTUAL:\n'+native)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_ctf_both_at_base_contracts.ml','--output','bot_ctf_both_at_base_contracts.exe'],check=True);mini=run([ROOT/'build/bot_ctf_both_at_base_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if mini!='PASS: 17 both-flags-at-base CTF order contracts':raise RuntimeError(mini)
 files=[original,harness,ROOT/'src/mq3/game/bot_team_helpers.ml',ROOT/'tests/bot_ctf_both_at_base_contracts.ml'];result={'passed':True,'native_records':14,'contracts':17,'function':'BotCTFOrders_BothFlagsAtBase','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}};(out/'result.json').write_text(json.dumps(result,indent=2)+'\n')
 print('PASS: 14 exact Baseq3 both-flags-at-base CTF records + 17 contracts')
if __name__=='__main__':main()
