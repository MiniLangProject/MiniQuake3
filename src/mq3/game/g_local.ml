// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Shared local-game contract from code/game/g_local.h.  The live Entity,
// Client and Level objects remain in mq3.game.entities; this module owns the
// header-wide constants, enum ordinals and bounded-storage contracts used by
// the split native MiniLang game implementation.
package mq3.game.g_local

/// Game-module name used for server identification and compatibility checks.
const GAMEVERSION="baseq3"
/// Number of reusable corpse entities kept in the body queue.
const BODY_QUEUE_SIZE=8
/// Sentinel for a duration or quantity that should not expire through normal counting.
const INFINITE=1000000
/// Nominal game frame duration in milliseconds.
const FRAMETIME=100
/// Kill-to-kill interval in milliseconds that qualifies for the carnage reward.
const CARNAGE_REWARD_TIME=3000
/// Duration in milliseconds for which a player reward sprite remains visible.
const REWARD_SPRITE_TIME=2000
/// Delay in milliseconds before the ordinary match intermission.
const INTERMISSION_DELAY_TIME=1000
/// Delay in milliseconds before the single-player intermission presentation.
const SP_INTERMISSION_DELAY_TIME=5000

/// Game entity-flag bit enabling or marking godmode.
const FL_GODMODE=0x00000010
/// Game entity-flag bit enabling or marking notarget.
const FL_NOTARGET=0x00000020
/// Game entity-flag bit enabling or marking teamslave.
const FL_TEAMSLAVE=0x00000400
/// Game entity-flag bit enabling or marking no knockback.
const FL_NO_KNOCKBACK=0x00000800
/// Game entity-flag bit enabling or marking dropped item.
const FL_DROPPED_ITEM=0x00001000
/// Game entity-flag bit enabling or marking no bots.
const FL_NO_BOTS=0x00002000
/// Game entity-flag bit enabling or marking no humans.
const FL_NO_HUMANS=0x00004000
/// Game entity-flag bit enabling or marking force gesture.
const FL_FORCE_GESTURE=0x00008000

/// Mover-state identifier representing the pos1 position or transition.
const MOVER_POS1=0
/// Mover-state identifier representing the pos2 position or transition.
const MOVER_POS2=1
/// Mover-state identifier representing the 1 to2 position or transition.
const MOVER_1TO2=2
/// Mover-state identifier representing the 2 to1 position or transition.
const MOVER_2TO1=3
/// Model resource used for the single-player victory podium.
const SP_PODIUM_MODEL="models/mapobjects/podium/podium4.md3"

/// Client connection-state identifier representing disconnected.
const CON_DISCONNECTED=0
/// Client connection-state identifier representing connecting.
const CON_CONNECTING=1
/// Client connection-state identifier representing connected.
const CON_CONNECTED=2
/// Spectator-state identifier selecting not.
const SPECTATOR_NOT=0
/// Spectator-state identifier selecting free.
const SPECTATOR_FREE=1
/// Spectator-state identifier selecting follow.
const SPECTATOR_FOLLOW=2
/// Spectator-state identifier selecting scoreboard.
const SPECTATOR_SCOREBOARD=3
/// Player team-state value used before normal active team play begins.
const TEAM_BEGIN=0
/// Player team-state value used during normal active team play.
const TEAM_ACTIVE=1
/// Spectator sentinel selecting the first automatically chosen active player.
const FOLLOW_ACTIVE1=-1
/// Spectator sentinel selecting the second automatically chosen active player.
const FOLLOW_ACTIVE2=-2

/// Upper bound on player name represented by mq3.game.g_local.
const MAX_NETNAME=36
/// Upper bound on vote count represented by mq3.game.g_local.
const MAX_VOTE_COUNT=3
/// Upper bound on spawn vars represented by mq3.game.g_local.
const MAX_SPAWN_VARS=64
/// Upper bound on spawn vars chars represented by mq3.game.g_local.
const MAX_SPAWN_VARS_CHARS=4096

/// Damage-processing flag enabling radius.
const DAMAGE_RADIUS=0x00000001
/// Damage-processing flag enabling no armor.
const DAMAGE_NO_ARMOR=0x00000002
/// Damage-processing flag enabling no knockback.
const DAMAGE_NO_KNOCKBACK=0x00000004
/// Damage-processing flag enabling no protection.
const DAMAGE_NO_PROTECTION=0x00000008
/// Damage-processing flag enabling no team protection.
const DAMAGE_NO_TEAM_PROTECTION=0x00000010
/// Upper bound on filepath represented by mq3.game.g_local.
const MAX_FILEPATH=144

