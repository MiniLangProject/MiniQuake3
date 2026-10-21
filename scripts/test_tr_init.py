"""Unchanged-C screenshot decisions and native tr_init contracts."""
import subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
FUNCTIONS=['AssertCvarRange','GL_CheckErrors','GL_SetDefaultState','GetRefAPI','GfxInfo_f','InitOpenGL','RB_TakeScreenshotCmd','RB_TakeScreenshotJPEG','RE_EndRegistration','RE_Shutdown','R_GetModeInfo','R_Init','R_LevelShot','R_ModeList_f','R_Register','R_ScreenShotJPEG_f','R_ScreenShot_f','R_ScreenshotFilename','R_ScreenshotFilenameJPEG','R_TakeScreenshot','tga']
def main():
 out=ROOT/'build/reference/tr_init';out.mkdir(parents=True,exist_ok=True);source=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_init.c';(out/'tr_init_under_test.inc').write_text(extract(source,['R_ScreenshotFilename','R_ScreenshotFilenameJPEG']),encoding='utf-8',newline='\n');host=ROOT/'tests/reference/tr_init_oracle.c';exe=out/'oracle.exe';run(['cl','/nologo','/Od','/MT','/W4','/WX',f'/I{out}',host,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 for src,name in [('tests/tr_init_oracle.ml','tr_init_oracle.exe'),('tests/tr_init_contracts.ml','tr_init_contracts.exe')]:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',src,'--output',name],cwd=ROOT,check=True)
 mini=run([ROOT/'build/tr_init_oracle.exe'],ROOT/'build',log=out/'minilang.log');assert native==mini,(native,mini);contracts=run([ROOT/'build/tr_init_contracts.exe'],ROOT/'build',log=out/'contracts.log');assert contracts.startswith('PASS:'),contracts;module=ROOT/'src/mq3/renderer/tr_init.ml';text=module.read_text();missing=[x for x in FUNCTIONS if f'// {x}' not in text];assert not missing,missing;print('PASS: unchanged tr_init C decisions match MiniLang');print(contracts);print(f'PASS: {len(FUNCTIONS)} tr_init contracts covered');print(f'original_sha256={sha(source)}');print(f'minilang_sha256={sha(module)}')
if __name__=='__main__':main()
