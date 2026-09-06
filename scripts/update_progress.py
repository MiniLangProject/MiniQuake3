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
        "code/game/g_active.c":(["src/mq3/game/triggers.ml","src/mq3/game/client_frame.ml","src/mq3/game/client_active.ml"],
            ["G_TouchTriggers","P_DamageFeedback","P_WorldEffects","G_SetClientSound","ClientImpacts","SpectatorThink","ClientInactivityTimer","ClientTimerActions","ClientIntermissionThink","ClientEvents","SendPendingPredictableEvents","ClientThink_real","ClientThink","G_RunClient","SpectatorClientEndFrame","ClientEndFrame"],
            ["scripts/test_transitions.py","scripts/test_client_frame.py","scripts/test_client_think.py"]),
        "code/game/g_misc.c":(["src/mq3/game/teleport.ml","src/mq3/game/spawn_functions.ml","src/mq3/game/shooters.ml"],
            ["TeleportPlayer","SP_info_null","SP_info_notnull","SP_info_camp","SP_light","SP_misc_model","SP_misc_teleporter_dest","Use_Shooter","InitShooter_Finish","InitShooter","SP_shooter_rocket","SP_shooter_grenade","SP_shooter_plasma"],["scripts/test_transitions.py","scripts/test_spawn.py","scripts/test_missiles.py"]),
        "code/game/g_client.c":(["src/mq3/game/teleport.ml","src/mq3/game/spawn_functions.ml","src/mq3/game/client_spawn.ml","src/mq3/game/tournament.ml"],
            ["SetClientViewAngle","ClientSpawn","ClientBegin","TeamCount","SP_info_player_deathmatch","SP_info_player_start","SP_info_player_intermission"],["scripts/test_entitystate.py","scripts/test_transitions.py","scripts/test_spawn.py","scripts/test_client_spawn.py","scripts/test_client_begin.py","scripts/test_tournament.py"]),
        "code/game/g_utils.c":(["src/mq3/game/entities.ml","src/mq3/game/teleport.ml","src/mq3/game/spawn_values.ml","src/mq3/game/spawn_functions.ml","src/mq3/game/targets.ml","src/mq3/game/events.ml","src/mq3/compat/textnumbers.ml"],
            ["G_InitGentity","G_Spawn","G_EntitiesFree","G_FreeEntity","G_TempEntity","G_SetOrigin","G_Find","G_PickTarget","G_KillBox","G_FindConfigstringIndex","G_ModelIndex","G_SoundIndex","G_SetMovedir","AddRemap","BuildShaderStateConfig","G_UseTargets","G_AddEvent","G_Sound"],["scripts/test_transitions.py","scripts/test_spawn_values.py","scripts/test_spawn.py","scripts/test_targets.py"]),
        "code/game/g_trigger.c":(["src/mq3/game/triggers.ml","src/mq3/game/spawn_functions.ml","src/mq3/game/targets.ml","src/mq3/game/hazards.ml"],
            ["trigger_push_touch","trigger_teleporter_touch","InitTrigger","AimAtTarget","SP_trigger_push","SP_trigger_teleport","multi_wait","multi_trigger","Use_Multi","Touch_Multi","SP_trigger_multiple","trigger_always_think","SP_trigger_always","Use_target_push","SP_target_push","func_timer_think","func_timer_use","SP_func_timer","hurt_touch","hurt_use","SP_trigger_hurt"],["scripts/test_transitions.py","scripts/test_spawn.py","scripts/test_targets.py","scripts/test_combat.py"]),
        "code/game/g_spawn.c":(["src/mq3/game/spawn.ml","src/mq3/game/spawn_tables.ml","src/mq3/game/spawn_values.ml","src/mq3/compat/textnumbers.ml"],
            ["G_SpawnString","G_SpawnFloat","G_SpawnInt","G_SpawnVector","fields","spawns","G_CallSpawn","G_NewString","G_ParseField","G_SpawnGEntityFromSpawnVars","G_AddSpawnVarToken","G_ParseSpawnVars","SP_worldspawn","G_SpawnEntitiesFromString","SP_item_botroam"],["scripts/test_spawn_values.py","scripts/test_spawn.py"]),
        "code/game/g_main.c":(["src/mq3/game/spawn_functions.ml","src/mq3/game/frame.ml","src/mq3/game/entities.ml","src/mq3/game/tournament.ml"],["G_RunThink","G_RunFrame","CheckTournament"],["scripts/test_spawn_values.py","scripts/test_spawn.py","scripts/test_targets.py","scripts/test_missiles.py","scripts/test_tournament.py","scripts/test_full_frame.py"]),
        "code/game/g_target.c":(["src/mq3/game/spawn_functions.ml","src/mq3/game/targets.ml","src/mq3/game/hazards.ml"],["SP_target_position","Think_Target_Delay","Use_Target_Delay","SP_target_delay","target_relay_use","SP_target_relay","target_teleporter_use","SP_target_teleporter","Use_Target_Speaker","SP_target_speaker","target_location_linkup","SP_target_location","target_kill_use","SP_target_kill","target_laser_think","target_laser_on","target_laser_off","target_laser_use","target_laser_start","SP_target_laser"],["scripts/test_spawn.py","scripts/test_targets.py","scripts/test_combat.py"]),
        "code/game/g_mover.c":(["src/mq3/game/spawn_functions.ml"],["SP_path_corner"],["scripts/test_spawn.py"]),
        "code/game/g_team.c":(["src/mq3/game/spawn_functions.ml","src/mq3/game/combat.ml"],["SP_team_CTF_redplayer","SP_team_CTF_blueplayer","SP_team_CTF_redspawn","SP_team_CTF_bluespawn","OnSameTeam","Team_CheckHurtCarrier"],["scripts/test_spawn.py","scripts/test_combat.py"]),
        "code/game/g_combat.c":(["src/mq3/game/combat.ml"],["CheckArmor","G_Damage","CanDamage","G_RadiusDamage"],["scripts/test_combat.py"]),
        "code/game/g_missile.c":(["src/mq3/game/missiles.ml"],["G_BounceMissile","G_ExplodeMissile","G_MissileImpact","G_RunMissile","fire_plasma","fire_grenade","fire_bfg","fire_rocket","fire_grapple"],["scripts/test_missiles.py"]),
        "code/game/g_items.c":(["src/mq3/game/shooters.ml"],["RegisterItem"],["scripts/test_missiles.py"]),
        "code/game/g_weapon.c":(["src/mq3/game/combat.ml","src/mq3/game/missiles.ml"],["LogAccuracyHit","SnapVectorTowards","Weapon_HookFree","Weapon_HookThink"],["scripts/test_combat.py","scripts/test_missiles.py"]),
        "code/game/g_local.h":(["src/mq3/game/entities.ml","src/mq3/game/spawn.ml","src/mq3/game/combat.ml","src/mq3/game/client_spawn.ml","src/mq3/game/client_frame.ml","src/mq3/game/client_active.ml","src/mq3/game/frame.ml","src/mq3/game/tournament.ml"],["gentity_s","level_locals_t","gclient_s","playerTeamState_t"],["scripts/test_transitions.py","scripts/test_spawn_values.py","scripts/test_spawn.py","scripts/test_targets.py","scripts/test_combat.py","scripts/test_client_spawn.py","scripts/test_client_begin.py","scripts/test_client_frame.py","scripts/test_client_think.py","scripts/test_tournament.py","scripts/test_full_frame.py"]),
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
    score_mappings={
        "code/game/g_combat.c":(["src/mq3/game/scores.ml"],["ScorePlum","AddScore"]),
        "code/game/g_main.c":(["src/mq3/game/scores.ml","src/mq3/game/rank_sort.ml"],["SortRanks","CalculateRanks","SendScoreboardMessageToAllClients","ScoreIsTied","CheckExitRules","LogExit","CheckIntermissionExit"]),
        "code/game/g_local.h":(["src/mq3/game/scores.ml"],[]),
        "code/game/g_public.h":([],[]),
    }
    for source,(targets,symbols) in score_mappings.items():
        old_targets,old_symbols,tests=mappings[source]
        mappings[source]=(old_targets+targets,old_symbols+symbols,tests+["scripts/test_scores.py"])
    mappings["code/game/g_cmds.c"]=( ["src/mq3/game/scores.ml"], ["DeathmatchScoreboardMessage","Cmd_Score_f"], ["scripts/test_scores.py"] )
    death_mappings={
        "code/game/g_combat.c":(["src/mq3/game/deaths.ml"],["TossClientItems","CheckAlmostCapture","CheckAlmostScored","player_die"]),
        "code/game/g_team.c":(["src/mq3/game/team_bonuses.ml"],["OtherTeam","TeamName","Team_FragBonuses"]),
        "code/game/g_client.c":(["src/mq3/game/deaths.ml"],["respawn"]),
        "code/server/sv_game.c":(["src/mq3/server/world.ml"],["SV_inPVS"]),
        "code/game/g_local.h":(["src/mq3/game/entities.ml","src/mq3/game/deaths.ml","src/mq3/game/team_bonuses.ml"],[]),
    }
    for source,(targets,symbols) in death_mappings.items():
        old_targets,old_symbols,tests=mappings[source]
        mappings[source]=(list(dict.fromkeys(old_targets+targets)),list(dict.fromkeys(old_symbols+symbols)),list(dict.fromkeys(tests+["scripts/test_deaths.py"])))
    old_targets,old_symbols,tests=mappings["code/game/g_cmds.c"]
    mappings["code/game/g_cmds.c"]=(old_targets,old_symbols,tests+["scripts/test_deaths.py"])
    item_mappings={
        "code/game/g_items.c":(["src/mq3/game/items.ml"],["Pickup_Powerup","Pickup_Holdable","Add_Ammo","Pickup_Ammo","Pickup_Weapon","Pickup_Health","Pickup_Armor","RespawnItem","Touch_Item","RegisterItem","LaunchItem","Drop_Item","Use_Item","FinishSpawningItem","G_ItemDisabled","G_SpawnItem","G_BounceItem","G_RunItem"]),
        "code/game/g_team.c":(["src/mq3/game/items.ml"],["AddTeamScore","Team_SetFlagStatus","Team_ForceGesture","Team_CheckDroppedItem","Team_ResetFlag","Team_ResetFlags","Team_ReturnFlagSound","Team_TakeFlagSound","Team_CaptureFlagSound","Team_ReturnFlag","Team_FreeEntity","Team_DroppedFlagThink","Team_TouchOurFlag","Team_TouchEnemyFlag","Pickup_Team"]),
        "code/game/g_spawn.c":(["src/mq3/game/items.ml"],[]),
        "code/game/g_main.c":(["src/mq3/game/items.ml"],[]),
        "code/game/bg_misc.c":(["src/mq3/game/items.ml"],["BG_CanItemBeGrabbed"]),
        "code/game/g_utils.c":(["src/mq3/game/items.ml"],["G_AddPredictableEvent"]),
        "code/game/g_local.h":(["src/mq3/game/items.ml"],[]),
    }
    for source,(targets,symbols) in item_mappings.items():
        old_targets,old_symbols,tests=mappings[source]
        mappings[source]=(list(dict.fromkeys(old_targets+targets)),list(dict.fromkeys(old_symbols+symbols)),list(dict.fromkeys(tests+["scripts/test_items.py"])))
    vote_mappings={
        "code/game/g_main.c":(["src/mq3/game/votes.ml"],["CheckVote","CheckTeamVote","PrintTeam","SetLeader","CheckTeamLeader"]),
        "code/game/g_local.h":(["src/mq3/game/votes.ml"],[]),
    }
    for source,(targets,symbols) in vote_mappings.items():
        old_targets,old_symbols,tests=mappings[source]
        mappings[source]=(list(dict.fromkeys(old_targets+targets)),old_symbols+symbols,list(dict.fromkeys(tests+["scripts/test_votes.py"])))
    team_status_mappings={
        "code/game/g_team.c":(["src/mq3/game/team_status.ml"],["Team_GetLocation","SortClients","TeamplayInfoMessage","CheckTeamStatus"]),
        "code/game/g_main.c":(["src/mq3/game/cvar_maintenance.ml"],["CheckCvars"]),
        "code/game/g_local.h":(["src/mq3/game/team_status.ml","src/mq3/game/cvar_maintenance.ml"],[]),
        "code/server/sv_game.c":([],[]),
    }
    for source,(targets,symbols) in team_status_mappings.items():
        old_targets,old_symbols,tests=mappings[source]
        mappings[source]=(list(dict.fromkeys(old_targets+targets)),old_symbols+symbols,list(dict.fromkeys(tests+["scripts/test_team_status.py"])))
    game_cvar_mappings={
        "code/qcommon/cvar.c":(["src/mq3/qcommon/cvar.ml"],["Cvar_Register","Cvar_Update"]),
        "code/game/q_shared.h":(["src/mq3/qcommon/cvar.ml"],["vmCvar_t"]),
        "code/game/g_main.c":(["src/mq3/game/cvars.ml","src/mq3/game/cvar_tables.ml"],["gameCvarTable","G_RegisterCvars","G_UpdateCvars","G_RemapTeamShaders"]),
        "code/game/g_local.h":(["src/mq3/game/cvars.ml"],[]),
    }
    for source,(targets,symbols) in game_cvar_mappings.items():
        old_targets,old_symbols,tests=mappings[source]
        mappings[source]=(list(dict.fromkeys(old_targets+targets)),old_symbols+symbols,list(dict.fromkeys(tests+["scripts/test_game_cvars.py"])))
    vote_command_mappings={
        "code/game/g_cmds.c":(["src/mq3/game/vote_commands.ml"],["gameNames","Cmd_CallVote_f","Cmd_Vote_f","Cmd_CallTeamVote_f","Cmd_TeamVote_f"]),
        "code/game/g_local.h":(["src/mq3/game/vote_commands.ml","src/mq3/game/entities.ml"],[]),
        "code/game/g_main.c":(["src/mq3/game/cvars.ml"],[]),
    }
    for source,(targets,symbols) in vote_command_mappings.items():
        old_targets,old_symbols,tests=mappings[source]
        mappings[source]=(list(dict.fromkeys(old_targets+targets)),old_symbols+symbols,list(dict.fromkeys(tests+["scripts/test_vote_commands.py"])))
    client_info_mappings={
        "code/game/g_client.c":(["src/mq3/game/client_info.ml","src/mq3/shared/info.ml"],["ClientCleanName","ClientUserinfoChanged","TeamLeader","PickTeam"]),
        "code/game/q_shared.c":(["src/mq3/shared/info.ml"],["Info_ValueForKey","Info_Validate"]),
        "code/game/g_cmds.c":([],[]),
        "code/game/g_team.c":([],[]),
        "code/game/g_main.c":(["src/mq3/game/client_info.ml"],[]),
        "code/game/g_local.h":(["src/mq3/game/client_info.ml"],[]),
    }
    for source,(targets,symbols) in client_info_mappings.items():
        old_targets,old_symbols,tests=mappings[source]
        mappings[source]=(list(dict.fromkeys(old_targets+targets)),old_symbols+symbols,list(dict.fromkeys(tests+["scripts/test_client_info.py"])))
    connect_mappings={
        "code/game/g_session.c":(["src/mq3/game/session.ml","src/mq3/compat/textnumbers.ml"],["G_WriteClientSessionData","G_ReadSessionData","G_InitSessionData","G_InitWorldSession","G_WriteSessionData"]),
        "code/game/g_client.c":(["src/mq3/game/client_connect.ml","src/mq3/game/session.ml","src/mq3/game/entities.ml"],["ClientConnect"]),
        "code/game/g_cmds.c":(["src/mq3/game/session.ml"],["BroadcastTeamChange"]),
        "code/game/g_main.c":(["src/mq3/game/client_connect.ml","src/mq3/game/cvars.ml"],[]),
        "code/game/g_local.h":(["src/mq3/game/session.ml","src/mq3/game/client_connect.ml"],[]),
    }
    for source,(targets,symbols) in connect_mappings.items():
        old_targets,old_symbols,tests=mappings.get(source,([],[],[]))
        mappings[source]=(list(dict.fromkeys(old_targets+targets)),old_symbols+symbols,list(dict.fromkeys(tests+["scripts/test_client_connect.py"])))
    team_change_mappings={
        "code/game/g_cmds.c":(["src/mq3/game/team_changes.ml"],["SetTeam","StopFollowing","Cmd_Team_f"]),
        "code/game/g_client.c":(["src/mq3/game/client_disconnect.ml"],["ClientDisconnect"]),
        "code/game/g_combat.c":(["src/mq3/game/team_changes.ml","src/mq3/game/client_disconnect.ml"],[]),
        "code/game/g_team.c":([],[]),
        "code/game/g_main.c":(["src/mq3/game/cvars.ml"],[]),
        "code/game/g_local.h":(["src/mq3/game/team_changes.ml","src/mq3/game/client_disconnect.ml","src/mq3/game/entities.ml"],[]),
    }
    for source,(targets,symbols) in team_change_mappings.items():
        old_targets,old_symbols,tests=mappings[source]
        mappings[source]=(list(dict.fromkeys(old_targets+targets)),old_symbols+symbols,list(dict.fromkeys(tests+["scripts/test_team_changes.py"])))
    follow_mappings={
        "code/game/g_cmds.c":(["src/mq3/game/follow_commands.ml"],["SanitizeString","ClientNumberFromString","Cmd_Follow_f","Cmd_FollowCycle_f"]),
        "code/game/g_main.c":(["src/mq3/game/tournament.ml"],["AddTournamentPlayer","RemoveTournamentLoser","RemoveTournamentWinner","AdjustTournamentScores"]),
        "code/game/g_active.c":(["src/mq3/game/follow_commands.ml"],[]),
        "code/game/g_client.c":([],[]),
        "code/game/g_local.h":(["src/mq3/game/follow_commands.ml"],[]),
    }
    for source,(targets,symbols) in follow_mappings.items():
        old_targets,old_symbols,tests=mappings[source]
        mappings[source]=(list(dict.fromkeys(old_targets+targets)),old_symbols+symbols,list(dict.fromkeys(tests+["scripts/test_follow_tournament.py"])))
    intermission_mappings={
        "code/game/g_main.c":(["src/mq3/game/intermission.ml"],["MoveClientToIntermission","BeginIntermission","ExitLevel"]),
        "code/game/g_client.c":(["src/mq3/game/intermission.ml"],[]),
        "code/game/g_utils.c":([],[]),
        "code/game/g_local.h":(["src/mq3/game/intermission.ml"],[]),
    }
    for source,(targets,symbols) in intermission_mappings.items():
        old_targets,old_symbols,tests=mappings[source]
        mappings[source]=(list(dict.fromkeys(old_targets+targets)),old_symbols+symbols,list(dict.fromkeys(tests+["scripts/test_intermission.py"])))
    command_groups={
        "src/mq3/game/client_commands.ml":["ClientCommand"],
        "src/mq3/game/command_args.ml":["ConcatArgs"],
        "src/mq3/game/chat_commands.ml":["G_SayTo","G_Say","Cmd_Say_f","Cmd_Tell_f","G_VoiceTo","G_Voice","Cmd_Voice_f","Cmd_VoiceTell_f","Cmd_VoiceTaunt_f","gc_orders","Cmd_GameCommand_f","Cmd_Where_f"],
        "src/mq3/game/utility_commands.ml":["CheatsOk","Cmd_Give_f","Cmd_God_f","Cmd_Notarget_f","Cmd_Noclip_f","Cmd_LevelShot_f","Cmd_TeamTask_f","Cmd_Kill_f","Cmd_SetViewpos_f","Cmd_Stats_f"],
    }
    command_mappings={
        "code/game/g_cmds.c":(list(command_groups),[symbol for names in command_groups.values() for symbol in names]),
        "code/game/g_team.c":(["src/mq3/game/team_status.ml"],["Team_GetLocationMsg"]),
        "code/game/q_shared.c":(["src/mq3/shared/info.ml"],["Info_RemoveKey","Info_SetValueForKey"]),
        "code/game/bg_misc.c":(["src/mq3/game/utility_commands.ml"],["BG_FindItem"]),
        "code/game/g_utils.c":(["src/mq3/game/entities.ml"],["vtos"]),
        "code/game/g_items.c":(["src/mq3/game/items.ml"],[]),
        "code/game/g_local.h":(["src/mq3/game/entities.ml"],[]),
        "code/game/g_main.c":(["src/mq3/game/cvars.ml"],[]),
        "ui/menudef.h":(["src/mq3/game/chat_commands.ml"],["VOICECHAT_DEATHINSULT","VOICECHAT_KILLGAUNTLET","VOICECHAT_KILLINSULT","VOICECHAT_PRAISE","VOICECHAT_TAUNT"]),
    }
    for source,(targets,symbols) in command_mappings.items():
        old_targets,old_symbols,tests=mappings.get(source,([],[],[]))
        mappings[source]=(list(dict.fromkeys(old_targets+targets)),list(dict.fromkeys(old_symbols+symbols)),list(dict.fromkeys(tests+["scripts/test_client_commands.py"])))
    weapon_groups={
        "src/mq3/game/weapons.ml":["G_BounceProjectile","Weapon_Gauntlet","CheckGauntletAttack","BFG_Fire","weapon_grenadelauncher_fire","Weapon_RocketLauncher_Fire","Weapon_Plasmagun_Fire","Weapon_GrapplingHook_Fire","CalcMuzzlePoint","CalcMuzzlePointOrigin","FireWeapon"],
        "src/mq3/game/weapon_hitscan.ml":["Bullet_Fire","ShotgunPellet","ShotgunPattern","weapon_supershotgun_fire","weapon_railgun_fire","Weapon_LightningFire"],
    }
    weapon_mappings={
        "code/game/g_weapon.c":(list(weapon_groups)+["src/mq3/game/weapon_state.ml"],[symbol for names in weapon_groups.values() for symbol in names]),
        "code/game/g_active.c":(["src/mq3/game/client_active.ml"],[]),
        "code/game/g_combat.c":([],[]),
        "code/game/g_missile.c":([],[]),
        "code/game/g_local.h":(["src/mq3/game/entities.ml"],[]),
        "code/game/g_main.c":(["src/mq3/game/cvars.ml"],[]),
    }
    for source,(targets,symbols) in weapon_mappings.items():
        old_targets,old_symbols,tests=mappings[source]
        mappings[source]=(list(dict.fromkeys(old_targets+targets)),list(dict.fromkeys(old_symbols+symbols)),list(dict.fromkeys(tests+["scripts/test_weapons.py"])))
    startup_groups={
        "code/game/g_svcmds.c":[
            ("src/mq3/game/ip_filters.ml",["StringToFilter","UpdateIPBans","G_FilterPacket","AddIP","G_ProcessIPBans","Svcmd_AddIP_f","Svcmd_RemoveIP_f"],["scripts/test_ip_filters.py","scripts/test_server_commands.py"],
             "Original Baseq3 1024-slot IP masks, sentinel/free-slot reuse, ban-list capacity and formatting, VM snapshot mutation, delayed refresh, packet filtering and add/remove commands. ClientConnect uses the real filter by default, retaining explicit fixture overrides. Short packet inputs that would depend on uninitialized native octets, overflowing native parse buffers and G_Printf outputs beyond 1023 bytes are separate MiniLang contracts. Engine command tokenization, networking and module restart orchestration remain open."),
            ("src/mq3/game/server_commands.ml",["Svcmd_EntityList_f","ClientForString","Svcmd_ForceTeam_f","ConsoleCommand"],["scripts/test_server_commands.py"],
             "Original Baseq3 server command dispatch, exact EntityList print fragments, numeric-first/literal-name client lookup, real SetTeam/death/spawn/rank integration, dedicated chat/fallback, IP administration and arena status. State and ordered effects are compared through unchanged native bodies. The isolated server fixture observes ClientThink/ClientEndFrame after real ClientSpawn; their actual default ports are tested separately. Overlong G_Printf output is a separate MiniLang contract. Bot creation/listing and podium abort require explicit callbacks; engine argv tokenization, console buffering, command/network transport and full module startup remain open.")],
        "code/game/g_mem.c":[
            ("src/mq3/game/memory.ml",["G_Alloc","G_InitMemory","Svcmd_GameMem_f"],["scripts/test_game_memory.py","scripts/test_server_commands.py"],
             "Original 256 KiB arena, 32-byte alignment, zero-size allocation pointers, diagnostic-before-mutation/drop ordering, retained bytes and block aliases across rewind. Compared allocation cases use nonnegative sizes up to 2147483616 with allocPoint + size within INT_MAX. Sizes outside this conservative domain are separate MiniLang contracts, including larger requests that native C can reject before alignment when debugging is disabled. State can be rebound across levels; complete module lifecycle is open.")],
        "code/game/g_spawn.c":[
            ("src/mq3/game/memory.ml",["G_NewString"],["scripts/test_game_memory.py"],
             "Real arena-backed string allocation including original byte extent, escape translation, first-NUL termination and unchanged padding. Map entity F_LSTRING parsing uses this default; standalone conversion helpers remain available. Terminal backslash would omit the native NUL and is a separate MiniLang rejection after allocation/writes. Entity field strings are owned MiniLang values; arbitrary C pointer aliasing is not claimed."),
            ("src/mq3/game/spawn.ml",["G_ParseField"],["scripts/test_game_memory.py"],
             "Original field lookup/conversion with arena-backed F_LSTRING in the actual map spawn path; all nine string fields, ignored/unknown fields, overwrite allocation and exact bytes/order are additionally compared. Pure field-conversion fixtures retain the legacy allocation-independent wrapper.")],
        "code/game/g_main.c":[
            ("src/mq3/game/initialization.ml",["G_FindTeams"],["scripts/test_initialization.py"],
             "Original index-one, in-use and non-slave grouping, case-sensitive team names, NULL versus empty strings, existing chain preservation, slave prepend and last non-NULL targetname transfer. Relevant state and original print order are compared; full G_InitGame orchestration remains open.")],
        "code/game/g_items.c":[
            ("src/mq3/game/items.ml",["RegisterItem","ClearRegisteredItems","SaveRegisteredItems","G_CheckTeamItems"],["scripts/test_initialization.py"],
             "Original 256 qboolean registration slots (1,024 bytes), dummy and sentinel item descriptors, mandatory starting weapons, 36-character CS_ITEMS and exact print-before-publish order. CTF missing-flag checks call real team initialization. The one undefined native CTF initial status byte is explicitly normalized and archived separately; client asset precaching and full map startup remain open.")],
        "code/game/g_team.c":[
            ("src/mq3/game/items.ml",["Team_InitGame"],["scripts/test_initialization.py"],
             "All nine teamgame fields reset, Baseq3 CTF invalid-status setup, two status publications and original intermediate states. Original first publication reads ctfFlagStatusRemap[-1]; only that undefined byte is normalized to NUL with native raw bytes archived, not claimed as exact parity. Second publication and all defined state are compared exactly; Missionpack is excluded.")],
    }
    for source,groups in startup_groups.items():
        old_targets,old_symbols,tests=mappings.get(source,([],[],[]))
        for target,symbols,checks,scope in groups:
            old_targets=list(dict.fromkeys(old_targets+[target]))
            old_symbols=list(dict.fromkeys(old_symbols+symbols))
            tests=list(dict.fromkeys(tests+checks))
        mappings[source]=(old_targets,old_symbols,tests)
    targets,symbols,tests=mappings["code/game/g_local.h"]
    mappings["code/game/g_local.h"]=(targets,symbols,list(dict.fromkeys(tests+["scripts/test_game_memory.py","scripts/test_initialization.py","scripts/test_ip_filters.py","scripts/test_server_commands.py"])))
    path=ROOT / "PORT_LEDGER.json"
    ledger=json.loads(path.read_text(encoding="utf-8"))
    for entry in ledger["files"]:
        if entry["source"] in mappings:
            targets,symbols,tests=mappings[entry["source"]]
            entry.update(target=targets,status="partial",tests=tests,
                         symbol_mapping=[{"original":name,"target_files":targets,"status":"tested_subset"} for name in symbols])
            if entry["source"] == "code/game/g_main.c":
                for symbol in entry["symbol_mapping"]:
                    if symbol["original"] == "G_RunFrame":
                        symbol["scope"] = "Baseq3 G_RunFrame order is compared end to end: restart guard, time/frame update, entities, ported client dispatch, client end frames, actual CheckTournament, exit rules, team status, global/team vote resolution and CheckCvars. Default Cvar refresh uses ported G_UpdateCvars and the engine registry; empty-entity frame probes compare that path, while legacy frame/gameplay suites retain an explicit refresh override. Mover/other physics dispatch and entity-list diagnostics remain callbacks."
                    elif symbol["original"] == "CheckTournament":
                        symbol["scope"] = "Baseq3 tournament promotion, player/team readiness, warmup Cvar changes, countdown and map restart are compared against the unchanged native body. Default promotion now executes ported AddTournamentPlayer with real SetTeam/ClientBegin/Spawn/ranks, compared separately including countdown/restart; legacy isolated tests retain an override. Engine command delivery remains a callback."
                    elif symbol["original"] in ("AddTournamentPlayer","RemoveTournamentLoser","RemoveTournamentWinner","AdjustTournamentScores"):
                        symbol["target_files"] = ["src/mq3/game/tournament.ml"]
                        symbol["scope"] = "Unchanged Baseq3 oldest eligible spectator selection, stable queue-time ties, scoreboard/dedicated-follow exclusion, ranked winner/loser removal and connected-only win/loss updates. Actual SetTeam/death/body/item/userinfo/ClientBegin/Spawn/ranks and CheckTournament callers are compared, including disconnect/rotation/countdown/restart. BeginIntermission/ExitLevel use these helpers directly and are separately compared. Engine delivery/map execution remain open."
                    elif symbol["original"] == "CheckCvars":
                        symbol["target_files"] = ["src/mq3/game/cvar_maintenance.ml"]
                        symbol["scope"] = "Unchanged Baseq3 password-to-g_needpass maintenance, including initial -1 cache, counter changes/wrap, ASCII none matching, byte capacity and game-module cache persistence across level resets. The Cvar suite integrates actual engine registration/update/set and empty-entity frames; other isolated suites observe the delivery callback."
                    elif symbol["original"] in ("gameCvarTable","G_RegisterCvars","G_UpdateCvars","G_RemapTeamShaders"):
                        symbol["target_files"] = ["src/mq3/game/cvars.ml","src/mq3/game/cvar_tables.ml"]
                        symbol["scope"] = "All 46 pinned Baseq3 table rows and 43 VM snapshots are compared with the actual original engine registry: flags/defaults/order, registration, change counters, latched values, exact broadcasts and gameplay field synchronization. G_RemapTeamShaders has an empty Baseq3 body; Missionpack is excluded. Build date is explicit host metadata matching the native compiler's __DATE__. Empty-entity frame probes use guarded inactive match/vote boundaries."
                    elif symbol["original"] in ("CheckVote","CheckTeamVote","PrintTeam","SetLeader","CheckTeamLeader"):
                        symbol["target_files"] = ["src/mq3/game/votes.ml"]
                        symbol["scope"] = "Unchanged Baseq3 vote resolution and team leadership: integer majority thresholds, timeout and delayed execution, configstrings, ordered messages and leader flags, including the original two-loop auto-selection. Actual G_RunFrame vote sequences and full call/cast/resolution chains are compared. ClientUserinfoChanged uses its ported default, with real team-vote integration in the userinfo suite; legacy vote suites retain an override. Full ClientCommand routing is separately ported and compared; engine delivery and network transport are open."
            if entry["source"] == "code/game/g_cmds.c":
                for symbol in entry["symbol_mapping"]:
                    if symbol["original"] in ("SetTeam","StopFollowing","Cmd_Team_f"):
                        symbol["target_files"] = ["src/mq3/game/team_changes.ml"]
                        symbol["scope"] = "Unchanged Baseq3 team/spectator selection, force balance, capacity override, same-team guard, actual body/death/CTF/leader/userinfo/ClientBegin/Spawn/rank integration and exact command argc/cooldown/loss order. StopFollowing preserves unrelated session fields and clears PMF_FOLLOW/SVF_BOT. Every host effect and action compares all modeled clients, entityStates and selected private/spatial entity fields. Movement/end-frame are observed callbacks in this integration suite; defaults remain ported. Follow commands and tournament promotion are separately ported and compared. Match-transition orchestration is separately ported and compared. Full ClientCommand routing is separately ported and compared; engine map execution remains open."
                    elif symbol["original"] in ("SanitizeString","ClientNumberFromString","Cmd_Follow_f","Cmd_FollowCycle_f"):
                        symbol["target_files"] = ["src/mq3/game/follow_commands.ml"]
                        symbol["scope"] = "Unchanged Baseq3 signed-char/ESC sanitization, numeric-first/name lookup, follow start/stop and cycling with actual team/death/spawn/rank effects. Native partial state at four bad-direction errors and SpectatorThink attack edges are compared. Trailing ESC would read beyond the C terminator; zero client ranges and invalid-start cycles without candidates can access invalid storage or hang. MiniLang rejects these separately without claiming native parity. Full ClientCommand routing is separately ported and compared; engine command tokenization remains open."
            if entry["source"] == "code/server/sv_init.c":
                entry["symbol_mapping"][0]["scope"] = "Local configstring storage and NULL-to-empty contract only, modeled by the test host. No full original SV_SetConfigstring or broadcast comparison."
            if entry["source"] == "code/game/g_utils.c":
                for symbol in entry["symbol_mapping"]:
                    if symbol["original"] == "G_PickTarget":
                        symbol["target_files"] = ["src/mq3/game/entities.ml"]
                        symbol["scope"] = "Baseq3 case-insensitive target lookup, first 32 eligible entities and native Windows rand selection. Missing/NULL target diagnostics use gamePrintFn when provided; the intermission integration compares the missing-camera-target message and its exact state/order. Legacy isolated hosts without a print sink exclude diagnostics."
            if entry["source"] == "code/qcommon/cvar.c":
                for symbol in entry["symbol_mapping"]:
                    if symbol["original"] in ("Cvar_Register","Cvar_Update"):
                        symbol["target_files"] = ["src/mq3/qcommon/cvar.ml"]
                        symbol["scope"] = "Actual engine VM-Cvar registration/update: zero-based stable handles, -1 registration sentinel, unchanged/cleared early returns, 255-byte strings and float/int snapshots. Invalid handles, embedded NUL and overlength fail safely; caught MiniLang errors retain the last valid VM snapshot instead of reproducing C's process-drop side effects. Registry cvar_restart and full QVM trap dispatch remain open."
            if entry["source"] == "code/game/q_shared.c":
                for symbol in entry["symbol_mapping"]:
                    if symbol["original"] in ("Info_ValueForKey","Info_Validate"):
                        symbol["target_files"] = ["src/mq3/shared/info.ml"]
                        symbol["scope"] = "Original info-string lookup: ASCII case-insensitive first key, optional leading separator, empty/malformed pairs, NULL lookup and 8191-byte bound. Validation excludes only quotes and semicolons. Embedded NUL and invalid copy capacity fail safely. Owned MiniLang strings replace C's alternating static result buffers; no pointer aliasing is claimed. ClientSpawn shares lookup and the original 1023-byte userinfo copy."
            if entry["source"] == "code/game/g_session.c":
                for symbol in entry["symbol_mapping"]:
                    symbol["scope"] = "All five unchanged Baseq3 session functions: seven-field serialization and native CRT %i scan, noncanonical leader integers, initial team/capacity rules, sticky newSession and connected-only shutdown writes. Actual team selection, broadcasts and ClientConnect callers are compared. MiniLang reads its real engine registry and uses registered Cvar set delivery; the native host models session Cvar storage. Level-reconstruction fixtures retain registry data. Incomplete scans are rejected before mutation because original C reads uninitialized locals; full engine/module restart and disk persistence are open."
            if entry["source"] == "code/game/g_combat.c":
                entry["symbol_mapping"][1]["scope"] = "Baseq3 damage state and pain/die/mover dispatch. player_die and damage feedback are connected and separately compared; the weapons suite adds real Baseq3 firing chains. Missionpack and whole-engine match execution remain open. G_Printf diagnostics are excluded."
            if entry["source"] == "code/game/g_missile.c":
                for symbol in entry["symbol_mapping"]:
                    symbol["scope"] = "Baseq3 native projectile rules and actual SV/CM. The weapons suite additionally connects real FireWeapon, quad scaling, ClientEvents/ClientThink and player_die. Missionpack and rendering remain open. Freed-projectile callback rejects invalid relinking instead of original server metadata aliasing."
            if entry["source"] == "code/game/g_items.c":
                for symbol in entry["symbol_mapping"]:
                    if symbol["original"] == "RegisterItem":
                        symbol["scope"] = "Baseq3 item registration bitset, used by shooters and actual map-item spawning. ClearRegisteredItems, SaveRegisteredItems and client precaching remain open."
                    elif symbol["original"] in ("G_BounceItem","G_RunItem"):
                        symbol["scope"] = "Actual dropped-item physics, collision, no-drop and frame dispatch are compared. The body suite separately covers the non-item corpse branch."
                    elif symbol["original"] == "G_ItemDisabled":
                        symbol["scope"] = "Local baseq3 disabled-item Cvar lookup is implemented. The native item oracle fixes these Cvars to zero, so nonzero Cvar parity remains open."
                    else:
                        symbol["scope"] = "Baseq3 map/drop lifecycle, pickup rules, events, targets, respawn and CTF take/return/capture effects are compared. Log and PrintMsg payloads end at explicit host callbacks; network delivery and Missionpack remain open."
            if entry["source"] == "code/game/g_main.c":
                for symbol in entry["symbol_mapping"]:
                    if symbol["original"] in ("SortRanks","CalculateRanks"):
                        symbol["scope"] = "Baseq3 client ranks with the tested native Windows UCRT sorting profile. The original four-write reset overruns the two team-vote counters; observed spawning/numSpawnVars clears use safe explicit field writes. QVM qsort ordering is separate. CalculateRanks calls actual exit decisions and defaults to ported intermission/level-exit orchestration; old isolated suites keep a transition override. Engine map execution remains open."
                    if symbol["original"] in ("CheckExitRules","LogExit","CheckIntermissionExit"):
                        symbol["scope"] = "Baseq3 decisions, state changes, configstrings and formatted message/log payloads. Ported BeginIntermission/ExitLevel are defaults, with real queue/readiness/timeout chains compared in the intermission suite; old isolated scores keep a transition override. No log-file timestamp/write, engine map execution or network delivery."
                    if symbol["original"] in ("MoveClientToIntermission","BeginIntermission","ExitLevel"):
                        symbol["target_files"] = ["src/mq3/game/intermission.ml"]
                        symbol["scope"] = "Unchanged Baseq3 intermission placement and level-exit orchestration. Actual StopFollowing, FindIntermissionPoint, tournament scores/loser removal, respawn/ClientSpawn/ClientBegin, scoreboards and session writes are integrated. All modeled client/entity states, camera, changemap, separate client limits, readiness and session Cvars are compared at each host effect/action. BotInterbreedEndMatch and single-player UpdateTournamentInfo/SpawnModelsOnVictoryPads remain required observed interfaces; spawn Think/EndFrame are isolated overrides in this suite. Engine console/Cvar/network delivery, actual map loading/restart and Missionpack are open."
            if entry["source"] == "code/game/g_cmds.c":
                for symbol in entry["symbol_mapping"]:
                    if symbol["original"] in ("gameNames","Cmd_CallVote_f","Cmd_Vote_f","Cmd_CallTeamVote_f","Cmd_TeamVote_f"):
                        symbol["target_files"] = ["src/mq3/game/vote_commands.ml"]
                        symbol["scope"] = "Unchanged Baseq3 global/team vote initiation and casting, native argv byte copies, permission order, original vote-count non-increment and msg[1] Yes quirks, map rotation, display strings, team target names/slots, flags and configstrings. Every callback and action compares all 64 client vote/leader states; complete call/cast/resolution chains are included. MiniLang reads actual engine nextmap registry and refreshes allowVote from registered VM Cvars. Original overflowing team strcat is safely rejected. Legacy vote suites override ClientUserinfoChanged; its ported default is integrated through real team-vote sequences in test_client_info.py. Full ClientCommand dispatch is separately ported and compared; command tokenization and engine/network command delivery remain boundaries."
                    elif symbol["original"] == "BroadcastTeamChange":
                        symbol["target_files"] = ["src/mq3/game/session.ml"]
                        symbol["scope"] = "All unchanged Baseq3 team announcement branches and exact cp payloads/recipient, including spectator suppression and the two autojoin announcements inside ClientConnect. Server command transport remains a boundary."
                    elif symbol["original"] in ("DeathmatchScoreboardMessage","Cmd_Score_f"):
                        symbol["target_files"] = ["src/mq3/game/scores.ml"]
                        symbol["scope"] = "Exact scoreboard command payload and recipient; transport callback observed. No network transmission or client display."
            if entry["source"] == "code/game/g_combat.c":
                for symbol in entry["symbol_mapping"]:
                    if symbol["original"] in ("TossClientItems","CheckAlmostCapture","CheckAlmostScored","player_die"):
                        symbol["scope"] = "Baseq3 death lifecycle with actual score, body, hook, collision, PVS, Drop_Item and Team_ReturnFlag integration. PrintMsg delivery remains an observed callback. The legacy death suite observes ClientSpawn; the team-change suite executes real body/death/item/ClientBegin/Spawn/rank chains and verifies zero-limit spectator iteration. No Missionpack or complete client/server frame."
            if entry["source"] == "code/game/g_team.c":
                for symbol in entry["symbol_mapping"]:
                    if symbol["original"] in ("Team_GetLocation","SortClients","TeamplayInfoMessage","CheckTeamStatus"):
                        symbol["target_files"] = ["src/mq3/game/team_status.ml"]
                        symbol["scope"] = "Unchanged Baseq3 location selection with actual CM PVS/area portals, binary32 distance/ties, strict 1000ms interval, two-pass updates and exact 32-member overlay packets. The original preliminary rank selection/sort is retained; its result is unused by the original output loop. Engine command delivery remains a callback; invalid client bindings/slots, cyclic chains and non-finite PVS inputs fail safely."
                    if symbol["original"] in ("OtherTeam","TeamName","Team_FragBonuses"):
                        symbol["scope"] = "Baseq3 team frag bonuses, including native carrier-defense vector reuse, actual scores and SV_inPVS; PrintMsg delivery is an observed callback."
                    if symbol["original"] in ("Team_SetFlagStatus","Team_CheckDroppedItem","Team_ResetFlag","Team_ReturnFlagSound","Team_ReturnFlag","Team_FreeEntity","Team_DroppedFlagThink"):
                        symbol["scope"] = "Baseq3 flag status configstrings, reset/return entities, global return sounds and dropped-flag timeout/no-drop behavior. PrintMsg transport remains an observed callback."
            if entry["source"] == "code/game/g_client.c":
                for symbol in entry["symbol_mapping"]:
                    if symbol["original"] == "ClientSpawn":
                        symbol["scope"] = "Baseq3 player placement, persistent/session preservation, transient reset, handicap, inventory, spawn filters, target/weapon/link order and snapshots are compared. Userinfo uses shared case-insensitive first-key lookup after the original 1023-byte trap copy, including truncated handicap digits. Ported ClientThink, ClientEndFrame and MoveClientToIntermission are defaults; separate integration suites exercise them while isolated tests retain overrides. Userinfo/usercmd and engine delivery remain boundaries."
                    elif symbol["original"] == "ClientBegin":
                        symbol["scope"] = "Baseq3 entry lifecycle with actual ported ClientSpawn and CalculateRanks: unlink/reinit, playerState reset, entry event/message/log, tournament and spectator branches. Engine delivery remains at explicit callbacks."
                    elif symbol["original"] == "ClientConnect":
                        symbol["target_files"] = ["src/mq3/game/client_connect.ml","src/mq3/game/entities.ml"]
                        symbol["scope"] = "Unchanged Baseq3 connection order: userinfo copy, IP decision, password rules based on the existing entity bot flag, persistent client rebinding/reset, actual session init/read, bot setup return, real UserinfoChanged, announcements and CalculateRanks. All 66 modeled client fields (including 117 playerState words), session storage and rank/configstring state are compared at every callback. Default IP decisions now use the separately compared real filter; legacy native connection fixtures retain an explicit decision override, with real default ban/whitelist paths covered by runtime contracts. Bot setup and userinfo/command/log delivery remain observed boundaries; no full engine connection transport or bot AI. ClientDisconnect is separately ported and compared."
                    elif symbol["original"] == "ClientDisconnect":
                        symbol["target_files"] = ["src/mq3/game/client_disconnect.ml"]
                        symbol["scope"] = "Unchanged Baseq3 engine callback: queued bot removal before NULL-client guard, actual StopFollowing, teleport-out and item/flag drops, tournament winner update, unlink/config clearing and CalculateRanks, then bot shutdown. Every effect and action compares all 66 modeled client fields (including 117 playerState words) in all slots and all allocated entityStates with selected private/spatial fields. Bot begin queue/shutdown and engine delivery remain explicit required interfaces; this is not the engine trap_DropClient implementation."
                    elif symbol["original"] == "TeamCount":
                        symbol["scope"] = "Baseq3 connected-client team counting, used by and compared through CheckTournament readiness decisions and PickTeam userinfo selection."
                    elif symbol["original"] in ("ClientCleanName","ClientUserinfoChanged","TeamLeader","PickTeam"):
                        symbol["target_files"] = ["src/mq3/game/client_info.ml"]
                        symbol["scope"] = "Unchanged Baseq3 name cleaning, userinfo update and team selection: byte/color/space limits, sticky local-client flag, prediction, rename order, handicap, team models, bot display team, overlay, exact player configstrings and log payloads. Full playerStates and relevant fields of all 64 clients are compared at delivery boundaries. Actual SetLeader/team-vote and overlay callers are integrated. ClientConnect and session persistence are separately compared, including noncanonical stored leader integers. Engine userinfo delivery, command/configstring network transport and log-file writes remain host boundaries; Missionpack is open."
                    if symbol["original"] == "respawn":
                        symbol["scope"] = "CopyToBodyQue and teleport event ordering are implemented; the default path executes ported ClientSpawn while the death suite retains an explicit test override."
            if entry["source"] == "code/game/g_active.c":
                for symbol in entry["symbol_mapping"]:
                    if symbol["original"] == "G_TouchTriggers":
                        symbol["target_files"] = ["src/mq3/game/triggers.ml"]
                    elif symbol["original"] in ("ClientImpacts","SpectatorThink","ClientInactivityTimer","ClientTimerActions","ClientIntermissionThink","ClientEvents","ClientThink_real","ClientThink","G_RunClient"):
                        symbol["target_files"] = ["src/mq3/game/client_active.ml"]
                        symbol["scope"] = "Baseq3 command clamping, Pmove/collision/trigger integration, spectators, inactivity, events, timers, snapshots, button latching and wrapper scheduling are compared against unchanged native bodies. Usercmd, Cvar, disconnect and AAS engine calls remain ordered callbacks. Weapon firing and gauntlet attacks now use the ported Baseq3 defaults, compared separately through real ClientEvents and ClientThink; legacy isolated tests retain explicit weapon overrides. Spectator attack uses the ported follow-cycle default, with actual Pmove/button-edge integration tested separately; legacy isolated tests retain a follow override. Missionpack is excluded."
                    else:
                        symbol["target_files"] = ["src/mq3/game/client_frame.ml"]
                        symbol["scope"] = "Baseq3 end-of-frame state, environment and spectator logic are compared against the unchanged native function bodies. The isolated suite observes ClientBegin for invalid explicit spectator targets; the normal path binds the separately verified port."
            if entry["source"] == "code/server/sv_game.c":
                for symbol in entry["symbol_mapping"]:
                    if symbol["original"] == "SV_inPVS":
                        symbol["scope"] = "Point cluster visibility plus area connectivity, used by and compared through Team_FragBonuses and Team_GetLocation, including explicit PVS masks and portal open/close sequences. Solid-only negative destination clusters are rejected safely instead of indexing before the C mask."
    # Narrow the new command helpers to their actual MiniLang definitions.
    for entry in ledger["files"]:
        for symbol in entry.get("symbol_mapping",[]):
            name=symbol["original"]
            if entry["source"]=="code/game/g_cmds.c":
                for target,names in command_groups.items():
                    if name in names:
                        symbol["target_files"]=[target]
                        symbol["scope"]="Complete Baseq3 ClientCommand routing and original chat, voice, taunt, cheat and utility handlers; already-tokenized argv uses native byte-copy/ConcatArgs bounds. All modeled clients, allocated entityStates and selected private/spatial state, votes, userinfo, configs and location chains are compared at every host effect and action. Real item pickup, death, teleport, intermission, follow/team and vote helpers are called. Com_sprintf diagnostics and userinfo writes are observed in order. Native undefined inputs are separate MiniLang rejection contracts. Engine tokenization/command buffering, network delivery, log-file writes, bot AI, Missionpack and whole-engine playability remain open."
            elif entry["source"]=="code/game/g_team.c" and name=="Team_GetLocationMsg":
                symbol["target_files"]=["src/mq3/game/team_status.ml"]
                symbol["scope"]="Original PVS location selection, nonzero count color clamping and mutation, MSVC null-string formatting, byte truncation and Com_sprintf diagnostics, compared through team chat and tells."
            elif entry["source"]=="code/game/q_shared.c" and name in ("Info_RemoveKey","Info_SetValueForKey"):
                symbol["target_files"]=["src/mq3/shared/info.ml"]
                symbol["scope"]="Case-sensitive first-key removal and value insertion at the front with original invalid-character, removal, formatting and size-check order. Compared through Cmd_TeamTask_f userinfo writes and actual ClientUserinfoChanged. Exactly 1024 bytes would overrun the native terminator and are rejected separately. MiniLang owns result strings; C pointer aliasing is not claimed."
            elif entry["source"]=="code/game/bg_misc.c" and name=="BG_FindItem":
                symbol["target_files"]=["src/mq3/game/utility_commands.ml"]
                symbol["scope"]="All 35 Baseq3 item pickup names, original order and ASCII case-insensitive matching, compared through give with real spawn/finish/touch/free. Missionpack items are excluded."
            elif entry["source"]=="code/game/g_utils.c" and name=="vtos":
                symbol["target_files"]=["src/mq3/game/entities.ml"]
                symbol["scope"]="Native truncating float-to-int position formatting and 32-byte Com_sprintf truncation/diagnostic, used by where and item startsolid diagnostics; owned strings replace the original rotating static buffers."
            elif entry["source"]=="ui/menudef.h":
                symbol["scope"]="The five Baseq3 voice-taunt string constants used by Cmd_VoiceTaunt_f. No UI, audio or Missionpack implementation is implied."
    for entry in ledger["files"]:
        if entry["source"]=="code/game/g_weapon.c":
            for symbol in entry["symbol_mapping"]:
                for target,names in weapon_groups.items():
                    if symbol["original"] in names:
                        symbol["target_files"]=[target]
                        symbol["scope"]="Unchanged Baseq3 server firing: persistent shared basis/muzzle/quad state, exact CRT and Q_rand spread, point traces, all ten weapons, actual damage/death/items, ordered effects, rail penetration/relink/awards and projectile scaling. ClientEvents and ClientThink use ported defaults. Full modeled clients/entityStates, selected private/spatial projectile fields and shared weapon vectors are compared at each trace/host effect/action, with final CRT random consumption. Undefined native inputs use separate Mini contracts. Engine delivery, module restart state transfer, Missionpack, client presentation and whole-game playability remain open."
    for entry in ledger["files"]:
        for target,names,checks,scope in startup_groups.get(entry["source"],[]):
            for symbol in entry["symbol_mapping"]:
                if symbol["original"] in names:
                    symbol["target_files"]=[target]
                    symbol["scope"]=scope
    path.write_text(json.dumps(ledger,indent=2)+"\n",encoding="utf-8",newline="\n")
    evidence=[]
    for path in sorted((ROOT / "build/reference").rglob("result.json")):
        if path.relative_to(ROOT).as_posix() in ("build/reference/collision/result.json","build/reference/movement/result.json"):
            continue # superseded by explicitly named curves/no_curves profiles
        result=json.loads(path.read_text(encoding="utf-8"))
        # A supplemental runtime report belongs only to its recorded full run.
        if "base_verification_sha256" in result:
            verification=ROOT / "build/verification.json"
            if not verification.exists() or result["base_verification_sha256"]!=sha(verification):continue
        evidence.append({"path":path.relative_to(ROOT).as_posix(),"sha256":sha(path),"result":result})
    replay=ROOT / "artifacts/reference/replay/result.json"
    if replay.exists():evidence.append({"path":replay.relative_to(ROOT).as_posix(),"sha256":sha(replay),"result":json.loads(replay.read_text(encoding="utf-8"))})
    verification=ROOT / "build/verification.json"
    if verification.exists():evidence.append({"path":verification.relative_to(ROOT).as_posix(),"sha256":sha(verification),"result":json.loads(verification.read_text(encoding="utf-8"))})
    sources={p.relative_to(ROOT).as_posix():sha(p) for base in ("src","native","scripts","tests") for p in sorted((ROOT / base).rglob("*"))
             if p.is_file() and "__pycache__" not in p.parts}
    report={"scope":"implemented foundations; full port incomplete","sources":sources,"evidence":evidence}
    (ROOT / "docs/reference/evidence.json").write_text(json.dumps(report,indent=2)+"\n",encoding="utf-8",newline="\n")
    print("Updated partial source mappings and recorded test evidence.")

if __name__=="__main__":main()
