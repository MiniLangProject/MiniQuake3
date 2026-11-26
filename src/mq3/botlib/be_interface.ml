// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native ownership facade for code/botlib/be_interface.c.  The
// productive QVM host uses these entry points for lifecycle, libvar and
// precompiler traps while the nested export tables document the exact API v2
// surface handed to the original game module.
package mq3.botlib.be_interface

import mq3.botlib.public_headers as publicHeaders
import mq3.botlib.lifecycle_runtime as botLifecycleRuntime
import mq3.vm.pc_parser as pc
import mq3.compat.numeric as n

const BOTLIB_API_VERSION=publicHeaders.BOTLIB_API_VERSION
const BLERR_NOERROR=publicHeaders.BLERR_NOERROR
const BLERR_LIBRARYNOTSETUP=publicHeaders.BLERR_LIBRARYNOTSETUP
const BLERR_INVALIDENTITYNUMBER=publicHeaders.BLERR_INVALIDENTITYNUMBER

/// `Services` record for be interface, containing `context`, `aasSetupFn`, `eaSetupFn`, `weaponSetupFn` and `goalSetupFn` and related fields.
struct Services context aasSetupFn eaSetupFn weaponSetupFn goalSetupFn chatSetupFn moveSetupFn chatShutdownFn moveShutdownFn goalShutdownFn weaponShutdownFn weightsShutdownFn charactersShutdownFn aasShutdownFn eaShutdownFn libvarsReleasedFn definesRemovedFn logShutdownFn checkSourcesFn aasStartFrameFn aasLoadMapFn initLevelItemsFn setBrushModelTypesFn aasUpdateEntityFn end struct
/// `Api` record for be interface, containing `version`, `top`, `aas`, `ea` and `ai`.
struct Api version top aas ea ai end struct

/// Create a `mq3.botlib.be_interface.Services` record, initializing `context` from `context`.
/// @param context Context forwarded to the configured host callbacks.
function services(context) return Services(context,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void) end function
/// Call an optional host service with its context and normalize missing or void results to BLERR_NOERROR.
/// @param service Service record; accesses `context`.
/// @param callback Callback invoked by this operation.
function invoke(service,callback)
  if service==void or callback==void then return BLERR_NOERROR end if
  value=callback(service.context);if value==void then return BLERR_NOERROR end if;return value
end function
/// Call an optional one-argument host service and normalize missing or void results to BLERR_NOERROR.
/// @param service Service record; accesses `context`.
/// @param callback Callback invoked by this operation.
/// @param value Value passed as argument 2 to `callback`.
function invoke1(service,callback,value)
  if service==void or callback==void then return BLERR_NOERROR end if
  result=callback(service.context,value);if result==void then return BLERR_NOERROR end if;return result
end function
/// Call an optional two-argument host service and normalize missing or void results to BLERR_NOERROR.
/// @param service Service record; accesses `context`.
/// @param callback Callback invoked by this operation.
/// @param first Value passed as argument 2 to `callback`.
/// @param second Value passed as argument 3 to `callback`.
function invoke2(service,callback,first,second)
  if service==void or callback==void then return BLERR_NOERROR end if
  result=callback(service.context,first,second);if result==void then return BLERR_NOERROR end if;return result
end function

// Sys_MilliSeconds uses clock() rather than wall time in the original.  The
// deterministic form accepts the two clock values explicitly.
/// @param clockValue Operand used to evaluate the returned expression `n.trunc32(clockValue*1000/clocksPerSecond)`.
/// @param clocksPerSecond Operand used to evaluate the returned expression `n.trunc32(clockValue*1000/clocksPerSecond)`.
function Sys_MilliSeconds(clockValue,clocksPerSecond) if clocksPerSecond<=0 then return 0 end if;return n.trunc32(clockValue*1000/clocksPerSecond) end function
/// Test `state!=void and number>=0 and number<=state.maxclients` as the condition for `ValidClientNumber`.
/// @param state Be interface state; accesses `maxclients`.
/// @param number Operand used to evaluate the returned expression `state!=void and number>=0 and number<=state.maxclients`.
function ValidClientNumber(state,number) return state!=void and number>=0 and number<=state.maxclients end function
/// Test `state!=void and number>=0 and number<=state.maxentities` as the condition for `ValidEntityNumber`.
/// @param state Be interface state; accesses `maxentities`.
/// @param number Operand used to evaluate the returned expression `state!=void and number>=0 and number<=state.maxentities`.
function ValidEntityNumber(state,number) return state!=void and number>=0 and number<=state.maxentities end function
/// Test `state!=void and state.setup` as the condition for `BotLibSetup`.
/// @param state Be interface state; accesses `setup`.
function BotLibSetup(state) return state!=void and state.setup end function

