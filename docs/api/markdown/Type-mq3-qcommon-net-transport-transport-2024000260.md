# `mq3.qcommon.net_transport.Transport`

[Home](README.md) · [Source file](File-src-mq3-qcommon-net-transport-ml-1557933377.md)

<a id="struct-struct-mq3-qcommon-net-transport-transport-struct-transport-src-mq3-qcommon-net-transport-ml-883695801"></a>
## Transport

```ml
struct Transport
```

Transport record for qcommon.net_transport, containing `socket`, `loopbacks`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L51)

## Members

<a id="field-field-mq3-qcommon-net-transport-transport-loopbacks-loopbacks-src-mq3-qcommon-net-transport-ml-444717928"></a>
### loopbacks

```ml
loopbacks
```

In-process queues used when the destination is a loopback address.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L55)

<a id="field-field-mq3-qcommon-net-transport-transport-socket-socket-src-mq3-qcommon-net-transport-ml-153507994"></a>
### socket

```ml
socket
```

Host UDP socket used for datagram transport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L53)
