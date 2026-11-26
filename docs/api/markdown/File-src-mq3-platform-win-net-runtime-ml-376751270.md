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

Returns `void` from `mq3.platform.win_net_runtime.closeSocket`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.platform.udp.close`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L220)

<a id="function-function-mq3-platform-win-net-runtime-copycvars-function-copycvars-value-src-mq3-platform-win-net-runtime-ml-1782246145"></a>
### copyCvars

```ml
function copyCvars(value)
```

Constructs `mq3.platform.win_net_runtime.Cvars` with `noudp` = `value.noudp`, `noipx` = `value.noipx`, `socksEnabled` = `value.socksEnabled`, `socksServer` = `value.socksServer` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.noudp`, `value.noipx`, `value.socksEnabled`, `value.socksServer`, `value.socksPort`, `value.socksUsername`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L34)

<a id="function-function-mq3-platform-win-net-runtime-create-function-create-src-mq3-platform-win-net-runtime-ml-1170375558"></a>
### create

```ml
function create()
```

Constructs `mq3.platform.win_net_runtime.Runtime` with `initialized` = `false`, `networkingEnabled` = `false`, `socket` = `void`, `socksSocket` = `void` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L36)

<a id="function-function-mq3-platform-win-net-runtime-cvars-function-cvars-src-mq3-platform-win-net-runtime-ml-654830540"></a>
### cvars

```ml
function cvars()
```

Constructs `mq3.platform.win_net_runtime.Cvars` with `noudp` = `false`, `noipx` = `true`, `socksEnabled` = `false`, `socksServer` = `""` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L31)

- [mq3.platform.win_net_runtime.Cvars](Type-mq3-platform-win-net-runtime-cvars-798835227.md) — struct
<a id="function-function-mq3-platform-win-net-runtime-hexnibble-function-hexnibble-value-src-mq3-platform-win-net-runtime-ml-918750991"></a>
### hexNibble

```ml
function hexNibble(value)
```

Returns `-1` from `mq3.platform.win_net_runtime.hexNibble`; earlier branches return `value-48`, `value-55`, `value-87`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input tested by `value>=48 and value<=57`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L72)

<a id="function-function-mq3-platform-win-net-runtime-log-function-log-state-text-src-mq3-platform-win-net-runtime-ml-1997099972"></a>
### log

```ml
function log(state, text)
```

Updates `state.logs` in `mq3.platform.win_net_runtime.log`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.logs`. |
| `text` | `dynamic` | — | Input used by `state.logs=state.logs+[text]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L40)

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

Updates `state.socket`, `state.socksSocket`, `state.socksRelay`, `state.ipxSocket`, `state.usingSocks` in `mq3.platform.win_net_runtime.NET_Config`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.socket`, `state.socksSocket`, `state.socksRelay`, `state.ipxSocket`, `state.usingSocks`. |
| `enableNetworking` | `dynamic` | — | Value assigned to `state.networkingEnabled`. |
| `values` | `dynamic` | — | Record providing `values.noudp`, `values.noipx`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L225)

<a id="function-function-mq3-platform-win-net-runtime-net-errorstring-function-net-errorstring-code-src-mq3-platform-win-net-runtime-ml-60664639"></a>
### NET_ErrorString

```ml
function NET_ErrorString(code)
```

Returns `udp.errorName(code)` from `mq3.platform.win_net_runtime.NET_ErrorString`; earlier branches return `"WSWSAECONNABORTEDAEINTR"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — | Argument 1 supplied to `mq3.platform.udp.errorName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L44)

<a id="function-function-mq3-platform-win-net-runtime-net-getcvars-function-net-getcvars-state-values-src-mq3-platform-win-net-runtime-ml-1049822395"></a>
### NET_GetCvars

```ml
function NET_GetCvars(state, values)
```

Updates `state.cvars` in `mq3.platform.win_net_runtime.NET_GetCvars`; returns `modified`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.cvars`. |
| `values` | `dynamic` | — | Value forwarded as `right` to `mq3.platform.win_net_runtime.sameCvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L215)

<a id="function-function-mq3-platform-win-net-runtime-net-getlocaladdress-function-net-getlocaladdress-state-src-mq3-platform-win-net-runtime-ml-960952883"></a>
### NET_GetLocalAddress

```ml
function NET_GetLocalAddress(state)
```

Updates `state.localIPs` in `mq3.platform.win_net_runtime.NET_GetLocalAddress`; returns `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.localIPs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L186)

<a id="function-function-mq3-platform-win-net-runtime-net-init-function-net-init-state-values-src-mq3-platform-win-net-runtime-ml-1521167407"></a>
### NET_Init

```ml
function NET_Init(state, values)
```

