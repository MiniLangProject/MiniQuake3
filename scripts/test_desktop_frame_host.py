"""Verify desktop UDP ownership and bounded engine-frame orchestration."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT, run

def main():
    out=ROOT/'build/reference/desktop_frame_host';out.mkdir(parents=True,exist_ok=True)
    suites=[
        ('tests/desktop_frame_host_contracts.ml','desktop_frame_host_contracts.exe','PASS: 19 desktop frame host contracts'),
        ('tests/desktop_frame_host_live_contracts.ml','desktop_frame_host_live_contracts.exe','PASS: 6 desktop frame host live contracts'),
    ]
    values=[]
    for source,binary,expected in suites:
        subprocess.run([sys.executable,ROOT/'scripts/build.py','--source',source,'--output',binary],cwd=ROOT,check=True)
        value=run([ROOT/'build'/binary],ROOT/'build',log=out/(binary+'.log')).strip()
        if value!=expected:raise RuntimeError(value)
        values.append(value)
    sources=[ROOT/'src/mq3/platform/desktop_frame_host.ml',ROOT/'tests/desktop_frame_host_contracts.ml',ROOT/'tests/desktop_frame_host_live_contracts.ml']
    report={'passed':True,'contracts':25,'scope':'Desktop frame host resource ownership with transactional startup rollback, two ephemeral UDP binds, ingress-backed bounded packet draining, monotonic/clamped frame time, server/client callback order, accounting and idempotent shutdown.','remaining':'Wire the host to the executable command line and concrete game/client frame callbacks.','sources':{str(p.relative_to(ROOT)).replace('\\','/'):sha(p) for p in sources}}
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print('; '.join(values))
if __name__=='__main__':main()
