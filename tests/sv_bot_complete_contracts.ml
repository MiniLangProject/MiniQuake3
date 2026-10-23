import mq3.botlib.server_imports as bot
import mq3.botlib.server_bridge as bridge
import mq3.game.entitystate as entitystate

struct Context events allocations mark api end struct
struct Trace allsolid startsolid fraction endpos planeDist planeNormal planeSignbits planeType surfaceFlags entityNum end struct
function req(value,label) if not value then return error(499,"sv_bot complete: "+label) end if;return 1 end function
function event(c,text) c.events=c.events+[text];return void end function
function printFn(c,text) return event(c,"print:"+text) end function
function errorFn(c,text) return event(c,"error:"+text) end function
function worldTrace(c,start,mins,maxs,finish,entity,mask) return Trace(false,true,0.25,[1.0,2.0,3.0],4.0,[0.0,0.0,1.0],2,3,77,entity) end function
function entityTrace(c,start,mins,maxs,finish,entity,mask) return Trace(true,false,0.5,[4.0,5.0,6.0],7.0,[1.0,0.0,0.0],1,2,88,entity) end function
function contents(c,point,pass) return 123+pass end function
function pvs(c,a,b) return a[0]==1.0 and b[0]==2.0 end function
function entityData(c) return "{\"classname\" \"worldspawn\"}" end function
function bounds(c,model) return [[-1.0,-2.0,-3.0],[1.0,2.0,3.0]] end function
function alloc(c,size) c.allocations=c.allocations+size;return 1000+c.allocations end function
function freeMem(c,pointer) return event(c,"free:"+str(pointer)) end function
function mark(c) return c.mark end function
function hunk(c,size) return 2000+size end function
function draw(c,color,points) return event(c,"draw:"+str(color)+":"+str(len(points))) end function
function clientCommand(c,client,text,clientOk) return event(c,"cmd:"+str(client)+":"+text+":"+str(clientOk)) end function
function frame(c,time) return event(c,"frame:"+str(time)) end function
function setup(c) event(c,"setup");return 7 end function
function shutdown(c) event(c,"shutdown");return 9 end function
function cvarGet(c,name,value,flags) return event(c,"cvar:"+name+":"+value+":"+str(flags)) end function
function varSet(c,name,value) return event(c,"var:"+name+":"+value) end function
function testFn(c,flags,origin,angles) return event(c,"test:"+str(flags)) end function
function getApi(c) return c.api end function
function host(c)
 h=bot.services(c);h.printFn=printFn;h.errorFn=errorFn;h.traceFn=worldTrace;h.entityTraceFn=entityTrace;h.pointContentsFn=contents;h.inPvsFn=pvs;h.entityDataFn=entityData;h.modelBoundsFn=bounds;h.allocFn=alloc;h.freeFn=freeMem;h.hunkMarkFn=mark;h.hunkAllocFn=hunk;h.drawPolyFn=draw;h.executeClientCommandFn=clientCommand;h.gameFrameFn=frame;h.setupFn=setup;h.shutdownFn=shutdown;h.cvarGetFn=cvarGet;h.varSetFn=varSet;h.testFn=testFn;h.getApiFn=getApi;return h
end function
function close(a,b,tolerance) difference=a-b;if difference<0.0 then difference=0.0-difference end if;return difference<=tolerance end function

