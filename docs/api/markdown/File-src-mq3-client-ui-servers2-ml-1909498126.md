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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `actions` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L65)

<a id="function-function-mq3-client-ui-servers2-arenaserverscache-function-arenaserverscache-state-retailactive-src-mq3-client-ui-servers2-ml-1780968180"></a>
### arenaServersCache

```ml
function arenaServersCache(state, retailActive)
```

ArenaServers_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L518)

<a id="function-function-mq3-client-ui-servers2-arenaserverscompare-function-arenaserverscompare-left-right-sortkey-src-mq3-client-ui-servers2-ml-1546032782"></a>
### arenaServersCompare

```ml
function arenaServersCompare(left, right, sortKey)
```

ArenaServers_Compare

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `sortKey` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L129)

<a id="function-function-mq3-client-ui-servers2-arenaserversdorefresh-function-arenaserversdorefresh-state-realtime-servercount-pingqueuecount-pingresults-serveraddresses-maxping-retailactive-src-mq3-client-ui-servers2-ml-562878418"></a>
### arenaServersDoRefresh

```ml
function arenaServersDoRefresh(state, realtime, serverCount, pingQueueCount, pingResults, serverAddresses, maxPing, retailActive)
```

ArenaServers_DoRefresh

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |
| `serverCount` | `dynamic` | — |  |
| `pingQueueCount` | `dynamic` | — |  |
| `pingResults` | `dynamic` | — |  |
| `serverAddresses` | `dynamic` | — |  |
| `maxPing` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L361)

<a id="function-function-mq3-client-ui-servers2-arenaserversevent-function-arenaserversevent-state-id-eventcode-value-realtime-protocol-debugprotocol-maxping-retailactive-src-mq3-client-ui-servers2-ml-2129695591"></a>
### arenaServersEvent

```ml
function arenaServersEvent(state, id, eventCode, value, realtime, protocol, debugProtocol, maxPing, retailActive)
```

ArenaServers_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `eventCode` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |
| `protocol` | `dynamic` | — |  |
| `debugProtocol` | `dynamic` | — |  |
| `maxPing` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L465)

<a id="function-function-mq3-client-ui-servers2-arenaserversgo-function-arenaserversgo-state-retailactive-src-mq3-client-ui-servers2-ml-1098927586"></a>
### arenaServersGo

```ml
function arenaServersGo(state, retailActive)
```

ArenaServers_Go

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L184)

<a id="function-function-mq3-client-ui-servers2-arenaserversinsert-function-arenaserversinsert-state-address-infotext-pingtime-maxping-src-mq3-client-ui-servers2-ml-2129096813"></a>
### arenaServersInsert

```ml
function arenaServersInsert(state, address, infoText, pingTime, maxPing)
```

ArenaServers_Insert

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `infoText` | `dynamic` | — |  |
| `pingTime` | `dynamic` | — |  |
| `maxPing` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L295)

<a id="function-function-mq3-client-ui-servers2-arenaserversinsertfavorites-function-arenaserversinsertfavorites-state-maxping-src-mq3-client-ui-servers2-ml-314415375"></a>
### arenaServersInsertFavorites

```ml
function arenaServersInsertFavorites(state, maxPing)
```

ArenaServers_InsertFavorites

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `maxPing` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L311)

<a id="function-function-mq3-client-ui-servers2-arenaserversloadfavorites-function-arenaserversloadfavorites-state-cvaraddresses-maxping-src-mq3-client-ui-servers2-ml-1129361413"></a>
### arenaServersLoadFavorites

```ml
function arenaServersLoadFavorites(state, cvarAddresses, maxPing)
```

