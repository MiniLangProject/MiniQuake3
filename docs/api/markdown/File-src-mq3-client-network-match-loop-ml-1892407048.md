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

Updates `runtimeState.clientFrameState`, `runtimeState.serverTimeoutClient` during network match loop `attachFrameStates`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — | Mutable network match loop record/storage; this routine assigns `runtimeState.clientFrameState`, `runtimeState.serverTimeoutClient`. |
| `clientFrameState` | `dynamic` | — | Value assigned to `runtimeState.clientFrameState`. |
| `serverTimeoutClient` | `dynamic` | — | Value assigned to `runtimeState.serverTimeoutClient`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L127)

<a id="function-function-mq3-client-network-match-loop-attachserverclock-function-attachserverclock-runtimestate-callback-context-src-mq3-client-network-match-loop-ml-1973540901"></a>
### attachServerClock

```ml
function attachServerClock(runtimeState, callback, context)
```

Updates `runtimeState.serverTimeFn`, `runtimeState.serverTimeContext` during network match loop `attachServerClock`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — | Mutable network match loop record/storage; this routine assigns `runtimeState.serverTimeFn`, `runtimeState.serverTimeContext`. |
| `callback` | `dynamic` | — | Value assigned to `runtimeState.serverTimeFn`. |
| `context` | `dynamic` | — | Value assigned to `runtimeState.serverTimeContext`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L140)

<a id="function-function-mq3-client-network-match-loop-bridgebuild-function-bridgebuild-host-clientstate-serverstate-src-mq3-client-network-match-loop-ml-32995176"></a>
### bridgeBuild

```ml
function bridgeBuild(host, clientState, serverState)
```

Calls `delegate.buildSnapshotFn` from network match loop `bridgeBuild`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.context.delegate`. |
| `clientState` | `dynamic` | — | Value used by `if delegate!=void and delegate.buildSnapshotFn!=void then return delegate.buildSnapshotFn(delegate,clientState,serverState) end if`. |
| `serverState` | `dynamic` | — | Value used by `if delegate!=void and delegate.buildSnapshotFn!=void then return delegate.buildSnapshotFn(delegate,clientState,serverState) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L257)

<a id="function-function-mq3-client-network-match-loop-bridgedownload-function-bridgedownload-host-clientstate-msg-src-mq3-client-network-match-loop-ml-1393347675"></a>
### bridgeDownload

```ml
function bridgeDownload(host, clientState, msg)
```

Calls `delegate.writeDownloadFn` from network match loop `bridgeDownload`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.context.delegate`. |
| `clientState` | `dynamic` | — | Value used by `if delegate!=void and delegate.writeDownloadFn!=void then return delegate.writeDownloadFn(delegate,clientState,msg) end if`. |
| `msg` | `dynamic` | — | Value used by `if delegate!=void and delegate.writeDownloadFn!=void then return delegate.writeDownloadFn(delegate,clientState,msg) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L264)

<a id="function-function-mq3-client-network-match-loop-bridgelan-function-bridgelan-host-clientstate-src-mq3-client-network-match-loop-ml-896968326"></a>
### bridgeLan

```ml
function bridgeLan(host, clientState)
```

Calls `delegate.lanAddressFn` from network match loop `bridgeLan`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.context.delegate`. |
| `clientState` | `dynamic` | — | Value used by `if delegate!=void and delegate.lanAddressFn!=void then return delegate.lanAddressFn(delegate,clientState) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L276)

<a id="function-function-mq3-client-network-match-loop-bridgelocal-function-bridgelocal-host-clientstate-src-mq3-client-network-match-loop-ml-1718363122"></a>
### bridgeLocal

```ml
function bridgeLocal(host, clientState)
```

Calls `delegate.localAddressFn` from network match loop `bridgeLocal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.context.delegate`. |
| `clientState` | `dynamic` | — | Value used by `if delegate!=void and delegate.localAddressFn!=void then return delegate.localAddressFn(delegate,clientState) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L270)

<a id="function-function-mq3-client-network-match-loop-bridgetransmit-function-bridgetransmit-host-clientstate-payload-src-mq3-client-network-match-loop-ml-364620524"></a>
### bridgeTransmit

```ml
function bridgeTransmit(host, clientState, payload)
```

Updates `clientState.outgoingSequence` during network match loop `bridgeTransmit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.context.runtimeState`. |
| `clientState` | `dynamic` | — | Mutable network match loop record/storage; this routine assigns `clientState.outgoingSequence`. |
| `payload` | `dynamic` | — | Value used by `result=serverNetchan.transmitPayload(runtimeState.serverWireRuntime,runtimeState.serverWireClient,payload)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L283)

