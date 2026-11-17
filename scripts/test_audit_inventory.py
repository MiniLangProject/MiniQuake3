#!/usr/bin/env python3
"""Portable regressions for the November audit's inventory failures."""
import json
import re
import subprocess
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

import parity_inventory as inventory
from test_parity_inventory import validate_original_tree
from toolchain import ROOT


class MappingTests(unittest.TestCase):
    def test_substrings_and_case_do_not_match(self):
        self.assertFalse(inventory.mapped("Foo", [{"original": "FooBar"}]))
        self.assertFalse(inventory.mapped("Foo", [{"original": "foo"}]))
        self.assertTrue(inventory.mapped("Foo", [{"original": "Foo / Bar"}]))

    def test_descriptions_and_blanket_flags_are_not_identities(self):
        self.assertFalse(inventory.mapped("Cvar_Get", [{"original": "all 31 cvar symbols"}]))
        self.assertFalse(inventory.mapped("Anything", [{"covers_all_candidates": True}]))
        self.assertTrue(inventory.mapped("Cvar_Get", [{"original_symbols": ["Cvar_Get"]}]))
        self.assertFalse(inventory.mapped("Cvar_G", [{"original_symbols": ["Cvar_Get"]}]))

    def test_explicit_mapping_schema(self):
        with self.assertRaises(ValueError):
            inventory.mapped("Foo", [{"original_symbols": "Foo"}])

    def test_all_source_languages_are_included(self):
        result = inventory.build_inventory()
        names = {row["source"] for row in result["files"]}
        for name in ["code/splines/splines.cpp", "code/unix/matha.s", "code/macosx/macosx_glimp.m"]:
            self.assertIn(name, names)
        self.assertGreater(result["summary"]["empty_symbol_inventories"], 0)
        self.assertFalse(any(row["status"] == "ported" and not row["candidate_symbols"] for row in result["files"]))

    def test_import_identity_lists_equal_actual_abi_tables(self):
        ledger = json.loads((ROOT / "PORT_LEDGER.json").read_text(encoding="utf-8"))
        source = (ROOT / "src/mq3/vm/qvm_assembly_abi.ml").read_text()
        for original, function in [("code/cgame/cg_syscalls.asm", "cgameNames"), ("code/game/g_syscalls.asm", "gameNames")]:
            row = next(row for row in ledger["files"] if row["source"] == original)
            text = re.search(r"function " + function + r"\(\) return \[(.*?)\] end function", source).group(1)
            names = re.findall(r'"([A-Za-z_]\w*)"', text)
            mapping = row["symbol_mapping"][0]
            self.assertEqual(names, mapping["original_symbols"])
            self.assertEqual("abi_table", mapping["kind"])
            self.assertEqual(set(names), set(row["symbol_candidates"]))


class OriginalTreeTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name)
        self.original = self.root / "original"
        self.original.mkdir()
        self.code = self.original / "code"
        self.code.mkdir()
        self.file = self.code / "test.c"
        self.file.write_text("int test(void) { return 0; }\n")
        self.git("init", "-q")
        self.git("config", "user.name", "Inventory regression")
        self.git("config", "user.email", "test@example.invalid")
        self.git("add", ".")
        self.git("commit", "-qm", "fixture")
        self.ledger = {"upstream_commit": self.git("rev-parse", "HEAD").strip(), "files": [{"source": "code/test.c"}]}

    def git(self, *args):
        return subprocess.check_output(["git", "-C", str(self.original), *args], text=True, stderr=subprocess.STDOUT)

    def test_valid_pinned_checkout(self):
        self.assertEqual({"code/test.c"}, validate_original_tree(self.original, self.ledger))

    def test_missing_code_tree(self):
        with self.assertRaisesRegex(RuntimeError, "missing"):
            validate_original_tree(self.root / "absent", self.ledger)

    def test_empty_code_tree(self):
        self.file.unlink()
        with self.assertRaisesRegex(RuntimeError, "no source"):
            validate_original_tree(self.original, self.ledger)

    def test_dirty_original(self):
        self.file.write_text("int changed;\n")
        with self.assertRaisesRegex(RuntimeError, "modified"):
            validate_original_tree(self.original, self.ledger)

    def test_wrong_revision(self):
        self.ledger["upstream_commit"] = "0" * 40
        with self.assertRaisesRegex(RuntimeError, "revision"):
            validate_original_tree(self.original, self.ledger)

    def test_unlisted_source(self):
        (self.code / "extra.cpp").write_text("int extra;\n")
        with self.assertRaisesRegex(RuntimeError, "unlisted"):
            validate_original_tree(self.original, self.ledger)

    def test_missing_ledger_file(self):
        self.ledger["files"].append({"source": "code/absent.m"})
        with self.assertRaisesRegex(RuntimeError, "missing"):
            validate_original_tree(self.original, self.ledger)

    def test_parent_repository_is_not_a_submodule(self):
        nested = self.original / "nested"
        (nested / "code").mkdir(parents=True)
        (nested / "code/test.c").write_text("int nested;\n")
        with self.assertRaisesRegex(RuntimeError, "parent repository"):
            validate_original_tree(nested, self.ledger)


if __name__ == "__main__":
    unittest.main()
