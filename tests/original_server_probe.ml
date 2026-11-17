// SPDX-License-Identifier: GPL-2.0-or-later
// Connect a real MiniLang UDP client to a separately running original server.
import mq3.client.remote_session as remote
import mq3.client.gamestate as gamestate
import mq3.client.connectionless as connectionless
import mq3.qcommon.net_transport as transport
import mq3.platform.udp as udp
import mq3.qcommon.message_delta as commands
import std.time as time
import std.string as strings

function movement(host,state,msec,serverTime)
  return commands.userCommand(serverTime,0,0,0,0,2,0,0,0)
end function
function run(port)
  udp.startup();socket=udp.open();udp.bind(socket,udp.Endpoint(udp.ipv4(127,0,0,1),0))
  address=transport.resolveIPv4("127.0.0.1",port)
  session=remote.create(socket,address,24057,"\\name\\MQ3Interop\\rate\\25000\\snaps\\20\\model\\sarge\\cl_anonymous\\0")
  session.sendServices.createCommandFn=movement
  start=time.ticks();lastSequence=0;validSnapshots=0;deltaSnapshots=0;echo=false;chatQueued=false;generation=0;entered=false
  while time.ticks()-start<25000
    now=time.ticks()-start;remote.poll(session,now,64)
    if session.gamestateGeneration>generation then
      generation=session.gamestateGeneration
      print "GAMESTATE client="+str(session.protocol.gamestateState.clientNum)+" strings="+str(session.protocol.gamestateState.dataCount)+" serverId="+str(session.send.serverId)
      remote.acceptUnpureGamestate(session)
    end if
    snapshot=session.protocol.dispatcher.snapshotState.snap
    if snapshot.valid and snapshot.messageNum!=lastSequence then
      lastSequence=snapshot.messageNum;validSnapshots=validSnapshots+1
      if snapshot.deltaNum>0 then deltaSnapshots=deltaSnapshots+1 end if
      if snapshot.playerState.commandTime>0 then entered=true end if
    end if
    if session.connection.connectionState==connectionless.CA_ACTIVE and not chatQueued then
      remote.queueCommand(session,"say MQ3_PROTOCOL68_ROUNDTRIP");chatQueued=true
    end if
    for each text in session.protocol.dispatcher.serverCommands
      if strings.indexOf(text,"MQ3_PROTOCOL68_ROUNDTRIP",0)>=0 then echo=true end if
    end for
    serverTime=0;if snapshot.valid then serverTime=snapshot.serverTime+20 end if
    remote.sendFrame(session,serverTime)
    if validSnapshots>=20 and deltaSnapshots>=10 and echo and entered then break end if
    time.sleep(10)
  end while
  print "INTEROP snapshots="+str(validSnapshots)+" deltas="+str(deltaSnapshots)+" echo="+str(echo)+" inputAck="+str(entered)+" state="+str(session.connection.connectionState)
  ok=validSnapshots>=20 and deltaSnapshots>=10 and echo and entered and generation>0
  if ok then
    remote.queueCommand(session,"disconnect")
    for attempt=0 to 2 session.lastRealtime=time.ticks()-start;session.send.lastPacketSentTime=-99999;remote.sendFrame(session,0);time.sleep(20) end for
  else
    print "SERVER_PRINT: "+session.serverPrint
  end if
  udp.close(socket);udp.cleanup()
  if not ok then return error(7983,"original server: join/snapshot/reliable/usercmd acceptance incomplete") end if
  print "PASS: original protocol-68 server handshake, gamestate, snapshots, usercmd acknowledgement and reliable chat"
  return 0
end function
function main(args)
  if len(args)<1 then return error(7983,"usage: original_server_probe <port>") end if
  return run(toNumber(args[0]))
end function
