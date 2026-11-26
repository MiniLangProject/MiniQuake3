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

Computes `bind` from `localEndpoint(socket)` using `mq3.platform.udp.mq3_udp_bind`, `mq3.platform.udp.localEndpoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — | Value forwarded as `socket` to `mq3.platform.udp.mq3_udp_bind`. |
| `endpoint` | `dynamic` | — | Record providing `endpoint.port`, `endpoint.address`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L162)

<a id="function-function-mq3-platform-udp-cleanup-function-cleanup-src-mq3-platform-udp-ml-828815130"></a>
### cleanup

```ml
function cleanup()
```

Returns `void` from `mq3.platform.udp.cleanup`; earlier branches return `error(6962,"udp: WSACleanup failed "+str(code))`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L128)

<a id="function-function-mq3-platform-udp-close-function-close-socket-src-mq3-platform-udp-ml-581475673"></a>
### close

```ml
function close(socket)
```

Returns `void` from `mq3.platform.udp.close`; earlier branches return `error(6968,"udp: invalid socket")`, `error(6968,"udp: closesocket failed "+str(code))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — | Value forwarded as `socket` to `mq3.platform.udp.mq3_udp_close`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L204)

- [mq3.platform.udp.Datagram](Type-mq3-platform-udp-datagram-1988638889.md) — struct
- [mq3.platform.udp.Endpoint](Type-mq3-platform-udp-endpoint-1058196963.md) — struct
<a id="function-function-mq3-platform-udp-errorname-function-errorname-code-src-mq3-platform-udp-ml-2110601087"></a>
### errorName

```ml
function errorName(code)
```

Computes `errorName` from `decode(slice(output,0,endAt))` using `mq3.platform.udp.mq3_udp_error_name`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — | Value forwarded as `code` to `mq3.platform.udp.mq3_udp_error_name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L135)

<a id="function-function-mq3-platform-udp-ipv4-function-ipv4-a-b-c-d-src-mq3-platform-udp-ml-299983986"></a>
### ipv4

```ml
function ipv4(a, b, c, d)
```

Returns `(a<<24)|(b<<16)|(c<<8)|d` from `mq3.platform.udp.ipv4`; earlier branches return `error(6960,"udp: invalid IPv4 octet")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Input tested by `a<0 or a>255 or b<0 or b>255 or c<0 or c>255 or d<0 or d>255`. |
| `b` | `dynamic` | — | Input tested by `a<0 or a>255 or b<0 or b>255 or c<0 or c>255 or d<0 or d>255`. |
| `c` | `dynamic` | — | Input tested by `a<0 or a>255 or b<0 or b>255 or c<0 or c>255 or d<0 or d>255`. |
| `d` | `dynamic` | — | Input tested by `a<0 or a>255 or b<0 or b>255 or c<0 or c>255 or d<0 or d>255`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L116)

<a id="function-function-mq3-platform-udp-lasterror-function-lasterror-src-mq3-platform-udp-ml-1051196978"></a>
### lastError

```ml
function lastError()
```

Calls `mq3.platform.udp.mq3_udp_last_error` with `()` and returns its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L132)

<a id="function-function-mq3-platform-udp-localendpoint-function-localendpoint-socket-src-mq3-platform-udp-ml-466470309"></a>
### localEndpoint

```ml
function localEndpoint(socket)
```

