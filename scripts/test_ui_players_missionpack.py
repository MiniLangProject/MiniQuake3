#!/usr/bin/env python3
import argparse, json, subprocess, sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCS=['UI_DrawPlayer','UI_FileExists','UI_FindClientHeadFile','UI_ForceLegsAnim','UI_ForceTorsoAnim','UI_LegsSequencing','UI_MachinegunSpinAngle','UI_MovedirAdjustment','UI_ParseAnimationFile','UI_PlayerAngles','UI_PlayerAnimation','UI_PlayerFloatSprite','UI_PlayerInfo_SetInfo','UI_PlayerInfo_SetModel','UI_PlayerInfo_SetWeapon','UI_PositionEntityOnTag','UI_PositionRotatedEntityOnTag','UI_RegisterClientModelname','UI_RegisterClientSkin','UI_RunLerpFrame','UI_SetLegsAnim','UI_SetLerpFrameAnimation','UI_SetTorsoAnim','UI_SwingAngles','UI_TorsoSequencing']
ORACLE=['UI_ForceLegsAnim','UI_SetLegsAnim','UI_ForceTorsoAnim','UI_SetTorsoAnim','UI_SwingAngles','UI_MachinegunSpinAngle','UI_FileExists','UI_FindClientHeadFile']
def build(source,output): subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def pak0(root):
    direct=root/'pak0.pk3';nested=root/'baseq3/pak0.pk3'
    if direct.is_file(): return direct
    if nested.is_file(): return nested
    raise FileNotFoundError(f'pak0.pk3 not found below {root}')
def main():
    ap=argparse.ArgumentParser();ap.add_argument('--data-root',type=Path);args=ap.parse_args()
    source=ROOT/'Quake-III-Arena-original-source/code/ui/ui_players.c';port=ROOT/'src/mq3/client/ui_players_missionpack.ml';original=source.read_text(errors='replace');ported=port.read_text()
    for name in FUNCS:
        if name not in original or f'function {name}(' not in ported: raise RuntimeError('missing symbol '+name)
    out=ROOT/'build/reference/ui_players_missionpack';out.mkdir(parents=True,exist_ok=True);(out/'ui_players_missionpack_under_test.inc').write_text(extract(source,ORACLE))
    harness=ROOT/'tests/reference/ui_players_missionpack_oracle.c';exe=out/'oracle.exe';run(['cl','/nologo','/Od','/W3',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'build.log')
    expected=run([exe],out);actual=run([build('tests/ui_players_missionpack_oracle.ml','ui_players_missionpack_oracle.exe')],ROOT/'build')
    if expected!=actual: raise RuntimeError('missionpack players oracle mismatch\nC:\n'+expected+'ML:\n'+actual)
    contracts=run([build('tests/ui_players_missionpack_contracts.ml','ui_players_missionpack_contracts.exe')],ROOT/'build').strip()
    if contracts!='PASS: 13 missionpack UI players contracts': raise RuntimeError(contracts)
    retail=None
    if args.data_root:
        retail=run([build('tests/ui_players_missionpack_retail_probe.ml','ui_players_missionpack_retail_probe.exe'),pak0(args.data_root.resolve())],ROOT/'build').strip()
        if retail!='PASS: 7 retail missionpack UI player contracts baseq3-animations=0': raise RuntimeError(retail)
    files=[source,port,harness,ROOT/'tests/ui_players_missionpack_oracle.ml',ROOT/'tests/ui_players_missionpack_contracts.ml',ROOT/'tests/ui_players_missionpack_retail_probe.ml']
    (out/'result.json').write_text(json.dumps({'passed':True,'oracle_records':9,'contracts':13,'retail_contracts':7 if retail else 0,'functions':FUNCS,'sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n')
    print('PASS: 9 unchanged C missionpack UI players records + 13 contracts / 25 original functions')
    if retail: print(retail)
if __name__=='__main__': main()
