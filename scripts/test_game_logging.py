"""Unchanged G_LogPrintf, including offset-seven stamps and embedded NUL."""
import argparse
import hashlib
import json
import random
import re
import struct
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run


def artifact_stem(name):
    slug = re.sub(r'[^a-zA-Z0-9_-]', '_', name)[:64]
    return slug + '--' + hashlib.sha256(name.encode('utf-8')).hexdigest()


def action(payload='Log: player\n', *, time=61000, dedicated=1, handle=7, flags=0,
           printed=(120000, 1, 11), written=(180000, 0, 0), nested='nested\n'):
    return time, dedicated, handle, flags, *printed, *written, payload, nested


def packed(actions):
    data = struct.pack('<i', len(actions))
    for row in actions:
        data += struct.pack('<10i', *row[:10])
        for value in row[10:]:
            raw = value.encode('utf-8')
            data += struct.pack('<i', len(raw)) + raw
    return data


def scenarios():
    times = [-2147483648, -2147483647, -60060001, -60060000, -60059999,
             -60000000, -59999999, -6000001, -6000000, -5999999,
             -60001, -60000, -59999, -11001, -11000, -10999, -10001, -10000,
             -9999, -1001, -1000, -999, -1, 0, 1, 999, 1000, 1001, 9999, 10000,
             10001, 59999, 60000, 60001, 5999999, 6000000, 59999999,
             60000000, 60000001, 2147482999, 2147483000, 2147483647]
    modes = [(0, 0), (1, 0), (0, 7), (1, 7), (-3, -2), (-2147483648, 2147483647)]
    for time in times:
        yield f'time_{time}', [action(time=time, dedicated=dedicated, handle=handle) for dedicated, handle in modes]
    payloads = ['', 'x', 'abc\n', '100% %n %s %% literal', 'quotes "\\\t\r\n',
                'äé中\n', '\0', 'A\0B', '\0tail', 'prefix\0middle\0tail',
                'x' * 1015, 'x' * 1016, 'é' * 508, 'x' * 1015 + '\0', '\0' + 'x' * 1015]
    for index, payload in enumerate(payloads):
        yield f'payload_{index}', [action(payload, dedicated=dedicated, handle=handle) for dedicated, handle in modes]
    yield 'console_closes_log', [action(flags=1, printed=(0, 0, 0))]
    yield 'console_opens_log', [action(handle=0, flags=1, printed=(120000, 0, 11))]
    yield 'console_changes_live_handle', [action(flags=1, printed=(-11000, 0, -2))]
    yield 'write_changes_state', [action(dedicated=0, flags=2, written=(-2147483648, -2, 3))]
    yield 'nested_local_stamp', [action('outer\n', flags=5)]
    yield 'nested_closes_outer_file', [action('outer\n', flags=7)]
    yield 'nested_console_only', [action('outer\n', handle=0, flags=4)]
    yield 'nested_not_called_without_console', [action('outer\n', dedicated=0, flags=4)]
    yield 'nested_embedded_nul', [action('outer\0tail', flags=5, printed=(-2147483648, 1, 10), nested='A\0B')]
    for flags in range(8):
        yield f'callback_modes_{flags}', [action(flags=flags, dedicated=dedicated, handle=handle) for dedicated, handle in modes]
    rng = random.Random(0x6106F)
    for index in range(32):
        actions = []
        for _ in range(12):
            def stamp():
                return rng.randint(-2147483648, 2147483647), rng.choice([0, 1, -2]), rng.choice([0, 1, 7, -1, -2147483648, 2147483647])
            at, dedicated, handle = stamp()
            payload = ''.join(rng.choice('abä中\n\t \0%0-') for _ in range(rng.randrange(121)))
            nested = ''.join(rng.choice('XYä中\n\0%-') for _ in range(rng.randrange(41)))
            actions.append(action(payload, time=at, dedicated=dedicated, handle=handle, flags=rng.randrange(8),
                                  printed=stamp(), written=stamp(), nested=nested))
        yield f'seeded_{index}', actions