<a id="function-function-mq3-client-network-match-loop-commitframestates-function-commitframestates-runtimestate-src-mq3-client-network-match-loop-ml-1479390013"></a>
### commitFrameStates

```ml
function commitFrameStates(runtimeState)
```

Updates `runtimeState.clientConnection.connectionState`, `runtimeState.clientSendState.connectionState`, `runtimeState.serverPacketClient.state`, `runtimeState.serverMessageClient.state` and additional values during network match loop `commitFrameStates`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — | Mutable network match loop record/storage; this routine assigns `runtimeState.clientConnection.connectionState`, `runtimeState.clientSendState.connectionState`, `runtimeState.serverPacketClient.state`, `runtimeState.serverMessageClient.state` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L112)

<a id="function-function-mq3-client-network-match-loop-commitgroupframestates-function-commitgroupframestates-groupstate-src-mq3-client-network-match-loop-ml-768419824"></a>
### commitGroupFrameStates

```ml
function commitGroupFrameStates(groupState)
```

Calls `mq3.client.network_match_loop.commitFrameStates` from network match loop `commitGroupFrameStates`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `groupState` | `dynamic` | — | Record read through `groupState.runtimes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L211)

<a id="function-function-mq3-client-network-match-loop-create-function-create-clientsocket-serversocket-capacity-sendstate-sendservices-connection-clientwire-protocolstate-clientingressstate-serveringressstate-packetclient-messageclient-snapshotclient-snapshotstate-serverwireruntime-serverwireclient-src-mq3-client-network-match-loop-ml-325529470"></a>
### create

```ml
function create(clientSocket, serverSocket, capacity, sendState, sendServices, connection, clientWire, protocolState, clientIngressState, serverIngressState, packetClient, messageClient, snapshotClient, snapshotState, serverWireRuntime, serverWireClient)
```

Calls `mq3.client.network_match_loop.Runtime`, `mq3.qcommon.network_pump.create`, `mq3.client.network_match_loop.synchronize` from network match loop `create`. The final path returns `runtimeState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientSocket` | `dynamic` | — | Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`. |
| `serverSocket` | `dynamic` | — | Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`. |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. |
| `sendState` | `dynamic` | — | Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`. |
| `sendServices` | `dynamic` | — | Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`. |
| `connection` | `dynamic` | — | Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`. |
| `clientWire` | `dynamic` | — | Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`. |
| `protocolState` | `dynamic` | — | Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`. |
| `clientIngressState` | `dynamic` | — | Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`. |
| `serverIngressState` | `dynamic` | — | Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`. |
| `packetClient` | `dynamic` | — | Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`. |
| `messageClient` | `dynamic` | — | Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`. |
| `snapshotClient` | `dynamic` | — | Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`. |
| `snapshotState` | `dynamic` | — | Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`. |
| `serverWireRuntime` | `dynamic` | — | Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`. |
| `serverWireClient` | `dynamic` | — | Value used by `if clientSocket==void or serverSocket==void or capacity<1 or sendState==void or sendServices==void or connection==void or clientWire==void or...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L55)

<a id="function-function-mq3-client-network-match-loop-creategroup-function-creategroup-runtimes-src-mq3-client-network-match-loop-ml-145175471"></a>
### createGroup

```ml
function createGroup(runtimes)
```

A local listen server owns one UDP socket while every client owns a separate socket and netchan. Group pumping round-robins the client runtimes, but any member may consume the shared server socket: server ingress selects the real client by base address/qport, then every mirror is synchronized.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimes` | `dynamic` | — | Sequence read at `runtimes[0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L186)

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
| `runtimeState` | `dynamic` | — | Mutable network match loop record/storage; this routine assigns `runtimeState.clientFrameState.state`, `runtimeState.clientFrameState.realtime`, `runtimeState.clientFrameState.lastPacketTime`, `runtimeState.serverTimeoutClient.state` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L97)

<a id="function-function-mq3-client-network-match-loop-pump-function-pump-runtimestate-budget-src-mq3-client-network-match-loop-ml-1862212080"></a>
### pump

```ml
function pump(runtimeState, budget)
```

