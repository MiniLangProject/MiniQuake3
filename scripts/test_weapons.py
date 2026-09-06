"""Differential Baseq3 firing, hitscan, gauntlet and projectile integration."""
import argparse
from collections import Counter
from dataclasses import replace
import json
import random
import re
import struct
import subprocess
import sys

from inventory import sha
from spawn_oracle import build
from test_client_commands import case as command_case
from test_team_changes import Client, action
from test_missiles import missile_bsp
from toolchain import ROOT, run


def bits(value):
    return struct.unpack('<i', struct.pack('<f', value))[0]


def scalar(field, value, slot=0, time=1000):
    return action(53, str(value), slot=slot, time=time, p0=field)


def vector(field, value, slot=0, time=1000):
    return action(54, ','.join(str(bits(part)) for part in value),
                  slot=slot, time=time, p0=field)


def fire(slot=0, time=1000):
    return action(50, '', slot=slot, time=time, p0=0)


def gauntlet(slot=0, time=1000):
    return action(51, '', slot=slot, time=time, p0=0)


def seed(value):
    return action(52, '', p0=value)


def helper(method, *words, slot=0, time=1000):
    return action(55, ','.join(map(str, words)), p0=method, slot=slot, time=time)


def think(weapon, *, slot=0, time=1050, buttons=1, angles=(0, 0, 0), moves=(0, 0, 0)):
    values = (time, buttons, weapon, *angles, *moves)
    return action(57, ','.join(map(str, values)), slot=slot, time=time, p0=0)


def scenario(name, actions, *, flags=0, clients=None, **kwargs):
    population = {0: Client(flags=0, ammo=100), 1: Client(flags=0, health=10000)}
    population.update(clients or {})
    population = {slot: replace(client, pmflags=0, eflags=0)
                  for slot, client in population.items()}
    return name, command_case([seed(1), *actions], clients=population, **kwargs), flags


def inspect_stream(data):
    """Walk record boundaries; semantic proof must not confuse payload with tags."""
    offset = 0
    clients, entities, firing = {}, {}, ()
    trace_targets, impact_events, trace_surfaces = Counter(), set(), set()
    trace_count, host_count, snapshots = 0, 0, 0
    results = []
    final_random = None

    def words(count):
        nonlocal offset
        values = struct.unpack_from('<' + 'i' * count, data, offset)
        offset += count * 4
        return values

    def string():
        nonlocal offset
        size = words(1)[0]
        if size == -1:
            return None
        if size < 0 or offset + size > len(data):
            raise RuntimeError(f'Invalid weapon proof string at {offset}')
        value = data[offset:offset + size]
        offset += size
        return value

    def strings(count):
        for _ in range(count):
            string()

    while offset < len(data):
        kind = words(1)[0]
        if kind == 220:
            snapshots += 1
            header = words(12)
            allocated = header[5]
            words(342)  # team/rank/spawn/body/item registration prefix
            clients = {}
            for slot in range(64):
                ps, before = words(117), words(23)
                string()
                after = words(47)
                string()  # player configstring
                clients[slot] = dict(health=ps[46], pm_type=ps[1], armor=ps[49],
                                     accuracy_hits=before[15], accuracy_shots=before[22],
                                     accurate_count=after[40], impressive=ps[71])
            entities = {}
            for slot in range(allocated):
                state = words(54)
                classname = string()
                private = words(45)
                entities[slot] = dict(health=private[5], type=state[1],
                                      inuse=bool(state[52]), client=state[53],
                                      classname=classname.decode('utf-8', 'replace') if classname else '',
                                      event=state[45] & 255)
                if state[1] >= 13:
                    impact_events.add(state[1] - 13)
                if state[45]:
                    impact_events.add(state[45] & 255)
            strings(3)
            words(4); strings(1)  # follow
            words(11); strings(67)  # intermission
            words(3); strings(2); words(4); strings(2); words(6)
            strings(79); words(1)  # vote configs, userinfos, nextmap, location
            for _ in range(allocated):
                string(); words(1)
            words(3)
            firing = words(13)
            words(64)  # persistent hook pointers
            for slot in range(allocated):
                projectile = words(6)
                entities[slot].update(damage=projectile[0], splash_damage=projectile[1],
                                      splash_radius=projectile[2])
        elif kind == 221:
            words(2); string(); host_count += 1
        elif kind == 224:
            results.append(words(1)[0])
        elif kind == 225:
            words(3)
        elif kind == 226:
            final_random = words(1)[0]
            if offset != len(data):
                raise RuntimeError('Random-consumption record must terminate the stream')
        elif kind == 227:
            trace = words(30)
            trace_targets[trace[29]] += 1
            trace_surfaces.add(trace[21])
            trace_count += 1
        else:
            raise RuntimeError(f'Unknown weapon proof record {kind} at {offset - 4}')
    if final_random is None:
        raise RuntimeError('Missing weapon random-consumption footer')
    return dict(traces=trace_count, trace_targets=dict(trace_targets), ordered_effects=host_count,
                snapshot_count=snapshots, impact_events=sorted(impact_events),
                trace_surface_flags=sorted(trace_surfaces),
                final_random=final_random, results=results,
                final_health={slot: ent['health'] for slot, ent in entities.items() if slot < 64},
                final_accuracy_hits={slot: client['accuracy_hits'] for slot, client in clients.items()},
                final_accuracy_shots={slot: client['accuracy_shots'] for slot, client in clients.items()},
                final_accurate_count=clients[0]['accurate_count'],
                final_impressive=clients[0]['impressive'],
                final_quad_factor_bits=firing[0],
                projectiles={slot: ent for slot, ent in entities.items() if ent['type'] == 3})


