# `mq3.qcommon.net_transport.Packet`

[Home](README.md) · [Source file](File-src-mq3-qcommon-net-transport-ml-1557933377.md)

<a id="struct-struct-mq3-qcommon-net-transport-packet-struct-packet-src-mq3-qcommon-net-transport-ml-870280065"></a>
## Packet

```ml
struct Packet
```

Packet record for qcommon.net_transport, containing `received`, `address`, `data`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L58)

## Members

<a id="field-field-mq3-qcommon-net-transport-packet-address-address-src-mq3-qcommon-net-transport-ml-367345149"></a>
### address

```ml
address
```

Network address associated with the client or packet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L62)

<a id="field-field-mq3-qcommon-net-transport-packet-data-data-src-mq3-qcommon-net-transport-ml-2102400057"></a>
### data

```ml
data
```

Datagram bytes returned by the transport receive operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L64)

<a id="field-field-mq3-qcommon-net-transport-packet-received-received-src-mq3-qcommon-net-transport-ml-1228096659"></a>
### received

```ml
received
```

True when a valid datagram was obtained from the transport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L60)
