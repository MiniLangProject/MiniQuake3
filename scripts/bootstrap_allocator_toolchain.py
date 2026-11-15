"""Rebuild the frozen compiler with reviewed allocator and GC-boundary fixes.

The sibling checkout is read-only. Build in an isolated worktree and retain
the original compiler/profile before an explicitly requested --install.
"""
from __future__ import annotations
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess

from toolchain import ROOT, run

BASE = "738d830fa604de884d7e488fde0991a19c034016"
UPSTREAM = "a40d726ff264bf993a2c571c105943e737fc2ed9"
BOOTSTRAP = "60db15723f1d33afccbaf81657e91569811c38cf54a320117857c29027700e0b"
PATCH_SHA = "95c7f1e5e2ad7aed03f2642379185f9b8e7f89fccf3dd52d25eaa436d20645e3"
SOURCE = "mlc/codegen/codegen_memory.ml"
SOURCE_SHA = "2287c63faecfc914e4e1143df56cb1adf86dfdccf819060f70606676cbcbadae"
PREVIOUS = "280135a508ed0c113e62be6464e6812826afdfc239ae20d9d369b15666561113"
MULTISIZE = "859ec139d288d94f99c1f598b77032b706880c7ff18fb5d3add1facfd46c9bef"


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def git(tree: Path, *args: str) -> bytes:
    return subprocess.check_output(["git", "-C", str(tree), *args])


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-repo", type=Path, default=ROOT.parent / "MiniLangCompilerML")
    parser.add_argument("--worktree", type=Path, default=ROOT / "build/toolchain-gc-boundaries")
    parser.add_argument("--candidate", type=Path, help="Reuse an independently validated candidate; requires its exact SHA-256")
    parser.add_argument("--candidate-sha256")
    parser.add_argument("--stage2", action="store_true", help="Self-compile once so the compiler itself also uses the fixed allocator")
    parser.add_argument("--install", action="store_true")
    args = parser.parse_args()
    patch = ROOT / "patches/minilang-738d830-gc-boundaries.patch"
    if sha(patch) != PATCH_SHA:
        raise RuntimeError("Allocator patch checksum mismatch")
    tree = args.worktree.resolve()
    if not tree.is_relative_to((ROOT / "build").resolve()):
        raise RuntimeError("Isolated worktree must be inside this repository's build directory")
    if not tree.exists():
        git(args.source_repo.resolve(), "worktree", "add", "--detach", str(tree), BASE)
    if git(tree, "rev-parse", "HEAD").decode().strip() != BASE:
        raise RuntimeError("Allocator worktree is not the frozen compiler revision")
    changed = git(tree, "diff", "--name-only", "HEAD").decode().splitlines()
    if not changed:
        source = tree / SOURCE
        source.write_bytes(source.read_bytes().replace(b"\r\n", b"\n"))
        git(tree, "apply", "--check", str(patch))
        git(tree, "apply", str(patch))
    elif changed != [SOURCE]:
        raise RuntimeError("Unexpected tracked changes in the allocator worktree")
    if sha(tree / SOURCE) != SOURCE_SHA:
        raise RuntimeError("Patched source differs from the reviewed backport")
    frozen = ROOT / "artifacts/toolchain"
    binary = frozen / "build/mlc_win64.exe"
    original_backup = ROOT / "build/toolchain-before-allocator"
    backup = ROOT / "build/toolchain-before-gc-boundaries"
    bootstrap = binary
    if not bootstrap.is_file() or sha(bootstrap) != BOOTSTRAP:
        bootstrap = original_backup / "mlc_win64.exe"
    if not bootstrap.is_file() or sha(bootstrap) != BOOTSTRAP:
        raise RuntimeError("The original frozen bootstrap compiler is required")
    profile_path = ROOT / "docs/reference/toolchain.json"
    profile = json.loads(profile_path.read_text(encoding="utf-8"))
    if profile["compiler_head"] != BASE:
        raise RuntimeError("This backport requires the738d830 frozen source profile")
    for record in profile["inputs"]:
        if record["path"] != "build/mlc_win64.exe" and sha(frozen / record["path"]) != record["sha256"]:
            raise RuntimeError("Frozen standard library input changed: " + record["path"])
    stage1 = tree / "build/mlc_allocator_stage1.exe"
    stage1.parent.mkdir(parents=True, exist_ok=True)
    flags = ["-I", str(tree), "--heap-reserve", "8g", "--heap-commit", "512m",
             "--heap-shrink", "--heap-shrink-min", "16m", "--gc-limit", "1536m", "--object-pipeline"]
    commands = [[str(bootstrap), str(tree / "mlc_win64.ml"), str(stage1), *flags]]
    output = stage1
    if args.stage2:
        output = tree / "build/mlc_allocator_stage2.exe"
        commands.append([str(stage1), str(tree / "mlc_win64.ml"), str(output), *flags])
    if args.candidate:
        output = args.candidate.resolve()
        if not args.candidate_sha256 or sha(output) != args.candidate_sha256.lower():
            raise RuntimeError("Candidate checksum is required and must match independent validation")
    else:
        for number, command in enumerate(commands, 1):
            run(command, ROOT, log=tree / ("build/bootstrap-stage" + str(number) + ".log"), timeout=1800)
    if sha(tree / SOURCE) != SOURCE_SHA:
        raise RuntimeError("Source changed while building")
    # Verify that the candidate can compile/run, not just that it is executable.
    smoke = tree / "build/allocator_bootstrap_smoke.ml"
    smoke.write_text('function main(args)\nkeep=["safe",[1,2,3]]\ngc_collect()\nif keep[1][2]!=3 then return 1 end if\nprint "PASS: allocator compiler smoke"\nreturn 0\nend function\n', encoding="utf-8")
    smoke_exe = smoke.with_suffix(".exe")
    run([output, smoke, smoke_exe, "-I", tree], ROOT, log=tree / "build/smoke-compile.log", timeout=120)
    if run([smoke_exe], ROOT).strip() != "PASS: allocator compiler smoke":
        raise RuntimeError("Candidate compiler smoke failed")
    proof = {"base_commit": BASE, "upstream_allocator_commit": UPSTREAM,
             "scope": "Managed runtime only:16 fully associative allocation hints plus true allocation-start/owner normalization in GC; unchanged frontend, standard library, value ABI, object headers and GC thresholds",
             "prefix_slots": 16, "gc_allocation_boundaries": True, "compatible_previous_compilers": [BOOTSTRAP, PREVIOUS, MULTISIZE],
             "patch": str(patch.relative_to(ROOT)), "patch_sha256": PATCH_SHA,
             "patched_source_sha256": SOURCE_SHA, "bootstrap_sha256": BOOTSTRAP,
             "compiler_sha256": sha(output), "reproduction_commands": commands,
             "commands_executed": [] if args.candidate else commands, "stage2": args.stage2,
             "reused_validated_candidate": bool(args.candidate)}
    (tree / "build/bootstrap-result.json").write_text(json.dumps(proof, indent=2) + "\n")
    if args.install:
        backup.mkdir(parents=True, exist_ok=True)
        if not (backup / "mlc_win64.exe").exists():
            if sha(binary) not in (BOOTSTRAP, PREVIOUS, MULTISIZE):
                raise RuntimeError("Expected a supported frozen runtime compiler before first install")
            shutil.copy2(binary, backup / "mlc_win64.exe")
            shutil.copy2(profile_path, backup / "toolchain.json")
            shutil.copy2(frozen / "compiler-working-tree.patch", backup / "compiler-working-tree.patch")
        previous_sha = sha(backup / "mlc_win64.exe")
        if previous_sha not in (BOOTSTRAP, PREVIOUS, MULTISIZE):
            raise RuntimeError("Previous compiler backup checksum mismatch")
        backup_profile = json.loads((backup / "toolchain.json").read_text(encoding="utf-8"))
        recorded_previous = next(row["sha256"] for row in backup_profile["inputs"] if row["path"] == "build/mlc_win64.exe")
        if recorded_previous != previous_sha:
            raise RuntimeError("Previous compiler backup does not match its retained profile")
        proof["previous_compiler_sha256"] = previous_sha
        shutil.copy2(output, binary)
        shutil.copy2(patch, frozen / "compiler-working-tree.patch")
        profile["working_tree_patch_sha256"] = PATCH_SHA
        for record in profile["inputs"]:
            if record["path"] == "build/mlc_win64.exe": record["sha256"] = sha(binary)
        for record in profile.get("compiler_sources", []):
            if record["path"] == SOURCE: record["sha256"] = SOURCE_SHA
        profile["allocator_backport"] = proof
        profile["note"] = "Frozen738d830 compiler with allocator and allocation-boundary GC fixes; bootstrap/provenance recorded. Frontend/stdlib/value ABI/object headers unchanged. Source hashes alone do not prove binary provenance."
        profile_path.write_text(json.dumps(profile, indent=2) + "\n", encoding="utf-8")
        print("Installed reviewed managed-runtime compiler; previous inputs retained at " + str(backup))
    else:
        print("Built/checked candidate; frozen toolchain unchanged: " + str(output))


if __name__ == "__main__":
    main()
