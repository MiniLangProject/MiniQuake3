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
import mq3.client.ui_vm as uiVm
import mq3.vm.syscall_ui as uiSyscall
import mq3.vm.syscall_ui_media as uiMedia
import mq3.compat.numeric as n
import mq3.renderer.scene_queue as sceneQueue
import mq3.renderer.command_queue as renderQueue
import mq3.collision.world as collision
import mq3.collision.visibility as visibility
import mq3.server.world as serverWorld
import mq3.server.snapshot_build as snapshotBuild
import mq3.renderer.playable_light_grid as lightGrid
import mq3.renderer.model_tags as modelTags
import mq3.format.md3 as md3
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
struct Context archive entityParser cvars commandState configstrings userinfos usercmds files nextFile prints errors console gameEntities gameClients entityCount entityStride clientStride now frames linked assets assetKinds modelAssets renderCommands soundCommands latestSnapshot snapshotNumber latestRefdef scene renderQueue qvmRoot collisionWorld spatialScene machineRuntime commandNumber usercmdHistory cgameCollisionQueries cgameTagQueries lightGrid uiKeyCatcher uiFrames end struct
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

function bootWithQvms(archive,map,now,qvmRoot)
  if archive==void or map==void or now<0 then return fail("archive, map and non-negative time are required") end if
  entityBytes=slice(map.data,map.offsets[0],map.lengths[0]);registry=cvar.create();seedCvars(registry)
  scene=sceneQueue.create(4096,65536);scene.registered=true;scene.worldLoaded=true
  collisionWorld=collision.load(map.data);if collisionWorld is error then return collisionWorld end if
  spatialScene=serverWorld.create(collisionWorld)
  initialCommand=qworld.userCommand(now,[0,0,0],0,2,0,0,0)
  grid=lightGrid.load(map);if grid is error then return grid end if
  context=Context(archive,parser.create(entityBytes),registry,commands.create(),array(MAX_CONFIGSTRINGS,""),array(MAX_CLIENTS,"\\name\\Sarge\\rate\\25000"),array(MAX_CLIENTS,initialCommand),[void],1,[],[],[],0,0,0,0,0,now,0,array(1024,false),[],[],[],[],[],void,0,void,scene,renderQueue.create(void,void),qvmRoot,collisionWorld,spatialScene,void,0,array(64,void),0,0,grid,0,0)
  runtimeHost=runtime.services();runtimeHost.context=context;runtimeHost.loadFn=imageLoader
  machineRuntime=runtime.create(runtimeHost);if machineRuntime is error then return machineRuntime end if;context.machineRuntime=machineRuntime
  shared=common.services(registry,context.commandState,context);shared.printFn=emitPrint;shared.errorFn=emitError;shared.millisecondsFn=milliseconds;shared.consoleFn=consoleCommand
  shared.openFn=openFile;shared.readFn=readFile;shared.writeFn=writeFile;shared.closeFn=closeFile
  gameSyscalls=qagame.services(shared,context);gameSyscalls.locateGameDataFn=locateGameData;gameSyscalls.dropClientFn=dropClient;gameSyscalls.sendServerCommandFn=sendServerCommand
  gameSyscalls.setConfigstringFn=setConfigstring;gameSyscalls.getConfigstringFn=getConfigstring;gameSyscalls.getUserinfoFn=getUserinfo;gameSyscalls.setUserinfoFn=setUserinfo
  gameSyscalls.getServerinfoFn=getServerinfo;gameSyscalls.setBrushModelFn=setBrushModel;gameSyscalls.inPvsFn=inPvs;gameSyscalls.adjustAreaPortalFn=adjustPortal;gameSyscalls.areasConnectedFn=areasConnected
  gameSyscalls.linkEntityFn=linkEntity;gameSyscalls.unlinkEntityFn=unlinkEntity;gameSyscalls.botAllocateClientFn=allocateBot;gameSyscalls.botFreeClientFn=freeBot;gameSyscalls.entityTokenFn=entityToken
  gameSyscalls.extendedFn=extendedQagame
  world=qworld.services(context);world.traceFn=traceWorld;world.pointContentsFn=pointContents;world.entitiesInBoxFn=entitiesInBox;world.entityContactFn=entityContact;world.getUsercmdFn=getUsercmd;gameSyscalls.worldServices=world
  host=gameVm.services(machineRuntime,qagame.callback(gameSyscalls),loadVm,callVm,restartVm,freeVm);host.context=context;host.millisecondsFn=milliseconds;host.entityStringFn=entityString;host.clearClientEntityFn=clearClient;host.botEnableFn=botEnable
  game=gameVm.create(host);if game is error then return game end if
  gameVm.initialize(game,now,MAX_CLIENTS)
  return Boot(game,machineRuntime,context,void,void)
