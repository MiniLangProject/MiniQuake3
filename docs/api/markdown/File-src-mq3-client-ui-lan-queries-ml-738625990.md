# `src/mq3/client/ui_lan_queries.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_lan_queries`](Package-mq3-client-ui-lan-queries-1344785872.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/ui_lan_browser.ml` as `lan` → [src/mq3/client/ui_lan_browser.ml](File-src-mq3-client-ui-lan-browser-ml-1771171938.md)
- `mq3/client/ui_lan_ingress.ml` as `ingress` → [src/mq3/client/ui_lan_ingress.ml](File-src-mq3-client-ui-lan-ingress-ml-732601155.md)
- `mq3/qcommon/netchan.ml` as `netchan` → [src/mq3/qcommon/netchan.ml](File-src-mq3-qcommon-netchan-ml-1381353623.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-lan-queries-create-function-create-browser-ingressstate-host-src-mq3-client-ui-lan-queries-ml-1496417462"></a>
### create

```ml
function create(browser, ingressState, host)
```

Calls `mq3.client.ui_lan_queries.State` from UI LAN queries `create`. The final path returns `State(browser,ingressState,host,0,800,750,MASTER_SERVER_NAME,[])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `browser` | `dynamic` | — | Value used by `if browser==void or ingressState==void then return error(7700,"UI LAN queries: missing browser state") end if`. |
| `ingressState` | `dynamic` | — | Value used by `if browser==void or ingressState==void then return error(7700,"UI LAN queries: missing browser state") end if`. |
| `host` | `dynamic` | — | host record passed to the UI LAN queries helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L76)

<a id="function-function-mq3-client-ui-lan-queries-decimal-function-decimal-text-src-mq3-client-ui-lan-queries-ml-1689525901"></a>
### decimal

```ml
function decimal(text)
```

Evaluates UI LAN queries `decimal` and returns `-1`, `value` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `decimal` in the UI LAN queries path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L112)

<a id="function-function-mq3-client-ui-lan-queries-emit-function-emit-state-sock-address-text-src-mq3-client-ui-lan-queries-ml-892585452"></a>
### emit

```ml
function emit(state, sock, address, text)
```

Calls `mq3.client.ui_lan_queries.oob`, `state.services.sendFn` from UI LAN queries `emit`. The final path returns `packet`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.services`, `state.services.sendFn`, `state.services.context`. |
| `sock` | `dynamic` | — | Value used by `state.services.sendFn(state.services.context,sock,address,packet)`. |
| `address` | `dynamic` | — | Value used by `state.services.sendFn(state.services.context,sock,address,packet)`. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI LAN queries path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L105)

<a id="function-function-mq3-client-ui-lan-queries-expirepings-function-expirepings-state-src-mq3-client-ui-lan-queries-ml-1286576925"></a>
### expirePings

```ml
function expirePings(state)
```

Updates `state.ingress.pendingPings` during UI LAN queries `expirePings`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN queries record/storage; this routine assigns `state.ingress.pendingPings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L196)

<a id="function-function-mq3-client-ui-lan-queries-findstatusrequest-function-findstatusrequest-state-address-src-mq3-client-ui-lan-queries-ml-1415114263"></a>
### findStatusRequest

```ml
function findStatusRequest(state, address)
```

Calls `mq3.client.ui_lan_browser.canonicalAddress` from UI LAN queries `findStatusRequest`. The final path returns `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.statusRequests`. |
| `address` | `dynamic` | — | Value used by `wanted=lan.canonicalAddress(address)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L229)

<a id="function-function-mq3-client-ui-lan-queries-keywordtext-function-keywordtext-values-src-mq3-client-ui-lan-queries-ml-1281142326"></a>
### keywordText

```ml
function keywordText(values)
```

