"""Build the unchanged Baseq3 seek-LTG bodies and MiniLang contracts."""
import json
import subprocess
import sys

from inventory import sha
from test_rejections import tiny_bsp
from toolchain import ROOT, msvc_env, run


def main():
    out = ROOT / "build/reference/bot_seek_state"
    out.mkdir(parents=True, exist_ok=True)
    original = ROOT / "Quake-III-Arena-original-source/code/game/ai_dmnet.c"
    text = original.read_text(encoding="latin-1")
    start = text.index("void AIEnter_Seek_NBG(bot_state_t *bs, char *s)")
    end = text.index("void AIEnter_Battle_Fight(bot_state_t *bs, char *s)", start)
    body = text[start:end]
    body = body[: body.rfind("/*")]
    include = ROOT / "tests/reference/bot_seek_ltg_original.inc"
    include.write_text(body.rstrip() + "\n", encoding="latin-1", newline="\n")

    source = ROOT / "tests/reference/bot_seek_state_oracle.c"
    oracle = out / "bot_seek_state_oracle.exe"
    run(["cl", "/nologo", "/O2", "/fp:strict", "/MT", "/W4", source,
         f"/Fe:{oracle}", "/link", "/Brepro"], out, msvc_env("x64"), out / "oracle-build.log")
    native = run([oracle], out, log=out / "oracle.log").strip()
    expected = "PASS: 21 native Baseq3 seek-state scenarios / 54 exact observations"
    if native != expected:
        raise RuntimeError(native)

    idle_start = text.index("void AIEnter_Intermission(bot_state_t *bs, char *s)")
    idle_end = text.index("int BotSelectActivateWeapon(bot_state_t *bs)", idle_start)
    (ROOT / "tests/reference/bot_idle_nodes_original.inc").write_text(text[idle_start:idle_end].rstrip()+"\n",encoding="latin-1",newline="\n")
    idle_source=ROOT/"tests/reference/bot_idle_nodes_oracle.c";idle_oracle=out/"bot_idle_nodes_oracle.exe"
    run(["cl","/nologo","/O2","/fp:strict","/MT","/W4",idle_source,f"/Fe:{idle_oracle}","/link","/Brepro"],out,msvc_env("x64"),out/"idle-oracle-build.log")
    idle_native=run([idle_oracle],out,log=out/"idle-oracle.log").strip()
    if idle_native!="PASS: 14 native Baseq3 idle-node scenarios / 31 exact observations": raise RuntimeError(idle_native)
    activate_start=text.index("void AIEnter_Seek_ActivateEntity(bot_state_t *bs, char *s)")
    activate_end=text.index("void AIEnter_Seek_NBG(bot_state_t *bs, char *s)",activate_start)
    (ROOT/"tests/reference/bot_activate_node_original.inc").write_text(text[activate_start:activate_end].rstrip()+"\n",encoding="latin-1",newline="\n")
    activate_source=ROOT/"tests/reference/bot_activate_node_oracle.c";activate_oracle=out/"bot_activate_node_oracle.exe"
    run(["cl","/nologo","/O2","/fp:strict","/MT",activate_source,f"/Fe:{activate_oracle}","/link","/Brepro"],out,msvc_env("x64"),out/"activate-oracle-build.log")
    activate_native=run([activate_oracle],out,log=out/"activate-oracle.log").strip()
    if activate_native!="PASS: 8 native Baseq3 activate-node scenarios / 16 exact observations": raise RuntimeError(activate_native)

    bsp = out / "empty.bsp"
    bsp.write_bytes(tiny_bsp())
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/bot_seek_state_contracts.ml", "--output",
                    "bot_seek_state_contracts.exe"], check=True)
    mini = run([ROOT / "build/bot_seek_state_contracts.exe", bsp], ROOT / "build",
               log=out / "contracts.log").strip()
    if mini != "PASS: 38 seek-LTG state contracts":
        raise RuntimeError(mini)

    files = [original, include, source, ROOT / "src/mq3/game/bot_seek_state.ml",
             ROOT / "src/mq3/game/bot_ai_commands.ml", ROOT / "src/mq3/game/bot_ai_frame.ml",
             ROOT / "src/mq3/game/bot_navigation.ml", ROOT / "src/mq3/game/bot_fight_state.ml",
             ROOT / "tests/bot_seek_state_contracts.ml", ROOT/"tests/reference/bot_idle_nodes_original.inc",
             idle_source, ROOT/"tests/reference/bot_activate_node_original.inc", activate_source]
    result = {"passed": True, "native": native, "minilang": mini,
              "idle_native": idle_native, "activate_native":activate_native, "native_scenarios": 43, "exact_observations": 101, "contract_count": 38,
              "scope": "Baseq3 Seek_LTG, Seek_NBG, Seek_ActivateEntity, Stand, Respawn, Observer and Intermission entries/nodes through goals, activation stack, movement, chat, combat and startFrame dispatch.",
              "sources": {str(p.relative_to(ROOT)).replace("\\", "/"): sha(p) for p in files}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: unchanged-C seek-state oracle + 38 MiniLang contracts")


if __name__ == "__main__":
    main()
