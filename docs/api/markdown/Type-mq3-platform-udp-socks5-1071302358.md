# `mq3.platform.udp.Socks5`

[Home](README.md) · [Source file](File-src-mq3-platform-udp-ml-646757928.md)

<a id="struct-struct-mq3-platform-udp-socks5-struct-socks5-src-mq3-platform-udp-ml-1167130715"></a>
## Socks5

```ml
struct Socks5
```

Data record for `mq3.platform.udp.Socks5`; groups `control`, `relay`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/udp.ml#L104)

## Members

<a id="field-field-mq3-platform-udp-socks5-control-control-src-mq3-platform-udp-ml-487451437"></a>
### control

```ml
control
```

TCP control connection that owns the SOCKS5 UDP association.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/udp.ml#L106)

<a id="field-field-mq3-platform-udp-socks5-relay-relay-src-mq3-platform-udp-ml-56104421"></a>
### relay

```ml
relay
```

UDP relay endpoint returned by the SOCKS5 handshake.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/udp.ml#L108)
