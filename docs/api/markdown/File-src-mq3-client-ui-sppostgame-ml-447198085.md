# `src/mq3/client/ui_sppostgame.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_sppostgame`](Package-mq3-client-ui-sppostgame-1153830027.md)

Reachable from entry: **no**

## Imports

- `mq3/client/cgame_drawtools.ml` as `drawtools` → [src/mq3/client/cgame_drawtools.ml](File-src-mq3-client-cgame-drawtools-ml-249217190.md)
- `mq3/client/ui_gameinfo.ml` as `gameinfo` → [src/mq3/client/ui_gameinfo.ml](File-src-mq3-client-ui-gameinfo-ml-965434910.md)
- `mq3/client/ui_qmenu.ml` as `qmenu` → [src/mq3/client/ui_qmenu.ml](File-src-mq3-client-ui-qmenu-ml-201905758.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-client-ui-sppostgame-addaward-function-addaward-value-medal-amount-logged-src-mq3-client-ui-sppostgame-ml-238696548"></a>
### addAward

```ml
function addAward(value, medal, amount, logged)
```

Updates `value.awardsEarned[value.numAwards]`, `value.awardsLevels[value.numAwards]`, `value.numAwards` during UI sppostgame `addAward`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI sppostgame record/storage; this routine assigns `value.awardsEarned[value.numAwards]`, `value.awardsLevels[value.numAwards]`, `value.numAwards`. |
| `medal` | `dynamic` | — | Value used by `if logged!=0 then gameinfo.UI_LogAwardData(value.game,medal,logged) end if`. |
| `amount` | `dynamic` | — | Value used by `value.awardsLevels[value.numAwards]=amount`. |
| `logged` | `dynamic` | — | Value used by `if logged!=0 then gameinfo.UI_LogAwardData(value.game,medal,logged) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L260)

<a id="function-function-mq3-client-ui-sppostgame-arg-function-arg-argv-index-src-mq3-client-ui-sppostgame-ml-386536126"></a>
### arg

```ml
function arg(argv, index)
```

Evaluates UI sppostgame `arg` and returns `""`, `argv[index]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `argv` | `dynamic` | — | Sequence read at `argv[index]`. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=len(argv)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L266)

<a id="constant-constant-mq3-client-ui-sppostgame-award-accuracy-const-award-accuracy-0-src-mq3-client-ui-sppostgame-ml-461640015"></a>
### AWARD_ACCURACY

```ml
const AWARD_ACCURACY = 0
```

Postgame award identifier selecting the accuracy award category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L26)

<a id="constant-constant-mq3-client-ui-sppostgame-award-excellent-const-award-excellent-2-src-mq3-client-ui-sppostgame-ml-1357084561"></a>
### AWARD_EXCELLENT

```ml
const AWARD_EXCELLENT = 2
```

Postgame award identifier selecting the excellent award category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L30)

<a id="constant-constant-mq3-client-ui-sppostgame-award-frags-const-award-frags-4-src-mq3-client-ui-sppostgame-ml-1293968183"></a>
### AWARD_FRAGS

```ml
const AWARD_FRAGS = 4
```

Postgame award identifier selecting the frags award category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L34)

<a id="constant-constant-mq3-client-ui-sppostgame-award-gauntlet-const-award-gauntlet-3-src-mq3-client-ui-sppostgame-ml-38983408"></a>
### AWARD_GAUNTLET

```ml
const AWARD_GAUNTLET = 3
```

Postgame award identifier selecting the gauntlet award category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L32)

<a id="constant-constant-mq3-client-ui-sppostgame-award-impressive-const-award-impressive-1-src-mq3-client-ui-sppostgame-ml-44982964"></a>
### AWARD_IMPRESSIVE

```ml
const AWARD_IMPRESSIVE = 1
```

Postgame award identifier selecting the impressive award category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L28)

<a id="constant-constant-mq3-client-ui-sppostgame-award-perfect-const-award-perfect-5-src-mq3-client-ui-sppostgame-ml-129906248"></a>
### AWARD_PERFECT

```ml
const AWARD_PERFECT = 5
```

Postgame award identifier selecting the perfect award category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L36)

<a id="constant-constant-mq3-client-ui-sppostgame-award-presentation-time-const-award-presentation-time-2000-src-mq3-client-ui-sppostgame-ml-219188855"></a>
### AWARD_PRESENTATION_TIME

```ml
const AWARD_PRESENTATION_TIME = 2000
```

