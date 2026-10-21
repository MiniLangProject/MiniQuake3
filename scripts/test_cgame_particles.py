"""Unchanged-C differential and complete native contracts for cg_particles.c."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    'CG_ClearParticles', 'CG_AddParticleToScene', 'CG_AddParticles',
    'CG_ParticleSnowFlurry', 'CG_ParticleSnow', 'CG_ParticleBubble',
    'CG_ParticleSmoke', 'CG_ParticleBulletDebris', 'CG_ParticleExplosion',
    'CG_AddParticleShrapnel', 'CG_NewParticleArea', 'CG_SnowLink',
    'CG_ParticleImpactSmokePuff', 'CG_Particle_Bleed',
    'CG_Particle_OilParticle', 'CG_Particle_OilSlick',
    'CG_OilSlickRemove', 'ValidBloodPool', 'CG_BloodPool',
    'CG_ParticleBloodCloud', 'CG_ParticleSparks', 'CG_ParticleDust',
    'CG_ParticleMisc',
]


def main():
    out = ROOT / 'build/reference/cgame_particles'
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / 'Quake-III-Arena-original-source/code/cgame/cg_particles.c'
    compared = [
        'CG_ParticleSnow', 'CG_ParticleBubble', 'CG_ParticleSmoke',
        'CG_ParticleBulletDebris', 'CG_ParticleImpactSmokePuff',
        'CG_Particle_Bleed', 'CG_ParticleMisc', 'CG_ParticleExplosion',
    ]
    (out / 'cgame_particles_under_test.inc').write_text(
        extract(source, compared), encoding='utf-8', newline='\n')
    host = ROOT / 'tests/reference/cgame_particles_oracle.c'
    exe = out / 'oracle.exe'
    run([
        'cl', '/nologo', '/Od', '/fp:strict', '/arch:SSE2', '/MT', '/W4',
        '/WX', '/wd4100', '/wd4244', '/wd4706', '/wd4996', f'/I{out}',
        host, f'/Fe:{exe}', '/link', '/Brepro',
    ], out, msvc_env('x86'), out / 'oracle-build.log')
    native = run([exe], out, log=out / 'oracle.log')
    for mini_source, name in [
        ('tests/cgame_particles_oracle.ml', 'cgame_particles_oracle.exe'),
        ('tests/cgame_particles_contracts.ml', 'cgame_particles_contracts.exe'),
    ]:
        subprocess.run([
            sys.executable, ROOT / 'scripts/build.py', '--source', mini_source,
            '--output', name,
        ], cwd=ROOT, check=True)
    mini = run([ROOT / 'build/cgame_particles_oracle.exe'], ROOT / 'build',
               log=out / 'minilang.log')
    if native != mini:
        raise RuntimeError(
            f'cg_particles differential mismatch\nC:\n{native}\nMiniLang:\n{mini}')
    contracts = run([ROOT / 'build/cgame_particles_contracts.exe'],
                    ROOT / 'build', log=out / 'contracts.log').strip()
    if contracts != 'PASS: 29 cgame particle contracts':
        raise RuntimeError(contracts)
    files = [
        source, host, ROOT / 'src/mq3/client/cgame_particles.ml',
        ROOT / 'tests/cgame_particles_oracle.ml',
        ROOT / 'tests/cgame_particles_contracts.ml',
    ]
    result = {
        'passed': True,
        'differential_records': 8,
        'contracts': 29,
        'functions': FUNCTIONS,
        'scope': (
            'Complete 8192-slot particle lifecycle, all weather, bubble, smoke, '
            'bleed, flat, animated and sprite render paths, all original '
            'spawners, PVS linking, area parsing, blood-pool validation and '
            'suppressible polygon boundary dispatch. Original dormant-type and '
            'persistent-positive-sprite behavior is preserved.'
        ),
        'sources': {
            str(path.relative_to(ROOT)).replace('\\', '/'): sha(path)
            for path in files
        },
    }
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n',
                                     encoding='utf-8')
    print('PASS: 8 unchanged C particle records + 29 native contracts')


if __name__ == '__main__':
    main()
