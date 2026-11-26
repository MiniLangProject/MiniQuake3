# `mq3.qcommon.netchan.Address`

[Home](README.md) · [Source file](File-src-mq3-qcommon-netchan-ml-1381353623.md)

<a id="struct-struct-mq3-qcommon-netchan-address-struct-address-src-mq3-qcommon-netchan-ml-1117716647"></a>
## Address

```ml
struct Address
```

Address record for qcommon.netchan, containing `type`, `ip`, `port`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L26)

## Members

<a id="field-field-mq3-qcommon-netchan-address-ip-ip-src-mq3-qcommon-netchan-ml-694770249"></a>
### ip

```ml
ip
```

Address bytes identifying the remote IPv4 endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L30)

<a id="field-field-mq3-qcommon-netchan-address-port-port-src-mq3-qcommon-netchan-ml-1261334429"></a>
### port

```ml
port
```

Network port associated with the endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L32)

<a id="field-field-mq3-qcommon-netchan-address-type-type-src-mq3-qcommon-netchan-ml-693202551"></a>
### type

```ml
type
```

Network-address kind selecting loopback, IPv4, or another supported transport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L28)
