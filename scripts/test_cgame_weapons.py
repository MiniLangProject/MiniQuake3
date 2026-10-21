"""Unchanged-C weapon decisions and complete native cg_weapons contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract

FUNCTIONS = [
    'CG_AddPlayerWeapon', 'CG_AddViewWeapon', 'CG_AddWeaponWithPowerups',
    'CG_Bullet', 'CG_CalcMuzzlePoint', 'CG_CalculateWeaponPosition',
    'CG_DrawWeaponSelect', 'CG_FireWeapon', 'CG_GrappleTrail',
    'CG_GrenadeTrail', 'CG_LightningBolt', 'CG_MachineGunEjectBrass',
    'CG_MachinegunSpinAngle', 'CG_MapTorsoToWeaponFrame',
    'CG_MissileHitPlayer', 'CG_MissileHitWall', 'CG_NailTrail',
    'CG_NailgunEjectBrass', 'CG_NextWeapon_f', 'CG_OutOfAmmoChange',
    'CG_PlasmaTrail', 'CG_PrevWeapon_f', 'CG_RailTrail',
    'CG_RegisterItemVisuals', 'CG_RegisterWeapon', 'CG_RocketTrail',
    'CG_ShotgunEjectBrass', 'CG_ShotgunFire', 'CG_ShotgunPattern',
    'CG_ShotgunPellet', 'CG_SpawnRailTrail', 'CG_Tracer',
    'CG_WeaponSelectable', 'CG_Weapon_f', 'strike', 'weapon',
]

def main():
    out = ROOT / 'build/reference/cgame_weapons'
    out.mkdir(parents=True, exist_ok=True)
    source = ROOT / 'Quake-III-Arena-original-source/code/cgame/cg_weapons.c'
    compared = ['CG_MapTorsoToWeaponFrame', 'CG_WeaponSelectable',
                'CG_NextWeapon_f', 'CG_PrevWeapon_f', 'CG_OutOfAmmoChange',
                'CG_MachinegunSpinAngle']
    (out / 'cgame_weapons_under_test.inc').write_text(
        extract(source, compared), encoding='utf-8', newline='\n')
    host = ROOT / 'tests/reference/cgame_weapons_oracle.c'
    exe = out / 'oracle.exe'
    run(['cl', '/nologo', '/Od', '/fp:strict', '/MT', '/W4', '/WX',
         '/wd4100', '/wd4244', '/wd4706', f'/I{out}', host, f'/Fe:{exe}',
         '/link', '/Brepro'], out, msvc_env('x86'), out / 'oracle-build.log')
    native = run([exe], out, log=out / 'oracle.log')
    for mini_source, name in [
        ('tests/cgame_weapons_oracle.ml', 'cgame_weapons_oracle.exe'),
        ('tests/cgame_weapons_contracts.ml', 'cgame_weapons_contracts.exe'),
    ]:
        subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                        mini_source, '--output', name], cwd=ROOT, check=True)
    mini = run([ROOT / 'build/cgame_weapons_oracle.exe'], ROOT / 'build',
               log=out / 'minilang.log')
    assert native == mini, (native, mini)
    contracts = run([ROOT / 'build/cgame_weapons_contracts.exe'], ROOT / 'build',
                    log=out / 'contracts.log').strip()
    assert contracts.startswith('PASS: ') and contracts.endswith(
        ' native cg_weapons contracts'), contracts
    count = int(contracts.split()[1])
    files = [source, host, ROOT / 'src/mq3/client/cgame_weapons.ml',
             ROOT / 'tests/cgame_weapons_oracle.ml',
             ROOT / 'tests/cgame_weapons_contracts.ml']
    result = {
        'passed': True, 'differential_records': 9, 'contracts': count,
        'functions': FUNCTIONS,
        'scope': ('Complete native cg_weapons decisions, Retail registrations, '
                  'weapon selection, trails, impacts, brass, muzzle effects and '
                  'suppressible renderer/audio boundaries.'),
        'sources': {str(p.relative_to(ROOT)).replace('\\', '/'): sha(p)
                    for p in files},
    }
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
    print(f'PASS: 9 unchanged C cg_weapons records + {count} native contracts')

if __name__ == '__main__':
    main()
