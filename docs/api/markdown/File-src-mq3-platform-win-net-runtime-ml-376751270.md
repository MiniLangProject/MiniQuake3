# `src/mq3/platform/win_net_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.win_net_runtime`](Package-mq3-platform-win-net-runtime-2111868070.md)

Reachable from entry: **no**

## Imports

- `mq3/platform/udp.ml` as `udp` → [src/mq3/platform/udp.ml](File-src-mq3-platform-udp-ml-646757928.md)
- `mq3/qcommon/net_transport.ml` as `transport` → [src/mq3/qcommon/net_transport.ml](File-src-mq3-qcommon-net-transport-ml-1557933377.md)
- `mq3/qcommon/netchan.ml` as `netchan` → [src/mq3/qcommon/netchan.ml](File-src-mq3-qcommon-netchan-ml-1381353623.md)

## Declarations

<a id="function-function-mq3-platform-win-net-runtime-closesocket-function-closesocket-value-src-mq3-platform-win-net-runtime-ml-1175833395"></a>
### closeSocket

```ml
function closeSocket(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L156)

<a id="function-function-mq3-platform-win-net-runtime-copycvars-function-copycvars-value-src-mq3-platform-win-net-runtime-ml-1782246145"></a>
### copyCvars

```ml
function copyCvars(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L27)

<a id="function-function-mq3-platform-win-net-runtime-create-function-create-src-mq3-platform-win-net-runtime-ml-1170375558"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L28)

<a id="function-function-mq3-platform-win-net-runtime-cvars-function-cvars-src-mq3-platform-win-net-runtime-ml-654830540"></a>
### cvars

```ml
function cvars()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L26)

- [mq3.platform.win_net_runtime.Cvars](Type-mq3-platform-win-net-runtime-cvars-798835227.md) — struct
<a id="function-function-mq3-platform-win-net-runtime-hexnibble-function-hexnibble-value-src-mq3-platform-win-net-runtime-ml-918750991"></a>
### hexNibble

```ml
function hexNibble(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L53)

<a id="function-function-mq3-platform-win-net-runtime-log-function-log-state-text-src-mq3-platform-win-net-runtime-ml-1997099972"></a>
### log

```ml
function log(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L29)

<a id="constant-constant-mq3-platform-win-net-runtime-max-ips-const-max-ips-16-src-mq3-platform-win-net-runtime-ml-1541752498"></a>
### MAX_IPS

```ml
const MAX_IPS = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L19)

<a id="constant-constant-mq3-platform-win-net-runtime-na-bad-const-na-bad-1-src-mq3-platform-win-net-runtime-ml-874990406"></a>
### NA_BAD

```ml
const NA_BAD = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L11)

<a id="constant-constant-mq3-platform-win-net-runtime-na-bot-const-na-bot-0-src-mq3-platform-win-net-runtime-ml-1029467113"></a>
### NA_BOT

```ml
const NA_BOT = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L10)

<a id="constant-constant-mq3-platform-win-net-runtime-na-broadcast-const-na-broadcast-3-src-mq3-platform-win-net-runtime-ml-356193684"></a>
### NA_BROADCAST

```ml
const NA_BROADCAST = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L13)

<a id="constant-constant-mq3-platform-win-net-runtime-na-broadcast-ipx-const-na-broadcast-ipx-6-src-mq3-platform-win-net-runtime-ml-585635527"></a>
### NA_BROADCAST_IPX

```ml
const NA_BROADCAST_IPX = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L16)

<a id="constant-constant-mq3-platform-win-net-runtime-na-ip-const-na-ip-4-src-mq3-platform-win-net-runtime-ml-118162881"></a>
### NA_IP

```ml
const NA_IP = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L14)

<a id="constant-constant-mq3-platform-win-net-runtime-na-ipx-const-na-ipx-5-src-mq3-platform-win-net-runtime-ml-542761226"></a>
### NA_IPX

```ml
const NA_IPX = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L15)

<a id="constant-constant-mq3-platform-win-net-runtime-na-loopback-const-na-loopback-2-src-mq3-platform-win-net-runtime-ml-1663595455"></a>
### NA_LOOPBACK

```ml
const NA_LOOPBACK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L12)

<a id="function-function-mq3-platform-win-net-runtime-net-config-function-net-config-state-enablenetworking-values-src-mq3-platform-win-net-runtime-ml-612078736"></a>
### NET_Config

```ml
function NET_Config(state, enableNetworking, values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `enableNetworking` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L157)

<a id="function-function-mq3-platform-win-net-runtime-net-errorstring-function-net-errorstring-code-src-mq3-platform-win-net-runtime-ml-60664639"></a>
### NET_ErrorString

```ml
function NET_ErrorString(code)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L31)

<a id="function-function-mq3-platform-win-net-runtime-net-getcvars-function-net-getcvars-state-values-src-mq3-platform-win-net-runtime-ml-1049822395"></a>
### NET_GetCvars

```ml
function NET_GetCvars(state, values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L153)

<a id="function-function-mq3-platform-win-net-runtime-net-getlocaladdress-function-net-getlocaladdress-state-src-mq3-platform-win-net-runtime-ml-960952883"></a>
### NET_GetLocalAddress

```ml
function NET_GetLocalAddress(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L136)

<a id="function-function-mq3-platform-win-net-runtime-net-init-function-net-init-state-values-src-mq3-platform-win-net-runtime-ml-1521167407"></a>
### NET_Init

```ml
function NET_Init(state, values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L167)

<a id="function-function-mq3-platform-win-net-runtime-net-ipsocket-function-net-ipsocket-netinterface-port-src-mq3-platform-win-net-runtime-ml-1928242681"></a>
### NET_IPSocket