Builds `mq3.platform.udp.Endpoint` for `mq3.platform.udp.localEndpoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — | Value forwarded as `socket` to `mq3.platform.udp.mq3_udp_local_port`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L168)

<a id="function-function-mq3-platform-udp-localipv4-function-localipv4-src-mq3-platform-udp-ml-71136206"></a>
### localIPv4

```ml
function localIPv4()
```

Returns up to sixteen host-order local IPv4 addresses from the native resolver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L228)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-bind-extern-function-mq3-udp-bind-socket-as-ptr-address-as-u32-port-as-u32-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-1355450123"></a>
### mq3_udp_bind

```ml
extern function mq3_udp_bind(socket as ptr, address as u32, port as u32) from "miniquake3_udp.dll" returns i32
```

Binds a UDP socket using a host-order IPv4 address and port.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `ptr` | — | Raw socket handle created by mq3_udp_socket. |
| `address` | `u32` | — | Local IPv4 address in host order; zero binds all interfaces. |
| `port` | `u32` | — | IPv4 port number in host order. |


**Returns:** 0 on success; the Winsock bind error otherwise.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L39)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-cleanup-extern-function-mq3-udp-cleanup-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-16789907"></a>
### mq3_udp_cleanup

```ml
extern function mq3_udp_cleanup() from "miniquake3_udp.dll" returns i32
```

Releases the UDP boundary's Winsock startup reference.


**Returns:** 0 on success; the Winsock error code on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L11)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-close-extern-function-mq3-udp-close-socket-as-ptr-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-2062046210"></a>
### mq3_udp_close

```ml
extern function mq3_udp_close(socket as ptr) from "miniquake3_udp.dll" returns i32
```

Closes a raw UDP socket handle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `ptr` | — | Raw socket handle created by mq3_udp_socket. |


**Returns:** 0 on success; the Winsock error code on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L66)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-error-name-extern-function-mq3-udp-error-name-code-as-i32-output-as-bytes-capacity-as-i32-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-359391796"></a>
### mq3_udp_error_name

```ml
extern function mq3_udp_error_name(code as i32, output as bytes, capacity as i32) from "miniquake3_udp.dll" returns i32
```

Copies the symbolic name of a Winsock error into a bounded text buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `i32` | — | Winsock error code whose symbolic name is requested. |
| `output` | `bytes` | — | Writable NUL-terminated name buffer. |
| `capacity` | `i32` | — | Output-buffer capacity in bytes. |


**Returns:** 0 when the name is written; WSAEINVAL for invalid output arguments.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L20)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-last-error-extern-function-mq3-udp-last-error-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-544789193"></a>
### mq3_udp_last_error

```ml
extern function mq3_udp_last_error() from "miniquake3_udp.dll" returns i32
```

Reads the last Winsock error for the calling thread.


**Returns:** The error code reported by WSAGetLastError.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L14)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-local-address-extern-function-mq3-udp-local-address-socket-as-ptr-from-miniquake3-udp-dll-returns-u32-src-mq3-platform-udp-ml-126848398"></a>
### mq3_udp_local_address

```ml
extern function mq3_udp_local_address(socket as ptr) from "miniquake3_udp.dll" returns u32
```

Reads the bound socket's IPv4 address in host order.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `ptr` | — | Raw socket handle created by mq3_udp_socket. |


**Returns:** The local address, or 0 when getsockname fails.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L43)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-local-ipv4-count-extern-function-mq3-udp-local-ipv4-count-addresses-as-bytes-capacity-as-i32-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-432108770"></a>
### mq3_udp_local_ipv4_count

```ml
extern function mq3_udp_local_ipv4_count(addresses as bytes, capacity as i32) from "miniquake3_udp.dll" returns i32
```

Collects local IPv4 addresses into a bounded host-order integer array.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `addresses` | `bytes` | — | Writable array of 32-bit host-order IPv4 addresses. |
| `capacity` | `i32` | — | Number of 32-bit address elements available, not a byte count. |


**Returns:** Number of addresses written, or a negated Winsock/resolver error.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L85)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-local-port-extern-function-mq3-udp-local-port-socket-as-ptr-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-217628176"></a>
### mq3_udp_local_port

```ml
extern function mq3_udp_local_port(socket as ptr) from "miniquake3_udp.dll" returns i32
```

Reads the bound socket's port in host order.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `ptr` | — | Raw socket handle created by mq3_udp_socket. |


**Returns:** The local port, or a negated Winsock error.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L47)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-recv-extern-function-mq3-udp-recv-socket-as-ptr-data-as-ptr-capacity-as-i32-metadata-as-bytes-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-1821773018"></a>
### mq3_udp_recv

```ml
extern function mq3_udp_recv(socket as ptr, data as ptr, capacity as i32, metadata as bytes) from "miniquake3_udp.dll" returns i32
```

Receives one nonblocking UDP datagram and writes its sender address and port.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `ptr` | — | Raw socket handle created by mq3_udp_socket. |
| `data` | `ptr` | — | Writable destination for one datagram. |
| `capacity` | `i32` | — | Maximum datagram bytes writable at data. |
| `metadata` | `bytes` | — | Writable eight-byte buffer for host-order sender IPv4 address and port. |


**Returns:** Received byte count; -2 for would-block, or another negated Winsock error.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L62)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-resolve-ipv4-extern-function-mq3-udp-resolve-ipv4-name-as-wstr-address-as-bytes-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-1472546823"></a>
### mq3_udp_resolve_ipv4

```ml
extern function mq3_udp_resolve_ipv4(name as wstr, address as bytes) from "miniquake3_udp.dll" returns i32
```

Resolves a wide hostname and writes the first IPv4 address in host order.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `wstr` | — | Wide-string host name or IPv4 text to resolve. |
| `address` | `bytes` | — | Writable four-byte buffer for a host-order IPv4 integer. |


**Returns:** 0 on success; a resolver or Winsock error code otherwise.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L33)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-send-extern-function-mq3-udp-send-socket-as-ptr-address-as-u32-port-as-u32-data-as-ptr-length-as-i32-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-2054700013"></a>
### mq3_udp_send

```ml
extern function mq3_udp_send(socket as ptr, address as u32, port as u32, data as ptr, length as i32) from "miniquake3_udp.dll" returns i32
```

Sends one UDP datagram to a host-order IPv4 endpoint.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `ptr` | — | Raw socket handle created by mq3_udp_socket. |
| `address` | `u32` | — | Destination IPv4 address in host order. |
| `port` | `u32` | — | IPv4 port number in host order. |
| `data` | `ptr` | — | Read-only datagram payload. |
| `length` | `i32` | — | Payload length in bytes; the entire datagram is submitted in one sendto call. |


**Returns:** Bytes sent, or a negated Winsock error.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L55)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-set-broadcast-extern-function-mq3-udp-set-broadcast-socket-as-ptr-enabled-as-i32-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-1385640597"></a>
### mq3_udp_set_broadcast

```ml
extern function mq3_udp_set_broadcast(socket as ptr, enabled as i32) from "miniquake3_udp.dll" returns i32
```

Enables or disables SO_BROADCAST on an existing UDP socket.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `ptr` | — | Raw socket handle created by mq3_udp_socket. |
| `enabled` | `i32` | — | Nonzero enables the requested native feature. |


**Returns:** 0 on success; a Winsock error code on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L28)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-socket-extern-function-mq3-udp-socket-from-miniquake3-udp-dll-returns-ptr-src-mq3-platform-udp-ml-71106841"></a>
### mq3_udp_socket

```ml
extern function mq3_udp_socket() from "miniquake3_udp.dll" returns ptr
```

Creates and configures a nonblocking IPv4 UDP socket.


**Returns:** The raw socket handle, or INVALID_SOCKET (-1) on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L23)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-socks5-open-extern-function-mq3-udp-socks5-open-server-as-wstr-port-as-u32-username-as-wstr-password-as-wstr-udpport-as-u32-relay-as-bytes-from-miniquake3-udp-dll-returns-ptr-src-mq3-platform-udp-ml-1667012750"></a>
### mq3_udp_socks5_open

```ml
extern function mq3_udp_socks5_open(server as wstr, port as u32, username as wstr, password as wstr, udpPort as u32, relay as bytes) from "miniquake3_udp.dll" returns ptr
```

Negotiates a SOCKS5 UDP association and writes the relay endpoint.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `wstr` | — | SOCKS5 server hostname passed as a wide string. |
| `port` | `u32` | — | IPv4 port number in host order. |
| `username` | `wstr` | — | SOCKS5 username passed as a wide string. |
| `password` | `wstr` | — | SOCKS5 password passed as a wide string. |
| `udpPort` | `u32` | — | Local UDP port announced in the SOCKS5 association. |
| `relay` | `bytes` | — | Writable eight-byte buffer for relay IPv4 address and port in host order. |


**Returns:** The TCP control socket retained for the association, or INVALID_SOCKET (-1) on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L75)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-startup-extern-function-mq3-udp-startup-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-890678619"></a>
### mq3_udp_startup

```ml
extern function mq3_udp_startup() from "miniquake3_udp.dll" returns i32
```

Initializes Winsock 2.2 for the raw UDP boundary.


**Returns:** 0 on success; the Winsock startup error code otherwise.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L8)

<a id="extern_function-extern-function-mq3-platform-udp-mq3-udp-wait-readable-extern-function-mq3-udp-wait-readable-socket-as-ptr-milliseconds-as-i32-from-miniquake3-udp-dll-returns-i32-src-mq3-platform-udp-ml-1233752162"></a>
### mq3_udp_wait_readable

```ml
extern function mq3_udp_wait_readable(socket as ptr, milliseconds as i32) from "miniquake3_udp.dll" returns i32
```

Waits with select until the socket is readable or the timeout expires.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `ptr` | — | Raw socket handle created by mq3_udp_socket. |
| `milliseconds` | `i32` | — | Maximum wait duration in milliseconds. |


**Returns:** Positive when readable, 0 on timeout, a negated select error, or WSAEINVAL for a negative timeout.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L80)

<a id="function-function-mq3-platform-udp-octets-function-octets-address-src-mq3-platform-udp-ml-1557213018"></a>
### octets

```ml
function octets(address)
```

Returns `[(address>>24)&255,(address>>16)&255,(address>>8)&255,address&255]` for `mq3.platform.udp.octets`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Input used in the result expression `[(address>>24)&255,(address>>16)&255,(address>>8)&255,address&255]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L122)

