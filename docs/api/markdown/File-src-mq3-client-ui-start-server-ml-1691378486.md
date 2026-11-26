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
| `value` | `dynamic` | — | Record read through `value.playerTypes`, `value.gametype`, `value.playerTeams`, `value.newBotIndex` and additional values. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI start server resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L99)

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
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.actions`. |
| `activated` | `dynamic` | — | Value used by `if not activated then return false end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L209)

<a id="function-function-mq3-client-ui-start-server-botselectbotevent-function-botselectbotevent-state-index-activated-src-mq3-client-ui-start-server-ml-1653408672"></a>
### botSelectBotEvent

```ml
function botSelectBotEvent(state, index, activated)
```

UI_BotSelectMenu_BotEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.selected`. |
| `index` | `dynamic` | — | Value tested by `not activated or index<0 or index>=16 or not state.active[index]` before the calculation continues. |
| `activated` | `dynamic` | — | Value used by `if not activated or index<0 or index>=16 or not state.active[index] then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L204)

<a id="function-function-mq3-client-ui-start-server-botselectbuildlist-function-botselectbuildlist-state-bots-src-mq3-client-ui-start-server-ml-1434928179"></a>
### botSelectBuildList

```ml
function botSelectBuildList(state, bots)
```

UI_BotSelectMenu_BuildList

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.bots`, `state.sorted`, `state.modelPage`, `state.numPages`. |
| `bots` | `dynamic` | — | Sequence whose length/content is inspected by `botSelectBuildList`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L177)

<a id="function-function-mq3-client-ui-start-server-botselectcache-function-botselectcache-state-retailactive-src-mq3-client-ui-start-server-ml-1269244714"></a>
### botSelectCache

```ml
function botSelectCache(state, retailActive)
```

UI_BotSelectMenu_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.actions`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L219)

<a id="function-function-mq3-client-ui-start-server-botselectdefault-function-botselectdefault-state-name-src-mq3-client-ui-start-server-ml-1852028380"></a>
### botSelectDefault

```ml
function botSelectDefault(state, name)
```

UI_BotSelectMenu_Default

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.selected`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI start server resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L189)

<a id="function-function-mq3-client-ui-start-server-botselectinit-function-botselectinit-state-value-bots-selected-src-mq3-client-ui-start-server-ml-1675394279"></a>
### botSelectInit

```ml
function botSelectInit(state, value, bots, selected)
```

UI_BotSelectMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.modelPage`. |
| `value` | `dynamic` | — | Value used by `botSelectUpdateGrid(state,value)`. |
| `bots` | `dynamic` | — | Value used by `botSelectBuildList(state,bots)`. |
| `selected` | `dynamic` | — | Value used by `botSelectDefault(state,selected)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L225)

<a id="function-function-mq3-client-ui-start-server-botselectleftevent-function-botselectleftevent-state-value-activated-src-mq3-client-ui-start-server-ml-1531069433"></a>
### botSelectLeftEvent

```ml
function botSelectLeftEvent(state, value, activated)
```

UI_BotSelectMenu_LeftEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.modelPage`, `state.selected`. |
| `value` | `dynamic` | — | Value used by `botSelectUpdateGrid(state,value)`. |
| `activated` | `dynamic` | — | Value used by `if activated and state.modelPage>0 then state.modelPage=state.modelPage-1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L194)

<a id="function-function-mq3-client-ui-start-server-botselectrightevent-function-botselectrightevent-state-value-activated-src-mq3-client-ui-start-server-ml-56280203"></a>
### botSelectRightEvent

```ml
function botSelectRightEvent(state, value, activated)
```

UI_BotSelectMenu_RightEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.modelPage`, `state.selected`. |
| `value` | `dynamic` | — | Value used by `botSelectUpdateGrid(state,value)`. |
| `activated` | `dynamic` | — | Value used by `if activated and state.modelPage<state.numPages-1 then state.modelPage=state.modelPage+1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L199)

<a id="function-function-mq3-client-ui-start-server-botselectselectevent-function-botselectselectevent-state-value-activated-retailactive-src-mq3-client-ui-start-server-ml-1186996870"></a>
### botSelectSelectEvent

```ml
function botSelectSelectEvent(state, value, activated, retailActive)
```

UI_BotSelectMenu_SelectEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.actions`. |
| `value` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `value.newBot`, `value.newBotName`. |
| `activated` | `dynamic` | — | Value used by `if not activated or state.selected>=len(state.sorted) then return false end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L215)

<a id="function-function-mq3-client-ui-start-server-botselectupdategrid-function-botselectupdategrid-state-value-src-mq3-client-ui-start-server-ml-1247085780"></a>
### botSelectUpdateGrid

```ml
function botSelectUpdateGrid(state, value)
```

UI_BotSelectMenu_UpdateGrid

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.active[i]`, `state.names[i]`, `state.icons[i]`, `state.alreadySelected[i]`. |
| `value` | `dynamic` | — | Value used by `state.alreadySelected[i]=botAlreadySelected(value,bot.name) else state.active[i]=false`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L185)

