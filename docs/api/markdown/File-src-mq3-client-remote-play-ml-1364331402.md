# `src/mq3/client/remote_play.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.remote_play`](Package-mq3-client-remote-play-480150054.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/command_ring.ml` as `remoteCommands` → [src/mq3/client/command_ring.ml](File-src-mq3-client-command-ring-ml-1850754325.md)
- `mq3/client/connectionless.ml` as `remoteConnectionless` → [src/mq3/client/connectionless.ml](File-src-mq3-client-connectionless-ml-1561502254.md)
- `mq3/client/gamestate.ml` as `remoteGamestate` → [src/mq3/client/gamestate.ml](File-src-mq3-client-gamestate-ml-1690167636.md)
- `mq3/client/netchan.ml` as `remoteClientNetchan` → [src/mq3/client/netchan.ml](File-src-mq3-client-netchan-ml-1745063016.md)
- `mq3/client/network_ingress.ml` as `remoteIngress` → [src/mq3/client/network_ingress.ml](File-src-mq3-client-network-ingress-ml-1289633455.md)
- `mq3/client/protocol_runtime.ml` as `remoteProtocolRuntime` → [src/mq3/client/protocol_runtime.ml](File-src-mq3-client-protocol-runtime-ml-1085434472.md)
- `mq3/client/remote_pure.ml` as `remotePure` → [src/mq3/client/remote_pure.ml](File-src-mq3-client-remote-pure-ml-1817468994.md)
- `mq3/client/send_cmd.ml` as `remoteSend` → [src/mq3/client/send_cmd.ml](File-src-mq3-client-send-cmd-ml-1342588170.md)
- `mq3/compat/textnumbers.ml` as `remoteNumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/platform/udp.ml` as `remoteUdp` → [src/mq3/platform/udp.ml](File-src-mq3-platform-udp-ml-646757928.md)
- `mq3/qcommon/command_buffer.ml` as `remoteCommandBuffer` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/net_transport.ml` as `remoteTransport` → [src/mq3/qcommon/net_transport.ml](File-src-mq3-qcommon-net-transport-ml-1557933377.md)
- `mq3/qcommon/netchan.ml` as `remoteNetchan` → [src/mq3/qcommon/netchan.ml](File-src-mq3-qcommon-netchan-ml-1381353623.md)
- `mq3/shared/info.ml` as `remoteInfo` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `remoteStrings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-remote-play-acceptpacket-function-acceptpacket-live-packet-now-src-mq3-client-remote-play-ml-332987908"></a>
### acceptPacket

```ml
function acceptPacket(live, packet, now)
```

Updates `live.lastAccepted`, `live.outgoing.lastPacketSentTime`, `live.sendHost` during remote play `acceptPacket`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Mutable remote play record/storage; this routine assigns `live.lastAccepted`, `live.outgoing.lastPacketSentTime`, `live.sendHost`. |
| `packet` | `dynamic` | — | Record read through `packet.address`, `packet.data`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L348)

<a id="function-function-mq3-client-remote-play-appendcommand-function-appendcommand-live-command-src-mq3-client-remote-play-ml-2097436221"></a>
### appendCommand

```ml
function appendCommand(live, command)
```

Calls `mq3.client.command_ring.store`, `mq3.client.send_cmd.commandCopy` from remote play `appendCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Record read through `live.outgoing`. |
| `command` | `dynamic` | — | Value used by `remoteCommands.store(outgoing.commands,outgoing.cmdNumber,remoteSend.commandCopy(command))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L253)

<a id="function-function-mq3-client-remote-play-approvedarchive-function-approvedarchive-live-src-mq3-client-remote-play-ml-1021690626"></a>
### approvedArchive

```ml
function approvedArchive(live)
```

Reads `live.verifiedArchive` for remote play `approvedArchive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Record read through `live.verifiedArchive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L213)

<a id="function-function-mq3-client-remote-play-checkservercommands-function-checkservercommands-live-src-mq3-client-remote-play-ml-198608966"></a>
### checkServerCommands

```ml
function checkServerCommands(live)
```

Updates `live.lastCommandSequence` during remote play `checkServerCommands`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Mutable remote play record/storage; this routine assigns `live.lastCommandSequence`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L317)

