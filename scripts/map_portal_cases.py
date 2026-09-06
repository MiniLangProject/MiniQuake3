"""Defined Baseq3 portal cases and independent semantic observations.

The caller supplies the shared map-object fixture API. NaN/Inf/out-of-range
roll conversions belong exclusively to the separate MiniLang contracts.
"""
import struct


NULL_TARGET = 'G_PickTarget called with NULL targetname\n'
MISSING_OWNER = "Couldn't find target for misc_partal_surface\n"
ZERO = [0.0, 0.0, 0.0]
SURFACE_ORIGIN = [1.25, -2.75, 96.0]
CAMERA_ORIGIN = [10.0, 20.0, 96.0]


def _bits(value):
    return struct.unpack('<i', struct.pack('<f', value))[0]


def _rand_values(seed, count):
    values = []
    for _ in range(count):
        seed = (seed * 214013 + 2531011) & 0xffffffff
        values.append((seed >> 16) & 32767)
    return values


def _coords(values):
    return ' '.join(str(value) for value in values)


def scenarios(h):
    def case(name, actions, kind, **proof):
        expected = dict(seed=1, random_calls=0, draw_count=1,
                        diagnostics=[], link_counts={72: 1})
        expected.update(proof)
        return h.spec(name, actions, portal_case=kind, portal=expected)

    def pair(angles=(0, 90, 0), **camera_fields):
        fields = dict(targetname='cam', origin=_coords(CAMERA_ORIGIN),
                      angles=_coords(angles))
        fields.update(camera_fields)
        return h.fixture(h.row('misc_portal_surface', target='cam', origin=_coords(SURFACE_ORIGIN)),
                         h.row('misc_portal_camera', **fields))

    def located(owner=73, direction=32, frame=0, rotation=1, client_num=0,
                nextthink=1100, origin=CAMERA_ORIGIN):
        return dict(active=1, owner=owner, e_type=6, sv_flags=64, frame=frame,
                    powerups=rotation, client_num=client_num, event_parm=direction,
                    origin2=origin, nextthink=nextthink, callbacks=[1, 0, 0])

    rolls = [
        ('default', None, 0), ('zero', '0', 0), ('quarter_turn', '90', 64),
        ('full_turn', '360', 256), ('negative_turn', '-360', -256),
        ('one_unit', '1.40625', 1), ('negative_unit', '-1.40625', -1),
        ('below_one_unit', '1.4062499', 0), ('above_negative_unit', '-1.4062499', 0),
        ('half_unit', '0.703125', 0), ('negative_half_unit', '-0.703125', 0),
        ('double_intermediate', '16777216', 11930464),
        ('spawnfloat_rounding', '16777217', 11930464),
        ('largest_positive', '3019898624', 2147483465),
        ('int_min', '-3019898880', -2147483648),
        ('negative_large', '-3019898624', -2147483465),
        ('negative_double', '-16777216', -11930464),
        ('numeric_prefix', '90junk', 64),
    ]
    for label, roll, number in rolls:
        fields = dict(origin=_coords(CAMERA_ORIGIN), angles='15 25 35')
        if roll is not None:
            fields['roll'] = roll
        yield case('camera_roll_' + label, h.fixture(h.row('misc_portal_camera', **fields)), 'roll',
                   entities={72: dict(client_num=number, e_type=0, sv_flags=0,
                                     origin=CAMERA_ORIGIN, current_origin=CAMERA_ORIGIN,
                                     tr_base=CAMERA_ORIGIN, angles=[15, 25, 35],
                                     mins=ZERO, maxs=ZERO, callbacks=[0, 0, 0])},
                   link_probes=[dict(slot=72, fields=dict(client_num=0, e_type=0, sv_flags=0,
                                                         mins=ZERO, maxs=ZERO))])

    yield case('portal_surface_mirror_origin',
               h.fixture(h.row('misc_portal_surface', origin=_coords(SURFACE_ORIGIN))), 'mirror',
               entities={72: dict(origin=SURFACE_ORIGIN, origin2=SURFACE_ORIGIN,
                                 e_type=6, sv_flags=64, nextthink=0, callbacks=[0, 0, 0])},
               link_probes=[dict(slot=72, fields=dict(e_type=0, sv_flags=0, origin2=ZERO,
                                                     mins=ZERO, maxs=ZERO, callbacks=[0, 0, 0]))])
    actions = h.fixture(h.row('misc_portal_surface', target='cam', origin=_coords(SURFACE_ORIGIN)))
    actions += [h.txt(72, 1, None), h.scalar(72, 15, 1777), h.scalar(72, 8, 3), h.scalar(72, 9, 33),
                h.vec(72, 5, [-3, -4, -5]), h.vec(72, 6, [6, 7, 8]), h.vec(72, 7, [9, 8, 7]),
                h.vec(72, 2, [-10, 20, 30]), h.vec(72, 8, [50, 60, 70]), h.direct(72, 5)]
    yield case('portal_surface_mirror_preserves_think_and_origin_storage', actions, 'mirror_reentry',
               link_counts={72: 2},
               entities={72: dict(origin2=SURFACE_ORIGIN, e_type=6, sv_flags=64, nextthink=1777,
                                 callbacks=[1, 0, 0], current_origin=[-10, 20, 30], tr_base=[50, 60, 70])},
               link_probes=[dict(slot=72, fields=dict(e_type=3, sv_flags=33, origin2=[9, 8, 7],
                                                     mins=ZERO, maxs=ZERO, nextthink=1777, callbacks=[1, 0, 0]))])
    yield case('portal_surface_target_defers_camera',
               h.fixture(h.row('misc_portal_surface', target='cam', origin=_coords(SURFACE_ORIGIN))), 'deferred',
               entities={72: dict(e_type=6, sv_flags=64, origin2=ZERO, nextthink=1100, callbacks=[1, 0, 0])},
               link_probes=[dict(slot=72, fields=dict(e_type=0, sv_flags=0, nextthink=0, callbacks=[0, 0, 0]))])
    actions = h.fixture(h.row('misc_portal_surface', target=''),
                        h.row('misc_portal_camera', targetname='', origin=_coords(CAMERA_ORIGIN), angles='0 90 0'))
    actions += [h.action(11, 1100), h.direct(72, 8)]
    yield case('portal_surface_empty_target_finds_empty_name', actions, 'empty_target', random_calls=1,
               diagnostics=[NULL_TARGET], entities={72: located(nextthink=0), 73: dict(angles=ZERO)})

    actions = h.fixture(h.row('misc_portal_camera', roll='90', origin=_coords(CAMERA_ORIGIN)))
    actions += [h.scalar(72, 6, 999), h.scalar(72, 8, 3), h.scalar(72, 9, 33),
                h.vec(72, 5, [-1, -2, -3]), h.vec(72, 6, [4, 5, 6]),
                h.vec(72, 2, [-10, 20, 30]), h.vec(72, 8, [50, 60, 70]),
                # The final map-parser EOF clears the previous spawn variables.
                h.action(29, first='{ "roll" "90" }'), h.direct(72, 6)]
    yield case('camera_link_precedes_roll_and_preserves_origin_storage', actions, 'camera_link',
               link_counts={72: 2}, spawnvars=[['roll', '90']],
               entities={72: dict(client_num=64, e_type=3, sv_flags=33, origin=CAMERA_ORIGIN,
                                 current_origin=[-10, 20, 30], tr_base=[50, 60, 70], mins=ZERO, maxs=ZERO)},
               link_probes=[dict(slot=72, fields=dict(client_num=999, e_type=3, sv_flags=33,
                                                     current_origin=[-10, 20, 30], tr_base=[50, 60, 70],
                                                     mins=ZERO, maxs=ZERO))])

    for label, target, never_free in [('missing_name', 'missing', False), ('null_name', None, False),
                                       ('empty_name', '', False), ('neverfree', 'missing', True)]:
        fields = {} if target is None else dict(target=target)
        actions = h.fixture(h.row('misc_portal_surface', **fields))
        if never_free:
            actions.append(h.scalar(72, 20, 1))
        actions.append(h.direct(72, 7))
        first = NULL_TARGET if target is None else 'G_PickTarget: target ' + target + ' not found\n'
        diagnostics = [first, MISSING_OWNER]
        yield case('portal_missing_owner_' + label, actions, 'missing_owner', diagnostics=diagnostics,
                   entities={72: dict(active=int(never_free), linked=0,
                                     classname='misc_portal_surface' if never_free else 'freed')},
                   print_probes=[dict(index=index, entities={72: dict(active=1, linked=1,
                                                                       classname='misc_portal_surface')})
                                 for index in range(2)],
                   flow=[['print', first], ['print', MISSING_OWNER], ['unlink', 72]])

    for flags in range(8):
        actions = pair(spawnflags=flags, roll='90')
        actions += [h.scalar(72, 5, 123), h.scalar(72, 7, 99), h.direct(72, 7)]
        frame = 25 if flags & 1 else 75 if flags & 2 else 123
        yield case('portal_camera_spawnflags_' + str(flags), actions, 'flags', random_calls=1,
                   diagnostics=[NULL_TARGET],
                   entities={72: located(frame=frame, rotation=0 if flags & 4 else 1, client_num=64),
                             73: dict(angles=ZERO, client_num=64)})

    fallbacks = [('sentinel_up', [0, -1, 0], 5), ('sentinel_down', [0, -2, 0], 84),
                 ('yaw_90', [0, 90, 0], 32), ('yaw_180', [0, 180, 0], 143),
                 ('pitch_up', [-90, 0, 0], 5), ('roll_keeps_forward', [0, 90, 120], 32)]
    for label, angles, direction in fallbacks:
        actions = pair(angles) + [h.vec(73, 9, [7, 8, 9]), h.direct(72, 7)]
        yield case('portal_fallback_' + label, actions, 'fallback', random_calls=1,
                   diagnostics=[NULL_TARGET],
                   entities={72: located(direction=direction), 73: dict(angles=ZERO, movedir=[7, 8, 9])})
    yield case('portal_fallback_missing_camera_target', pair([0, -2, 0], target='absent-aim') + [h.direct(72, 7)],
               'fallback_missing', random_calls=1, diagnostics=['G_PickTarget: target absent-aim not found\n'],
               entities={72: located(direction=84), 73: dict(angles=ZERO)})
    for label, angles, first_direction in [('up', [0, -1, 0], 5), ('yaw_90', [0, 90, 0], 32)]:
        yield case('portal_fallback_repeated_' + label, pair(angles) + [h.direct(72, 7), h.direct(72, 7)],
                   'fallback_repeat', random_calls=2, diagnostics=[NULL_TARGET, NULL_TARGET],
                   entities={72: located(direction=52), 73: dict(angles=ZERO)},
                   print_probes=[dict(index=0, entities={73: dict(angles=angles)}),
                                 dict(index=1, entities={72: dict(event_parm=first_direction), 73: dict(angles=ZERO)})])

    axes = [([32, 0, 0], 52), ([-32, 0, 0], 143), ([0, 32, 0], 32),
            ([0, -32, 0], 104), ([0, 0, 32], 5), ([0, 0, -32], 84)]
    for index, (delta, direction) in enumerate(axes + [(ZERO, 0)]):
        aim = [CAMERA_ORIGIN[axis] + delta[axis] for axis in range(3)]
        actions = h.fixture(h.row('misc_portal_surface', target='cam'),
                            h.row('misc_portal_camera', targetname='cam', target='aim', origin=_coords(CAMERA_ORIGIN), angles='15 25 35'),
                            h.row('info_notnull', targetname='aim', origin=_coords(aim)))
        actions += [h.vec(73, 2, [-500, 700, 900]), h.vec(74, 2, [900, -700, -500]), h.direct(72, 7)]
        yield case('portal_aim_axis_' + str(index) if index < 6 else 'portal_aim_coincident_origins', actions, 'aim',
                   random_calls=2, entities={72: located(direction=direction), 73: dict(angles=[15, 25, 35])})
    actions = h.fixture(h.row('misc_portal_surface', target='cam'),
                        h.row('misc_portal_camera', targetname='cam', target='', origin='0 0 96', angles='15 25 35'),
                        h.row('info_notnull', targetname='', origin='0 32 96')) + [h.direct(72, 7)]
    yield case('portal_aim_empty_name_is_a_real_target', actions, 'aim_empty', random_calls=2,
               entities={72: located(direction=32, origin=[0, 0, 96]), 73: dict(angles=[15, 25, 35])})

    actions = h.fixture(h.row('misc_portal_surface', target='self', targetname='self', origin=_coords(SURFACE_ORIGIN),
                            angles='0 90 0', spawnflags=3)) + [h.scalar(72, 6, 17), h.direct(72, 7)]
    yield case('portal_owner_and_aim_are_surface', actions, 'entity_alias', random_calls=2,
               entities={72: dict(located(owner=72, direction=0, frame=25, client_num=17, origin=SURFACE_ORIGIN), angles=[0, 90, 0])})
    actions = h.fixture(h.row('misc_portal_surface', target='cam', targetname='surface', origin='-32 0 96'),
                        h.row('misc_portal_camera', targetname='cam', target='surface', origin='0 0 96', angles='15 25 35'))
    yield case('portal_camera_aims_at_surface', actions + [h.direct(72, 7)], 'entity_alias', random_calls=2,
               entities={72: located(direction=143, origin=[0, 0, 96]), 73: dict(angles=[15, 25, 35])})
    yield case('portal_camera_aims_at_itself', pair([15, 25, 35], target='cam') + [h.direct(72, 7)],
               'entity_alias', random_calls=2,
               entities={72: located(direction=0), 73: dict(angles=[15, 25, 35])})
    actions = h.fixture(h.row('misc_portal_surface', target='cam'),
                        h.row('info_notnull', targetname='cam', origin=_coords(CAMERA_ORIGIN), angles='0 90 0'))
    actions += [h.scalar(73, 6, -19), h.direct(72, 7)]
    yield case('portal_owner_need_not_be_camera_class', actions, 'owner_class', random_calls=1,
               diagnostics=[NULL_TARGET],
               entities={72: located(client_num=-19), 73: dict(classname='info_notnull', angles=ZERO)})

    for label, count, seed in [('single', 1, 1), ('cap_33', 33, 1), ('cap_40', 40, 0)]:
        rows = [h.row('misc_portal_surface', target='CaM')]
        rows += [h.row('misc_portal_camera', targetname='cam' if index % 2 else 'CAM',
                       origin=_coords([index * 10, 0, 96]), angles='0 90 0', roll=str(index * 1.40625))
                 for index in range(count)]
        choice = _rand_values(seed, 1)[0] % min(count, 32)
        actions = h.fixture(*rows, seed=seed) + [h.direct(72, 7), h.action(6), h.action(6)]
        yield case('portal_random_owner_' + label, actions, 'random_cap', seed=seed, random_calls=1, draw_count=3,
                   diagnostics=[NULL_TARGET], eligible_count=count, cap=32,
                   entities={72: located(owner=73 + choice, direction=32, client_num=choice, origin=[choice * 10, 0, 96]),
                             73 + choice: dict(angles=ZERO)})
    seed = 1
    rows = [h.row('misc_portal_surface', target='cam'),
            h.row('misc_portal_camera', targetname='cam', target='AiM', origin=_coords(CAMERA_ORIGIN), angles='15 25 35')]
    for index in range(35):
        delta = axes[index % 6][0]
        origin = [CAMERA_ORIGIN[axis] + delta[axis] for axis in range(3)]
        rows.append(h.row('info_notnull', targetname='aim' if index % 2 else 'AIM', origin=_coords(origin)))
    choice = 2 + _rand_values(seed, 2)[1] % 32
    actions = h.fixture(*rows, seed=seed) + [h.scalar(74, 11, 0), h.scalar(75, 11, 0), h.direct(72, 7), h.action(6), h.action(6)]
    yield case('portal_random_aim_cap_skips_inactive', actions, 'random_aim_cap', seed=seed, random_calls=2, draw_count=3,
               eligible_count=33, cap=32, expected_aim_slot=74 + choice,
               entities={72: located(direction=axes[choice % 6][1]), 73: dict(angles=[15, 25, 35]),
                         74: dict(active=0), 75: dict(active=0)})

    timings = [('before', 1099, 1100, False), ('exact', 1100, 1100, True), ('after', 1101, 1100, True),
               ('zero_disabled', 2000, 0, False), ('negative_disabled', 2000, -1, False),
               ('float_rounds_deadline', 16777216, 16777217, True)]
    for label, time, deadline, fired in timings:
        actions = pair() + [h.scalar(72, 15, deadline), h.action(11, time), h.direct(72, 8)]
        surface = located(nextthink=0) if fired else dict(owner=1023, nextthink=deadline, event_parm=0, callbacks=[1, 0, 0])
        proof = dict(random_calls=int(fired), diagnostics=[NULL_TARGET] if fired else [],
                     time=time, entities={72: surface, 73: dict(angles=ZERO if fired else [0, 90, 0])})
        if fired:
            proof['print_probes'] = [dict(index=0, entities={72: dict(nextthink=0, callbacks=[1, 0, 0])})]
        yield case('portal_think_' + label, actions, 'think_time', **proof)

    actions = h.fixture(h.row('misc_portal_surface', origin=_coords(SURFACE_ORIGIN)),
                        h.row('misc_portal_camera', targetname='cam'))
    actions += [h.vec(72, 7, [7, 8, 9]), h.mutate(7, 72, h.txt(72, 1, 'cam')), h.direct(72, 5)]
    yield case('portal_link_hook_changes_target_before_branch', actions, 'live_target', link_counts={72: 2}, mutation_consumed=True,
               entities={72: dict(target='cam', origin2=[7, 8, 9], nextthink=1100, callbacks=[1, 0, 0])},
               link_probes=[dict(slot=72, fields=dict(target=None, origin2=[7, 8, 9], nextthink=0, callbacks=[0, 0, 0]))])
    actions = h.fixture(h.row('misc_portal_camera', roll='0'))
    actions += [h.scalar(72, 6, 99), h.mutate(7, 72, h.action(29, first='{ "roll" "135" }')), h.direct(72, 6)]
    yield case('camera_link_hook_changes_roll_before_read', actions, 'live_roll', link_counts={72: 2}, mutation_consumed=True,
               entities={72: dict(client_num=96)}, spawnvars=[['roll', '135']],
               link_probes=[dict(slot=72, fields=dict(client_num=99))])