<a id="function-function-mq3-client-ui-start-server-botsortcompare-function-botsortcompare-a-b-src-mq3-client-ui-start-server-ml-1630197159"></a>
### botSortCompare

```ml
function botSortCompare(a, b)
```

UI_BotSelectMenu_SortCompare

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record read through `a.name`. |
| `b` | `dynamic` | — | Record read through `b.name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L173)

<a id="function-function-mq3-client-ui-start-server-botstate-function-botstate-src-mq3-client-ui-start-server-ml-1694716830"></a>
### botState

```ml
function botState()
```

Creates a `mq3.client.ui_start_server.BotState` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L32)

- [mq3.client.ui_start_server.BotState](Type-mq3-client-ui-start-server-botstate-448919066.md) — struct
<a id="function-function-mq3-client-ui-start-server-clamp-function-clamp-value-low-high-src-mq3-client-ui-start-server-ml-1390054851"></a>
### clamp

```ml
function clamp(value, low, high)
```

Clamps `value` to the inclusive bounds `low` and `high` for UI start server.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<low`, `value>high` before the calculation continues. |
| `low` | `dynamic` | — | Lower bound used for comparison or clamping. |
| `high` | `dynamic` | — | Upper bound used for comparison or clamping. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L104)

<a id="function-function-mq3-client-ui-start-server-emit-function-emit-actions-boundary-kind-name-value-number-retailactive-src-mq3-client-ui-start-server-ml-1214547961"></a>
### emit

```ml
function emit(actions, boundary, kind, name, value, number, retailActive)
```

Calls `mq3.client.ui_start_server.Action` from UI start server `emit`. The final path returns `actions`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `actions` | `dynamic` | — | Value used by `actions=actions+[Action(boundary,kind,name,value,number,not retailActive)]`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI start server resource. |
| `value` | `dynamic` | — | Value used by `actions=actions+[Action(boundary,kind,name,value,number,not retailActive)]`. |
| `number` | `dynamic` | — | Value used by `actions=actions+[Action(boundary,kind,name,value,number,not retailActive)]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L41)

<a id="function-function-mq3-client-ui-start-server-gametypebits-function-gametypebits-text-src-mq3-client-ui-start-server-ml-866165391"></a>
### gametypeBits

```ml
function gametypeBits(text)
```

GametypeBits

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `gametypeBits` in the UI start server path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L47)

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

Adapts `mq3.compat.numeric.trunc32` to UI start server `ntrunc`, returning its result for `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.compat.numeric.trunc32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L56)

<a id="function-function-mq3-client-ui-start-server-options-function-options-src-mq3-client-ui-start-server-ml-882400766"></a>
### options

```ml
function options()
```

