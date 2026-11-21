// SPDX-License-Identifier: GPL-2.0-or-later
// Live protocol-68 gameplay oracle. The server is the original C engine.
import mq3.client.remote_play as remote
import mq3.platform.udp as udp
import mq3.game.trajectory as remoteProbeTrajectory
import mq3.client.snapshot_parse as remoteProbeSnapshot
import mq3.format.pk3 as remoteProbePk3
import mq3.qcommon.message_delta as remoteProbeDelta

extern function monotonicMilliseconds() from "miniquake3_winmain.dll" symbol "mq3_winmain_milliseconds" returns u32

function require(value,label)
  if not value then return error(7824,"Remote play probe: "+label) end if
  return void
end function

function run(live,pure)
  started=monotonicMilliseconds()
  now=started
  while not remote.pump(live,now,32)
    udp.waitReadable(live.socket,20)
    now=monotonicMilliseconds()
  end while
  elapsed=now-started
  first=live.protocol.dispatcher.snapshotState.snap
  receiveCodec=live.ingress.codec
  transmitCodec=live.outgoing.codec
  require(remote.mapName(live)=="q3dm1" and remote.gameDirectory(live)=="","original baseq3 map")
  require(first.valid and first.numEntities>0 and first.playerState.clientNum==live.protocol.gamestateState.clientNum,"active player and entity snapshot")
  require(live.ingress.packetCount>=5,"UDP handshake and fragmented gamestate")
  entity=remoteProbeSnapshot.parsedEntity(live.protocol.dispatcher.snapshotState.entityState,first.parseEntitiesNum)
  position=remoteProbeTrajectory.evaluate(entity.pos,first.serverTime)
  velocity=remoteProbeTrajectory.evaluateDelta(entity.pos,first.serverTime)
  require(len(position)==3 and len(velocity)==3,"server entity trajectory")
  verified=remote.approvedArchive(live)
  expectedAcks=1
  if pure then
    require(verified!=void and remoteProbePk3.has(verified,"vm/cgame.qvm") and remoteProbePk3.has(verified,"vm/ui.qvm"),"validated Retail QVM packages")
    expectedAcks=2
  else
    require(verified==void,"ordinary server does not require pure packages")
  end if

  x=first.playerState.origin[0]
  y=first.playerState.origin[1]
  started=now
  lastCommand=first.serverTime-1
  moved=false
  scoreSent=false
  snap=first
  while now-started<3500
    remote.pump(live,now,32)
    // The original dedicated server flood-protects game commands for one
    // second after the pure-verification command.
    if not scoreSent and (not pure or now-started>=1100) then
      remote.queueReliable(live,"score")
      scoreSent=true
    end if
    snap=live.protocol.dispatcher.snapshotState.snap
    // Match the server's millisecond timeline for reliable, non-duplicate usercmds.
    commandTime=first.serverTime+now-started
    if commandTime>lastCommand then
      remote.writeFrame(live,remoteProbeDelta.userCommand(commandTime,0,0,0,0,2,127,127,0),now)
      lastCommand=commandTime
    end if
    dx=snap.playerState.origin[0]-x;dy=snap.playerState.origin[1]-y
    if dx*dx+dy*dy>16 then moved=true end if
    if moved and snap.messageNum>first.messageNum and scoresDelivered(live) and live.protocol.dispatcher.reliableAcknowledge>=expectedAcks then break end if
    udp.waitReadable(live.socket,8)
    now=monotonicMilliseconds()
  end while
  require(moved and snap.playerState.commandTime>first.playerState.commandTime,"original qagame applies the MiniLang client's movement")
  require(snap.deltaNum>0,"server sends delta-compressed snapshots")
  require(receiveCodec!=void and transmitCodec!=void and receiveCodec==live.ingress.codec and transmitCodec==live.outgoing.codec,"packet codec reused across wire messages")
  require(live.protocol.dispatcher.reliableAcknowledge>=expectedAcks and scoresDelivered(live),"bidirectional reliable scoreboard command")
  print("PASS: Retail "+remote.mapName(live)+" original server; pure="+str(pure)+", join="+str(elapsed)+"ms, snapshots="+str(first.messageNum)+".."+str(snap.messageNum)+", entities="+str(snap.numEntities)+", packets="+str(live.ingress.packetCount))
  return void
end function

function scoresDelivered(live)
  dispatcher=live.protocol.dispatcher
  highest=dispatcher.serverCommandSequence
  first=highest-63
  if first<1 then first=1 end if
  for sequence=first to highest
    text=dispatcher.serverCommands[sequence&63]
    if len(text)>=7 and decode(slice(bytes(text),0,7))=="scores " then return true end if
  end for
  return false
end function

function main(args)
  require(len(args)==3,"usage: remote_play_retail_probe <address> <baseq3> <0|1>")
  live=remote.create(args[0],"\\name\\MiniLangProbe\\rate\\25000\\snaps\\40",monotonicMilliseconds())
  remote.setBasePackages(live,args[1])
  result=try(run(live,args[2]=="1"))
  remote.close(live,monotonicMilliseconds())
  if result is error then return result end if
  return 0
end function
