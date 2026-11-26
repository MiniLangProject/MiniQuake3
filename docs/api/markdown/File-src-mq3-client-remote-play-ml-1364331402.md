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
- `std/string.ml` as `remoteStrings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-remote-play-acceptpacket-function-acceptpacket-live-packet-now-src-mq3-client-remote-play-ml-332987908"></a>
### acceptPacket

```ml
function acceptPacket(live, packet, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |
| `packet` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L225)

<a id="function-function-mq3-client-remote-play-appendcommand-function-appendcommand-live-command-src-mq3-client-remote-play-ml-2097436221"></a>
### appendCommand

```ml
function appendCommand(live, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L146)

<a id="function-function-mq3-client-remote-play-approvedarchive-function-approvedarchive-live-src-mq3-client-remote-play-ml-1021690626"></a>
### approvedArchive

```ml
function approvedArchive(live)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L117)

<a id="function-function-mq3-client-remote-play-checkservercommands-function-checkservercommands-live-src-mq3-client-remote-play-ml-198608966"></a>
### checkServerCommands

```ml
function checkServerCommands(live)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L198)

<a id="function-function-mq3-client-remote-play-close-function-close-live-now-src-mq3-client-remote-play-ml-1816778960"></a>
### close

```ml
function close(live, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L302)

<a id="function-function-mq3-client-remote-play-closesocket-function-closesocket-socket-src-mq3-client-remote-play-ml-995307255"></a>
### closeSocket

```ml
function closeSocket(socket)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L71)

<a id="constant-constant-mq3-client-remote-play-connect-timeout-ms-const-connect-timeout-ms-12000-src-mq3-client-remote-play-ml-1043205220"></a>
### CONNECT_TIMEOUT_MS

```ml
const CONNECT_TIMEOUT_MS = 12000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L23)

- [mq3.client.remote_play.ConnectionHost](Type-mq3-client-remote-play-connectionhost-1726380738.md) — struct
<a id="function-function-mq3-client-remote-play-create-function-create-serveraddress-userinfo-now-src-mq3-client-remote-play-ml-592338632"></a>
### create

```ml
function create(serverAddress, userinfo, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverAddress` | `dynamic` | — |  |
| `userinfo` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L76)

<a id="constant-constant-mq3-client-remote-play-cs-serverinfo-const-cs-serverinfo-0-src-mq3-client-remote-play-ml-670671105"></a>
### CS_SERVERINFO

```ml
const CS_SERVERINFO = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L20)

<a id="constant-constant-mq3-client-remote-play-cs-systeminfo-const-cs-systeminfo-1-src-mq3-client-remote-play-ml-1885161058"></a>
### CS_SYSTEMINFO

```ml
const CS_SYSTEMINFO = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L21)

<a id="function-function-mq3-client-remote-play-entergamestate-function-entergamestate-live-now-src-mq3-client-remote-play-ml-1820433300"></a>
### enterGamestate

```ml
function enterGamestate(live, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L162)

<a id="function-function-mq3-client-remote-play-gamedirectory-function-gamedirectory-live-src-mq3-client-remote-play-ml-1827128082"></a>
### gameDirectory

```ml
function gameDirectory(live)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L116)

- [mq3.client.remote_play.Live](Type-mq3-client-remote-play-live-330645626.md) — struct
<a id="function-function-mq3-client-remote-play-mapname-function-mapname-live-src-mq3-client-remote-play-ml-1070061570"></a>
### mapName

```ml
function mapName(live)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L115)

<a id="function-function-mq3-client-remote-play-parseendpoint-function-parseendpoint-address-src-mq3-client-remote-play-ml-776130406"></a>
### parseEndpoint

```ml
function parseEndpoint(address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L34)

<a id="function-function-mq3-client-remote-play-primed-function-primed-live-src-mq3-client-remote-play-ml-1893259632"></a>
### primed

```ml
function primed(live)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L111)

<a id="function-function-mq3-client-remote-play-pump-function-pump-live-now-budget-src-mq3-client-remote-play-ml-651900507"></a>
### pump

```ml
function pump(live, now, budget)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `budget` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L248)

<a id="function-function-mq3-client-remote-play-queuereliable-function-queuereliable-live-text-src-mq3-client-remote-play-ml-1311593251"></a>
### queueReliable

```ml
function queueReliable(live, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L273)

<a id="function-function-mq3-client-remote-play-readuserinfo-function-readuserinfo-host-state-src-mq3-client-remote-play-ml-66635275"></a>
### readUserinfo

```ml
function readUserinfo(host, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L69)

<a id="function-function-mq3-client-remote-play-sendoob-function-sendoob-host-state-address-text-src-mq3-client-remote-play-ml-1155473068"></a>
### sendOob

```ml
function sendOob(host, state, address, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L61)

<a id="function-function-mq3-client-remote-play-sendoobdata-function-sendoobdata-host-state-address-data-src-mq3-client-remote-play-ml-597328209"></a>
### sendOobData

```ml
function sendOobData(host, state, address, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L65)

<a id="constant-constant-mq3-client-remote-play-server-timeout-ms-const-server-timeout-ms-30000-src-mq3-client-remote-play-ml-1093972604"></a>
### SERVER_TIMEOUT_MS

```ml
const SERVER_TIMEOUT_MS = 30000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L24)

- [mq3.client.remote_play.ServerEndpoint](Type-mq3-client-remote-play-serverendpoint-997725670.md) — struct
<a id="function-function-mq3-client-remote-play-setbasepackages-function-setbasepackages-live-basedirectory-src-mq3-client-remote-play-ml-2052180312"></a>
### setBasePackages

```ml
function setBasePackages(live, baseDirectory)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |
| `baseDirectory` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L118)

<a id="constant-constant-mq3-client-remote-play-snapflag-not-active-const-snapflag-not-active-2-src-mq3-client-remote-play-ml-1133634727"></a>
### SNAPFLAG_NOT_ACTIVE

```ml
const SNAPFLAG_NOT_ACTIVE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L22)

<a id="function-function-mq3-client-remote-play-status-function-status-live-src-mq3-client-remote-play-ml-1047095072"></a>
### status

```ml
function status(live)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L123)

<a id="function-function-mq3-client-remote-play-updatesendstate-function-updatesendstate-live-now-src-mq3-client-remote-play-ml-916121120"></a>
### updateSendState

```ml
function updateSendState(live, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L130)

<a id="function-function-mq3-client-remote-play-updateserversysteminfo-function-updateserversysteminfo-live-systeminfo-src-mq3-client-remote-play-ml-650668167"></a>
### updateServerSystemInfo

```ml
function updateServerSystemInfo(live, systemInfo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |
| `systemInfo` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L192)

<a id="function-function-mq3-client-remote-play-updateuserinfo-function-updateuserinfo-live-userinfo-src-mq3-client-remote-play-ml-1888079025"></a>
### updateUserinfo

```ml
function updateUserinfo(live, userinfo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |
| `userinfo` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L287)

<a id="function-function-mq3-client-remote-play-writeframe-function-writeframe-live-command-now-src-mq3-client-remote-play-ml-2079946341"></a>
### writeFrame

```ml
function writeFrame(live, command, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L296)

<a id="function-function-mq3-client-remote-play-writepacket-function-writepacket-live-now-force-src-mq3-client-remote-play-ml-1142715367"></a>
### writePacket

```ml
function writePacket(live, now, force)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `force` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/remote_play.ml#L153)
