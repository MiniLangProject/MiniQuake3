# `mq3.qcommon.network_pump.Runtime`

[Home](README.md) · [Source file](File-src-mq3-qcommon-network-pump-ml-493477247.md)

<a id="struct-struct-mq3-qcommon-network-pump-runtime-struct-runtime-src-mq3-qcommon-network-pump-ml-906995003"></a>
## Runtime

```ml
struct Runtime
```

Nonblocking UDP pump with independent receive buffers and alternating client/server polling priority.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L12)

## Members

<a id="field-field-mq3-qcommon-network-pump-runtime-capacity-capacity-src-mq3-qcommon-network-pump-ml-476333205"></a>
### capacity

```ml
capacity
```

Receive-buffer capacity in bytes for each socket, from 1 through 65,535.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L18)

<a id="field-field-mq3-qcommon-network-pump-runtime-clientbuffer-clientbuffer-src-mq3-qcommon-network-pump-ml-316107607"></a>
### clientBuffer

```ml
clientBuffer
```

Reusable receive buffer for client-side datagrams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L31)

<a id="field-field-mq3-qcommon-network-pump-runtime-clientmetadata-clientmetadata-src-mq3-qcommon-network-pump-ml-1700826113"></a>
### clientMetadata

```ml
clientMetadata
```

Reusable address and length metadata for client receives.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L35)

<a id="field-field-mq3-qcommon-network-pump-runtime-clientpacketfn-clientpacketfn-src-mq3-qcommon-network-pump-ml-497272527"></a>
### clientPacketFn

```ml
clientPacketFn
```

Optional callback `(context, address, data)` for a received client-side datagram; returned errors are propagated by `receiveSide`, while other return values are ignored.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L26)

<a id="field-field-mq3-qcommon-network-pump-runtime-clientsocket-clientsocket-src-mq3-qcommon-network-pump-ml-552722585"></a>
### clientSocket

```ml
clientSocket
```

Host UDP socket assigned to the client network endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L14)

<a id="field-field-mq3-qcommon-network-pump-runtime-context-context-src-mq3-qcommon-network-pump-ml-1094328565"></a>
### context

```ml
context
```

Caller-supplied data associated with delivery of received packets to the client and server handlers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L23)

<a id="field-field-mq3-qcommon-network-pump-runtime-nextside-nextside-src-mq3-qcommon-network-pump-ml-1929075377"></a>
### nextSide

```ml
nextSide
```

Endpoint selected first by the next fair packet-pump iteration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L20)

<a id="field-field-mq3-qcommon-network-pump-runtime-serverbuffer-serverbuffer-src-mq3-qcommon-network-pump-ml-6477111"></a>
### serverBuffer

```ml
serverBuffer
```

Reusable receive buffer for server-side datagrams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L33)

<a id="field-field-mq3-qcommon-network-pump-runtime-servermetadata-servermetadata-src-mq3-qcommon-network-pump-ml-274173825"></a>
### serverMetadata

```ml
serverMetadata
```

Reusable address and length metadata for server receives.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L37)

<a id="field-field-mq3-qcommon-network-pump-runtime-serverpacketfn-serverpacketfn-src-mq3-qcommon-network-pump-ml-637602071"></a>
### serverPacketFn

```ml
serverPacketFn
```

Optional callback `(context, address, data)` for a received server-side datagram; returned errors are propagated by `receiveSide`, while other return values are ignored.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L29)

<a id="field-field-mq3-qcommon-network-pump-runtime-serversocket-serversocket-src-mq3-qcommon-network-pump-ml-970752577"></a>
### serverSocket

```ml
serverSocket
```

Host UDP socket assigned to the server network endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L16)