end function

function boot(archive,map,now) return bootWithQvms(archive,map,now,"") end function

function connectLocal(value,clientNum)
  denied=gameVm.clientConnect(value.game,clientNum,true,false);if denied is error then return denied end if
  if denied!=0 then return fail("GAME_CLIENT_CONNECT rejected local client") end if
  gameVm.clientBegin(value.game,clientNum);return void
end function

function submitUsercmd(value,clientNum,command)
  if value==void or clientNum<0 or clientNum>=MAX_CLIENTS or command==void then return fail("valid match, client and usercmd are required") end if
  value.context.usercmds[clientNum]=command;value.context.now=command.serverTime;value.context.commandNumber=value.context.commandNumber+1
  value.context.usercmdHistory[value.context.commandNumber&63]=command
  return gameVm.clientThink(value.game,clientNum)
end function

function runFrame(value,serverTime)
  value.context.now=serverTime;result=gameVm.runFrame(value.game,serverTime);if result is error then return result end if
  value.context.frames=value.context.frames+1;return result
end function

function snapshotPointLeaf(host,origin) return collision.pointLeafnum(host.context.collisionWorld,origin) end function
function snapshotLeafArea(host,leaf) return visibility.leafArea(host.context.collisionWorld.visibility,leaf) end function
function snapshotLeafCluster(host,leaf) return visibility.leafCluster(host.context.collisionWorld.visibility,leaf) end function
function snapshotWriteAreaBits(host,bits,area) return visibility.writeAreaBits(host.context.collisionWorld.visibility,bits,area) end function
function snapshotClusterPvs(host,cluster) return visibility.clusterPVS(host.context.collisionWorld.visibility,cluster) end function
function snapshotAreasConnected(host,first,second) return visibility.areasConnected(host.context.collisionWorld.visibility,first,second) end function

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
    index=toNumber(decode(slice(bytes(name),1,len(bytes(name))-1)));checked=try(collision.inlineModel(context.collisionWorld,index));if checked is error then return 0 end if;loaded=name
  else
    if not strings.endsWith(strings.toLowerAscii(name),".md3") then return 0 end if
    data=try(pk3.read(context.archive,name));if data is error then return 0 end if;parsed=try(md3.load(data));if parsed is error then return 0 end if;loaded=parsed
  end if
  handle=registerTypedAsset(context,"model",name);while len(context.modelAssets)<len(context.assets) context.modelAssets=context.modelAssets+[void] end while;context.modelAssets[handle-1]=loaded;return handle
end function
function registerSkin(context,name) return registerTypedAsset(context,"skin",name) end function
function registerShader(context,name) return registerTypedAsset(context,"shader",name) end function
function registerShaderNoMip(context,name) return registerTypedAsset(context,"shaderNoMip",name) end function
function addCommand(context,name) context.console=context.console+[[0,"add "+name]];return void end function
function removeCommand(context,name) return void end function
function sendClientCommand(context,name) context.console=context.console+[[0,"client "+name]];return void end function
function updateScreen(context) return void end function
function loadWorld(context,name) context.renderCommands=context.renderCommands+[[36,name]];return void end function
function clearScene(context) context.renderCommands=[];sceneQueue.clearScene(context.scene);return void end function
function noServerCommand(context,number) return false end function
function currentCmdNumber(context) return context.commandNumber end function
function clientUsercmd(context,number)
  if number<1 or number>context.commandNumber or number<=context.commandNumber-64 then return cgameSyscall.BytesResult(false,bytes(0,0)) end if
  command=context.usercmdHistory[number&63];if command==void then return cgameSyscall.BytesResult(false,bytes(0,0)) end if
  output=bytes(cgameSyscall.USERCMD_SIZE,0);n.writeU32(output,0,command.serverTime)
  for axis=0 to 2 n.writeU32(output,4+axis*4,command.angles[axis]) end for
  n.writeU32(output,16,command.buttons);output[20]=command.weapon&255;output[21]=command.forwardmove&255;output[22]=command.rightmove&255;output[23]=command.upmove&255
  return cgameSyscall.BytesResult(true,output)