<a id="function-function-mq3-client-remote-play-close-function-close-live-now-src-mq3-client-remote-play-ml-1816778960"></a>
### close

```ml
function close(live, now)
```

Updates `live.socket`, `live.sendHost`, `live.connection.connectionState` during remote play `close`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Mutable remote play record/storage; this routine assigns `live.socket`, `live.sendHost`, `live.connection.connectionState`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L442)

<a id="function-function-mq3-client-remote-play-closesocket-function-closesocket-socket-src-mq3-client-remote-play-ml-995307255"></a>
### closeSocket

```ml
function closeSocket(socket)
```

Calls `mq3.platform.udp.close`, `mq3.platform.udp.cleanup` from remote play `closeSocket`. The final path returns `remoteUdp.cleanup()`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — | Value used by `if socket!=void then ignored=try(remoteUdp.close(socket)) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L155)

<a id="constant-constant-mq3-client-remote-play-connect-timeout-ms-const-connect-timeout-ms-12000-src-mq3-client-remote-play-ml-1043205220"></a>
### CONNECT_TIMEOUT_MS

```ml
const CONNECT_TIMEOUT_MS = 12000
```

Duration or timeout in milliseconds controlling connect timeout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L27)

- [mq3.client.remote_play.ConnectionHost](Type-mq3-client-remote-play-connectionhost-1726380738.md) — struct
<a id="function-function-mq3-client-remote-play-create-function-create-serveraddress-userinfo-now-src-mq3-client-remote-play-ml-592338632"></a>
### create

```ml
function create(serverAddress, userinfo, now)
```

Calls `mq3.client.remote_play.parseEndpoint`, `mq3.platform.udp.startup`, `mq3.qcommon.net_transport.resolveIPv4` and additional helpers from remote play `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverAddress` | `dynamic` | — | Value used by `endpoint=try(parseEndpoint(serverAddress))`. |
| `userinfo` | `dynamic` | — | Value used by `if userinfo==void or userinfo=="" then userinfo="\\\\name\\\\UnnamedPlayer\\\\rate\\\\25000\\\\snaps\\\\40" end if`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L164)

<a id="constant-constant-mq3-client-remote-play-cs-serverinfo-const-cs-serverinfo-0-src-mq3-client-remote-play-ml-670671105"></a>
### CS_SERVERINFO

```ml
const CS_SERVERINFO = 0
```

Server configuration-string index for serverinfo; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L21)

<a id="constant-constant-mq3-client-remote-play-cs-systeminfo-const-cs-systeminfo-1-src-mq3-client-remote-play-ml-1885161058"></a>
### CS_SYSTEMINFO

```ml
const CS_SYSTEMINFO = 1
```

Server configuration-string index for systeminfo; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L23)

<a id="function-function-mq3-client-remote-play-entergamestate-function-entergamestate-live-now-src-mq3-client-remote-play-ml-1820433300"></a>
### enterGamestate

```ml
function enterGamestate(live, now)
```

Updates `live.verifiedArchive`, `live.epoch`, `live.map`, `live.game` and additional values during remote play `enterGamestate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Mutable remote play record/storage; this routine assigns `live.verifiedArchive`, `live.epoch`, `live.map`, `live.game` and additional values. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L276)

<a id="function-function-mq3-client-remote-play-gamedirectory-function-gamedirectory-live-src-mq3-client-remote-play-ml-1827128082"></a>
### gameDirectory

```ml
function gameDirectory(live)
```

Reads `live.game` for remote play `gameDirectory`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Record read through `live.game`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L210)

- [mq3.client.remote_play.Live](Type-mq3-client-remote-play-live-330645626.md) — struct
<a id="function-function-mq3-client-remote-play-mapname-function-mapname-live-src-mq3-client-remote-play-ml-1070061570"></a>
### mapName

```ml
function mapName(live)
```

