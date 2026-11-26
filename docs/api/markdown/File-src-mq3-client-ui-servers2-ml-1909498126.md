# `src/mq3/client/ui_servers2.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_servers2`](Package-mq3-client-ui-servers2-1009411802.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-servers2-action-function-action-actions-boundary-kind-name-text-number-retailactive-src-mq3-client-ui-servers2-ml-1820822039"></a>
### action

```ml
function action(actions, boundary, kind, name, text, number, retailActive)
```

Computes `actions+[HostAction(boundary,kind,name,text,number,not retailActive)]` for UI servers2 `action`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `actions` | `dynamic` | — | Value used by `return actions+[HostAction(boundary,kind,name,text,number,not retailActive)]`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI servers2 resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `action` in the UI servers2 path. |
| `number` | `dynamic` | — | Value used by `return actions+[HostAction(boundary,kind,name,text,number,not retailActive)]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L282)

<a id="function-function-mq3-client-ui-servers2-arenaserverscache-function-arenaserverscache-state-retailactive-src-mq3-client-ui-servers2-ml-1780968180"></a>
### arenaServersCache

```ml
function arenaServersCache(state, retailActive)
```

ArenaServers_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.assets`, `state.actions`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L876)

<a id="function-function-mq3-client-ui-servers2-arenaserverscompare-function-arenaserverscompare-left-right-sortkey-src-mq3-client-ui-servers2-ml-1546032782"></a>
### arenaServersCompare

```ml
function arenaServersCompare(left, right, sortKey)
```

ArenaServers_Compare

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Record read through `left.hostname`, `left.mapName`, `left.maxClients`, `left.numClients` and additional values. |
| `right` | `dynamic` | — | Record read through `right.hostname`, `right.mapName`, `right.maxClients`, `right.numClients` and additional values. |
| `sortKey` | `dynamic` | — | Value used by `if sortKey==SORT_HOST then return lowerCompare(left.hostname,right.hostname) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L385)

<a id="function-function-mq3-client-ui-servers2-arenaserversdorefresh-function-arenaserversdorefresh-state-realtime-servercount-pingqueuecount-pingresults-serveraddresses-maxping-retailactive-src-mq3-client-ui-servers2-ml-562878418"></a>
### arenaServersDoRefresh

```ml
function arenaServersDoRefresh(state, realtime, serverCount, pingQueueCount, pingResults, serverAddresses, maxPing, retailActive)
```

ArenaServers_DoRefresh

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.nextPingTime`, `state.pingRequests[request].address`, `state.actions`, `state.numQueried` and additional values. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |
| `serverCount` | `dynamic` | — | Value assigned to `state.numQueried`. |
| `pingQueueCount` | `dynamic` | — | Value used by `queued=pingQueueCount-cleared`. |
| `pingResults` | `dynamic` | — | Value used by `for each result in pingResults`. |
| `serverAddresses` | `dynamic` | — | Sequence read at `serverAddresses[state.currentPing]`. |
| `maxPing` | `dynamic` | — | Value used by `if elapsed<arenaServersMaxPing(maxPing) then continue end if end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L668)

<a id="function-function-mq3-client-ui-servers2-arenaserversevent-function-arenaserversevent-state-id-eventcode-value-realtime-protocol-debugprotocol-maxping-retailactive-src-mq3-client-ui-servers2-ml-2129695591"></a>
### arenaServersEvent

```ml
function arenaServersEvent(state, id, eventCode, value, realtime, protocol, debugProtocol, maxPing, retailActive)
```

ArenaServers_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.masterSelection`, `state.actions`, `state.gameFilter`, `state.showFull` and additional values. |
| `id` | `dynamic` | — | Value used by `if eventCode!=QM_ACTIVATED and id!=ID_LIST then return false end if`. |
| `eventCode` | `dynamic` | — | Quake III event identifier selecting the event handler. |
| `value` | `dynamic` | — | Value assigned to `state.masterSelection`, `state.gameFilter`, `state.showFull`, `state.showEmpty` and additional values. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |
| `protocol` | `dynamic` | — | Value used by `arenaServersSetType(state,source,realtime,protocol,debugProtocol,retailActive)`. |
| `debugProtocol` | `dynamic` | — | Value used by `arenaServersSetType(state,source,realtime,protocol,debugProtocol,retailActive)`. |
| `maxPing` | `dynamic` | — | Value used by `else if id==ID_BACK then arenaServersStopRefresh(state,maxPing)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L806)

<a id="function-function-mq3-client-ui-servers2-arenaserversgo-function-arenaserversgo-state-retailactive-src-mq3-client-ui-servers2-ml-1098927586"></a>
### arenaServersGo

```ml
function arenaServersGo(state, retailActive)
```

ArenaServers_Go

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.actions`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L448)

<a id="function-function-mq3-client-ui-servers2-arenaserversinsert-function-arenaserversinsert-state-address-infotext-pingtime-maxping-src-mq3-client-ui-servers2-ml-2129096813"></a>
### arenaServersInsert

```ml
function arenaServersInsert(state, address, infoText, pingTime, maxPing)
```

ArenaServers_Insert

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.servers[state.maxServers-1]`, `state.servers`. |
| `address` | `dynamic` | — | Value used by `value=node(truncate(address,63),hostname,mapName,clients,maxClients,pingTime,gameType,truncate(custom,11),netType,minPing,serverMaxPing,pb)`. |
| `infoText` | `dynamic` | — | Value used by `hostname=strings.toUpperAscii(truncate(cleanText(info.value(infoText,"hostname")),21))`. |
| `pingTime` | `dynamic` | — | Value used by `if pingTime>=arenaServersMaxPing(maxPing) and state.source!=AS_FAVORITES then return false end if`. |
| `maxPing` | `dynamic` | — | Value used by `if pingTime>=arenaServersMaxPing(maxPing) and state.source!=AS_FAVORITES then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L584)

