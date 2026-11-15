"""Verify production registry wiring and real Retail Sarge HUD-head batches."""
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
    if not pak.is_file():
        raise RuntimeError(f"Retail pak0.pk3 missing: {pak}")
    source = (ROOT / "src/mq3/client/qvm_preview_app.ml").read_text(encoding="utf-8")
    for name in ("prepareViews", "preparePortal", "preparePortals"):
        signature = source.split(f"function {name}(", 1)[1].split("\n", 1)[0]
        if "modelAssets,assetNames,kinds," not in signature:
            raise RuntimeError(f"{name} must separate model objects and registered names")
    if source.count("state.context.modelAssets,state.context.assets,state.context.assetKinds,") != 3:
        raise RuntimeError("startup/frame/portal calls must supply both asset registries")
    if "expanded.triangles,assetNames,kinds," not in source or "geometry.triangles,assetNames,kinds," not in source:
        raise RuntimeError("main and portal material refresh must receive registered name strings")
    bootstrap = source.split("function bootFrameSettingsNamed(", 1)[1].split("end function", 1)[0]
    if "qworld.userCommand(serverTime,[0,0,0],0,2,0,0,0)" not in bootstrap:
        raise RuntimeError("loading snapshots must not inject forward movement")
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/qvm_hud_head_retail_probe.ml", "--output", "qvm_hud_head_retail_probe.exe"], cwd=ROOT, check=True)
    value = run([ROOT / "build/qvm_hud_head_retail_probe.exe", pak], ROOT / "build").strip()
    expected = "PASS: Retail HUD head 117 textured triangles, two skin materials, zero fallbacks"
    if value != expected:
        raise RuntimeError(value)
    print(value)
    print("PASS: productive model/name registry wiring and neutral bootstrap input")


if __name__ == "__main__":
    main()
