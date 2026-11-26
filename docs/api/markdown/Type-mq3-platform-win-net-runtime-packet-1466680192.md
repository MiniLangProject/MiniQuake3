# `mq3.platform.win_net_runtime.Packet`

[Home](README.md) · [Source file](File-src-mq3-platform-win-net-runtime-ml-376751270.md)

<a id="struct-struct-mq3-platform-win-net-runtime-packet-struct-packet-src-mq3-platform-win-net-runtime-ml-1944822035"></a>
## Packet

```ml
struct Packet
```

Data record for `mq3.platform.win_net_runtime.Packet`; groups `received`, `source`, `data`, `readcount`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L91)

## Members

<a id="field-field-mq3-platform-win-net-runtime-packet-data-data-src-mq3-platform-win-net-runtime-ml-64278505"></a>
### data

```ml
data
```

Payload bytes of the received network packet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L97)

<a id="field-field-mq3-platform-win-net-runtime-packet-readcount-readcount-src-mq3-platform-win-net-runtime-ml-1170798705"></a>
### readcount

```ml
readcount
```

Read cursor into the received packet payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L99)

<a id="field-field-mq3-platform-win-net-runtime-packet-received-received-src-mq3-platform-win-net-runtime-ml-965553739"></a>
### received

```ml
received
```

Whether a datagram was successfully received.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L93)

<a id="field-field-mq3-platform-win-net-runtime-packet-source-source-src-mq3-platform-win-net-runtime-ml-2126006335"></a>
### source

```ml
source
```

Network address from which the packet was received.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L95)
