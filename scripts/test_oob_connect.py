"""Direct Baseq3 challenge/direct-connect differential gate."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
def main():
 out=ROOT/'build/reference/oob_connect';out.mkdir(parents=True,exist_ok=True);src=ROOT/'Quake-III-Arena-original-source/code/server/sv_client.c';(out/'oob_under_test.inc').write_text(extract(src,['SV_GetChallenge','SV_DirectConnect']),encoding='utf8',newline='\n');h=ROOT/'tests/reference/oob_connect_oracle.c';exe=out/'oracle.exe';run(['cl','/nologo','/Od','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',f'/I{ROOT / "Quake-III-Arena-original-source/code/game"}',h,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/oob_connect_oracle.ml','--output','oob_connect_oracle.exe'],check=True);mini=run([ROOT/'build/oob_connect_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:
  aa=native.splitlines();bb=mini.splitlines()
  for i in range(max(len(aa),len(bb))):
   a=aa[i] if i<len(aa) else '<missing>';b=bb[i] if i<len(bb) else '<missing>'
   if a!=b:raise RuntimeError(f'OOB mismatch {i+1}\nC: {a}\nM: {b}')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/oob_connect_contracts.ml','--output','oob_connect_contracts.exe'],check=True);contracts=run([ROOT/'build/oob_connect_contracts.exe'],ROOT/'build',log=out/'contracts.log');assert 'PASS: 26 OOB-connect contracts' in contracts
 files=[src,h,ROOT/'src/mq3/server/oob_connect.ml',ROOT/'tests/oob_connect_oracle.ml',ROOT/'tests/oob_connect_contracts.ml'];result={'passed':True,'records':len(native.splitlines()),'contracts':26,'scope':'SV_GetChallenge 1024-slot oldest/reuse ring, LAN/authorization timeout policy and SV_DirectConnect protocol/challenge/reconnect/private slot/connect state core.','oracle':'Unchanged SV_GetChallenge and SV_DirectConnect bodies with transport, cvar, VM and address host stubs.','remaining':'Authorize reply parsing, real net_ip UDP/DNS, game VM userinfo mutation and live server loop integration remain host or later blocks.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}};(out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf8');print(f'PASS: {len(native.splitlines())} exact Baseq3 OOB records + 26 contracts')
if __name__=='__main__':main()
