"""Start the original dedicated mode with a local writable home and bounded lifetime."""
import argparse
import json
import shutil
import subprocess
from pathlib import Path
from toolchain import ROOT

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("data_root", type=Path)
    parser.add_argument("--vm", choices=("native", "interpreter"), default="native")
    args = parser.parse_args()
    home = ROOT / "artifacts/reference/home"
    base = home / "baseq3"
    base.mkdir(parents=True, exist_ok=True)
    for module in (ROOT / "build/reference").glob("*x86.dll"):
        shutil.copyfile(module, base / module.name)
    if args.vm == "interpreter":
        (base / "vm").mkdir(exist_ok=True)
        for name in ("qagame", "cgame", "ui"):
            shutil.copyfile(ROOT / "build/reference/qvms" / (name + ".qvm"), base / "vm" / (name + ".qvm"))
    command = [str(ROOT / "build/reference/quake3-reference.exe"),
               "+set", "dedicated", "1", "+set", "net_ip", "127.0.0.1",
               "+set", "net_port", "27969", "+set", "fs_basepath", str(home),
               "+set", "fs_homepath", str(home), "+set", "fs_cdpath", str(args.data_root.resolve()),
               "+set", "logfile", "2", "+set", "vm_game", "1" if args.vm == "interpreter" else "0",
               "+set", "sv_pure", "0", "+set", "bot_enable", "1",
               "+map", "q3dm1", "+status", "+quit"]
    startup = subprocess.STARTUPINFO()
    startup.dwFlags |= subprocess.STARTF_USESHOWWINDOW
    startup.wShowWindow = 0
    proc = subprocess.Popen(command, cwd=home, startupinfo=startup)
    try:
        result = proc.wait(timeout=35)
    except subprocess.TimeoutExpired:
        proc.terminate()
        proc.wait(timeout=5)
        result = "timeout"
    log = base / "qconsole.log"
    text = log.read_text(encoding="latin1") if log.exists() else ""
    shutil.copyfile(log, home.parent / ("smoke-" + args.vm + ".log"))
    (home.parent / ("smoke-" + args.vm + ".json")).write_text(json.dumps({"command": command, "exit": result,
        "log": str(log), "map_loaded": "------- Game Initialization -------" in text,
        "note": "Initialization smoke only, not deterministic match parity"}, indent=2) + "\n")
    print(text[-7000:])
    if result != 0 or "------- Game Initialization -------" not in text:
        raise RuntimeError("Original engine map initialization did not pass")

if __name__ == "__main__":
    main()
