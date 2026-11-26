# `src/mq3/client/ui_add_bots.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_add_bots`](Package-mq3-client-ui-add-bots-1680524298.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_gameinfo.ml` as `game` → [src/mq3/client/ui_gameinfo.ml](File-src-mq3-client-ui-gameinfo-ml-965434910.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.ui_add_bots.Action](Type-mq3-client-ui-add-bots-action-799496286.md) — struct
<a id="function-function-mq3-client-ui-add-bots-addbotsmenu-function-addbotsmenu-state-gametype-spskill-src-mq3-client-ui-add-bots-ml-2114320101"></a>
### addBotsMenu

```ml
function addBotsMenu(state, gametype, spSkill)
```

UI_AddBotsMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `gametype` | `dynamic` | — |  |
| `spSkill` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L70)

<a id="constant-constant-mq3-client-ui-add-bots-art-arrowdown-const-art-arrowdown-menu-art-arrows-vert-bot-src-mq3-client-ui-add-bots-ml-1118234397"></a>
### ART_ARROWDOWN

```ml
const ART_ARROWDOWN = "menu/art/arrows_vert_bot"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L28)

<a id="constant-constant-mq3-client-ui-add-bots-art-arrows-const-art-arrows-menu-art-arrows-vert-0-src-mq3-client-ui-add-bots-ml-188168760"></a>
### ART_ARROWS

```ml
const ART_ARROWS = "menu/art/arrows_vert_0"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L26)

<a id="constant-constant-mq3-client-ui-add-bots-art-arrowup-const-art-arrowup-menu-art-arrows-vert-top-src-mq3-client-ui-add-bots-ml-910404947"></a>
### ART_ARROWUP

```ml
const ART_ARROWUP = "menu/art/arrows_vert_top"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L27)

<a id="constant-constant-mq3-client-ui-add-bots-art-back0-const-art-back0-menu-art-back-0-src-mq3-client-ui-add-bots-ml-1122787427"></a>
### ART_BACK0

```ml
const ART_BACK0 = "menu/art/back_0"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L21)

<a id="constant-constant-mq3-client-ui-add-bots-art-back1-const-art-back1-menu-art-back-1-src-mq3-client-ui-add-bots-ml-643881542"></a>
### ART_BACK1

```ml
const ART_BACK1 = "menu/art/back_1"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L22)

<a id="constant-constant-mq3-client-ui-add-bots-art-background-const-art-background-menu-art-addbotframe-src-mq3-client-ui-add-bots-ml-1791805862"></a>
### ART_BACKGROUND

```ml
const ART_BACKGROUND = "menu/art/addbotframe"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L25)

<a id="constant-constant-mq3-client-ui-add-bots-art-fight0-const-art-fight0-menu-art-accept-0-src-mq3-client-ui-add-bots-ml-907094468"></a>
### ART_FIGHT0

```ml
const ART_FIGHT0 = "menu/art/accept_0"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L23)

<a id="constant-constant-mq3-client-ui-add-bots-art-fight1-const-art-fight1-menu-art-accept-1-src-mq3-client-ui-add-bots-ml-696959319"></a>
### ART_FIGHT1

```ml
const ART_FIGHT1 = "menu/art/accept_1"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L24)

<a id="function-function-mq3-client-ui-add-bots-backevent-function-backevent-state-event-src-mq3-client-ui-add-bots-ml-2089557517"></a>
### backEvent

```ml
function backEvent(state, event)
```

UI_AddBotsMenu_BackEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L57)

<a id="function-function-mq3-client-ui-add-bots-botevent-function-botevent-state-id-event-src-mq3-client-ui-add-bots-ml-1902110842"></a>
### botEvent

```ml
function botEvent(state, id, event)
```

UI_AddBotsMenu_BotEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L55)

<a id="function-function-mq3-client-ui-add-bots-cache-function-cache-state-src-mq3-client-ui-add-bots-ml-1702656405"></a>
### cache

```ml
function cache(state)
```

UI_AddBots_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L64)

<a id="function-function-mq3-client-ui-add-bots-comparenames-function-comparenames-left-right-src-mq3-client-ui-add-bots-ml-1137370753"></a>
### compareNames

```ml
function compareNames(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L35)

<a id="function-function-mq3-client-ui-add-bots-create-function-create-data-retailactive-src-mq3-client-ui-add-bots-ml-1444973133"></a>
### create

```ml
function create(data, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L33)

<a id="function-function-mq3-client-ui-add-bots-downevent-function-downevent-state-event-src-mq3-client-ui-add-bots-ml-735871359"></a>
### downEvent

