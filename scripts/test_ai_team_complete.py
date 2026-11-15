"""Full ai_team.c symbol, C differential, native contract and retail gate."""
import argparse,json,os,py_compile,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SYMBOLS=['BotValidTeamLeader','BotNumTeamMates','BotClientTravelTimeToGoal','BotSortTeamMatesByBaseTravelTime','BotSetTeamMateTaskPreference','BotGetTeamMateTaskPreference','BotSortTeamMatesByTaskPreference','BotSayTeamOrderAlways','BotSayTeamOrder','BotVoiceChat','BotVoiceChatOnly','BotSayVoiceTeamOrder','BotCTFOrders_BothFlagsNotAtBase','BotCTFOrders_FlagNotAtBase','BotCTFOrders_EnemyFlagNotAtBase','BotCTFOrders_BothFlagsAtBase','BotCTFOrders','BotCreateGroup','BotTeamOrders','Bot1FCTFOrders_FlagAtCenter','Bot1FCTFOrders_TeamHasFlag','Bot1FCTFOrders_EnemyHasFlag','Bot1FCTFOrders_EnemyDroppedFlag','Bot1FCTFOrders','BotObeliskOrders','BotHarvesterOrders','FindHumanTeamLeader','BotTeamAI']
ORACLE=['Bot1FCTFOrders_FlagAtCenter','Bot1FCTFOrders_EnemyHasFlag','BotObeliskOrders','BotHarvesterOrders']

def build_ml(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],check=True)
 return ROOT/'build'/output

def main():
 parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path,default=Path(os.environ.get('MQ3_DATA_ROOT','D:/Quake3')));args=parser.parse_args();data_root=args.data_root.resolve()
 py_compile.compile(__file__,doraise=True)
 out=ROOT/'build/reference/ai_team_complete';out.mkdir(parents=True,exist_ok=True)
 original=ROOT/'Quake-III-Arena-original-source/code/game/ai_team.c';module=ROOT/'src/mq3/game/ai_team.ml';text=module.read_text(encoding='utf-8')
 missing=[name for name in SYMBOLS if not re.search(r'function\s+'+re.escape(name)+r'\s*\(',text)]
 if missing: raise RuntimeError('missing MiniLang symbols: '+', '.join(missing))
 inc=out/'ai_team_complete_under_test.inc';inc.write_text(extract(original,ORACLE),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/ai_team_complete_oracle.c';exe=out/'ai_team_complete_oracle.exe'
 run(['cl','/nologo','/O2','/MT','/W4','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
 native=run([exe],out,log=out/'oracle.log')
 mini=run([build_ml('tests/ai_team_complete_oracle.ml','ai_team_complete_oracle.exe')],ROOT/'build',log=out/'minilang.log')
 if native!=mini: raise RuntimeError('ai_team differential mismatch\nnative: '+repr(native)+'\nmini: '+repr(mini))
 contracts=run([build_ml('tests/ai_team_complete_contracts.ml','ai_team_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 11 ai_team native contracts':raise RuntimeError(contracts)
 retail=run([build_ml('tests/ai_team_retail_probe.ml','ai_team_retail_probe.exe'),data_root/'baseq3/pak0.pk3'],ROOT/'build',log=out/'retail.log').strip()
 if not retail.startswith('PASS: 3 retail teamplay/strategy contracts'):raise RuntimeError(retail)
 result={'passed':True,'symbols':len(SYMBOLS),'differentialRecords':native.count('\n'),'contracts':11,'retail':retail,'data_root':str(data_root),'oracleFunctions':ORACLE,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in [original,module,harness,ROOT/'tests/ai_team_complete_oracle.ml',ROOT/'tests/ai_team_complete_contracts.ml',ROOT/'tests/ai_team_retail_probe.ml']}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f"PASS: {len(SYMBOLS)} ai_team symbols + {result['differentialRecords']} unchanged-C records + 11 contracts + retail")
if __name__=='__main__':main()