<a id="function-function-mq3-client-ui-servers2-arenaserversinsertfavorites-function-arenaserversinsertfavorites-state-maxping-src-mq3-client-ui-servers2-ml-314415375"></a>
### arenaServersInsertFavorites

```ml
function arenaServersInsertFavorites(state, maxPing)
```

ArenaServers_InsertFavorites

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.favoriteAddresses`, `state.servers`. |
| `maxPing` | `dynamic` | — | Value used by `if not found then arenaServersInsert(state,address,"\\\\hostname\\\\No Response",arenaServersMaxPing(maxPing),maxPing) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L602)

<a id="function-function-mq3-client-ui-servers2-arenaserversloadfavorites-function-arenaserversloadfavorites-state-cvaraddresses-maxping-src-mq3-client-ui-servers2-ml-1129361413"></a>
### arenaServersLoadFavorites

```ml
function arenaServersLoadFavorites(state, cvarAddresses, maxPing)
```

ArenaServers_LoadFavorites

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.favoriteAddresses`, `state.favoriteServers`, `state.servers`. |
| `cvarAddresses` | `dynamic` | — | Sequence read at `cvarAddresses[i]`. |
| `maxPing` | `dynamic` | — | Value used by `if not matched then loaded=loaded+[emptyNode(address,arenaServersMaxPing(maxPing))] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L615)

<a id="function-function-mq3-client-ui-servers2-arenaserversmaxping-function-arenaserversmaxping-cvarvalue-src-mq3-client-ui-servers2-ml-1908645985"></a>
### arenaServersMaxPing

```ml
function arenaServersMaxPing(cvarValue)
```

ArenaServers_MaxPing

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cvarValue` | `dynamic` | — | Value used by `value=numeric.trunc32(cvarValue)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L375)

<a id="function-function-mq3-client-ui-servers2-arenaserversmenudraw-function-arenaserversmenudraw-state-realtime-servercount-pingqueuecount-pingresults-serveraddresses-maxping-retailactive-src-mq3-client-ui-servers2-ml-184790148"></a>
### arenaServersMenuDraw

```ml
function arenaServersMenuDraw(state, realtime, serverCount, pingQueueCount, pingResults, serverAddresses, maxPing, retailActive)
```

ArenaServers_MenuDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.actions`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |
| `serverCount` | `dynamic` | — | Value used by `if state.refreshing then arenaServersDoRefresh(state,realtime,serverCount,pingQueueCount,pingResults,serverAddresses,maxPing,retailActive) end if`. |
| `pingQueueCount` | `dynamic` | — | Value used by `if state.refreshing then arenaServersDoRefresh(state,realtime,serverCount,pingQueueCount,pingResults,serverAddresses,maxPing,retailActive) end if`. |
| `pingResults` | `dynamic` | — | Value used by `if state.refreshing then arenaServersDoRefresh(state,realtime,serverCount,pingQueueCount,pingResults,serverAddresses,maxPing,retailActive) end if`. |
| `serverAddresses` | `dynamic` | — | Value used by `if state.refreshing then arenaServersDoRefresh(state,realtime,serverCount,pingQueueCount,pingResults,serverAddresses,maxPing,retailActive) end if`. |
| `maxPing` | `dynamic` | — | Value used by `if state.refreshing then arenaServersDoRefresh(state,realtime,serverCount,pingQueueCount,pingResults,serverAddresses,maxPing,retailActive) end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L836)

<a id="function-function-mq3-client-ui-servers2-arenaserversmenuinit-function-arenaserversmenuinit-browsermaster-browsergametype-browsersortkey-browsershowfull-browsershowempty-punkbuster-cvarfavorites-maxping-realtime-protocol-debugprotocol-retailactive-src-mq3-client-ui-servers2-ml-1941462676"></a>
### arenaServersMenuInit

```ml
function arenaServersMenuInit(browserMaster, browserGameType, browserSortKey, browserShowFull, browserShowEmpty, punkbuster, cvarFavorites, maxPing, realtime, protocol, debugProtocol, retailActive)
```