<a id="function-function-mq3-platform-udp-open-function-open-src-mq3-platform-udp-ml-1259769686"></a>
### open

```ml
function open()
```

Returns `socket` from `mq3.platform.udp.open`; earlier branches return `error(6963,"udp: socket failed")`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L140)

<a id="function-function-mq3-platform-udp-opensocks5-function-opensocks5-server-port-username-password-udpport-src-mq3-platform-udp-ml-742482031"></a>
### openSocks5

```ml
function openSocks5(server, port, username, password, udpPort)
```

Builds `mq3.platform.udp.Socks5` for `mq3.platform.udp.openSocks5`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Value forwarded as `server` to `mq3.platform.udp.mq3_udp_socks5_open`. |
| `port` | `dynamic` | — | Value forwarded as `port` to `mq3.platform.udp.mq3_udp_socks5_open`. |
| `username` | `dynamic` | — | Value forwarded as `username` to `mq3.platform.udp.mq3_udp_socks5_open`. |
| `password` | `dynamic` | — | Value forwarded as `password` to `mq3.platform.udp.mq3_udp_socks5_open`. |
| `udpPort` | `dynamic` | — | Value forwarded as `udpPort` to `mq3.platform.udp.mq3_udp_socks5_open`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L214)

<a id="function-function-mq3-platform-udp-receivefrom-function-receivefrom-socket-capacity-src-mq3-platform-udp-ml-858968139"></a>
### receiveFrom