ArenaServers_LoadFavorites

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cvarAddresses` | `dynamic` | — |  |
| `maxPing` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L321)

<a id="function-function-mq3-client-ui-servers2-arenaserversmaxping-function-arenaserversmaxping-cvarvalue-src-mq3-client-ui-servers2-ml-1908645985"></a>
### arenaServersMaxPing

```ml
function arenaServersMaxPing(cvarValue)
```

ArenaServers_MaxPing

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cvarValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L122)

<a id="function-function-mq3-client-ui-servers2-arenaserversmenudraw-function-arenaserversmenudraw-state-realtime-servercount-pingqueuecount-pingresults-serveraddresses-maxping-retailactive-src-mq3-client-ui-servers2-ml-184790148"></a>
### arenaServersMenuDraw

```ml
function arenaServersMenuDraw(state, realtime, serverCount, pingQueueCount, pingResults, serverAddresses, maxPing, retailActive)
```

ArenaServers_MenuDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |
| `serverCount` | `dynamic` | — |  |
| `pingQueueCount` | `dynamic` | — |  |
| `pingResults` | `dynamic` | — |  |
| `serverAddresses` | `dynamic` | — |  |
| `maxPing` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L487)

<a id="function-function-mq3-client-ui-servers2-arenaserversmenuinit-function-arenaserversmenuinit-browsermaster-browsergametype-browsersortkey-browsershowfull-browsershowempty-punkbuster-cvarfavorites-maxping-realtime-protocol-debugprotocol-retailactive-src-mq3-client-ui-servers2-ml-1941462676"></a>
### arenaServersMenuInit

```ml
function arenaServersMenuInit(browserMaster, browserGameType, browserSortKey, browserShowFull, browserShowEmpty, punkbuster, cvarFavorites, maxPing, realtime, protocol, debugProtocol, retailActive)
```

ArenaServers_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `browserMaster` | `dynamic` | — |  |
| `browserGameType` | `dynamic` | — |  |
| `browserSortKey` | `dynamic` | — |  |
| `browserShowFull` | `dynamic` | — |  |
| `browserShowEmpty` | `dynamic` | — |  |
| `punkbuster` | `dynamic` | — |  |
| `cvarFavorites` | `dynamic` | — |  |
| `maxPing` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |
| `protocol` | `dynamic` | — |  |
| `debugProtocol` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L525)

<a id="function-function-mq3-client-ui-servers2-arenaserversmenukey-function-arenaserversmenukey-state-key-listfocused-maxping-retailactive-src-mq3-client-ui-servers2-ml-1380261304"></a>
### arenaServersMenuKey

```ml
function arenaServersMenuKey(state, key, listFocused, maxPing, retailActive)
```

ArenaServers_MenuKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `listFocused` | `dynamic` | — |  |
| `maxPing` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L493)

<a id="function-function-mq3-client-ui-servers2-arenaserversremove-function-arenaserversremove-state-src-mq3-client-ui-servers2-ml-1689987657"></a>
### arenaServersRemove

```ml
function arenaServersRemove(state)
```

ArenaServers_Remove

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L277)

<a id="function-function-mq3-client-ui-servers2-arenaserverssavechanges-function-arenaserverssavechanges-state-retailactive-src-mq3-client-ui-servers2-ml-1952029456"></a>
### arenaServersSaveChanges

```ml
function arenaServersSaveChanges(state, retailActive)
```

ArenaServers_SaveChanges

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L427)

<a id="function-function-mq3-client-ui-servers2-arenaserverssettype-function-arenaserverssettype-state-type-realtime-protocol-debugprotocol-retailactive-src-mq3-client-ui-servers2-ml-844030102"></a>
### arenaServersSetType

```ml
function arenaServersSetType(state, type, realtime, protocol, debugProtocol, retailActive)
```

ArenaServers_SetType

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |
| `protocol` | `dynamic` | — |  |
| `debugProtocol` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L442)

<a id="function-function-mq3-client-ui-servers2-arenaserverssort-function-arenaserverssort-state-type-src-mq3-client-ui-servers2-ml-666948781"></a>
### arenaServersSort

```ml
function arenaServersSort(state, type)
```

ArenaServers_Sort

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L436)

<a id="function-function-mq3-client-ui-servers2-arenaserversstartrefresh-function-arenaserversstartrefresh-state-realtime-protocol-debugprotocol-retailactive-src-mq3-client-ui-servers2-ml-2058615060"></a>
### arenaServersStartRefresh

```ml
function arenaServersStartRefresh(state, realtime, protocol, debugProtocol, retailActive)
```

ArenaServers_StartRefresh

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |
| `protocol` | `dynamic` | — |  |
| `debugProtocol` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L412)

<a id="function-function-mq3-client-ui-servers2-arenaserversstoprefresh-function-arenaserversstoprefresh-state-maxping-src-mq3-client-ui-servers2-ml-1642583153"></a>
### arenaServersStopRefresh

```ml
function arenaServersStopRefresh(state, maxPing)
```

ArenaServers_StopRefresh

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `maxPing` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L346)

<a id="function-function-mq3-client-ui-servers2-arenaserversupdatemenu-function-arenaserversupdatemenu-state-src-mq3-client-ui-servers2-ml-700036437"></a>
### arenaServersUpdateMenu

```ml
function arenaServersUpdateMenu(state)
```

ArenaServers_UpdateMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L242)

<a id="function-function-mq3-client-ui-servers2-arenaserversupdatepicture-function-arenaserversupdatepicture-state-src-mq3-client-ui-servers2-ml-668921621"></a>
### arenaServersUpdatePicture

```ml
function arenaServersUpdatePicture(state)
```

ArenaServers_UpdatePicture

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L192)

<a id="constant-constant-mq3-client-ui-servers2-as-favorites-const-as-favorites-3-src-mq3-client-ui-servers2-ml-381457278"></a>
### AS_FAVORITES

```ml
const AS_FAVORITES = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L36)

