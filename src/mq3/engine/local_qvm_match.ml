// SPDX-License-Identifier: GPL-2.0-or-later
// In-process Baseq3 QVM match host. This is the bridge from the engine services
// to the retail qagame/cgame modules, independent of the playable preview.
package mq3.engine.local_qvm_match

import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.shared.parser as parser
import mq3.qcommon.cvar as cvar
import mq3.qcommon.cvar_commands as cvarCommands
import mq3.qcommon.command_buffer as commands
import mq3.vm.runtime as runtime
import mq3.vm.syscall_common as common
import mq3.vm.syscall_qagame as qagame
import mq3.vm.syscall_qagame_world as qworld
import mq3.server.game_vm as gameVm
import mq3.game.entitystate as entitystate
import mq3.game.playerstate as playerstate
import mq3.game.constants as gameConstants
import mq3.vm.syscall_cgame as cgameSyscall
import mq3.vm.cgame_key_traps as cgameKeys
import mq3.vm.cgame_pc_traps as cgamePc
import mq3.vm.cgame_misc_traps as cgameMisc
import mq3.client.cgame_vm as cgameVm
import mq3.client.server_command_stream as serverCommandStream
import mq3.client.ui_vm as uiVm
import mq3.client.ui_host_lifecycle as uiHost
import mq3.vm.syscall_ui as uiSyscall
import mq3.vm.syscall_ui_media as uiMedia
import mq3.compat.numeric as n
import mq3.renderer.scene_queue as sceneQueue
import mq3.renderer.command_queue as renderQueue
import mq3.collision.world as collision
import mq3.collision.visibility as visibility
import mq3.server.world as serverWorld
import mq3.server.snapshot_build as snapshotBuild
import mq3.botlib.lifecycle_runtime as botlibRuntime
import mq3.botlib.aas_runtime as aasRuntime
import mq3.botlib.aas_routing as aasRouting
import mq3.botlib.aas_routing_cache as aasRoutingCache
import mq3.botlib.aas_route_extras as aasRouteExtras
import mq3.botlib.aas_route_extra_syscalls as aasRouteExtraSyscalls
import mq3.botlib.aas_syscalls as aasSyscalls
import mq3.botlib.aas_entities as aasEntities
import mq3.botlib.aas_query_syscalls as aasQuerySyscalls
import mq3.botlib.aas_movement_queries as aasMovementQueries
import mq3.format.aas as aasFormat
import mq3.botlib.elementary_actions as elementaryActions
import mq3.botlib.elementary_action_syscalls as elementaryActionSyscalls
import mq3.botlib.ai_characters as aiCharacters
import mq3.botlib.ai_character_syscalls as aiCharacterSyscalls
import mq3.botlib.ai_resource_pools as aiResourcePools
import mq3.botlib.ai_resource_syscalls as aiResourceSyscalls
import mq3.botlib.ai_chat_profiles as aiChatProfiles
import mq3.botlib.ai_chat_syscalls as aiChatSyscalls
import mq3.botlib.ai_console_messages as aiConsoleMessages
import mq3.botlib.ai_item_weights as aiItemWeights
import mq3.botlib.ai_item_weight_syscalls as aiItemWeightSyscalls
import mq3.botlib.ai_level_items as aiLevelItems
import mq3.botlib.ai_goal_state as aiGoalState
import mq3.botlib.ai_goal_state_syscalls as aiGoalStateSyscalls
import mq3.botlib.ai_goal_selection as aiGoalSelection
import mq3.botlib.ai_goal_selection_syscalls as aiGoalSelectionSyscalls
import mq3.botlib.ai_chat_strings as aiChatStrings
import mq3.botlib.ai_chat_string_syscalls as aiChatStringSyscalls
import mq3.botlib.ai_chat_matches as aiChatMatches
import mq3.botlib.ai_chat_match_syscalls as aiChatMatchSyscalls
import mq3.botlib.ai_chat_output as aiChatOutput
import mq3.botlib.ai_chat_output_syscalls as aiChatOutputSyscalls
import mq3.botlib.ai_chat_goal_tail as aiChatGoalTail
import mq3.botlib.ai_chat_goal_tail_syscalls as aiChatGoalTailSyscalls
import mq3.botlib.ai_move_runtime as aiMoveRuntime
import mq3.botlib.ai_move_syscalls as aiMoveSyscalls
import mq3.botlib.ai_predict_visible_position as aiPredictVisible
import mq3.botlib.ai_predict_visible_position_syscalls as aiPredictVisibleSyscalls
import mq3.botlib.ai_map_goals as aiMapGoals
import mq3.botlib.ai_map_goal_syscalls as aiMapGoalSyscalls
import mq3.botlib.ai_weapon_weights as aiWeaponWeights
import mq3.botlib.ai_weapon_weight_syscalls as aiWeaponWeightSyscalls
import mq3.botlib.ai_weapon_combat as aiWeaponCombat
import mq3.botlib.ai_weapon_combat_syscalls as aiWeaponCombatSyscalls
import mq3.botlib.ai_avoid_spots as aiAvoidSpots
import mq3.botlib.ai_avoid_spot_syscalls as aiAvoidSpotSyscalls
import mq3.botlib.server_bridge as botServerBridge
import mq3.botlib.aas_client_movement as aasClientMovement
import mq3.botlib.aas_client_trace as aasClientTrace
import mq3.botlib.aas_client_movement_syscalls as aasClientMovementSyscalls
import mq3.botlib.aas_trace_areas as aasTraceAreas
import mq3.renderer.playable_light_grid as lightGrid
import mq3.renderer.model_tags as modelTags
import mq3.renderer.model_bounds as modelBounds
import mq3.renderer.mark_fragments as markFragments
import mq3.renderer.qvm_scene_geometry as qvmSceneGeometry
import mq3.renderer.shader_remap as shaderRemap
import mq3.renderer.pvs_query as rendererPvs
import mq3.qcommon.memory_file_seek as memoryFileSeek
import mq3.format.md3 as md3
import mq3.vm.font_abi as fontAbi
import mq3.vm.pc_parser as pcParser
import mq3.client.cinematic_runtime as cinematics
import mq3.client.cgame_usercmd as cgameUsercmd
import mq3.client.command_ring as matchCommandRing
import mq3.client.cgame_console_commands as nativeCgameCommands
import mq3.client.cgame_snapshot as nativeCgameSnapshot
import mq3.client.cgame_predict as nativeCgamePredict
import mq3.game.movement as nativeMovement
import mq3.game.trajectory as gameTrajectory
import mq3.client.cgame_event as nativeCgameEvent
import mq3.client.cgame_playerstate as nativeCgamePlayerstate
import mq3.client.cgame_ents as nativeCgameEnts
import mq3.client.cgame_localents as nativeCgameLocalents
import mq3.client.cgame_effects as nativeCgameEffects
import mq3.client.cgame_weapons as nativeCgameWeapons
import mq3.client.cgame_view as nativeCgameView
import mq3.client.cgame_drawtools as nativeCgameDrawtools
import mq3.client.cgame_draw as nativeCgameDraw
import mq3.client.cgame_particles as nativeCgameParticles
import mq3.client.cgame_servercmds as nativeCgameServercmds
import mq3.client.cgame_main as nativeCgameMain
import mq3.client.cgame_marks as nativeCgameMarks
import mq3.client.cgame_players as nativeCgamePlayers
import mq3.client.key_bindings_config as bindingConfig
import mq3.client.console_input as consoleInput
import mq3.client.cl_console as clientConsole
import mq3.client.ui_lan_browser as uiLan
import mq3.client.ui_lan_cache as uiLanCache
import mq3.client.ui_lan_ingress as uiLanIngress
import mq3.client.ui_lan_queries as uiLanQueries
import mq3.client.ui_lan_udp as uiLanUdp
import std.fs as fs
import std.string as strings

const MAX_CONFIGSTRINGS=1024
const MAX_CLIENTS=8
// The pinned 1.32b g_public.h intentionally embeds entityState_t at the start
// of entityShared_t. gentity_t consequently contains s followed by r.s and the
// engine-owned shared fields below. These are QVM byte offsets, not host layout.
const R_LINKED=416
const R_LINKCOUNT=420
const R_SVFLAGS=424
const R_SINGLECLIENT=428
const R_BMODEL=432
const R_MINS=436
const R_MAXS=448
const R_CONTENTS=460
const R_ABSMIN=464
const R_ABSMAX=476
const R_CURRENTORIGIN=488
const R_CURRENTANGLES=500
const R_OWNERNUM=512

struct FileCursor data offset end struct
struct Refdef x y width height fovX fovY vieworg viewaxis time flags areaMask end struct
struct SoundCommand kind entity channel handle origin velocity axis flag text text2 end struct
struct RenderView refdef scene end struct
struct Context archive entityParser cvars commandState configstrings userinfos usercmds files nextFile prints errors console gameEntities gameClients entityCount entityStride clientStride now frames linked assets assetKinds modelAssets renderCommands soundCommands latestSnapshot snapshotNumber latestRefdef scene renderQueue qvmRoot collisionWorld spatialScene machineRuntime commandNumber usercmdHistory cgameCollisionQueries cgameTagQueries lightGrid uiKeyCatcher uiFrames renderViews markMap fontRegistry pcRegistry cinematics cgameTrapCounts botlib aas aasRouter aasRouteCache aasCachePath botBspEntities shaderRemaps clientStates botAllocations botFrees elementaryActions lastBotTrap aasEntities aiCharacters aiResources aasMovement aiItemWeights aiChat aiWeaponWeights botServer aiConsole rendererEntityTokens aiLevelItems aiGoalState aiGoalSelection aiChatStrings aiChatMatches aiChatGoalTail aiMoveRuntime aiVisiblePosition aiChatOutput aiMapGoals uiLan cgameKeys uiLanCacheHost cgameUsercmd uiLanIngress uiLanQueries uiLanUdp cgameServerCommands uiClient nativeCgameCommands clientTextInput nativeSnapshots nativePlayerState nativeEvents nativeEntities nativeLocalEntities nativeEffects nativeWeapons nativeView nativeDrawtools nativeDraw nativeParticles nativeServerCmds nativeMain nativeMarks nativePlayers end struct
struct Boot game runtime context cgame ui end struct
struct Snapshot serverTime playerState entities end struct

function fail(message) return error(7640,"local QVM match: "+message) end function

function imageLoader(services,path)
  if services.context.qvmRoot!="" then
    data=try(fs.readAllBytes(services.context.qvmRoot+"/"+path));if not (data is error) then return data end if
    encoded=bytes(path);if len(encoded)>3 then shortPath=decode(slice(encoded,3,len(encoded)-3));data=try(fs.readAllBytes(services.context.qvmRoot+"/"+shortPath));if not (data is error) then return data end if end if
  end if
  data=try(pk3.read(services.context.archive,path));if data is error then return void end if;return data
end function
function loadVm(machineRuntime,name,syscall) return runtime.load(machineRuntime,name,syscall) end function
function callVm(machineRuntime,slot,args) return runtime.call(machineRuntime,slot,args) end function
function restartVm(machineRuntime,slot) return runtime.restart(machineRuntime,slot) end function
function freeVm(machineRuntime,slot) return runtime.free(machineRuntime,slot) end function
function loadClientVm(machineRuntime,name,syscall,interpret) return runtime.load(machineRuntime,name,syscall) end function
function milliseconds(context) return context.now end function
function emitPrint(context,text) context.prints=context.prints+[text];if context.clientTextInput!=void and context.clientTextInput.consoleRuntime!=void then context.clientTextInput.consoleRuntime.realtime=context.now;clientConsole.CL_ConsolePrint(context.clientTextInput.consoleRuntime,text,640) end if;return void end function
function emitError(context,text) context.errors=context.errors+[text];return void end function
function consoleCommand(context,when,text)
  context.console=context.console+[[when,text]]
  command=strings.trim(text);parts=strings.split(command," ");if len(parts)==0 then return void end if
  name=strings.toLowerAscii(parts[0])
  if context.uiLanQueries!=void then uiLanQueries.setRealtime(context.uiLanQueries,context.now) end if
  if name=="localservers" and context.uiLanQueries!=void then return uiLanQueries.scanLocal(context.uiLanQueries) end if
  if name=="globalservers" and len(parts)>=3 and context.uiLanQueries!=void then
    master=toNumber(parts[1]);keywords=[];if len(parts)>3 then for index=3 to len(parts)-1 if parts[index]!="" then keywords=keywords+[parts[index]] end if end for end if
    return uiLanQueries.scanGlobal(context.uiLanQueries,master,parts[2],keywords,false)
  end if
  return commands.executeText(context.commandState,when,text)
end function
function consoleInputCommand(context,text) return commands.addText(context.commandState,text) end function
function consoleInputReliable(context,text) sendClientCommand(context,text);return void end function
function syncConsoleInputCatcher(context) context.uiKeyCatcher=context.clientTextInput.catcher;cgameKeys.setCatcher(context.cgameKeys,context.clientTextInput.catcher);return void end function
function syncConsoleRuntime(context) runtime=context.clientTextInput.consoleRuntime;if runtime!=void then runtime.realtime=context.now;context.clientTextInput.connectionState=context.uiClient.connState;runtime.connectionState=context.clientTextInput.connectionState;runtime.keyCatchers=context.clientTextInput.catcher;runtime.uiOrCgameCatcher=runtime.keyCatchers&(clientConsole.KEYCATCH_UI|clientConsole.KEYCATCH_CGAME);runtime.consoleInput.catcher=runtime.keyCatchers end if;return runtime end function
function consoleScroll(context,operation,count)
  runtime=syncConsoleRuntime(context);if runtime==void then return false end if;if count<1 then count=1 end if
  if operation=="pageup" then for index=1 to count clientConsole.Con_PageUp(runtime) end for;return true end if
  if operation=="pagedown" then for index=1 to count clientConsole.Con_PageDown(runtime) end for;return true end if
  if operation=="top" then clientConsole.Con_Top(runtime);return true end if
  if operation=="bottom" then clientConsole.Con_Bottom(runtime);return true end if
  return false
end function
function consoleStartDemoLoop(context) return commands.executeText(context.commandState,commands.EXEC_APPEND,"d1\n") end function
function toggleConsoleCommand(commandState,context) runtime=syncConsoleRuntime(context);if runtime==void then consoleInput.toggleConsole(context.clientTextInput) else clientConsole.Con_ToggleConsole_f(runtime) end if;syncConsoleInputCatcher(context);return true end function
function messageModeCommand(commandState,context) runtime=syncConsoleRuntime(context);if runtime==void then consoleInput.beginMessage(context.clientTextInput,false,-1) else clientConsole.Con_MessageMode_f(runtime) end if;syncConsoleInputCatcher(context);return true end function
function messageMode2Command(commandState,context) runtime=syncConsoleRuntime(context);if runtime==void then consoleInput.beginMessage(context.clientTextInput,true,-1) else clientConsole.Con_MessageMode2_f(runtime) end if;syncConsoleInputCatcher(context);return true end function
function messageMode3Command(commandState,context) runtime=syncConsoleRuntime(context);if runtime==void then return false end if;result=clientConsole.Con_MessageMode3_f(runtime);syncConsoleInputCatcher(context);return result end function
function messageMode4Command(commandState,context) runtime=syncConsoleRuntime(context);if runtime==void then return false end if;result=clientConsole.Con_MessageMode4_f(runtime);syncConsoleInputCatcher(context);return result end function
function clearConsoleCommand(commandState,context) runtime=syncConsoleRuntime(context);if runtime==void then return false end if;return clientConsole.Con_Clear_f(runtime) end function
function dumpConsoleCommand(commandState,context) runtime=syncConsoleRuntime(context);if runtime==void or commands.argc(commandState)!=2 then return false end if;result=clientConsole.Con_Dump_f(runtime,commands.argv(commandState,1));return not (result is error) end function
function consoleCrosshairPlayer(context) return nativeCgameMain.crosshairPlayer(context.nativeMain) end function
function consoleLastAttacker(context) return nativeCgameMain.lastAttacker(context.nativeMain) end function

function openFile(context,name,mode)
  // The initial local match is read-only. Baseq3 treats a failed optional log
  // open as non-fatal; every packaged read comes directly from the retail PK3.
  if mode!=0 then return common.OpenResult(0,-1) end if
  data=try(pk3.read(context.archive,name));if data is error then return common.OpenResult(0,-1) end if
  handle=context.nextFile;context.nextFile=context.nextFile+1
  while handle>=len(context.files) context.files=context.files+[void] end while
  context.files[handle]=FileCursor(data,0);return common.OpenResult(handle,len(data))
end function
function readFile(context,handle,count)
  if handle<=0 or handle>=len(context.files) or context.files[handle]==void or context.files[handle].offset<0 or count<0 then return bytes(0,0) end if
  cursor=context.files[handle];available=len(cursor.data)-cursor.offset;if available<=0 then return bytes(0,0) end if;if count>available then count=available end if
  result=slice(cursor.data,cursor.offset,count);cursor.offset=cursor.offset+count;return result
end function
function writeFile(context,handle,data) return 0 end function
function closeFile(context,handle) if handle>0 and handle<len(context.files) then context.files[handle]=FileCursor(bytes(0,0),-1) end if;return void end function
function pcLoad(context,name) data=try(pk3.read(context.archive,name));if data is error then return void end if;return data end function

function locateGameData(context,entities,count,entityStride,clients,clientStride)
  context.gameEntities=entities;context.gameClients=clients;context.entityCount=count;context.entityStride=entityStride;context.clientStride=clientStride;return void
end function
function dropClient(context,client,text) if client>=0 and client<len(context.clientStates) and context.clientStates[client]==2 then freeBot(context,client) end if;context.console=context.console+[[client,"drop "+text]];return void end function
function sendServerCommand(context,client,text)
  context.console=context.console+[[client,text]]
  if context.cgameServerCommands!=void and (client<0 or client==0) then serverCommandStream.queue(context.cgameServerCommands,text) end if
  if context.botServer!=void then
    if client>=0 then botServerBridge.queueConsoleMessage(context.botServer,client,text)
    else for index=0 to len(context.clientStates)-1 if context.clientStates[index]==2 then botServerBridge.queueConsoleMessage(context.botServer,index,text) end if end for end if
  end if;return void
end function
function setConfigstring(context,index,text) if index>=0 and index<MAX_CONFIGSTRINGS then context.configstrings[index]=text end if;return void end function
function getConfigstring(context,index) if index<0 or index>=MAX_CONFIGSTRINGS then return "" end if;return context.configstrings[index] end function
function getUserinfo(context,index) if index<0 or index>=len(context.userinfos) then return "" end if;return context.userinfos[index] end function
function setUserinfo(context,index,text) if index>=0 and index<len(context.userinfos) then context.userinfos[index]=text end if;return void end function
function getServerinfo(context) mapName=cvar.get(context.cvars,"mapname","q3dm1",cvar.SERVERINFO|cvar.ROM).string;return "\\sv_hostname\\MiniQuake3\\mapname\\"+mapName+"\\sv_maxclients\\8\\g_gametype\\0" end function
function entityIndex(context,entity)
  if context.entityStride<=0 or entity<context.gameEntities then return -1 end if
  delta=entity-context.gameEntities;if delta%context.entityStride!=0 then return -1 end if
  index=delta/context.entityStride;if index<0 or index>=context.entityCount then return -1 end if;return index
