"""Unchanged-C draw-field differential and complete native cg_draw contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    'CG_AddLagometerFrameInfo', 'CG_AddLagometerSnapshotInfo', 'CG_CenterPrint',
    'CG_Draw2D', 'CG_Draw3DModel', 'CG_DrawActive', 'CG_DrawAmmoWarning',
    'CG_DrawAttacker', 'CG_DrawCenterString', 'CG_DrawCrosshair',
    'CG_DrawCrosshairNames', 'CG_DrawDisconnect', 'CG_DrawFPS', 'CG_DrawField',
    'CG_DrawFlagModel', 'CG_DrawFollow', 'CG_DrawHead', 'CG_DrawHoldableItem',
    'CG_DrawIntermission', 'CG_DrawLagometer', 'CG_DrawLowerLeft',
    'CG_DrawLowerRight', 'CG_DrawPersistantPowerup', 'CG_DrawPickupItem',
    'CG_DrawPowerups', 'CG_DrawProxWarning', 'CG_DrawReward', 'CG_DrawScoreboard',
    'CG_DrawScores', 'CG_DrawSnapshot', 'CG_DrawSpectator', 'CG_DrawStatusBar',
    'CG_DrawStatusBarFlag', 'CG_DrawStatusBarHead', 'CG_DrawTeamBackground',
    'CG_DrawTeamInfo', 'CG_DrawTeamOverlay', 'CG_DrawTeamVote', 'CG_DrawTimedMenus',
    'CG_DrawTimer', 'CG_DrawTourneyScoreboard', 'CG_DrawUpperRight', 'CG_DrawVote',
    'CG_DrawWarmup', 'CG_ScanForCrosshairEntity', 'CG_Text_Height',
    'CG_Text_Paint', 'CG_Text_PaintChar', 'CG_Text_Width',
]

def main():
    out = ROOT / 'build/reference/cgame_draw'
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / 'Quake-III-Arena-original-source/code/cgame/cg_draw.c'
    (out / 'cgame_draw_under_test.inc').write_text(
        extract(original, ['CG_DrawField']), encoding='utf-8', newline='\n')
    host = ROOT / 'tests/reference/cgame_draw_oracle.c'
    exe = out / 'oracle.exe'
    run(['cl', '/nologo', '/Od', '/fp:strict', '/MT', '/W4', '/WX',
         f'/I{out}', host, f'/Fe:{exe}', '/link', '/Brepro'], out,
        msvc_env('x86'), out / 'oracle-build.log')
    native = run([exe], out, log=out / 'oracle.log')
    for source, name in [
        ('tests/cgame_draw_oracle.ml', 'cgame_draw_oracle.exe'),
        ('tests/cgame_draw_contracts.ml', 'cgame_draw_contracts.exe'),
    ]:
        subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                        source, '--output', name], cwd=ROOT, check=True)
    mini = run([ROOT / 'build/cgame_draw_oracle.exe'], ROOT / 'build',
               log=out / 'minilang.log')
    assert native == mini, (native, mini)
    contracts = run([ROOT / 'build/cgame_draw_contracts.exe'], ROOT / 'build',
                    log=out / 'contracts.log').strip()
    count = int(contracts.split()[1])
    assert count >= 49, contracts
    files = [original, host, ROOT / 'src/mq3/client/cgame_draw.ml',
             ROOT / 'tests/cgame_draw_oracle.ml',
             ROOT / 'tests/cgame_draw_contracts.ml']
    result = {
        'passed': True,
        'differential_records': len(native.splitlines()),
        'contracts': count,
        'functions': FUNCTIONS,
        'scope': ('All 49 cg_draw.c candidates are natively represented: HUD and '
                  'status, score/powerup stacks, lagometer/disconnect, crosshair '
                  'trace/name fade, votes, warmup, center print, spectator/follow, '
                  '2D ordering and active stereo scene dispatch. Renderer, sound, '
                  'trace and menu effects use suppressible typed boundaries.'),
        'sources': {str(path.relative_to(ROOT)).replace('\\', '/'): sha(path)
                    for path in files},
    }
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
    print(f'PASS: {len(native.splitlines())} unchanged C cg_draw records + '
          f'{count} native contracts')

if __name__ == '__main__':
    main()
