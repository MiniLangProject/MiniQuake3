"""Original Baseq3 userinfo, name cleaning, team selection and real vote callers."""
import argparse
from dataclasses import dataclass, replace
import json
import random
import re
import subprocess
import sys

from inventory import sha
from spawn_oracle import build
from test_bodies import map_bytes
from test_votes import ints, text
from toolchain import ROOT, run


def info(**changes):
    values = dict(name='Ranger', ip='localhost', cg_predictItems='1', handicap='75',
                  model='sarge/default', headmodel='visor/default', team_model='james/red',
                  team_headmodel='major/blue', color1='4', color2='5', g_redteam='Stroggs',
                  g_blueteam='Pagans', teamtask='2', teamoverlay='1', skill='3')
    values.update(changes)
    return ''.join('\\' + k + '\\' + v for k, v in values.items())


@dataclass(frozen=True)
class Client:
    bound: int = 1
    active: int = 1
    flags: int = 0
    connected: int = 2
    team: int = 1
    spectator: int = 0
    local: int = 0
    predict: int = 0
    health: int = 88
    overlay: int = 0
    wins: int = 17
    losses: int = 19
    leader: int = 0
    fixed: int = 1
    votes: int = 2
    team_votes: int = 2
    name: str = '^2Old Name'
    userinfo: str = info(name='StoredName')


def action(kind=1, first=None, second='', *, slot=0, param=0, time=1000):
    return kind, time, slot, param, info() if first is None else first, second


def case(actions, clients=None, maxclients=4, gametype=0, time=1000, redscore=0, bluescore=0, location_time=0):
    data = ints(maxclients, gametype, time, redscore, bluescore, location_time)
    population = {0: Client(), 1: Client(name='Mate'), 2: Client(team=2, name='Blue'), 3: Client(team=3, name='Spectator')}
    population.update(clients or {})
    for slot in range(64):
        c = population.get(slot, Client(active=0, connected=0, team=0, name='', userinfo=''))
        data += ints(c.bound, c.active, c.flags, c.connected, c.team, c.spectator,
                     c.local, c.predict, c.health, c.overlay, c.wins, c.losses, c.leader, c.fixed, c.votes, c.team_votes)
        state = [0] * 117
        state[0], state[26], state[35], state[36], state[41] = 1234 + slot, 0x40000004, slot, 2, 26
        state[46:62] = [200 + slot * 16 + i for i in range(16)]
        state[62:78] = [400 + slot * 16 + i for i in range(16)]
        state[90], state[113] = 123, 60 + slot  # guard-like powerup and ping remain untouched in Baseq3.
        data += ints(*state) + text(c.name) + text(c.userinfo)
    data += ints(len(actions))
    for kind, at, slot, param, first, second in actions:
        data += ints(kind, at, slot, param) + text(first) + text(second)
    return data


