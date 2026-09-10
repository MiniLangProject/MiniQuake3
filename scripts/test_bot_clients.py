"""Build the isolated MiniLang contracts and native Baseq3 bot-client oracle."""
import json
import subprocess
import sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT, msvc_env, run
from test_rejections import tiny_bsp

def main():
    out=ROOT/'build/reference/bot_clients';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'tests/reference/bot_clients_oracle.c'; oracle=out/'bot_clients_oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/MT',source,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log').strip()
    if native!='PASS: native Baseq3 bot client oracle': raise RuntimeError(native)
    bsp=out/'empty.bsp';bsp.write_bytes(tiny_bsp())
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_client_contracts.ml','--output','bot_client_contracts.exe'],check=True)
    mini=run([ROOT/'build/bot_client_contracts.exe',bsp],ROOT/'build',log=out/'contracts.log').strip()
    if mini!='PASS: 20 bot client contracts': raise RuntimeError(mini)
    original=ROOT/'Quake-III-Arena-original-source/code/game/g_bot.c'
    result={'passed':True,'native':native,'minilang':mini,'contract_count':20,
            'scope':'Baseq3 G_CountHumanPlayers, G_CountBotPlayers, AddBotToSpawnQueue, G_RemoveQueuedBotBegin, G_CheckBotSpawn and G_BotConnect queue/order/settings behavior with deterministic engine and AI services.',
            'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in [original,source,ROOT/'src/mq3/game/bot_clients.ml',ROOT/'tests/bot_client_contracts.ml']}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: native oracle + 20 MiniLang bot client contracts')
if __name__=='__main__': main()
