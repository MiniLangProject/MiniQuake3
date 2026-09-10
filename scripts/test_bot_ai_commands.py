"""Build/run the direct Baseq3 BotAI command oracle and MiniLang contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
def main():
 out=ROOT/'build/reference/bot_ai_commands';out.mkdir(parents=True,exist_ok=True);src=ROOT/'tests/reference/bot_ai_commands_oracle.c';exe=out/'bot_ai_commands_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',src,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log').strip();expected='PASS: 6 native Baseq3 BotAI command/status scenarios / 31 exact observations'
 if native!=expected:raise RuntimeError(native)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_ai_command_contracts.ml','--output','bot_ai_command_contracts.exe'],check=True);mini=run([ROOT/'build/bot_ai_command_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if mini!='PASS: 30 bot AI command/status contracts':raise RuntimeError(mini)
 files=[ROOT/'Quake-III-Arena-original-source/code/game/ai_main.c',src,ROOT/'src/mq3/game/bot_ai_commands.ml',ROOT/'tests/bot_ai_command_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'native':native,'minilang':mini,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}},indent=2)+'\n')
 print('PASS: direct C oracle + 30 MiniLang BotAI command/status contracts')
if __name__=='__main__':main()
