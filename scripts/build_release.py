#!/usr/bin/env python3
"""Build with a pinned published compiler without changing the frozen toolchain.

Requires Windows, Python 3.10+, Git submodules, and the MSVC desktop toolchain.
Only the public compiler package is downloaded; no retail game data is fetched.
"""
from __future__ import annotations
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import sys
import urllib.request
import zipfile

from toolchain import ROOT, msvc_env, run
from build import (build_file_lock, build_native, native_build_lock,
                   set_pe_windows_subsystem, valid_minilang_cache, valid_qvm_cache)
from inventory import sha

RELEASE = "1.3.9"
PACKAGE_SHA256 = "46cbe327d0b42085045ba4f5e1a71bfb395ebc7b10bb3956285db6e469fbfc70"
COMPILER_SHA256 = "269aecaa2232b634809edd80be95eda52f837ad4be022f9a778633bd47d9ba62"
TEST_RUNTIME_FLAGS = ("--heap-reserve", "1g", "--heap-commit", "32m", "--gc-limit", "256m")
# The real-time app collects in the background to avoid multi-second pauses
# when the game and renderer allocate during combat.
PLAYABLE_RUNTIME_FLAGS = ("--heap-reserve", "2g", "--heap-commit", "128m",
                          "--gc-limit", "128m", "--gc-concurrent")
PACKAGE_URL = ("https://github.com/MiniLangProject/MiniLangCompilerML/releases/download/"
               "v1.3.9/MiniLangCompilerML-1.3.9-windows-x64.zip")


def unpack_checked(package: Path, destination: Path) -> None:
    """Verify the complete archive and reject traversal/symlink entries."""
    if sha(package) != PACKAGE_SHA256:
        raise RuntimeError("Published MiniLang package SHA-256 mismatch")
    root = destination.resolve()
    with zipfile.ZipFile(package) as archive:
        for item in archive.infolist():
            if not (root / item.filename).resolve().is_relative_to(root):
                raise RuntimeError("Unsafe compiler archive path: " + item.filename)
            if (item.external_attr >> 16) & 0o170000 == 0o120000:
                raise RuntimeError("Symbolic links are not allowed in compiler packages")
        archive.extractall(root)


def extraction_matches(package: Path, destination: Path) -> bool:
    """Reuse a published compiler only when every unpacked byte matches the ZIP."""
    if not destination.is_dir():
        return False
    root = destination.resolve()
    expected: set[str] = set()
    with zipfile.ZipFile(package) as archive:
        for item in archive.infolist():
            target = (root / item.filename).resolve()
            if not target.is_relative_to(root):
                raise RuntimeError("Unsafe compiler archive path: " + item.filename)
            if (item.external_attr >> 16) & 0o170000 == 0o120000:
                raise RuntimeError("Symbolic links are not allowed in compiler packages")
            if item.is_dir():
                continue
            expected.add(item.filename)
            if not target.is_file() or target.stat().st_size != item.file_size:
                return False
            digest = hashlib.sha256()
            with archive.open(item) as source:
                for chunk in iter(lambda: source.read(1024 * 1024), b""):
                    digest.update(chunk)
            if sha(target) != digest.hexdigest():
                return False
    actual = {path.relative_to(root).as_posix() for path in root.rglob("*") if path.is_file()}
    return actual == expected


