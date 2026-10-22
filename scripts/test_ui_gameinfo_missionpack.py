#!/usr/bin/env python3
"""Missionpack UI gameinfo unchanged-C, native and Retail asset gate."""
import argparse, json, re, subprocess, sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT, msvc_env, run

FUNCTIONS=['UI_GetBotInfoByName','UI_GetBotInfoByNumber','UI_GetBotNameByNumber','UI_GetNumBots','UI_LoadArenas','UI_LoadArenasFromFile','UI_LoadBots','UI_LoadBotsFromFile','UI_ParseInfos']
ORACLE=['UI_ParseInfos','UI_LoadArenasFromFile','UI_LoadArenas','UI_LoadBotsFromFile','UI_LoadBots','UI_GetBotInfoByNumber','UI_GetBotInfoByName','UI_GetNumBots','UI_GetBotNameByNumber']
def lexical_extract(source,names):
 text=source.read_text();parts=[]
 for name in names:
  match=re.search(r'^[\w* \t]+\b'+re.escape(name)+r'\s*\([^;{}]*\)\s*\{',text,re.M)
  if not match: raise RuntimeError('missing original function '+name)
  at=match.end();depth=1;quote='';line_comment=False;block_comment=False
  while depth and at<len(text):
   char=text[at];following=text[at+1] if at+1<len(text) else ''
   if line_comment:
    if char=='\n': line_comment=False
   elif block_comment:
    if char=='*' and following=='/': block_comment=False;at+=1
   elif quote:
    if char=='\\': at+=1
    elif char==quote: quote=''
   elif char in ('"',"'"): quote=char
   elif char=='/' and following=='/': line_comment=True;at+=1
   elif char=='/' and following=='*': block_comment=True;at+=1
   elif char=='{': depth+=1
   elif char=='}': depth-=1
   at+=1
  if depth: raise RuntimeError('unterminated original function '+name)
  parts.append(text[match.start():at])
 return '\n\n'.join(parts)+'\n'
def build(source,output): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def pak0(root):
 direct=root/'pak0.pk3';nested=root/'baseq3/pak0.pk3'
 if direct.is_file(): return direct
 if nested.is_file(): return nested
 raise FileNotFoundError('pak0.pk3 not found below '+str(root))
def main():
 parser=argparse.ArgumentParser();parser.add_argument('--data-root',type=Path,required=True);args=parser.parse_args()
 source=ROOT/'Quake-III-Arena-original-source/code/ui/ui_gameinfo.c';port=ROOT/'src/mq3/client/ui_gameinfo_missionpack.ml';original=source.read_text(errors='replace');ported=port.read_text()
 for name in FUNCTIONS:
  if name not in original or f'function {name}(' not in ported: raise RuntimeError('missing symbol '+name)
 out=ROOT/'build/reference/ui_gameinfo_missionpack';out.mkdir(parents=True,exist_ok=True);(out/'ui_gameinfo_missionpack_under_test.inc').write_text(lexical_extract(source,ORACLE),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/ui_gameinfo_missionpack_oracle.c';native=out/'oracle.exe';run(['cl','/nologo','/Od','/W3','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'build.log');expected=run([native],out,log=out/'native.log');actual=run([build('tests/ui_gameinfo_missionpack_oracle.ml','ui_gameinfo_missionpack_oracle.exe')],ROOT/'build',log=out/'minilang.log')
 if expected!=actual: raise RuntimeError('Missionpack UI gameinfo oracle mismatch\nC:\n'+expected+'MiniLang:\n'+actual)
 contracts=run([build('tests/ui_gameinfo_missionpack_contracts.ml','ui_gameinfo_missionpack_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 18 Missionpack UI gameinfo contracts': raise RuntimeError(contracts)
 retail=run([build('tests/ui_gameinfo_missionpack_retail_probe.ml','ui_gameinfo_missionpack_retail_probe.exe'),pak0(args.data_root.resolve())],ROOT/'build',log=out/'retail.log').strip()
 expected_retail='PASS: 6 Missionpack retail contracts arenas=30 bots=32 types=25,8,4,0,0,0'
 if retail!=expected_retail: raise RuntimeError(retail)
 files=[source,port,harness,ROOT/'tests/ui_gameinfo_missionpack_oracle.ml',ROOT/'tests/ui_gameinfo_missionpack_contracts.ml',ROOT/'tests/ui_gameinfo_missionpack_retail_probe.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'differential_records':7,'contracts':18,'retail_contracts':6,'functions':FUNCTIONS,'scope':'Complete Missionpack arena/bot info parsing and file aggregation, map metadata, skirmish numbering, type-bit/count derivation, bot lookups and Sarge fallback using Retail pak0 metadata.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n')
 print('PASS: 7 unchanged C records + 18 native contracts + 6 Retail contracts / 9 original functions')
if __name__=='__main__': main()
