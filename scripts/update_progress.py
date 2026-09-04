"""Refresh explicit partial source mappings and archive observed test evidence."""
import json
from toolchain import ROOT
from inventory import sha

def main():
    mappings={
        "code/game/q_math.c":(["src/mq3/shared/math.ml"],
            ["Q_rand","Q_random","Q_crandom","Q_rsqrt","Q_fabs","LerpAngle"],["scripts/test_math.py"]),
        "code/game/q_shared.h":(["src/mq3/shared/math.ml"],["DotProduct","CrossProduct","VectorMA"],["scripts/test_math.py"]),
        "code/game/q_shared.c":(["src/mq3/shared/parser.ml"],["COM_ParseExt","COM_BeginParseSession","COM_GetCurrentParseLine"],["scripts/test_core.py"]),
        "code/qcommon/cvar.c":(["src/mq3/qcommon/cvar.ml"],["Cvar_Get","Cvar_Set2","Cvar_SetCheatState","Cvar_Init"],["scripts/test_core.py"]),
        "code/qcommon/vm.c":(["src/mq3/vm/interpreter.ml"],["VM_Create"],["scripts/test_vm.py","scripts/test_rejections.py"]),
        "code/qcommon/vm_interpreted.c":(["src/mq3/vm/interpreter.ml"],["VM_PrepareInterpreter","VM_CallInterpreted"],["scripts/test_vm.py","scripts/test_retail_vm.py"]),
        "code/qcommon/vm_local.h":(["src/mq3/vm/interpreter.ml"],["opcode_t","vm_s"],["scripts/test_vm.py"]),
        "code/qcommon/qfiles.h":(["src/mq3/format/bsp.ml","src/mq3/vm/interpreter.ml"],["dheader_t","vmHeader_t"],["scripts/test_maps.py","scripts/test_vm.py"]),
        "code/qcommon/unzip.c":(["src/mq3/format/pk3.ml","src/mq3/format/deflate.ml"],[],["scripts/test_archives.py"]),
        "code/qcommon/cm_trace.c":(["src/mq3/collision/brush.ml"],["CM_TraceThroughBrush"],["scripts/test_brush.py"]),
    }
    path=ROOT / "PORT_LEDGER.json"
    ledger=json.loads(path.read_text())
    for entry in ledger["files"]:
        if entry["source"] in mappings:
            targets,symbols,tests=mappings[entry["source"]]
            entry.update(target=targets,status="partial",tests=tests,
                         symbol_mapping=[{"original":name,"target_files":targets,"status":"tested_subset"} for name in symbols])
    path.write_text(json.dumps(ledger,indent=2)+"\n")
    evidence=[]
    for path in sorted((ROOT / "build/reference").rglob("result.json")):
        evidence.append({"path":path.relative_to(ROOT).as_posix(),"sha256":sha(path),"result":json.loads(path.read_text())})
    replay=ROOT / "artifacts/reference/replay/result.json"
    if replay.exists():evidence.append({"path":replay.relative_to(ROOT).as_posix(),"sha256":sha(replay),"result":json.loads(replay.read_text())})
    sources={p.relative_to(ROOT).as_posix():sha(p) for base in ("src","native","scripts","tests") for p in sorted((ROOT / base).rglob("*"))
             if p.is_file() and "__pycache__" not in p.parts}
    report={"scope":"implemented foundations; full port incomplete","sources":sources,"evidence":evidence}
    (ROOT / "docs/reference/evidence.json").write_text(json.dumps(report,indent=2)+"\n")
    print("Updated partial source mappings and recorded test evidence.")

if __name__=="__main__":main()
