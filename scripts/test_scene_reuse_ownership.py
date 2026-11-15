"""Check retained MD3 buffer ownership across BSP/poly and lighting changes."""
import subprocess
import sys
from toolchain import ROOT, run


def main():
    subprocess.run([sys.executable, ROOT/'scripts/build.py', '--source',
                    'tests/scene_reuse_ownership_contracts.ml', '--output',
                    'scene_reuse_ownership_contracts.exe'], cwd=ROOT, check=True)
    output=ROOT/'build/reference/scene_reuse_ownership'
    output.mkdir(parents=True, exist_ok=True)
    result=run([ROOT/'build/scene_reuse_ownership_contracts.exe'], ROOT/'build',
               log=output/'contracts.log').strip()
    expected='PASS: 11 scene reuse ownership contracts (MD3/inline/poly UVs and older-view colors)'
    if result != expected:
        raise RuntimeError(result)
    print(result)


if __name__ == '__main__':
    main()
