"""Run the native Baseq3 oracle and MiniLang client-movement contracts."""
import subprocess
import sys
from toolchain import ROOT, msvc_env, run


def main():
    out = ROOT / "build/reference/aas_client_movement"
    out.mkdir(parents=True, exist_ok=True)
    native = out / "aas_client_movement_oracle.exe"
    run(["cl", "/nologo", "/O2", "/fp:strict", "/MT", "/W4", ROOT / "tests/reference/aas_client_movement_oracle.c", f"/Fe:{native}", "/link", "/Brepro"], out, msvc_env("x64"), out / "oracle-build.log")
    oracle = run([native], out, log=out / "oracle.log").strip()
    if oracle != "PASS: 5 native Baseq3 AAS movement scenarios / 17 exact observations":
        raise RuntimeError(oracle)
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/aas_client_movement_contracts.ml", "--output", "aas_client_movement_contracts.exe"], cwd=ROOT, check=True)
    value = run([ROOT / "build/aas_client_movement_contracts.exe"], ROOT).strip()
    if value != "PASS: 12 AAS client movement contracts":
        raise RuntimeError(value)
    print(oracle)
    print(value)


if __name__ == "__main__":
    main()
