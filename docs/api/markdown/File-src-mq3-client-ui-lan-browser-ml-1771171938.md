# `src/mq3/client/ui_lan_browser.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_lan_browser`](Package-mq3-client-ui-lan-browser-257075656.md)

Reachable from entry: **yes**

## Imports

- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-lan-browser-add-function-add-state-source-name-address-src-mq3-client-ui-lan-browser-ml-1441442275"></a>
### add

```ml
function add(state, source, name, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L50)

<a id="function-function-mq3-client-ui-lan-browser-address-function-address-state-source-index-src-mq3-client-ui-lan-browser-ml-354410860"></a>
### address

```ml
function address(state, source, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L66)

<a id="function-function-mq3-client-ui-lan-browser-appenddiscovered-function-appenddiscovered-state-source-address-nettype-src-mq3-client-ui-lan-browser-ml-738932439"></a>
### appendDiscovered

```ml
function appendDiscovered(state, source, address, netType)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `netType` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L120)

<a id="function-function-mq3-client-ui-lan-browser-applyinfo-function-applyinfo-value-text-pingtime-src-mq3-client-ui-lan-browser-ml-1064513775"></a>
### applyInfo

```ml
function applyInfo(value, text, pingTime)
```

CL_SetServerInfo and CL_SetServerInfoByAddress.  The packet ingress keeps parsing separate from the catalog, while these helpers retain Baseq3's useful property that one reply updates the same address in every source.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `pingTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L102)

<a id="constant-constant-mq3-client-ui-lan-browser-as-favorites-const-as-favorites-3-src-mq3-client-ui-lan-browser-ml-2078959360"></a>
### AS_FAVORITES

```ml
const AS_FAVORITES = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L12)

<a id="constant-constant-mq3-client-ui-lan-browser-as-global-const-as-global-2-src-mq3-client-ui-lan-browser-ml-1844789695"></a>
### AS_GLOBAL

```ml
const AS_GLOBAL = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L11)

<a id="constant-constant-mq3-client-ui-lan-browser-as-local-const-as-local-0-src-mq3-client-ui-lan-browser-ml-1685236807"></a>
### AS_LOCAL

```ml
const AS_LOCAL = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L9)

<a id="constant-constant-mq3-client-ui-lan-browser-as-mplayer-const-as-mplayer-1-src-mq3-client-ui-lan-browser-ml-1766649624"></a>
### AS_MPLAYER

```ml
const AS_MPLAYER = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L10)

<a id="function-function-mq3-client-ui-lan-browser-at-function-at-state-source-index-src-mq3-client-ui-lan-browser-ml-1771207180"></a>
### at

```ml
function at(state, source, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L65)

<a id="function-function-mq3-client-ui-lan-browser-canonicaladdress-function-canonicaladdress-address-src-mq3-client-ui-lan-browser-ml-1358750228"></a>
### canonicalAddress

```ml
function canonicalAddress(address)
```

NET_CompareAdr compares the parsed address. For the UI-owned catalog the canonical case-insensitive text form gives stable duplicate behaviour until a network transport supplies a richer netadr_t value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L49)

<a id="function-function-mq3-client-ui-lan-browser-clearping-function-clearping-state-index-src-mq3-client-ui-lan-browser-ml-625344569"></a>
### clearPing

```ml
function clearPing(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L92)

<a id="function-function-mq3-client-ui-lan-browser-cloneserver-function-cloneserver-value-src-mq3-client-ui-lan-browser-ml-149528305"></a>
### cloneServer

```ml
function cloneServer(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L158)

<a id="function-function-mq3-client-ui-lan-browser-compare-function-compare-state-source-sortkey-sortdir-first-second-src-mq3-client-ui-lan-browser-ml-1297730594"></a>
### compare

```ml
function compare(state, source, sortKey, sortDir, first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `sortKey` | `dynamic` | — |  |
| `sortDir` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L169)

<a id="function-function-mq3-client-ui-lan-browser-comparenumber-function-comparenumber-left-right-src-mq3-client-ui-lan-browser-ml-1998077213"></a>
### compareNumber

```ml
function compareNumber(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L168)

<a id="function-function-mq3-client-ui-lan-browser-comparetext-function-comparetext-left-right-src-mq3-client-ui-lan-browser-ml-1360135361"></a>
### compareText

```ml
function compareText(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L163)

<a id="function-function-mq3-client-ui-lan-browser-completeping-function-completeping-state-index-time-text-src-mq3-client-ui-lan-browser-ml-207643817"></a>
### completePing

