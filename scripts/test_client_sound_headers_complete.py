#!/usr/bin/env python3
"""Complete unchanged-C ABI, declaration, productive wiring and Retail gate for three client headers."""
from __future__ import annotations
import argparse,json,re,subprocess,sys,zipfile
from inventory import sha
from toolchain import ROOT,msvc_env,run
HEADERS={
 'client':ROOT/'Quake-III-Arena-original-source/code/client/client.h',
 'snd_local':ROOT/'Quake-III-Arena-original-source/code/client/snd_local.h',
 'snd_public':ROOT/'Quake-III-Arena-original-source/code/client/snd_public.h'}
FACADES={
 'client':ROOT/'src/mq3/client/client_abi.ml',
 'snd_local':ROOT/'src/mq3/audio/snd_local.ml',
 'snd_public':ROOT/'src/mq3/audio/snd_public.ml'}

def clean(text): return re.sub(r'//[^\n]*','',re.sub(r'/\*.*?\*/','',text,flags=re.S))
def strings(source,name):
 m=re.search(r'function\s+'+re.escape(name)+r'\(\)\s+return\s*\[(.*?)\]\s*end function',source,re.S)
 if not m: raise RuntimeError(f'missing {name} inventory')
 return re.findall(r'"([^"]*)"',m.group(1))
def declarations(text): return list(dict.fromkeys(re.findall(r'\b([A-Za-z_]\w*)\s*\([^;{}]*?\)\s*;',clean(text),re.S)))
def typedefs(text):
 result=[]
 for body,name in re.findall(r'typedef\s+(?:struct(?:\s+\w+)?\s*)?\{(.*?)\}\s*(\w+)\s*;',clean(text),re.S):
  fields=[]
  for decl in body.split(';'):
   fields+=re.findall(r'(?:\*\s*)?([A-Za-z_]\w*)\s*(?:\[[^\]]+\](?:\[[^\]]+\])?)?\s*(?:,|$)',decl.strip())
  result.append((name,fields))
 return result
def externals(text):
 result=[]
 for line in clean(text).splitlines():
  if line.strip().startswith('extern'): result+=re.findall(r'(?:\*\s*)?([A-Za-z_]\w*)\s*(?:\[[^\]]+\])?\s*(?:,|;)',line)
 return result
def build(source,output):
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
 return ROOT/'build'/output

