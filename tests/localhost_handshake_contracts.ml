// SPDX-License-Identifier: GPL-2.0-or-later
// Real-socket protocol-68 handshake: OOB negotiation followed by client Netchan data.
import mq3.platform.udp as udp
import mq3.qcommon.net_transport as transport
import mq3.qcommon.netchan as net
import mq3.qcommon.message as message
import mq3.qcommon.huffman as huffman
import mq3.client.connectionless as clientConnectionless
import mq3.client.netchan as clientNetchan
import mq3.server.connectionless as serverConnectionless
import mq3.server.oob_connect as serverConnect
import mq3.server.netchan as serverNetchan

struct ClientContext socket prints end struct

function req(value,label)
  if not value then return error(6990,"localhost handshake: "+label) end if
  return 1
end function

function equalBytes(left,right)
  if len(left)!=len(right) then return false end if
  if len(left)>0 then for index=0 to len(left)-1 if left[index]!=right[index] then return false end if end for end if
  return true
end function

function waitPacket(socket)
  for attempt=0 to 19999
    packet=transport.receive(socket,65535)
    if packet.received then return packet end if
  end for
  return error(6990,"localhost handshake: UDP receive timeout")
end function

function asMessage(data,oob)
  msg=message.initStorage(data,len(data),oob);msg.cursize=len(data);return msg
end function

function clientPrint(host,state,text) host.context.prints=host.context.prints+[text];return void end function
function clientLan(host,state,address) return true end function
function clientAuthorize(host,state) return void end function
function clientUserinfo(host,state) return "\\name\\Ranger" end function
function clientClearUserinfo(host,state) return void end function
function clientOob(host,state,address,text) return transport.outOfBandPrint(host.context.socket,address,text) end function
function clientOobData(host,state,address,data) return transport.outOfBandData(host.context.socket,address,data) end function

function serverRandom(runtime) return 7 end function
function serverLan(runtime,address) return true end function
function serverLocal(runtime,address) return false end function
function serverGameConnect(runtime,slot,userinfo) return void end function
function serverSend(runtime,address,text) return transport.outOfBandPrint(runtime.context,address,text) end function
function serverDecompress(host,msg,offset)
  restored=huffman.decompressPacket(slice(msg.data,0,msg.cursize),offset,net.MAX_MSGLEN)
  msg.data=restored;msg.maxsize=len(restored);msg.cursize=len(restored)
  return void
end function

function clientServices(socket)
  host=clientConnectionless.services();host.context=ClientContext(socket,[])
  host.printFn=clientPrint;host.lanFn=clientLan;host.authorizationFn=clientAuthorize
  host.userinfoFn=clientUserinfo;host.clearUserinfoModifiedFn=clientClearUserinfo
  host.outOfBandFn=clientOob;host.outOfBandDataFn=clientOobData
  return host
end function

function serverServices()
  host=serverConnectionless.services();host.decompressFn=serverDecompress;return host
end function

function clientCommand()
  msg=message.init(net.MAX_MSGLEN);message.writeLong(msg,11);message.writeLong(msg,0);message.writeLong(msg,0);message.writeByte(msg,77);return msg
end function

