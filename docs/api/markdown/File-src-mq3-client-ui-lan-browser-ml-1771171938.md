# `src/mq3/client/ui_lan_browser.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_lan_browser`](Package-mq3-client-ui-lan-browser-257075656.md)

Reachable from entry: **yes**

## Imports

- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-lan-browser-add-function-add-state-source-name-address-src-mq3-client-ui-lan-browser-ml-1441442275"></a>
### add

```ml
function add(state, source, name, address)
```

Calls `mq3.client.ui_lan_browser.list`, `mq3.client.ui_lan_browser.maximum`, `mq3.client.ui_lan_browser.canonicalAddress` and additional helpers from UI LAN browser `add`. The final path returns `1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `add`. |
| `source` | `dynamic` | — | Value used by `values=list(state,source)`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI LAN browser resource. |
| `address` | `dynamic` | — | Value used by `wanted=canonicalAddress(address)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L150)

<a id="function-function-mq3-client-ui-lan-browser-address-function-address-state-source-index-src-mq3-client-ui-lan-browser-ml-354410860"></a>
### address

```ml
function address(state, source, index)
```

Calls `mq3.client.ui_lan_browser.at` from UI LAN browser `address`. The final path returns `value.address`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `address`. |
| `source` | `dynamic` | — | Value used by `value=at(state,source,index)`. |
| `index` | `dynamic` | — | Value used by `value=at(state,source,index)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L181)

<a id="function-function-mq3-client-ui-lan-browser-appenddiscovered-function-appenddiscovered-state-source-address-nettype-src-mq3-client-ui-lan-browser-ml-738932439"></a>
### appendDiscovered

```ml
function appendDiscovered(state, source, address, netType)
```

Calls `mq3.client.ui_lan_browser.list`, `mq3.client.ui_lan_browser.maximum`, `mq3.client.ui_lan_browser.server` and additional helpers from UI LAN browser `appendDiscovered`. The final path returns `len(values)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `appendDiscovered`. |
| `source` | `dynamic` | — | Value used by `values=list(state,source)`. |
| `address` | `dynamic` | — | Value used by `value=server(address,"")`. |
| `netType` | `dynamic` | — | Value assigned to `value.netType`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L288)

<a id="function-function-mq3-client-ui-lan-browser-applyinfo-function-applyinfo-value-text-pingtime-src-mq3-client-ui-lan-browser-ml-1064513775"></a>
### applyInfo

```ml
function applyInfo(value, text, pingTime)
```

CL_SetServerInfo and CL_SetServerInfoByAddress.  The packet ingress keeps parsing separate from the catalog, while these helpers retain Baseq3's useful property that one reply updates the same address in every source.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI LAN browser record/storage; this routine assigns `value.clients`, `value.hostName`, `value.mapName`, `value.maxClients` and additional values. |
| `text` | `dynamic` | — | Text consumed or emitted by `applyInfo` in the UI LAN browser path. |
| `pingTime` | `dynamic` | — | Value assigned to `value.ping`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L260)

<a id="constant-constant-mq3-client-ui-lan-browser-as-favorites-const-as-favorites-3-src-mq3-client-ui-lan-browser-ml-2078959360"></a>
### AS_FAVORITES

```ml
const AS_FAVORITES = 3
```

Server-browser source selector for the favorites server list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L16)

<a id="constant-constant-mq3-client-ui-lan-browser-as-global-const-as-global-2-src-mq3-client-ui-lan-browser-ml-1844789695"></a>
### AS_GLOBAL

```ml
const AS_GLOBAL = 2
```

Server-browser source selector for the global server list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L14)

<a id="constant-constant-mq3-client-ui-lan-browser-as-local-const-as-local-0-src-mq3-client-ui-lan-browser-ml-1685236807"></a>
### AS_LOCAL

```ml
const AS_LOCAL = 0
```

Server-browser source selector for the local server list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L10)

<a id="constant-constant-mq3-client-ui-lan-browser-as-mplayer-const-as-mplayer-1-src-mq3-client-ui-lan-browser-ml-1766649624"></a>
### AS_MPLAYER

```ml
const AS_MPLAYER = 1
```

Server-browser source selector for the mplayer server list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L12)

<a id="function-function-mq3-client-ui-lan-browser-at-function-at-state-source-index-src-mq3-client-ui-lan-browser-ml-1771207180"></a>
### at

```ml
function at(state, source, index)
```

