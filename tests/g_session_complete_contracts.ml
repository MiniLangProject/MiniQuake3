// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_session as gSession
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.playerstate as ps
import mq3.qcommon.cvar as cv
import mq3.collision.world as cm
import std.fs as fs

struct Context
  commands
  prints
end struct
function require(ok,label) if not ok then return error(7892,"g_session complete: "+label) end if;return 1 end function
function setCvar(level,key,text) cv.set2(level.spawner.cvars,key,text,true);return void end function
function readCvar(level,key,size) variable=cv.find(level.spawner.cvars,key);if variable==void then return "" end if;return variable.string end function
function sessionCommand(level,slot,text) level.context.commands=level.context.commands+[[slot,text]];return void end function
function sessionDiagnostic(level,text) level.context.prints=level.context.prints+[text];return void end function
function setup(world)
  level=game.create(world);spawn.create(level,"");level.context=Context([],[]);level.cvarSetFn=setCvar;level.cvarStringFn=readCvar
  level.serverCommandFn=sessionCommand;level.gamePrintFn=sessionDiagnostic;level.maxclients=4;level.maxclientsCvar=4;level.time=1234;return level
end function
function main(args)
  world=cm.loadWorld(fs.readAllBytes(args[0]),true);level=setup(world);count=0;client=level.clients[0]
  client.team=2;client.spectatorTime=-17;client.spectatorState=3;client.spectatorClient=-2;client.wins=9;client.losses=8;client.teamLeader=17
  gSession.G_WriteClientSessionData(level,client)
  count=count+require(readCvar(level,"session0",1024)=="2 -17 3 -2 9 8 17","seven-field serialization")
  setCvar(level,"session0","0x1 010 -0x1 -010 0x7fffffff -4 42 trailing");gSession.G_ReadSessionData(level,client)
  count=count+require(client.team==1 and client.spectatorTime==8 and client.spectatorState==-1 and client.spectatorClient==-8 and client.wins==2147483647 and client.losses==-4 and client.teamLeader==42,"native %i scan")
  level.spawner.gametype=0;level.numNonSpectatorClients=0;gSession.G_InitSessionData(level,client,"\\team\\s")
  count=count+require(client.team==3 and client.spectatorState==1 and client.spectatorTime==1234,"willing spectator initialization")
  level.spawner.gametype=1;level.numNonSpectatorClients=2;gSession.G_InitSessionData(level,level.clients[1],"")
  count=count+require(level.clients[1].team==3,"tournament capacity")
  level.spawner.gametype=0;level.maxGameClients=2;level.numNonSpectatorClients=1;gSession.G_InitSessionData(level,level.clients[1],"")
  count=count+require(level.clients[1].team==0,"FFA capacity below limit")
  level.numNonSpectatorClients=2;gSession.G_InitSessionData(level,level.clients[1],"")
  count=count+require(level.clients[1].team==3,"FFA maximum clients")
  setCvar(level,"session","3");level.spawner.gametype=4;gSession.G_InitWorldSession(level)
  count=count+require(level.newSession and level.context.prints[0]=="Gametype changed, clearing session data.\n","world gametype change")
  setCvar(level,"session","4");gSession.G_InitWorldSession(level);count=count+require(level.newSession,"newSession remains sticky")
  level.clients[0].connected=2;level.clients[0].team=1;level.clients[1].connected=1;setCvar(level,"session1","held")
  gSession.G_WriteSessionData(level)
  count=count+require(readCvar(level,"session",1024)=="4" and readCvar(level,"session0",1024)!="" and readCvar(level,"session1",1024)=="held","connected-only world write")
  print("PASS: "+str(count)+" g_session complete contracts");return 0
end function
