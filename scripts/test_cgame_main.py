"""Unchanged-C decisions and native contracts for code/cgame/cg_main.c."""
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


FUNCTIONS = [
    'CG_Argv', 'CG_AssetCache', 'CG_Asset_Parse', 'CG_BuildSpectatorString',
    'CG_ConfigString', 'CG_CrosshairPlayer', 'CG_Cvar_Get',
    'CG_DrawCinematic', 'CG_Error', 'CG_EventHandling', 'CG_FeederCount',
    'CG_FeederItemImage', 'CG_FeederItemText', 'CG_FeederSelection',
    'CG_ForceModelChange', 'CG_GetMenuBuffer', 'CG_InfoFromScoreIndex',
    'CG_Init', 'CG_KeyEvent', 'CG_LastAttacker', 'CG_LoadHudMenu',
    'CG_LoadMenus', 'CG_Load_Menu', 'CG_MouseEvent',
    'CG_OwnerDrawHandleKey', 'CG_OwnerDrawWidth', 'CG_ParseMenu',
    'CG_PlayCinematic', 'CG_Printf', 'CG_RegisterClients', 'CG_RegisterCvars',
    'CG_RegisterGraphics', 'CG_RegisterItemSounds', 'CG_RegisterSounds',
    'CG_RunCinematicFrame', 'CG_SetScoreSelection', 'CG_Shutdown',
    'CG_StartMusic', 'CG_StopCinematic', 'CG_Text_PaintWithCursor',
    'CG_UpdateCvars', 'Com_Error', 'Com_Printf', 'vmMain',
]


def main():
    out = ROOT / 'build/reference/cgame_main'
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / 'Quake-III-Arena-original-source/code/cgame/cg_main.c'
    compared = ['CG_CrosshairPlayer', 'CG_LastAttacker',
                'CG_BuildSpectatorString', 'CG_FeederCount']
    (out / 'cgame_main_under_test.inc').write_text(
        extract(source, compared), encoding='utf-8', newline='\n')
    host = ROOT / 'tests/reference/cgame_main_oracle.c'
    exe = out / 'oracle.exe'
    run(['cl', '/nologo', '/Od', '/MT', '/W4', '/WX', '/D_CRT_SECURE_NO_WARNINGS',
         f'/I{out}', host, f'/Fe:{exe}', '/link', '/Brepro'], out,
        msvc_env('x86'), out / 'oracle-build.log')
    native = run([exe], out, log=out / 'oracle.log')
    for mini_source, name in [
        ('tests/cgame_main_oracle.ml', 'cgame_main_oracle.exe'),
        ('tests/cgame_main_contracts.ml', 'cgame_main_contracts.exe'),
    ]:
        subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                        mini_source, '--output', name], cwd=ROOT, check=True)
    mini = run([ROOT / 'build/cgame_main_oracle.exe'], ROOT / 'build',
               log=out / 'minilang.log')
    assert native == mini, (native, mini)
    contracts = run([ROOT / 'build/cgame_main_contracts.exe'], ROOT / 'build',
                    log=out / 'contracts.log')
    assert contracts.startswith('PASS:'), contracts
    module = ROOT / 'src/mq3/client/cgame_main.ml'
    text = module.read_text(encoding='utf-8')
    missing = [name for name in FUNCTIONS if f'// {name}' not in text]
    assert not missing, f'missing original contracts: {missing}'
    print('PASS: unchanged cg_main C decisions match MiniLang')
    print(contracts)
    print(f'PASS: {len(FUNCTIONS)} cg_main contracts covered')
    print(f'original_sha256={sha(source)}')
    print(f'minilang_sha256={sha(module)}')


if __name__ == '__main__':
    main()
