"""Retail BSP mover replay against unchanged Baseq3 G_RunMover."""
import argparse
import hashlib
import json
import re
import struct
import subprocess
import sys
import zipfile
from pathlib import Path

from inventory import sha
from spawn_oracle import build
from test_game_lifecycle import action, init, pack, setvar
from test_map_objects import bits, client, inspect, scalar, vec
from toolchain import ROOT, run


MAPS = {
    'q3ctf4': {'name': 'maps/q3ctf4.bsp', 'classes': ('func_bobbing',)},
    'q3dm15': {'name': 'maps/q3dm15.bsp', 'classes': ('func_pendulum',)},
    'q3dm0': {'name': 'maps/q3dm0.bsp', 'classes': ('func_rotating', 'func_door', 'func_button')},
}
TIMES = (1000, 2500, 4500, 6250, 8250, 12000)
RIDER_FRAME_TIMES = TIMES[:-1]
ACTIVE_DOOR_TIMES = (1100, 1150, 1250, 1500, 2000, 3200, 4000, 5000,
                     5050, 5500, 6000, 6100, 6400, 7400)
Q3DM0_BUTTON = '''
{
"classname" "func_button"
"model" "*12"
"origin" "10000 10000 10000"
"angle" "180"
"wait" "0.25"
"speed" "80"
}
'''
CONTENTS_BODY = 0x02000000
MASK_PLAYERSOLID = 0x02010001
TR_STATIONARY = 0
ET_PLAYER = 1
ET_ITEM = 2


def bobbing_riders(snapshot, mover_slot):
    """Create linked runtime player/item entities resting on the retail brush."""
    mover = snapshot['entities'][mover_slot]
    unpack = lambda word: struct.unpack('<f', struct.pack('<i', word))[0]
    origin = tuple(unpack(word) for word in mover['base'][33:36])
    mins = tuple(unpack(word) for word in mover['base'][27:30])
    maxs = tuple(unpack(word) for word in mover['base'][30:33])
    center = ((mins[0] + maxs[0]) * .5, (mins[1] + maxs[1]) * .5)
    player_slot, item_slot = snapshot['head'][5], snapshot['head'][5] + 1
    if item_slot >= 1022:
        raise RuntimeError('No runtime entity slots remain for retail mover riders')
    player_origin = (center[0], center[1], origin[2] + maxs[2] + 24.0)
    item_origin = (center[0] + 32.0, center[1], origin[2] + maxs[2] + 15.0)

    actions = [action(27, 3, 0), action(27, 4, item_slot + 1)]
    rows = ((player_slot, ET_PLAYER, player_origin, (-15., -15., -24.), (15., 15., 32.)),
            (item_slot, ET_ITEM, item_origin, (-15., -15., -15.), (15., 15., 15.)))
    for slot, kind, at, lower, upper in rows:
        actions += [scalar(slot, 11, 1), scalar(slot, 4, slot), scalar(slot, 8, kind),
                    scalar(slot, 23, CONTENTS_BODY), scalar(slot, 31, mover_slot),
                    scalar(slot, 32, TR_STATIONARY), scalar(slot, 33, snapshot['head'][2]),
                    scalar(slot, 34, 0), scalar(slot, 35, MASK_PLAYERSOLID),
                    vec(slot, 5, lower), vec(slot, 6, upper), vec(slot, 8, at), vec(slot, 2, at)]
        if kind == ET_PLAYER:
            actions += [scalar(slot, 12, 0), vec(slot, 3, at), client(0, 1, 2),
                        client(0, 5, 100), client(0, 6, 100)]
        else:
            actions += [scalar(slot, 13, 1), scalar(slot, 14, 1)]
        actions.append(action(28, slot, 1))
    return actions, player_slot, item_slot, player_origin, item_origin


def entity_text(data):
    offset, size = struct.unpack_from('<2i', data, 8)
    raw = data[offset:offset + size]
    if raw.endswith(b'\0'):
        raw = raw[:-1]
    return raw.decode('ascii')


def cached_bsp(stem):
    candidates = (ROOT / f'build/reference/retail_movers/{stem}.bsp',
                  ROOT / f'build/reference/bodies/cd_{stem}.bsp')
    return next((path for path in candidates if path.exists()), None)


