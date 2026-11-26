# `mq3.platform.win_net_runtime.SockAddr`

[Home](README.md) · [Source file](File-src-mq3-platform-win-net-runtime-ml-376751270.md)

<a id="struct-struct-mq3-platform-win-net-runtime-sockaddr-struct-sockaddr-src-mq3-platform-win-net-runtime-ml-594020987"></a>
## SockAddr

```ml
struct SockAddr
```

Data record for `mq3.platform.win_net_runtime.SockAddr`; groups `family`, `address`, `port`, `ipx`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L32)

## Members

<a id="field-field-mq3-platform-win-net-runtime-sockaddr-address-address-src-mq3-platform-win-net-runtime-ml-151543742"></a>
### address

```ml
address
```

Network address used to identify the remote or local endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L36)

<a id="field-field-mq3-platform-win-net-runtime-sockaddr-family-family-src-mq3-platform-win-net-runtime-ml-1978019610"></a>
### family

```ml
family
```

Address family stored in the native socket address.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L34)

<a id="field-field-mq3-platform-win-net-runtime-sockaddr-ipx-ipx-src-mq3-platform-win-net-runtime-ml-511790982"></a>
### ipx

```ml
ipx
```

Legacy IPX address bytes used by the native network adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L40)

<a id="field-field-mq3-platform-win-net-runtime-sockaddr-port-port-src-mq3-platform-win-net-runtime-ml-1483195080"></a>
### port

```ml
port
```

Transport port number associated with the endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L38)