def sources():
    code = ROOT / 'Quake-III-Arena-original-source/code/game'
    return [code / name for name in ['g_main.c', 'q_shared.c', 'g_local.h', 'q_shared.h']]


def original_functions(source_text):
    bodies = []
    for name in ['G_Printf', 'G_LogPrintf']:
        match = re.search(r'^[\w* \t]+\b' + name + r'\s*\([^;{}]*\)\s*\{', source_text, re.M)
        if not match: raise RuntimeError('Missing original logging function ' + name)
        end, depth = match.end(), 1
        while depth:
            if source_text[end] == '{': depth += 1
            elif source_text[end] == '}': depth -= 1
            end += 1
        bodies.append(source_text[match.start():end])
    return '\n\n'.join(bodies) + '\n'


def build(out):
    out.mkdir(parents=True, exist_ok=True)
    source = sources()[0]
    (out / 'game_logging_functions.inc').write_text(original_functions(source.read_text(encoding='utf-8')), encoding='utf-8', newline='\n')
    code = source.parent
    run(['cl', '/nologo', '/Od', '/Gy', '/fp:strict', '/arch:SSE2', '/MT', '/DWIN32', '/DNDEBUG', '/D_CRT_SECURE_NO_WARNINGS',
         f'/I{code}', f'/I{out}', ROOT / 'tests/reference/game_logging_oracle.c', code / 'q_shared.c',
         f'/Fe:{out / "game_logging_oracle.exe"}', '/link', '/OPT:REF', '/Brepro'], out, msvc_env('x86'), out / 'build.log')


class Reader:
    def __init__(self, data):
        self.data, self.offset, self.words = data, 0, 0

    def word(self):
        value = struct.unpack_from('<i', self.data, self.offset)[0]
        self.offset += 4; self.words += 1
        return value

    def raw(self):
        size = self.word(); value = self.data[self.offset:self.offset + size]
        assert size >= 0 and len(value) == size
        self.offset += size
        return value

    def state(self):
        return [self.word() for _ in range(4)]


def inspect(data):
    reader = Reader(data); records = []; effects = []
    while reader.offset < len(data):
        marker = reader.word()
        if marker == 419:
            records.append(dict(effects=effects, state=reader.state())); effects = []
        else:
            assert marker in (410, 411)
            handle = reader.word() if marker == 411 else None
            effects.append(dict(kind=marker, handle=handle, data=reader.raw(), state=reader.state()))
    assert reader.offset == len(data) and not effects
    return records, reader.words