<a id="constant-constant-mq3-client-ui-servers2-as-global-const-as-global-2-src-mq3-client-ui-servers2-ml-1499733903"></a>
### AS_GLOBAL

```ml
const AS_GLOBAL = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L35)

<a id="constant-constant-mq3-client-ui-servers2-as-local-const-as-local-0-src-mq3-client-ui-servers2-ml-703530515"></a>
### AS_LOCAL

```ml
const AS_LOCAL = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L33)

<a id="constant-constant-mq3-client-ui-servers2-as-mplayer-const-as-mplayer-1-src-mq3-client-ui-servers2-ml-226340306"></a>
### AS_MPLAYER

```ml
const AS_MPLAYER = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L34)

<a id="extern_function-extern-function-mq3-client-ui-servers2-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-client-ui-servers2-ml-900965594"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L9)

<a id="function-function-mq3-client-ui-servers2-browserchoices-function-browserchoices-src-mq3-client-ui-servers2-ml-1993232450"></a>
### browserChoices

```ml
function browserChoices()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L508)

<a id="function-function-mq3-client-ui-servers2-browseritems-function-browseritems-src-mq3-client-ui-servers2-ml-101462"></a>
### browserItems

```ml
function browserItems()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L500)

<a id="function-function-mq3-client-ui-servers2-browserstate-function-browserstate-src-mq3-client-ui-servers2-ml-1957098726"></a>
### browserState

```ml
function browserState()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L77)

- [mq3.client.ui_servers2.BrowserState](Type-mq3-client-ui-servers2-browserstate-60939545.md) — struct
- [mq3.client.ui_servers2.ChoiceList](Type-mq3-client-ui-servers2-choicelist-1744423775.md) — struct
<a id="function-function-mq3-client-ui-servers2-chooseactive-function-chooseactive-state-src-mq3-client-ui-servers2-ml-1978014497"></a>
### chooseActive

```ml
function chooseActive(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L175)

<a id="function-function-mq3-client-ui-servers2-clamp-function-clamp-value-low-high-src-mq3-client-ui-servers2-ml-504142455"></a>
### clamp

```ml
function clamp(value, low, high)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `low` | `dynamic` | — |  |
| `high` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L85)

<a id="function-function-mq3-client-ui-servers2-cleantext-function-cleantext-text-src-mq3-client-ui-servers2-ml-1406148779"></a>
### cleanText

