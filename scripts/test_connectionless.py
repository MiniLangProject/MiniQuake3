"""Direct unchanged-C dispatcher comparison for SV_ConnectionlessPacket."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
 out=ROOT/'build/reference/connectionless';out.mkdir(parents=True,exist_ok=True);src=ROOT/'Quake-III-Arena-original-source/code/server/sv_main.c';(out/'connectionless_under_test.inc').write_text(extract(src,['SV_ConnectionlessPacket']),encoding='utf8',newline='\n');h=ROOT/'tests/reference/connectionless_oracle.c';exe=out/'oracle.exe';run(['cl','/nologo','/Od','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',h,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/connectionless_oracle.ml','--output','connectionless_oracle.exe'],cwd=ROOT,check=True);mini=run([ROOT/'build/connectionless_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:raise RuntimeError('connectionless mismatch\nC:\n'+native+'M:\n'+mini)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/connectionless_contracts.ml','--output','connectionless_contracts.exe'],cwd=ROOT,check=True);contracts=run([ROOT/'build/connectionless_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip();assert contracts=='PASS: 18 connectionless contracts'
 files=[src,h,ROOT/'src/mq3/server/connectionless.ml',ROOT/'tests/connectionless_oracle.ml',ROOT/'tests/connectionless_contracts.ml'];(out/'result.json').write_text(json.dumps({'passed':True,'records':8,'contracts':18,'scope':'SV_ConnectionlessPacket OOB marker/read-line/token dispatch, connect decompression boundary, getstatus/getinfo/getchallenge/connect/ipAuthorize/rcon/disconnect/unknown routing.','oracle':'Unchanged SV_ConnectionlessPacket with deterministic message, command and handler host stubs; getchallenge/direct-connect internals retain their separate unchanged-C oracle.','remaining':'Status/info payload formatting, rcon authentication/execution and live UDP receive loop remain host boundaries.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}},indent=2)+'\n');print('PASS: 8 exact Baseq3 connectionless dispatch records + 18 contracts')
if __name__=='__main__':main()
