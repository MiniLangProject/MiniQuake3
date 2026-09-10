"""Verify concrete client protocol parser composition."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run
def main():
 out=ROOT/'build/reference/protocol_runtime';out.mkdir(parents=True,exist_ok=True)
 for script in ('test_server_message.py','test_gamestate.py','test_download.py'):
  subprocess.run([sys.executable,ROOT/'scripts'/script],cwd=ROOT,check=True)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/protocol_runtime_contracts.ml','--output','protocol_runtime_contracts.exe'],cwd=ROOT,check=True)
 actual=run([ROOT/'build/protocol_runtime_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if actual!='PASS: 12 client protocol-runtime contracts':raise RuntimeError(actual)
 paths=[ROOT/'src/mq3/client/protocol_runtime.ml',ROOT/'tests/protocol_runtime_contracts.ml',ROOT/'scripts/test_server_message.py',ROOT/'scripts/test_gamestate.py',ROOT/'scripts/test_download.py']
 result={'passed':True,'contracts':12,'scope':'Concrete server-message composition with real gamestate, download and snapshot parsers; gamestate clears active snapshot state, synchronizes reliable command sequence and baselines, then a same-message download and snapshot are decoded.','oracle':'Composition is gated by the direct unchanged-C CL_ParseServerMessage, CL_ParseGamestate and CL_ParseDownload oracles before the integration contracts run.','remaining':'Systeminfo policy, real filesystem services and live packet transport remain host boundaries.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in paths}}
 (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n');print(actual)
if __name__=='__main__':main()
