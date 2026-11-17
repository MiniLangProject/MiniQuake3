// SPDX-License-Identifier: GPL-2.0-or-later
// Connect a real MiniLang UDP client to a separately running original server.
// The Python controller restarts that server only after the first phase passes.
import mq3.client.remote_session as remote
import mq3.client.gamestate as gamestate
import mq3.client.connectionless as connectionless
import mq3.qcommon.net_transport as transport
import mq3.platform.udp as udp
import mq3.qcommon.message_delta as commands
import mq3.qcommon.command_buffer as command
import std.time as time
import std.string as strings

struct Evidence
  token preEcho postEcho callbacks lastDelivered restarts clearedInputs
  commandNumberBefore restartCommandNumber
end struct

function movement(host,state,msec,serverTime)
  return commands.userCommand(serverTime,0,0,0,0,2,0,0,0)
end function
function delivered(session,sequence,tokens)
  evidence=tokens.context
  if sequence<=evidence.lastDelivered then return error(7983,"original server: duplicate/out-of-order callback") end if
  evidence.lastDelivered=sequence;evidence.callbacks=evidence.callbacks+1
  verb=command.argv(tokens,0);text=command.argsFrom(tokens,1)
  if verb=="chat" then
    if strings.indexOf(text,"MQ3_PROTOCOL68_ROUNDTRIP_"+evidence.token,0)>=0 then evidence.preEcho=evidence.preEcho+1 end if
    if strings.indexOf(text,"MQ3_PROTOCOL68_RESTART_"+evidence.token,0)>=0 then evidence.postEcho=evidence.postEcho+1 end if
  end if
  if verb=="map_restart" then
    evidence.restarts=evidence.restarts+1;evidence.restartCommandNumber=session.send.cmdNumber
    if session.send.cmdNumber!=evidence.commandNumberBefore then return error(7983,"original server: restart changed command numbering") end if
    // The production restart handler runs before the application callback.
    // Check the whole ring here, before another frame creates new commands.
    for each stored in session.send.commands
      if stored.serverTime!=0 or stored.buttons!=0 or stored.weapon!=0 or stored.forwardmove!=0 or stored.rightmove!=0 or stored.upmove!=0 then
        return error(7983,"original server: restart retained an input command")
      end if
      for each angle in stored.angles
        if angle!=0 then return error(7983,"original server: restart retained an input angle") end if
      end for
    end for
    evidence.clearedInputs=true
    print "RESTART_CALLBACK sequence="+str(sequence)+" commandNum="+str(session.send.cmdNumber)+" clearedInputs=true"
  end if
  return void
