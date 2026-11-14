# `src/mq3/platform/udp.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.udp`](Package-mq3-platform-udp-1142395396.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-platform-udp-bind-function-bind-socket-endpoint-src-mq3-platform-udp-ml-1665600074"></a>
### bind

```ml
function bind(socket, endpoint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — |  |
| `endpoint` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L57)

<a id="function-function-mq3-platform-udp-cleanup-function-cleanup-src-mq3-platform-udp-ml-828815130"></a>
### cleanup

```ml
function cleanup()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L35)

<a id="function-function-mq3-platform-udp-close-function-close-socket-src-mq3-platform-udp-ml-581475673"></a>
### close

```ml
function close(socket)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L83)

- [mq3.platform.udp.Datagram](Type-mq3-platform-udp-datagram-1988638889.md) — struct
- [mq3.platform.udp.Endpoint](Type-mq3-platform-udp-endpoint-1058196963.md) — struct
<a id="function-function-mq3-platform-udp-errorname-function-errorname-code-src-mq3-platform-udp-ml-2110601087"></a>
### errorName

```ml
function errorName(code)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L39)

<a id="function-function-mq3-platform-udp-ipv4-function-ipv4-a-b-c-d-src-mq3-platform-udp-ml-299983986"></a>
### ipv4

```ml
function ipv4(a, b, c, d)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `d` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L27)

<a id="function-function-mq3-platform-udp-lasterror-function-lasterror-src-mq3-platform-udp-ml-1051196978"></a>
### lastError

```ml
function lastError()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L38)

<a id="function-function-mq3-platform-udp-localendpoint-function-localendpoint-socket-src-mq3-platform-udp-ml-466470309"></a>
### localEndpoint

```ml
function localEndpoint(socket)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L61)

<a id="function-function-mq3-platform-udp-localipv4-function-localipv4-src-mq3-platform-udp-ml-71136206"></a>
### localIPv4

```ml
function localIPv4()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L97)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-bind-extern-function-mq3-udp-bind-socket-as-ptr-address-as-u32-port-as-u32-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-1355450123"></a>
### mq3_udp_bind

```ml
extern function mq3_udp_bind(socket as ptr, address as u32, port as u32) from "miniquake3_udp.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `ptr` | — |  |
| `address` | `u32` | — |  |
| `port` | `u32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L13)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-cleanup-extern-function-mq3-udp-cleanup-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-16789907"></a>
### mq3_udp_cleanup

```ml
extern function mq3_udp_cleanup() from "miniquake3_udp.dll" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L7)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-close-extern-function-mq3-udp-close-socket-as-ptr-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-2062046210"></a>
### mq3_udp_close

```ml
extern function mq3_udp_close(socket as ptr) from "miniquake3_udp.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `ptr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L18)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-error-name-extern-function-mq3-udp-error-name-code-as-i32-output-as-bytes-capacity-as-i32-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-359391796"></a>
### mq3_udp_error_name

```ml
extern function mq3_udp_error_name(code as i32, output as bytes, capacity as i32) from "miniquake3_udp.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `i32` | — |  |
| `output` | `bytes` | — |  |
| `capacity` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L9)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-last-error-extern-function-mq3-udp-last-error-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-544789193"></a>
### mq3_udp_last_error

```ml
extern function mq3_udp_last_error() from "miniquake3_udp.dll" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L8)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-local-address-extern-function-mq3-udp-local-address-socket-as-ptr-from-miniquake3-udp-dll-returns-u32-src-mq3-platform-udp-ml-126848398"></a>
### mq3_udp_local_address

```ml
extern function mq3_udp_local_address(socket as ptr) from "miniquake3_udp.dll" returns u32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `ptr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L14)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-local-ipv4-count-extern-function-mq3-udp-local-ipv4-count-addresses-as-bytes-capacity-as-i32-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-432108770"></a>
### mq3_udp_local_ipv4_count

```ml
extern function mq3_udp_local_ipv4_count(addresses as bytes, capacity as i32) from "miniquake3_udp.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `addresses` | `bytes` | — |  |
| `capacity` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L21)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-local-port-extern-function-mq3-udp-local-port-socket-as-ptr-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-217628176"></a>
### mq3_udp_local_port

```ml
extern function mq3_udp_local_port(socket as ptr) from "miniquake3_udp.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `ptr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L15)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-recv-extern-function-mq3-udp-recv-socket-as-ptr-data-as-ptr-capacity-as-i32-metadata-as-bytes-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-1821773018"></a>
### mq3_udp_recv

```ml
extern function mq3_udp_recv(socket as ptr, data as ptr, capacity as i32, metadata as bytes) from "miniquake3_udp.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `ptr` | — |  |
| `data` | `ptr` | — |  |
| `capacity` | `i32` | — |  |
| `metadata` | `bytes` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L17)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-resolve-ipv4-extern-function-mq3-udp-resolve-ipv4-name-as-wstr-address-as-bytes-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-1472546823"></a>
### mq3_udp_resolve_ipv4

```ml
extern function mq3_udp_resolve_ipv4(name as wstr, address as bytes) from "miniquake3_udp.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `wstr` | — |  |
| `address` | `bytes` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L12)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-send-extern-function-mq3-udp-send-socket-as-ptr-address-as-u32-port-as-u32-data-as-ptr-length-as-i32-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-2054700013"></a>
### mq3_udp_send

