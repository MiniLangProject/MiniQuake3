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
    yield 'quadfactor_initial_and_refresh', [(3, 'g_quadfactor', '2.75tail', 1), (1,),
        (3, 'g_quadfactor', '0.5', 1), (2,), (3, 'g_quadfactor', '-2', 1), (2,), (6,), (2,)]
    yield 'quadfactor_frame_refresh', [(1,), (3, 'g_quadfactor', '4.125', 1), (5, 1000),
        (3, 'g_quadfactor', '0', 1), (5, 1001)]
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
    original = source.read_text(encoding='utf-8')
    typedef = re.search(r'typedef struct \{.*?\} cvarTable_t;', original, re.S)[0]
    declarations = original[original.index('vmCvar_t\tg_gametype;'):original.index('// bk001129 - made static')]
    (out / 'game_cvar_table.inc').write_text(
        typedef + '\n' + declarations + '\n' + table +
        '\nstatic int gameCvarTableSize=sizeof(gameCvarTable)/sizeof(gameCvarTable[0]);\n', encoding='utf-8', newline='\n')
    (out / 'game_cvar_functions.inc').write_text(extract(source, ['G_RemapTeamShaders', 'G_RegisterCvars', 'G_UpdateCvars', 'CheckCvars']) +
        extract(source.parent / 'g_team.c', ['CheckTeamStatus']) + extract(source, ['G_RunFrame']), encoding='utf-8', newline='\n')
    code = ROOT / 'Quake-III-Arena-original-source/code'
    sources = [code / 'qcommon/cvar.c', code / 'game/q_shared.c']
    run(['cl', '/nologo', '/Od', '/Gy', '/fp:strict', '/arch:SSE2', '/MT', '/DWIN32', '/DNDEBUG', '/D_CRT_SECURE_NO_WARNINGS',
         f'/I{code / "game"}', f'/I{code / "qcommon"}', f'/I{out}', ROOT / 'tests/reference/game_cvars_oracle.c',
         *sources, f'/Fe:{out / "game_cvars_oracle.exe"}', '/link', '/OPT:REF', '/Brepro'], out, msvc_env('x86'), out / 'build.log')
    build_date = run([out / 'game_cvars_oracle.exe', '--build-date'], out).strip()
    return [source, source.parent / 'g_team.c', *sources, code / 'game/g_local.h', code / 'game/q_shared.h', code / 'game/bg_public.h'], rows, build_date


def failed_copy_scenarios():
    oversized = '99' + 'x' * 254
    yield 'failed_register_fresh_256', [(10, 'probe', oversized, 0)], '', 0.0, 0, 1
    yield 'failed_register_existing_256', [(10, 'probe', '-3.25', 0),
        (3, 'probe', oversized, 1), (10, 'probe', 'unused default', 0)], '-3.25', -3.25, -3, 2
    yield 'failed_update_existing_256', [(10, 'probe', '12.5', 0),
        (3, 'probe', oversized, 1), (11,)], '12.5', 12.5, 12, 2


def decode_failed_copy(data, prior_text, prior_value, prior_integer, expected_counter):
    size = struct.unpack_from('<i', data, len(data)-4)[0]
    start = len(data)-4-size
    if start < 0: raise AssertionError('Truncated Cvar error-state trailer')
    offset = start
    def number():
        nonlocal offset
        value = struct.unpack_from('<i', data, offset)[0]; offset += 4; return value
    def string():
        nonlocal offset
        size = number()
        if size == -1: return None
        if size < 0 or offset+size > len(data): raise AssertionError('Invalid Cvar error-state string')
        value = data[offset:offset+size]; offset += size; return value
    header = [number() for _ in range(3)]
    vm = [number() for _ in range(5)]; vm_text = string(); probe_name = string()
    engine = [number() for _ in range(7)]
    engine_text, reset_text, latched_text = string(), string(), string()
    raw_vm = data[offset:offset+256]; offset += 256
    if number() != size or offset != len(data): raise AssertionError('Invalid Cvar error-state trailer size')
    assertions = 0
    def require(condition, label):
        nonlocal assertions
        if not condition: raise AssertionError(label)
        assertions += 1
    prior_bits = struct.unpack('<i', struct.pack('<f', prior_value))[0]
    require(header[0] == 199 and header[1] == 2, 'Com_Error captures the live engine registry')
    require(vm[0] == 1 and vm[1] == 1 and probe_name == b'probe', 'registration already assigned the actual engine handle')
    require(vm[2] == expected_counter and engine[4] == expected_counter, 'native VM counter advances before the length error')
    require(vm_text == prior_text.encode('utf-8'), 'failed native copy retains old visible string')
    require(vm[3] == prior_bits and vm[4] == prior_integer, 'failed native copy retains old float/integer')
    require(raw_vm == prior_text.encode('utf-8') + bytes(256-len(prior_text.encode('utf-8'))), 'all 256 native VM string bytes remain unchanged')
    require(engine[0] == 1 and engine[1] == vm[1] and engine[5] == struct.unpack('<i',struct.pack('<f',99.0))[0] and engine[6] == 99,
            'engine numeric values differ from the retained VM values')
    require(engine_text == ('99'+'x'*254).encode('utf-8') and len(engine_text) == 256, 'engine source has exactly 256 bytes')
    return dict(semantic_assertions=assertions, state_offset=start, state_bytes=size+4,
                vm_handle=vm[1], vm_counter=vm[2], vm_text=vm_text.decode('utf-8'),
                vm_float_bits=vm[3], vm_integer=vm[4], engine_counter=engine[4],
                engine_text_bytes=len(engine_text), retained_vm_bytes=256)


