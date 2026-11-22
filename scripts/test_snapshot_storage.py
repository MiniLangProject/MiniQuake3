#!/usr/bin/env python3
"""Snapshot storage against independently frozen pre-optimization code."""
import hashlib,json,subprocess
from pathlib import Path
from toolchain import ROOT,run
from inventory import sha
BASELINE="0554726"
FILES=["src/mq3/server/snapshot_build.ml","src/mq3/engine/local_qvm_match.ml","tests/snapshot_storage_probe.ml","scripts/test_snapshot_storage.py"]
def compile_run(out,source,name):
    exe=out/(name+".exe")
    run([ROOT/"artifacts/toolchain/build/mlc_win64.exe",source,exe,"-I",out/"modules","-I",ROOT/"src","-I",ROOT/"artifacts/toolchain","--heap-reserve","1g","--heap-commit","32m","--gc-limit","256m"],ROOT/"build",log=out/(name+"-build.log"),timeout=900)
    return run([exe],ROOT/"build",log=out/(name+".log"),timeout=300)
def main():
    out=ROOT/"build/reference/snapshot-storage";out.mkdir(parents=True,exist_ok=True)
    before={p:sha(ROOT/p) for p in FILES};compiler=sha(ROOT/"artifacts/toolchain/build/mlc_win64.exe")
    commit=subprocess.check_output(["git","rev-parse",BASELINE],cwd=ROOT,text=True).strip()
    frozen=subprocess.check_output(["git","show",commit+":src/mq3/server/snapshot_build.ml"],cwd=ROOT)
    module=out/"modules/mq3/tests/frozen_snapshot_storage.ml";module.parent.mkdir(parents=True,exist_ok=True)
    module.write_text(frozen.decode().replace("package mq3.server.snapshot_build","package mq3.tests.frozen_snapshot_storage",1),encoding="utf-8")
    source=(ROOT/"tests/snapshot_storage_probe.ml").read_text()
    legacy=out/"legacy.ml";legacy.write_text(source.replace("mq3.server.snapshot_build as storageSnapshot","mq3.tests.frozen_snapshot_storage as storageSnapshot"),encoding="utf-8")
    original=compile_run(out,legacy,"legacy")
    current=compile_run(out,ROOT/"tests/snapshot_storage_probe.ml","current")
    if original!=current:raise RuntimeError("Frozen snapshot differential mismatch; see legacy/current.log")
    # Exercise the private growable builder without changing the public factory.
    private=out/"private.ml"
    private.write_text("""import mq3.server.snapshot_build as privateStorage
import mq3.game.entitystate as privateEntity
import std.ds.list as privateList
function main(args)
  w=privateStorage.world(true,[],1);w.snapshotCounter=1;n=privateStorage.EntityNumbers(void,0);b=privateList.List.withCapacity(32);e=void
  for i=0 to 12 e=privateStorage.snapshotEntity(privateEntity.create(),true,0,0,[],0,0,0);e.state.number=i;privateStorage.addEntityMode(w,e,n,b) end for
  if b.cap!=32 or len(b.buf)!=32 or n.count!=13 or b.toArray()!=[0,1,2,3,4,5,6,7,8,9,10,11,12] then return error(499,"small builder shape") end if
  for i=13 to 1024 e=privateStorage.snapshotEntity(privateEntity.create(),true,0,0,[],0,0,0);e.state.number=i;privateStorage.addEntityMode(w,e,n,b) end for
  if n.count!=1024 or b.size!=1024 or b.cap!=1024 or e.snapshotCounter!=1 then return error(499,"builder hard cap and mark") end if
  if privateStorage.addEntityMode(w,e,n,b) then return error(499,"builder dedup") end if
  values=b.toArray();for i=0 to 1023 if values[i]!=i then return error(499,"builder order") end if end for
  print "PASS: builder32 actual13 bytes256 versus legacy8192, growth1024 hardcap mark dedup order";return 0
end function
""",encoding="utf-8")
    private_output=compile_run(out,private,"private")
    if "PASS: builder32 actual13 bytes256 versus legacy8192" not in private_output:raise RuntimeError(private_output)
    prod=(ROOT/FILES[0]).read_text();body=prod.split("function buildClientSnapshot(",1)[1].split("\nend function",1)[0]
    if "numbers=EntityNumbers(void,0);builder=snapshotLists.List.withCapacity(32)" not in body or "numbers=entityNumbers()" in body or "selected=builder.toArray()" not in body:raise RuntimeError("Production snapshot must use bounded builder")
    match=(ROOT/FILES[1]).read_text()
    input_body=match.split("function snapshotInput(",1)[1].split("\nend function",1)[0]
    if "ringCapacity=context.entityCount" not in input_body or "ringCapacity<1" not in input_body or "ringCapacity>snapshotBuild.MAX_SNAPSHOT_ENTITIES" not in input_body or ",1024)" in input_body:raise RuntimeError("Shared snapshot ring policy missing")
    for name in ["snapshotCore","publishBotSnapshots"]:
        body=match.split("function "+name+"(",1)[1].split("\nend function",1)[0]
        if "input=snapshotInput(value)" not in body or ",1024)" in body:raise RuntimeError("Snapshot consumer bypasses shared input policy: "+name)
    negatives=[]
    for label,bad in [("legacy1024factory",prod.replace("numbers=EntityNumbers(void,0);builder=snapshotLists.List.withCapacity(32)","numbers=entityNumbers();builder=snapshotLists.List.withCapacity(32)")),("unboundedInitialBuilder",prod.replace("snapshotLists.List.withCapacity(32)","snapshotLists.List.withCapacity(1024)"))]:
        badbody=bad.split("function buildClientSnapshot(",1)[1].split("\nend function",1)[0]
        rejected="numbers=EntityNumbers(void,0);builder=snapshotLists.List.withCapacity(32)" not in badbody or "numbers=entityNumbers()" in badbody
        if not rejected:raise RuntimeError("Policy negative control not detected:"+label)
        negatives.append(label)
    after={p:sha(ROOT/p) for p in FILES}
    if before!=after or compiler!=sha(ROOT/"artifacts/toolchain/build/mlc_win64.exe"):raise RuntimeError("Sources/compiler changed during proof")
    result={"passed":True,"baseline_commit":commit,"baseline_source_sha256":hashlib.sha256(frozen).hexdigest(),"cases":34,"negative_controls":negatives,"output_sha256":hashlib.sha256(current.encode()).hexdigest(),"output_lines":len(current.splitlines()),"private_output":private_output.strip(),"sources":after,"compiler_sha256":compiler,"allocation_payload_bytes":{"legacy_numbers":8192,"small_numbers":256,"sample131_entities_ring_before":8192,"sample131_entities_ring_after":1048},"scope":"Independent frozen snapshot output checks every serialized playerstate/entitystate word directly plus two ordered hashes, area masks, counters/number repair, callback order, recursive portals, zero/missing/zombie,1/3/33/129/1024/1025 populations, alternate client, wrapped rings, prior-frame detachment and1024-cap side effects. Public original C differential and contracts are a separate gate. No FPS claim."}
    (out/"result.json").write_text(json.dumps(result,indent=2)+"\n",encoding="utf-8");print("PASS:34 frozen snapshot cases + private builder cap/growth + productive policy guards")
if __name__=="__main__":main()