Creates a `mq3.client.ui_start_server.Options` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L30)

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
| `value` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `value.actions`. |
| `index` | `dynamic` | — | Value used by `text=value.playerNames[index]`. |
| `focused` | `dynamic` | — | Value used by `value.actions=emit(value.actions,"ui","draw-player-name",text,str(focused),index,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L151)

<a id="function-function-mq3-client-ui-start-server-remapgametype-function-remapgametype-index-src-mq3-client-ui-start-server-ml-892855352"></a>
### remapGametype

```ml
function remapGametype(index)
```

Builds the UI start server `remapGametype` sequence from `[GT_FFA,GT_TEAM,GT_TOURNAMENT,GT_CTF][index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Value used by `return [GT_FFA,GT_TEAM,GT_TOURNAMENT,GT_CTF][index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L50)

<a id="function-function-mq3-client-ui-start-server-serveroptionscache-function-serveroptionscache-value-retailactive-src-mq3-client-ui-start-server-ml-859055806"></a>
### serverOptionsCache

```ml
function serverOptionsCache(value, retailActive)
```

ServerOptions_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `value.actions`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L164)

<a id="function-function-mq3-client-ui-start-server-serveroptionsevent-function-serveroptionsevent-value-id-activated-retailactive-src-mq3-client-ui-start-server-ml-620892408"></a>
### serverOptionsEvent

```ml
function serverOptionsEvent(value, id, activated, retailActive)
```

ServerOptions_Event

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `value.actions`. |
| `id` | `dynamic` | — | Value used by `if id==23 and activated then serverOptionsStart(value,retailActive)`. |
| `activated` | `dynamic` | — | Value used by `if id==23 and activated then serverOptionsStart(value,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L121)

<a id="function-function-mq3-client-ui-start-server-serveroptionsinitbotnames-function-serveroptionsinitbotnames-value-arena-bots-src-mq3-client-ui-start-server-ml-1050053124"></a>
### serverOptionsInitBotNames

```ml
function serverOptionsInitBotNames(value, arena, bots)
```

ServerOptions_InitBotNames

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `value.playerNames[1]`, `value.playerNames[2]`, `value.playerNames[3]`, `value.playerTypes[3]` and additional values. |
| `arena` | `dynamic` | — | Record read through `arena.bots`. |
| `bots` | `dynamic` | — | Value used by `for each key in words(arena.bots) for each bot in bots if strings.equalsIgnoreCaseAscii(bot.name,key) and count<12 then value.playerNames[coun...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L138)

<a id="function-function-mq3-client-ui-start-server-serveroptionsinitplayeritems-function-serveroptionsinitplayeritems-value-playername-src-mq3-client-ui-start-server-ml-1903605691"></a>
### serverOptionsInitPlayerItems

```ml
function serverOptionsInitPlayerItems(value, playerName)
```

ServerOptions_InitPlayerItems

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `value.playerTypes`, `value.playerTypes[i]`, `value.playerTypes[0]`, `value.playerNames[0]` and additional values. |
| `playerName` | `dynamic` | — | Player name shown in the UI or supplied to the client configuration. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L112)

<a id="function-function-mq3-client-ui-start-server-serveroptionslevelshotdraw-function-serveroptionslevelshotdraw-value-retailactive-src-mq3-client-ui-start-server-ml-752743210"></a>
### serverOptionsLevelshotDraw

```ml
function serverOptionsLevelshotDraw(value, retailActive)
```

ServerOptions_LevelshotDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `value.playerNames[value.newBotIndex]`, `value.newBot`, `value.actions`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L133)

<a id="function-function-mq3-client-ui-start-server-serveroptionsmenuinit-function-serveroptionsmenuinit-value-multiplayer-gametype-mapname-playername-arena-bots-src-mq3-client-ui-start-server-ml-681174561"></a>
### serverOptionsMenuInit

```ml
function serverOptionsMenuInit(value, multiplayer, gametype, mapName, playerName, arena, bots)
```

ServerOptions_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `value.multiplayer`, `value.gametype`. |
| `multiplayer` | `dynamic` | — | Value assigned to `value.multiplayer`. |
| `gametype` | `dynamic` | — | Quake III game-type identifier. |
| `mapName` | `dynamic` | — | Map name used to select the level and its associated assets. |
| `playerName` | `dynamic` | — | Player name shown in the UI or supplied to the client configuration. |
| `arena` | `dynamic` | — | Value used by `serverOptionsSetMenuItems(value,mapName,playerName,arena,bots)`. |
| `bots` | `dynamic` | — | Value used by `serverOptionsSetMenuItems(value,mapName,playerName,arena,bots)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L160)

<a id="function-function-mq3-client-ui-start-server-serveroptionsplayernameevent-function-serveroptionsplayernameevent-value-index-activated-retailactive-src-mq3-client-ui-start-server-ml-759716343"></a>
### serverOptionsPlayerNameEvent

```ml
function serverOptionsPlayerNameEvent(value, index, activated, retailActive)
```

