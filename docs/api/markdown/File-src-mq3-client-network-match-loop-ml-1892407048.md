# `src/mq3/client/network_match_loop.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.network_match_loop`](Package-mq3-client-network-match-loop-2101368174.md)

Reachable from entry: **no**

## Imports

- `mq3/client/network_ingress.ml` as `clientIngress` → [src/mq3/client/network_ingress.ml](File-src-mq3-client-network-ingress-ml-1289633455.md)
- `mq3/client/send_cmd.ml` as `clientSend` → [src/mq3/client/send_cmd.ml](File-src-mq3-client-send-cmd-ml-1342588170.md)
- `mq3/client/snapshot_command.ml` as `clientSnapshot` → [src/mq3/client/snapshot_command.ml](File-src-mq3-client-snapshot-command-ml-285373799.md)
- `mq3/qcommon/network_pump.ml` as `packetPump` → [src/mq3/qcommon/network_pump.ml](File-src-mq3-qcommon-network-pump-ml-493477247.md)
- `mq3/server/netchan.ml` as `serverNetchan` → [src/mq3/server/netchan.ml](File-src-mq3-server-netchan-ml-1084677692.md)
- `mq3/server/network_ingress.ml` as `serverIngress` → [src/mq3/server/network_ingress.ml](File-src-mq3-server-network-ingress-ml-1810419035.md)
- `mq3/server/snapshot_send.ml` as `snapshotSend` → [src/mq3/server/snapshot_send.ml](File-src-mq3-server-snapshot-send-ml-704467576.md)

## Declarations

<a id="function-function-mq3-client-network-match-loop-attachframestates-function-attachframestates-runtimestate-clientframestate-servertimeoutclient-src-mq3-client-network-match-loop-ml-521548925"></a>
### attachFrameStates

```ml
function attachFrameStates(runtimeState, clientFrameState, serverTimeoutClient)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — |  |
| `clientFrameState` | `dynamic` | — |  |
| `serverTimeoutClient` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L87)

<a id="function-function-mq3-client-network-match-loop-attachserverclock-function-attachserverclock-runtimestate-callback-context-src-mq3-client-network-match-loop-ml-1973540901"></a>
### attachServerClock

```ml
function attachServerClock(runtimeState, callback, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L94)

<a id="function-function-mq3-client-network-match-loop-bridgebuild-function-bridgebuild-host-clientstate-serverstate-src-mq3-client-network-match-loop-ml-32995176"></a>
### bridgeBuild

```ml
function bridgeBuild(host, clientState, serverState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `serverState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L184)

<a id="function-function-mq3-client-network-match-loop-bridgedownload-function-bridgedownload-host-clientstate-msg-src-mq3-client-network-match-loop-ml-1393347675"></a>
### bridgeDownload

```ml
function bridgeDownload(host, clientState, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L187)

<a id="function-function-mq3-client-network-match-loop-bridgelan-function-bridgelan-host-clientstate-src-mq3-client-network-match-loop-ml-896968326"></a>
### bridgeLan

```ml
function bridgeLan(host, clientState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L193)

<a id="function-function-mq3-client-network-match-loop-bridgelocal-function-bridgelocal-host-clientstate-src-mq3-client-network-match-loop-ml-1718363122"></a>
### bridgeLocal

```ml
function bridgeLocal(host, clientState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L190)

<a id="function-function-mq3-client-network-match-loop-bridgetransmit-function-bridgetransmit-host-clientstate-payload-src-mq3-client-network-match-loop-ml-364620524"></a>
### bridgeTransmit

```ml
function bridgeTransmit(host, clientState, payload)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `payload` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L196)

<a id="function-function-mq3-client-network-match-loop-commitframestates-function-commitframestates-runtimestate-src-mq3-client-network-match-loop-ml-1479390013"></a>
### commitFrameStates

```ml
function commitFrameStates(runtimeState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L76)

<a id="function-function-mq3-client-network-match-loop-commitgroupframestates-function-commitgroupframestates-groupstate-src-mq3-client-network-match-loop-ml-768419824"></a>
### commitGroupFrameStates

```ml
function commitGroupFrameStates(groupState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `groupState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L150)

<a id="function-function-mq3-client-network-match-loop-create-function-create-clientsocket-serversocket-capacity-sendstate-sendservices-connection-clientwire-protocolstate-clientingressstate-serveringressstate-packetclient-messageclient-snapshotclient-snapshotstate-serverwireruntime-serverwireclient-src-mq3-client-network-match-loop-ml-325529470"></a>
### create

```ml
function create(clientSocket, serverSocket, capacity, sendState, sendServices, connection, clientWire, protocolState, clientIngressState, serverIngressState, packetClient, messageClient, snapshotClient, snapshotState, serverWireRuntime, serverWireClient)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientSocket` | `dynamic` | — |  |
| `serverSocket` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |
| `sendState` | `dynamic` | — |  |
| `sendServices` | `dynamic` | — |  |
| `connection` | `dynamic` | — |  |
| `clientWire` | `dynamic` | — |  |
| `protocolState` | `dynamic` | — |  |
| `clientIngressState` | `dynamic` | — |  |
| `serverIngressState` | `dynamic` | — |  |
| `packetClient` | `dynamic` | — |  |
| `messageClient` | `dynamic` | — |  |
| `snapshotClient` | `dynamic` | — |  |
| `snapshotState` | `dynamic` | — |  |
| `serverWireRuntime` | `dynamic` | — |  |
| `serverWireClient` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L26)

<a id="function-function-mq3-client-network-match-loop-creategroup-function-creategroup-runtimes-src-mq3-client-network-match-loop-ml-145175471"></a>
### createGroup

```ml
function createGroup(runtimes)
```

A local listen server owns one UDP socket while every client owns a separate socket and netchan. Group pumping round-robins the client runtimes, but any member may consume the shared server socket: server ingress selects the real client by base address/qport, then every mirror is synchronized.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L129)

- [mq3.client.network_match_loop.Group](Type-mq3-client-network-match-loop-group-1745111491.md) — struct
- [mq3.client.network_match_loop.GroupStep](Type-mq3-client-network-match-loop-groupstep-1141879649.md) — struct
<a id="function-function-mq3-client-network-match-loop-prepareframestates-function-prepareframestates-runtimestate-src-mq3-client-network-match-loop-ml-39318885"></a>
### prepareFrameStates

```ml
function prepareFrameStates(runtimeState)
```

CL_Frame and SV_Frame keep timeout state in their outer client records while packet ingress owns the authoritative last-packet clocks. These explicit boundaries prevent a long-running network loop from timing out an active client merely because the frame model was a detached projection.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L63)

<a id="function-function-mq3-client-network-match-loop-pump-function-pump-runtimestate-budget-src-mq3-client-network-match-loop-ml-1862212080"></a>
### pump

```ml
function pump(runtimeState, budget)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — |  |
| `budget` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L111)