end function
function run(port,controlPort,token)
  udp.startup();socket=udp.open();udp.bind(socket,udp.Endpoint(udp.ipv4(127,0,0,1),0))
  address=transport.resolveIPv4("127.0.0.1",port);controller=transport.resolveIPv4("127.0.0.1",controlPort)
  session=remote.create(socket,address,24057,"\\name\\MQ3Interop\\rate\\25000\\snaps\\20\\model\\sarge\\cl_anonymous\\0")
  session.sendServices.createCommandFn=movement;session.serverCommandFn=delivered
  // poll may adopt a newer delta after receiving several packets at once.
  // Keep requesting full snapshots until one was actually observed here.
  session.send.noDelta=true
  evidence=Evidence(token,0,0,0,0,0,false,0,0)
  start=time.ticks();lastSequence=0;generation=0;initialServerId=0;initialServerBit=-1
  preSnapshots=0;preFull=0;preDeltas=0;preSentTime=0;preAckTime=0;preInputAck=false;preChatQueued=false
  restartRequested=false;lastReadyTime=-1000;restartSnapshotNum=0;restartAckFloor=0
  postSnapshots=0;postFull=0;postFullMessage=0;postDeltas=0;postSentTime=0;postSentNumber=0;postAckTime=0;postInputAck=false;postChatQueued=false
  while time.ticks()-start<45000
    now=time.ticks()-start;remote.poll(session,now,64)
    if session.gamestateGeneration>generation then
      generation=session.gamestateGeneration
      print "GAMESTATE client="+str(session.protocol.gamestateState.clientNum)+" strings="+str(session.protocol.gamestateState.dataCount)+" serverId="+str(session.send.serverId)
      remote.acceptUnpureGamestate(session)
      if generation==1 then initialServerId=session.send.serverId end if
    end if
    snapshot=session.protocol.dispatcher.snapshotState.snap
    if snapshot.valid and (snapshot.snapFlags&2)==0 and snapshot.messageNum!=lastSequence and session.connection.connectionState==connectionless.CA_ACTIVE then
      lastSequence=snapshot.messageNum
      if initialServerBit<0 then initialServerBit=snapshot.snapFlags&4 end if
      beforeRestarts=evidence.restarts;evidence.commandNumberBefore=session.send.cmdNumber
      session.commands.commandState.context=evidence
      // Deliver only the commands belonging to the snapshot being adopted.
      // Reading the receive ring directly would not test application delivery.
      remote.runServerCommands(session,snapshot.serverCommandNum)
      if evidence.restarts>beforeRestarts then
        restartSnapshotNum=snapshot.messageNum;restartAckFloor=snapshot.playerState.commandTime
        // Ask for a fresh full snapshot, then prove deltas resume from it.
        session.send.noDelta=true
      end if
      if evidence.restarts==0 then
        preSnapshots=preSnapshots+1;preAckTime=snapshot.playerState.commandTime
        if snapshot.deltaNum<=0 then preFull=preFull+1 else preDeltas=preDeltas+1 end if
        if preFull>0 then session.send.noDelta=false end if
        if preSentTime>0 and preAckTime>=preSentTime then preInputAck=true end if
      else
        if session.send.serverId!=initialServerId and (snapshot.snapFlags&4)!=initialServerBit then
          postSnapshots=postSnapshots+1;postAckTime=snapshot.playerState.commandTime
          if snapshot.messageNum>restartSnapshotNum then
            if snapshot.deltaNum<=0 then
              postFull=postFull+1
              if postFullMessage==0 then postFullMessage=snapshot.messageNum end if
            else
              if postFullMessage>0 and snapshot.deltaNum>=postFullMessage then postDeltas=postDeltas+1 end if
            end if
          end if
          if postFull>0 then session.send.noDelta=false end if
          if postSentTime>restartAckFloor and postSentTime>0 and postAckTime>=postSentTime then postInputAck=true end if
        end if
      end if
    end if
    if session.connection.connectionState==connectionless.CA_ACTIVE and not preChatQueued then
      remote.queueCommand(session,"say MQ3_PROTOCOL68_ROUNDTRIP_"+token);preChatQueued=true
    end if
    if not restartRequested and preSnapshots>=20 and preFull>0 and preDeltas>=10 and evidence.preEcho==1 and preInputAck then
      restartRequested=true
      print "INTEROP_BEFORE snapshots="+str(preSnapshots)+" full="+str(preFull)+" deltas="+str(preDeltas)+" echoCallbacks="+str(evidence.preEcho)+" inputAck="+str(preInputAck)+" sentTime="+str(preSentTime)+" ackTime="+str(preAckTime)+" serverId="+str(initialServerId)+" serverCount="+str(initialServerBit)+" commandSequence="+str(session.commands.lastExecuted)
    end if
    if restartRequested and evidence.restarts==0 and now-lastReadyTime>=200 then
      transport.outOfBandPrint(socket,controller,"MQ3_RESTART_READY "+token);lastReadyTime=now
    end if
    if evidence.restarts==1 and session.send.serverId!=initialServerId and postSnapshots>0 and not postChatQueued then
      remote.queueCommand(session,"say MQ3_PROTOCOL68_RESTART_"+token);postChatQueued=true
    end if
    serverTime=0;if snapshot.valid then serverTime=snapshot.serverTime+20 end if
    outgoingBefore=session.send.outgoingSequence;remote.sendFrame(session,serverTime)
    if session.send.outgoingSequence!=outgoingBefore then
      sent=session.send.outPackets[outgoingBefore&31]
      if evidence.restarts==0 and preSentTime==0 and sent.serverTime>0 then preSentTime=sent.serverTime end if
      if evidence.restarts==1 and session.send.serverId!=initialServerId and postSentTime==0 and sent.serverTime>restartAckFloor then
        postSentTime=sent.serverTime;postSentNumber=sent.cmdNumber
      end if
    end if
    if postSnapshots>=20 and postFull>0 and postDeltas>=10 and evidence.postEcho==1 and postInputAck then break end if
    time.sleep(10)
  end while
  snapshot=session.protocol.dispatcher.snapshotState.snap
  print "INTEROP_AFTER snapshots="+str(postSnapshots)+" full="+str(postFull)+" deltas="+str(postDeltas)+" echoCallbacks="+str(evidence.postEcho)+" inputAck="+str(postInputAck)+" ackFloor="+str(restartAckFloor)+" sentTime="+str(postSentTime)+" sentCommandNum="+str(postSentNumber)+" ackTime="+str(postAckTime)+" serverId="+str(session.send.serverId)+" serverCount="+str(snapshot.snapFlags&4)+" restarts="+str(evidence.restarts)+" clearedInputs="+str(evidence.clearedInputs)+" commandNumAtRestart="+str(evidence.restartCommandNumber)+" commandSequence="+str(session.commands.lastExecuted)+" state="+str(session.connection.connectionState)
  ok=restartRequested and generation==1 and evidence.preEcho==1 and evidence.postEcho==1 and evidence.restarts==1 and session.restartCount==1 and evidence.clearedInputs
  ok=ok and session.send.serverId!=initialServerId and (snapshot.snapFlags&4)!=initialServerBit and postSentNumber>evidence.restartCommandNumber
  ok=ok and postSnapshots>=20 and postFull>0 and postDeltas>=10 and postInputAck and session.connection.connectionState==connectionless.CA_ACTIVE
  if ok then
    remote.queueCommand(session,"disconnect")
    for attempt=0 to 2 session.lastRealtime=time.ticks()-start;session.send.lastPacketSentTime=-99999;remote.sendFrame(session,0);time.sleep(20) end for
  else
    print "SERVER_PRINT: "+session.serverPrint
  end if
  udp.close(socket);udp.cleanup()
  if not ok then return error(7983,"original server: before/after restart acceptance incomplete") end if
  print "PASS: original protocol-68 server handshake, callback chat, map_restart, new server ID, cleared inputs and subsequent full/delta snapshots with fresh input acknowledgement"
  return 0
end function
function main(args)
  if len(args)!=3 then return error(7983,"usage: original_server_probe <server-port> <control-port> <control-token>") end if
  return run(toNumber(args[0]),toNumber(args[1]),args[2])
end function
