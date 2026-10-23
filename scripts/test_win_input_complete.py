#!/usr/bin/env python3
"""Complete unchanged-C and productive gate for code/win32/win_input.c."""
import json,re,subprocess,sys
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

SYMBOLS=['IN_Activate','IN_ActivateDIMouse','IN_ActivateMouse','IN_ActivateWin32Mouse','IN_ClearStates','IN_DIMouse','IN_DeactivateDIMouse','IN_DeactivateMouse','IN_DeactivateWin32Mouse','IN_Frame','IN_Init','IN_InitDIMouse','IN_InitWin32Mouse','IN_JoyMove','IN_MouseEvent','IN_MouseMove','IN_Shutdown','IN_ShutdownDIMouse','IN_ShutdownMIDI','IN_ShutdownWin32Mouse','IN_Startup','IN_StartupJoystick','IN_StartupMIDI','IN_StartupMouse','IN_Win32Mouse','JoyToF','JoyToI','MIDI_NoteOff','MIDI_NoteOn','MidiInProc','MidiInfo_f']
EXACT=['IN_MouseEvent','IN_ClearStates','JoyToF','JoyToI','MIDI_NoteOff','MIDI_NoteOn']

def build(source,output):
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
    return ROOT/'build'/output

def main():
    out=ROOT/'build/reference/win_input_complete';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/win32/win_input.c'
    runtime=ROOT/'src/mq3/platform/win_input_runtime.ml'
    source=runtime.read_text(encoding='utf-8')
    missing=[name for name in SYMBOLS if not re.search(rf'\bfunction\s+{re.escape(name)}\s*\(',source)]
    if missing: raise RuntimeError('missing win_input runtime symbols: '+', '.join(missing))
    (out/'win_input_complete_under_test.inc').write_text(extract(original,EXACT),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/win_input_complete_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/O2','/MT','/W4',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    mini=run([build('tests/win_input_complete_oracle.ml','win_input_complete_oracle.exe')],ROOT/'build',log=out/'minilang.log')
    if native!=mini:
        a=native.splitlines();b=mini.splitlines()
        for index,(left,right) in enumerate(zip(a,b),1):
            if left!=right: raise RuntimeError(f'win_input mismatch record {index}\nC: {left}\nM: {right}')
        raise RuntimeError(f'win_input record count mismatch C={len(a)} MiniLang={len(b)}')
    contracts=run([build('tests/win_input_complete_contracts.ml','win_input_complete_contracts.exe')],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 21 complete win_input contracts': raise RuntimeError(contracts)
    subprocess.run([sys.executable,ROOT/'scripts/playable_window_build_test.py'],cwd=ROOT,check=True)
    native_source=(ROOT/'native/playable_win32.c').read_text(encoding='utf-8')
    required=['WM_INPUT','WM_ACTIVATEAPP','WM_MOUSEWHEEL','WM_XBUTTONDOWN','RegisterRawInputDevices','ClipCursor','SetCapture','translateVirtualKey','queueKeyboardEvent','joyGetPosEx','joyGetDevCapsW','midiInOpen','midiInStart','midiInStop','playable_window_input_frame']
    absent=[item for item in required if item not in native_source]
    if absent: raise RuntimeError('missing productive Win32 input anchors: '+', '.join(absent))
    files=[original,runtime,ROOT/'native/playable_win32.c',ROOT/'src/mq3/platform/playable_window.ml',ROOT/'src/mq3/client/input_command_events.ml',harness,ROOT/'tests/win_input_complete_oracle.ml',ROOT/'tests/win_input_complete_contracts.ml',ROOT/'tests/playable_window_input_events_native.c']
    result={'passed':True,'symbols':len(SYMBOLS),'exact_functions':EXACT,'unchanged_c_records':len(native.splitlines()),'contracts':21,'productive_anchors':len(required),'scope':'All win_input.c lifecycle entry points through a C-named MiniLang runtime plus the playable Win32 backend: focus activation, clipped capture, Raw Input buffered mouse, Win32 fallback semantics, five buttons, wheel impulses, joystick buttons/axes/POV/trackball, MIDI discovery/channel/note mapping and shutdown.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: 31/31 win_input symbols + {result['unchanged_c_records']} unchanged-C records + 21 contracts + productive Win32 build")
if __name__=='__main__': main()