end function
function gameMachine(context)
  if context.machineRuntime==void or context.machineRuntime.current==void then return fail("game VM is not active during world syscall") end if
  return context.machineRuntime.current.machine
end function
function readVector(data,at)
  return [n.bitsFloat(n.readI32(data,at)),n.bitsFloat(n.readI32(data,at+4)),n.bitsFloat(n.readI32(data,at+8))]
end function
function writeVector(data,at,value)
  for axis=0 to 2 n.writeU32(data,at+axis*4,n.floatBits(value[axis])) end for
  return void
end function
function syncSpatialEntity(context,index)
  machine=gameMachine(context);base=context.gameEntities+index*context.entityStride;data=machine.data
  state=entitystate.load(data,base);if state is error then return state end if
  ent=context.spatialScene.entities[index];ent.number=index;ent.modelindex=state.modelindex;ent.solid=state.solid
  ent.origin=state.origin;ent.angles=state.angles
  ent.linked=n.readI32(data,base+R_LINKED)!=0;ent.linkcount=n.readI32(data,base+R_LINKCOUNT)
  ent.svFlags=n.readI32(data,base+R_SVFLAGS);ent.singleClient=n.readI32(data,base+R_SINGLECLIENT);ent.bmodel=n.readI32(data,base+R_BMODEL)!=0
  ent.mins=readVector(data,base+R_MINS);ent.maxs=readVector(data,base+R_MAXS);ent.contents=n.readI32(data,base+R_CONTENTS)
  ent.absmin=readVector(data,base+R_ABSMIN);ent.absmax=readVector(data,base+R_ABSMAX)
  ent.currentOrigin=readVector(data,base+R_CURRENTORIGIN);ent.currentAngles=readVector(data,base+R_CURRENTANGLES);ent.ownerNum=n.readI32(data,base+R_OWNERNUM)
  return ent
end function
function writeSpatialEntity(context,index)
  machine=gameMachine(context);base=context.gameEntities+index*context.entityStride;data=machine.data;ent=context.spatialScene.entities[index]
  linked=0;if ent.linked then linked=1 end if
  bmodel=0;if ent.bmodel then bmodel=1 end if
  n.writeU32(data,base+R_LINKED,linked);n.writeU32(data,base+R_LINKCOUNT,ent.linkcount);n.writeU32(data,base+R_BMODEL,bmodel)
  n.writeU32(data,base+176,ent.solid);writeVector(data,base+R_ABSMIN,ent.absmin);writeVector(data,base+R_ABSMAX,ent.absmax)
  context.linked[index]=ent.linked;return void
end function
function setBrushModel(context,entity,name)
  if name==void or len(name)<2 or name[0]!="*" then return fail("invalid inline brush model name") end if
  index=entityIndex(context,entity);if index<0 then return fail("brush model entity is outside game data") end if
  model=toNumber(decode(slice(bytes(name),1,len(bytes(name))-1)));handle=collision.inlineModel(context.collisionWorld,model);bounds=collision.modelBounds(context.collisionWorld,handle)
  machine=gameMachine(context);base=context.gameEntities+index*context.entityStride
  n.writeU32(machine.data,base+160,model);n.writeU32(machine.data,base+R_BMODEL,1);n.writeU32(machine.data,base+R_CONTENTS,-1)
  writeVector(machine.data,base+R_MINS,bounds[0]);writeVector(machine.data,base+R_MAXS,bounds[1])
  linkEntity(context,entity);return void
end function
function inPvs(context,a,b,ignorePortals)
  if not ignorePortals then return serverWorld.inPVS(context.spatialScene,a,b) end if
  first=collision.pointLeafnum(context.collisionWorld,a);second=collision.pointLeafnum(context.collisionWorld,b)
  cluster=visibility.leafCluster(context.collisionWorld.visibility,second);mask=visibility.clusterPVS(context.collisionWorld.visibility,visibility.leafCluster(context.collisionWorld.visibility,first))
  if cluster<0 or (cluster>>3)>=len(mask) then return false end if
  return (mask[cluster>>3]&(1<<(cluster&7)))!=0
end function
function adjustPortal(context,entity,isOpen)
  index=entityIndex(context,entity);if index<0 then return fail("area portal entity is outside game data") end if
  ent=context.spatialScene.entities[index]
  if ent.areanum2!=-1 then return visibility.adjustAreaPortalState(context.collisionWorld.visibility,ent.areanum,ent.areanum2,isOpen) end if
  return void
end function
function areasConnected(context,a,b) return visibility.areasConnected(context.collisionWorld.visibility,a,b) end function
function linkEntity(context,entity)
  index=entityIndex(context,entity);if index<0 then return fail("linked entity is outside game data") end if
  syncSpatialEntity(context,index);serverWorld.linkEntity(context.spatialScene,index);writeSpatialEntity(context,index);return void
end function
function unlinkEntity(context,entity)
  index=entityIndex(context,entity);if index<0 then return fail("unlinked entity is outside game data") end if
  serverWorld.unlinkEntity(context.spatialScene,index);writeSpatialEntity(context,index);return void
end function
function allocateBot(context)
  for index=0 to len(context.clientStates)-1
    if context.clientStates[index]==0 then
      context.clientStates[index]=2;context.botAllocations=context.botAllocations+1
      if context.gameEntities>0 and context.entityStride>0 and context.machineRuntime.current!=void then machine=gameMachine(context);n.writeU32(machine.data,context.gameEntities+index*context.entityStride,index) end if
      return index
    end if
  end for
  return -1
end function
function freeBot(context,index)
  if index<0 or index>=len(context.clientStates) then return fail("bad bot client slot "+str(index)) end if
  context.clientStates[index]=0;context.userinfos[index]="";context.botFrees=context.botFrees+1
  if context.gameEntities>0 and context.entityStride>0 and context.machineRuntime.current!=void then machine=gameMachine(context);base=context.gameEntities+index*context.entityStride;n.writeU32(machine.data,base+R_SVFLAGS,n.readI32(machine.data,base+R_SVFLAGS)&(~8)) end if
  return void
end function
function botClientCommand(context,client,text) context.console=context.console+[[client,"bot "+text]];return void end function
function botCharacterRead(context,path) data=try(pk3.read(context.archive,path));if data is error then return void end if;return data end function
function entityToken(context)
  token=parser.parseExt(context.entityParser,true)
  return qagame.TokenResult(token!="",token)
end function
function entityString(context) return context.entityParser end function
function clearClient(context,index) return void end function
function botEnable(context) variable=cvar.find(context.cvars,"bot_enable");if variable==void then return 0 end if;return variable.integer end function
function botlibVarSet(context,vm,base)
  name=common.readString(vm,common.argument(vm,base,1));if name is error then return name end if
  value=common.readString(vm,common.argument(vm,base,2));if value is error then return value end if
  return botlibRuntime.varSet(context.botlib,name,value)
end function
function botlibVarGet(context,vm,base)
  name=common.readString(vm,common.argument(vm,base,1));if name is error then return name end if
  value=botlibRuntime.varGet(context.botlib,name);written=common.writeBuffer(vm,common.argument(vm,base,2),common.argument(vm,base,3),value,"botlib variable output");if written is error then return written end if;return botlibRuntime.BLERR_NOERROR
end function
function qagameFileList(context,vm,base)
  path=common.readString(vm,common.argument(vm,base,1));if path is error then return path end if
  extension=common.readString(vm,common.argument(vm,base,2));if extension is error then return extension end if
  capacity=common.argument(vm,base,4);if capacity<0 then return fail("negative qagame file-list capacity") end if
  entries=uiFileList(context,path,extension);data=bytes(capacity,0);cursor=0;count=0
  for each name in entries encoded=bytes(name);if cursor+len(encoded)+1>capacity then break end if;copyBytes(data,cursor,encoded,0,len(encoded));cursor=cursor+len(encoded)+1;count=count+1 end for
  if capacity>0 then written=common.writeRaw(vm,common.argument(vm,base,3),data,capacity,"qagame file list output");if written is error then return written end if end if
  return count
end function
function botlibLoadMap(context,vm,base)
  name=common.readString(vm,common.argument(vm,base,1));if name is error then return name end if
  result=botlibRuntime.loadMap(context.botlib,name);if result!=botlibRuntime.BLERR_NOERROR then return result end if
  if context.aasRouteCache!=void and context.aasCachePath!="" then aasRoutingCache.saveRcd(context.aasRouteCache,context.aasCachePath) end if
  context.aas=void;context.aasRouter=void;context.aasRouteCache=void;context.aiVisiblePosition.router=void
  data=try(pk3.read(context.archive,"maps/"+name+".aas"));if data is error then context.aas=void;return 3 end if
  map=aasFormat.load(data);if map is error then context.aas=void;return 7 end if
  context.aas=aasRuntime.create(map);if context.aas is error then context.aas=void;return 7 end if
  context.aasRouter=aasRouting.create(context.aas);if context.aasRouter is error then context.aas=void;context.aasRouter=void;return 7 end if
  context.aasRouteCache=aasRoutingCache.create(context.aasRouter,4096)
  context.aasCachePath="";if context.qvmRoot!="" then context.aasCachePath=context.qvmRoot+"/maps/"+name+".rcd";aasRoutingCache.loadRcd(context.aasRouteCache,context.aasCachePath) end if
  context.aiMoveRuntime.aas=context.aas;context.aiMoveRuntime.router=context.aasRouter;context.aiVisiblePosition.router=context.aasRouter
  gameType=botlibRuntime.integerVariable(context.botlib,"g_gametype",0);aiLevelItems.bind(context.aiLevelItems,context.aasEntities,context.aas,context.botBspEntities,gameType,context,levelItemPlace)
  aiMapGoals.initialize(context.aiMapGoals,context.aas,context.botBspEntities)
  aiGoalSelection.setDroppedWeight(context.aiGoalSelection,botlibFloat(context,"droppedweight",1000.0))
  initialized=aiLevelItems.initialize(context.aiLevelItems);if initialized is error then return initialized end if
  return botlibRuntime.BLERR_NOERROR
end function
function updateAasEntity(context,vm,base)
  number=common.argument(vm,base,1);address=common.argument(vm,base,2)
  result=botlibRuntime.updateEntity(context.botlib,number,address!=0);if result!=botlibRuntime.BLERR_NOERROR then return result end if
  if context.aasEntities==void then return result end if
  if address==0 then return aasEntities.update(context.aasEntities,number,void,void) end if
  state=aasQuerySyscalls.readEntityState(vm,address);if state is error then return state end if
  bounds=void
  if state.solid==aasEntities.SOLID_BSP then model=try(collision.inlineModel(context.collisionWorld,state.modelindex));if not (model is error) then bounds=collision.modelBounds(context.collisionWorld,model) end if end if
  return aasEntities.update(context.aasEntities,number,state,bounds)
end function
function aasPointContents(context,point) return pointContents(context,point,-1) end function
function aasMovementTrace(context,start,finish,presence,passEntity)
  bounds=aasRuntime.presenceTypeBoundingBox(presence);if bounds is error then return bounds end if
  ignored=passEntity;if ignored<0 then ignored=1023 end if
  staticTrace=aasClientTrace.trace(context.aas,start,finish,presence);if staticTrace is error then return staticTrace end if
  // AAS areas encode static solid/playerclip presence. Keep the server-world
  // trace only for linked entities, matching AAS_AreaEntityCollision.
  dynamic=void;if passEntity>=0 then dynamic=serverWorld.trace(context.spatialScene,start,finish,bounds[0],bounds[1],ignored,0x10001,false) end if
  if dynamic!=void and dynamic.entityNum!=1022 and dynamic.entityNum!=1023 and (dynamic.trace.startsolid or dynamic.trace.fraction<staticTrace.fraction) then
    return aasClientMovement.Trace(dynamic.trace.startsolid,dynamic.trace.fraction,dynamic.endpos,dynamic.entityNum,0,0,dynamic.trace.planeMetadata,dynamic.trace.normal)
  end if
  return aasClientMovement.Trace(staticTrace.startsolid,staticTrace.fraction,staticTrace.endpos,staticTrace.ent,staticTrace.lastarea,staticTrace.area,staticTrace.planenum,staticTrace.normal)
end function
function aasMovementPointArea(context,point) return aasRuntime.pointAreaNum(context.aas,point) end function
function aasMovementPointPresence(context,point) return aasRuntime.pointPresenceType(context.aas,point) end function
function aasMovementAreaContents(context,area)
  info=aasRuntime.areaInfo(context.aas,area);if info is error then return 0 end if;return info.contents
end function
function aasMovementTraceAreas(context,start,finish,maximum) return aasTraceAreas.trace(context.aas,start,finish,maximum) end function
function botlibFloat(context,name,fallback) value=botlibRuntime.varGet(context.botlib,name);if value=="" then return fallback end if;return n.f32(toNumber(value)) end function
function configureAasMovement(context)
  cfg=context.aasMovement.settings
  cfg.friction=botlibFloat(context,"phys_friction",6.0);cfg.stopspeed=botlibFloat(context,"phys_stopspeed",100.0);cfg.gravity=botlibFloat(context,"phys_gravity",800.0)
  cfg.waterfriction=botlibFloat(context,"phys_waterfriction",1.0);cfg.watergravity=botlibFloat(context,"phys_watergravity",400.0)
  cfg.maxwalkvelocity=botlibFloat(context,"phys_maxwalkvelocity",320.0);cfg.maxcrouchvelocity=botlibFloat(context,"phys_maxcrouchvelocity",100.0);cfg.maxswimvelocity=botlibFloat(context,"phys_maxswimvelocity",150.0)
  cfg.walkaccelerate=botlibFloat(context,"phys_walkaccelerate",10.0);cfg.airaccelerate=botlibFloat(context,"phys_airaccelerate",1.0);cfg.swimaccelerate=botlibFloat(context,"phys_swimaccelerate",4.0)
  cfg.maxstep=botlibFloat(context,"phys_maxstep",19.0);cfg.maxsteepness=botlibFloat(context,"phys_maxsteepness",0.7);cfg.maxbarrier=botlibFloat(context,"phys_maxbarrier",33.0);cfg.jumpvel=botlibFloat(context,"phys_jumpvel",270.0);return void
end function
function jumpPadTarget(context,name)
  if name=="" then return void end if
  for entityNum=1 to len(context.botBspEntities)-1
    entity=context.botBspEntities[entityNum];targetName=aiMapGoals.epair(entity,"targetname")
    if targetName[0] and targetName[1]==name then return aiMapGoals.vectorValue(entity,"origin") end if
  end for
  return void
end function
function bestReachableJumpPadArea(context,itemOrigin,itemMins,itemMaxs)
  bboxMins=[itemOrigin[0]+itemMins[0],itemOrigin[1]+itemMins[1],itemOrigin[2]+itemMins[2]];bboxMaxs=[itemOrigin[0]+itemMaxs[0],itemOrigin[1]+itemMaxs[1],itemOrigin[2]+itemMaxs[2]]
  for entityNum=1 to len(context.botBspEntities)-1
    entity=context.botBspEntities[entityNum];classname=aiMapGoals.epair(entity,"classname");if not classname[0] or classname[1]!="trigger_push" then continue end if
    modelPair=aiMapGoals.epair(entity,"model");if not modelPair[0] or len(modelPair[1])<2 or modelPair[1][0]!="*" then continue end if
    modelIndex=toNumber(decode(slice(bytes(modelPair[1]),1,len(bytes(modelPair[1]))-1)));handle=collision.inlineModel(context.collisionWorld,modelIndex);if handle is error then continue end if
    bounds=collision.modelBounds(context.collisionWorld,handle);if bounds is error then continue end if;absMins=bounds[0];absMaxs=bounds[1]
    origin=[(absMins[0]+absMaxs[0])*0.5,(absMins[1]+absMaxs[1])*0.5,(absMins[2]+absMaxs[2])*0.5]
    areaStart=origin;testStart=[origin[0],origin[1],origin[2]+64.0];startTrace=aasMovementTrace(context,testStart,origin,aasRuntime.PRESENCE_CROUCH,-1);if not (startTrace is error) and not startTrace.startsolid then areaStart=startTrace.endpos end if;areaStart=[areaStart[0],areaStart[1],areaStart[2]+0.125]
    crouchBounds=aasRuntime.presenceTypeBoundingBox(aasRuntime.PRESENCE_CROUCH);linkMins=[absMins[0]-crouchBounds[1][0],absMins[1]-crouchBounds[1][1],absMins[2]-crouchBounds[1][2]];linkMaxs=[absMaxs[0]-crouchBounds[0][0],absMaxs[1]-crouchBounds[0][1],absMaxs[2]-crouchBounds[0][2]]
    areas=aasRuntime.bboxAreas(context.aas,linkMins,linkMaxs,context.aas.map.counts[aasFormat.LUMP_AREAS]);hasJumpPad=false
    for each linkedArea in areas info=aasRuntime.areaInfo(context.aas,linkedArea);if not (info is error) and (info.contents&aiLevelItems.AREACONTENTS_JUMPPAD)!=0 then hasJumpPad=true;break end if end for
    if not hasJumpPad then continue end if
    targetPair=aiMapGoals.epair(entity,"target");if not targetPair[0] then continue end if;target=jumpPadTarget(context,targetPair[1]);if target==void then continue end if
    height=target[2]-origin[2];gravity=context.aasMovement.settings.gravity;if height<=0.0 or gravity<=0.0 then continue end if;time=n.fsqrt(height/(0.5*gravity));if time==0.0 then continue end if
    direction=[target[0]-origin[0],target[1]-origin[1],target[2]-origin[2]];length=n.fsqrt(direction[0]*direction[0]+direction[1]*direction[1]+direction[2]*direction[2]);if length==0.0 then continue end if
    forward=length/time*1.1;velocity=[direction[0]/length*forward,direction[1]/length*forward,time*gravity]
    move=aasClientMovement.predictWithBBox(context.aasMovement,-1,areaStart,aasRuntime.PRESENCE_NORMAL,false,velocity,[0.0,0.0,0.0],0,30,0.1,aasClientMovement.SE_HITBOUNDINGBOX,0,bboxMins,bboxMaxs,false)
    if not (move is error) and move.frames<30 then
      bestArea=0;bestVolume=0.0
      for each linkedArea in areas info=aasRuntime.areaInfo(context.aas,linkedArea);if info is error or (info.contents&aiLevelItems.AREACONTENTS_JUMPPAD)==0 then continue end if;volume=aasRuntime.areaVolume(context.aas,linkedArea);if volume>=bestVolume then bestArea=linkedArea;bestVolume=volume end if end for
      return bestArea
    end if
  end for
  return 0
