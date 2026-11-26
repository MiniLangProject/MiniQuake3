#!/usr/bin/env python3
"""Guard verified compiler extraction reuse during parallel Windows builds."""
from pathlib import Path
from tempfile import TemporaryDirectory
from unittest.mock import patch
import zipfile

from build_release import extraction_matches, prepare_compiler
from toolchain import ROOT


def main() -> None:
    scratch = ROOT / "build/tmp"
    scratch.mkdir(parents=True, exist_ok=True)
    with TemporaryDirectory(prefix="toolchain-cache-", dir=scratch) as directory:
        root = Path(directory)
        archive = root / "compiler.zip"
        extracted = root / "unpacked"
        binary = extracted / "compiler/mlc.exe"
        binary.parent.mkdir(parents=True)
        with zipfile.ZipFile(archive, "w") as package:
            package.writestr("compiler/mlc.exe", b"pinned-compiler")
            package.writestr("compiler/std/fs.ml", b"package std.fs\n")
        binary.write_bytes(b"pinned-compiler")
        library = extracted / "compiler/std/fs.ml"
        library.parent.mkdir(parents=True)
        library.write_bytes(b"package std.fs\n")
        assert extraction_matches(archive, extracted)
        binary.write_bytes(b"altered-compiler")
        assert not extraction_matches(archive, extracted)
        binary.write_bytes(b"pinned-compiler")
        extra = extracted / "compiler/extra"
        extra.write_bytes(b"unexpected")
        assert not extraction_matches(archive, extracted)
        extra.unlink()
        library.unlink()
        assert not extraction_matches(archive, extracted)

    # The real verified extraction may be in use by another MiniLang process.
    # Its read-only validation must never attempt a recursive deletion.
    with patch("build_release.shutil.rmtree", side_effect=AssertionError("deleted valid compiler")):
        compiler, library_root = prepare_compiler()
    assert compiler.is_file() and (library_root / "std/fs.ml").is_file()
    print("PASS: release compiler cache reuse, byte tampering, extra and missing files")


if __name__ == "__main__":
    main()