Updates `state.initialized` in `mq3.platform.win_net_runtime.NET_Init`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.initialized`. |
| `values` | `dynamic` | — | Value forwarded as `values` to `mq3.platform.win_net_runtime.NET_Config`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L238)

<a id="function-function-mq3-platform-win-net-runtime-net-ipsocket-function-net-ipsocket-netinterface-port-src-mq3-platform-win-net-runtime-ml-1928242681"></a>
### NET_IPSocket

```ml
function NET_IPSocket(netInterface, port)
```

Computes `NET_IPSocket` from `udp.open()` using `mq3.platform.udp.open`, `mq3.platform.udp.setBroadcast`, `mq3.platform.udp.resolveIPv4`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `netInterface` | `dynamic` | — | Argument 1 supplied to `mq3.platform.udp.resolveIPv4`. |
| `port` | `dynamic` | — | Input used by `selected=port`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L169)

<a id="function-function-mq3-platform-win-net-runtime-net-ipxsocket-function-net-ipxsocket-port-src-mq3-platform-win-net-runtime-ml-2060133115"></a>
### NET_IPXSocket

```ml
function NET_IPXSocket(port)
```

Returns `void` for the `mq3.platform.win_net_runtime.NET_IPXSocket` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `port` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L201)

<a id="function-function-mq3-platform-win-net-runtime-net-openip-function-net-openip-state-src-mq3-platform-win-net-runtime-ml-978292713"></a>
### NET_OpenIP

```ml
function NET_OpenIP(state)
```

Updates `state.socket` in `mq3.platform.win_net_runtime.NET_OpenIP`; returns `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.socket`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L191)

<a id="function-function-mq3-platform-win-net-runtime-net-openipx-function-net-openipx-state-src-mq3-platform-win-net-runtime-ml-642515935"></a>
### NET_OpenIPX

```ml
function NET_OpenIPX(state)
```

Updates `state.ipxSocket` in `mq3.platform.win_net_runtime.NET_OpenIPX`; returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.ipxSocket`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L204)

<a id="function-function-mq3-platform-win-net-runtime-net-opensocks-function-net-opensocks-state-port-src-mq3-platform-win-net-runtime-ml-1294570330"></a>
### NET_OpenSocks

```ml
function NET_OpenSocks(state, port)
```

Updates `state.usingSocks`, `state.socksSocket`, `state.socksRelay` in `mq3.platform.win_net_runtime.NET_OpenSocks`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.usingSocks`, `state.socksSocket`, `state.socksRelay`. |
| `port` | `dynamic` | — | Input used by `opened=try(udp.openSocks5(state.cvars.socksServer,state.cvars.socksPort,state.cvars.socksUsername,state.cvars.socksPassword,local.port))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L177)

<a id="function-function-mq3-platform-win-net-runtime-net-restart-function-net-restart-state-src-mq3-platform-win-net-runtime-ml-1555724987"></a>
### NET_Restart

```ml
function NET_Restart(state)
```

Builds `values.generation` in `mq3.platform.win_net_runtime.NET_Restart`; returns `NET_Config(state,state.networkingEnabled,values)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.cvars`, `state.networkingEnabled`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L252)

<a id="function-function-mq3-platform-win-net-runtime-net-shutdown-function-net-shutdown-state-src-mq3-platform-win-net-runtime-ml-1561874605"></a>
### NET_Shutdown

```ml
function NET_Shutdown(state)
```

Updates `state.initialized` in `mq3.platform.win_net_runtime.NET_Shutdown`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.initialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L243)

<a id="function-function-mq3-platform-win-net-runtime-net-sleep-function-net-sleep-state-milliseconds-src-mq3-platform-win-net-runtime-ml-408991681"></a>
### NET_Sleep

```ml
function NET_Sleep(state, milliseconds)
```

Returns `udp.waitReadable(state.socket,milliseconds)` from `mq3.platform.win_net_runtime.NET_Sleep`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.socket`. |
| `milliseconds` | `dynamic` | — | Argument 2 supplied to `mq3.platform.udp.waitReadable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L249)

<a id="function-function-mq3-platform-win-net-runtime-netadrtosockadr-function-netadrtosockadr-address-src-mq3-platform-win-net-runtime-ml-1692384546"></a>
### NetadrToSockadr

```ml
function NetadrToSockadr(address)
```

Builds `mq3.platform.win_net_runtime.SockAddr` using `mq3.platform.udp.ipv4`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Record providing `address.type`, `address.port`, `address.ip`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L53)

- [mq3.platform.win_net_runtime.Packet](Type-mq3-platform-win-net-runtime-packet-1466680192.md) — struct
<a id="function-function-mq3-platform-win-net-runtime-parseipx-function-parseipx-text-src-mq3-platform-win-net-runtime-ml-2059096215"></a>
### parseIpx

```ml
function parseIpx(text)
```

Builds `mq3.platform.win_net_runtime.SockAddr` for `mq3.platform.win_net_runtime.parseIpx`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L77)

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

