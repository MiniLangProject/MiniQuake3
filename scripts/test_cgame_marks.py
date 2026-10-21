"""Unchanged-C mark differential and complete cg_marks translation-unit contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    'CG_AddMarks', 'CG_AddParticleShrapnel', 'CG_AddParticleToScene',
    'CG_AddParticles', 'CG_AllocMark', 'CG_BloodPool', 'CG_ClearParticles',
    'CG_FreeMarkPoly', 'CG_ImpactMark', 'CG_InitMarkPolys',
    'CG_NewParticleArea', 'CG_OilSlickRemove', 'CG_ParticleBloodCloud',
    'CG_ParticleBubble', 'CG_ParticleBulletDebris', 'CG_ParticleDust',
    'CG_ParticleExplosion', 'CG_ParticleImpactSmokePuff', 'CG_ParticleMisc',
    'CG_ParticleSmoke', 'CG_ParticleSnow', 'CG_ParticleSnowFlurry',
    'CG_ParticleSparks', 'CG_Particle_Bleed', 'CG_Particle_OilParticle',
    'CG_Particle_OilSlick', 'CG_SnowLink', 'ValidBloodPool',
]


def main():
    out = ROOT / 'build/reference/cgame_marks'
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / 'Quake-III-Arena-original-source/code/cgame/cg_marks.c'
    compared = ['CG_InitMarkPolys', 'CG_FreeMarkPoly', 'CG_AllocMark',
                'CG_ImpactMark', 'CG_AddMarks']
    (out / 'cgame_marks_under_test.inc').write_text(
        extract(original, compared), encoding='utf-8', newline='\n')
    host = ROOT / 'tests/reference/cgame_marks_oracle.c'
    exe = out / 'oracle.exe'
    run(['cl', '/nologo', '/Od', '/fp:strict', '/MT', '/W4', '/WX',
         '/wd4100', '/wd4189', '/wd4244', '/wd4706', f'/I{out}', host,
         f'/Fe:{exe}', '/link', '/Brepro'], out, msvc_env('x86'),
        out / 'oracle-build.log')
    native = run([exe], out, log=out / 'oracle.log')
    for source, name in [
        ('tests/cgame_marks_oracle.ml', 'cgame_marks_oracle.exe'),
        ('tests/cgame_marks_contracts.ml', 'cgame_marks_contracts.exe'),
    ]:
        subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                        source, '--output', name], cwd=ROOT, check=True)
    mini = run([ROOT / 'build/cgame_marks_oracle.exe'], ROOT / 'build',
               log=out / 'minilang.log')
    assert native == mini, (native, mini)
    contracts = run([ROOT / 'build/cgame_marks_contracts.exe'], ROOT / 'build',
                    log=out / 'contracts.log').strip()
    assert contracts == 'PASS: 23 native cg_marks contracts', contracts
    delegated = subprocess.run(
        [sys.executable, ROOT / 'scripts/test_cgame_particles.py'], cwd=ROOT,
        text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    if delegated.returncode:
        raise RuntimeError('delegated cgame particle suite failed:\n' +
                           delegated.stdout)
    assert 'PASS:' in delegated.stdout and '29 native contracts' in delegated.stdout
    files = [original, host, ROOT / 'src/mq3/client/cgame_marks.ml',
             ROOT / 'src/mq3/client/cgame_particles.ml',
             ROOT / 'tests/cgame_marks_oracle.ml',
             ROOT / 'tests/cgame_marks_contracts.ml']
    result = {
        'passed': True,
        'differential_records': len(native.splitlines()),
        'contracts': 52,
        'functions': FUNCTIONS,
        'scope': ('All 28 cg_marks.c inventory candidates are represented. The '
                  'five native mark functions preserve projected-fragment '
                  'geometry, pooled batch eviction, persistent/temporary '
                  'lifetimes, energy/RGB/alpha fading and suppressible collision '
                  'and renderer boundaries. The appended 23 particle entry '
                  'points delegate to the complete cgame_particles runtime.'),
        'sources': {str(path.relative_to(ROOT)).replace('\\', '/'): sha(path)
                    for path in files},
    }
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
    print(f'PASS: {len(native.splitlines())} unchanged C cg_marks records + '
          '23 mark contracts + 29 delegated particle contracts (28 candidates)')


if __name__ == '__main__':
    main()
