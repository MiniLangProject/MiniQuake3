// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.client_lifecycle as lifecycle
import mq3.server.client_command_dispatch as dispatch
import mq3.server.oob_connect as oob
import mq3.client.gamestate as gamestate
import mq3.qcommon.message as message
import mq3.game.entitystate as entitystate
import mq3.qcommon.message_delta as userCommandDelta

struct Context events payload end struct
function require(ok,label) if not ok then return error(7896,"sv_client complete: "+label) end if;return 1 end function
function event(host,text) host.context.events=host.context.events+[text];return void end function
function captureTransmit(host,client,payload) host.context.payload=payload;event(host,"transmit");return void end function
function captureSnapshot(host,client) event(host,"snapshot");return void end function
function captureDrop(host,client,text) event(host,"drop:"+text);client.state=lifecycle.CS_ZOMBIE;return void end function
function beginGame(host,num,client) event(host,"begin:"+str(num));return void end function
function disconnectGame(host,num,client) event(host,"game-disconnect:"+str(num));return void end function
function changedGame(host,num,client) event(host,"userinfo:"+str(num));return void end function
function closeDownload(host,client) event(host,"close-download");client.downloadName="";return void end function
function broadcast(host,text) event(host,"broadcast:"+text);return void end function
function sendCommand(host,client,text) event(host,"command:"+text);return void end function
function botFree(host,num) event(host,"bot-free:"+str(num));return void end function
function heartbeat(host) event(host,"heartbeat");return void end function
function challenge(host,client) event(host,"challenge-free");return void end function
function setUserinfo(host,num,text) event(host,"set-userinfo:"+str(num)+":"+text);return void end function
function host()
  value=lifecycle.services();value.context=Context([],bytes(0,0));value.transmitFn=captureTransmit;value.snapshotFn=captureSnapshot;value.dropFn=captureDrop;value.gameBeginFn=beginGame;value.gameDisconnectFn=disconnectGame;value.gameUserinfoFn=changedGame;value.closeDownloadFn=closeDownload;value.broadcastFn=broadcast;value.sendCommandFn=sendCommand;value.botFreeFn=botFree;value.heartbeatFn=heartbeat;value.challengeDisconnectFn=challenge;value.setUserinfoFn=setUserinfo;return value
end function
function command(time) return userCommandDelta.userCommand(time,1,2,3,4,5,6,7,8) end function

struct AuthCapture events end struct
function authSend(runtime,address,text) runtime.context.events=runtime.context.events+[text];return void end function
function authDiag(runtime,text) runtime.context.events=runtime.context.events+[text];return void end function
function authRuntime()
  runtime=oob.create(2,oob.config());runtime.context=AuthCapture([]);runtime.sendFn=authSend;runtime.diagnosticFn=authDiag;runtime.authorizeAddress=oob.address(4,[10,20,30,40],27952);runtime.time=5000;return runtime
end function

