#!/usr/bin/env python3
"""Build weapon inventory contracts and audit quantities against original bg_misc.c."""
from __future__ import annotations
import json
import re
import subprocess
import sys
from inventory import sha
from toolchain import ROOT, run

EXPECTED = {
    'weapon_machinegun': (40, 'WP_MACHINEGUN'), 'weapon_shotgun': (10, 'WP_SHOTGUN'),
    'weapon_grenadelauncher': (10, 'WP_GRENADE_LAUNCHER'), 'weapon_rocketlauncher': (10, 'WP_ROCKET_LAUNCHER'),
    'weapon_lightning': (100, 'WP_LIGHTNING'), 'weapon_railgun': (10, 'WP_RAILGUN'),
    'weapon_plasmagun': (50, 'WP_PLASMAGUN'), 'weapon_bfg': (20, 'WP_BFG'),
    'ammo_bullets': (50, 'WP_MACHINEGUN'), 'ammo_shells': (10, 'WP_SHOTGUN'),
    'ammo_grenades': (5, 'WP_GRENADE_LAUNCHER'), 'ammo_rockets': (5, 'WP_ROCKET_LAUNCHER'),
    'ammo_lightning': (60, 'WP_LIGHTNING'), 'ammo_slugs': (10, 'WP_RAILGUN'),
    'ammo_cells': (30, 'WP_PLASMAGUN'), 'ammo_bfg': (15, 'WP_BFG'),
}

def item_record(source: str, classname: str) -> tuple[int, str]:
    start = source.find(f'"{classname}"')
    if start < 0:
        raise RuntimeError(f'missing original bg_itemlist entry: {classname}')
    block = source[start:source.find('\n\t},', start)]
    match = re.search(r'/\* pickup \*/\s*"[^"]+",\s*\n\s*(-?\d+),', block)
    if not match:
        raise RuntimeError(f'cannot parse original quantity: {classname}')
    tag = re.search(r'\n\s*IT_(?:WEAPON|AMMO),\s*\n\s*(WP_[A-Z_]+),', block)
    if not tag:
        raise RuntimeError(f'cannot parse original weapon tag: {classname}')
    return int(match.group(1)), tag.group(1)

def main() -> int:
    original = ROOT/'Quake-III-Arena-original-source/code/game/bg_misc.c'
    public = ROOT/'Quake-III-Arena-original-source/code/game/bg_public.h'
    source = original.read_text(encoding='latin-1')
    audited = {name: item_record(source, name) for name in EXPECTED}
    if audited != EXPECTED:
        raise RuntimeError(f'bg_misc.c quantity drift: {audited!r}')
    enum_source = public.read_text(encoding='latin-1')
    enum = re.search(r'typedef enum \{\s*WP_NONE,(.*?)WP_NUM_WEAPONS', enum_source, re.S)
    if not enum:
        raise RuntimeError('cannot parse original weapon_t enum')
    weapon_ids = ['WP_NONE'] + re.findall(r'\b(WP_[A-Z_]+)\s*,', enum.group(1).split('#ifdef MISSIONPACK')[0])
    expected_ids = ['WP_NONE','WP_GAUNTLET','WP_MACHINEGUN','WP_SHOTGUN','WP_GRENADE_LAUNCHER',
                    'WP_ROCKET_LAUNCHER','WP_LIGHTNING','WP_RAILGUN','WP_PLASMAGUN','WP_BFG','WP_GRAPPLING_HOOK']
    if weapon_ids != expected_ids:
        raise RuntimeError(f'bg_public.h weapon enum drift: {weapon_ids!r}')

    subprocess.run([sys.executable, ROOT/'scripts/build.py', '--source',
                    'tests/playable_weapon_inventory_contracts.ml', '--output',
                    'playable_weapon_inventory_contracts.exe'], cwd=ROOT, check=True)
    out = ROOT/'build/reference/playable_weapon_inventory';out.mkdir(parents=True,exist_ok=True)
    contracts = run([ROOT/'build/playable_weapon_inventory_contracts.exe'], ROOT/'build',
                    log=out/'contracts.log').strip()
    expected = 'PASS: 46 playable weapon-inventory contracts'
    if contracts != expected:
        raise RuntimeError(contracts)
    files = [ROOT/'src/mq3/client/playable_weapon_inventory.ml',
             ROOT/'tests/playable_weapon_inventory_contracts.ml',
             ROOT/'scripts/test_playable_weapon_inventory.py', original, public]
    report = {
        'passed': True, 'contracts': 46, 'originalItems': audited, 'originalWeaponIds': weapon_ids,
        'originalSource': str(original.relative_to(ROOT)).replace('\\','/'),
        'scope': 'Baseq3 ownership bits, per-weapon ammo, bg_itemlist pickup quantities, 200-ammo cap, cycling, direct selection, out-of-ammo fallback and respawn reset.',
        'sources': {str(path.relative_to(ROOT)).replace('\\','/'): sha(path) for path in files},
    }
    (out/'result.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8',newline='\n')
    print(contracts)
    print('PASS: audited 16 pickup quantities directly against original bg_misc.c')
    return 0

if __name__=='__main__': raise SystemExit(main())
