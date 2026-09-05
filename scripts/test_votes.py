"""Compare unchanged Baseq3 voting/leadership and their G_RunFrame integration."""
import argparse
from dataclasses import dataclass
import json
import re
import struct
import subprocess
import sys

from inventory import sha
from spawn_oracle import build
from test_bodies import map_bytes
from toolchain import ROOT, run


@dataclass(frozen=True)
class Vote:
    time: int = 0
    yes: int = 0
    no: int = 0
    voters: int = 4
    command: str = 'map q3dm1'


def i32(value):
    return (value + 0x80000000) % 0x100000000 - 0x80000000


def ints(*values):
    return struct.pack('<' + 'i' * len(values), *(i32(v) for v in values))


def text(value):
    data = value.encode('utf-8')
    return ints(len(data)) + data


def client(team=1, connected=2, leader=0, bot=False, name='^1Player'):
    return (connected, team, leader, 8 if bot else 0, name)


def case(actions, global_vote=Vote(), red=Vote(command='say red'),
         blue=Vote(command='say blue'), execute=0, clients=None, maxclients=4, time=1000):
    data = ints(maxclients, time, global_vote.time, execute, global_vote.yes,
                global_vote.no, global_vote.voters,
                red.time, red.yes, red.no, red.voters,
                blue.time, blue.yes, blue.no, blue.voters)
    data += text(global_vote.command) + text(red.command) + text(blue.command)
    for slot in range(64):
        fields = (clients or {}).get(slot, (0, 0, 0, 0, ''))
        data += ints(*fields[:4]) + text(fields[4])
    data += ints(len(actions))
    for action in actions:
        data += ints(*action)
    return data