/// Update `state.developer`, `state.setup`, `state.maxclients` and `state.maxentities` and related state during `Export_BotLibSetup`. Return paths include `BLERR_NOERROR`.
/// @param state Be interface state; accesses `developer`, `setup`, `maxclients`, `maxentities` and `mapName` and related fields. May update `state.developer`, `state.setup` and `state.maxclients` and additional fields in place.
/// @param service Service record; accesses `aasSetupFn`, `eaSetupFn`, `weaponSetupFn`, `goalSetupFn` and `chatSetupFn` and related fields.
function Export_BotLibSetup(state,service)
  if state==void then return BLERR_LIBRARYNOTSETUP end if
  if service==void then service=services(void) end if
  state.developer=botLifecycleRuntime.integerVariable(state,"bot_developer",0)
  // memset(botlibglobals) resets transient state but intentionally leaves the
  // separately allocated libvar list alive.
  state.setup=false;state.maxclients=botLifecycleRuntime.integerVariable(state,"maxclients",128);state.maxentities=botLifecycleRuntime.integerVariable(state,"maxentities",1024)
  state.mapName="";state.mapLoads=0;state.frames=0;state.time=0.0;state.entityUpdates=0;state.removedEntities=0
  callbacks=[service.aasSetupFn,service.eaSetupFn,service.weaponSetupFn,service.goalSetupFn,service.chatSetupFn,service.moveSetupFn]
  for each callback in callbacks result=invoke(service,callback);if result!=BLERR_NOERROR then return result end if end for
  state.setup=true;return BLERR_NOERROR
end function
/// Apply `mq3.botlib.be_interface.BotLibSetup`, `mq3.botlib.be_interface.services` and `mq3.botlib.be_interface.invoke` while evaluating `Export_BotLibShutdown`.
/// @param state Be interface state; accesses `setup`.
/// @param service Service record; accesses `chatShutdownFn`, `moveShutdownFn`, `goalShutdownFn`, `weaponShutdownFn` and `weightsShutdownFn` and related fields.
/// @param registry Registry record; accesses `defines`. May update `registry.defines` in place.
function Export_BotLibShutdown(state,service,registry)
  if not BotLibSetup(state) then return BLERR_LIBRARYNOTSETUP end if
  if service==void then service=services(void) end if
  callbacks=[service.chatShutdownFn,service.moveShutdownFn,service.goalShutdownFn,service.weaponShutdownFn,service.weightsShutdownFn,service.charactersShutdownFn,service.aasShutdownFn,service.eaShutdownFn]
  for each callback in callbacks invoke(service,callback) end for
  // The C shutdown always releases all libvars and global precompiler defines,
  // even when a subsystem's void shutdown hook has nothing allocated.
  result=botLifecycleRuntime.shutdown(state);invoke(service,service.libvarsReleasedFn)
  if registry!=void then pc.clearDefines(registry) end if;invoke(service,service.definesRemovedFn);invoke(service,service.logShutdownFn);PC_CheckOpenSourceHandles(registry);invoke(service,service.checkSourcesFn);return result
end function
/// Forward `Export_BotLibVarSet` to `mq3.botlib.lifecycle_runtime.varSet` and return the delegated result.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
/// @param value Text to parse, format or deliver.
function Export_BotLibVarSet(state,name,value) return botLifecycleRuntime.varSet(state,name,value) end function
/// Apply `mq3.botlib.lifecycle_runtime.varGet` while evaluating `Export_BotLibVarGet`. Return paths include `decode(slice(data,0,count))`.
/// @param state Lib variables state; accesses `variables`.
/// @param name Name used to identify the requested entry.
/// @param size Size or capacity supplied to the buffer operation.
function Export_BotLibVarGet(state,name,size)
  if size<=0 then return "" end if
  value=botLifecycleRuntime.varGet(state,name);data=bytes(value);count=len(data);if count>=size then count=size-1 end if;return decode(slice(data,0,count))