end function
function setUsercmdValue(context,value,sensitivity) return void end function
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
  if typeof(model)=="string" then index=toNumber(decode(slice(bytes(model),1,len(bytes(model))-1)));return collision.modelBounds(context.collisionWorld,collision.inlineModel(context.collisionWorld,index)) end if
  return [[model.bounds[0][0],model.bounds[0][1],model.bounds[0][2]],[model.bounds[1][0],model.bounds[1][1],model.bounds[1][2]]]
end function
function lerpModelTag(context,vm,base)
  context.cgameTagQueries=context.cgameTagQueries+1;output=common.pointer(vm,common.argument(vm,base,1),48,"orientation output")
  model=rendererModel(context,common.argument(vm,base,2));orientation=modelTags.missingOrientation()
  if model!=void and typeof(model)!="string" then
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

function extendedCgame(context,vm,base,op)
  // Capture every retail sound/renderer submission. Structured decoding is
  // added per trap while the original module remains the sole scene producer.
  if op>=41 and op<=48 or op==59 or op==73 or op==79 or op==85 or op==87 or op==88 then context.renderCommands=context.renderCommands+[[op,context.now]] end if
  if op==18 then checksumAt=common.argument(vm,base,2);if checksumAt!=0 then n.writeU32(vm.data,checksumAt&vm.mask,0) end if;return 0 end if
  if op==19 then return len(context.collisionWorld.models) end if
  if op==20 then return collision.inlineModel(context.collisionWorld,common.argument(vm,base,1)) end if
  if op==21 then return 0 end if
  if op==22 or op==82 then return collision.tempBoxModel(context.collisionWorld,cgameVector(vm,base,1,"temporary mins"),cgameVector(vm,base,2,"temporary maxs"),op==82) end if
  if op==23 then context.cgameCollisionQueries=context.cgameCollisionQueries+1;return collision.pointContents(context.collisionWorld,cgameVector(vm,base,1,"point contents"),common.argument(vm,base,2)) end if
  if op==24 then context.cgameCollisionQueries=context.cgameCollisionQueries+1;return collision.transformedPointContents(context.collisionWorld,cgameVector(vm,base,1,"transformed point"),common.argument(vm,base,2),cgameVector(vm,base,3,"model origin"),cgameVector(vm,base,4,"model angles")) end if
  if op==25 or op==83 then return cgameBoxTrace(context,vm,base,op==83,false) end if
  if op==26 or op==84 then return cgameBoxTrace(context,vm,base,op==84,true) end if
  if op==27 then return 0 end if
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
  if op==81 then context.soundCommands=context.soundCommands+[soundEvent("stopLoop",common.argument(vm,base,1),0,0,void,void,void,false,"","")];return 0 end if
  if op==41 then
    at=common.pointer(vm,common.argument(vm,base,1),4,"refEntity");sceneQueue.addEntity(context.scene,n.readI32(vm.data,at),slice(vm.data,at,140));return 0
  end if
  if op==42 then return addCgamePolys(context,vm,base,false) end if
  if op==43 or op==85 then
    origin=common.readFloatVector(vm,common.argument(vm,base,1),3,"light origin");intensity=n.bitsFloat(common.argument(vm,base,2));red=n.bitsFloat(common.argument(vm,base,3));green=n.bitsFloat(common.argument(vm,base,4));blue=n.bitsFloat(common.argument(vm,base,5))
    sceneQueue.addDynamicLight(context.scene,origin,intensity,red,green,blue,op==85);return 0
  end if
  if op==44 then context.latestRefdef=decodeRefdef(vm,common.argument(vm,base,1));return 0 end if
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
  if op==73 then return lightForPoint(context,vm,base) end if
  if op==87 then return addCgamePolys(context,vm,base,true) end if
  if op==89 then if inPvs(context,cgameVector(vm,base,1,"PVS point 1"),cgameVector(vm,base,2,"PVS point 2"),false) then return 1 end if;return 0 end if
  if op>=18 and op<=35 or op>=41 and op<=48 or op>=59 and op<=71 or op>=73 and op<=89 then return 0 end if
  return error(7643,"local QVM match: unsupported retail cgame trap "+str(op))