Duration in milliseconds allocated to presenting one postgame award.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L16)

<a id="function-function-mq3-client-ui-sppostgame-cleanname-function-cleanname-text-src-mq3-client-ui-sppostgame-ml-712529151"></a>
### cleanName

```ml
function cleanName(text)
```

Calls `decode` from UI sppostgame `cleanName`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `cleanName` in the UI sppostgame path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L215)

<a id="function-function-mq3-client-ui-sppostgame-command-function-command-value-text-src-mq3-client-ui-sppostgame-ml-1196302812"></a>
### command

```ml
function command(value, text)
```

Updates `value.commands` during UI sppostgame `command`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI sppostgame record/storage; this routine assigns `value.commands`. |
| `text` | `dynamic` | — | Text consumed or emitted by `command` in the UI sppostgame path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L128)

<a id="function-function-mq3-client-ui-sppostgame-create-function-create-game-src-mq3-client-ui-sppostgame-ml-1550401920"></a>
### create

```ml
function create(game)
```

Creates a `mq3.client.ui_sppostgame.Postgame` record. Assigns `game` from `game`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `game` | `dynamic` | — | Value used to initialize `Postgame.game`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L121)

<a id="function-function-mq3-client-ui-sppostgame-cvar-function-cvar-value-name-text-src-mq3-client-ui-sppostgame-ml-561472179"></a>
### cvar

```ml
function cvar(value, name, text)
```

Updates `value.cvarWrites` during UI sppostgame `cvar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI sppostgame record/storage; this routine assigns `value.cvarWrites`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI sppostgame resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `cvar` in the UI sppostgame path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L133)

<a id="function-function-mq3-client-ui-sppostgame-draw-function-draw-kind-x-y-w-h-text-style-color-asset-src-mq3-client-ui-sppostgame-ml-1236934573"></a>
### draw

```ml
function draw(kind, x, y, w, h, text, style, color, asset)
```

Builds the UI sppostgame `draw` sequence from `[kind,x,y,w,h,text,style,color,asset]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `draw`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `draw`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `draw`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `draw`. |
| `text` | `dynamic` | — | Text consumed or emitted by `draw` in the UI sppostgame path. |
| `style` | `dynamic` | — | Value used by `return [kind,x,y,w,h,text,style,color,asset]`. |
| `color` | `dynamic` | — | Color value used by the UI sppostgame drawing or interpolation operation. |
| `asset` | `dynamic` | — | Value used by `return [kind,x,y,w,h,text,style,color,asset]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L144)

<a id="constant-constant-mq3-client-ui-sppostgame-id-again-const-id-again-10-src-mq3-client-ui-sppostgame-ml-648371538"></a>
### ID_AGAIN

```ml
const ID_AGAIN = 10
```

Menu control identifier routed to the again action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L18)

<a id="constant-constant-mq3-client-ui-sppostgame-id-menu-const-id-menu-12-src-mq3-client-ui-sppostgame-ml-289905290"></a>
### ID_MENU

```ml
const ID_MENU = 12
```

Menu control identifier routed to the menu action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L22)

<a id="constant-constant-mq3-client-ui-sppostgame-id-next-const-id-next-11-src-mq3-client-ui-sppostgame-ml-582553431"></a>
### ID_NEXT

```ml
const ID_NEXT = 11
```

Menu control identifier routed to the next action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L20)

<a id="constant-constant-mq3-client-ui-sppostgame-max-scoreboard-clients-const-max-scoreboard-clients-8-src-mq3-client-ui-sppostgame-ml-1066634905"></a>
### MAX_SCOREBOARD_CLIENTS

```ml
const MAX_SCOREBOARD_CLIENTS = 8
```

Capacity limit for the scoreboard clients collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L14)

<a id="function-function-mq3-client-ui-sppostgame-medallocations-function-medallocations-src-mq3-client-ui-sppostgame-ml-2042265058"></a>
### medalLocations

```ml
function medalLocations()
```

Builds the UI sppostgame `medalLocations` sequence from `[144,448,88,504,32,560]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L152)

<a id="function-function-mq3-client-ui-sppostgame-medalnames-function-medalnames-src-mq3-client-ui-sppostgame-ml-2058901622"></a>
### medalNames

```ml
function medalNames()
```

Lists the medal names catalog for UI sppostgame in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L146)