Reads `live.map` for remote play `mapName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Record read through `live.map`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L207)

<a id="function-function-mq3-client-remote-play-parseendpoint-function-parseendpoint-address-src-mq3-client-remote-play-ml-776130406"></a>
### parseEndpoint

```ml
function parseEndpoint(address)
```

Calls `std.string.indexOf`, `std.string.substr`, `mq3.client.remote_play.ServerEndpoint` from remote play `parseEndpoint`. The final path returns `ServerEndpoint(host,port)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Sequence whose length/content is inspected by `parseEndpoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L103)

<a id="function-function-mq3-client-remote-play-primed-function-primed-live-src-mq3-client-remote-play-ml-1893259632"></a>
### primed

```ml
function primed(live)
```

Computes `live!=void and live.connection.connectionState==remoteConnectionless.CA_ACTIVE` for remote play `primed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Record read through `live.connection.connectionState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L201)

<a id="function-function-mq3-client-remote-play-pump-function-pump-live-now-budget-src-mq3-client-remote-play-ml-651900507"></a>
### pump

```ml
function pump(live, now, budget)
```

Calls `mq3.client.network_ingress.setRealtime`, `mq3.qcommon.net_transport.receiveBuffered`, `mq3.qcommon.net_transport.compareAddress` and additional helpers from remote play `pump`. The final path returns `primed(live)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Record read through `live.socket`, `live.connection`, `live.ingress`, `live.receiveBytes` and additional values. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `budget` | `dynamic` | — | Value used by `if budget<1 or budget>64 then return error(7822,"Invalid UDP receive budget") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L375)

<a id="function-function-mq3-client-remote-play-queuereliable-function-queuereliable-live-text-src-mq3-client-remote-play-ml-1311593251"></a>
### queueReliable

```ml
function queueReliable(live, text)
```

Evaluates remote play `queueReliable` and returns `error(7823,"There is no server connection")`, `error(7823,"Invalid client command length")`, `error(7823,"The server has not acknowledged pending client commands")` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Record read through `live.sendHost`, `live.outgoing`, `live.protocol.dispatcher`. |
| `text` | `dynamic` | — | Text consumed or emitted by `queueReliable` in the remote play path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L403)

<a id="function-function-mq3-client-remote-play-readuserinfo-function-readuserinfo-host-state-src-mq3-client-remote-play-ml-66635275"></a>
### readUserinfo

```ml
function readUserinfo(host, state)
```

Reads `host.context.userinfo` for remote play `readUserinfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.context.userinfo`. |
| `state` | `dynamic` | — | Accepted for compatibility with `readUserinfo`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L151)

<a id="function-function-mq3-client-remote-play-sendoob-function-sendoob-host-state-address-text-src-mq3-client-remote-play-ml-1155473068"></a>
### sendOob

```ml
function sendOob(host, state, address, text)
```

Adapts `mq3.qcommon.net_transport.outOfBandPrint` to remote play `sendOob`, returning its result for `host.context.socket, address, text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.context.socket`. |
| `state` | `dynamic` | — | Accepted for compatibility with `sendOob`; the current implementation does not read it. |
| `address` | `dynamic` | — | Argument 2 of `mq3.qcommon.net_transport.outOfBandPrint`. |
| `text` | `dynamic` | — | Argument 3 of `mq3.qcommon.net_transport.outOfBandPrint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L135)

<a id="function-function-mq3-client-remote-play-sendoobdata-function-sendoobdata-host-state-address-data-src-mq3-client-remote-play-ml-597328209"></a>
### sendOobData

```ml
function sendOobData(host, state, address, data)
```

Adapts `mq3.qcommon.net_transport.outOfBandData` to remote play `sendOobData`, returning its result for `host.context.socket, address, data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.context.socket`. |
| `state` | `dynamic` | — | Accepted for compatibility with `sendOobData`; the current implementation does not read it. |
| `address` | `dynamic` | — | Argument 2 of `mq3.qcommon.net_transport.outOfBandData`. |
| `data` | `dynamic` | — | Argument 3 of `mq3.qcommon.net_transport.outOfBandData`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L144)

<a id="constant-constant-mq3-client-remote-play-server-timeout-ms-const-server-timeout-ms-30000-src-mq3-client-remote-play-ml-1093972604"></a>
### SERVER_TIMEOUT_MS

```ml
const SERVER_TIMEOUT_MS = 30000
```

Duration or timeout in milliseconds controlling server timeout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L29)

