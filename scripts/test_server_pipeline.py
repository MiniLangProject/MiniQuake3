"""End-to-end server snapshot/download/netchan adapter contracts."""
import json,subprocess,sys
from inventory import sha
from test_rejections import tiny_bsp
from toolchain import ROOT,run
def main():
 out=ROOT/'build/reference/server_pipeline';out.mkdir(parents=True,exist_ok=True);fixture=out/'fixture.bsp';fixture.write_bytes(tiny_bsp())
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/server_pipeline_contracts.ml','--output','server_pipeline_contracts.exe'],cwd=ROOT,check=True)
 result=run([ROOT/'build/server_pipeline_contracts.exe',fixture],ROOT/'build',log=out/'contracts.log').strip()
 if result!='PASS: 11 server-pipeline contracts':raise RuntimeError(result)
 sources=[ROOT/'src/mq3/server/pipeline.ml',ROOT/'tests/server_pipeline_contracts.ml']
 report={'passed':True,'contracts':11,'scope':'Concrete snapshot_runtime build callback, snapshot_send frame slot and ring cursor synchronization, server.download callback, netchan transmit callback and complete fragment draining.','oracle':'Each component retains its separate unchanged-C byte oracle; this gate verifies their composed MiniLang state and packet boundaries.','remaining':'Live UDP NET_SendPacket and multi-client scheduler ownership remain host boundaries.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
 (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print(result)
if __name__=='__main__':main()
