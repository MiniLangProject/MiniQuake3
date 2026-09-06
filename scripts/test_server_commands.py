"""Differential Baseq3 server console, administration and real IP/memory integration."""
import argparse
from dataclasses import dataclass, replace
import hashlib
import json
import re
import struct
import subprocess
import sys

from inventory import sha
from spawn_oracle import build
from test_bodies import map_bytes
from test_client_commands import Command, command, options
from test_client_info import info
from test_team_changes import Client, action, case as team_case
from test_votes import ints, text
from toolchain import ROOT, run


@dataclass(frozen=True)
class Console:
    argv: tuple[str, ...]
    time: int = 1000


def console(*argv, time=1000):
    return Console(argv, time)


def artifact_stem(name):
    slug = re.sub(r'[^a-zA-Z0-9_-]', '_', name)
    return slug + '--' + hashlib.sha256(name.encode('utf-8')).hexdigest()


def case(actions, **kwargs):
    data = team_case([], **kwargs)[:-4] + ints(len(actions))
    for step in actions:
        if isinstance(step, (Console, Command)):
            kind, slot = (60, 0) if isinstance(step, Console) else (40, step.slot)
            data += ints(kind, step.time, slot, len(step.argv))
            data += text(step.argv[0] if step.argv else '')
            for arg in step.argv[1:]:
                data += text(arg)
        else:
            kind, time, slot, p0, request = step
            data += ints(kind, time, slot, p0) + text(request)
    return data


def scenario(name, actions, *, expected=None, **kwargs):
    return name, case(actions, **kwargs), expected or {}


def lookup(value):
    return action(61, value)


def inspect_stream(data):
    """Read complete framed native output and independently prove selected paths."""
    offset = snapshots = 0
    clients, entities, effects = {}, {}, []
    results = {228: [], 229: [], 230: [], 231: []}
    allocation = debug = filter_count = filter_mode = 0
    filters, ban_bytes, engine_bans = [], b'', ''

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
            raise RuntimeError(f'Invalid server command proof string at {offset}')
        value = data[offset:offset + size]
        offset += size
        return value.decode('utf-8', 'replace')

    def strings(count):
        for _ in range(count):
            string()

    while offset < len(data):
        kind = words(1)[0]
        if kind == 220:
            snapshots += 1
            header = words(12)
            allocated = header[5]
            words(342)
            clients = {}
            for slot in range(64):
                ps, before = words(117), words(23)
                name = string()
                after = words(47)
                string()
                clients[slot] = dict(team=before[0], connected=before[17],
                                     spectator=before[18], target=before[19], name=name,
                                     health=ps[46], cooldown=after[45], score=ps[62])
            entities = {}
            for slot in range(allocated):
                state = words(54)
                classname = string()
                private = words(45)
                entities[slot] = dict(health=private[5], flags=private[6],
                                      type=state[1], inuse=bool(state[52]),
                                      client=state[53], classname=classname)
            strings(3)
            words(4); strings(1)
            words(11); strings(67)
            words(3); strings(2); words(4); strings(2); words(6)
            strings(79); words(1)
            for _ in range(allocated):
                string(); words(1)
            allocation, debug, filter_count = words(3)
            raw_filters = words(2048)
            filters = [[raw_filters[i] & 0xffffffff, raw_filters[i + 1] & 0xffffffff]
                       for i in range(0, filter_count * 2, 2)]
            ban_bytes = data[offset:offset + 256]
            words(64)
            filter_mode = words(1)[0]
            engine_bans = string()
        elif kind == 221:
            event_kind, arg = words(2)
            effects.append(dict(kind=event_kind, arg=arg, text=string(),
                                allocation=allocation, filter_count=filter_count,
                                engine_bans=engine_bans,
                                vm_bans=ban_bytes.split(b'\0', 1)[0].decode('utf-8', 'replace')))
        elif kind in results:
            results[kind].append(words(1)[0])
        else:
            raise RuntimeError(f'Unexpected server console proof record {kind} at {offset - 4}')
    return dict(snapshot_count=snapshots, ordered_effects=len(effects), effects=effects,
                handled=results[228], lookups=results[229], offsets=results[230], packets=results[231],
                allocation=allocation, debug=debug, filter_count=filter_count,
                filter_mode=filter_mode, filters=filters, engine_bans=engine_bans,
                vm_bans=ban_bytes.split(b'\0', 1)[0].decode('utf-8', 'replace'),
                raw_vm_hex=ban_bytes.hex(), clients=clients,
                entities={slot: ent for slot, ent in entities.items() if ent['inuse']})