end function
function levelItemPlace(context,origin,mins,maxs,floating)
  settled=[origin[0],origin[1],origin[2]]
  if floating and (pointContents(context,origin,-1)&aasClientMovement.CONTENTS_WATER)==0 then
    nearby=[origin[0],origin[1],origin[2]-32.0];ground=serverWorld.trace(context.spatialScene,origin,nearby,mins,maxs,0,0x10001,false)
    if not ground.trace.startsolid and ground.trace.fraction>=1.0 then jumpArea=bestReachableJumpPadArea(context,origin,mins,maxs);if jumpArea==0 then return [0,settled] end if;return [jumpArea,settled] end if
  end if
  if not floating then
    finish=[origin[0],origin[1],origin[2]-100.0];result=serverWorld.trace(context.spatialScene,origin,finish,mins,maxs,0,aasClientMovement.CONTENTS_SOLID,false)
    if not result.trace.startsolid then settled=[result.endpos[0],result.endpos[1],result.endpos[2]] end if
  end if
  candidate=[settled[0],settled[1],settled[2]];area=aasRuntime.pointAreaNum(context.aas,candidate)
  for up=0 to 4
    if area!=0 then break end if
    for spread=0 to 4
      if area!=0 then break end if
      for xside=-1 to 1
        if area!=0 then break end if
        for yside=-1 to 1
          candidate=[settled[0]+spread*4.0*xside,settled[1]+spread*4.0*yside,settled[2]+up*4.0];area=aasRuntime.pointAreaNum(context.aas,candidate);if area!=0 then break end if
        end for
      end for
    end for
  end for
  if area!=0 then
    start=[candidate[0],candidate[1],candidate[2]+0.25];finish=[candidate[0],candidate[1],candidate[2]-50.0];trace=aasMovementTrace(context,start,finish,aasRuntime.PRESENCE_CROUCH,-1)
    if not (trace is error) and not trace.startsolid then droppedArea=aasRuntime.pointAreaNum(context.aas,trace.endpos);if droppedArea!=0 then return [droppedArea,[trace.endpos[0],trace.endpos[1],trace.endpos[2]]] end if end if
    return [area,candidate]
  end if
  absoluteMins=[settled[0]+mins[0],settled[1]+mins[1],settled[2]+mins[2]];absoluteMaxs=[settled[0]+maxs[0],settled[1]+maxs[1],settled[2]+maxs[2]]
  areas=aasRuntime.bboxAreas(context.aas,absoluteMins,absoluteMaxs,64)
  for each fallbackArea in areas if aasRuntime.areaReachability(context.aas,fallbackArea)>0 then return [fallbackArea,settled] end if end for
  return [0,settled]
end function
function goalStateTime(context) return aasRuntime.getTime(context.aas) end function
function goalStateName(context,number) return aiLevelItems.goalName(context.aiLevelItems,number) end function
function goalStateLog(context,text) emitPrint(context,text);return void end function
function goalStatePrint(context,level,text) emitPrint(context,text);return void end function
function chatOutputRandom(context) return aiGoalSelection.randomFloat(context.aiGoalSelection) end function
function goalSelectionTravelTime(context,area,origin,goalArea,travelFlags)
  if context.aasRouteCache==void then return 0 end if;return aasRoutingCache.areaTravelTimeToGoalArea(context.aasRouteCache,area,origin,goalArea,travelFlags)
end function
function goalSelectionTrace(context,start,finish,viewer,contents)
  zero=[0.0,0.0,0.0];return serverWorld.trace(context.spatialScene,start,finish,zero,zero,viewer,contents,false).trace
end function
function moveGroundTrace(context,start,mins,maxs,finish,client,contents)
  result=serverWorld.trace(context.spatialScene,start,finish,mins,maxs,client,contents,false);return aiMoveRuntime.GroundTrace(result.trace.startsolid,result.trace.fraction,result.entityNum,result.endpos)
end function
function moveSwimming(context,origin) return aasMovementQueries.swimming(context,aasPointContents,origin) end function
function moveClientTrace(context,start,finish,presence,passEntity)
  result=aasMovementTrace(context,start,finish,presence,passEntity);if result is error then return result end if;return aiMoveRuntime.GroundTrace(result.startsolid,result.fraction,result.ent,result.endpos)
end function
function moveOnGround(context,origin,presence,passEntity) return aasClientMovement.onGround(context.aasMovement,origin,presence,passEntity,context.aasMovement.settings.maxsteepness) end function
function moveBlockTrace(context,state,direction,checkBottom)
  bounds=aasRuntime.presenceTypeBoundingBox(state.presenceType);if bounds is error then return bounds end if;mins=[bounds[0][0],bounds[0][1],bounds[0][2]];maxs=[bounds[1][0],bounds[1][1],bounds[1][2]]
  vertical=direction[2];if vertical<0.0 then vertical=0.0-vertical end if;if vertical<0.7 then mins[2]=mins[2]+context.aasMovement.settings.maxstep;maxs[2]=maxs[2]-10.0 end if
  finish=[state.origin[0]+3.0*direction[0],state.origin[1]+3.0*direction[1],state.origin[2]+3.0*direction[2]];result=serverWorld.trace(context.spatialScene,state.origin,finish,mins,maxs,state.entityNum,0x02010001,false)
  return aiMoveRuntime.GroundTrace(result.trace.startsolid,result.trace.fraction,result.entityNum,result.endpos)
end function
function moveJumpRunStart(context,state,reach)
  direction=[reach.start[0]-reach.finish[0],reach.start[1]-reach.finish[1],0.0];direction=aiMoveRuntime.normalize(direction)[1];start=[reach.start[0],reach.start[1],reach.start[2]+1.0];command=[direction[0]*400.0,direction[1]*400.0,0.0]
  predicted=aasClientMovement.predict(context.aasMovement,-1,start,aasRuntime.PRESENCE_NORMAL,true,[0.0,0.0,0.0],command,1,2,0.1,124,0,false);if predicted is error then return predicted end if
  if (predicted.stopevent&(aasClientMovement.SE_ENTERSLIME|aasClientMovement.SE_ENTERLAVA|aasClientMovement.SE_HITGROUNDDAMAGE))!=0 then return start end if;return predicted.endpos
end function
function moveGravity(context) return context.aasMovement.settings.gravity end function
function moveHorizontalVelocityForJump(context,zVelocity,start,finish)
  gravity=context.aasMovement.settings.gravity;maxVelocity=botlibFloat(context,"phys_maxvelocity",320.0);ratio=n.fdiv(zVelocity,gravity);maxJump=n.fmul(n.fmul(0.5,gravity),n.fmul(ratio,ratio));height=n.fsub(n.fadd(start[2],maxJump),finish[2])
  if height<0.0 then return [false,maxVelocity] end if;time=n.fsqrt(n.fdiv(height,n.fmul(0.5,gravity)));denominator=n.fadd(time,ratio);if denominator==0.0 then return [false,maxVelocity] end if
  dx=n.fsub(finish[0],start[0]);dy=n.fsub(finish[1],start[1]);speed=n.fdiv(n.fsqrt(n.fadd(n.fmul(dx,dx),n.fmul(dy,dy))),denominator);if speed>maxVelocity then return [false,maxVelocity] end if;return [true,speed]
end function
function moveEntityModel(context,entity) return aasEntities.info(context.aasEntities,entity).modelindex end function
function moveModelType(context,model)
  wanted="*"+str(model)
  for entityNum=1 to len(context.botBspEntities)-1
    entity=context.botBspEntities[entityNum];modelPair=aiMapGoals.epair(entity,"model");if not modelPair[0] or modelPair[1]!=wanted then continue end if
    classname=aiMapGoals.epair(entity,"classname");if classname[0] and classname[1]=="func_plat" then return aiMoveRuntime.MODELTYPE_FUNC_PLAT end if;if classname[0] and classname[1]=="func_bobbing" then return aiMoveRuntime.MODELTYPE_FUNC_BOB end if
  end for;return 0
end function
function moveModelReachability(context,model)
  if context.aasRouter==void then return 0 end if
  for reachNum=1 to len(context.aasRouter.reaches)-1
    reach=context.aasRouter.reaches[reachNum];kind=reach.travelType&aasRouting.TRAVELTYPE_MASK
    if kind==aasRouting.TRAVEL_ELEVATOR and reach.faceNum==model then return reachNum end if
    if kind==aasRouting.TRAVEL_FUNCBOB and (reach.faceNum&65535)==model then return reachNum end if
  end for;return 0
end function
function moveMoverInfo(context,model)
  if context.aasEntities==void then return void end if
  for entityNum=0 to len(context.aasEntities.entities)-1 info=aasEntities.info(context.aasEntities,entityNum);if info.valid and info.modelindex==model then return info end if end for;return void
end function
function moveElevatorState(context,state,reach)
  model=reach.faceNum&65535;mover=moveMoverInfo(context,model);if mover==void then return void end if
  handle=try(collision.inlineModel(context.collisionWorld,model));if handle is error then return void end if;bounds=collision.modelBounds(context.collisionWorld,handle);if bounds is error then return void end if
  bottom=[n.fadd(mover.origin[0],n.fmul(0.5,n.fadd(bounds[0][0],bounds[1][0]))),n.fadd(mover.origin[1],n.fmul(0.5,n.fadd(bounds[0][1],bounds[1][1]))),reach.start[2]]
  down=n.fadd(mover.origin[2],bounds[1][2])<reach.start[2];onMover=true
  for axis=0 to 1 if state.origin[axis]>n.fadd(n.fadd(mover.origin[axis],bounds[1][axis]),16.0) or state.origin[axis]<n.fsub(n.fadd(mover.origin[axis],bounds[0][axis]),16.0) then onMover=false end if end for
  if onMover then
    start=[state.origin[0],state.origin[1],n.fadd(state.origin[2],24.0)];finish=[state.origin[0],state.origin[1],n.fsub(state.origin[2],48.0)];trace=serverWorld.trace(context.spatialScene,start,finish,[-16.0,-16.0,-8.0],[16.0,16.0,8.0],state.entityNum,0x10001,false)
    hit=aasEntities.info(context.aasEntities,trace.entityNum);onMover=not trace.trace.startsolid and not trace.trace.allsolid and trace.entityNum!=aiMoveRuntime.ENTITYNUM_NONE and hit.valid and hit.modelindex==model
  end if
  return aiMoveRuntime.ElevatorState(onMover,down,bottom,context.aasMovement.settings.maxbarrier)
end function
function signed16(value) result=value&65535;if result>32767 then result=result-65536 end if;return result end function
function moveFuncBobState(context,state,reach)
  model=reach.faceNum&65535;mover=moveMoverInfo(context,model);if mover==void then return void end if
  handle=try(collision.inlineModel(context.collisionWorld,model));if handle is error then return void end if;bounds=collision.modelBounds(context.collisionWorld,handle);if bounds is error then return void end if
  mid=[n.fmul(0.5,n.fadd(bounds[0][0],bounds[1][0])),n.fmul(0.5,n.fadd(bounds[0][1],bounds[1][1])),n.fmul(0.5,n.fadd(bounds[0][2],bounds[1][2]))];start=[mid[0],mid[1],mid[2]];finish=[mid[0],mid[1],mid[2]];origin=[mover.origin[0],mover.origin[1],mover.origin[2]]
  flags=reach.faceNum>>16;first=signed16(reach.edgeNum>>16);second=signed16(reach.edgeNum)
  if (flags&1)!=0 then start[0]=first;finish[0]=second;origin=[n.fadd(origin[0],mid[0]),mid[1],mid[2]]
  else if (flags&2)!=0 then start[1]=first;finish[1]=second;origin=[mid[0],n.fadd(origin[1],mid[1]),mid[2]]
  else start[2]=first;finish[2]=second;origin=[mid[0],mid[1],n.fadd(origin[2],mid[2])] end if
  bottom=[n.fadd(mover.origin[0],mid[0]),n.fadd(mover.origin[1],mid[1]),reach.start[2]];onMover=true
  for axis=0 to 1 if state.origin[axis]>n.fadd(n.fadd(mover.origin[axis],bounds[1][axis]),16.0) or state.origin[axis]<n.fsub(n.fadd(mover.origin[axis],bounds[0][axis]),16.0) then onMover=false end if end for
  if onMover then
    traceStart=[state.origin[0],state.origin[1],n.fadd(state.origin[2],24.0)];traceFinish=[state.origin[0],state.origin[1],n.fsub(state.origin[2],48.0)];trace=serverWorld.trace(context.spatialScene,traceStart,traceFinish,[-16.0,-16.0,-8.0],[16.0,16.0,8.0],state.entityNum,0x10001,false)
    hit=aasEntities.info(context.aasEntities,trace.entityNum);onMover=not trace.trace.startsolid and not trace.trace.allsolid and trace.entityNum!=aiMoveRuntime.ENTITYNUM_NONE and hit.valid and hit.modelindex==model
  end if
  return aiMoveRuntime.FuncBobState(onMover,start,finish,origin,bottom,context.aasMovement.settings.maxbarrier)
end function
function moveBarrierJump(context,state,direction,speed)
  up=[state.origin[0],state.origin[1],n.fadd(state.origin[2],context.aasMovement.settings.maxbarrier)];trace=aasMovementTrace(context,state.origin,up,aasRuntime.PRESENCE_NORMAL,state.entityNum);if trace is error or trace.startsolid or n.fsub(trace.endpos[2],state.origin[2])<context.aasMovement.settings.maxstep then return false end if
  horizontal=aiMoveRuntime.normalize([direction[0],direction[1],0.0])[1];start=[trace.endpos[0],trace.endpos[1],trace.endpos[2]];finish=[n.fadd(state.origin[0],n.fmul(n.fmul(state.thinkTime,speed),n.fmul(0.5,horizontal[0]))),n.fadd(state.origin[1],n.fmul(n.fmul(state.thinkTime,speed),n.fmul(0.5,horizontal[1]))),trace.endpos[2]]
  trace=aasMovementTrace(context,start,finish,aasRuntime.PRESENCE_NORMAL,state.entityNum);if trace is error or trace.startsolid then return false end if;start=[trace.endpos[0],trace.endpos[1],trace.endpos[2]];finish=[trace.endpos[0],trace.endpos[1],state.origin[2]]
  trace=aasMovementTrace(context,start,finish,aasRuntime.PRESENCE_NORMAL,state.entityNum);if trace is error or trace.startsolid or trace.fraction>=1.0 or n.fsub(trace.endpos[2],state.origin[2])<context.aasMovement.settings.maxstep then return false end if;return true
end function
function moveRouteReachability(context,area,origin,goalArea,travelFlags)
  if context.aasRouteCache==void then return 0 end if;return aasRoutingCache.areaReachabilityToGoalArea(context.aasRouteCache,area,origin,goalArea,travelFlags)
end function
function moveSignedRandom(context) return n.fsub(n.fmul(2.0,aiGoalSelection.randomFloat(context.aiGoalSelection)),1.0) end function
function botlibText(context,name,fallback) value=botlibRuntime.varGet(context.botlib,name);if value=="" then return fallback end if;return value end function
function moveGrappleConfig(context)
  return aiMoveRuntime.GrappleConfig(botlibRuntime.integerVariable(context.botlib,"offhandgrapple",0)!=0,botlibRuntime.integerVariable(context.botlib,"weapindex_grapple",10),botlibText(context,"cmd_grappleon","grappleon"),botlibText(context,"cmd_grappleoff","grappleoff"))
end function
function moveGrappleState(context,state,reach)
  entityType=botlibRuntime.integerVariable(context.botlib,"entitytypemissile",3);weapon=botlibRuntime.integerVariable(context.botlib,"weapindex_grapple",10)
  for entityNum=1 to len(context.aasEntities.entities)-1 info=aasEntities.info(context.aasEntities,entityNum);if info.valid and info.type==entityType and info.weapon==weapon then return 1 end if end for;return 0
end function
function moveGrappleTrace(context,eye,target,entityNum)
  zero=[0.0,0.0,0.0];return serverWorld.trace(context.spatialScene,eye,target,zero,zero,entityNum,0x10001,false).endpos
end function
function predictVisibleTrace(context,start,finish,passEntity,contents)
  zero=[0.0,0.0,0.0];return serverWorld.trace(context.spatialScene,start,finish,zero,zero,passEntity,contents,false).trace.fraction
