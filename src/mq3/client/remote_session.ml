// SPDX-License-Identifier: GPL-2.0-or-later
// Protocol-68 remote client: no synthetic in-process server or invented gamestate.
// The caller owns the socket, assets, game/render lifecycle and clock.
package mq3.client.remote_session
import mq3.client.connectionless as connectionless
import mq3.client.netchan as clientNet
import mq3.client.network_ingress as ingress
import mq3.client.protocol_runtime as protocol
import mq3.client.send_cmd as sendCmd
import mq3.client.gamestate as gamestate
import mq3.client.snapshot_command as snapshots
import mq3.client.server_command_stream as serverCommands
import mq3.qcommon.netchan as net
import mq3.qcommon.net_transport as transport
import mq3.qcommon.network_pump as pump
import mq3.shared.info as info

/// Snapshot flag marking a server snapshot that must not activate a primed remote client.
const SNAPFLAG_NOT_ACTIVE=2

/// Coordinates a protocol-68 connection, message parser, command sender and reliable-command consumer.
/// The application owns the UDP socket, asset loading, rendering and clock. A received gamestate
/// enters loading until the application explicitly accepts its unpure asset configuration.
struct Session
  /// Borrowed UDP socket used for handshake packets and sequenced traffic; this module never closes it.
  socket
  /// Userinfo text returned to the connection handshake when constructing the connect request.
  userinfo
  /// Connectionless handshake state, including the server address, challenge and established netchan.
  connection
  /// Client netchan runtime providing transport and protocol payload encoding/decoding state.
  wire
  /// Server-message parser runtime containing the current gamestate, snapshots and reliable command ring.
  protocol
  /// Client packet-event adapter connecting the handshake, netchan and server-message parser.
  ingress
  /// Outgoing user-command and reliable-command state, including packet history and acknowledgement cursors.
  send
  /// Live sender callbacks whose channel is replaced with the established connection channel when available.
  sendServices
  /// Network pump configured to receive server datagrams through this session's ingress adapter.
  pump
  /// Number of complete gamestates delivered to this session; zero means none has been received.
  gamestateGeneration
  /// Gamestate generation explicitly accepted by the application; zero invalidates readiness after loading or stop.
  preparedGeneration
  /// Most recent server print, disconnect message or local terminal-session explanation.
  serverPrint
  /// Client realtime in milliseconds supplied by the most recent poll call.
  lastRealtime
  /// Reliable server-command consumer retaining its execution cursor and partial large configstring across gamestates.
  commands
  /// Command-consumer callbacks applying configstrings, systeminfo changes and map-restart cleanup to this session.
  commandServices
  /// Optional callback `(session, sequence, commandState)` for a delivered reliable command.
  /// Tokenized arguments are borrowed until the next command; retaining them requires copying during the call.
  /// A callback error stops the session and is propagated by `runServerCommands`.
  serverCommandFn
  /// Number of consumed map-restart commands whose cleanup callback has cleared the user-command ring.
  restartCount
end struct

/// Sends a connectionless text packet through the session socket and returns the encoded datagram bytes.
/// @param host Connectionless services record whose context is the owning Session.
/// @param state Handshake callback argument retained for signature compatibility; unused here.
/// @param address Destination network address for the outgoing datagram.
/// @param text Command text placed after the four-byte connectionless prefix.
function sendOob(host,state,address,text) return transport.outOfBandPrint(host.context.socket,address,text) end function

/// Sends a connectionless data packet using the connect-message Huffman format and returns its encoded bytes.
/// @param host Connectionless services record whose context supplies the borrowed UDP socket.
/// @param state Handshake callback argument retained for signature compatibility; unused here.
/// @param address Destination network address for the outgoing datagram.
/// @param data Connect-request bytes; the transport preserves the packet's 12-byte prefix before compression.
function sendOobData(host,state,address,data) return transport.outOfBandData(host.context.socket,address,data) end function

