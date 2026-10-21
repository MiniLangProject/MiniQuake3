"""Differential ABI and screen-lifecycle contracts for the original ui.qvm host."""
import subprocess
import sys
from pathlib import Path

from toolchain import ROOT, msvc_env, run

def main():
    out=ROOT/'build/reference/ui_host_lifecycle';out.mkdir(parents=True,exist_ok=True)
    oracle=out/'oracle.exe';source=ROOT/'tests/reference/ui_host_lifecycle_oracle.c'
    original=ROOT/'Quake-III-Arena-original-source/code'
    run(['cl','/nologo','/Od','/MT','/DWIN32',f'/I{original / "game"}',f'/I{original / "ui"}',source,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log').strip()
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ui_host_lifecycle_oracle.ml','--output','ui_host_lifecycle_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/ui_host_lifecycle_oracle.exe'],ROOT/'build',log=out/'minilang-oracle.log').strip()
    if native!=mini: raise RuntimeError('uiClientState_t ABI mismatch\nC: '+native+'\nMiniLang: '+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ui_host_lifecycle_contracts.ml','--output','ui_host_lifecycle_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/ui_host_lifecycle_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 20 UI host lifecycle contracts': raise RuntimeError(contracts)
    cl_ui=(ROOT/'Quake-III-Arena-original-source/code/client/cl_ui.c').read_text(encoding='utf-8',errors='ignore')
    cl_scrn=(ROOT/'Quake-III-Arena-original-source/code/client/cl_scrn.c').read_text(encoding='utf-8',errors='ignore')
    for anchor in ('state->connectPacketCount = clc.connectPacketCount','state->connState = cls.state','state->clientNum = cl.snap.ps.clientNum'):
        if anchor not in cl_ui: raise RuntimeError('missing cl_ui.c anchor: '+anchor)
    for anchor in ('case CA_DISCONNECTED:','case CA_CONNECTING:','case CA_LOADING:','UI_DRAW_CONNECT_SCREEN, qtrue','cls.keyCatchers & KEYCATCH_UI'):
        if anchor not in cl_scrn: raise RuntimeError('missing cl_scrn.c anchor: '+anchor)
    print('PASS: exact Baseq3 uiClientState_t ABI + 20 UI host lifecycle contracts')

if __name__=='__main__': main()
