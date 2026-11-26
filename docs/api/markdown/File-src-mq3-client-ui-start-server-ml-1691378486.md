# `src/mq3/client/ui_start_server.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_start_server`](Package-mq3-client-ui-start-server-334102322.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.ui_start_server.Action](Type-mq3-client-ui-start-server-action-1065815126.md) — struct
- [mq3.client.ui_start_server.Arena](Type-mq3-client-ui-start-server-arena-1042070875.md) — struct
- [mq3.client.ui_start_server.Bot](Type-mq3-client-ui-start-server-bot-633909945.md) — struct
<a id="function-function-mq3-client-ui-start-server-botalreadyselected-function-botalreadyselected-value-name-src-mq3-client-ui-start-server-ml-2112507136"></a>
### botAlreadySelected

```ml
function botAlreadySelected(value, name)
```

BotAlreadySelected

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L47)

<a id="constant-constant-mq3-client-ui-start-server-bots-per-page-const-bots-per-page-16-src-mq3-client-ui-start-server-ml-1920905954"></a>
### BOTS_PER_PAGE

```ml
const BOTS_PER_PAGE = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L14)

<a id="function-function-mq3-client-ui-start-server-botselectbackevent-function-botselectbackevent-state-activated-retailactive-src-mq3-client-ui-start-server-ml-564280901"></a>
### botSelectBackEvent

```ml
function botSelectBackEvent(state, activated, retailActive)
```

UI_BotSelectMenu_BackEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `activated` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L92)

<a id="function-function-mq3-client-ui-start-server-botselectbotevent-function-botselectbotevent-state-index-activated-src-mq3-client-ui-start-server-ml-1653408672"></a>
### botSelectBotEvent

```ml
function botSelectBotEvent(state, index, activated)
```

UI_BotSelectMenu_BotEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `activated` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L90)

<a id="function-function-mq3-client-ui-start-server-botselectbuildlist-function-botselectbuildlist-state-bots-src-mq3-client-ui-start-server-ml-1434928179"></a>
### botSelectBuildList

```ml
function botSelectBuildList(state, bots)
```

UI_BotSelectMenu_BuildList

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bots` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L78)

<a id="function-function-mq3-client-ui-start-server-botselectcache-function-botselectcache-state-retailactive-src-mq3-client-ui-start-server-ml-1269244714"></a>
### botSelectCache

```ml
function botSelectCache(state, retailActive)
```

UI_BotSelectMenu_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L96)

<a id="function-function-mq3-client-ui-start-server-botselectdefault-function-botselectdefault-state-name-src-mq3-client-ui-start-server-ml-1852028380"></a>
### botSelectDefault

```ml
function botSelectDefault(state, name)
```

UI_BotSelectMenu_Default

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L84)

<a id="function-function-mq3-client-ui-start-server-botselectinit-function-botselectinit-state-value-bots-selected-src-mq3-client-ui-start-server-ml-1675394279"></a>
### botSelectInit

```ml
function botSelectInit(state, value, bots, selected)
```

UI_BotSelectMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `bots` | `dynamic` | — |  |
| `selected` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L98)

<a id="function-function-mq3-client-ui-start-server-botselectleftevent-function-botselectleftevent-state-value-activated-src-mq3-client-ui-start-server-ml-1531069433"></a>
### botSelectLeftEvent

```ml
function botSelectLeftEvent(state, value, activated)
```

UI_BotSelectMenu_LeftEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `activated` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L86)

<a id="function-function-mq3-client-ui-start-server-botselectrightevent-function-botselectrightevent-state-value-activated-src-mq3-client-ui-start-server-ml-56280203"></a>
### botSelectRightEvent

```ml
function botSelectRightEvent(state, value, activated)
```

UI_BotSelectMenu_RightEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `activated` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L88)

<a id="function-function-mq3-client-ui-start-server-botselectselectevent-function-botselectselectevent-state-value-activated-retailactive-src-mq3-client-ui-start-server-ml-1186996870"></a>
### botSelectSelectEvent

```ml
function botSelectSelectEvent(state, value, activated, retailActive)
```

UI_BotSelectMenu_SelectEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `activated` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L94)

<a id="function-function-mq3-client-ui-start-server-botselectupdategrid-function-botselectupdategrid-state-value-src-mq3-client-ui-start-server-ml-1247085780"></a>
### botSelectUpdateGrid

