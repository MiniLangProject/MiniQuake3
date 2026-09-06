"""Independent target fixtures and semantic assertions for test_map_objects.

The fixture builds real map items and invokes the unchanged game algorithms.
Indices below are the pinned native playerState/entityState snapshot layout.
"""
import hashlib
import struct

PS_HEALTH = 46
PS_HOLDABLE = 47
PS_WEAPONS = 48
PS_ARMOR = 49
PS_SCORE = 62
PS_POWERUPS = 78
PS_AMMO = 94
ITEM_PICKUP = 19
SCORE_PLUM = 13 + 65


def _bits(value):
    return struct.unpack('<i', struct.pack('<f', value))[0]


def _fixture(h, *rows, gametype=0, maximum=4, dedicated=False):
    result = h.fixture(*rows, gametype=gametype, maximum=maximum)
    settings = [h.action(3, 1, first='fraglimit', second='0')]
    if dedicated:
        settings.append(h.action(3, 1, first='dedicated', second='1'))
    return result[:-1] + settings + result[-1:]


def _case(h, name, actions, kind, domain='defined', **expected):
    return h.spec('target_' + name, actions, domain=domain,
                  target_case=kind, **expected)


def _powerups(h, slot=0, flags=0):
    values = [170 + i for i in range(16)]
    values[7:10] = [1007 if flags & 1 else 0,
                    1008 if flags & 2 else 0,
                    1009 if flags & 4 else 0]
    return values, [h.action(25, slot, i, value)
                    for i, value in enumerate(values)]


def _give(h, *items, target='supply', health=50, dedicated=True):
    rows = [h.row('target_give', target=target)]
    rows += [h.row(name, targetname='supply', spawnflags=1)
             for name in items]
    actions = _fixture(h, *rows, dedicated=dedicated) + h.player(health=health)
    actions += [h.direct(73 + index, 10) for index in range(len(items))]
    return actions


def _given(**expected):
    result = dict(unlinks=[73], item_sequence=[[7, 73], [8, 73]],
                  entity_words=[[73, 'base', 11, 0],
                                [73, 'base', 25, 0]],
                  hidden_items=[73])
    result.update(expected)
    return result


def _score(h, count=5, gametype=0, team=0, initial=10):
    return (_fixture(h, h.row('target_score', count=count,
                              origin='4.75 -8.25 9.5'), gametype=gametype)
            + h.player(team=team) + [h.client(0, 4, initial)])


def _print(h, flags=0, message='Center', maximum=4):
    return (_fixture(h, h.row('target_print', spawnflags=flags,
                              message=message), maximum=maximum)
            + h.player(0, team=1) + h.player(1, team=2))