Calls `mq3.qcommon.network_pump.drain`, `mq3.client.network_match_loop.synchronize` from network match loop `pump`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — | Record read through `runtimeState.pump`. |
| `budget` | `dynamic` | — | Value used by `if runtimeState==void or budget<0 then return error(7712,"network match loop: invalid pump") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L166)

<a id="function-function-mq3-client-network-match-loop-pumpgroup-function-pumpgroup-groupstate-budget-src-mq3-client-network-match-loop-ml-313899311"></a>
### pumpGroup

```ml
function pumpGroup(groupState, budget)
```

Calls `mq3.client.network_match_loop.pumpGroupOnce` from network match loop `pumpGroup`. The final path returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `groupState` | `dynamic` | — | Value used by `if groupState==void or budget<0 then return error(7712,"network match group: invalid pump") end if`. |
| `budget` | `dynamic` | — | Value used by `if groupState==void or budget<0 then return error(7712,"network match group: invalid pump") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L232)

<a id="function-function-mq3-client-network-match-loop-pumpgrouponce-function-pumpgrouponce-groupstate-src-mq3-client-network-match-loop-ml-262934152"></a>
### pumpGroupOnce

```ml
function pumpGroupOnce(groupState)
```

Updates `groupState.nextRuntime` during network match loop `pumpGroupOnce`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `groupState` | `dynamic` | — | Mutable network match loop record/storage; this routine assigns `groupState.nextRuntime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L218)

<a id="function-function-mq3-client-network-match-loop-pumponce-function-pumponce-runtimestate-src-mq3-client-network-match-loop-ml-1990887729"></a>
### pumpOnce

```ml
function pumpOnce(runtimeState)
```

Process exactly one queued datagram and expose its side/payload metadata. Frame hosts use this form when they need a strict packet budget while still keeping the client/server mirrors coherent after every accepted or rejected netchan packet.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — | Record read through `runtimeState.pump`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L176)

<a id="function-function-mq3-client-network-match-loop-receiveclient-function-receiveclient-runtimestate-address-data-src-mq3-client-network-match-loop-ml-701614623"></a>
### receiveClient

```ml
function receiveClient(runtimeState, address, data)
```

Adapts `mq3.client.network_ingress.clientPacket` to network match loop `receiveClient`, returning its result for `runtimeState.clientIngressRuntime, address, data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — | Record read through `runtimeState.clientIngressRuntime`. |
| `address` | `dynamic` | — | Argument 2 of `mq3.client.network_ingress.clientPacket`. |
| `data` | `dynamic` | — | Argument 3 of `mq3.client.network_ingress.clientPacket`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L31)

<a id="function-function-mq3-client-network-match-loop-receiveserver-function-receiveserver-runtimestate-address-data-src-mq3-client-network-match-loop-ml-1373635087"></a>
### receiveServer

```ml
function receiveServer(runtimeState, address, data)
```

Adapts `mq3.server.network_ingress.serverPacket` to network match loop `receiveServer`, returning its result for `runtimeState.serverIngressRuntime, address, data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — | Record read through `runtimeState.serverIngressRuntime`. |
| `address` | `dynamic` | — | Argument 2 of `mq3.server.network_ingress.serverPacket`. |
| `data` | `dynamic` | — | Argument 3 of `mq3.server.network_ingress.serverPacket`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L36)

- [mq3.client.network_match_loop.Runtime](Type-mq3-client-network-match-loop-runtime-1877533652.md) — struct
<a id="function-function-mq3-client-network-match-loop-sendclientframe-function-sendclientframe-runtimestate-frametime-src-mq3-client-network-match-loop-ml-1004134675"></a>
### sendClientFrame

```ml
function sendClientFrame(runtimeState, frameTime)
```

Calls `mq3.client.network_match_loop.synchronizeClient`, `mq3.client.send_cmd.send` from network match loop `sendClientFrame`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — | Record read through `runtimeState.clientSendState`, `runtimeState.clientSendServices`. |
| `frameTime` | `dynamic` | — | Value used by `result=clientSend.send(runtimeState.clientSendState,frameTime,runtimeState.clientSendServices)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L158)

<a id="function-function-mq3-client-network-match-loop-sendserversnapshot-function-sendserversnapshot-runtimestate-delegate-src-mq3-client-network-match-loop-ml-814602818"></a>
### sendServerSnapshot

```ml
function sendServerSnapshot(runtimeState, delegate)
```

