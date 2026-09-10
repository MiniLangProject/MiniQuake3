"""Exercise the MiniLang NET_SendPacket/NET_GetPacket UDP bridge and OOB framing."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run

def main():
    out=ROOT/'build/reference/net_transport';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/net_transport_contracts.ml','--output','net_transport_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/net_transport_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 15 UDP net transport contracts':raise RuntimeError(value)
    sources=[ROOT/'src/mq3/qcommon/net_transport.ml',ROOT/'src/mq3/qcommon/huffman.ml',ROOT/'tests/net_transport_contracts.ml']
    report={'passed':True,'contracts':15,
      'scope':'Live localhost UDP adapter for Netchan send callbacks, nonblocking receive, IPv4 address conversion, OOB text framing and adaptive-compressed connect data.',
      'oracle':'OOB adaptive bytes are covered by the unchanged Huff_Compress/Huff_Decompress differential gate; the Winsock boundary is covered by real two-socket integration contracts.',
      'sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(value)
if __name__=='__main__':main()
