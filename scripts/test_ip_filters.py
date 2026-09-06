"""Differential IP filtering against unchanged Baseq3 and actual engine Cvars."""
import argparse
import json
import random
import re
import struct
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run

FUNCTIONS = ['StringToFilter', 'UpdateIPBans', 'G_FilterPacket', 'AddIP',
             'G_ProcessIPBans', 'Svcmd_AddIP_f', 'Svcmd_RemoveIP_f']


def word(value):
    return struct.pack('<I', value & 0xffffffff)


def text(value):
    data = value.encode('utf-8')
    return word(len(data)) + data


def pack(actions):
    return word(len(actions)) + b''.join(
        b''.join(text(value) if isinstance(value, str) else word(value) for value in action)
        for action in actions)


def scenarios():
    yield 'empty_blacklist_and_whitelist', [(4, '1.2.3.4'), (6, 'g_filterBan', '0'),
        (4, '1.2.3.4'), (7, 2), (4, '1.2.3.4')]
    yield 'usage_and_argument_copy', [(2, 0, '1'), (2, 1, '1'), (3, 0, '1'), (3, 1, '1'),
        (2, 3, '1.2.3.4'), (3, 3, '1.2.3.4'), (2, 2, '0' * 40 + '1.2.3.bad' + 'x' * 1500),
        (2, 2, '1.2.3.4' + 'x' * 1500), (3, 2, '1.2.3.4' + 'x' * 1500)]
    yield 'diagnostic_1023_byte_boundaries', [(2, 2, 'bad' + 'x' * 999), (3, 2, '1.2.3.4' + 'x' * 1002)]
    yield 'duplicate_and_first_removal', [(1, '1.2.3.4'), (1, '1.2.3.4'), (3, 2, '1.2.3.4'),
        (4, '1.2.3.4'), (3, 2, '1.2.3.4'), (4, '1.2.3.4'), (3, 2, '1.2.3.4')]
    yield 'free_slot_retains_old_mask', [(1, '1.2.3.4'), (3, 2, '1.2.3.4'), (1, 'bad'),
        (4, '255.255.255.255'), (1, '10.*'), (4, '10.12.13.14'), (4, '1.2.3.4')]
    yield 'sentinel_collision', [(1, '255.255.255.255'), (4, '255.255.255.255'),
        (1, '10.20.30.40'), (4, '255.255.255.255'), (4, '10.20.30.40')]
    yield 'wildcard_removed_sentinel_no_match', [(1, '*'), (3, 2, '*'),
        (4, '255.255.255.255'), (4, '1.2.3.4'), (3, 2, '*')]
    yield 'canonical_remove_exact_mask', [(1, '10'), (3, 2, '10.1.2.3'), (3, 2, '10.*.*.*'),
        (1, '266.2'), (3, 2, '10.2.*.*')]
    yield 'pending_vm_blacklist_whitelist', [(1, '10.*'), (4, '10.1.2.3'),
        (6, 'g_filterBan', '0'), (4, '10.1.2.3'), (4, '11.1.2.3'), (7, 2),
        (4, '10.1.2.3'), (4, '11.1.2.3'), (6, 'g_filterBan', '-2.75tail'), (7, 2), (4, '10.1.2.3')]
    yield 'process_no_space_ignores_final', [(6, 'g_banIPs', '1.2.3.4'), (5,), (7, 1), (5,), (4, '1.2.3.4')]
    yield 'process_last_only_ignored', [(6, 'g_banIPs', '1 2.3.4.5'), (7, 1), (5,), (4, '1.9.8.7'), (4, '2.3.4.5')]
    yield 'process_empty_and_space_runs', [(6, 'g_banIPs', '   '), (7, 1), (5,), (5,),
        (6, 'g_banIPs', ' 1   2  3 '), (7, 1), (5,), (5,)]
    yield 'process_equal_counter_retains_tail', [(6, 'g_banIPs', '1.2.3.4 '), (7, 1),
        (5,), (7, 1), (5,), (7, 0)]
    yield 'process_reparse_appends', [(1, '10.*'), (6, 'g_banIPs', '1 2 '), (7, 1),
        (5,), (5,), (7, 1), (5,)]
    yield 'process_bad_tokens_and_tabs', [(6, 'g_banIPs', 'bad 10.2.bad 1\t2 3 '), (7, 1), (5,), (5,)]
    yield 'process_refresh_shorter_zero_padding', [(6, 'g_banIPs', '1.2.3.4 9.8.7.6 '), (7, 1),
        (5,), (6, 'g_banIPs', '5 '), (7, 1), (5,)]
    yield 'process_same_engine_value_no_refresh', [(6, 'g_banIPs', '1.2.3.4 '), (7, 1), (5,),
        (6, 'g_banIPs', '1.2.3.4 '), (7, 1), (5,)]
    yield 'vm_counter_wrap_and_skip', [(6, 'g_banIPs', '1 2 '), (12, 'g_banIPs', 0x7fffffff),
        (7, 1), (5,), (7, 1), (5,), (12, 'g_filterBan', -1), (7, 2),
        (6, 'g_filterBan', '0'), (7, 2), (4, '1.2.3.4')]
    masks = ['', 'bad', '1.bad', '1.2.bad', '1.2.3.bad', '1.', '*.', '1..2', '1.2.3.',
        '*', '*.*', '*.*.*.*', '1', '1.2', '1.2.3', '1.2.3.4', '1.2.3.4.5',
        '1x2y3z4tail', '*x*y*z*trailing', '256.257.258.259', '0001.0002.0003.0004',
        '4294967295.4294967296.2147483648.2147483647', '9' * 127,
        ' 1.2.3.4', '-1.2.3.4', '+1.2.3.4', '1\t2\n3,4', '255.255.255.255']
    for index, mask in enumerate(masks):
        yield f'mask_{index}', [(10, mask, 0x125678ef, 0xabcdef12), (1, mask), (3, 2, mask)]
    packets = ['1.2.3.4', '1.2.3.4:27960', '1.2.3.4garbage', '1.2.3.4.5',
        '256.257.258.259', '0001.0002.0003.0004', 'localhost', '1..3.4', '1.2.3.a',
        '1.2.3.:', '....', 'a.b.c.d', '1x2y3z4', '1.2.3.99999999999999999999999999999999']
    for index, address in enumerate(packets):
        yield f'packet_{index}', [(1, '1.2.3.4'), (1, '0.0.0.0'), (4, address),
            (6, 'g_filterBan', '0'), (7, 2), (4, address)]
    full_entries = [(1, f'255.255.254.{index}') for index in range(100, 115)]
    yield 'persist_255_bytes_and_hidden_ban', full_entries + [(1, '255.255.254.99'),
        (1, '1.2.3.4'), (4, '1.2.3.4'), (7, 1)]
    yield 'persist_256_bytes_rejected', full_entries + [(1, '255.255.254.115'), (4, '255.255.254.115')]
    yield 'capacity_1024_and_first_free', [(8, 1024, 0xffffffff, 1, 1), (1, '10.20.30.40'),
        (9, 1023, 0xff, 0xffffffff), (1, '10.20.30.40'), (1, '1.2.3.4'),
        (9, 0, 0xffffffff, 0xffffffff), (1, 'bad'), (1, '1.2.3.4')]
    yield 'capacity_last_slot', [(8, 1023, 0xffffffff, 1, 1), (1, '10.20.30.40'), (1, '20.30.40.50')]
    yield 'noncanonical_mask_persistence', [(8, 1, 0xfefeffff, 0x12345678, 0), (11,),
        (4, '120.86.52.18'), (3, 2, '120.86.*.*')]
    yield 'empty_persistence_after_free', [(1, '10.*'), (3, 2, '10'), (7, 1), (5,), (11,)]
    rng = random.Random(0x1F17E2)
    for case in range(24):
        actions = []
        choices = ['*', '10.*', '1.2.3.4', '255.255.255.255', '256.2.3.4', 'bad',
                   '1.2.bad', '3x4y5z6tail', '0.0.0.0', '5']
        for _ in range(24):
            kind = rng.choice([1, 2, 3, 4, 5, 6, 7])
            if kind == 1: actions.append((1, rng.choice(choices)))
            elif kind in (2, 3): actions.append((kind, rng.randrange(4), rng.choice(choices)))
            elif kind == 4: actions.append((4, rng.choice(packets)))
            elif kind == 5: actions.append((5,))
            elif kind == 6:
                if rng.randrange(2): actions.append((6, 'g_filterBan', rng.choice(['0', '1', '-2', '2.5', 'bad'])))
                else: actions.append((6, 'g_banIPs', rng.choice(['', ' ', '1 2 ', '3', 'bad 5 ', '10.* 1.2.3.4 '])))
            else: actions.append((7, rng.randrange(3)))
        yield f'seeded_{case}', actions + [(7, 0), (5,), (4, '1.2.3.4')]