def prepare_compiler() -> tuple[Path, Path]:
    cache = ROOT / "build/toolchains"
    cache.mkdir(parents=True, exist_ok=True)
    package = cache / ("MiniLang-" + RELEASE + "-windows-x64.zip")
    extracted = cache / ("MiniLang-" + RELEASE)
    with build_file_lock(cache / ("MiniLang-" + RELEASE + ".lock")):
        if not package.is_file() or sha(package) != PACKAGE_SHA256:
            partial = package.with_suffix(".partial")
            request = urllib.request.Request(PACKAGE_URL, headers={"User-Agent": "MiniQuake3-build"})
            try:
                with urllib.request.urlopen(request, timeout=120) as response, partial.open("wb") as out:
                    shutil.copyfileobj(response, out, 1024 * 1024)
                if sha(partial) != PACKAGE_SHA256:
                    raise RuntimeError("Downloaded MiniLang package checksum mismatch")
                partial.replace(package)
            finally:
                partial.unlink(missing_ok=True)
        # A second build may start while Windows is executing this compiler.
        # Validate the whole extraction before reusing it; never delete a
        # healthy in-use mlc.exe just to repeat the same extraction.
        if not extraction_matches(package, extracted):
            if extracted.exists():
                shutil.rmtree(extracted)
            unpack_checked(package, extracted)
        compilers = [p for p in extracted.rglob("*.exe") if p.name in ("mlc.exe", "mlc_win64.exe")]
        libraries = [p.parent for p in extracted.rglob("std/fs.ml")]
        if len(compilers) != 1 or len(libraries) != 1:
            raise RuntimeError("Unexpected published compiler package layout")
        compiler = compilers[0]
        if sha(compiler) != COMPILER_SHA256:
            raise RuntimeError("Published compiler binary checksum mismatch")
        return compiler, libraries[0].parent


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", default="src/main.ml")
    parser.add_argument("--output", default="MiniQuake3.exe")
    args = parser.parse_args()
    if sys.platform != "win32":
        parser.error("the current playable build requires Windows x64 and MSVC")
    output = ROOT / "build"
    output.mkdir(exist_ok=True)
    source = Path(args.source)
    if not source.is_absolute():
        source = ROOT / source
    target = Path(args.output)
    if not target.is_absolute():
        target = output / target
    target.parent.mkdir(parents=True, exist_ok=True)
    if not source.is_file():
        parser.error("source file not found: " + str(source))
    gui = source.resolve() == (ROOT / "src/main.ml").resolve() and target.resolve() == (output / "MiniQuake3.exe").resolve()
    if gui and not (ROOT / "Quake-III-Arena-original-source/q3asm/q3asm.c").is_file():
        parser.error("original sources missing; run: git submodule update --init --recursive")
    # Serialize release builds, including the verified extraction shared by them.
    with build_file_lock(output / "release-build.lock"):
        compiler, library_root = prepare_compiler()
        with native_build_lock(output):
            build_native(output, msvc_env("x64"))
        flags = ["-I", str(ROOT / "src"), "-I", str(library_root),
                 *(PLAYABLE_RUNTIME_FLAGS if gui else TEST_RUNTIME_FLAGS)]
        inputs = {"mode": "published-release", "release": RELEASE,
                  "package_sha256": PACKAGE_SHA256, "compiler": sha(compiler),
                  "subsystem": "windows" if gui else "console", "flags": flags,
                  "sources": {p.relative_to(ROOT).as_posix(): sha(p) for p in sorted((ROOT / "src").rglob("*.ml"))},
                  "entrypoint": {"path": str(source), "sha256": sha(source)},
                  "stdlib": {p.relative_to(library_root).as_posix(): sha(p) for p in sorted((library_root / "std").rglob("*.ml"))}}
        stamp = target.with_name(target.name + ".release-inputs.json")
        with build_file_lock(target.with_name(target.name + ".build.lock")):
            if not valid_minilang_cache(target, stamp, inputs):
                run([compiler, source, target, *flags], output,
                    log=output / (target.name + ".compile.log"), timeout=900)
                if gui:
                    set_pe_windows_subsystem(target)
                stamp.write_text(json.dumps({"inputs": inputs, "binary": sha(target)}, indent=2) + "\n", encoding="utf-8")
            if gui:
                qvms = output / "reference/qvms"
                names = ("ui.qvm", "qagame.qvm", "cgame.qvm")
                if not valid_qvm_cache(qvms, names):
                    subprocess.run([sys.executable, ROOT / "scripts/build_qvms.py"], cwd=ROOT, check=True)
                packaged = output / "qvms"
                packaged.mkdir(exist_ok=True)
                for name in names:
                    shutil.copy2(qvms / name, packaged / name)
    print(f"Built {target.name} with MiniLang {RELEASE}; historical frozen toolchain unchanged.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
