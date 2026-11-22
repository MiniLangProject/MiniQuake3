#!/usr/bin/env python3
"""Check function-inventory syntax against mixed MiniLang declarations."""

from pathlib import Path
import tempfile

from audit_function_contracts import attach_profile, inventory
from toolchain import ROOT


def main() -> None:
    with tempfile.TemporaryDirectory(prefix="mq3-signatures-", dir=ROOT / "build") as folder:
        source = Path(folder) / "signatures.ml"
        source.write_text("""
package test.signatures
extern function Native(x as i32) from "kernel32.dll" returns i32
function inline plus(x as int, y as int = make(2, 3)) returns int
  return x + y
end function
function optional(
  name as string?,
  count as array<int>
) returns string?
  return name
end function
struct Pair left right
  function same(other as Pair) returns bool
    return true
  end function
end struct
function untyped(x) return x end function
""", encoding="utf-8")
        rows = inventory(Path(folder))
    assert [row["name"] for row in rows] == ["plus", "optional", "same", "untyped"]
    plus, optional, same, untyped = rows
    assert plus["inline"] and plus["parameters"] == ["int", "int"] and plus["return"] == "int"
    assert optional["parameters"] == ["string?", "array<int>"] and optional["return"] == "string?"
    assert same["parameters"] == ["Pair"] and same["return_shape"] == "literal_scalar_candidate"
    assert untyped["parameters"] == [None] and untyped["return"] is None
    numeric = next(row for row in inventory(ROOT / "src/mq3")
                   if row["file"] == "src/mq3/compat/numeric.ml" and row["name"] == "add32")
    assert numeric["static_qualified_calls"] > 100
    with tempfile.TemporaryDirectory(prefix="mq3-callprofile-", dir=ROOT / "build") as folder:
        profile = Path(folder) / "calls.log"
        profile.write_text("[call-profile] name=mq3.compat.numeric.add32 calls=12345\n"
                           "[call-profile] name=work calls=44\n"
                           "[call-profile] name=shared calls=99\n", encoding="utf-8")
        sample = [
            {"file": "src/mq3/compat/numeric.ml", "name": "add32", "profiled_area": None, "static_call_sites": 0},
            {"file": "src/mq3/alpha.ml", "name": "work", "profiled_area": None, "static_call_sites": 0},
            {"file": "src/mq3/alpha.ml", "name": "shared", "profiled_area": None, "static_call_sites": 0},
            {"file": "src/mq3/beta.ml", "name": "shared", "profiled_area": None, "static_call_sites": 0},
        ]
        matches, ambiguous = attach_profile(sample, profile)
    assert (matches, ambiguous) == (2, 1)
    assert sample[0]["runtime_calls"] == 12345 and sample[0]["priority"] == "P1_measured"
    assert sample[1]["runtime_calls"] == 44 and sample[1]["priority"] == "P3_review"
    assert sample[2]["runtime_calls"] is None and sample[3]["runtime_calls"] is None
    print("PASS: function inventory parses signatures and maps measured qualified/bare call counts safely")


if __name__ == "__main__":
    main()