def source_files():
    code = ROOT / 'Quake-III-Arena-original-source/code'
    return [code / 'game/g_svcmds.c', code / 'qcommon/cvar.c', code / 'game/q_shared.c',
        code / 'game/g_local.h', code / 'game/q_shared.h', code / 'qcommon/qcommon.h',
        ROOT / 'tests/reference/core_oracle.c', ROOT / 'tests/reference/ip_filters_oracle.c']


def original_functions(source_text):
    bodies = []
    for name in FUNCTIONS:
        match = re.search(r'^[\w* \t]+\b' + re.escape(name) + r'\s*\([^;{}]*\)\s*\{', source_text, re.M)
        if not match: raise RuntimeError('Missing original IP function ' + name)
        end, depth = match.end(), 1
        while depth:
            if source_text[end] == '{': depth += 1
            elif source_text[end] == '}': depth -= 1
            end += 1
        bodies.append(source_text[match.start():end])
    return '\n\n'.join(bodies) + '\n'


def build(out):
    out.mkdir(parents=True, exist_ok=True)
    source = source_files()[0]
    original = source.read_text(encoding='utf-8')
    prefix = original[original.index('typedef struct ipFilter_s'):original.index('static int\t\t\tnumIPFilters;') + len('static int\t\t\tnumIPFilters;')]
    (out / 'ip_filter_functions.inc').write_text(prefix + '\n\n' + original_functions(original), encoding='utf-8', newline='\n')
    code = ROOT / 'Quake-III-Arena-original-source/code'
    run(['cl', '/nologo', '/Od', '/Gy', '/fp:strict', '/arch:SSE2', '/MT', '/DWIN32', '/DNDEBUG',
         '/D_CRT_SECURE_NO_WARNINGS', f'/I{code / "game"}', f'/I{code / "qcommon"}', f'/I{out}',
         ROOT / 'tests/reference/ip_filters_oracle.c', code / 'qcommon/cvar.c', code / 'game/q_shared.c',
         f'/Fe:{out / "ip_filters_oracle.exe"}', '/link', '/OPT:REF', '/Brepro'],
        out, msvc_env('x86'), out / 'build.log')


