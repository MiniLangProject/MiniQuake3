# `mq3.client.client_abi.ServerAddress`

[Home](README.md) · [Source file](File-src-mq3-client-client-abi-ml-362324391.md)

<a id="struct-struct-mq3-client-client-abi-serveraddress-struct-serveraddress-src-mq3-client-client-abi-ml-841853031"></a>
## ServerAddress

```ml
struct ServerAddress
```

Stores client ABI server address record, including `ip`, `port`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L235)

## Members

<a id="field-field-mq3-client-client-abi-serveraddress-ip-ip-src-mq3-client-client-abi-ml-945544048"></a>
### ip

```ml
ip
```

Compatibility member corresponding to native `serverAddress_t.ip`; the original declaration is `byte ip[4]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L238)

<a id="field-field-mq3-client-client-abi-serveraddress-port-port-src-mq3-client-client-abi-ml-787445484"></a>
### port

```ml
port
```

Compatibility member corresponding to native `serverAddress_t.port`; the original declaration is `unsigned short port`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_abi.ml#L241)