Calls `mq3.client.network_match_loop.synchronizeServer`, `mq3.server.snapshot_send.sendClientSnapshot`, `mq3.client.network_match_loop.snapshotServices` from network match loop `sendServerSnapshot`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — | Record read through `runtimeState.serverSnapshotClient`, `runtimeState.serverSnapshotState`. |
| `delegate` | `dynamic` | — | Value used by `result=snapshotSend.sendClientSnapshot(runtimeState.serverSnapshotClient,runtimeState.serverSnapshotState,snapshotServices(runtimeState,delega...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L297)

<a id="function-function-mq3-client-network-match-loop-setgrouptime-function-setgrouptime-groupstate-time-src-mq3-client-network-match-loop-ml-1064230377"></a>
### setGroupTime

```ml
function setGroupTime(groupState, time)
```

Calls `mq3.client.network_match_loop.setTime`, `mq3.client.network_ingress.setRealtime`, `mq3.client.network_match_loop.synchronizeGroup` from network match loop `setGroupTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `groupState` | `dynamic` | — | Record read through `groupState.runtimes`. |
| `time` | `dynamic` | — | Value assigned to `current.clientSendState.realtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L242)

<a id="function-function-mq3-client-network-match-loop-settime-function-settime-runtimestate-time-src-mq3-client-network-match-loop-ml-918315338"></a>
### setTime

```ml
function setTime(runtimeState, time)
```

Updates `runtimeState.serverSnapshotState.time`, `runtimeState.clientSendState.realtime` during network match loop `setTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — | Mutable network match loop record/storage; this routine assigns `runtimeState.serverSnapshotState.time`, `runtimeState.clientSendState.realtime`. |
| `time` | `dynamic` | — | Value assigned to `runtimeState.serverSnapshotState.time`, `runtimeState.clientSendState.realtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L148)

- [mq3.client.network_match_loop.SnapshotBridge](Type-mq3-client-network-match-loop-snapshotbridge-279736737.md) — struct
<a id="function-function-mq3-client-network-match-loop-snapshotservices-function-snapshotservices-runtimestate-delegate-src-mq3-client-network-match-loop-ml-105779146"></a>
### snapshotServices

```ml
function snapshotServices(runtimeState, delegate)
```

Adapts `mq3.server.snapshot_send.services` to network match loop `snapshotServices`, returning its result for `bridgeBuild, bridgeDownload, bridgeTransmit, bridgeLocal, bridgeLan, SnapshotBridge(runtimeState,delegate)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — | Argument 6 of `mq3.server.snapshot_send.services`; passed as `SnapshotBridge(runtimeState,delegate)`. |
| `delegate` | `dynamic` | — | Argument 6 of `mq3.server.snapshot_send.services`; passed as `SnapshotBridge(runtimeState,delegate)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L290)

<a id="function-function-mq3-client-network-match-loop-synchronize-function-synchronize-runtimestate-src-mq3-client-network-match-loop-ml-613438293"></a>
### synchronize

```ml
function synchronize(runtimeState)
```

Calls `mq3.client.network_match_loop.synchronizeClient`, `mq3.client.network_match_loop.synchronizeServer`, `mq3.client.network_match_loop.prepareFrameStates` from network match loop `synchronize`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — | Value used by `synchronizeClient(runtimeState)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L134)

<a id="function-function-mq3-client-network-match-loop-synchronizeclient-function-synchronizeclient-runtimestate-src-mq3-client-network-match-loop-ml-625357107"></a>
### synchronizeClient

```ml
function synchronizeClient(runtimeState)
```

Updates `runtimeState.clientWire.connection.reliableCommands`, `runtimeState.clientWire.connection.serverCommands` during network match loop `synchronizeClient`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — | Mutable network match loop record/storage; this routine assigns `runtimeState.clientWire.connection.reliableCommands`, `runtimeState.clientWire.connection.serverCommands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L63)

<a id="function-function-mq3-client-network-match-loop-synchronizegroup-function-synchronizegroup-groupstate-src-mq3-client-network-match-loop-ml-1788081660"></a>
### synchronizeGroup

```ml
function synchronizeGroup(groupState)
```

Calls `mq3.client.network_match_loop.synchronize` from network match loop `synchronizeGroup`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `groupState` | `dynamic` | — | Record read through `groupState.runtimes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L204)

<a id="function-function-mq3-client-network-match-loop-synchronizeserver-function-synchronizeserver-runtimestate-src-mq3-client-network-match-loop-ml-123517611"></a>
### synchronizeServer

```ml
function synchronizeServer(runtimeState)
```

Updates `runtimeState.serverWireClient.reliableCommands`, `runtimeState.serverWireClient.lastClientCommandString` during network match loop `synchronizeServer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtimeState` | `dynamic` | — | Mutable network match loop record/storage; this routine assigns `runtimeState.serverWireClient.reliableCommands`, `runtimeState.serverWireClient.lastClientCommandString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L81)