def scenarios(h):
    """Yield bounded deterministic cases; no compilation or execution here."""
    # Twelve real pickup families, including predicted and external events.
    pickups = [
        ('health_small', 'item_health_small', PS_HEALTH, 55),
        ('health', 'item_health', PS_HEALTH, 75),
        ('health_large', 'item_health_large', PS_HEALTH, 100),
        ('health_mega', 'item_health_mega', PS_HEALTH, 150),
        ('armor_shard', 'item_armor_shard', PS_ARMOR, 5),
        ('armor', 'item_armor_combat', PS_ARMOR, 50),
        ('armor_heavy', 'item_armor_body', PS_ARMOR, 100),
        ('ammo_bullets', 'ammo_bullets', PS_AMMO + 2, 50),
        ('ammo_rockets', 'ammo_rockets', PS_AMMO + 5, 5),
        ('weapon_shotgun', 'weapon_shotgun', PS_AMMO + 3, 10),
        ('holdable_medkit', 'holdable_medkit', PS_HOLDABLE, 27),
        ('powerup_quad', 'item_quad', PS_POWERUPS + 1, 31000),
    ]
    for index, (label, item, field, value) in enumerate(pickups):
        actions = _give(h, item) + [h.client(0, 7, index & 1), h.use()]
        extra = {}
        if item == 'weapon_shotgun':
            extra['ps_words_extra'] = [[0, PS_WEAPONS, 1 << 3]]
        yield _case(h, 'give_' + label, actions, 'give',
                    **_given(ps_words=[[0, field, value]],
                             item_logs=[f'Item: 0 {item}\n'], **extra))

    for label, item, health, setup, ps_expected in [
        ('full_ammo', 'ammo_bullets', 100,
         [h.action(26, 0, 2, 200)], [[0, PS_AMMO + 2, 200]]),
        ('full_health', 'item_health', 100, [], [[0, PS_HEALTH, 100]]),
        ('dead', 'item_health', 0, [], [[0, PS_HEALTH, 0]]),
    ]:
        actions = _give(h, item, health=health) + setup + [h.use()]
        yield _case(h, 'give_' + label, actions, 'give',
                    **_given(ps_words=ps_expected, item_logs=[],
                             item_sequence=[[8, 73]]))

    actions = _give(h, 'item_health') + [h.scalar(0, 12, -1), h.use()]
    yield _case(h, 'give_nonclient', actions, 'give', unlinks=[], item_logs=[],
                entity_words=[[73, 'base', 11, 1200]], ps_words=[[0, PS_HEALTH, 50]])
    actions = _give(h, 'item_health') + [h.txt(72, 1, None), h.use()]
    yield _case(h, 'give_null_target', actions, 'give', unlinks=[], item_logs=[],
                entity_words=[[73, 'base', 11, 1200]], ps_words=[[0, PS_HEALTH, 50]])
    for label, target, targetname, succeeds in [
        ('empty_target', '', '', True),
        ('case_fold', 'SuPpLy', 'sUPPlY', True),
        ('absent_target', 'absent', 'supply', False),
    ]:
        actions = (_give(h, 'item_health') + [h.txt(72, 1, target),
                   h.txt(73, 2, targetname), h.use()])
        expected = (_given(ps_words=[[0, PS_HEALTH, 75]],
                           item_logs=['Item: 0 item_health\n']) if succeeds
                    else dict(unlinks=[], item_logs=[], ps_words=[[0, PS_HEALTH, 50]]))
        yield _case(h, 'give_' + label, actions, 'give', **expected)
    for label, change in [('inactive', h.scalar(73, 11, 0)),
                          ('null_item', h.scalar(73, 13, -1))]:
        actions = _give(h, 'item_health') + [change, h.use()]
        yield _case(h, 'give_' + label, actions, 'give', unlinks=[], item_logs=[],
                    ps_words=[[0, PS_HEALTH, 50]])
    actions = (_give(h, 'item_health', health=0)
               + [h.scalar(73, 13, 0), h.use()])
    yield _case(h, 'give_item_zero_dead', actions, 'give', unlinks=[73],
                item_logs=[], item_sequence=[[8, 73]],
                entity_words=[[73, 'base', 14, 0], [73, 'base', 11, 0]])
    actions = (_fixture(h, h.row('target_give', target='zero'))
               + h.player(1, health=0) + [h.scalar(0, 11, 1),
                 h.scalar(0, 13, 0), h.txt(0, 2, 'ZERO'), h.use(activator=1)])
    yield _case(h, 'give_search_slot_zero', actions, 'give', unlinks=[0],
                item_logs=[], item_sequence=[[8, 0]],
                entity_words=[[0, 'base', 14, 0], [0, 'base', 11, 0]])
    actions = (_give(h, 'item_health') + [h.scalar(73, 17, _bits(-1)), h.use()])
    yield _case(h, 'give_wait_minus_one', actions, 'give',
                **_given(ps_words=[[0, PS_HEALTH, 75]],
                         item_logs=['Item: 0 item_health\n'],
                         item_sequence=[[8, 73]],
                         entity_words=[[73, 'base', 4, 1],
                                       [73, 'base', 11, 0], [73, 'base', 25, 0]]))
    actions = (_give(h, 'ammo_bullets') + [h.scalar(73, 16, 0x1000), h.use()])
    yield _case(h, 'give_dropped_item', actions, 'give',
                **_given(ps_words=[[0, PS_AMMO + 2, 50]],
                         item_logs=['Item: 0 ammo_bullets\n'],
                         entity_words=[[73, 'base', 3, 1], [73, 'base', 11, 0]]))
    for label, operation, second_name, second_active, both in [
        ('live_target', h.txt(72, 1, 'second'), 'second', 1, True),
        ('live_null_target', h.txt(72, 1, None), 'supply', 1, False),
        ('live_activation', h.scalar(74, 11, 1), 'supply', 0, True),
        ('source_inactive_continues', h.scalar(72, 11, 0), 'supply', 1, True),
    ]:
        actions = (_give(h, 'ammo_bullets', 'ammo_bullets')
                   + [h.txt(74, 2, second_name), h.scalar(74, 11, second_active),
                      h.mutate(8, 73, operation), h.use()])
        slots = [73, 74] if both else [73]
        yield _case(h, 'give_' + label, actions, 'give', mutation_consumed=True,
                    unlinks=slots, item_logs=['Item: 0 ammo_bullets\n'] * len(slots),
                    item_sequence=[[kind, slot] for slot in slots for kind in (7, 8)],
                    ps_words=[[0, PS_AMMO + 2, 50 * len(slots)]])
    rows = [h.row('target_give', target='supply'),
            h.row('item_health_small', targetname='supply', target='award', spawnflags=1),
            h.row('target_score', targetname='award', count=3)]
    actions = (_fixture(h, *rows, dedicated=True) + h.player(health=50)
               + [h.direct(73, 10), h.use()])
    yield _case(h, 'give_real_target_chain', actions, 'give',
                **_given(ps_words=[[0, PS_HEALTH, 55], [0, PS_SCORE, 3]],
                         item_logs=['Item: 0 item_health_small\n'],
                         plums=[[3, [0, 0, 0], 0]],
                         score_before_item_unlink=True))
    actions = _give(h, 'item_health_small') + [h.use(), h.use()]
    yield _case(h, 'give_repeat_hidden_item', actions, 'give', unlinks=[73, 73],
                ps_words=[[0, PS_HEALTH, 60]], item_logs=['Item: 0 item_health_small\n'] * 2,
                item_sequence=[[7, 73], [8, 73], [7, 73], [8, 73]])

    # Real Team_ReturnFlag: priority, missing bases, dropped entities and the
    # client pointer reloaded only after all return effects have completed.
    flag_rows = [h.row('target_remove_powerups'),
                 h.row('team_CTF_redflag', spawnflags=1, targetname='redbase'),
                 h.row('team_CTF_blueflag', spawnflags=1, targetname='bluebase')]
    for mask in range(8):
        values, setup = _powerups(h, flags=mask)
        actions = (_fixture(h, *flag_rows, gametype=4) + h.player(team=1)
                   + [h.direct(73, 10), h.direct(74, 10)] + setup + [h.use()])
        team = 1 if mask & 1 else (2 if mask & 2 else (0 if mask & 4 else None))
        yield _case(h, 'remove_priority_' + str(mask), actions, 'remove',
                    powerups={0: [0] * 16}, returned_team=team,
                    before_return_powerups=values if team is not None else None,
                    warning_count=int(team == 0), return_sound_count=int(team in (1, 2)))
    for team, mask in [(1, 1), (2, 2), (0, 4)]:
        values, setup = _powerups(h, flags=mask)
        actions = (_fixture(h, h.row('target_remove_powerups'), gametype=4)
                   + h.player(team=1) + setup + [h.action(32, team, 1), h.use()])
        yield _case(h, 'remove_missing_base_' + str(team), actions, 'remove',
                    powerups={0: [0] * 16}, returned_team=team,
                    before_return_powerups=values, warning_count=1,
                    return_sound_count=0, return_warning_order=True)
    for label, team, bases, drops in [('red_dropped_only', 1, False, 1),
                                      ('red_base_two_drops', 1, True, 2),
                                      ('blue_base_drop', 2, True, 1)]:
        name = 'team_CTF_redflag' if team == 1 else 'team_CTF_blueflag'
        rows = [h.row('target_remove_powerups')]
        if bases:
            rows.append(h.row(name, spawnflags=1, targetname='base'))
        rows += [h.row(name, spawnflags=1, targetname='drop' + str(i)) for i in range(drops)]
        values, setup = _powerups(h, flags=team)
        actions = _fixture(h, *rows, gametype=4) + h.player(team=1)
        actions += [h.direct(slot, 10) for slot in range(73, 72 + len(rows))]
        dropped = list(range(73 + int(bases), 73 + int(bases) + drops))
        actions += [h.scalar(slot, 16, 0x1000) for slot in dropped]
        actions += setup + [h.action(32, team, 4), h.use()]
        # ReturnFlagSound's G_Spawn immediately reuses the first freed drop
        # when a surviving base supplies a return-sound origin.
        freed = dropped[1:] if bases else dropped
        reused = [[dropped[0], 'classname', 'tempEntity']] if bases else []
        yield _case(h, 'remove_' + label, actions, 'remove',
                    powerups={0: [0] * 16}, returned_team=team,
                    before_return_powerups=values, warning_count=int(not bases),
                    return_sound_count=int(bases), freed_items=freed, unlinks=dropped,
                    entity_values=reused)
    values, setup = _powerups(h, flags=7)
    actions = (_fixture(h, h.row('target_remove_powerups'))
               + h.player() + setup + [h.use(activator=72)])
    yield _case(h, 'remove_nonclient', actions, 'remove',
                powerups={0: values}, returned_team=None, warning_count=0, return_sound_count=0)
    values, setup = _powerups(h, flags=0)
    actions = (_fixture(h, h.row('target_remove_powerups'))
               + h.player(health=0) + setup + [h.use()])
    yield _case(h, 'remove_dead_client', actions, 'remove',
                powerups={0: [0] * 16}, returned_team=None, warning_count=0,
                return_sound_count=0, ps_words=[[0, PS_HEALTH, 0]])
    values, setup = _powerups(h, flags=1)
    other_values, other_setup = _powerups(h, slot=1, flags=2)
    actions = (_fixture(h, *flag_rows, gametype=4) + h.player(0, team=1)
               + h.player(1, team=2) + [h.direct(73, 10), h.direct(74, 10)]
               + setup + other_setup + [h.mutate(20, -1, h.scalar(0, 12, 1)), h.use()])
    yield _case(h, 'remove_client_rebind', actions, 'remove',
                powerups={0: values, 1: [0] * 16}, returned_team=1,
                before_return_powerups=values, warning_count=0, return_sound_count=1,
                mutation_consumed=True, entity_values=[[0, 'client', 1]])
    for label, event, arg, rows in [
        ('config_before_clear', 5, 23, flag_rows),
        ('warning_before_clear', 1, 0, [h.row('target_remove_powerups')]),
    ]:
        values, setup = _powerups(h, flags=1)
        actions = _fixture(h, *rows, gametype=4) + h.player(team=1)
        actions += [h.direct(slot, 10) for slot in range(73, 72 + len(rows))]
        actions += setup + [h.action(32, 1, 1),
                            h.mutate(event, arg, h.action(25, 0, 15, 901)), h.use()]
        before = values.copy(); before[15] = 901
        yield _case(h, 'remove_' + label, actions, 'remove',
                    powerups={0: [0] * 16}, returned_team=1,
                    before_return_powerups=before, warning_count=int(len(rows) == 1),
                    return_sound_count=int(len(rows) > 1), mutation_consumed=True)
    values, setup = _powerups(h, flags=1)
    actions = (_fixture(h, *flag_rows, gametype=0) + h.player(team=1)
               + [h.direct(73, 10), h.direct(74, 10)] + setup
               + [h.action(32, 1, 1), h.use()])
    yield _case(h, 'remove_nonctf_status', actions, 'remove',
                powerups={0: [0] * 16}, returned_team=1,
                before_return_powerups=values, warning_count=0, return_sound_count=1,
                config_values=[[23, '0']])

    # AddScore and ScorePlum, retaining real rank/configstring processing.
    for count in (-17, 0, 1, 20):
        gain = count or 1
        yield _case(h, 'score_spawn_count_' + str(count), _score(h, count) + [h.use()],
                    'score', ps_words=[[0, PS_SCORE, 10 + gain]],
                    entity_words=[[72, 'base', 13, gain]],
                    plums=[[gain, [4, -8, 9], 0]], plum_link_scores=[10])
    for warmup in (-1, 1, 1000):
        actions = _score(h, -5) + [h.action(27, 1, warmup), h.use()]
        yield _case(h, 'score_warmup_' + str(warmup), actions, 'score',
                    ps_words=[[0, PS_SCORE, 10]], plums=[], score_config_count=0)
    for gametype, team in [(0, 0), (2, 0), (3, 1), (3, 2), (4, 1), (4, 2)]:
        actions = _score(h, 5, gametype, team) + [h.use()]
        teamscores = [0] * 4
        if gametype == 3:
            teamscores[team] = 5
        yield _case(h, f'score_gametype_{gametype}_team_{team}', actions, 'score',
                    ps_words=[[0, PS_SCORE, 15]], team_scores=teamscores,
                    plums=[[5, [4, -8, 9], 0]], plum_link_scores=[10], score_config_count=2)
    yield _case(h, 'score_nonclient', _score(h) + [h.use(activator=72)], 'score',
                ps_words=[[0, PS_SCORE, 10]], plums=[], score_config_count=0)
    yield _case(h, 'score_use_zero', _score(h) + [h.scalar(72, 2, 0), h.use()], 'score',
                ps_words=[[0, PS_SCORE, 10]], plums=[[0, [4, -8, 9], 0]],
                score_config_count=2, plum_link_scores=[10])
    operations = [
        ('origin_alias', h.vec(72, 2, [10.9, -20.9, 30.5]), 6, 74,
         dict(ps_words=[[0, PS_SCORE, 15]], plums=[[5, [10, -20, 30], 0]], plum_link_scores=[10])),
        ('count_captured', h.scalar(72, 2, 99), 6, 74,
         dict(ps_words=[[0, PS_SCORE, 15]], entity_words=[[72, 'base', 13, 99]],
              plums=[[5, [4, -8, 9], 0]], plum_link_scores=[10])),
        ('score_live_after_link', h.client(0, 4, 40), 7, 73,
         dict(ps_words=[[0, PS_SCORE, 45]], plums=[[5, [4, -8, 9], 0]], plum_link_scores=[10])),
        ('gametype_live_after_link', h.action(27, 2, 3), 7, 73,
         dict(ps_words=[[0, PS_SCORE, 15]], team_scores=[0, 5, 0, 0],
              plums=[[5, [4, -8, 9], 0]], plum_link_scores=[10])),
    ]
    for label, operation, event, arg, expected in operations:
        actions = _score(h, team=1) + [h.mutate(event, arg, operation), h.use()]
        yield _case(h, 'score_' + label, actions, 'score', mutation_consumed=True, **expected)
    actions = _score(h, gametype=3, team=1) + [h.client(0, 3, 2), h.use()]
    yield _case(h, 'score_persistant_team', actions, 'score',
                ps_words=[[0, PS_SCORE, 15]], team_scores=[0, 0, 5, 0],
                plums=[[5, [4, -8, 9], 0]], plum_link_scores=[10])

    # At most one recipient per team in the strictly defined print cases.
    for flags in range(8):
        recipients = ([0] if flags & 4 else
                      ([0] if flags & 1 else []) + ([1] if flags & 2 else []))
        if not (flags & 7):
            recipients = [-1]
        yield _case(h, 'print_flags_' + str(flags), _print(h, flags) + [h.use()],
                    'print', messages=[[slot, 'cp "Center"'] for slot in recipients])
    for flags, recipients in [(4, [-1]), (7, [0, 1])]:
        yield _case(h, 'print_nonclient_flags_' + str(flags),
                    _print(h, flags) + [h.use(activator=72)], 'print',
                    messages=[[slot, 'cp "Center"'] for slot in recipients])
    for connection in (0, 1):
        actions = _print(h, 1) + [h.client(0, 1, connection), h.use()]
        yield _case(h, 'print_connection_' + str(connection), actions, 'print', messages=[])
    actions = (_fixture(h, h.row('target_print', spawnflags=1, message='Empty'), maximum=0)
               + [h.client(0, 1, 2), h.client(0, 2, 1), h.use()])
    yield _case(h, 'print_zero_client_limit', actions, 'print', messages=[],
                head_words=[[6, 0]], client_prefix_words=[[0, 17, 2], [0, 0, 1]])
    actions = (_fixture(h, h.row('target_print', spawnflags=1, message='Last'), maximum=64)
               + [h.client(63, 1, 2), h.client(63, 2, 1),
                  h.scalar(63, 12, -1), h.use()])
    yield _case(h, 'print_last_client_slot_without_entity_binding', actions, 'print',
                messages=[[63, 'cp "Last"']], head_words=[[6, 64]],
                client_prefix_words=[[63, 17, 2], [63, 0, 1]],
                entity_values=[[63, 'active', 0], [63, 'client', -1]])
    actions = _print(h, 4) + [h.scalar(1023, 12, 0), h.use(activator=1023)]
    yield _case(h, 'print_private_slot_1023', actions, 'print',
                messages=[[1023, 'cp "Center"']], entity_values=[[1023, 'client', 0]])
    texts = [('empty', ''), ('ascii_capacity', 'x' * 31994),
             ('utf8_capacity', '\u00e4' * 15997),
             ('literal_format', 'literal %s %n "quotes"\nnext\tline')]
    for label, message in texts:
        actions = _print(h, 0) + [h.txt(72, 3, message), h.use()]
        yield _case(h, 'print_' + label, actions, 'print', messages=[[-1, 'cp "' + message + '"']])
    actions = _print(h, 0) + [h.txt(72, 3, 'visible\0ignored'), h.use()]
    yield _case(h, 'print_c_string_terminator', actions, 'print',
                messages=[[-1, 'cp "visible"']],
                entity_values=[[72, 'message', 'visible']])
    hooks = [
        ('blue_message_live', h.txt(72, 3, 'Changed'), 4,
         [[0, 'cp "Center"'], [1, 'cp "Changed"']]),
        ('blue_flag_removed', h.scalar(72, 1, 1), 4, [[0, 'cp "Center"']]),
        ('blue_limit_shrinks', h.action(27, 3, 1), 4, [[0, 'cp "Center"']]),
        ('blue_limit_grows', h.action(27, 3, 2), 1,
         [[0, 'cp "Center"'], [1, 'cp "Center"']]),
    ]
    for label, operation, maximum, messages in hooks:
        actions = _print(h, 3, maximum=maximum) + [h.mutate(20, 0, operation), h.use()]
        yield _case(h, 'print_' + label, actions, 'print', messages=messages, mutation_consumed=True)
    for label, flags, slot in [('broadcast', 0, -1), ('private', 4, 0), ('team', 1, 0)]:
        actions = _print(h, flags) + [h.txt(72, 3, None), h.use()]
        yield _case(h, 'print_null_' + label, actions, 'print', domain='crt_null',
                    messages=[[slot, 'cp "(null)"']])
    for label, flags, teams in [('red', 1, [1, 1]), ('blue', 2, [2, 2]),
                                ('both', 3, [1, 1, 2, 2])]:
        actions = _fixture(h, h.row('target_print', spawnflags=flags, message='Overlap'))
        for slot, team in enumerate(teams):
            actions += h.player(slot, team=team)
        actions += [h.use()]
        yield _case(h, 'print_overlap_' + label, actions, 'print', domain='va_overlap',
                    profile_recipients=list(range(len(teams))))