/// Returns the session's current userinfo text to the connection handshake.
/// @param host Connectionless services record whose context is the owning Session.
/// @param state Handshake callback argument retained for signature compatibility; unused here.
function userinfo(host,state) return host.context.userinfo end function

/// Retains the latest server print text in the session and returns void.
/// @param host Connectionless services record whose context receives the retained text.
/// @param state Handshake callback argument retained for signature compatibility; unused here.
/// @param text Server text to store without printing it to a terminal.
function printed(host,state,text) host.context.serverPrint=text;return void end function

/// Marks both connection and sender disconnected, invalidates asset readiness, and retains the reason.
/// Returns void without closing the application-owned socket. Existing snapshots cannot reactivate
/// the session because promotion requires a primed connection and an accepted gamestate generation.
/// @param session Mutable session whose connection state and prepared generation are cleared.
/// @param text Terminal-session explanation stored in `serverPrint`.
function stop(session,text)
  session.connection.connectionState=connectionless.CA_DISCONNECTED
  session.send.connectionState=connectionless.CA_DISCONNECTED
  session.preparedGeneration=0;session.serverPrint=text;return void
end function

/// Applies a connectionless disconnect callback to the session and returns void.
/// @param host Connectionless services record whose context identifies the session to stop.
/// @param state Handshake callback argument retained for signature compatibility; unused here.
/// @param show Callback display flag; this adapter retains the text regardless of its value.
/// @param text Disconnect explanation forwarded to `stop`.
function disconnected(host,state,show,text) return stop(host.context,text) end function

/// Replaces every retained user command with a zero command and returns void without resetting sequence counters.
/// @param session Session whose outgoing `CMD_BACKUP` command slots are cleared.
function clearUsercmds(session)
  for index=0 to sendCmd.CMD_BACKUP-1 session.send.commands[index]=sendCmd.zeroCommand() end for
  return void
end function

/// Clears pending user commands for a consumed map restart, increments `restartCount`, and returns void.
/// @param session Session supplied as the command-consumer callback context.
function restarted(session)
  clearUsercmds(session);session.restartCount=session.restartCount+1;return void
end function

/// Applies a reliable configstring change to packed gamestate storage.
/// Returns true when storage changes, false for identical text, or the gamestate validation error.
/// @param session Session whose parser owns the mutable gamestate storage.
/// @param index Configstring slot in the range zero through `MAX_CONFIGSTRINGS - 1`.
/// @param value Replacement text; embedded zero bytes and storage overflow are rejected.
function configstringChanged(session,index,value)
  return gamestate.updateConfigString(session.protocol.gamestateState,index,value)
end function

/// Refreshes the outgoing server ID from systeminfo and returns void when the session remains usable.
/// An already accepted session stops with error 7982 if `sv_pure` is no longer exactly `"0"`.
/// @param session Session whose gamestate systeminfo and outgoing server ID are synchronized.
function systemInfoChanged(session)
  system=gamestate.configString(session.protocol.gamestateState,1)
  if session.preparedGeneration>0 and info.value(system,"sv_pure")!="0" then
    stop(session,"Server now requires pure asset verification")
    return error(7982,"remote session: pure server requires asset verification")
  end if
  session.send.serverId=toNumber(info.value(system,"sv_serverid"));return void
end function