ArenaServers_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `browserMaster` | `dynamic` | — | Value used by `type=clamp(browserMaster,0,3)`. |
| `browserGameType` | `dynamic` | — | Value used by `state.gameFilter=clamp(browserGameType,0,4)`. |
| `browserSortKey` | `dynamic` | — | Value used by `state.sortKey=clamp(browserSortKey,0,4)`. |
| `browserShowFull` | `dynamic` | — | Value used by `state.showFull=clamp(browserShowFull,0,1)!=0`. |
| `browserShowEmpty` | `dynamic` | — | Value used by `state.showEmpty=clamp(browserShowEmpty,0,1)!=0`. |
| `punkbuster` | `dynamic` | — | Value used by `state.punkbuster=clamp(punkbuster,0,1)!=0`. |
| `cvarFavorites` | `dynamic` | — | Value used by `arenaServersLoadFavorites(state,cvarFavorites,maxPing)`. |
| `maxPing` | `dynamic` | — | Value used by `arenaServersLoadFavorites(state,cvarFavorites,maxPing)`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |
| `protocol` | `dynamic` | — | Value used by `arenaServersSetType(state,type,realtime,protocol,debugProtocol,retailActive)`. |
| `debugProtocol` | `dynamic` | — | Value used by `arenaServersSetType(state,type,realtime,protocol,debugProtocol,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L895)

<a id="function-function-mq3-client-ui-servers2-arenaserversmenukey-function-arenaserversmenukey-state-key-listfocused-maxping-retailactive-src-mq3-client-ui-servers2-ml-1380261304"></a>
### arenaServersMenuKey

```ml
function arenaServersMenuKey(state, key, listFocused, maxPing, retailActive)
```

ArenaServers_MenuKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.refreshing`, `state.source`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI servers2 entry. |
| `listFocused` | `dynamic` | — | Value used by `if (key==K_DEL or key==K_KP_DEL) and state.source==AS_FAVORITES and listFocused then arenaServersRemove(state)`. |
| `maxPing` | `dynamic` | — | Value used by `if key==K_SPACE and state.refreshing then arenaServersStopRefresh(state,maxPing)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L847)

<a id="function-function-mq3-client-ui-servers2-arenaserversremove-function-arenaserversremove-state-src-mq3-client-ui-servers2-ml-1689987657"></a>
### arenaServersRemove

```ml
function arenaServersRemove(state)
```

ArenaServers_Remove

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.favoriteAddresses`, `state.servers`, `state.favoriteServers`, `state.numQueried` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L559)

<a id="function-function-mq3-client-ui-servers2-arenaserverssavechanges-function-arenaserverssavechanges-state-retailactive-src-mq3-client-ui-servers2-ml-1952029456"></a>
### arenaServersSaveChanges

```ml
function arenaServersSaveChanges(state, retailActive)
```

ArenaServers_SaveChanges

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.actions`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L743)

<a id="function-function-mq3-client-ui-servers2-arenaserverssettype-function-arenaserverssettype-state-type-realtime-protocol-debugprotocol-retailactive-src-mq3-client-ui-servers2-ml-844030102"></a>
### arenaServersSetType

```ml
function arenaServersSetType(state, type, realtime, protocol, debugProtocol, retailActive)
```

ArenaServers_SetType

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.source`, `state.removeVisible`, `state.currentPing`, `state.numQueried` and additional values. |
| `type` | `dynamic` | — | Value assigned to `state.source`, `state.removeVisible`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |
| `protocol` | `dynamic` | — | Value used by `if len(state.servers)==0 then arenaServersStartRefresh(state,realtime,protocol,debugProtocol,retailActive)`. |
| `debugProtocol` | `dynamic` | — | Value used by `if len(state.servers)==0 then arenaServersStartRefresh(state,realtime,protocol,debugProtocol,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L766)

<a id="function-function-mq3-client-ui-servers2-arenaserverssort-function-arenaserverssort-state-type-src-mq3-client-ui-servers2-ml-666948781"></a>
### arenaServersSort

```ml
function arenaServersSort(state, type)
```

ArenaServers_Sort

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.sortKey`. |
| `type` | `dynamic` | — | Value assigned to `state.sortKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L754)

<a id="function-function-mq3-client-ui-servers2-arenaserversstartrefresh-function-arenaserversstartrefresh-state-realtime-protocol-debugprotocol-retailactive-src-mq3-client-ui-servers2-ml-2058615060"></a>
### arenaServersStartRefresh

```ml
function arenaServersStartRefresh(state, realtime, protocol, debugProtocol, retailActive)
```

ArenaServers_StartRefresh

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.servers`, `state.pingRequests[i].address`, `state.actions`, `state.refreshing` and additional values. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |
| `protocol` | `dynamic` | — | Value used by `version=str(protocol)`. |
| `debugProtocol` | `dynamic` | — | Value used by `if debugProtocol!="" then version=debugProtocol end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L726)

<a id="function-function-mq3-client-ui-servers2-arenaserversstoprefresh-function-arenaserversstoprefresh-state-maxping-src-mq3-client-ui-servers2-ml-1642583153"></a>
### arenaServersStopRefresh

```ml
function arenaServersStopRefresh(state, maxPing)
```

ArenaServers_StopRefresh

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.refreshing`, `state.currentPing`, `state.numQueried`. |
| `maxPing` | `dynamic` | — | Value used by `if state.source==AS_FAVORITES then arenaServersInsertFavorites(state,maxPing) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L642)

<a id="function-function-mq3-client-ui-servers2-arenaserversupdatemenu-function-arenaserversupdatemenu-state-src-mq3-client-ui-servers2-ml-700036437"></a>
### arenaServersUpdateMenu

```ml
function arenaServersUpdateMenu(state)
```

ArenaServers_UpdateMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.status`, `state.statusBar`, `state.controlsGrayed`, `state.visibleIndices` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L523)

<a id="function-function-mq3-client-ui-servers2-arenaserversupdatepicture-function-arenaserversupdatepicture-state-src-mq3-client-ui-servers2-ml-668921621"></a>
### arenaServersUpdatePicture

```ml
function arenaServersUpdatePicture(state)
```

