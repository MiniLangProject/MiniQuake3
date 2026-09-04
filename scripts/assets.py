"""Hash and inspect user-owned archives without modifying or redistributing them."""
import argparse
import json
import zipfile
from toolchain import ROOT
from inventory import sha
from pathlib import Path

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("data_root", type=Path)
    args = parser.parse_args()
    archives = sorted((args.data_root / "baseq3").glob("*.pk3"))
    if not archives:
        raise RuntimeError("No baseq3/*.pk3 archives found")
    manifest = {"data_root": str(args.data_root.resolve()), "archives": []}
    qvms = ROOT / "artifacts/reference/qvms"
    qvms.mkdir(parents=True, exist_ok=True)
    for path in archives:
        with zipfile.ZipFile(path) as archive:
            names = archive.namelist()
            record = {"name": path.name, "sha256": sha(path), "size": path.stat().st_size,
                      "maps": sorted(n for n in names if n.lower().endswith(".bsp")),
                      "qvms": []}
            for name in names:
                if name.lower() in ("vm/qagame.qvm", "vm/cgame.qvm", "vm/ui.qvm"):
                    target = qvms / Path(name).name
                    target.write_bytes(archive.read(name))
                    record["qvms"].append({"name": name, "sha256": sha(target)})
            manifest["archives"].append(record)
    target = ROOT / "artifacts/reference/assets.json"
    target.write_text(json.dumps(manifest, indent=2) + "\n")
    print(f"Inspected {len(archives)} archives; manifest: {target}")

if __name__ == "__main__":
    main()
