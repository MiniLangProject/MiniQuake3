#!/usr/bin/env python3
"""Complete be_aas_route.c symbol, unchanged-C, native and retail gate."""
from __future__ import annotations
import json,py_compile,re,subprocess,sys
from pathlib import Path
from inventory import sha
from test_aas_route_extras import fixture
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SYMBOLS=['AAS_AllocRoutingCache','AAS_AreaContentsTravelFlags','AAS_AreaContentsTravelFlags_inline','AAS_AreaReachabilityToGoalArea','AAS_AreaRouteToGoalArea','AAS_AreaTravelTime','AAS_AreaTravelTimeToGoalArea','AAS_AreaVisible','AAS_BridgeWalkable','AAS_CalculateAreaTravelTimes','AAS_ClusterAreaNum','AAS_CreateAllRoutingCache','AAS_CreateReversedReachability','AAS_EnableRoutingArea','AAS_FreeAllClusterAreaCache','AAS_FreeAllPortalCache','AAS_FreeOldestCache','AAS_FreeRoutingCache','AAS_FreeRoutingCaches','AAS_GetAreaContentsTravelFlags','AAS_GetAreaRoutingCache','AAS_GetPortalRoutingCache','AAS_InitAreaContentsTravelFlags','AAS_InitClusterAreaCache','AAS_InitPortalCache','AAS_InitPortalMaxTravelTimes','AAS_InitReachabilityAreas','AAS_InitRouting','AAS_InitRoutingUpdate','AAS_InitTravelFlagFromType','AAS_LinkCache','AAS_NearestHideArea','AAS_NextAreaReachability','AAS_NextModelReachability','AAS_PortalMaxTravelTime','AAS_PredictRoute','AAS_RandomGoalArea','AAS_ReachabilityFromNum','AAS_ReadCache','AAS_ReadRouteCache','AAS_RemoveRoutingCacheInCluster','AAS_RemoveRoutingCacheUsingArea','AAS_RoutingInfo','AAS_RoutingTime','AAS_TravelFlagForType','AAS_TravelFlagForType_inline','AAS_UnlinkCache','AAS_UpdateAreaRoutingCache','AAS_UpdatePortalRoutingCache','AAS_WriteRouteCache','DistancePointToLine']
ORACLE=['AAS_InitTravelFlagFromType','AAS_TravelFlagForType_inline','AAS_TravelFlagForType','AAS_GetAreaContentsTravelFlags','AAS_AreaTravelTime','AAS_BridgeWalkable','AAS_AreaVisible','DistancePointToLine']
def build(source:str,output:str)->Path:
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def main()->int:
 py_compile.compile(__file__,doraise=True);out=ROOT/'build/reference/be_aas_route_complete';out.mkdir(parents=True,exist_ok=True);fixturePath=out/'route.aas';fixturePath.write_bytes(fixture());rcd=out/'route.rcd';retailRcd=out/'q3dm1.rcd'
 original=ROOT/'Quake-III-Arena-original-source/code/botlib/be_aas_route.c';module=ROOT/'src/mq3/botlib/be_aas_route.ml';text=module.read_text(encoding='utf-8');missing=[name for name in SYMBOLS if not re.search(r'function\s+'+re.escape(name)+r'\s*\(',text)]
 if missing:raise RuntimeError('missing be_aas_route symbols: '+', '.join(missing))
 inc=out/'be_aas_route_complete_under_test.inc';inc.write_text(extract(original,ORACLE),encoding='utf-8',newline='\n');harness=ROOT/'tests/reference/be_aas_route_complete_oracle.c';nativeExe=out/'be_aas_route_complete_oracle.exe'
 run(['cl','/nologo','/O2','/fp:strict','/MT','/W4','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{nativeExe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([nativeExe],out,log=out/'oracle.log');mini=run([build('tests/be_aas_route_complete_oracle.ml','be_aas_route_complete_oracle.exe')],ROOT/'build',log=out/'minilang.log');normalizedMini=re.sub(r'(?<=\d)\.(?=[,\n])','',re.sub(r'(?<=\d)\.0(?=[,\n])','',mini))
 if native!=normalizedMini:raise RuntimeError('be_aas_route unchanged-C mismatch\nnative: '+repr(native)+'\nmini: '+repr(mini))
 contracts=run([build('tests/be_aas_route_complete_contracts.ml','be_aas_route_complete_contracts.exe'),fixturePath,rcd],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 27 complete be_aas_route adapter contracts':raise RuntimeError(contracts)
 retail=run([build('tests/be_aas_route_complete_retail_probe.ml','be_aas_route_complete_retail_probe.exe'),Path('D:/Quake3/baseq3/pak0.pk3'),retailRcd],ROOT/'build',log=out/'retail.log').strip()
 if not retail.startswith('PASS: 8 retail be_aas_route checks'):raise RuntimeError(retail)
 result={'passed':True,'symbols':len(SYMBOLS),'differentialRecords':native.count('\n'),'contracts':27,'retail':retail,'oracleFunctions':ORACLE,'sources':{str(path.relative_to(ROOT)).replace('\\','/'):sha(path) for path in [original,module,harness,ROOT/'tests/be_aas_route_complete_oracle.ml',ROOT/'tests/be_aas_route_complete_contracts.ml',ROOT/'tests/be_aas_route_complete_retail_probe.ml']}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {len(SYMBOLS)} be_aas_route symbols + {result['differentialRecords']} unchanged-C records + 27 contracts + retail");return 0
if __name__=='__main__':raise SystemExit(main())