end function
/// Set `state.time` to `time` and `state.frames` to `state.frames+1` in `mq3.botlib.be_interface.Export_BotLibStartFrame`. Return paths include `BLERR_NOERROR`.
/// @param state Be interface state; accesses `time` and `frames`. May update `state.time` and `state.frames` in place.
/// @param time Time value in the units expected by this module.
/// @param service Service record; accesses `aasStartFrameFn`.
function Export_BotLibStartFrame(state,time,service)
  if not BotLibSetup(state) then return BLERR_LIBRARYNOTSETUP end if
  if service==void then service=services(void) end if
  result=invoke1(service,service.aasStartFrameFn,time);if result!=BLERR_NOERROR then return result end if
  state.time=time;state.frames=state.frames+1;return BLERR_NOERROR
end function
/// Set `state.mapName` to `mapName` and `state.mapLoads` to `state.mapLoads+1` in `mq3.botlib.be_interface.Export_BotLibLoadMap`. Return paths include `BLERR_NOERROR`.
/// @param state Be interface state; accesses `mapName` and `mapLoads`. May update `state.mapName` and `state.mapLoads` in place.
/// @param mapName Value passed as argument 2 to `callback`.
/// @param service Service record; accesses `aasLoadMapFn`, `initLevelItemsFn` and `setBrushModelTypesFn`.
function Export_BotLibLoadMap(state,mapName,service)
  if not BotLibSetup(state) then return BLERR_LIBRARYNOTSETUP end if
  if service==void then service=services(void) end if
  if mapName==void then mapName="" end if
  result=invoke1(service,service.aasLoadMapFn,mapName);if result!=BLERR_NOERROR then return result end if
  result=invoke(service,service.initLevelItemsFn);if result!=BLERR_NOERROR then return result end if
  result=invoke(service,service.setBrushModelTypesFn);if result!=BLERR_NOERROR then return result end if
  state.mapName=mapName;state.mapLoads=state.mapLoads+1;return BLERR_NOERROR
end function
/// Set `state.entityUpdates` to `state.entityUpdates+1` and `state.removedEntities` to `state.removedEntities+1` in `mq3.botlib.be_interface.Export_BotLibUpdateEntity`. Return paths include `BLERR_NOERROR`.
/// @param state Be interface state; accesses `entityUpdates` and `removedEntities`. May update `state.entityUpdates` and `state.removedEntities` in place.
/// @param entity Operand used to evaluate the returned expression `state!=void and number>=0 and number<=state.maxentities`.
/// @param present Value passed as argument 3 to `callback`.
/// @param service Service record; accesses `aasUpdateEntityFn`.
function Export_BotLibUpdateEntity(state,entity,present,service)
  if not BotLibSetup(state) then return BLERR_LIBRARYNOTSETUP end if
  if service==void then service=services(void) end if
  if not ValidEntityNumber(state,entity) then return BLERR_INVALIDENTITYNUMBER end if
  result=invoke2(service,service.aasUpdateEntityFn,entity,present);if result!=BLERR_NOERROR then return result end if
  state.entityUpdates=state.entityUpdates+1;if not present then state.removedEntities=state.removedEntities+1 end if;return BLERR_NOERROR
end function
// The QVM host has no aasUpdateEntity callback: it applies the entity state
// immediately after the lifecycle check. Avoid constructing an empty Services
// object for the 1024 entity slots visited on every original bot frame.
/// @param state Be interface state; accesses `entityUpdates` and `removedEntities`. May update `state.entityUpdates` and `state.removedEntities` in place.
/// @param entity Operand used to evaluate the returned expression `state!=void and number>=0 and number<=state.maxentities`.
/// @param present Value used by `Export_BotLibUpdateEntityPlain` in `if not present then state.removedEntities=state.removedEntities+1 end if`.
function Export_BotLibUpdateEntityPlain(state,entity,present)
  if not BotLibSetup(state) then return BLERR_LIBRARYNOTSETUP end if
  if not ValidEntityNumber(state,entity) then return BLERR_INVALIDENTITYNUMBER end if
  state.entityUpdates=state.entityUpdates+1;if not present then state.removedEntities=state.removedEntities+1 end if;return BLERR_NOERROR
