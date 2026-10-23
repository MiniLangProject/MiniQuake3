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

struct Services context aasSetupFn eaSetupFn weaponSetupFn goalSetupFn chatSetupFn moveSetupFn chatShutdownFn moveShutdownFn goalShutdownFn weaponShutdownFn weightsShutdownFn charactersShutdownFn aasShutdownFn eaShutdownFn libvarsReleasedFn definesRemovedFn logShutdownFn checkSourcesFn aasStartFrameFn aasLoadMapFn initLevelItemsFn setBrushModelTypesFn aasUpdateEntityFn end struct
struct Api version top aas ea ai end struct

function services(context) return Services(context,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void) end function
function invoke(service,callback)
  if service==void or callback==void then return BLERR_NOERROR end if
  value=callback(service.context);if value==void then return BLERR_NOERROR end if;return value
end function
function invoke1(service,callback,value)
  if service==void or callback==void then return BLERR_NOERROR end if
  result=callback(service.context,value);if result==void then return BLERR_NOERROR end if;return result
end function
function invoke2(service,callback,first,second)
  if service==void or callback==void then return BLERR_NOERROR end if
  result=callback(service.context,first,second);if result==void then return BLERR_NOERROR end if;return result
end function

// Sys_MilliSeconds uses clock() rather than wall time in the original.  The
// deterministic form accepts the two clock values explicitly.
function Sys_MilliSeconds(clockValue,clocksPerSecond) if clocksPerSecond<=0 then return 0 end if;return n.trunc32(clockValue*1000/clocksPerSecond) end function
function ValidClientNumber(state,number) return state!=void and number>=0 and number<=state.maxclients end function
function ValidEntityNumber(state,number) return state!=void and number>=0 and number<=state.maxentities end function
function BotLibSetup(state) return state!=void and state.setup end function

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
function Export_BotLibVarSet(state,name,value) return botLifecycleRuntime.varSet(state,name,value) end function
function Export_BotLibVarGet(state,name,size)
  if size<=0 then return "" end if
  value=botLifecycleRuntime.varGet(state,name);data=bytes(value);count=len(data);if count>=size then count=size-1 end if;return decode(slice(data,0,count))
end function
function Export_BotLibStartFrame(state,time,service)
  if not BotLibSetup(state) then return BLERR_LIBRARYNOTSETUP end if
  if service==void then service=services(void) end if
  result=invoke1(service,service.aasStartFrameFn,time);if result!=BLERR_NOERROR then return result end if
  state.time=time;state.frames=state.frames+1;return BLERR_NOERROR
end function
function Export_BotLibLoadMap(state,mapName,service)
  if not BotLibSetup(state) then return BLERR_LIBRARYNOTSETUP end if
  if service==void then service=services(void) end if
  if mapName==void then mapName="" end if
  result=invoke1(service,service.aasLoadMapFn,mapName);if result!=BLERR_NOERROR then return result end if
  result=invoke(service,service.initLevelItemsFn);if result!=BLERR_NOERROR then return result end if
  result=invoke(service,service.setBrushModelTypesFn);if result!=BLERR_NOERROR then return result end if
  state.mapName=mapName;state.mapLoads=state.mapLoads+1;return BLERR_NOERROR
end function
function Export_BotLibUpdateEntity(state,entity,present,service)
  if not BotLibSetup(state) then return BLERR_LIBRARYNOTSETUP end if
  if service==void then service=services(void) end if
  if not ValidEntityNumber(state,entity) then return BLERR_INVALIDENTITYNUMBER end if
  result=invoke2(service,service.aasUpdateEntityFn,entity,present);if result!=BLERR_NOERROR then return result end if
  state.entityUpdates=state.entityUpdates+1;if not present then state.removedEntities=state.removedEntities+1 end if;return BLERR_NOERROR
end function
function BotExportTest(parm0,parm1,parm2,parm3) return 0 end function

function PC_AddGlobalDefine(registry,text) return pc.addDefine(registry,text) end function
function PC_LoadSourceHandle(registry,name) return pc.load(registry,name) end function
function PC_FreeSourceHandle(registry,handle) return pc.free(registry,handle) end function
function PC_ReadTokenHandle(registry,handle) return pc.read(registry,handle) end function
function PC_SourceFileAndLine(registry,handle) return pc.location(registry,handle) end function
function PC_CheckOpenSourceHandles(registry)
  if registry==void then return 0 end if;count=0
  for handle=1 to pc.MAX_SOURCEFILES-1 if registry.sources[handle]!=0 then count=count+1 end if end for;return count