class Reader:
    def __init__(self, data):
        self.data, self.at, self.words = data, 0, 0

    def word(self):
        value = struct.unpack_from('<I', self.data, self.at)[0]
        self.at += 4; self.words += 1
        return value

    def text(self):
        size = self.word()
        if size == 0xffffffff: return None
        value = self.data[self.at:self.at + size]
        self.at += size
        return value

    def vm(self):
        return dict(zip(['handle', 'counter', 'value_bits', 'integer', 'text'],
                        [self.word(), self.word(), self.word(), self.word(), self.text()]))

    def engine(self):
        values = [self.word() for _ in range(6)] + [self.text() for _ in range(3)]
        return dict(zip(['index', 'flags', 'modified', 'counter', 'value_bits', 'integer',
                         'text', 'reset', 'latched'], values))

    def snapshot(self):
        assert self.word() == 201
        count = self.word(); filters = [(self.word(), self.word()) for _ in range(1024)]
        raw = self.data[self.at:self.at + 256]; self.at += 256; self.words += 64
        ban, filter_ban = self.vm(), self.vm()
        indexes, flags = self.word(), self.word()
        return dict(count=count, filters=filters, raw=raw, ban=ban, filter_ban=filter_ban,
                    indexes=indexes, flags=flags, engine_ban=self.engine(), engine_filter=self.engine())


