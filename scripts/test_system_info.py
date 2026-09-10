"""Direct differential test for Baseq3 CL_SystemInfoChanged."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
 out=ROOT/'build/reference/system_info';out.mkdir(parents=True,exist_ok=True)
 csrc=ROOT/'Quake-III-Arena-original-source/code/client/cl_parse.c'
 qsrc=ROOT/'Quake-III-Arena-original-source/code/game/q_shared.c'
 (out/'system_info_under_test.inc').write_text(extract(csrc,['CL_SystemInfoChanged']),encoding='utf-8',newline='\n')
 (out/'system_info_support_under_test.inc').write_text(extract(qsrc,['Info_ValueForKey','Info_NextPair']),encoding='utf-8',newline='\n')
 harness=ROOT/'tests/reference/system_info_oracle.c';exe=out/'oracle.exe'
 run(['cl','/nologo','/Od','/fp:strict','/MT','/DWIN32','/D_CRT_SECURE_NO_WARNINGS',f'/I{out}',f'/I{ROOT / "Quake-III-Arena-original-source/code/game"}',harness,f'/Fe:{exe}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
 native=run([exe],out,log=out/'oracle.log')
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/system_info_oracle.ml','--output','system_info_oracle.exe'],cwd=ROOT,check=True)
 mini=run([ROOT/'build/system_info_oracle.exe'],ROOT/'build',log=out/'minilang.log')
 if native!=mini:raise RuntimeError('systeminfo mismatch\nnative: '+native+'\nmini:   '+mini)
 subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/system_info_contracts.ml','--output','system_info_contracts.exe'],cwd=ROOT,check=True)
 value=run([ROOT/'build/system_info_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
 if value!='PASS: 22 systeminfo contracts':raise RuntimeError(value)
 sources=[csrc,qsrc,harness,ROOT/'src/mq3/client/system_info.ml',ROOT/'tests/system_info_oracle.ml',ROOT/'tests/system_info_contracts.ml']
 report={'passed':True,'records':5,'contracts':22,'scope':'CL_SystemInfoChanged serverId/demo gate, cheat reset, loaded/referenced pure paks, ordered system cvar propagation, case-insensitive fs_game detection and clearing, Cvar_VariableValue pure-state conversion, malformed final pair and gamestate callback binding.','oracle':'Unchanged CL_SystemInfoChanged from pinned Baseq3 client/cl_parse.c, with unchanged Info_ValueForKey and Info_NextPair support bodies.','remaining':'Concrete cvar/filesystem implementations remain host services.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
 (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print('PASS: 5 exact Baseq3 systeminfo transitions + 22 contracts')
if __name__=='__main__':main()