end function

function topExports() return [["BotLibSetup","Export_BotLibSetup"],["BotLibShutdown","Export_BotLibShutdown"],["BotLibVarSet","Export_BotLibVarSet"],["BotLibVarGet","Export_BotLibVarGet"],["PC_AddGlobalDefine","PC_AddGlobalDefine"],["PC_LoadSourceHandle","PC_LoadSourceHandle"],["PC_FreeSourceHandle","PC_FreeSourceHandle"],["PC_ReadTokenHandle","PC_ReadTokenHandle"],["PC_SourceFileAndLine","PC_SourceFileAndLine"],["BotLibStartFrame","Export_BotLibStartFrame"],["BotLibLoadMap","Export_BotLibLoadMap"],["BotLibUpdateEntity","Export_BotLibUpdateEntity"],["Test","BotExportTest"]] end function
function aasExports() return [["AAS_EntityInfo","AAS_EntityInfo"],["AAS_Initialized","AAS_Initialized"],["AAS_PresenceTypeBoundingBox","AAS_PresenceTypeBoundingBox"],["AAS_Time","AAS_Time"],["AAS_PointAreaNum","AAS_PointAreaNum"],["AAS_PointReachabilityAreaIndex","AAS_PointReachabilityAreaIndex"],["AAS_TraceAreas","AAS_TraceAreas"],["AAS_BBoxAreas","AAS_BBoxAreas"],["AAS_AreaInfo","AAS_AreaInfo"],["AAS_PointContents","AAS_PointContents"],["AAS_NextBSPEntity","AAS_NextBSPEntity"],["AAS_ValueForBSPEpairKey","AAS_ValueForBSPEpairKey"],["AAS_VectorForBSPEpairKey","AAS_VectorForBSPEpairKey"],["AAS_FloatForBSPEpairKey","AAS_FloatForBSPEpairKey"],["AAS_IntForBSPEpairKey","AAS_IntForBSPEpairKey"],["AAS_AreaReachability","AAS_AreaReachability"],["AAS_AreaTravelTimeToGoalArea","AAS_AreaTravelTimeToGoalArea"],["AAS_EnableRoutingArea","AAS_EnableRoutingArea"],["AAS_PredictRoute","AAS_PredictRoute"],["AAS_AlternativeRouteGoals","AAS_AlternativeRouteGoals"],["AAS_Swimming","AAS_Swimming"],["AAS_PredictClientMovement","AAS_PredictClientMovement"]] end function
function eaExports() return [["EA_Command","EA_Command"],["EA_Say","EA_Say"],["EA_SayTeam","EA_SayTeam"],["EA_Action","EA_Action"],["EA_Gesture","EA_Gesture"],["EA_Talk","EA_Talk"],["EA_Attack","EA_Attack"],["EA_Use","EA_Use"],["EA_Respawn","EA_Respawn"],["EA_Crouch","EA_Crouch"],["EA_MoveUp","EA_MoveUp"],["EA_MoveDown","EA_MoveDown"],["EA_MoveForward","EA_MoveForward"],["EA_MoveBack","EA_MoveBack"],["EA_MoveLeft","EA_MoveLeft"],["EA_MoveRight","EA_MoveRight"],["EA_SelectWeapon","EA_SelectWeapon"],["EA_Jump","EA_Jump"],["EA_DelayedJump","EA_DelayedJump"],["EA_Move","EA_Move"],["EA_View","EA_View"],["EA_GetInput","EA_GetInput"],["EA_EndRegular","EA_EndRegular"],["EA_ResetInput","EA_ResetInput"]] end function
function aiExports() return [["BotLoadCharacter","BotLoadCharacter"],["BotFreeCharacter","BotFreeCharacter"],["Characteristic_Float","Characteristic_Float"],["Characteristic_BFloat","Characteristic_BFloat"],["Characteristic_Integer","Characteristic_Integer"],["Characteristic_BInteger","Characteristic_BInteger"],["Characteristic_String","Characteristic_String"],["BotAllocChatState","BotAllocChatState"],["BotFreeChatState","BotFreeChatState"],["BotQueueConsoleMessage","BotQueueConsoleMessage"],["BotRemoveConsoleMessage","BotRemoveConsoleMessage"],["BotNextConsoleMessage","BotNextConsoleMessage"],["BotNumConsoleMessages","BotNumConsoleMessages"],["BotInitialChat","BotInitialChat"],["BotNumInitialChats","BotNumInitialChats"],["BotReplyChat","BotReplyChat"],["BotChatLength","BotChatLength"],["BotEnterChat","BotEnterChat"],["BotGetChatMessage","BotGetChatMessage"],["StringContains","StringContains"],["BotFindMatch","BotFindMatch"],["BotMatchVariable","BotMatchVariable"],["UnifyWhiteSpaces","UnifyWhiteSpaces"],["BotReplaceSynonyms","BotReplaceSynonyms"],["BotLoadChatFile","BotLoadChatFile"],["BotSetChatGender","BotSetChatGender"],["BotSetChatName","BotSetChatName"],["BotResetGoalState","BotResetGoalState"],["BotResetAvoidGoals","BotResetAvoidGoals"],["BotRemoveFromAvoidGoals","BotRemoveFromAvoidGoals"],["BotPushGoal","BotPushGoal"],["BotPopGoal","BotPopGoal"],["BotEmptyGoalStack","BotEmptyGoalStack"],["BotDumpAvoidGoals","BotDumpAvoidGoals"],["BotDumpGoalStack","BotDumpGoalStack"],["BotGoalName","BotGoalName"],["BotGetTopGoal","BotGetTopGoal"],["BotGetSecondGoal","BotGetSecondGoal"],["BotChooseLTGItem","BotChooseLTGItem"],["BotChooseNBGItem","BotChooseNBGItem"],["BotTouchingGoal","BotTouchingGoal"],["BotItemGoalInVisButNotVisible","BotItemGoalInVisButNotVisible"],["BotGetLevelItemGoal","BotGetLevelItemGoal"],["BotGetNextCampSpotGoal","BotGetNextCampSpotGoal"],["BotGetMapLocationGoal","BotGetMapLocationGoal"],["BotAvoidGoalTime","BotAvoidGoalTime"],["BotSetAvoidGoalTime","BotSetAvoidGoalTime"],["BotInitLevelItems","BotInitLevelItems"],["BotUpdateEntityItems","BotUpdateEntityItems"],["BotLoadItemWeights","BotLoadItemWeights"],["BotFreeItemWeights","BotFreeItemWeights"],["BotInterbreedGoalFuzzyLogic","BotInterbreedGoalFuzzyLogic"],["BotSaveGoalFuzzyLogic","BotSaveGoalFuzzyLogic"],["BotMutateGoalFuzzyLogic","BotMutateGoalFuzzyLogic"],["BotAllocGoalState","BotAllocGoalState"],["BotFreeGoalState","BotFreeGoalState"],["BotResetMoveState","BotResetMoveState"],["BotMoveToGoal","BotMoveToGoal"],["BotMoveInDirection","BotMoveInDirection"],["BotResetAvoidReach","BotResetAvoidReach"],["BotResetLastAvoidReach","BotResetLastAvoidReach"],["BotReachabilityArea","BotReachabilityArea"],["BotMovementViewTarget","BotMovementViewTarget"],["BotPredictVisiblePosition","BotPredictVisiblePosition"],["BotAllocMoveState","BotAllocMoveState"],["BotFreeMoveState","BotFreeMoveState"],["BotInitMoveState","BotInitMoveState"],["BotAddAvoidSpot","BotAddAvoidSpot"],["BotChooseBestFightWeapon","BotChooseBestFightWeapon"],["BotGetWeaponInfo","BotGetWeaponInfo"],["BotLoadWeaponWeights","BotLoadWeaponWeights"],["BotAllocWeaponState","BotAllocWeaponState"],["BotFreeWeaponState","BotFreeWeaponState"],["BotResetWeaponState","BotResetWeaponState"],["GeneticParentsAndChildSelection","GeneticParentsAndChildSelection"]] end function

function GetBotLibAPI(apiVersion,importValid)
  if not importValid or apiVersion!=BOTLIB_API_VERSION then return void end if
  return Api(apiVersion,topExports(),aasExports(),eaExports(),aiExports())
end function