function main(args)
  count=0;udp.startup();clientSocket=udp.open();serverSocket=udp.open();loopback=udp.ipv4(127,0,0,1)
  clientEndpoint=udp.bind(clientSocket,udp.Endpoint(loopback,0));serverEndpoint=udp.bind(serverSocket,udp.Endpoint(loopback,0))
  clientAddress=transport.endpointToAddress(clientEndpoint);serverAddress=transport.endpointToAddress(serverEndpoint)
  count=count+req(clientEndpoint.port!=serverEndpoint.port and clientEndpoint.port>0 and serverEndpoint.port>0,"distinct bound sockets")

  clientState=clientConnectionless.create(serverAddress);clientState.connectionState=clientConnectionless.CA_CONNECTING
  clientState.realtime=4000;clientState.connectTime=0;clientState.qport=23117;clientHost=clientServices(clientSocket)
  count=count+req(clientConnectionless.checkForResend(clientState,clientHost),"client emits getchallenge")
  getchallenge=waitPacket(serverSocket)
  count=count+req(getchallenge.address.port==clientEndpoint.port and equalBytes(getchallenge.data,bytes([255,255,255,255])+bytes("getchallenge")),"getchallenge UDP bytes and source")

  serverRuntime=serverConnect.create(2,serverConnect.config());serverRuntime.time=1000;serverRuntime.randFn=serverRandom
  serverRuntime.lanFn=serverLan;serverRuntime.localFn=serverLocal;serverRuntime.sendFn=serverSend
  serverRuntime.gameConnectFn=serverGameConnect;serverRuntime.context=serverSocket;serverHost=serverServices()
  count=count+req(serverConnectionless.dispatch(serverRuntime,serverHost,getchallenge.address,asMessage(getchallenge.data,true))=="getchallenge","server dispatches getchallenge")
  count=count+req(serverRuntime.challenges[0].address.port==clientEndpoint.port and serverRuntime.challenges[0].pingTime==1000,"server stores challenge")

  challengeWire=waitPacket(clientSocket)
  count=count+req(challengeWire.address.port==serverEndpoint.port,"challengeResponse source")
  count=count+req(clientConnectionless.dispatch(clientState,clientHost,challengeWire.address,asMessage(challengeWire.data,true))=="challengeResponse","client dispatches challengeResponse")
  count=count+req(clientState.connectionState==clientConnectionless.CA_CHALLENGING and clientState.challenge==serverRuntime.challenges[0].challenge,"challenge synchronized")

  clientState.realtime=5000
  count=count+req(clientConnectionless.checkForResend(clientState,clientHost),"client emits connect")
  connectWire=waitPacket(serverSocket)
  count=count+req(equalBytes(slice(connectWire.data,0,12),bytes([255,255,255,255])+bytes("connect ")),"connect keeps 12-byte prefix")
  count=count+req(not equalBytes(connectWire.data,huffman.decompressPacket(connectWire.data,12,net.MAX_MSGLEN)),"connect suffix is Huffman encoded")
  count=count+req(serverConnectionless.dispatch(serverRuntime,serverHost,connectWire.address,asMessage(connectWire.data,true))=="connect","server dispatches compressed connect")
  accepted=serverRuntime.clients[0]
  count=count+req(accepted.state==serverConnect.CS_CONNECTED and accepted.challenge==clientState.challenge,"server accepts negotiated challenge")
  count=count+req(accepted.qport==clientState.qport and accepted.address.port==clientEndpoint.port,"server records qport and UDP source")

  responseWire=waitPacket(clientSocket)
  count=count+req(equalBytes(responseWire.data,bytes([255,255,255,255])+bytes("connectResponse")),"connectResponse UDP bytes")
  count=count+req(clientConnectionless.dispatch(clientState,clientHost,responseWire.address,asMessage(responseWire.data,true))=="connectResponse","client dispatches connectResponse")
  count=count+req(clientState.connectionState==clientConnectionless.CA_CONNECTED and clientState.channel.remoteAddress.port==serverEndpoint.port,"client creates server channel")

  clientTransport=transport.attach(net.init(clientState.qport),clientSocket);clientConnection=clientNetchan.createConnection();clientConnection.challenge=clientState.challenge
  clientRuntime=clientNetchan.create(clientTransport,clientConnection)
  expected=clientCommand();message.writeByte(expected,clientNetchan.CLC_EOF);expectedBody=slice(expected.data,0,expected.cursize)
  outgoing=clientCommand();wire=clientNetchan.transmit(clientRuntime,clientState.channel,outgoing)
  firstPacket=waitPacket(serverSocket)
  count=count+req(equalBytes(firstPacket.data,wire) and net.readShort(wire,4)==clientState.qport,"first sequenced packet crosses UDP with qport")
  serverChannel=net.setup(net.NS_SERVER,firstPacket.address,clientState.qport);serverClient=serverNetchan.client(clientState.challenge,serverChannel)
  processed=serverNetchan.process(serverClient,firstPacket.data,net.MAX_MSGLEN)
  count=count+req(processed.accepted and serverChannel.incomingSequence==1 and processed.readcount==6,"server accepts first sequence")
  count=count+req(equalBytes(slice(processed.data,processed.readcount,processed.cursize-processed.readcount),expectedBody),"server restores exact client message bytes")

  udp.close(clientSocket);udp.close(serverSocket);udp.cleanup()
  print "PASS: "+str(count)+" localhost protocol-68 handshake contracts";return 0
end function