/// Starts a new loading generation after a complete gamestate and returns void.
/// Resets outgoing user commands and packet timing, copies current configstrings, and refreshes the
/// server ID and checksum feed. The reliable execution cursor and partial large-configstring assembly
/// survive so commands received before the gamestate can still be consumed at the application boundary.
/// @param state Parsed gamestate record whose context is the Session receiving this callback.
function gameStateReady(state)
  session=state.context;session.gamestateGeneration=session.gamestateGeneration+1
  session.preparedGeneration=0;session.connection.connectionState=connectionless.CA_LOADING
  session.send.serverId=toNumber(info.value(gamestate.configString(state,1),"sv_serverid"))
  session.send.checksumFeed=state.checksumFeed
  clearUsercmds(session);session.send.cmdNumber=0;session.send.oldFrameTime=0
  for index=0 to sendCmd.PACKET_BACKUP-1 session.send.outPackets[index]=sendCmd.OutPacket(0,0,0) end for
  table=array(gamestate.MAX_CONFIGSTRINGS,"")
  for index=0 to gamestate.MAX_CONFIGSTRINGS-1 table[index]=gamestate.configString(state,index) end for
  // CL_InitCGame starts at lastExecutedServerCommand, not the received
  // gamestate sequence: reliable commands can precede svc_gamestate.
  // Keep the same connection's cursor and in-progress bcs assembly.
  session.commands.configstrings=table
  session.commands.commandSequence=state.serverCommandSequence
  return void
end function

/// Creates a remote session in connecting state with transport, parsing and command callbacks wired together.
/// Returns a Session, or error 7982 for a missing socket/address or qport outside 0..65535.
/// Creation does not poll, send the handshake, load assets or accept a gamestate.
/// @param socket Borrowed nonblocking UDP socket; its lifetime remains the application's responsibility.
/// @param address Server network address, including the remote endpoint type and port.
/// @param qport Protocol client identifier carried by the handshake and client netchan headers.
/// @param initialUserinfo Userinfo string supplied to subsequent connect requests.
function create(socket,address,qport,initialUserinfo)
  if socket==void or address==void or qport<0 or qport>65535 then return error(7982,"remote session: invalid endpoint or qport") end if
  connection=connectionless.create(address);connection.qport=qport
  connection.connectionState=connectionless.CA_CONNECTING;connection.connectTime=-connectionless.RETRANSMIT_TIMEOUT
  wire=clientNet.create(transport.attach(net.init(qport),socket),clientNet.createConnection())
  parser=protocol.create(void);sending=sendCmd.create();sending.remoteAddressType=address.type
  temporaryChannel=net.setup(net.NS_CLIENT,address,qport)
  sender=sendCmd.liveServices(wire,temporaryChannel)
  oob=connectionless.services();oob.outOfBandFn=sendOob;oob.outOfBandDataFn=sendOobData
  oob.userinfoFn=userinfo;oob.printFn=printed;oob.disconnectFn=disconnected
  receiver=ingress.create(connection,wire,parser,ingress.services(oob))
  session=Session(socket,initialUserinfo,connection,wire,parser,receiver,sending,sender,void,0,0,"",0,serverCommands.create(void,void),serverCommands.services(),void,0)
  session.commandServices.context=session;session.commandServices.configstringFn=configstringChanged
  session.commandServices.systemInfoFn=systemInfoChanged;session.commandServices.clearUsercmdsFn=restarted
  oob.context=session;parser.gamestateState.context=session;parser.gamestateState.downloadsFn=gameStateReady
  session.pump=ingress.createPump(receiver,socket,void,net.MAX_MSGLEN)
  return session
end function

/// Synchronizes connection, acknowledgement, reliable-ring and snapshot state with the outgoing sender.
/// Returns void. A primed session becomes active only after a valid active snapshot for its accepted
/// gamestate generation; loading or disconnected sessions remain in their current lifecycle state.
/// Reliable-command arrays are shared with the wire codec rather than copied.
/// @param session Mutable session whose parser, connection, codec and sender state must agree.
function synchronize(session)
  connection=session.connection;sending=session.send;dispatcher=session.protocol.dispatcher
  sending.connectionState=connection.connectionState;sending.realtime=session.lastRealtime
  if connection.channel!=void then
    session.wire.connection.challenge=connection.challenge
    session.sendServices.context.channel=connection.channel;sending.outgoingSequence=connection.channel.outgoingSequence
  end if
  sending.serverMessageSequence=session.ingress.packetState.serverMessageSequence
  sending.serverCommandSequence=dispatcher.serverCommandSequence;sending.serverCommands=dispatcher.serverCommands
  sending.reliableAcknowledge=dispatcher.reliableAcknowledge
  session.wire.connection.reliableCommands=sending.reliableCommands
  session.wire.connection.serverCommands=dispatcher.serverCommands
  dispatcher.reliableSequence=sending.reliableSequence
  snapshot=dispatcher.snapshotState.snap;sending.snapValid=snapshot.valid;sending.snapMessageNum=snapshot.messageNum
  if connection.connectionState==connectionless.CA_PRIMED and snapshot.valid and (snapshot.snapFlags&SNAPFLAG_NOT_ACTIVE)==0 and session.preparedGeneration==session.gamestateGeneration and session.preparedGeneration>0 then
    connection.connectionState=connectionless.CA_ACTIVE;sending.connectionState=connectionless.CA_ACTIVE
  end if
  return void
