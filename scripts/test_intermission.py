"""Differential Baseq3 intermission placement, begin and level-exit lifecycle."""
import argparse
import json
import re
import subprocess
import sys
from dataclasses import replace
from inventory import sha
from spawn_oracle import build
from test_team_changes import Client, action, case
from test_bodies import map_bytes
from toolchain import ROOT, run

WATCH = Client(team=3, spectator=2, target=1, name='Watcher', powers=0x7ffe)


def scenarios():
    yield 'move_clears_only_original_fields', case([action(33), action(19)], clients={0:Client(powers=0x7ffe)})
    for state in range(4):
        yield f'move_spectator_state_{state}', case([action(33), action(19)], clients={0:replace(WATCH, spectator=state, svflags=0x208, psnum=7)})
    yield 'move_persistent_client_alias', case([action(6, p0=1), action(33), action(19)], clients={1:replace(WATCH, svflags=0x208)})
    yield 'move_inactive_bound_client', case([action(33), action(19)], clients={0:Client(active=0, connected=0)})
    yield 'move_zero_client_limit', case([action(33), action(19)], maxclients=0)
    yield 'move_last_slot', case([action(33, slot=63), action(19, slot=63)], maxclients=64, clients={63:WATCH})
    yield 'move_repeated', case([action(33), action(19), action(19, time=1001)])
    yield 'move_dead_keeps_health', case([action(33), action(19)], clients={0:Client(health=-25, pmtype=3)})

    yield 'begin_existing_guard', case([action(27, 'pending-map', p0=1), action(20)], intermission=995, gametype=1)
    yield 'begin_twice', case([action(24), action(20), action(20, time=1001)])
    yield 'begin_at_zero_runs_again', case([action(20, time=0), action(20, time=0)])
    for connected in (0, 1, 2):
        for team in (0, 3):
            for active in (0, 1):
                yield f'begin_connection_{connected}_team_{team}_inuse_{active}', case(
                    [action(20)], clients={0:Client(connected=connected, team=team, active=active, spectator=2 if team==3 else 0)})
    for game, team in ((3, 1), (3, 2), (4, 1), (4, 2)):
        yield f'begin_team_{game}_{team}', case([action(20)], gametype=game, clients={0:Client(team=team)})
    for health in (0, -25, -41):
        yield f'begin_respawns_health_{health}', case([action(24), action(20)], clients={0:Client(health=health, pmtype=3)})
    yield 'begin_dead_bot', case([action(20)], clients={0:Client(health=-25, pmtype=3, svflags=8)})
    yield 'begin_dead_following_spectator', case([action(20)], clients={0:replace(WATCH, health=-25, pmtype=3)})
    yield 'begin_dead_following_player', case([action(20)], clients={0:Client(health=-25, pmtype=3, spectator=2, target=1)})
    yield 'begin_zero_clients', case([action(20)], maxclients=0)
    yield 'begin_last_slot_and_sparse_population', case([action(24), action(20)], maxclients=64, clients={63:Client(health=-10, pmtype=3, name='Last')})
    yield 'begin_camera_target_found', case([action(31, 'camera', p0=1), action(20)])
    yield 'begin_camera_target_missing', case([action(31, 'missing', p0=0), action(20)])
    yield 'begin_camera_fallback_spawnpoint', case([action(30, p0=0), action(20)])
    yield 'begin_unbound_inactive_clients_skipped', case([action(20)], clients={0:Client(bound=0, active=0, connected=0)})
    yield 'begin_singleplayer_hook_order', case([action(24), action(20), action(23, time=30000)], gametype=2)

    for kind, name in ((29, 'spawn'), (34, 'client_begin'), (35, 'respawn')):
        yield f'intermission_real_{name}', case([action(33), action(kind)], intermission=995, clients={0:Client(health=-10 if kind==35 else 100, pmtype=3 if kind==35 else 0)})
        yield f'intermission_real_{name}_follower', case([action(33), action(kind)], intermission=995, clients={0:WATCH})
    yield 'client_arrives_after_begin', case([action(20), action(34, slot=2, time=3000)], clients={2:Client(connected=1, active=0, name='Late')})

    yield 'duel_begin_updates_ranked_scores', case([action(24), action(20)], gametype=1, clients={0:Client(wins=2147483647, losses=2147483647), 1:Client(score=30, wins=2147483647, losses=2147483647)})
    yield 'duel_begin_same_rank', case([action(20)], gametype=1, first=0, second=0)
    yield 'duel_begin_disconnected_rank', case([action(20)], gametype=1, clients={0:Client(connected=0, active=0), 1:Client(connected=1)})
    yield 'duel_exit_loser_then_queue_countdown', case(
        [action(24), action(20), action(27, 'duel-next', p0=0), action(21, time=2000), action(14, time=3000)],
        gametype=1, clients={2:replace(WATCH, name='Queued', spectator=1, target=0, spectime=100)})
    yield 'duel_exit_restarted_guard_after_bot', case([action(27, 'preserved', p0=1), action(21), action(21, time=1001)], gametype=1, intermission=995)
    yield 'duel_exit_without_two_players', case([action(17, p0=1), action(27, 'pending', p0=0), action(21)], gametype=1, intermission=995)
    yield 'duel_exit_repeated', case([action(24), action(20), action(21, time=2000), action(21, time=2001)], gametype=1)

    for game in (0, 2, 3, 4):
        yield f'exit_game_{game}', case([action(27, 'pending-map', p0=0), action(21)], gametype=game, intermission=995, redscore=123, bluescore=-45)
    for connected in (0, 1, 2):
        yield f'exit_connection_{connected}', case([action(21)], intermission=995, clients={0:Client(connected=connected, score=123, wins=17, losses=-9, leader=17)})
    for limit, cvar in ((0, 4), (4, 0), (2, 4), (4, 2), (64, 64)):
        yield f'exit_limits_{limit}_{cvar}', case(
            [action(25, p0=cvar), action(21)], maxclients=limit, intermission=995, redscore=99, bluescore=88,
            clients={2:Client(score=21), 3:replace(WATCH, score=22), 63:Client(score=63, name='Last')})
    yield 'exit_sessions_before_connecting', case([action(21)], clients={0:replace(WATCH, spectime=-2147483648, wins=2147483647, losses=-2147483648, leader=17), 1:Client(score=-9)})
    yield 'exit_repeated_keeps_prior_sessions', case([action(21), action(21, time=1001)])
    yield 'exit_normal_ignores_restarted', case([action(27, 'pending-map', p0=1), action(21)], intermission=995)

    yield 'ready_all_five_second_boundary', case([action(20), action(26, p0=1), action(26, slot=1, p0=1), action(23, time=5999), action(23, time=6000)])
    yield 'ready_partial_ten_second_wait', case([action(20), action(26, p0=1), action(23, time=6000), action(23, time=15999), action(23, time=16000)])
    yield 'ready_withdraw_and_restart_wait', case([action(20), action(26, p0=1), action(23, time=6000), action(26, p0=0, time=6500), action(23, time=7000), action(26, p0=1, time=8000), action(23, time=8000), action(23, time=18000)])
    yield 'ready_none_remains', case([action(20), action(23, time=30000)])
    yield 'ready_bot_excluded', case([action(20), action(26, p0=1), action(23, time=6000)], clients={1:Client(svflags=8)})
    yield 'ready_connecting_excluded', case([action(20), action(26, p0=1), action(23, time=6000)], clients={1:Client(connected=1)})
    yield 'ready_slot_16_no_mask_bit', case([action(20), action(26, p0=1), action(26, slot=1, p0=1), action(26, slot=16, p0=1), action(23, time=6000)], maxclients=17, clients={16:Client(name='Sixteen')})
    yield 'ready_through_check_exit_rules', case([action(20), action(26, p0=1), action(26, slot=1, p0=1), action(22, time=6000)])
    yield 'ready_duel_real_exit', case([action(24), action(20), action(26, p0=1), action(26, slot=1, p0=1), action(22, time=6000)], gametype=1)
    yield 'queued_begin_delay_boundary', case([action(28, p0=1000), action(22, time=1999), action(22, time=2000)])
    yield 'fraglimit_log_queue_begin', case([action(24), action(36, '10', p0=0), action(22, time=2000), action(22, time=2999), action(22, time=3000)])
    yield 'timelimit_log_queue_begin', case([action(24), action(36, '0', p0=1), action(22, time=61000), action(22, time=62000)])
    yield 'calculate_ranks_starts_queued_intermission', case([action(28, p0=1000), action(24, time=2000)])


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--case')
    parser.add_argument('--reuse-build', action='store_true')
    args = parser.parse_args()
    out = ROOT/'build/reference/intermission'
    sources = build(out) if not args.reuse_build else []
    if not args.reuse_build:
        subprocess.run([sys.executable, ROOT/'scripts/build.py', '--source', 'tests/team_change_tests.ml', '--output', 'team_change_tests.exe'], check=True)
    bsp = out/'intermission.bsp'
    bsp.write_bytes(map_bytes())
    records = []
    for name, data in scenarios():
        if args.case and args.case != name:
            continue
        safe = re.sub(r'[^a-zA-Z0-9_-]', '_', name)
        inp, expected = out/(safe+'.bin'), out/(safe+'.expected')
        inp.write_bytes(data)
        run([out/'spawn_oracle.exe', bsp, inp, expected, '0', '--intermission'], out, log=out/(safe+'.oracle.log'), timeout=30)
        output = run([ROOT/'build/team_change_tests.exe', bsp, inp, expected, '--intermission'], ROOT/'build', log=out/(safe+'.test.log'), timeout=30)
        match = re.search(r'(\d+) team change actions / (\d+) exact words / (\d+) ordered effects', output)
        if not match:
            raise RuntimeError(output)
        records.append(dict(name=name, actions=int(match[1]), exact_words=int(match[2]), ordered_effects=int(match[3]), bytes=expected.stat().st_size, inputs_sha256=sha(inp), expected_sha256=sha(expected)))
        if len(records)%10 == 0 or args.case:
            print(f'{len(records)} intermission scenarios passed ({name})', flush=True)
    if not records:
        raise RuntimeError('No matching intermission scenario')
    output = run([ROOT/'build/team_change_tests.exe', bsp, inp, expected, '--intermission-contracts'], ROOT/'build', log=out/'contracts.log')
    print(output.strip())
    contracts = int(re.search(r'(\d+) intermission runtime contracts', output)[1])
    result = dict(passed=True, scenarios=records, scenario_count=len(records), actions=sum(r['actions'] for r in records), exact_words=sum(r['exact_words'] for r in records), ordered_effects=sum(r['ordered_effects'] for r in records), output_bytes=sum(r['bytes'] for r in records), runtime_contracts=contracts,
                  test_sha256=sha(ROOT/'build/team_change_tests.exe'), oracle_sha256=sha(out/'spawn_oracle.exe'), map_sha256=sha(bsp),
                  scope='Unchanged Baseq3 MoveClientToIntermission, BeginIntermission and ExitLevel. Actual StopFollowing, FindIntermissionPoint, respawn, ClientSpawn/Begin, tournament win/loss/loser/promotion, rank/scoreboard/exit/readiness and session writes. All modeled clients and entityStates, selected private/spatial fields, camera, restart/changemap, readiness, score limits, configs and session Cvars are compared at every host effect and action. BotInterbreedEndMatch, UpdateTournamentInfo and SpawnModelsOnVictoryPads remain observed explicit hooks; engine delivery and ClientThink/EndFrame remain boundaries. No Missionpack or whole-engine playability claim.',
                  original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources})
    name = ('reused-'+(args.case or 'all')+'.json') if args.reuse_build else ((args.case+'.result.json') if args.case else 'result.json')
    (out/name).write_text(json.dumps(result, indent=2)+'\n', encoding='utf-8', newline='\n')
    print(f"PASS: {len(records)} intermission scenarios / {result['actions']} actions / {result['exact_words']} exact words / {result['ordered_effects']} ordered effects")


if __name__ == '__main__':
    main()
