"""Compare every Retail bot inventory define with the compiled QVM source."""
import argparse
import re
import zipfile
from pathlib import Path

from toolchain import ROOT


def defines(text):
    return {name: int(value) for name, value in re.findall(
        r"#define[ \t]+(INVENTORY_\w+)[ \t]+(\d+)", text)}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--data-root", type=Path, required=True)
    args = parser.parse_args()
    with zipfile.ZipFile(args.data_root / "baseq3/pak0.pk3") as archive:
        retail = defines(archive.read("botfiles/inv.h").decode("latin1"))
    original = defines((ROOT / "Quake-III-Arena-original-source/code/game/inv.h").read_text())
    expected = {retail[name]: original[name] for name in retail if name in original
                and retail[name] != original[name]}
    source = (ROOT / "src/mq3/botlib/ai_item_weights.ml").read_text()
    body = source.split("function qvmInventoryIndex(index)", 1)[1].split("end function", 1)[0]
    actual = {int(old): int(new) for old, new in re.findall(r"\[(\d+),(\d+)\]", body)}
    if len(retail) != 31 or len(expected) != 19 or actual != expected:
        raise RuntimeError(f"Retail/QVM inventory mismatch: expected={expected}, actual={actual}")
    print("PASS: 19 Retail bot inventory indices match the original 1.32b game QVM")


if __name__ == "__main__":
    main()