ArenaServers_UpdatePicture

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.mapPicture`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L457)

<a id="constant-constant-mq3-client-ui-servers2-as-favorites-const-as-favorites-3-src-mq3-client-ui-servers2-ml-381457278"></a>
### AS_FAVORITES

```ml
const AS_FAVORITES = 3
```

Server-browser source selector for the favorites server list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L67)

<a id="constant-constant-mq3-client-ui-servers2-as-global-const-as-global-2-src-mq3-client-ui-servers2-ml-1499733903"></a>
### AS_GLOBAL

```ml
const AS_GLOBAL = 2
```

Server-browser source selector for the global server list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L65)

<a id="constant-constant-mq3-client-ui-servers2-as-local-const-as-local-0-src-mq3-client-ui-servers2-ml-703530515"></a>
### AS_LOCAL

```ml
const AS_LOCAL = 0
```

Server-browser source selector for the local server list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L61)

<a id="constant-constant-mq3-client-ui-servers2-as-mplayer-const-as-mplayer-1-src-mq3-client-ui-servers2-ml-226340306"></a>
### AS_MPLAYER

```ml
const AS_MPLAYER = 1
```

Server-browser source selector for the mplayer server list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L63)

<a id="extern_function-extern-function-mq3-client-ui-servers2-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-client-ui-servers2-ml-900965594"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

Converts a NUL-terminated decimal C string to a signed 32-bit integer using the Windows C runtime. This binding is used by UI servers2.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — | NUL-terminated C string containing the decimal numeric text. |


**Returns:** The converted integer; a string with no initial numeric conversion yields zero.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L12)

<a id="function-function-mq3-client-ui-servers2-browserchoices-function-browserchoices-src-mq3-client-ui-servers2-ml-1993232450"></a>
### browserChoices

```ml
function browserChoices()
```

Builds the UI servers2 `browserChoices` sequence from `[ ChoiceList("Servers",["Local","Internet","Favorites"]), ChoiceList("Game Type",["All","Free For All","Team Deathmatch","Tournament","Capture the Flag"]), ChoiceList("Sort By",["Server Name","Map...`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L864)

<a id="function-function-mq3-client-ui-servers2-browseritems-function-browseritems-src-mq3-client-ui-servers2-ml-101462"></a>
### browserItems

```ml
function browserItems()
```

Calls `mq3.client.ui_servers2.item` from UI servers2 `browserItems`. The final path returns `items`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L855)

<a id="function-function-mq3-client-ui-servers2-browserstate-function-browserstate-src-mq3-client-ui-servers2-ml-1957098726"></a>
### browserState

```ml
function browserState()
```

Calls `mq3.client.ui_servers2.PingRequest`, `mq3.client.ui_servers2.BrowserState` from UI servers2 `browserState`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L311)

- [mq3.client.ui_servers2.BrowserState](Type-mq3-client-ui-servers2-browserstate-60939545.md) — struct
- [mq3.client.ui_servers2.ChoiceList](Type-mq3-client-ui-servers2-choicelist-1744423775.md) — struct
<a id="function-function-mq3-client-ui-servers2-chooseactive-function-chooseactive-state-src-mq3-client-ui-servers2-ml-1978014497"></a>
### chooseActive

```ml
function chooseActive(state)
```

Updates `state.servers`, `state.maxServers` during UI servers2 `chooseActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.servers`, `state.maxServers`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L437)

<a id="function-function-mq3-client-ui-servers2-clamp-function-clamp-value-low-high-src-mq3-client-ui-servers2-ml-504142455"></a>
### clamp

```ml
function clamp(value, low, high)
```

Clamps `value` to the inclusive bounds `low` and `high` for UI servers2.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<low`, `if value>high` before the calculation continues. |
| `low` | `dynamic` | — | Lower bound used for comparison or clamping. |
| `high` | `dynamic` | — | Upper bound used for comparison or clamping. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L329)

<a id="function-function-mq3-client-ui-servers2-cleantext-function-cleantext-text-src-mq3-client-ui-servers2-ml-1406148779"></a>
### cleanText

```ml
function cleanText(text)
```

Calls `std.string.substr` from UI servers2 `cleanText`. The final path returns `cleaned`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `cleanText` in the UI servers2 path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L347)

<a id="function-function-mq3-client-ui-servers2-emptynode-function-emptynode-address-pingtime-src-mq3-client-ui-servers2-ml-221421739"></a>
### emptyNode

```ml
function emptyNode(address, pingTime)
```

Adapts `mq3.client.ui_servers2.node` to UI servers2 `emptyNode`, returning its result for `address, "", "", 0, 0, pingTime, 0, "DM ", 0, 0, 0, false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Argument 1 of `mq3.client.ui_servers2.node`. |
| `pingTime` | `dynamic` | — | Argument 6 of `mq3.client.ui_servers2.node`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L306)

<a id="function-function-mq3-client-ui-servers2-findrequest-function-findrequest-state-address-src-mq3-client-ui-servers2-ml-1956715339"></a>
### findRequest

```ml
function findRequest(state, address)
```