```ml
function completePing(state, index, time, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L129)

<a id="function-function-mq3-client-ui-lan-browser-copylist-function-copylist-values-src-mq3-client-ui-lan-browser-ml-1333005802"></a>
### copyList

```ml
function copyList(values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L159)

<a id="function-function-mq3-client-ui-lan-browser-count-function-count-state-source-src-mq3-client-ui-lan-browser-ml-1967735078"></a>
### count

```ml
function count(state, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L64)

<a id="function-function-mq3-client-ui-lan-browser-create-function-create-src-mq3-client-ui-lan-browser-ml-1159607720"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L25)

<a id="function-function-mq3-client-ui-lan-browser-findaddress-function-findaddress-state-source-address-src-mq3-client-ui-lan-browser-ml-583682922"></a>
### findAddress

```ml
function findAddress(state, source, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L124)

<a id="function-function-mq3-client-ui-lan-browser-getping-function-getping-state-index-src-mq3-client-ui-lan-browser-ml-1317512691"></a>
### getPing

```ml
function getPing(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L96)

<a id="function-function-mq3-client-ui-lan-browser-getpinginfo-function-getpinginfo-state-index-src-mq3-client-ui-lan-browser-ml-2145446535"></a>
### getPingInfo

```ml
function getPingInfo(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L97)

<a id="function-function-mq3-client-ui-lan-browser-isvisible-function-isvisible-state-source-index-src-mq3-client-ui-lan-browser-ml-1071210960"></a>
### isVisible

```ml
function isVisible(state, source, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L87)

<a id="function-function-mq3-client-ui-lan-browser-list-function-list-state-source-src-mq3-client-ui-lan-browser-ml-102505168"></a>
### list

```ml
function list(state, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L29)

<a id="function-function-mq3-client-ui-lan-browser-load-function-load-state-src-mq3-client-ui-lan-browser-ml-751885397"></a>
### load

```ml
function load(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L161)

<a id="function-function-mq3-client-ui-lan-browser-markvisible-function-markvisible-state-source-index-visible-src-mq3-client-ui-lan-browser-ml-1901509688"></a>
### markVisible

```ml
function markVisible(state, source, index, visible)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `visible` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L81)

<a id="constant-constant-mq3-client-ui-lan-browser-max-global-servers-const-max-global-servers-4096-src-mq3-client-ui-lan-browser-ml-334393828"></a>
### MAX_GLOBAL_SERVERS

```ml
const MAX_GLOBAL_SERVERS = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L14)

<a id="constant-constant-mq3-client-ui-lan-browser-max-other-servers-const-max-other-servers-128-src-mq3-client-ui-lan-browser-ml-1784532126"></a>
### MAX_OTHER_SERVERS

```ml
const MAX_OTHER_SERVERS = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L13)

<a id="function-function-mq3-client-ui-lan-browser-maximum-function-maximum-source-src-mq3-client-ui-lan-browser-ml-644950333"></a>
### maximum

```ml
function maximum(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L43)

<a id="function-function-mq3-client-ui-lan-browser-ping-function-ping-address-time-text-src-mq3-client-ui-lan-browser-ml-1909808234"></a>
### ping

```ml
function ping(address, time, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L27)

- [mq3.client.ui_lan_browser.Ping](Type-mq3-client-ui-lan-browser-ping-601544490.md) — struct
<a id="function-function-mq3-client-ui-lan-browser-pingcount-function-pingcount-state-src-mq3-client-ui-lan-browser-ml-1059203135"></a>
### pingCount

```ml
function pingCount(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L91)

<a id="function-function-mq3-client-ui-lan-browser-putinfo-function-putinfo-text-key-value-src-mq3-client-ui-lan-browser-ml-135323025"></a>
### putInfo

```ml
function putInfo(text, key, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L69)

<a id="function-function-mq3-client-ui-lan-browser-queueping-function-queueping-state-address-time-text-src-mq3-client-ui-lan-browser-ml-1370943203"></a>
### queuePing

```ml
function queuePing(state, address, time, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L90)

<a id="function-function-mq3-client-ui-lan-browser-remove-function-remove-state-source-address-src-mq3-client-ui-lan-browser-ml-1033172396"></a>
### remove

```ml
function remove(state, source, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L56)

<a id="function-function-mq3-client-ui-lan-browser-resetpings-function-resetpings-state-source-src-mq3-client-ui-lan-browser-ml-1057042944"></a>
### resetPings

```ml
function resetPings(state, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L88)

<a id="function-function-mq3-client-ui-lan-browser-save-function-save-state-src-mq3-client-ui-lan-browser-ml-1923534929"></a>
### save

```ml
function save(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L160)

