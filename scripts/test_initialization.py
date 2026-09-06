"""Original Baseq3 team grouping, item registration and team initialization.

Only the undefined blue byte of the first native CTF status publication is
normalized. Its unhandled three-byte native value is archived separately.
"""
import argparse
from dataclasses import dataclass
import json
import random
import re
import struct
import subprocess
import sys

from inventory import sha
from test_bodies import map_bytes
from toolchain import ROOT, msvc_env, run


def i32(value):
    return (value + 0x80000000) % 0x100000000 - 0x80000000


def ints(*values):
    return struct.pack("<" + "i" * len(values), *(i32(v) for v in values))


def string(value):
    if value is None:
        return ints(-1)
    data = value.encode("utf-8")
    assert b"\0" not in data and len(data) < 4096
    return ints(len(data)) + data


def float_word(value):
    return struct.unpack("<i", struct.pack("<f", value))[0]


@dataclass(frozen=True)
class Entity:
    active: int = 1
    flags: int = 0
    master: int = -1
    chain: int = -1
    health: int = 123
    count: int = -37
    number: int = -1
    team: str | None = None
    targetname: str | None = None
    classname: str | None = "info_notnull"


def action(kind, a=0, b=0, c=0, text=None):
    return kind, a, b, c, text


def fixture(actions, entities=None, *, count=12, gametype=0, registered=None,
            team=None, flagtext="old-flags", itemtext="old-items"):
    team = team or [float_word(1.25), 2, 4, 1, 3, 17, 29, 31, 37]
    data = ints(count, gametype, *team, 9, 8, 7, 6)
    data += ints(*[(registered or {}).get(i, 0) for i in range(256)])
    data += string(flagtext) + string(itemtext)
    for i in range(count):
        ent = (entities or {}).get(i, Entity(active=0, health=100+i, count=-7-i))
        data += ints(ent.active, ent.flags, ent.master, ent.chain, ent.health, ent.count,
                     i if ent.number == -1 else ent.number)
        data += string(ent.team) + string(ent.targetname) + string(ent.classname)
    data += ints(len(actions))
    for kind, a, b, c, text in actions:
        data += ints(kind, a, b, c) + string(text)
    return data


