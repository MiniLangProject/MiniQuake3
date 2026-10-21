"""Unchanged-C draw decisions and complete native cg_drawtools contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    'CG_AdjustFrom640', 'CG_FillRect', 'CG_DrawSides', 'CG_DrawTopBottom',
    'CG_DrawRect', 'CG_DrawPic', 'CG_DrawChar', 'CG_DrawStringExt',
    'CG_DrawBigString', 'CG_DrawBigStringColor', 'CG_DrawSmallString',
    'CG_DrawSmallStringColor', 'CG_DrawStrlen', 'CG_TileClearBox',
    'CG_TileClear', 'CG_FadeColor', 'CG_TeamColor',
    'CG_GetColorForHealth', 'CG_ColorForHealth', 'UI_DrawBannerString2',
    'UI_DrawBannerString', 'UI_ProportionalStringWidth',
    'UI_DrawProportionalString2', 'UI_ProportionalSizeScale',
    'UI_DrawProportionalString',
]

def main():
    out = ROOT / 'build/reference/cgame_drawtools'
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / 'Quake-III-Arena-original-source/code/cgame/cg_drawtools.c'
    compared = ['CG_AdjustFrom640', 'CG_DrawStrlen', 'CG_FadeColor',
                'CG_TeamColor', 'CG_GetColorForHealth',
                'UI_ProportionalSizeScale']
    (out / 'cgame_drawtools_under_test.inc').write_text(
        extract(original, compared), encoding='utf-8', newline='\n')
    host = ROOT / 'tests/reference/cgame_drawtools_oracle.c'
    exe = out / 'oracle.exe'
    run(['cl', '/nologo', '/Od', '/fp:strict', '/MT', '/W4', '/WX', '/wd4244',
         f'/I{out}', host, f'/Fe:{exe}', '/link', '/Brepro'], out,
        msvc_env('x86'), out / 'oracle-build.log')
    native = run([exe], out, log=out / 'oracle.log')
    for source, name in [
        ('tests/cgame_drawtools_oracle.ml', 'cgame_drawtools_oracle.exe'),
        ('tests/cgame_drawtools_contracts.ml', 'cgame_drawtools_contracts.exe'),
    ]:
        subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                        source, '--output', name], cwd=ROOT, check=True)
    mini = run([ROOT / 'build/cgame_drawtools_oracle.exe'], ROOT / 'build',
               log=out / 'minilang.log')
    assert native == mini, (native, mini)
    contracts = run([ROOT / 'build/cgame_drawtools_contracts.exe'],
                    ROOT / 'build', log=out / 'contracts.log').strip()
    assert contracts == 'PASS: 35 native cg_drawtools contracts', contracts
    files = [original, host, ROOT / 'src/mq3/client/cgame_drawtools.ml',
             ROOT / 'tests/cgame_drawtools_oracle.ml',
             ROOT / 'tests/cgame_drawtools_contracts.ml']
    result = {
        'passed': True,
        'differential_records': 15,
        'contracts': 35,
        'functions': FUNCTIONS,
        'scope': ('Complete cg_drawtools port: exact 640x480 scaling, color-code '
                  'and fixed/proportional font layout, pictures, borders, tiled '
                  'clears, fades, team/health colors and suppressible typed '
                  'renderer-boundary actions for retail QVM coexistence.'),
        'sources': {str(path.relative_to(ROOT)).replace('\\', '/'): sha(path)
                    for path in files},
    }
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
    print('PASS: 15 unchanged C cg_drawtools records + 35 native contracts')

if __name__ == '__main__':
    main()
