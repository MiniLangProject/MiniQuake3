// SPDX-License-Identifier: GPL-2.0-or-later
// In-process Baseq3 QVM match host. This is the bridge from the engine services
// to the retail qagame/cgame modules, independent of the playable preview.
package mq3.engine.local_qvm_match

import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.shared.parser as parser
import mq3.qcommon.cvar as cvar
import mq3.qcommon.command_buffer as commands
import mq3.vm.runtime as runtime
import mq3.vm.syscall_common as common
import mq3.vm.syscall_qagame as qagame
import mq3.vm.syscall_qagame_world as qworld
import mq3.server.game_vm as gameVm
import mq3.game.entitystate as entitystate
import mq3.game.playerstate as playerstate
import mq3.vm.syscall_cgame as cgameSyscall
import mq3.client.cgame_vm as cgameVm
import mq3.compat.numeric as n
import mq3.renderer.scene_queue as sceneQueue
import mq3.renderer.command_queue as renderQueue
import std.fs as fs

const MAX_CONFIGSTRINGS=1024
const MAX_CLIENTS=8

struct FileCursor data offset end struct
struct Context archive entityParser cvars commandState configstrings userinfos files nextFile prints errors console gameEntities gameClients entityCount entityStride clientStride now frames linked assets renderCommands soundCommands latestSnapshot snapshotNumber scene renderQueue qvmRoot end struct
struct Boot game runtime context cgame end struct
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
function emitPrint(context,text) context.prints=context.prints+[text];return void end function
function emitError(context,text) context.errors=context.errors+[text];return void end function
function consoleCommand(context,when,text) context.console=context.console+[[when,text]];return void end function

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
  cursor=context.files[handle];available=len(cursor.data)-cursor.offset;if count>available then count=available end if
  result=slice(cursor.data,cursor.offset,count);cursor.offset=cursor.offset+count;return result
end function
function writeFile(context,handle,data) return 0 end function
function closeFile(context,handle) if handle>0 and handle<len(context.files) then context.files[handle]=FileCursor(bytes(0,0),-1) end if;return void end function

function locateGameData(context,entities,count,entityStride,clients,clientStride)
  context.gameEntities=entities;context.gameClients=clients;context.entityCount=count;context.entityStride=entityStride;context.clientStride=clientStride;return void
end function
function dropClient(context,client,text) context.console=context.console+[[client,"drop "+text]];return void end function
function sendServerCommand(context,client,text) context.console=context.console+[[client,text]];return void end function
function setConfigstring(context,index,text) if index>=0 and index<MAX_CONFIGSTRINGS then context.configstrings[index]=text end if;return void end function
function getConfigstring(context,index) if index<0 or index>=MAX_CONFIGSTRINGS then return "" end if;return context.configstrings[index] end function
function getUserinfo(context,index) if index<0 or index>=len(context.userinfos) then return "" end if;return context.userinfos[index] end function
function setUserinfo(context,index,text) if index>=0 and index<len(context.userinfos) then context.userinfos[index]=text end if;return void end function
function getServerinfo(context) return "\\sv_hostname\\MiniQuake3\\mapname\\q3dm1\\sv_maxclients\\8\\g_gametype\\0" end function
function setBrushModel(context,entity,name) return void end function
function inPvs(context,a,b,ignorePortals) return true end function
function adjustPortal(context,entity,isOpen) return void end function
function areasConnected(context,a,b) return true end function
function entityIndex(context,entity)
  if context.entityStride<=0 or entity<context.gameEntities then return -1 end if
  delta=entity-context.gameEntities;if delta%context.entityStride!=0 then return -1 end if
  index=delta/context.entityStride;if index<0 or index>=context.entityCount then return -1 end if;return index
end function
function linkEntity(context,entity) index=entityIndex(context,entity);if index>=0 then context.linked[index]=true end if;return void end function
function unlinkEntity(context,entity) index=entityIndex(context,entity);if index>=0 then context.linked[index]=false end if;return void end function
function allocateBot(context) return -1 end function
function freeBot(context,index) return void end function
function entityToken(context)
  token=parser.parseExt(context.entityParser,true)
  return qagame.TokenResult(token!="",token)
