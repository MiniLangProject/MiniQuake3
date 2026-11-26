# `src/mq3/client/ui_teamorders.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_teamorders`](Package-mq3-client-ui-teamorders-102956572.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_qmenu.ml` as `qmenu` → [src/mq3/client/ui_qmenu.ml](File-src-mq3-client-ui-qmenu-ml-201905758.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.ui_teamorders.Action](Type-mq3-client-ui-teamorders-action-529978492.md) — struct
<a id="constant-constant-mq3-client-ui-teamorders-art-back0-const-art-back0-menu-art-back-0-src-mq3-client-ui-teamorders-ml-1683649887"></a>
### ART_BACK0

```ml
const ART_BACK0 = "menu/art/back_0"
```

Virtual shader or image asset name used for the menu's back0 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L14)

<a id="constant-constant-mq3-client-ui-teamorders-art-back1-const-art-back1-menu-art-back-1-src-mq3-client-ui-teamorders-ml-1690832194"></a>
### ART_BACK1

```ml
const ART_BACK1 = "menu/art/back_1"
```

Virtual shader or image asset name used for the menu's back1 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L16)

<a id="constant-constant-mq3-client-ui-teamorders-art-frame-const-art-frame-menu-art-addbotframe-src-mq3-client-ui-teamorders-ml-1015141256"></a>
### ART_FRAME

```ml
const ART_FRAME = "menu/art/addbotframe"
```

Virtual shader or image asset name used for the menu's frame artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L12)

<a id="function-function-mq3-client-ui-teamorders-bitmap-function-bitmap-name-id-x-y-flags-w-h-src-mq3-client-ui-teamorders-ml-23330199"></a>
### bitmap

```ml
function bitmap(name, id, x, y, flags, w, h)
```

Calls `mq3.client.ui_qmenu.item` from UI teamorders `bitmap`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI teamorders resource. |
| `id` | `dynamic` | — | Value used by `value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags)`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `bitmap`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `bitmap`. |
| `flags` | `dynamic` | — | Value used by `value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags)`. |
| `w` | `dynamic` | — | Value assigned to `value.width`. |
| `h` | `dynamic` | — | Value assigned to `value.height`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L212)

<a id="function-function-mq3-client-ui-teamorders-clean-function-clean-text-src-mq3-client-ui-teamorders-ml-633328969"></a>
### clean

```ml
function clean(text)
```

Calls `decode` from UI teamorders `clean`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `clean` in the UI teamorders path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L128)

<a id="function-function-mq3-client-ui-teamorders-create-function-create-retailactive-src-mq3-client-ui-teamorders-ml-435214601"></a>
### create

```ml
function create(retailActive)
```

Creates a `mq3.client.ui_teamorders.State` record. Assigns `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Value used to initialize `State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L111)

<a id="function-function-mq3-client-ui-teamorders-ctfmessages-function-ctfmessages-src-mq3-client-ui-teamorders-ml-1171768500"></a>
### ctfMessages

```ml
function ctfMessages()
```

Lists the 7 UI teamorders ctf messages strings in their declared order, beginning with `"i am the leader"`, `"%s defend the base"`, `"%s follow me"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L104)

<a id="function-function-mq3-client-ui-teamorders-ctforders-function-ctforders-src-mq3-client-ui-teamorders-ml-763334010"></a>
### ctfOrders

```ml
function ctfOrders()
```

Lists the 7 UI teamorders ctf orders strings in their declared order, beginning with `"I Am the Leader"`, `"Defend the Base"`, `"Follow Me"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L102)

<a id="function-function-mq3-client-ui-teamorders-emit-function-emit-state-boundary-kind-name-text-x-y-number-src-mq3-client-ui-teamorders-ml-52420655"></a>
### emit

```ml
function emit(state, boundary, kind, name, text, x, y, number)
```

Appends a UI teamorders action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI teamorders record/storage; this routine assigns `state.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI teamorders resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI teamorders path. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `emit`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `emit`. |
| `number` | `dynamic` | — | Value used by `action=Action(boundary,kind,name,text,x,y,number,not state.retailActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L121)

<a id="constant-constant-mq3-client-ui-teamorders-gt-ctf-const-gt-ctf-4-src-mq3-client-ui-teamorders-ml-852458041"></a>
### GT_CTF

```ml
const GT_CTF = 4
```

Native game-type value for capture the flag, used when choosing the team-order choices appropriate to the current game mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L28)

