// SPDX-License-Identifier: GPL-2.0-or-later
// Component tests: no synthetic server is claimed as original-engine evidence.
import mq3.client.remote_session as remote
import mq3.client.connectionless as connectionless
import mq3.client.gamestate as gamestate
import mq3.client.send_cmd as sending
import mq3.qcommon.netchan as net
import mq3.qcommon.command_buffer as command

function req(value,label)
  if not value then return error(7985,"remote command contracts: "+label) end if
  return 1
end function
function fixture()
  s=remote.create(1,net.Address(4,[127,0,0,1],27960),24057,"\\name\\test")
  gamestate.updateConfigString(s.protocol.gamestateState,1,"\\sv_serverid\\77\\sv_pure\\0")
  remote.gameStateReady(s.protocol.gamestateState)
  remote.acceptUnpureGamestate(s)
  s.protocol.dispatcher.snapshotState.snap.valid=true
  remote.synchronize(s)
  return s
end function
function enqueueTestCommand(s,text)
  d=s.protocol.dispatcher;d.serverCommandSequence=d.serverCommandSequence+1
  d.serverCommands[d.serverCommandSequence&63]=text;return d.serverCommandSequence
end function
function delivered(s,number,tokens)
  s.serverPrint=str(number)+":"+command.argv(tokens,0)+":"+command.argsFrom(tokens,1)
  return void
