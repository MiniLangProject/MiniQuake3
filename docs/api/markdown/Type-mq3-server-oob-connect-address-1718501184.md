# `mq3.server.oob_connect.Address`

[Home](README.md) · [Source file](File-src-mq3-server-oob-connect-ml-829458266.md)

<a id="struct-struct-mq3-server-oob-connect-address-struct-address-src-mq3-server-oob-connect-ml-1157477457"></a>
## Address

```ml
struct Address
```

Address record for server.oob_connect, containing `type`, `ip`, `port`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L23)

## Members

<a id="field-field-mq3-server-oob-connect-address-ip-ip-src-mq3-server-oob-connect-ml-1268373447"></a>
### ip

```ml
ip
```

Address bytes identifying the remote IPv4 endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L27)

<a id="field-field-mq3-server-oob-connect-address-port-port-src-mq3-server-oob-connect-ml-1124760219"></a>
### port

```ml
port
```

Network port associated with the endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L29)

<a id="field-field-mq3-server-oob-connect-address-type-type-src-mq3-server-oob-connect-ml-2107907021"></a>
### type

```ml
type
```

Network-address kind used when validating the connection source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/oob_connect.ml#L25)