// Managed mirrors for the records which are independent from the much larger
// live Entity/Client/Level aggregates.  Opaque engine records are retained as
// ordinary values, just as the other MiniLang game facades do.
struct PlayerTeamState
  /// Team participation state selected from TEAM_BEGIN and TEAM_ACTIVE.
  state
  /// Team-location identifier associated with the player state.
  location
  /// Number of flag captures credited to the player.
  captures
  /// Count of base-defense awards credited to the player.
  basedefense
  /// Count of flag-carrier defense awards credited to the player.
  carrierdefense
  /// Number of own-flag recoveries credited to the player.
  flagrecovery
  /// Number of enemy flag-carrier kills credited to the player.
  fragcarrier
  /// Number of capture assists credited to the player.
  assists
  /// Timestamp at which this player last damaged the flag carrier.
  lasthurtcarrier
  /// Timestamp at which the player last returned its team flag.
  lastreturnedflag
  /// Timestamp at which the player started carrying the flag.
  flagsince
  /// Timestamp at which this player last killed an enemy flag carrier.
  lastfraggedcarrier
end struct
/// `ClientSession` record for g local, containing `sessionTeam`, `spectatorTime`, `spectatorState`, `spectatorClient` and `wins` and related fields.
struct ClientSession
  /// Team assignment retained in the client session.
  sessionTeam
  /// Timestamp used to order spectators waiting to enter play.
  spectatorTime
  /// Spectator mode selected from the SPECTATOR_* constants.
  spectatorState
  /// Client slot being followed by a spectator.
  spectatorClient
  /// Tournament wins retained in the client session.
  wins
  /// Tournament losses retained in the client session.
  losses
  /// Nonzero when this client is the designated leader of its team.
  teamLeader
end struct
/// `ClientPersistant` record for g local, containing `connected`, `cmd`, `localClient`, `initialSpawn` and `predictItemPickup` and related fields.
struct ClientPersistant
  /// Client connection state used to distinguish disconnected, connecting, and active clients.
  connected
  /// Current user-command input supplied to movement or client processing.
  cmd
  /// Nonzero when this client is the local listen-server client.
  localClient
  /// Nonzero while selecting or performing the client first spawn.
  initialSpawn
  /// Nonzero when the client is allowed to predict item pickups.
  predictItemPickup
  /// Nonzero when player movement uses a fixed simulation step.
  pmoveFixed
  /// Player name advertised in user information and score/chat messages.
  netname
  /// Maximum normal health used when spawning or replenishing the client.
  maxHealth
  /// Game timestamp at which the client entered play.
  enterTime
  /// Shared bot team-decision state.
  teamState
  /// Number of global votes initiated by the client.
  voteCount
  /// Number of team votes initiated by the client.
  teamVoteCount
  /// Nonzero when this client requests team-overlay information.
  teamInfo
end struct
/// `BotSettings` record for g local, containing `characterfile`, `skill` and `team`.
struct BotSettings
  /// Path of the bot-character definition used to configure this bot.
  characterfile
  /// Configured bot skill level supplied to character and decision logic.
  skill
  /// Team assignment associated with the client, bot, or action.
  team
end struct