end function

/// Advances the handshake and receives at most the requested number of datagrams at the supplied realtime.
/// Synchronizes state after each packet so a connect response can precede encrypted traffic in one poll.
/// Returns the processed-datagram count, error 7982 for invalid input, or a receive/processing error.
/// A zero packet budget still checks handshake retransmission and synchronizes the session.
/// @param session Session to poll; must not be void.
/// @param realtime Nonnegative client clock value in milliseconds used for resend and packet timing.
/// @param maxPackets Nonnegative maximum number of received datagrams to process before returning.
function poll(session,realtime,maxPackets)
  if session==void or realtime<0 or maxPackets<0 then return error(7982,"remote session: invalid poll") end if
  session.lastRealtime=realtime;session.connection.realtime=realtime
  ingress.setRealtime(session.ingress,realtime)
  connectionless.checkForResend(session.connection,session.ingress.services.connectionlessHost)
  // Synchronize after every datagram: a connectResponse can precede the first
  // encrypted gamestate in the same receive budget.
  count=0
  while count<maxPackets
    step=pump.pumpOnce(session.pump);if step is error then return step end if
    if not step.processed then break end if
    count=count+1;synchronize(session)
  end while
  synchronize(session);return count
end function

/// Accepts the current unpure gamestate after application asset preparation and returns void.
/// Requires a received gamestate in loading state and an exact `sv_pure` value of `"0"`; otherwise
/// returns error 7982. Sets the accepted generation and enters primed state, possibly becoming active
/// immediately if an active snapshot is already available. This entry point implements no pure-server
/// checksum validation or download negotiation; the application must load and validate assets first.
/// @param session Session awaiting explicit acceptance of its current gamestate generation.
function acceptUnpureGamestate(session)
  if session==void or session.gamestateGeneration<1 then return error(7982,"remote session: no gamestate") end if
  if session.connection.connectionState!=connectionless.CA_LOADING then return error(7982,"remote session: gamestate is not awaiting acceptance") end if
  system=gamestate.configString(session.protocol.gamestateState,1)
  if info.value(system,"sv_pure")!="0" then return error(7982,"remote session: pure server requires asset verification, not supported by this entry point") end if
  session.preparedGeneration=session.gamestateGeneration;session.connection.connectionState=connectionless.CA_PRIMED
  session.send.demoWaiting=false;synchronize(session);return void
end function

