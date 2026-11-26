# `src/mq3/client/ui_lan_ingress.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_lan_ingress`](Package-mq3-client-ui-lan-ingress-1753187407.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/connectionless.ml` as `connectionless` → [src/mq3/client/connectionless.ml](File-src-mq3-client-connectionless-ml-1561502254.md)
- `mq3/client/ui_lan_browser.ml` as `lan` → [src/mq3/client/ui_lan_browser.ml](File-src-mq3-client-ui-lan-browser-ml-1771171938.md)
- `mq3/compat/textnumbers.ml` as `textnumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-client-ui-lan-ingress-addresstext-function-addresstext-address-src-mq3-client-ui-lan-ingress-ml-315150758"></a>
### addressText

```ml
function addressText(address)
```

Evaluates UI LAN ingress `addressText` and returns `""`, `str(address.ip[0])+"."+str(address.ip[1])+"."+str(address.ip[2])+"."+str(address.ip[3])+":"+str(address.port)` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Record read through `address.ip`, `address.port`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L44)

<a id="function-function-mq3-client-ui-lan-ingress-attach-function-attach-host-state-src-mq3-client-ui-lan-ingress-ml-1121456179"></a>
### attach

```ml
function attach(host, state)
```

Updates `host.context`, `host.infoFn`, `host.statusFn`, `host.serversFn` during UI LAN ingress `attach`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Mutable UI LAN ingress record/storage; this routine assigns `host.context`, `host.infoFn`, `host.statusFn`, `host.serversFn`. |
| `state` | `dynamic` | — | Value assigned to `host.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L144)

<a id="function-function-mq3-client-ui-lan-ingress-consumependingping-function-consumependingping-state-address-src-mq3-client-ui-lan-ingress-ml-1664511513"></a>
### consumePendingPing

```ml
function consumePendingPing(state, address)
```

Updates `state.pendingPings` during UI LAN ingress `consumePendingPing`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN ingress record/storage; this routine assigns `state.pendingPings`. |
| `address` | `dynamic` | — | Value used by `wanted=lan.canonicalAddress(address)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L81)

<a id="function-function-mq3-client-ui-lan-ingress-consumependingstatus-function-consumependingstatus-state-address-src-mq3-client-ui-lan-ingress-ml-1058898541"></a>
### consumePendingStatus

```ml
function consumePendingStatus(state, address)
```

Updates `state.pendingStatuses` during UI LAN ingress `consumePendingStatus`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN ingress record/storage; this routine assigns `state.pendingStatuses`. |
| `address` | `dynamic` | — | Value used by `wanted=lan.canonicalAddress(address)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L73)

<a id="function-function-mq3-client-ui-lan-ingress-create-function-create-browser-src-mq3-client-ui-lan-ingress-ml-848564592"></a>
### create

```ml
function create(browser)
```

Calls `mq3.client.ui_lan_ingress.State` from UI LAN ingress `create`. The final path returns `State(browser,0,lan.AS_GLOBAL,0,[],[])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `browser` | `dynamic` | — | Value used by `if browser==void then return error(7698,"UI LAN ingress: missing browser") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L25)

<a id="constant-constant-mq3-client-ui-lan-ingress-max-serversperpacket-const-max-serversperpacket-256-src-mq3-client-ui-lan-ingress-ml-579689360"></a>
### MAX_SERVERSPERPACKET

```ml
const MAX_SERVERSPERPACKET = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L14)

<a id="constant-constant-mq3-client-ui-lan-ingress-na-broadcast-const-na-broadcast-3-src-mq3-client-ui-lan-ingress-ml-525213450"></a>
### NA_BROADCAST

```ml
const NA_BROADCAST = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L15)

<a id="constant-constant-mq3-client-ui-lan-ingress-na-ip-const-na-ip-4-src-mq3-client-ui-lan-ingress-ml-1037061389"></a>
### NA_IP

```ml
const NA_IP = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L16)

<a id="function-function-mq3-client-ui-lan-ingress-nettype-function-nettype-address-src-mq3-client-ui-lan-ingress-ml-101574086"></a>
### netType

```ml
function netType(address)
```

Evaluates UI LAN ingress `netType` and returns `1`, `0` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Record read through `address.type`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L54)

- [mq3.client.ui_lan_ingress.PendingPing](Type-mq3-client-ui-lan-ingress-pendingping-1181047978.md) — struct
<a id="constant-constant-mq3-client-ui-lan-ingress-protocol-version-const-protocol-version-68-src-mq3-client-ui-lan-ingress-ml-2012767741"></a>
### PROTOCOL_VERSION

```ml
const PROTOCOL_VERSION = 68
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L13)

<a id="function-function-mq3-client-ui-lan-ingress-requestping-function-requestping-state-address-start-src-mq3-client-ui-lan-ingress-ml-1944021099"></a>
### requestPing

```ml
function requestPing(state, address, start)
```

Updates `state.pendingPings` during UI LAN ingress `requestPing`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN ingress record/storage; this routine assigns `state.pendingPings`. |
| `address` | `dynamic` | — | Value used by `index=lan.queuePing(state.browser,address,0,"")`. |
| `start` | `dynamic` | — | Value used by `state.pendingPings=state.pendingPings+[PendingPing(address,start,index)]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L60)

<a id="function-function-mq3-client-ui-lan-ingress-requeststatus-function-requeststatus-state-address-src-mq3-client-ui-lan-ingress-ml-650603051"></a>
### requestStatus

```ml
function requestStatus(state, address)
```

Updates `state.pendingStatuses` during UI LAN ingress `requestStatus`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN ingress record/storage; this routine assigns `state.pendingStatuses`. |
| `address` | `dynamic` | — | Value used by `wanted=lan.canonicalAddress(address)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L66)