end function
function extendedQagame(context,vm,base,op)
  if op==38 then return qagameFileList(context,vm,base) end if
  if op>=200 and op<600 then context.lastBotTrap=op end if
  if op==200 then if context.aasRouteCache!=void and context.aasCachePath!="" then aasRoutingCache.saveRcd(context.aasRouteCache,context.aasCachePath) end if;context.aas=void;context.aasRouter=void;context.aasRouteCache=void;context.aasCachePath="";context.aiMoveRuntime.aas=void;context.aiMoveRuntime.router=void;context.aiVisiblePosition.router=void;aiLevelItems.shutdown(context.aiLevelItems);aiMapGoals.clear(context.aiMapGoals);aiChatStrings.clear(context.aiChatStrings);aiChatMatches.clear(context.aiChatMatches);aiChatOutput.clear(context.aiChatOutput);result=botlibRuntime.setup(context.botlib);if result==0 then context.aasEntities=aasEntities.create(context.botlib.maxentities);configured=aiConsoleMessages.configureFromBotlib(context.aiConsole,context.botlib);if configured is error then return configured end if;configureAasMovement(context);aiItemWeights.setReloadCharacters(context.aiItemWeights,botlibRuntime.integerVariable(context.botlib,"bot_reloadcharacters",0));noChat=botlibRuntime.integerVariable(context.botlib,"nochat",0)!=0;loaded=aiChatOutput.setup(context.aiChatOutput,noChat);if loaded is error then return loaded end if end if;return result end if
  if op==201 then if context.aasRouteCache!=void and context.aasCachePath!="" then aasRoutingCache.saveRcd(context.aasRouteCache,context.aasCachePath) end if;context.aas=void;context.aasRouter=void;context.aasRouteCache=void;context.aasCachePath="";context.aiVisiblePosition.router=void;aiCharacters.shutdown(context.aiCharacters);aiChatProfiles.clearCache(context.aiChat);aiChatStrings.clear(context.aiChatStrings);aiChatMatches.clear(context.aiChatMatches);aiChatOutput.shutdown(context.aiChatOutput);aiMapGoals.clear(context.aiMapGoals);aiConsoleMessages.shutdown(context.aiConsole);aiResourcePools.shutdown(context.aiResources);aiLevelItems.shutdown(context.aiLevelItems);aiItemWeights.shutdown(context.aiItemWeights);aiWeaponWeights.shutdown(context.aiWeaponWeights);result=botlibRuntime.shutdown(context.botlib);if result==0 then context.aasEntities=aasEntities.create(1024);pcParser.clearDefines(context.pcRegistry) end if;return result end if
  if op==202 then return botlibVarSet(context,vm,base) end if
  if op==203 then return botlibVarGet(context,vm,base) end if
  if op==204 then return pcAddDefine(context,vm,base) end if
  if op==205 then time=n.bitsFloat(common.argument(vm,base,1));result=botlibRuntime.startFrame(context.botlib,time);if result==0 then aasRuntime.setTime(context.aas,time);aasEntities.startFrame(context.aasEntities,time);aiConsoleMessages.setTime(context.aiConsole,time) end if;return result end if
  if op==206 then return botlibLoadMap(context,vm,base) end if
  if op==207 then return updateAasEntity(context,vm,base) end if
  if op==208 then return 0 end if
  if op>=botServerBridge.OP_GET_SNAPSHOT_ENTITY and op<=botServerBridge.OP_USER_COMMAND then return botServerBridge.dispatch(context.botServer,vm,base,op) end if
  if op==309 then point=common.readFloatVector(vm,common.argument(vm,base,1),3,"AAS point contents");if point is error then return point end if;return pointContents(context,point,-1) end if
  if op==303 then return aasQuerySyscalls.entityInfo(context.aasEntities,vm,common.argument(vm,base,1),common.argument(vm,base,2)) end if
  if op==308 then return aasQuerySyscalls.trace(context.aas,vm,base) end if
  if op==317 then origin=common.readFloatVector(vm,common.argument(vm,base,1),3,"AAS swimming origin");if origin is error then return origin end if;if aasMovementQueries.swimming(context,aasPointContents,origin) then return 1 end if;return 0 end if
  if op==318 then return aasClientMovementSyscalls.dispatch(context.aasMovement,vm,base) end if
  if op>=300 and op<400 then return aasSyscalls.dispatchCached(context.aas,context.aasRouter,context.aasRouteCache,context.botBspEntities,vm,base,op) end if
  if op>=400 and op<=423 then return elementaryActionSyscalls.dispatch(context.elementaryActions,vm,base,op) end if
  if op>=500 and op<=506 then return aiCharacterSyscalls.dispatch(context.aiCharacters,vm,base,op) end if
  if op>=aiConsoleMessages.OP_QUEUE_CONSOLE_MESSAGE and op<=aiConsoleMessages.OP_NUM_CONSOLE_MESSAGE then return aiConsoleMessages.dispatch(context.aiConsole,vm,base,op) end if
  if aiChatOutput.supportsTrap(op) then return aiChatOutputSyscalls.dispatch(context.aiChatOutput,vm,base,op) end if
  if op>=aiChatMatches.OP_STRING_CONTAINS and op<=aiChatMatches.OP_MATCH_VARIABLE then return aiChatMatchSyscalls.dispatch(context.aiChatMatches,vm,base,op) end if
  if op>=aiChatStrings.OP_UNIFY_WHITE_SPACES and op<=aiChatProfiles.OP_SET_CHAT_NAME then return aiChatStringSyscalls.dispatch(context.aiChatStrings,context.aiChat,vm,base,op) end if
  if op==aiItemWeights.OP_LOAD_ITEM_WEIGHTS or op==aiItemWeights.OP_FREE_ITEM_WEIGHTS then return aiItemWeightSyscalls.dispatch(context.aiItemWeights,context.aiResources,vm,base,op) end if
  if op==aiWeaponCombat.OP_CHOOSE_BEST_FIGHT_WEAPON or op==aiWeaponCombat.OP_GET_WEAPON_INFO then return aiWeaponCombatSyscalls.dispatch(context.aiWeaponWeights,context.aiResources,vm,base,op) end if
  if op==aiWeaponWeights.OP_LOAD_WEAPON_WEIGHTS then return aiWeaponWeightSyscalls.dispatch(context.aiWeaponWeights,context.aiResources,vm,base,op) end if
  if op==aiAvoidSpots.OP_ADD_AVOID_SPOT then return aiAvoidSpotSyscalls.dispatch(context.aiResources,vm,base) end if
  if aiGoalState.supportsTrap(op) then return aiGoalStateSyscalls.dispatch(context.aiGoalState,vm,base,op) end if
  if aiGoalSelection.supportsTrap(op) then return aiGoalSelectionSyscalls.dispatch(context.aiGoalSelection,vm,base,op) end if
  if aiChatGoalTail.supportsTrap(op) then return aiChatGoalTailSyscalls.dispatch(context.aiChatGoalTail,vm,base,op) end if
  if aiMapGoals.supportsTrap(op) then return aiMapGoalSyscalls.dispatch(context.aiMapGoals,vm,base,op) end if
  if aiMoveRuntime.supportsTrap(op) then return aiMoveSyscalls.dispatch(context.aiMoveRuntime,vm,base,op) end if
  if op==aiPredictVisible.OP_PREDICT_VISIBLE_POSITION then return aiPredictVisibleSyscalls.dispatch(context.aiVisiblePosition,vm,base,op) end if
  if op==aiLevelItems.OP_INIT_LEVEL_ITEMS then initialized=aiLevelItems.initialize(context.aiLevelItems);if initialized is error then return initialized end if;mapped=aiMapGoals.initialize(context.aiMapGoals,context.aas,context.botBspEntities);if mapped is error then return mapped end if;return 0 end if
  if op==aiLevelItems.OP_UPDATE_ENTITY_ITEMS then updated=aiLevelItems.update(context.aiLevelItems);if updated is error then return updated end if;return 0 end if
  if aasRouteExtras.supportsTrap(op) then return aasRouteExtraSyscalls.dispatch(context.aas,context.aasRouter,vm,base,op) end if
  if op==aiResourcePools.OP_FREE_CHAT_STATE then aiConsoleMessages.clearChat(context.aiConsole,common.argument(vm,base,1));return aiResourceSyscalls.dispatch(context.aiResources,vm,base,op) end if
  if aiResourcePools.supportsTrap(op) then return aiResourceSyscalls.dispatch(context.aiResources,vm,base,op) end if
  return error(7643,"local QVM match: unsupported retail qagame trap "+str(op))
end function

function traceWorld(context,start,mins,maxs,finish,passEntity,mask,capsule)
  result=serverWorld.trace(context.spatialScene,start,finish,mins,maxs,passEntity,mask,capsule);trace=result.trace
  return qworld.TraceResult(trace.allsolid,trace.startsolid,trace.fraction,result.endpos,trace.normal,trace.distance,trace.planeMetadata&255,(trace.planeMetadata>>8)&255,trace.surfaceFlags,trace.contents,result.entityNum)
end function
function pointContents(context,point,passEntity) return serverWorld.pointContents(context.spatialScene,point,passEntity) end function
function entitiesInBox(context,mins,maxs,capacity) return serverWorld.areaEntities(context.spatialScene,mins,maxs,capacity) end function
function entityContact(context,mins,maxs,entity,capsule)
  index=entityIndex(context,entity);if index<0 then return fail("contact entity is outside game data") end if
  return serverWorld.entityContact(context.spatialScene,mins,maxs,index,capsule)
end function
function getUsercmd(context,index)
  if index<0 or index>=len(context.usercmds) then return qworld.userCommand(context.now,[0,0,0],0,2,0,0,0) end if
  return context.usercmds[index]
end function

function seedCvars(registry)
  cvar.get(registry,"mapname","q3dm1",cvar.SERVERINFO|cvar.ROM)
  cvar.get(registry,"sv_maxclients","8",cvar.SERVERINFO|cvar.LATCH)
  cvar.get(registry,"g_gametype","0",cvar.SERVERINFO|cvar.LATCH)
  cvar.get(registry,"bot_enable","0",cvar.LATCH)
  cvar.get(registry,"g_log","",cvar.ARCHIVE)
  cvar.get(registry,"dedicated","0",cvar.ROM)
  return void
end function

function qagameRealTime(context)
  return cgameMisc.sampleRealTime()
end function
function qagameSeek(context,handle,offset,origin) return memoryFileSeek.seek(context.files,handle,offset,origin) end function

function bootConfiguredNamed(archive,map,now,qvmRoot,botsEnabled,mapName)
  if archive==void or map==void or now<0 then return fail("archive, map and non-negative time are required") end if
  entityBytes=slice(map.data,map.offsets[0],map.lengths[0]);registry=cvar.create();seedCvars(registry);cvar.set2(registry,"mapname",mapName,true)
  if botsEnabled then cvar.set2(registry,"bot_enable","1",true) end if
  scene=sceneQueue.create(4096,65536);scene.registered=true;scene.worldLoaded=true
  collisionWorld=collision.load(map.data);if collisionWorld is error then return collisionWorld end if
  spatialScene=serverWorld.create(collisionWorld)
  initialCommand=qworld.userCommand(now,[0,0,0],0,2,0,0,0)
  grid=lightGrid.load(map);if grid is error then return grid end if
  botBspEntities=bsp.entities(map);if botBspEntities is error then return botBspEntities end if
  commandState=commands.create();configstrings=array(MAX_CONFIGSTRINGS,"");cgameServerCommands=serverCommandStream.create(commandState,configstrings)
  uiClient=uiHost.createClientState(uiHost.CA_DISCONNECTED,0,-1,"localhost","","");if uiClient is error then return uiClient end if
  nativeServerCmds=nativeCgameServercmds.create();nativeServerCmds.configstrings=configstrings
  nativeMain=nativeCgameMain.create();nativeMain.configstrings=configstrings
  context=Context(archive,parser.create(entityBytes),registry,commandState,configstrings,array(MAX_CLIENTS,"\\name\\Sarge\\rate\\25000"),array(MAX_CLIENTS,initialCommand),[void],1,[],[],[],0,0,0,0,0,now,0,array(1024,false),[],[],[],[],[],void,0,void,scene,renderQueue.create(void,void),qvmRoot,collisionWorld,spatialScene,void,0,matchCommandRing.create(),0,0,grid,0,0,[],map,fontAbi.create(archive),void,cinematics.create(archive),array(100,0),botlibRuntime.create(),void,void,void,"",botBspEntities,shaderRemap.create(),array(MAX_CLIENTS,0),0,0,void,0,aasEntities.create(1024),void,aiResourcePools.create(),void,void,void,void,void,void,cgameMisc.createEntityTokens(entityBytes),void,void,void,void,void,void,void,void,void,void,uiLan.create(),cgameKeys.create(),uiLanCache.diskServices(""),cgameUsercmd.create(),void,void,void,cgameServerCommands,uiClient,nativeCgameCommands.create(),void,nativeCgameSnapshot.create(1024),nativeCgamePlayerstate.create(),nativeCgameEvent.create(1024),nativeCgameEnts.create(1024),nativeCgameLocalents.initLocalEntities(void,true),nativeCgameEffects.create(),nativeCgameWeapons.create(),nativeCgameView.create(),nativeCgameDrawtools.create(),nativeCgameDraw.state(),nativeCgameParticles.create(nativeCgameParticles.MAX_PARTICLES,true),nativeServerCmds,nativeMain,nativeCgameMarks.create(nativeCgameMarks.MAX_MARK_POLYS,true),nativeCgamePlayers.create())
  commands.initCommands(context.commandState);installed=cvarCommands.install(registry,context.commandState);if installed is error then return installed end if
  bindingState=bindingConfig.create(context.cgameKeys);bindingState.printFn=emitPrint;bindingState.printContext=context
  installed=bindingConfig.install(bindingState,context.commandState);if installed is error then return installed end if
  textServices=consoleInput.services(context);textServices.commandFn=consoleInputCommand;textServices.reliableFn=consoleInputReliable;textServices.printFn=emitPrint;textServices.scrollFn=consoleScroll
  context.clientTextInput=consoleInput.create(78,textServices)
  consoleServices=clientConsole.services(context);consoleServices.startDemoLoopFn=consoleStartDemoLoop;consoleServices.crosshairPlayerFn=consoleCrosshairPlayer;consoleServices.lastAttackerFn=consoleLastAttacker;clientConsole.Con_Init(clientConsole.create(context.clientTextInput,consoleServices),640)
  if not commands.addContextCommand(context.commandState,"toggleconsole",toggleConsoleCommand,context) then return fail("toggleconsole command already registered") end if
  if not commands.addContextCommand(context.commandState,"messagemode",messageModeCommand,context) then return fail("messagemode command already registered") end if
  if not commands.addContextCommand(context.commandState,"messagemode2",messageMode2Command,context) then return fail("messagemode2 command already registered") end if
  if not commands.addContextCommand(context.commandState,"messagemode3",messageMode3Command,context) then return fail("messagemode3 command already registered") end if
  if not commands.addContextCommand(context.commandState,"messagemode4",messageMode4Command,context) then return fail("messagemode4 command already registered") end if
  if not commands.addContextCommand(context.commandState,"clear",clearConsoleCommand,context) then return fail("clear command already registered") end if
  if not commands.addContextCommand(context.commandState,"condump",dumpConsoleCommand,context) then return fail("condump command already registered") end if
  context.aasMovement=aasClientMovement.services(context);context.aasMovement.traceFn=aasMovementTrace;context.aasMovement.pointContentsFn=aasPointContents;context.aasMovement.pointAreaFn=aasMovementPointArea;context.aasMovement.pointPresenceFn=aasMovementPointPresence;context.aasMovement.areaContentsFn=aasMovementAreaContents;context.aasMovement.traceAreasFn=aasMovementTraceAreas
  context.elementaryActions=elementaryActions.create(MAX_CLIENTS,botClientCommand,context)
  context.aiCharacters=aiCharacters.create(MAX_CLIENTS,context,botCharacterRead)
  context.aiItemWeights=aiItemWeights.create(context,botCharacterRead)
  context.aiLevelItems=aiLevelItems.create(context.aiItemWeights)
  context.aiGoalState=aiGoalState.create(context.aiResources,context,goalStateTime,goalStateName,goalStateLog,goalStatePrint)
  goalServices=aiGoalSelection.services(context);goalServices.travelTimeFn=goalSelectionTravelTime;goalServices.traceFn=goalSelectionTrace
  context.aiGoalSelection=aiGoalSelection.create(context.aiLevelItems,context.aiGoalState,goalServices)
  aiGoalSelection.setRandomSeed(context.aiGoalSelection,now)
  context.aiChatStrings=aiChatStrings.create(context,botCharacterRead)
  context.aiChatMatches=aiChatMatches.create(context,botCharacterRead)
  context.aiChat=aiChatProfiles.create(context.aiResources,context,botCharacterRead)
  context.aiChatOutput=aiChatOutput.create(context.aiChat,context.aiChatStrings,context.elementaryActions,context,botCharacterRead,goalStateTime,chatOutputRandom)
  context.aiChatGoalTail=aiChatGoalTail.create(context.aiChat,context.aiGoalState,context.aiLevelItems)
  moveServices=aiMoveRuntime.services(context);moveServices.groundTraceFn=moveGroundTrace;moveServices.entityModelFn=moveEntityModel;moveServices.modelTypeFn=moveModelType;moveServices.modelReachabilityFn=moveModelReachability;moveServices.swimmingFn=moveSwimming;moveServices.clientTraceFn=moveClientTrace;moveServices.elementaryActions=context.elementaryActions;moveServices.onGroundFn=moveOnGround;moveServices.blockTraceFn=moveBlockTrace;moveServices.jumpRunStartFn=moveJumpRunStart;moveServices.gravityFn=moveGravity;moveServices.horizontalVelocityForJumpFn=moveHorizontalVelocityForJump;moveServices.elevatorStateFn=moveElevatorState;moveServices.barrierJumpFn=moveBarrierJump;moveServices.routeReachabilityFn=moveRouteReachability;moveServices.randomFn=moveSignedRandom;moveServices.pointContentsFn=aasPointContents;moveServices.funcBobStateFn=moveFuncBobState;moveServices.grappleConfigFn=moveGrappleConfig;moveServices.grappleStateFn=moveGrappleState;moveServices.grappleTraceFn=moveGrappleTrace
  context.aiMoveRuntime=aiMoveRuntime.create(context.aiResources,void,void,moveServices)
  context.aiVisiblePosition=aiPredictVisible.create(void,context,predictVisibleTrace)
  context.aiMapGoals=aiMapGoals.create()
  context.aiWeaponWeights=aiWeaponWeights.create(context,botCharacterRead,context.aiItemWeights)
  context.botServer=botServerBridge.create(MAX_CLIENTS);botServerBridge.setTime(context.botServer,now)
  context.aiConsole=aiConsoleMessages.create(context.aiResources)
  context.pcRegistry=pcParser.create(context,pcLoad)
  runtimeHost=runtime.services();runtimeHost.context=context;runtimeHost.loadFn=imageLoader
  machineRuntime=runtime.create(runtimeHost);if machineRuntime is error then return machineRuntime end if;context.machineRuntime=machineRuntime
  shared=common.services(registry,context.commandState,context);shared.printFn=emitPrint;shared.errorFn=emitError;shared.millisecondsFn=milliseconds;shared.consoleFn=consoleCommand
  shared.openFn=openFile;shared.readFn=readFile;shared.writeFn=writeFile;shared.closeFn=closeFile
  gameSyscalls=qagame.services(shared,context);gameSyscalls.locateGameDataFn=locateGameData;gameSyscalls.dropClientFn=dropClient;gameSyscalls.sendServerCommandFn=sendServerCommand
  gameSyscalls.setConfigstringFn=setConfigstring;gameSyscalls.getConfigstringFn=getConfigstring;gameSyscalls.getUserinfoFn=getUserinfo;gameSyscalls.setUserinfoFn=setUserinfo
  gameSyscalls.getServerinfoFn=getServerinfo;gameSyscalls.setBrushModelFn=setBrushModel;gameSyscalls.inPvsFn=inPvs;gameSyscalls.adjustAreaPortalFn=adjustPortal;gameSyscalls.areasConnectedFn=areasConnected
  gameSyscalls.linkEntityFn=linkEntity;gameSyscalls.unlinkEntityFn=unlinkEntity;gameSyscalls.botAllocateClientFn=allocateBot;gameSyscalls.botFreeClientFn=freeBot;gameSyscalls.entityTokenFn=entityToken
  gameSyscalls.fileListFn=uiFileList;gameSyscalls.realTimeFn=qagameRealTime;gameSyscalls.seekFn=qagameSeek
  gameSyscalls.extendedFn=extendedQagame
  world=qworld.services(context);world.traceFn=traceWorld;world.pointContentsFn=pointContents;world.entitiesInBoxFn=entitiesInBox;world.entityContactFn=entityContact;world.getUsercmdFn=getUsercmd;gameSyscalls.worldServices=world
  host=gameVm.services(machineRuntime,qagame.callback(gameSyscalls),loadVm,callVm,restartVm,freeVm);host.context=context;host.millisecondsFn=milliseconds;host.entityStringFn=entityString;host.clearClientEntityFn=clearClient;host.botEnableFn=botEnable
  game=gameVm.create(host);if game is error then return game end if
  gameVm.initialize(game,now,MAX_CLIENTS)
  return Boot(game,machineRuntime,context,void,void)
