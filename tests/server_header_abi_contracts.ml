// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.abi as abi
import mq3.server.game_interface as gameInterface
import mq3.server.reliable_commands as reliable
import mq3.server.timeouts as timeouts

function req(value,label) if not value then return error(7369,"server header ABI: "+label) end if;return 1 end function
function main(args)
  count=0;globals=abi.globals(2,64);map=globals.sv;persistent=globals.svs
  count=count+req(len(map.models)==256 and len(map.configstrings)==1024 and len(map.svEntities)==1024,"server fixed arrays")
  count=count+req(len(persistent.clients)==2 and len(persistent.challenges)==1024 and len(persistent.snapshotEntities)==64,"persistent fixed arrays")
  client=persistent.clients[0]
  count=count+req(len(client.userinfo)==0 and len(client.reliableCommands)==64 and len(client.frames)==32,"client protocol rings")
  count=count+req(len(client.downloadBlocks)==8 and len(client.downloadBlockSize)==8 and client.lastUsercmd.serverTime==0,"client download/usercmd defaults")
  count=count+req(client.state==abi.CS_FREE and client.gamestateMessageNum==-1 and client.deltaMessage==-1 and client.rate==3000 and client.snapshotMsec==50,"client defaults")
  count=count+req(len(client.frames[0].areabits)==32 and client.frames[0].ps.clientNum==0,"snapshot frame defaults")

  entity=map.svEntities[7];entity.baseline.number=7;entity.areanum=3;entity.areanum2=4;abi.setClusters(entity,[11,12,13],19)
  activeClusters=abi.clusters(entity);count=count+req(entity.numClusters==3 and len(entity.clusternums)==16 and len(activeClusters)==3 and activeClusters[0]==11 and activeClusters[1]==12 and activeClusters[2]==13,"svEntity cluster ABI")
  projected=abi.toSnapshotEntity(entity,true,0x20,-1)
  count=count+req(projected.state.number==7 and len(projected.clusters)==3 and projected.clusters[0]==11 and projected.clusters[2]==13 and projected.lastCluster==19 and projected.areaNum==3 and projected.areaNum2==4,"productive snapshot entity projection")
  frame=client.frames[0];frame.areabytes=2;frame.areabits[0]=5;frame.ps.clientNum=1;frame.numEntities=4;frame.firstEntity=9
  projectedFrame=abi.toSnapshotFrame(frame)
  count=count+req(projectedFrame.areaBytes==2 and projectedFrame.areaBits[0]==5 and projectedFrame.playerState.clientNum==1 and projectedFrame.numEntities==4 and projectedFrame.firstEntity==9,"productive snapshot frame projection")
  persistent.time=1234;persistent.snapFlagServerBit=4;persistent.nextSnapshotEntities=7;projectedServer=abi.toSnapshotServer(map,persistent,2,25000,true)
  count=count+req(projectedServer.time==1234 and projectedServer.snapFlagServerBit==4 and projectedServer.nextSnapshotEntities==7 and projectedServer.padPackets==2 and projectedServer.maxRate==25000 and projectedServer.lanForceRate,"productive snapshot server projection")
  count=count+req(len(projectedServer.baselines)==1024 and projectedServer.baselines[7].number==7,"snapshot baseline projection")

  map.state=abi.SS_GAME;map.gentities=1000;map.gentitySize=256;map.numEntities=8;map.gameClients=5000;map.gameClientSize=512
  client.lastUsercmd.serverTime=77;game=gameInterface.state(1);abi.bindGameInterface(map,persistent,game)
  count=count+req(game.serverState==gameInterface.SS_GAME and game.maxClients==2 and game.gentities==1000 and game.gameClients==5000,"productive game layout binding")
  count=count+req(gameInterface.SV_GentityNum(game,7)==2792 and gameInterface.SV_GameClientNum(game,1)==5512 and gameInterface.SV_GetUsercmd(game,0).serverTime==77,"productive game pointer/usercmd binding")
  count=count+req(game.svEntities[7].areanum==3 and game.svEntities[7].areanum2==4,"productive game svEntity binding")

  reliable.add(client,"cs 1 value")
  count=count+req(client.reliableSequence==1 and client.reliableCommands[1]=="cs 1 value","canonical client accepted by reliable command path")
  timeoutState=timeouts.runtime([client,persistent.clients[1]]);timeoutState.time=10000;timeoutState.timeoutSeconds=2;timeoutState.zombieSeconds=1;client.state=abi.CS_CONNECTED;client.lastPacketTime=0
  timeoutHost=timeouts.services();timeouts.check(timeoutState,timeoutHost)
  count=count+req(client.timeoutCount==1,"canonical client accepted by timeout path")

  count=count+req(len(abi.cvars().masters)==5,"cvar master array")
  cvarSurface=abi.cvarNames();count=count+req(len(cvarSurface)==25 and cvarSurface[0]=="sv_fps" and cvarSurface[9]=="sv_master" and cvarSurface[24]=="sv_strictAuth","complete cvar declaration surface")
  prototypeSurface=abi.prototypeNames();count=count+req(len(prototypeSurface)==60 and prototypeSurface[0]=="SV_FinalMessage" and prototypeSurface[37]=="SV_inPVS" and prototypeSurface[59]=="SV_Netchan_Process","complete prototype declaration surface")
  count=count+req(try(abi.setClusters(entity,array(17,0),0)) is error,"cluster bound")
  count=count+req(try(abi.serverStatic(-1,0)) is error,"persistent size bound")
  count=count+req(try(abi.toSnapshotServer(map,abi.serverStatic(0,0),0,0,false)) is error,"snapshot ring bound")
  print("PASS: "+str(count)+" server.h ABI/productive contracts");return 0
end function