def semantic_assertions(name, actions, records):
    count = 0

    def require(condition, message):
        nonlocal count
        if not condition: raise AssertionError(name + ': ' + message)
        count += 1

    require(len(records) == len(actions), 'one final state per action')
    for row, record in zip(actions, records):
        initial = list(row[:4]); visible = row[10].encode('utf-8').split(b'\0', 1)[0]
        effects = record['effects']
        if row[1] != 0:
            require(effects[0] == dict(kind=410, handle=None, data=visible, state=initial), 'dedicated output is unstamped payload before callbacks')
        for effect in effects:
            require(b'\0' not in effect['data'], 'strlen excludes first NUL and all following bytes')
            if effect['kind'] == 411:
                require(effect['handle'] != 0 and effect['handle'] == effect['state'][2], 'file write uses the current nonzero handle')
                require(7 <= len(effect['data']) <= 1023, 'file includes exactly the seven-byte prefix before visible payload')
        if row[3] == 0:
            kinds = ([410] if row[1] else []) + ([411] if row[2] else [])
            require([e['kind'] for e in effects] == kinds and record['state'] == initial, 'normal output gating/order leaves level unchanged')
            if row[2]: require(effects[-1]['data'][7:] == visible, 'file payload begins at offset seven')
    stamp_examples = {0: b'  0:00 ', 1000: b'  0:01 ', 59999: b'  0:59 ', 60000: b'  1:00 ',
                      -1: b'  0:00 ', -999: b'  0:00 ', -1000: b'  0:0-1', -10000: b'  0:-10',
                      -11000: b'  0:-1-', -59999: b'  0:-5-', -60000: b' -1:00 ',
                      60000000: b'1000:00', -6000000: b'-100:00',
                      2147483647: b'35791:2', -2147483648: b'-35791:'}
    if name.startswith('time_'):
        time = actions[0][0]
        if time in stamp_examples:
            for record in records:
                for effect in record['effects']:
                    if effect['kind'] == 411: require(effect['data'][:7] == stamp_examples[time], 'concrete signed time/offset-seven regression')
    effects = records[0]['effects']
    if name == 'console_closes_log': require([e['kind'] for e in effects] == [410], 'console closes handle before file test')
    elif name == 'console_opens_log': require(effects[-1]['handle'] == 11 and effects[-1]['data'] == b'  1:01 Log: player\n', 'console opens file but cannot change stored timestamp')
    elif name == 'console_changes_live_handle': require(effects[-1]['handle'] == -2 and effects[-1]['data'][:7] == b'  1:01 ', 'changed handle with original local timestamp')
    elif name == 'write_changes_state': require(records[0]['state'][:3] == [-2147483648, -2, 3], 'post-write callback mutations survive return')
    elif name == 'nested_local_stamp':
        require([e['kind'] for e in effects] == [410, 410, 411, 411], 'nested logger preserves effect ordering')
        require([e['data'] for e in effects[-2:]] == [b'  2:00 nested\n', b'  1:01 outer\n'], 'independent recursive native stack buffers')
    elif name == 'nested_closes_outer_file': require([e['kind'] for e in effects] == [410, 410, 411] and records[0]['state'][2] == 0, 'nested write closes the outer live file handle')
    elif name == 'nested_console_only': require([e['kind'] for e in effects] == [410, 410], 'nested console output without a file')
    elif name == 'nested_not_called_without_console': require([e['kind'] for e in effects] == [411] and records[0]['state'][3] == 4, 'disabled console never invokes its nested callback')
    elif name == 'nested_embedded_nul': require([e['data'] for e in effects[-2:]] == [b'-35791:A', b'  1:01 outer'], 'nested NUL formatting and outer buffer ownership')
    return count