Calls `mq3.client.ui_lan_browser.list` from UI LAN browser `at`. The final path returns `values[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `at`. |
| `source` | `dynamic` | — | Value used by `values=list(state,source)`. |
| `index` | `dynamic` | — | Value tested by `values==void or index<0 or index>=len(values)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L176)

<a id="function-function-mq3-client-ui-lan-browser-canonicaladdress-function-canonicaladdress-address-src-mq3-client-ui-lan-browser-ml-1358750228"></a>
### canonicalAddress

```ml
function canonicalAddress(address)
```

NET_CompareAdr compares the parsed address. For the UI-owned catalog the canonical case-insensitive text form gives stable duplicate behaviour until a network transport supplies a richer netadr_t value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Argument 1 of `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L144)

<a id="function-function-mq3-client-ui-lan-browser-clearping-function-clearping-state-index-src-mq3-client-ui-lan-browser-ml-625344569"></a>
### clearPing

```ml
function clearPing(state, index)
```

Updates `state.pings` during UI LAN browser `clearPing`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN browser record/storage; this routine assigns `state.pings`. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=len(state.pings)`, `cursor!=index` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L241)

<a id="function-function-mq3-client-ui-lan-browser-cloneserver-function-cloneserver-value-src-mq3-client-ui-lan-browser-ml-149528305"></a>
### cloneServer

```ml
function cloneServer(value)
```

Creates a `mq3.client.ui_lan_browser.Server` record.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.address`, `value.hostName`, `value.mapName`, `value.clients` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L361)

<a id="function-function-mq3-client-ui-lan-browser-compare-function-compare-state-source-sortkey-sortdir-first-second-src-mq3-client-ui-lan-browser-ml-1297730594"></a>
### compare

```ml
function compare(state, source, sortKey, sortDir, first, second)
```

Calls `mq3.client.ui_lan_browser.at`, `mq3.client.ui_lan_browser.compareText`, `mq3.client.ui_lan_browser.compareNumber` from UI LAN browser `compare`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `compare`. |
| `source` | `dynamic` | — | Value used by `a=at(state,source,first)`. |
| `sortKey` | `dynamic` | — | Value used by `if sortKey==SORT_HOST then result=compareText(a.hostName,b.hostName)`. |
| `sortDir` | `dynamic` | — | Value used by `if sortDir!=0 then return -result end if`. |
| `first` | `dynamic` | — | Value used by `a=at(state,source,first)`. |
| `second` | `dynamic` | — | Value used by `b=at(state,source,second)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L391)

<a id="function-function-mq3-client-ui-lan-browser-comparenumber-function-comparenumber-left-right-src-mq3-client-ui-lan-browser-ml-1998077213"></a>
### compareNumber

```ml
function compareNumber(left, right)
```

Evaluates UI LAN browser `compareNumber` and returns `-1`, `1`, `0` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Value used by `if left<right then return -1 end if`. |
| `right` | `dynamic` | — | Value used by `if left<right then return -1 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L383)

<a id="function-function-mq3-client-ui-lan-browser-comparetext-function-comparetext-left-right-src-mq3-client-ui-lan-browser-ml-1360135361"></a>
### compareText

```ml
function compareText(left, right)
```

Calls `std.string.toLowerAscii` from UI LAN browser `compareText`. The final path returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Value used by `a=bytes(strings.toLowerAscii(left))`. |
| `right` | `dynamic` | — | Value used by `b=bytes(strings.toLowerAscii(right))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L375)

<a id="function-function-mq3-client-ui-lan-browser-completeping-function-completeping-state-index-time-text-src-mq3-client-ui-lan-browser-ml-207643817"></a>
### completePing

```ml
function completePing(state, index, time, text)
```

Updates `state.pings[index].time`, `state.pings[index].info` during UI LAN browser `completePing`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN browser record/storage; this routine assigns `state.pings[index].time`, `state.pings[index].info`. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=len(state.pings)` before the calculation continues. |
| `time` | `dynamic` | — | Value used by `state.pings[index].time=time`. |
| `text` | `dynamic` | — | Text consumed or emitted by `completePing` in the UI LAN browser path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L306)

<a id="function-function-mq3-client-ui-lan-browser-copylist-function-copylist-values-src-mq3-client-ui-lan-browser-ml-1333005802"></a>
### copyList

```ml
function copyList(values)
```

Calls `mq3.client.ui_lan_browser.cloneServer` from UI LAN browser `copyList`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Value used by `for each value in values result=result+[cloneServer(value)] end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L364)