def validate_paths(name, proof):
    def require(condition, label):
        if not condition:
            raise RuntimeError(f'{name}: semantic path missing: {label}; proof={proof}')

    hits = proof['trace_targets']
    health = proof['final_health']
    accuracy = proof['final_accuracy_hits'][0]
    if name in ('fire_dispatch_2', 'fire_dispatch_6', 'fire_dispatch_7'):
        damage = {'fire_dispatch_2': 7, 'fire_dispatch_6': 8, 'fire_dispatch_7': 100}[name]
        require(hits.get(1, 0) >= 1 and health[1] == 10000 - damage,
                'real target trace and expected weapon damage')
        require(accuracy == 1, 'one accuracy hit')
    if name == 'fire_dispatch_3':
        require(proof['traces'] == 11 and hits.get(1, 0) >= 1 and health[1] < 10000,
                'all shotgun pellet traces and a damaged target')
        require(accuracy == 1 and 54 in proof['impact_events'], 'one shotgun accuracy and shotgun event')
    if name in ('fire_dispatch_4', 'fire_dispatch_5', 'fire_dispatch_8', 'fire_dispatch_9'):
        require(len(proof['projectiles']) == 1, 'actual projectile allocation')
        require(next(iter(proof['projectiles'].values()))['damage'] > 0, 'projectile damage initialized')
    if name.startswith('rail_penetrates_at_most_four_'):
        intended = int(name.rsplit('_', 1)[1])
        for slot in range(1, min(intended, 4) + 1):
            require(hits.get(slot, 0) >= 1 and health[slot] == 9900,
                    f'rail penetrated target {slot}')
        if intended == 5:
            require(health[5] == 10000 and hits.get(5, 0) == 0, 'fifth target remains behind rail hit limit')
        require(accuracy == 1 and 53 in proof['impact_events'], 'one accuracy credit and rail trail')
    if name.startswith('hitscan_') and name.endswith('_lethal'):
        require(hits.get(1, 0) >= 1 and health[1] <= 0, 'real lethal damage')
    if name.startswith('hitscan_') and '_friendly_' in name:
        allowed = name.endswith('_1')
        require(hits.get(1, 0) >= 1 and (health[1] < 10000 if allowed else health[1] == 10000),
                'friendly-fire damage gate with an actual target trace')
        require(accuracy == 0, 'team hits do not count for accuracy')
    if name.startswith('world_impact_'):
        require(hits.get(1022, 0) >= 1, 'world surface was reached')
        if name.endswith('_surface_16'):
            require(any(flags & 16 for flags in proof['trace_surface_flags']), 'SURF_NOIMPACT reached')
    if name == 'world_impact_2_surface_16':
        require(49 not in proof['impact_events'], 'no bullet wall event on SURF_NOIMPACT')
    if name == 'gauntlet_world_surface_16':
        require(hits.get(1022, 0) >= 1
                and any(flags & 16 for flags in proof['trace_surface_flags'])
                and proof['results'][-1] == 0, 'gauntlet reaches and rejects SURF_NOIMPACT')
    if name in ('gauntlet_lethal_real_death', 'client_think_gauntlet_close_hit'):
        require(hits.get(1, 0) >= 1 and health[1] < (25 if name.startswith('gauntlet') else 10000),
                'real gauntlet trace/damage')
    if name.startswith('gauntlet_') and '_preserves_prior_quad_factor' in name:
        require(proof['final_quad_factor_bits'] == bits(4.5) and proof['results'][-1] == 0,
                'early return retains preceding shared quad factor')
    if name == 'rocket_fire_run_direct_and_splash_one_accuracy':
        require(hits.get(1, 0) >= 1 and health[1] <= 0, 'rocket directly kills first target')
        require(health[2] < 1000, 'rocket splash damages second target')
        require(accuracy == 1, 'direct and splash share a single accuracy credit')