Compares all network/proxy configuration fields and their generation counter for restart decisions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Record providing `left.noudp`, `left.noipx`, `left.socksEnabled`, `left.socksServer`, `left.socksPort`, `left.socksUsername`. |
| `right` | `dynamic` | — | Record providing `right.noudp`, `right.noipx`, `right.socksEnabled`, `right.socksServer`, `right.socksPort`, `right.socksUsername`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L209)

<a id="function-function-mq3-platform-win-net-runtime-sameoctets-function-sameoctets-left-right-count-src-mq3-platform-win-net-runtime-ml-594216914"></a>
### sameOctets

```ml
function sameOctets(left, right, count)
```

Returns `true` from `mq3.platform.win_net_runtime.sameOctets`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Indexed input read at `index`. |
| `right` | `dynamic` | — | Indexed input read at `index`. |
| `count` | `dynamic` | — | Input tested by `len(left)<count or len(right)<count`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L138)

- [mq3.platform.win_net_runtime.SockAddr](Type-mq3-platform-win-net-runtime-sockaddr-1851892371.md) — struct
<a id="function-function-mq3-platform-win-net-runtime-sockadrtonetadr-function-sockadrtonetadr-address-src-mq3-platform-win-net-runtime-ml-872921322"></a>
### SockadrToNetadr

```ml
function SockadrToNetadr(address)
```

Computes `SockadrToNetadr` from `netchan.Address(NA_BAD,[],0)` using `mq3.qcommon.netchan.Address`, `mq3.platform.udp.octets`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Record providing `address.family`, `address.address`, `address.port`, `address.ipx`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L63)

<a id="function-function-mq3-platform-win-net-runtime-sys-getpacket-function-sys-getpacket-state-capacity-src-mq3-platform-win-net-runtime-ml-2089903893"></a>
### Sys_GetPacket

```ml
function Sys_GetPacket(state, capacity)
```

Builds `mq3.platform.win_net_runtime.Packet` after updating `state.recvfromCount`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.recvfromCount`. |
| `capacity` | `dynamic` | — | Argument 2 supplied to `mq3.platform.udp.receiveFrom`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L102)

<a id="function-function-mq3-platform-win-net-runtime-sys-islanaddress-function-sys-islanaddress-state-address-src-mq3-platform-win-net-runtime-ml-1158761447"></a>
### Sys_IsLANAddress

```ml
function Sys_IsLANAddress(state, address)
```

Recognizes loopback/IPX and local IPv4 network addresses using the stored local interfaces.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.localIPs`. |
| `address` | `dynamic` | — | Record providing `address.type`, `address.ip`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L144)

<a id="function-function-mq3-platform-win-net-runtime-sys-sendpacket-function-sys-sendpacket-state-length-data-target-src-mq3-platform-win-net-runtime-ml-1866967422"></a>
### Sys_SendPacket

```ml
function Sys_SendPacket(state, length, data, target)
```

Computes `Sys_SendPacket` from `udp.sendTo(state.socket,transport.addressToEndpoint(target),slice(data,0,length))` using `if`, `mq3.platform.udp.sendTo`, `mq3.qcommon.net_transport.addressToEndpoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.ipxSocket`, `state.socket`, `state.usingSocks`, `state.socksRelay`. |
| `length` | `dynamic` | — | Argument 3 supplied to `slice`. |
| `data` | `dynamic` | — | Argument 1 supplied to `slice`. |
| `target` | `dynamic` | — | Record providing `target.type`, `target.ip`, `target.port`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L122)

<a id="function-function-mq3-platform-win-net-runtime-sys-showip-function-sys-showip-state-src-mq3-platform-win-net-runtime-ml-1258005525"></a>
### Sys_ShowIP

```ml
function Sys_ShowIP(state)
```

Returns `output` from `mq3.platform.win_net_runtime.Sys_ShowIP`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.localIPs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L162)

<a id="function-function-mq3-platform-win-net-runtime-sys-stringtoadr-function-sys-stringtoadr-text-src-mq3-platform-win-net-runtime-ml-611659145"></a>
### Sys_StringToAdr

```ml
function Sys_StringToAdr(text)
```

Returns `SockadrToNetadr(value)` from `mq3.platform.win_net_runtime.Sys_StringToAdr`; earlier branches return `void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Value forwarded as `text` to `mq3.platform.win_net_runtime.Sys_StringToSockaddr`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L95)

<a id="function-function-mq3-platform-win-net-runtime-sys-stringtosockaddr-function-sys-stringtosockaddr-text-src-mq3-platform-win-net-runtime-ml-1925125635"></a>
### Sys_StringToSockaddr

```ml
function Sys_StringToSockaddr(text)
```

Builds `mq3.platform.win_net_runtime.SockAddr` using `mq3.platform.udp.resolveIPv4`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Value forwarded as `text` to `mq3.platform.win_net_runtime.parseIpx`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_net_runtime.ml#L88)
