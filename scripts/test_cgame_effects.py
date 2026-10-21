"""Unchanged-C cg_effects decisions and complete native effect contracts."""
import json
import subprocess
import sys
from pathlib import Path

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    'CG_BigExplode', 'CG_Bleed', 'CG_BubbleTrail', 'CG_GibPlayer',
    'CG_InvulnerabilityImpact', 'CG_InvulnerabilityJuiced',
    'CG_KamikazeEffect', 'CG_LaunchExplode', 'CG_LaunchGib',
    'CG_LightningBoltBeam', 'CG_MakeExplosion', 'CG_ObeliskExplode',
    'CG_ObeliskPain', 'CG_ScorePlum', 'CG_SmokePuff', 'CG_SpawnEffect',
]

def main():
    out = ROOT / 'build/reference/cgame_effects'
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / 'Quake-III-Arena-original-source/code/cgame/cg_effects.c'
    compared = ['CG_SmokePuff', 'CG_SpawnEffect', 'CG_MakeExplosion',
                'CG_Bleed', 'CG_LaunchGib', 'CG_LaunchExplode']
    (out / 'cgame_effects_under_test.inc').write_text(
        extract(source, compared), encoding='utf-8', newline='\n')
    host = ROOT / 'tests/reference/cgame_effects_oracle.c'
    exe = out / 'oracle.exe'
    run(['cl', '/nologo', '/Od', '/fp:strict', '/MT', '/W4', '/WX',
         '/wd4100', '/wd4244', '/wd4706', f'/I{out}', host, f'/Fe:{exe}',
         '/link', '/Brepro'], out, msvc_env('x86'), out / 'oracle-build.log')
    native = run([exe], out, log=out / 'oracle.log')
    for mini_source, name in [
        ('tests/cgame_effects_oracle.ml', 'cgame_effects_oracle.exe'),
        ('tests/cgame_effects_contracts.ml', 'cgame_effects_contracts.exe'),
    ]:
        subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                        mini_source, '--output', name], cwd=ROOT, check=True)
    mini = run([ROOT / 'build/cgame_effects_oracle.exe'], ROOT / 'build',
               log=out / 'minilang.log')
    assert native == mini, (native, mini)
    contracts = run([ROOT / 'build/cgame_effects_contracts.exe'], ROOT / 'build',
                    log=out / 'contracts.log').strip()
    assert contracts == 'PASS: 36 native cg_effects contracts', contracts
    files = [source, host, ROOT / 'src/mq3/client/cgame_effects.ml',
             ROOT / 'tests/cgame_effects_oracle.ml',
             ROOT / 'tests/cgame_effects_contracts.ml']
    result = {
        'passed': True,
        'differential_records': 8,
        'contracts': 36,
        'functions': FUNCTIONS,
        'scope': ('Complete native cg_effects local-entity semantics with exact '
                  'lifetimes, trajectories, Retail media paths, missionpack '
                  'effects and suppressible render/audio boundary dispatch.'),
        'sources': {str(path.relative_to(ROOT)).replace('\\', '/'): sha(path)
                    for path in files},
    }
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
    print('PASS: 8 unchanged C cg_effects records + 36 native contracts')

if __name__ == '__main__':
    main()
