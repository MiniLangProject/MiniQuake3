"""Differential and contract coverage for the productive client input command."""
import json, subprocess, sys
from inventory import sha
from toolchain import ROOT, run, msvc_env
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/input_command';out.mkdir(parents=True,exist_ok=True)
    source=ROOT/'Quake-III-Arena-original-source/code/client/cl_input.c'
    names=['CL_KeyState','CL_AdjustAngles','CL_KeyMove','CL_JoystickMove','CL_MouseMove']
    (out/'input_command_under_test.inc').write_text(extract(source,names),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/input_command_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/input_command_oracle.ml','--output','input_command_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/input_command_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('client input command mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/input_command_contracts.ml','--output','input_command_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/input_command_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 38 client input-command contracts':raise RuntimeError(value)
    preview=ROOT/'src/mq3/client/qvm_preview_app.ml';module=ROOT/'src/mq3/client/input_command.ml';event_module=ROOT/'src/mq3/client/input_command_events.ml';window=ROOT/'src/mq3/platform/playable_window.ml';native_window=ROOT/'native/playable_win32.c';contracts=ROOT/'tests/input_command_contracts.ml';mini_oracle=ROOT/'tests/input_command_oracle.ml'
    win_input=ROOT/'Quake-III-Arena-original-source/code/win32/win_input.c';win_wndproc=ROOT/'Quake-III-Arena-original-source/code/win32/win_wndproc.c';win_main=ROOT/'Quake-III-Arena-original-source/code/win32/win_main.c'
    preview_text=preview.read_text(encoding='utf-8')
    for anchor in ['inputCommand.create(', 'timestampedInput.applyBound(', 'window.inputEvents(', 'inputCommand.createCommand(']:
        if anchor not in preview_text:raise RuntimeError('productive QVM input integration missing: '+anchor)
    platform_anchors={
      win_input:[
        'Sys_QueEvent( od.dwTimeStamp, SE_KEY, K_MOUSE1, qtrue, 0, NULL );',
        'Sys_QueEvent( 0, SE_MOUSE, mx, my, 0, NULL );'],
      win_wndproc:[
        'Sys_QueEvent( g_wv.sysMsgTime, SE_KEY, MapKey( lParam ), qtrue, 0, NULL );',
        'Sys_QueEvent( g_wv.sysMsgTime, SE_KEY, MapKey( lParam ), qfalse, 0, NULL );'],
      win_main:['eventTail++;']}
    for platform_source,anchors in platform_anchors.items():
        platform_text=platform_source.read_text(encoding='latin-1')
        for anchor in anchors:
            if anchor not in platform_text:raise RuntimeError(f'original platform input anchor missing in {platform_source.name}: {anchor}')
    files=[source,win_input,win_wndproc,win_main,harness,module,event_module,window,native_window,contracts,mini_oracle,preview]
    report={'passed':True,'records':len(native.splitlines()),'contracts':38,
      'platform_anchors':sum(len(anchors) for anchors in platform_anchors.values()),
      'function':'CL_KeyState / CL_AdjustAngles / CL_KeyMove / CL_MouseMove / CL_JoystickMove and productive command construction',
      'scope':'Dual-source button timing, walking/run movement, angle keys, filtered and accelerated mouse input, cgame sensitivity, joystick axes, button bits, pitch-delta clamp and final command fields are implemented. The Win32 UI thread queues timestamped key, mouse-button and mouse-motion transitions for the retail-QVM preview.',
      'oracle':'Five records execute unchanged functions extracted from pinned Baseq3 client/cl_input.c and compare exact float bits and command fields. Five pinned Win32 anchors bind timestamped keyboard/mouse production and overwrite-oldest queue semantics to the original platform sources.',
      'remaining':'Gameplay bindings and the command ring are covered by their dedicated gates; console/message catcher line editing remains separate client work.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {report['records']} exact Baseq3 client-input records + {report['contracts']} contracts")
if __name__=='__main__':main()
