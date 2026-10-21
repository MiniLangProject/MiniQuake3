"""Verify the static AAS client-bbox trace used by movement prediction."""
import subprocess
import sys
from toolchain import ROOT,run

def main():
    source=ROOT/'Quake-III-Arena-original-source/code/botlib/be_aas_sample.c'
    text=source.read_text(encoding='latin-1')
    for anchor in ('aas_trace_t AAS_TraceClientBBox','TRACEPLANE_EPSILON','trace.lastarea = -nodenum','trace.planenum ^= 1'):
        if anchor not in text: raise RuntimeError('missing original AAS trace anchor: '+anchor)
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/aas_client_trace_contracts.ml','--output','aas_client_trace_contracts.exe'],cwd=ROOT,check=True)
    value=run([ROOT/'build/aas_client_trace_contracts.exe'],ROOT).strip()
    if value!='PASS: 8 AAS client trace contracts': raise RuntimeError(value)
    print(value+' + original source anchors')

if __name__=='__main__': main()