end function
function entityString(context) return context.entityParser end function
function clearClient(context,index) return void end function
function botEnable(context) return 0 end function
function extendedQagame(context,vm,base,op)
  // Botlib stays disabled for the first human local-match milestone. Returning
  // zero matches unsuccessful/empty AAS and bot queries without inventing bots.
  if op>=200 and op<600 then return 0 end if
  return error(7643,"local QVM match: unsupported retail qagame trap "+str(op))
end function

function traceEmpty(context,start,mins,maxs,finish,passEntity,mask,capsule)
  return qworld.TraceResult(false,false,1.0,finish,[0.0,0.0,1.0],0.0,2,0,0,0,1023)
end function
function pointContents(context,point,passEntity) return 0 end function
function entitiesInBox(context,mins,maxs,capacity) return [] end function
function entityContact(context,mins,maxs,entity,capsule) return false end function
function getUsercmd(context,index) return qworld.userCommand(context.now,[0,0,0],0,2,0,0,0) end function

function seedCvars(registry)
  cvar.get(registry,"mapname","q3dm1",cvar.SERVERINFO|cvar.ROM)
  cvar.get(registry,"sv_maxclients","8",cvar.SERVERINFO|cvar.LATCH)
  cvar.get(registry,"g_gametype","0",cvar.SERVERINFO|cvar.LATCH)
  cvar.get(registry,"bot_enable","0",cvar.LATCH)
  cvar.get(registry,"g_log","",cvar.ARCHIVE)
  cvar.get(registry,"dedicated","0",cvar.ROM)
  return void
end function

function bootWithQvms(archive,map,now,qvmRoot)
  if archive==void or map==void or now<0 then return fail("archive, map and non-negative time are required") end if
  entityBytes=slice(map.data,map.offsets[0],map.lengths[0]);registry=cvar.create();seedCvars(registry)
  scene=sceneQueue.create(4096,65536);scene.registered=true;scene.worldLoaded=true
  context=Context(archive,parser.create(entityBytes),registry,commands.create(),array(MAX_CONFIGSTRINGS,""),array(MAX_CLIENTS,"\\name\\Sarge\\rate\\25000"),[void],1,[],[],[],0,0,0,0,0,now,0,array(1024,false),[],[],[],void,0,scene,renderQueue.create(void,void),qvmRoot)
  runtimeHost=runtime.services();runtimeHost.context=context;runtimeHost.loadFn=imageLoader
  machineRuntime=runtime.create(runtimeHost);if machineRuntime is error then return machineRuntime end if
  shared=common.services(registry,context.commandState,context);shared.printFn=emitPrint;shared.errorFn=emitError;shared.millisecondsFn=milliseconds;shared.consoleFn=consoleCommand
  shared.openFn=openFile;shared.readFn=readFile;shared.writeFn=writeFile;shared.closeFn=closeFile
  gameSyscalls=qagame.services(shared,context);gameSyscalls.locateGameDataFn=locateGameData;gameSyscalls.dropClientFn=dropClient;gameSyscalls.sendServerCommandFn=sendServerCommand
  gameSyscalls.setConfigstringFn=setConfigstring;gameSyscalls.getConfigstringFn=getConfigstring;gameSyscalls.getUserinfoFn=getUserinfo;gameSyscalls.setUserinfoFn=setUserinfo
  gameSyscalls.getServerinfoFn=getServerinfo;gameSyscalls.setBrushModelFn=setBrushModel;gameSyscalls.inPvsFn=inPvs;gameSyscalls.adjustAreaPortalFn=adjustPortal;gameSyscalls.areasConnectedFn=areasConnected
  gameSyscalls.linkEntityFn=linkEntity;gameSyscalls.unlinkEntityFn=unlinkEntity;gameSyscalls.botAllocateClientFn=allocateBot;gameSyscalls.botFreeClientFn=freeBot;gameSyscalls.entityTokenFn=entityToken
  gameSyscalls.extendedFn=extendedQagame
  world=qworld.services(context);world.traceFn=traceEmpty;world.pointContentsFn=pointContents;world.entitiesInBoxFn=entitiesInBox;world.entityContactFn=entityContact;world.getUsercmdFn=getUsercmd;gameSyscalls.worldServices=world
  host=gameVm.services(machineRuntime,qagame.callback(gameSyscalls),loadVm,callVm,restartVm,freeVm);host.context=context;host.millisecondsFn=milliseconds;host.entityStringFn=entityString;host.clearClientEntityFn=clearClient;host.botEnableFn=botEnable
  game=gameVm.create(host);if game is error then return game end if
  gameVm.initialize(game,now,MAX_CLIENTS)
  return Boot(game,machineRuntime,context,void)