def load_bsp(data_root, stem, override=None):
    if override is not None:
        return override.read_bytes(), str(override)
    archive_path = data_root / 'baseq3/pak0.pk3'
    if archive_path.exists():
        with zipfile.ZipFile(archive_path) as archive:
            return archive.read(MAPS[stem]['name']), archive_path.as_posix() + ':' + MAPS[stem]['name']
    cached = cached_bsp(stem)
    if cached is None:
        raise FileNotFoundError(f'{MAPS[stem]["name"]} is absent from {archive_path} and the build cache')
    return cached.read_bytes(), str(cached)


def run_native(native, bsp, stream, expected, raw, out):
    run([native, bsp, stream, expected, '0', '--map-objects', raw], out,
        log=out / (stream.stem + '.oracle.log'), timeout=600)
    return inspect(expected.read_bytes())


def selected_movers(stem, entities):
    selected = []
    for slot, ent in entities.items():
        if not ent['active'] or ent['classname'] not in MAPS[stem]['classes']:
            continue
        # G_RunMover returns immediately for FL_TEAMSLAVE. Run a door team through
        # its master so unchanged G_MoverTeam advances both linked brush models.
        if ent['classname'] == 'func_door' and ent['tail'][14] != slot:
            continue
        selected.append(slot)
    return selected


