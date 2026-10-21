#!/usr/bin/env python3
import argparse, json, subprocess, sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
FUNCS=['UI_DrawPlayer','UI_ForceLegsAnim','UI_ForceTorsoAnim','UI_LegsSequencing','UI_MachinegunSpinAngle','UI_MovedirAdjustment','UI_ParseAnimationFile','UI_PlayerAngles','UI_PlayerAnimation','UI_PlayerFloatSprite','UI_PlayerInfo_SetInfo','UI_PlayerInfo_SetModel','UI_PlayerInfo_SetWeapon','UI_PositionEntityOnTag','UI_PositionRotatedEntityOnTag','UI_RegisterClientModelname','UI_RegisterClientSkin','UI_RunLerpFrame','UI_SetLegsAnim','UI_SetLerpFrameAnimation','UI_SetTorsoAnim','UI_SwingAngles','UI_TorsoSequencing']
ORACLE=['UI_ForceLegsAnim','UI_SetLegsAnim','UI_ForceTorsoAnim','UI_SetTorsoAnim','UI_SwingAngles','UI_MachinegunSpinAngle']
def build(s,o): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',s,'--output',o],cwd=ROOT,check=True);return ROOT/'build'/o
def pak0(root):
 direct=root/'pak0.pk3';nested=root/'baseq3/pak0.pk3'
 if direct.is_file(): return direct
 if nested.is_file(): return nested
 raise FileNotFoundError(f'pak0.pk3 not found below {root}')
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--data-root',type=Path);args=ap.parse_args()
 s=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_players.c';p=ROOT/'src/mq3/client/ui_players.ml';ot=s.read_text(errors='replace');pt=p.read_text()
 for f in FUNCS:
  if f not in ot or f'function {f}(' not in pt: raise RuntimeError('missing symbol '+f)
 out=ROOT/'build/reference/ui_players';out.mkdir(parents=True,exist_ok=True);(out/'ui_players_under_test.inc').write_text(extract(s,ORACLE))
 h=ROOT/'tests/reference/ui_players_oracle.c';exe=out/'oracle.exe';run(['cl','/nologo','/Od','/W3',f'/I{out}',h,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'build.log');e=run([exe],out);a=run([build('tests/ui_players_oracle.ml','ui_players_oracle.exe')],ROOT/'build')
 if e!=a: raise RuntimeError('players oracle mismatch\nC:\n'+e+'ML:\n'+a)
 c=run([build('tests/ui_players_contracts.ml','ui_players_contracts.exe')],ROOT/'build').strip()
 if c!='PASS: 26 UI players contracts': raise RuntimeError(c)
 retail=None
 if args.data_root:
  retail=run([build('tests/ui_players_retail_probe.ml','ui_players_retail_probe.exe'),pak0(args.data_root.resolve())],ROOT/'build').strip()
  if retail!='PASS: 8 retail UI player/model contracts models=89 animations=31': raise RuntimeError(retail)
 files=[s,p,h,ROOT/'tests/ui_players_oracle.ml',ROOT/'tests/ui_players_contracts.ml',ROOT/'tests/ui_players_retail_probe.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'records':7,'contracts':26,'retail_contracts':8 if retail else 0,'functions':FUNCS,'sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n');print('PASS: 7 unchanged C UI players records + 26 contracts / 23 original functions')
 if retail: print(retail)
if __name__=='__main__': main()
