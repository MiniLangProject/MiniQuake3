"""Verify productive CG_SETUSERCMDVALUE state and preview consumption."""
import json
import subprocess
import sys
from inventory import sha
from toolchain import ROOT, run


def main():
    original = ROOT / "Quake-III-Arena-original-source/code/client/cl_cgame.c"
    input_source = ROOT / "Quake-III-Arena-original-source/code/client/cl_input.c"
    anchors = {
        original: ["void CL_SetUserCmdValue( int userCmdValue, float sensitivityScale )",
                   "cl.cgameUserCmdValue = userCmdValue;", "cl.cgameSensitivity = sensitivityScale;"],
        input_source: ["cmd->weapon = cl.cgameUserCmdValue;", "accelSensitivity *= cl.cgameSensitivity;"],
    }
    for path, values in anchors.items():
        text = path.read_text(encoding="latin-1")
        for value in values:
            if value not in text:
                raise RuntimeError(f"missing Baseq3 usercmd anchor {value!r}")
    host = ROOT / "src/mq3/engine/local_qvm_match.ml"
    preview = ROOT / "src/mq3/client/qvm_preview_app.ml"
    host_text = host.read_text(encoding="utf-8")
    preview_text = preview.read_text(encoding="utf-8")
    required = [
        (host_text, "cgameUsercmd.set(context.cgameUsercmd,value,sensitivity)"),
        (preview_text, "match.cgameUserCmdValue(state)"),
        (preview_text, "match.cgameSensitivity(state)"),
    ]
    for text, value in required:
        if value not in text:
            raise RuntimeError(f"productive cgame usercmd integration missing: {value}")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/cgame_usercmd_contracts.ml", "--output", "cgame_usercmd_contracts.exe"],
                   cwd=ROOT, check=True)
    result = run([ROOT / "build/cgame_usercmd_contracts.exe"], ROOT / "build").strip()
    if result != "PASS: 12 cgame usercmd-state contracts":
        raise RuntimeError(result)
    files = [original, input_source, ROOT / "src/mq3/client/cgame_usercmd.ml", host, preview,
             ROOT / "tests/cgame_usercmd_contracts.ml"]
    report = {
        "passed": True, "contracts": 12,
        "scope": "CG_SETUSERCMDVALUE now persists the retail cgame weapon and sensitivity in the productive local-QVM host; QVM preview usercmds and mouse look consume both values.",
        "remaining": "Full CL_KeyMove/CL_MouseMove timing, acceleration, filtering, joystick and command-ring generation remain separate input work.",
        "sources": {str(path.relative_to(ROOT)).replace("\\", "/"): sha(path) for path in files},
    }
    out = ROOT / "build/reference/cgame_usercmd"
    out.mkdir(parents=True, exist_ok=True)
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print("PASS: 5 Baseq3 cgame/input anchors + 12 productive usercmd-state contracts")


if __name__ == "__main__":
    main()