end function

function bootCgame(value)
  if value==void or value.context.latestSnapshot==void then return fail("snapshot is required before cgame initialization") end if
  context=value.context;shared=common.services(context.cvars,context.commandState,context)
  shared.printFn=emitPrint;shared.errorFn=emitError;shared.millisecondsFn=milliseconds;shared.consoleFn=consoleCommand
  shared.openFn=openFile;shared.readFn=readFile;shared.writeFn=writeFile;shared.closeFn=closeFile
  syscalls=cgameSyscall.services(shared,context);syscalls.addCommandFn=addCommand;syscalls.removeCommandFn=removeCommand;syscalls.sendClientCommandFn=sendClientCommand;syscalls.updateScreenFn=updateScreen
  syscalls.loadWorldFn=loadWorld;syscalls.registerModelFn=registerModel;syscalls.registerSkinFn=registerSkin;syscalls.registerShaderFn=registerShader;syscalls.registerShaderNoMipFn=registerShaderNoMip;syscalls.clearSceneFn=clearScene
  syscalls.getGlconfigFn=glconfigBytes;syscalls.getGameStateFn=gameStateBytes;syscalls.getCurrentSnapshotNumberFn=currentSnapshot;syscalls.getSnapshotFn=snapshotBytes;syscalls.getServerCommandFn=noServerCommand
  syscalls.getCurrentCmdNumberFn=currentCmdNumber;syscalls.getUserCmdFn=clientUsercmd;syscalls.setUserCmdValueFn=setUsercmdValue;syscalls.memoryRemainingFn=memoryRemaining;syscalls.extendedFn=extendedCgame
  host=cgameVm.services(value.runtime,cgameSyscall.callback(syscalls),loadClientVm,callVm,freeVm);host.context=context;host.millisecondsFn=milliseconds;host.serverInfoFn=getServerinfo
  client=cgameVm.create(host);if client is error then return client end if;cgameVm.initialize(client,0,0,0,0,0);value.cgame=client;return client
end function

function drawCgame(value,serverTime)
  if value==void or value.cgame==void then return fail("cgame is not active") end if
  value.context.now=serverTime;return cgameVm.drawActiveFrame(value.cgame,serverTime,0,false)
end function

