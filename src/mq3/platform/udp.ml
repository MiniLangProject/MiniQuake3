// SPDX-License-Identifier: GPL-2.0-or-later
// Windows-x64 raw UDP boundary. Quake packet policy belongs to qcommon/client/server.
package mq3.platform.udp
import mq3.compat.numeric as n

/// Initializes Winsock 2.2 for the raw UDP boundary.
/// @returns 0 on success; the Winsock startup error code otherwise.
extern function mq3_udp_startup() from "miniquake3_udp.dll" returns i32
/// Releases the UDP boundary's Winsock startup reference.
/// @returns 0 on success; the Winsock error code on failure.
extern function mq3_udp_cleanup() from "miniquake3_udp.dll" returns i32
/// Reads the last Winsock error for the calling thread.
/// @returns The error code reported by WSAGetLastError.
extern function mq3_udp_last_error() from "miniquake3_udp.dll" returns i32
/// Copies the symbolic name of a Winsock error into a bounded text buffer.
/// @param code Winsock error code whose symbolic name is requested.
/// @param output Writable NUL-terminated name buffer.
/// @param capacity Output-buffer capacity in bytes.
/// @returns 0 when the name is written; WSAEINVAL for invalid output arguments.
extern function mq3_udp_error_name(code as i32,output as bytes,capacity as i32) from "miniquake3_udp.dll" returns i32
/// Creates and configures a nonblocking IPv4 UDP socket.
/// @returns The raw socket handle, or INVALID_SOCKET (-1) on failure.
extern function mq3_udp_socket() from "miniquake3_udp.dll" returns ptr
/// Enables or disables SO_BROADCAST on an existing UDP socket.
/// @param socket Raw socket handle created by mq3_udp_socket.
/// @param enabled Nonzero enables the requested native feature.
/// @returns 0 on success; a Winsock error code on failure.
extern function mq3_udp_set_broadcast(socket as ptr,enabled as i32) from "miniquake3_udp.dll" returns i32
/// Resolves a wide hostname and writes the first IPv4 address in host order.
/// @param name Wide-string host name or IPv4 text to resolve.
/// @param address Writable four-byte buffer for a host-order IPv4 integer.
/// @returns 0 on success; a resolver or Winsock error code otherwise.
extern function mq3_udp_resolve_ipv4(name as wstr,address as bytes) from "miniquake3_udp.dll" returns i32
/// Binds a UDP socket using a host-order IPv4 address and port.
/// @param socket Raw socket handle created by mq3_udp_socket.
/// @param address Local IPv4 address in host order; zero binds all interfaces.
/// @param port IPv4 port number in host order.
/// @returns 0 on success; the Winsock bind error otherwise.
extern function mq3_udp_bind(socket as ptr,address as u32,port as u32) from "miniquake3_udp.dll" returns i32
/// Reads the bound socket's IPv4 address in host order.
/// @param socket Raw socket handle created by mq3_udp_socket.
/// @returns The local address, or 0 when getsockname fails.
extern function mq3_udp_local_address(socket as ptr) from "miniquake3_udp.dll" returns u32
/// Reads the bound socket's port in host order.
/// @param socket Raw socket handle created by mq3_udp_socket.
/// @returns The local port, or a negated Winsock error.
extern function mq3_udp_local_port(socket as ptr) from "miniquake3_udp.dll" returns i32
/// Sends one UDP datagram to a host-order IPv4 endpoint.
/// @param socket Raw socket handle created by mq3_udp_socket.
/// @param address Destination IPv4 address in host order.
/// @param port IPv4 port number in host order.
/// @param data Read-only datagram payload.
/// @param length Payload length in bytes; the entire datagram is submitted in one sendto call.
/// @returns Bytes sent, or a negated Winsock error.
extern function mq3_udp_send(socket as ptr,address as u32,port as u32,data as ptr,length as i32) from "miniquake3_udp.dll" returns i32
/// Receives one nonblocking UDP datagram and writes its sender address and port.
/// @param socket Raw socket handle created by mq3_udp_socket.
/// @param data Writable destination for one datagram.
/// @param capacity Maximum datagram bytes writable at data.
/// @param metadata Writable eight-byte buffer for host-order sender IPv4 address and port.
/// @returns Received byte count; -2 for would-block, or another negated Winsock error.
extern function mq3_udp_recv(socket as ptr,data as ptr,capacity as i32,metadata as bytes) from "miniquake3_udp.dll" returns i32
/// Closes a raw UDP socket handle.
/// @param socket Raw socket handle created by mq3_udp_socket.
/// @returns 0 on success; the Winsock error code on failure.
extern function mq3_udp_close(socket as ptr) from "miniquake3_udp.dll" returns i32
/// Negotiates a SOCKS5 UDP association and writes the relay endpoint.
/// @param server SOCKS5 server hostname passed as a wide string.
/// @param port IPv4 port number in host order.
/// @param username SOCKS5 username passed as a wide string.
/// @param password SOCKS5 password passed as a wide string.
/// @param udpPort Local UDP port announced in the SOCKS5 association.
/// @param relay Writable eight-byte buffer for relay IPv4 address and port in host order.
/// @returns The TCP control socket retained for the association, or INVALID_SOCKET (-1) on failure.
extern function mq3_udp_socks5_open(server as wstr,port as u32,username as wstr,password as wstr,udpPort as u32,relay as bytes) from "miniquake3_udp.dll" returns ptr
/// Waits with select until the socket is readable or the timeout expires.
/// @param socket Raw socket handle created by mq3_udp_socket.
/// @param milliseconds Maximum wait duration in milliseconds.
/// @returns Positive when readable, 0 on timeout, a negated select error, or WSAEINVAL for a negative timeout.
extern function mq3_udp_wait_readable(socket as ptr,milliseconds as i32) from "miniquake3_udp.dll" returns i32
/// Collects local IPv4 addresses into a bounded host-order integer array.
/// @param addresses Writable array of 32-bit host-order IPv4 addresses.
/// @param capacity Number of 32-bit address elements available, not a byte count.
/// @returns Number of addresses written, or a negated Winsock/resolver error.
extern function mq3_udp_local_ipv4_count(addresses as bytes,capacity as i32) from "miniquake3_udp.dll" returns i32