```ml
function NET_IPSocket(netInterface, port)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `netInterface` | `dynamic` | — |  |
| `port` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L124)

<a id="function-function-mq3-platform-win-net-runtime-net-ipxsocket-function-net-ipxsocket-port-src-mq3-platform-win-net-runtime-ml-2060133115"></a>
### NET_IPXSocket

```ml
function NET_IPXSocket(port)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `port` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L147)

<a id="function-function-mq3-platform-win-net-runtime-net-openip-function-net-openip-state-src-mq3-platform-win-net-runtime-ml-978292713"></a>
### NET_OpenIP

```ml
function NET_OpenIP(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L139)

<a id="function-function-mq3-platform-win-net-runtime-net-openipx-function-net-openipx-state-src-mq3-platform-win-net-runtime-ml-642515935"></a>
### NET_OpenIPX

```ml
function NET_OpenIPX(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L148)

<a id="function-function-mq3-platform-win-net-runtime-net-opensocks-function-net-opensocks-state-port-src-mq3-platform-win-net-runtime-ml-1294570330"></a>
### NET_OpenSocks

```ml
function NET_OpenSocks(state, port)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `port` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L129)

<a id="function-function-mq3-platform-win-net-runtime-net-restart-function-net-restart-state-src-mq3-platform-win-net-runtime-ml-1555724987"></a>
### NET_Restart

```ml
function NET_Restart(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L174)

<a id="function-function-mq3-platform-win-net-runtime-net-shutdown-function-net-shutdown-state-src-mq3-platform-win-net-runtime-ml-1561874605"></a>
### NET_Shutdown

```ml
function NET_Shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L170)

<a id="function-function-mq3-platform-win-net-runtime-net-sleep-function-net-sleep-state-milliseconds-src-mq3-platform-win-net-runtime-ml-408991681"></a>
### NET_Sleep

```ml
function NET_Sleep(state, milliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `milliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L173)

<a id="function-function-mq3-platform-win-net-runtime-netadrtosockadr-function-netadrtosockadr-address-src-mq3-platform-win-net-runtime-ml-1692384546"></a>
### NetadrToSockadr

```ml
function NetadrToSockadr(address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L38)

- [mq3.platform.win_net_runtime.Packet](Type-mq3-platform-win-net-runtime-packet-1466680192.md) — struct
<a id="function-function-mq3-platform-win-net-runtime-parseipx-function-parseipx-text-src-mq3-platform-win-net-runtime-ml-2059096215"></a>
### parseIpx

```ml
function parseIpx(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L56)

<a id="constant-constant-mq3-platform-win-net-runtime-port-any-const-port-any-1-src-mq3-platform-win-net-runtime-ml-1076350753"></a>
### PORT_ANY

```ml
const PORT_ANY = -1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L17)

<a id="constant-constant-mq3-platform-win-net-runtime-port-server-const-port-server-27960-src-mq3-platform-win-net-runtime-ml-452774445"></a>
### PORT_SERVER

```ml
const PORT_SERVER = 27960
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L18)

- [mq3.platform.win_net_runtime.Runtime](Type-mq3-platform-win-net-runtime-runtime-604777452.md) — struct
<a id="function-function-mq3-platform-win-net-runtime-samecvars-function-samecvars-left-right-src-mq3-platform-win-net-runtime-ml-1554117011"></a>
### sameCvars

```ml
function sameCvars(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L150)

<a id="function-function-mq3-platform-win-net-runtime-sameoctets-function-sameoctets-left-right-count-src-mq3-platform-win-net-runtime-ml-594216914"></a>
### sameOctets

```ml
function sameOctets(left, right, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L101)

- [mq3.platform.win_net_runtime.SockAddr](Type-mq3-platform-win-net-runtime-sockaddr-1851892371.md) — struct
<a id="function-function-mq3-platform-win-net-runtime-sockadrtonetadr-function-sockadrtonetadr-address-src-mq3-platform-win-net-runtime-ml-872921322"></a>
### SockadrToNetadr

```ml
function SockadrToNetadr(address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L46)

<a id="function-function-mq3-platform-win-net-runtime-sys-getpacket-function-sys-getpacket-state-capacity-src-mq3-platform-win-net-runtime-ml-2089903893"></a>
### Sys_GetPacket

```ml
function Sys_GetPacket(state, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L74)

<a id="function-function-mq3-platform-win-net-runtime-sys-islanaddress-function-sys-islanaddress-state-address-src-mq3-platform-win-net-runtime-ml-1158761447"></a>
### Sys_IsLANAddress

```ml
function Sys_IsLANAddress(state, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L104)

<a id="function-function-mq3-platform-win-net-runtime-sys-sendpacket-function-sys-sendpacket-state-length-data-target-src-mq3-platform-win-net-runtime-ml-1866967422"></a>
### Sys_SendPacket

```ml
function Sys_SendPacket(state, length, data, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L89)

<a id="function-function-mq3-platform-win-net-runtime-sys-showip-function-sys-showip-state-src-mq3-platform-win-net-runtime-ml-1258005525"></a>
### Sys_ShowIP

```ml
function Sys_ShowIP(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L120)

<a id="function-function-mq3-platform-win-net-runtime-sys-stringtoadr-function-sys-stringtoadr-text-src-mq3-platform-win-net-runtime-ml-611659145"></a>
### Sys_StringToAdr

```ml
function Sys_StringToAdr(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L70)

<a id="function-function-mq3-platform-win-net-runtime-sys-stringtosockaddr-function-sys-stringtosockaddr-text-src-mq3-platform-win-net-runtime-ml-1925125635"></a>
### Sys_StringToSockaddr

```ml
function Sys_StringToSockaddr(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L65)