end function
function bootConfigured(archive,map,now,qvmRoot,botsEnabled) return bootConfiguredNamed(archive,map,now,qvmRoot,botsEnabled,"q3dm1") end function

function bootWithQvms(archive,map,now,qvmRoot) return bootConfigured(archive,map,now,qvmRoot,false) end function
function bootWithBots(archive,map,now,qvmRoot) return bootConfigured(archive,map,now,qvmRoot,true) end function
function bootWithBotsNamed(archive,map,mapName,now,qvmRoot) return bootConfiguredNamed(archive,map,now,qvmRoot,true,mapName) end function
function boot(archive,map,now) return bootConfigured(archive,map,now,"",false) end function

function connectLocal(value,clientNum)
  denied=gameVm.clientConnect(value.game,clientNum,true,false);if denied is error then return denied end if
  if denied!=0 then return fail("GAME_CLIENT_CONNECT rejected local client") end if
  value.context.clientStates[clientNum]=1;gameVm.clientBegin(value.game,clientNum)
  if value.context.uiClient.clientNum<0 then value.context.uiClient.clientNum=clientNum end if;value.context.uiClient.connState=uiHost.CA_ACTIVE;value.context.uiClient.connectPacketCount=0;value.context.uiClient.messageString=""
  return void
end function

function executeGameConsole(value,text)
  if value==void or typeof(text)!="string" then return fail("match and console text are required") end if
  commands.tokenizeString(value.context.commandState,text);return gameVm.consoleCommand(value.game)
end function

// qcommon/Cmd_ExecuteString callback chain.  These callbacks deliberately use
// the already-tokenized shared command state, which is also what trap_Argv and
// trap_Args read while the QVM export is running.
function clientGameCommand(commandState)
  value=commandState.context;if value==void or value.cgame==void then return false end if
  name=commands.argv(commandState,0)
  if nativeCgameCommands.isNativeBaseCommand(name) then
    target=-1;attacker=-1
    if commands.sameInsensitive(name,"tcmd") or commands.sameInsensitive(name,"tell_target") or commands.sameInsensitive(name,"vtell_target") then target=cgameVm.crosshairPlayer(value.cgame);if target is error then return target end if end if
    if commands.sameInsensitive(name,"tell_attacker") or commands.sameInsensitive(name,"vtell_attacker") then attacker=cgameVm.lastAttacker(value.cgame);if attacker is error then return attacker end if end if
    native=nativeCgameCommands.dispatchBase(value.context.cvars,commandState,target,attacker,value.context.nativeCgameCommands)
    for each pair in native.cvarSets cvar.set2(value.context.cvars,pair[0],pair[1],false) end for
    for each text in native.consoleCommands commands.executeText(value.context.commandState,commands.EXEC_APPEND,text) end for
    for each text in native.clientCommands sendClientCommand(value.context,text) end for
    for each text in native.prints emitPrint(value.context,text) end for
    return true
  end if
  result=cgameVm.consoleCommand(value.cgame);if result is error then return result end if;return result!=0
end function
function serverGameCommand(commandState)
  value=commandState.context;if value==void or value.game==void then return false end if
  result=gameVm.consoleCommand(value.game);if result is error then return result end if;return result!=0
end function
function uiGameCommand(commandState)
  value=commandState.context;if value==void or value.ui==void then return false end if
  result=uiVm.consoleCommand(value.ui,value.context.now);if result is error then return result end if;return result!=0
end function
function forwardClientCommand(commandState,text)
  value=commandState.context;if value==void then return false end if
  sendClientCommand(value.context,text);return true
end function
function executeClientConsole(value,text)
  if value==void or typeof(text)!="string" then return fail("match and console text are required") end if
  return commands.executeText(value.context.commandState,commands.EXEC_NOW,text)
end function

function submitUsercmd(value,clientNum,command)
  if value==void or clientNum<0 or clientNum>=MAX_CLIENTS or command==void then return fail("valid match, client and usercmd are required") end if
  value.context.usercmds[clientNum]=command;value.context.now=command.serverTime;value.context.commandNumber=n.i32(value.context.commandNumber+1)
  stored=matchCommandRing.store(value.context.usercmdHistory,value.context.commandNumber,command);if stored is error then return stored end if
  return gameVm.clientThink(value.game,clientNum)
end function

function runFrame(value,serverTime)
  value.context.now=serverTime;botServerBridge.setTime(value.context.botServer,serverTime)
  commands.execute(value.context.commandState)
  if value.game.botEnable!=0 then botFrame=gameVm.botStartFrame(value.game,serverTime);if botFrame is error then return botFrame end if end if
  for each pending in botServerBridge.takePending(value.context.botServer)
    clientNum=pending[0];value.context.usercmds[clientNum]=pending[1];value.context.commandNumber=n.i32(value.context.commandNumber+1);stored=matchCommandRing.store(value.context.usercmdHistory,value.context.commandNumber,pending[1]);if stored is error then return stored end if
    thought=gameVm.clientThink(value.game,clientNum);if thought is error then return thought end if
  end for
  result=gameVm.runFrame(value.game,serverTime);if result is error then return result end if
  value.context.frames=value.context.frames+1;return result
end function

function snapshotPointLeaf(host,origin) return collision.pointLeafnum(host.context.collisionWorld,origin) end function
function snapshotLeafArea(host,leaf) return visibility.leafArea(host.context.collisionWorld.visibility,leaf) end function
function snapshotLeafCluster(host,leaf) return visibility.leafCluster(host.context.collisionWorld.visibility,leaf) end function
function snapshotWriteAreaBits(host,bits,area) return visibility.writeAreaBits(host.context.collisionWorld.visibility,bits,area) end function
function snapshotClusterPvs(host,cluster) return visibility.clusterPVS(host.context.collisionWorld.visibility,cluster) end function
function snapshotAreasConnected(host,first,second) return visibility.areasConnected(host.context.collisionWorld.visibility,first,second) end function

function nativePredictionResult(result,entityNum) return nativeMovement.Collision(result.trace,result.endpos,entityNum) end function
function nativePredictionWorldTrace(host,start,mins,maxs,finish,mask)
  value=collision.boxTrace(host.context.collisionWorld,start,finish,mins,maxs,0,mask,false);if value is error then return value end if;entityNum=1023;if value.trace.fraction!=1.0 then entityNum=1022 end if;return nativePredictionResult(value,entityNum)
end function
function nativePredictionEntityTrace(host,value,start,mins,maxs,finish,mask)
  ent=value.state;model=0;origin=value.lerpOrigin;angles=[0.0,0.0,0.0]
  if ent.solid==nativeCgamePredict.SOLID_BMODEL then model=ent.modelindex;angles=value.lerpAngles;origin=gameTrajectory.evaluate(ent.pos,host.context.nativeSnapshots.prediction.physicsTime);if origin is error then return origin end if
  else x=ent.solid&255;down=(ent.solid>>8)&255;up=((ent.solid>>16)&255)-32;model=collision.tempBoxModel(host.context.collisionWorld,[-x*1.0,-x*1.0,-down*1.0],[x*1.0,x*1.0,up*1.0],false);if model is error then return model end if end if
  result=collision.transformedTrace(host.context.collisionWorld,start,finish,mins,maxs,model,mask,origin,angles,false,host.context.collisionWorld.patchesReady);if result is error then return result end if;return nativePredictionResult(result,ent.number)
end function
function nativePredictionWorldPoint(host,point) return collision.pointContents(host.context.collisionWorld,point,0) end function
function nativePredictionEntityPoint(host,value,point) ent=value.state;return collision.transformedPointContents(host.context.collisionWorld,point,ent.modelindex,ent.origin,ent.angles) end function
function nativePredictionTriggerTouch(host,value,origin,mins,maxs)
  result=collision.boxTrace(host.context.collisionWorld,origin,origin,mins,maxs,value.state.modelindex,-1,false);if result is error then return result end if;return result.trace.startsolid
end function
function nativePredictionMover(host,origin,ground,fromTime,toTime) return [origin[0],origin[1],origin[2]] end function
function nativePredictionServices(context)
  host=nativeCgamePredict.services(context);host.worldTraceFn=nativePredictionWorldTrace;host.entityTraceFn=nativePredictionEntityTrace;host.worldPointFn=nativePredictionWorldPoint;host.entityPointFn=nativePredictionEntityPoint;host.triggerTouchFn=nativePredictionTriggerTouch;host.moverAdjustFn=nativePredictionMover;return host
end function
function nativePredictionCommands(context)
  result=[];first=context.commandNumber-63;for number=first to context.commandNumber command=matchCommandRing.get(context.usercmdHistory,context.commandNumber,number);if command is error then return command end if;if command!=void then result=result+[command] end if end for;return result
end function

// Feed the native cg_effects mirror from the semantic event stream.  These
// calls execute the original parameter and lifetime logic but remain
// non-dispatching while cgame.qvm owns presentation.
function observeNativeEffects(context,renderStart,hudStart,retailActive)
  effects=context.nativeEffects;effects.time=context.now;effects.predictedClient=context.nativeEvents.predictedClient;particles=context.nativeParticles;particles.time=context.now;particles.retailActive=retailActive
  if renderStart<len(context.nativeEvents.render) then
    for index=renderStart to len(context.nativeEvents.render)-1
      action=context.nativeEvents.render[index];second=action.origin2;if second==void then second=[0.0,0.0,0.0] end if
      if action.kind=="spawn-effect" then nativeCgameEffects.spawnEffect(effects,action.origin,retailActive)
      else if action.kind=="jump-pad-smoke" then nativeCgameEffects.smokePuff(effects,action.origin,[0.0,0.0,0.0],32.0,1.0,1.0,1.0,1.0,1000.0,context.now,0,0,"smokePuff",retailActive);nativeCgameParticles.particleImpactSmokePuff(particles,"smokePuff",action.origin)
      else if action.kind=="bullet-hit-flesh" then nativeCgameEffects.bleed(effects,action.origin,action.other,retailActive);nativeCgameParticles.particleBleed(particles,"bloodTrail",action.origin,second,action.other,600)
      else if action.kind=="gib-player" then nativeCgameEffects.gibPlayer(effects,action.origin,retailActive)
      else if action.kind=="EV_KAMIKAZE" then nativeCgameEffects.kamikazeEffect(effects,action.origin,retailActive)
      else if action.kind=="EV_OBELISKEXPLODE" then nativeCgameEffects.obeliskExplode(effects,action.origin,action.entity,retailActive)
      else if action.kind=="EV_OBELISKPAIN" then nativeCgameEffects.obeliskPain(effects,action.origin,retailActive)
      else if action.kind=="EV_INVUL_IMPACT" then nativeCgameEffects.invulnerabilityImpact(effects,action.origin,second,retailActive)
      else if action.kind=="EV_JUICED" then nativeCgameEffects.invulnerabilityJuiced(effects,action.origin,retailActive)
      else if action.kind=="EV_LIGHTNINGBOLT" then nativeCgameEffects.lightningBoltBeam(effects,action.origin,second,retailActive)
      else if action.kind=="missile-hit-wall" or action.kind=="missile-hit-metal" then nativeCgameMarks.impactMark(context.nativeMarks,"gfx/damage/burn_med_mrk",action.origin,second,0.0,1.0,1.0,1.0,1.0,false,32.0,false,void) end if
    end for
  end if
  if hudStart<len(context.nativeEvents.hud) then
    for index=hudStart to len(context.nativeEvents.hud)-1 action=context.nativeEvents.hud[index];if action.kind=="score-plum" then nativeCgameEffects.scorePlum(effects,action.entity,action.origin,action.parm,retailActive) end if end for
  end if
  return void
end function

// Run weapon side effects from the same decoded event records.  The native
// mirror resolves media, traces and impact decisions while retail cgame.qvm
// remains the only dispatcher.
function observeNativeWeapons(context,renderStart,retailActive,ps)
  weapons=context.nativeWeapons;weapons.time=context.now;weapons.health=ps.stats[gameConstants.STAT_HEALTH];weapons.owned=ps.stats[gameConstants.STAT_WEAPONS];weapons.ammo=ps.ammo;weapons.weaponSelect=ps.weapon
  if renderStart<len(context.nativeEvents.render) then
    for index=renderStart to len(context.nativeEvents.render)-1
      action=context.nativeEvents.render[index];second=action.origin2;if second==void then second=[0.0,0.0,0.0] end if
      if action.kind=="fire-weapon" then
        cent=nativeCgameWeapons.entity(action.entity);cent.weapon=action.weapon;cent.origin=action.origin;cent.angles=second
        for each source in context.latestSnapshot.entities if source.number==action.entity then cent.powerups=source.powerups;cent.eFlags=source.eFlags end if end for
        result=nativeCgameWeapons.fireWeapon(weapons,cent,retailActive);if result is error then return result end if
      else if action.kind=="missile-hit-player" then result=nativeCgameWeapons.missileHitPlayer(weapons,action.weapon,action.origin,second,action.other,retailActive);if result is error then return result end if
      else if action.kind=="missile-hit-wall" then result=nativeCgameWeapons.missileHitWall(weapons,action.weapon,action.entity,action.origin,second,nativeCgameWeapons.IMPACTSOUND_DEFAULT,[1.0,1.0,1.0],[1.0,1.0,1.0],retailActive);if result is error then return result end if
      else if action.kind=="missile-hit-metal" then result=nativeCgameWeapons.missileHitWall(weapons,action.weapon,action.entity,action.origin,second,nativeCgameWeapons.IMPACTSOUND_METAL,[1.0,1.0,1.0],[1.0,1.0,1.0],retailActive);if result is error then return result end if
      else if action.kind=="shotgun-fire" then result=nativeCgameWeapons.shotgunFire(weapons,action.origin,second,action.parm,action.other,false,false,retailActive);if result is error then return result end if end if
    end for
  end if
  return void
end function