def scenarios():
    for weapon in (*range(12), -1, 2147483647):
        yield scenario(f'fire_dispatch_{weapon}', [scalar(1, weapon), fire()])
    for weapon in range(1, 11):
        yield scenario(f'client_events_real_weapon_{weapon}', [
            scalar(1, weapon), action(56, '', p0=7)])
    yield scenario('entity_weapon_differs_from_player_weapon', [
        scalar(30, 8), scalar(31, 2), fire(), scalar(30, 2), scalar(31, 8), fire()])
    for weapon in (0, 1, 2, 10, 123):
        yield scenario(f'accuracy_shot_counter_wrap_{weapon}', [
            scalar(1, weapon), scalar(4, 2147483647), fire(), fire()])
    yield scenario('firing_ignores_empty_ammo_and_dead_health', [
        scalar(1, 5), fire()], clients={0: Client(flags=0, health=-10, ammo=0, pmtype=3)})
    yield scenario('last_slot_firing', [
        scalar(1, 5, slot=63), fire(slot=63)],
        maxclients=64, clients={63: Client(flags=0, name='Last')})
    yield scenario('persistent_client_alias_firing', [
        action(6, p0=1), scalar(30, 8), vector(2, (0, 90, 0), slot=1), fire()])

    for factor in (0.0, 0.5, 1.5, 3.0, -1.0):
        for weapon in (2, 3, 4, 5, 6, 7, 8, 9):
            yield scenario(f'quad_damage_{weapon}_{factor}', [
                scalar(1, weapon), scalar(3, bits(factor)), scalar(15, 1), fire()])
    yield scenario('quad_factor_refresh_and_nonzero_expiry', [
        scalar(1, 5), scalar(15, -1), scalar(3, bits(2.25)), fire(),
        scalar(3, bits(4.75)), fire(), scalar(15, 0), fire()])
    for gametype in (0, 1, 2, 3, 4):
        yield scenario(f'machinegun_team_damage_{gametype}', [
            scalar(1, 2), fire()], gametype=gametype,
            clients={0: Client(flags=0, team=1), 1: Client(flags=0, team=2, health=10000)})

    for weapon in (2, 3, 6, 7):
        for name, changes in (
                ('armor', [scalar(7, 200, slot=1)]),
                ('god', [scalar(24, 16, slot=1)]),
                ('nondamageable', [scalar(10, 0, slot=1)]),
                ('no_body_contents', [scalar(11, 0, slot=1)]),
                ('dead_player_stat', [scalar(32, 0, slot=1)]),
                ('lethal', [scalar(8, 1, slot=1)])):
            yield scenario(f'hitscan_{weapon}_{name}', [scalar(1, weapon), *changes, fire()])
        for friendly in (0, 1):
            yield scenario(f'hitscan_{weapon}_friendly_{friendly}', [
                scalar(1, weapon), scalar(13, friendly), fire()], gametype=3,
                clients={0: Client(flags=0, team=1), 1: Client(flags=0, team=1, health=10000)})
        yield scenario(f'hitscan_{weapon}_nonclient_target', [
            scalar(1, weapon), fire()], clients={1: Client(flags=0, bound=0, health=10000)})
        yield scenario(f'hitscan_{weapon}_battlesuit', [
            scalar(1, weapon), fire()], clients={1: Client(flags=0, health=10000, powers=1 << 2)})
    yield scenario('handicap_knockback_fraction_and_disabled_knockback', [
        scalar(1, 6), scalar(9, 37), scalar(14, bits(123.75)), fire(),
        scalar(14, bits(0.0)), fire()])

    for flags in (0, 16):
        for weapon in (2, 3, 6, 7):
            yield scenario(f'world_impact_{weapon}_surface_{flags}', [
                scalar(1, weapon), vector(1, (250, 100, 80)),
                vector(2, (90, 0, 0)), fire()], flags=flags)
        yield scenario(f'gauntlet_world_surface_{flags}', [
            scalar(1, 1), vector(1, (250, 100, 0)), vector(2, (90, 0, 0)), gauntlet()],
            flags=flags)
    for x in (3035.5, 3060.875, 3061.0, 3061.125):
        yield scenario(f'gauntlet_range_{x}', [
            scalar(1, 1), vector(1, (x, 0, 128), slot=1), gauntlet()])
    for factor in (0.5, 3.0, -1.0):
        yield scenario(f'gauntlet_quad_{factor}', [
            scalar(1, 1), scalar(15, 1), scalar(3, bits(factor)),
            vector(1, (3036, 0, 128), slot=1), gauntlet()])
    yield scenario('gauntlet_hit_without_client', [
        scalar(1, 1), vector(1, (3036, 0, 128), slot=1), gauntlet()],
        clients={1: Client(flags=0, bound=0, health=10000)})
    yield scenario('gauntlet_noimpact_preserves_prior_quad_factor', [
        scalar(1, 0), scalar(15, 1), scalar(3, bits(4.5)), fire(),
        scalar(15, 0), scalar(1, 1), vector(1, (250, 100, 0)),
        vector(2, (90, 0, 0)), gauntlet()], flags=16)
    yield scenario('gauntlet_nondamageable_preserves_prior_quad_factor', [
        scalar(1, 0), scalar(15, 1), scalar(3, bits(4.5)), fire(),
        scalar(15, 0), scalar(1, 1), scalar(10, 0, slot=1),
        vector(1, (3036, 0, 128), slot=1), gauntlet()])
    yield scenario('gauntlet_lethal_real_death', [
        scalar(1, 1), vector(1, (3036, 0, 128), slot=1), gauntlet()],
        clients={1: Client(flags=0, health=25)})

    for hits in range(1, 6):
        population = {slot: Client(flags=0, health=10000, name=f'Target{slot}')
                      for slot in range(1, hits + 1)}
        yield scenario(f'rail_penetrates_at_most_four_{hits}', [
            scalar(1, 7), *[vector(1, (3000 + slot * 100, 0, 128), slot=slot)
                            for slot in range(1, hits + 1)], fire()],
            maxclients=max(4, hits + 1), clients=population)
    yield scenario('rail_reward_hits_miss_resets_then_hits', [
        scalar(1, 7), fire(), fire(time=1100), vector(2, (0, 90, 0)),
        fire(time=1200), vector(2, (0, 0, 0)), fire(time=1300), fire(time=1400)])
    yield scenario('rail_award_and_accuracy_int32_wrap', [
        scalar(1, 7), scalar(6, 1), scalar(5, 2147483647),
        scalar(27, 2147483647), scalar(19, 0x38848), fire(time=2147483000)])
    yield scenario('rail_negative_accurate_count', [
        scalar(1, 7), scalar(6, -3), fire(), fire()])
    yield scenario('rail_entity_health_vs_player_stat', [
        scalar(1, 7), scalar(8, 0, slot=1), scalar(32, 100, slot=1), fire()])

    rng = random.Random(0x57454150)
    for index in range(16):
        yield scenario(f'seeded_machinegun_{index}', [
            scalar(1, 2), seed(rng.randrange(-2147483648, 2147483648)),
            vector(2, (rng.uniform(-30, 30), rng.uniform(-180, 180), rng.uniform(-20, 20))),
            fire(), fire(time=1001)])
    for index, pellet_seed in enumerate((0, 1, 2, 255, 256, -1, -2147483648, 2147483647,
                                        *[rng.randrange(-2147483648, 2147483648) for _ in range(8)])):
        yield scenario(f'seeded_shotgun_pattern_{index}', [
            scalar(1, 0), fire(), helper(2, *map(bits, (3014, 0, 154, 4096, 0, 0)), pellet_seed)])
    for spread in (0.0, 1.0, 200.0, -200.0, 10000.0):
        yield scenario(f'direct_bullet_spread_{spread}', [
            scalar(1, 0), fire(), helper(1, bits(spread), 7)])
    yield scenario('direct_pellet_hit_and_miss', [
        scalar(1, 0), fire(), helper(3, *map(bits, (3014, 0, 154, 3500, 0, 154))),
        helper(3, *map(bits, (3014, 100, 154, 3500, 100, 154)))])
    yield scenario('direct_pellet_global_forward_damage_normalization', [
        scalar(1, 0), fire(), vector(8, (3, 4, 0)),
        helper(3, *map(bits, (3014, 0, 154, 3500, 0, 154)))])
    for method in range(4, 12):
        yield scenario(f'direct_weapon_helper_{method}', [
            scalar(1, 0), fire(), helper(method)])
    yield scenario('direct_grenade_mutates_shared_forward_repeatedly', [
        scalar(1, 0), fire(), helper(7), helper(7), helper(8)])
    yield scenario('grapple_fireheld_hook_guards', [
        scalar(1, 10), fire(), fire(), scalar(16, 0), fire(),
        scalar(17, -1), fire(), scalar(16, 0), fire()])
    yield scenario('grapple_existing_hook_prevents_spawn', [
        scalar(1, 10), scalar(17, 80), fire()])

    for index, forward in enumerate(((1, 0, 0), (0.5, -0.25, 0.125), (0, 0, 0),
                                     (-1, -1, -1), (0.001, -0.001, 0.999))):
        yield scenario(f'muzzle_truncation_and_ignored_origin_{index}', [
            vector(3, (-1.5, 2.75, 10.25)), vector(4, (9999, -9999, 123)),
            scalar(2, -12 if index == 3 else 26), vector(8, forward),
            vector(9, (100, 100, 100)), vector(10, (-100, -100, -100)),
            helper(12), helper(13, *map(bits, (1000, 2000, 3000)))])
    vectors = [((1, 2, 3), (1, 2, 3), (0, 0, 1)),
               ((0, 0, 0), (1, 0, 0), (1, 0, 0)),
               ((0, 0, 0), (1, 2, 3), (0, 0, 0)),
               ((-1.5, 2.25, 3.5), (4.75, -5.5, 6.25), (0.3, 0.4, 0.8660254))]
    vectors += [tuple(tuple(rng.uniform(-100, 100) for _ in range(3))
                      for _ in range(3)) for _ in range(12)]
    for index, (start, impact, normal) in enumerate(vectors):
        yield scenario(f'bounce_projectile_{index}', [
            helper(14, *map(bits, (*start, *impact, *normal)))])

    for weapon in range(1, 11):
        yield scenario(f'client_think_real_weapon_{weapon}', [
            scalar(25, 0), scalar(22, 1000), scalar(28, 2046),
            vector(5, (0, 0, 0)), think(weapon),
            think(weapon, time=1100, buttons=0)],
            clients={0: Client(flags=0, weapon=weapon, ammo=100, cmdweapon=weapon)})
    yield scenario('client_think_gauntlet_close_hit', [
        scalar(25, 0), scalar(22, 1000), vector(1, (3036, 0, 128), slot=1),
        vector(5, (0, 0, 0)), think(1)],
        clients={0: Client(flags=0, weapon=1, ammo=-1, cmdweapon=1)})
    yield scenario('client_think_gauntlet_talk_and_cooldown_skip', [
        scalar(25, 0), scalar(22, 1000), vector(1, (3036, 0, 128), slot=1),
        think(1, buttons=3), scalar(20, 100), think(1, time=1100)],
        clients={0: Client(flags=0, weapon=1, ammo=-1, cmdweapon=1)})
    yield scenario('client_think_grapple_release_and_refire', [
        scalar(25, 0), scalar(22, 1000), vector(5, (0, 0, 0)),
        think(10), think(10, time=1100, buttons=0), think(10, time=1700)],
        clients={0: Client(flags=0, weapon=10, ammo=-1, cmdweapon=10)})
    yield scenario('rocket_fire_run_direct_and_splash_one_accuracy', [
        scalar(1, 5), vector(1, (3110, 45, 128), slot=2), fire(),
        action(58, '', p0=82, time=1200)], maxclients=3,
        clients={1: Client(flags=0, health=60), 2: Client(flags=0, health=1000)})


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--case')
    parser.add_argument('--reuse-build', action='store_true')
    args = parser.parse_args()
    out = ROOT / 'build/reference/weapons'
    sources = build(out) if not args.reuse_build else []
    if not args.reuse_build:
        subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                        'tests/team_change_tests.ml', '--output', 'team_change_tests.exe'], check=True)
    maps = {flags: out / f'weapons-{flags}.bsp' for flags in (0, 16)}
    for flags, bsp in maps.items():
        bsp.write_bytes(missile_bsp(flags))
    records = []
    seen = set()
    for name, data, flags in scenarios():
        if name in seen:
            raise RuntimeError('Duplicate weapon scenario: ' + name)
        seen.add(name)
        if args.case and args.case != name:
            continue
        safe = re.sub(r'[^a-zA-Z0-9_-]', '_', name)
        inp, expected, bsp = out / (safe + '.bin'), out / (safe + '.expected'), maps[flags]
        inp.write_bytes(data)
        run([out / 'spawn_oracle.exe', bsp, inp, expected, '0', '--weapons'],
            out, log=out / (safe + '.oracle.log'), timeout=30)
        output = run([ROOT / 'build/team_change_tests.exe', bsp, inp, expected, '--weapons'],
                     ROOT / 'build', log=out / (safe + '.test.log'), timeout=30)
        match = re.search(r'(\d+) team change actions / (\d+) exact words / (\d+) ordered effects / (\d+) weapon traces', output)
        if not match:
            raise RuntimeError(output)
        proof = inspect_stream(expected.read_bytes())
        validate_paths(name, proof)
        if proof['traces'] != int(match[4]) or proof['ordered_effects'] != int(match[3]):
            raise RuntimeError(f'{name}: independent stream counters differ from Mini checker')
        if proof['snapshot_count'] != int(match[1]) + int(match[3]) + int(match[4]):
            raise RuntimeError(f'{name}: missing action/effect/trace snapshot')
        records.append(dict(name=name, actions=int(match[1]), exact_words=int(match[2]),
                            ordered_effects=int(match[3]), traces=int(match[4]),
                            semantic_proof=proof,
                            bytes=expected.stat().st_size, inputs_sha256=sha(inp),
                            expected_sha256=sha(expected), map_sha256=sha(bsp)))
        if len(records) % 10 == 0 or args.case:
            print(f'{len(records)} weapon scenarios passed ({name})', flush=True)
    if not records:
        raise RuntimeError('No matching weapon scenario')
    output = run([ROOT / 'build/team_change_tests.exe', bsp, inp, expected, '--weapons-contracts'],
                 ROOT / 'build', log=out / 'contracts.log')
    print(output.strip())
    contracts = int(re.search(r'(\d+) weapon runtime contracts', output)[1])
    result = dict(
        passed=True, scenarios=records, scenario_count=len(records),
        actions=sum(record['actions'] for record in records),
        exact_words=sum(record['exact_words'] for record in records),
        ordered_effects=sum(record['ordered_effects'] for record in records),
        traces=sum(record['traces'] for record in records),
        output_bytes=sum(record['bytes'] for record in records), runtime_contracts=contracts,
        test_sha256=sha(ROOT / 'build/team_change_tests.exe'),
        oracle_sha256=sha(out / 'spawn_oracle.exe'),
        maps_sha256={bsp.name: sha(bsp) for bsp in maps.values()},
        scope='Unchanged Baseq3 g_weapon.c dispatch, aiming/bounce, gauntlet, bullets, '
              'shotgun/pellet/pattern, lightning, rail and projectile/grapple helpers. '
              'Real server/collision traces, damage/death, armor/team protection, '
              'accuracy/awards, missile direct/splash and default ClientEvents/ClientThink '
              'weapon integration are compared. All modeled client/entity state, '
              'projectile fields and shared firing vectors/quad factor are checked at '
              'every host effect and point trace. Final CRT rand output checks random '
              'consumption. No Missionpack, rendering or full engine playability claim.',
        original_sources={source.relative_to(ROOT).as_posix(): sha(source) for source in sources})
    name = ('reused-' + (args.case or 'all') + '.json') if args.reuse_build else (
        args.case + '.result.json' if args.case else 'result.json')
    (out / name).write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8', newline='\n')
    print(f"PASS: {len(records)} weapon scenarios / {result['actions']} actions / "
          f"{result['exact_words']} exact words / {result['traces']} traces / "
          f"{result['ordered_effects']} ordered effects")


if __name__ == '__main__':
    main()