def scenarios():
    yield 'human_full_profile_and_repeat', case([action(), action()])
    yield 'local_flag_stays_set', case([action(first=info(ip='localhost')), action(first=info(ip='203.0.113.9'))])
    yield 'rename_case_and_colors', case([action(first=info(name='Ranger')), action(first=info(name='ranger')),
                                         action(first=info(name='^1ranger')), action(first=info(name='^0ranger'))])
    for connected in (0, 1, 2):
        yield f'connection_{connected}', case([action()], clients={0: Client(connected=connected)})
    for gametype in (-1, 0, 1, 2, 3, 4, 5, 7, 8):
        for flags in (0, 8, 0x208):
            yield f'model_and_bot_{gametype}_{flags}', case([action()], gametype=gametype, clients={0: Client(flags=flags, team=3)})
    for team in (0, 1, 2, 3):
        for spectator in (0, 1, 2, 3):
            yield f'spectator_name_{team}_{spectator}', case([action()], clients={0: Client(team=team, spectator=spectator)})
    for index, value in enumerate(('', 'localhost', 'LOCALHOST', 'localhost:27960', '127.0.0.1', '::1')):
        yield f'local_ip_{index}', case([action(first=info(ip=value))])
    for key in ('cg_predictItems', 'teamoverlay', 'handicap', 'teamtask'):
        for index, value in enumerate(('', '0', '1', '-1', '100', '101', 'junk', ' +25tail', '2147483648', '-2147483649')):
            yield f'integer_{key}_{index}', case([action(first=info(**{key: value}))])
    for index, raw in enumerate(('', '\\', 'name', '\\name\\', 'name\\NoLeading',
            '\\name\\First\\NAME\\Second\\HaNdIcAp\\25\\handicap\\90',
            '\\NaMe\\MiXeD\\IP\\localhost\\CG_PREDICTITEMS\\1\\HANDICAP\\15\\TEAMOVERLAY\\0',
            '\\name\\semi;colon', '\\name\\quote"name', '\\model\\bad;model\\name\\OK',
            '\\name\\Line\nBreak', '\\name\\Tabs\tStay', '\\name\\utf8-äé中',
            '\\name\\^1Team   ^2    Member', '\\name\\^0^8^@BlackRemoved',
            '\\name\\^1', '\\name\\abc^', '\\name\\^^', '\\name\\^7 ')):
        yield f'userinfo_text_{index}', case([action(first=raw)])
    for slot in (0, 63):
        for maximum in (0, 1, 64):
            yield f'slot_and_clientlimit_{slot}_{maximum}', case([action(slot=slot)], maxclients=maximum)
    for index, length in enumerate((62, 63, 64, 65, 127)):
        yield f'model_byte_capacity_{index}', case([action(first=info(model='x' * length, headmodel='é' * length))])
    for index, suffix in enumerate((';', '"', '\\name\\Tail', 'é')):
        for prefix_length in (1022, 1023, 1024):
            yield f'userinfo_copy_{index}_{prefix_length}', case([action(first='x' * prefix_length + suffix)])
    yield 'long_human_configstring_is_not_truncated', case([action(first='\\name\\N\\color1\\' + 'x' * 1007)])
    yield 'long_bot_configstring_is_not_truncated', case([action(first='\\name\\B\\skill\\' + 'x' * 1008)], clients={0: Client(flags=8)})
    yield 'native_win_loss_limits', case([action()], clients={0: Client(wins=2147483647, losses=-2147483648, leader=1)})
    # Bot display team can differ from session team; TeamCount includes connecting players.
    for wanted in ('red', 'r', 'RED', 'blue', 'B', 'spectator', '', ' Red'):
        yield f'bot_team_{wanted or "empty"}', case([action(first=info(team=wanted))], gametype=4, clients={0: Client(flags=8, team=3)})
    for red, blue in ((0, 0), (1, 0), (0, 1), (-2147483648, 2147483647), (2147483647, -2147483648)):
        yield f'pick_equal_counts_scores_{red}_{blue}', case([action(5, '', param=-1), action(first=info(team='auto'))],
            gametype=4, redscore=red, bluescore=blue, clients={0: Client(flags=8, team=3)})
    for connected in (0, 1, 2):
        for team in (1, 2):
            yield f'pick_counts_{connected}_{team}', case([action(5, '', param=-1), action(5, '', param=0), action(5, '', param=63)],
                clients={0: Client(team=team, connected=connected), 1: Client(team=team, connected=connected)})
    yield 'pick_no_clients', case([action(5, '', param=-1)], maxclients=0)
    yield 'leader_first_connected_including_connecting', case([action(6, '', param=1), action(6, '', param=2), action(6, '', param=3)],
        clients={0: Client(connected=0, leader=1), 1: Client(connected=1, leader=1), 2: Client(team=1, leader=1)})
    yield 'leader_no_clients', case([action(6, '', param=1)], maxclients=0)
    yield 'leader_slot63', case([action(6, '', param=1)], maxclients=64, clients={63: Client(leader=1)})
    yield 'set_leader_actual_userinfo_and_reselect', case([action(7, '', slot=1, param=1), action(7, '', slot=1, param=1)],
        clients={0: Client(leader=1), 1: Client(userinfo=info(name='^1New Leader', handicap='23'))})
    yield 'set_leader_clears_multiple_and_connecting', case([action(7, '', slot=2, param=1)],
        clients={0: Client(leader=1), 1: Client(connected=0, leader=1), 2: Client(team=1, connected=1)})
    for connected, team in ((0, 1), (2, 2)):
        yield f'set_leader_rejected_{connected}_{team}', case([action(7, '', slot=1, param=1)],
            clients={1: Client(connected=connected, team=team)})
    yield 'team_vote_to_actual_userinfo', case([action(8, 'leader', '1'), action(9, 'yes', slot=1), action(10, '', param=1)],
        gametype=3, clients={0: Client(leader=1), 1: Client(userinfo=info(name='Elected', handicap='42'))})
    yield 'blue_team_vote_to_actual_userinfo', case([action(8, 'leader', '3', slot=2), action(9, 'yes', slot=3), action(10, '', param=2)],
        gametype=4, clients={2: Client(team=2, leader=1), 3: Client(team=2)})
    yield 'uppercase_leader_keeps_console_boundary', case([action(8, 'LEADER', '1'), action(9, 'yes', slot=1), action(10, '', param=1)])
    yield 'userinfo_overlay_enable_disable', case([action(first=info(teamoverlay='1')), action(12, '', time=1001),
        action(first=info(teamoverlay='0'), time=1002), action(12, '', time=2002),
        action(first=info(teamoverlay=''), time=2003), action(12, '', time=3003)], gametype=3)
    # Pure helper batches: boundary sizes, color/space quirks, no locale normalization.
    names = ['', ' ', '    ', '^', '^^', '^1', '^1^2', '^0', '^8Black', '^@Black',
             '^1   Name', 'Name    Tail', 'Name   ^1   Tail', '^1 ^2', 'Name^',
             '\t Leading tab', 'Line\nBreak', '\x01Control\x7f', 'äé中', 'x' * 200]
    rng = random.Random(0xC11E17)
    names += [''.join(rng.choice('abcdef  ^0123456789@Hxp\t\nÄ中') for _ in range(rng.randrange(1, 160))) for _ in range(80)]
    for capacity in (2, 3, 4, 5, 8, 13, 14, 15, 35, 36, 37, 64, 128):
        yield f'clean_name_capacity_{capacity}', case([action(2, name, param=capacity) for name in names])
    for color in range(1, 256):
        # Group all byte values through valid UTF-8 strings; C sees the same encoded bytes.
        if color % 32 == 1:
            color_actions = []
        color_actions += [action(2, '^' + chr(color) + 'Name', param=36)]
        if color % 32 == 0 or color == 255:
            yield f'clean_color_group_{color}', case(color_actions)
    pairs = [('', ''), ('', 'name'), ('name', 'name'), ('name\\value', 'name'),
             ('\\NaMe\\first\\name\\last', 'NAME'), ('\\name\\\\other\\value', 'name'),
             ('\\\\empty-key\\name\\value', ''), ('\\name\\value\\dangling', 'dangling'),
             ('name\\value\\', 'name'), ('\\name\\a;b"c\n', 'name'),
             ('\\Ä\\upper\\ä\\lower', 'ä'), ('x' * 8191, 'x'), ('\\x\\' + 'v' * 8188, 'x')]
    for _ in range(160):
        raw = ''.join(rng.choice('abcABC\\ 123;"\n') for _ in range(rng.randrange(100)))
        pairs.append((raw, rng.choice(('', 'a', 'A', 'abc', '\\', '1'))))
    yield 'info_lookup_native_parsing', case([action(3, raw, key) for raw, key in pairs])
    yield 'info_lookup_null_inputs', case([action(3, 'x' * 8192, 'key', param=mask) for mask in (1, 2, 3)])
    yield 'info_validate_only_two_forbidden_bytes', case([action(4, raw) for raw in ('', '\\', 'missing delimiter', '\n\t',
        '\\name\\valid', '\\name\\semi;colon', '\\name\\quote"name', 'x' * 8192, 'äé中')])


