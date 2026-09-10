"""Build and run the focused native and MiniLang bot-client resource tests."""
from pathlib import Path
from toolchain import ROOT, msvc_env, run

def main():
    out = ROOT / "build" / "reference" / "bot_ai_clients"
    out.mkdir(parents=True, exist_ok=True)
    env = msvc_env("x64")
    native = out / "bot_ai_client_oracle.exe"
    run(["cl", "/nologo", "/O2", "/fp:strict", "/MT", "/W4",
         ROOT / "tests/reference/bot_ai_client_oracle.c", f"/Fe:{native}"], out, env,
        out / "native-build.log")
    native_result = run([native], out, env, out / "native-run.log")
    if "PASS: 8 native bot client resource scenarios" not in native_result:
        raise RuntimeError("native bot-client oracle did not complete")
    run(["python", ROOT / "scripts/build.py", "--source",
         ROOT / "tests/bot_client_resource_contracts.ml", "--output",
         "bot_client_resource_contracts.exe"], ROOT, log=out / "mini-build.log")
    mini_result = run([ROOT / "build/bot_client_resource_contracts.exe"], ROOT,
                      log=out / "mini-run.log")
    if "PASS: 22 bot client resource contracts" not in mini_result:
        raise RuntimeError("MiniLang bot-client contracts did not complete")
    print("PASS: native oracle and 22 MiniLang bot client resource contracts")

if __name__ == "__main__":
    main()
