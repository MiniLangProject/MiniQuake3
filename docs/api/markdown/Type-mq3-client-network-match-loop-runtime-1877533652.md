# `mq3.client.network_match_loop.Runtime`

[Home](README.md) · [Source file](File-src-mq3-client-network-match-loop-ml-1892407048.md)

<a id="struct-struct-mq3-client-network-match-loop-runtime-struct-runtime-src-mq3-client-network-match-loop-ml-2140571927"></a>
## Runtime

```ml
struct Runtime
```

Stores network match loop runtime wiring and state, including `clientSendState`, `clientSendServices`, `clientConnection`, `clientWire`, `clientProtocol`, `clientIngressRuntime` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L15)

## Members

<a id="field-field-mq3-client-network-match-loop-runtime-clientconnection-clientconnection-src-mq3-client-network-match-loop-ml-1366056215"></a>
### clientConnection

```ml
clientConnection
```

When constructing this record, `create` supplies `connection` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L21)

<a id="field-field-mq3-client-network-match-loop-runtime-clientframestate-clientframestate-src-mq3-client-network-match-loop-ml-1239659099"></a>
### clientFrameState

```ml
clientFrameState
```

Optional client-frame state synchronized with the current connection state before frame processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L49)

<a id="field-field-mq3-client-network-match-loop-runtime-clientingressruntime-clientingressruntime-src-mq3-client-network-match-loop-ml-119397265"></a>
### clientIngressRuntime

```ml
clientIngressRuntime
```

When constructing this record, `create` supplies `clientIngressState` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L27)

<a id="field-field-mq3-client-network-match-loop-runtime-clientprotocol-clientprotocol-src-mq3-client-network-match-loop-ml-84530967"></a>
### clientProtocol

```ml
clientProtocol
```

When constructing this record, `create` supplies `protocolState` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L25)

<a id="field-field-mq3-client-network-match-loop-runtime-clientsendservices-clientsendservices-src-mq3-client-network-match-loop-ml-1979614079"></a>
### clientSendServices

```ml
clientSendServices
```

When constructing this record, `create` supplies `sendServices` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L19)

<a id="field-field-mq3-client-network-match-loop-runtime-clientsendstate-clientsendstate-src-mq3-client-network-match-loop-ml-1761763153"></a>
### clientSendState

```ml
clientSendState
```

When constructing this record, `create` supplies `sendState` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L17)

<a id="field-field-mq3-client-network-match-loop-runtime-clientwire-clientwire-src-mq3-client-network-match-loop-ml-88731409"></a>
### clientWire

```ml
clientWire
```

When constructing this record, `create` supplies `clientWire` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L23)

<a id="field-field-mq3-client-network-match-loop-runtime-pump-pump-src-mq3-client-network-match-loop-ml-1384320017"></a>
### pump

```ml
pump
```

Packet-pump instance bound to the client and server sockets and drained by the combined network loop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L54)

<a id="field-field-mq3-client-network-match-loop-runtime-serveringressruntime-serveringressruntime-src-mq3-client-network-match-loop-ml-330408361"></a>
### serverIngressRuntime

```ml
serverIngressRuntime
```

When constructing this record, `create` supplies `serverIngressState` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L29)

<a id="field-field-mq3-client-network-match-loop-runtime-servermessageclient-servermessageclient-src-mq3-client-network-match-loop-ml-1026810309"></a>
### serverMessageClient

```ml
serverMessageClient
```

When constructing this record, `create` supplies `messageClient` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L33)

<a id="field-field-mq3-client-network-match-loop-runtime-serverpacketclient-serverpacketclient-src-mq3-client-network-match-loop-ml-1954324557"></a>
### serverPacketClient

```ml
serverPacketClient
```

When constructing this record, `create` supplies `packetClient` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L31)

<a id="field-field-mq3-client-network-match-loop-runtime-serversnapshotclient-serversnapshotclient-src-mq3-client-network-match-loop-ml-396567085"></a>
### serverSnapshotClient

```ml
serverSnapshotClient
```

When constructing this record, `create` supplies `snapshotClient` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L35)

<a id="field-field-mq3-client-network-match-loop-runtime-serversnapshotstate-serversnapshotstate-src-mq3-client-network-match-loop-ml-1448756469"></a>
### serverSnapshotState

```ml
serverSnapshotState
```

When constructing this record, `create` supplies `snapshotState` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L37)

<a id="field-field-mq3-client-network-match-loop-runtime-servertimecontext-servertimecontext-src-mq3-client-network-match-loop-ml-626819809"></a>
### serverTimeContext

```ml
serverTimeContext
```

Caller-supplied value passed unchanged to the callback that publishes updated server time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L46)

<a id="field-field-mq3-client-network-match-loop-runtime-servertimefn-servertimefn-src-mq3-client-network-match-loop-ml-499259681"></a>
### serverTimeFn

```ml
serverTimeFn
```

Host callback for the server time operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L44)

<a id="field-field-mq3-client-network-match-loop-runtime-servertimeoutclient-servertimeoutclient-src-mq3-client-network-match-loop-ml-598208717"></a>
### serverTimeoutClient

```ml
serverTimeoutClient
```

Optional server timeout record synchronized with the server-side packet client's connection state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L51)

<a id="field-field-mq3-client-network-match-loop-runtime-serverwireclient-serverwireclient-src-mq3-client-network-match-loop-ml-1886843703"></a>
### serverWireClient

```ml
serverWireClient
```

When constructing this record, `create` supplies `serverWireClient` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L41)

<a id="field-field-mq3-client-network-match-loop-runtime-serverwireruntime-serverwireruntime-src-mq3-client-network-match-loop-ml-20432825"></a>
### serverWireRuntime

```ml
serverWireRuntime
```

When constructing this record, `create` supplies `serverWireRuntime` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_match_loop.ml#L39)