/// Data record for `mq3.platform.udp.Endpoint`; groups `address`, `port`.
struct Endpoint address port end struct
/// Data record for `mq3.platform.udp.Datagram`; groups `received`, `endpoint`, `data`.
struct Datagram received endpoint data end struct
/// Data record for `mq3.platform.udp.Socks5`; groups `control`, `relay`.
struct Socks5 control relay end struct

/// Returns `(a<<24)|(b<<16)|(c<<8)|d` from `mq3.platform.udp.ipv4`; earlier branches return `error(6960,"udp: invalid IPv4 octet")`.
/// @param a Input tested by `a<0 or a>255 or b<0 or b>255 or c<0 or c>255 or d<0 or d>255`.
/// @param b Input tested by `a<0 or a>255 or b<0 or b>255 or c<0 or c>255 or d<0 or d>255`.
/// @param c Input tested by `a<0 or a>255 or b<0 or b>255 or c<0 or c>255 or d<0 or d>255`.
/// @param d Input tested by `a<0 or a>255 or b<0 or b>255 or c<0 or c>255 or d<0 or d>255`.
function ipv4(a,b,c,d)
  if a<0 or a>255 or b<0 or b>255 or c<0 or c>255 or d<0 or d>255 then return error(6960,"udp: invalid IPv4 octet") end if
  return (a<<24)|(b<<16)|(c<<8)|d
end function
/// Returns `[(address>>24)&255,(address>>16)&255,(address>>8)&255,address&255]` for `mq3.platform.udp.octets`.
/// @param address Input used in the result expression `[(address>>24)&255,(address>>16)&255,(address>>8)&255,address&255]`.
function octets(address) return [(address>>24)&255,(address>>16)&255,(address>>8)&255,address&255] end function
/// Returns `void` from `mq3.platform.udp.startup`; earlier branches return `error(6961,"udp: WSAStartup failed "+str(code))`.
function startup()
  code=mq3_udp_startup();if code!=0 then return error(6961,"udp: WSAStartup failed "+str(code)) end if;return void
end function
/// Returns `void` from `mq3.platform.udp.cleanup`; earlier branches return `error(6962,"udp: WSACleanup failed "+str(code))`.
function cleanup()
  code=mq3_udp_cleanup();if code!=0 then return error(6962,"udp: WSACleanup failed "+str(code)) end if;return void