<a id="function-function-mq3-client-ui-lan-ingress-responseinfo-function-responseinfo-host-clientstate-source-msg-src-mq3-client-ui-lan-ingress-ml-731509406"></a>
### responseInfo

```ml
function responseInfo(host, clientState, source, msg)
```

Calls `mq3.qcommon.message.readCString`, `mq3.compat.textnumbers.atoi`, `mq3.shared.info.value` and additional helpers from UI LAN ingress `responseInfo`. The final path returns `lan.appendDiscovered(state.browser,lan.AS_LOCAL,address,source.type)>=0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.context`. |
| `clientState` | `dynamic` | — | Accepted for compatibility with `responseInfo`; the current implementation does not read it. |
| `source` | `dynamic` | — | Record read through `source.type`. |
| `msg` | `dynamic` | — | Value used by `text=message.readCString(msg)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L92)

<a id="function-function-mq3-client-ui-lan-ingress-responseservers-function-responseservers-host-clientstate-source-msg-src-mq3-client-ui-lan-ingress-ml-1850128060"></a>
### responseServers

```ml
function responseServers(host, clientState, source, msg)
```

Calls `mq3.client.ui_lan_browser.appendDiscovered` from UI LAN ingress `responseServers`. The final path returns `added`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.context`. |
| `clientState` | `dynamic` | — | Accepted for compatibility with `responseServers`; the current implementation does not read it. |
| `source` | `dynamic` | — | Accepted for compatibility with `responseServers`; the current implementation does not read it. |
| `msg` | `dynamic` | — | Record read through `msg.data`, `msg.cursize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L124)

<a id="function-function-mq3-client-ui-lan-ingress-responsestatus-function-responsestatus-host-clientstate-source-msg-src-mq3-client-ui-lan-ingress-ml-241680522"></a>
### responseStatus

```ml
function responseStatus(host, clientState, source, msg)
```

Calls `mq3.client.ui_lan_ingress.addressText`, `mq3.client.ui_lan_ingress.consumePendingStatus`, `mq3.qcommon.message.readCStringLine` and additional helpers from UI LAN ingress `responseStatus`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.context`. |
| `clientState` | `dynamic` | — | Accepted for compatibility with `responseStatus`; the current implementation does not read it. |
| `source` | `dynamic` | — | Value used by `address=addressText(source)`. |
| `msg` | `dynamic` | — | Value used by `text=message.readCStringLine(msg)+"\\\\"`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L111)

<a id="function-function-mq3-client-ui-lan-ingress-sameaddress-function-sameaddress-left-right-src-mq3-client-ui-lan-ingress-ml-1147340445"></a>
### sameAddress

```ml
function sameAddress(left, right)
```

Computes `lan.canonicalAddress(left)==lan.canonicalAddress(right)` for UI LAN ingress `sameAddress`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Value used by `return lan.canonicalAddress(left)==lan.canonicalAddress(right)`. |
| `right` | `dynamic` | — | Value used by `return lan.canonicalAddress(left)==lan.canonicalAddress(right)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L51)

<a id="function-function-mq3-client-ui-lan-ingress-services-function-services-state-src-mq3-client-ui-lan-ingress-ml-1682110597"></a>
### services

```ml
function services(state)
```

Adapts `mq3.client.ui_lan_ingress.attach` to UI LAN ingress `services`, returning its result for `connectionless.services(), state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 2 of `mq3.client.ui_lan_ingress.attach`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L150)

<a id="function-function-mq3-client-ui-lan-ingress-setmaster-function-setmaster-state-number-src-mq3-client-ui-lan-ingress-ml-1446023576"></a>
### setMaster

```ml
function setMaster(state, number)
```

Updates `state.masterNum` during UI LAN ingress `setMaster`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN ingress record/storage; this routine assigns `state.masterNum`. |
| `number` | `dynamic` | — | Value assigned to `state.masterNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L40)

<a id="function-function-mq3-client-ui-lan-ingress-setpingupdatesource-function-setpingupdatesource-state-source-src-mq3-client-ui-lan-ingress-ml-1957487736"></a>
### setPingUpdateSource

```ml
function setPingUpdateSource(state, source)
```

Updates `state.pingUpdateSource` during UI LAN ingress `setPingUpdateSource`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN ingress record/storage; this routine assigns `state.pingUpdateSource`. |
| `source` | `dynamic` | — | Value assigned to `state.pingUpdateSource`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L36)

<a id="function-function-mq3-client-ui-lan-ingress-setrealtime-function-setrealtime-state-value-src-mq3-client-ui-lan-ingress-ml-959716150"></a>
### setRealtime

```ml
function setRealtime(state, value)
```

Updates `state.realtime` during UI LAN ingress `setRealtime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN ingress record/storage; this routine assigns `state.realtime`. |
| `value` | `dynamic` | — | Value assigned to `state.realtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_ingress.ml#L32)

- [mq3.client.ui_lan_ingress.State](Type-mq3-client-ui-lan-ingress-state-390538724.md) — struct