- [mq3.client.remote_play.ServerEndpoint](Type-mq3-client-remote-play-serverendpoint-997725670.md) — struct
<a id="function-function-mq3-client-remote-play-setbasepackages-function-setbasepackages-live-basedirectory-src-mq3-client-remote-play-ml-2052180312"></a>
### setBasePackages

```ml
function setBasePackages(live, baseDirectory)
```

Updates `live.baseDirectory` during remote play `setBasePackages`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Mutable remote play record/storage; this routine assigns `live.baseDirectory`. |
| `baseDirectory` | `dynamic` | — | Value assigned to `live.baseDirectory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L217)

<a id="constant-constant-mq3-client-remote-play-snapflag-not-active-const-snapflag-not-active-2-src-mq3-client-remote-play-ml-1133634727"></a>
### SNAPFLAG_NOT_ACTIVE

```ml
const SNAPFLAG_NOT_ACTIVE = 2
```

Snapshot flag indicating that the server state is not yet active for normal gameplay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L25)

<a id="function-function-mq3-client-remote-play-status-function-status-live-src-mq3-client-remote-play-ml-1047095072"></a>
### status

```ml
function status(live)
```

Evaluates remote play `status` and returns `"Receiving " + live.map`, `"Awaiting gamestate"`, `"Awaiting connection"` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Record read through `live.map`, `live.sendHost`, `live.connection.connectionState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L224)

<a id="function-function-mq3-client-remote-play-updatesendstate-function-updatesendstate-live-now-src-mq3-client-remote-play-ml-916121120"></a>
### updateSendState

```ml
function updateSendState(live, now)
```

Evaluates remote play `updateSendState` and returns `void` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Record read through `live.outgoing`, `live.protocol.dispatcher`, `live.connection.connectionState`, `live.ingress.packetState.serverMessageSequence`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L234)

<a id="function-function-mq3-client-remote-play-updateserversysteminfo-function-updateserversysteminfo-live-systeminfo-src-mq3-client-remote-play-ml-650668167"></a>
### updateServerSystemInfo

```ml
function updateServerSystemInfo(live, systemInfo)
```

Updates `live.outgoing.serverId` during remote play `updateServerSystemInfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Mutable remote play record/storage; this routine assigns `live.outgoing.serverId`. |
| `systemInfo` | `dynamic` | — | Value used by `serverId=remoteInfo.value(systemInfo,"sv_serverid")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L309)

<a id="function-function-mq3-client-remote-play-updateuserinfo-function-updateuserinfo-live-userinfo-src-mq3-client-remote-play-ml-1888079025"></a>
### updateUserinfo

```ml
function updateUserinfo(live, userinfo)
```

Updates `live.connectionHost.context.userinfo` during remote play `updateUserinfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Mutable remote play record/storage; this routine assigns `live.connectionHost.context.userinfo`. |
| `userinfo` | `dynamic` | — | Value assigned to `live.connectionHost.context.userinfo`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L420)

<a id="function-function-mq3-client-remote-play-writeframe-function-writeframe-live-command-now-src-mq3-client-remote-play-ml-2079946341"></a>
### writeFrame

```ml
function writeFrame(live, command, now)
```

Calls `mq3.client.remote_play.primed`, `mq3.client.remote_play.appendCommand`, `mq3.client.remote_play.writePacket` from remote play `writeFrame`. The final path returns `writePacket(live,now,false)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Value used by `if not primed(live) then return false end if`. |
| `command` | `dynamic` | — | Value used by `appendCommand(live,command)`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L433)

<a id="function-function-mq3-client-remote-play-writepacket-function-writepacket-live-now-force-src-mq3-client-remote-play-ml-1142715367"></a>
### writePacket

```ml
function writePacket(live, now, force)
```

Calls `mq3.client.remote_play.updateSendState`, `mq3.client.send_cmd.ready`, `mq3.client.send_cmd.writePacket` from remote play `writePacket`. The final path returns `result.sent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Record read through `live.sendHost`, `live.outgoing`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `force` | `dynamic` | — | Value used by `if not force and not remoteSend.ready(live.outgoing,live.sendHost) then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_play.ml#L264)