end function
/// Calls `mq3.platform.udp.mq3_udp_last_error` with `()` and returns its result.
function lastError() return mq3_udp_last_error() end function
/// Computes `errorName` from `decode(slice(output,0,endAt))` using `mq3.platform.udp.mq3_udp_error_name`.
/// @param code Value forwarded as `code` to `mq3.platform.udp.mq3_udp_error_name`.
function errorName(code)
  output=bytes(64,0);result=mq3_udp_error_name(code,output,len(output));if result!=0 then return "NO ERROR" end if
  endAt=0;while endAt<len(output) and output[endAt]!=0 endAt=endAt+1 end while;return decode(slice(output,0,endAt))
end function
/// Returns `socket` from `mq3.platform.udp.open`; earlier branches return `error(6963,"udp: socket failed")`.
function open()
  socket=mq3_udp_socket();if socket==-1 then return error(6963,"udp: socket failed") end if;return socket
end function
/// Applies the socket broadcast flag and converts a Winsock failure into error 6969.
/// @param socket Value forwarded as `socket` to `mq3.platform.udp.mq3_udp_set_broadcast`.
/// @param enabled Input tested by `enabled`.
function setBroadcast(socket,enabled)
  if socket==void then return error(6969,"udp: invalid broadcast socket") end if
  value=0;if enabled then value=1 end if;code=mq3_udp_set_broadcast(socket,value)
  if code!=0 then return error(6969,"udp: SO_BROADCAST failed "+str(code)) end if;return void
end function
/// Computes `resolveIPv4` from `n.readU32(address,0)` using `mq3.platform.udp.mq3_udp_resolve_ipv4`, `mq3.compat.numeric.readU32`.
/// @param name Value forwarded as `name` to `mq3.platform.udp.mq3_udp_resolve_ipv4`.
function resolveIPv4(name)
  if name==void or name=="" then return error(6969,"udp: invalid DNS name") end if
  address=bytes(4,0);code=mq3_udp_resolve_ipv4(name,address)
  if code!=0 then return error(6969,"udp: IPv4 resolution failed "+str(code)) end if
  return n.readU32(address,0)
end function
/// Computes `bind` from `localEndpoint(socket)` using `mq3.platform.udp.mq3_udp_bind`, `mq3.platform.udp.localEndpoint`.
/// @param socket Value forwarded as `socket` to `mq3.platform.udp.mq3_udp_bind`.
/// @param endpoint Record providing `endpoint.port`, `endpoint.address`.
function bind(socket,endpoint)
  if socket==void or endpoint==void or endpoint.port<0 or endpoint.port>65535 then return error(6964,"udp: invalid bind") end if
  code=mq3_udp_bind(socket,endpoint.address,endpoint.port);if code!=0 then return error(6964,"udp: bind failed "+str(code)) end if;return localEndpoint(socket)
end function
/// Builds `mq3.platform.udp.Endpoint` for `mq3.platform.udp.localEndpoint`.
/// @param socket Value forwarded as `socket` to `mq3.platform.udp.mq3_udp_local_port`.
function localEndpoint(socket)
  port=mq3_udp_local_port(socket);if port<0 then return error(6965,"udp: getsockname failed "+str(0-port)) end if
  return Endpoint(mq3_udp_local_address(socket),port)
end function
/// Computes `sendTo` from `mq3_udp_s` using `mq3.platform.udp.mq3_udp_send`.
/// @param socket Value forwarded as `socket` to `mq3.platform.udp.mq3_udp_send`.
/// @param endpoint Record providing `endpoint.port`, `endpoint.address`.
/// @param data Input tested by `socket==void or endpoint==void or data==void or endpoint.port<0 or endpoint.port>65535`.
function sendTo(socket,endpoint,data)
  if socket==void or endpoint==void or data==void or endpoint.port<0 or endpoint.port>65535 then return error(6966,"udp: invalid send") end if
  result=mq3_udp_send(socket,endpoint.address,endpoint.port,nativeBytesPtr(data),len(data))
  if result<0 then return error(6966,"udp: sendto failed "+str(0-result)) end if
  if result!=len(data) then return error(6966,"udp: partial datagram") end if
  return result
