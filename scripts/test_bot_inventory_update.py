"""Differential Baseq3 full player-state inventory projection."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
 out=ROOT/'build/reference/bot_inventory_update';out.mkdir(parents=True,exist_ok=True);original=ROOT/'Quake-III-Arena-original-source/code/game/ai_dmq3.c';(out/'bot_inventory_update_under_test.inc').write_text(extract(original,['BotUpdateInventory']),encoding='utf-8',newline='\n');harness=ROOT/'tests/reference/bot_inventory_update_oracle.c';exe=out/'bot_inventory_update_oracle.exe'
 run(['cl','/nologo','/O2','/MT','/W4',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_inventory_update_oracle.ml','--output','bot_inventory_update_oracle.exe'],check=True);mini=run([ROOT/'build/bot_inventory_update_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:raise RuntimeError('inventory update differential mismatch\nnative: '+repr(native)+'\nmini: '+repr(mini))
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/bot_inventory_update_contracts.ml','--output','bot_inventory_update_contracts.exe'],check=True);contracts=run([ROOT/'build/bot_inventory_update_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 10 bot inventory update contracts':raise RuntimeError(contracts)
 result={'passed':True,'records':native.count('\n'),'contracts':10,'observed_inventory_values':60,'functions':['BotUpdateInventory'],'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in [original,harness,ROOT/'src/mq3/game/bot_inventory_ai.ml',ROOT/'tests/bot_inventory_update_oracle.ml',ROOT/'tests/bot_inventory_update_contracts.ml']}};(out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {result['records']} exact Baseq3 inventory-update records / 60 values + 10 contracts")
if __name__=='__main__':main()
