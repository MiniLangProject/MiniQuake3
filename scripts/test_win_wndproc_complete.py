#!/usr/bin/env python3
"""Complete unchanged-C, native and MiniLang gate for code/win32/win_wndproc.c."""
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SYMBOLS=['MainWndProc','MapKey','VID_AppActivate','WIN_DisableAltTab','WIN_EnableAltTab']
def build(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output
def main():
    out=ROOT/'build/reference/win_wndproc_complete';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/win32/win_wndproc.c';runtime=ROOT/'src/mq3/platform/win_wndproc_runtime.ml'
    source=runtime.read_text(encoding='utf-8');missing=[s for s in SYMBOLS if not re.search(rf'\bfunction\s+{s}\s*\(',source)]
    if missing:raise RuntimeError('missing win_wndproc symbols: '+', '.join(missing))
    original_text=original.read_text(encoding='utf-8');start=original_text.index('static byte s_scantokey[128]');end=original_text.index('/*\n====================\nMainWndProc',start)
    map_source=original_text[start:end]
    if 'static int MapKey' not in map_source:raise RuntimeError('original MapKey slice missing')
    (out/'win_wndproc_mapkey_under_test.inc').write_text(map_source,encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/win_wndproc_complete_oracle.c';exe=out/'oracle.exe'
    run(['cl','/nologo','/O2','/MT','/W4',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    native=run([exe],out,log=out/'oracle.log');mini=run([build('tests/win_wndproc_complete_oracle.ml','win_wndproc_complete_oracle.exe')],ROOT/'build',log=out/'mini.log')
    if native!=mini:raise RuntimeError('win_wndproc MapKey mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    contracts=run([build('tests/win_wndproc_complete_contracts.ml','win_wndproc_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 14 complete win_wndproc contracts':raise RuntimeError(contracts)
    subprocess.run([sys.executable,ROOT/'scripts/playable_window_build_test.py'],cwd=ROOT,check=True)
    native_source=(ROOT/'native/playable_win32.c').read_text(encoding='utf-8')
    required=['WM_CREATE','WM_DESTROY','WM_CLOSE','WM_ACTIVATE','WM_MOVE','WM_SYSCOMMAND','SC_SCREENSAVE','WM_SYSKEYDOWN','WM_MOUSEWHEEL','mapScanKey','playable_window_take_video_restart','playable_window_window_state']
    absent=[name for name in required if name not in native_source]
    if absent:raise RuntimeError('missing productive wndproc anchors: '+', '.join(absent))
    files=[original,runtime,ROOT/'native/playable_win32.c',ROOT/'src/mq3/platform/playable_window.ml',harness,ROOT/'tests/win_wndproc_complete_oracle.ml',ROOT/'tests/win_wndproc_complete_contracts.ml',ROOT/'tests/playable_window_wndproc_native.c']
    result={'passed':True,'symbols':5,'unchanged_c_records':len(native.splitlines()),'contracts':14,'productive_anchors':len(required),'scope':'Complete window-procedure lifecycle, activation/minimize, scan-code key translation, mouse/wheel aggregation, move persistence, screen-saver suppression, Alt-Enter video restart and close handling.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: 5/5 win_wndproc symbols + {result['unchanged_c_records']} unchanged-C records + 14 contracts + productive Win32 build")
if __name__=='__main__':main()