```ml
function botSelectUpdateGrid(state, value)
```

UI_BotSelectMenu_UpdateGrid

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L82)

<a id="function-function-mq3-client-ui-start-server-botsortcompare-function-botsortcompare-a-b-src-mq3-client-ui-start-server-ml-1630197159"></a>
### botSortCompare

```ml
function botSortCompare(a, b)
```

UI_BotSelectMenu_SortCompare

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L76)

<a id="function-function-mq3-client-ui-start-server-botstate-function-botstate-src-mq3-client-ui-start-server-ml-1694716830"></a>
### botState

```ml
function botState()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L23)

- [mq3.client.ui_start_server.BotState](Type-mq3-client-ui-start-server-botstate-448919066.md) — struct
<a id="function-function-mq3-client-ui-start-server-clamp-function-clamp-value-low-high-src-mq3-client-ui-start-server-ml-1390054851"></a>
### clamp

```ml
function clamp(value, low, high)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `low` | `dynamic` | — |  |
| `high` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L48)

<a id="function-function-mq3-client-ui-start-server-emit-function-emit-actions-boundary-kind-name-value-number-retailactive-src-mq3-client-ui-start-server-ml-1214547961"></a>
### emit

```ml
function emit(actions, boundary, kind, name, value, number, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `actions` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L24)

<a id="function-function-mq3-client-ui-start-server-gametypebits-function-gametypebits-text-src-mq3-client-ui-start-server-ml-866165391"></a>
### gametypeBits

```ml
function gametypeBits(text)
```

GametypeBits

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L27)

<a id="constant-constant-mq3-client-ui-start-server-gt-ctf-const-gt-ctf-4-src-mq3-client-ui-start-server-ml-124563005"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L11)

<a id="constant-constant-mq3-client-ui-start-server-gt-ffa-const-gt-ffa-0-src-mq3-client-ui-start-server-ml-1387121249"></a>
### GT_FFA

```ml
const GT_FFA = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L7)

<a id="constant-constant-mq3-client-ui-start-server-gt-single-player-const-gt-single-player-2-src-mq3-client-ui-start-server-ml-451616657"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L9)

<a id="constant-constant-mq3-client-ui-start-server-gt-team-const-gt-team-3-src-mq3-client-ui-start-server-ml-423586784"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L10)

<a id="constant-constant-mq3-client-ui-start-server-gt-tournament-const-gt-tournament-1-src-mq3-client-ui-start-server-ml-189917802"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L8)

<a id="constant-constant-mq3-client-ui-start-server-maps-per-page-const-maps-per-page-4-src-mq3-client-ui-start-server-ml-1473917485"></a>
### MAPS_PER_PAGE

```ml
const MAPS_PER_PAGE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L13)

<a id="function-function-mq3-client-ui-start-server-ntrunc-function-ntrunc-value-src-mq3-client-ui-start-server-ml-1943877157"></a>
### ntrunc

```ml
function ntrunc(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L31)

<a id="function-function-mq3-client-ui-start-server-options-function-options-src-mq3-client-ui-start-server-ml-882400766"></a>
### options

```ml
function options()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L22)

- [mq3.client.ui_start_server.Options](Type-mq3-client-ui-start-server-options-1771769706.md) — struct
<a id="constant-constant-mq3-client-ui-start-server-player-slots-const-player-slots-12-src-mq3-client-ui-start-server-ml-555162890"></a>
### PLAYER_SLOTS

```ml
const PLAYER_SLOTS = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L12)

<a id="function-function-mq3-client-ui-start-server-playernamedraw-function-playernamedraw-value-index-focused-retailactive-src-mq3-client-ui-start-server-ml-353289897"></a>
### playerNameDraw

```ml
function playerNameDraw(value, index, focused, retailActive)
```

PlayerName_Draw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `focused` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L68)

<a id="function-function-mq3-client-ui-start-server-remapgametype-function-remapgametype-index-src-mq3-client-ui-start-server-ml-892855352"></a>
### remapGametype

