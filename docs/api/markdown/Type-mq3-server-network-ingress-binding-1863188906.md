# `mq3.server.network_ingress.Binding`

[Home](README.md) · [Source file](File-src-mq3-server-network-ingress-ml-1810419035.md)

<a id="struct-struct-mq3-server-network-ingress-binding-struct-binding-src-mq3-server-network-ingress-ml-2058019079"></a>
## Binding

```ml
struct Binding
```

Binding record for server.network_ingress, containing `packetClient`, `messageClient`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/network_ingress.ml#L11)

## Members

<a id="field-field-mq3-server-network-ingress-binding-messageclient-messageclient-src-mq3-server-network-ingress-ml-1335869838"></a>
### messageClient

```ml
messageClient
```

Client record used while decoding the accepted message payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/network_ingress.ml#L15)

<a id="field-field-mq3-server-network-ingress-binding-packetclient-packetclient-src-mq3-server-network-ingress-ml-411901476"></a>
### packetClient

```ml
packetClient
```

Client record used by the packet sequence handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/network_ingress.ml#L13)
