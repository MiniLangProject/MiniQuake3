"""Portal world-plane clipping, recursive-view planning and composition order."""
import json,subprocess,sys
from inventory import sha
from toolchain import ROOT,run
def main():
    out=ROOT/'build/reference/portal_render_pass';out.mkdir(parents=True,exist_ok=True)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/portal_render_pass_contracts.ml','--output','portal_render_pass_contracts.exe'],cwd=ROOT,check=True)
    result=run([ROOT/'build/portal_render_pass_contracts.exe'],ROOT/'build',log=out/'contracts.log').strip()
    expected='PASS: 40 portal-render contracts'
    if result!=expected:raise RuntimeError(result)
    files=[ROOT/'src/mq3/renderer/portal_render_pass.ml',ROOT/'src/mq3/renderer/portal_clip.ml',ROOT/'tests/portal_render_pass_contracts.ml']
    report={'passed':True,'contracts':38,'scope':'SS_PORTAL surface discovery, non-recursive reflected refdef planning, world/QVM user-plane polygon clipping with interpolated attributes, renderfx, lightmap and fog state, original portal-color/depth-clear/main composition ordering, static clipped-world batch reuse by ordered LOD faces and plane, and per-face clipping against the flattened reference across plane and selection changes.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in files}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(expected)
if __name__=='__main__':main()