Evaluates UI LAN queries `keywordText` and returns `result` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Value used by `if values!=void then for each value in values if value!="" then result=result+" "+value end if end for end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L156)

<a id="constant-constant-mq3-client-ui-lan-queries-master-server-name-const-master-server-name-master-quake3arena-com-src-mq3-client-ui-lan-queries-ml-223029573"></a>
### MASTER_SERVER_NAME

```ml
const MASTER_SERVER_NAME = "master.quake3arena.com"
```

Default hostname of the master-server directory queried by the server browser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L25)

<a id="constant-constant-mq3-client-ui-lan-queries-max-pingrequests-const-max-pingrequests-32-src-mq3-client-ui-lan-queries-ml-296534558"></a>
### MAX_PINGREQUESTS

```ml
const MAX_PINGREQUESTS = 32
```

Capacity limit for the pingrequests collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L19)

<a id="constant-constant-mq3-client-ui-lan-queries-na-broadcast-const-na-broadcast-3-src-mq3-client-ui-lan-queries-ml-1921280590"></a>
### NA_BROADCAST

```ml
const NA_BROADCAST = 3
```

Network-address kind identifying a broadcast destination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L21)

<a id="constant-constant-mq3-client-ui-lan-queries-na-ip-const-na-ip-4-src-mq3-client-ui-lan-queries-ml-275970585"></a>
### NA_IP

```ml
const NA_IP = 4
```

Network-address kind identifying a ip destination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L23)

<a id="constant-constant-mq3-client-ui-lan-queries-num-server-ports-const-num-server-ports-4-src-mq3-client-ui-lan-queries-ml-1740598289"></a>
### NUM_SERVER_PORTS

```ml
const NUM_SERVER_PORTS = 4
```

Number of consecutive server ports scanned by the LAN discovery path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L17)

<a id="function-function-mq3-client-ui-lan-queries-numericaddress-function-numericaddress-text-defaultport-src-mq3-client-ui-lan-queries-ml-341690239"></a>
### numericAddress

```ml
function numericAddress(text, defaultPort)
```

Calls `std.string.split`, `mq3.client.ui_lan_queries.decimal`, `mq3.qcommon.netchan.Address` from UI LAN queries `numericAddress`. The final path returns `netchan.Address(NA_IP,ip,port)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `numericAddress` in the UI LAN queries path. |
| `defaultPort` | `dynamic` | — | Value used by `port=defaultPort`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L120)

<a id="function-function-mq3-client-ui-lan-queries-oob-function-oob-text-src-mq3-client-ui-lan-queries-ml-1462360235"></a>
### oob

```ml
function oob(text)
```

Computes `bytes([255,255,255,255])+bytes(text)` for UI LAN queries `oob`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `oob` in the UI LAN queries path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L99)

<a id="function-function-mq3-client-ui-lan-queries-pendingping-function-pendingping-state-address-src-mq3-client-ui-lan-queries-ml-1132884301"></a>
### pendingPing

```ml
function pendingPing(state, address)
```

Calls `mq3.client.ui_lan_browser.canonicalAddress` from UI LAN queries `pendingPing`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.ingress.pendingPings`. |
| `address` | `dynamic` | — | Value used by `wanted=lan.canonicalAddress(address)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L178)

<a id="constant-constant-mq3-client-ui-lan-queries-port-master-const-port-master-27950-src-mq3-client-ui-lan-queries-ml-779924736"></a>
### PORT_MASTER

```ml
const PORT_MASTER = 27950
```

Default UDP port used to contact the master-server directory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L13)

<a id="constant-constant-mq3-client-ui-lan-queries-port-server-const-port-server-27960-src-mq3-client-ui-lan-queries-ml-934386681"></a>
### PORT_SERVER

```ml
const PORT_SERVER = 27960
```

Default UDP port used by a Quake game server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L15)

<a id="function-function-mq3-client-ui-lan-queries-resetserverstatus-function-resetserverstatus-state-addresstext-src-mq3-client-ui-lan-queries-ml-1378935544"></a>
### resetServerStatus

```ml
function resetServerStatus(state, addressText)
```

Updates `state.statusRequests` during UI LAN queries `resetServerStatus`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN queries record/storage; this routine assigns `state.statusRequests`. |
| `addressText` | `dynamic` | — | Value used by `wanted=lan.canonicalAddress(addressText)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L257)

<a id="function-function-mq3-client-ui-lan-queries-resolve-function-resolve-state-text-defaultport-src-mq3-client-ui-lan-queries-ml-1455359652"></a>
### resolve

```ml
function resolve(state, text, defaultPort)
```

Calls `mq3.client.ui_lan_queries.numericAddress`, `std.string.split`, `mq3.client.ui_lan_queries.decimal` and additional helpers from UI LAN queries `resolve`. The final path returns `state.services.resolveFn(state.services.context,name,port)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.services`, `state.services.resolveFn`, `state.services.context`. |
| `text` | `dynamic` | — | Text consumed or emitted by `resolve` in the UI LAN queries path. |
| `defaultPort` | `dynamic` | — | Value used by `address=numericAddress(text,defaultPort)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L133)

<a id="function-function-mq3-client-ui-lan-queries-scanglobal-function-scanglobal-state-masternumber-protocol-keywords-restricted-src-mq3-client-ui-lan-queries-ml-1298249639"></a>
### scanGlobal

```ml
function scanGlobal(state, masterNumber, protocol, keywords, restricted)
```