def run_case(stem, data_root, bsp_override, native, mini, build_date, out):
    bsp_data, asset_source = load_bsp(data_root, stem, bsp_override)
    bsp = out / f'{stem}.bsp'
    bsp.write_bytes(bsp_data)
    text = entity_text(bsp_data)
    # The available retail cache has no func_button entity. Reuse an actual
    # q3dm0 inline brush at an isolated origin, while retaining the original
    # Baseq3 parser, SP_func_button, Touch_Button and mover functions.
    if stem == 'q3dm0':
        text += Q3DM0_BUTTON
    base = [setvar('g_log', ''), setvar('g_gametype', 4), setvar('sv_maxclients', 4),
            init(time=1000, seed=1, entities=text)]

    probe = out / f'{stem}-probe.bin'
    probe_expected = out / f'{stem}-probe.expected'
    probe_raw = out / f'{stem}-probe.raw.jsonl'
    probe.write_bytes(pack(base, build_date))
    parsed_probe = run_native(native, bsp, probe, probe_expected, probe_raw, out)
    entities = parsed_probe['last']['entities']
    mover_slots = selected_movers(stem, entities)
    class_slots = {
        classname: [slot for slot in mover_slots if entities[slot]['classname'] == classname]
        for classname in MAPS[stem]['classes']
    }
    expected_counts = {
        'q3ctf4': {'func_bobbing': 1},
        'q3dm15': {'func_pendulum': 3},
        'q3dm0': {'func_rotating': 2, 'func_door': 1, 'func_button': 1},
    }[stem]
    if {key: len(value) for key, value in class_slots.items()} != expected_counts:
        raise RuntimeError(f'{stem} mover selection differs: {class_slots}')
    if stem == 'q3dm0':
        door = entities[class_slots['func_door'][0]]
        if door['tail'][15] < 0 or entities[door['tail'][15]]['classname'] != 'func_door':
            raise RuntimeError('q3dm0 richard door team is not linked to its second part')
        door_team_parts = [class_slots['func_door'][0], door['tail'][15]]

        # Let the unchanged delayed door thinker create its real retail touch
        # trigger, then discover that runtime slot from the native snapshot.
        trigger_stream = out / f'{stem}-door-trigger.bin'
        trigger_expected = out / f'{stem}-door-trigger.expected'
        trigger_raw = out / f'{stem}-door-trigger.raw.jsonl'
        trigger_actions = base + [action(35, door_team_parts[0], 1100)]
        trigger_stream.write_bytes(pack(trigger_actions, build_date))
        trigger_probe = run_native(native, bsp, trigger_stream, trigger_expected,
                                   trigger_raw, out)
        trigger_entities = trigger_probe['last']['entities']
        door_triggers = [slot for slot, ent in trigger_entities.items()
                         if ent['active'] and ent['classname'] == 'door_trigger'
                         and ent['base'][20] == door_team_parts[0]]
        if len(door_triggers) != 1:
            raise RuntimeError(f'q3dm0 runtime door trigger differs: {door_triggers}')
        door_trigger = door_triggers[0]
    else:
        door_team_parts = []
        door_trigger = None

    actions = list(base)
    if stem == 'q3dm0':
        door_master = class_slots['func_door'][0]
        button = class_slots['func_button'][0]
        # Stationary G_RunMover executes Think_SpawnNewDoorTrigger. Touching that
        # exact trigger with retail client slot zero drives Use_BinaryMover. The
        # later direct use starts a second cycle; G_RunMover reaches both ends.
        actions.append(action(35, door_master, 1100))
        actions.append(action(36, door_trigger, 0, 0))
        actions.append(action(36, button, 0, 0))
        for time in ACTIVE_DOOR_TIMES:
            if time == 5050:
                actions.append(action(20, door_master, -1, 0))
                actions.append(action(20, button, -1, 0))
            for slot in mover_slots:
                actions.append(action(35, slot, time))
        times = ACTIVE_DOOR_TIMES
    elif stem == 'q3ctf4':
        rider_actions, player_slot, item_slot, player_origin, item_origin = bobbing_riders(
            parsed_probe['last'], class_slots['func_bobbing'][0])
        actions.extend(rider_actions)
        for time in RIDER_FRAME_TIMES:
            actions.append(action(37, time))
        times = RIDER_FRAME_TIMES
    else:
        for time in TIMES:
            for slot in mover_slots:
                actions.append(action(35, slot, time))
        times = TIMES

    stream = out / f'{stem}.bin'
    expected = out / f'{stem}.expected'
    raw = out / f'{stem}.raw.jsonl'
    stream.write_bytes(pack(actions, build_date))
    parsed = run_native(native, bsp, stream, expected, raw, out)
    output = run([mini, bsp, stream, expected], ROOT / 'build',
                 log=out / f'{stem}.test.log', timeout=600)
    match = re.search(r'(\d+) map-object actions / (\d+) exact words / (\d+) ordered effects', output)
    if not match:
        raise RuntimeError(output)
    observed = tuple(map(int, match.groups()))
    wanted = (len(actions), parsed['exact_words'], len(parsed['effects']))
    if observed != wanted:
        raise RuntimeError(f'{stem} retail mover totals differ: {observed} != {wanted}')

    final_entities = parsed['last']['entities']
    for slot in mover_slots:
        classname = entities[slot]['classname']
        if classname == 'func_button':
            if final_entities[slot]['tail'][4] != 0:
                raise RuntimeError(f'q3dm0 func_button slot {slot} lost its client activator')
            if final_entities[slot]['tail'][8] != 0:
                raise RuntimeError(f'q3dm0 func_button slot {slot} did not complete its return')
            continue
        indices = range(36, 39) if classname in ('func_rotating', 'func_pendulum') else range(33, 36)
        before = tuple(entities[slot]['base'][index] for index in indices)
        after = tuple(final_entities[slot]['base'][index] for index in indices)
        if before == after:
            raise RuntimeError(f'{stem} {classname} slot {slot} did not advance')
    for slot in door_team_parts:
        before = tuple(entities[slot]['base'][index] for index in range(33, 36))
        after = tuple(final_entities[slot]['base'][index] for index in range(33, 36))
        if before == after:
            raise RuntimeError(f'{stem} func_door team part {slot} did not advance')

    rider_result = None
    if stem == 'q3ctf4':
        mover_slot = class_slots['func_bobbing'][0]
        player = final_entities[player_slot]
        item = final_entities[item_slot]
        initial_words = (tuple(bits(value) for value in player_origin),
                         tuple(bits(value) for value in item_origin))
        final_words = (player['state'][6:9], item['state'][6:9])
        if final_words[0] == initial_words[0] or final_words[1] == initial_words[1]:
            raise RuntimeError(f'q3ctf4 full frames did not carry both riders: {final_words}')
        if player['state'][37] != mover_slot or item['state'][37] != mover_slot:
            raise RuntimeError('q3ctf4 full frames lost the retail mover ground references')
        if player['client'] != 0 or item['base'][14] != 1:
            raise RuntimeError('q3ctf4 runtime player/item fixtures lost their live bindings')
        rider_result = {
            'mover_slot': mover_slot, 'player_slot': player_slot, 'item_slot': item_slot,
            'frames': list(RIDER_FRAME_TIMES),
            'player_initial_bits': list(initial_words[0]), 'player_final_bits': list(final_words[0]),
            'item_initial_bits': list(initial_words[1]), 'item_final_bits': list(final_words[1]),
            'path': ('unchanged G_RunFrame/G_RunMover/G_RunItem versus frame.run '
                     'with default mover/item dispatch'),
        }

    return {
        'passed': True,
        'map': MAPS[stem]['name'],
        'asset_source': asset_source,
        'mover_slots': mover_slots,
        'mover_classes': class_slots,
        'door_team_parts': door_team_parts,
        'door_trigger': door_trigger,
        'active_paths': ['touch', 'use', 'reached'] if stem == 'q3dm0' else [],
        'full_frame_riders': rider_result,
        'button_fixture': ('original q3dm0 inline model *12, isolated origin; '
                           'unchanged Baseq3 spawn/touch/use/reached bodies') if stem == 'q3dm0' else None,
        'times': list(times),
        'actions': len(actions),
        'snapshots': parsed['snapshots'],
        'exact_words': parsed['exact_words'],
        'ordered_effects': len(parsed['effects']),
        'bsp_sha256': sha(bsp),
        'entity_text_sha256': hashlib.sha256(text.encode('ascii')).hexdigest(),
        'expected_sha256': sha(expected),
    }, output.strip()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('data_root', nargs='?', type=Path, default=Path('D:/Quake3'))
    parser.add_argument('--bsp', type=Path, help='q3ctf4 BSP override (legacy option)')
    parser.add_argument('--reuse-build', action='store_true')
    args = parser.parse_args()
    out = ROOT / 'build/reference/retail_movers'
    out.mkdir(parents=True, exist_ok=True)
    source_manifest = out / 'original_sources.json'
    if not args.reuse_build:
        sources = build(out, lifecycle=True)
        source_manifest.write_text(json.dumps([p.relative_to(ROOT).as_posix() for p in sorted(set(sources))], indent=2) + '\n')
        subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                        'tests/map_object_tests.ml', '--output', 'retail_mover_tests.exe'], check=True)
    if not source_manifest.exists():
        raise RuntimeError('Missing fresh retail-mover source manifest')
    sources = [ROOT / p for p in json.loads(source_manifest.read_text())]
    native = out / 'spawn_oracle.exe'
    mini = ROOT / 'build/retail_mover_tests.exe'
    build_date = run([native, '--build-date'], out).strip()

    cases = {}
    for stem in ('q3ctf4', 'q3dm15', 'q3dm0'):
        case, output = run_case(stem, args.data_root, args.bsp if stem == 'q3ctf4' else None,
                                native, mini, build_date, out)
        cases[stem] = case
        print(output)
        print(f"PASS: {stem} {', '.join(case['mover_classes'])} / {case['exact_words']} exact words / {case['ordered_effects']} ordered effects")

    result = {
        'passed': True,
        'cases': cases,
        'totals': {
            'maps': len(cases),
            'movers': sum(len(case['mover_slots']) for case in cases.values()),
            'actions': sum(case['actions'] for case in cases.values()),
            'snapshots': sum(case['snapshots'] for case in cases.values()),
            'exact_words': sum(case['exact_words'] for case in cases.values()),
            'ordered_effects': sum(case['ordered_effects'] for case in cases.values()),
        },
        'oracle_sha256': sha(native),
        'test_sha256': sha(mini),
        'original_sources': {p.relative_to(ROOT).as_posix(): sha(p) for p in sorted(set(sources))},
        'scope': 'Three retail BSPs through G_InitGame and unchanged Baseq3 mover bodies. q3ctf4 runs complete unchanged G_RunFrame frames with a linked runtime player and item carried by its untouched bobbing brush; the item subsequently follows unchanged G_RunItem, while Mini uses frame.run with default mover/item dispatch and no override. q3dm15 pendulums use untouched entity lumps. q3dm0 covers rotating movers plus the retail richard two-part door through delayed trigger creation, Touch_DoorTrigger, Use_BinaryMover and both Reached_BinaryMover directions. Because the available retail cache has no button entity, one explicit fixture reuses q3dm0 inline model *12 at an isolated origin through unchanged SP_func_button, Touch_Button, Use_BinaryMover and Reached_BinaryMover. Full lifecycle snapshots and ordered host effects are compared exactly.',
    }
    (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8', newline='\n')
    print(f"PASS: {result['totals']['maps']} retail maps / {result['totals']['movers']} mover masters / {result['totals']['exact_words']} exact words / {result['totals']['ordered_effects']} ordered effects")


if __name__ == '__main__':
    main()
