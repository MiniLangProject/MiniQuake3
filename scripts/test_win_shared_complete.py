#!/usr/bin/env python3
"""Complete unchanged-C and MiniLang gate for code/win32/win_shared.c."""
import json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SYMBOLS=['CPUID','Is3DNOW','IsKNI','IsMMX','IsPentium','Sys_DefaultHomePath','Sys_DefaultInstallPath','Sys_GetCurrentUser','Sys_GetProcessorId','Sys_Milliseconds','Sys_SnapVector','fastftol']
EXACT=['Sys_Milliseconds','Sys_GetCurrentUser','Sys_DefaultHomePath','Sys_DefaultInstallPath','Sys_GetProcessorId']
def build(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output
def main():
    out=ROOT/'build/reference/win_shared_complete';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/win32/win_shared.c';runtime=ROOT/'src/mq3/platform/win_shared_runtime.ml'
    source=runtime.read_text(encoding='utf-8');missing=[s for s in SYMBOLS if not re.search(rf'\bfunction\s+{s}\s*\(',source)]
    if missing:raise RuntimeError('missing win_shared symbols: '+', '.join(missing))
    (out/'win_shared_complete_under_test.inc').write_text(extract(original,EXACT),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/win_shared_complete_oracle.c';exe=out/'oracle.exe'
    run(['cl','/nologo','/O2','/MT','/W4','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    native=run([exe],out,log=out/'oracle.log');mini=run([build('tests/win_shared_complete_oracle.ml','win_shared_complete_oracle.exe')],ROOT/'build',log=out/'mini.log')
    if native!=mini:raise RuntimeError('win_shared unchanged-C mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    contracts=run([build('tests/win_shared_complete_contracts.ml','win_shared_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 14 complete win_shared contracts':raise RuntimeError(contracts)
    subprocess.run([sys.executable,ROOT/'scripts/playable_window_build_test.py'],cwd=ROOT,check=True)
    native_source=(ROOT/'native/playable_win32.c').read_text(encoding='utf-8')
    required=['playable_window_milliseconds','playable_system_current_user','playable_system_current_directory','playable_system_processor_id']
    absent=[name for name in required if name not in native_source]
    if absent:raise RuntimeError('missing productive win_shared anchors: '+', '.join(absent))
    files=[original,runtime,ROOT/'native/playable_win32.c',ROOT/'src/mq3/platform/playable_window.ml',harness,ROOT/'tests/win_shared_complete_oracle.ml',ROOT/'tests/win_shared_complete_contracts.ml',ROOT/'tests/playable_window_win_shared_native.c']
    result={'passed':True,'symbols':12,'exact_functions':EXACT,'unchanged_c_records':len(native.splitlines()),'contracts':14,'scope':'Complete win_shared timing, x87 rounding, CPUID classification, current-user fallback and default path semantics.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: 12/12 win_shared symbols + {result['unchanged_c_records']} unchanged-C records + 14 contracts + productive Win32 build")
if __name__=='__main__':main()
