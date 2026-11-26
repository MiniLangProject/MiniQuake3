# `src/mq3/client/ui_teamorders.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_teamorders`](Package-mq3-client-ui-teamorders-102956572.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_qmenu.ml` as `qmenu` → [src/mq3/client/ui_qmenu.ml](File-src-mq3-client-ui-qmenu-ml-201905758.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.ui_teamorders.Action](Type-mq3-client-ui-teamorders-action-529978492.md) — struct
<a id="constant-constant-mq3-client-ui-teamorders-art-back0-const-art-back0-menu-art-back-0-src-mq3-client-ui-teamorders-ml-1683649887"></a>
### ART_BACK0

```ml
const ART_BACK0 = "menu/art/back_0"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L12)

<a id="constant-constant-mq3-client-ui-teamorders-art-back1-const-art-back1-menu-art-back-1-src-mq3-client-ui-teamorders-ml-1690832194"></a>
### ART_BACK1

```ml
const ART_BACK1 = "menu/art/back_1"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L13)

<a id="constant-constant-mq3-client-ui-teamorders-art-frame-const-art-frame-menu-art-addbotframe-src-mq3-client-ui-teamorders-ml-1015141256"></a>
### ART_FRAME

```ml
const ART_FRAME = "menu/art/addbotframe"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L11)

<a id="function-function-mq3-client-ui-teamorders-bitmap-function-bitmap-name-id-x-y-flags-w-h-src-mq3-client-ui-teamorders-ml-23330199"></a>
### bitmap

```ml
function bitmap(name, id, x, y, flags, w, h)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L86)

<a id="function-function-mq3-client-ui-teamorders-clean-function-clean-text-src-mq3-client-ui-teamorders-ml-633328969"></a>
### clean

```ml
function clean(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L31)

<a id="function-function-mq3-client-ui-teamorders-create-function-create-retailactive-src-mq3-client-ui-teamorders-ml-435214601"></a>
### create

```ml
function create(retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L28)

<a id="function-function-mq3-client-ui-teamorders-ctfmessages-function-ctfmessages-src-mq3-client-ui-teamorders-ml-1171768500"></a>
### ctfMessages

```ml
function ctfMessages()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L25)

<a id="function-function-mq3-client-ui-teamorders-ctforders-function-ctforders-src-mq3-client-ui-teamorders-ml-763334010"></a>
### ctfOrders

```ml
function ctfOrders()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L24)

<a id="function-function-mq3-client-ui-teamorders-emit-function-emit-state-boundary-kind-name-text-x-y-number-src-mq3-client-ui-teamorders-ml-52420655"></a>
### emit

```ml
function emit(state, boundary, kind, name, text, x, y, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L29)

<a id="constant-constant-mq3-client-ui-teamorders-gt-ctf-const-gt-ctf-4-src-mq3-client-ui-teamorders-ml-852458041"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L18)

<a id="constant-constant-mq3-client-ui-teamorders-gt-team-const-gt-team-3-src-mq3-client-ui-teamorders-ml-1173981140"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L17)

<a id="constant-constant-mq3-client-ui-teamorders-id-list-bots-const-id-list-bots-10-src-mq3-client-ui-teamorders-ml-1424193668"></a>
### ID_LIST_BOTS

```ml
const ID_LIST_BOTS = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L14)

<a id="constant-constant-mq3-client-ui-teamorders-id-list-ctf-orders-const-id-list-ctf-orders-11-src-mq3-client-ui-teamorders-ml-996547485"></a>
### ID_LIST_CTF_ORDERS

```ml
const ID_LIST_CTF_ORDERS = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L15)

<a id="constant-constant-mq3-client-ui-teamorders-id-list-team-orders-const-id-list-team-orders-12-src-mq3-client-ui-teamorders-ml-65023630"></a>
### ID_LIST_TEAM_ORDERS

```ml
const ID_LIST_TEAM_ORDERS = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L16)

<a id="function-function-mq3-client-ui-teamorders-playerinfo-function-playerinfo-playerinfos-index-src-mq3-client-ui-teamorders-ml-1250004024"></a>
### playerInfo

```ml
function playerInfo(playerInfos, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `playerInfos` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L43)

<a id="function-function-mq3-client-ui-teamorders-replacetarget-function-replacetarget-format-target-src-mq3-client-ui-teamorders-ml-1372215774"></a>
### replaceTarget

```ml
function replaceTarget(format, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `format` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L55)

