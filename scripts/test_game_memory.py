"""Original game arena, its bytes and allocation-backed spawn-string copying."""
import argparse
import hashlib
import json
import random
import re
import struct
import subprocess
import sys

from inventory import sha
from test_bodies import map_bytes
from toolchain import ROOT, msvc_env, run
from transition_oracle import extract


def integer(value):
    return struct.pack('<i', value)


def packed(actions):
    data = integer(len(actions))
    for action in actions:
        for part in action:
            if isinstance(part, str):
                raw = part.encode('utf-8')
                data += integer(len(raw)) + raw
            else:
                data += integer(part)
    return data


def scenarios():
    yield 'alignment_and_zero', [(2, n) for n in (0, 1, 31, 32, 33, 0)] + [(4,), (6, 0, 160)]
    for size in (0, 1, 2, 7, 15, 31, 32, 33, 63, 64, 65, 127, 255, 256, 1023, 4097):
        yield f'bytes_and_padding_{size}', [(3, 1), (2, size), (10, 0, 197), (6, 0, ((size+31)//32)*32), (4,)]
    yield 'exact_capacity_then_drop', [(3, 1), (2, 262144), (2, 0), (2, 1), (4,), (1,), (2, 1), (4,)]
    yield 'rounded_last_block', [(3, -7), (2, 262112), (2, 31), (2, 0), (2, 1), (4,)]
    yield 'oversize_empty', [(3, 1), (2, 262145), (4,), (2, 1)]
    yield 'oversize_nonempty', [(2, 33), (3, 1), (2, 262081), (4,), (2, 262080), (4,)]
    yield 'large_defined_size', [(3, 1), (2, 2147483616), (4,)]
    yield 'reset_retains_bytes_and_aliases', [(2, 64), (10, 0, 128), (1,), (6, 0, 64),
        (2, 4), (5, 1, 0, 42), (5, 0, 1, 99), (6, 0, 64), (8,), (4,), (6, 0, 64)]
    yield 'reset_retains_padding', [(2, 64), (10, 0, 3), (1,), (2, 1), (10, 1, 200), (2, 1), (10, 2, 222), (6, 0, 64)]
    yield 'newstring_escapes_and_nul', [(3, 1), (7, ''), (7, 'abc'), (7, r'a\nb\tc\\d'),
        (7, 'Äpfel – quake'), (7, 'abc\0discarded'), (6, 0, 160), (4,)]
    yield 'newstring_reuses_uncleared_padding', [(2, 128), (10, 0, 64), (1,), (7, r'a\nb\n'), (6, 0, 64), (4,)]
    yield 'newstring_capacity', [(2, 262112), (3, 1), (7, 'x'*31), (7, ''), (4,)]
    yield 'spawn_strings_use_arena', [(3, 1), (9, 'classname', 'target_print'), (9, 'message', r'one\ntwo'),
        (9, 'TEAM', ''), (9, 'target', 'first'), (9, 'targetname', 'button'), (9, 'message', 'replaced'),
        (9, 'unknown', 'ignored'), (9, 'light', '17'), (6, 0, 192), (4,), (8,), (4,)]
    yield 'spawn_all_string_fields', [(3, 1)] + [(9, name, 'value_'+name) for name in (
        'classname', 'model', 'model2', 'target', 'targetname', 'message', 'team', 'targetShaderName', 'targetShaderNewName')] + [(4,), (6, 0, 320)]
    rng = random.Random(0xA110CA7E)
    for case in range(24):
        actions = [(3, rng.choice([0, 1, -2]))]
        blocks, point = [], 0
        for step in range(18):
            if step and rng.randrange(5) == 0:
                actions += [(1,), (8,)]
                point = 0
            if rng.randrange(3) == 0:
                value = ''.join(rng.choice(['a', 'b', ' ', '\n', r'\n', r'\t', 'ü']) for _ in range(rng.randrange(1, 40)))
                size = len(value.encode('utf-8')) + 1
                actions.append((7, value))
            else:
                size = rng.choice([0, 1, 2, 31, 32, 33, 127, 128, 129, 1023])
                actions += [(2, size), (10, len(blocks), rng.randrange(256))]
            blocks.append((point, size))
            rounded = (size+31)//32*32
            actions.append((6, point, rounded))
            point += rounded
        actions += [(4,), (6, 0, 512)]
        yield f'seeded_arena_{case}', actions


class Reader:
    def __init__(self, data): self.data, self.offset = data, 0
    def word(self):
        value = struct.unpack_from('<i', self.data, self.offset)[0]
        self.offset += 4
        return value
    def text(self):
        size = self.word()
        if size == -1: return None
        value = self.data[self.offset:self.offset+size]
        self.offset += size
        return value.decode('utf-8')


def inspect(data):
    reader = Reader(data)
    observed = dict(prints=[], allocations=[], drops=0, reads=[], strings=[], snapshots=[])
    while reader.offset < len(data):
        marker = reader.word()
        if marker == 310: observed['prints'].append([reader.word(), reader.text()])
        elif marker == 311: observed['allocations'].append([reader.word(), reader.word()])
        elif marker == 312: observed['drops'] += 1
        elif marker == 313:
            offset, size = reader.word(), reader.word()
            values = bytes(reader.word() for _ in range(size))
            observed['reads'].append(dict(offset=offset, size=size, sha256=hashlib.sha256(values).hexdigest(), prefix=list(values[:64])))
        elif marker == 314: observed['strings'].append(reader.text())
        elif marker == 319:
            point, debug, count = reader.word(), reader.word(), reader.word()
            blocks = [[reader.word(), reader.word()] for _ in range(count)]
            observed['snapshots'].append(dict(point=point, debug=debug, blocks=blocks, entity=[reader.text() for _ in range(9)]))
        else: raise AssertionError(f'Unknown memory marker {marker}')
    assert reader.offset == len(data)
    return observed


def semantic_proofs(name, actions, observed):
    snapshots = observed['snapshots']
    assert len(snapshots) == len(actions)
    proofs = ['one_state_after_every_action', 'all_live_block_offsets_and_sizes', 'all_nine_entity_string_fields']
    if name == 'alignment_and_zero':
        assert observed['allocations'] == [[0, 0], [0, 1], [32, 31], [64, 32], [96, 33], [160, 0]]
        assert snapshots[-1]['point'] == 160
        proofs.append('exact_original_32_byte_alignment_and_zero_size_aliases')
    if name == 'exact_capacity_then_drop':
        assert observed['drops'] == 1 and snapshots[4]['point'] == 262144 and snapshots[-1]['point'] == 32
        assert observed['prints'][2] == [262144, 'G_Alloc of 1 bytes (-32 left)\n']
        proofs.append('debug_precedes_capacity_error_without_advancing_pointer')
    if name == 'reset_retains_bytes_and_aliases':
        assert observed['reads'][0]['prefix'] == list(range(128, 192))
        assert observed['reads'][1]['prefix'] == [42, 99, *range(130, 192)]
        assert observed['reads'][1] == observed['reads'][2]
        assert snapshots[-1]['point'] == 32
        proofs.append('reset_and_level_rebind_keep_pool_bytes_and_existing_block_aliases')
    if name == 'newstring_escapes_and_nul':
        assert observed['strings'] == ['', 'abc', 'a\nb\\c\\d', 'Äpfel – quake', 'abc']
        assert observed['allocations'][-1] == [128, 4]
        proofs.append('native_escape_rules_and_first_NUL_allocation_extent')
    if name == 'newstring_reuses_uncleared_padding':
        assert observed['reads'][0]['prefix'][:8] == [97, 10, 98, 10, 0, 69, 70, 71]
        proofs.append('newstring_does_not_zero_unused_bytes')
    if name == 'spawn_strings_use_arena':
        assert snapshots[6]['point'] == 192 and snapshots[6]['entity'] == ['target_print', 'replaced', '', 'first', 'button']+[None]*4
        assert snapshots[8]['point'] == 192 and snapshots[-1]['point'] == 192 and snapshots[-1]['entity'] == [None]*9
        proofs.append('real_parsefield_strings_charge_arena_unknown_and_ignored_fields_do_not')
    if name == 'spawn_all_string_fields':
        assert snapshots[-1]['entity'] == ['value_'+name for name in ('classname','message','team','target','targetname','model','model2','targetShaderName','targetShaderNewName')]
        proofs.append('all_nine_F_LSTRING_assignments_after_native_field_lookup')
    if name.startswith('bytes_and_padding_'):
        size = int(name.rsplit('_', 1)[1]); read = observed['reads'][0]
        expected = bytes((197+i)&255 for i in range(size)) + bytes((-size)%32)
        assert read['sha256'] == hashlib.sha256(expected).hexdigest()
        proofs.append('every_requested_byte_and_alignment_padding')
    return proofs


def build(out):
    out.mkdir(parents=True, exist_ok=True)
    code = ROOT/'Quake-III-Arena-original-source/code/game'
    source = code/'g_spawn.c'; original = source.read_text()
    table_start = original.index('typedef enum {')
    table_end = original.index('\n};', original.index('field_t fields[]'))+3
    (out/'game_memory_functions.inc').write_text(original[table_start:table_end]+'\n'+extract(source, ['G_NewString', 'G_ParseField']), encoding='utf-8', newline='\n')
    sources = [code/'g_mem.c', source, code/'q_shared.c', code/'g_local.h', code/'q_shared.h']
    run(['cl', '/nologo', '/Od', '/Gy', '/fp:strict', '/arch:SSE2', '/MT', '/DWIN32', '/DNDEBUG', '/D_CRT_SECURE_NO_WARNINGS',
         f'/I{code}', f'/I{out}', ROOT/'tests/reference/game_memory_oracle.c', code/'q_shared.c',
         f'/Fe:{out / "game_memory_oracle.exe"}', '/link', '/OPT:REF', '/Brepro'], out, msvc_env('x86'), out/'build.log')
    return sources


def main():
    parser = argparse.ArgumentParser(); parser.add_argument('--case'); parser.add_argument('--reuse-build', action='store_true'); parser.add_argument('--native-only', action='store_true'); args = parser.parse_args()
    out = ROOT/'build/reference/game_memory'; sources = build(out)
    bsp = out/'empty.bsp'; bsp.write_bytes(map_bytes())
    if not args.native_only and not args.reuse_build:
        subprocess.run([sys.executable, ROOT/'scripts/build.py', '--source', 'tests/game_memory_tests.ml', '--output', 'game_memory_tests.exe'], check=True)
    records = []
    for name, actions in scenarios():
        if args.case and args.case != name: continue
        inp, expected = out/(name+'.bin'), out/(name+'.expected'); inp.write_bytes(packed(actions))
        run([out/'game_memory_oracle.exe', inp, expected], out, log=out/(name+'.oracle.log'))
        observed = inspect(expected.read_bytes()); proofs = semantic_proofs(name, actions, observed)
        if args.native_only: continue
        output = run([ROOT/'build/game_memory_tests.exe', bsp, inp, expected], ROOT/'build', log=out/(name+'.test.log'))
        match = re.search(r'(\d+) game-memory actions / (\d+) exact words / (\d+) ordered effects', output)
        if not match: raise RuntimeError(output)
        records.append(dict(name=name, actions=int(match[1]), exact_words=int(match[2]), ordered_effects=int(match[3]), bytes=expected.stat().st_size,
            native_drops=observed['drops'], input_sha256=sha(inp), expected_sha256=sha(expected), semantic_proofs=proofs))
        if not name.startswith('seeded_'): print(name+': '+output.strip(), flush=True)
    if args.native_only: print('PASS: original arena scenarios and semantic assertions'); return
    if not records: raise RuntimeError('No game-memory scenarios')
    output = run([ROOT/'build/game_memory_tests.exe', bsp, inp, expected, '--contracts'], ROOT/'build', log=out/'contracts.log'); print(output.strip())
    contracts = int(re.search(r'(\d+) game-memory runtime contracts', output)[1])
    result = dict(passed=True, scenario_count=len(records), scenarios=records, actions=sum(r['actions'] for r in records), exact_words=sum(r['exact_words'] for r in records),
        ordered_effects=sum(r['ordered_effects'] for r in records), output_bytes=sum(r['bytes'] for r in records), native_drops=sum(r['native_drops'] for r in records), runtime_contracts=contracts,
        test_sha256=sha(ROOT/'build/game_memory_tests.exe'), oracle_sha256=sha(out/'game_memory_oracle.exe'), map_sha256=sha(bsp),
        original_sources={s.relative_to(ROOT).as_posix():sha(s) for s in sources},
        scope='Unchanged g_mem.c G_Alloc/G_InitMemory/Svcmd_GameMem_f and allocation-backed G_NewString/G_ParseField. 256 KiB byte pool, 32-byte alignment, zero-size pointers, retained bytes/padding, block aliasing across rewind, VM debug flag, diagnostic-before-mutation/error ordering, full pool capacity, string escapes and all spawn string fields. Nonnegative allocations without signed overflow only; negative/signed-overflow inputs and unterminated trailing escape are separate MiniLang contracts. Entity strings remain owned MiniLang strings; arbitrary C string pointer aliasing is not claimed. Module restart orchestration remains separate.')
    report = name+'.result.json' if args.case else 'result.json'
    (out/report).write_text(json.dumps(result, indent=2)+'\n', encoding='utf-8', newline='\n')
    print(f"PASS: {len(records)} scenarios / {result['actions']} actions / {result['exact_words']} exact words / {result['ordered_effects']} ordered effects")


if __name__ == '__main__': main()