def decode_stream(data):
    reader = Reader(data); records = []; effects = []
    while reader.at < len(data):
        kind = reader.word()
        if kind == 200:
            effects.append(dict(kind=reader.word(), name=reader.text(), text=reader.text(), state=reader.snapshot()))
        else:
            assert kind == 202
            records.append(dict(kind=reader.word(), result=reader.word(), parsed=(reader.word(), reader.word()),
                                state=reader.snapshot(), effects=effects)); effects = []
    assert reader.at == len(data) and not effects
    return records, reader.words


def semantic_assertions(name, actions, records):
    """Check concrete native behaviors independently of binary equality."""
    assertions = 0

    def require(condition, label):
        nonlocal assertions
        if not condition: raise AssertionError(name + ': ' + label)
        assertions += 1

    require(len(records) == len(actions), 'one final state per input action')
    for action, record in zip(actions, records):
        require(record['kind'] == action[0], 'action identity')
        for state in [record['state']] + [e['state'] for e in record['effects']]:
            require(state['raw'].split(b'\0', 1)[0] == state['ban']['text'], 'raw live VM has exact visible C prefix')
            require(0 <= state['count'] <= 1024 and state['indexes'] == 3, 'bounded original filter and registry storage')
        if action[0] == 10 and not record['result']:
            require(record['parsed'] == tuple(v & 0xffffffff for v in action[2:]), 'failed parse leaves output unchanged')
    states = [r['state'] for r in records]
    packets = [r['result'] for r in records if r['kind'] == 4]
    prints = [e['text'] for r in records for e in r['effects'] if e['kind'] == 1]
    if name == 'empty_blacklist_and_whitelist': require(packets == [0, 0, 1], 'empty list and pending VM change')
    elif name == 'usage_and_argument_copy':
        require(prints[:4] == [b'Usage:  addip <ip-mask>\n'] * 2 + [b'Usage:  sv removeip <ip-mask>\n'] * 2, 'exact usage text')
        require(records[6]['effects'][0]['text'] == b'Bad filter address: ' + actions[6][2].encode()[:1023][46:] + b'\n', 'Argv truncates to 1023 bytes; diagnostic suffix fits original G_Printf')
        require(prints[-1] == b'Removed.\n', 'long copied argument still finds exact parsed mask')
    elif name == 'diagnostic_1023_byte_boundaries': require([len(value) for value in prints] == [1023, 1023], 'largest defined G_Printf payloads')
    elif name == 'duplicate_and_first_removal':
        require(states[-1]['count'] == 2 and packets == [1, 0], 'remove first duplicate and retain highwater count')
    elif name == 'free_slot_retains_old_mask':
        require(states[2]['filters'][0] == (0xffffffff, 0xffffffff), 'failed reuse retains prior full mask')
        require(packets == [1, 1, 0] and states[-1]['count'] == 1, 'sentinel packet match and later slot reuse')
    elif name == 'sentinel_collision':
        require(states[0]['engine_ban']['text'] == b'' and packets == [1, 0, 1] and states[-1]['count'] == 1,
                'all-255 valid input collides with the free sentinel')
    elif name == 'wildcard_removed_sentinel_no_match': require(packets == [0, 0], 'removed wildcard cannot match sentinel')
    elif name == 'canonical_remove_exact_mask': require(prints == [b"Didn't find 10.1.2.3.\n", b'Removed.\n', b'Removed.\n'], 'remove exact mask with canonical bytewrap spelling')
    elif name == 'pending_vm_blacklist_whitelist': require(packets == [1, 1, 0, 0, 1, 1], 'only VM integer controls blacklist versus whitelist')
    elif name == 'process_no_space_ignores_final': require(states[-1]['count'] == 0 and packets == [0], 'trailing space is required to import a token')
    elif name == 'process_last_only_ignored': require(states[-1]['count'] == 1 and packets == [1, 0], 'last token ignored after prior completed token')
    elif name == 'process_empty_and_space_runs': require(states[-1]['count'] == 3 and states[-1]['ban']['text'] == b'', 'leading and repeated spaces mutate original VM')
    elif name in ('process_equal_counter_retains_tail', 'process_same_engine_value_no_refresh'):
        require(states[-1]['count'] == 1 and states[-1]['ban']['text'] == b'1.2.3.4' and states[-1]['ban']['counter'] == 2,
                'equal Cvar counter skips refresh of a mutated VM string')
    elif name == 'process_reparse_appends': require(states[3]['count'] == 3 and states[4]['count'] == 3 and states[-1]['count'] == 6, 'process never clears existing filters; explicit refresh permits reparse')
    elif name == 'process_bad_tokens_and_tabs': require(states[-1]['count'] == 2 and prints == [b'Bad filter address: bad\n', b'Bad filter address: bad\n'], 'bad entries reuse slot and tabs remain inside token')
    elif name == 'process_refresh_shorter_zero_padding': require(states[4]['raw'] == b'5 ' + bytes(254), 'actual Cvar_Update zero pads after shorter text')
    elif name == 'persist_255_bytes_and_hidden_ban':
        require(len(states[15]['engine_ban']['text']) == 255 and states[-1]['count'] == 17 and packets == [1], '255 persisted bytes and active unsaved extra filter')
        require(prints == [b'g_banIPs overflowed at MAX_CVAR_VALUE_STRING\n'], 'exact overflow diagnostic')
    elif name == 'persist_256_bytes_rejected': require(len(states[-1]['engine_ban']['text']) == 240 and packets == [1], 'total 256 bytes rejected while internal ban stays live')
    elif name == 'capacity_1024_and_first_free':
        require([e['kind'] for e in records[1]['effects']] == [1] and records[1]['effects'][0]['text'] == b'IP filter list is full\n', 'full list has print only, no Cvar write')
        require(states[3]['count'] == 1024 and states[3]['filters'][1023] == (0xffffffff, 0x281e140a), 'last free slot used at capacity')
        require(states[-1]['filters'][0] == (0xffffffff, 0x04030201), 'lowest free slot survives failed parse and is reused')
    elif name == 'capacity_last_slot': require(states[1]['count'] == 1024 and records[2]['effects'][0]['text'] == b'IP filter list is full\n', 'last newly allocated slot and next add limit')
    elif name == 'noncanonical_mask_persistence': require(states[1]['engine_ban']['text'] == b'120.86.*.* ', 'every mask byte other than 255 prints wildcard')
    elif name == 'empty_persistence_after_free': require(states[-1]['count'] == 1 and states[-1]['engine_ban']['text'] == b'', 'persistence skips freed entries without shrinking count')
    return assertions