end function

function boot(archive,map,now) return bootWithQvms(archive,map,now,"") end function

function connectLocal(value,clientNum)
  denied=gameVm.clientConnect(value.game,clientNum,true,false);if denied is error then return denied end if
  if denied!=0 then return fail("GAME_CLIENT_CONNECT rejected local client") end if
  gameVm.clientBegin(value.game,clientNum);return void
end function

function runFrame(value,serverTime)
  value.context.now=serverTime;result=gameVm.runFrame(value.game,serverTime);if result is error then return result end if
  value.context.frames=value.context.frames+1;return result
end function

function snapshot(value,clientNum)
  if value==void or clientNum<0 or clientNum>=MAX_CLIENTS then return fail("valid match and client are required") end if
  context=value.context;machine=value.game.slot.machine
  if machine==void or context.gameClients<=0 or context.entityStride<=0 then return fail("qagame did not locate its state") end if
  ps=playerstate.load(machine.data,context.gameClients+clientNum*context.clientStride);if ps is error then return ps end if
  entities=[]
  for index=0 to context.entityCount-1
    if context.linked[index] then
      state=entitystate.load(machine.data,context.gameEntities+index*context.entityStride);if state is error then return state end if
      state.number=index;entities=entities+[state]
    end if
  end for
  result=Snapshot(context.now,ps,entities);context.latestSnapshot=result;context.snapshotNumber=context.snapshotNumber+1;return result
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
  return cgameSyscall.BytesResult(true,output)
end function

function currentSnapshot(context) return cgameSyscall.SnapshotNumber(context.snapshotNumber,context.now) end function
function registerAsset(context,name) context.assets=context.assets+[name];return len(context.assets) end function
function addCommand(context,name) context.console=context.console+[[0,"add "+name]];return void end function
function removeCommand(context,name) return void end function
function sendClientCommand(context,name) context.console=context.console+[[0,"client "+name]];return void end function
function updateScreen(context) return void end function
function loadWorld(context,name) context.renderCommands=context.renderCommands+[[36,name]];return void end function
function clearScene(context) context.renderCommands=[];sceneQueue.clearScene(context.scene);return void end function
function noServerCommand(context,number) return false end function
function currentCmdNumber(context) return 0 end function
function noUsercmd(context,number) return cgameSyscall.BytesResult(false,bytes(0,0)) end function
function setUsercmdValue(context,value,sensitivity) return void end function
function memoryRemaining(context) return 8*1024*1024 end function

