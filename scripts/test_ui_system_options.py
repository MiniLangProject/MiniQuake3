#!/usr/bin/env python3
"""Source-shape and native contracts for ui_display.c and ui_sound.c."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run

def main():
    display=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_display.c'
    sound=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_sound.c'
    dtext=display.read_text(encoding='utf-8',errors='replace')
    stext=sound.read_text(encoding='utf-8',errors='replace')
    for name in ['UI_DisplayOptionsMenu_Event','UI_DisplayOptionsMenu_Init','UI_DisplayOptionsMenu_Cache','UI_DisplayOptionsMenu']:
        assert name in dtext,name
    for name in ['UI_SoundOptionsMenu_Event','UI_SoundOptionsMenu_Init','UI_SoundOptionsMenu_Cache','UI_SoundOptionsMenu']:
        assert name in stext,name
    assert 'displayOptionsInfo.brightness.curvalue / 10.0f' in dtext
    assert 'displayOptionsInfo.screensize.curvalue * 10' in dtext
    assert 'trap_Cmd_ExecuteText( EXEC_APPEND, "snd_restart\\n" )' in stext
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/ui_system_options_contracts.ml','--output','ui_system_options_contracts.exe'],cwd=ROOT,check=True)
    out=ROOT/'build/reference/ui_system_options';out.mkdir(parents=True,exist_ok=True)
    result_text=run([ROOT/'build/ui_system_options_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    assert result_text=='PASS: 13 UI display/sound contracts',result_text
    files=[display,sound,ROOT/'src/mq3/client/ui_display_options.ml',ROOT/'src/mq3/client/ui_sound_options.ml',ROOT/'tests/ui_system_options_contracts.ml']
    result={'passed':True,'source_functions':8,'contracts':13,'scope':'Complete display and sound options menu construction, cvar initialization, navigation, slider updates, quality restart and shader caches.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n')
    print('PASS: 8 original UI display/sound functions + 13 contracts')
if __name__=='__main__':main()
