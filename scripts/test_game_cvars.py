"""Real original engine Cvars and unchanged Baseq3 registration/update/frame paths."""
import argparse
import json
import random
import re
import struct
import subprocess
import sys

from generate_game_cvars import tables
from inventory import sha
from test_bodies import map_bytes
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract



def ints(*values):
    return struct.pack('<' + 'i' * len(values), *values)


def text(value):
    data = value.encode('utf-8')
    return ints(len(data)) + data


def pack(actions, build_date):
    data = text(build_date) + ints(len(actions))
    for row in actions:
        data += ints(row[0])
        for value in row[1:]:
            data += text(value) if isinstance(value, str) else ints(value)
    return data


def scenarios(rows):
    yield 'register_defaults_and_unchanged', [(1,), (2,), (2,), (4,), (2,), (4,)]
    yield 'initial_values_and_aliases', [(3, 'SV_CHEATS', '0', 1), (3, 'g_speed', '123.75', 0),
        (3, 'com_blood', '0', 0), (3, 'sv_maxclients', '16', 0), (1,), (2,)]
    yield 'command_gate_mirrors_initial', [(3, 'sv_cheats', '-2.75tail', 1),
        (3, 'DEDICATED', '3.5', 1), (1,), (2,)]
    yield 'command_gate_mirrors_refresh_and_rebind', [(1,), (3, 'sv_cheats', '0', 1),
        (3, 'dedicated', '2', 1), (2,), (3, 'sv_cheats', '-3', 1), (3, 'dedicated', '-4tail', 1),
        (6,), (2,), (2,)]
    yield 'command_gate_mirrors_frame', [(1,), (3, 'sv_cheats', '0', 1),
        (3, 'dedicated', '1', 1), (5, 1000), (3, 'sv_cheats', '7', 1),
        (3, 'dedicated', '0', 1), (5, 1001)]
    yield 'changes_in_original_table_order', [(1,), (3, 'g_inactivity', '4', 1),
        (3, 'g_gravity', '755.75', 1), (3, 'fraglimit', '30', 1), (3, 'g_password', 'secret', 1), (2,), (4,), (2,)]
    yield 'change_twice_before_refresh', [(1,), (3, 'g_speed', '1', 1), (3, 'g_speed', '320', 1), (2,), (2,)]
    yield 'latch_announcement_uses_old_value', [(1,), (8, 'g_speed', '320', 32), (3, 'g_speed', '444', 0),
        (2,), (3, 'g_speed', '320', 0), (2,), (1,), (2,)]
    yield 'latched_server_and_gametype', [(1,), (3, 'sv_maxclients', '12', 0), (3, 'g_gametype', '4', 0),
        (2,), (1,), (2,)]
    yield 'reregister_consumes_change_without_announcement', [(1,), (3, 'g_gravity', '12.5', 1), (1,), (2,)]
    yield 'rom_and_force_set', [(1,), (3, 'g_needpass', '1', 0), (3, 'g_restarted', '1', 0), (2,),
        (3, 'g_needpass', '1', 1), (3, 'g_restarted', '1', 1), (2,)]
    yield 'null_vm_rows_register_but_never_update', [(1,), (3, 'gamename', 'changed', 1),
        (3, 'gamedate', 'other date', 1), (3, 'sv_mapname', 'q3dm1', 1), (2,), (1,), (2,)]
    for value in ('-1', '8', '2147483647', '-2147483648', '7', '4', 'bad'):
        yield 'gametype_range_' + value, [(3, 'g_gametype', value, 1), (1,), (2,)]
    yield 'warmup_counter_register_only', [(1,), (3, 'g_warmup', '15', 1), (2,), (2,), (1,)]
    yield 'counter_wrap', [(1,), (7, 'g_speed', 2147483647), (2,), (3, 'g_speed', '321', 1),
        (2,), (7, 'g_speed', -2), (3, 'g_speed', '322', 1), (2,), (3, 'g_speed', '323', 1), (2,)]
    yield 'frame_password_and_empty_entities', [(1,), (5, 1000), (3, 'g_password', 'secret', 1),
        (3, 'g_gravity', '600.25', 1), (5, 1001), (5, 2001), (3, 'g_password', 'NoNe', 1), (5, 2002)]
    yield 'frame_listing_reset_next_update', [(1,), (3, 'g_listEntity', '1', 1), (5, 1), (5, 2)]
    yield 'module_state_across_level_reset', [(1,), (3, 'g_password', 'secret', 1), (2,), (4,), (6,),
        (4,), (2,), (3, 'g_password', '', 1), (2,), (4,), (1,)]
    yield 'frame_time_wrap', [(1,), (5, 2147483647), (5, -2147483648)]
    yield 'broadcast_verbatim_bytes', [(1,), (3, 'g_speed', 'text "quoted"\n;tail', 1),
        (3, 'g_gravity', 'x' * 255, 1), (3, 'g_motd', 'ä' * 127, 1), (2,)]
    for index, row in enumerate(rows):
        if not row[0]: continue
        yield f'row_{index}_{row[1]}', [(1,), (3, row[1], '17.25', 1), (2,), (2,)]
    yield 'vm_handle_zero_and_existing', [(10, 'sv_cheats', '', 0), (11,),
        (3, 'sv_cheats', '0', 1), (11,), (10, 'sv_cheats', '', 0)]
    yield 'vm_new_latched_and_register_again', [(10, 'probe', '1.5', 32), (3, 'probe', '2.75', 0),
        (11,), (11,), (10, 'probe', '9', 32), (11,)]
    yield 'vm_null_registration', [(13, 'probe', '2', 4), (10, 'probe', '3', 4), (11,)]
    yield 'vm_capacity', [(10, 'probe', 'x' * 255, 0), (3, 'probe', 'ä' * 127, 1), (11,)]
    yield 'vm_cleared_string_retains_snapshot', [(10, 'probe', '12.5', 0), (7, 'probe', 2), (14, 'probe')]
    yield 'vm_register_counter_minus_one', [(10, 'probe', '12.5', 0), (7, 'probe', -1), (10, 'probe', '12.5', 0), (11,)]
    yield 'vm_equal_counter_skips_storage_check', [(10, 'probe', 'valid', 0), (3, 'probe', 'x' * 256, 1), (7, 'probe', 1), (11,)]
    rng = random.Random(0xC4A)
    names = [r[1] for r in rows]
    for case in range(16):
        actions = [(1,)]
        for _ in range(32):
            name = rng.choice(names)
            value = rng.choice(['', '0', '1', '-2', '12.75', '3tail', 'none', 'quoted "text"'])
            actions.append((3, name, value, rng.randrange(2)))
            if rng.randrange(3) == 0: actions.append((2,))
        actions += [(2,), (1,), (2,)]
        yield f'seeded_changes_{case}', actions