ServerOptions_PlayerNameEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `value.newBotIndex`, `value.actions`. |
| `index` | `dynamic` | — | Value assigned to `value.newBotIndex`. |
| `activated` | `dynamic` | — | Value used by `if not activated then return false end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L127)

<a id="function-function-mq3-client-ui-start-server-serveroptionssetmenuitems-function-serveroptionssetmenuitems-value-mapname-playername-arena-bots-src-mq3-client-ui-start-server-ml-764136673"></a>
### serverOptionsSetMenuItems

```ml
function serverOptionsSetMenuItems(value, mapName, playerName, arena, bots)
```

ServerOptions_SetMenuItems

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `value.mapName`, `value.timeLimit`, `value.fragLimit`, `value.flagLimit`. |
| `mapName` | `dynamic` | — | Map name used to select the level and its associated assets. |
| `playerName` | `dynamic` | — | Player name shown in the UI or supplied to the client configuration. |
| `arena` | `dynamic` | — | Value used by `serverOptionsInitBotNames(value,arena,bots)`. |
| `bots` | `dynamic` | — | Value used by `serverOptionsInitBotNames(value,arena,bots)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L145)

<a id="function-function-mq3-client-ui-start-server-serveroptionssetplayeritems-function-serveroptionssetplayeritems-value-src-mq3-client-ui-start-server-ml-1084077533"></a>
### serverOptionsSetPlayerItems

```ml
function serverOptionsSetPlayerItems(value)
```

ServerOptions_SetPlayerItems

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `value.visibleNames[i]`, `value.visibleTeams[i]`, `value.visibleNames[0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L115)

<a id="function-function-mq3-client-ui-start-server-serveroptionsstart-function-serveroptionsstart-value-retailactive-src-mq3-client-ui-start-server-ml-1990947234"></a>
### serverOptionsStart

```ml
function serverOptionsStart(value, retailActive)
```

ServerOptions_Start

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `value.actions`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L108)

<a id="function-function-mq3-client-ui-start-server-serveroptionsstatusbar-function-serveroptionsstatusbar-src-mq3-client-ui-start-server-ml-1673773142"></a>
### serverOptionsStatusBar

```ml
function serverOptionsStatusBar()
```

ServerOptions_StatusBar


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L129)

<a id="function-function-mq3-client-ui-start-server-serverplayericon-function-serverplayericon-modelandskin-skinexists-src-mq3-client-ui-start-server-ml-326829980"></a>
### serverPlayerIcon

```ml
function serverPlayerIcon(modelAndSkin, skinExists)
```

ServerPlayerIcon

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelAndSkin` | `dynamic` | — | Sequence whose length/content is inspected by `serverPlayerIcon`. |
| `skinExists` | `dynamic` | — | Value used by `if not skinExists and skin!="default" then skin="default" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L181)

<a id="function-function-mq3-client-ui-start-server-startservercache-function-startservercache-state-arenas-buildscript-retailactive-src-mq3-client-ui-start-server-ml-1935638113"></a>
### startServerCache

```ml
function startServerCache(state, arenas, buildScript, retailActive)
```

StartServer_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.actions`. |
| `arenas` | `dynamic` | — | Value used by `if buildScript then for each arena in arenas state.actions=emit(state.actions,"renderer","register-shader","levelshots/"+strings.toUpperAscii(...`. |
| `buildScript` | `dynamic` | — | Value used by `if buildScript then for each arena in arenas state.actions=emit(state.actions,"renderer","register-shader","levelshots/"+strings.toUpperAscii(...`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L89)

<a id="function-function-mq3-client-ui-start-server-startservergametypeevent-function-startservergametypeevent-state-arenas-index-activated-src-mq3-client-ui-start-server-ml-1199711508"></a>
### startServerGametypeEvent

```ml
function startServerGametypeEvent(state, arenas, index, activated)
```

StartServer_GametypeEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.gametype`, `state.maps`, `state.mapBits`, `state.maxPages` and additional values. |
| `arenas` | `dynamic` | — | Value used by `for each arena in arenas bits=gametypeBits(arena.type)`. |
| `index` | `dynamic` | — | Value assigned to `state.gametype`. |
| `activated` | `dynamic` | — | Value used by `if not activated then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L67)

<a id="function-function-mq3-client-ui-start-server-startserverlevelshotdraw-function-startserverlevelshotdraw-state-slot-available-retailactive-src-mq3-client-ui-start-server-ml-757127333"></a>
### startServerLevelshotDraw

```ml
function startServerLevelshotDraw(state, slot, available, retailActive)
```

StartServer_LevelshotDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.actions`. |
| `slot` | `dynamic` | — | Value used by `index=state.page*4+slot`. |
| `available` | `dynamic` | — | Value used by `if not available then shader="menu/art/unknownmap" end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L79)

