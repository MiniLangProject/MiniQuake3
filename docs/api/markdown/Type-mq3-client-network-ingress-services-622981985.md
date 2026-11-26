# `mq3.client.network_ingress.Services`

[Home](README.md) · [Source file](File-src-mq3-client-network-ingress-ml-1289633455.md)

<a id="struct-struct-mq3-client-network-ingress-services-struct-services-src-mq3-client-network-ingress-ml-437552939"></a>
## Services

```ml
struct Services
```

Host services for connectionless client packets, optional demo recording, and server-side datagrams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_ingress.ml#L12)

## Members

<a id="field-field-mq3-client-network-ingress-services-connectionlesshost-connectionlesshost-src-mq3-client-network-ingress-ml-1973358375"></a>
### connectionlessHost

```ml
connectionlessHost
```

Client connectionless service bundle used for handshake, disconnect, and other out-of-band packets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_ingress.ml#L14)

<a id="field-field-mq3-client-network-ingress-services-context-context-src-mq3-client-network-ingress-ml-1467644621"></a>
### context

```ml
context
```

Caller-owned data available as `services.context` to recorder and server-packet callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_ingress.ml#L22)

<a id="field-field-mq3-client-network-ingress-services-demofn-demofn-src-mq3-client-network-ingress-ml-1004431295"></a>
### demoFn

```ml
demoFn
```

Optional recorder callback `(services, packetState, msg, headerBytes)`; required when recording a sequenced packet. The first argument is this Services record, including its context.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_ingress.ml#L17)

<a id="field-field-mq3-client-network-ingress-services-serverpacketfn-serverpacketfn-src-mq3-client-network-ingress-ml-792780651"></a>
### serverPacketFn

```ml
serverPacketFn
```

Optional server datagram callback `(services, address, data)`; its result is returned unchanged by `receiveServer`. With no callback, server datagrams are ignored.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_ingress.ml#L20)