Calls `std.string.equalsIgnoreCaseAscii` from UI servers2 `findRequest`. The final path returns `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.pingRequests`. |
| `address` | `dynamic` | — | Value used by `for i=0 to MAX_PINGREQUESTS-1 if strings.equalsIgnoreCaseAscii(state.pingRequests[i].address,address) then return i end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L654)

<a id="function-function-mq3-client-ui-servers2-formatrow-function-formatrow-server-src-mq3-client-ui-servers2-ml-1269978145"></a>
### formatRow

```ml
function formatRow(server)
```

Calls `mq3.client.ui_servers2.padRight`, `mq3.client.ui_servers2.padLeft`, `mq3.client.ui_servers2.netName` and additional helpers from UI servers2 `formatRow`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Record read through `server.punkbuster`, `server.hostname`, `server.mapName`, `server.numClients` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L516)

<a id="function-function-mq3-client-ui-servers2-gamematches-function-gamematches-filter-gametype-src-mq3-client-ui-servers2-ml-999806792"></a>
### gameMatches

```ml
function gameMatches(filter, gameType)
```

Evaluates UI servers2 `gameMatches` and returns `true`, `gameType==GT_FFA`, `gameType==GT_TEAM` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filter` | `dynamic` | — | Value used by `if filter==GAMES_ALL then return true end if`. |
| `gameType` | `dynamic` | — | Value used by `if filter==GAMES_FFA then return gameType==GT_FFA end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L487)

<a id="function-function-mq3-client-ui-servers2-gamename-function-gamename-value-src-mq3-client-ui-servers2-ml-819526333"></a>
### gameName

```ml
function gameName(value)
```

Evaluates UI servers2 `gameName` and returns `names[value]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `return names[value]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L573)

<a id="constant-constant-mq3-client-ui-servers2-games-all-const-games-all-0-src-mq3-client-ui-servers2-ml-1503086913"></a>
### GAMES_ALL

```ml
const GAMES_ALL = 0
```

Server-browser game-mode filter selecting all entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L79)

<a id="constant-constant-mq3-client-ui-servers2-games-ctf-const-games-ctf-4-src-mq3-client-ui-servers2-ml-1606132405"></a>
### GAMES_CTF

```ml
const GAMES_CTF = 4
```

Server-browser game-mode filter selecting ctf entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L87)

<a id="constant-constant-mq3-client-ui-servers2-games-ffa-const-games-ffa-1-src-mq3-client-ui-servers2-ml-1167018398"></a>
### GAMES_FFA

```ml
const GAMES_FFA = 1
```

Server-browser game-mode filter selecting ffa entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L81)

<a id="constant-constant-mq3-client-ui-servers2-games-teamplay-const-games-teamplay-2-src-mq3-client-ui-servers2-ml-809562343"></a>
### GAMES_TEAMPLAY

```ml
const GAMES_TEAMPLAY = 2
```

Server-browser game-mode filter selecting teamplay entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L83)

<a id="constant-constant-mq3-client-ui-servers2-games-tourney-const-games-tourney-3-src-mq3-client-ui-servers2-ml-464039152"></a>
### GAMES_TOURNEY

```ml
const GAMES_TOURNEY = 3
```

Server-browser game-mode filter selecting tourney entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L85)

<a id="constant-constant-mq3-client-ui-servers2-gt-ctf-const-gt-ctf-4-src-mq3-client-ui-servers2-ml-563311757"></a>
### GT_CTF

```ml
const GT_CTF = 4
```

Native game-type value for capture the flag, used when filtering and labeling server-browser entries by game mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L98)

<a id="constant-constant-mq3-client-ui-servers2-gt-ffa-const-gt-ffa-0-src-mq3-client-ui-servers2-ml-1842504489"></a>
### GT_FFA

```ml
const GT_FFA = 0
```

Native game-type identifier selecting free-for-all deathmatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L89)

<a id="constant-constant-mq3-client-ui-servers2-gt-team-const-gt-team-3-src-mq3-client-ui-servers2-ml-26586636"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```

Native game-type value for team deathmatch, used when filtering and labeling server-browser entries by game mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L95)

