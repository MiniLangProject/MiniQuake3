"""Differential Baseq3 MD3 frame repair and projected-radius LOD gate."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,msvc_env,run
from transition_oracle import extract

def main():
    out=ROOT/'build/reference/md3_entity';out.mkdir(parents=True,exist_ok=True)
    original=ROOT/'Quake-III-Arena-original-source/code/renderer/tr_mesh.c'
    (out/'md3_entity_under_test.inc').write_text(extract(original,['ProjectRadius','R_ComputeLOD']),encoding='utf-8',newline='\n')
    harness=ROOT/'tests/reference/md3_entity_oracle.c';oracle=out/'oracle.exe'
    run(['cl','/nologo','/Od','/fp:strict','/arch:SSE2','/MT','/W4',f'/I{out}',harness,f'/Fe:{oracle}','/link','/Brepro'],out,msvc_env('x86'),out/'oracle-build.log')
    native=run([oracle],out,log=out/'oracle.log')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/md3_entity_oracle.ml','--output','md3_entity_oracle.exe'],cwd=ROOT,check=True)
    mini=run([ROOT/'build/md3_entity_oracle.exe'],ROOT/'build',log=out/'minilang.log')
    if native!=mini:raise RuntimeError('MD3 entity mismatch\nC:\n'+native+'MiniLang:\n'+mini)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/md3_entity_contracts.ml','--output','md3_entity_contracts.exe'],cwd=ROOT,check=True)
    contracts=run([ROOT/'build/md3_entity_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    if contracts!='PASS: 24 MD3 entity contracts':raise RuntimeError(contracts)
    files=[original,harness,ROOT/'src/mq3/renderer/md3_entity.ml',ROOT/'src/mq3/renderer/qvm_scene_geometry.ml',ROOT/'tests/md3_entity_oracle.ml',ROOT/'tests/md3_entity_contracts.ml']
    result={'passed':True,'records':len(native.splitlines()),'contracts':24,'functions':['ProjectRadius','R_ComputeLOD'],'scope':'MD3 RF_WRAP_FRAMES normalization, invalid-frame pair repair, bounds radius, projected radius, r_lodscale cap, r_lodbias and LOD clamping. Production QVM geometry now applies the original frame normalization before interpolation and cache lookup.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(f"PASS: {result['records']} exact Baseq3 MD3 entity records + 24 contracts")
if __name__=='__main__':main()