def scenarios():
    yield 'inactive', case([(1, 1000, 0, 0), (2, 1000, 1, 0), (2, 1000, 2, 0), (2, 1000, 3, 0)])
    yield 'global_pass_execute_once', case(
        [(1, t, 0, 0) for t in (1000, 3999, 4000, 4001, 5000)], global_vote=Vote(100, 3))
    yield 'global_timeout_priority', case(
        [(1, 30100, 0, 0)], global_vote=Vote(100, 4))
    yield 'global_timeout_edge', case(
        [(1, 30099, 0, 0), (1, 30100, 0, 0), (1, 30101, 0, 0)], global_vote=Vote(100))
    yield 'old_execution_before_new_resolution', case(
        [(1, 1000, 0, 0), (1, 4001, 0, 0)], global_vote=Vote(100, 3), execute=999)
    yield 'execution_equal_then_due', case([(1, 1000, 0, 0), (1, 1001, 0, 0)], execute=1000)
    yield 'execution_before_timeout', case([(1, 30100, 0, 0)], global_vote=Vote(100), execute=1000)
    yield 'wrapped_vote_timeout', case(
        [(1, i32(0x7ffffff0 + delta), 0, 0) for delta in (29999, 30000)],
        global_vote=Vote(0x7ffffff0))
    yield 'wrapped_execution_schedule', case(
        [(1, t, 0, 0) for t in (0x7ffffff0, 0x7ffffff1, -0x7ffffff0)],
        global_vote=Vote(0x7fffff00, 3))
    yield 'execution_zero_sentinel', case(
        [(1, -3000, 0, 0), (1, 1, 0, 0)], global_vote=Vote(-3100, 3))
    yield 'negative_elapsed_wait', case([(1, 99, 0, 0)], global_vote=Vote(100))
    yield 'global_command_capacity', case([(1, 1000, 0, 0)], execute=999,
                                          global_vote=Vote(command='x' * 1023))
    yield 'global_command_newlines', case([(1, 1000, 0, 0)], execute=999,
                                          global_vote=Vote(command='say "hello";\nmap q3dm6\n'))
    for team in (1, 2):
        key = 'red' if team == 1 else 'blue'
        yield key + '_pass_once', case([(2, t, team, 0) for t in (1000, 1001)], **{key: Vote(100, 3)})
        yield key + '_timeout_priority', case([(2, 30100, team, 0)], **{key: Vote(100, 4)})
        yield key + '_timeout_edge', case([(2, t, team, 0) for t in (30099, 30100)], **{key: Vote(100)})
        yield key + '_wrapped_timeout', case(
            [(2, i32(0x7ffffff0 + d), team, 0) for d in (29999, 30000)], **{key: Vote(0x7ffffff0)})
    yield 'invalid_team_keeps_pending_votes', case([(2, 1000, t, 0) for t in (0, 3, -1, 64)],
                                                   red=Vote(100, 3), blue=Vote(100, 3))
    leaders = {0: client(leader=1, name='^1Old'), 1: client(name='^2New'),
               2: client(team=2, leader=1), 3: client(connected=0, name='offline')}
    yield 'leader_vote_reset_then_set', case([(2, 1000, 1, 0)], clients=leaders,
                                            red=Vote(100, 3, command='leader 1'))
    yield 'leader_disconnected_still_passes_vote', case([(2, 1000, 1, 0)], clients=leaders,
                                                       red=Vote(100, 3, command='leader 3'))
    yield 'leader_changed_team_still_passes_vote', case([(2, 1000, 1, 0)], clients=leaders,
                                                       red=Vote(100, 3, command='leader 2'))
    for index, command in enumerate(('leaderx1', 'leader +1tail', 'leader\t1', 'leader ', 'leader junk')):
        yield f'leader_original_prefix_atoi_{index}', case([(2, 1000, 1, 0)], clients=leaders,
                                                          red=Vote(100, 3, command=command))
    yield 'leader_case_sensitive_console', case([(2, 1000, 1, 0)], clients=leaders,
                                               red=Vote(100, 3, command='Leader 1'))
    yield 'set_leader_reselect', case([(3, 1000, 1, 0)], clients=leaders)
    yield 'set_leader_clear_multiple', case([(3, 1000, 1, 2)], clients={
        0: client(leader=1), 1: client(leader=1), 2: client(connected=1, name='^3Connecting')})
    yield 'set_leader_last_slot', case([(3, 1000, 2, 63)], maxclients=64,
        clients={0: client(team=2, leader=1), 63: client(team=2, name='Last')})
    yield 'set_leader_outside_scan', case([(3, 1000, 1, 63)], maxclients=1,
                                         clients={0: client(), 63: client(name='Beyond maxclients')})
    yield 'print_team_disconnected_and_empty', case(
        [(5, 1000, t, 0) for t in (1, 2, 3, 0)], clients=leaders)
    yield 'check_leader_two_original_loops', case([(4, 1000, 1, 0), (4, 1001, 1, 0)],
                                                 clients={0: client(bot=True), 1: client()})
    yield 'check_leader_existing_disconnected', case([(4, 1000, 1, 0)],
        clients={0: client(), 1: client(connected=0, leader=1)})
    yield 'check_leader_bots_only', case([(4, 1000, 1, 0)], clients={0: client(bot=True), 1: client(bot=True)})
    yield 'check_leader_disconnected_human', case([(4, 1000, 1, 0)], clients={0: client(bot=True), 1: client(connected=0)})
    yield 'check_leader_empty_team', case([(4, 1000, 1, 0)], maxclients=0)
    yield 'frame_votes_and_delayed_command', case(
        [(6, 1000, 0, 0), (6, 4000, 0, 0), (6, 4001, 0, 0)], clients=leaders,
        global_vote=Vote(100, 3), red=Vote(100, 3, command='leader 1'), blue=Vote(100, 3))
    yield 'frame_existing_command_then_failures', case([(6, 30100, 0, 0)], execute=999,
        global_vote=Vote(100, 4), red=Vote(100, 4), blue=Vote(100, 4))
    # C's integer truncation and asymmetric yes/no thresholds, including native int edges.
    for voters in (0, 1, 2, 3, 4, 5, 31, 32, 63, 64, -1, -3, -0x80000000, 0x7fffffff):
        half = abs(voters) // 2 * (-1 if voters < 0 else 1)
        for mode in (0, 1, 2):
            for pattern, (yes, no) in enumerate(((half, half - 1), (half + 1, 0), (0, half), (half + 1, half))):
                vote = Vote(100, yes, no, voters)
                key = ('global_vote', 'red', 'blue')[mode]
                yield f'majority_{voters}_{mode}_{pattern}', case(
                    [(1 if mode == 0 else 2, 1000, mode, 0)], **{key: vote})


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--case')
    args = parser.parse_args()
    out = ROOT / 'build/reference/votes'
    sources = build(out)
    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source',
                    'tests/vote_tests.ml', '--output', 'vote_tests.exe'], check=True)
    bsp = out / 'votes.bsp'
    bsp.write_bytes(map_bytes())
    records = []
    for name, data in scenarios():
        if args.case and args.case != name:
            continue
        inp, expected = out / (name + '.bin'), out / (name + '.expected')
        inp.write_bytes(data)
        run([out / 'spawn_oracle.exe', bsp, inp, expected, '0', '--votes'], out, log=out / (name + '.oracle.log'))
        output = run([ROOT / 'build/vote_tests.exe', bsp, inp, expected], ROOT / 'build', log=out / (name + '.test.log'))
        match = re.search(r'(\d+) vote/leader actions / (\d+) exact words / (\d+) ordered effects', output)
        if not match:
            raise RuntimeError(output)
        records.append(dict(name=name, actions=int(match[1]), exact_words=int(match[2]),
                            ordered_effects=int(match[3]), bytes=expected.stat().st_size,
                            inputs_sha256=sha(inp), expected_sha256=sha(expected)))
        if not name.startswith('majority_'):
            print(f'{name}: PASS {match[1]} actions / {match[2]} exact words / {match[3]} effects', flush=True)
    if not records:
        raise RuntimeError('No matching vote scenario')
    output = run([ROOT / 'build/vote_tests.exe', bsp, out / (records[0]['name'] + '.bin'),
                  out / (records[0]['name'] + '.expected'), '--contracts'], ROOT / 'build', log=out / 'contracts.log')
    print(output.strip())
    result = dict(passed=True, scenarios=records, scenario_count=len(records),
                  actions=sum(r['actions'] for r in records), exact_words=sum(r['exact_words'] for r in records),
                  ordered_effects=sum(r['ordered_effects'] for r in records), output_bytes=sum(r['bytes'] for r in records),
                  runtime_contracts=11, test_sha256=sha(ROOT / 'build/vote_tests.exe'),
                  oracle_sha256=sha(out / 'spawn_oracle.exe'), map_sha256=sha(bsp),
                  scope='Unchanged Baseq3 CheckVote, CheckTeamVote, PrintTeam, SetLeader and CheckTeamLeader: state, messages, console commands, configstrings, leadership and actual G_RunFrame integration. ClientUserinfoChanged and engine delivery remain observed callbacks. Vote initiation and casting are compared separately by test_vote_commands.py; network transport remains open.',
                  original_sources={s.relative_to(ROOT).as_posix(): sha(s) for s in sources})
    report = out / ('result.json' if not args.case else args.case + '.result.json')
    report.write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8')
    print(f"PASS: {len(records)} scenarios / {result['actions']} actions / {result['exact_words']} exact words / {result['ordered_effects']} ordered effects")


if __name__ == '__main__':
    main()
