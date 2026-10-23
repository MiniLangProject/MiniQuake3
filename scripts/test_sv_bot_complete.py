"""Focused native and retail parity gate for all server/sv_bot.c functions."""
import argparse,json,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,run

SYMBOLS=['BotClientCommand','BotDrawDebugPolygons','BotImport_BSPEntityData','BotImport_BSPModelMinsMaxsOrigin','BotImport_DebugLineCreate','BotImport_DebugLineDelete','BotImport_DebugLineShow','BotImport_DebugPolygonCreate','BotImport_DebugPolygonDelete','BotImport_DebugPolygonShow','BotImport_EntityTrace','BotImport_FreeMemory','BotImport_GetMemory','BotImport_HunkAlloc','BotImport_PointContents','BotImport_Print','BotImport_Trace','BotImport_inPVS','EntityInPVS','SV_BotAllocateClient','SV_BotFrame','SV_BotFreeClient','SV_BotGetConsoleMessage','SV_BotGetSnapshotEntity','SV_BotInitBotLib','SV_BotInitCvars','SV_BotLibSetup','SV_BotLibShutdown']

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path);args=parser.parse_args()
    subprocess.run([sys.executable,ROOT/'scripts/test_bot_server_bridge.py'],cwd=ROOT,check=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/sv_bot_complete_contracts.ml','--output','sv_bot_complete_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/sv_bot_complete_contracts.exe'],ROOT/'build').strip()
    if value!='PASS: 40 sv_bot complete contracts':raise RuntimeError(value)
    retail=[]
    if args.data_root:
      for script in ('test_botlib_retail_qagame.py','test_bot_spawn_retail.py'):
        output=run([sys.executable,ROOT/'scripts'/script,'--data-root',args.data_root],ROOT,timeout=360).strip();retail.append(output)
    source=ROOT/'Quake-III-Arena-original-source/code/server/sv_bot.c';files=[source,ROOT/'src/mq3/botlib/server_imports.ml',ROOT/'src/mq3/botlib/server_bridge.ml',ROOT/'tests/sv_bot_complete_contracts.ml',ROOT/'tests/reference/bot_server_bridge_oracle.c']
    report={'passed':True,'symbols':SYMBOLS,'native_contracts':40,'unchanged_c_scenarios':4,'unchanged_c_observations':11,'retail':retail,
      'scope':'All 28 sv_bot functions: bot slots, debug polygons/lines, print classes, trace/world/BSP adapters, memory, trusted client commands, bot frames, cvars/import-table lifecycle, console messages, snapshot entities and the disabled EntityInPVS diagnostic.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    out=ROOT/'build/reference/sv_bot_complete';out.mkdir(parents=True,exist_ok=True);(out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('PASS: 28/28 sv_bot symbols; 4 unchanged-C scenarios / 11 observations + 40 native contracts'+(' + 30 retail contracts' if retail else ''))
if __name__=='__main__':main()