/// Return the ordered type names table for g local: 11 entries beginning with `"moverState_t"` and `"gentity_t"`.
function typeNames() return ["moverState_t","gentity_t","gclient_t","clientConnected_t","spectatorState_t","playerTeamStateState_t","playerTeamState_t","clientSession_t","clientPersistant_t","level_locals_t","bot_settings_t"] end function
/// Return the ordered entity field names table for g local: 69 entries beginning with `"s"` and `"r"`.
function entityFieldNames() return ["s","r","client","inuse","classname","spawnflags","neverFree","flags","model","model2","freetime","eventTime","freeAfterEvent","unlinkAfterEvent","physicsObject","physicsBounce","clipmask","moverState","soundPos1","sound1to2","sound2to1","soundPos2","soundLoop","parent","nextTrain","prevTrain","pos1","pos2","message","timestamp","angle","target","targetname","team","targetShaderName","targetShaderNewName","target_ent","speed","movedir","nextthink","think","reached","blocked","touch","use","pain","die","pain_debounce_time","fly_sound_debounce_time","last_move_time","health","takedamage","damage","splashDamage","splashRadius","methodOfDeath","splashMethodOfDeath","count","chain","enemy","activator","teamchain","teammaster","watertype","waterlevel","noise_index","wait","random","item"] end function
/// Return the ordered client field names table for g local: 32 entries beginning with `"ps"` and `"pers"`.
function clientFieldNames() return ["ps","pers","sess","readyToExit","noclip","lastCmdTime","buttons","oldbuttons","latched_buttons","oldOrigin","damage_armor","damage_blood","damage_knockback","damage_from","damage_fromWorld","accurateCount","accuracy_shots","accuracy_hits","lastkilled_client","lasthurt_client","lasthurt_mod","respawnTime","inactivityTime","inactivityWarning","rewardTime","airOutTime","lastKillTime","fireHeld","hook","switchTeamTime","timeResidual","areabits"] end function
/// Return the ordered level field names table for g local: 51 entries beginning with `"clients"` and `"gentities"`.
function levelFieldNames() return ["clients","gentities","gentitySize","num_entities","warmupTime","logFile","maxclients","framenum","time","previousTime","startTime","teamScores","lastTeamLocationTime","newSession","restarted","numConnectedClients","numNonSpectatorClients","numPlayingClients","sortedClients","follow1","follow2","snd_fry","warmupModificationCount","voteString","voteDisplayString","voteTime","voteExecuteTime","voteYes","voteNo","numVotingClients","teamVoteString","teamVoteTime","teamVoteYes","teamVoteNo","numteamVotingClients","spawning","numSpawnVars","spawnVars","numSpawnVarChars","spawnVarChars","intermissionQueued","intermissiontime","changemap","readyToExit","exitTime","intermission_origin","intermission_angle","locationLinked","locationHead","bodyQueIndex","bodyQue"] end function

/// Test `state>=MOVER_POS1 and state<=MOVER_2TO1` as the condition for `validMoverState`.
/// @param state Operand used to evaluate the returned expression `state>=MOVER_POS1 and state<=MOVER_2TO1`.
function validMoverState(state) return state>=MOVER_POS1 and state<=MOVER_2TO1 end function
/// Test `clientNum==FOLLOW_ACTIVE1 or clientNum==FOLLOW_ACTIVE2` as the condition for `isFollowSentinel`.
/// @param clientNum Client slot number.
function isFollowSentinel(clientNum) return clientNum==FOLLOW_ACTIVE1 or clientNum==FOLLOW_ACTIVE2 end function
/// Test `(flags&DAMAGE_NO_ARMOR)==0 and (flags&DAMAGE_NO_PROTECTION)==0` as the condition for `damageUsesArmor`.
/// @param flags Operand used to evaluate the returned expression `(flags&DAMAGE_NO_ARMOR)==0 and (flags&DAMAGE_NO_PROTECTION)==0`.
function damageUsesArmor(flags) return (flags&DAMAGE_NO_ARMOR)==0 and (flags&DAMAGE_NO_PROTECTION)==0 end function
/// Test `pairCount>=0 and pairCount<=MAX_SPAWN_VARS and charCount>=0 and charCount<=MAX_SPAWN_VARS_CHARS` as the condition for `validSpawnStorage`.
/// @param pairCount Operand used to evaluate the returned expression `pairCount>=0 and pairCount<=MAX_SPAWN_VARS and charCount>=0 and charCount<=MAX_SPAWN_VARS_CHARS`.
/// @param charCount Operand used to evaluate the returned expression `pairCount>=0 and pairCount<=MAX_SPAWN_VARS and charCount>=0 and charCount<=MAX_SPAWN_VARS_CHARS`.
function validSpawnStorage(pairCount,charCount) return pairCount>=0 and pairCount<=MAX_SPAWN_VARS and charCount>=0 and charCount<=MAX_SPAWN_VARS_CHARS end function
/// Advance a valid body-queue slot with circular wraparound and reject an out-of-range slot.
/// @param slot Slot in the owning table or pool.
function nextBodyQueueSlot(slot) if slot<0 or slot>=BODY_QUEUE_SIZE then return error(7955,"g_local.h: invalid body queue slot") end if;return (slot+1)%BODY_QUEUE_SIZE end function
/// Apply `mq3.game.g_local.entityFieldNames` while evaluating `FOFS`.
/// @param fieldName Value used by `FOFS` in `if fields[index]==fieldName then return index end if`.
function FOFS(fieldName)
  fields=entityFieldNames()
  for index=0 to len(fields)-1
    if fields[index]==fieldName then return index end if
  end for
  return error(7955,"g_local.h: unknown entity field")
end function