```ml
function cleanText(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L98)

<a id="function-function-mq3-client-ui-servers2-emptynode-function-emptynode-address-pingtime-src-mq3-client-ui-servers2-ml-221421739"></a>
### emptyNode

```ml
function emptyNode(address, pingTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |
| `pingTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L73)

<a id="function-function-mq3-client-ui-servers2-findrequest-function-findrequest-state-address-src-mq3-client-ui-servers2-ml-1956715339"></a>
### findRequest

```ml
function findRequest(state, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L355)

<a id="function-function-mq3-client-ui-servers2-formatrow-function-formatrow-server-src-mq3-client-ui-servers2-ml-1269978145"></a>
### formatRow

```ml
function formatRow(server)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L236)

<a id="function-function-mq3-client-ui-servers2-gamematches-function-gamematches-filter-gametype-src-mq3-client-ui-servers2-ml-999806792"></a>
### gameMatches

```ml
function gameMatches(filter, gameType)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filter` | `dynamic` | — |  |
| `gameType` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L213)

<a id="function-function-mq3-client-ui-servers2-gamename-function-gamename-value-src-mq3-client-ui-servers2-ml-819526333"></a>
### gameName

```ml
function gameName(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L289)

<a id="constant-constant-mq3-client-ui-servers2-games-all-const-games-all-0-src-mq3-client-ui-servers2-ml-1503086913"></a>
### GAMES_ALL

```ml
const GAMES_ALL = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L42)

<a id="constant-constant-mq3-client-ui-servers2-games-ctf-const-games-ctf-4-src-mq3-client-ui-servers2-ml-1606132405"></a>
### GAMES_CTF

```ml
const GAMES_CTF = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L46)

<a id="constant-constant-mq3-client-ui-servers2-games-ffa-const-games-ffa-1-src-mq3-client-ui-servers2-ml-1167018398"></a>
### GAMES_FFA

```ml
const GAMES_FFA = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L43)

<a id="constant-constant-mq3-client-ui-servers2-games-teamplay-const-games-teamplay-2-src-mq3-client-ui-servers2-ml-809562343"></a>
### GAMES_TEAMPLAY

```ml
const GAMES_TEAMPLAY = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L44)

<a id="constant-constant-mq3-client-ui-servers2-games-tourney-const-games-tourney-3-src-mq3-client-ui-servers2-ml-464039152"></a>
### GAMES_TOURNEY

```ml
const GAMES_TOURNEY = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L45)

<a id="constant-constant-mq3-client-ui-servers2-gt-ctf-const-gt-ctf-4-src-mq3-client-ui-servers2-ml-563311757"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L50)

<a id="constant-constant-mq3-client-ui-servers2-gt-ffa-const-gt-ffa-0-src-mq3-client-ui-servers2-ml-1842504489"></a>
### GT_FFA

```ml
const GT_FFA = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L47)

<a id="constant-constant-mq3-client-ui-servers2-gt-team-const-gt-team-3-src-mq3-client-ui-servers2-ml-26586636"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L49)

<a id="constant-constant-mq3-client-ui-servers2-gt-tournament-const-gt-tournament-1-src-mq3-client-ui-servers2-ml-667939906"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L48)

- [mq3.client.ui_servers2.HostAction](Type-mq3-client-ui-servers2-hostaction-1159759876.md) — struct
<a id="constant-constant-mq3-client-ui-servers2-id-back-const-id-back-18-src-mq3-client-ui-servers2-ml-1725618316"></a>
### ID_BACK

```ml
const ID_BACK = 18
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L26)

<a id="constant-constant-mq3-client-ui-servers2-id-connect-const-id-connect-22-src-mq3-client-ui-servers2-ml-1448512935"></a>
### ID_CONNECT

```ml
const ID_CONNECT = 22
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L30)

<a id="constant-constant-mq3-client-ui-servers2-id-create-const-id-create-21-src-mq3-client-ui-servers2-ml-1029961612"></a>
### ID_CREATE