function main(args)
 count=0;c=Context([],0,false,1);h=host(c);state=bot.create(3,4);state.now=1234
 count=count+req(bot.SV_BotAllocateClient(state)==0 and state.clients[0].state==bot.CS_ACTIVE and state.clients[0].entityNumber==0,"allocate first slot")
 count=count+req(state.clients[0].lastPacketTime==1234 and state.clients[0].addressType==bot.NA_BOT and state.clients[0].rate==16384,"allocate client fields")
 state.clients[1].state=bot.CS_ACTIVE;state.clients[2].state=bot.CS_ACTIVE;count=count+req(bot.SV_BotAllocateClient(state)==-1,"allocate full")
 state.clients[0].name="Bot";state.clients[0].svFlags=15;bot.SV_BotFreeClient(state,0);count=count+req(state.clients[0].state==bot.CS_FREE and state.clients[0].name=="" and state.clients[0].svFlags==7,"free client fields")
 count=count+req(try(bot.SV_BotFreeClient(state,-1)) is error,"free client bounds")

 bot.BotImport_Print(bot.PRT_MESSAGE,"m",h);bot.BotImport_Print(bot.PRT_WARNING,"w",h);bot.BotImport_Print(bot.PRT_ERROR,"e",h);bot.BotImport_Print(bot.PRT_FATAL,"f",h);bot.BotImport_Print(bot.PRT_EXIT,"x",h);bot.BotImport_Print(99,"?",h)
 count=count+req(c.events[0]=="print:m" and c.events[1]=="print:^3Warning: w" and c.events[2]=="print:^1Error: e","print classes")
 count=count+req(c.events[3]=="print:^1Fatal: f" and c.events[4]=="error:^1Exit: x" and c.events[5]=="print:unknown print type\n","fatal/unknown print classes")
 trace=bot.BotImport_Trace([0.0,0.0,0.0],[],[],[1.0,1.0,1.0],4,7,h);count=count+req(trace.startsolid and trace.fraction==0.25 and trace.ent==4 and trace.surfaceValue==77,"world trace conversion")
 count=count+req(trace.expDist==0 and trace.sidenum==0 and trace.contents==0 and trace.planeType==3,"world trace cleared fields")
 trace=bot.BotImport_EntityTrace([0.0,0.0,0.0],[],[],[1.0,1.0,1.0],5,8,h);count=count+req(trace.allsolid and trace.ent==5 and trace.surfaceValue==88,"entity trace conversion")
 count=count+req(bot.BotImport_PointContents([0.0,0.0,0.0],h)==122 and bot.BotImport_inPVS([1.0,0.0,0.0],[2.0,0.0,0.0],h),"contents/PVS imports")
 count=count+req(bot.BotImport_BSPEntityData(h)=="{\"classname\" \"worldspawn\"}","BSP entity data")
 model=bot.BotImport_BSPModelMinsMaxsOrigin(2,[0.0,0.0,0.0],h);count=count+req(model[0]==[-1.0,-2.0,-3.0] and model[1]==[1.0,2.0,3.0] and model[2]==[0.0,0.0,0.0],"model bounds")
 rotated=bot.BotImport_BSPModelMinsMaxsOrigin(2,[0.0,90.0,0.0],h);count=count+req(close(rotated[0][0],-3.741657,0.00001) and close(rotated[1][2],3.741657,0.00001),"rotated model radius")
 count=count+req(bot.BotImport_GetMemory(20,h)==1020 and c.allocations==20,"zone allocation")
 bot.BotImport_FreeMemory(1020,h);count=count+req(c.events[len(c.events)-1]=="free:1020","zone free")
 count=count+req(bot.BotImport_HunkAlloc(12,h)==2012,"hunk high allocation")
 c.mark=true;count=count+req(try(bot.BotImport_HunkAlloc(1,h)) is error,"hunk mark rejection");c.mark=false

 p1=[[0.0,0.0,0.0],[1.0,0.0,0.0],[1.0,1.0,0.0]];id=bot.BotImport_DebugPolygonCreate(state,6,3,p1);count=count+req(id==1 and state.debugPolygons[1].inuse and len(state.debugPolygons[1].points)==3,"debug polygon create")
 p1[0][0]=99.0;count=count+req(state.debugPolygons[1].points[0][0]==0.0,"debug polygon owns points")
 count=count+req(bot.BotImport_DebugPolygonShow(state,2,7,1,[[2.0,3.0,4.0]]) and state.debugPolygons[2].color==7,"debug polygon show")
 count=count+req(bot.BotImport_DebugPolygonDelete(state,2) and not state.debugPolygons[2].inuse,"debug polygon delete")
 line=bot.BotImport_DebugLineCreate(state);count=count+req(line==2,"debug line allocation")
 count=count+req(bot.BotImport_DebugLineShow(state,line,[0.0,0.0,0.0],[10.0,0.0,0.0],5) and len(state.debugPolygons[line].points)==4,"debug line show")
 count=count+req(state.debugPolygons[line].points[0]==[0.0,-2.0,0.0] and state.debugPolygons[line].points[3]==[10.0,-2.0,0.0],"debug line quad")
 count=count+req(bot.BotDrawDebugPolygons(state,h)==2 and c.events[len(c.events)-2]=="draw:6:3" and c.events[len(c.events)-1]=="draw:5:4","draw debug polygons")
 count=count+req(bot.BotImport_DebugLineDelete(state,line),"debug line delete")

 bot.BotClientCommand(state,1,"say hi",h);count=count+req(c.events[len(c.events)-1]=="cmd:1:say hi:true","bot client command trusted")
 state.botEnable=0;state.gameVmActive=true;count=count+req(not bot.SV_BotFrame(state,500,h),"bot frame disabled")
 state.botEnable=1;state.gameVmActive=false;count=count+req(not bot.SV_BotFrame(state,500,h),"bot frame no VM")
 state.gameVmActive=true;count=count+req(bot.SV_BotFrame(state,500,h) and c.events[len(c.events)-1]=="frame:500","bot frame VM call")
 state.botEnable=0;count=count+req(bot.SV_BotLibSetup(state,h)==0,"botlib setup disabled")
 state.botEnable=1;count=count+req(bot.SV_BotLibSetup(state,h)==-1,"botlib setup before init")
 count=count+req(bot.SV_BotInitBotLib(state,5,h) and state.botlibReady and state.maxDebugPolys==5,"botlib import init")
 count=count+req(bot.SV_BotLibSetup(state,h)==7 and bot.SV_BotLibShutdown(state,h)==9,"botlib setup/shutdown exports")
 before=len(c.events);count=count+req(bot.SV_BotInitCvars(h)==30 and len(c.events)==before+30,"all bot cvars registered")
 count=count+req(c.events[before]=="cvar:bot_enable:1:0" and c.events[len(c.events)-1]=="cvar:bot_interbreedwrite::512","bot cvar boundary definitions")

 server=bridge.create(2);bridge.setTime(server,900);bridge.queueConsoleMessage(server,0,"chat hi");message=bot.SV_BotGetConsoleMessage(server,0);count=count+req(message.available and message.text=="chat hi" and server.clients[0].lastPacketTime==900,"bot console message")
 entity=entitystate.create();entity.number=17;bridge.publishSnapshot(server,0,[entity]);count=count+req(bot.SV_BotGetSnapshotEntity(server,0,0)==17 and bot.SV_BotGetSnapshotEntity(server,0,1)==-1,"bot snapshot entity")
 count=count+req(bot.EntityInPVS(server,0,17) and not bot.EntityInPVS(server,0,18),"disabled EntityInPVS semantics")
 print "PASS: "+str(count)+" sv_bot complete contracts";return 0
end function