```ml
function remapGametype(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L28)

<a id="function-function-mq3-client-ui-start-server-serveroptionscache-function-serveroptionscache-value-retailactive-src-mq3-client-ui-start-server-ml-859055806"></a>
### serverOptionsCache

```ml
function serverOptionsCache(value, retailActive)
```

ServerOptions_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L72)

<a id="function-function-mq3-client-ui-start-server-serveroptionsevent-function-serveroptionsevent-value-id-activated-retailactive-src-mq3-client-ui-start-server-ml-620892408"></a>
### serverOptionsEvent

```ml
function serverOptionsEvent(value, id, activated, retailActive)
```

ServerOptions_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `activated` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L56)

<a id="function-function-mq3-client-ui-start-server-serveroptionsinitbotnames-function-serveroptionsinitbotnames-value-arena-bots-src-mq3-client-ui-start-server-ml-1050053124"></a>
### serverOptionsInitBotNames

```ml
function serverOptionsInitBotNames(value, arena, bots)
```

ServerOptions_InitBotNames

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `arena` | `dynamic` | — |  |
| `bots` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L64)

<a id="function-function-mq3-client-ui-start-server-serveroptionsinitplayeritems-function-serveroptionsinitplayeritems-value-playername-src-mq3-client-ui-start-server-ml-1903605691"></a>
### serverOptionsInitPlayerItems

```ml
function serverOptionsInitPlayerItems(value, playerName)
```

ServerOptions_InitPlayerItems

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `playerName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L52)

<a id="function-function-mq3-client-ui-start-server-serveroptionslevelshotdraw-function-serveroptionslevelshotdraw-value-retailactive-src-mq3-client-ui-start-server-ml-752743210"></a>
### serverOptionsLevelshotDraw

```ml
function serverOptionsLevelshotDraw(value, retailActive)
```

ServerOptions_LevelshotDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L62)

<a id="function-function-mq3-client-ui-start-server-serveroptionsmenuinit-function-serveroptionsmenuinit-value-multiplayer-gametype-mapname-playername-arena-bots-src-mq3-client-ui-start-server-ml-681174561"></a>
### serverOptionsMenuInit

```ml
function serverOptionsMenuInit(value, multiplayer, gametype, mapName, playerName, arena, bots)
```

ServerOptions_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `multiplayer` | `dynamic` | — |  |
| `gametype` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `playerName` | `dynamic` | — |  |
| `arena` | `dynamic` | — |  |
| `bots` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L70)

<a id="function-function-mq3-client-ui-start-server-serveroptionsplayernameevent-function-serveroptionsplayernameevent-value-index-activated-retailactive-src-mq3-client-ui-start-server-ml-759716343"></a>
### serverOptionsPlayerNameEvent

```ml
function serverOptionsPlayerNameEvent(value, index, activated, retailActive)
```

ServerOptions_PlayerNameEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `activated` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L58)

<a id="function-function-mq3-client-ui-start-server-serveroptionssetmenuitems-function-serveroptionssetmenuitems-value-mapname-playername-arena-bots-src-mq3-client-ui-start-server-ml-764136673"></a>
### serverOptionsSetMenuItems

```ml
function serverOptionsSetMenuItems(value, mapName, playerName, arena, bots)
```

ServerOptions_SetMenuItems

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `playerName` | `dynamic` | — |  |
| `arena` | `dynamic` | — |  |
| `bots` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L66)

<a id="function-function-mq3-client-ui-start-server-serveroptionssetplayeritems-function-serveroptionssetplayeritems-value-src-mq3-client-ui-start-server-ml-1084077533"></a>
### serverOptionsSetPlayerItems

```ml
function serverOptionsSetPlayerItems(value)
```

ServerOptions_SetPlayerItems

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L54)

<a id="function-function-mq3-client-ui-start-server-serveroptionsstart-function-serveroptionsstart-value-retailactive-src-mq3-client-ui-start-server-ml-1990947234"></a>
### serverOptionsStart

```ml
function serverOptionsStart(value, retailActive)
```

ServerOptions_Start

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L50)

<a id="function-function-mq3-client-ui-start-server-serveroptionsstatusbar-function-serveroptionsstatusbar-src-mq3-client-ui-start-server-ml-1673773142"></a>
### serverOptionsStatusBar

```ml
function serverOptionsStatusBar()
```

ServerOptions_StatusBar


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L60)

<a id="function-function-mq3-client-ui-start-server-serverplayericon-function-serverplayericon-modelandskin-skinexists-src-mq3-client-ui-start-server-ml-326829980"></a>
### serverPlayerIcon