function snapshot(value,clientNum)
  if value==void or clientNum<0 or clientNum>=MAX_CLIENTS then return fail("valid match and client are required") end if
  context=value.context;machine=value.game.slot.machine
  if machine==void or context.gameClients<=0 or context.entityStride<=0 then return fail("qagame did not locate its state") end if
  ps=playerstate.load(machine.data,context.gameClients+clientNum*context.clientStride);if ps is error then return ps end if
  mapped=[]
  for index=0 to context.entityCount-1
    state=entitystate.load(machine.data,context.gameEntities+index*context.entityStride);if state is error then return state end if;state.number=index
    spatial=context.spatialScene.entities[index]
    mapped=mapped+[snapshotBuild.snapshotEntity(state,spatial.linked,spatial.svFlags,spatial.singleClient,spatial.clusters,spatial.lastCluster,spatial.areanum,spatial.areanum2)]
  end for
  buildWorld=snapshotBuild.world(true,mapped,1024);host=snapshotBuild.services(snapshotPointLeaf,snapshotLeafArea,snapshotLeafCluster,snapshotWriteAreaBits,snapshotClusterPvs,snapshotAreasConnected,context)
  frame=snapshotBuild.buildClientSnapshot(buildWorld,host,ps,context.linked[clientNum],false);if frame is error then return frame end if
  entities=[]
  if frame.numEntities>0 then for index=0 to frame.numEntities-1 entities=entities+[buildWorld.ring[(frame.firstEntity+index)%buildWorld.ringCapacity]] end for end if
  result=Snapshot(context.now,ps,entities);context.latestSnapshot=result;context.snapshotNumber=context.snapshotNumber+1
  initial=context.nativeSnapshots.snap==void;transitionStart=len(context.nativeSnapshots.playerStateTransitions)
  observed=nativeCgameSnapshot.publish(context.nativeSnapshots,context.snapshotNumber,result,0,context.cgameServerCommands.commandSequence,context.now);if observed is error then return observed end if
  // Validate the same snapshot/usercmd boundary as cgame.qvm on copied state.
  // This observer shares native Pmove/collision without dispatching effects.
  if context.nativeSnapshots.prediction==void then context.nativeSnapshots.prediction=nativeCgamePredict.create() end if
  commandList=nativePredictionCommands(context);if commandList is error then return commandList end if;predictionGameType=0;predictionSetting=cvar.find(context.cvars,"g_gametype");if predictionSetting!=void then predictionGameType=predictionSetting.integer end if;predictionFixed=false;predictionSetting=cvar.find(context.cvars,"pmove_fixed");if predictionSetting!=void then predictionFixed=predictionSetting.integer!=0 end if;predictionMsec=8;predictionSetting=cvar.find(context.cvars,"pmove_msec");if predictionSetting!=void then predictionMsec=predictionSetting.integer end if
  predicted=nativeCgamePredict.predict(context.nativeSnapshots.prediction,context.nativeSnapshots.snap,context.nativeSnapshots.nextSnap,context.now,context.now,commandList,false,false,false,context.nativeSnapshots.nextFrameTeleport,context.nativeSnapshots.thisFrameTeleport,predictionGameType,true,predictionFixed,predictionMsec,nativePredictionServices(context));if predicted is error then return predicted end if
  // The native mirror reaches the same semantic audio/render/HUD boundaries.
  // While the retail cgame is active it decodes but suppresses every action,
  // preventing duplicate sounds and effects beside cgame.qvm.
  eventRenderStart=len(context.nativeEvents.render);eventHudStart=len(context.nativeEvents.hud);retailActive=value.cgame!=void
  eventObserved=nativeCgameEvent.observeSnapshot(context.nativeEvents,result,retailActive);if eventObserved is error then return eventObserved end if
  observeNativeEffects(context,eventRenderStart,eventHudStart,retailActive)
  weaponObserved=observeNativeWeapons(context,eventRenderStart,retailActive,result.playerState);if weaponObserved is error then return weaponObserved end if
  entityObserver=context.nativeEntities;entityObserver.time=context.now;entityObserver.gametype=predictionGameType
  entitySnapshot=nativeCgameEnts.Snapshot(result.serverTime,result.playerState,result.entities);entityObserved=nativeCgameEnts.addPacketEntities(entityObserver,entitySnapshot,void,void,retailActive);if entityObserved is error then return entityObserved end if
  playerObserver=context.nativePlayers;playerObserver.time=context.now;playerObserver.frameTime=50;playerObserver.gametype=predictionGameType;playerObserver.localClientNum=result.playerState.clientNum
  for each playerState in result.entities
    if playerState.eType==gameConstants.ET_PLAYER and playerState.clientNum>=0 and playerState.clientNum<nativeCgamePlayers.MAX_CLIENTS and playerObserver.clients[playerState.clientNum].infoValid then
      player=nativeCgamePlayers.entity(playerState.number,playerState.clientNum);player.eFlags=playerState.eFlags;player.powerups=playerState.powerups;player.legsAnim=playerState.legsAnim;player.torsoAnim=playerState.torsoAnim;player.generic1=playerState.generic1;player.origin=[playerState.pos.trBase[0],playerState.pos.trBase[1],playerState.pos.trBase[2]];player.angles=[playerState.apos.trBase[0],playerState.angles2[1],playerState.apos.trBase[2]]
      emptyTrace=nativeCgamePlayers.Trace(1.0,[0.0,0.0,0.0],[0.0,0.0,1.0],false,false,0);observed=nativeCgamePlayers.player(playerObserver,player,result.playerState.persistant[gameConstants.PERS_TEAM],emptyTrace,0,0,emptyTrace,retailActive);if observed is error then return observed end if
    end if
  end for
  predictedState=result.playerState
  if predictedState.clientNum>=0 and predictedState.clientNum<nativeCgamePlayers.MAX_CLIENTS and playerObserver.clients[predictedState.clientNum].infoValid then
    predictedPlayer=nativeCgamePlayers.entity(predictedState.clientNum,predictedState.clientNum);predictedPlayer.eFlags=predictedState.eFlags;predictedPlayer.legsAnim=predictedState.legsAnim;predictedPlayer.torsoAnim=predictedState.torsoAnim;predictedPlayer.generic1=predictedState.generic1;predictedPlayer.origin=[predictedState.origin[0],predictedState.origin[1],predictedState.origin[2]];predictedPlayer.angles=[predictedState.viewangles[0],predictedState.movementDir,predictedState.viewangles[2]]
    predictedPlayer.powerups=0;for powerupIndex=0 to len(predictedState.powerups)-1 if predictedState.powerups[powerupIndex]!=0 then predictedPlayer.powerups=predictedPlayer.powerups|(1<<powerupIndex) end if end for
    predictedTrace=nativeCgamePlayers.Trace(1.0,[0.0,0.0,0.0],[0.0,0.0,1.0],false,false,0);predictedObserved=nativeCgamePlayers.player(playerObserver,predictedPlayer,predictedState.persistant[gameConstants.PERS_TEAM],predictedTrace,0,0,predictedTrace,retailActive);if predictedObserved is error then return predictedObserved end if
  end if
  nativeCgameLocalents.addLocalEntities(context.nativeLocalEntities,context.now,0,result.playerState.origin)
  viewObserver=context.nativeView;viewObserver.predicted=playerstate.copy(result.playerState);viewObserver.snap=nativeCgameView.snapshot(playerstate.copy(result.playerState),0,[]);viewObserver.viewAngles=[result.playerState.viewangles[0],result.playerState.viewangles[1],result.playerState.viewangles[2]];viewObserver.weaponSelect=result.playerState.weapon
  viewObserved=nativeCgameView.drawActiveFrame(viewObserver,context.now,0,false,retailActive);if viewObserved is error then return viewObserved end if
  nativeCgameParticles.addParticles(context.nativeParticles,context.now,viewObserver.refdef.vieworg,viewObserver.refdef.viewaxis[0],viewObserver.refdef.viewaxis[1],viewObserver.refdef.viewaxis[2])
  nativeCgameMarks.addMarks(context.nativeMarks,context.now)
  drawObserver=context.nativeDrawtools;drawObserver.time=context.now;drawObserver.health=result.playerState.stats[gameConstants.STAT_HEALTH];drawObserver.armor=result.playerState.stats[gameConstants.STAT_ARMOR];drawObserver.refX=viewObserver.refdef.x;drawObserver.refY=viewObserver.refdef.y;drawObserver.refWidth=viewObserver.refdef.width;drawObserver.refHeight=viewObserver.refdef.height
  nativeDraw=context.nativeDraw;nativeDraw.time=context.now;nativeDraw.serverTime=result.serverTime;nativeDraw.latestSnapshotNum=context.snapshotNumber;nativeDraw.serverCommandSequence=context.cgameServerCommands.commandSequence;nativeDraw.levelStartTime=context.nativeServerCmds.levelStartTime;nativeDraw.team=result.playerState.persistant[gameConstants.PERS_TEAM];nativeDraw.gametype=predictionGameType;nativeDraw.clientNum=result.playerState.clientNum;nativeDraw.health=result.playerState.stats[gameConstants.STAT_HEALTH];nativeDraw.armor=result.playerState.stats[gameConstants.STAT_ARMOR];nativeDraw.weapon=result.playerState.weapon;nativeDraw.weaponTime=result.playerState.weaponTime;nativeDraw.pmType=result.playerState.pm_type;nativeDraw.pmFlags=result.playerState.pm_flags;nativeDraw.refX=viewObserver.refdef.x;nativeDraw.refY=viewObserver.refdef.y;nativeDraw.refWidth=viewObserver.refdef.width;nativeDraw.refHeight=viewObserver.refdef.height;nativeDraw.warmup=context.nativeServerCmds.warmup;nativeDraw.voteTime=context.nativeServerCmds.voteTime;nativeDraw.voteString=context.nativeServerCmds.voteString;nativeDraw.voteYes=context.nativeServerCmds.voteYes;nativeDraw.voteNo=context.nativeServerCmds.voteNo;nativeDraw.teamVoteTime=context.nativeServerCmds.teamVoteTime;nativeDraw.teamVoteString=context.nativeServerCmds.teamVoteString;nativeDraw.teamVoteYes=context.nativeServerCmds.teamVoteYes;nativeDraw.teamVoteNo=context.nativeServerCmds.teamVoteNo
  nativeCgameDraw.drawActive(nativeDraw,0,true,nativeCgameDraw.TraceResult(-1,false,false),retailActive)
  observer=context.nativePlayerState;observer.time=context.now;observer.serverTime=result.serverTime
  setting=cvar.find(context.cvars,"g_gametype");if setting!=void then observer.gametype=setting.integer end if;setting=cvar.find(context.cvars,"timelimit");if setting!=void then observer.timelimit=setting.integer end if;setting=cvar.find(context.cvars,"fraglimit");if setting!=void then observer.fraglimit=setting.integer end if
  if initial then nativeCgamePlayerstate.respawn(observer,result.playerState) end if
  if transitionStart<len(context.nativeSnapshots.playerStateTransitions) then for transitionIndex=transitionStart to len(context.nativeSnapshots.playerStateTransitions)-1 pair=context.nativeSnapshots.playerStateTransitions[transitionIndex];nativeCgamePlayerstate.transitionPlayerState(observer,pair[0],pair[1]) end for end if
  botServerBridge.publishSnapshot(context.botServer,clientNum,entities);return result
end function

function writeWords(output,offset,words)
  for index=0 to len(words)-1 n.writeU32(output,offset+index*4,words[index]) end for
  return void
end function

function gameStateBytes(context)
  output=bytes(cgameSyscall.GAMESTATE_SIZE,0);cursor=1
  for index=0 to MAX_CONFIGSTRINGS-1
    text=context.configstrings[index]
    if text!="" then
      encoded=bytes(text);if cursor+len(encoded)+1>16000 then return fail("configstring gameState overflow") end if
      n.writeU32(output,index*4,cursor);copyBytes(output,4096+cursor,encoded,0,len(encoded));cursor=cursor+len(encoded)+1
    end if
  end for
  n.writeU32(output,20096,cursor);return output
end function

function glconfigBytes(context)
  output=bytes(cgameSyscall.GLCONFIG_SIZE,0);n.writeU32(output,11264,4096);n.writeU32(output,11268,2)
  n.writeU32(output,11304,1280);n.writeU32(output,11308,720);n.writeU32(output,11312,n.floatBits(1280.0/720.0));return output
end function

function snapshotBytes(context,number)
  value=context.latestSnapshot
  if value==void or number!=context.snapshotNumber then return cgameSyscall.BytesResult(false,bytes(0,0)) end if
  output=bytes(cgameSyscall.SNAPSHOT_SIZE,0);n.writeU32(output,8,value.serverTime);writeWords(output,44,playerstate.words(value.playerState))
  count=len(value.entities);if count>256 then count=256 end if;n.writeU32(output,512,count)
  for index=0 to count-1 writeWords(output,516+index*entitystate.BYTE_SIZE,entitystate.words(value.entities[index])) end for
  // snapshot_t stores the reliable command sequence after its 256 entities.
  // Cgame advances CG_ExecuteNewServerCommands to this value when promoted.
  n.writeU32(output,53768,context.cgameServerCommands.commandSequence)
  return cgameSyscall.BytesResult(true,output)
end function

function currentSnapshot(context)
  serverTime=context.now;if context.latestSnapshot!=void then serverTime=context.latestSnapshot.serverTime end if
  return cgameSyscall.SnapshotNumber(context.snapshotNumber,serverTime)
end function
function registerTypedAsset(context,kind,name)
  index=0
  while index<len(context.assets)
    if context.assetKinds[index]==kind and context.assets[index]==name then return index+1 end if
    index=index+1
  end while
  context.assets=context.assets+[name];context.assetKinds=context.assetKinds+[kind];return len(context.assets)
end function
function typedAssetHandle(context,kind,name)
  index=0;while index<len(context.assets) if context.assetKinds[index]==kind and context.assets[index]==name then return index+1 end if;index=index+1 end while;return 0
end function
function registerAsset(context,name) return registerTypedAsset(context,"asset",name) end function
function registerModel(context,name)
  existing=typedAssetHandle(context,"model",name);if existing!=0 then return existing end if
  loaded=void
  if len(name)>1 and name[0]=="*" then
    index=toNumber(decode(slice(bytes(name),1,len(bytes(name))-1)));checked=try(collision.inlineModel(context.collisionWorld,index));if checked is error then return 0 end if;loaded=try(qvmSceneGeometry.loadInlineModel(context.markMap,index,65536));if loaded is error then return 0 end if
  else
    if not strings.endsWith(strings.toLowerAscii(name),".md3") then return 0 end if
    data=try(pk3.read(context.archive,name));if data is error then return 0 end if;parsed=try(md3.load(data));if parsed is error then return 0 end if
    levels=[parsed];stem=decode(slice(bytes(name),0,len(bytes(name))-4))
    for lod=1 to 2
      lodData=try(pk3.read(context.archive,stem+"_"+str(lod)+".md3"));if lodData is error then break end if
      lodModel=try(md3.load(lodData));if lodModel is error then break end if;levels=levels+[lodModel]
    end for
    loaded=qvmSceneGeometry.md3Lods(levels)
  end if
  handle=registerTypedAsset(context,"model",name);while len(context.modelAssets)<len(context.assets) context.modelAssets=context.modelAssets+[void] end while;context.modelAssets[handle-1]=loaded;return handle
end function
function registerSkin(context,name) return registerTypedAsset(context,"skin",name) end function
function registerShaderKind(context,kind,name)
  remapped=shaderRemap.handle(context.shaderRemaps,context.assetKinds,kind,name);if remapped!=0 then return remapped end if
  return registerTypedAsset(context,kind,shaderRemap.resolve(context.shaderRemaps,name))
end function
function registerShader(context,name) return registerShaderKind(context,"shader",name) end function
function registerShaderNoMip(context,name) return registerShaderKind(context,"shaderNoMip",name) end function
function addCommand(context,name)
  // CG_InitConsoleCommands registers completion-only commands.  Keeping them
  // in the real Cmd registry is what lets Cmd_ExecuteString fall through to
  // CG_CONSOLE_COMMAND, exactly like a NULL xcommand_t in Baseq3.
  commands.addCommand(context.commandState,name,void)
  context.console=context.console+[[0,"add "+name]];return void
end function
function removeCommand(context,name) commands.removeCommand(context.commandState,name);return void end function
function sendClientCommand(context,name) context.console=context.console+[[0,"client "+name]];return void end function
function updateScreen(context) return void end function
function loadWorld(context,name)
  context.renderCommands=context.renderCommands+[[36,name]]
  reset=cgameMisc.resetEntityTokens(context.rendererEntityTokens);if reset is error then return reset end if
  return void
end function
function clearScene(context) context.renderCommands=[];sceneQueue.clearScene(context.scene);return void end function
function commandConfigstring(context,index,value) if index>=0 and index<len(context.configstrings) then context.configstrings[index]=value end if;return void end function
function commandClearNotify(context) context.prints=[];return void end function
function commandClearUsercmds(context) return matchCommandRing.clear(context.usercmdHistory) end function
function commandCloseConsole(context) context.uiKeyCatcher=context.uiKeyCatcher&~1;return void end function
function commandQueueConsole(context,text) return commands.addText(context.commandState,text) end function
function cgameServerCommand(context,number)
  host=serverCommandStream.services();host.context=context;host.configstringFn=commandConfigstring;host.clearNotifyFn=commandClearNotify;host.clearUsercmdsFn=commandClearUsercmds;host.closeConsoleFn=commandCloseConsole;host.queueConsoleFn=commandQueueConsole;host.serverRunning=true
  fetched=serverCommandStream.get(context.cgameServerCommands,host,number);if fetched is error or not fetched then return fetched end if
  // The QVM remains authoritative.  Run the complete native cg_servercmds
  // state transition from the same tokenized command, suppressing its host
  // boundaries so chat, voice, shader and HUD effects cannot be duplicated.
  args=[];for index=0 to commands.argc(context.commandState)-1 args=args+[commands.argv(context.commandState,index)] end for
  context.nativeServerCmds.time=context.now;context.nativeServerCmds.serverCommandSequence=number;nativeCgameServercmds.serverCommand(context.nativeServerCmds,args,[],false);nativeCgameServercmds.playBufferedVoiceChats(context.nativeServerCmds,false)
  return fetched
end function
function currentCmdNumber(context) return context.commandNumber end function
function clientUsercmd(context,number)
  command=matchCommandRing.get(context.usercmdHistory,context.commandNumber,number);if command is error then return command end if
  if command==void then return cgameSyscall.BytesResult(false,bytes(0,0)) end if
  output=bytes(cgameSyscall.USERCMD_SIZE,0);n.writeU32(output,0,command.serverTime)
  for axis=0 to 2 n.writeU32(output,4+axis*4,command.angles[axis]) end for
  n.writeU32(output,16,command.buttons);output[20]=command.weapon&255;output[21]=command.forwardmove&255;output[22]=command.rightmove&255;output[23]=command.upmove&255
  return cgameSyscall.BytesResult(true,output)
end function
function setUsercmdValue(context,value,sensitivity) return cgameUsercmd.set(context.cgameUsercmd,value,sensitivity) end function
function cgameUserCmdValue(value) if value==void or value.context==void then return 0 end if;return cgameUsercmd.weapon(value.context.cgameUsercmd) end function
function cgameSensitivity(value) if value==void or value.context==void then return 1.0 end if;return cgameUsercmd.sensitivity(value.context.cgameUsercmd) end function
function memoryRemaining(context) return 8*1024*1024 end function

function cgameVector(vm,base,index,label) return common.readFloatVector(vm,common.argument(vm,base,index),3,label) end function
function cgameNullableVector(vm,base,index,label)
  address=common.argument(vm,base,index);if address==0 then return void end if
  return common.readFloatVector(vm,address,3,label)
end function
function cgameTraceResult(result)
  trace=result.trace
  return qworld.TraceResult(trace.allsolid,trace.startsolid,trace.fraction,result.endpos,trace.normal,trace.distance,trace.planeMetadata&255,(trace.planeMetadata>>8)&255,trace.surfaceFlags,trace.contents,0)
end function
function cgameBoxTrace(context,vm,base,capsule,transformed)
  context.cgameCollisionQueries=context.cgameCollisionQueries+1
  output=common.argument(vm,base,1);start=cgameVector(vm,base,2,"cgame trace start");finish=cgameVector(vm,base,3,"cgame trace end")
  mins=cgameNullableVector(vm,base,4,"cgame trace mins");maxs=cgameNullableVector(vm,base,5,"cgame trace maxs")
  model=common.argument(vm,base,6);mask=common.argument(vm,base,7);result=void
  if transformed then
    origin=cgameVector(vm,base,8,"cgame trace origin");angles=cgameVector(vm,base,9,"cgame trace angles")
    result=collision.transformedTrace(context.collisionWorld,start,finish,mins,maxs,model,mask,origin,angles,capsule,context.collisionWorld.patchesReady)
  else result=collision.boxTrace(context.collisionWorld,start,finish,mins,maxs,model,mask,capsule) end if
  return qworld.writeTrace(vm,output,cgameTraceResult(result))
end function
function decodeRefdef(vm,address)
  at=common.pointer(vm,address,368,"refdef");axis=[]
  for row=0 to 2 axis=axis+[readVector(vm.data,at+36+row*12)] end for
  return Refdef(n.readI32(vm.data,at),n.readI32(vm.data,at+4),n.readI32(vm.data,at+8),n.readI32(vm.data,at+12),n.bitsFloat(n.readI32(vm.data,at+16)),n.bitsFloat(n.readI32(vm.data,at+20)),readVector(vm.data,at+24),axis,n.readI32(vm.data,at+72),n.readI32(vm.data,at+76),slice(vm.data,at+80,32))
end function
function soundVector(vm,address,label) if address==0 then return void end if;return common.readFloatVector(vm,address,3,label) end function
function soundEvent(kind,entity,channel,handle,origin,velocity,axis,flag,text,text2) return SoundCommand(kind,entity,channel,handle,origin,velocity,axis,flag,text,text2) end function
function addCgamePolys(context,vm,base,multiple)
  shader=common.argument(vm,base,1);numVerts=common.argument(vm,base,2);numPolys=1;if multiple then numPolys=common.argument(vm,base,4) end if
  if numVerts<=0 or numPolys<0 then return fail("invalid cgame polygon counts") end if
  total=numVerts*numPolys;at=common.pointer(vm,common.argument(vm,base,3),total*24,"polyVert array");vertices=[]
  for index=0 to total-1
    offset=at+index*24;vertices=vertices+[sceneQueue.PolyVert(readVector(vm.data,offset),[n.bitsFloat(n.readI32(vm.data,offset+12)),n.bitsFloat(n.readI32(vm.data,offset+16))],[vm.data[offset+20],vm.data[offset+21],vm.data[offset+22],vm.data[offset+23]])]
  end for
  sceneQueue.addPolys(context.scene,shader,numVerts,vertices,numPolys);return 0
end function
function rendererModel(context,handle)
  if handle<=0 or handle>len(context.assets) or context.assetKinds[handle-1]!="model" or handle>len(context.modelAssets) then return void end if
  return context.modelAssets[handle-1]
end function
function rendererModelBounds(context,handle)
  model=rendererModel(context,handle);if model==void then return [[0.0,0.0,0.0],[0.0,0.0,0.0]] end if
  if qvmSceneGeometry.isInlineModel(model) then return collision.modelBounds(context.collisionWorld,collision.inlineModel(context.collisionWorld,model[0].index)) end if
  if typeof(model)=="string" then index=toNumber(decode(slice(bytes(model),1,len(bytes(model))-1)));return collision.modelBounds(context.collisionWorld,collision.inlineModel(context.collisionWorld,index)) end if
  model=qvmSceneGeometry.primaryMd3(model);if model==void then return [[0.0,0.0,0.0],[0.0,0.0,0.0]] end if
  return modelBounds.md3(model)
