"""Unchanged Baseq3 vote calls/casts, original argv copies and resolution chains."""
import argparse
from dataclasses import dataclass, replace
import json
import re
import subprocess
import sys

from inventory import sha
from spawn_oracle import build
from test_bodies import map_bytes
from test_votes import Vote, ints, text
from toolchain import ROOT, run


@dataclass(frozen=True)
class Client:
    active: int = 1
    connected: int = 2
    team: int = 1
    leader: int = 0
    flags: int = 0
    votes: int = 0
    team_votes: int = 0
    number: int = 0
    name: str = '^1Caller'


def action(kind, *argv, slot=0, time=1000):
    return kind, time, slot, argv


def case(actions, clients=None, maxclients=4, time=1000, allow=1, execute=0,
         global_vote=Vote(voters=3, command='map old'), display='old display',
         red=Vote(voters=2, command='leader 0'), blue=Vote(voters=1, command='leader 2'), nextmap=''):
    data = ints(maxclients, time, allow, global_vote.time, execute, global_vote.yes,
                global_vote.no, global_vote.voters, red.time, red.yes, red.no, red.voters,
                blue.time, blue.yes, blue.no, blue.voters)
    data += b''.join(text(s) for s in (global_vote.command, display, red.command, blue.command, nextmap))
    population = {0: Client(), 1: Client(number=1, name='^2Teammate'),
                  2: Client(team=2, number=2, name='Blue'), 3: Client(team=3, number=3, name='Spectator')}
    population.update(clients or {})
    for slot in range(64):
        c = population.get(slot, Client(active=0, connected=0, team=0, number=slot, name=''))
        data += ints(c.active, c.connected, c.team, c.leader, c.flags, c.votes, c.team_votes, c.number) + text(c.name)
    data += ints(len(actions))
    for kind, at, slot, argv in actions:
        data += ints(kind, at, slot, len(argv)) + b''.join(text(s) for s in argv)
    return data


