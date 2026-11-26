# `mq3.client.network_ingress.Runtime`

[Home](README.md) · [Source file](File-src-mq3-client-network-ingress-ml-1289633455.md)

<a id="struct-struct-mq3-client-network-ingress-runtime-struct-runtime-src-mq3-client-network-ingress-ml-77892581"></a>
## Runtime

```ml
struct Runtime
```

Wiring between UDP datagrams, connection state, netchan reassembly, and the client protocol parser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L26)

## Members

<a id="field-field-mq3-client-network-ingress-runtime-codec-codec-src-mq3-client-network-ingress-ml-192555355"></a>
### codec

```ml
codec
```

Reused message codec, allocated on the first incoming datagram and retained for later receives.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L46)

<a id="field-field-mq3-client-network-ingress-runtime-connection-connection-src-mq3-client-network-ingress-ml-102806723"></a>
### connection

```ml
connection
```

Shared client connection and remote-channel state retained by the packet-event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L28)

<a id="field-field-mq3-client-network-ingress-runtime-lastpacketresult-lastpacketresult-src-mq3-client-network-ingress-ml-932467149"></a>
### lastPacketResult

```ml
lastPacketResult
```

Most recent packet-event disposition, such as `oob`, `sequenced`, or a rejection reason; initially empty.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L40)

<a id="field-field-mq3-client-network-ingress-runtime-lastparseresult-lastparseresult-src-mq3-client-network-ingress-ml-1409466843"></a>
### lastParseResult

```ml
lastParseResult
```

Most recent server-message parser result, or `void` before parsing any server payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L42)

<a id="field-field-mq3-client-network-ingress-runtime-netchanruntime-netchanruntime-src-mq3-client-network-ingress-ml-1887470229"></a>
### netchanRuntime

```ml
netchanRuntime
```

Client netchan runtime for sequenced-packet validation, reassembly, and payload decoding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L34)

<a id="field-field-mq3-client-network-ingress-runtime-packetcount-packetcount-src-mq3-client-network-ingress-ml-3203675"></a>
### packetCount

```ml
packetCount
```

Number of calls that completed packet-event dispatch, including ignored or rejected packets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L44)

<a id="field-field-mq3-client-network-ingress-runtime-packethost-packethost-src-mq3-client-network-ingress-ml-25903079"></a>
### packetHost

```ml
packetHost
```

Packet-event service bundle whose process, parse, and demo callbacks are bound to this runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L32)

<a id="field-field-mq3-client-network-ingress-runtime-packetstate-packetstate-src-mq3-client-network-ingress-ml-1840572947"></a>
### packetState

```ml
packetState
```

Packet-event state holding client time, received server sequence, and demo-recording flags.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L30)

<a id="field-field-mq3-client-network-ingress-runtime-protocol-protocol-src-mq3-client-network-ingress-ml-2029556043"></a>
### protocol

```ml
protocol
```

Parser runtime shared with packet ingestion; owns the server-message dispatcher, gamestate, and downloads.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L36)

<a id="field-field-mq3-client-network-ingress-runtime-services-services-src-mq3-client-network-ingress-ml-1118490523"></a>
### services

```ml
services
```

Service callbacks and context used to access the host engine from this client subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L38)