function main(args)
  count=0;server=lifecycle.createServer(2);client=server.clients[0];services=host()
  client.userinfo="\\name\\Ranger\\rate\\25000\\snaps\\20";client.addressText="1.2.3.4:27960"
  lifecycle.SV_UpdateUserinfo_f(server,client,client.userinfo,services,0)
  count=count+require(client.name=="Ranger" and client.rate==25000 and client.snapshotMsec==50,"userinfo projection")
  count=count+require(len(services.context.events)==1 and services.context.events[0]=="userinfo:0","userinfo VM callback")
  client.lan=true;client.local=false;client.userinfo="\\name\\LAN";lifecycle.SV_UserinfoChanged(server,client)
  count=count+require(client.rate==99999 and client.userinfo=="\\ip\\1.2.3.4:27960\\name\\LAN","LAN rate with remote address maintained")
  client.local=true;client.userinfo="\\name\\Loopback";lifecycle.SV_UserinfoChanged(server,client)
  count=count+require(client.userinfo=="\\ip\\localhost\\name\\Loopback","local address maintained")

  client.state=lifecycle.CS_CONNECTED;client.outgoingSequence=9;client.lastClientCommand=7;client.reliableSequence=1;client.reliableCommands[1]="print ready"
  server.checksumFeed=0x12345678;server.configstrings[1]="\\sv_serverid\\42";base=entitystate.create();base.number=7;base.eType=9;server.baselines[7]=base
  payload=lifecycle.SV_SendClientGameState(server,client,0,services)
  count=count+require(client.state==lifecycle.CS_PRIMED and client.gamestateMessageNum==9 and client.pureAuthentic==0 and not client.gotCP,"gamestate transition")
  reader=message.initStorage(payload,len(payload),false);reader.cursize=len(payload);message.beginReading(reader);ack=message.readI32(reader)
  reliableType=message.readU8(reader);reliableNumber=message.readI32(reader);reliableText=message.readCString(reader);gameType=message.readU8(reader);parsed=gamestate.create();gamestate.parse(parsed,reader)
  count=count+require(ack==7 and reliableType==5 and reliableNumber==1 and reliableText=="print ready" and gameType==2 and parsed.serverCommandSequence==1 and gamestate.configString(parsed,1)=="\\sv_serverid\\42","gamestate envelope/configstring")
  count=count+require(parsed.baselines[7].number==7 and parsed.baselines[7].eType==9 and parsed.clientNum==0 and parsed.checksumFeed==0x12345678,"gamestate baseline/tail")

  server.time=6000;lifecycle.SV_ClientEnterWorld(server,client,0,command(123),services)
  count=count+require(client.state==lifecycle.CS_ACTIVE and client.gentityNumber==0 and client.deltaMessage==-1 and client.nextSnapshotTime==6000 and client.lastUsercmd.serverTime==123,"enter world state")
  count=count+require(services.context.events[len(services.context.events)-1]=="begin:0","enter world VM callback")

  server.pure=1;server.checksumFeedServerId=50;server.cgameChecksum=11;server.uiChecksum=22;server.cgamePakFound=true;server.uiPakFound=true;server.loadedPureChecksums=[31,32];checksum=server.checksumFeed^31^32^2
  result=lifecycle.SV_VerifyPaks_f(server,client,["cp","50","11","22","@","31","32",str(checksum)],services,0)
  count=count+require(result=="valid" and client.gotCP and client.pureAuthentic==1,"valid pure response")
  lifecycle.SV_ResetPureClient_f(client);result=lifecycle.SV_VerifyPaks_f(server,client,["cp","50","11","22","@suffix","31","32",str(checksum)],services,0)
  count=count+require(result=="valid" and client.pureAuthentic==1,"original delimiter-prefix semantics")
  lifecycle.SV_ResetPureClient_f(client);count=count+require(client.pureAuthentic==0 and not client.gotCP,"pure reset")
  client.state=lifecycle.CS_ACTIVE;before=len(services.context.events);result=lifecycle.SV_VerifyPaks_f(server,client,["cp","49","bad"],services,0)
  count=count+require(result=="outdated" and len(services.context.events)==before and not client.gotCP,"outdated pure response ignored")
  client.state=lifecycle.CS_ACTIVE;result=lifecycle.SV_VerifyPaks_f(server,client,["cp","50","11","22","@","31","31","0"],services,0)
  count=count+require(result=="invalid" and client.state==lifecycle.CS_ZOMBIE and client.gotCP and not client.pureAuthentic,"duplicate pure checksum rejected")
  count=count+require(services.context.events[len(services.context.events)-2]=="snapshot" and len(services.context.events[len(services.context.events)-1])>5,"invalid pure snapshot before drop")

  // The real engine command dispatcher invokes the lifecycle callback.
  active=lifecycle.createClient();active.state=lifecycle.CS_ACTIVE;active.addressText="5.6.7.8:27960";server.clients[0]=active;runtime=lifecycle.runtime(server,services,0);dispatcher=dispatch.services();dispatcher.lifecycleRuntime=runtime
  count=count+require(dispatch.execute(dispatcher,active,"userinfo \\name\\Crash\\rate\\999",true,dispatch.SS_GAME)=="builtin" and active.name=="Crash" and active.rate==1000,"productive userinfo dispatch")
  active.pureAuthentic=1;active.gotCP=true;dispatch.execute(dispatcher,active,"vdr",true,dispatch.SS_GAME);count=count+require(active.pureAuthentic==0 and not active.gotCP,"productive vdr dispatch")
  dispatch.execute(dispatcher,active,"disconnect",true,dispatch.SS_GAME);count=count+require(active.state==lifecycle.CS_ZOMBIE,"productive disconnect dispatch")
  count=count+require(not lifecycle.SV_DropClient(server,active,0,"again",services),"idempotent zombie drop")
  bot=lifecycle.createClient();bot.state=lifecycle.CS_ACTIVE;bot.bot=true;bot.userinfo="x";server.clients[1]=bot;lifecycle.SV_DropClient(server,bot,1,"bot gone",services)
  count=count+require(bot.state==lifecycle.CS_ZOMBIE and bot.userinfo=="" and services.context.events[len(services.context.events)-3]=="bot-free:1","bot drop/free")

  auth=authRuntime();clientAddress=oob.address(4,[1,2,3,4],27960);auth.challenges[4]=oob.Challenge(clientAddress,123,0,0,0,false)
  count=count+require(oob.SV_AuthorizeIpPacket(auth,oob.address(4,[9,9,9,9],1),["ipAuthorize","123","accept"],0)=="wrongServer","authorize source validation")
  count=count+require(oob.SV_AuthorizeIpPacket(auth,auth.authorizeAddress,["ipAuthorize","999","accept"],0)=="notFound","authorize challenge validation")
  count=count+require(oob.SV_AuthorizeIpPacket(auth,auth.authorizeAddress,["ipAuthorize","123","accept"],0)=="accepted" and auth.challenges[4].pingTime==5000,"authorize accept")
  auth.challenges[4]=oob.Challenge(clientAddress,124,0,0,0,false);count=count+require(oob.SV_AuthorizeIpPacket(auth,auth.authorizeAddress,["ipAuthorize","124","demo"],0)=="rejectedDemo" and auth.challenges[4].address==void,"authorize demo rejection clears")
  auth.challenges[4]=oob.Challenge(clientAddress,125,0,0,0,false);count=count+require(oob.SV_AuthorizeIpPacket(auth,auth.authorizeAddress,["ipAuthorize","125","unknown","wait"],0)=="unknown" and auth.context.events[len(auth.context.events)-1]=="print\nwait\n","authorize unknown reason")
  auth.challenges[4]=oob.Challenge(clientAddress,126,0,0,0,false);count=count+require(oob.SV_AuthorizeIpPacket(auth,auth.authorizeAddress,["ipAuthorize","126","deny"],0)=="denied" and auth.challenges[4].address==void,"authorize denial clears")
  auth.challenges[4]=oob.Challenge(clientAddress,127,0,0,0,false);count=count+require(oob.SV_AuthorizeIpPacket(auth,auth.authorizeAddress,["ipAuthorize","127","DeMo"],1)=="acceptedDemo" and auth.challenges[4].address!=void,"restricted demo accepted case-insensitively")
  auth.challenges[4]=oob.Challenge(clientAddress,128,0,0,0,false);count=count+require(oob.SV_AuthorizeIpPacket(auth,auth.authorizeAddress,["ipAuthorize","128","UNKNOWN"],0)=="unknown" and auth.context.events[len(auth.context.events)-1]=="print\n\n","missing authorize reason follows Cmd_Argv")
  auth.challenges[4]=oob.Challenge(clientAddress,129,0,0,0,false);count=count+require(oob.SV_AuthorizeIpPacket(auth,auth.authorizeAddress,["ipAuthorize","129","deny"],0)=="denied" and auth.context.events[len(auth.context.events)-1]=="print\n\n","missing denial reason follows Cmd_Argv")

  print("PASS: "+str(count)+" complete sv_client lifecycle contracts");return 0
end function