_SCALARS = {
    'e_type': ('state', 1), 'client_num': ('state', 42), 'frame': ('state', 43),
    'event_parm': ('state', 46), 'powerups': ('state', 47),
    'nextthink': ('base', 11), 'sv_flags': ('base', 22), 'owner': ('base', 23), 'linked': ('base', 25),
}
_VECTORS = {
    'tr_base': ('state', 6), 'origin': ('state', 23), 'origin2': ('state', 26), 'angles': ('state', 29),
    'mins': ('base', 27), 'maxs': ('base', 30), 'current_origin': ('base', 33), 'movedir': ('tail', 0),
}


def validate(scenario, parsed):
    expected = scenario.get('expected', {})
    if 'portal_case' not in expected:
        return {}
    name = scenario['name']
    proof = expected['portal']
    checked = 0

    def equal(got, wanted, label):
        nonlocal checked
        assert got == wanted, (name, label, got, wanted)
        checked += 1

    def fields(snapshot, slot, wanted):
        entity = snapshot['entities'][slot]
        for field, value in wanted.items():
            if field in _SCALARS:
                section, index = _SCALARS[field]
                got = entity[section][index]
            elif field in _VECTORS:
                section, index = _VECTORS[field]
                got = tuple(entity[section][index:index + 3])
                value = tuple(_bits(part) for part in value)
            elif field == 'callbacks':
                got = tuple(snapshot['callbacks'][slot])
                value = tuple(value)
            else:
                got = entity[field]
            equal(got, value, 'entity ' + str(slot) + ' ' + field)

    equal(scenario['domain'], 'defined', 'native domain')
    draws = _rand_values(proof['seed'], proof['random_calls'] + proof['draw_count'])
    equal(parsed['draws'], draws[proof['random_calls']:], 'CRT draws after portal calls')
    diagnostics = [effect for effect in parsed['effects'] if effect[0] == 1 and effect[4] is not None and
                   (effect[4].startswith(b'G_PickTarget') or effect[4] == MISSING_OWNER.encode('utf-8'))]
    texts = [effect[4].decode('utf-8') for effect in diagnostics]
    equal(texts, proof['diagnostics'], 'ordered portal diagnostics')
    for slot, wanted in proof.get('entities', {}).items():
        fields(parsed['last'], slot, wanted)
    for slot, count in proof['link_counts'].items():
        equal(sum(effect[0] == 7 and effect[1] == slot for effect in parsed['effects']), count, 'link calls ' + str(slot))
    for probe in proof.get('link_probes', []):
        links = [effect for effect in parsed['effects'] if effect[0] == 7 and effect[1] == probe['slot']]
        fields(links[probe.get('index', -1)][5], probe['slot'], probe['fields'])
    for probe in proof.get('print_probes', []):
        snapshot = diagnostics[probe['index']][5]
        for slot, wanted in probe['entities'].items():
            fields(snapshot, slot, wanted)
    if 'flow' in proof:
        flow = []
        for effect in parsed['effects']:
            if effect[0] == 1 and effect[4] is not None and (effect[4].startswith(b'G_PickTarget') or effect[4] == MISSING_OWNER.encode('utf-8')):
                flow.append(['print', effect[4].decode('utf-8')])
            elif effect[0] == 8 and effect[1] == 72:
                flow.append(['unlink', 72])
        equal(flow, proof['flow'], 'diagnostics precede unlink/free')
    if 'time' in proof:
        equal(parsed['last']['head'][2], proof['time'], 'current level time')
    if proof.get('mutation_consumed'):
        equal(parsed['last']['mutation'][2], 0, 'one-shot hook consumed')
    if 'spawnvars' in proof:
        equal([list(row) for row in parsed['last']['spawnvars']], proof['spawnvars'], 'live roll spawn variables')
    return dict(portal_case=expected['portal_case'], assertion_count=checked,
                crt_seed=proof['seed'], random_calls_before_draws=proof['random_calls'], verified_draws=parsed['draws'],
                ordered_portal_diagnostics=texts, checked_entities=proof.get('entities', {}),
                checked_link_boundaries=proof.get('link_probes', []), checked_print_boundaries=proof.get('print_probes', []),
                eligible_count=proof.get('eligible_count'), selection_cap=proof.get('cap'),
                expected_aim_slot=proof.get('expected_aim_slot'))
