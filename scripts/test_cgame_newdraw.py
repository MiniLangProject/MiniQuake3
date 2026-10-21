"""Unchanged-C decisions and native Missionpack cg_newdraw contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    'CG_CheckOrderPending', 'CG_ClientNumFromName', 'CG_Draw1stPlace',
    'CG_Draw2ndPlace', 'CG_DrawAreaChat', 'CG_DrawAreaPowerUp',
    'CG_DrawAreaSystemChat', 'CG_DrawAreaTeamChat', 'CG_DrawBlueFlagHead',
    'CG_DrawBlueFlagName', 'CG_DrawBlueFlagStatus', 'CG_DrawBlueName',
    'CG_DrawBlueScore', 'CG_DrawCTFPowerUp', 'CG_DrawCapFragLimit',
    'CG_DrawGameStatus', 'CG_DrawGameType', 'CG_DrawKiller', 'CG_DrawMedal',
    'CG_DrawNewTeamInfo', 'CG_DrawPlayerAmmoIcon', 'CG_DrawPlayerAmmoValue',
    'CG_DrawPlayerArmorIcon', 'CG_DrawPlayerArmorValue',
    'CG_DrawPlayerHasFlag', 'CG_DrawPlayerHead', 'CG_DrawPlayerHealth',
    'CG_DrawPlayerItem', 'CG_DrawPlayerLocation', 'CG_DrawPlayerScore',
    'CG_DrawPlayerStatus', 'CG_DrawRedFlagHead', 'CG_DrawRedFlagName',
    'CG_DrawRedFlagStatus', 'CG_DrawRedName', 'CG_DrawRedScore',
    'CG_DrawSelectedPlayerArmor', 'CG_DrawSelectedPlayerHead',
    'CG_DrawSelectedPlayerHealth', 'CG_DrawSelectedPlayerLocation',
    'CG_DrawSelectedPlayerName', 'CG_DrawSelectedPlayerPowerup',
    'CG_DrawSelectedPlayerStatus', 'CG_DrawSelectedPlayerWeapon',
    'CG_DrawTeamColor', 'CG_DrawTeamSpectators', 'CG_EventHandling',
    'CG_GameTypeString', 'CG_GetGameStatusText', 'CG_GetKillerText',
    'CG_GetSelectedPlayer', 'CG_GetTeamColor', 'CG_GetValue',
    'CG_HarvesterSkulls', 'CG_HideTeamMenu', 'CG_InitTeamChat',
    'CG_KeyEvent', 'CG_MouseEvent', 'CG_OneFlagStatus',
    'CG_OtherTeamHasFlag', 'CG_OwnerDraw', 'CG_OwnerDrawVisible',
    'CG_RunMenuScript', 'CG_SelectNextPlayer', 'CG_SelectPrevPlayer',
    'CG_SetPrintString', 'CG_SetSelectedPlayerName', 'CG_ShowResponseHead',
    'CG_ShowTeamMenu', 'CG_StatusHandle', 'CG_Text_Paint_Limit',
    'CG_YourTeamHasFlag',
]


def main():
    assert len(FUNCTIONS) == 72
    out = ROOT / 'build/reference/cgame_newdraw'
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / 'Quake-III-Arena-original-source/code/cgame/cg_newdraw.c'
    compared = [
        'CG_InitTeamChat', 'CG_SetPrintString', 'CG_GetSelectedPlayer',
        'CG_StatusHandle', 'CG_OtherTeamHasFlag', 'CG_YourTeamHasFlag',
        'CG_GetKillerText', 'CG_GetGameStatusText', 'CG_GameTypeString',
        'CG_ClientNumFromName', 'CG_GetTeamColor',
    ]
    (out / 'cgame_newdraw_under_test.inc').write_text(
        extract(original, compared), encoding='utf-8', newline='\n')
    host = ROOT / 'tests/reference/cgame_newdraw_oracle.c'
    exe = out / 'oracle.exe'
    run(['cl', '/nologo', '/Od', '/fp:strict', '/MT', '/W4', '/WX',
         '/D_CRT_SECURE_NO_WARNINGS', '/wd4100', f'/I{out}', host,
         f'/Fe:{exe}', '/link', '/Brepro'], out, msvc_env('x86'),
        out / 'oracle-build.log')
    native = run([exe], out, log=out / 'oracle.log')
    for source, name in [
        ('tests/cgame_newdraw_oracle.ml', 'cgame_newdraw_oracle.exe'),
        ('tests/cgame_newdraw_contracts.ml', 'cgame_newdraw_contracts.exe'),
    ]:
        subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                        source, '--output', name], cwd=ROOT, check=True)
    mini = run([ROOT / 'build/cgame_newdraw_oracle.exe'], ROOT / 'build',
               log=out / 'minilang.log')
    assert native == mini, (native, mini)
    contracts = run([ROOT / 'build/cgame_newdraw_contracts.exe'], ROOT / 'build',
                    log=out / 'contracts.log').strip()
    assert contracts == 'PASS: 45 native cg_newdraw contracts', contracts
    files = [original, host, ROOT / 'src/mq3/client/cgame_newdraw.ml',
             ROOT / 'tests/cgame_newdraw_oracle.ml',
             ROOT / 'tests/cgame_newdraw_contracts.ml']
    result = {
        'passed': True,
        'differential_records': len(native.splitlines()),
        'contracts': 45,
        'functions': FUNCTIONS,
        'scope': ('All 72 Missionpack cg_newdraw candidates: owner-draw value, '
                  'visibility and dispatch semantics; local and selected player '
                  'HUD; flags, powerups, team lists, medals and spectator ticker; '
                  'orders and voice commands; chat/status strings; mouse/key, '
                  'menu and script boundaries. Renderer/UI/console/cvar effects '
                  'are deterministic typed boundaries suppressible under Retail QVM.'),
        'sources': {str(path.relative_to(ROOT)).replace('\\', '/'): sha(path)
                    for path in files},
    }
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
    print(f'PASS: {len(native.splitlines())} unchanged C cg_newdraw records + '
          '45 native contracts (72 candidates)')


if __name__ == '__main__':
    main()