```ml
function receiveFrom(socket, capacity)
```

Returns `receiveFromBuffered(socket,bytes(capacity,0),bytes(8,0),capacity)` from `mq3.platform.udp.receiveFrom`; earlier branches return `error(6967,"udp: invalid receive capacity")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — | Value forwarded as `socket` to `mq3.platform.udp.receiveFromBuffered`. |
| `capacity` | `dynamic` | — | Value forwarded as `capacity` to `mq3.platform.udp.receiveFromBuffered`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L198)

<a id="function-function-mq3-platform-udp-receivefrombuffered-function-receivefrombuffered-socket-data-metadata-capacity-src-mq3-platform-udp-ml-1150660198"></a>
### receiveFromBuffered

```ml
function receiveFromBuffered(socket, data, metadata, capacity)
```

Builds `mq3.platform.udp.Datagram` for `mq3.platform.udp.receiveFromBuffered`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — | Value forwarded as `socket` to `mq3.platform.udp.mq3_udp_recv`. |
| `data` | `dynamic` | — | Argument 1 supplied to `slice`. |
| `metadata` | `dynamic` | — | Value forwarded as `metadata` to `mq3.platform.udp.mq3_udp_recv`. |
| `capacity` | `dynamic` | — | Value forwarded as `capacity` to `mq3.platform.udp.mq3_udp_recv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L188)