<a id="function-function-mq3-client-ui-lan-browser-count-function-count-state-source-src-mq3-client-ui-lan-browser-ml-1967735078"></a>
### count

```ml
function count(state, source)
```

Calls `mq3.client.ui_lan_browser.list` from UI LAN browser `count`. The final path returns `len(values)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `count`. |
| `source` | `dynamic` | — | Value used by `values=list(state,source)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L171)

<a id="function-function-mq3-client-ui-lan-browser-create-function-create-src-mq3-client-ui-lan-browser-ml-1159607720"></a>
### create

```ml
function create()
```

Creates a `mq3.client.ui_lan_browser.State` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L101)

<a id="function-function-mq3-client-ui-lan-browser-findaddress-function-findaddress-state-source-address-src-mq3-client-ui-lan-browser-ml-583682922"></a>
### findAddress

```ml
function findAddress(state, source, address)
```

Calls `mq3.client.ui_lan_browser.list`, `mq3.client.ui_lan_browser.canonicalAddress` from UI LAN browser `findAddress`. The final path returns `index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `findAddress`. |
| `source` | `dynamic` | — | Value used by `values=list(state,source)`. |
| `address` | `dynamic` | — | Value used by `wanted=canonicalAddress(address)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L296)

<a id="function-function-mq3-client-ui-lan-browser-getping-function-getping-state-index-src-mq3-client-ui-lan-browser-ml-1317512691"></a>
### getPing

```ml
function getPing(state, index)
```

Evaluates UI LAN browser `getPing` and returns `["",0]`, `[value.address,value.time]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.pings`. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=len(state.pings)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L248)

<a id="function-function-mq3-client-ui-lan-browser-getpinginfo-function-getpinginfo-state-index-src-mq3-client-ui-lan-browser-ml-2145446535"></a>
### getPingInfo

```ml
function getPingInfo(state, index)
```

Evaluates UI LAN browser `getPingInfo` and returns `""`, `state.pings[index].info` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.pings`. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=len(state.pings)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L252)

<a id="function-function-mq3-client-ui-lan-browser-isvisible-function-isvisible-state-source-index-src-mq3-client-ui-lan-browser-ml-1071210960"></a>
### isVisible

```ml
function isVisible(state, source, index)
```

Calls `mq3.client.ui_lan_browser.at` from UI LAN browser `isVisible`. The final path returns `value!=void and value.visible`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `isVisible`. |
| `source` | `dynamic` | — | Value used by `value=at(state,source,index)`. |
| `index` | `dynamic` | — | Value used by `value=at(state,source,index)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L223)

<a id="function-function-mq3-client-ui-lan-browser-list-function-list-state-source-src-mq3-client-ui-lan-browser-ml-102505168"></a>
### list

```ml
function list(state, source)
```

Evaluates UI LAN browser `list` and returns `state.local`, `state.mplayer`, `state.globalServers` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.local`, `state.mplayer`, `state.globalServers`, `state.favorites`. |
| `source` | `dynamic` | — | Value used by `if source==AS_LOCAL then return state.local end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L115)

<a id="function-function-mq3-client-ui-lan-browser-load-function-load-state-src-mq3-client-ui-lan-browser-ml-751885397"></a>
### load

```ml
function load(state)
```

Updates `state.globalServers`, `state.mplayer`, `state.favorites` during UI LAN browser `load`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN browser record/storage; this routine assigns `state.globalServers`, `state.mplayer`, `state.favorites`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L370)

<a id="function-function-mq3-client-ui-lan-browser-markvisible-function-markvisible-state-source-index-visible-src-mq3-client-ui-lan-browser-ml-1901509688"></a>
### markVisible

```ml
function markVisible(state, source, index, visible)
```

Calls `mq3.client.ui_lan_browser.list` from UI LAN browser `markVisible`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `markVisible`. |
| `source` | `dynamic` | — | Value used by `values=list(state,source)`. |
| `index` | `dynamic` | — | Value tested by `if index== -1`, `index>=0 and index<len(values)` before the calculation continues. |
| `visible` | `dynamic` | — | Value assigned to `item.visible`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L213)

<a id="constant-constant-mq3-client-ui-lan-browser-max-global-servers-const-max-global-servers-4096-src-mq3-client-ui-lan-browser-ml-334393828"></a>
### MAX_GLOBAL_SERVERS

```ml
const MAX_GLOBAL_SERVERS = 4096
```