<a id="function-function-mq3-client-network-match-loop-pumpgroup-function-pumpgroup-groupstate-budget-src-mq3-client-network-match-loop-ml-313899311"></a>
### pumpGroup

```ml
function pumpGroup(groupState, budget)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `groupState` | `dynamic` | — |  |
| `budget` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L166)

<a id="function-function-mq3-client-network-match-loop-pumpgrouponce-function-pumpgrouponce-groupstate-src-mq3-client-network-match-loop-ml-262934152"></a>
### pumpGroupOnce

```ml
function pumpGroupOnce(groupState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `groupState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L155)

<a id="function-function-mq3-client-network-match-loop-pumponce-function-pumponce-runtimestate-src-mq3-client-network-match-loop-ml-1990887729"></a>
### pumpOnce

```ml
function pumpOnce(runtimeState)
```

Process exactly one queued datagram and expose its side/payload metadata. Frame hosts use this form when they need a strict packet budget while still keeping the client/server mirrors coherent after every accepted or rejected netchan packet.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L120)

<a id="function-function-mq3-client-network-match-loop-receiveclient-function-receiveclient-runtimestate-address-data-src-mq3-client-network-match-loop-ml-701614623"></a>
### receiveClient

```ml
function receiveClient(runtimeState, address, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L23)

<a id="function-function-mq3-client-network-match-loop-receiveserver-function-receiveserver-runtimestate-address-data-src-mq3-client-network-match-loop-ml-1373635087"></a>
### receiveServer

```ml
function receiveServer(runtimeState, address, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L24)

- [mq3.client.network_match_loop.Runtime](Type-mq3-client-network-match-loop-runtime-1877533652.md) — struct
<a id="function-function-mq3-client-network-match-loop-sendclientframe-function-sendclientframe-runtimestate-frametime-src-mq3-client-network-match-loop-ml-1004134675"></a>
### sendClientFrame

```ml
function sendClientFrame(runtimeState, frameTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — |  |
| `frameTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L106)

<a id="function-function-mq3-client-network-match-loop-sendserversnapshot-function-sendserversnapshot-runtimestate-delegate-src-mq3-client-network-match-loop-ml-814602818"></a>
### sendServerSnapshot

```ml
function sendServerSnapshot(runtimeState, delegate)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — |  |
| `delegate` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L204)

<a id="function-function-mq3-client-network-match-loop-setgrouptime-function-setgrouptime-groupstate-time-src-mq3-client-network-match-loop-ml-1064230377"></a>
### setGroupTime

```ml
function setGroupTime(groupState, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `groupState` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L173)

<a id="function-function-mq3-client-network-match-loop-settime-function-settime-runtimestate-time-src-mq3-client-network-match-loop-ml-918315338"></a>
### setTime

```ml
function setTime(runtimeState, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L99)

- [mq3.client.network_match_loop.SnapshotBridge](Type-mq3-client-network-match-loop-snapshotbridge-279736737.md) — struct
<a id="function-function-mq3-client-network-match-loop-snapshotservices-function-snapshotservices-runtimestate-delegate-src-mq3-client-network-match-loop-ml-105779146"></a>
### snapshotServices

```ml
function snapshotServices(runtimeState, delegate)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — |  |
| `delegate` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L200)

<a id="function-function-mq3-client-network-match-loop-synchronize-function-synchronize-runtimestate-src-mq3-client-network-match-loop-ml-613438293"></a>
### synchronize

```ml
function synchronize(runtimeState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L92)

<a id="function-function-mq3-client-network-match-loop-synchronizeclient-function-synchronizeclient-runtimestate-src-mq3-client-network-match-loop-ml-625357107"></a>
### synchronizeClient

```ml
function synchronizeClient(runtimeState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L32)

<a id="function-function-mq3-client-network-match-loop-synchronizegroup-function-synchronizegroup-groupstate-src-mq3-client-network-match-loop-ml-1788081660"></a>
### synchronizeGroup

```ml
function synchronizeGroup(groupState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `groupState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L145)

<a id="function-function-mq3-client-network-match-loop-synchronizeserver-function-synchronizeserver-runtimestate-src-mq3-client-network-match-loop-ml-123517611"></a>
### synchronizeServer

```ml
function synchronizeServer(runtimeState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_match_loop.ml#L48)
