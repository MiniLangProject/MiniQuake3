"""MSVC discovery without modifying the user's environment."""
from pathlib import Path
import os
import subprocess
import shutil

ROOT = Path(__file__).resolve().parents[1]

def msvc_env(arch="x64"):
    candidates = []
    for name in ("ProgramFiles", "ProgramFiles(x86)"):
        base = Path(os.environ.get(name, "C:/Program Files")) / "Microsoft Visual Studio"
        candidates.extend(base.glob("*/*/VC/Auxiliary/Build/vcvarsall.bat"))
    if not candidates:
        raise RuntimeError("MSVC not found; install the Visual C++ desktop toolchain")
    script = sorted(candidates)[-1]
    # This command only obtains compiler environment variables. No file operations.
    result = subprocess.run(f'cmd /d /s /c ""{script}" {arch} >nul && set"',
                            capture_output=True, text=True, check=True)
    env = os.environ.copy()
    for line in result.stdout.splitlines():
        if "=" in line and not line.startswith("="):
            key, value = line.split("=", 1)
            env[key.upper()] = value
    return env

def run(command, cwd, env=None, log=None, timeout=240):
    command = list(command)
    command[0] = shutil.which(str(command[0]), path=(env or os.environ).get("PATH")) or command[0]
    result = subprocess.run([str(x) for x in command], cwd=cwd, env=env,
                            capture_output=True, text=True, errors="replace", timeout=timeout)
    if log:
        Path(log).write_text(subprocess.list2cmdline([str(x) for x in command]) + "\n" +
                             result.stdout + result.stderr, encoding="utf-8")
    if result.returncode:
        print((result.stdout + result.stderr)[-14000:])
        raise RuntimeError(f"{command[0]} failed ({result.returncode}); log: {log}")
    return result.stdout
