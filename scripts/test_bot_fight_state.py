"""Build the unchanged Baseq3 battle-fight oracle and MiniLang contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, msvc_env, run


def main():
    out = ROOT / "build/reference/bot_fight_state"
    out.mkdir(parents=True, exist_ok=True)
    src = ROOT / "tests/reference/bot_fight_state_oracle.c"
    exe = out / "bot_fight_state_oracle.exe"
    run(
        ["cl", "/nologo", "/O2", "/fp:strict", "/MT", "/W4", src, f"/Fe:{exe}", "/link", "/Brepro"],
        out,
        msvc_env("x64"),
        out / "oracle-build.log",
    )
    native = run([exe], out, log=out / "oracle.log").strip()
    if native != "PASS: 13 native Baseq3 battle-fight scenarios / 26 exact observations":
        raise RuntimeError(native)

    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/bot_fight_state_contracts.ml", "--output", "bot_fight_state_contracts.exe"],
        check=True,
    )
    mini = run([ROOT / "build/bot_fight_state_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    if mini != "PASS: 14 battle-fight state contracts":
        raise RuntimeError(mini)

    files = [
        ROOT / "Quake-III-Arena-original-source/code/game/ai_dmnet.c",
        src,
        ROOT / "src/mq3/game/bot_fight_state.ml",
        ROOT / "src/mq3/game/bot_combat_ai.ml",
        ROOT / "src/mq3/game/bot_lifecycle.ml",
        ROOT / "tests/bot_fight_state_contracts.ml",
    ]
    result = {
        "passed": True,
        "native": native,
        "minilang": mini,
        "native_scenarios": 13,
        "exact_observations": 26,
        "contract_count": 14,
        "scope": "Baseq3 Battle_Fight entry/state flow joining enemy acquisition, attack movement, aiming, firing, chase, chat and retreat decisions.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: unchanged-C battle-fight oracle + 14 MiniLang contracts")


if __name__ == "__main__":
    main()