Capacity limit for the global servers collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L20)

<a id="constant-constant-mq3-client-ui-lan-browser-max-other-servers-const-max-other-servers-128-src-mq3-client-ui-lan-browser-ml-1784532126"></a>
### MAX_OTHER_SERVERS

```ml
const MAX_OTHER_SERVERS = 128
```

Capacity limit for the other servers collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L18)

<a id="function-function-mq3-client-ui-lan-browser-maximum-function-maximum-source-src-mq3-client-ui-lan-browser-ml-644950333"></a>
### maximum

```ml
function maximum(source)
```

Evaluates UI LAN browser `maximum` and returns `MAX_GLOBAL_SERVERS`, `MAX_OTHER_SERVERS` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `if source==AS_GLOBAL then return MAX_GLOBAL_SERVERS end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L135)

<a id="function-function-mq3-client-ui-lan-browser-ping-function-ping-address-time-text-src-mq3-client-ui-lan-browser-ml-1909808234"></a>
### ping

```ml
function ping(address, time, text)
```

Creates a `mq3.client.ui_lan_browser.Ping` record. Assigns `address` from `address`, `time` from `time`, `info` from `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Value used to initialize `Ping.address`. |
| `time` | `dynamic` | — | Value used to initialize `Ping.time`. |
| `text` | `dynamic` | — | Value used to initialize `Ping.info`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L110)

- [mq3.client.ui_lan_browser.Ping](Type-mq3-client-ui-lan-browser-ping-601544490.md) — struct
<a id="function-function-mq3-client-ui-lan-browser-pingcount-function-pingcount-state-src-mq3-client-ui-lan-browser-ml-1059203135"></a>
### pingCount

```ml
function pingCount(state)
```

Returns the element/byte count of `state.pings` for UI LAN browser `pingCount`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.pings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L237)

<a id="function-function-mq3-client-ui-lan-browser-putinfo-function-putinfo-text-key-value-src-mq3-client-ui-lan-browser-ml-135323025"></a>
### putInfo

```ml
function putInfo(text, key, value)
```

Calls `mq3.shared.info.setValue` from UI LAN browser `putInfo`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `putInfo` in the UI LAN browser path. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI LAN browser entry. |
| `value` | `dynamic` | — | Value used by `result=info.setValue(text,key,value,void,void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L192)

<a id="function-function-mq3-client-ui-lan-browser-queueping-function-queueping-state-address-time-text-src-mq3-client-ui-lan-browser-ml-1370943203"></a>
### queuePing

```ml
function queuePing(state, address, time, text)
```

Updates `state.pings` during UI LAN browser `queuePing`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN browser record/storage; this routine assigns `state.pings`. |
| `address` | `dynamic` | — | Value used by `state.pings=state.pings+[Ping(address,time,text)]`. |
| `time` | `dynamic` | — | Value used by `state.pings=state.pings+[Ping(address,time,text)]`. |
| `text` | `dynamic` | — | Text consumed or emitted by `queuePing` in the UI LAN browser path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L234)

<a id="function-function-mq3-client-ui-lan-browser-remove-function-remove-state-source-address-src-mq3-client-ui-lan-browser-ml-1033172396"></a>
### remove

```ml
function remove(state, source, address)
```

Calls `mq3.client.ui_lan_browser.list`, `mq3.client.ui_lan_browser.canonicalAddress`, `mq3.client.ui_lan_browser.setList` from UI LAN browser `remove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `remove`. |
| `source` | `dynamic` | — | Value used by `values=list(state,source)`. |
| `address` | `dynamic` | — | Value used by `wanted=canonicalAddress(address)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L160)

<a id="function-function-mq3-client-ui-lan-browser-resetpings-function-resetpings-state-source-src-mq3-client-ui-lan-browser-ml-1057042944"></a>
### resetPings

```ml
function resetPings(state, source)
```

Calls `mq3.client.ui_lan_browser.list` from UI LAN browser `resetPings`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `resetPings`. |
| `source` | `dynamic` | — | Value used by `values=list(state,source)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L227)

<a id="function-function-mq3-client-ui-lan-browser-save-function-save-state-src-mq3-client-ui-lan-browser-ml-1923534929"></a>
### save

```ml
function save(state)
```

Updates `state.cachedGlobal`, `state.cachedMplayer`, `state.cachedFavorites` during UI LAN browser `save`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN browser record/storage; this routine assigns `state.cachedGlobal`, `state.cachedMplayer`, `state.cachedFavorites`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L367)