end function
function lerpModelTag(context,vm,base)
  context.cgameTagQueries=context.cgameTagQueries+1;output=common.pointer(vm,common.argument(vm,base,1),48,"orientation output")
  model=rendererModel(context,common.argument(vm,base,2));orientation=modelTags.missingOrientation()
  if model!=void and typeof(model)!="string" and not qvmSceneGeometry.isInlineModel(model) then
    model=qvmSceneGeometry.primaryMd3(model)
    tagModel=modelTags.md3(model.tags,model.bounds[0],model.bounds[1]);orientation=modelTags.lerpTag(modelTags.model(void,tagModel),common.argument(vm,base,3),common.argument(vm,base,4),n.bitsFloat(common.argument(vm,base,5)),common.readString(vm,common.argument(vm,base,6)))
    if orientation is error then return orientation end if
  end if
  writeVector(vm.data,output,orientation.origin);for row=0 to 2 writeVector(vm.data,output+12+row*12,orientation.axis[row]) end for
  if orientation.found then return 1 end if;return 0
end function
function lightForPoint(context,vm,base)
  if context.lightGrid==void or not context.lightGrid.valid then return 0 end if
  lightGrid.setDynamicLights(context.lightGrid,sceneQueue.sceneLights(context.scene));sample=lightGrid.entitySample(context.lightGrid,cgameVector(vm,base,1,"light point"))
  common.writeFloatVector(vm,common.argument(vm,base,2),sample.ambient,"ambient light");common.writeFloatVector(vm,common.argument(vm,base,3),sample.directed,"directed light");common.writeFloatVector(vm,common.argument(vm,base,4),sample.direction,"light direction");return 1
end function
function captureRenderView(context,vm,address)
  refdef=decodeRefdef(vm,address);context.latestRefdef=refdef;view=sceneQueue.finishScene(context.scene);context.renderViews=context.renderViews+[RenderView(refdef,view)];return 0
end function
function cgameMarkFragments(context,vm,base)
  numPoints=common.argument(vm,base,1);maxPoints=common.argument(vm,base,4);maxFragments=common.argument(vm,base,6)
  if numPoints<3 or numPoints>1024 or maxPoints<0 or maxPoints>131072 or maxFragments<0 or maxFragments>131072 then return fail("invalid cgame mark-fragment counts") end if
  pointsAt=common.pointer(vm,common.argument(vm,base,2),numPoints*12,"mark source points");points=[]
  for index=0 to numPoints-1 points=points+[readVector(vm.data,pointsAt+index*12)] end for
  projection=common.readFloatVector(vm,common.argument(vm,base,3),3,"mark projection")
  result=markFragments.project(context.markMap,context.collisionWorld,points,projection,maxPoints,maxFragments);if result is error then return result end if
  if len(result.points)>0 then outputAt=common.pointer(vm,common.argument(vm,base,5),maxPoints*12,"mark point output");for index=0 to len(result.points)-1 writeVector(vm.data,outputAt+index*12,result.points[index]) end for end if
  if len(result.fragments)>0 then fragmentsAt=common.pointer(vm,common.argument(vm,base,7),maxFragments*8,"mark fragment output");for index=0 to len(result.fragments)-1 fragment=result.fragments[index];n.writeU32(vm.data,fragmentsAt+index*8,fragment.firstPoint);n.writeU32(vm.data,fragmentsAt+index*8+4,fragment.numPoints) end for end if
  return len(result.fragments)
end function

function registerQvmFont(context,vm,base)
  name=common.readString(vm,common.argument(vm,base,1));pointSize=common.argument(vm,base,2);address=common.argument(vm,base,3)
  loaded=fontAbi.load(context.fontRegistry,context,registerShaderNoMip,name,pointSize);if loaded is error then return loaded end if
  if loaded.found then common.writeRaw(vm,address,loaded.data,fontAbi.FONT_INFO_SIZE,"fontInfo_t output") end if
  return 0
end function
function pcAddDefine(context,vm,base) return pcParser.addDefine(context.pcRegistry,common.readString(vm,common.argument(vm,base,1))) end function
function pcLoadSource(context,vm,base) return pcParser.load(context.pcRegistry,common.readString(vm,common.argument(vm,base,1))) end function
function pcFreeSource(context,vm,base) return pcParser.free(context.pcRegistry,common.argument(vm,base,1)) end function
function pcReadToken(context,vm,base)
  token=pcParser.read(context.pcRegistry,common.argument(vm,base,1));if token is error then return token end if;if token==void then return 0 end if
  data=pcParser.encode(token);if data is error then return data end if;common.writeRaw(vm,common.argument(vm,base,2),data,pcParser.TOKEN_SIZE,"pc_token_t output");return 1
end function
function pcSourceLine(context,vm,base)
  location=pcParser.location(context.pcRegistry,common.argument(vm,base,1));if location==void then return 0 end if
  common.writeBuffer(vm,common.argument(vm,base,2),64,location[0],"parser source filename");lineAt=common.pointer(vm,common.argument(vm,base,3),4,"parser source line");n.writeU32(vm.data,lineAt,location[1]);return 1
end function

function remapRendererShader(context,oldName,newName,timeOffset)
  // R_RemapShader resolves both names before attaching the replacement to all
  // existing shader variants. Registration here gives the in-memory handle
  // registry the same stable objects for scene and 2D material resolution.
  registerShader(context,oldName);registerShader(context,newName)
  result=shaderRemap.apply(context.shaderRemaps,context.assets,context.assetKinds,oldName,newName,timeOffset);if result is error then return result end if
  return 0
end function

function extendedCgame(context,vm,base,op)
  // Capture every retail sound/renderer submission. Structured decoding is
  // added per trap while the original module remains the sole scene producer.
  if op==18 then checksumAt=common.argument(vm,base,2);if checksumAt!=0 then output=common.pointer(vm,checksumAt,4,"map checksum output");if output is error then return output end if;n.writeU32(vm.data,output,0) end if;return 0 end if
  if op==19 then return len(context.collisionWorld.models) end if
  if op==20 then return collision.inlineModel(context.collisionWorld,common.argument(vm,base,1)) end if
  if op==21 then return 0 end if
  if op==22 or op==82 then return collision.tempBoxModel(context.collisionWorld,cgameVector(vm,base,1,"temporary mins"),cgameVector(vm,base,2,"temporary maxs"),op==82) end if
  if op==23 then context.cgameCollisionQueries=context.cgameCollisionQueries+1;return collision.pointContents(context.collisionWorld,cgameVector(vm,base,1,"point contents"),common.argument(vm,base,2)) end if
  if op==24 then context.cgameCollisionQueries=context.cgameCollisionQueries+1;return collision.transformedPointContents(context.collisionWorld,cgameVector(vm,base,1,"transformed point"),common.argument(vm,base,2),cgameVector(vm,base,3,"model origin"),cgameVector(vm,base,4,"model angles")) end if
  if op==25 or op==83 then return cgameBoxTrace(context,vm,base,op==83,false) end if
  if op==26 or op==84 then return cgameBoxTrace(context,vm,base,op==84,true) end if
  if op==27 then return cgameMarkFragments(context,vm,base) end if
  if op==28 then context.soundCommands=context.soundCommands+[soundEvent("start",common.argument(vm,base,2),common.argument(vm,base,3),common.argument(vm,base,4),soundVector(vm,common.argument(vm,base,1),"sound origin"),void,void,false,"","")];return 0 end if
  if op==29 then context.soundCommands=context.soundCommands+[soundEvent("local",-1,common.argument(vm,base,2),common.argument(vm,base,1),void,void,void,false,"","")];return 0 end if
  if op==30 then context.soundCommands=context.soundCommands+[soundEvent("clearLoops",-1,0,0,void,void,void,common.argument(vm,base,1)!=0,"","")];return 0 end if
  if op==31 or op==80 then context.soundCommands=context.soundCommands+[soundEvent("loop",common.argument(vm,base,1),0,common.argument(vm,base,4),soundVector(vm,common.argument(vm,base,2),"loop origin"),soundVector(vm,common.argument(vm,base,3),"loop velocity"),void,op==80,"","")];return 0 end if
  if op==32 then context.soundCommands=context.soundCommands+[soundEvent("position",common.argument(vm,base,1),0,0,soundVector(vm,common.argument(vm,base,2),"entity sound origin"),void,void,false,"","")];return 0 end if
  if op==33 then
    axes=[];axisAt=common.argument(vm,base,3);if axisAt!=0 then for row=0 to 2 axes=axes+[common.readFloatVector(vm,axisAt+row*12,3,"listener axis")] end for end if
    context.soundCommands=context.soundCommands+[soundEvent("listener",common.argument(vm,base,1),0,0,soundVector(vm,common.argument(vm,base,2),"listener origin"),void,axes,common.argument(vm,base,4)!=0,"","")];return 0
  end if
  if op==34 then return registerTypedAsset(context,"sound",common.readString(vm,common.argument(vm,base,1))) end if
  if op==35 then context.soundCommands=context.soundCommands+[soundEvent("music",-1,0,0,void,void,void,false,common.readString(vm,common.argument(vm,base,1)),common.readString(vm,common.argument(vm,base,2)))];return 0 end if
  if op==69 then context.soundCommands=context.soundCommands+[soundEvent("stopMusic",-1,0,0,void,void,void,false,"","")];return 0 end if
  if op==70 then sample=cgameMisc.sampleRealTime();if sample is error then return sample end if;return cgameMisc.realTime(vm,common.argument(vm,base,1),sample) end if
  if op==71 then return cgameMisc.snapVector(vm,common.argument(vm,base,1)) end if
  if op==81 then context.soundCommands=context.soundCommands+[soundEvent("stopLoop",common.argument(vm,base,1),0,0,void,void,void,false,"","")];return 0 end if
  if op==41 then
    at=common.pointer(vm,common.argument(vm,base,1),140,"refEntity");sceneQueue.addEntity(context.scene,n.readI32(vm.data,at),slice(vm.data,at,140));return 0
  end if
  if op==42 then return addCgamePolys(context,vm,base,false) end if
  if op==43 or op==85 then
    origin=common.readFloatVector(vm,common.argument(vm,base,1),3,"light origin");intensity=n.bitsFloat(common.argument(vm,base,2));red=n.bitsFloat(common.argument(vm,base,3));green=n.bitsFloat(common.argument(vm,base,4));blue=n.bitsFloat(common.argument(vm,base,5))
    sceneQueue.addDynamicLight(context.scene,origin,intensity,red,green,blue,op==85);return 0
  end if
  if op==44 then return captureRenderView(context,vm,common.argument(vm,base,1)) end if
  if op==45 then
    address=common.argument(vm,base,1);color=void;if address!=0 then color=common.readFloatVector(vm,address,4,"render color") end if;renderQueue.setColor(context.renderQueue,color);return 0
  end if
  if op==46 then
    values=[];for index=1 to 8 values=values+[n.bitsFloat(common.argument(vm,base,index))] end for
    renderQueue.stretchPic(context.renderQueue,values[0],values[1],values[2],values[3],values[4],values[5],values[6],values[7],common.argument(vm,base,9));return 0
  end if
  if op==47 then
    mins=common.pointer(vm,common.argument(vm,base,2),12,"model mins");maxs=common.pointer(vm,common.argument(vm,base,3),12,"model maxs")
    bounds=rendererModelBounds(context,common.argument(vm,base,1));writeVector(vm.data,mins,bounds[0]);writeVector(vm.data,maxs,bounds[1]);return 0
  end if
  if op==48 then return lerpModelTag(context,vm,base) end if
  if op==59 then return registerQvmFont(context,vm,base) end if
  if op==60 then return 0 end if
  if op==61 then return context.uiKeyCatcher end if
  if op==62 then context.uiKeyCatcher=common.argument(vm,base,1);return 0 end if
  if op==63 then return 0 end if
  if op==64 then return pcAddDefine(context,vm,base) end if
  if op==65 then return pcLoadSource(context,vm,base) end if
  if op==66 then return pcFreeSource(context,vm,base) end if
  if op==67 then return pcReadToken(context,vm,base) end if
  if op==68 then return pcSourceLine(context,vm,base) end if
  if op==73 then return lightForPoint(context,vm,base) end if
  if op==74 then return uiPlayCinematic(context,common.readString(vm,common.argument(vm,base,1)),common.argument(vm,base,2),common.argument(vm,base,3),common.argument(vm,base,4),common.argument(vm,base,5),common.argument(vm,base,6)) end if
  if op==75 then return uiCinematicStop(context,common.argument(vm,base,1)) end if
  if op==76 then return uiCinematicRun(context,common.argument(vm,base,1)) end if
  if op==77 then uiCinematicDraw(context,common.argument(vm,base,1));return 0 end if
  if op==78 then uiCinematicExtents(context,common.argument(vm,base,1),common.argument(vm,base,2),common.argument(vm,base,3),common.argument(vm,base,4),common.argument(vm,base,5));return 0 end if
  if op==79 then
    oldName=common.readString(vm,common.argument(vm,base,1));if oldName is error then return oldName end if
    newName=common.readString(vm,common.argument(vm,base,2));if newName is error then return newName end if
    timeOffset=common.readString(vm,common.argument(vm,base,3));if timeOffset is error then return timeOffset end if
    return remapRendererShader(context,oldName,newName,timeOffset)
  end if
  if op==86 then return cgameMisc.entityToken(vm,common.argument(vm,base,1),common.argument(vm,base,2),context.rendererEntityTokens) end if
  if op==87 then return addCgamePolys(context,vm,base,true) end if
  if op==88 then if rendererPvs.inPVS(context.collisionWorld,cgameVector(vm,base,1,"PVS point 1"),cgameVector(vm,base,2,"PVS point 2")) then return 1 end if;return 0 end if
  if op==89 then return memoryFileSeek.seek(context.files,common.argument(vm,base,1),common.argument(vm,base,2),common.argument(vm,base,3)) end if
  if op>=18 and op<=35 or op>=41 and op<=48 or op>=59 and op<=71 or op>=73 and op<=89 then return 0 end if
  return error(7643,"local QVM match: unsupported retail cgame trap "+str(op))
end function

function extendedCgameHost(context,vm,base,op)
  // Only the complete local-match Context owns diagnostics. Keeping this
  // wrapper outside the renderer implementation lets focused trap fixtures use
  // the minimal fields required by the trap they exercise.
  if op>=0 and op<len(context.cgameTrapCounts) then context.cgameTrapCounts[op]=context.cgameTrapCounts[op]+1 end if
  if op>=41 and op<=48 or op==59 or op==73 or op==79 or op==85 or op==87 or op==88 then context.renderCommands=context.renderCommands+[[op,context.now]] end if
  return extendedCgame(context,vm,base,op)
end function

function bootCgame(value)
  if value==void or value.context.latestSnapshot==void then return fail("snapshot is required before cgame initialization") end if
  context=value.context;shared=common.services(context.cvars,context.commandState,context)
  shared.printFn=emitPrint;shared.errorFn=emitError;shared.millisecondsFn=milliseconds;shared.consoleFn=consoleCommand
  shared.openFn=openFile;shared.readFn=readFile;shared.writeFn=writeFile;shared.closeFn=closeFile
  syscalls=cgameSyscall.services(shared,context);syscalls.addCommandFn=addCommand;syscalls.removeCommandFn=removeCommand;syscalls.sendClientCommandFn=sendClientCommand;syscalls.updateScreenFn=updateScreen
  syscalls.loadWorldFn=loadWorld;syscalls.registerModelFn=registerModel;syscalls.registerSkinFn=registerSkin;syscalls.registerShaderFn=registerShader;syscalls.registerShaderNoMipFn=registerShaderNoMip;syscalls.clearSceneFn=clearScene
  syscalls.getGlconfigFn=glconfigBytes;syscalls.getGameStateFn=gameStateBytes;syscalls.getCurrentSnapshotNumberFn=currentSnapshot;syscalls.getSnapshotFn=snapshotBytes;syscalls.getServerCommandFn=cgameServerCommand
  syscalls.getCurrentCmdNumberFn=currentCmdNumber;syscalls.getUserCmdFn=clientUsercmd;syscalls.setUserCmdValueFn=setUsercmdValue;syscalls.memoryRemainingFn=memoryRemaining;syscalls.extendedFn=extendedCgameHost
  syscalls.keyServices=cgameKeys.stateServices(context.cgameKeys)
  syscalls.pcServices=cgamePc.registryServices(context.pcRegistry)
  host=cgameVm.services(value.runtime,cgameSyscall.callback(syscalls),loadClientVm,callVm,freeVm);host.context=context;host.millisecondsFn=milliseconds;host.serverInfoFn=getServerinfo
  client=cgameVm.create(host);if client is error then return client end if
  // Cmd_ExecuteString owns the original dispatch order.  Install the live
  // QVM callbacks before CG_INIT so its completion-only registrations are
  // immediately usable by the same command state.
  value.cgame=client;context.commandState.context=value;context.commandState.clientRunning=true;context.commandState.serverRunning=true
  context.commandState.clientGameCommandFn=clientGameCommand;context.commandState.serverGameCommandFn=serverGameCommand;context.commandState.uiGameCommandFn=uiGameCommand;context.commandState.forwardCommandFn=forwardClientCommand
  processedSnapshot=context.snapshotNumber-1;if processedSnapshot<0 then processedSnapshot=0 end if
  cgameVm.initialize(client,processedSnapshot,context.cgameServerCommands.lastExecuted,0,0,0)
  nativeInit=nativeCgameMain.init(context.nativeMain,processedSnapshot,context.cgameServerCommands.lastExecuted,0,context.configstrings[nativeCgameMain.CS_GAME_VERSION],640,480,[],true);if nativeInit is error then return nativeInit end if
  for clientNum=0 to nativeCgamePlayers.MAX_CLIENTS-1
    playerConfig=context.configstrings[nativeCgameMain.CS_PLAYERS+clientNum]
    if playerConfig!="" then
      nativeCgamePlayers.newClientInfo(context.nativePlayers,clientNum,playerConfig,"",true,true);clientInfo=context.nativePlayers.clients[clientNum]
      if len(clientInfo.animations)==0 then for animationIndex=0 to nativeCgamePlayers.MAX_TOTALANIMATIONS-1 clientInfo.animations=clientInfo.animations+[nativeCgamePlayers.animation(0,1,1,100,100,false,false)] end for end if
    end if
  end for
  nativeCgameCommands.syncVmCvars(context.nativeCgameCommands,context.cvars);return client
end function

function drawCgame(value,serverTime)
  if value==void or value.cgame==void then return fail("cgame is not active") end if
  value.context.now=serverTime;value.context.renderViews=[];drawn=cgameVm.drawActiveFrame(value.cgame,serverTime,0,false);if drawn is error then return drawn end if;value.context.nativeMain.time=serverTime;nativeCgameMain.vmMain(value.context.nativeMain,nativeCgameMain.CG_DRAW_ACTIVE_FRAME,[serverTime,0,0],[],value.context.nativeMain.gameVersion,640,480,true);nativeCgameCommands.syncVmCvars(value.context.nativeCgameCommands,value.context.cvars);return drawn
