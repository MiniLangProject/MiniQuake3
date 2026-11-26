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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L22)

<a id="constant-constant-mq3-client-ui-remove-bots-art-arrows-const-art-arrows-menu-art-arrows-vert-0-src-mq3-client-ui-remove-bots-ml-810587772"></a>
### ART_ARROWS

```ml
const ART_ARROWS = "menu/art/arrows_vert_0"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L20)

<a id="constant-constant-mq3-client-ui-remove-bots-art-arrowup-const-art-arrowup-menu-art-arrows-vert-top-src-mq3-client-ui-remove-bots-ml-1165472869"></a>
### ART_ARROWUP

```ml
const ART_ARROWUP = "menu/art/arrows_vert_top"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L21)

<a id="constant-constant-mq3-client-ui-remove-bots-art-back0-const-art-back0-menu-art-back-0-src-mq3-client-ui-remove-bots-ml-475221855"></a>
### ART_BACK0

```ml
const ART_BACK0 = "menu/art/back_0"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L16)

<a id="constant-constant-mq3-client-ui-remove-bots-art-back1-const-art-back1-menu-art-back-1-src-mq3-client-ui-remove-bots-ml-650354444"></a>
### ART_BACK1

```ml
const ART_BACK1 = "menu/art/back_1"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L17)

<a id="constant-constant-mq3-client-ui-remove-bots-art-background-const-art-background-menu-art-addbotframe-src-mq3-client-ui-remove-bots-ml-1912749782"></a>
### ART_BACKGROUND

```ml
const ART_BACKGROUND = "menu/art/addbotframe"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L15)

<a id="constant-constant-mq3-client-ui-remove-bots-art-delete0-const-art-delete0-menu-art-delete-0-src-mq3-client-ui-remove-bots-ml-1950647091"></a>
### ART_DELETE0

```ml
const ART_DELETE0 = "menu/art/delete_0"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L18)

<a id="constant-constant-mq3-client-ui-remove-bots-art-delete1-const-art-delete1-menu-art-delete-1-src-mq3-client-ui-remove-bots-ml-20289880"></a>
### ART_DELETE1

```ml
const ART_DELETE1 = "menu/art/delete_1"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L19)

<a id="function-function-mq3-client-ui-remove-bots-backevent-function-backevent-state-event-src-mq3-client-ui-remove-bots-ml-1259287283"></a>
### backEvent

```ml
function backEvent(state, event)
```

UI_RemoveBotsMenu_BackEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L44)

<a id="function-function-mq3-client-ui-remove-bots-botevent-function-botevent-state-id-event-src-mq3-client-ui-remove-bots-ml-967789322"></a>
### botEvent

```ml
function botEvent(state, id, event)
```

UI_RemoveBotsMenu_BotEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L42)

<a id="function-function-mq3-client-ui-remove-bots-cache-function-cache-state-src-mq3-client-ui-remove-bots-ml-1387902013"></a>
### cache

```ml
function cache(state)
```

UI_RemoveBots_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L49)

<a id="function-function-mq3-client-ui-remove-bots-clean-function-clean-value-src-mq3-client-ui-remove-bots-ml-1765712615"></a>
### clean

```ml
function clean(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L29)

<a id="function-function-mq3-client-ui-remove-bots-create-function-create-retailactive-src-mq3-client-ui-remove-bots-ml-1704023151"></a>
### create

```ml
function create(retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L27)

<a id="function-function-mq3-client-ui-remove-bots-deleteevent-function-deleteevent-state-event-src-mq3-client-ui-remove-bots-ml-482823747"></a>
### deleteEvent

```ml
function deleteEvent(state, event)
```

UI_RemoveBotsMenu_DeleteEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L40)

<a id="function-function-mq3-client-ui-remove-bots-downevent-function-downevent-state-event-src-mq3-client-ui-remove-bots-ml-433972905"></a>
### downEvent

```ml
function downEvent(state, event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L47)

<a id="function-function-mq3-client-ui-remove-bots-emit-function-emit-state-kind-name-text-value-src-mq3-client-ui-remove-bots-ml-839624522"></a>
### emit

```ml
function emit(state, kind, name, text, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L28)

<a id="function-function-mq3-client-ui-remove-bots-getbots-function-getbots-state-serverinfo-playerinfos-src-mq3-client-ui-remove-bots-ml-1889433770"></a>
### getBots

```ml
function getBots(state, serverInfo, playerInfos)
```

UI_RemoveBotsMenu_GetBots

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverInfo` | `dynamic` | — |  |
| `playerInfos` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L32)

<a id="constant-constant-mq3-client-ui-remove-bots-id-back-const-id-back-13-src-mq3-client-ui-remove-bots-ml-354287039"></a>
### ID_BACK

```ml
const ID_BACK = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L13)

<a id="constant-constant-mq3-client-ui-remove-bots-id-botname0-const-id-botname0-20-src-mq3-client-ui-remove-bots-ml-665892321"></a>
### ID_BOTNAME0

```ml
const ID_BOTNAME0 = 20
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L14)

<a id="constant-constant-mq3-client-ui-remove-bots-id-delete-const-id-delete-12-src-mq3-client-ui-remove-bots-ml-1321951626"></a>
### ID_DELETE

```ml
const ID_DELETE = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L12)

<a id="constant-constant-mq3-client-ui-remove-bots-id-down-const-id-down-11-src-mq3-client-ui-remove-bots-ml-1866244597"></a>
### ID_DOWN

```ml
const ID_DOWN = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L11)

<a id="constant-constant-mq3-client-ui-remove-bots-id-up-const-id-up-10-src-mq3-client-ui-remove-bots-ml-210256240"></a>
### ID_UP

```ml
const ID_UP = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L10)

<a id="function-function-mq3-client-ui-remove-bots-init-function-init-state-serverinfo-playerinfos-src-mq3-client-ui-remove-bots-ml-1373067018"></a>
### init

```ml
function init(state, serverInfo, playerInfos)
```

UI_RemoveBotsMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverInfo` | `dynamic` | — |  |
| `playerInfos` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L51)

<a id="constant-constant-mq3-client-ui-remove-bots-qm-activated-const-qm-activated-3-src-mq3-client-ui-remove-bots-ml-1405694944"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L9)

<a id="function-function-mq3-client-ui-remove-bots-removebotsmenu-function-removebotsmenu-state-serverinfo-playerinfos-src-mq3-client-ui-remove-bots-ml-716612914"></a>
### removeBotsMenu

```ml
function removeBotsMenu(state, serverInfo, playerInfos)
```

UI_RemoveBotsMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverInfo` | `dynamic` | — |  |
| `playerInfos` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L53)

<a id="function-function-mq3-client-ui-remove-bots-setbotnames-function-setbotnames-state-src-mq3-client-ui-remove-bots-ml-914433547"></a>
### setBotNames

```ml
function setBotNames(state)
```

UI_RemoveBotsMenu_SetBotNames

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L36)

- [mq3.client.ui_remove_bots.State](Type-mq3-client-ui-remove-bots-state-1890596504.md) — struct
<a id="function-function-mq3-client-ui-remove-bots-upevent-function-upevent-state-event-src-mq3-client-ui-remove-bots-ml-59274575"></a>
### upEvent

```ml
function upEvent(state, event)
```

UI_RemoveBotsMenu_UpEvent / UI_RemoveBotsMenu_DownEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_remove_bots.ml#L46)
