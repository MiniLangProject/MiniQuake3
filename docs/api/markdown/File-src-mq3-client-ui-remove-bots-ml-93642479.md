# `src/mq3/client/ui_remove_bots.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_remove_bots`](Package-mq3-client-ui-remove-bots-1574749923.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

- [mq3.client.ui_remove_bots.Action](Type-mq3-client-ui-remove-bots-action-2008523853.md) — struct
<a id="constant-constant-mq3-client-ui-remove-bots-art-arrowdown-const-art-arrowdown-menu-art-arrows-vert-bot-src-mq3-client-ui-remove-bots-ml-818658755"></a>
### ART_ARROWDOWN

```ml
const ART_ARROWDOWN = "menu/art/arrows_vert_bot"
```

Virtual shader or image asset name used for the menu's arrowdown artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L37)

<a id="constant-constant-mq3-client-ui-remove-bots-art-arrows-const-art-arrows-menu-art-arrows-vert-0-src-mq3-client-ui-remove-bots-ml-810587772"></a>
### ART_ARROWS

```ml
const ART_ARROWS = "menu/art/arrows_vert_0"
```

Virtual shader or image asset name used for the menu's arrows artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L33)

<a id="constant-constant-mq3-client-ui-remove-bots-art-arrowup-const-art-arrowup-menu-art-arrows-vert-top-src-mq3-client-ui-remove-bots-ml-1165472869"></a>
### ART_ARROWUP

```ml
const ART_ARROWUP = "menu/art/arrows_vert_top"
```

Virtual shader or image asset name used for the menu's arrowup artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L35)

<a id="constant-constant-mq3-client-ui-remove-bots-art-back0-const-art-back0-menu-art-back-0-src-mq3-client-ui-remove-bots-ml-475221855"></a>
### ART_BACK0

```ml
const ART_BACK0 = "menu/art/back_0"
```

Virtual shader or image asset name used for the menu's back0 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L25)

<a id="constant-constant-mq3-client-ui-remove-bots-art-back1-const-art-back1-menu-art-back-1-src-mq3-client-ui-remove-bots-ml-650354444"></a>
### ART_BACK1

```ml
const ART_BACK1 = "menu/art/back_1"
```

Virtual shader or image asset name used for the menu's back1 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L27)

<a id="constant-constant-mq3-client-ui-remove-bots-art-background-const-art-background-menu-art-addbotframe-src-mq3-client-ui-remove-bots-ml-1912749782"></a>
### ART_BACKGROUND

```ml
const ART_BACKGROUND = "menu/art/addbotframe"
```

Virtual shader or image asset name used for the menu's background artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L23)

<a id="constant-constant-mq3-client-ui-remove-bots-art-delete0-const-art-delete0-menu-art-delete-0-src-mq3-client-ui-remove-bots-ml-1950647091"></a>
### ART_DELETE0

```ml
const ART_DELETE0 = "menu/art/delete_0"
```

Virtual shader or image asset name used for the menu's delete0 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L29)

<a id="constant-constant-mq3-client-ui-remove-bots-art-delete1-const-art-delete1-menu-art-delete-1-src-mq3-client-ui-remove-bots-ml-20289880"></a>
### ART_DELETE1

```ml
const ART_DELETE1 = "menu/art/delete_1"
```

Virtual shader or image asset name used for the menu's delete1 artwork.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L31)

<a id="function-function-mq3-client-ui-remove-bots-backevent-function-backevent-state-event-src-mq3-client-ui-remove-bots-ml-1259287283"></a>
### backEvent

```ml
function backEvent(state, event)
```

UI_RemoveBotsMenu_BackEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI remove bots record/storage; this routine assigns `state.menuEvents`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L134)

<a id="function-function-mq3-client-ui-remove-bots-botevent-function-botevent-state-id-event-src-mq3-client-ui-remove-bots-ml-967789322"></a>
### botEvent

```ml
function botEvent(state, id, event)
```

UI_RemoveBotsMenu_BotEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI remove bots record/storage; this routine assigns `state.selectedBotNum`. |
| `id` | `dynamic` | — | Value used by `selected=id-ID_BOTNAME0`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L130)

<a id="function-function-mq3-client-ui-remove-bots-cache-function-cache-state-src-mq3-client-ui-remove-bots-ml-1387902013"></a>
### cache

```ml
function cache(state)
```

UI_RemoveBots_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI remove bots record/storage; this routine assigns `state.cached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L145)

<a id="function-function-mq3-client-ui-remove-bots-clean-function-clean-value-src-mq3-client-ui-remove-bots-ml-1765712615"></a>
### clean

```ml
function clean(value)
```

Evaluates UI remove bots `clean` and returns `result` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[at]`, `value[at+1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L108)

<a id="function-function-mq3-client-ui-remove-bots-create-function-create-retailactive-src-mq3-client-ui-remove-bots-ml-1704023151"></a>
### create

```ml
function create(retailActive)
```

Creates a `mq3.client.ui_remove_bots.State` record. Assigns `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Value used to initialize `State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L98)

<a id="function-function-mq3-client-ui-remove-bots-deleteevent-function-deleteevent-state-event-src-mq3-client-ui-remove-bots-ml-482823747"></a>
### deleteEvent

```ml
function deleteEvent(state, event)
```

UI_RemoveBotsMenu_DeleteEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.numBots`, `state.baseBotNum`, `state.selectedBotNum`, `state.botClientNums`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L125)

