"""Differential Baseq3 renderer command queue and MiniLang back-end contracts."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/renderer_commands';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_cmds.c'
    functions=['R_GetCommandBuffer','RE_SetColor','RE_StretchPic']
    (out/'renderer_command_under_test.inc').write_text(extract(original,functions),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/renderer_command_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/renderer_command_oracle.ml','--output','renderer_command_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/renderer_command_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini: raise RuntimeError('Renderer command mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/renderer_command_contracts.ml','--output','renderer_command_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/renderer_command_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 29 renderer-command contracts': raise RuntimeError(contracts)
    files=[original,ROOT/'Quake-III-Arena-original-source/code/renderer/tr_backend.c',harness,ROOT/'src/mq3/renderer/command_queue.ml',ROOT/'tests/renderer_command_oracle.ml',ROOT/'tests/renderer_command_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':29,'functions':functions,'scope':'Baseq3 command-buffer capacity and exact set-color/stretch-pic records plus injected 2D backend execution, batching, draw-buffer and swap ordering.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 renderer-command records + 29 contracts")
if __name__=='__main__': main()