<a id="function-function-mq3-client-ui-lan-browser-server-function-server-address-name-src-mq3-client-ui-lan-browser-ml-1564022899"></a>
### server

```ml
function server(address, name)
```

Creates a `mq3.client.ui_lan_browser.Server` record. Assigns `address` from `address`, `hostName` from `name`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Value used to initialize `Server.address`. |
| `name` | `dynamic` | — | Value used to initialize `Server.hostName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L105)

- [mq3.client.ui_lan_browser.Server](Type-mq3-client-ui-lan-browser-server-540404005.md) — struct
<a id="function-function-mq3-client-ui-lan-browser-serverinfo-function-serverinfo-state-source-index-src-mq3-client-ui-lan-browser-ml-550674008"></a>
### serverInfo

```ml
function serverInfo(state, source, index)
```

Calls `mq3.client.ui_lan_browser.at`, `mq3.client.ui_lan_browser.putInfo` from UI LAN browser `serverInfo`. The final path returns `putInfo(result,"punkbuster",str(value.punkbuster))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `serverInfo`. |
| `source` | `dynamic` | — | Value used by `value=at(state,source,index)`. |
| `index` | `dynamic` | — | Value used by `value=at(state,source,index)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L199)

<a id="function-function-mq3-client-ui-lan-browser-serverping-function-serverping-state-source-index-src-mq3-client-ui-lan-browser-ml-179712864"></a>
### serverPing

```ml
function serverPing(state, source, index)
```

Calls `mq3.client.ui_lan_browser.at` from UI LAN browser `serverPing`. The final path returns `value.ping`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `serverPing`. |
| `source` | `dynamic` | — | Value used by `value=at(state,source,index)`. |
| `index` | `dynamic` | — | Value used by `value=at(state,source,index)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L186)

<a id="function-function-mq3-client-ui-lan-browser-serverstatus-function-serverstatus-state-address-src-mq3-client-ui-lan-browser-ml-1117081183"></a>
### serverStatus

```ml
function serverStatus(state, address)
```

Calls `mq3.client.ui_lan_browser.canonicalAddress`, `mq3.client.ui_lan_browser.list` from UI LAN browser `serverStatus`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `serverStatus`. |
| `address` | `dynamic` | — | Value used by `wanted=canonicalAddress(address)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L353)

<a id="function-function-mq3-client-ui-lan-browser-setinfobyaddress-function-setinfobyaddress-state-address-text-pingtime-src-mq3-client-ui-lan-browser-ml-1070468729"></a>
### setInfoByAddress

```ml
function setInfoByAddress(state, address, text, pingTime)
```

Calls `mq3.client.ui_lan_browser.canonicalAddress`, `mq3.client.ui_lan_browser.list`, `mq3.client.ui_lan_browser.applyInfo` from UI LAN browser `setInfoByAddress`. The final path returns `updated`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `setInfoByAddress`. |
| `address` | `dynamic` | — | Value used by `wanted=canonicalAddress(address)`. |
| `text` | `dynamic` | — | Text consumed or emitted by `setInfoByAddress` in the UI LAN browser path. |
| `pingTime` | `dynamic` | — | Value used by `if canonicalAddress(value.address)==wanted then if applyInfo(value,text,pingTime) then updated=updated+1 end if end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L274)

<a id="function-function-mq3-client-ui-lan-browser-setlist-function-setlist-state-source-values-src-mq3-client-ui-lan-browser-ml-1906569722"></a>
### setList

```ml
function setList(state, source, values)
```

Updates `state.local`, `state.mplayer`, `state.globalServers`, `state.favorites` during UI LAN browser `setList`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI LAN browser record/storage; this routine assigns `state.local`, `state.mplayer`, `state.globalServers`, `state.favorites`. |
| `source` | `dynamic` | — | Value used by `if source==AS_LOCAL then state.local=values`. |
| `values` | `dynamic` | — | Value assigned to `state.local`, `state.mplayer`, `state.globalServers`, `state.favorites`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L126)

<a id="function-function-mq3-client-ui-lan-browser-setstatusbyaddress-function-setstatusbyaddress-state-address-text-src-mq3-client-ui-lan-browser-ml-1603131616"></a>
### setStatusByAddress

```ml
function setStatusByAddress(state, address, text)
```

