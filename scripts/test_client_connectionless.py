"""Direct differential test for Baseq3 client connectionless responses."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
FUNCTIONS=['CL_CheckForResend','CL_DisconnectPacket','CL_ConnectionlessPacket']
def main():
 out=ROOT/'build/reference/client_connectionless';out.mkdir(parents=True,exist_ok=True);src=ROOT/'Quake-III-Arena-original-source/code/client/cl_main.c'
 (out/'client_connectionless_under_test.inc').write_text(extract(src,FUNCTIONS),encoding='utf-8',newline='\n');h=ROOT/'tests/reference/client_connectionless_oracle.c';exe=out/'oracle.exe'
 run(['cl','/nologo','/Od','/MT','/W4','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',h,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/client_connectionless_oracle.ml','--output','client_connectionless_oracle.exe'],check=True);mini=run([ROOT/'build/client_connectionless_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:
  aa=native.splitlines();bb=mini.splitlines()
  for i in range(max(len(aa),len(bb))):
   a=aa[i] if i<len(aa) else '<missing>';b=bb[i] if i<len(bb) else '<missing>'
   if a!=b:raise RuntimeError(f'client connectionless mismatch record {i+1}\nnative: {a}\nmini:   {b}')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/client_connectionless_contracts.ml','--output','client_connectionless_contracts.exe'],check=True);contracts=run([ROOT/'build/client_connectionless_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 27 client connectionless contracts':raise RuntimeError(contracts)
 files=[src,h,ROOT/'src/mq3/client/connectionless.ml',ROOT/'tests/client_connectionless_oracle.ml',ROOT/'tests/client_connectionless_contracts.ml']
 result={'passed':True,'records':len(native.splitlines()),'contracts':27,'functions':FUNCTIONS,'scope':'CL_CheckForResend demo/state/timeout gates, WAN authorization, getchallenge, exact quoted protocol/qport/challenge connect data and userinfo-dirty clear; challengeResponse proxy handoff, connectResponse validation/netchan setup, info/status callbacks, spoof-resistant disconnect and print/echo dispatch.','oracle':'Unchanged CL_CheckForResend, CL_DisconnectPacket and CL_ConnectionlessPacket bodies with deterministic message, command, info-string, net/address, cvar and host-service stubs.','remaining':'UDP receive, detailed browser info/status storage, MOTD policy and server-list parsing remain outside this dispatcher block.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {result['records']} exact client connectionless records + 27 contracts")
if __name__=='__main__':main()
