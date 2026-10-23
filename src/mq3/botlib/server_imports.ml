// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native engine import table and bot-client helpers from server/sv_bot.c.
package mq3.botlib.server_imports
import mq3.botlib.server_bridge as bridge
import mq3.compat.numeric as n
import mq3.shared.math as qmath

const CS_FREE=0
const CS_ACTIVE=4
const NA_BOT=0
const SVF_BOT=8
const BUTTON_ATTACK=1
const PRT_MESSAGE=1
const PRT_WARNING=2
const PRT_ERROR=3
const PRT_FATAL=4
const PRT_EXIT=5
const CVAR_CHEAT=512

struct Client state entityNumber name svFlags lastPacketTime addressType rate buttons origin angles end struct
function client() return Client(CS_FREE,-1,"",0,0,0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0]) end function
struct DebugPolygon inuse color points end struct
function polygon() return DebugPolygon(false,0,[]) end function
struct State clients now botEnable gameVmActive botlibReady debugPolygons maxDebugPolys end struct
function create(maxClients,maxDebugPolys)
  if maxClients<0 or maxDebugPolys<0 then return error(7590,"bot server imports: invalid capacity") end if
  clients=[];for index=0 to maxClients-1 clients=clients+[client()] end for
  polys=[];for index=0 to maxDebugPolys-1 polys=polys+[polygon()] end for
  return State(clients,0,0,false,false,polys,maxDebugPolys)
end function

struct Services printFn errorFn traceFn entityTraceFn pointContentsFn inPvsFn entityDataFn modelBoundsFn allocFn freeFn hunkMarkFn hunkAllocFn drawPolyFn executeClientCommandFn gameFrameFn setupFn shutdownFn cvarGetFn varSetFn testFn getApiFn context end struct
function services(context) return Services(void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,context) end function

function SV_BotAllocateClient(state)
  if state==void then return -1 end if
  for index=0 to len(state.clients)-1
    value=state.clients[index]
    if value.state==CS_FREE then value.entityNumber=index;value.state=CS_ACTIVE;value.lastPacketTime=state.now;value.addressType=NA_BOT;value.rate=16384;return index end if
  end for
  return -1
end function
function SV_BotFreeClient(state,clientNum)
  if state==void or clientNum<0 or clientNum>=len(state.clients) then return error(7591,"SV_BotFreeClient: bad clientNum: "+str(clientNum)) end if
  value=state.clients[clientNum];value.state=CS_FREE;value.name="";value.svFlags=value.svFlags&(~SVF_BOT);return void
end function

function BotImport_Print(type,text,host)
  if host==void then return error(7592,"bot import: missing print host") end if
  rendered=text
  if type==PRT_WARNING then rendered="^3Warning: "+text
  else if type==PRT_ERROR then rendered="^1Error: "+text
  else if type==PRT_FATAL then rendered="^1Fatal: "+text
  else if type==PRT_EXIT then rendered="^1Exit: "+text
  else if type!=PRT_MESSAGE then rendered="unknown print type\n" end if
  if type==PRT_EXIT then if host.errorFn==void then return error(7592,rendered) end if;return host.errorFn(host.context,rendered) end if
  if host.printFn!=void then host.printFn(host.context,rendered) end if;return void
end function

struct BspTrace allsolid startsolid fraction endpos planeDist planeNormal planeSignbits planeType surfaceValue ent expDist sidenum contents end struct
function convertTrace(value)
  if value==void then return error(7593,"bot import: missing trace") end if
  return BspTrace(value.allsolid,value.startsolid,value.fraction,[value.endpos[0],value.endpos[1],value.endpos[2]],value.planeDist,[value.planeNormal[0],value.planeNormal[1],value.planeNormal[2]],value.planeSignbits,value.planeType,value.surfaceFlags,value.entityNum,0,0,0)
end function
function BotImport_Trace(start,mins,maxs,finish,passent,contentmask,host)
  if host==void or host.traceFn==void then return error(7593,"bot import: missing world trace") end if
  return convertTrace(host.traceFn(host.context,start,mins,maxs,finish,passent,contentmask))
end function
function BotImport_EntityTrace(start,mins,maxs,finish,entnum,contentmask,host)
  if host==void or host.entityTraceFn==void then return error(7593,"bot import: missing entity trace") end if
  return convertTrace(host.entityTraceFn(host.context,start,mins,maxs,finish,entnum,contentmask))