end function
/// Return `0` for `BotExportTest`.
/// @param parm0 Not read by this implementation; retained in the `BotExportTest` signature.
/// @param parm1 Not read by this implementation; retained in the `BotExportTest` signature.
/// @param parm2 Not read by this implementation; retained in the `BotExportTest` signature.
/// @param parm3 Not read by this implementation; retained in the `BotExportTest` signature.
function BotExportTest(parm0,parm1,parm2,parm3) return 0 end function

/// Forward `PC_AddGlobalDefine` to `mq3.vm.pc_parser.addDefine` and return the delegated result.
/// @param registry Registry record; accesses `defines`. May update `registry.defines` and `registry.defines[index]` in place.
/// @param text Text to parse, format or deliver.
function PC_AddGlobalDefine(registry,text) return pc.addDefine(registry,text) end function
/// Forward `PC_LoadSourceHandle` to `mq3.vm.pc_parser.load` and return the delegated result.
/// @param registry Registry record; accesses `loadFn`, `sources` and `context`. May update `registry.sources[slot]` in place.
/// @param name Name used to identify the requested entry.
function PC_LoadSourceHandle(registry,name) return pc.load(registry,name) end function
/// Forward `PC_FreeSourceHandle` to `mq3.vm.pc_parser.free` and return the delegated result.
/// @param registry Registry record; accesses `sources`. May update `registry.sources[handle]` in place.
/// @param handle Handle identifying the allocated preprocessor source.
function PC_FreeSourceHandle(registry,handle) return pc.free(registry,handle) end function
/// Forward `PC_ReadTokenHandle` to `mq3.vm.pc_parser.read` and return the delegated result.
/// @param registry Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place.
/// @param handle Resource handle resolved by the owning pool or host service.
function PC_ReadTokenHandle(registry,handle) return pc.read(registry,handle) end function
/// Forward `PC_SourceFileAndLine` to `mq3.vm.pc_parser.location` and return the delegated result.
/// @param registry Registry record; accesses `sources`.
/// @param handle Handle identifying the allocated preprocessor source.
function PC_SourceFileAndLine(registry,handle) return pc.location(registry,handle) end function
/// Count open source handles in the shared preprocessor registry.
/// @param registry Registry record; accesses `sources`.
function PC_CheckOpenSourceHandles(registry)
  if registry==void then return 0 end if;count=0
  for handle=1 to pc.MAX_SOURCEFILES-1 if registry.sources[handle]!=0 then count=count+1 end if end for;return count
end function