function extendedCgame(context,vm,base,op)
  // Capture every retail sound/renderer submission. Structured decoding is
  // added per trap while the original module remains the sole scene producer.
  if op>=28 and op<=35 or op==69 or op==80 or op==81 then context.soundCommands=context.soundCommands+[[op,context.now]] end if
  if op>=41 and op<=48 or op==59 or op==73 or op==79 or op==85 or op==87 or op==88 then context.renderCommands=context.renderCommands+[[op,context.now]] end if
  if op==18 then checksumAt=common.argument(vm,base,2);if checksumAt!=0 then n.writeU32(vm.data,checksumAt&vm.mask,0) end if;return 0 end if
  if op==19 then return 1 end if
  if op==20 or op==21 or op==22 or op==82 then return 0 end if
  if op==34 then return registerAsset(context,common.readString(vm,common.argument(vm,base,1))) end if
  if op==41 then
    at=common.pointer(vm,common.argument(vm,base,1),4,"refEntity");sceneQueue.addEntity(context.scene,n.readI32(vm.data,at),slice(vm.data,at,140));return 0
  end if
  if op==43 or op==85 then
    origin=common.readFloatVector(vm,common.argument(vm,base,1),3,"light origin");intensity=n.bitsFloat(common.argument(vm,base,2));red=n.bitsFloat(common.argument(vm,base,3));green=n.bitsFloat(common.argument(vm,base,4));blue=n.bitsFloat(common.argument(vm,base,5))
    sceneQueue.addDynamicLight(context.scene,origin,intensity,red,green,blue,op==85);return 0
  end if
  if op==45 then
    address=common.argument(vm,base,1);color=void;if address!=0 then color=common.readFloatVector(vm,address,4,"render color") end if;renderQueue.setColor(context.renderQueue,color);return 0
  end if
  if op==46 then
    values=[];for index=1 to 8 values=values+[n.bitsFloat(common.argument(vm,base,index))] end for
    renderQueue.stretchPic(context.renderQueue,values[0],values[1],values[2],values[3],values[4],values[5],values[6],values[7],common.argument(vm,base,9));return 0
  end if
  if op==47 then
    mins=common.pointer(vm,common.argument(vm,base,2),12,"model mins");maxs=common.pointer(vm,common.argument(vm,base,3),12,"model maxs")
    for axis=0 to 2 n.writeU32(vm.data,mins+axis*4,n.floatBits(-16.0));n.writeU32(vm.data,maxs+axis*4,n.floatBits(16.0)) end for;return 0
  end if
  if op>=18 and op<=35 or op>=41 and op<=48 or op>=59 and op<=71 or op>=73 and op<=89 then return 0 end if
  return error(7643,"local QVM match: unsupported retail cgame trap "+str(op))
end function

function bootCgame(value)
  if value==void or value.context.latestSnapshot==void then return fail("snapshot is required before cgame initialization") end if
  context=value.context;shared=common.services(context.cvars,context.commandState,context)
  shared.printFn=emitPrint;shared.errorFn=emitError;shared.millisecondsFn=milliseconds;shared.consoleFn=consoleCommand
  shared.openFn=openFile;shared.readFn=readFile;shared.writeFn=writeFile;shared.closeFn=closeFile
  syscalls=cgameSyscall.services(shared,context);syscalls.addCommandFn=addCommand;syscalls.removeCommandFn=removeCommand;syscalls.sendClientCommandFn=sendClientCommand;syscalls.updateScreenFn=updateScreen
  syscalls.loadWorldFn=loadWorld;syscalls.registerModelFn=registerAsset;syscalls.registerSkinFn=registerAsset;syscalls.registerShaderFn=registerAsset;syscalls.registerShaderNoMipFn=registerAsset;syscalls.clearSceneFn=clearScene
  syscalls.getGlconfigFn=glconfigBytes;syscalls.getGameStateFn=gameStateBytes;syscalls.getCurrentSnapshotNumberFn=currentSnapshot;syscalls.getSnapshotFn=snapshotBytes;syscalls.getServerCommandFn=noServerCommand
  syscalls.getCurrentCmdNumberFn=currentCmdNumber;syscalls.getUserCmdFn=noUsercmd;syscalls.setUserCmdValueFn=setUsercmdValue;syscalls.memoryRemainingFn=memoryRemaining;syscalls.extendedFn=extendedCgame
  host=cgameVm.services(value.runtime,cgameSyscall.callback(syscalls),loadClientVm,callVm,freeVm);host.context=context;host.millisecondsFn=milliseconds;host.serverInfoFn=getServerinfo
  client=cgameVm.create(host);if client is error then return client end if;cgameVm.initialize(client,0,0,0,0,0);value.cgame=client;return client
end function

function drawCgame(value,serverTime)
  if value==void or value.cgame==void then return fail("cgame is not active") end if
  value.context.now=serverTime;return cgameVm.drawActiveFrame(value.cgame,serverTime,0,false)
end function

function shutdown(value) if value!=void then if value.cgame!=void then cgameVm.shutdown(value.cgame) end if;return gameVm.shutdown(value.game) end if;return void end function