```ml
function downEvent(state, event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L60)

<a id="function-function-mq3-client-ui-add-bots-draw-function-draw-state-src-mq3-client-ui-add-bots-ml-1599315541"></a>
### draw

```ml
function draw(state)
```

UI_AddBotsMenu_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L62)

<a id="function-function-mq3-client-ui-add-bots-emit-function-emit-state-kind-name-text-value-src-mq3-client-ui-add-bots-ml-1213056058"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L34)

<a id="function-function-mq3-client-ui-add-bots-fightevent-function-fightevent-state-event-src-mq3-client-ui-add-bots-ml-270051291"></a>
### fightEvent

```ml
function fightEvent(state, event)
```

UI_AddBotsMenu_FightEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L51)

<a id="function-function-mq3-client-ui-add-bots-getsortedbotnums-function-getsortedbotnums-state-src-mq3-client-ui-add-bots-ml-1018533945"></a>
### getSortedBotNums

```ml
function getSortedBotNums(state)
```

UI_AddBotsMenu_GetSortedBotNums

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L42)

<a id="constant-constant-mq3-client-ui-add-bots-gt-team-const-gt-team-3-src-mq3-client-ui-add-bots-ml-1498618060"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L12)

<a id="constant-constant-mq3-client-ui-add-bots-id-back-const-id-back-10-src-mq3-client-ui-add-bots-ml-339466612"></a>
### ID_BACK

```ml
const ID_BACK = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L13)

<a id="constant-constant-mq3-client-ui-add-bots-id-botname0-const-id-botname0-20-src-mq3-client-ui-add-bots-ml-466826327"></a>
### ID_BOTNAME0

```ml
const ID_BOTNAME0 = 20
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L20)

<a id="constant-constant-mq3-client-ui-add-bots-id-down-const-id-down-14-src-mq3-client-ui-add-bots-ml-1201829916"></a>
### ID_DOWN

```ml
const ID_DOWN = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L17)

<a id="constant-constant-mq3-client-ui-add-bots-id-go-const-id-go-11-src-mq3-client-ui-add-bots-ml-2083912119"></a>
### ID_GO

```ml
const ID_GO = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L14)

<a id="constant-constant-mq3-client-ui-add-bots-id-list-const-id-list-12-src-mq3-client-ui-add-bots-ml-296043086"></a>
### ID_LIST

```ml
const ID_LIST = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L15)

<a id="constant-constant-mq3-client-ui-add-bots-id-skill-const-id-skill-15-src-mq3-client-ui-add-bots-ml-641690259"></a>
### ID_SKILL

```ml
const ID_SKILL = 15
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L18)

<a id="constant-constant-mq3-client-ui-add-bots-id-team-const-id-team-16-src-mq3-client-ui-add-bots-ml-1732286186"></a>
### ID_TEAM

```ml
const ID_TEAM = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L19)

<a id="constant-constant-mq3-client-ui-add-bots-id-up-const-id-up-13-src-mq3-client-ui-add-bots-ml-570373529"></a>
### ID_UP

```ml
const ID_UP = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L16)

<a id="function-function-mq3-client-ui-add-bots-init-function-init-state-gametype-spskill-src-mq3-client-ui-add-bots-ml-283164117"></a>
### init

```ml
function init(state, gametype, spSkill)
```

UI_AddBotsMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `gametype` | `dynamic` | — |  |
| `spSkill` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L66)

<a id="constant-constant-mq3-client-ui-add-bots-qm-activated-const-qm-activated-3-src-mq3-client-ui-add-bots-ml-900327478"></a>
### QM_ACTIVATED

```ml
const QM_ACTIVATED = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L11)

<a id="function-function-mq3-client-ui-add-bots-setbotnames-function-setbotnames-state-src-mq3-client-ui-add-bots-ml-1079461699"></a>
### setBotNames

```ml
function setBotNames(state)
```

UI_AddBotsMenu_SetBotNames

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L47)

<a id="function-function-mq3-client-ui-add-bots-sortcompare-function-sortcompare-state-first-second-src-mq3-client-ui-add-bots-ml-61158379"></a>
### sortCompare

```ml
function sortCompare(state, first, second)
```

UI_AddBotsMenu_SortCompare

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L40)

- [mq3.client.ui_add_bots.State](Type-mq3-client-ui-add-bots-state-596914609.md) — struct
<a id="function-function-mq3-client-ui-add-bots-upevent-function-upevent-state-event-src-mq3-client-ui-add-bots-ml-145225133"></a>
### upEvent

```ml
function upEvent(state, event)
```

UI_AddBotsMenu_UpEvent / UI_AddBotsMenu_DownEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_add_bots.ml#L59)