def main():
    parser = argparse.ArgumentParser(); parser.add_argument('--case'); parser.add_argument('--reuse-build', action='store_true'); args = parser.parse_args()
    out = ROOT / 'build/reference/client_info'
    sources = build(out) if not args.reuse_build else []
    if not args.reuse_build:
        subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source', 'tests/client_info_tests.ml', '--output', 'client_info_tests.exe'], check=True)
    bsp = out / 'client_info.bsp'; bsp.write_bytes(map_bytes()); records = []
    for name, data in scenarios():
        if args.case and args.case != name: continue
        inp, expected = out / (name + '.bin'), out / (name + '.expected'); inp.write_bytes(data)
        run([out / 'spawn_oracle.exe', bsp, inp, expected, '0', '--client-info'], out, log=out / (name + '.oracle.log'))
        output = run([ROOT / 'build/client_info_tests.exe', bsp, inp, expected], ROOT / 'build', log=out / (name + '.test.log'))
        match = re.search(r'(\d+) userinfo actions / (\d+) exact words / (\d+) ordered effects', output)
        if not match: raise RuntimeError(output)
        records.append(dict(name=name, actions=int(match[1]), exact_words=int(match[2]), ordered_effects=int(match[3]),
                            bytes=expected.stat().st_size, inputs_sha256=sha(inp), expected_sha256=sha(expected)))
        if len(records) % 20 == 0 or args.case: print(f'{len(records)} scenarios passed ({name})', flush=True)
    if not records: raise RuntimeError('No matching userinfo scenario')
    first = records[0]['name']
    output = run([ROOT / 'build/client_info_tests.exe', bsp, out / (first + '.bin'), out / (first + '.expected'), '--contracts'],
                 ROOT / 'build', log=out / 'contracts.log'); print(output.strip())
    rejections = []
    for name, data, status in [('oversize_info', case([action(3, 'x' * 8192, 'x')]), 41),
                               ('name_fallback_capacity', case([action(2, '', param=1)]), 40)]:
        inp, expected = out / (name + '.bin'), out / (name + '.expected'); inp.write_bytes(data)
        result = subprocess.run([out / 'spawn_oracle.exe', bsp, inp, expected, '0', '--client-info'], capture_output=True, text=True)
        assert result.returncode == status, (name, result.returncode, result.stderr)
        rejections.append(dict(name=name, status=status, message=result.stderr.strip(), inputs_sha256=sha(inp)))
    result = dict(passed=True, scenarios=records, scenario_count=len(records), actions=sum(r['actions'] for r in records),
                  exact_words=sum(r['exact_words'] for r in records), ordered_effects=sum(r['ordered_effects'] for r in records),
                  output_bytes=sum(r['bytes'] for r in records), runtime_contracts=18, native_rejections=rejections,
                  test_sha256=sha(ROOT / 'build/client_info_tests.exe'), oracle_sha256=sha(out / 'spawn_oracle.exe'), map_sha256=sha(bsp),
                  scope='Unchanged Baseq3 ClientUserinfoChanged/ClientCleanName/TeamLeader/PickTeam and original Info_ValueForKey/Info_Validate. Full 117-word playerStates plus relevant client/session/entity fields, 64 player configstrings and team-vote state are compared before every engine delivery and after stateful actions. Team leader changes and complete team vote/overlay sequences use actual ported userinfo. Pure helpers have separate exact result batches. Userinfo transport, server commands, configstring broadcasting and log-file writes remain observed host boundaries; ClientConnect, session persistence, Missionpack and networking remain open.',
                  original_sources={s.relative_to(ROOT).as_posix(): sha(s) for s in sources})
    report = out / ('result.json' if not args.case else args.case + '.result.json')
    if args.reuse_build: report = out / ('reused-' + (args.case or 'all') + '.json')
    report.write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8', newline='\n')
    print(f"PASS: {len(records)} scenarios / {result['actions']} actions / {result['exact_words']} exact words / {result['ordered_effects']} ordered effects")


if __name__ == '__main__': main()
