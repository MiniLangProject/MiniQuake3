"""Inventory every tracked original file and freeze the actual MiniLang inputs."""
import hashlib
import json
import re
import shutil
import subprocess
from pathlib import Path
from toolchain import ROOT

SOURCE = ROOT / "Quake-III-Arena-original-source"
COMPILER = ROOT.parent / "MiniLangCompilerML"

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def git(path, *args):
    return subprocess.check_output(["git", "-C", str(path), *args])

def classify(path):
    parts = Path(path).parts
    if parts[0] != "code":
        return "license" if len(parts) == 1 else "tool"
    if len(parts) < 3:
        return "build"
    group = parts[1]
    if group in ("unix", "win32", "macosx", "null"):
        return "platform"
    if group == "jpeg-6":
        return "third_party"
    if group == "bspc":
        return "tool"
    if group in ("ui", "splines"):
        return "missionpack"
    return "runtime"

def main():
    target = ROOT / "PORT_LEDGER.json"
    old = json.loads(target.read_text()) if target.exists() else {}
    previous = {x["source"]: x for x in old.get("files", [])}
    files = []
    for name in git(SOURCE, "ls-files", "-z").decode().split("\0"):
        if not name:
            continue
        path = SOURCE / name
        category = classify(name)
        # Candidate symbols only; authoritative symbol mapping is populated as each file is ported.
        symbols = []
        if path.suffix.lower() in (".c", ".cpp", ".h"):
            text = path.read_text(encoding="latin1")
            symbols = sorted(set(re.findall(r"(?m)^\w[^;\n{}]*?\b([A-Za-z_]\w*)\s*\([^;{}]*?\)\s*\{", text)))
        entry = {"source": name, "sha256": sha(path), "category": category,
                 "symbol_candidates": symbols, "symbol_mapping": [], "target": [],
                 "status": "not_started" if category in ("runtime", "platform", "missionpack") else "retained_original",
                 "tests": []}
        if name in previous:
            for key in ("symbol_mapping", "target", "status", "tests"):
                entry[key] = previous[name][key]
        files.append(entry)
    target.write_text(json.dumps({"schema": 1, "upstream_commit": git(SOURCE, "rev-parse", "HEAD").decode().strip(),
                     "files": files}, indent=2) + "\n", encoding="utf-8")
    frozen = ROOT / "artifacts/toolchain"
    frozen.mkdir(parents=True, exist_ok=True)
    inputs = [COMPILER / "build/mlc_win64.exe"]
    inputs += sorted((COMPILER / "std").rglob("*.ml"))
    records = []
    for path in inputs:
        relative = path.relative_to(COMPILER)
        destination = frozen / relative
        destination.parent.mkdir(parents=True, exist_ok=True)
        if not destination.exists() or sha(destination) != sha(path):
            shutil.copyfile(path, destination)
        records.append({"path": relative.as_posix(), "sha256": sha(destination)})
    patch = git(COMPILER, "diff", "HEAD", "--binary")
    (frozen / "compiler-working-tree.patch").write_bytes(patch)
    source_manifest = []
    for name in git(COMPILER, "ls-files", "-z").decode().split("\0"):
        path = COMPILER / name
        if name and path.is_file():
            source_manifest.append({"path": name, "sha256": sha(path)})
    profile = {"compiler_head": git(COMPILER, "rev-parse", "HEAD").decode().strip(),
               "working_tree_patch_sha256": sha(frozen / "compiler-working-tree.patch"),
               "inputs": records, "compiler_sources": source_manifest,
               "note": "Binary and stdlib are frozen under artifacts/toolchain; source hash does not prove binary provenance."}
    (ROOT / "docs/reference").mkdir(parents=True, exist_ok=True)
    (ROOT / "docs/reference/toolchain.json").write_text(json.dumps(profile, indent=2) + "\n", encoding="utf-8")
    print(f"Inventoried {len(files)} original files; froze {len(inputs)} compiler inputs.")

if __name__ == "__main__":
    main()
