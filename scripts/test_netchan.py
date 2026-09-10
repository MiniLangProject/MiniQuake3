"""Differential tests for the deterministic Baseq3 net_chan.c core."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract
FUNCTIONS=['Netchan_Init','Netchan_Setup','Netchan_TransmitNextFragment','Netchan_Transmit','Netchan_Process']
def main():
 out=ROOT/'build/reference/netchan';out.mkdir(parents=True,exist_ok=True);original=ROOT/'Quake-III-Arena-original-source/code/qcommon/net_chan.c';(out/'netchan_under_test.inc').write_text(extract(original,FUNCTIONS),encoding='utf-8',newline='\n');harness=ROOT/'tests/reference/netchan_oracle.c';exe=out/'netchan_oracle.exe'
 run(['cl','/nologo','/O2','/MT','/W4','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x64'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/netchan_oracle.ml','--output','netchan_oracle.exe'],check=True);mini=run([ROOT/'build/netchan_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:raise RuntimeError('netchan differential mismatch\nnative: '+native+'\nMiniLang: '+mini)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/netchan_contracts.ml','--output','netchan_contracts.exe'],check=True);contracts=run([ROOT/'build/netchan_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if contracts!='PASS: 29 netchan contracts':raise RuntimeError(contracts)
 result={'passed':True,'records':native.count('\n'),'contracts':29,'functions':FUNCTIONS,'packet_comparison':'complete hexadecimal packet bytes','transport_boundary':'NET_SendPacket service; UDP socket delivery is not implemented','safety_deviation':'receive capacity includes the four-byte reconstructed sequence header','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in [original,harness,ROOT/'src/mq3/qcommon/netchan.ml',ROOT/'src/mq3/qcommon/message.ml',ROOT/'tests/netchan_oracle.ml',ROOT/'tests/netchan_contracts.ml']}};(out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(f"PASS: {result['records']} exact Baseq3 netchan records with full packet bytes + 29 contracts")
if __name__=='__main__':main()