<a id="function-function-mq3-client-ui-sppostgame-medalpics-function-medalpics-src-mq3-client-ui-sppostgame-ml-474938130"></a>
### medalPics

```ml
function medalPics()
```

Lists the 6 UI sppostgame medal pics strings in their declared order, beginning with `"menu/medals/medal_accuracy"`, `"menu/medals/medal_impressive"`, `"menu/medals/medal_excellent"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L148)

<a id="function-function-mq3-client-ui-sppostgame-medalsounds-function-medalsounds-src-mq3-client-ui-sppostgame-ml-1006218688"></a>
### medalSounds

```ml
function medalSounds()
```

Lists the 6 UI sppostgame medal sounds strings in their declared order, beginning with `"sound/feedback/accuracy.wav"`, `"sound/feedback/impressive_a.wav"`, `"sound/feedback/excellent_a.wav"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L150)

<a id="function-function-mq3-client-ui-sppostgame-padded-function-padded-text-width-src-mq3-client-ui-sppostgame-ml-483215459"></a>
### padded

```ml
function padded(text, width)
```

Evaluates UI sppostgame `padded` and returns `text` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `padded` in the UI sppostgame path. |
| `width` | `dynamic` | — | Width in the coordinate space used by `padded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L221)

<a id="function-function-mq3-client-ui-sppostgame-playerinfo-function-playerinfo-value-clientnum-src-mq3-client-ui-sppostgame-ml-2145525604"></a>
### playerInfo

```ml
function playerInfo(value, clientNum)
```

Evaluates UI sppostgame `playerInfo` and returns `value.playerConfigs[clientNum]`, `""` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.playerConfigs`. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L212)

- [mq3.client.ui_sppostgame.Postgame](Type-mq3-client-ui-sppostgame-postgame-205691195.md) — struct
<a id="function-function-mq3-client-ui-sppostgame-prepname-function-prepname-value-index-src-mq3-client-ui-sppostgame-ml-1963670899"></a>
### Prepname

```ml
function Prepname(value, index)
```

Prepname

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI sppostgame record/storage; this routine assigns `value.placeNames[index]`. |
| `index` | `dynamic` | — | Value tested by `index<3` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L226)

<a id="constant-constant-mq3-client-ui-sppostgame-rank-tied-flag-const-rank-tied-flag-16384-src-mq3-client-ui-sppostgame-ml-808515313"></a>
### RANK_TIED_FLAG

```ml
const RANK_TIED_FLAG = 16384
```

Bit marking that the stored rank is tied with another player's rank.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L24)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-againevent-function-ui-sppostgamemenu-againevent-value-event-src-mq3-client-ui-sppostgame-ml-1873108659"></a>
### UI_SPPostgameMenu_AgainEvent

```ml
function UI_SPPostgameMenu_AgainEvent(value, event)
```

UI_SPPostgameMenu_AgainEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI sppostgame record/storage; this routine assigns `value.popped`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L157)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-cache-function-ui-sppostgamemenu-cache-buildscript-src-mq3-client-ui-sppostgame-ml-607776277"></a>
### UI_SPPostgameMenu_Cache

```ml
function UI_SPPostgameMenu_Cache(buildscript)
```

UI_SPPostgameMenu_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buildscript` | `dynamic` | — | Value used by `if buildscript then assets=assets+["music/loss.wav","music/win.wav","sound/player/announce/youwin.wav"] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L240)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-drawawardsmedals-function-ui-sppostgamemenu-drawawardsmedals-value-max-src-mq3-client-ui-sppostgame-ml-1631014037"></a>
### UI_SPPostgameMenu_DrawAwardsMedals

```ml
function UI_SPPostgameMenu_DrawAwardsMedals(value, max)
```

UI_SPPostgameMenu_DrawAwardsMedals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.awardsEarned`, `value.awardsLevels`. |
| `max` | `dynamic` | — | Value used by `if max>0 then for index=0 to max-1 medal=value.awardsEarned[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L197)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-drawawardspresentation-function-ui-sppostgamemenu-drawawardspresentation-value-timer-src-mq3-client-ui-sppostgame-ml-1797837048"></a>
### UI_SPPostgameMenu_DrawAwardsPresentation

```ml
function UI_SPPostgameMenu_DrawAwardsPresentation(value, timer)
```

