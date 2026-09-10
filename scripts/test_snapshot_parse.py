"""Build and run the client packet-entity merge contracts."""
import json
import subprocess
import sys

from inventory import sha
from toolchain import ROOT, run


def main():
    out = ROOT / "build/reference/snapshot_parse"
    out.mkdir(parents=True, exist_ok=True)
    native_log = ROOT / "build/reference/snapshot_delta/oracle.log"
    if not native_log.exists():
        subprocess.run([sys.executable, ROOT / "scripts/test_snapshot_delta.py"], cwd=ROOT, check=True)
    merge = next(line for line in native_log.read_text(encoding="utf-8").splitlines()
                 if line.startswith("merge|"))
    packet = out / "native-merge.packet"
    packet.write_bytes(bytes.fromhex(merge.rsplit("|", 1)[1]))
    subprocess.run([sys.executable, ROOT / "scripts/build.py", "--source",
                    "tests/snapshot_parse_contracts.ml", "--output",
                    "snapshot_parse_contracts.exe"], cwd=ROOT, check=True)
    actual = run([ROOT / "build/snapshot_parse_contracts.exe", packet], ROOT / "build",
                 log=out / "contracts.log").strip()
    if actual != "PASS: 15 client snapshot packet-entity contracts":
        raise RuntimeError(actual)
    sources = [ROOT / "Quake-III-Arena-original-source/code/client/cl_parse.c",
               ROOT / "src/mq3/client/snapshot_parse.ml",
               ROOT / "tests/snapshot_parse_contracts.ml"]
    result = {"passed": True, "contracts": 15,
              "scope": "CL_DeltaEntity and CL_ParsePacketEntities ring-buffer merge semantics: unchanged old entities, deltas, baseline additions, removals, tail copies, ordering and truncation rejection.",
              "oracle": "The five-way merge packet is emitted by unchanged SV_EmitPacketEntities and MSG_WriteDeltaEntity/Huffman code, then decoded by the MiniLang client merge.",
              "remaining": "A direct unchanged-C client parser state oracle and full CL_ParseSnapshot command stream remain open.",
              "sources": {str(p.relative_to(ROOT)).replace("\\", "/"): sha(p) for p in sources}}
    (out / "result.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(actual)


if __name__ == "__main__":
    main()