// Complete declaration inventory for static parity checks. Calls are routed to
// their owning game, syscall, bot or AAS module rather than duplicated here.
function declarationNames() return ["G_SpawnString","G_SpawnFloat","G_SpawnInt","G_SpawnVector","G_SpawnEntitiesFromString","G_NewString","Cmd_Score_f","StopFollowing","BroadcastTeamChange","SetTeam","Cmd_FollowCycle_f","G_CheckTeamItems","G_RunItem","RespawnItem","UseHoldableItem","PrecacheItem","Drop_Item","LaunchItem","SetRespawn","G_SpawnItem","FinishSpawningItem","Think_Weapon","ArmorIndex","Add_Ammo","Touch_Item","ClearRegisteredItems","RegisterItem","SaveRegisteredItems","G_ModelIndex","G_SoundIndex","G_TeamCommand","G_KillBox","G_Find","G_PickTarget","G_UseTargets","G_SetMovedir","G_InitGentity","G_Spawn","G_TempEntity","G_Sound","G_FreeEntity","G_EntitiesFree","G_TouchTriggers","G_TouchSolids","tv","vtos","vectoyaw","G_AddPredictableEvent","G_AddEvent","G_SetOrigin","AddRemap","BuildShaderStateConfig","CanDamage","G_Damage","G_RadiusDamage","G_InvulnerabilityEffect","body_die","TossClientItems","TossClientPersistantPowerups","TossClientCubes","G_RunMissile","fire_blaster","fire_plasma","fire_grenade","fire_rocket","fire_bfg","fire_grapple","fire_nail","fire_prox","G_RunMover","Touch_DoorTrigger","trigger_teleporter_touch","TeleportPlayer","DropPortalSource","DropPortalDestination","LogAccuracyHit","CalcMuzzlePoint","SnapVectorTowards","CheckGauntletAttack","Weapon_HookFree","Weapon_HookThink","TeamCount","TeamLeader","PickTeam","SetClientViewAngle","SelectSpawnPoint","CopyToBodyQue","respawn","BeginIntermission","InitClientPersistant","InitClientResp","InitBodyQue","ClientSpawn","player_die","AddScore","CalculateRanks","SpotWouldTelefrag","ConsoleCommand","G_ProcessIPBans","G_FilterPacket","FireWeapon","G_StartKamikaze","MoveClientToIntermission","G_SetStats","DeathmatchScoreboardMessage","FindIntermissionPoint","SetLeader","CheckTeamLeader","G_RunThink","G_LogPrintf","SendScoreboardMessageToAllClients","G_Printf","G_Error","ClientConnect","ClientUserinfoChanged","ClientDisconnect","ClientBegin","ClientCommand","ClientThink","ClientEndFrame","G_RunClient","OnSameTeam","Team_CheckDroppedItem","CheckObeliskAttack","G_Alloc","G_InitMemory","Svcmd_GameMem_f","G_ReadSessionData","G_InitSessionData","G_InitWorldSession","G_WriteSessionData","UpdateTournamentInfo","SpawnModelsOnVictoryPads","Svcmd_AbortPodium_f","G_InitBots","G_GetBotInfoByNumber","G_GetBotInfoByName","G_CheckBotSpawn","G_RemoveQueuedBotBegin","G_BotConnect","Svcmd_AddBot_f","Svcmd_BotList_f","BotInterbreedEndMatch","BotAISetup","BotAIShutdown","BotAILoadMap","BotAISetupClient","BotAIShutdownClient","BotAIStartFrame","BotTestAAS","trap_Printf","trap_Error","trap_Milliseconds","trap_Argc","trap_Argv","trap_Args","trap_FS_FOpenFile","trap_FS_Read","trap_FS_Write","trap_FS_FCloseFile","trap_FS_GetFileList","trap_FS_Seek","trap_SendConsoleCommand","trap_Cvar_Register","trap_Cvar_Update","trap_Cvar_Set","trap_Cvar_VariableIntegerValue","trap_Cvar_VariableValue","trap_Cvar_VariableStringBuffer","trap_LocateGameData","trap_DropClient","trap_SendServerCommand","trap_SetConfigstring","trap_GetConfigstring","trap_GetUserinfo","trap_SetUserinfo","trap_GetServerinfo","trap_SetBrushModel","trap_Trace","trap_PointContents","trap_InPVS","trap_InPVSIgnorePortals","trap_AdjustAreaPortalState","trap_AreasConnected","trap_LinkEntity","trap_UnlinkEntity","trap_EntitiesInBox","trap_EntityContact","trap_BotAllocateClient","trap_BotFreeClient","trap_GetUsercmd","trap_GetEntityToken","trap_DebugPolygonCreate","trap_DebugPolygonDelete","trap_BotLibSetup","trap_BotLibShutdown","trap_BotLibVarSet","trap_BotLibVarGet","trap_BotLibDefine","trap_BotLibStartFrame","trap_BotLibLoadMap","trap_BotLibUpdateEntity","trap_BotLibTest","trap_BotGetSnapshotEntity","trap_BotGetServerCommand","trap_BotUserCommand","trap_AAS_BBoxAreas","trap_AAS_AreaInfo","trap_AAS_EntityInfo","trap_AAS_Initialized","trap_AAS_PresenceTypeBoundingBox","trap_AAS_Time","trap_AAS_PointAreaNum","trap_AAS_PointReachabilityAreaIndex","trap_AAS_TraceAreas","trap_AAS_PointContents","trap_AAS_NextBSPEntity","trap_AAS_ValueForBSPEpairKey","trap_AAS_VectorForBSPEpairKey","trap_AAS_FloatForBSPEpairKey","trap_AAS_IntForBSPEpairKey","trap_AAS_AreaReachability","trap_AAS_AreaTravelTimeToGoalArea","trap_AAS_EnableRoutingArea","trap_AAS_PredictRoute","trap_AAS_AlternativeRouteGoals","trap_AAS_Swimming","trap_AAS_PredictClientMovement","trap_EA_Say","trap_EA_SayTeam","trap_EA_Command","trap_EA_Action","trap_EA_Gesture","trap_EA_Talk","trap_EA_Attack","trap_EA_Use","trap_EA_Respawn","trap_EA_Crouch","trap_EA_MoveUp","trap_EA_MoveDown","trap_EA_MoveForward","trap_EA_MoveBack","trap_EA_MoveLeft","trap_EA_MoveRight","trap_EA_SelectWeapon","trap_EA_Jump","trap_EA_DelayedJump","trap_EA_Move","trap_EA_View","trap_EA_EndRegular","trap_EA_GetInput","trap_EA_ResetInput","trap_BotLoadCharacter","trap_BotFreeCharacter","trap_Characteristic_Float","trap_Characteristic_BFloat","trap_Characteristic_Integer","trap_Characteristic_BInteger","trap_Characteristic_String","trap_BotAllocChatState","trap_BotFreeChatState","trap_BotQueueConsoleMessage","trap_BotRemoveConsoleMessage","trap_BotNextConsoleMessage","trap_BotNumConsoleMessages","trap_BotInitialChat","trap_BotNumInitialChats","trap_BotReplyChat","trap_BotChatLength","trap_BotEnterChat","trap_BotGetChatMessage","trap_StringContains","trap_BotFindMatch","trap_BotMatchVariable","trap_UnifyWhiteSpaces","trap_BotReplaceSynonyms","trap_BotLoadChatFile","trap_BotSetChatGender","trap_BotSetChatName","trap_BotResetGoalState","trap_BotRemoveFromAvoidGoals","trap_BotResetAvoidGoals","trap_BotPushGoal","trap_BotPopGoal","trap_BotEmptyGoalStack","trap_BotDumpAvoidGoals","trap_BotDumpGoalStack","trap_BotGoalName","trap_BotGetTopGoal","trap_BotGetSecondGoal","trap_BotChooseLTGItem","trap_BotChooseNBGItem","trap_BotTouchingGoal","trap_BotItemGoalInVisButNotVisible","trap_BotGetNextCampSpotGoal","trap_BotGetMapLocationGoal","trap_BotGetLevelItemGoal","trap_BotAvoidGoalTime","trap_BotSetAvoidGoalTime","trap_BotInitLevelItems","trap_BotUpdateEntityItems","trap_BotLoadItemWeights","trap_BotFreeItemWeights","trap_BotInterbreedGoalFuzzyLogic","trap_BotSaveGoalFuzzyLogic","trap_BotMutateGoalFuzzyLogic","trap_BotAllocGoalState","trap_BotFreeGoalState","trap_BotResetMoveState","trap_BotMoveToGoal","trap_BotMoveInDirection","trap_BotResetAvoidReach","trap_BotResetLastAvoidReach","trap_BotReachabilityArea","trap_BotMovementViewTarget","trap_BotPredictVisiblePosition","trap_BotAllocMoveState","trap_BotFreeMoveState","trap_BotInitMoveState","trap_BotAddAvoidSpot","trap_BotChooseBestFightWeapon","trap_BotGetWeaponInfo","trap_BotLoadWeaponWeights","trap_BotAllocWeaponState","trap_BotFreeWeaponState","trap_BotResetWeaponState","trap_GeneticParentsAndChildSelection","trap_SnapVector"] end function
