"""Keep actual Retail cgame/HUD and UI models beyond the entity-arena limit."""
import argparse
from pathlib import Path
import subprocess
import sys
from toolchain import ROOT, run


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, required=True)
    args = parser.parse_args()
    pak = args.data_root.resolve() / "baseq3/pak0.pk3"
    qvms = ROOT / "build/reference/qvms"
    if not pak.is_file():
        raise RuntimeError(f"Retail pak0.pk3 missing: {pak}")
    if not all((qvms / name).is_file() for name in ("qagame.qvm", "cgame.qvm", "ui.qvm")):
        subprocess.run([sys.executable, ROOT / "scripts/build_qvms.py"], cwd=ROOT, check=True)
    # The playable clock can elect not to draw cgame; the host must still
    # begin a frame before the UI, exactly once rather than per subscene.
    preview = (ROOT / "src/mq3/client/qvm_preview_app.ml").read_text(encoding="utf-8")
    frame = preview.split("function drawFrame(", 1)[1].split("end function", 1)[0]
    if not (frame.index("match.beginRendererFrame(state)") < frame.index("cgameClock.frame(")
            and "match.drawCgameProductiveInFrame(state," in frame):
        raise RuntimeError("productive host must begin renderer frame before the cgame clock and UI")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/qvm_frame_lifecycle_retail_probe.ml", "--output", "qvm_frame_lifecycle_retail_probe.exe"], cwd=ROOT, check=True)
    out = ROOT / "build/reference/qvm_frame_lifecycle"
    out.mkdir(parents=True, exist_ok=True)
    value = run([ROOT / "build/qvm_frame_lifecycle_retail_probe.exe", pak, qvms], ROOT / "build", log=out / "retail.log").strip()
    if not value.startswith("PASS: Retail renderer lifecycle cgameFrames=120 "):
        raise RuntimeError(value)
    print(value)


if __name__ == "__main__":
    main()