def scenarios():
    for count in (0, 1, 2):
        yield f"find_empty_{count}", fixture([action(1)], count=count)
    yield "find_slot_zero_ignored", fixture([action(1)], {
        0: Entity(team="group", targetname="world-target"),
        1: Entity(team="group"), 2: Entity(team="group", targetname="last")})
    yield "find_case_sensitive", fixture([action(1)], {
        1: Entity(team="Case"), 2: Entity(team="case"), 3: Entity(team="Case"),
        4: Entity(team="ä"), 5: Entity(team="Ä"), 6: Entity(team="ä")})
    yield "find_empty_vs_null", fixture([action(1)], {
        1: Entity(team="", targetname="master"), 2: Entity(team=None, targetname="null-team"),
        3: Entity(team="", targetname="last"), 4: Entity(team="", targetname="")})
    yield "find_prepend_existing_chain", fixture([action(1), action(1)], {
        1: Entity(team="group", chain=9, master=8, targetname="initial"),
        2: Entity(team="group", chain=8, master=7, targetname="first"),
        3: Entity(team="group", chain=6, targetname="last"),
        9: Entity(active=0, team="group", targetname="dormant")})
    yield "find_skip_slaves_and_inactive", fixture([action(1)], {
        1: Entity(flags=0x400, team="group", chain=9, master=7, targetname="slave"),
        2: Entity(active=0, team="group", targetname="inactive"),
        3: Entity(flags=0x20, team="group"), 4: Entity(flags=-2147483648, team="group", targetname="active")})
    yield "find_targetname_last_non_null", fixture([action(1)], {
        1: Entity(team="group", targetname="master"), 2: Entity(team="group", targetname="second"),
        3: Entity(team="group", targetname=""), 4: Entity(team="group", targetname=None)})
    yield "find_self_chain_preserved", fixture([action(1), action(1)], {
        1: Entity(team="solo", chain=1), 2: Entity(team="other", chain=1)})
    yield "find_mutation_and_regroup", fixture([action(1), action(10, 3, 1, 0),
        action(11, 3, 0, text="other"), action(11, 3, 1, text="retargeted"), action(1)], {
        1: Entity(team="group"), 2: Entity(team="other"), 3: Entity(team="group", targetname="original")})
    yield "find_last_entity", fixture([action(1)], {
        0: Entity(team="group"), 1: Entity(team="group"), 1023: Entity(team="group", targetname="last-slot")}, count=1024)
    yield "registration_clear_complete_storage", fixture([action(2), action(4)],
        registered={i: i+1 for i in range(256)})
    yield "registration_dummy_and_sentinel", fixture([action(2), action(3, 0), action(3, 36), action(4)])
    yield "registration_all_items", fixture([action(2)] + [action(3, i) for i in range(1, 36)] + [action(4), action(4)])
    yield "registration_noncanonical_bits", fixture([action(4)], registered={
        i: (-3 if i % 2 else 17) for i in range(256)})
    yield "registration_only_outside_published_range", fixture([action(4), action(2), action(4)],
        registered={36: 1, 100: 3, 255: -1})
    yield "registration_null_drop", fixture([action(2), action(3, -1)])
    for gametype in (-1, 0, 1, 2, 3, 4, 5, 6, 7, 8):
        yield f"team_reset_{gametype}", fixture([action(5), action(5)], gametype=gametype, registered={255: 9})
    for flags in range(4):
        registered = {i: 1 for i in (34, 35) if flags & (1 << (i-34))}
        yield f"ctf_check_flags_{flags}", fixture([action(6)], gametype=4, registered=registered)
    yield "ctf_reuse_after_live_status", fixture([action(5), action(12, 1, 4), action(12, 2, 1),
        action(12, 0, 2), action(8, 0, float_word(-123.5)), action(8, 5, 2147483647),
        action(8, 6, -2147483648), action(8, 7, -17), action(8, 8, 99), action(6), action(4)], gametype=4)
    yield "ctf_switch_to_nonteam_preserves_config", fixture([action(5), action(9, 0), action(6), action(9, 5), action(6)], gametype=4)
    yield "post_spawn_sequence", fixture([action(2), action(3, 34), action(3, 35), action(3, 12),
        action(1), action(6), action(4)], {1: Entity(team="items"), 2: Entity(team="items", targetname="weapons")}, gametype=4)
    rng = random.Random(0x1A17)
    for seed in range(24):
        count = rng.randrange(8, 65)
        entities = {i: Entity(active=rng.randrange(2), flags=rng.choice([0, 0x400, 0x80000000]),
            master=rng.randrange(-1, count), chain=rng.randrange(-1, count),
            team=rng.choice([None, "", "a", "A", "group", "group two"]),
            targetname=rng.choice([None, "", "target-"+str(i)])) for i in range(count)}
        yield f"seeded_teams_{seed}", fixture([action(1), action(1)], entities, count=count)
    for seed in range(12):
        registered = {i: rng.choice([0, 0, 0, 1, -1, 17]) for i in range(256)}
        actions = [action(4), action(6), action(2), action(4), action(6)]
        yield f"seeded_registration_{seed}", fixture(actions, gametype=rng.choice([0, 3, 4, 5]), registered=registered)


def original_sources():
    code = ROOT / "Quake-III-Arena-original-source/code/game"
    return [code / name for name in ("g_main.c", "g_items.c", "g_team.c", "bg_misc.c", "q_shared.c",
        "q_math.c", "g_local.h", "bg_public.h", "q_shared.h", "g_public.h")]


def build_native(out):
    out.mkdir(parents=True, exist_ok=True)
    code = ROOT / "Quake-III-Arena-original-source/code/game"
    team = (code / "g_team.c").read_text(encoding="utf-8")
    declaration = re.search(r"typedef struct teamgame_s \{.*?teamgame_t teamgame;", team, re.S)
    remap = re.search(r"static char ctfFlagStatusRemap\[\].*?;\s*static char oneFlagStatusRemap\[\].*?;", team, re.S)
    assert declaration and remap
    (out / "initialization_team_state.inc").write_text(declaration[0] + "\n" + remap[0] + "\n", encoding="utf-8", newline="\n")
    selected = {"g_main.c": ["G_FindTeams"], "g_team.c": ["Team_SetFlagStatus", "Team_InitGame"],
                "g_items.c": ["ClearRegisteredItems", "RegisterItem", "SaveRegisteredItems", "G_CheckTeamItems"]}
    bodies = []
    for name, functions in selected.items():
        source = (code / name).read_text(encoding="utf-8")
        for symbol in functions:
            match = re.search(r"^\w+[ \t]+\*?" + symbol + r"\s*\([^;]*?\)\s*\{.*?^\}", source, re.M | re.S)
            if not match:
                raise RuntimeError("Missing original initialization function " + symbol)
            bodies.append(match[0])
    (out / "initialization_functions.inc").write_text("\n\n".join(bodies) + "\n", encoding="utf-8", newline="\n")
    run(["cl", "/nologo", "/Od", "/Gy", "/fp:strict", "/arch:SSE2", "/MT", "/DWIN32", "/DNDEBUG",
         "/D_CRT_SECURE_NO_WARNINGS", f"/I{code}", f"/I{out}", ROOT / "tests/reference/initialization_oracle.c",
         code / "bg_misc.c", code / "q_shared.c", code / "q_math.c",
         f"/Fe:{out / 'initialization_oracle.exe'}", "/link", "/OPT:REF", "/Brepro"],
        out, msvc_env("x86"), out / "build.log")