UI_SPPostgameMenu_DrawAwardsPresentation

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI sppostgame record/storage; this routine assigns `value.playedSound[awardNum]`, `value.sounds`. |
| `timer` | `dynamic` | — | Value used by `awardNum=numeric.trunc32(timer/AWARD_PRESENTATION_TIME)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L204)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-f-function-ui-sppostgamemenu-f-game-realtime-systeminfo-serverinfo-argv-playerconfigs-demoversion-src-mq3-client-ui-sppostgame-ml-1489830960"></a>
### UI_SPPostgameMenu_f

```ml
function UI_SPPostgameMenu_f(game, realtime, systemInfo, serverInfo, argv, playerConfigs, demoVersion)
```

UI_SPPostgameMenu_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `game` | `dynamic` | — | Value used by `value=create(game)`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |
| `systemInfo` | `dynamic` | — | Value used by `value.serverId=numbers.atoi(info.value(systemInfo,"sv_serverid"))`. |
| `serverInfo` | `dynamic` | — | Value used by `map=info.value(serverInfo,"mapname")`. |
| `argv` | `dynamic` | — | Value used by `value.numClients=numbers.atoi(arg(argv,1))`. |
| `playerConfigs` | `dynamic` | — | Value assigned to `value.playerConfigs`. |
| `demoVersion` | `dynamic` | — | Value assigned to `value.demoVersion`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L276)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-init-function-ui-sppostgamemenu-init-value-realtime-src-mq3-client-ui-sppostgame-ml-1384845900"></a>
### UI_SPPostgameMenu_Init

```ml
function UI_SPPostgameMenu_Init(value, realtime)
```

UI_SPPostgameMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI sppostgame record/storage; this routine assigns `value.menu`, `value.ignoreKeysTime`, `value.assets`, `value.itemMenu` and additional values. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L247)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-menudraw-function-ui-sppostgamemenu-menudraw-value-realtime-currentserverid-src-mq3-client-ui-sppostgame-ml-2003713991"></a>
### UI_SPPostgameMenu_MenuDraw

```ml
function UI_SPPostgameMenu_MenuDraw(value, realtime, currentServerId)
```

UI_SPPostgameMenu_MenuDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI sppostgame record/storage; this routine assigns `value.popped`, `value.sounds`, `value.winnerSound`, `value.drawRows` and additional values. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |
| `currentServerId` | `dynamic` | — | Value used by `if currentServerId!=value.serverId then value.popped=true`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L289)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-menudrawscoreline-function-ui-sppostgamemenu-menudrawscoreline-value-n-y-src-mq3-client-ui-sppostgame-ml-1638777330"></a>
### UI_SPPostgameMenu_MenuDrawScoreLine

```ml
function UI_SPPostgameMenu_MenuDrawScoreLine(value, n, y)
```

UI_SPPostgameMenu_MenuDrawScoreLine

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.numClients`, `value.ranks`, `value.clientNums`, `value.scores`. |
| `n` | `dynamic` | — | Value tested by `n>value.numClients+1`, `n>=value.numClients` and additional values before the calculation continues. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_SPPostgameMenu_MenuDrawScoreLine`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L234)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-menuevent-function-ui-sppostgamemenu-menuevent-value-event-src-mq3-client-ui-sppostgame-ml-1363980889"></a>
### UI_SPPostgameMenu_MenuEvent

```ml
function UI_SPPostgameMenu_MenuEvent(value, event)
```

UI_SPPostgameMenu_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI sppostgame record/storage; this routine assigns `value.popped`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L171)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-menukey-function-ui-sppostgamemenu-menukey-value-key-realtime-cursorx-cursory-src-mq3-client-ui-sppostgame-ml-11024112"></a>
### UI_SPPostgameMenu_MenuKey

```ml
function UI_SPPostgameMenu_MenuKey(value, key, realtime, cursorx, cursory)
```

UI_SPPostgameMenu_MenuKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI sppostgame record/storage; this routine assigns `value.phase`, `value.starttime`, `value.ignoreKeysTime`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI sppostgame entry. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |
| `cursorx` | `dynamic` | — | Value used by `return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)`. |
| `cursory` | `dynamic` | — | Value used by `return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L181)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-nextevent-function-ui-sppostgamemenu-nextevent-value-event-src-mq3-client-ui-sppostgame-ml-1295934733"></a>
### UI_SPPostgameMenu_NextEvent

```ml
function UI_SPPostgameMenu_NextEvent(value, event)
```

UI_SPPostgameMenu_NextEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI sppostgame record/storage; this routine assigns `value.popped`, `value.starts`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L164)