end function
function BotImport_PointContents(point,host) if host==void or host.pointContentsFn==void then return error(7594,"bot import: missing point contents") end if;return host.pointContentsFn(host.context,point,-1) end function
function BotImport_inPVS(p1,p2,host) if host==void or host.inPvsFn==void then return error(7594,"bot import: missing PVS") end if;return host.inPvsFn(host.context,p1,p2) end function
function BotImport_BSPEntityData(host) if host==void or host.entityDataFn==void then return error(7594,"bot import: missing BSP entity data") end if;return host.entityDataFn(host.context) end function
function BotImport_BSPModelMinsMaxsOrigin(modelnum,angles,host)
  if host==void or host.modelBoundsFn==void then return error(7594,"bot import: missing model bounds") end if
  bounds=host.modelBoundsFn(host.context,modelnum);mins=[bounds[0][0],bounds[0][1],bounds[0][2]];maxs=[bounds[1][0],bounds[1][1],bounds[1][2]]
  if angles[0]!=0.0 or angles[1]!=0.0 or angles[2]!=0.0 then
    radius=qmath.RadiusFromBounds(mins,maxs);for axis=0 to 2 mins[axis]=n.fneg(radius);maxs[axis]=radius end for
  end if
  return [mins,maxs,[0.0,0.0,0.0]]
end function

function BotImport_GetMemory(size,host) if size<0 or host==void or host.allocFn==void then return error(7595,"bot import: invalid allocation") end if;return host.allocFn(host.context,size) end function
function BotImport_FreeMemory(pointer,host) if host==void or host.freeFn==void then return error(7595,"bot import: missing free service") end if;host.freeFn(host.context,pointer);return void end function
function BotImport_HunkAlloc(size,host)
  if size<0 or host==void or host.hunkAllocFn==void then return error(7595,"bot import: invalid hunk allocation") end if
  if host.hunkMarkFn!=void and host.hunkMarkFn(host.context) then return error(7595,"SV_Bot_HunkAlloc: Alloc with marks already set") end if
  return host.hunkAllocFn(host.context,size)
end function

function validPolygon(state,id) return state!=void and id>=0 and id<state.maxDebugPolys end function
function copyPoints(points) result=[];if points!=void then for each point in points result=result+[[point[0],point[1],point[2]]] end for end if;return result end function
function BotImport_DebugPolygonCreate(state,color,numPoints,points)
  if state==void or numPoints<0 or numPoints>128 or points==void or numPoints>len(points) then return 0 end if
  for index=1 to state.maxDebugPolys-1
    if not state.debugPolygons[index].inuse then BotImport_DebugPolygonShow(state,index,color,numPoints,points);return index end if
  end for
  return 0
end function
function BotImport_DebugPolygonShow(state,id,color,numPoints,points)
  if not validPolygon(state,id) or numPoints<0 or numPoints>128 or points==void or numPoints>len(points) then return false end if
  selected=[];if numPoints>0 then for index=0 to numPoints-1 selected=selected+[points[index]] end for end if
  poly=state.debugPolygons[id];poly.inuse=true;poly.color=color;poly.points=copyPoints(selected);return true
end function
function BotImport_DebugPolygonDelete(state,id) if not validPolygon(state,id) then return false end if;state.debugPolygons[id].inuse=false;return true end function
function BotImport_DebugLineCreate(state) return BotImport_DebugPolygonCreate(state,0,0,[]) end function
function BotImport_DebugLineDelete(state,line) return BotImport_DebugPolygonDelete(state,line) end function
function BotImport_DebugLineShow(state,line,start,finish,color)
  direction=[n.fsub(finish[0],start[0]),n.fsub(finish[1],start[1]),n.fsub(finish[2],start[2])];length=qmath.VectorLength(direction);if length!=0.0 then for axis=0 to 2 direction[axis]=n.fdiv(direction[axis],length) end for end if
  cross=[0.0,0.0,0.0];dot=direction[2];if dot>0.99 or dot<(-0.99) then cross=[1.0,0.0,0.0] else cross=[direction[1],n.fneg(direction[0]),0.0] end if
  crossLength=qmath.VectorLength(cross);if crossLength!=0.0 then for axis=0 to 2 cross[axis]=n.fdiv(cross[axis],crossLength) end for end if
  points=[];signs=[2.0,-2.0,-2.0,2.0];bases=[start,start,finish,finish]
  for index=0 to 3 base=bases[index];scale=signs[index];points=points+[[n.fadd(base[0],n.fmul(scale,cross[0])),n.fadd(base[1],n.fmul(scale,cross[1])),n.fadd(base[2],n.fmul(scale,cross[2]))]] end for
  return BotImport_DebugPolygonShow(state,line,color,4,points)
