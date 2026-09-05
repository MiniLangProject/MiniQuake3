"""Unchanged Baseq3 team locations/overlays/CheckCvars with real CM visibility."""
import argparse
import json
import random
import re
import struct
import subprocess
import sys

from inventory import sha
from spawn_oracle import build
from test_bodies import map_bytes
from toolchain import ROOT, run


def i32(value):
    return (value + 0x80000000) % 0x100000000 - 0x80000000


def ints(*values):
    return struct.pack('<' + 'i' * len(values), *(i32(v) for v in values))


def text(value):
    data = value.encode('utf-8')
    return ints(len(data)) + data


def client(team=1, connected=2, inuse=1, info=1, location=99, health=100,
           armor=50, weapon=5, powerups=0, pos=(10., 0., 128.)):
    return ints(inuse, connected, team, info, location, health, armor, weapon, powerups) + struct.pack('<3f', *pos)


def case(actions, clients=None, locations=(), limit=4, level_limit=None, last=0, time=1000, ranks=None):
    data = ints(limit, limit if level_limit is None else level_limit, last, time, len(locations))
    for slot in range(64):
        data += (clients or {}).get(slot, client(team=0, connected=0, inuse=0, info=0, location=0))
    data += ints(*(range(64) if ranks is None else ranks))
    for health, pos in locations:
        data += ints(health) + struct.pack('<3f', *pos)
    data += ints(len(actions))
    for action in actions:
        kind = action[0]
        if kind == 4:
            data += ints(kind, action[1]) + text(action[2])
        elif kind == 8:
            data += ints(kind, action[1]) + struct.pack('<3f', *action[2])
        else:
            data += ints(*action)
    return data


def visibility_map(mask=3, separate=False, vised=True):
    original = map_bytes()
    lumps = []
    for index in range(17):
        offset, size = struct.unpack_from('<2i', original, 8 + index * 8)
        lumps.append(original[offset:offset + size])
    plane = len(lumps[2]) // 16
    lumps[2] += struct.pack('<4f', 1., 0., 0., 0.)
    lumps[3] = ints(plane, -1, -2, -20000, -20000, -20000, 20000, 20000, 20000)
    lumps[4] = b''.join(ints(cluster, cluster if separate else 0,
                           -20000, -20000, -20000, 20000, 20000, 20000, 0, 0, 0, 0)
                        for cluster in range(2))
    lumps[16] = ints(2, 1) + bytes((mask, 3)) if vised else b''
    header = bytearray(ints(0x50534249, 46) + bytes(136))
    offset = 144
    for index, data in enumerate(lumps):
        struct.pack_into('<2i', header, 8 + index * 8, offset, len(data))
        offset += len(data)
    return bytes(header) + b''.join(lumps)


