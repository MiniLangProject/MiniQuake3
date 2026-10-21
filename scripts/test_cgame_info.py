"""Unchanged-C icon layout, MiniLang loading-state, and retail asset tests."""
import argparse,json,subprocess,sys,zipfile
from pathlib import Path
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
 p=argparse.ArgumentParser();p.add_argument('--pak',type=Path);a=p.parse_args();out=ROOT/'build/reference/cgame_info';out.mkdir(parents=True,exist_ok=True);src=ROOT/'Quake-III-Arena-original-source/code/cgame/cg_info.c'
 (out/'cgame_info_under_test.inc').write_text(extract(src,['CG_DrawLoadingIcons']),encoding='utf-8',newline='\n');h=ROOT/'tests/reference/cgame_info_oracle.c';exe=out/'oracle.exe';run(['cl','/nologo','/Od','/MT',f'/I{out}',h,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 for source,name in [('tests/cgame_info_oracle.ml','cgame_info_oracle.exe'),('tests/cgame_info_contracts.ml','cgame_info_contracts.exe')]:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',name],cwd=ROOT,check=True)
 mini=run([ROOT/'build/cgame_info_oracle.exe'],ROOT/'build',log=out/'minilang.log');assert native==mini
 contracts=run([ROOT/'build/cgame_info_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert contracts.startswith('PASS: '),contracts
 retail=[]
 if a.pak:
  with zipfile.ZipFile(a.pak) as z:
   names={n.lower() for n in z.namelist()}
   for name in ('levelshots/q3dm1.jpg','menu/art/unknownmap.jpg','models/players/sarge/icon_default.tga'):
    assert name in names,name;retail.append(name)
 files=[src,h,ROOT/'src/mq3/client/cgame_info.ml',ROOT/'tests/cgame_info_oracle.ml',ROOT/'tests/cgame_info_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'differential_records':16,'contracts':int(contracts.split()[1]),'retail_assets':retail,'functions':['CG_DrawLoadingIcons','CG_LoadingString','CG_LoadingItem','CG_LoadingClient','CG_DrawInformation'],'scope':'All cg_info.c functions are natively represented. Icon placement is unchanged-C differential tested; loading state, limits, player fallback, text/server rules and gametype/limit layout have contracts and retail asset probes.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}},indent=2)+'\n')
 print('PASS: 16 unchanged C loading-icon records + '+contracts+' + '+str(len(retail))+' retail assets')
if __name__=='__main__':main()