```ml
const ID_CREATE = 21
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L29)

<a id="constant-constant-mq3-client-ui-servers2-id-gametype-const-id-gametype-11-src-mq3-client-ui-servers2-ml-2094504351"></a>
### ID_GAMETYPE

```ml
const ID_GAMETYPE = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L19)

<a id="constant-constant-mq3-client-ui-servers2-id-list-const-id-list-15-src-mq3-client-ui-servers2-ml-481587751"></a>
### ID_LIST

```ml
const ID_LIST = 15
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L23)

<a id="constant-constant-mq3-client-ui-servers2-id-master-const-id-master-10-src-mq3-client-ui-servers2-ml-1640488044"></a>
### ID_MASTER

```ml
const ID_MASTER = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L18)

<a id="constant-constant-mq3-client-ui-servers2-id-punkbuster-const-id-punkbuster-24-src-mq3-client-ui-servers2-ml-276577699"></a>
### ID_PUNKBUSTER

```ml
const ID_PUNKBUSTER = 24
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L32)

<a id="constant-constant-mq3-client-ui-servers2-id-refresh-const-id-refresh-19-src-mq3-client-ui-servers2-ml-1588050319"></a>
### ID_REFRESH

```ml
const ID_REFRESH = 19
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L27)

<a id="constant-constant-mq3-client-ui-servers2-id-remove-const-id-remove-23-src-mq3-client-ui-servers2-ml-1382996874"></a>
### ID_REMOVE

```ml
const ID_REMOVE = 23
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L31)

<a id="constant-constant-mq3-client-ui-servers2-id-scroll-down-const-id-scroll-down-17-src-mq3-client-ui-servers2-ml-1962466395"></a>
### ID_SCROLL_DOWN

```ml
const ID_SCROLL_DOWN = 17
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L25)

<a id="constant-constant-mq3-client-ui-servers2-id-scroll-up-const-id-scroll-up-16-src-mq3-client-ui-servers2-ml-1062996686"></a>
### ID_SCROLL_UP

```ml
const ID_SCROLL_UP = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L24)

<a id="constant-constant-mq3-client-ui-servers2-id-show-empty-const-id-show-empty-14-src-mq3-client-ui-servers2-ml-101366512"></a>
### ID_SHOW_EMPTY

```ml
const ID_SHOW_EMPTY = 14
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L22)

<a id="constant-constant-mq3-client-ui-servers2-id-show-full-const-id-show-full-13-src-mq3-client-ui-servers2-ml-1672129317"></a>
### ID_SHOW_FULL

```ml
const ID_SHOW_FULL = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L21)

<a id="constant-constant-mq3-client-ui-servers2-id-sortkey-const-id-sortkey-12-src-mq3-client-ui-servers2-ml-1057447554"></a>
### ID_SORTKEY

```ml
const ID_SORTKEY = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L20)

<a id="constant-constant-mq3-client-ui-servers2-id-specify-const-id-specify-20-src-mq3-client-ui-servers2-ml-659364303"></a>
### ID_SPECIFY

```ml
const ID_SPECIFY = 20
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L28)

<a id="function-function-mq3-client-ui-servers2-item-function-item-id-kind-name-x-y-src-mq3-client-ui-servers2-ml-1117525151"></a>
### item

```ml
function item(id, kind, name, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L83)

- [mq3.client.ui_servers2.Item](Type-mq3-client-ui-servers2-item-1844667635.md) — struct
<a id="constant-constant-mq3-client-ui-servers2-k-del-const-k-del-140-src-mq3-client-ui-servers2-ml-1088957654"></a>
### K_DEL

```ml
const K_DEL = 140
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L53)

<a id="constant-constant-mq3-client-ui-servers2-k-escape-const-k-escape-27-src-mq3-client-ui-servers2-ml-36312918"></a>
### K_ESCAPE

```ml
const K_ESCAPE = 27
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L51)

<a id="constant-constant-mq3-client-ui-servers2-k-kp-del-const-k-kp-del-171-src-mq3-client-ui-servers2-ml-1063453438"></a>
### K_KP_DEL