def main():
    parser = argparse.ArgumentParser(); parser.add_argument('--case'); parser.add_argument('--reuse-build', action='store_true')
    parser.add_argument('--native-only', action='store_true'); args = parser.parse_args()
    out = ROOT / 'build/reference/game_logging'
    if not args.reuse_build:
        build(out)
        if not args.native_only:
            subprocess.run([sys.executable, ROOT / 'scripts/build.py', '--source', 'tests/game_logging_tests.ml', '--output', 'game_logging_tests.exe'], check=True)
    records = []; stems = set()
    for name, actions in scenarios():
        stem = artifact_stem(name)
        if stem.casefold() in stems: raise RuntimeError('Logging artifact collision: ' + name)
        stems.add(stem.casefold())
        if args.case and args.case != name: continue
        inp, expected = out / (stem + '.bin'), out / (stem + '.expected'); inp.write_bytes(packed(actions))
        run([out / 'game_logging_oracle.exe', inp, expected], out, log=out / (stem + '.oracle.log'))
        observed, words = inspect(expected.read_bytes()); assertions = semantic_assertions(name, actions, observed)
        effects = [effect for record in observed for effect in record['effects']]
        if not args.native_only:
            output = run([ROOT / 'build/game_logging_tests.exe', inp, expected], ROOT / 'build', log=out / (stem + '.test.log'))
            match = re.search(r'(\d+) logging actions / (\d+) exact words / (\d+) ordered effects', output)
            if not match or tuple(map(int, match.groups())) != (len(actions), words, len(effects)): raise RuntimeError(output)
        records.append(dict(name=name, artifact_stem=stem, actions=len(actions), exact_words=words, ordered_effects=len(effects),
                            semantic_assertions=assertions, console_calls=sum(e['kind'] == 410 for e in effects),
                            file_writes=sum(e['kind'] == 411 for e in effects), file_bytes=sum(len(e['data']) for e in effects if e['kind'] == 411),
                            bytes=expected.stat().st_size, inputs_sha256=sha(inp), expected_sha256=sha(expected)))
        if len(records) % 20 == 0 or args.case: print(f'{len(records)} logging scenarios passed ({name})', flush=True)
    if not records: raise RuntimeError('No matching logging scenario')
    rejected_fixtures = ['x' * 1017, '\0' + 'x' * 1016]; rejection_records = []
    for index, payload in enumerate(rejected_fixtures):
        name = 'format_overflow_' + str(index); stem = artifact_stem(name)
        if stem.casefold() in stems: raise RuntimeError('Logging artifact collision: ' + name)
        stems.add(stem.casefold()); inp, expected = out / (stem + '.bin'), out / (stem + '.expected')
        inp.write_bytes(packed([action(payload, dedicated=0, handle=0)]))
        rejected = subprocess.run([out / 'game_logging_oracle.exe', inp, expected], capture_output=True, text=True, encoding='utf-8')
        if rejected.returncode != 74 or rejected.stderr.strip() != 'Logging fixture exceeds original format storage': raise RuntimeError(rejected.stderr)
        (out / (stem + '.rejection.log')).write_text(rejected.stderr, encoding='utf-8', newline='\n')
        rejection_records.append(dict(name=name, artifact_stem=stem, input_sha256=sha(inp),
                                      status=rejected.returncode, message=rejected.stderr.strip()))
    contracts = None
    if not args.native_only:
        output = run([ROOT / 'build/game_logging_tests.exe', '--contracts'], ROOT / 'build', log=out / 'contracts.log')
        print(output.strip()); contracts = int(re.search(r'(\d+) logging runtime contracts', output)[1])
    result = dict(passed=not args.native_only, native_only=args.native_only, scenarios=records, scenario_count=len(records),
                  actions=sum(r['actions'] for r in records), exact_words=sum(r['exact_words'] for r in records),
                  ordered_effects=sum(r['ordered_effects'] for r in records), semantic_assertions=sum(r['semantic_assertions'] for r in records),
                  console_calls=sum(r['console_calls'] for r in records), file_writes=sum(r['file_writes'] for r in records),
                  file_bytes=sum(r['file_bytes'] for r in records), output_bytes=sum(r['bytes'] for r in records),
                  runtime_contracts=contracts, oracle_fixture_rejections=rejection_records,
                  oracle_fixture_rejection_count=len(rejection_records),
                  test_sha256=None if args.native_only else sha(ROOT / 'build/game_logging_tests.exe'), oracle_sha256=sha(out / 'game_logging_oracle.exe'),
                  scope='Unchanged G_LogPrintf and G_Printf with actual Com_sprintf. Payload bytes are formatted with native %c varargs, '
                        'including embedded NUL and trailing bytes. All console/file payloads, live handles, state at each effect, '
                        'post-callback states and recursive calls are compared. Signed 32-bit times retain the original fixed insertion '
                        'offset seven. Payloads over 1016 bytes would overflow the original stack buffer and are MiniLang contracts '
                        'and explicit oracle fixture rejections, not native parity. Callers supply already formatted payloads; '
                        'filesystem opening, closing, append mode and console transport remain host responsibilities.',
                  original_sources={p.relative_to(ROOT).as_posix(): sha(p) for p in sources()},
                  port_sources={p: sha(ROOT / p) for p in ['src/mq3/game/logging.ml', 'tests/game_logging_tests.ml',
                                                        'tests/reference/game_logging_oracle.c', 'scripts/test_game_logging.py']})
    selected = records[0]['artifact_stem'] if args.case else None
    if args.reuse_build:
        target = 'reused-' + (selected or 'all') + ('.native.json' if args.native_only else '.json')
    else:
        target = (selected + '.' if selected else '') + ('native.json' if args.native_only else 'result.json')
    (out / target).write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8', newline='\n')
    print(f"PASS: {len(records)} logging scenarios / {result['actions']} actions / {result['exact_words']} exact words / "
          f"{result['ordered_effects']} ordered effects / {result['semantic_assertions']} semantic assertions")


if __name__ == '__main__': main()
