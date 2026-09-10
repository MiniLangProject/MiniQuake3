"""Exercise the Windows-x64 UDP ABI through the MiniLang wrapper."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run
def main():
 out=ROOT/'build/reference/udp_platform';out.mkdir(parents=True,exist_ok=True)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/udp_platform_contracts.ml','--output','udp_platform_contracts.exe'],cwd=ROOT,check=True)
 value=run([ROOT/'build/udp_platform_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if value!='PASS: 13 Windows UDP platform contracts':raise RuntimeError(value)
 sources=[ROOT/'native/udp_win64.c',ROOT/'src/mq3/platform/udp.ml',ROOT/'tests/udp_platform_contracts.ml']
 report={'passed':True,'contracts':13,'scope':'Two nonblocking Windows-x64 UDP sockets bind to localhost ephemeral ports and exchange exact 9-byte and 2048-byte binary datagrams in both directions; no-data behavior and source address/port roundtrips are checked.','boundary':'The native DLL contains only Winsock startup/socket/bind/getsockname/sendto/recvfrom/closesocket/cleanup operations. Game and protocol policy remain in MiniLang.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
 (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print(value)
if __name__=='__main__':main()