<a id="constant-constant-mq3-client-ui-servers2-gt-tournament-const-gt-tournament-1-src-mq3-client-ui-servers2-ml-667939906"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```

Native game-type value for one-on-one tournament play, used when filtering and labeling server-browser entries by game mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L92)

- [mq3.client.ui_servers2.HostAction](Type-mq3-client-ui-servers2-hostaction-1159759876.md) — struct
<a id="constant-constant-mq3-client-ui-servers2-id-back-const-id-back-18-src-mq3-client-ui-servers2-ml-1725618316"></a>
### ID_BACK

```ml
const ID_BACK = 18
```

Event identifier of the Back control used to leave the base-game server browser and return to its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L47)

<a id="constant-constant-mq3-client-ui-servers2-id-connect-const-id-connect-22-src-mq3-client-ui-servers2-ml-1448512935"></a>
### ID_CONNECT

```ml
const ID_CONNECT = 22
```

Menu control identifier routed to the connect action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L55)

<a id="constant-constant-mq3-client-ui-servers2-id-create-const-id-create-21-src-mq3-client-ui-servers2-ml-1029961612"></a>
### ID_CREATE

```ml
const ID_CREATE = 21
```

Menu control identifier routed to the create action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L53)

<a id="constant-constant-mq3-client-ui-servers2-id-gametype-const-id-gametype-11-src-mq3-client-ui-servers2-ml-2094504351"></a>
### ID_GAMETYPE

```ml
const ID_GAMETYPE = 11
```

Menu control identifier routed to the gametype action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L32)

<a id="constant-constant-mq3-client-ui-servers2-id-list-const-id-list-15-src-mq3-client-ui-servers2-ml-481587751"></a>
### ID_LIST

```ml
const ID_LIST = 15
```

Menu control identifier routed to the list action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L40)

<a id="constant-constant-mq3-client-ui-servers2-id-master-const-id-master-10-src-mq3-client-ui-servers2-ml-1640488044"></a>
### ID_MASTER

```ml
const ID_MASTER = 10
```

Menu control identifier routed to the master action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L30)

<a id="constant-constant-mq3-client-ui-servers2-id-punkbuster-const-id-punkbuster-24-src-mq3-client-ui-servers2-ml-276577699"></a>
### ID_PUNKBUSTER

```ml
const ID_PUNKBUSTER = 24
```

Menu control identifier routed to the punkbuster action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L59)

<a id="constant-constant-mq3-client-ui-servers2-id-refresh-const-id-refresh-19-src-mq3-client-ui-servers2-ml-1588050319"></a>
### ID_REFRESH

```ml
const ID_REFRESH = 19
```

Menu control identifier routed to the refresh action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L49)

<a id="constant-constant-mq3-client-ui-servers2-id-remove-const-id-remove-23-src-mq3-client-ui-servers2-ml-1382996874"></a>
### ID_REMOVE

```ml
const ID_REMOVE = 23
```

Menu control identifier routed to the remove action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L57)

<a id="constant-constant-mq3-client-ui-servers2-id-scroll-down-const-id-scroll-down-17-src-mq3-client-ui-servers2-ml-1962466395"></a>
### ID_SCROLL_DOWN

```ml
const ID_SCROLL_DOWN = 17
```

Menu control identifier routed to the scroll down action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L44)

<a id="constant-constant-mq3-client-ui-servers2-id-scroll-up-const-id-scroll-up-16-src-mq3-client-ui-servers2-ml-1062996686"></a>
### ID_SCROLL_UP

```ml
const ID_SCROLL_UP = 16
```

Menu control identifier routed to the scroll up action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L42)

<a id="constant-constant-mq3-client-ui-servers2-id-show-empty-const-id-show-empty-14-src-mq3-client-ui-servers2-ml-101366512"></a>
### ID_SHOW_EMPTY

```ml
const ID_SHOW_EMPTY = 14
```

Menu control identifier routed to the show empty action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L38)

<a id="constant-constant-mq3-client-ui-servers2-id-show-full-const-id-show-full-13-src-mq3-client-ui-servers2-ml-1672129317"></a>
### ID_SHOW_FULL

```ml
const ID_SHOW_FULL = 13
```

Menu control identifier routed to the show full action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L36)

<a id="constant-constant-mq3-client-ui-servers2-id-sortkey-const-id-sortkey-12-src-mq3-client-ui-servers2-ml-1057447554"></a>
### ID_SORTKEY

```ml
const ID_SORTKEY = 12
```

Menu control identifier routed to the sortkey action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L34)

<a id="constant-constant-mq3-client-ui-servers2-id-specify-const-id-specify-20-src-mq3-client-ui-servers2-ml-659364303"></a>
### ID_SPECIFY

```ml
const ID_SPECIFY = 20
```

Menu control identifier routed to the specify action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L51)

<a id="function-function-mq3-client-ui-servers2-item-function-item-id-kind-name-x-y-src-mq3-client-ui-servers2-ml-1117525151"></a>
### item

```ml
function item(id, kind, name, x, y)
```

Creates a `mq3.client.ui_servers2.Item` record. Assigns `id` from `id`, `kind` from `kind`, `name` from `name`, `x` from `x`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — | Value used to initialize `Item.id`. |
| `kind` | `dynamic` | — | Value used to initialize `Item.kind`. |
| `name` | `dynamic` | — | Value used to initialize `Item.name`. |
| `x` | `dynamic` | — | Value used to initialize `Item.x`. |
| `y` | `dynamic` | — | Value used to initialize `Item.y`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L323)

- [mq3.client.ui_servers2.Item](Type-mq3-client-ui-servers2-item-1844667635.md) — struct
<a id="constant-constant-mq3-client-ui-servers2-k-del-const-k-del-140-src-mq3-client-ui-servers2-ml-1088957654"></a>
### K_DEL

```ml
const K_DEL = 140
```

Engine key code for the del input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L104)

<a id="constant-constant-mq3-client-ui-servers2-k-escape-const-k-escape-27-src-mq3-client-ui-servers2-ml-36312918"></a>
### K_ESCAPE

```ml
const K_ESCAPE = 27
```

Engine key code for the escape input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L100)

<a id="constant-constant-mq3-client-ui-servers2-k-kp-del-const-k-kp-del-171-src-mq3-client-ui-servers2-ml-1063453438"></a>
### K_KP_DEL

```ml
const K_KP_DEL = 171
```

Engine key code for the kp del input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L106)

<a id="constant-constant-mq3-client-ui-servers2-k-mouse2-const-k-mouse2-179-src-mq3-client-ui-servers2-ml-489052442"></a>
### K_MOUSE2

```ml
const K_MOUSE2 = 179
```

Engine key code for the mouse2 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L108)

<a id="constant-constant-mq3-client-ui-servers2-k-space-const-k-space-32-src-mq3-client-ui-servers2-ml-1830437744"></a>
### K_SPACE

```ml
const K_SPACE = 32
```

Engine key code for the space input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L102)

<a id="function-function-mq3-client-ui-servers2-lowercompare-function-lowercompare-lefttext-righttext-src-mq3-client-ui-servers2-ml-2037833843"></a>
### lowerCompare

```ml
function lowerCompare(leftText, rightText)
```

Calls `std.string.toLowerAscii` from UI servers2 `lowerCompare`. The final path returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `leftText` | `dynamic` | — | Value used by `left=bytes(strings.toLowerAscii(leftText))`. |
| `rightText` | `dynamic` | — | Value used by `right=bytes(strings.toLowerAscii(rightText))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L359)

<a id="constant-constant-mq3-client-ui-servers2-max-favoriteservers-const-max-favoriteservers-16-src-mq3-client-ui-servers2-ml-1322300510"></a>
### MAX_FAVORITESERVERS

```ml
const MAX_FAVORITESERVERS = 16
```

Capacity limit for the favoriteservers collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L19)

<a id="constant-constant-mq3-client-ui-servers2-max-globalservers-const-max-globalservers-128-src-mq3-client-ui-servers2-ml-1734002608"></a>
### MAX_GLOBALSERVERS