```ml
const K_KP_DEL = 171
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L54)

<a id="constant-constant-mq3-client-ui-servers2-k-mouse2-const-k-mouse2-179-src-mq3-client-ui-servers2-ml-489052442"></a>
### K_MOUSE2

```ml
const K_MOUSE2 = 179
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L55)

<a id="constant-constant-mq3-client-ui-servers2-k-space-const-k-space-32-src-mq3-client-ui-servers2-ml-1830437744"></a>
### K_SPACE

```ml
const K_SPACE = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L52)

<a id="function-function-mq3-client-ui-servers2-lowercompare-function-lowercompare-lefttext-righttext-src-mq3-client-ui-servers2-ml-2037833843"></a>
### lowerCompare

```ml
function lowerCompare(leftText, rightText)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `leftText` | `dynamic` | — |  |
| `rightText` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L107)

<a id="constant-constant-mq3-client-ui-servers2-max-favoriteservers-const-max-favoriteservers-16-src-mq3-client-ui-servers2-ml-1322300510"></a>
### MAX_FAVORITESERVERS

```ml
const MAX_FAVORITESERVERS = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L13)

<a id="constant-constant-mq3-client-ui-servers2-max-globalservers-const-max-globalservers-128-src-mq3-client-ui-servers2-ml-1734002608"></a>
### MAX_GLOBALSERVERS

```ml
const MAX_GLOBALSERVERS = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L11)

<a id="constant-constant-mq3-client-ui-servers2-max-listboxitems-const-max-listboxitems-128-src-mq3-client-ui-servers2-ml-1017790634"></a>
### MAX_LISTBOXITEMS

```ml
const MAX_LISTBOXITEMS = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L14)

<a id="constant-constant-mq3-client-ui-servers2-max-localservers-const-max-localservers-128-src-mq3-client-ui-servers2-ml-85725114"></a>
### MAX_LOCALSERVERS

```ml
const MAX_LOCALSERVERS = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L15)

<a id="constant-constant-mq3-client-ui-servers2-max-pingrequests-const-max-pingrequests-32-src-mq3-client-ui-servers2-ml-361414540"></a>
### MAX_PINGREQUESTS

```ml
const MAX_PINGREQUESTS = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L12)

<a id="function-function-mq3-client-ui-servers2-netname-function-netname-value-src-mq3-client-ui-servers2-ml-265666393"></a>
### netName

```ml
function netName(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L230)

<a id="function-function-mq3-client-ui-servers2-node-function-node-address-hostname-mapname-numclients-maxclients-pingtime-gametype-gamename-nettype-minping-maxping-punkbuster-src-mq3-client-ui-servers2-ml-755600300"></a>
### node

```ml
function node(address, hostname, mapName, numClients, maxClients, pingTime, gameType, gameName, netType, minPing, maxPing, punkbuster)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |
| `hostname` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `numClients` | `dynamic` | — |  |
| `maxClients` | `dynamic` | — |  |
| `pingTime` | `dynamic` | — |  |
| `gameType` | `dynamic` | — |  |
| `gameName` | `dynamic` | — |  |
| `netType` | `dynamic` | — |  |
| `minPing` | `dynamic` | — |  |
| `maxPing` | `dynamic` | — |  |
| `punkbuster` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L69)

<a id="function-function-mq3-client-ui-servers2-padleft-function-padleft-value-width-src-mq3-client-ui-servers2-ml-55960487"></a>
### padLeft

```ml
function padLeft(value, width)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L207)

<a id="function-function-mq3-client-ui-servers2-padright-function-padright-text-width-src-mq3-client-ui-servers2-ml-1116989761"></a>
### padRight

```ml
function padRight(text, width)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L201)

<a id="function-function-mq3-client-ui-servers2-pingcolor-function-pingcolor-server-src-mq3-client-ui-servers2-ml-1309025601"></a>
### pingColor

```ml
function pingColor(server)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L222)

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
| `state` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |
| `currentCvar` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L459)

<a id="function-function-mq3-client-ui-servers2-punkbusterconfirmenable-function-punkbusterconfirmenable-state-result-currentcvar-retailactive-src-mq3-client-ui-servers2-ml-689440736"></a>
### punkbusterConfirmEnable

