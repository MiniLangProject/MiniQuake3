"""Profile the productive q3dm1 weapon and HUD views without opening a window."""
import argparse
from pathlib import Path
import subprocess
import sys
from toolchain import ROOT, run


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--data-root',type=Path,default=ROOT/'build')
    args=parser.parse_args()
    pak=args.data_root.resolve()/'baseq3/pak0.pk3'
    if not pak.is_file(): raise RuntimeError(f'Missing Retail pak: {pak}')
    subprocess.run([sys.executable,ROOT/'scripts/build.py','--source','tests/qvm_scene_hotpath_retail_probe.ml','--output','qvm_scene_hotpath_retail_probe.exe'],cwd=ROOT,check=True)
    out=ROOT/'build/reference/qvm_scene_hotpath';out.mkdir(parents=True,exist_ok=True)
    result=run([ROOT/'build/qvm_scene_hotpath_retail_probe.exe',pak,ROOT/'build/reference/qvms'],ROOT/'build',log=out/'retail.log')
    if not result.rstrip().endswith('PASS: headless Retail scene hotpath diagnosis'): raise RuntimeError(result)
    print(result)


if __name__=='__main__': main()
