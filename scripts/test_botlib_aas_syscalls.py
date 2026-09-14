"""Check Baseq3 AAS and BSP-entity QVM ABI marshalling."""
import subprocess
import sys
from toolchain import ROOT, run


def main():
    subprocess.run(
        [sys.executable, ROOT / "scripts/build.py", "--source", "tests/botlib_aas_syscall_contracts.ml", "--output", "botlib_aas_syscall_contracts.exe"],
        cwd=ROOT,
        check=True,
    )
    value = run([ROOT / "build/botlib_aas_syscall_contracts.exe"], ROOT).strip()
    if value != "PASS: 11 botlib AAS syscall contracts":
        raise RuntimeError(value)
    print(value)


if __name__ == "__main__":
    main()