/// Return the ordered top exports table for be interface: 13 entries beginning with `["BotLibSetup","Export_BotLibSetup"]` and `["BotLibShutdown","Export_BotLibShutdown"]`.
function topExports() return [["BotLibSetup","Export_BotLibSetup"],["BotLibShutdown","Export_BotLibShutdown"],["BotLibVarSet","Export_BotLibVarSet"],["BotLibVarGet","Export_BotLibVarGet"],["PC_AddGlobalDefine","PC_AddGlobalDefine"],["PC_LoadSourceHandle","PC_LoadSourceHandle"],["PC_FreeSourceHandle","PC_FreeSourceHandle"],["PC_ReadTokenHandle","PC_ReadTokenHandle"],["PC_SourceFileAndLine","PC_SourceFileAndLine"],["BotLibStartFrame","Export_BotLibStartFrame"],["BotLibLoadMap","Export_BotLibLoadMap"],["BotLibUpdateEntity","Export_BotLibUpdateEntity"],["Test","BotExportTest"]] end function
/// Return the ordered aas exports table for be interface: 22 entries beginning with `["AAS_EntityInfo","AAS_EntityInfo"]` and `["AAS_Initialized","AAS_Initialized"]`.
function aasExports() return [["AAS_EntityInfo","AAS_EntityInfo"],["AAS_Initialized","AAS_Initialized"],["AAS_PresenceTypeBoundingBox","AAS_PresenceTypeBoundingBox"],["AAS_Time","AAS_Time"],["AAS_PointAreaNum","AAS_PointAreaNum"],["AAS_PointReachabilityAreaIndex","AAS_PointReachabilityAreaIndex"],["AAS_TraceAreas","AAS_TraceAreas"],["AAS_BBoxAreas","AAS_BBoxAreas"],["AAS_AreaInfo","AAS_AreaInfo"],["AAS_PointContents","AAS_PointContents"],["AAS_NextBSPEntity","AAS_NextBSPEntity"],["AAS_ValueForBSPEpairKey","AAS_ValueForBSPEpairKey"],["AAS_VectorForBSPEpairKey","AAS_VectorForBSPEpairKey"],["AAS_FloatForBSPEpairKey","AAS_FloatForBSPEpairKey"],["AAS_IntForBSPEpairKey","AAS_IntForBSPEpairKey"],["AAS_AreaReachability","AAS_AreaReachability"],["AAS_AreaTravelTimeToGoalArea","AAS_AreaTravelTimeToGoalArea"],["AAS_EnableRoutingArea","AAS_EnableRoutingArea"],["AAS_PredictRoute","AAS_PredictRoute"],["AAS_AlternativeRouteGoals","AAS_AlternativeRouteGoals"],["AAS_Swimming","AAS_Swimming"],["AAS_PredictClientMovement","AAS_PredictClientMovement"]] end function
/// Return the ordered ea exports table for be interface: 24 entries beginning with `["EA_Command","EA_Command"]` and `["EA_Say","EA_Say"]`.
function eaExports() return [["EA_Command","EA_Command"],["EA_Say","EA_Say"],["EA_SayTeam","EA_SayTeam"],["EA_Action","EA_Action"],["EA_Gesture","EA_Gesture"],["EA_Talk","EA_Talk"],["EA_Attack","EA_Attack"],["EA_Use","EA_Use"],["EA_Respawn","EA_Respawn"],["EA_Crouch","EA_Crouch"],["EA_MoveUp","EA_MoveUp"],["EA_MoveDown","EA_MoveDown"],["EA_MoveForward","EA_MoveForward"],["EA_MoveBack","EA_MoveBack"],["EA_MoveLeft","EA_MoveLeft"],["EA_MoveRight","EA_MoveRight"],["EA_SelectWeapon","EA_SelectWeapon"],["EA_Jump","EA_Jump"],["EA_DelayedJump","EA_DelayedJump"],["EA_Move","EA_Move"],["EA_View","EA_View"],["EA_GetInput","EA_GetInput"],["EA_EndRegular","EA_EndRegular"],["EA_ResetInput","EA_ResetInput"]] end function
/// Return the ordered ai exports table for be interface: 75 entries beginning with `["BotLoadCharacter","BotLoadCharacter"]` and `["BotFreeCharacter","BotFreeCharacter"]`.
function aiExports() return [["BotLoadCharacter","BotLoadCharacter"],["BotFreeCharacter","BotFreeCharacter"],["Characteristic_Float","Characteristic_Float"],["Characteristic_BFloat","Characteristic_BFloat"],["Characteristic_Integer","Characteristic_Integer"],["Characteristic_BInteger","Characteristic_BInteger"],["Characteristic_String","Characteristic_String"],["BotAllocChatState","BotAllocChatState"],["BotFreeChatState","BotFreeChatState"],["BotQueueConsoleMessage","BotQueueConsoleMessage"],["BotRemoveConsoleMessage","BotRemoveConsoleMessage"],["BotNextConsoleMessage","BotNextConsoleMessage"],["BotNumConsoleMessages","BotNumConsoleMessages"],["BotInitialChat","BotInitialChat"],["BotNumInitialChats","BotNumInitialChats"],["BotReplyChat","BotReplyChat"],["BotChatLength","BotChatLength"],["BotEnterChat","BotEnterChat"],["BotGetChatMessage","BotGetChatMessage"],["StringContains","StringContains"],["BotFindMatch","BotFindMatch"],["BotMatchVariable","BotMatchVariable"],["UnifyWhiteSpaces","UnifyWhiteSpaces"],["BotReplaceSynonyms","BotReplaceSynonyms"],["BotLoadChatFile","BotLoadChatFile"],["BotSetChatGender","BotSetChatGender"],["BotSetChatName","BotSetChatName"],["BotResetGoalState","BotResetGoalState"],["BotResetAvoidGoals","BotResetAvoidGoals"],["BotRemoveFromAvoidGoals","BotRemoveFromAvoidGoals"],["BotPushGoal","BotPushGoal"],["BotPopGoal","BotPopGoal"],["BotEmptyGoalStack","BotEmptyGoalStack"],["BotDumpAvoidGoals","BotDumpAvoidGoals"],["BotDumpGoalStack","BotDumpGoalStack"],["BotGoalName","BotGoalName"],["BotGetTopGoal","BotGetTopGoal"],["BotGetSecondGoal","BotGetSecondGoal"],["BotChooseLTGItem","BotChooseLTGItem"],["BotChooseNBGItem","BotChooseNBGItem"],["BotTouchingGoal","BotTouchingGoal"],["BotItemGoalInVisButNotVisible","BotItemGoalInVisButNotVisible"],["BotGetLevelItemGoal","BotGetLevelItemGoal"],["BotGetNextCampSpotGoal","BotGetNextCampSpotGoal"],["BotGetMapLocationGoal","BotGetMapLocationGoal"],["BotAvoidGoalTime","BotAvoidGoalTime"],["BotSetAvoidGoalTime","BotSetAvoidGoalTime"],["BotInitLevelItems","BotInitLevelItems"],["BotUpdateEntityItems","BotUpdateEntityItems"],["BotLoadItemWeights","BotLoadItemWeights"],["BotFreeItemWeights","BotFreeItemWeights"],["BotInterbreedGoalFuzzyLogic","BotInterbreedGoalFuzzyLogic"],["BotSaveGoalFuzzyLogic","BotSaveGoalFuzzyLogic"],["BotMutateGoalFuzzyLogic","BotMutateGoalFuzzyLogic"],["BotAllocGoalState","BotAllocGoalState"],["BotFreeGoalState","BotFreeGoalState"],["BotResetMoveState","BotResetMoveState"],["BotMoveToGoal","BotMoveToGoal"],["BotMoveInDirection","BotMoveInDirection"],["BotResetAvoidReach","BotResetAvoidReach"],["BotResetLastAvoidReach","BotResetLastAvoidReach"],["BotReachabilityArea","BotReachabilityArea"],["BotMovementViewTarget","BotMovementViewTarget"],["BotPredictVisiblePosition","BotPredictVisiblePosition"],["BotAllocMoveState","BotAllocMoveState"],["BotFreeMoveState","BotFreeMoveState"],["BotInitMoveState","BotInitMoveState"],["BotAddAvoidSpot","BotAddAvoidSpot"],["BotChooseBestFightWeapon","BotChooseBestFightWeapon"],["BotGetWeaponInfo","BotGetWeaponInfo"],["BotLoadWeaponWeights","BotLoadWeaponWeights"],["BotAllocWeaponState","BotAllocWeaponState"],["BotFreeWeaponState","BotFreeWeaponState"],["BotResetWeaponState","BotResetWeaponState"],["GeneticParentsAndChildSelection","GeneticParentsAndChildSelection"]] end function

/// Build the `mq3.botlib.be_interface.Api` result for `GetBotLibAPI`. Return paths include `Api(apiVersion,topExports(),aasExports(),eaExports(),aiExports())`.
/// @param apiVersion Initial value stored in `mq3.botlib.be_interface.Api.version`.
/// @param importValid Value used by `GetBotLibAPI` in `if not importValid or apiVersion!=BOTLIB_API_VERSION then return void end if`.
function GetBotLibAPI(apiVersion,importValid)
  if not importValid or apiVersion!=BOTLIB_API_VERSION then return void end if
  return Api(apiVersion,topExports(),aasExports(),eaExports(),aiExports())
end function