def scenarios():
    call = action(1, 'callvote', 'fraglimit', '20')
    teamcall = action(3, 'callteamvote', 'leader', '1')
    yield 'global_call_cast_resolve_execute', case([
        call, action(2, 'vote', 'yes'), action(2, 'vote', 'yes', slot=1),
        action(5, time=1001), action(5, time=4001), action(5, time=4002), action(5, time=5000)])
    yield 'global_failure_and_second_call', case([
        call, action(2, 'vote', 'no', slot=2), action(5), action(1, 'callvote', 'timelimit', '15'),
        action(2, 'vote', 'xY', slot=1), action(5), action(1, 'callvote', 'kick', 'Teammate')])
    yield 'team_call_cast_leader_and_reselect', case([
        teamcall, action(4, 'teamvote', 'yes'), action(4, 'teamvote', 'yes', slot=1), action(6, slot=1),
        action(3, 'callteamvote', 'leader'), action(4, 'teamvote', 'yes', slot=1), action(6, slot=1)],
        clients={0: Client(leader=1)})
    yield 'simultaneous_global_red_blue', case([
        call, teamcall, action(3, 'callteamvote', 'leader', slot=2),
        action(2, 'vote', 'y', slot=1), action(4, 'teamvote', 'y', slot=1),
        action(5), action(6, slot=1), action(6, slot=2), action(5, time=4001)])
    for target_team, connected in ((2, 2), (1, 0), (1, 1)):
        yield f'team_candidate_changed_{target_team}_{connected}', case([
            teamcall, action(4, 'teamvote', 'yes', slot=1),
            action(7, str(connected), str(target_team), slot=1), action(6, slot=1)])
    yield 'timeout_after_call_has_priority', case([
        call, teamcall, action(2, 'vote', 'yes', slot=1), action(4, 'teamvote', 'yes', slot=1),
        action(5, time=31000), action(6, slot=1, time=31000)])
    yield 'zero_time_calls_do_not_become_active', case([
        action(1, 'callvote', 'map_restart', time=0), action(2, 'vote', 'yes', slot=1, time=0),
        action(3, 'callteamvote', 'leader', time=0), action(4, 'teamvote', 'yes', slot=1, time=0)])
    yield 'native_negative_start_and_wrap', case([
        action(1, 'callvote', 'fraglimit', '10', time=-2147483648),
        action(2, 'vote', 'y', slot=1, time=-2147483647), action(5, time=-2147483646)])
    yield 'engine_disable_only_blocks_new_calls', case([
        call, teamcall, action(9, '0'), action(2, 'vote', 'yes', slot=1), action(4, 'teamvote', 'yes', slot=1),
        action(5), action(6, slot=1), call, teamcall])
    # Exact guard priority, including the silent non-team gates and no connection guard.
    for kind, command in ((1, ('callvote', 'map_restart')), (3, ('callteamvote', 'leader'))):
        for allow in (0, 1, -1):
            for team in (0, 1, 2, 3):
                for phase in range(4):
                    population = {0: Client(team=team, votes=3 if phase >= 2 else 0,
                                             team_votes=3 if phase >= 2 else 0)}
                    active = 9 if phase in (1, 2) else 0
                    yield f'call_guards_{kind}_{allow}_{team}_{phase}', case(
                        [action(kind, *command)], clients=population, allow=allow,
                        global_vote=Vote(time=active), red=Vote(time=active), blue=Vote(time=active), execute=77)
        for connected in (0, 1):
            yield f'call_connection_{kind}_{connected}', case([action(kind, *command)], clients={0: Client(connected=connected)})
        for count in (-2147483648, -1, 2, 3, 2147483647):
            yield f'call_limit_{kind}_{count}', case([action(kind, *command)], clients={0: Client(votes=count, team_votes=count)})
    for command in ('map_restart', 'nextmap', 'map', 'g_gametype', 'kick', 'clientkick', 'g_doWarmup', 'timelimit', 'fraglimit'):
        for spelling in (command, command.upper()):
            yield 'allowed_' + spelling, case([action(1, 'callvote', spelling, '1')], nextmap='vstr d1')
    for index, argv in enumerate(((), ('callvote',), ('callvote', ''), ('callvote', 'say', 'hello'),
            ('callvote', 'map;', 'q3dm1'), ('callvote', 'map', 'q3dm1;quit'),
            ('callvote', 'nextmap', ';ignored'), ('callvote', 'MAP ', 'q3dm1'),
            ('callvote', 'x' * 2048, ''), ('callvote', 'map', 'q3dm1', ';third-argument'))):
        yield f'global_argument_validation_{index}', case([action(1, *argv)], execute=999, nextmap='vstr d1')
    for index, value in enumerate(('-1', '0', '1', '2', '3', '4', '5', '6', '7', '8', '', 'junk', '  +4tail', '2147483648', '-2147483649')):
        yield f'gametype_{index}', case([action(1, 'callvote', 'g_gametype', value)], execute=999)
    for index, rotation in enumerate(('', 'vstr d1', 'map q3dm6; set nextmap "vstr d1"', 'x' * 1023, 'x' * 1024, 'é' * 512)):
        for command in ('map', 'nextmap'):
            yield f'rotation_{command}_{index}', case([action(1, 'callvote', command, 'q3dm1')], nextmap=rotation, execute=999)
    yield 'rotation_query_tracks_engine_changes', case([
        action(8, 'vstr first'), action(1, 'callvote', 'map', 'q3dm1'), action(2, 'vote', 'no', slot=1), action(5),
        action(8, ''), action(1, 'callvote', 'nextmap'), action(1, 'callvote', 'map', 'q3dm2')])
    for index, value in enumerate(('', 'two words', '"quoted"', 'q3dm1\nquit', 'x' * 1022 + ';', 'x' * 1023 + ';',
                                   'x' * 1024, 'é' * 512)):
        for command in ('map', 'kick'):
            yield f'global_copy_{command}_{index}', case([action(1, 'callvote', command, value)])
    # Preserve all unrelated flag bits and only clear slots below level.maxclients.
    flagged = {i: Client(active=i % 2, connected=i % 3, team=i % 4, number=i,
                         flags=0x80084001, votes=2, team_votes=2, name=f'P{i}') for i in range(64)}
    for maximum in (0, 1, 4, 64):
        for kind, command in ((1, ('callvote', 'map_restart')), (3, ('callteamvote', 'leader'))):
            population = dict(flagged); population[63] = replace(population[63], team=2)
            yield f'flag_reset_{kind}_{maximum}', case([action(kind, *command, slot=63)], clients=population, maxclients=maximum)
    for kind, flag in ((2, 0x4000), (4, 0x80000)):
        for team in (0, 1, 2, 3):
            for pending in (0, 1):
                for flags in (0, flag):
                    yield f'cast_guards_{kind}_{team}_{pending}_{flags}', case([
                        action(kind, 'vote', 'yes')], clients={0: Client(team=team, flags=flags)}, allow=0,
                        global_vote=Vote(time=pending), red=Vote(time=pending), blue=Vote(time=pending))
        for index, value in enumerate(('', 'y', 'yes', 'Y', 'Yes', '1', '0', 'n', 'xY', 'x1', 'aYes', 'ay', ' y', 'y' * 100, 'x' * 63 + 'Y')):
            yield f'cast_text_{kind}_{index}', case([action(kind, 'vote', value), action(kind, 'vote', 'y')],
                global_vote=Vote(1), red=Vote(1), blue=Vote(1))
        yield f'cast_missing_argv_{kind}', case([action(kind)], global_vote=Vote(1), red=Vote(1))
        for value in ('yes', 'no'):
            yield f'cast_counter_wrap_{kind}_{value}', case([action(kind, 'vote', value)],
                global_vote=Vote(1, 2147483647, 2147483647), red=Vote(1, 2147483647, 2147483647))
    for index, argv in enumerate(((), ('callteamvote',), ('callteamvote', 'kick', '1'),
            ('callteamvote', 'leader;', '1'), ('callteamvote', 'leader', '1;'),
            ('callteamvote', 'leader', 'Team', 'Mate'), ('callteamvote', 'leader', '', '1'),
            ('callteamvote', 'LEADER', '1'), ('callteamvote', 'leader', 'x' * 1022, 'tail'))):
        yield f'team_arguments_{index}', case([action(3, *argv)], clients={1: Client(name='^3Team Mate', number=1)})
    for index, value in enumerate(('0', '1', '2', '3', '4', '63', '64', '99', '001tail', '000tail', '123name',
            '1tail', '12tail', '-1', '+1', ' 1', '2147483648', '', '^2Teammate', 'TEAMMATE', 'missing', 'éTeammate')):
        yield f'leader_target_{index}', case([action(3, 'callteamvote', 'leader', value)])
    for index, name in enumerate(('^1Team^2mate', 'Teammate', '^^Teammate', 'Team\tmate', 'Téammate', '^',
                                  'x' * 35, '^1' + 'x' * 33, 'Twin')):
        population = {1: Client(name=name, number=1), 2: Client(name=name, number=2, team=1)}
        yield f'leader_clean_name_{index}', case([action(3, 'callteamvote', 'leader', name)], clients=population)
    for connected in (0, 1, 2):
        for active in (0, 1):
            for team in (1, 2):
                population = {1: Client(name='Target', number=1, connected=connected, active=active, team=team)}
                for target in ('1', 'Target'):
                    yield f'leader_membership_{connected}_{active}_{team}_{target}', case([action(3, 'callteamvote', 'leader', target)], clients=population)
    yield 'leader_name_truncated_before_cleaning', case([action(3, 'callteamvote', 'leader', 'x' * 35 + 'tail')], clients={1: Client(name='x' * 35)})
    yield 'leader_self_uses_playerstate_number', case([action(3, 'callteamvote', 'leader')], clients={0: Client(number=63)})
    yield 'leader_last_slot', case([action(3, 'callteamvote', 'leader', '63')], maxclients=64, clients={63: Client(number=63)})
    yield 'leader_uppercase_executes_console', case([action(3, 'callteamvote', 'LEADER', '1'), action(4, 'teamvote', 'yes', slot=1), action(6, slot=1)])


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--case')
    parser.add_argument('--reuse-build', action='store_true')
    args = parser.parse_args()
    out = ROOT / 'build/reference/vote_commands'
    sources = build(out) if not args.reuse_build else []
    if not args.reuse_build:
        subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                        'tests/vote_command_tests.ml', '--output', 'vote_command_tests.exe'], check=True)
    bsp = out / 'vote_commands.bsp'
    bsp.write_bytes(map_bytes())
    records = []
    for name, data in scenarios():
        if args.case and args.case != name:
            continue
        inp, expected = out / (name + '.bin'), out / (name + '.expected')
        inp.write_bytes(data)
        run([out / 'spawn_oracle.exe', bsp, inp, expected, '0', '--vote-commands'], out, log=out / (name + '.oracle.log'))
        output = run([ROOT / 'build/vote_command_tests.exe', bsp, inp, expected], ROOT / 'build', log=out / (name + '.test.log'))
        match = re.search(r'(\d+) vote-command actions / (\d+) exact words / (\d+) ordered effects', output)
        if not match:
            raise RuntimeError(output)
        records.append(dict(name=name, actions=int(match[1]), exact_words=int(match[2]),
                            ordered_effects=int(match[3]), bytes=expected.stat().st_size,
                            inputs_sha256=sha(inp), expected_sha256=sha(expected)))
        if len(records) % 40 == 0 or args.case:
            print(f'{len(records)} scenarios passed ({name})', flush=True)
    if not records:
        raise RuntimeError('No matching vote-command scenario')
    output = run([ROOT / 'build/vote_command_tests.exe', bsp, out / (records[0]['name'] + '.bin'),
                  out / (records[0]['name'] + '.expected'), '--contracts'], ROOT / 'build', log=out / 'contracts.log')
    print(output.strip())
    result = dict(passed=True, scenarios=records, scenario_count=len(records),
                  actions=sum(r['actions'] for r in records), exact_words=sum(r['exact_words'] for r in records),
                  ordered_effects=sum(r['ordered_effects'] for r in records), output_bytes=sum(r['bytes'] for r in records),
                  runtime_contracts=19, test_sha256=sha(ROOT / 'build/vote_command_tests.exe'),
                  oracle_sha256=sha(out / 'spawn_oracle.exe'), map_sha256=sha(bsp),
                  scope='Unchanged Baseq3 Cmd_CallVote_f, Cmd_Vote_f, Cmd_CallTeamVote_f and Cmd_TeamVote_f, original Cmd_Argc/Argv/ArgvBuffer copies, plus complete call/cast/resolution chains. Every callback and action compares vote state, all 64 clients and 12 configstrings. Engine nextmap query is hosted; MiniLang reads its real Cvar registry. Full ClientCommand routing, command tokenization, UserinfoChanged and engine/network delivery remain open. Unsafe original team argument strcat overflow is rejected by a MiniLang contract.',
                  original_sources={s.relative_to(ROOT).as_posix(): sha(s) for s in sources})
    report = out / ('result.json' if not args.case else args.case + '.result.json')
    # A reused local build must not replace the provenance-bearing full report.
    if args.reuse_build:
        report = out / ('reused-' + (args.case or 'all') + '.json')
    report.write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8', newline='\n')
    print(f"PASS: {len(records)} scenarios / {result['actions']} actions / {result['exact_words']} exact words / {result['ordered_effects']} ordered effects")


if __name__ == '__main__':
    main()