```ml
const MAX_GLOBALSERVERS = 128
```

Capacity limit for the globalservers collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L15)

<a id="constant-constant-mq3-client-ui-servers2-max-listboxitems-const-max-listboxitems-128-src-mq3-client-ui-servers2-ml-1017790634"></a>
### MAX_LISTBOXITEMS

```ml
const MAX_LISTBOXITEMS = 128
```

Capacity limit for the listboxitems collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L21)

<a id="constant-constant-mq3-client-ui-servers2-max-localservers-const-max-localservers-128-src-mq3-client-ui-servers2-ml-85725114"></a>
### MAX_LOCALSERVERS

```ml
const MAX_LOCALSERVERS = 128
```

Capacity limit for the localservers collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L23)

<a id="constant-constant-mq3-client-ui-servers2-max-pingrequests-const-max-pingrequests-32-src-mq3-client-ui-servers2-ml-361414540"></a>
### MAX_PINGREQUESTS

```ml
const MAX_PINGREQUESTS = 32
```

Capacity limit for the pingrequests collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L17)

<a id="function-function-mq3-client-ui-servers2-netname-function-netname-value-src-mq3-client-ui-servers2-ml-265666393"></a>
### netName

```ml
function netName(value)
```

Maps the server network type to its UDP/IPX label, using ??? for unsupported types.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value==1`, `if value==2` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L508)

<a id="function-function-mq3-client-ui-servers2-node-function-node-address-hostname-mapname-numclients-maxclients-pingtime-gametype-gamename-nettype-minping-maxping-punkbuster-src-mq3-client-ui-servers2-ml-755600300"></a>
### node

```ml
function node(address, hostname, mapName, numClients, maxClients, pingTime, gameType, gameName, netType, minPing, maxPing, punkbuster)
```

Creates a `mq3.client.ui_servers2.ServerNode` record. Assigns `address` from `address`, `hostname` from `hostname`, `mapName` from `mapName`, `numClients` from `numClients`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Value used to initialize `ServerNode.address`. |
| `hostname` | `dynamic` | — | Value used to initialize `ServerNode.hostname`. |
| `mapName` | `dynamic` | — | Value used to initialize `ServerNode.mapName`. |
| `numClients` | `dynamic` | — | Value used to initialize `ServerNode.numClients`. |
| `maxClients` | `dynamic` | — | Value used to initialize `ServerNode.maxClients`. |
| `pingTime` | `dynamic` | — | Value used to initialize `ServerNode.pingTime`. |
| `gameType` | `dynamic` | — | Value used to initialize `ServerNode.gameType`. |
| `gameName` | `dynamic` | — | Value used to initialize `ServerNode.gameName`. |
| `netType` | `dynamic` | — | Value used to initialize `ServerNode.netType`. |
| `minPing` | `dynamic` | — | Value used to initialize `ServerNode.minPing`. |
| `maxPing` | `dynamic` | — | Value used to initialize `ServerNode.maxPing`. |
| `punkbuster` | `dynamic` | — | Value used to initialize `ServerNode.punkbuster`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L299)

<a id="function-function-mq3-client-ui-servers2-padleft-function-padleft-value-width-src-mq3-client-ui-servers2-ml-55960487"></a>
### padLeft

```ml
function padLeft(value, width)
```

Evaluates UI servers2 `padLeft` and returns `text` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `text=str(value)`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `padLeft`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L478)

<a id="function-function-mq3-client-ui-servers2-padright-function-padright-text-width-src-mq3-client-ui-servers2-ml-1116989761"></a>
### padRight

```ml
function padRight(text, width)
```

Calls `mq3.client.ui_servers2.truncate` from UI servers2 `padRight`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `padRight` in the UI servers2 path. |
| `width` | `dynamic` | — | Width in the coordinate space used by `padRight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L469)

<a id="function-function-mq3-client-ui-servers2-pingcolor-function-pingcolor-server-src-mq3-client-ui-servers2-ml-1309025601"></a>
### pingColor

```ml
function pingColor(server)
```

Evaluates UI servers2 `pingColor` and returns `"^4"`, `"^2"`, `"^3"` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Record read through `server.pingTime`, `server.minPing`, `server.maxPing`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L498)

- [mq3.client.ui_servers2.PingRequest](Type-mq3-client-ui-servers2-pingrequest-271182573.md) — struct
- [mq3.client.ui_servers2.PingResult](Type-mq3-client-ui-servers2-pingresult-795236365.md) — struct
<a id="function-function-mq3-client-ui-servers2-punkbusterconfirmdisable-function-punkbusterconfirmdisable-state-result-currentcvar-retailactive-src-mq3-client-ui-servers2-ml-1114054120"></a>
### punkbusterConfirmDisable

```ml
function punkbusterConfirmDisable(state, result, currentCvar, retailActive)
```

Punkbuster_ConfirmDisable

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.actions`, `state.punkbuster`. |
| `result` | `dynamic` | — | Value used by `if result then state.actions=action(state.actions,"punkbuster","set-client-status","disabled","",0,retailActive)`. |
| `currentCvar` | `dynamic` | — | Value used by `state.punkbuster=clamp(currentCvar,0,1)!=0`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L791)

<a id="function-function-mq3-client-ui-servers2-punkbusterconfirmenable-function-punkbusterconfirmenable-state-result-currentcvar-retailactive-src-mq3-client-ui-servers2-ml-689440736"></a>
### punkbusterConfirmEnable

```ml
function punkbusterConfirmEnable(state, result, currentCvar, retailActive)
```

Punkbuster_ConfirmEnable

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.actions`, `state.punkbuster`. |
| `result` | `dynamic` | — | Value used by `if result then state.actions=action(state.actions,"punkbuster","set-client-status","enabled","",1,retailActive) end if`. |
| `currentCvar` | `dynamic` | — | Value used by `state.punkbuster=clamp(currentCvar,0,1)!=0`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L781)