def inspect(data):
    offset = 0
    def integer():
        nonlocal offset
        value = struct.unpack_from("<i", data, offset)[0]
        offset += 4
        return value
    def text():
        nonlocal offset
        size = integer()
        if size == -1:
            return None
        value = data[offset:offset+size].decode("utf-8")
        offset += size
        return value
    states, events, normalized, dropped = [], [], 0, False
    while offset < len(data):
        marker = integer()
        if marker == 700:
            count, gametype = integer(), integer()
            state = dict(count=count, gametype=gametype, team=[integer() for _ in range(9)],
                scores=[integer() for _ in range(4)], registered=[integer() for _ in range(256)],
                flags=text(), items=text(), entities=[])
            for _ in range(count):
                state["entities"].append(dict(zip(("active", "flags", "master", "chain", "health", "count", "number", "team", "targetname", "classname"),
                    [integer() for _ in range(7)] + [text() for _ in range(3)])))
            states.append(state)
        elif marker == 710:
            events.append(dict(kind="print", text=text(), state=states[-1]))
        elif marker == 711:
            events.append(dict(kind="config", index=integer(), normalized=integer(), text=text(), state=states[-1]))
        elif marker == 730:
            normalized = integer()
        elif marker == 799:
            dropped = True
        else:
            raise RuntimeError(f"Unknown initialization oracle marker {marker} at {offset-4}")
    return dict(states=states, events=events, normalization_count=normalized, dropped=dropped)


