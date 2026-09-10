"""Direct state/host-effect comparison for unchanged Baseq3 CL_ParseDownload."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
 out=ROOT/'build/reference/download';out.mkdir(parents=True,exist_ok=True);src=ROOT/'Quake-III-Arena-original-source/code/client/cl_parse.c'
 (out/'download_under_test.inc').write_text(extract(src,['CL_ParseDownload']),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/download_oracle.c';exe=out/'oracle.exe'
 run(['cl','/nologo','/Od','/MT','/D_CRT_SECURE_NO_WARNINGS',harness,f'/I{out}',f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/download_oracle.ml','--output','download_oracle.exe'],cwd=ROOT,check=True)
 mini=run([ROOT/'build/download_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:raise RuntimeError('download mismatch\nnative:\n'+native+'mini:\n'+mini)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/download_contracts.ml','--output','download_contracts.exe'],cwd=ROOT,check=True)
 contracts=run([ROOT/'build/download_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 20 download contracts':raise RuntimeError(contracts)
 sources=[src,harness,ROOT/'src/mq3/client/download.ml',ROOT/'tests/download_oracle.ml',ROOT/'tests/download_contracts.ml']
 (out/'result.json').write_text(json.dumps({'passed':True,'records':4,'contracts':20,'scope':'CL_ParseDownload block zero file size, data blocks, unexpected blocks, file open/write, nextdl acknowledgement, EOF close/rename, double packet flush and next-download transition.','oracle':'Unchanged CL_ParseDownload body with deterministic filesystem, command and cvar host stubs.','remaining':'Live filesystem/download-list integration remains open.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}},indent=2)+'\n')
 print('PASS: 4 exact Baseq3 download records + 20 contracts')
if __name__=='__main__':main()