def validate(name, proof, expected):
    for key, value in expected.items():
        if key == 'event_texts':
            found = [event['text'] for event in proof['effects']]
            for wanted in value:
                if wanted not in found:
                    raise RuntimeError(f'{name}: missing exact effect text {wanted!r}')
        elif key == 'event_absent':
            found = [event['text'] for event in proof['effects']]
            for unwanted in value:
                if unwanted in found:
                    raise RuntimeError(f'{name}: forbidden effect text {unwanted!r}')
        elif key == 'event_kinds':
            actual = [event['kind'] for event in proof['effects']]
            if actual != value:
                raise RuntimeError(f'{name}: effects {actual} != {value}')
        elif key == 'teams':
            for slot, team in value.items():
                if proof['clients'][slot]['team'] != team:
                    raise RuntimeError(f'{name}: player {slot} did not join team {team}')
        elif key == 'cooldowns':
            for slot, value in value.items():
                if proof['clients'][slot]['cooldown'] != value:
                    raise RuntimeError(f'{name}: unexpected player {slot} cooldown mutation')
        elif key == 'effect_allocations':
            actual = [event['allocation'] for event in proof['effects'] if event['kind'] == 15]
            if actual != value:
                raise RuntimeError(f'{name}: wrong allocation state at print {actual} != {value}')
        elif proof[key] != value:
            raise RuntimeError(f'{name}: semantic {key} {proof[key]!r} != {value!r}')


