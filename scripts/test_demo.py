"""Direct Baseq3 protocol-68 demo framing and playback gate."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env
from transition_oracle import extract

def main():
 out=ROOT/'build/reference/demo';out.mkdir(parents=True,exist_ok=True)
 src=ROOT/'Quake-III-Arena-original-source/code/client/cl_main.c';harness=ROOT/'tests/reference/demo_oracle.c';(out/'demo_under_test.inc').write_text(extract(src,['CL_WriteDemoMessage','CL_DemoFilename','CL_ReadDemoMessage']),encoding='utf-8',newline='\n');exe=out/'oracle.exe'
 run(['cl','/nologo','/Od','/MT','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log');native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/demo_oracle.ml','--output','demo_oracle.exe'],cwd=ROOT,check=True);mini=run([ROOT/'build/demo_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:
  aa=native.splitlines();bb=mini.splitlines()
  for i in range(max(len(aa),len(bb))):
   a=aa[i] if i<len(aa) else '<missing>';b=bb[i] if i<len(bb) else '<missing>'
   if a!=b:raise RuntimeError(f'demo mismatch {i+1}\nC: {a}\nM: {b}')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/demo_contracts.ml','--output','demo_contracts.exe'],cwd=ROOT,check=True)
 value=run([ROOT/'build/demo_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if value!='PASS: 27 demo framing contracts':raise RuntimeError(value)
 sources=[src,harness,ROOT/'src/mq3/client/demo.ml',ROOT/'tests/demo_oracle.ml',ROOT/'tests/demo_contracts.ml']
 report={'passed':True,'records':len(native.splitlines()),'contracts':27,'scope':'Exact CL_WriteDemoMessage sequence/length/payload bytes, CL_DemoFilename including invalid .tga fallback, and CL_ReadDemoMessage sequence, EOF/truncation, lastPacketTime and parser payload transitions; plus synthetic CL_Record_f initial gamestate.','remaining':'Filesystem commands, timedemo clock and dispatcher playback integration remain open.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
 (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print(f'PASS: {len(native.splitlines())} exact Baseq3 demo records + 27 contracts')
if __name__=='__main__':main()
