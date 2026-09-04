"""Record original event journal, replay twice, compare protocol-serialized state."""
import argparse
import json
import os
import shutil
import subprocess
from pathlib import Path
from toolchain import ROOT
from inventory import sha

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument("data_root",type=Path)
    args=parser.parse_args()
    folder=ROOT / "artifacts/reference/replay"
    base=folder / "baseq3"
    (base / "vm").mkdir(parents=True,exist_ok=True)
    for name in ("qagame","cgame","ui"):
        shutil.copyfile(ROOT / "build/reference/qvms" / (name+".qvm"),base / "vm" / (name+".qvm"))
    startup=subprocess.STARTUPINFO()
    startup.dwFlags|=subprocess.STARTF_USESHOWWINDOW
    startup.wShowWindow=0
    for label,journal in (("record",1),("replay1",2),("replay2",2)):
        command=[str(ROOT / "build/reference/quake3-observer.exe")]
        cvars={"dedicated":"1","fs_basepath":str(folder),"fs_homepath":str(folder),"fs_cdpath":str(args.data_root.resolve()),
               "net_ip":"127.0.0.1","net_port":"27969","logfile":"2","journal":str(journal),
               "vm_game":"1","sv_pure":"0","bot_enable":"1","com_fixedtime":"50","sv_fps":"20",
               "bot_thinktime":"100","g_gametype":"0","g_doWarmup":"0","g_log":""}
        for key,value in cvars.items(): command.extend(["+set",key,value])
        command.extend(["+map","q3dm1","+addbot","sarge","3","+addbot","major","3"])
        env=os.environ.copy();env["MQ3_TRACE_FILE"]=str(folder / (label+".bin"));env["MQ3_TRACE_FRAMES"]="120"
        proc=subprocess.Popen(command,cwd=folder,env=env,startupinfo=startup)
        try: code=proc.wait(timeout=45)
        except subprocess.TimeoutExpired:
            proc.terminate();proc.wait(timeout=5);raise RuntimeError("Reference replay timed out")
        shutil.copyfile(base / "qconsole.log",folder / (label+".log"))
        if code!=0: raise RuntimeError(f"Reference {label} failed with {code}")
        print(f"{label}: {sha(folder / (label+'.bin'))}")
    first=(folder / "replay1.bin").read_bytes()
    second=(folder / "replay2.bin").read_bytes()
    record=(folder / "record.bin").read_bytes()
    passed=first==second and first==record
    evidence={"passed":passed,"frames":120,"map":"q3dm1","bots":["sarge:3","major:3"],
              "record_sha256":sha(folder / "record.bin"),"replay_sha256":sha(folder / "replay1.bin"),
              "second_replay_sha256":sha(folder / "replay2.bin"),"journal_sha256":sha(base / "journal.dat"),
              "binary_sha256":sha(ROOT / "build/reference/quake3-observer.exe")}
    (folder / "result.json").write_text(json.dumps(evidence,indent=2)+"\n")
    if not passed: raise RuntimeError("Original recorded/replayed state differs; no deterministic gate accepted")
    print("PASS: original record and both 120-frame replays are byte-identical")

if __name__ == "__main__":
    main()