def main():
    parser = argparse.ArgumentParser(); parser.add_argument('--case'); parser.add_argument('--reuse-build', action='store_true')
    parser.add_argument('--native-only', action='store_true'); args = parser.parse_args()
    out = ROOT / 'build/reference/ip_filters'
    if not args.reuse_build:
        build(out)
        if not args.native_only:
            subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source', 'tests/ip_filter_tests.ml', '--output', 'ip_filter_tests.exe'], check=True)
    records = []
    for name, actions in scenarios():
        if args.case and args.case != name: continue
        inp, expected = out / (name + '.bin'), out / (name + '.expected'); inp.write_bytes(pack(actions))
        run([out / 'ip_filters_oracle.exe', inp, expected], out, log=out / (name + '.oracle.log'))
        decoded, native_words = decode_stream(expected.read_bytes())
        assertions = semantic_assertions(name, actions, decoded)
        effects = sum(len(record['effects']) for record in decoded)
        if not args.native_only:
            output = run([ROOT / 'build/ip_filter_tests.exe', inp, expected], ROOT / 'build', log=out / (name + '.test.log'))
            match = re.search(r'(\d+) IP actions / (\d+) exact words / (\d+) ordered effects', output)
            if not match or tuple(map(int, match.groups())) != (len(actions), native_words, effects): raise RuntimeError(output)
        records.append(dict(name=name, actions=len(actions), exact_words=native_words, ordered_effects=effects,
                            semantic_assertions=assertions, bytes=expected.stat().st_size, inputs_sha256=sha(inp), expected_sha256=sha(expected)))
        if len(records) % 10 == 0 or args.case: print(f'{len(records)} IP scenarios passed ({name})', flush=True)
    if not records: raise RuntimeError('No matching IP scenario')
    # These test the host's fixture validator, not undefined original G_Printf
    # execution: the original msg[1024] would overflow at a 1024-byte payload.
    fixture_rejections = [('bad_address_print_overflow', [(2, 2, 'bad' + 'x' * 1000)]),
                          ('remove_miss_print_overflow', [(3, 2, '1.2.3.4' + 'x' * 1003)])]
    for name, actions in fixture_rejections:
        inp, expected = out / (name + '.invalid.bin'), out / (name + '.invalid.expected')
        inp.write_bytes(pack(actions))
        rejected = subprocess.run([out / 'ip_filters_oracle.exe', inp, expected], capture_output=True, text=True, encoding='utf-8')
        if rejected.returncode != 74 or rejected.stderr.strip() != 'IP fixture exceeds original G_Printf storage':
            raise RuntimeError(f'IP oracle fixture validator failed: {name}: {rejected.returncode}: {rejected.stderr}')
        (out / (name + '.rejection.log')).write_text(rejected.stderr, encoding='utf-8', newline='\n')
    contracts = None
    if not args.native_only:
        output = run([ROOT / 'build/ip_filter_tests.exe', '--contracts'], ROOT / 'build', log=out / 'contracts.log')
        print(output.strip()); contracts = int(re.search(r'(\d+) IP runtime contracts', output)[1])
    result = dict(passed=not args.native_only, native_only=args.native_only, scenario_count=len(records), scenarios=records,
        actions=sum(r['actions'] for r in records), exact_words=sum(r['exact_words'] for r in records),
        ordered_effects=sum(r['ordered_effects'] for r in records), semantic_assertions=sum(r['semantic_assertions'] for r in records),
        output_bytes=sum(r['bytes'] for r in records), runtime_contracts=contracts,
        oracle_fixture_rejections=len(fixture_rejections), functions=FUNCTIONS,
        test_sha256=None if args.native_only else sha(ROOT / 'build/ip_filter_tests.exe'), oracle_sha256=sha(out / 'ip_filters_oracle.exe'),
        scope='All seven unchanged Baseq3 IP functions with actual original Cvar_Register/Cvar_Update/Cvar_Set2. '
              'All 1024 filters, the 256-byte live ban VM buffer, both VM and engine Cvars are compared at every diagnostic, '
              'Cvar-set callback and action. Packet parses must initialize all four native octets; shortened undefined C paths, '
              'embedded NUL, numeric scratch overflow and diagnostics exceeding G_Printf msg[1024] are controlled MiniLang contracts only. '
              'Fixture fills exercise 1024-slot capacity without replacing AddIP or UpdateIPBans. Module lifecycle and network delivery remain host boundaries.',
        original_sources={source.relative_to(ROOT).as_posix(): sha(source) for source in source_files()},
        port_sources={path: sha(ROOT / path) for path in ['src/mq3/game/ip_filters.ml', 'src/mq3/game/client_connect.ml',
                      'tests/ip_filter_tests.ml', 'tests/client_connect_tests.ml', 'scripts/test_ip_filters.py']})
    target = (args.case + '.' if args.case else '') + ('native.json' if args.native_only else 'result.json')
    (out / target).write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8', newline='\n')
    print(f"PASS: {len(records)} IP scenarios / {result['actions']} actions / {result['exact_words']} exact words / "
          f"{result['ordered_effects']} ordered effects / {result['semantic_assertions']} semantic assertions")


if __name__ == '__main__': main()