def build(out):
    out.mkdir(parents=True, exist_ok=True)
    source, table, rows = tables()
    original = source.read_text()
    typedef = re.search(r'typedef struct \{.*?\} cvarTable_t;', original, re.S)[0]
    declarations = original[original.index('vmCvar_t\tg_gametype;'):original.index('// bk001129 - made static')]
    (out / 'game_cvar_table.inc').write_text(
        typedef + '\n' + declarations + '\n' + table +
        '\nstatic int gameCvarTableSize=sizeof(gameCvarTable)/sizeof(gameCvarTable[0]);\n')
    (out / 'game_cvar_functions.inc').write_text(extract(source, ['G_RemapTeamShaders', 'G_RegisterCvars', 'G_UpdateCvars', 'CheckCvars']) +
        extract(source.parent / 'g_team.c', ['CheckTeamStatus']) + extract(source, ['G_RunFrame']))
    code = ROOT / 'Quake-III-Arena-original-source/code'
    sources = [code / 'qcommon/cvar.c', code / 'game/q_shared.c']
    run(['cl', '/nologo', '/Od', '/Gy', '/fp:strict', '/arch:SSE2', '/MT', '/DWIN32', '/DNDEBUG', '/D_CRT_SECURE_NO_WARNINGS',
         f'/I{code / "game"}', f'/I{code / "qcommon"}', f'/I{out}', ROOT / 'tests/reference/game_cvars_oracle.c',
         *sources, f'/Fe:{out / "game_cvars_oracle.exe"}', '/link', '/OPT:REF', '/Brepro'], out, msvc_env('x86'), out / 'build.log')
    build_date = run([out / 'game_cvars_oracle.exe', '--build-date'], out).strip()
    return [source, source.parent / 'g_team.c', *sources, code / 'game/g_local.h', code / 'game/q_shared.h', code / 'game/bg_public.h'], rows, build_date