end function
/// Builds `mq3.platform.udp.Datagram` for `mq3.platform.udp.receiveFromBuffered`.
/// @param socket Value forwarded as `socket` to `mq3.platform.udp.mq3_udp_recv`.
/// @param data Argument 1 supplied to `slice`.
/// @param metadata Value forwarded as `metadata` to `mq3.platform.udp.mq3_udp_recv`.
/// @param capacity Value forwarded as `capacity` to `mq3.platform.udp.mq3_udp_recv`.
function receiveFromBuffered(socket,data,metadata,capacity)
  if socket==void or data==void or metadata==void or capacity<1 or capacity>65535 or len(data)<capacity or len(metadata)<8 then return error(6967,"udp: invalid receive buffer") end if
  result=mq3_udp_recv(socket,nativeBytesPtr(data),capacity,metadata)
  if result==-2 then return Datagram(false,void,bytes(0,0)) end if
  if result<0 then return error(6967,"udp: recvfrom failed "+str(0-result)) end if
  return Datagram(true,Endpoint(n.readU32(metadata,0),n.readU32(metadata,4)),slice(data,0,result))
end function
/// Returns `receiveFromBuffered(socket,bytes(capacity,0),bytes(8,0),capacity)` from `mq3.platform.udp.receiveFrom`; earlier branches return `error(6967,"udp: invalid receive capacity")`.
/// @param socket Value forwarded as `socket` to `mq3.platform.udp.receiveFromBuffered`.
/// @param capacity Value forwarded as `capacity` to `mq3.platform.udp.receiveFromBuffered`.
function receiveFrom(socket,capacity)
  if socket==void or capacity<1 or capacity>65535 then return error(6967,"udp: invalid receive capacity") end if
  return receiveFromBuffered(socket,bytes(capacity,0),bytes(8,0),capacity)
end function
/// Returns `void` from `mq3.platform.udp.close`; earlier branches return `error(6968,"udp: invalid socket")`, `error(6968,"udp: closesocket failed "+str(code))`.
/// @param socket Value forwarded as `socket` to `mq3.platform.udp.mq3_udp_close`.
function close(socket)
  if socket==void then return error(6968,"udp: invalid socket") end if
  code=mq3_udp_close(socket);if code!=0 then return error(6968,"udp: closesocket failed "+str(code)) end if;return void
end function
/// Builds `mq3.platform.udp.Socks5` for `mq3.platform.udp.openSocks5`.
/// @param server Value forwarded as `server` to `mq3.platform.udp.mq3_udp_socks5_open`.
/// @param port Value forwarded as `port` to `mq3.platform.udp.mq3_udp_socks5_open`.
/// @param username Value forwarded as `username` to `mq3.platform.udp.mq3_udp_socks5_open`.
/// @param password Value forwarded as `password` to `mq3.platform.udp.mq3_udp_socks5_open`.
/// @param udpPort Value forwarded as `udpPort` to `mq3.platform.udp.mq3_udp_socks5_open`.
function openSocks5(server,port,username,password,udpPort)
  if server==void or server=="" or port<1 or port>65535 or udpPort<0 or udpPort>65535 then return error(6969,"udp: invalid SOCKS5 configuration") end if
  relay=bytes(8,0);control=mq3_udp_socks5_open(server,port,username,password,udpPort,relay)
  if control==-1 then return error(6969,"udp: SOCKS5 negotiation failed "+str(lastError())) end if
  return Socks5(control,Endpoint(n.readU32(relay,0),n.readU32(relay,4)))
end function
/// Computes `waitReadable` from `result>0` using `mq3.platform.udp.mq3_udp_wait_readable`.
/// @param socket Value forwarded as `socket` to `mq3.platform.udp.mq3_udp_wait_readable`.
/// @param milliseconds Value forwarded as `milliseconds` to `mq3.platform.udp.mq3_udp_wait_readable`.
function waitReadable(socket,milliseconds)
  if socket==void or milliseconds<0 then return error(6969,"udp: invalid wait") end if
  result=mq3_udp_wait_readable(socket,milliseconds);if result<0 then return error(6969,"udp: select failed "+str(0-result)) end if;return result>0
end function
/// Returns up to sixteen host-order local IPv4 addresses from the native resolver.
function localIPv4()
  raw=bytes(64,0);count=mq3_udp_local_ipv4_count(raw,16);if count<0 then return error(6969,"udp: local address query failed "+str(0-count)) end if
  values=[];for index=0 to count-1 values=values+[n.readU32(raw,index*4)] end for;return values
end function
