#!/usr/bin/env python3
import argparse,subprocess,sys
from pathlib import Path
from toolchain import ROOT,msvc_env,run
def build(source,output):subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def main():
 p=argparse.ArgumentParser();p.add_argument('--pak',type=Path);a=p.parse_args();out=ROOT/'build/reference/ai_weapon_weights';out.mkdir(parents=True,exist_ok=True);native=out/'ai_weapon_weight_oracle.exe';run(['cl','/nologo','/O2','/MT','/W4',ROOT/'tests/reference/ai_weapon_weight_oracle.c',f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'build.log');value=run([native],out).strip();assert value=='PASS: 5 native weapon-index observations';contract=run([build('tests/ai_weapon_weight_contracts.ml','ai_weapon_weight_contracts.exe')],ROOT/'build').strip();assert contract=='PASS: 11 AI weapon-weight contracts';print(value);print(contract)
 if a.pak:
  retail=run([build('tests/ai_weapon_weight_retail_probe.ml','ai_weapon_weight_retail_probe.exe'),a.pak],ROOT/'build').strip();assert retail.startswith('PASS: retail Sarge weapon weights checks=10 valid=9 projectiles=9 mapped=9');print(retail)
if __name__=='__main__':main()