CL_GlobalServers_f.  Master #1 fills the MPlayer-compatible catalog, while every other value fills the normal global catalog like Baseq3.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.masterHost`, `state.browser`, `state.ingress`. |
| `masterNumber` | `dynamic` | — | Value used by `if masterNumber==1 then source=lan.AS_MPLAYER end if`. |
| `protocol` | `dynamic` | — | Value used by `command="getservers "+protocol+keywordText(keywords)`. |
| `keywords` | `dynamic` | — | Value used by `command="getservers "+protocol+keywordText(keywords)`. |
| `restricted` | `dynamic` | — | Value used by `if restricted then command=command+" demo" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L167)

<a id="function-function-mq3-client-ui-lan-queries-scanlocal-function-scanlocal-state-src-mq3-client-ui-lan-queries-ml-107606353"></a>
### scanLocal

```ml
function scanLocal(state)
```

CL_LocalServers_f: two IPv4 broadcasts on each of the four consecutive server ports.  The legacy IPX duplicate has no counterpart in this port.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.browser`, `state.ingress`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L145)

<a id="function-function-mq3-client-ui-lan-queries-sendping-function-sendping-state-addresstext-src-mq3-client-ui-lan-queries-ml-563971464"></a>
### sendPing

```ml
function sendPing(state, addressText)
```

Calls `mq3.client.ui_lan_queries.resolve`, `mq3.client.ui_lan_ingress.addressText`, `mq3.client.ui_lan_queries.pendingPing` and additional helpers from UI LAN queries `sendPing`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.ingress`, `state.realtime`, `state.browser`. |
| `addressText` | `dynamic` | — | Value used by `address=resolve(state,addressText,PORT_SERVER)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L187)

<a id="function-function-mq3-client-ui-lan-queries-serverstatus-function-serverstatus-state-addresstext-src-mq3-client-ui-lan-queries-ml-469316800"></a>
### serverStatus

```ml
function serverStatus(state, addressText)
```

Stateful LAN_ServerStatus request/resend. A completed response is available through ui_lan_browser.serverStatus and is not retransmitted.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN queries record/storage; this routine assigns `state.statusRequests`. |
| `addressText` | `dynamic` | — | Value used by `current=lan.serverStatus(state.browser,addressText)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L241)

<a id="function-function-mq3-client-ui-lan-queries-services-function-services-src-mq3-client-ui-lan-queries-ml-1088801832"></a>
### services

```ml
function services()
```

Creates a `mq3.client.ui_lan_queries.Services` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L71)

- [mq3.client.ui_lan_queries.Services](Type-mq3-client-ui-lan-queries-services-145700406.md) — struct
<a id="function-function-mq3-client-ui-lan-queries-setmasterhost-function-setmasterhost-state-value-src-mq3-client-ui-lan-queries-ml-1412289442"></a>
### setMasterHost

```ml
function setMasterHost(state, value)
```

Updates `state.masterHost` during UI LAN queries `setMasterHost`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN queries record/storage; this routine assigns `state.masterHost`. |
| `value` | `dynamic` | — | Value assigned to `state.masterHost`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L95)

<a id="function-function-mq3-client-ui-lan-queries-setmaxping-function-setmaxping-state-value-src-mq3-client-ui-lan-queries-ml-1865436654"></a>
### setMaxPing

```ml
function setMaxPing(state, value)
```

Updates `state.maxPing` during UI LAN queries `setMaxPing`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN queries record/storage; this routine assigns `state.maxPing`. |
| `value` | `dynamic` | — | Value assigned to `state.maxPing`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L87)

<a id="function-function-mq3-client-ui-lan-queries-setrealtime-function-setrealtime-state-value-src-mq3-client-ui-lan-queries-ml-1640493672"></a>
### setRealtime

```ml
function setRealtime(state, value)
```

Updates `state.realtime` during UI LAN queries `setRealtime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN queries record/storage; this routine assigns `state.realtime`. |
| `value` | `dynamic` | — | Value assigned to `state.realtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L83)

<a id="function-function-mq3-client-ui-lan-queries-setstatusresendtime-function-setstatusresendtime-state-value-src-mq3-client-ui-lan-queries-ml-1533962926"></a>
### setStatusResendTime

```ml
function setStatusResendTime(state, value)
```

Updates `state.statusResendTime` during UI LAN queries `setStatusResendTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN queries record/storage; this routine assigns `state.statusResendTime`. |
| `value` | `dynamic` | — | Value assigned to `state.statusResendTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L91)

- [mq3.client.ui_lan_queries.State](Type-mq3-client-ui-lan-queries-state-2139392879.md) — struct
- [mq3.client.ui_lan_queries.StatusRequest](Type-mq3-client-ui-lan-queries-statusrequest-1612843357.md) — struct
<a id="function-function-mq3-client-ui-lan-queries-updatevisiblepings-function-updatevisiblepings-state-source-src-mq3-client-ui-lan-queries-ml-2067279524"></a>
### updateVisiblePings

```ml
function updateVisiblePings(state, source)
```

Schedule the visible unresolved servers just as CL_UpdateVisiblePings_f does. Completed replies are consumed by ui_lan_ingress.responseInfo.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.ingress`, `state.ingress.pendingPings`, `state.browser`. |
| `source` | `dynamic` | — | Value used by `if not lan.validSource(source) then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L211)
