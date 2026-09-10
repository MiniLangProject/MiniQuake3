"""Exercise deterministic client/server UDP polling with real localhost sockets."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/network_pump';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/network_pump_contracts.ml','--output','network_pump_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/network_pump_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 20 network pump contracts':raise RuntimeError(value)
    sources=[ROOT/'src/mq3/qcommon/network_pump.ml',ROOT/'src/mq3/qcommon/net_transport.ml',ROOT/'src/mq3/platform/udp.ml',ROOT/'tests/network_pump_contracts.ml']
    report={'passed':True,'contracts':20,'scope':'Deterministic nonblocking pumpOnce/drain API over real localhost client and server UDP sockets, alternating two-way fairness, bounded per-frame draining, empty queues, source addresses and exact binary payloads.','remaining':'The engine frame owner must bind the client and server PacketEvent callbacks and choose a per-frame packet budget.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(value)
if __name__=='__main__':main()
