#!/usr/bin/env python3
"""Complete q_shared.h inline/platform helper and ABI ownership gate."""
import json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run

SYMBOLS=("BigFloat","BigLong","BigShort","CrossProduct","Distance","DistanceSquared","LittleFloat","LittleLong","LittleShort","Q_fabs","Q_rsqrt","VectorCompare","VectorInverse","VectorLength","VectorLengthSquared","VectorNormalizeFast","__fctiw","__lhbrx","__lwbrx")
TYPES=("qboolean","qhandle_t","sfxHandle_t","fileHandle_t","clipHandle_t","pc_token_t","cvar_t","vmCvar_t","cplane_t","trace_t","markFragment_t","orientation_t","trajectory_t","playerState_t","usercmd_t","entityState_t","gameState_t","qtime_t")
CONSTANTS=("MAX_STRING_CHARS","MAX_TOKEN_CHARS","MAX_INFO_STRING","BIG_INFO_STRING","MAX_QPATH","MAX_NAME_LENGTH","MAX_SAY_TEXT","MAX_CLIENTS","MAX_GENTITIES","ENTITYNUM_NONE","ENTITYNUM_WORLD","GENTITYNUM_BITS","MAX_MODELS","MAX_SOUNDS","MAX_CONFIGSTRINGS","MAX_GAMESTATE_CHARS")

def build(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
 return ROOT/'build'/output

def main():
 out=ROOT/'build/reference/q_shared_header';out.mkdir(parents=True,exist_ok=True)
 header=ROOT/'Quake-III-Arena-original-source/code/game/q_shared.h';port=ROOT/'src/mq3/shared/q_shared_header.ml'
 original=header.read_text(encoding='latin1');native=port.read_text(encoding='utf-8')
 missing_original=[name for name in SYMBOLS+TYPES+CONSTANTS if not re.search(r'\b'+re.escape(name)+r'\b',original)]
 missing_port=[name for name in SYMBOLS+CONSTANTS if not re.search(r'\b(?:function|const)\s+'+re.escape(name)+r'\b',native)]
 if missing_original or missing_port: raise RuntimeError(f'q_shared.h coverage source={missing_original} port={missing_port}')
 oracle=out/'q_shared_header_oracle.exe'
 run(['cl','/nologo','/Od','/Gy','/MT','/W4','/WX','/wd4716','/DWIN32','/DNDEBUG','/D_CRT_SECURE_NO_WARNINGS',ROOT/'tests/reference/q_shared_header_oracle.c',ROOT/'Quake-III-Arena-original-source/code/game/q_math.c',ROOT/'Quake-III-Arena-original-source/code/game/q_shared.c',f'/Fe:{oracle}','/link','/OPT:REF','/Brepro'],ROOT,msvc_env('x86'),out/'oracle-build.log')
 expected=run([oracle],out,log=out/'oracle.log').replace('\r\n','\n')
 actual=run([build('tests/q_shared_header_oracle.ml','q_shared_header_oracle.exe')],ROOT/'build',log=out/'minilang.log').replace('\r\n','\n')
 if expected!=actual:
  (out/'expected.txt').write_text(expected,encoding='utf-8');(out/'actual.txt').write_text(actual,encoding='utf-8')
  raise RuntimeError('q_shared.h unchanged-C mismatch')
 contracts=run([build('tests/q_shared_header_contracts.ml','q_shared_header_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 12 q_shared.h ABI contracts': raise RuntimeError(contracts)
 files=[header,port,ROOT/'tests/reference/q_shared_header_oracle.c',ROOT/'tests/q_shared_header_oracle.ml',ROOT/'tests/q_shared_header_contracts.ml']
 result={'passed':True,'symbols':len(SYMBOLS),'types':len(TYPES),'constants':len(CONSTANTS),'exact_records':len(expected.splitlines()),'contracts':12,'platform_note':'The three double-underscore helpers are original PowerPC compiler intrinsics; portable managed equivalents are present, while the target Win32 path uses Big/Little helpers.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f'PASS: q_shared.h {len(SYMBOLS)} symbols + {len(TYPES)} ABI types + {len(CONSTANTS)} constants + {len(expected.splitlines())} exact records + 12 contracts')
if __name__=='__main__':main()