/// Consumes reliable server commands through an explicit application-selected sequence boundary.
/// Requires a primed or active session with its current gamestate accepted. Returns the number of
/// sequence entries consumed, including internal configstring fragments, or zero for an already
/// consumed boundary. Invalid state/boundaries return error 7982; command or application-callback
/// errors stop the session and propagate. Stops early if a callback ends the session or changes its
/// gamestate generation. Packet receipt alone never delivers commands beyond the requested boundary.
/// `serverCommandFn` receives transient tokenized arguments; retained values must be copied during the callback.
/// @param session Session whose consumer borrows the parser's reliable-command ring for this call.
/// @param throughSequence Last sequence to consume, normally the adopted snapshot's server-command number.
/// Must be nonnegative and no greater than the latest received sequence.
function runServerCommands(session,throughSequence)
  if session==void or session.commands==void then return error(7982,"remote session: no command stream") end if
  if session.connection.connectionState<connectionless.CA_PRIMED or session.connection.connectionState>connectionless.CA_ACTIVE or session.preparedGeneration<1 or session.preparedGeneration!=session.gamestateGeneration then return error(7982,"remote session: command stream is not active") end if
  state=session.commands;dispatcher=session.protocol.dispatcher
  if throughSequence<0 or throughSequence>dispatcher.serverCommandSequence then return error(7982,"remote session: command not received") end if
  if throughSequence<=state.lastExecuted then return 0 end if
  state.commandSequence=dispatcher.serverCommandSequence;state.commands=dispatcher.serverCommands
  count=0;generation=session.gamestateGeneration
  while state.lastExecuted<throughSequence
    sequence=state.lastExecuted+1
    delivered=try(serverCommands.get(state,session.commandServices,sequence))
    if delivered is error then stop(session,str(delivered));return delivered end if
    count=count+1
    if session.gamestateGeneration!=generation or session.preparedGeneration!=generation or session.connection.connectionState<connectionless.CA_PRIMED or session.connection.connectionState>connectionless.CA_ACTIVE then break end if
    if delivered and session.serverCommandFn!=void then
      result=try(session.serverCommandFn(session,sequence,state.commandState))
      if result is error then stop(session,str(result));return result end if
    end if
    // A callback may end the session or load another gamestate. Commands at
    // the old adoption boundary must then wait for the next explicit call.
    if session.gamestateGeneration!=generation or session.preparedGeneration!=generation or session.connection.connectionState<connectionless.CA_PRIMED or session.connection.connectionState>connectionless.CA_ACTIVE then break end if
  end while
  synchronize(session);return count
end function

/// Enqueues one reliable client command and returns its newly assigned sequence number.
/// Returns error 7982 for missing input, text of 1,024 bytes or more, or a full unacknowledged ring.
/// Queuing synchronizes protocol sequence state but does not itself send a datagram.
/// @param session Session whose outgoing reliable-command ring receives the command.
/// @param text Command text shorter than 1,024 encoded bytes; an empty string is permitted.
function queueCommand(session,text)
  if session==void or text==void or len(bytes(text))>=1024 then return error(7982,"remote session: invalid reliable command") end if
  sending=session.send
  if sending.reliableSequence-sending.reliableAcknowledge>=sendCmd.MAX_RELIABLE_COMMANDS then return error(7982,"remote session: reliable command overflow") end if
  sending.reliableSequence=sending.reliableSequence+1
  sending.reliableCommands[sending.reliableSequence&(sendCmd.MAX_RELIABLE_COMMANDS-1)]=text
  synchronize(session);return sending.reliableSequence
end function

/// Runs one outgoing client-frame send attempt and updates snapshot acknowledgement timing for a sent packet.
/// Returns a sender WriteResult or the no-send string `"disconnected"`, `"paused"` or `"choked"`.
/// Sender errors propagate; a missing session produces error 7982. Packet history is copied only when
/// the outgoing sequence advances.
/// @param session Session providing user commands, reliable commands, transport and packet history.
/// @param serverTime Game/server time in milliseconds attached to the outgoing user command.
function sendFrame(session,serverTime)
  if session==void then return error(7982,"remote session: missing session") end if
  synchronize(session);before=session.send.outgoingSequence
  result=sendCmd.send(session.send,serverTime,session.sendServices);if result is error then return result end if
  state=session.protocol.dispatcher.snapshotState;state.outgoingSequence=session.send.outgoingSequence
  if session.send.outgoingSequence!=before then
    source=session.send.outPackets[before&sendCmd.PACKET_MASK]
    state.outPackets[before&sendCmd.PACKET_MASK]=snapshots.OutPacket(source.serverTime,source.realtime)
  end if
  return result
end function