```ml
extern function mq3_udp_send(socket as ptr, address as u32, port as u32, data as ptr, length as i32) from "miniquake3_udp.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `ptr` | — |  |
| `address` | `u32` | — |  |
| `port` | `u32` | — |  |
| `data` | `ptr` | — |  |
| `length` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L16)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-set-broadcast-extern-function-mq3-udp-set-broadcast-socket-as-ptr-enabled-as-i32-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-1385640597"></a>
### mq3_udp_set_broadcast

```ml
extern function mq3_udp_set_broadcast(socket as ptr, enabled as i32) from "miniquake3_udp.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `ptr` | — |  |
| `enabled` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L11)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-socket-extern-function-mq3-udp-socket-from-miniquake3-udp-dll-returns-ptr-src-mq3-platform-udp-ml-71106841"></a>
### mq3_udp_socket

```ml
extern function mq3_udp_socket() from "miniquake3_udp.dll" returns ptr
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L10)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-socks5-open-extern-function-mq3-udp-socks5-open-server-as-wstr-port-as-u32-username-as-wstr-password-as-wstr-udpport-as-u32-relay-as-bytes-from-miniquake3-udp-dll-returns-ptr-src-mq3-platform-udp-ml-1667012750"></a>
### mq3_udp_socks5_open

```ml
extern function mq3_udp_socks5_open(server as wstr, port as u32, username as wstr, password as wstr, udpPort as u32, relay as bytes) from "miniquake3_udp.dll" returns ptr
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `wstr` | — |  |
| `port` | `u32` | — |  |
| `username` | `wstr` | — |  |
| `password` | `wstr` | — |  |
| `udpPort` | `u32` | — |  |
| `relay` | `bytes` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L19)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-startup-extern-function-mq3-udp-startup-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-890678619"></a>
### mq3_udp_startup

```ml
extern function mq3_udp_startup() from "miniquake3_udp.dll" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L6)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-wait-readable-extern-function-mq3-udp-wait-readable-socket-as-ptr-milliseconds-as-i32-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-1233752162"></a>
### mq3_udp_wait_readable

```ml
extern function mq3_udp_wait_readable(socket as ptr, milliseconds as i32) from "miniquake3_udp.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `ptr` | — |  |
| `milliseconds` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L20)

<a id="function-function-mq3-platform-udp-octets-function-octets-address-src-mq3-platform-udp-ml-1557213018"></a>
### octets

```ml
function octets(address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L31)

<a id="function-function-mq3-platform-udp-open-function-open-src-mq3-platform-udp-ml-1259769686"></a>
### open

```ml
function open()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L43)

<a id="function-function-mq3-platform-udp-opensocks5-function-opensocks5-server-port-username-password-udpport-src-mq3-platform-udp-ml-742482031"></a>
### openSocks5

```ml
function openSocks5(server, port, username, password, udpPort)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |
| `port` | `dynamic` | — |  |
| `username` | `dynamic` | — |  |
| `password` | `dynamic` | — |  |
| `udpPort` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L87)

<a id="function-function-mq3-platform-udp-receivefrom-function-receivefrom-socket-capacity-src-mq3-platform-udp-ml-858968139"></a>
### receiveFrom

```ml
function receiveFrom(socket, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L79)

<a id="function-function-mq3-platform-udp-receivefrombuffered-function-receivefrombuffered-socket-data-metadata-capacity-src-mq3-platform-udp-ml-1150660198"></a>
### receiveFromBuffered

```ml
function receiveFromBuffered(socket, data, metadata, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `metadata` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L72)

<a id="function-function-mq3-platform-udp-resolveipv4-function-resolveipv4-name-src-mq3-platform-udp-ml-613942589"></a>
### resolveIPv4

```ml
function resolveIPv4(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L51)

<a id="function-function-mq3-platform-udp-sendto-function-sendto-socket-endpoint-data-src-mq3-platform-udp-ml-1016723078"></a>
### sendTo

```ml
function sendTo(socket, endpoint, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — |  |
| `endpoint` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L65)

<a id="function-function-mq3-platform-udp-setbroadcast-function-setbroadcast-socket-enabled-src-mq3-platform-udp-ml-369796000"></a>
### setBroadcast

```ml
function setBroadcast(socket, enabled)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — |  |
| `enabled` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L46)

- [mq3.platform.udp.Socks5](Type-mq3-platform-udp-socks5-1071302358.md) — struct
<a id="function-function-mq3-platform-udp-startup-function-startup-src-mq3-platform-udp-ml-1039365000"></a>
### startup

```ml
function startup()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L32)

<a id="function-function-mq3-platform-udp-waitreadable-function-waitreadable-socket-milliseconds-src-mq3-platform-udp-ml-1321458523"></a>
### waitReadable

```ml
function waitReadable(socket, milliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — |  |
| `milliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L93)