<a id="function-function-mq3-client-ui-remove-bots-downevent-function-downevent-state-event-src-mq3-client-ui-remove-bots-ml-433972905"></a>
### downEvent

```ml
function downEvent(state, event)
```

Updates `state.baseBotNum` during UI remove bots `downEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI remove bots record/storage; this routine assigns `state.baseBotNum`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L142)

<a id="function-function-mq3-client-ui-remove-bots-emit-function-emit-state-kind-name-text-value-src-mq3-client-ui-remove-bots-ml-839624522"></a>
### emit

```ml
function emit(state, kind, name, text, value)
```

Appends a UI remove bots action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI remove bots record/storage; this routine assigns `state.actions`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI remove bots resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI remove bots path. |
| `value` | `dynamic` | — | Value used by `item=Action("ui-remove-bots",kind,name,text,value,not state.retailActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L105)

<a id="function-function-mq3-client-ui-remove-bots-getbots-function-getbots-state-serverinfo-playerinfos-src-mq3-client-ui-remove-bots-ml-1889433770"></a>
### getBots

```ml
function getBots(state, serverInfo, playerInfos)
```

UI_RemoveBotsMenu_GetBots

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI remove bots record/storage; this routine assigns `state.playerInfos`, `state.botClientNums`, `state.numBots`. |
| `serverInfo` | `dynamic` | — | Value used by `maxClients=numbers.atoi(info.value(serverInfo,"sv_maxclients"))`. |
| `playerInfos` | `dynamic` | — | Sequence read at `playerInfos[n]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L114)

<a id="constant-constant-mq3-client-ui-remove-bots-id-back-const-id-back-13-src-mq3-client-ui-remove-bots-ml-354287039"></a>
### ID_BACK

```ml
const ID_BACK = 13
```

Native Back-control identifier exposed by the Remove Bots menu for leaving bot selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L19)

<a id="constant-constant-mq3-client-ui-remove-bots-id-botname0-const-id-botname0-20-src-mq3-client-ui-remove-bots-ml-665892321"></a>
### ID_BOTNAME0

```ml
const ID_BOTNAME0 = 20
```

Menu control identifier routed to the botname0 action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L21)

<a id="constant-constant-mq3-client-ui-remove-bots-id-delete-const-id-delete-12-src-mq3-client-ui-remove-bots-ml-1321951626"></a>
### ID_DELETE

```ml
const ID_DELETE = 12
```

Menu control identifier routed to the delete action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L17)

<a id="constant-constant-mq3-client-ui-remove-bots-id-down-const-id-down-11-src-mq3-client-ui-remove-bots-ml-1866244597"></a>
### ID_DOWN

```ml
const ID_DOWN = 11
```

Menu control identifier routed to the down action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L15)

<a id="constant-constant-mq3-client-ui-remove-bots-id-up-const-id-up-10-src-mq3-client-ui-remove-bots-ml-210256240"></a>
### ID_UP

```ml
const ID_UP = 10
```

Menu control identifier routed to the up action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L13)

<a id="function-function-mq3-client-ui-remove-bots-init-function-init-state-serverinfo-playerinfos-src-mq3-client-ui-remove-bots-ml-1373067018"></a>
### init

```ml
function init(state, serverInfo, playerInfos)
```

UI_RemoveBotsMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI remove bots record/storage; this routine assigns `state.actions`, `state.menuEvents`, `state.baseBotNum`, `state.selectedBotNum` and additional values. |
| `serverInfo` | `dynamic` | — | Value used by `getBots(state,serverInfo,playerInfos)`. |
| `playerInfos` | `dynamic` | — | Value used by `getBots(state,serverInfo,playerInfos)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L150)

<a id="constant-constant-mq3-client-ui-remove-bots-qm-activated-const-qm-activated-3-src-mq3-client-ui-remove-bots-ml-1405694944"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```

Activation callback event accepted by the Remove Bots menu before it processes the selected control action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L11)

<a id="function-function-mq3-client-ui-remove-bots-removebotsmenu-function-removebotsmenu-state-serverinfo-playerinfos-src-mq3-client-ui-remove-bots-ml-716612914"></a>
### removeBotsMenu

```ml
function removeBotsMenu(state, serverInfo, playerInfos)
```

UI_RemoveBotsMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI remove bots record/storage; this routine assigns `state.pushed`, `state.menuEvents`. |
| `serverInfo` | `dynamic` | — | Value used by `init(state,serverInfo,playerInfos)`. |
| `playerInfos` | `dynamic` | — | Value used by `init(state,serverInfo,playerInfos)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L155)

<a id="function-function-mq3-client-ui-remove-bots-setbotnames-function-setbotnames-state-src-mq3-client-ui-remove-bots-ml-914433547"></a>
### setBotNames

```ml
function setBotNames(state)
```

UI_RemoveBotsMenu_SetBotNames

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI remove bots record/storage; this routine assigns `state.botnames`, `state.botnames[n]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L119)

- [mq3.client.ui_remove_bots.State](Type-mq3-client-ui-remove-bots-state-1890596504.md) — struct
<a id="function-function-mq3-client-ui-remove-bots-upevent-function-upevent-state-event-src-mq3-client-ui-remove-bots-ml-59274575"></a>
### upEvent

```ml
function upEvent(state, event)
```

UI_RemoveBotsMenu_UpEvent / UI_RemoveBotsMenu_DownEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI remove bots record/storage; this routine assigns `state.baseBotNum`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L138)
