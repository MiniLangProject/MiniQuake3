# `mq3.platform.win_net_runtime.Runtime`

[Home](README.md) · [Source file](File-src-mq3-platform-win-net-runtime-ml-376751270.md)

<a id="struct-struct-mq3-platform-win-net-runtime-runtime-struct-runtime-src-mq3-platform-win-net-runtime-ml-118279705"></a>
## Runtime

```ml
struct Runtime
```

Data record for `mq3.platform.win_net_runtime.Runtime`; groups `initialized`, `networkingEnabled`, `socket`, `socksSocket`, `socksRelay`, `ipxSocket`, and 5 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L66)

## Members

<a id="field-field-mq3-platform-win-net-runtime-runtime-cvars-cvars-src-mq3-platform-win-net-runtime-ml-89712561"></a>
### cvars

```ml
cvars
```

Console variables and their current runtime values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L84)

<a id="field-field-mq3-platform-win-net-runtime-runtime-initialized-initialized-src-mq3-platform-win-net-runtime-ml-780403261"></a>
### initialized

```ml
initialized
```

Whether initialization completed successfully.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L68)

<a id="field-field-mq3-platform-win-net-runtime-runtime-ipxsocket-ipxsocket-src-mq3-platform-win-net-runtime-ml-533595581"></a>
### ipxSocket

```ml
ipxSocket
```

Socket used by the legacy IPX transport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L78)

<a id="field-field-mq3-platform-win-net-runtime-runtime-localips-localips-src-mq3-platform-win-net-runtime-ml-457715655"></a>
### localIPs

```ml
localIPs
```

Local interface addresses discovered by the network runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L82)

<a id="field-field-mq3-platform-win-net-runtime-runtime-logs-logs-src-mq3-platform-win-net-runtime-ml-729109879"></a>
### logs

```ml
logs
```

Diagnostic log entries retained by the platform layer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L88)

<a id="field-field-mq3-platform-win-net-runtime-runtime-networkingenabled-networkingenabled-src-mq3-platform-win-net-runtime-ml-2132992549"></a>
### networkingEnabled

```ml
networkingEnabled
```

Whether the runtime currently accepts network operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L70)

<a id="field-field-mq3-platform-win-net-runtime-runtime-recvfromcount-recvfromcount-src-mq3-platform-win-net-runtime-ml-367561417"></a>
### recvfromCount

```ml
recvfromCount
```

Number of receive attempts made through the native socket adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L86)

<a id="field-field-mq3-platform-win-net-runtime-runtime-socket-socket-src-mq3-platform-win-net-runtime-ml-1674919287"></a>
### socket

```ml
socket
```

UDP socket used by the network runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L72)

<a id="field-field-mq3-platform-win-net-runtime-runtime-socksrelay-socksrelay-src-mq3-platform-win-net-runtime-ml-184529941"></a>
### socksRelay

```ml
socksRelay
```

UDP relay endpoint assigned by the SOCKS proxy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L76)

<a id="field-field-mq3-platform-win-net-runtime-runtime-sockssocket-sockssocket-src-mq3-platform-win-net-runtime-ml-952924369"></a>
### socksSocket

```ml
socksSocket
```

Control connection used to negotiate the SOCKS proxy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L74)

<a id="field-field-mq3-platform-win-net-runtime-runtime-usingsocks-usingsocks-src-mq3-platform-win-net-runtime-ml-792334891"></a>
### usingSocks

```ml
usingSocks
```

Whether outgoing UDP packets currently use the SOCKS relay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_net_runtime.ml#L80)