<a id="function-function-mq3-client-ui-lan-browser-server-function-server-address-name-src-mq3-client-ui-lan-browser-ml-1564022899"></a>
### server

```ml
function server(address, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L26)

- [mq3.client.ui_lan_browser.Server](Type-mq3-client-ui-lan-browser-server-540404005.md) — struct
<a id="function-function-mq3-client-ui-lan-browser-serverinfo-function-serverinfo-state-source-index-src-mq3-client-ui-lan-browser-ml-550674008"></a>
### serverInfo

```ml
function serverInfo(state, source, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L72)

<a id="function-function-mq3-client-ui-lan-browser-serverping-function-serverping-state-source-index-src-mq3-client-ui-lan-browser-ml-179712864"></a>
### serverPing

```ml
function serverPing(state, source, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L67)

<a id="function-function-mq3-client-ui-lan-browser-serverstatus-function-serverstatus-state-address-src-mq3-client-ui-lan-browser-ml-1117081183"></a>
### serverStatus

```ml
function serverStatus(state, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L152)

<a id="function-function-mq3-client-ui-lan-browser-setinfobyaddress-function-setinfobyaddress-state-address-text-pingtime-src-mq3-client-ui-lan-browser-ml-1070468729"></a>
### setInfoByAddress

```ml
function setInfoByAddress(state, address, text, pingTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `pingTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L111)

<a id="function-function-mq3-client-ui-lan-browser-setlist-function-setlist-state-source-values-src-mq3-client-ui-lan-browser-ml-1906569722"></a>
### setList

```ml
function setList(state, source, values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L36)

<a id="function-function-mq3-client-ui-lan-browser-setstatusbyaddress-function-setstatusbyaddress-state-address-text-src-mq3-client-ui-lan-browser-ml-1603131616"></a>
### setStatusByAddress

```ml
function setStatusByAddress(state, address, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L133)

<a id="constant-constant-mq3-client-ui-lan-browser-sort-clients-const-sort-clients-2-src-mq3-client-ui-lan-browser-ml-1819184455"></a>
### SORT_CLIENTS

```ml
const SORT_CLIENTS = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L17)

<a id="constant-constant-mq3-client-ui-lan-browser-sort-game-const-sort-game-3-src-mq3-client-ui-lan-browser-ml-1515107406"></a>
### SORT_GAME

```ml
const SORT_GAME = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L18)

<a id="constant-constant-mq3-client-ui-lan-browser-sort-host-const-sort-host-0-src-mq3-client-ui-lan-browser-ml-1244616389"></a>
### SORT_HOST

```ml
const SORT_HOST = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L15)

<a id="constant-constant-mq3-client-ui-lan-browser-sort-map-const-sort-map-1-src-mq3-client-ui-lan-browser-ml-139004192"></a>
### SORT_MAP

```ml
const SORT_MAP = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L16)

<a id="constant-constant-mq3-client-ui-lan-browser-sort-ping-const-sort-ping-4-src-mq3-client-ui-lan-browser-ml-369899817"></a>
### SORT_PING

```ml
const SORT_PING = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L19)

- [mq3.client.ui_lan_browser.State](Type-mq3-client-ui-lan-browser-state-53623607.md) — struct
<a id="function-function-mq3-client-ui-lan-browser-updateserver-function-updateserver-state-source-index-mapname-clients-maxclients-pingtime-minping-maxping-game-gametype-nettype-punkbuster-status-src-mq3-client-ui-lan-browser-ml-321227874"></a>
### updateServer

```ml
function updateServer(state, source, index, mapName, clients, maxClients, pingTime, minPing, maxPing, game, gameType, netType, punkbuster, status)
```

A transport calls updateServer when an infoResponse arrives. Keeping this mutation here makes every LAN query see one coherent serverInfo_t analogue.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `clients` | `dynamic` | — |  |
| `maxClients` | `dynamic` | — |  |
| `pingTime` | `dynamic` | — |  |
| `minPing` | `dynamic` | — |  |
| `maxPing` | `dynamic` | — |  |
| `game` | `dynamic` | — |  |
| `gameType` | `dynamic` | — |  |
| `netType` | `dynamic` | — |  |
| `punkbuster` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L143)

<a id="function-function-mq3-client-ui-lan-browser-updatevisiblepings-function-updatevisiblepings-state-source-src-mq3-client-ui-lan-browser-ml-880824152"></a>
### updateVisiblePings

```ml
function updateVisiblePings(state, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L148)

<a id="function-function-mq3-client-ui-lan-browser-validsource-function-validsource-source-src-mq3-client-ui-lan-browser-ml-1723870859"></a>
### validSource

```ml
function validSource(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_browser.ml#L44)