def scenarios():
    for dedicated in (0, 1, -1, 7):
        for index, argv in enumerate(((), ('unknown',), ('say',), ('SaY', 'hello', 'world'),
                                      ('unknown', 'two words', '', 'tail'),
                                      ('SAY', 'quote"\nnewline', 'Grüße'))):
            echo = ' '.join(argv[1:] if argv and argv[0].lower() == 'say' else argv)
            checks = dict(handled=[int(dedicated != 0)], event_kinds=[10] if dedicated else [])
            if dedicated:
                checks['event_texts'] = ['print "server: ' + echo + '"']
            yield scenario(f'console_fallback_{dedicated}_{index}',
                           [options(dedicated=dedicated), console(*argv)], expected=checks)
    for length in (1021, 1022, 1023, 1024, 2048):
        token = 'x' * length
        echo = token if length < 1023 else ''
        yield scenario(f'dedicated_concat_first_token_{length}',
                       [options(dedicated=1), console('say', token)],
                       expected=dict(handled=[1], event_texts=['print "server: ' + echo + '"']))
    for length in (1019, 1020, 1021, 1022):
        echo = 'a ' + ('x' * length if length < 1021 else '')
        yield scenario(f'dedicated_concat_separator_{length}',
                       [options(dedicated=1), console('say', 'a', 'x' * length)],
                       expected=dict(event_texts=['print "server: ' + echo + '"']))
    yield scenario('dedicated_concat_final_empty_1023',
                   [options(dedicated=1), console('say', 'x' * 1022, '')],
                   expected=dict(event_texts=['print "server: ' + 'x' * 1022 + ' "']))
    yield scenario('dedicated_argv0_truncation_does_not_hide_suffix',
                   [options(dedicated=1), console('say' + 'x' * 1021, 'tail')],
                   expected=dict(event_texts=['print "server: "']))
    yield scenario('dedicated_utf8_concat_byte_limit',
                   [options(dedicated=1), console('say', 'ä' * 511, 'x')],
                   expected=dict(event_texts=['print "server: ' + 'ä' * 511 + ' "']))
    for name, event in (('addbot', 22), ('botlist', 23), ('abort_podium', 24)):
        for argv in ((name,), (name.upper(), '', 'two words', 'Grüße', '"\n'),
                     (name, *map(str, range(63)))):
            encoded = ''.join(f'{len(arg.encode("utf-8"))}:{arg}' for arg in argv)
            yield scenario(f'bot_boundary_{name}_{len(argv)}', [console(*argv)],
                           expected=dict(handled=[1], event_kinds=[event], event_texts=[encoded]))
        yield scenario(f'known_{name}_wins_over_dedicated_chat',
                       [options(dedicated=1), console(name)],
                       expected=dict(handled=[1], event_kinds=[event]))
    yield scenario('listip_exec_now', [console('LiStIp', 'ignored')],
                   expected=dict(handled=[1], event_kinds=[17], event_texts=['g_banIPs\n']))

    for value, found in (('0', 0), ('1', 1), ('2', -1), ('4', -1), ('64', -1),
                         ('0001', 1), ('1tail', 1), ('0x1', 0), ('1.75', 1),
                         ('-1', -1), ('+1', -1), (' 1', -1), ('', -1),
                         ('Before', 0), ('bEfOrE', 0), ('Other', 1), ('missing', -1)):
        yield scenario('client_lookup_' + repr(value), [lookup(value)], expected=dict(lookups=[found]))
    for connected in (0, 1, 2):
        for value in ('0', 'Before'):
            yield scenario(f'lookup_connection_{connected}_{value}', [lookup(value)],
                           clients={0: Client(connected=connected)},
                           expected=dict(lookups=[0 if connected else -1]))
    for value, found in (('^1Ranger', 0), ('^1rANGER', 0), ('Ranger', -1),
                         ('^7Ranger', -1), (' RANGER ', -1)):
        yield scenario('lookup_color_exact_' + repr(value), [lookup(value)],
                       clients={0: Client(name='^1Ranger')}, expected=dict(lookups=[found]))
    yield scenario('lookup_duplicate_first_connecting', [lookup('SAME')],
                   clients={0: Client(name='same', connected=1), 1: Client(name='Same')},
                   expected=dict(lookups=[0]))
    yield scenario('lookup_duplicate_disconnected_skipped', [lookup('same')],
                   clients={0: Client(name='same', connected=0), 1: Client(name='Same')},
                   expected=dict(lookups=[1]))
    yield scenario('lookup_does_not_need_entity_binding', [lookup('0')],
                   clients={0: Client(bound=0, active=0)}, expected=dict(lookups=[0]))
    yield scenario('lookup_last_client_slot', [lookup('63'), lookup('Last')], maxclients=64,
                   clients={63: Client(name='Last')}, expected=dict(lookups=[63, 63]))
    yield scenario('lookup_zero_clients', [lookup('0'), lookup('Before')], maxclients=0,
                   expected=dict(lookups=[-1, -1]))
    yield scenario('lookup_unicode_is_ascii_only', [lookup('Grüße'), lookup('GRÜßE')],
                   clients={0: Client(name='Grüße')}, expected=dict(lookups=[0, -1]))
    yield scenario('lookup_missing_name_at_printf_limit', [lookup('n' * 996)],
                   expected=dict(lookups=[-1], event_texts=['User ' + 'n' * 996 + ' is not on the server\n']))

    for game in (0, 1, 2, 3, 4):
        for request in ('spectator', 'scoreboard', 'follow1', 'follow2', 'red', 'BLUE', 'auto', ''):
            checks = dict(handled=[1])
            if request in ('spectator', 'scoreboard', 'follow1', 'follow2'):
                checks['teams'] = {0: 3}
            elif game < 3:
                checks['teams'] = {0: 0}
            elif request == 'red':
                checks['teams'] = {0: 1}
            elif request == 'BLUE':
                checks['teams'] = {0: 2}
            yield scenario(f'forceteam_game_{game}_{request or "empty"}',
                           [console('forceteam', '0', request)], gametype=game,
                           clients={0: Client(team=3, spectator=1)}, expected=checks)
    for argv in (('forceteam',), ('forceteam', 'missing', 'red'), ('forceteam', '63', 'blue')):
        yield scenario('forceteam_bad_player_' + str(len(argv)) + '_' + (argv[1] if len(argv) > 1 else ''),
                       [console(*argv)], expected=dict(handled=[1], teams={0: 0}))
    yield scenario('forceteam_missing_team_defaults', [console('forceteam', 'Before')],
                   clients={0: Client(team=3, spectator=1)}, expected=dict(handled=[1], teams={0: 0}))
    yield scenario('forceteam_exact_color_name', [console('FoRcEtEaM', '^2nAmE', 'blue', 'ignored')],
                   gametype=3, clients={0: Client(name='^2Name', team=1)},
                   expected=dict(handled=[1], teams={0: 2}))
    yield scenario('forceteam_ignores_client_cooldown',
                   [console('forceteam', '0', 'spectator'), console('forceteam', '0', 'blue')],
                   gametype=3, clients={0: Client(team=1, cooldown=2147483647)},
                   expected=dict(handled=[1, 1], teams={0: 2}, cooldowns={0: 0}))
    yield scenario('forceteam_respects_balance', [console('forceteam', '0', 'red')],
                   gametype=3, balance=1, clients={0: Client(team=3), 1: Client(team=1), 2: Client(team=1)},
                   expected=dict(handled=[1], teams={0: 3}))
    yield scenario('forceteam_respects_capacity', [console('forceteam', '0', 'red')],
                   gametype=3, maxgame=1, nonspectators=1, clients={0: Client(team=3)},
                   expected=dict(handled=[1], teams={0: 3}))
    yield scenario('forceteam_real_death_flag_return_and_respawn', [console('forceteam', '0', 'blue')],
                   gametype=4, clients={0: Client(team=1, powers=1 << 8, flags=0)},
                   expected=dict(handled=[1], teams={0: 2}, event_texts=[
                       'Kill: 0 0 20: Before killed Before by MOD_SUICIDE\n',
                       'The BLUE flag has returned!\n', 'ClientBegin: 0\n']))
    yield scenario('forceteam_intermission_real_transition', [console('forceteam', '0', 'blue')],
                   gametype=3, intermission=900, clients={0: Client(team=1)},
                   expected=dict(handled=[1], teams={0: 2}))
    yield scenario('forceteam_last_slot_real_begin', [console('forceteam', '63', 'red')],
                   gametype=3, maxclients=64, clients={63: Client(team=3, spectator=1)},
                   expected=dict(handled=[1], teams={63: 1}))
    yield scenario('forceteam_connecting_player', [console('forceteam', '0', 'blue')],
                   gametype=3, clients={0: Client(connected=1, team=1)},
                   expected=dict(handled=[1], teams={0: 2}))
    yield scenario('forceteam_persistent_client_differs_bound',
                   [action(6, p0=1), console('forceteam', '0', 'blue')],
                   gametype=3, clients={0: Client(team=1), 1: Client(team=3)},
                   expected=dict(handled=[1], teams={0: 1, 1: 2}))
    yield scenario('forceteam_team_argument_truncation',
                   [console('forceteam', '0', 'spectator' + 'x' * 1100)],
                   gametype=3, clients={0: Client(team=3)}, expected=dict(handled=[1]))

    yield scenario('entitylist_original_types_and_null',
                   [*[action(62, 'type-' + str(kind), slot=82 + kind, p0=kind) for kind in range(12)],
                    action(62, '<null>', slot=94, p0=13), action(62, '', slot=95, p0=-7),
                    console('EnTiTyLiSt')], expected=dict(handled=[1], event_texts=[
                        'ET_GENERAL          ', 'ET_GRAPPLE          ', ' 13                 ', ' -7                 ']))
    yield scenario('entitylist_omits_entity_zero',
                   [action(62, 'SECRET-ENTITY-ZERO', slot=0, p0=2147483647), console('entitylist')],
                   expected=dict(handled=[1], event_absent=['SECRET-ENTITY-ZERO', '  0:']))
    yield scenario('entitylist_last_storage_slot',
                   [action(62, 'last-entity', slot=1023, p0=-2147483648), console('entitylist')],
                   expected=dict(handled=[1], event_texts=['1023:', '-2147483648                 ', 'last-entity']))
    yield scenario('entitylist_classname_preserves_newline_utf8',
                   [action(62, 'Grüße\n"entity"', slot=82, p0=12345), console('entitylist')],
                   expected=dict(handled=[1], event_texts=['Grüße\n"entity"', '12345                 ']))
    yield scenario('entitylist_classname_at_printf_limit',
                   [action(62, 'e' * 1023, slot=82, p0=1), console('entitylist')],
                   expected=dict(handled=[1], event_texts=['e' * 1023]))

    yield scenario('memory_initial_status', [console('GaMe_MeMoRy')],
                   expected=dict(handled=[1], allocation=0, event_texts=['Game memory status: 0 out of 262144 bytes allocated\n']))
    for size in (0, 1, 31, 32, 33, 1023, 262143, 262144):
        rounded = (size + 31) & ~31
        yield scenario(f'memory_console_allocation_{size}',
                       [action(64, '', p0=size), console('game_memory')],
                       expected=dict(offsets=[0], allocation=rounded,
                                     event_texts=[f'Game memory status: {rounded} out of 262144 bytes allocated\n']))
    yield scenario('memory_debug_print_precedes_allocation',
                   [action(65, '', p0=-1), action(64, '', p0=1), action(64, '', p0=33), console('game_memory')],
                   expected=dict(offsets=[0, 32], allocation=96, effect_allocations=[0, 32, 96]))
    yield scenario('memory_reset_preserves_debug',
                   [action(65, '', p0=1), action(64, '', p0=33), action(63, ''), console('game_memory')],
                   expected=dict(offsets=[0], allocation=0, debug=1, effect_allocations=[0, 0]))
    yield scenario('memory_client_spawn_shared_arena',
                   [action(64, '', p0=17), console('forceteam', '0', 'blue'), console('game_memory')],
                   gametype=3, clients={0: Client(team=3)}, expected=dict(offsets=[0], allocation=32, teams={0: 2}))

    for name in ('addip', 'removeip'):
        yield scenario(name + '_usage', [console(name)], expected=dict(handled=[1], event_kinds=[15]))
    for address in ('10.20.30.40', '10.20.*.*', '10', '*', '1/2/3/4', '256.511.0.257',
                    '1.2.3.4.extra', 'bad', '1..2.3', ''):
        yield scenario('addip_console_' + repr(address), [console('AdDiP', address)], expected=dict(handled=[1]))
    yield scenario('addip_updates_engine_without_vm_refresh',
                   [console('addip', '10.20.*.*')],
                   expected=dict(filter_count=1, engine_bans='10.20.*.* ', vm_bans='', handled=[1]))
    yield scenario('addip_filter_packet_blacklist',
                   [console('addip', '10.20.*.*'), action(68, '10.20.30.40:27960'), action(68, '10.21.30.40')],
                   expected=dict(packets=[1, 0], filter_count=1))
    yield scenario('addip_filter_packet_whitelist',
                   [action(66, '', p0=0), console('addip', '10.20.*.*'),
                    action(68, '10.20.30.40:27960'), action(68, '10.21.30.40')],
                   expected=dict(packets=[0, 1], filter_count=1, filter_mode=0))
    yield scenario('removeip_exact_mask_and_host_distinct',
                   [console('addip', '10.20.*.*'), console('removeip', '10.20.30.40'),
                    console('REMOVEIP', '10.20.*.*'), action(68, '10.20.30.40')],
                   expected=dict(handled=[1, 1, 1], packets=[0], engine_bans='', filter_count=1,
                                 event_texts=["Didn't find 10.20.30.40.\n", 'Removed.\n']))
    yield scenario('removeip_reuses_first_free_filter',
                   [console('addip', '1.2.3.4'), console('addip', '5.6.7.8'),
                    console('removeip', '1.2.3.4'), console('addip', '9.10.11.12')],
                   expected=dict(filter_count=2, engine_bans='9.10.11.12 5.6.7.8 '))
    yield scenario('addip_duplicate_filters_retained',
                   [console('addip', '1.2.3.4'), console('addip', '1.2.3.4'), console('removeip', '1.2.3.4'),
                    action(68, '1.2.3.4')], expected=dict(filter_count=2, engine_bans='1.2.3.4 ', packets=[1]))
    for index, (bans, count, engine, visible) in enumerate((
            ('1.2.3.4 ', 1, '1.2.3.4 ', '1.2.3.4'),
            ('1.2.3.4', 0, '1.2.3.4', '1.2.3.4'),
            ('1.2.3.4  5.6.*.* ', 2, '1.2.3.4 5.6.*.* ', '1.2.3.4'),
            (' 1.2.3.4 ', 1, '1.2.3.4 ', ''),
            ('1.2.3.4 5.6.7.8', 1, '1.2.3.4 ', '1.2.3.4'))):
        yield scenario(f'process_bans_mutates_vm_{index}', [action(66, bans, p0=1), action(67, '')],
                       expected=dict(filter_count=count, engine_bans=engine, vm_bans=visible))
    yield scenario('process_bans_repeat_uses_visible_prefix',
                   [action(66, '1.2.3.4 5.6.7.8 ', p0=1), action(67, ''), action(67, '')],
                   expected=dict(filter_count=2, engine_bans='1.2.3.4 5.6.7.8 ', vm_bans='1.2.3.4'))
    yield scenario('process_bans_after_explicit_vm_refresh',
                   [console('addip', '1.2.3.4'), action(69, ''), action(67, '')],
                   expected=dict(filter_count=2, engine_bans='1.2.3.4 1.2.3.4 ', vm_bans='1.2.3.4'))
    yield scenario('ip_engine_storage_overflow_keeps_all_filters',
                   [*[console('addip', f'100.200.150.{index}') for index in range(24)],
                    action(68, '100.200.150.23'), console('listip')],
                   expected=dict(filter_count=24, packets=[1],
                                 event_texts=['g_banIPs overflowed at MAX_CVAR_VALUE_STRING\n', 'g_banIPs\n']))
    yield scenario('server_admin_interleaved_client_commands',
                   [options(cheats=1, dedicated=1), console('addip', '192.0.2.*'),
                    command('god'), console('forceteam', '0', 'blue'), command('team'),
                    console('say', 'server message'), console('game_memory'), console('listip')],
                   gametype=3, clients={0: Client(team=1, flags=0)},
                   expected=dict(handled=[1, 1, 1, 1, 1], teams={0: 2}, filter_count=1))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--case')
    parser.add_argument('--reuse-build', action='store_true')
    args = parser.parse_args()
    out = ROOT / 'build/reference/server_commands'
    out.mkdir(parents=True, exist_ok=True)
    sources = [] if args.reuse_build else build(out)
    if not args.reuse_build:
        subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                        'tests/team_change_tests.ml', '--output', 'team_change_tests.exe'], check=True)
    bsp = out / 'server-commands.bsp'
    bsp.write_bytes(map_bytes())
    seen, seen_stems, records = set(), {}, []
    for name, data, expected_values in scenarios():
        if name in seen:
            raise RuntimeError('Duplicate server scenario ' + name)
        seen.add(name)
        safe = artifact_stem(name)
        stem_key = safe.casefold()  # Windows artifact paths are case-insensitive.
        if stem_key in seen_stems:
            raise RuntimeError(f'Server artifact collision: {seen_stems[stem_key]!r} and {name!r}')
        seen_stems[stem_key] = name
        if args.case and name != args.case:
            continue
        inp, expected = out / (safe + '.bin'), out / (safe + '.expected')
        inp.write_bytes(data)
        run([out / 'spawn_oracle.exe', bsp, inp, expected, '0', '--server-commands'],
            out, log=out / (safe + '.oracle.log'), timeout=30)
        output = run([ROOT / 'build/team_change_tests.exe', bsp, inp, expected, '--server-commands'],
                     ROOT / 'build', log=out / (safe + '.test.log'), timeout=60)
        match = re.search(r'(\d+) team change actions / (\d+) exact words / (\d+) ordered effects', output)
        if not match:
            raise RuntimeError(output)
        proof = inspect_stream(expected.read_bytes())
        validate(name, proof, expected_values)
        if proof['ordered_effects'] != int(match[3]) or proof['snapshot_count'] != int(match[1]) + int(match[3]):
            raise RuntimeError(f'{name}: independent snapshot/effect counters differ')
        records.append(dict(name=name, artifact_stem=safe, actions=int(match[1]), exact_words=int(match[2]),
                            ordered_effects=int(match[3]), bytes=expected.stat().st_size,
                            semantic_proof=proof, input_sha256=sha(inp), expected_sha256=sha(expected)))
        if len(records) % 10 == 0 or args.case:
            print(f'{len(records)} server command scenarios passed ({name})', flush=True)
    if not records:
        raise RuntimeError('No matching server command scenario')
    output = run([ROOT / 'build/team_change_tests.exe', bsp, inp, expected, '--server-commands-contracts'],
                 ROOT / 'build', log=out / 'contracts.log')
    print(output.strip())
    contracts = int(re.search(r'(\d+) server command runtime contracts', output)[1])
    result = dict(passed=True, scenarios=records, scenario_count=len(records),
                  actions=sum(record['actions'] for record in records),
                  exact_words=sum(record['exact_words'] for record in records),
                  ordered_effects=sum(record['ordered_effects'] for record in records),
                  output_bytes=sum(record['bytes'] for record in records), runtime_contracts=contracts,
                  test_sha256=sha(ROOT / 'build/team_change_tests.exe'),
                  oracle_sha256=sha(out / 'spawn_oracle.exe'), map_sha256=sha(bsp),
                  scope='Unchanged Baseq3 server console dispatch, entity listing, raw client lookup, '
                        'real SetTeam/death/spawn integration, dedicated chat and argv byte limits; '
                        'real IP mask commands, filter decisions, Engine/VM persistence, and game '
                        'arena memory status/allocation. Bot creation/listing/podium remain explicit '
                        'host implementation callbacks, not simulated bot gameplay. After real '
                        'ClientSpawn this isolated fixture observes ClientThink/ClientEndFrame '
                        'through existing override hooks; normal game defaults use their real ports. '
                        'Engine argv tokenization and command-buffer execution remain outside this suite.',
                  original_sources={source.relative_to(ROOT).as_posix(): sha(source) for source in sources})
    selected_stem = records[0]['artifact_stem'] if args.case else None
    filename = ('reused-' + (selected_stem or 'all') + '.json') if args.reuse_build else (
        selected_stem + '.result.json' if selected_stem else 'result.json')
    (out / filename).write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8', newline='\n')
    print(f"PASS: {len(records)} server command scenarios / {result['actions']} actions / "
          f"{result['exact_words']} exact words / {result['ordered_effects']} ordered effects")


if __name__ == '__main__':
    main()