<a id="constant-constant-mq3-client-ui-servers2-qm-activated-const-qm-activated-3-src-mq3-client-ui-servers2-ml-2103987622"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the base-game server browser before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L28)

<a id="constant-constant-mq3-client-ui-servers2-qm-gotfocus-const-qm-gotfocus-1-src-mq3-client-ui-servers2-ml-1142547658"></a>
### QM_GOTFOCUS

```ml
const QM_GOTFOCUS = 1
```

Menu callback event reporting that the item was gotfocus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L25)

<a id="function-function-mq3-client-ui-servers2-refresharguments-function-refresharguments-state-src-mq3-client-ui-servers2-ml-1907140045"></a>
### refreshArguments

```ml
function refreshArguments(state)
```

Evaluates UI servers2 `refreshArguments` and returns `text` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.gameFilter`, `state.showEmpty`, `state.showFull`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L709)

- [mq3.client.ui_servers2.ServerNode](Type-mq3-client-ui-servers2-servernode-153799743.md) — struct
<a id="constant-constant-mq3-client-ui-servers2-sort-clients-const-sort-clients-2-src-mq3-client-ui-servers2-ml-551448063"></a>
### SORT_CLIENTS

```ml
const SORT_CLIENTS = 2
```

Server-browser sort key comparing the clients column.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L73)

<a id="constant-constant-mq3-client-ui-servers2-sort-game-const-sort-game-3-src-mq3-client-ui-servers2-ml-148766944"></a>
### SORT_GAME

```ml
const SORT_GAME = 3
```

Server-browser sort key comparing the game column.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L75)

<a id="constant-constant-mq3-client-ui-servers2-sort-host-const-sort-host-0-src-mq3-client-ui-servers2-ml-885769501"></a>
### SORT_HOST

```ml
const SORT_HOST = 0
```

Server-browser sort key comparing the host column.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L69)

<a id="constant-constant-mq3-client-ui-servers2-sort-map-const-sort-map-1-src-mq3-client-ui-servers2-ml-1785501378"></a>
### SORT_MAP

```ml
const SORT_MAP = 1
```

Server-browser sort key comparing the map column.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L71)

<a id="constant-constant-mq3-client-ui-servers2-sort-ping-const-sort-ping-4-src-mq3-client-ui-servers2-ml-1255354785"></a>
### SORT_PING

```ml
const SORT_PING = 4
```

Server-browser sort key comparing the ping column.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L77)

<a id="function-function-mq3-client-ui-servers2-sortnow-function-sortnow-state-src-mq3-client-ui-servers2-ml-1260107901"></a>
### sortNow

```ml
function sortNow(state)
```

Updates `state.servers` during UI servers2 `sortNow`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.servers`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L410)

<a id="function-function-mq3-client-ui-servers2-syncactive-function-syncactive-state-src-mq3-client-ui-servers2-ml-855589673"></a>
### syncActive

```ml
function syncActive(state)
```

Updates `state.localServers`, `state.globalServers`, `state.mplayerServers`, `state.favoriteServers` during UI servers2 `syncActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI servers2 record/storage; this routine assigns `state.localServers`, `state.globalServers`, `state.mplayerServers`, `state.favoriteServers`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L427)

<a id="function-function-mq3-client-ui-servers2-truncate-function-truncate-text-count-src-mq3-client-ui-servers2-ml-979002516"></a>
### truncate

```ml
function truncate(text, count)
```

Calls `decode`, `slice` from UI servers2 `truncate`. The final path returns `decode(slice(data,0,count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `truncate` in the UI servers2 path. |
| `count` | `dynamic` | — | Value tested by `len(data)<=count` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L338)

<a id="function-function-mq3-client-ui-servers2-uiarenaserversmenu-function-uiarenaserversmenu-browsermaster-browsergametype-browsersortkey-browsershowfull-browsershowempty-punkbuster-cvarfavorites-maxping-realtime-protocol-debugprotocol-retailactive-src-mq3-client-ui-servers2-ml-1212672216"></a>
### uiArenaServersMenu

```ml
function uiArenaServersMenu(browserMaster, browserGameType, browserSortKey, browserShowFull, browserShowEmpty, punkbuster, cvarFavorites, maxPing, realtime, protocol, debugProtocol, retailActive)
```

UI_ArenaServersMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `browserMaster` | `dynamic` | — | Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`. |
| `browserGameType` | `dynamic` | — | Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`. |
| `browserSortKey` | `dynamic` | — | Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`. |
| `browserShowFull` | `dynamic` | — | Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`. |
| `browserShowEmpty` | `dynamic` | — | Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`. |
| `punkbuster` | `dynamic` | — | Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`. |
| `cvarFavorites` | `dynamic` | — | Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`. |
| `maxPing` | `dynamic` | — | Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |
| `protocol` | `dynamic` | — | Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`. |
| `debugProtocol` | `dynamic` | — | Value used by `state=arenaServersMenuInit(browserMaster,browserGameType,browserSortKey,browserShowFull,browserShowEmpty,punkbuster,cvarFavorites,maxPing,real...`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_servers2.ml#L916)
