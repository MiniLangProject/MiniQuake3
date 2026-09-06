"""Differential Baseq3 ClientCommand routing, chat, voice and utility commands."""
import argparse
from dataclasses import dataclass, replace
import json
import re
import subprocess
import sys

from inventory import sha
from spawn_oracle import build
from test_bodies import map_bytes
from test_client_info import info
from test_team_changes import Client, action, case as team_case
from test_votes import ints, text
from toolchain import ROOT, run


@dataclass(frozen=True)
class Command:
    argv: tuple[str, ...]
    slot: int = 0
    time: int = 1000


def command(*argv, slot=0, time=1000):
    return Command(argv, slot, time)


def case(actions, **kwargs):
    """Preserve exact engine argv boundaries, including empty/space-bearing args."""
    data = team_case([], **kwargs)[:-4] + ints(len(actions))
    for step in actions:
        if isinstance(step, Command):
            data += ints(40, step.time, step.slot, len(step.argv))
            data += text(step.argv[0] if step.argv else '')
            for arg in step.argv[1:]:
                data += text(arg)
        else:
            kind, time, slot, p0, request = step
            data += ints(kind, time, slot, p0) + text(request)
    return data


def options(*, cheats=0, dedicated=0, time=1000):
    return action(41, str(dedicated), p0=cheats, time=time)


WATCH = Client(team=3, spectator=1, name='Watcher')
TEAM = {0: Client(team=1), 1: Client(team=1, name='Red Friend'),
        2: Client(team=2, name='Blue Rival'), 3: WATCH}
ROUTES = [
    ('say', 'hello'), ('say_team', 'team hello'), ('tell', '1', 'private'),
    ('vsay', 'yes'), ('vsay_team', 'defend'), ('vtell', '1', 'yes'),
    ('vosay', 'no'), ('vosay_team', 'offense'), ('votell', '1', 'no'),
    ('vtaunt',), ('score',), ('give', 'health'), ('god',), ('notarget',),
    ('noclip',), ('kill',), ('teamtask', '3'), ('levelshot',),
    ('follow', '1'), ('follownext',), ('followprev',), ('team', 'red'),
    ('where',), ('callvote', 'map_restart', '0'), ('vote', 'yes'),
    ('callteamvote', 'leader', '1'), ('teamvote', 'yes'), ('gc', '1', '2'),
    ('setviewpos', '1', '2', '3', '90'), ('stats',), ('unrecognized', 'tail'),
]