function uiClipboard(context) return "" end function
function uiClientState(context) return bytes(uiSyscall.CLIENT_STATE_SIZE,0) end function
function uiConfigString(context,index) if index<0 or index>=len(context.configstrings) then return void end if;return context.configstrings[index] end function
function uiKeyName(context,key) return "" end function
function uiBinding(context,key) return "" end function
function uiSetBinding(context,key,text) return void end function
function uiKeyDown(context,key) return false end function
function uiFalse(context) return false end function
function uiSetBool(context,value) return void end function
function uiClearKeys(context) return void end function
function uiGetCatcher(context) return context.uiKeyCatcher end function
function uiSetCatcher(context,value) context.uiKeyCatcher=value;return void end function
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
function uiLanNoop(context) return void end function
function uiLanNoop3(context,a,b,c) return void end function
function uiLanNoop2(context,a,b) return void end function
function uiLanZero0(context) return 0 end function
function uiLanZero(context,a) return 0 end function
function uiLanZero2(context,a,b) return 0 end function
function uiLanZero3(context,a,b,c) return 0 end function
function uiLanZero5(context,a,b,c,d,e) return 0 end function
function uiLanFalse(context,a) return false end function
function uiLanFalse2(context,a,b) return false end function
function uiLanEmpty1(context,a) return "" end function
function uiLanEmpty(context,a,b) return "" end function
function uiLanPing(context,index) return ["",0] end function
function uiRegisterSound(context,name,compressed) return registerTypedAsset(context,"sound",name) end function
function uiLocalSound(context,handle,channel) context.soundCommands=context.soundCommands+[soundEvent("local",-1,channel,handle,void,void,void,false,"","")];return void end function
function uiStopMusic(context) context.soundCommands=context.soundCommands+[soundEvent("stopMusic",-1,0,0,void,void,void,false,"","")];return void end function
function uiStartMusic(context,intro,trackLoop) context.soundCommands=context.soundCommands+[soundEvent("music",-1,0,0,void,void,void,false,intro,trackLoop)];return void end function
function uiRealTime(context) return [n.quotient(context.now,1000),bytes(uiMedia.QTIME_SIZE,0)] end function
function uiRemap(context,oldName,newName,timeOffset) return void end function
function uiCdKey(context) return "0000000000000000" end function
function uiSetCdKey(context,key) return void end function
function uiVerifyCdKey(context,key,checksum) return true end function
function uiSeek(context,handle,offset,origin) return -1 end function
function uiPb(context,status) return void end function
function uiPlayCinematic(context,name,x,y,w,h,bits) return -1 end function
function uiCinematicStop(context,handle) return 0 end function
function uiCinematicRun(context,handle) return 0 end function
function uiCinematicDraw(context,handle) return void end function
function uiCinematicExtents(context,handle,x,y,w,h) return void end function

function extendedUi(context,vm,base,op)
  if op==22 then at=common.pointer(vm,common.argument(vm,base,1),140,"UI refEntity");sceneQueue.addEntity(context.scene,n.readI32(vm.data,at),slice(vm.data,at,140));return 0 end if
  if op==23 then return addCgamePolys(context,vm,base,false) end if
  if op==24 then
    origin=common.readFloatVector(vm,common.argument(vm,base,1),3,"UI light origin")
    sceneQueue.addDynamicLight(context.scene,origin,n.bitsFloat(common.argument(vm,base,2)),n.bitsFloat(common.argument(vm,base,3)),n.bitsFloat(common.argument(vm,base,4)),n.bitsFloat(common.argument(vm,base,5)),false);return 0
  end if
  if op==25 then context.latestRefdef=decodeRefdef(vm,common.argument(vm,base,1));return 0 end if
  if op==29 then return lerpModelTag(context,vm,base) end if
  if op==30 then return 0 end if
  if op==55 then return 0 end if
  if op==56 then
    mins=common.pointer(vm,common.argument(vm,base,2),12,"UI model mins");maxs=common.pointer(vm,common.argument(vm,base,3),12,"UI model maxs")
    bounds=rendererModelBounds(context,common.argument(vm,base,1));writeVector(vm.data,mins,bounds[0]);writeVector(vm.data,maxs,bounds[1]);return 0
  end if
  // The Baseq3 q3_ui module does not use the Team Arena parser imports. Keep
  // their failure semantics explicit for compatible UI modules.
  if op>=57 and op<=61 then return 0 end if
  return error(7643,"local QVM match: unsupported retail UI trap "+str(op))
end function

