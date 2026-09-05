"""Refresh explicit partial source mappings and archive observed test evidence."""
import json
from toolchain import ROOT
from inventory import sha

def main():
    mappings={
        "code/game/q_math.c":(["src/mq3/shared/math.ml"],
            ["Q_rand","Q_random","Q_crandom","Q_rsqrt","Q_fabs","LerpAngle","VectorLength","VectorNormalize","VectorNormalize2","AngleVectors"],["scripts/test_math.py","scripts/test_patches.py","scripts/test_movement.py","scripts/test_pmove.py"]),
        "code/game/q_shared.h":(["src/mq3/shared/math.ml","src/mq3/game/playerstate.ml","src/mq3/game/pmove.ml"],["DotProduct","CrossProduct","VectorMA","playerState_t","usercmd_t"],["scripts/test_math.py","scripts/test_pmove.py"]),
        "code/win32/win_shared.c":(["src/mq3/shared/math.ml"],["Sys_SnapVector"],["scripts/test_pmove.py"]),
        "code/game/bg_public.h":(["src/mq3/game/constants.ml","src/mq3/game/pmove.ml"],["pmove_t","pmtype_t","weaponstate_t","statIndex_t","persEnum_t","powerup_t","holdable_t","weapon_t","entity_event_t","animNumber_t","team_t"],["scripts/test_pmove.py"]),
        "code/game/q_shared.c":(["src/mq3/shared/parser.ml"],["COM_ParseExt","COM_BeginParseSession","COM_GetCurrentParseLine"],["scripts/test_core.py"]),
        "code/qcommon/cvar.c":(["src/mq3/qcommon/cvar.ml"],["Cvar_Get","Cvar_Set2","Cvar_SetCheatState","Cvar_Init"],["scripts/test_core.py"]),
        "code/qcommon/vm.c":(["src/mq3/vm/interpreter.ml"],["VM_Create"],["scripts/test_vm.py","scripts/test_rejections.py"]),
        "code/qcommon/vm_interpreted.c":(["src/mq3/vm/interpreter.ml"],["VM_PrepareInterpreter","VM_CallInterpreted"],["scripts/test_vm.py","scripts/test_retail_vm.py"]),
        "code/qcommon/vm_local.h":(["src/mq3/vm/interpreter.ml"],["opcode_t","vm_s"],["scripts/test_vm.py"]),
        "code/qcommon/qfiles.h":(["src/mq3/format/bsp.ml","src/mq3/vm/interpreter.ml"],["dheader_t","vmHeader_t"],["scripts/test_maps.py","scripts/test_vm.py"]),
        "code/qcommon/unzip.c":(["src/mq3/format/pk3.ml","src/mq3/format/deflate.ml"],[],["scripts/test_archives.py"]),
        "code/qcommon/cm_trace.c":(["src/mq3/collision/brush.ml","src/mq3/collision/world.ml"],
            ["CM_TraceThroughBrush","CM_TestBoxInBrush","CM_TestInLeaf","CM_PositionTest","CM_TraceThroughTree","CM_TraceThroughLeaf","CM_TraceThroughPatch","CM_Trace","CM_BoxTrace"],
            ["scripts/test_brush.py","scripts/test_collision.py","scripts/test_movement.py"]),
        "code/qcommon/cm_load.c":(["src/mq3/collision/world.ml"],
            ["CMod_LoadPlanes","CMod_LoadBrushSides","CMod_LoadBrushes","CM_BoundBrush","CMod_LoadNodes","CMod_LoadLeafs","CMod_LoadSubmodels","CMod_LoadPatches"],
            ["scripts/test_collision.py","scripts/test_patches.py","scripts/test_rejections.py"]),
        "code/qcommon/cm_test.c":(["src/mq3/collision/world.ml"],["CM_PointLeafnum_r","CM_PointLeafnum","CM_PointContents","CM_BoxLeafnums_r"],["scripts/test_collision.py"]),
        "code/qcommon/cm_patch.c":(["src/mq3/collision/patchmesh.ml","src/mq3/collision/patchtrace.ml"],
            ["CM_GeneratePatchCollide","CM_SubdivideGridColumns","CM_TransposeGrid","CM_RemoveDegenerateColumns","CM_PatchCollideFromGrid","CM_AddFacetBevels","CM_ValidateFacet","CM_FindPlane","CM_FindPlane2","CM_SetBorderInward","CM_TracePointThroughPatchCollide","CM_CheckFacetPlane","CM_TraceThroughPatchCollide","CM_PositionTestInPatchCollide"],
            ["scripts/test_patches.py","scripts/test_collision.py","scripts/test_movement.py"]),
        "code/qcommon/cm_polylib.c":(["src/mq3/collision/winding.ml"],["BaseWindingForPlane","WindingBounds","ChopWindingInPlace"],["scripts/test_patches.py"]),
        "code/game/bg_pmove.c":(["src/mq3/game/movement.ml","src/mq3/game/pmove.ml"],
            ["PM_ClipVelocity","PM_Friction","PM_Accelerate","PM_CmdScale","PM_AddTouchEnt","PM_AddEvent", "PM_StartTorsoAnim","PM_StartLegsAnim","PM_ContinueLegsAnim","PM_ContinueTorsoAnim","PM_ForceLegsAnim",
             "PM_SetMovementDir","PM_CheckJump","PM_CheckWaterJump","PM_WaterJumpMove","PM_WaterMove","PM_FlyMove","PM_AirMove","PM_GrappleMove","PM_WalkMove","PM_DeadMove","PM_NoclipMove",
             "PM_FootstepForSurface","PM_CrashLand","PM_CorrectAllSolid","PM_GroundTraceMissed","PM_GroundTrace","PM_SetWaterLevel","PM_CheckDuck","PM_Footsteps","PM_WaterEvents",
             "PM_BeginWeaponChange","PM_FinishWeaponChange","PM_TorsoAnimation","PM_Weapon","PM_Animate","PM_DropTimers","PM_UpdateViewAngles","PmoveSingle","Pmove"],
            ["scripts/test_movement.py","scripts/test_pmove.py","scripts/test_runtime_pmove.py"]),
        "code/game/bg_slidemove.c":(["src/mq3/game/movement.ml"],["PM_SlideMove","PM_StepSlideMove"],["scripts/test_movement.py"]),
        "code/game/bg_misc.c":(["src/mq3/game/movement.ml","src/mq3/game/constants.ml","src/mq3/game/pmove.ml"],["BG_AddPredictableEventToPlayerstate","bg_itemlist"],["scripts/test_movement.py","scripts/test_pmove.py"]),
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
        if path.relative_to(ROOT).as_posix() in ("build/reference/collision/result.json","build/reference/movement/result.json"):
            continue # superseded by explicitly named curves/no_curves profiles
        evidence.append({"path":path.relative_to(ROOT).as_posix(),"sha256":sha(path),"result":json.loads(path.read_text())})
    replay=ROOT / "artifacts/reference/replay/result.json"
    if replay.exists():evidence.append({"path":replay.relative_to(ROOT).as_posix(),"sha256":sha(replay),"result":json.loads(replay.read_text())})
    sources={p.relative_to(ROOT).as_posix():sha(p) for base in ("src","native","scripts","tests") for p in sorted((ROOT / base).rglob("*"))
             if p.is_file() and "__pycache__" not in p.parts}
    report={"scope":"implemented foundations; full port incomplete","sources":sources,"evidence":evidence}
    (ROOT / "docs/reference/evidence.json").write_text(json.dumps(report,indent=2)+"\n")
    print("Updated partial source mappings and recorded test evidence.")

if __name__=="__main__":main()