```ml
function serverPlayerIcon(modelAndSkin, skinExists)
```

ServerPlayerIcon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelAndSkin` | `dynamic` | — |  |
| `skinExists` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L80)

<a id="function-function-mq3-client-ui-start-server-startservercache-function-startservercache-state-arenas-buildscript-retailactive-src-mq3-client-ui-start-server-ml-1935638113"></a>
### startServerCache

```ml
function startServerCache(state, arenas, buildScript, retailActive)
```

StartServer_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `arenas` | `dynamic` | — |  |
| `buildScript` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L43)

<a id="function-function-mq3-client-ui-start-server-startservergametypeevent-function-startservergametypeevent-state-arenas-index-activated-src-mq3-client-ui-start-server-ml-1199711508"></a>
### startServerGametypeEvent

```ml
function startServerGametypeEvent(state, arenas, index, activated)
```

StartServer_GametypeEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `arenas` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `activated` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L35)

<a id="function-function-mq3-client-ui-start-server-startserverlevelshotdraw-function-startserverlevelshotdraw-state-slot-available-retailactive-src-mq3-client-ui-start-server-ml-757127333"></a>
### startServerLevelshotDraw

```ml
function startServerLevelshotDraw(state, slot, available, retailActive)
```

StartServer_LevelshotDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `available` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L39)

<a id="function-function-mq3-client-ui-start-server-startservermapevent-function-startservermapevent-state-slot-activated-src-mq3-client-ui-start-server-ml-35606688"></a>
### startServerMapEvent

```ml
function startServerMapEvent(state, slot, activated)
```

StartServer_MapEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `activated` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L33)

<a id="function-function-mq3-client-ui-start-server-startservermenuevent-function-startservermenuevent-state-id-activated-retailactive-src-mq3-client-ui-start-server-ml-632429604"></a>
### startServerMenuEvent

```ml
function startServerMenuEvent(state, id, activated, retailActive)
```

StartServer_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `activated` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L37)

<a id="function-function-mq3-client-ui-start-server-startservermenuinit-function-startservermenuinit-state-arenas-src-mq3-client-ui-start-server-ml-1448285273"></a>
### startServerMenuInit

```ml
function startServerMenuInit(state, arenas)
```

StartServer_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `arenas` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L41)

<a id="function-function-mq3-client-ui-start-server-startserverupdate-function-startserverupdate-state-src-mq3-client-ui-start-server-ml-513220597"></a>
### startServerUpdate

```ml
function startServerUpdate(state)
```

StartServer_Update

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L30)

<a id="function-function-mq3-client-ui-start-server-startstate-function-startstate-src-mq3-client-ui-start-server-ml-1785673514"></a>
### startState

```ml
function startState()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L21)

- [mq3.client.ui_start_server.StartState](Type-mq3-client-ui-start-server-startstate-1227913597.md) — struct
<a id="function-function-mq3-client-ui-start-server-uibotselectmenu-function-uibotselectmenu-state-value-bots-selected-retailactive-src-mq3-client-ui-start-server-ml-2000382258"></a>
### uiBotSelectMenu

```ml
function uiBotSelectMenu(state, value, bots, selected, retailActive)
```

UI_BotSelectMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `bots` | `dynamic` | — |  |
| `selected` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L100)

<a id="function-function-mq3-client-ui-start-server-uiserveroptionsmenu-function-uiserveroptionsmenu-value-multiplayer-retailactive-src-mq3-client-ui-start-server-ml-1737352852"></a>
### uiServerOptionsMenu

```ml
function uiServerOptionsMenu(value, multiplayer, retailActive)
```

UI_ServerOptionsMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `multiplayer` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L74)

<a id="function-function-mq3-client-ui-start-server-uistartservermenu-function-uistartservermenu-state-arenas-multiplayer-retailactive-src-mq3-client-ui-start-server-ml-1738304804"></a>
### uiStartServerMenu

```ml
function uiStartServerMenu(state, arenas, multiplayer, retailActive)
```

UI_StartServerMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `arenas` | `dynamic` | — |  |
| `multiplayer` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L45)

<a id="function-function-mq3-client-ui-start-server-words-function-words-text-src-mq3-client-ui-start-server-ml-1177162833"></a>
### words

```ml
function words(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L25)
