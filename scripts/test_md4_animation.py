#!/usr/bin/env python3
"""Unchanged RB_SurfaceAnim differential and native MD4 contracts."""
import json,re,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
 out=ROOT/'build/reference/md4_animation';out.mkdir(parents=True,exist_ok=True);src=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_animation.c';inc=out/'md4_animation_under_test.inc';inc.write_text(extract(src,['RB_SurfaceAnim']),encoding='utf-8',newline='\n');host=ROOT/'tests/reference/md4_animation_oracle.c';native=out/'oracle.exe';run(['cl','/nologo','/O2','/MT','/W4','/WX','/wd4311',f'/I{out}',host,f'/Fe:{native}','/link','/Brepro'],out,msvc_env('x64'),out/'build.log');expected=run([native],out,log=out/'native.log')
 for source,name in [('tests/md4_animation_oracle.ml','md4_animation_oracle.exe'),('tests/md4_animation_contracts.ml','md4_animation_contracts.exe')]:subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',name],cwd=ROOT,check=True)
 actual=run([ROOT/'build/md4_animation_oracle.exe'],ROOT/'build',log=out/'minilang.log');canonical=lambda text:re.sub(r'(\d)\.(?=[,|\n])',r'\1',text);assert canonical(expected)==canonical(actual),(expected,actual);contracts=run([ROOT/'build/md4_animation_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert contracts=='PASS: 7 MD4 animation contracts',contracts
 files=[src,host,ROOT/'src/mq3/renderer/md4_animation.ml',ROOT/'tests/md4_animation_oracle.ml',ROOT/'tests/md4_animation_contracts.ml'];result={'passed':True,'differential_records':1,'contracts':7,'functions':['R_AddAnimSurfaces','RB_SurfaceAnim'],'scope':'Complete MD4 surface submission plus 3x4 bone interpolation and weighted position/normal skinning.','sources':{str(x.relative_to(ROOT)).replace('\\','/'):sha(x) for x in files}};(out/'result.json').write_text(json.dumps(result,indent=2)+'\n');print('PASS: unchanged C RB_SurfaceAnim record + 7 MD4 contracts')
if __name__=='__main__':main()