def main():
 parser=argparse.ArgumentParser();parser.add_argument('--data-root',default='D:/Quake3');args=parser.parse_args()
 original={key:path.read_text(encoding='latin1') for key,path in HEADERS.items()};ported={key:path.read_text(encoding='utf-8') for key,path in FACADES.items()}
 expected_types={key:[name for name,_ in typedefs(text)] for key,text in original.items()}
 if strings(ported['client'],'typeNames')!=expected_types['client']: raise RuntimeError('client.h type inventory mismatch')
 if strings(ported['snd_local'],'typeNames')!=expected_types['snd_local']: raise RuntimeError('snd_local.h type inventory mismatch')
 for key in ('client','snd_local','snd_public'):
  expected=declarations(original[key]);actual=strings(ported[key],'declarationNames')
  if actual!=expected: raise RuntimeError(f'{key}.h declaration drift expected={expected} actual={actual}')
 for key in ('client','snd_local'):
  expected=externals(original[key]);actual=strings(ported[key],'externalNames')
  if actual!=expected: raise RuntimeError(f'{key}.h extern drift expected={expected} actual={actual}')
  for typename,fields in typedefs(original[key]):
   missing=[field for field in fields if not re.search(r'\b'+re.escape(field)+r'\b',ported[key])]
   if missing: raise RuntimeError(f'{key}.h {typename} field drift: {missing}')
 constants={'RETRANSMIT_TIMEOUT':'3000','MAX_PARSE_ENTITIES':'2048','PAINTBUFFER_SIZE':'4096','SND_CHUNK_SIZE':'1024','START_SAMPLE_IMMEDIATE':'0x7fffffff','WAV_FORMAT_PCM':'1','MAX_CHANNELS':'96','MAX_RAW_SAMPLES':'16384','SENTINEL_MULAW_ZERO_RUN':'127','SENTINEL_MULAW_FOUR_BIT_RUN':'126'}
 joined=original['client']+original['snd_local'];facades=ported['client']+ported['snd_local']
 for name,value in constants.items():
  if not re.search(r'^\s*#define\s+'+name+r'\s+'+re.escape(value)+r'\b',joined,re.M|re.I): raise RuntimeError(f'original constant drift: {name}')
  if not re.search(r'\bconst\s+'+name+r'\s*=',facades): raise RuntimeError(f'ported constant missing: {name}')
 wiring={'src/mq3/client/client_main.ml':['import mq3.client.client_abi as clientAbi','clientAbi.RETRANSMIT_TIMEOUT'],'src/mq3/audio/snd_channels.ml':['import mq3.audio.snd_local as sndLocal','sndLocal.MAX_CHANNELS'],'src/mq3/audio/qvm_playback.ml':['import mq3.audio.snd_public as sndPublic','sndPublic.validEntity']}
 for relative,markers in wiring.items():
  text=(ROOT/relative).read_text(encoding='utf-8')
  for marker in markers:
   if marker not in text: raise RuntimeError(f'productive wiring missing: {relative}: {marker}')
 out=ROOT/'build/reference/client_sound_headers';out.mkdir(parents=True,exist_ok=True);oracle=out/'oracle.exe';inc=ROOT/'Quake-III-Arena-original-source/code'
 run(['cl','/nologo','/Od','/MT','/W4','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{inc/"client"}',f'/I{inc/"game"}',f'/I{inc/"qcommon"}',f'/I{inc/"renderer"}',f'/I{inc/"ui"}',ROOT/'tests/reference/client_sound_headers_oracle.c',f'/Fe:{oracle}','/link','/Brepro'],ROOT,msvc_env('x86'),out/'oracle-build.log')
 expected=run([oracle],out,log=out/'oracle.log').replace('\r\n','\n');actual=run([build('tests/client_sound_headers_oracle.ml','client_sound_headers_oracle.exe')],ROOT/'build',log=out/'minilang.log').replace('\r\n','\n')
 if expected!=actual: raise RuntimeError('client/sound unchanged-C Win32 ABI mismatch')
 contracts=run([build('tests/client_sound_headers_contracts.ml','client_sound_headers_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 20 client/sound header contracts': raise RuntimeError(contracts)
 pak=ROOT/args.data_root/'baseq3/pak0.pk3' if not re.match(r'^[A-Za-z]:',args.data_root) else __import__('pathlib').Path(args.data_root)/'baseq3/pak0.pk3'
 if not pak.is_file(): raise RuntimeError(f'Retail pak0.pk3 missing: {pak}')
 with zipfile.ZipFile(pak) as archive:
  sounds=[name for name in archive.namelist() if name.lower().startswith('sound/') and name.lower().endswith(('.wav','.mp3'))]
 if len(sounds)<100: raise RuntimeError(f'Retail sound corpus incomplete: {len(sounds)}')
 files=list(HEADERS.values())+list(FACADES.values())+[ROOT/'src/mq3/client/client_main.ml',ROOT/'src/mq3/audio/snd_channels.ml',ROOT/'src/mq3/audio/qvm_playback.ml',ROOT/'tests/reference/client_sound_headers_oracle.c',ROOT/'tests/client_sound_headers_oracle.ml',ROOT/'tests/client_sound_headers_contracts.ml']
 result={'passed':True,'headers':3,'types':sum(map(len,expected_types.values())),'declarations':sum(len(declarations(v)) for v in original.values()),'externals':len(externals(original['client']))+len(externals(original['snd_local'])),'abi_records':len(expected.splitlines()),'contracts':20,'retail_sounds':len(sounds),'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
 print(f'PASS: client.h + snd_local.h + snd_public.h / {result["types"]} types + {result["declarations"]} declarations + {result["externals"]} externals + {result["abi_records"]} Win32 ABI records + 20 contracts + {len(sounds)} Retail sounds')
if __name__=='__main__': main()
