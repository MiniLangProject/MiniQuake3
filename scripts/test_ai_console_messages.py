#!/usr/bin/env python3
"""Run Baseq3 console-message oracle and MiniLang ABI contracts."""
import subprocess,sys
from pathlib import Path
from toolchain import ROOT,msvc_env,run
def build(source,output):subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True);return ROOT/'build'/output
def main():
 out=ROOT/'build/reference/ai_console_messages';out.mkdir(parents=True,exist_ok=True);native=out/'ai_console_message_oracle.exe'
 run(['cl','/nologo','/O2','/MT','/W4',ROOT/'tests/reference/ai_console_message_oracle.c',f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'build.log')
 first=run([native],out).strip();second=run([build('tests/ai_console_message_contracts.ml','ai_console_message_contracts.exe')],ROOT/'build').strip()
 if first!='PASS: 4 native Baseq3 console-message scenarios / 10 exact observations' or second!='PASS: 16 AI console message contracts':raise RuntimeError(first+' / '+second)
 print(first);print(second);return 0
if __name__=='__main__':raise SystemExit(main())
