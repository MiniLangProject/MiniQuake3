"""Build the unchanged-C BotAI frame oracle and focused MiniLang contracts."""
import json
import subprocess
import sys
from pathlib import Path
from inventory import sha
from test_rejections import tiny_bsp
from toolchain import ROOT, msvc_env, run

def main():
    out=ROOT/'build/reference/bot_ai_frame'; out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'tests/reference/bot_ai_frame_oracle.c'; oracle=out/'bot_ai_frame_oracle.exe'
    run(['cl','/nologo','/O2','/fp:strict','/MT','/W4',source,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log').strip()
    expected_native='PASS: 7 native Baseq3 bot AI frame scenarios / 42 exact observations'
    if native != expected_native: raise RuntimeError(native)
    bsp=out/'empty.bsp'; bsp.write_bytes(tiny_bsp())
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_ai_frame_contracts.ml','--output','bot_ai_frame_contracts.exe'],check=True)
    mini=run([ROOT/'build/bot_ai_frame_contracts.exe',bsp],ROOT/'build',log=out/'contracts.log').strip()
    if mini != 'PASS: 26 bot AI frame contracts': raise RuntimeError(mini)
    files=[ROOT/'Quake-III-Arena-original-source/code/game/ai_main.c',source,ROOT/'src/mq3/game/bot_ai_frame.ml',ROOT/'src/mq3/game/bot_ai_commands.ml',ROOT/'src/mq3/game/bot_fight_state.ml',ROOT/'src/mq3/game/lifecycle.ml',ROOT/'tests/bot_ai_frame_contracts.ml']
    result={'passed':True,'native':native,'minilang':mini,'contract_count':26,'exact_observations':42,
      'scope':'Baseq3 BotAI_GetClientState, BotAI_GetEntityState, BotAI_GetSnapshotEntity and BotAIStartFrame scheduling, entity feed, pause, residual, AAS, command delivery and configured AI-node dispatch boundaries.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: unchanged-C oracle + 26 MiniLang bot AI frame contracts')
if __name__=='__main__': main()
