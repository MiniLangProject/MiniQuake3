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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `browser` | `dynamic` | — |  |
| `ingressState` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L27)

<a id="function-function-mq3-client-ui-lan-queries-decimal-function-decimal-text-src-mq3-client-ui-lan-queries-ml-1689525901"></a>
### decimal

```ml
function decimal(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L42)

<a id="function-function-mq3-client-ui-lan-queries-emit-function-emit-state-sock-address-text-src-mq3-client-ui-lan-queries-ml-892585452"></a>
### emit

```ml
function emit(state, sock, address, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sock` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L37)

<a id="function-function-mq3-client-ui-lan-queries-expirepings-function-expirepings-state-src-mq3-client-ui-lan-queries-ml-1286576925"></a>
### expirePings

```ml
function expirePings(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L103)

<a id="function-function-mq3-client-ui-lan-queries-findstatusrequest-function-findstatusrequest-state-address-src-mq3-client-ui-lan-queries-ml-1415114263"></a>
### findStatusRequest

```ml
function findStatusRequest(state, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L131)

<a id="function-function-mq3-client-ui-lan-queries-keywordtext-function-keywordtext-values-src-mq3-client-ui-lan-queries-ml-1281142326"></a>
### keywordText

```ml
function keywordText(values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L76)

<a id="constant-constant-mq3-client-ui-lan-queries-master-server-name-const-master-server-name-master-quake3arena-com-src-mq3-client-ui-lan-queries-ml-223029573"></a>
### MASTER_SERVER_NAME

```ml
const MASTER_SERVER_NAME = "master.quake3arena.com"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L18)

<a id="constant-constant-mq3-client-ui-lan-queries-max-pingrequests-const-max-pingrequests-32-src-mq3-client-ui-lan-queries-ml-296534558"></a>
### MAX_PINGREQUESTS

```ml
const MAX_PINGREQUESTS = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L15)

<a id="constant-constant-mq3-client-ui-lan-queries-na-broadcast-const-na-broadcast-3-src-mq3-client-ui-lan-queries-ml-1921280590"></a>
### NA_BROADCAST

```ml
const NA_BROADCAST = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L16)

<a id="constant-constant-mq3-client-ui-lan-queries-na-ip-const-na-ip-4-src-mq3-client-ui-lan-queries-ml-275970585"></a>
### NA_IP

```ml
const NA_IP = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L17)

<a id="constant-constant-mq3-client-ui-lan-queries-num-server-ports-const-num-server-ports-4-src-mq3-client-ui-lan-queries-ml-1740598289"></a>
### NUM_SERVER_PORTS

```ml
const NUM_SERVER_PORTS = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L14)

<a id="function-function-mq3-client-ui-lan-queries-numericaddress-function-numericaddress-text-defaultport-src-mq3-client-ui-lan-queries-ml-341690239"></a>
### numericAddress

```ml
function numericAddress(text, defaultPort)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `defaultPort` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L47)

<a id="function-function-mq3-client-ui-lan-queries-oob-function-oob-text-src-mq3-client-ui-lan-queries-ml-1462360235"></a>
### oob

```ml
function oob(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L36)

<a id="function-function-mq3-client-ui-lan-queries-pendingping-function-pendingping-state-address-src-mq3-client-ui-lan-queries-ml-1132884301"></a>
### pendingPing

```ml
function pendingPing(state, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L90)

<a id="constant-constant-mq3-client-ui-lan-queries-port-master-const-port-master-27950-src-mq3-client-ui-lan-queries-ml-779924736"></a>
### PORT_MASTER

```ml
const PORT_MASTER = 27950
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L12)

<a id="constant-constant-mq3-client-ui-lan-queries-port-server-const-port-server-27960-src-mq3-client-ui-lan-queries-ml-934386681"></a>
### PORT_SERVER

```ml
const PORT_SERVER = 27960
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L13)

<a id="function-function-mq3-client-ui-lan-queries-resetserverstatus-function-resetserverstatus-state-addresstext-src-mq3-client-ui-lan-queries-ml-1378935544"></a>
### resetServerStatus

```ml
function resetServerStatus(state, addressText)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `addressText` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L154)

<a id="function-function-mq3-client-ui-lan-queries-resolve-function-resolve-state-text-defaultport-src-mq3-client-ui-lan-queries-ml-1455359652"></a>
### resolve

```ml
function resolve(state, text, defaultPort)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `defaultPort` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L56)

<a id="function-function-mq3-client-ui-lan-queries-scanglobal-function-scanglobal-state-masternumber-protocol-keywords-restricted-src-mq3-client-ui-lan-queries-ml-1298249639"></a>
### scanGlobal

```ml
function scanGlobal(state, masterNumber, protocol, keywords, restricted)
```

CL_GlobalServers_f.  Master #1 fills the MPlayer-compatible catalog, while every other value fills the normal global catalog like Baseq3.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `masterNumber` | `dynamic` | — |  |
| `protocol` | `dynamic` | — |  |
| `keywords` | `dynamic` | — |  |
| `restricted` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L82)

<a id="function-function-mq3-client-ui-lan-queries-scanlocal-function-scanlocal-state-src-mq3-client-ui-lan-queries-ml-107606353"></a>
### scanLocal

```ml
function scanLocal(state)
```

CL_LocalServers_f: two IPv4 broadcasts on each of the four consecutive server ports.  The legacy IPX duplicate has no counterpart in this port.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L67)

<a id="function-function-mq3-client-ui-lan-queries-sendping-function-sendping-state-addresstext-src-mq3-client-ui-lan-queries-ml-563971464"></a>
### sendPing

```ml
function sendPing(state, addressText)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `addressText` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L96)

<a id="function-function-mq3-client-ui-lan-queries-serverstatus-function-serverstatus-state-addresstext-src-mq3-client-ui-lan-queries-ml-469316800"></a>
### serverStatus

```ml
function serverStatus(state, addressText)
```

Stateful LAN_ServerStatus request/resend. A completed response is available through ui_lan_browser.serverStatus and is not retransmitted.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `addressText` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L141)

<a id="function-function-mq3-client-ui-lan-queries-services-function-services-src-mq3-client-ui-lan-queries-ml-1088801832"></a>
### services

```ml
function services()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L26)

- [mq3.client.ui_lan_queries.Services](Type-mq3-client-ui-lan-queries-services-145700406.md) — struct
<a id="function-function-mq3-client-ui-lan-queries-setmasterhost-function-setmasterhost-state-value-src-mq3-client-ui-lan-queries-ml-1412289442"></a>
### setMasterHost

```ml
function setMasterHost(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L34)

<a id="function-function-mq3-client-ui-lan-queries-setmaxping-function-setmaxping-state-value-src-mq3-client-ui-lan-queries-ml-1865436654"></a>
### setMaxPing

```ml
function setMaxPing(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L32)

<a id="function-function-mq3-client-ui-lan-queries-setrealtime-function-setrealtime-state-value-src-mq3-client-ui-lan-queries-ml-1640493672"></a>
### setRealtime

```ml
function setRealtime(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L31)

<a id="function-function-mq3-client-ui-lan-queries-setstatusresendtime-function-setstatusresendtime-state-value-src-mq3-client-ui-lan-queries-ml-1533962926"></a>
### setStatusResendTime

```ml
function setStatusResendTime(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L33)

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
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L116)