end function
function BotDrawDebugPolygons(state,host)
  if state==void or host==void or host.drawPolyFn==void then return 0 end if;count=0
  for index=0 to state.maxDebugPolys-1 poly=state.debugPolygons[index];if poly.inuse then host.drawPolyFn(host.context,poly.color,poly.points);count=count+1 end if end for
  return count
end function

function BotClientCommand(state,clientNum,command,host)
  if state==void or clientNum<0 or clientNum>=len(state.clients) or host==void or host.executeClientCommandFn==void then return error(7596,"bot import: invalid client command") end if
  host.executeClientCommandFn(host.context,clientNum,command,true);return void
end function
function SV_BotFrame(state,time,host)
  if state==void or state.botEnable==0 or not state.gameVmActive then return false end if
  if host==void or host.gameFrameFn==void then return error(7596,"bot import: missing bot frame service") end if
  host.gameFrameFn(host.context,time);return true
end function
function SV_BotLibSetup(state,host)
  if state==void or state.botEnable==0 then return 0 end if
  if not state.botlibReady or host==void or host.setupFn==void then if host!=void and host.printFn!=void then host.printFn(host.context,"^1Error: SV_BotLibSetup without SV_BotInitBotLib\n") end if;return -1 end if
  return host.setupFn(host.context)
end function
function SV_BotLibShutdown(state,host) if state==void or not state.botlibReady or host==void or host.shutdownFn==void then return -1 end if;return host.shutdownFn(host.context) end function

function cvarDefinitions()
  return [["bot_enable","1",0],["bot_developer","0",CVAR_CHEAT],["bot_debug","0",CVAR_CHEAT],["bot_maxdebugpolys","2",0],["bot_groundonly","1",0],["bot_reachability","0",0],["bot_visualizejumppads","0",CVAR_CHEAT],["bot_forceclustering","0",0],["bot_forcereachability","0",0],["bot_forcewrite","0",0],["bot_aasoptimize","0",0],["bot_saveroutingcache","0",0],["bot_thinktime","100",CVAR_CHEAT],["bot_reloadcharacters","0",0],["bot_testichat","0",0],["bot_testrchat","0",0],["bot_testsolid","0",CVAR_CHEAT],["bot_testclusters","0",CVAR_CHEAT],["bot_fastchat","0",0],["bot_nochat","0",0],["bot_pause","0",CVAR_CHEAT],["bot_report","0",CVAR_CHEAT],["bot_grapple","0",0],["bot_rocketjump","1",0],["bot_challenge","0",0],["bot_minplayers","0",0],["bot_interbreedchar","",CVAR_CHEAT],["bot_interbreedbots","10",CVAR_CHEAT],["bot_interbreedcycle","20",CVAR_CHEAT],["bot_interbreedwrite","",CVAR_CHEAT]]
end function
function SV_BotInitCvars(host) values=cvarDefinitions();if host!=void and host.cvarGetFn!=void then for each item in values host.cvarGetFn(host.context,item[0],item[1],item[2]) end for end if;return len(values) end function
function SV_BotInitBotLib(state,maxDebugPolys,host)
  if state==void or maxDebugPolys<0 then return error(7597,"bot import: invalid botlib init") end if
  state.debugPolygons=[];for index=0 to maxDebugPolys-1 state.debugPolygons=state.debugPolygons+[polygon()] end for;state.maxDebugPolys=maxDebugPolys
  if host==void or host.getApiFn==void then state.botlibReady=false;return error(7597,"bot import: missing botlib API") end if
  state.botlibReady=host.getApiFn(host.context)!=void;return state.botlibReady
end function

function SV_BotGetConsoleMessage(serverBridge,client) return bridge.nextConsoleMessage(serverBridge,client) end function
function SV_BotGetSnapshotEntity(serverBridge,client,sequence) return bridge.snapshotEntity(serverBridge,client,sequence) end function
// Keep the QVM trap boundary in the sv_bot port as well: the productive local
// server routes the three server-side bot traps through this module, while the
// compact bridge owns the VM-buffer encoding shared by native and QVM matches.
function SV_BotDispatch(serverBridge,vm,base,op) return bridge.dispatch(serverBridge,vm,base,op) end function
function EntityInPVS(serverBridge,client,entityNum)
  value=bridge.clientAt(serverBridge,client);if value==void then return false end if
  for each entity in value.snapshotEntities if entity.number==entityNum then return true end if end for;return false
end function