def verify_failed_copies(out, build_date, bsp, *, mini=True):
    records = []
    for name, actions, prior_text, prior_value, prior_integer, counter in failed_copy_scenarios():
        inp, expected = out/(name+'.bin'), out/(name+'.expected'); inp.write_bytes(pack(actions,build_date))
        rejected = subprocess.run([out/'game_cvars_oracle.exe',inp,expected,'--error-state'],
                                  capture_output=True,text=True,encoding='utf-8')
        if rejected.returncode != 21 or 'exceeds MAX_CVAR_VALUE_STRING' not in rejected.stderr:
            raise RuntimeError(f'Unexpected failed-copy native result: {name}: {rejected.returncode}: {rejected.stderr}')
        (out/(name+'.oracle.log')).write_text(rejected.stderr,encoding='utf-8',newline='\n')
        record = decode_failed_copy(expected.read_bytes(),prior_text,prior_value,prior_integer,counter)
        record.update(name=name,actions=len(actions),bytes=expected.stat().st_size,inputs_sha256=sha(inp),
                      expected_sha256=sha(expected),native_exit=rejected.returncode,native_diagnostic=rejected.stderr)
        if mini:
            output = run([ROOT/'build/game_cvar_tests.exe',bsp,inp,expected,'--error-state'], ROOT/'build',log=out/(name+'.test.log'))
            match = re.search(r'(\d+) game-Cvar rejected actions / (\d+) exact words / (\d+) ordered effects / (\d+) failed-copy contracts',output)
            if not match or int(match[1]) != len(actions): raise RuntimeError(output)
            record.update(exact_words=int(match[2]),ordered_effects=int(match[3]),runtime_contracts=int(match[4]))
            print(name+': '+output.strip(),flush=True)
        records.append(record)
    return records


def main():
    parser = argparse.ArgumentParser(); parser.add_argument('--case'); parser.add_argument('--reuse-build',action='store_true'); args = parser.parse_args()
    out = ROOT / 'build/reference/game_cvars'
    if args.reuse_build:
        source, table, rows = tables(); code = ROOT/'Quake-III-Arena-original-source/code'
        sources = [source,source.parent/'g_team.c',code/'qcommon/cvar.c',code/'game/q_shared.c',
                   code/'game/g_local.h',code/'game/q_shared.h',code/'game/bg_public.h']
        build_date = run([out/'game_cvars_oracle.exe','--build-date'],out).strip()
    else:
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
    failed_copies = verify_failed_copies(out,build_date,bsp)
    result = dict(passed=True, scenario_count=len(records), scenarios=records, actions=sum(r['actions'] for r in records),
                  exact_words=sum(r['exact_words'] for r in records), ordered_effects=sum(r['ordered_effects'] for r in records),
                  output_bytes=sum(r['bytes'] for r in records), table_rows=len(rows), vm_snapshots=43, build_date=build_date,
                  runtime_contracts=13, native_rejections=len(rejections),
                  failed_copy_scenarios=failed_copies, failed_copy_scenario_count=len(failed_copies),
                  failed_copy_exact_words=sum(r['exact_words'] for r in failed_copies),
                  failed_copy_semantic_assertions=sum(r['semantic_assertions'] for r in failed_copies),
                  failed_copy_runtime_contracts=sum(r['runtime_contracts'] for r in failed_copies),
                  test_sha256=sha(ROOT / 'build/game_cvar_tests.exe'), oracle_sha256=sha(out / 'game_cvars_oracle.exe'), map_sha256=sha(bsp),
                  scope='Original engine Cvar_Register/Update and Baseq3 G_RegisterCvars/G_UpdateCvars/CheckCvars with all 46 table rows and 43 VM snapshots. Level cheats/dedicated integer mirrors are compared after registration, pending engine changes, VM refresh, module rebind and G_RunFrame. Empty-entity G_RunFrame probes use guarded inactive match/vote boundaries; gameplay remains covered by its separate suites. Separate successful-state records remain unchanged. Three additional defined 256-byte Com_Error cases compare the actual failed Register/Update state: new handle/counter, unchanged 256-byte VM buffer/value/integer and live engine storage. Mini contracts additionally require unchanged copyGeneration. Native diagnostics and exit code are archived; Mini uses its own safe rejection text and no diagnostic-text parity is claimed. The four prior native negative cases remain separate. Missionpack team shaders are excluded.',
                  original_sources={s.relative_to(ROOT).as_posix(): sha(s) for s in sources})
    target = 'result.json' if not args.case else args.case+'.result.json'
    if args.reuse_build: target = 'reused-'+(args.case or 'all')+'.json'
    (out / target).write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8', newline='\n')
    print(f"PASS: {len(records)} scenarios / {result['actions']} actions / {result['exact_words']} exact words / {result['ordered_effects']} ordered effects")


if __name__ == '__main__': main()
