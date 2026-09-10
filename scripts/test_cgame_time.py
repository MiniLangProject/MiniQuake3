"""Verify client snapshot clock, first-snapshot and demo timing contracts."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run,msvc_env
def main():
    out=ROOT/'build/reference/cgame_time';out.mkdir(parents=True,exist_ok=True);original=ROOT/'Quake-III-Arena-original-source/code'
    harness=ROOT/'tests/reference/cgame_time_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/MT','/DWIN32',f'/I{original / "game"}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cgame_time_oracle.ml','--output','cgame_time_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/cgame_time_oracle.exe'],ROOT/'build',log=out/'minilang-oracle.log')
    if native!=mini:raise RuntimeError('cgame timing constants mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/cgame_time_contracts.ml','--output','cgame_time_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/cgame_time_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if value!='PASS: 26 cgame timing contracts':raise RuntimeError(value)
    source=ROOT/'Quake-III-Arena-original-source/code/client/cl_cgame.c';text=source.read_text(encoding='utf-8',errors='replace')
    for name in ['CL_AdjustTimeDelta','CL_FirstSnapshot','CL_SetCGameTime']:
      if name not in text:raise RuntimeError('missing original function '+name)
    files=[source,harness,ROOT/'src/mq3/client/cgame_time.ml',ROOT/'tests/cgame_time_contracts.ml']
    report={'passed':True,'records':4,'contracts':26,'scope':'CL_AdjustTimeDelta, CL_FirstSnapshot and CL_SetCGameTime including demos and timedemo.','oracle':'Original q_shared.h constants plus required unchanged cl_cgame.c functions.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n');print('PASS: 4 exact Baseq3 timing constants + 26 cgame timing contracts')
if __name__=='__main__':main()