def scenarios():
    yield 'router_empty_unknown_and_case', case([
        command(), command(''), command('bogus'), command('BoGuS', 'tail'),
        command(' stats'), command('sTaTs'), command('WhErE'), command('ScOrE')])
    yield 'router_token_native_truncation', case([
        command('x' * 1023), command('x' * 1200), command('stats' + ' ' * 1200)])
    yield 'router_arguments_keep_engine_boundaries', case([
        command('say', 'one two', '', 'three'), command('say', '"quoted"'),
        command('say', 'say_team', 'hello'), command('say hello')])
    yield 'router_null_client_ignores_every_branch', case(
        [command(*argv) for argv in ROUTES] + [command()],
        clients={0: Client(bound=0)})
    for connected, active in ((0, 0), (0, 1), (1, 0), (1, 1)):
        yield f'router_bound_connection_{connected}_inuse_{active}', case([
            command('where'), command('say', 'still parsed'), options(cheats=1),
            command('god'), command('stats')],
            clients={0: Client(connected=connected, active=active)})
    yield 'router_slot63_and_entity_client_numbers', case([
        command('where', slot=63), command('say', 'last slot', slot=63),
        command('score', slot=63), options(cheats=1), command('god', slot=63)],
        maxclients=64, clients={63: Client(psnum=7, entnum=11, name='Last')})
    yield 'router_persistent_client_alias', case([
        action(6, p0=1), command('teamtask', '4'), command('say', 'alias'),
        options(cheats=1), command('god')])

    # The early chat/voice/score routes remain live; all later routes become
    # SAY_ALL with arg0=true, including the command's original spelling.
    for argv in ROUTES:
        yield 'intermission_' + argv[0], case([
            options(cheats=1, dedicated=1), command(*argv)],
            intermission=995, gametype=3, clients=TEAM)
    yield 'intermission_empty_argv_and_tokens', case([
        command(), command(''), command('UnKnOwN', '', ' a b ')], intermission=995)
    yield 'intermission_levelshot_then_command_becomes_chat', case([
        options(cheats=1), command('LeVeLsHoT'), command('god'),
        command('score'), command('say', 'after screenshot')])

    # One population exposes all recipient filters without suppressing logs.
    population = {0: Client(team=3, name='^1Spectator'),
                  1: Client(team=0, name='Free'),
                  2: Client(team=1, connected=1, name='Connecting'),
                  3: Client(team=1, connected=0, name='Disconnected'),
                  4: Client(team=1, active=0, name='Inactive'),
                  5: Client(team=1, bound=0, name='Unbound'),
                  6: Client(team=3, svflags=8, name='Bot')}
    for gametype in (0, 1, 2, 3, 4):
        yield f'chat_voice_recipient_filters_game_{gametype}', case([
            command('say', 'all'), command('say_team', 'team'),
            command('vsay', 'yes'), command('vsay_team', 'yes')],
            maxclients=7, gametype=gametype, clients=population)
    for dedicated in (0, 1, -1):
        yield f'dedicated_print_{dedicated}', case([
            options(dedicated=dedicated), command('SaY', 'hello'),
            command('VsAy', 'affirmative')])
    yield 'chat_zero_client_limit_still_logs_and_prints', case([
        options(dedicated=1), command('say', 'nobody'), command('vsay', 'nobody')],
        maxclients=0)
    yield 'chat_empty_and_multilingual_arguments', case([
        command('say'), command('say', ''), command('say', '', ''),
        command('say', 'Grüße', '世界', '^1red', '\x19control'),
        command('say_team', 'line\nbreak', 'quote"slash\\')], gametype=3, clients=TEAM)
    for size in (148, 149, 150, 151, 1021, 1022, 1023, 1300):
        yield f'chat_concat_and_text_byte_boundary_{size}', case([
            command('say', 'x' * size), command('say', 'a', 'x' * size),
            command('vsay', 'x' * size)])
    yield 'chat_concat_trailing_separator_after_rejected_token', case([
        command('say', 'prefix', 'x' * 1016), command('vsay', 'prefix', 'x' * 1016),
        command('say', 'x' * 1022, ''), command('say', '', 'x' * 1022)])
    yield 'chat_multibyte_truncation', case([
        command('say', 'ä' * 90), command('vsay', 'ä' * 520),
        command('say', 'é' * 510, 'tail')])
    for size in (31, 32, 34, 35):
        # Native fixture netnames are bounded by MAX_NETNAME=36 bytes.
        yield f'chat_netname_format_{size}', case([
            command('say', 'all'), command('say_team', 'team'),
            command('tell', '1', 'private')], gametype=3,
            clients={0: Client(team=1, name='n' * size), 1: Client(team=1)})

    for target in ('-1', '4', '2147483648', '1junk', ' 1', 'Other', ''):
        yield f'tell_numeric_target_{target}', case([
            command('tell', target, 'text'), command('vtell', target, 'yes'),
            command('votell', target, 'yes')])
    yield 'tell_argument_count_and_self_echo', case([
        command('tell'), command('tell', '1'), command('tell', '0', 'self'),
        command('vtell'), command('vtell', '1'), command('vtell', '0', 'self')])
    for connected in (0, 1, 2):
        yield f'tell_connection_{connected}', case([
            command('tell', '1', 'text'), command('vtell', '1', 'voice')],
            clients={1: Client(connected=connected)})
    for bound, active, senderbot, targetbot in ((0, 1, 0, 0), (1, 0, 0, 0),
                                               (1, 1, 8, 0), (1, 1, 0, 8)):
        yield f'tell_binding_{bound}_{active}_{senderbot}_{targetbot}', case([
            command('tell', '1', 'text'), command('vtell', '1', 'voice')],
            clients={0: Client(svflags=senderbot),
                     1: Client(bound=bound, active=active, svflags=targetbot)})
    yield 'tell_last_slot_uses_level_limit', case([
        command('tell', '63', 'last'), command('vtell', '63', 'last')],
        maxclients=64, clients={63: Client(name='Last')})
    yield 'tournament_text_spectator_to_player_and_player_to_spectator', case([
        command('tell', '1', 'spectator to player'),
        command('tell', '0', 'player to spectator', slot=1),
        command('vtell', '1', 'blocked'), command('vsay', 'blocked', slot=1)],
        gametype=1, clients={0: WATCH})
    yield 'voice_all_six_routes_and_no_arguments', case([
        step for name in ('vsay', 'vsay_team', 'vtell', 'vosay', 'vosay_team', 'votell')
        for step in (command(name.upper()),
                     command(name.upper(), '1', 'affirmative') if name.endswith('tell')
                     else command(name.upper(), 'affirmative'))],
        gametype=3, clients=TEAM)
    yield 'voice_speaker_entity_number_alias', case([
        action(6, p0=1), command('vsay', 'number'), command('vtell', '1', 'number')])

    # Taunts deliberately use client pointers even for disconnected entities.
    for senderbot, targetbot in ((0, 0), (8, 0), (0, 8), (8, 8)):
        yield f'taunt_death_insult_{senderbot}_{targetbot}', case([
            action(44, '-1', slot=1, p0=0), action(44, '1', p0=1),
            command('vtaunt'), command('vtaunt')],
            clients={0: Client(svflags=senderbot), 1: Client(svflags=targetbot)})
    for mod in (2, 3):
        for bot in (0, 8):
            yield f'taunt_kill_mod_{mod}_targetbot_{bot}', case([
                action(44, '-1', p0=1), action(45, '0', slot=1, p0=mod),
                command('vtaunt'), command('vtaunt')], clients={1: Client(svflags=bot)})
    yield 'taunt_enemy_mismatch_falls_through_to_kill', case([
        action(44, '-1', slot=1, p0=2), action(44, '1', p0=1), command('vtaunt')])
    yield 'taunt_killed_unbound_retains_lastkilled', case([
        action(44, '-1', p0=1), command('vtaunt'), command('vtaunt')],
        clients={1: Client(bound=0)})
    yield 'taunt_killed_nonclient_entity', case([
        action(44, '-1', p0=82), command('vtaunt')])
    yield 'taunt_self_lastkill_falls_through', case([
        action(44, '-1', p0=0), command('vtaunt')])
    for rewardtime in (999, 1000, 1001):
        yield f'taunt_team_reward_time_{rewardtime}', case([
            action(44, '-1', p0=-1), action(45, str(rewardtime), slot=1, p0=0),
            command('vtaunt'), command('vtaunt')], gametype=3, clients=TEAM)
    yield 'taunt_reward_scans_full64_and_first_match', case([
        action(44, '-1', p0=-1), action(45, '2000', slot=63, p0=0),
        command('vtaunt'), action(45, '2000', slot=2, p0=0), command('vtaunt')],
        gametype=3, clients={0: Client(team=1), 2: Client(team=1, connected=0),
                            63: Client(team=1, connected=0, svflags=8)})
    yield 'taunt_tournament_mutations_even_when_voice_blocked', case([
        action(44, '-1', p0=1), command('vtaunt'), action(44, '-1', slot=1, p0=0),
        action(44, '1', p0=-1), command('vtaunt')], gametype=1)

    for color in (-10, -1, 0, 1, 7, 8, 2147483647):
        yield f'location_color_and_mutation_{color}', case([
            action(42, 'Upper Hall', p0=color), command('say_team', 'first'),
            command('say_team', 'second'), command('tell', '1', 'same team'),
            command('tell', '2', 'other team')], gametype=3, clients=TEAM)
    for length in (0, 42, 60, 64, 1000):
        yield f'location_format_byte_boundary_{length}', case([
            action(42, 'L' * length, p0=3), command('say_team', 'location'),
            command('tell', '1', 'location')], gametype=3, clients=TEAM)
    yield 'location_utf8_and_colored_team_name', case([
        action(42, 'Rüstkammer 世界', p0=2), command('say_team', 'yes')],
        gametype=4, clients={0: Client(team=1, name='^1Ranger'), 1: Client(team=1)})

    for order in range(7):
        yield f'game_order_{order}', case([
            command('gc', '1', str(order)), command('gc', '0', str(order))])
    for player, order in (('-1', '0'), ('64', '0'), ('1', '-1'), ('1', '8'),
                          ('not-number', 'junk')):
        yield f'game_order_bounds_{player}_{order}', case([command('gc', player, order)])
    yield 'game_order_missing_arguments_and_fixed64_limit', case([
        command('gc'), command('gc', '1'), command('gc', '63', '6')],
        clients={63: Client(name='Outside configured limit')})
    yield 'game_order_team_location_and_bot_self_double_echo', case([
        action(42, 'Base', p0=4), command('gc', '1', '3'), command('gc', '0', '6')],
        gametype=3, clients={0: Client(team=1, svflags=8), 1: Client(team=1)})

    for cheats, health in ((0, 100), (0, -5), (1, 0), (-1, -5), (-1, 100)):
        yield f'cheat_gate_order_{cheats}_{health}', case([
            options(cheats=cheats), command('give', 'health'), command('god'),
            command('notarget'), command('noclip'), command('levelshot')],
            clients={0: Client(health=health, pmtype=3 if health <= 0 else 0)},
            gametype=3)
    yield 'cheat_toggle_flags_and_noclip', case([
        options(cheats=1), command('GoD'), command('GoD'), command('NoTaRgEt'),
        command('NoTaRgEt'), command('NoClIp'), command('NoClIp'),
        options(cheats=0), command('god'), options(cheats=-1), command('god')])
    for name in ('health', 'weapons', 'ammo', 'armor', 'all',
                 'excellent', 'impressive', 'gauntletaward', 'defend', 'assist'):
        yield 'give_' + name, case([
            options(cheats=1), command('GiVe', name.upper()), command('give', name)],
            clients={0: Client(health=25)})
    yield 'give_unknown_empty_and_concat', case([
        options(cheats=1), command('give'), command('give', 'not an item'),
        command('give', 'weapon_rocketlauncher'), command('give', 'Rocket', 'Launcher'),
        command('give', 'health', ''), command('give', 'all', 'extra')])
    for name in ('Armor Shard', 'Heavy Armor', '5 Health', 'Mega Health', 'Gauntlet',
                 'Shotgun', 'Machinegun', 'Grenade Launcher', 'Rocket Launcher',
                 'Lightning Gun', 'Railgun', 'Plasma Gun', 'BFG10K', 'Grappling Hook',
                 'Shells', 'Bullets', 'Rockets', 'Slugs', 'Personal Teleporter',
                 'Medkit', 'Quad Damage', 'Battle Suit', 'Speed', 'Invisibility',
                 'Regeneration', 'Flight'):
        yield 'give_item_' + name, case([
            options(cheats=1), command('give', name)],
            clients={0: Client(health=25)})
    yield 'give_ctf_flags', case([
        options(cheats=1), command('give', 'Blue Flag'), command('give', 'Red Flag')],
        gametype=4, clients={0: Client(team=1)})
    yield 'give_while_spectator_and_item_not_pickable', case([
        options(cheats=1), command('give', 'health'), command('give', 'Rocket Launcher')],
        clients={0: WATCH})
    yield 'error_give_startsolid_after_free', case([
        options(cheats=1), command('setviewpos', '-200', '256', '79', '0'),
        command('give', 'Shotgun')])

    for health, team, flags in ((100, 0, 0x50), (0, 0, 0x50), (-10, 0, 0x50),
                                (100, 3, 0x50), (100, 1, 0x50)):
        yield f'kill_health_team_{health}_{team}', case([
            command('KiLl'), command('kill', time=1001)],
            gametype=3 if team == 1 else 0,
            clients={0: Client(health=health, team=team, flags=flags,
                               pmtype=3 if health <= 0 else 0, powers=(1 << 1))})
    for gametype in (0, 1, 2, 3, 4):
        yield f'levelshot_game_{gametype}', case([
            options(cheats=1), command('levelshot')],
            gametype=gametype)
    yield 'teamtask_atoi_and_arg_count', case([
        command('teamtask'), command('teamtask', '2', 'extra'),
        command('TeAmTaSk', '-3junk'), command('teamtask', '2147483648'),
        command('teamtask', '')])
    for userinfo in (
            info(name='Ranger', teamtask='old'),
            r'\TeamTask\old\teamtask\older\teamtask\duplicate\name\Ranger',
            r'name\Ranger\teamtask\old\dangling',
            r'\name\Before;Bad\teamtask\2',
            r'\name\Before"Bad\teamtask\2',
            ''):
        yield 'teamtask_userinfo_' + str(len(userinfo)) + '_' + str(sum(map(ord, userinfo))), case([
            command('teamtask', '7'), command('teamtask', '8')],
            clients={0: Client(userinfo=userinfo)})
    yield 'teamtask_length_rejection_keeps_removed_key', case([
        command('teamtask', '2147483647')],
        # Keep the removed pair last: native Info_RemoveKey uses overlapping
        # strcpy for a nonempty suffix, outside the C library contract.
        clients={0: Client(userinfo='\\x\\' + 'x' * 1002 + r'\teamtask\1')})
    yield 'teamtask_persistent_client_identity', case([
        action(6, p0=1), command('teamtask', '9')],
        clients={0: Client(userinfo=info(name='Entity')),
                 1: Client(userinfo=info(name='Persistent', teamtask='old'))})
    yield 'setviewpos_cheats_before_usage_and_dead_allowed', case([
        command('setviewpos'), options(cheats=1), command('setviewpos'),
        command('setviewpos', '1', '2', '3', '4', 'extra'),
        command('setviewpos', '25.5', '-12.25', '256', '-90.5')],
        clients={0: Client(health=-25, pmtype=3)})
    for args in (('10', '20', '300', '90'), ('-100.25', '0.5', '64', '359.75'),
                 (' 1.25tail', '-2e1', '3e2', 'garbage'),
                 ('0x1p4', '-0', '200', '+180'), ('1e9', '0', '128', '720')):
        yield 'setviewpos_numeric_' + str(sum(map(ord, '|'.join(args)))), case([
            options(cheats=1), command('setviewpos', *args), command('where')])
    yield 'setviewpos_spectator_no_events_or_killbox', case([
        options(cheats=1), command('setviewpos', '3100', '0', '128', '45')],
        clients={0: WATCH})
    yield 'setviewpos_large_spectator_where_keeps_entity_origin', case([
        options(cheats=1),
        command('setviewpos', '-1000000000', '-1000000000', '-1000000000', '0'),
        command('where')], clients={0: WATCH})
    yield 'where_native_vector_buffer_diagnostic', case([
        action(46, '', p0=-1000000000), command('where')])
    yield 'setviewpos_real_telefrag', case([
        action(29, slot=1), options(cheats=1),
        command('setviewpos', '3100', '0', '127', '0', slot=1),
        command('setviewpos', '3100', '0', '127', '180')])
    yield 'stats_noop_extra_args', case([command('StAtS', 'anything')])

    yield 'router_team_follow_and_score_sequence', case([
        command('TeAm'), command('FoLlOw', 'Other'), command('FoLlOwNeXt'),
        command('FoLlOwPrEv'), command('follow'), command('team', 'free', time=7000),
        command('ScOrE', time=7001)])
    yield 'router_team_denial_and_cooldown', case([
        command('team', 'red'), command('team', 'blue', time=1001)],
        gametype=3, balance=1,
        clients={0: WATCH, 1: Client(team=1), 2: Client(team=1)})
    yield 'router_vote_disabled_and_empty', case([
        action(43, '', p0=0), command('callvote', 'map_restart'),
        command('vote', 'yes'), action(43, '', p0=1), command('callvote')])
    yield 'router_vote_map_rotation_and_cast', case([
        action(43, 'map q3dm17', p0=1), command('CaLlVoTe', 'map', 'q3dm7'),
        command('VoTe', 'yes'), command('VoTe', 'xY', slot=1),
        command('callvote', 'map_restart')])
    yield 'router_vote_long_timelimit_format_diagnostic', case([
        action(43, '', p0=1), command('callvote', 'timelimit', 'x' * 1023)])
    yield 'router_vote_long_map_format_diagnostic', case([
        action(43, '', p0=1), command('callvote', 'map', 'm' * 1023)])
    yield 'router_vote_long_rotation_format_diagnostic', case([
        action(43, 'r' * 1100, p0=1), command('callvote', 'map', 'q3dm7')])
    for name, value in (('nextmap', ''), ('g_gametype', '3'), ('g_gametype', '2'),
                        ('kick', 'Other'), ('map;', 'bad'), ('fraglimit', '20')):
        yield 'router_vote_' + name + '_' + value, case([
            action(43, 'map q3dm6', p0=1), command('callvote', name, value)])
    yield 'router_teamvote_two_sides_and_argv_name_join', case([
        action(43, '', p0=1), command('CaLlTeAmVoTe', 'leader', 'Red', 'Friend'),
        command('TeAmVoTe', 'x1', slot=1), command('teamvote', 'yes'),
        command('callteamvote', 'leader', '2', slot=2)],
        gametype=3, clients=TEAM)
    yield 'router_teamvote_disabled_and_wrong_team', case([
        action(43, '', p0=0), command('callteamvote', 'leader'),
        command('teamvote', 'yes'), command('callteamvote', 'leader', slot=3)],
        gametype=3, clients=TEAM)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--case')
    parser.add_argument('--reuse-build', action='store_true')
    args = parser.parse_args()
    out = ROOT / 'build/reference/client_commands'
    sources = build(out) if not args.reuse_build else []
    if not args.reuse_build:
        subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                        'tests/team_change_tests.ml', '--output', 'team_change_tests.exe'],
                       check=True)
    bsp = out / 'client_commands.bsp'
    bsp.write_bytes(map_bytes())
    records = []
    names = set()
    for name, data in scenarios():
        if name in names:
            raise RuntimeError('Duplicate scenario: ' + name)
        names.add(name)
        if args.case and args.case != name:
            continue
        safe = re.sub(r'[^a-zA-Z0-9_-]', '_', name)
        inp, expected = out / (safe + '.bin'), out / (safe + '.expected')
        inp.write_bytes(data)
        native_command = [out / 'spawn_oracle.exe', bsp, inp, expected, '0', '--client-commands']
        native_error = name.startswith('error_')
        if native_error:
            native = subprocess.run(native_command, cwd=out, stdout=subprocess.PIPE,
                                    stderr=subprocess.STDOUT, text=True,
                                    encoding='utf-8', errors='replace', timeout=30)
            (out / (safe + '.oracle.log')).write_text(native.stdout, encoding='utf-8', newline='\n')
            if native.returncode != 41 or 'BG_CanItemBeGrabbed: index out of range' not in native.stdout:
                raise RuntimeError(f'Unexpected native drop {native.returncode}: {native.stdout}')
        else:
            run(native_command, out, log=out / (safe + '.oracle.log'), timeout=30)
        output = run([ROOT / 'build/team_change_tests.exe', bsp, inp, expected, '--commands'],
                     ROOT / 'build', log=out / (safe + '.test.log'), timeout=30)
        match = re.search(r'(\d+) team change actions / (\d+) exact words / (\d+) ordered effects',
                          output)
        if not match:
            raise RuntimeError(output)
        records.append(dict(name=name, actions=int(match[1]), exact_words=int(match[2]),
                            ordered_effects=int(match[3]), bytes=expected.stat().st_size,
                            native_error=native_error,
                            inputs_sha256=sha(inp), expected_sha256=sha(expected)))
        if len(records) % 10 == 0 or args.case:
            print(f'{len(records)} client command scenarios passed ({name})', flush=True)
    if not records:
        raise RuntimeError('No matching client command scenario')
    output = run([ROOT / 'build/team_change_tests.exe', bsp, inp, expected,
                  '--commands-contracts'], ROOT / 'build', log=out / 'contracts.log')
    print(output.strip())
    contracts = int(re.search(r'(\d+) client command runtime contracts', output)[1])
    result = dict(
        passed=True, scenarios=records, scenario_count=len(records),
        actions=sum(record['actions'] for record in records),
        exact_words=sum(record['exact_words'] for record in records),
        ordered_effects=sum(record['ordered_effects'] for record in records),
        output_bytes=sum(record['bytes'] for record in records), runtime_contracts=contracts,
        native_errors=sum(record['native_error'] for record in records),
        test_sha256=sha(ROOT / 'build/team_change_tests.exe'),
        oracle_sha256=sha(out / 'spawn_oracle.exe'), map_sha256=sha(bsp),
        scope='Unchanged Baseq3 ClientCommand routing and all original branches, including '
              'chat/voice/tell/taunt, ConcatArgs, Team_GetLocationMsg, game orders, cheats, '
              'real item give/pickup, suicide, levelshot/intermission, teamtask/userinfo, '
              'teleport, existing team/follow/score and vote commands. Exact engine argv '
              'boundaries are preserved. All modeled clients/entityStates, selected '
              'private/spatial fields, vote/config/session/userinfo/location state and '
              'ordered host effects are compared, including the original Give drop '
              'after startsolid frees its item. Undefined native gc index 7, invalid '
              'taunt pointers, missing team-tell clients and exact info-buffer overflow '
              'are Mini runtime contracts only. Engine delivery, bot hooks and '
              'ClientThink/EndFrame remain explicit boundaries; no full engine or '
              'Missionpack claim.',
        original_sources={source.relative_to(ROOT).as_posix(): sha(source) for source in sources})
    name = ('reused-' + (args.case or 'all') + '.json') if args.reuse_build else (
        (args.case + '.result.json') if args.case else 'result.json')
    (out / name).write_text(json.dumps(result, indent=2) + '\n',
                            encoding='utf-8', newline='\n')
    print(f"PASS: {len(records)} client command scenarios / {result['actions']} actions / "
          f"{result['exact_words']} exact words / {result['ordered_effects']} ordered effects")


if __name__ == '__main__':
    main()