<a id="function-function-mq3-platform-udp-resolveipv4-function-resolveipv4-name-src-mq3-platform-udp-ml-613942589"></a>
### resolveIPv4

```ml
function resolveIPv4(name)
```

Computes `resolveIPv4` from `n.readU32(address,0)` using `mq3.platform.udp.mq3_udp_resolve_ipv4`, `mq3.compat.numeric.readU32`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.platform.udp.mq3_udp_resolve_ipv4`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L153)

<a id="function-function-mq3-platform-udp-sendto-function-sendto-socket-endpoint-data-src-mq3-platform-udp-ml-1016723078"></a>
### sendTo

```ml
function sendTo(socket, endpoint, data)
```

Computes `sendTo` from `mq3_udp_s` using `mq3.platform.udp.mq3_udp_send`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — | Value forwarded as `socket` to `mq3.platform.udp.mq3_udp_send`. |
| `endpoint` | `dynamic` | — | Record providing `endpoint.port`, `endpoint.address`. |
| `data` | `dynamic` | — | Input tested by `socket==void or endpoint==void or data==void or endpoint.port<0 or endpoint.port>65535`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L176)

<a id="function-function-mq3-platform-udp-setbroadcast-function-setbroadcast-socket-enabled-src-mq3-platform-udp-ml-369796000"></a>
### setBroadcast

```ml
function setBroadcast(socket, enabled)
```

Applies the socket broadcast flag and converts a Winsock failure into error 6969.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — | Value forwarded as `socket` to `mq3.platform.udp.mq3_udp_set_broadcast`. |
| `enabled` | `dynamic` | — | Input tested by `enabled`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L146)

- [mq3.platform.udp.Socks5](Type-mq3-platform-udp-socks5-1071302358.md) — struct
<a id="function-function-mq3-platform-udp-startup-function-startup-src-mq3-platform-udp-ml-1039365000"></a>
### startup

```ml
function startup()
```

Returns `void` from `mq3.platform.udp.startup`; earlier branches return `error(6961,"udp: WSAStartup failed "+str(code))`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L124)

<a id="function-function-mq3-platform-udp-waitreadable-function-waitreadable-socket-milliseconds-src-mq3-platform-udp-ml-1321458523"></a>
### waitReadable

```ml
function waitReadable(socket, milliseconds)
```

Computes `waitReadable` from `result>0` using `mq3.platform.udp.mq3_udp_wait_readable`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — | Value forwarded as `socket` to `mq3.platform.udp.mq3_udp_wait_readable`. |
| `milliseconds` | `dynamic` | — | Value forwarded as `milliseconds` to `mq3.platform.udp.mq3_udp_wait_readable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/udp.ml#L223)
