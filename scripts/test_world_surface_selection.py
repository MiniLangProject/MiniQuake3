"""Verify camera-driven BSP world selection and its one-time geometry cache."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main():
    out = ROOT / "build/reference/world_surface_selection"
    out.mkdir(parents=True, exist_ok=True)
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/world_surface_selection_contracts.ml", "--output", "world_surface_selection_contracts.exe"], cwd=ROOT, check=True)
    contracts = run([ROOT / "build/world_surface_selection_contracts.exe"], ROOT / "build", log=out / "contracts.log").strip()
    expected = "PASS: 28 world-surface-selection contracts"
    if contracts != expected:
        raise RuntimeError(contracts)

    q3dm1 = None
    retained = ROOT / "build/reference/bodies/cd_q3dm1.bsp"
    if retained.exists():
        subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source", "tests/world_surface_selection_map_probe.ml", "--output", "world_surface_selection_map_probe.exe"], cwd=ROOT, check=True)
        q3dm1 = run([ROOT / "build/world_surface_selection_map_probe.exe", retained], ROOT / "build", log=out / "q3dm1.log").strip()
        if not q3dm1.startswith("PASS: q3dm1 world selection totalFaces="):
            raise RuntimeError(q3dm1)

    files = [
        ROOT / "src/mq3/renderer/world_surface_selection.ml",
        ROOT / "src/mq3/renderer/bsp_render_data.ml",
        ROOT / "src/mq3/client/playable_viewer.ml",
        ROOT / "tests/world_surface_selection_contracts.ml",
        ROOT / "tests/world_surface_selection_map_probe.ml",
    ]
    report = {
        "passed": True,
        "contracts": 28,
        "q3dm1": q3dm1,
        "scope": "BSP leaf/PVS discovery, spherical frustum and distance rejection, planar backface culling, stable projected-importance ordering, configurable whole-surface triangle budget, retained face-set comparison, and one-time tessellated geometry cache.",
        "sources": {str(p.relative_to(ROOT)).replace("\\", "/"): sha(p) for p in files},
    }
    (out / "result.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(expected)


if __name__ == "__main__":
    main()