end function
function main(args)
  count=0;state=gamestate.create()
  count=count+req(gamestate.updateConfigString(state,5,"five"),"insert")
  count=count+req(state.dataCount==6 and state.stringOffsets[5]==1,"initial packed layout")
  count=count+req(gamestate.updateConfigString(state,2,"two"),"insert lower index")
  count=count+req(state.stringOffsets[2]==1 and state.stringOffsets[5]==5 and state.dataCount==10,"index ordered repack")
  count=count+req(gamestate.configString(state,5)=="five","unchanged entry preserved")
  count=count+req(not gamestate.updateConfigString(state,2,"two") and state.dataCount==10,"unchanged no-op")
  count=count+req(gamestate.updateConfigString(state,5,"") and state.stringOffsets[5]==0 and state.dataCount==5,"clear and compact")
  count=count+req(try(gamestate.updateConfigString(state,-1,"x")) is error,"negative index")
  count=count+req(try(gamestate.updateConfigString(state,1024,"x")) is error,"upper index")
  count=count+req(try(gamestate.updateConfigString(state,1,decode(bytes([65,0,66])))) is error,"embedded terminator")
  before=bytes(state.stringData);offsets=state.stringOffsets
  huge=decode(bytes(gamestate.MAX_GAMESTATE_CHARS,120))
  count=count+req(try(gamestate.updateConfigString(state,9,huge)) is error,"oversized storage rejected")
  count=count+req(state.stringData==before and state.stringOffsets==offsets and state.dataCount==5,"failed update is atomic")
  state=gamestate.create();limit=decode(bytes(gamestate.MAX_GAMESTATE_CHARS-2,120))
  count=count+req(gamestate.updateConfigString(state,0,limit) and state.dataCount==16000,"exact storage limit")
  count=count+req(try(gamestate.updateConfigString(state,1,"x")) is error and state.dataCount==16000,"limit plus one entry rejected")
  count=count+req(gamestate.configString(state,0)==limit,"overflow preserves large value")
  count=count+req(gamestate.updateConfigString(state,0,"") and state.dataCount==1,"large removal")

  s=fixture();s.serverCommandFn=delivered
  count=count+req(s.connection.connectionState==connectionless.CA_ACTIVE and s.send.serverId==77,"accepted initial state")
  enqueueTestCommand(s,"print first");enqueueTestCommand(s,"cs 12 alpha beta gamma")
  count=count+req(remote.runServerCommands(s,1)==1 and s.commands.lastExecuted==1,"bounded consumption")
  count=count+req(gamestate.configString(s.protocol.gamestateState,12)=="","newer update deferred")
  count=count+req(s.serverPrint=="1:print:first","application command callback")
  count=count+req(remote.runServerCommands(s,2)==1,"second command")
  count=count+req(gamestate.configString(s.protocol.gamestateState,12)=="alpha beta gamma","all configstring arguments retained")
  count=count+req(s.commands.configstrings[12]=="alpha beta gamma","stream table synchronized")
  count=count+req(remote.runServerCommands(s,2)==0,"no duplicate execution")
  count=count+req(try(remote.runServerCommands(s,3)) is error and s.commands.lastExecuted==2,"future consumption rejected")
  enqueueTestCommand(s,"bcs0 7 \"alpha \"");enqueueTestCommand(s,"bcs1 7 \"beta \"");enqueueTestCommand(s,"bcs2 7 \"gamma\"")
  count=count+req(remote.runServerCommands(s,4)==2 and gamestate.configString(s.protocol.gamestateState,7)=="","big config fragments deferred")
  count=count+req(remote.runServerCommands(s,5)==1 and gamestate.configString(s.protocol.gamestateState,7)=="alpha beta gamma","big config assembled into gamestate")
  count=count+req(s.serverPrint=="5:cs:7 alpha beta gamma","assembled application callback")
  enqueueTestCommand(s,"cs 1 \"\\sv_serverid\\88\\sv_pure\\0\"")
  count=count+req(remote.runServerCommands(s,6)==1 and s.send.serverId==88,"live systeminfo changes packet serverId")
  s.send.cmdNumber=9;s.send.commands[5].buttons=7;s.send.reliableSequence=3
  enqueueTestCommand(s,"map_restart")
  count=count+req(remote.runServerCommands(s,7)==1 and s.restartCount==1,"map restart delivered")
  count=count+req(s.send.commands[5].buttons==0 and s.send.cmdNumber==9,"restart clears inputs but keeps command numbering")
  count=count+req(s.send.reliableSequence==3,"restart preserves reliable sequence")
  count=count+req(s.serverPrint=="7:map_restart:","restart reaches application")
  enqueueTestCommand(s,"clientLevelShot");s.serverPrint="unchanged"
  count=count+req(remote.runServerCommands(s,8)==1 and s.serverPrint=="unchanged","remote levelshot filtered")
  enqueueTestCommand(s,"disconnect \"maintenance\"")
  count=count+req(try(remote.runServerCommands(s,9)) is error,"server disconnect propagated")
  count=count+req(s.connection.connectionState==connectionless.CA_DISCONNECTED and s.preparedGeneration==0,"terminal disconnect")
  remote.synchronize(s)
  count=count+req(s.connection.connectionState==connectionless.CA_DISCONNECTED,"stale snapshot cannot reactivate")
  count=count+req(remote.sendFrame(s,0)=="disconnected","terminal session sends no packet")
  count=count+req(try(remote.acceptUnpureGamestate(s)) is error,"old gamestate cannot revive terminal session")

  s=fixture();enqueueTestCommand(s,"cs 1 \"\\sv_serverid\\99\\sv_pure\\1\"")
  count=count+req(try(remote.runServerCommands(s,1)) is error and s.connection.connectionState==connectionless.CA_DISCONNECTED,"pure policy change fails closed")
  s=fixture()
  for index=1 to 65 enqueueTestCommand(s,"print overflow") end for
  count=count+req(try(remote.runServerCommands(s,65)) is error and s.connection.connectionState==connectionless.CA_DISCONNECTED,"cycled reliable commands drop session")
  s=fixture();s.protocol.gamestateState.serverCommandSequence=100;s.send.commands[3].buttons=1;s.send.cmdNumber=22
  remote.gameStateReady(s.protocol.gamestateState)
  count=count+req(s.gamestateGeneration==2 and s.preparedGeneration==0 and s.connection.connectionState==connectionless.CA_LOADING,"new gamestate requires acceptance")
  count=count+req(s.commands.lastExecuted==100 and s.send.commands[3].buttons==0 and s.send.cmdNumber==0,"new gamestate resets inputs and command baseline")
  count=count+req(try(remote.runServerCommands(s,100)) is error,"commands not consumed before acceptance")
  s=fixture();remote.disconnected(s.ingress.services.connectionlessHost,s.connection,true,"gone");remote.synchronize(s)
  count=count+req(s.connection.connectionState==connectionless.CA_DISCONNECTED and s.serverPrint=="gone","OOB disconnect remains terminal")
  connecting=connectionless.create(net.Address(4,[127,0,0,1],27960));connecting.connectionState=connectionless.CA_CONNECTING
  count=count+req(not connectionless.disconnectPacket(connecting,connectionless.services(),connecting.serverAddress),"early disconnect has no channel to dereference")
  print "PASS: "+str(count)+" remote-session command and packed-gamestate contracts"
  return 0
end function