<a id="constant-constant-mq3-client-ui-teamorders-gt-team-const-gt-team-3-src-mq3-client-ui-teamorders-ml-1173981140"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```

Native game-type value for team deathmatch, used when choosing the team-order choices appropriate to the current game mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L25)

<a id="constant-constant-mq3-client-ui-teamorders-id-list-bots-const-id-list-bots-10-src-mq3-client-ui-teamorders-ml-1424193668"></a>
### ID_LIST_BOTS

```ml
const ID_LIST_BOTS = 10
```

Menu control identifier routed to the list bots action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L18)

<a id="constant-constant-mq3-client-ui-teamorders-id-list-ctf-orders-const-id-list-ctf-orders-11-src-mq3-client-ui-teamorders-ml-996547485"></a>
### ID_LIST_CTF_ORDERS

```ml
const ID_LIST_CTF_ORDERS = 11
```

Menu control identifier routed to the list ctf orders action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L20)

<a id="constant-constant-mq3-client-ui-teamorders-id-list-team-orders-const-id-list-team-orders-12-src-mq3-client-ui-teamorders-ml-65023630"></a>
### ID_LIST_TEAM_ORDERS

```ml
const ID_LIST_TEAM_ORDERS = 12
```

Menu control identifier routed to the list team orders action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L22)

<a id="function-function-mq3-client-ui-teamorders-playerinfo-function-playerinfo-playerinfos-index-src-mq3-client-ui-teamorders-ml-1250004024"></a>
### playerInfo

```ml
function playerInfo(playerInfos, index)
```

Evaluates UI teamorders `playerInfo` and returns `""`, `playerInfos[index]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `playerInfos` | `dynamic` | — | Sequence read at `playerInfos[index]`. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=len(playerInfos)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L143)

<a id="function-function-mq3-client-ui-teamorders-replacetarget-function-replacetarget-format-target-src-mq3-client-ui-teamorders-ml-1372215774"></a>
### replaceTarget

```ml
function replaceTarget(format, target)
```

Calls `std.string.indexOf`, `std.string.substr` from UI teamorders `replaceTarget`. The final path returns `strings.substr(format,0,at)+target+strings.substr(format,at+2,len(format)-at-2)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `format` | `dynamic` | — | Sequence whose length/content is inspected by `replaceTarget`. |
| `target` | `dynamic` | — | Value used by `return strings.substr(format,0,at)+target+strings.substr(format,at+2,len(format)-at-2)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L162)

- [mq3.client.ui_teamorders.State](Type-mq3-client-ui-teamorders-state-2023851947.md) — struct
<a id="constant-constant-mq3-client-ui-teamorders-team-spectator-const-team-spectator-3-src-mq3-client-ui-teamorders-ml-1944550244"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```

Native team identifier for spectator, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L30)

<a id="function-function-mq3-client-ui-teamorders-teammessages-function-teammessages-src-mq3-client-ui-teamorders-ml-1205892906"></a>
### teamMessages

```ml
function teamMessages()
```

Lists the 6 UI teamorders team messages strings in their declared order, beginning with `"i am the leader"`, `"%s follow me"`, `"%s roam"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L108)

<a id="function-function-mq3-client-ui-teamorders-teamorders-function-teamorders-src-mq3-client-ui-teamorders-ml-1273397110"></a>
### teamOrders

```ml
function teamOrders()
```

Lists the 6 UI teamorders team orders strings in their declared order, beginning with `"I Am the Leader"`, `"Follow Me"`, `"Roam"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L106)

<a id="function-function-mq3-client-ui-teamorders-truncate-function-truncate-text-maxbytes-src-mq3-client-ui-teamorders-ml-990341900"></a>
### truncate

```ml
function truncate(text, maxBytes)
```

Calls `decode`, `slice` from UI teamorders `truncate`. The final path returns `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `truncate` in the UI teamorders path. |
| `maxBytes` | `dynamic` | — | Value used by `if len(data)>=maxBytes then return decode(slice(data,0,maxBytes-1)) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L125)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-function-ui-teamordersmenu-state-serverinfo-clientnum-playerinfos-src-mq3-client-ui-teamorders-ml-2119942771"></a>
### UI_TeamOrdersMenu

```ml
function UI_TeamOrdersMenu(state, serverInfo, clientNum, playerInfos)
```

UI_TeamOrdersMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI teamorders record/storage; this routine assigns `state.pushed`. |
| `serverInfo` | `dynamic` | — | Value used by `UI_TeamOrdersMenu_Init(state,serverInfo,clientNum,playerInfos)`. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |
| `playerInfos` | `dynamic` | — | Value used by `UI_TeamOrdersMenu_Init(state,serverInfo,clientNum,playerInfos)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L237)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-backevent-function-ui-teamordersmenu-backevent-state-event-src-mq3-client-ui-teamorders-ml-1637606155"></a>
### UI_TeamOrdersMenu_BackEvent

```ml
function UI_TeamOrdersMenu_BackEvent(state, event)
```

UI_TeamOrdersMenu_BackEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI teamorders record/storage; this routine assigns `state.popped`, `state.menu.popped`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L148)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-buildbotlist-function-ui-teamordersmenu-buildbotlist-state-serverinfo-clientnum-playerinfos-src-mq3-client-ui-teamorders-ml-1917485875"></a>
### UI_TeamOrdersMenu_BuildBotList

