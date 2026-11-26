# `mq3.server.network_ingress.Runtime`

[Home](README.md) · [Source file](File-src-mq3-server-network-ingress-ml-1810419035.md)

<a id="struct-struct-mq3-server-network-ingress-runtime-struct-runtime-src-mq3-server-network-ingress-ml-1476281917"></a>
## Runtime

```ml
struct Runtime
```

Runtime record for server.network_ingress, containing `server`, `bindings`, `services`, `packetState`, `packetHost`, `messageHost`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/network_ingress.ml#L48)

## Members

<a id="field-field-mq3-server-network-ingress-runtime-bindings-bindings-src-mq3-server-network-ingress-ml-246307947"></a>
### bindings

```ml
bindings
```

Associations between packet-channel clients and message-decoder clients.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/network_ingress.ml#L52)

<a id="field-field-mq3-server-network-ingress-runtime-lastclientresult-lastclientresult-src-mq3-server-network-ingress-ml-2031613011"></a>
### lastClientResult

```ml
lastClientResult
```

Most recent client-message decoding result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/network_ingress.ml#L64)

<a id="field-field-mq3-server-network-ingress-runtime-lastpacketresult-lastpacketresult-src-mq3-server-network-ingress-ml-1839078053"></a>
### lastPacketResult

```ml
lastPacketResult
```

Most recent packet-validation and dispatch result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/network_ingress.ml#L62)

<a id="field-field-mq3-server-network-ingress-runtime-messagehost-messagehost-src-mq3-server-network-ingress-ml-833501267"></a>
### messageHost

```ml
messageHost
```

Host callbacks used by the client-message decoder.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/network_ingress.ml#L60)

<a id="field-field-mq3-server-network-ingress-runtime-packetcount-packetcount-src-mq3-server-network-ingress-ml-2047466339"></a>
### packetCount

```ml
packetCount
```

Number of packet recorded by this state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/network_ingress.ml#L66)

<a id="field-field-mq3-server-network-ingress-runtime-packethost-packethost-src-mq3-server-network-ingress-ml-2008921655"></a>
### packetHost

```ml
packetHost
```

Host callbacks used by the packet event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/network_ingress.ml#L58)

<a id="field-field-mq3-server-network-ingress-runtime-packetstate-packetstate-src-mq3-server-network-ingress-ml-182342923"></a>
### packetState

```ml
packetState
```

State used to validate packet sequence and fragment headers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/network_ingress.ml#L56)

<a id="field-field-mq3-server-network-ingress-runtime-server-server-src-mq3-server-network-ingress-ml-217926769"></a>
### server

```ml
server
```

Server runtime receiving the incoming datagrams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/network_ingress.ml#L50)

<a id="field-field-mq3-server-network-ingress-runtime-services-services-src-mq3-server-network-ingress-ml-1924617859"></a>
### services

```ml
services
```

Host entry points used to route packets into connectionless and sequenced client handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/network_ingress.ml#L54)
