# `mq3.qcommon.net_transport.LoopQueue`

[Home](README.md) · [Source file](File-src-mq3-qcommon-net-transport-ml-1557933377.md)

<a id="struct-struct-mq3-qcommon-net-transport-loopqueue-struct-loopqueue-src-mq3-qcommon-net-transport-ml-527163481"></a>
## LoopQueue

```ml
struct LoopQueue
```

LoopQueue record for qcommon.net_transport, containing `messages`, `get`, `send`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L37)

## Members

<a id="field-field-mq3-qcommon-net-transport-loopqueue-get-get-src-mq3-qcommon-net-transport-ml-1878605708"></a>
### get

```ml
get
```

Absolute sequence position of the next loopback datagram to receive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L41)

<a id="field-field-mq3-qcommon-net-transport-loopqueue-messages-messages-src-mq3-qcommon-net-transport-ml-1935649308"></a>
### messages

```ml
messages
```

Ring-buffer slots containing queued loopback datagrams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L39)

<a id="field-field-mq3-qcommon-net-transport-loopqueue-send-send-src-mq3-qcommon-net-transport-ml-515647080"></a>
### send

```ml
send
```

Absolute sequence position assigned to the next loopback datagram.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L43)
