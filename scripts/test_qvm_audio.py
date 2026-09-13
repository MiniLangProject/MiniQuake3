"""Exercise QVM sound-handle loading and the stateful PCM command bridge."""
import argparse
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT


def build(source: str, output: str) -> Path:
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", source, "--output", output], cwd=ROOT, check=True)
    return ROOT / "build" / output


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path)
    args = parser.parse_args()
    contracts = build("tests/qvm_playback_contracts.ml", "qvm_playback_contracts.exe")
    subprocess.run([contracts], cwd=ROOT, check=True)
    if args.data_root:
        pak = args.data_root / "baseq3" / "pak0.pk3"
        if not pak.is_file():
            raise RuntimeError(f"missing retail pak: {pak}")
        retail = build("tests/qvm_sound_assets_retail_probe.ml", "qvm_sound_assets_retail_probe.exe")
        subprocess.run([retail, pak], cwd=ROOT, check=True)
        qvms = ROOT / "build" / "reference" / "qvms"
        subprocess.run([sys.executable, ROOT / "scripts/build_qvms.py"], cwd=ROOT, check=True)
        match_probe = build("tests/qvm_audio_retail_match_probe.ml", "qvm_audio_retail_match_probe.exe")
        subprocess.run([match_probe, pak, qvms], cwd=ROOT, check=True)


if __name__ == "__main__":
    main()