def main():
    parser = argparse.ArgumentParser(); parser.add_argument('--case'); args = parser.parse_args()
    out = ROOT / 'build/reference/game_cvars'
    sources, rows, build_date = build(out)
    subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source', 'tests/game_cvar_tests.ml', '--output', 'game_cvar_tests.exe'], check=True)
    bsp = out / 'empty.bsp'; bsp.write_bytes(map_bytes()); records = []
    for name, actions in scenarios(rows):
        if args.case and args.case != name: continue
        inp, expected = out / (name + '.bin'), out / (name + '.expected'); inp.write_bytes(pack(actions, build_date))
        run([out / 'game_cvars_oracle.exe', inp, expected], out, log=out / (name + '.oracle.log'))
        output = run([ROOT / 'build/game_cvar_tests.exe', bsp, inp, expected], ROOT / 'build', log=out / (name + '.test.log'))
        match = re.search(r'(\d+) game-Cvar actions / (\d+) exact words / (\d+) ordered effects', output)
        if not match: raise RuntimeError(output)
        records.append(dict(name=name, actions=int(match[1]), exact_words=int(match[2]), ordered_effects=int(match[3]),
                            bytes=expected.stat().st_size, inputs_sha256=sha(inp), expected_sha256=sha(expected)))
        if not name.startswith(('row_', 'seeded_')): print(name + ': ' + output.strip(), flush=True)
    if not records: raise RuntimeError('No matching scenario')
    name = records[0]['name']
    output = run([ROOT / 'build/game_cvar_tests.exe', bsp, out / (name + '.bin'), out / (name + '.expected'), '--contracts'],
                 ROOT / 'build', log=out / 'contracts.log')
    print(output.strip())
    rejections = [
        ('negative_handle', [(12, -1)], 'handle out of range'),
        ('upper_handle', [(12, 1)], 'handle out of range'),
        ('register_overlength', [(10, 'probe', 'x' * 256, 0)], 'exceeds MAX_CVAR_VALUE_STRING'),
        ('update_overlength', [(10, 'probe', 'valid', 0), (3, 'probe', 'x' * 256, 1), (11,)], 'exceeds MAX_CVAR_VALUE_STRING')]
    for name, actions, message in rejections:
        inp, expected = out / (name + '.invalid.bin'), out / (name + '.invalid.expected'); inp.write_bytes(pack(actions, build_date))
        rejected = subprocess.run([out / 'game_cvars_oracle.exe', inp, expected], capture_output=True, text=True)
        if rejected.returncode != 21 or message not in rejected.stderr:
            raise RuntimeError(f'Unexpected native rejection: {name}: {rejected.returncode}: {rejected.stderr}')
        (out / (name + '.rejection.log')).write_text(rejected.stderr, encoding='utf-8', newline='\n')
    result = dict(passed=True, scenario_count=len(records), scenarios=records, actions=sum(r['actions'] for r in records),
                  exact_words=sum(r['exact_words'] for r in records), ordered_effects=sum(r['ordered_effects'] for r in records),
                  output_bytes=sum(r['bytes'] for r in records), table_rows=len(rows), vm_snapshots=43, build_date=build_date,
                  runtime_contracts=13, native_rejections=len(rejections),
                  test_sha256=sha(ROOT / 'build/game_cvar_tests.exe'), oracle_sha256=sha(out / 'game_cvars_oracle.exe'), map_sha256=sha(bsp),
                  scope='Original engine Cvar_Register/Update and Baseq3 G_RegisterCvars/G_UpdateCvars/CheckCvars with all 46 table rows and 43 VM snapshots. Level cheats/dedicated integer mirrors are compared after registration, pending engine changes, VM refresh, module rebind and G_RunFrame. Empty-entity G_RunFrame probes use guarded inactive match/vote boundaries; gameplay remains covered by its separate suites. Missionpack team shaders are excluded.',
                  original_sources={s.relative_to(ROOT).as_posix(): sha(s) for s in sources})
    (out / ('result.json' if not args.case else args.case + '.result.json')).write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8', newline='\n')
    print(f"PASS: {len(records)} scenarios / {result['actions']} actions / {result['exact_words']} exact words / {result['ordered_effects']} ordered effects")


if __name__ == '__main__': main()