```ml
function UI_TeamOrdersMenu_BuildBotList(state, serverInfo, clientNum, playerInfos)
```

UI_TeamOrdersMenu_BuildBotList

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI teamorders record/storage; this routine assigns `state.botNames`, `state.bots`, `state.numBots`, `state.gametype`. |
| `serverInfo` | `dynamic` | — | Value used by `state.gametype=numbers.atoi(info.value(serverInfo,"g_gametype"))`. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |
| `playerInfos` | `dynamic` | — | Sequence whose length/content is inspected by `UI_TeamOrdersMenu_BuildBotList`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L199)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-cache-function-ui-teamordersmenu-cache-state-src-mq3-client-ui-teamorders-ml-2103296275"></a>
### UI_TeamOrdersMenu_Cache

```ml
function UI_TeamOrdersMenu_Cache(state)
```

UI_TeamOrdersMenu_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI teamorders state passed to the helper calls in `UI_TeamOrdersMenu_Cache`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L216)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-f-function-ui-teamordersmenu-f-state-serverinfo-clientnum-playerinfos-src-mq3-client-ui-teamorders-ml-531872185"></a>
### UI_TeamOrdersMenu_f

```ml
function UI_TeamOrdersMenu_f(state, serverInfo, clientNum, playerInfos)
```

UI_TeamOrdersMenu_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI teamorders state passed to the helper calls in `UI_TeamOrdersMenu_f`. |
| `serverInfo` | `dynamic` | — | Value used by `gametype=numbers.atoi(info.value(serverInfo,"g_gametype"))`. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |
| `playerInfos` | `dynamic` | — | Value used by `team=numbers.atoi(info.value(playerInfo(playerInfos,clientNum),"t"))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L244)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-init-function-ui-teamordersmenu-init-state-serverinfo-clientnum-playerinfos-src-mq3-client-ui-teamorders-ml-371978075"></a>
### UI_TeamOrdersMenu_Init

```ml
function UI_TeamOrdersMenu_Init(state, serverInfo, clientNum, playerInfos)
```

UI_TeamOrdersMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI teamorders record/storage; this routine assigns `state.menu`, `state.actions`, `state.popped`, `state.pushed` and additional values. |
| `serverInfo` | `dynamic` | — | Value used by `UI_TeamOrdersMenu_BuildBotList(state,serverInfo,clientNum,playerInfos)`. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |
| `playerInfos` | `dynamic` | — | Value used by `UI_TeamOrdersMenu_BuildBotList(state,serverInfo,clientNum,playerInfos)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L223)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-key-function-ui-teamordersmenu-key-state-key-cursorx-cursory-src-mq3-client-ui-teamorders-ml-1620726999"></a>
### UI_TeamOrdersMenu_Key

```ml
function UI_TeamOrdersMenu_Key(state, key, cursorx, cursory)
```

UI_TeamOrdersMenu_Key

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI teamorders record/storage; this routine assigns `state.list.oldvalue`, `state.list.curvalue`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI teamorders entry. |
| `cursorx` | `dynamic` | — | Value used by `if current==void or current.menuPosition!=state.list.menuPosition then return qmenu.Menu_DefaultKey(state.menu,key,cursorx,cursory) end if`. |
| `cursory` | `dynamic` | — | Value used by `if current==void or current.menuPosition!=state.list.menuPosition then return qmenu.Menu_DefaultKey(state.menu,key,cursorx,cursory) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L179)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-listdraw-function-ui-teamordersmenu-listdraw-state-src-mq3-client-ui-teamorders-ml-692649973"></a>
### UI_TeamOrdersMenu_ListDraw

```ml
function UI_TeamOrdersMenu_ListDraw(state)
```

UI_TeamOrdersMenu_ListDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.menu.cursor`, `state.list.menuPosition`, `state.list.y`, `state.list.numitems` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L190)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-listevent-function-ui-teamordersmenu-listevent-state-event-src-mq3-client-ui-teamorders-ml-1821193677"></a>
### UI_TeamOrdersMenu_ListEvent

```ml
function UI_TeamOrdersMenu_ListEvent(state, event)
```

UI_TeamOrdersMenu_ListEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI teamorders record/storage; this routine assigns `state.selectedBot`, `state.popped`, `state.menu.popped`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L167)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-setlist-function-ui-teamordersmenu-setlist-state-id-src-mq3-client-ui-teamorders-ml-330205372"></a>
### UI_TeamOrdersMenu_SetList

```ml
function UI_TeamOrdersMenu_SetList(state, id)
```

UI_TeamOrdersMenu_SetList

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI teamorders record/storage; this routine assigns `state.list.id`, `state.list.itemnames`, `state.list.numitems`, `state.list.curvalue` and additional values. |
| `id` | `dynamic` | — | Value assigned to `state.list.id`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_teamorders.ml#L155)
