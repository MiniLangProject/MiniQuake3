"""Build and run the Baseq3 BotInput native oracle and MiniLang contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
def main():
 out=ROOT/'build/reference/bot_input';out.mkdir(parents=True,exist_ok=True);src=ROOT/'tests/reference/bot_input_oracle.c';exe=out/'bot_input_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',src,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log').strip()
 if native!='PASS: 6 native Baseq3 bot input scenarios / 18 exact observations':raise RuntimeError(native)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_input_contracts.ml','--output','bot_input_contracts.exe'],check=True);mini=run([ROOT/'build/bot_input_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if mini!='PASS: 17 bot input contracts':raise RuntimeError(mini)
 files=[ROOT/'Quake-III-Arena-original-source/code/game/ai_main.c',src,ROOT/'src/mq3/game/bot_input.ml',ROOT/'tests/bot_input_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'native':native,'minilang':mini,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}},indent=2)+'\n')
 print('PASS: direct C oracle + 17 MiniLang bot input contracts')
if __name__=='__main__':main()