end function

function uiClipboard(context) return "" end function
function uiClientState(context) return uiHost.encodeClientState(context.uiClient) end function
function uiConfigString(context,index) if index<0 or index>=len(context.configstrings) then return void end if;return context.configstrings[index] end function
function uiKeyName(context,key) return cgameKeys.keynumToString(key) end function
function uiBinding(context,key) return cgameKeys.getBinding(context.cgameKeys,key) end function
function uiSetBinding(context,key,text) cgameKeys.setBinding(context.cgameKeys,key,text);return void end function
function uiKeyDown(context,key) return cgameKeys.isDown(context.cgameKeys,key) end function
function uiGetOverstrike(context) return cgameKeys.getOverstrike(context.cgameKeys) end function
function uiSetOverstrike(context,value) return cgameKeys.setOverstrike(context.cgameKeys,value) end function
function uiClearKeys(context) return cgameKeys.clearStates(context.cgameKeys) end function
function uiGetCatcher(context) return cgameKeys.getCatcher(context.cgameKeys) end function
function uiSetCatcher(context,value) context.uiKeyCatcher=value;cgameKeys.setCatcher(context.cgameKeys,value);return void end function
function setKeyDown(value,key,down) if value==void or value.context==void then return false end if;return cgameKeys.setDown(value.context.cgameKeys,key,down) end function
function keyBinding(value,key) if value==void or value.context==void then return "" end if;return cgameKeys.getBinding(value.context.cgameKeys,key) end function
function setKeyBinding(value,key,text) if value==void or value.context==void then return false end if;return cgameKeys.setBinding(value.context.cgameKeys,key,text) end function
function queueInputCommand(value,text) if value==void or value.context==void then return false end if;commands.addText(value.context.commandState,text);return true end function
function bindingConfigText(value) if value==void or value.context==void then return "unbindall\n" end if;return bindingConfig.bindingText(bindingConfig.create(value.context.cgameKeys)) end function
function loadBindingConfig(value,text) if value==void or value.context==void then return fail("match and binding config text are required") end if;return bindingConfig.loadText(bindingConfig.create(value.context.cgameKeys),value.context.commandState,text) end function
function keyCatcher(value) if value==void or value.context==void then return 0 end if;return cgameKeys.getCatcher(value.context.cgameKeys) end function
function keyIsDown(value,key) if value==void or value.context==void then return false end if;return cgameKeys.isDown(value.context.cgameKeys,key) end function
function syncClientTextInput(value)
  if value==void or value.context==void or value.context.clientTextInput==void then return false end if
  value.context.clientTextInput.catcher=cgameKeys.getCatcher(value.context.cgameKeys);value.context.clientTextInput.connectionState=value.context.uiClient.connState;return true
end function
function clientTextKey(value,key,shift,ctrl)
  if not syncClientTextInput(value) then return false end if
  handled=consoleInput.caughtKey(value.context.clientTextInput,key,shift,ctrl);cgameKeys.setCatcher(value.context.cgameKeys,value.context.clientTextInput.catcher);value.context.uiKeyCatcher=value.context.clientTextInput.catcher;return handled
end function
function clientTextChar(value,ch)
  if not syncClientTextInput(value) then return false end if
  if ch==96 or ch==126 then return true end if
  handled=consoleInput.caughtChar(value.context.clientTextInput,ch);cgameKeys.setCatcher(value.context.cgameKeys,value.context.clientTextInput.catcher);return handled
end function
function clientTextState(value) if value==void or value.context==void then return void end if;return value.context.clientTextInput end function
function clientConsoleState(value) if value==void or value.context==void or value.context.clientTextInput==void then return void end if;return value.context.clientTextInput.consoleRuntime end function
function updateClientConsole(value,now,frameMsec)
  runtime=clientConsoleState(value);if runtime==void then return false end if;runtime.realtime=now;runtime.realFrametime=frameMsec;value.context.clientTextInput.connectionState=value.context.uiClient.connState;runtime.connectionState=value.context.clientTextInput.connectionState;runtime.keyCatchers=value.context.clientTextInput.catcher;runtime.uiOrCgameCatcher=runtime.keyCatchers&(clientConsole.KEYCATCH_UI|clientConsole.KEYCATCH_CGAME);clientConsole.Con_RunConsole(runtime);return true
end function
function clientConsoleView(value,now,frameMsec,version)
  if not updateClientConsole(value,now,frameMsec) then return void end if;return clientConsole.Con_DrawConsole(clientConsoleState(value),640,640,480,version)
end function
function toggleClientConsole(value) if value==void or value.context==void then return false end if;return toggleConsoleCommand(value.context.commandState,value.context) end function
function beginClientMessage(value,team,playerNum) if value==void or value.context==void then return false end if;consoleInput.beginMessage(value.context.clientTextInput,team,playerNum);syncConsoleInputCatcher(value.context);return true end function
function uiUnique(values,value)
  for each current in values if strings.toLowerAscii(current)==strings.toLowerAscii(value) then return values end if end for
  return values+[value]
end function
function uiFileList(context,path,extension)
  if path=="$modlist" then return [] end if
  prefix=path;if prefix!="" and not strings.endsWith(prefix,"/") then prefix=prefix+"/" end if
  lowerPrefix=strings.toLowerAscii(prefix);wanted=strings.toLowerAscii(extension);directories=wanted=="/"
  if wanted!="" and not directories and wanted[0]!="." then wanted="."+wanted end if
  result=[]
  for each entry in context.archive.entries
    lowerName=strings.toLowerAscii(entry.name)
    if strings.startsWith(lowerName,lowerPrefix) and len(entry.name)>len(prefix) then
      relative=decode(slice(bytes(entry.name),len(bytes(prefix)),len(bytes(entry.name))-len(bytes(prefix))))
      parts=strings.split(relative,"/")
      if directories then
        if len(parts)>1 and parts[0]!="" then result=uiUnique(result,parts[0]) end if
      else if len(parts)==1 and (wanted=="" or strings.endsWith(lowerName,wanted)) then
        result=result+[relative]
      end if
    end if
  end for
  return result
end function
function uiSetColor(context,color) return renderQueue.setColor(context.renderQueue,color) end function
function uiStretchPic(context,values,shader) return renderQueue.stretchPic(context.renderQueue,values[0],values[1],values[2],values[3],values[4],values[5],values[6],values[7],shader) end function
function uiLanLoad(context) return uiLanCache.load(context.uiLan,context.uiLanCacheHost) end function
function uiLanSave(context) return uiLanCache.save(context.uiLan,context.uiLanCacheHost) end function
function uiLanAdd(context,source,name,address) return uiLan.add(context.uiLan,source,name,address) end function
function uiLanRemove(context,source,address) return uiLan.remove(context.uiLan,source,address) end function
function uiLanPingCount(context) return uiLan.pingCount(context.uiLan) end function
function uiLanClearPing(context,index) return uiLan.clearPing(context.uiLan,index) end function
function uiLanPing(context,index) return uiLan.getPing(context.uiLan,index) end function
function uiLanPingInfo(context,index) return uiLan.getPingInfo(context.uiLan,index) end function
function uiLanServerCount(context,source) return uiLan.count(context.uiLan,source) end function
function uiLanServerAddress(context,source,index) return uiLan.address(context.uiLan,source,index) end function
function uiLanServerInfo(context,source,index) return uiLan.serverInfo(context.uiLan,source,index) end function
function uiLanServerPing(context,source,index) return uiLan.serverPing(context.uiLan,source,index) end function
function uiLanMarkVisible(context,source,index,visible) return uiLan.markVisible(context.uiLan,source,index,visible) end function
function uiLanIsVisible(context,source,index) return uiLan.isVisible(context.uiLan,source,index) end function
function uiLanUpdatePings(context,source)
  if context.uiLanQueries==void then return uiLan.updateVisiblePings(context.uiLan,source) end if
  uiLanQueries.setRealtime(context.uiLanQueries,context.now);return uiLanQueries.updateVisiblePings(context.uiLanQueries,source)
end function
function uiLanResetPings(context,source) return uiLan.resetPings(context.uiLan,source) end function
function uiLanServerStatus(context,address)
  if context.uiLanQueries==void then return uiLan.serverStatus(context.uiLan,address) end if
  uiLanQueries.setRealtime(context.uiLanQueries,context.now);return uiLanQueries.serverStatus(context.uiLanQueries,address)
end function
function uiLanCompare(context,source,sortKey,sortDir,first,second) return uiLan.compare(context.uiLan,source,sortKey,sortDir,first,second) end function
function uiRegisterSound(context,name,compressed) return registerTypedAsset(context,"sound",name) end function
function uiLocalSound(context,handle,channel) context.soundCommands=context.soundCommands+[soundEvent("local",-1,channel,handle,void,void,void,false,"","")];return void end function
function uiStopMusic(context) context.soundCommands=context.soundCommands+[soundEvent("stopMusic",-1,0,0,void,void,void,false,"","")];return void end function
function uiStartMusic(context,intro,trackLoop) context.soundCommands=context.soundCommands+[soundEvent("music",-1,0,0,void,void,void,false,intro,trackLoop)];return void end function
function uiRealTime(context) return [n.quotient(context.now,1000),bytes(uiMedia.QTIME_SIZE,0)] end function
function uiRemap(context,oldName,newName,timeOffset) remapRendererShader(context,oldName,newName,timeOffset);return void end function
function uiCdKey(context) return "0000000000000000" end function
function uiSetCdKey(context,key) return void end function
function uiVerifyCdKey(context,key,checksum) return true end function
function uiSeek(context,handle,offset,origin) return -1 end function
function uiPb(context,status) return void end function
function uiPlayCinematic(context,name,x,y,w,h,bits) return cinematics.play(context.cinematics,name,x,y,w,h,bits,context.now) end function
function uiCinematicStop(context,handle) return cinematics.stop(context.cinematics,handle) end function
function uiCinematicRun(context,handle) return cinematics.run(context.cinematics,handle,context.now) end function
function uiCinematicDraw(context,handle) cinematics.draw(context.cinematics,handle);return void end function
function uiCinematicExtents(context,handle,x,y,w,h) cinematics.setExtents(context.cinematics,handle,x,y,w,h);return void end function

function extendedUi(context,vm,base,op)
  if op==22 then at=common.pointer(vm,common.argument(vm,base,1),140,"UI refEntity");sceneQueue.addEntity(context.scene,n.readI32(vm.data,at),slice(vm.data,at,140));return 0 end if
  if op==23 then return addCgamePolys(context,vm,base,false) end if
  if op==24 then
    origin=common.readFloatVector(vm,common.argument(vm,base,1),3,"UI light origin")
    sceneQueue.addDynamicLight(context.scene,origin,n.bitsFloat(common.argument(vm,base,2)),n.bitsFloat(common.argument(vm,base,3)),n.bitsFloat(common.argument(vm,base,4)),n.bitsFloat(common.argument(vm,base,5)),false);return 0
  end if
  if op==25 then return captureRenderView(context,vm,common.argument(vm,base,1)) end if
  if op==29 then return lerpModelTag(context,vm,base) end if
  if op==30 then return 0 end if
  if op==55 then return registerQvmFont(context,vm,base) end if
  if op==56 then
    mins=common.pointer(vm,common.argument(vm,base,2),12,"UI model mins");maxs=common.pointer(vm,common.argument(vm,base,3),12,"UI model maxs")
    bounds=rendererModelBounds(context,common.argument(vm,base,1));writeVector(vm.data,mins,bounds[0]);writeVector(vm.data,maxs,bounds[1]);return 0
  end if
  if op==57 then return pcAddDefine(context,vm,base) end if
  if op==58 then return pcLoadSource(context,vm,base) end if
  if op==59 then return pcFreeSource(context,vm,base) end if
  if op==60 then return pcReadToken(context,vm,base) end if
  if op==61 then return pcSourceLine(context,vm,base) end if
  return error(7643,"local QVM match: unsupported retail UI trap "+str(op))
end function

function bootUi(value)
  if value==void then return fail("match is required before UI initialization") end if
  context=value.context;context.uiLanIngress=uiLanIngress.create(context.uiLan);if context.uiLanIngress is error then return context.uiLanIngress end if
  live=try(uiLanUdp.open(context.uiLanIngress));if not (live is error) then context.uiLanUdp=live;context.uiLanQueries=uiLanQueries.create(context.uiLan,context.uiLanIngress,uiLanUdp.services(live)) end if
  shared=common.services(context.cvars,context.commandState,context);shared.printFn=emitPrint;shared.errorFn=emitError;shared.millisecondsFn=milliseconds;shared.consoleFn=consoleCommand
  shared.openFn=openFile;shared.readFn=readFile;shared.writeFn=writeFile;shared.closeFn=closeFile
  syscalls=uiSyscall.services(shared,context);syscalls.client.clipboardFn=uiClipboard;syscalls.client.glconfigFn=glconfigBytes;syscalls.client.clientStateFn=uiClientState;syscalls.client.configStringFn=uiConfigString
  syscalls.keys.keyNameFn=uiKeyName;syscalls.keys.bindingFn=uiBinding;syscalls.keys.setBindingFn=uiSetBinding;syscalls.keys.isDownFn=uiKeyDown;syscalls.keys.getOverstrikeFn=uiGetOverstrike;syscalls.keys.setOverstrikeFn=uiSetOverstrike;syscalls.keys.clearFn=uiClearKeys;syscalls.keys.getCatcherFn=uiGetCatcher;syscalls.keys.setCatcherFn=uiSetCatcher
  syscalls.renderer.registerModelFn=registerModel;syscalls.renderer.registerSkinFn=registerSkin;syscalls.renderer.registerShaderNoMipFn=registerShaderNoMip;syscalls.renderer.clearSceneFn=clearScene;syscalls.renderer.setColorFn=uiSetColor;syscalls.renderer.drawStretchPicFn=uiStretchPic;syscalls.renderer.updateScreenFn=updateScreen
  syscalls.lan.loadFn=uiLanLoad;syscalls.lan.saveFn=uiLanSave;syscalls.lan.addFn=uiLanAdd;syscalls.lan.removeFn=uiLanRemove;syscalls.lan.pingQueueCountFn=uiLanPingCount;syscalls.lan.clearPingFn=uiLanClearPing;syscalls.lan.getPingFn=uiLanPing;syscalls.lan.getPingInfoFn=uiLanPingInfo;syscalls.lan.serverCountFn=uiLanServerCount;syscalls.lan.serverAddressFn=uiLanServerAddress;syscalls.lan.serverInfoFn=uiLanServerInfo;syscalls.lan.serverPingFn=uiLanServerPing;syscalls.lan.markVisibleFn=uiLanMarkVisible;syscalls.lan.isVisibleFn=uiLanIsVisible;syscalls.lan.updatePingsFn=uiLanUpdatePings;syscalls.lan.resetPingsFn=uiLanResetPings;syscalls.lan.serverStatusFn=uiLanServerStatus;syscalls.lan.compareFn=uiLanCompare
  syscalls.fileListFn=uiFileList;syscalls.memoryRemainingFn=memoryRemaining;syscalls.extendedFn=extendedUi;media=uiMedia.services(context);media.sound.registerFn=uiRegisterSound;media.sound.startLocalFn=uiLocalSound;media.sound.stopBackgroundFn=uiStopMusic;media.sound.startBackgroundFn=uiStartMusic
  media.cinematic.playFn=uiPlayCinematic;media.cinematic.stopFn=uiCinematicStop;media.cinematic.runFn=uiCinematicRun;media.cinematic.drawFn=uiCinematicDraw;media.cinematic.setExtentsFn=uiCinematicExtents
  media.platform.realTimeFn=uiRealTime;media.platform.remapShaderFn=uiRemap;media.platform.getCdKeyFn=uiCdKey;media.platform.setCdKeyFn=uiSetCdKey;media.platform.verifyCdKeyFn=uiVerifyCdKey;media.platform.seekFn=uiSeek;media.platform.pbStatusFn=uiPb;syscalls.mediaServices=media
  host=uiVm.services(value.runtime,uiSyscall.callback(syscalls),loadClientVm,callVm,freeVm);ui=uiVm.create(host);if ui is error then if context.uiLanUdp!=void then uiLanUdp.close(context.uiLanUdp);context.uiLanUdp=void end if;return ui end if
  initialized=uiVm.initialize(ui,context.uiClient.connState,0,1);if initialized is error then if context.uiLanUdp!=void then uiLanUdp.close(context.uiLanUdp);context.uiLanUdp=void end if;return initialized end if;value.ui=ui;return ui
end function
function refreshUi(value,time) if value==void or value.ui==void then return fail("UI is not active") end if;value.context.now=time;if value.context.uiLanQueries!=void then uiLanQueries.setRealtime(value.context.uiLanQueries,time) end if;if value.context.uiLanUdp!=void then uiLanUdp.pump(value.context.uiLanUdp,64) end if;result=uiVm.refresh(value.ui,time);if not (result is error) then value.context.uiFrames=value.context.uiFrames+1 end if;return result end function
function setUiMenu(value,menu) if value==void or value.ui==void then return fail("UI is not active") end if;return uiVm.setActiveMenu(value.ui,menu) end function

function setUiConnection(value,connState,connectPacketCount,servername,messageString)
  if value==void or value.context==void then return fail("match is required for UI connection state") end if
  current=value.context.uiClient;next=uiHost.createClientState(connState,connectPacketCount,current.clientNum,servername,current.updateInfoString,messageString);if next is error then return next end if
  value.context.uiClient=next;return void
end function
function setUiUpdateInfo(value,updateInfoString)
  if value==void or value.context==void or typeof(updateInfoString)!="string" then return fail("match and update info are required") end if
  value.context.uiClient.updateInfoString=updateInfoString;return void
end function

function shutdown(value) if value!=void then cinematics.closeAll(value.context.cinematics);if value.ui!=void then cgameKeys.setCatcher(value.context.cgameKeys,cgameKeys.getCatcher(value.context.cgameKeys)&(~uiHost.KEYCATCH_UI));uiVm.shutdown(value.ui) end if;if value.context.uiLanUdp!=void then ignored=try(uiLanUdp.close(value.context.uiLanUdp));value.context.uiLanUdp=void end if;if value.cgame!=void then nativeCgameMain.shutdown(value.context.nativeMain,true);cgameVm.shutdown(value.cgame) end if;result=gameVm.shutdown(value.game);aiChatProfiles.clearCache(value.context.aiChat);aiChatStrings.clear(value.context.aiChatStrings);aiChatMatches.clear(value.context.aiChatMatches);aiConsoleMessages.shutdown(value.context.aiConsole);aiResourcePools.shutdown(value.context.aiResources);aiLevelItems.shutdown(value.context.aiLevelItems);aiItemWeights.shutdown(value.context.aiItemWeights);aiWeaponWeights.shutdown(value.context.aiWeaponWeights);return result end if;return void end function