Calls `mq3.client.ui_lan_browser.canonicalAddress`, `mq3.client.ui_lan_browser.list` from UI LAN browser `setStatusByAddress`. The final path returns `updated`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `setStatusByAddress`. |
| `address` | `dynamic` | — | Value used by `wanted=canonicalAddress(address)`. |
| `text` | `dynamic` | — | Value assigned to `value.status`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L314)

<a id="constant-constant-mq3-client-ui-lan-browser-sort-clients-const-sort-clients-2-src-mq3-client-ui-lan-browser-ml-1819184455"></a>
### SORT_CLIENTS

```ml
const SORT_CLIENTS = 2
```

Server-browser sort key comparing the clients column.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L26)

<a id="constant-constant-mq3-client-ui-lan-browser-sort-game-const-sort-game-3-src-mq3-client-ui-lan-browser-ml-1515107406"></a>
### SORT_GAME

```ml
const SORT_GAME = 3
```

Server-browser sort key comparing the game column.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L28)

<a id="constant-constant-mq3-client-ui-lan-browser-sort-host-const-sort-host-0-src-mq3-client-ui-lan-browser-ml-1244616389"></a>
### SORT_HOST

```ml
const SORT_HOST = 0
```

Server-browser sort key comparing the host column.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L22)

<a id="constant-constant-mq3-client-ui-lan-browser-sort-map-const-sort-map-1-src-mq3-client-ui-lan-browser-ml-139004192"></a>
### SORT_MAP

```ml
const SORT_MAP = 1
```

Server-browser sort key comparing the map column.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L24)

<a id="constant-constant-mq3-client-ui-lan-browser-sort-ping-const-sort-ping-4-src-mq3-client-ui-lan-browser-ml-369899817"></a>
### SORT_PING

```ml
const SORT_PING = 4
```

Server-browser sort key comparing the ping column.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L30)

- [mq3.client.ui_lan_browser.State](Type-mq3-client-ui-lan-browser-state-53623607.md) — struct
<a id="function-function-mq3-client-ui-lan-browser-updateserver-function-updateserver-state-source-index-mapname-clients-maxclients-pingtime-minping-maxping-game-gametype-nettype-punkbuster-status-src-mq3-client-ui-lan-browser-ml-321227874"></a>
### updateServer

```ml
function updateServer(state, source, index, mapName, clients, maxClients, pingTime, minPing, maxPing, game, gameType, netType, punkbuster, status)
```

A transport calls updateServer when an infoResponse arrives. Keeping this mutation here makes every LAN query see one coherent serverInfo_t analogue.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `updateServer`. |
| `source` | `dynamic` | — | Value used by `value=at(state,source,index)`. |
| `index` | `dynamic` | — | Value used by `value=at(state,source,index)`. |
| `mapName` | `dynamic` | — | Map name used to select the level and its associated assets. |
| `clients` | `dynamic` | — | Value assigned to `value.clients`. |
| `maxClients` | `dynamic` | — | Value assigned to `value.maxClients`. |
| `pingTime` | `dynamic` | — | Value assigned to `value.ping`. |
| `minPing` | `dynamic` | — | Value assigned to `value.minPing`. |
| `maxPing` | `dynamic` | — | Value assigned to `value.maxPing`. |
| `game` | `dynamic` | — | Value assigned to `value.game`. |
| `gameType` | `dynamic` | — | Value assigned to `value.gameType`. |
| `netType` | `dynamic` | — | Value assigned to `value.netType`. |
| `punkbuster` | `dynamic` | — | Value assigned to `value.punkbuster`. |
| `status` | `dynamic` | — | Value assigned to `value.status`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L338)

<a id="function-function-mq3-client-ui-lan-browser-updatevisiblepings-function-updatevisiblepings-state-source-src-mq3-client-ui-lan-browser-ml-880824152"></a>
### updateVisiblePings

```ml
function updateVisiblePings(state, source)
```

Calls `mq3.client.ui_lan_browser.list` from UI LAN browser `updateVisiblePings`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI LAN browser state passed to the helper calls in `updateVisiblePings`. |
| `source` | `dynamic` | — | Value used by `values=list(state,source)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L346)

<a id="function-function-mq3-client-ui-lan-browser-validsource-function-validsource-source-src-mq3-client-ui-lan-browser-ml-1723870859"></a>
### validSource

```ml
function validSource(source)
```

Computes `source>=AS_LOCAL and source<=AS_FAVORITES` for UI LAN browser `validSource`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used by `return source>=AS_LOCAL and source<=AS_FAVORITES`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_browser.ml#L138)
