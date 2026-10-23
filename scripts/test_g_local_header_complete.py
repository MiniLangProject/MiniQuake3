#!/usr/bin/env python3
"""Complete g_local.h local-game contract, ABI and declaration gate."""
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run

def build(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
 return ROOT/'build'/output

def strings_for_function(source,name):
 match=re.search(r'function\s+'+re.escape(name)+r'\(\)\s+return\s*\[(.*?)\]\s*end function',source,re.S)
 if not match: raise RuntimeError(f'g_local.h missing {name} inventory')
 return re.findall(r'"([^"]*)"',match.group(1))

def main():
 out=ROOT/'build/reference/g_local_header';out.mkdir(parents=True,exist_ok=True)
 header=ROOT/'Quake-III-Arena-original-source/code/game/g_local.h';facade=ROOT/'src/mq3/game/g_local.ml'
 original=header.read_text(encoding='latin1');ported=facade.read_text(encoding='utf-8')
 clean=re.sub(r'/\*.*?\*/','',original,flags=re.S);clean=re.sub(r'//[^\n]*','',clean)
 defines=list(dict.fromkeys(re.findall(r'^\s*#define\s+([A-Z][A-Z0-9_]*|FOFS)\b',clean,re.M)))
 enum_names=[]
 for body in re.findall(r'typedef\s+enum\s*\{(.*?)\}\s*\w+',clean,re.S):
  enum_names.extend(re.findall(r'^\s*([A-Z][A-Z0-9_]*)\s*(?:=\s*[^,]+)?\s*,?',body,re.M))
 enum_names=list(dict.fromkeys(enum_names))
 types=['moverState_t','gentity_t','gclient_t','clientConnected_t','spectatorState_t','playerTeamStateState_t','playerTeamState_t','clientSession_t','clientPersistant_t','level_locals_t','bot_settings_t']
 declarations=list(dict.fromkeys(re.findall(r'\b([A-Za-z_]\w*)\s*\([^;{}]*?\)\s*;',clean,re.S)))
 declarations=[name for name in declarations if name!='void']
 missing_constants=[name for name in defines+enum_names if not re.search(r'\b(?:const|function)\s+'+re.escape(name)+r'\b',ported)]
 if missing_constants: raise RuntimeError(f'g_local.h missing constants/enums: {missing_constants}')
 if strings_for_function(ported,'typeNames')!=types: raise RuntimeError('g_local.h type inventory mismatch')
 if strings_for_function(ported,'declarationNames')!=declarations: raise RuntimeError('g_local.h declaration inventory mismatch')
 fields={
  'entityFieldNames':['s','r','client','inuse','classname','spawnflags','neverFree','flags','model','model2','freetime','eventTime','freeAfterEvent','unlinkAfterEvent','physicsObject','physicsBounce','clipmask','moverState','soundPos1','sound1to2','sound2to1','soundPos2','soundLoop','parent','nextTrain','prevTrain','pos1','pos2','message','timestamp','angle','target','targetname','team','targetShaderName','targetShaderNewName','target_ent','speed','movedir','nextthink','think','reached','blocked','touch','use','pain','die','pain_debounce_time','fly_sound_debounce_time','last_move_time','health','takedamage','damage','splashDamage','splashRadius','methodOfDeath','splashMethodOfDeath','count','chain','enemy','activator','teamchain','teammaster','watertype','waterlevel','noise_index','wait','random','item'],
  'clientFieldNames':['ps','pers','sess','readyToExit','noclip','lastCmdTime','buttons','oldbuttons','latched_buttons','oldOrigin','damage_armor','damage_blood','damage_knockback','damage_from','damage_fromWorld','accurateCount','accuracy_shots','accuracy_hits','lastkilled_client','lasthurt_client','lasthurt_mod','respawnTime','inactivityTime','inactivityWarning','rewardTime','airOutTime','lastKillTime','fireHeld','hook','switchTeamTime','timeResidual','areabits'],
  'levelFieldNames':['clients','gentities','gentitySize','num_entities','warmupTime','logFile','maxclients','framenum','time','previousTime','startTime','teamScores','lastTeamLocationTime','newSession','restarted','numConnectedClients','numNonSpectatorClients','numPlayingClients','sortedClients','follow1','follow2','snd_fry','warmupModificationCount','voteString','voteDisplayString','voteTime','voteExecuteTime','voteYes','voteNo','numVotingClients','teamVoteString','teamVoteTime','teamVoteYes','teamVoteNo','numteamVotingClients','spawning','numSpawnVars','spawnVars','numSpawnVarChars','spawnVarChars','intermissionQueued','intermissiontime','changemap','readyToExit','exitTime','intermission_origin','intermission_angle','locationLinked','locationHead','bodyQueIndex','bodyQue']}
 for function,expected in fields.items():
  if strings_for_function(ported,function)!=expected: raise RuntimeError(f'g_local.h {function} inventory mismatch')
  absent=[field for field in expected if not re.search(r'\b'+re.escape(field)+r'\b',original)]
  if absent: raise RuntimeError(f'g_local.h {function} source mismatch: {absent}')
 oracle=out/'g_local_header_oracle.exe'
 run(['cl','/nologo','/Od','/MT','/W4','/WX','/DWIN32',ROOT/'tests/reference/g_local_header_oracle.c',f'/Fe:{oracle}','/link','/Brepro'],ROOT,msvc_env('x86'),out/'oracle-build.log')
 expected=run([oracle],out,log=out/'oracle.log').replace('\r\n','\n')
 actual=run([build('tests/g_local_header_oracle.ml','g_local_header_oracle.exe')],ROOT/'build',log=out/'minilang.log').replace('\r\n','\n')
 if expected!=actual:
  (out/'expected.txt').write_text(expected,encoding='utf-8');(out/'actual.txt').write_text(actual,encoding='utf-8');raise RuntimeError('g_local.h unchanged-C mismatch')
 contracts=run([build('tests/g_local_header_contracts.ml','g_local_header_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 15 g_local.h ABI contracts': raise RuntimeError(contracts)
 files=[header,facade,ROOT/'src/mq3/game/bodies.ml',ROOT/'src/mq3/game/spawn.ml',ROOT/'tests/reference/g_local_header_oracle.c',ROOT/'tests/g_local_header_oracle.ml',ROOT/'tests/g_local_header_contracts.ml']
 result={'passed':True,'constants_enums':len(defines+enum_names),'types':len(types),'declarations':len(declarations),'record_fields':sum(map(len,fields.values())),'exact_records':len(expected.splitlines()),'contracts':15,'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f'PASS: g_local.h {len(defines+enum_names)} constants/enums + {len(types)} types + {len(declarations)} declarations + {sum(map(len,fields.values()))} record fields + {len(expected.splitlines())} exact records + 15 contracts')
if __name__=='__main__':main()