def scenarios():
    maps = {'open': visibility_map(), 'pvs_blocked': visibility_map(mask=1),
            'areas': visibility_map(separate=True), 'no_vis': visibility_map(vised=False)}
    members = {0: client(), 1: client(pos=(-10., 0., 128.)), 2: client(team=2),
               3: client(info=0, pos=(-10., 0., 128.))}
    locations = [(11, (20., 0., 128.)), (22, (-20., 0., 128.))]
    yield 'strict_intervals', case([(1, t) for t in (0, 999, 1000, 1001, 1002, 2001, 2002, 0, 3003)], members, locations), maps['open']
    yield 'two_pass_update_before_send', case([(1, 1001)], members, locations), maps['open']
    yield 'no_locations_clears_team_only', case([(1, 1001)], {**members, 4: client(team=3)}, limit=5), maps['open']
    yield 'connected_inuse_team_filters', case([(1, 1001)], {
        0: client(), 1: client(connected=0), 2: client(connected=1), 3: client(inuse=0),
        4: client(team=0), 5: client(team=3), 6: client(team=2), 7: client(info=0)}, locations, limit=8), maps['open']
    yield 'wrap_interval', case([(1, i32(0x7ffffff0 + d)) for d in (1000, 1001, 2001, 2002)],
                               members, locations, last=0x7ffffff0), maps['open']
    yield 'negative_elapsed_wrap', case([(1, -0x80000000), (1, 1001)], members, locations), maps['open']
    yield 'cvar_limit_exceeds_level_limit', case([(1, 1001)], members, locations, level_limit=1), maps['open']
    yield 'cvar_limit_below_level_limit', case([(1, 1001)], members, locations, limit=1, level_limit=64), maps['open']
    yield 'zero_cvar_limit', case([(1, 1001)], members, locations, limit=0, level_limit=64), maps['open']
    yield 'overlay_zero_members', case([(2, 0)], {0: client(inuse=0)}, limit=0), maps['open']
    yield 'overlay_opt_out', case([(2, 0)], {0: client(info=0)}), maps['open']
    yield 'overlay_32_slot_order', case([(2, 0)], {i: client(location=i + 101) for i in range(64)},
                                      limit=64, ranks=list(reversed(range(64)))), maps['open']
    yield 'overlay_sparse_slot63', case([(2, 63)], {i: client(team=i % 2 + 1, location=i) for i in range(64)},
                                      limit=64, ranks=list(reversed(range(64)))), maps['open']
    yield 'overlay_integer_fields', case([(2, 0)], {
        0: client(health=-1, armor=-0x80000000, weapon=-0x80000000, powerups=-1, location=-1),
        1: client(health=0x7fffffff, armor=0x7fffffff, weapon=0x7fffffff, powerups=0x7fffffff, location=0x7fffffff),
        2: client(connected=0), 3: client(connected=1)}), maps['open']
    for name, locs in (
        ('empty', []), ('nearest', [(1, (100., 0., 128.)), (2, (11., 0., 128.))]),
        ('tie_last', [(1, (9., 0., 128.)), (2, (11., 0., 128.))]),
        ('tie_last_reversed', [(2, (11., 0., 128.)), (1, (9., 0., 128.))]),
        ('at_radius', [(7, (8202., 8192., 8320.))]),
        ('beyond_radius', [(7, (8202.001, 8192., 8320.))]),
        ('float_rounded_tie', [(1, (10010., 0., 128.)), (2, (10010., 1., 128.))]),
    ):
        yield 'location_' + name, case([(3, 0)], {0: client()}, locs), maps['open']
    for name in ('open', 'pvs_blocked', 'no_vis'):
        yield 'visibility_' + name, case([(3, 0), (1, 1001)], {0: client(pos=(1., 0., 128.))},
            [(1, (-1., 0., 128.)), (2, (100., 0., 128.))]), maps[name]
    yield 'portal_open_close_reference_counts', case([
        (3, 0), (5, 0, 1, 1), (3, 0), (5, 0, 1, 1), (5, 0, 1, 0), (3, 0),
        (1, 1001), (5, 0, 1, 0), (3, 0), (1, 2002)],
        {0: client(pos=(1., 0., 128.))}, [(1, (-1., 0., 128.)), (2, (100., 0., 128.))]), maps['areas']
    yield 'moving_client_location_changes', case([(1, 1001), (8, 0, (-10., 0., 128.)), (1, 2001), (1, 2002)],
                                                members, locations), maps['open']
    yield 'password_initial_and_change_only', case([(4, 0, ''), (4, 0, 'secret'), (4, 1, 'secret'),
                                                   (4, 1, ''), (4, 2, ''), (4, 2, '')]), maps['open']
    yield 'password_none_ascii_case', case([(4, i, p) for i, p in enumerate(
        ('none', 'NONE', 'NoNe', ' none', 'none ', 'none\n', 'nOnE', 'non', 'noneX', ''))]), maps['open']
    yield 'password_counter_edges', case([(4, i, 'secret') for i in
                                         (-1, 0x7fffffff, -0x80000000, -1, -1, 0)]), maps['open']
    yield 'password_native_capacity', case([(4, 0, 'x' * 255), (4, 1, 'ä' * 127)]), maps['open']
    yield 'password_module_state_across_levels', case([(4, 0, ''), (7,), (4, 0, 'changed text'),
        (4, 1, 'secret'), (7,), (4, 1, ''), (4, 2, ''), (7,), (4, 2, 'new value')]), maps['open']
    yield 'active_frame_team_and_password', case([(6, 1000), (6, 1001), (6, 2001), (6, 2002)],
                                               members, locations), maps['open']
    rng = random.Random(0x743)
    for index in range(48):
        members = {i: client(team=rng.randrange(4), connected=rng.randrange(3), inuse=rng.randrange(2),
                             info=rng.randrange(2), location=100 + i, health=rng.randrange(-100, 200),
                             armor=rng.randrange(-50, 200), weapon=rng.randrange(12), powerups=rng.randrange(65536),
                             pos=tuple(rng.uniform(-16000, 16000) for _ in range(3))) for i in range(64)}
        locations = [(i + 1, tuple(rng.uniform(-16000, 16000) for _ in range(3))) for i in range(64)]
        ranks = list(range(64)); rng.shuffle(ranks)
        actions = [(3, i) for i in range(8)] + [(1, 1001), (2, 0), (2, 63)]
        yield f'seeded_selection_overlay_{index}', case(actions, members, locations, limit=64, ranks=ranks), maps['open']


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--case')
    args = parser.parse_args()
    out = ROOT / 'build/reference/team_status'
    sources = build(out)
    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/team_status_tests.ml', '--output', 'team_status_tests.exe'], check=True)
    records = []
    for name, data, bspdata in scenarios():
        if args.case and args.case != name:
            continue
        inp, expected, bsp = (out / (name + ext) for ext in ('.bin', '.expected', '.bsp'))
        inp.write_bytes(data); bsp.write_bytes(bspdata)
        run([out / 'spawn_oracle.exe', bsp, inp, expected, '0', '--team-status'], out, log=out / (name + '.oracle.log'))
        output = run([ROOT / 'build/team_status_tests.exe', bsp, inp, expected], ROOT / 'build', log=out / (name + '.test.log'))
        match = re.search(r'(\d+) team-status/Cvar actions / (\d+) exact words / (\d+) ordered effects', output)
        if not match:
            raise RuntimeError(output)
        records.append(dict(name=name, actions=int(match[1]), exact_words=int(match[2]), ordered_effects=int(match[3]),
                            bytes=expected.stat().st_size, inputs_sha256=sha(inp), expected_sha256=sha(expected), map_sha256=sha(bsp)))
        if not name.startswith('seeded_'):
            print(name + ': ' + output.strip(), flush=True)
    if not records:
        raise RuntimeError('No matching team-status scenario')
    name = records[0]['name']
    output = run([ROOT / 'build/team_status_tests.exe', out / (name + '.bsp'), out / (name + '.bin'),
                  out / (name + '.expected'), '--contracts'], ROOT / 'build', log=out / 'contracts.log')
    print(output.strip())
    result = dict(passed=True, scenarios=records, scenario_count=len(records), actions=sum(r['actions'] for r in records),
                  exact_words=sum(r['exact_words'] for r in records), ordered_effects=sum(r['ordered_effects'] for r in records),
                  output_bytes=sum(r['bytes'] for r in records), runtime_contracts=12,
                  test_sha256=sha(ROOT / 'build/team_status_tests.exe'), oracle_sha256=sha(out / 'spawn_oracle.exe'),
                  scope='Unchanged Baseq3 Team_GetLocation, SortClients, TeamplayInfoMessage, CheckTeamStatus and CheckCvars, including actual CM PVS/area portals and G_RunFrame integration. Engine Cvar refresh and command delivery remain observed host boundaries. Password cache has game-module lifetime.',
                  original_sources={s.relative_to(ROOT).as_posix(): sha(s) for s in sources})
    report = out / ('result.json' if not args.case else args.case + '.result.json')
    report.write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8')
    print(f"PASS: {len(records)} scenarios / {result['actions']} actions / {result['exact_words']} exact words / {result['ordered_effects']} ordered effects")


if __name__ == '__main__':
    main()