- [mq3.client.ui_teamorders.State](Type-mq3-client-ui-teamorders-state-2023851947.md) — struct
<a id="constant-constant-mq3-client-ui-teamorders-team-spectator-const-team-spectator-3-src-mq3-client-ui-teamorders-ml-1944550244"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L19)

<a id="function-function-mq3-client-ui-teamorders-teammessages-function-teammessages-src-mq3-client-ui-teamorders-ml-1205892906"></a>
### teamMessages

```ml
function teamMessages()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L27)

<a id="function-function-mq3-client-ui-teamorders-teamorders-function-teamorders-src-mq3-client-ui-teamorders-ml-1273397110"></a>
### teamOrders

```ml
function teamOrders()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L26)

<a id="function-function-mq3-client-ui-teamorders-truncate-function-truncate-text-maxbytes-src-mq3-client-ui-teamorders-ml-990341900"></a>
### truncate

```ml
function truncate(text, maxBytes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `maxBytes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L30)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-function-ui-teamordersmenu-state-serverinfo-clientnum-playerinfos-src-mq3-client-ui-teamorders-ml-2119942771"></a>
### UI_TeamOrdersMenu

```ml
function UI_TeamOrdersMenu(state, serverInfo, clientNum, playerInfos)
```

UI_TeamOrdersMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverInfo` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `playerInfos` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L102)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-backevent-function-ui-teamordersmenu-backevent-state-event-src-mq3-client-ui-teamorders-ml-1637606155"></a>
### UI_TeamOrdersMenu_BackEvent

```ml
function UI_TeamOrdersMenu_BackEvent(state, event)
```

UI_TeamOrdersMenu_BackEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L46)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-buildbotlist-function-ui-teamordersmenu-buildbotlist-state-serverinfo-clientnum-playerinfos-src-mq3-client-ui-teamorders-ml-1917485875"></a>
### UI_TeamOrdersMenu_BuildBotList

```ml
function UI_TeamOrdersMenu_BuildBotList(state, serverInfo, clientNum, playerInfos)
```

UI_TeamOrdersMenu_BuildBotList

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverInfo` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `playerInfos` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L81)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-cache-function-ui-teamordersmenu-cache-state-src-mq3-client-ui-teamorders-ml-2103296275"></a>
### UI_TeamOrdersMenu_Cache

```ml
function UI_TeamOrdersMenu_Cache(state)
```

UI_TeamOrdersMenu_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L89)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-f-function-ui-teamordersmenu-f-state-serverinfo-clientnum-playerinfos-src-mq3-client-ui-teamorders-ml-531872185"></a>
### UI_TeamOrdersMenu_f

```ml
function UI_TeamOrdersMenu_f(state, serverInfo, clientNum, playerInfos)
```

UI_TeamOrdersMenu_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverInfo` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `playerInfos` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L105)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-init-function-ui-teamordersmenu-init-state-serverinfo-clientnum-playerinfos-src-mq3-client-ui-teamorders-ml-371978075"></a>
### UI_TeamOrdersMenu_Init

```ml
function UI_TeamOrdersMenu_Init(state, serverInfo, clientNum, playerInfos)
```

UI_TeamOrdersMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverInfo` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `playerInfos` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L92)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-key-function-ui-teamordersmenu-key-state-key-cursorx-cursory-src-mq3-client-ui-teamorders-ml-1620726999"></a>
### UI_TeamOrdersMenu_Key

```ml
function UI_TeamOrdersMenu_Key(state, key, cursorx, cursory)
```

UI_TeamOrdersMenu_Key

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `cursorx` | `dynamic` | — |  |
| `cursory` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L66)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-listdraw-function-ui-teamordersmenu-listdraw-state-src-mq3-client-ui-teamorders-ml-692649973"></a>
### UI_TeamOrdersMenu_ListDraw

```ml
function UI_TeamOrdersMenu_ListDraw(state)
```

UI_TeamOrdersMenu_ListDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L76)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-listevent-function-ui-teamordersmenu-listevent-state-event-src-mq3-client-ui-teamorders-ml-1821193677"></a>
### UI_TeamOrdersMenu_ListEvent

```ml
function UI_TeamOrdersMenu_ListEvent(state, event)
```

UI_TeamOrdersMenu_ListEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L58)

<a id="function-function-mq3-client-ui-teamorders-ui-teamordersmenu-setlist-function-ui-teamordersmenu-setlist-state-id-src-mq3-client-ui-teamorders-ml-330205372"></a>
### UI_TeamOrdersMenu_SetList

```ml
function UI_TeamOrdersMenu_SetList(state, id)
```

UI_TeamOrdersMenu_SetList

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L51)
