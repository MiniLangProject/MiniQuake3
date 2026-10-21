"""Unchanged-C view decisions and complete native cg_view contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    'CG_AddBufferedSound', 'CG_AddTestModel', 'CG_CalcFov',
    'CG_CalcViewValues', 'CG_CalcVrect', 'CG_DamageBlendBlob',
    'CG_DrawActiveFrame', 'CG_OffsetFirstPersonView',
    'CG_OffsetThirdPersonView', 'CG_PlayBufferedSounds',
    'CG_PowerupTimerSounds', 'CG_StepOffset', 'CG_TestGun_f',
    'CG_TestModelNextFrame_f', 'CG_TestModelNextSkin_f',
    'CG_TestModelPrevFrame_f', 'CG_TestModelPrevSkin_f', 'CG_TestModel_f',
    'CG_ZoomDown_f', 'CG_ZoomUp_f',
]

def main():
    out = ROOT / 'build/reference/cgame_view'
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / 'Quake-III-Arena-original-source/code/cgame/cg_view.c'
    compared = [
        'CG_TestModelNextFrame_f', 'CG_TestModelPrevFrame_f',
        'CG_TestModelNextSkin_f', 'CG_TestModelPrevSkin_f', 'CG_CalcVrect',
        'CG_ZoomDown_f', 'CG_ZoomUp_f', 'CG_CalcFov',
        'CG_AddBufferedSound', 'CG_PlayBufferedSounds',
    ]
    (out / 'cgame_view_under_test.inc').write_text(
        extract(source, compared), encoding='utf-8', newline='\n')
    host = ROOT / 'tests/reference/cgame_view_oracle.c'
    exe = out / 'oracle.exe'
    run(['cl', '/nologo', '/Od', '/fp:strict', '/MT', '/W4', '/WX',
         '/wd4100', '/wd4244', f'/I{out}', host, f'/Fe:{exe}', '/link', '/Brepro'],
        out, msvc_env('x86'), out / 'oracle-build.log')
    native = run([exe], out, log=out / 'oracle.log')
    for mini_source, name in [
        ('tests/cgame_view_oracle.ml', 'cgame_view_oracle.exe'),
        ('tests/cgame_view_contracts.ml', 'cgame_view_contracts.exe'),
    ]:
        subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                        mini_source, '--output', name], cwd=ROOT, check=True)
    mini = run([ROOT / 'build/cgame_view_oracle.exe'], ROOT / 'build',
               log=out / 'minilang.log')
    assert native == mini, (native, mini)
    contracts = run([ROOT / 'build/cgame_view_contracts.exe'], ROOT / 'build',
                    log=out / 'contracts.log').strip()
    assert contracts == 'PASS: 41 native cg_view contracts', contracts
    files = [source, host, ROOT / 'src/mq3/client/cgame_view.ml',
             ROOT / 'tests/cgame_view_oracle.ml',
             ROOT / 'tests/cgame_view_contracts.ml']
    result = {
        'passed': True,
        'differential_records': 7,
        'contracts': 41,
        'functions': FUNCTIONS,
        'scope': ('Complete native cg_view camera, FOV, model-test, damage, '
                  'powerup/buffered-audio and active-frame semantics with '
                  'suppressible typed Retail renderer/audio boundaries.'),
        'sources': {str(path.relative_to(ROOT)).replace('\\', '/'): sha(path)
                    for path in files},
    }
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
    print('PASS: 7 unchanged C cg_view records + 41 native contracts')

if __name__ == '__main__':
    main()
