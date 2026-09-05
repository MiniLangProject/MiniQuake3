"""Refresh explicit partial source mappings and archive observed test evidence."""
import json
from toolchain import ROOT
from inventory import sha

def main():
    mappings={
        "code/game/q_math.c":(["src/mq3/shared/math.ml","src/mq3/shared/directions.ml","src/mq3/shared/bytedirs.ml"],
            ["Q_rand","Q_random","Q_crandom","Q_rsqrt","Q_fabs","LerpAngle","VectorLength","VectorNormalize","VectorNormalize2","AngleVectors","vectoangles","AngleNormalize360","AngleNormalize180","DirToByte","ProjectPointOnPlane","PerpendicularVector","bytedirs"],["scripts/test_math.py","scripts/test_patches.py","scripts/test_movement.py","scripts/test_pmove.py","scripts/test_shared_game.py","scripts/test_missiles.py"]),
        "code/game/q_shared.h":(["src/mq3/shared/math.ml","src/mq3/game/playerstate.ml","src/mq3/game/pmove.ml","src/mq3/game/entitystate.ml","src/mq3/game/snapshot.ml"],["DotProduct","CrossProduct","VectorMA","playerState_t","usercmd_t","entityState_t","trajectory_t","ANGLE2SHORT"],["scripts/test_math.py","scripts/test_pmove.py","scripts/test_entitystate.py"]),
        "code/win32/win_shared.c":(["src/mq3/shared/math.ml"],["Sys_SnapVector"],["scripts/test_pmove.py"]),
        "code/game/bg_public.h":(["src/mq3/game/constants.ml","src/mq3/game/pmove.ml"],["pmove_t","pmtype_t","weaponstate_t","statIndex_t","persEnum_t","powerup_t","holdable_t","weapon_t","entity_event_t","animNumber_t","team_t","entityType_t","meansOfDeath_t"],["scripts/test_pmove.py","scripts/test_entitystate.py","scripts/test_transitions.py"]),
        "code/game/q_shared.c":(["src/mq3/shared/parser.ml"],["COM_ParseExt","COM_BeginParseSession","COM_GetCurrentParseLine"],["scripts/test_core.py"]),
        "code/qcommon/cvar.c":(["src/mq3/qcommon/cvar.ml"],["Cvar_Get","Cvar_Set2","Cvar_SetCheatState","Cvar_Init"],["scripts/test_core.py"]),
        "code/qcommon/vm.c":(["src/mq3/vm/interpreter.ml"],["VM_Create"],["scripts/test_vm.py","scripts/test_rejections.py"]),
        "code/qcommon/vm_interpreted.c":(["src/mq3/vm/interpreter.ml"],["VM_PrepareInterpreter","VM_CallInterpreted"],["scripts/test_vm.py","scripts/test_retail_vm.py"]),
        "code/qcommon/vm_local.h":(["src/mq3/vm/interpreter.ml"],["opcode_t","vm_s"],["scripts/test_vm.py"]),
        "code/qcommon/qfiles.h":(["src/mq3/format/bsp.ml","src/mq3/vm/interpreter.ml"],["dheader_t","vmHeader_t"],["scripts/test_maps.py","scripts/test_vm.py"]),
        "code/qcommon/unzip.c":(["src/mq3/format/pk3.ml","src/mq3/format/deflate.ml"],[],["scripts/test_archives.py"]),
        "code/qcommon/cm_trace.c":(["src/mq3/collision/brush.ml","src/mq3/collision/world.ml"],
            ["CM_TraceThroughBrush","CM_TestBoxInBrush","CM_TestInLeaf","CM_PositionTest","CM_TraceThroughTree","CM_TraceThroughLeaf","CM_TraceThroughPatch","CM_Trace","CM_BoxTrace","CM_TransformedBoxTrace","CreateRotationMatrix","RotatePoint","TransposeMatrix"],
            ["scripts/test_brush.py","scripts/test_collision.py","scripts/test_movement.py","scripts/test_spatial.py","scripts/test_runtime_spatial.py"]),
        "code/qcommon/cm_load.c":(["src/mq3/collision/world.ml","src/mq3/collision/visibility.ml"],
            ["CMod_LoadPlanes","CMod_LoadBrushSides","CMod_LoadBrushes","CM_BoundBrush","CMod_LoadNodes","CMod_LoadLeafs","CMod_LoadSubmodels","CMod_LoadPatches","CMod_LoadVisibility","CM_ClipHandleToModel","CM_InitBoxHull","CM_TempBoxModel","CM_ModelBounds","CM_InlineModel","CM_NumInlineModels","CM_NumClusters","CM_LeafCluster","CM_LeafArea"],
            ["scripts/test_collision.py","scripts/test_patches.py","scripts/test_rejections.py","scripts/test_spatial.py","scripts/test_visibility.py"]),
        "code/qcommon/cm_test.c":(["src/mq3/collision/world.ml","src/mq3/collision/visibility.ml"],
            ["CM_PointLeafnum_r","CM_PointLeafnum","CM_PointContents","CM_TransformedPointContents","CM_BoxLeafnums_r","CM_BoxLeafnums","CM_BoxBrushes","CM_StoreLeafs","CM_StoreBrushes","CM_ClusterPVS","CM_FloodArea_r","CM_FloodAreaConnections","CM_AdjustAreaPortalState","CM_AreasConnected","CM_WriteAreaBits"],
            ["scripts/test_collision.py","scripts/test_spatial.py","scripts/test_visibility.py","scripts/test_runtime_spatial.py"]),
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
        "code/game/bg_misc.c":(["src/mq3/game/movement.ml","src/mq3/game/constants.ml","src/mq3/game/pmove.ml","src/mq3/game/trajectory.ml","src/mq3/game/jumppad.ml","src/mq3/game/snapshot.ml","src/mq3/game/shooters.ml"],
            ["BG_AddPredictableEventToPlayerstate","bg_itemlist","BG_EvaluateTrajectory","BG_EvaluateTrajectoryDelta","BG_PlayerTouchesItem","BG_TouchJumpPad","BG_PlayerStateToEntityState","BG_PlayerStateToEntityStateExtraPolate","BG_FindItemForWeapon"],
            ["scripts/test_movement.py","scripts/test_pmove.py","scripts/test_shared_game.py","scripts/test_server_world.py","scripts/test_entitystate.py","scripts/test_missiles.py"]),
        "code/server/sv_world.c":(["src/mq3/server/world.ml"],
            ["SV_ClipHandleForEntity","SV_CreateworldSector","SV_ClearWorld","SV_UnlinkEntity","SV_LinkEntity","SV_AreaEntities_r","SV_AreaEntities","SV_ClipToEntity","SV_ClipMoveToEntities","SV_Trace","SV_PointContents"],
            ["scripts/test_server_world.py","scripts/test_combat.py","scripts/test_missiles.py"]),
        "code/server/server.h":(["src/mq3/server/world.ml"],["svEntity_t"],["scripts/test_server_world.py"]),
        "code/game/g_public.h":(["src/mq3/server/world.ml"],["entityShared_t","sharedEntity_t"],["scripts/test_server_world.py"]),
        "code/server/sv_game.c":(["src/mq3/server/world.ml","src/mq3/game/spawn_functions.ml"],["SV_EntityContact","SV_SetBrushModel"],["scripts/test_transitions.py","scripts/test_spawn.py"]),
        "code/server/sv_init.c":(["src/mq3/game/spawn_values.ml"],["SV_SetConfigstring"],["scripts/test_targets.py","scripts/test_spawn_values.py"]),
        "code/game/g_active.c":(["src/mq3/game/triggers.ml"],["G_TouchTriggers"],["scripts/test_transitions.py"]),
        "code/game/g_misc.c":(["src/mq3/game/teleport.ml","src/mq3/game/spawn_functions.ml","src/mq3/game/shooters.ml"],
            ["TeleportPlayer","SP_info_null","SP_info_notnull","SP_info_camp","SP_light","SP_misc_model","SP_misc_teleporter_dest","Use_Shooter","InitShooter_Finish","InitShooter","SP_shooter_rocket","SP_shooter_grenade","SP_shooter_plasma"],["scripts/test_transitions.py","scripts/test_spawn.py","scripts/test_missiles.py"]),
        "code/game/g_client.c":(["src/mq3/game/teleport.ml","src/mq3/game/spawn_functions.ml"],
            ["SetClientViewAngle","SP_info_player_deathmatch","SP_info_player_start","SP_info_player_intermission"],["scripts/test_entitystate.py","scripts/test_transitions.py","scripts/test_spawn.py"]),
        "code/game/g_utils.c":(["src/mq3/game/entities.ml","src/mq3/game/teleport.ml","src/mq3/game/spawn_values.ml","src/mq3/game/spawn_functions.ml","src/mq3/game/targets.ml","src/mq3/game/events.ml","src/mq3/compat/textnumbers.ml"],
            ["G_InitGentity","G_Spawn","G_EntitiesFree","G_FreeEntity","G_TempEntity","G_SetOrigin","G_Find","G_PickTarget","G_KillBox","G_FindConfigstringIndex","G_ModelIndex","G_SoundIndex","G_SetMovedir","AddRemap","BuildShaderStateConfig","G_UseTargets","G_AddEvent","G_Sound"],["scripts/test_transitions.py","scripts/test_spawn_values.py","scripts/test_spawn.py","scripts/test_targets.py"]),
        "code/game/g_trigger.c":(["src/mq3/game/triggers.ml","src/mq3/game/spawn_functions.ml","src/mq3/game/targets.ml","src/mq3/game/hazards.ml"],
            ["trigger_push_touch","trigger_teleporter_touch","InitTrigger","AimAtTarget","SP_trigger_push","SP_trigger_teleport","multi_wait","multi_trigger","Use_Multi","Touch_Multi","SP_trigger_multiple","trigger_always_think","SP_trigger_always","Use_target_push","SP_target_push","func_timer_think","func_timer_use","SP_func_timer","hurt_touch","hurt_use","SP_trigger_hurt"],["scripts/test_transitions.py","scripts/test_spawn.py","scripts/test_targets.py","scripts/test_combat.py"]),
        "code/game/g_spawn.c":(["src/mq3/game/spawn.ml","src/mq3/game/spawn_tables.ml","src/mq3/game/spawn_values.ml","src/mq3/compat/textnumbers.ml"],
            ["G_SpawnString","G_SpawnFloat","G_SpawnInt","G_SpawnVector","fields","spawns","G_CallSpawn","G_NewString","G_ParseField","G_SpawnGEntityFromSpawnVars","G_AddSpawnVarToken","G_ParseSpawnVars","SP_worldspawn","G_SpawnEntitiesFromString","SP_item_botroam"],["scripts/test_spawn_values.py","scripts/test_spawn.py"]),
        "code/game/g_main.c":(["src/mq3/game/spawn_functions.ml","src/mq3/game/frame.ml","src/mq3/game/entities.ml"],["G_RunThink","G_RunFrame"],["scripts/test_spawn_values.py","scripts/test_spawn.py","scripts/test_targets.py","scripts/test_missiles.py"]),
        "code/game/g_target.c":(["src/mq3/game/spawn_functions.ml","src/mq3/game/targets.ml","src/mq3/game/hazards.ml"],["SP_target_position","Think_Target_Delay","Use_Target_Delay","SP_target_delay","target_relay_use","SP_target_relay","target_teleporter_use","SP_target_teleporter","Use_Target_Speaker","SP_target_speaker","target_location_linkup","SP_target_location","target_kill_use","SP_target_kill","target_laser_think","target_laser_on","target_laser_off","target_laser_use","target_laser_start","SP_target_laser"],["scripts/test_spawn.py","scripts/test_targets.py","scripts/test_combat.py"]),
        "code/game/g_mover.c":(["src/mq3/game/spawn_functions.ml"],["SP_path_corner"],["scripts/test_spawn.py"]),
        "code/game/g_team.c":(["src/mq3/game/spawn_functions.ml","src/mq3/game/combat.ml"],["SP_team_CTF_redplayer","SP_team_CTF_blueplayer","SP_team_CTF_redspawn","SP_team_CTF_bluespawn","OnSameTeam","Team_CheckHurtCarrier"],["scripts/test_spawn.py","scripts/test_combat.py"]),
        "code/game/g_combat.c":(["src/mq3/game/combat.ml"],["CheckArmor","G_Damage","CanDamage","G_RadiusDamage"],["scripts/test_combat.py"]),
        "code/game/g_missile.c":(["src/mq3/game/missiles.ml"],["G_BounceMissile","G_ExplodeMissile","G_MissileImpact","G_RunMissile","fire_plasma","fire_grenade","fire_bfg","fire_rocket","fire_grapple"],["scripts/test_missiles.py"]),
        "code/game/g_items.c":(["src/mq3/game/shooters.ml"],["RegisterItem"],["scripts/test_missiles.py"]),
        "code/game/g_weapon.c":(["src/mq3/game/combat.ml","src/mq3/game/missiles.ml"],["LogAccuracyHit","SnapVectorTowards","Weapon_HookFree","Weapon_HookThink"],["scripts/test_combat.py","scripts/test_missiles.py"]),
        "code/game/g_local.h":(["src/mq3/game/entities.ml","src/mq3/game/spawn.ml","src/mq3/game/combat.ml"],["gentity_s","level_locals_t","gclient_s","playerTeamState_t"],["scripts/test_transitions.py","scripts/test_spawn_values.py","scripts/test_spawn.py","scripts/test_targets.py","scripts/test_combat.py"]),
    }
    body_mappings={
        "code/game/g_client.c":(["src/mq3/game/player_spawns.ml","src/mq3/game/bodies.ml"],["SpotWouldTelefrag","SelectNearestDeathmatchSpawnPoint","SelectRandomDeathmatchSpawnPoint","SelectRandomFurthestSpawnPoint","SelectSpawnPoint","SelectInitialSpawnPoint","SelectSpectatorSpawnPoint","InitBodyQue","BodySink","CopyToBodyQue"]),
        "code/game/g_utils.c":(["src/mq3/game/bodies.ml"],["vectoyaw"]),
        "code/game/g_team.c":(["src/mq3/game/player_spawns.ml"],["SelectRandomTeamSpawnPoint","SelectCTFSpawnPoint"]),
        "code/game/g_main.c":(["src/mq3/game/player_spawns.ml","src/mq3/game/bodies.ml"],["FindIntermissionPoint"]),
        "code/game/g_combat.c":(["src/mq3/game/bodies.ml"],["LookAtKiller","GibEntity","body_die"]),
        "code/game/g_items.c":(["src/mq3/game/bodies.ml"],["G_BounceItem","G_RunItem"]),
        "code/game/g_local.h":(["src/mq3/game/bodies.ml","src/mq3/game/player_spawns.ml"],[]),
    }
    for source,(targets,symbols) in body_mappings.items():
        old_targets,old_symbols,tests=mappings[source]
        mappings[source]=(old_targets+targets,old_symbols+symbols,tests+["scripts/test_bodies.py"])
    path=ROOT / "PORT_LEDGER.json"
    ledger=json.loads(path.read_text())
    for entry in ledger["files"]:
        if entry["source"] in mappings:
            targets,symbols,tests=mappings[entry["source"]]
            entry.update(target=targets,status="partial",tests=tests,
                         symbol_mapping=[{"original":name,"target_files":targets,"status":"tested_subset"} for name in symbols])
            if entry["source"] == "code/game/g_main.c":
                entry["symbol_mapping"][1]["scope"] = "Allocated-entity loop with implemented missile and body-queue corpse physics dispatch; other item/physics/mover/client dispatch callbacks remain open. No full G_RunFrame orchestration."
            if entry["source"] == "code/server/sv_init.c":
                entry["symbol_mapping"][0]["scope"] = "Local configstring storage and NULL-to-empty contract only, modeled by the test host. No full original SV_SetConfigstring or broadcast comparison."
            if entry["source"] == "code/game/g_combat.c":
                entry["symbol_mapping"][1]["scope"] = "Baseq3 damage state and pain/die/mover dispatch; callbacks observed by test host. No player_die, scoring, damage feedback, Missionpack or full server frame. G_Printf diagnostics excluded."
            if entry["source"] == "code/game/g_missile.c":
                for symbol in entry["symbol_mapping"]:
                    symbol["scope"] = "Baseq3 native projectile rules and actual SV/CM; no Missionpack, complete weapon input, player_die or renderer. Freed-projectile callback rejects invalid relinking instead of original server metadata aliasing."
            if entry["source"] == "code/game/g_items.c":
                entry["symbol_mapping"][0]["scope"] = "Item registration bitset only. Item spawning, pickup, ClearRegisteredItems, SaveRegisteredItems and client precaching remain open."
            if entry["source"] == "code/game/g_items.c":
                entry["symbol_mapping"][1]["scope"] = "Full G_BounceItem arithmetic and stop rules; exercised by corpse physics."
                entry["symbol_mapping"][2]["scope"] = "Non-item body queue path only, with actual SV/CM, think/link ordering and no-drop removal. Item and team-item lifecycle remain open; native dispatcher accepts bodyque entities only."
    path.write_text(json.dumps(ledger,indent=2)+"\n")
    evidence=[]
    for path in sorted((ROOT / "build/reference").rglob("result.json")):
        if path.relative_to(ROOT).as_posix() in ("build/reference/collision/result.json","build/reference/movement/result.json"):
            continue # superseded by explicitly named curves/no_curves profiles
        result=json.loads(path.read_text())
        # A supplemental runtime report belongs only to its recorded full run.
        if "base_verification_sha256" in result:
            verification=ROOT / "build/verification.json"
            if not verification.exists() or result["base_verification_sha256"]!=sha(verification):continue
        evidence.append({"path":path.relative_to(ROOT).as_posix(),"sha256":sha(path),"result":result})
    replay=ROOT / "artifacts/reference/replay/result.json"
    if replay.exists():evidence.append({"path":replay.relative_to(ROOT).as_posix(),"sha256":sha(replay),"result":json.loads(replay.read_text())})
    verification=ROOT / "build/verification.json"
    if verification.exists():evidence.append({"path":verification.relative_to(ROOT).as_posix(),"sha256":sha(verification),"result":json.loads(verification.read_text())})
    sources={p.relative_to(ROOT).as_posix():sha(p) for base in ("src","native","scripts","tests") for p in sorted((ROOT / base).rglob("*"))
             if p.is_file() and "__pycache__" not in p.parts}
    report={"scope":"implemented foundations; full port incomplete","sources":sources,"evidence":evidence}
    (ROOT / "docs/reference/evidence.json").write_text(json.dumps(report,indent=2)+"\n")
    print("Updated partial source mappings and recorded test evidence.")

if __name__=="__main__":main()
