"""Run byte-for-byte Baseq3 battle-state bodies and corresponding MiniLang contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run


def extract_block(text: str, signature: str) -> tuple[str, int]:
    start = text.index(signature)
    brace = text.index("{", start)
    depth = 0
    for pos in range(brace, len(text)):
        if text[pos] == "{":
            depth += 1
        elif text[pos] == "}":
            depth -= 1
            if depth == 0:
                return text[start : pos + 1], pos + 1
    raise RuntimeError(f"unterminated function {signature}")


def main():
    out = ROOT / "build/reference/bot_battle_states"
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / "Quake-III-Arena-original-source/code/game/ai_dmnet.c"
    text = original.read_text(encoding="latin-1")
    signatures = [
        "void AIEnter_Battle_Chase(bot_state_t *bs, char *s)",
        "int AINode_Battle_Chase(bot_state_t *bs)",
        "void AIEnter_Battle_Retreat(bot_state_t *bs, char *s)",
        "int AINode_Battle_Retreat(bot_state_t *bs)",
        "void AIEnter_Battle_NBG(bot_state_t *bs, char *s)",
        "int AINode_Battle_NBG(bot_state_t *bs)",
    ]
    blocks = [extract_block(text, signature)[0] for signature in signatures]
    inc = out / "bot_battle_states_functions.inc"
    inc.write_text("\n\n".join(blocks) + "\n", encoding="latin-1", newline="\n")

    src = ROOT / "tests/reference/bot_battle_states_oracle.c"
    exe = out / "bot_battle_states_oracle.exe"
    run(["cl", "/nologo", "/O2", "/fp:strict", "/MT", "/W4", "/DCTF", f"/I{out}", src, f"/Fe:{exe}", "/link", "/Brepro"], out, msvc_env("x64"), out / "oracle-build.log")
    native = run([exe], out, log=out / "oracle.log").strip()
    expected = "PASS: 19 native Baseq3 battle chase/retreat/NBG scenarios / 43 exact observations"
    if native != expected:
        raise RuntimeError(native)

    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/bot_battle_states_contracts.ml", "--output", "bot_battle_states_contracts.exe"], check=True)
    mini = run([ROOT / "build/bot_battle_states_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    if mini != "PASS: 24 battle chase/retreat/NBG contracts":
        raise RuntimeError(mini)

    files = [original, src, ROOT / "src/mq3/game/bot_fight_state.ml", ROOT / "src/mq3/game/bot_combat_ai.ml", ROOT / "src/mq3/game/bot_lifecycle.ml", ROOT / "tests/bot_battle_states_contracts.ml"]
    result = {"passed": True, "native": native, "minilang": mini, "native_scenarios": 19, "exact_observations": 43, "contract_count": 24, "scope": "Baseq3 Battle_Chase, Battle_Retreat and Battle_NBG entry/state flow with byte-for-byte extracted original function bodies.", "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: extracted-C battle chase/retreat/NBG oracle + 24 MiniLang contracts")


if __name__ == "__main__":
    main()
