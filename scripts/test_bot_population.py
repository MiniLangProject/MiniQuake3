"""Build the bot-population contracts and native formatting/string oracle."""
import json
import subprocess
import sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT, msvc_env, run
from test_rejections import tiny_bsp

def main():
    out=ROOT/'build/reference/bot_population';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'tests/reference/bot_population_oracle.c'; oracle=out/'bot_population_oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/MT',source,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log').strip()
    if native!='PASS: native Baseq3 bot population boundary oracle': raise RuntimeError(native)
    bsp=out/'empty.bsp';bsp.write_bytes(tiny_bsp())
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_population_contracts.ml','--output','bot_population_contracts.exe'],check=True)
    mini=run([ROOT/'build/bot_population_contracts.exe',bsp],ROOT/'build',log=out/'contracts.log').strip()
    if mini!='PASS: 31 bot population contracts': raise RuntimeError(mini)
    files=[ROOT/'Quake-III-Arena-original-source/code/game/g_bot.c',source,
           ROOT/'src/mq3/game/bot_population.ml',ROOT/'tests/bot_population_contracts.ml']
    result={'passed':True,'native':native,'minilang':mini,'contract_count':31,
            'scope':'Baseq3 random bot add/remove, minimum-player policy, G_AddBot userinfo/allocation/queue order, addbot and botlist server commands, G_SpawnBots and single-player arena setup. Native oracle pins Q_CleanStr and MSVC float formatting boundaries.',
            'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: native oracle + 31 MiniLang bot population contracts')
if __name__=='__main__': main()