def validate(scenario, parsed):
    """Assert independently derived outcomes, including host-time snapshots."""
    expected = scenario['expected']
    if 'target_case' not in expected:
        return {}
    name = scenario['name']; last = parsed['last']; effects = parsed['effects']
    assertions = []

    def check(condition, label, actual=None):
        assert condition, (name, label, actual)
        assertions.append(label)

    ps = lambda slot: last['clients'][slot][0]
    messages = [[event[1], event[4].decode('utf-8')] for event in effects if event[0] == 20]
    for index, value in expected.get('head_words', []):
        check(last['head'][index] == value, f'level_word_{index}', last['head'][index])
    for slot, index, value in expected.get('client_prefix_words', []):
        actual = last['clients'][slot][1][index]
        check(actual == value, f'client_{slot}_prefix_{index}', actual)
    for slot, field, value in expected.get('ps_words', []) + expected.get('ps_words_extra', []):
        check(ps(slot)[field] == value, f'player_{slot}_word_{field}', ps(slot)[field])
    for slot, values in expected.get('powerups', {}).items():
        actual = list(ps(int(slot))[PS_POWERUPS:PS_POWERUPS + 16])
        check(actual == values, f'powerups_{slot}_all_sixteen', actual)
    for slot, group, index, value in expected.get('entity_words', []):
        actual = last['entities'][slot][group][index]
        check(actual == value, f'entity_{slot}_{group}_{index}', actual)
    for slot, field, value in expected.get('entity_values', []):
        actual = last['entities'][slot][field]
        check(actual == value, f'entity_{slot}_{field}', actual)
    if 'messages' in expected:
        check(messages == expected['messages'], 'exact_server_messages', messages)
    if 'profile_recipients' in expected:
        check([row[0] for row in messages] == expected['profile_recipients'],
              'native_overlap_recipient_order', messages)
        check(messages[0][1] == 'cp "Overlap"', 'native_overlap_first_copy', messages[0])
    if 'item_logs' in expected:
        actual = [e[4].decode('utf-8') for e in effects if e[0] == 1 and e[4].startswith(b'Item: ')]
        check(actual == expected['item_logs'], 'actual_item_pickup_log_order', actual)
    if 'unlinks' in expected:
        actual = [e[1] for e in effects if e[0] == 8]
        check(actual == expected['unlinks'], 'actual_unlink_order', actual)
    if 'item_sequence' in expected:
        slots = {row[1] for row in expected['item_sequence']}
        actual = [[e[0], e[1]] for e in effects if e[0] in (7, 8) and e[1] in slots]
        check(actual == expected['item_sequence'], 'item_link_unlink_interleaving', actual)
        for event in effects:
            if event[0] == 8 and event[1] in slots:
                check(event[5]['entities'][event[1]]['base'][11] == 0,
                      f'nextthink_zero_before_unlink_{event[1]}')
    for slot in expected.get('hidden_items', []):
        ent = last['entities'][slot]
        check(ent['state'][2] & 128 != 0 and ent['base'][21] == 0,
              f'item_{slot}_hidden_and_nonsolid')
    if expected.get('mutation_consumed'):
        check(last['mutation'][2] == 0, 'post_delivery_mutation_consumed', last['mutation'])
    for slot in expected.get('freed_items', []):
        ent = last['entities'][slot]
        check(ent['active'] == 0 and ent['classname'] == 'freed' and ent['base'][14] == -1,
              f'flag_drop_{slot}_actually_freed', ent)
    if 'returned_team' in expected:
        team = expected['returned_team']
        wanted = [] if team is None else [[-1, 'print "' +
                 ('The flag has returned!\n' if team == 0 else
                  'The ' + ('RED' if team == 1 else 'BLUE') + ' flag has returned!\n') + '"']]
        check(messages == wanted, 'flag_return_exact_server_message', messages)
        returned = [e for e in effects if e[0] == 20]
        before = expected.get('before_return_powerups')
        if before is not None:
            actual = list(returned[-1][5]['clients'][0][0][PS_POWERUPS:PS_POWERUPS + 16])
            check(actual == before, 'powerups_preserved_until_return_delivery', actual)
        warnings = [i for i, e in enumerate(effects) if e[0] == 1 and
                    e[4] == b'Warning:  NULL passed to Team_ReturnFlagSound\n']
        check(len(warnings) == expected['warning_count'], 'missing_base_warning_count', warnings)
        if expected.get('return_warning_order'):
            delivery = next(i for i, e in enumerate(effects) if e[0] == 20)
            check(warnings[0] < delivery, 'missing_base_warning_before_return_message')
        sounds = [ent for ent in last['entities'].values()
                  if ent['active'] and ent['state'][1] == 13 + 47]
        check(len(sounds) == expected['return_sound_count'], 'actual_flag_return_sound_entities', len(sounds))
        for sound in sounds:
            check(sound['state'][46] == (2 if team == 2 else 3)
                  and sound['base'][22] & 32 != 0,
                  'flag_return_sound_team_and_broadcast')
    if 'team_scores' in expected:
        check(list(last['scores']) == expected['team_scores'], 'actual_team_scores', last['scores'])
    if 'plums' in expected:
        plums = [(slot, ent) for slot, ent in last['entities'].items()
                 if ent['active'] and ent['state'][1] == SCORE_PLUM]
        actual = [[ent['state'][21], [struct.unpack('<f', struct.pack('<i', word))[0]
                   for word in ent['state'][6:9]], ent['base'][24]] for _, ent in plums]
        check(actual == expected['plums'], 'actual_score_plum_fields', actual)
        for slot, ent in plums:
            check(ent['base'][22] & 256 != 0 and ent['state'][35] == ent['base'][24],
                  f'score_plum_{slot}_single_client_flags')
        if 'plum_link_scores' in expected:
            slots = {slot for slot, _ in plums}
            actual = [e[5]['clients'][0][0][PS_SCORE] for e in effects if e[0] == 7 and e[1] in slots]
            check(actual == expected['plum_link_scores'], 'score_before_plum_link', actual)
        if expected.get('score_before_item_unlink'):
            unlink = next(e for e in effects if e[0] == 8 and e[1] == 73)
            check(unlink[5]['clients'][0][0][PS_SCORE] == 3,
                  'pickup_target_chain_scores_before_item_unlink')
    if 'score_config_count' in expected:
        actual = len([e for e in effects if e[0] == 5 and e[1] in (6, 7)])
        check(actual == expected['score_config_count'], 'real_score_configstring_calls', actual)
    for index, value in expected.get('config_values', []):
        check(last['configs'][index] == value, f'configstring_{index}', last['configs'][index])
    check(last['callbacks'][72][1] == {'give': 1, 'remove': 2, 'score': 3, 'print': 4}[expected['target_case']],
          'actual_target_use_callback')
    return dict(kind=expected['target_case'], assertions=len(assertions), checks=assertions,
                server_message_bytes=[len(text.encode('utf-8')) for _, text in messages],
                server_message_sha256=[hashlib.sha256(text.encode('utf-8')).hexdigest() for _, text in messages])