```ml
function punkbusterConfirmEnable(state, result, currentCvar, retailActive)
```

Punkbuster_ConfirmEnable

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |
| `currentCvar` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L453)

<a id="constant-constant-mq3-client-ui-servers2-qm-activated-const-qm-activated-3-src-mq3-client-ui-servers2-ml-2103987622"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L17)

<a id="constant-constant-mq3-client-ui-servers2-qm-gotfocus-const-qm-gotfocus-1-src-mq3-client-ui-servers2-ml-1142547658"></a>
### QM_GOTFOCUS

```ml
const QM_GOTFOCUS = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L16)

<a id="function-function-mq3-client-ui-servers2-refresharguments-function-refresharguments-state-src-mq3-client-ui-servers2-ml-1907140045"></a>
### refreshArguments

```ml
function refreshArguments(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L400)

- [mq3.client.ui_servers2.ServerNode](Type-mq3-client-ui-servers2-servernode-153799743.md) — struct
<a id="constant-constant-mq3-client-ui-servers2-sort-clients-const-sort-clients-2-src-mq3-client-ui-servers2-ml-551448063"></a>
### SORT_CLIENTS

```ml
const SORT_CLIENTS = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L39)

<a id="constant-constant-mq3-client-ui-servers2-sort-game-const-sort-game-3-src-mq3-client-ui-servers2-ml-148766944"></a>
### SORT_GAME

```ml
const SORT_GAME = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L40)

<a id="constant-constant-mq3-client-ui-servers2-sort-host-const-sort-host-0-src-mq3-client-ui-servers2-ml-885769501"></a>
### SORT_HOST

```ml
const SORT_HOST = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L37)

<a id="constant-constant-mq3-client-ui-servers2-sort-map-const-sort-map-1-src-mq3-client-ui-servers2-ml-1785501378"></a>
### SORT_MAP

```ml
const SORT_MAP = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L38)

<a id="constant-constant-mq3-client-ui-servers2-sort-ping-const-sort-ping-4-src-mq3-client-ui-servers2-ml-1255354785"></a>
### SORT_PING

```ml
const SORT_PING = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L41)

<a id="function-function-mq3-client-ui-servers2-sortnow-function-sortnow-state-src-mq3-client-ui-servers2-ml-1260107901"></a>
### sortNow

```ml
function sortNow(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L152)

<a id="function-function-mq3-client-ui-servers2-syncactive-function-syncactive-state-src-mq3-client-ui-servers2-ml-855589673"></a>
### syncActive

```ml
function syncActive(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L167)

<a id="function-function-mq3-client-ui-servers2-truncate-function-truncate-text-count-src-mq3-client-ui-servers2-ml-979002516"></a>
### truncate

```ml
function truncate(text, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L91)

<a id="function-function-mq3-client-ui-servers2-uiarenaserversmenu-function-uiarenaserversmenu-browsermaster-browsergametype-browsersortkey-browsershowfull-browsershowempty-punkbuster-cvarfavorites-maxping-realtime-protocol-debugprotocol-retailactive-src-mq3-client-ui-servers2-ml-1212672216"></a>
### uiArenaServersMenu

```ml
function uiArenaServersMenu(browserMaster, browserGameType, browserSortKey, browserShowFull, browserShowEmpty, punkbuster, cvarFavorites, maxPing, realtime, protocol, debugProtocol, retailActive)
```

UI_ArenaServersMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `browserMaster` | `dynamic` | — |  |
| `browserGameType` | `dynamic` | — |  |
| `browserSortKey` | `dynamic` | — |  |
| `browserShowFull` | `dynamic` | — |  |
| `browserShowEmpty` | `dynamic` | — |  |
| `punkbuster` | `dynamic` | — |  |
| `cvarFavorites` | `dynamic` | — |  |
| `maxPing` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |
| `protocol` | `dynamic` | — |  |
| `debugProtocol` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_servers2.ml#L534)