def assert_semantics(name, parsed, raw):
    events = parsed["events"]
    transient = [i for i, event in enumerate(events) if event.get("normalized")]
    assert len(transient) == parsed["normalization_count"] == len(raw)
    for index, record in zip(transient, raw):
        event = events[index]
        assert event["index"] == 23 and event["text"] == "0" and event["state"]["team"][2:4] == [0, -1]
        following = events[index+1]
        assert following["kind"] == "config" and following["index"] == 23 and following["text"] == "00"
        assert following["state"]["team"][2:4] == [0, 0] and following["normalized"] == 0
        assert record["red"] == 0 and record["blue"] == -1
        assert len(record["raw_hex"]) == 6 and record["raw_hex"].startswith("30") and record["raw_hex"].endswith("00")
    for index, event in enumerate(events):
        if event["kind"] == "config" and event["index"] == 27:
            required = "".join("1" if bit else "0" for bit in event["state"]["registered"][:36])
            assert event["text"] == required
            assert events[index-1]["kind"] == "print" and events[index-1]["text"] == f"{required.count('1')} items registered\n"
    final = parsed["states"][-1]
    if name == "find_slot_zero_ignored":
        assert final["entities"][0]["master"] == -1 and final["entities"][0]["targetname"] == "world-target"
    if name == "find_prepend_existing_chain":
        assert [final["entities"][i]["chain"] for i in (1, 3, 2)] == [3, 2, 9]
        assert final["entities"][1]["targetname"] == "last"
        assert [event["text"] for event in events] == ["1 teams with 3 entities\n", "1 teams with 1 entities\n"]
    if name == "find_empty_vs_null":
        assert final["entities"][1]["targetname"] == "" and final["entities"][2]["targetname"] == "null-team"
    if name == "registration_dummy_and_sentinel":
        assert final["registered"][0] == final["registered"][36] == 1 and final["items"].count("1") == 3
    if name.startswith("ctf_check_flags_"):
        flags = int(name.rsplit("_", 1)[1])
        expected = ["^3WARNING: No team_CTF_" + color + "flag in map" for bit, color in enumerate(("red", "blue")) if not flags & (1 << bit)]
        assert [event["text"] for event in events if event["kind"] == "print"] == expected
    if name.startswith("team_reset_"):
        assert final["team"] == [0] * 9 and final["scores"] == [9, 8, 7, 6] and final["registered"][255] == 9
        assert final["flags"] == ("00" if final["gametype"] == 4 else "old-flags")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--case")
    parser.add_argument("--native-only", action="store_true")
    parser.add_argument("--reuse-build", action="store_true")
    args = parser.parse_args()
    out = ROOT / "build/reference/initialization"
    if not args.reuse_build:
        build_native(out)
        if not args.native_only:
            subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/initialization_tests.ml",
                "--output", "initialization_tests.exe"], check=True)
    bsp = out / "empty.bsp"
    bsp.write_bytes(map_bytes())
    records = []
    for name, data in scenarios():
        if args.case and args.case != name:
            continue
        inp, expected, rawpath = out / (name + ".bin"), out / (name + ".expected"), out / (name + ".raw.jsonl")
        inp.write_bytes(data)
        native = subprocess.run([out / "initialization_oracle.exe", inp, expected, rawpath], capture_output=True, text=True)
        (out / (name + ".oracle.log")).write_text(native.stdout + native.stderr, encoding="utf-8", newline="\n")
        dropping = name == "registration_null_drop"
        if native.returncode != (72 if dropping else 0) or (dropping and "RegisterItem: NULL" not in native.stderr):
            raise RuntimeError(f"Unexpected native initialization result: {name}: {native.returncode}: {native.stderr}")
        parsed = inspect(expected.read_bytes())
        raw = [json.loads(line) for line in rawpath.read_text(encoding="utf-8").splitlines()]
        assert parsed["dropped"] == dropping
        assert_semantics(name, parsed, raw)
        record = dict(name=name, output_bytes=expected.stat().st_size, normalization_count=len(raw),
            native_drop=dropping, ordered_effects=len(parsed["events"]), inputs_sha256=sha(inp),
            expected_sha256=sha(expected), raw_transient_sha256=sha(rawpath))
        if not args.native_only:
            result = run([ROOT / "build/initialization_tests.exe", bsp, inp, expected], ROOT / "build",
                log=out / (name + ".test.log"))
            match = re.search(r"(\d+) initialization actions / (\d+) exact words / (\d+) ordered effects / (\d+) transient normalizations", result)
            if not match:
                raise RuntimeError(result)
            record.update(actions=int(match[1]), exact_words=int(match[2]))
            assert int(match[3]) == record["ordered_effects"] and int(match[4]) == record["normalization_count"]
            if not name.startswith("seeded_"):
                print(name + ": " + result.strip(), flush=True)
        records.append(record)
    if not records:
        raise RuntimeError("No matching initialization scenario")
    contracts = 0
    if not args.native_only:
        first = records[0]["name"]
        result = run([ROOT / "build/initialization_tests.exe", bsp, out / (first + ".bin"),
            out / (first + ".expected"), "--contracts"], ROOT / "build", log=out / "contracts.log")
        match = re.search(r"PASS: (\d+) initialization runtime contracts", result)
        if not match:
            raise RuntimeError(result)
        contracts = int(match[1])
    result = dict(passed=True, native_only=args.native_only, scenario_count=len(records), scenarios=records,
        actions=sum(r.get("actions", 0) for r in records), exact_words=sum(r.get("exact_words", 0) for r in records),
        ordered_effects=sum(r["ordered_effects"] for r in records), output_bytes=sum(r["output_bytes"] for r in records),
        normalization_count=sum(r["normalization_count"] for r in records), native_rejections=sum(r["native_drop"] for r in records),
        runtime_contracts=contracts, oracle_sha256=sha(out / "initialization_oracle.exe"), map_sha256=sha(bsp),
        scope="Unchanged Baseq3 G_FindTeams, ClearRegisteredItems, RegisterItem, SaveRegisteredItems, Team_InitGame, Team_SetFlagStatus and G_CheckTeamItems with real bg_itemlist lookups. Entity links, targetnames, all 256 registration bits, nine teamgame words, retained team scores and both configstrings are compared at every host callback and action. Each first CTF publication reads one undefined native blue byte; that byte is archived raw and normalized to NUL, excluded from exact parity. Its red prefix, state, order and final 00 publication are exact. Missionpack gameplay is excluded.",
        original_sources={source.relative_to(ROOT).as_posix(): sha(source) for source in original_sources()})
    if not args.native_only:
        result["test_sha256"] = sha(ROOT / "build/initialization_tests.exe")
    filename = ("native-only" if args.native_only else "result") if not args.case else args.case + (".native-only" if args.native_only else ".result")
    (out / (filename + ".json")).write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(f"PASS: {len(records)} initialization scenarios / {result['actions']} MiniLang actions / "
          f"{result['exact_words']} exact words / {result['normalization_count']} explicitly normalized native bytes")


if __name__ == "__main__":
    main()
