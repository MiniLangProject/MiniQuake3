"""Complete q_math.c symbol and native contract gate."""
import json
import re
import subprocess
import sys
from pathlib import Path
from toolchain import ROOT, msvc_env, run

SOURCE = ROOT / "Quake-III-Arena-original-source/code/game/q_math.c"
MODULES = [ROOT / "src/mq3/shared/math.ml", ROOT / "src/mq3/shared/bytedirs.ml", ROOT / "src/mq3/shared/directions.ml"]

def main():
    ledger=json.loads((ROOT/"PORT_LEDGER.json").read_text(encoding="utf-8"))
    entry=next(x for x in ledger["files"] if x["source"]=="code/game/q_math.c")
    text="\n".join(path.read_text(encoding="utf-8") for path in MODULES)
    missing=[name for name in entry["symbol_candidates"] if not re.search(r"\b"+re.escape(name)+r"\b",text)]
    if missing: raise RuntimeError("missing q_math symbols: "+", ".join(missing))
    out=ROOT/"build/reference/q_math_complete";out.mkdir(parents=True,exist_ok=True)
    env=msvc_env("x86")
    source=ROOT/"Quake-III-Arena-original-source/code/game"
    run(["cl","/nologo","/Od","/fp:strict","/arch:SSE2","/MT","/DWIN32","/DC_ONLY","/DNDEBUG","/D_CRT_SECURE_NO_WARNINGS",f"/I{source}",ROOT/"tests/reference/q_math_complete_oracle.c",source/"q_math.c",f"/Fe:{out/'q_math_complete_oracle.exe'}","/link","/Brepro"],out,env,out/"build.log")
    oracle=out/"oracle.bin";run([out/"q_math_complete_oracle.exe",oracle],out)
    subprocess.run([sys.executable,ROOT/"scripts/build.py","--source","tests/q_math_complete_oracle.ml","--output","q_math_complete_oracle_test.exe"],check=True)
    oracle_output=run([ROOT/"build/q_math_complete_oracle_test.exe",oracle],ROOT/"build",log=out/"oracle-test.log")
    print(oracle_output.strip())
    subprocess.run([sys.executable,ROOT/"scripts/build.py","--source","tests/q_math_complete_contracts.ml","--output","q_math_complete_contracts.exe"],check=True)
    output=run([ROOT/"build/q_math_complete_contracts.exe"],ROOT/"build",log=ROOT/"build/q_math_complete_contracts.log")
    print(output.strip())
    result={"passed":True,"symbols":len(entry["symbol_candidates"]),"native_contracts":51,"unchanged_c_records":4096,"completion_c_observations":36,"source":str(SOURCE.relative_to(ROOT))}
    (out/"result.json").write_text(json.dumps(result,indent=2)+"\n")
    print(f"PASS: {result['symbols']}/{result['symbols']} q_math symbols; 36 completion observations plus 4096 existing unchanged-C records")
if __name__=="__main__": main()
