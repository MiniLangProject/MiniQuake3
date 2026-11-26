# `mq3.platform.udp.Datagram`

[Home](README.md) · [Source file](File-src-mq3-platform-udp-ml-646757928.md)

<a id="struct-struct-mq3-platform-udp-datagram-struct-datagram-src-mq3-platform-udp-ml-1022623031"></a>
## Datagram

```ml
struct Datagram
```

Data record for `mq3.platform.udp.Datagram`; groups `received`, `endpoint`, `data`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L95)

## Members

<a id="field-field-mq3-platform-udp-datagram-data-data-src-mq3-platform-udp-ml-1454424714"></a>
### data

```ml
data
```

Payload bytes returned by the UDP receive operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L101)

<a id="field-field-mq3-platform-udp-datagram-endpoint-endpoint-src-mq3-platform-udp-ml-576944124"></a>
### endpoint

```ml
endpoint
```

Network endpoint from which the datagram was received.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L99)

<a id="field-field-mq3-platform-udp-datagram-received-received-src-mq3-platform-udp-ml-1201836832"></a>
### received

```ml
received
```

Whether a datagram was successfully received.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L97)