<a id="function-function-mq3-client-ui-start-server-startservermapevent-function-startservermapevent-state-slot-activated-src-mq3-client-ui-start-server-ml-35606688"></a>
### startServerMapEvent

```ml
function startServerMapEvent(state, slot, activated)
```

StartServer_MapEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.currentMap`. |
| `slot` | `dynamic` | — | Value used by `index=state.page*MAPS_PER_PAGE+slot`. |
| `activated` | `dynamic` | — | Value used by `if not activated then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L61)

<a id="function-function-mq3-client-ui-start-server-startservermenuevent-function-startservermenuevent-state-id-activated-retailactive-src-mq3-client-ui-start-server-ml-632429604"></a>
### startServerMenuEvent

```ml
function startServerMenuEvent(state, id, activated, retailActive)
```

StartServer_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.page`, `state.actions`. |
| `id` | `dynamic` | — | Value used by `if id==15 and state.page>0 then state.page=state.page-1`. |
| `activated` | `dynamic` | — | Value used by `if not activated then return false end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L73)

<a id="function-function-mq3-client-ui-start-server-startservermenuinit-function-startservermenuinit-state-arenas-src-mq3-client-ui-start-server-ml-1448285273"></a>
### startServerMenuInit

```ml
function startServerMenuInit(state, arenas)
```

StartServer_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI start server state passed to the helper calls in `startServerMenuInit`. |
| `arenas` | `dynamic` | — | Value used by `startServerGametypeEvent(state,arenas,0,true)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L83)

<a id="function-function-mq3-client-ui-start-server-startserverupdate-function-startserverupdate-state-src-mq3-client-ui-start-server-ml-513220597"></a>
### startServerUpdate

```ml
function startServerUpdate(state)
```

StartServer_Update

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.currentMap`, `state.displayName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L53)

<a id="function-function-mq3-client-ui-start-server-startstate-function-startstate-src-mq3-client-ui-start-server-ml-1785673514"></a>
### startState

```ml
function startState()
```

Creates a `mq3.client.ui_start_server.StartState` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L28)

- [mq3.client.ui_start_server.StartState](Type-mq3-client-ui-start-server-startstate-1227913597.md) — struct
<a id="function-function-mq3-client-ui-start-server-uibotselectmenu-function-uibotselectmenu-state-value-bots-selected-retailactive-src-mq3-client-ui-start-server-ml-2000382258"></a>
### uiBotSelectMenu

```ml
function uiBotSelectMenu(state, value, bots, selected, retailActive)
```

UI_BotSelectMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.actions`. |
| `value` | `dynamic` | — | Value used by `botSelectInit(state,value,bots,selected)`. |
| `bots` | `dynamic` | — | Value used by `botSelectInit(state,value,bots,selected)`. |
| `selected` | `dynamic` | — | Value used by `botSelectInit(state,value,bots,selected)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L232)

<a id="function-function-mq3-client-ui-start-server-uiserveroptionsmenu-function-uiserveroptionsmenu-value-multiplayer-retailactive-src-mq3-client-ui-start-server-ml-1737352852"></a>
### uiServerOptionsMenu

```ml
function uiServerOptionsMenu(value, multiplayer, retailActive)
```

UI_ServerOptionsMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `value.multiplayer`, `value.actions`. |
| `multiplayer` | `dynamic` | — | Value assigned to `value.multiplayer`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L169)

<a id="function-function-mq3-client-ui-start-server-uistartservermenu-function-uistartservermenu-state-arenas-multiplayer-retailactive-src-mq3-client-ui-start-server-ml-1738304804"></a>
### uiStartServerMenu

```ml
function uiStartServerMenu(state, arenas, multiplayer, retailActive)
```

UI_StartServerMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI start server record/storage; this routine assigns `state.multiplayer`, `state.actions`. |
| `arenas` | `dynamic` | — | Value used by `startServerMenuInit(state,arenas)`. |
| `multiplayer` | `dynamic` | — | Value assigned to `state.multiplayer`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L95)

<a id="function-function-mq3-client-ui-start-server-words-function-words-text-src-mq3-client-ui-start-server-ml-1177162833"></a>
### words

```ml
function words(text)
```

Calls `decode`, `slice` from UI start server `words`. The final path returns `effect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `words` in the UI start server path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L44)