function bootUi(value)
  if value==void then return fail("match is required before UI initialization") end if
  context=value.context;shared=common.services(context.cvars,context.commandState,context);shared.printFn=emitPrint;shared.errorFn=emitError;shared.millisecondsFn=milliseconds;shared.consoleFn=consoleCommand
  shared.openFn=openFile;shared.readFn=readFile;shared.writeFn=writeFile;shared.closeFn=closeFile
  syscalls=uiSyscall.services(shared,context);syscalls.client.clipboardFn=uiClipboard;syscalls.client.glconfigFn=glconfigBytes;syscalls.client.clientStateFn=uiClientState;syscalls.client.configStringFn=uiConfigString
  syscalls.keys.keyNameFn=uiKeyName;syscalls.keys.bindingFn=uiBinding;syscalls.keys.setBindingFn=uiSetBinding;syscalls.keys.isDownFn=uiKeyDown;syscalls.keys.getOverstrikeFn=uiFalse;syscalls.keys.setOverstrikeFn=uiSetBool;syscalls.keys.clearFn=uiClearKeys;syscalls.keys.getCatcherFn=uiGetCatcher;syscalls.keys.setCatcherFn=uiSetCatcher
  syscalls.renderer.registerModelFn=registerModel;syscalls.renderer.registerSkinFn=registerSkin;syscalls.renderer.registerShaderNoMipFn=registerShaderNoMip;syscalls.renderer.clearSceneFn=clearScene;syscalls.renderer.setColorFn=uiSetColor;syscalls.renderer.drawStretchPicFn=uiStretchPic;syscalls.renderer.updateScreenFn=updateScreen
  syscalls.lan.loadFn=uiLanNoop;syscalls.lan.saveFn=uiLanNoop;syscalls.lan.addFn=uiLanZero3;syscalls.lan.removeFn=uiLanNoop2;syscalls.lan.pingQueueCountFn=uiLanZero0;syscalls.lan.clearPingFn=uiLanZero;syscalls.lan.getPingFn=uiLanPing;syscalls.lan.getPingInfoFn=uiLanEmpty1;syscalls.lan.serverCountFn=uiLanZero;syscalls.lan.serverAddressFn=uiLanEmpty;syscalls.lan.serverInfoFn=uiLanEmpty;syscalls.lan.serverPingFn=uiLanZero2;syscalls.lan.markVisibleFn=uiLanNoop3;syscalls.lan.isVisibleFn=uiLanFalse2;syscalls.lan.updatePingsFn=uiLanFalse;syscalls.lan.resetPingsFn=uiLanZero;syscalls.lan.serverStatusFn=uiKeyName;syscalls.lan.compareFn=uiLanZero5
  syscalls.fileListFn=uiFileList;syscalls.memoryRemainingFn=memoryRemaining;syscalls.extendedFn=extendedUi;media=uiMedia.services(context);media.sound.registerFn=uiRegisterSound;media.sound.startLocalFn=uiLocalSound;media.sound.stopBackgroundFn=uiStopMusic;media.sound.startBackgroundFn=uiStartMusic
  media.cinematic.playFn=uiPlayCinematic;media.cinematic.stopFn=uiCinematicStop;media.cinematic.runFn=uiCinematicRun;media.cinematic.drawFn=uiCinematicDraw;media.cinematic.setExtentsFn=uiCinematicExtents
  media.platform.realTimeFn=uiRealTime;media.platform.remapShaderFn=uiRemap;media.platform.getCdKeyFn=uiCdKey;media.platform.setCdKeyFn=uiSetCdKey;media.platform.verifyCdKeyFn=uiVerifyCdKey;media.platform.seekFn=uiSeek;media.platform.pbStatusFn=uiPb;syscalls.mediaServices=media
  host=uiVm.services(value.runtime,uiSyscall.callback(syscalls),loadClientVm,callVm,freeVm);ui=uiVm.create(host);if ui is error then return ui end if
  initialized=uiVm.initialize(ui,uiVm.CA_ACTIVE,0,1);if initialized is error then return initialized end if;value.ui=ui;return ui
end function
function refreshUi(value,time) if value==void or value.ui==void then return fail("UI is not active") end if;value.context.now=time;result=uiVm.refresh(value.ui,time);if not (result is error) then value.context.uiFrames=value.context.uiFrames+1 end if;return result end function
function setUiMenu(value,menu) if value==void or value.ui==void then return fail("UI is not active") end if;return uiVm.setActiveMenu(value.ui,menu) end function

function shutdown(value) if value!=void then if value.ui!=void then uiVm.shutdown(value.ui) end if;if value.cgame!=void then cgameVm.shutdown(value.cgame) end if;return gameVm.shutdown(value.game) end if;return void end function
