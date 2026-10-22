"""Unchanged-C helper oracles and native contracts for q3_ui/ui_atoms.c."""
import subprocess
import sys
import zipfile
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

FUNCTIONS=['Com_Error','Com_Printf','NeedCDAction','NeedCDKeyAction','UI_AdjustFrom640','UI_Argv','UI_Cache_f','UI_ClampCvar','UI_ConsoleCommand','UI_CursorInRect','UI_Cvar_VariableString','UI_DrawBannerString','UI_DrawBannerString2','UI_DrawChar','UI_DrawHandlePic','UI_DrawNamedPic','UI_DrawProportionalString','UI_DrawProportionalString2','UI_DrawProportionalString_AutoWrapped','UI_DrawRect','UI_DrawString','UI_DrawString2','UI_DrawTextBox','UI_FillRect','UI_ForceMenuOff','UI_Init','UI_IsFullscreen','UI_KeyEvent','UI_LerpColor','UI_MouseEvent','UI_PopMenu','UI_ProportionalSizeScale','UI_ProportionalStringWidth','UI_PushMenu','UI_Refresh','UI_SetActiveMenu','UI_SetColor','UI_Shutdown','UI_StartDemoLoop','UI_UpdateScreen']
ORACLE=['UI_ClampCvar','UI_LerpColor','UI_ProportionalStringWidth','UI_ProportionalSizeScale','UI_AdjustFrom640','UI_CursorInRect']
ASSETS=['gfx/2d/bigchars.tga','menu/art/font1_prop.tga','menu/art/font1_prop_glo.tga','menu/art/font2_prop.tga','menu/art/3_cursor2.tga']
def build(source,output):subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',output],cwd=ROOT,check=True)
def main():
 out=ROOT/'build/reference/ui_atoms';out.mkdir(parents=True,exist_ok=True);source=ROOT/'Quake-III-Arena-original-source/code/q3_ui/ui_atoms.c';(out/'ui_atoms_under_test.inc').write_text(extract(source,ORACLE),encoding='utf-8',newline='\n');host=ROOT/'tests/reference/ui_atoms_oracle.c';exe=out/'oracle.exe';run(['cl','/nologo','/Od','/MT','/W4','/WX','/wd4100',f'/I{out}',host,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log');build('tests/ui_atoms_oracle.ml','ui_atoms_oracle.exe');build('tests/ui_atoms_contracts.ml','ui_atoms_contracts.exe');mini=run([ROOT/'build/ui_atoms_oracle.exe'],ROOT/'build',log=out/'minilang.log');assert native==mini,(native,mini);contracts=run([ROOT/'build/ui_atoms_contracts.exe'],ROOT/'build',log=out/'contracts.log');assert contracts.startswith('PASS:'),contracts;module=ROOT/'src/mq3/client/ui_atoms.ml';text=module.read_text(encoding='utf-8');missing=[name for name in FUNCTIONS if f'// {name}' not in text];assert not missing,missing
 data_root=Path(sys.argv[1]) if len(sys.argv)>1 else Path('D:/Quake3');pak=data_root/'baseq3/pak0.pk3';assert pak.is_file(),pak
 with zipfile.ZipFile(pak) as archive:names={name.lower() for name in archive.namelist()};gfx=archive.read('scripts/gfx.shader').decode('latin1').lower()
 assert all(name in names for name in ASSETS),[name for name in ASSETS if name not in names];assert 'menuback' in gfx and 'menubacknologo' in gfx
 print('PASS: unchanged ui_atoms C helpers match MiniLang');print(contracts.strip());print(f'PASS: {len(FUNCTIONS)} ui_atoms symbols covered');print(f'PASS: {len(ASSETS)} retail UI atoms assets and background shaders verified');print(f'original_sha256={sha(source)}');print(f'minilang_sha256={sha(module)}')
if __name__=='__main__':main()
