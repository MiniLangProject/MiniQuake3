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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `medal` | `dynamic` | — |  |
| `amount` | `dynamic` | — |  |
| `logged` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L110)

<a id="function-function-mq3-client-ui-sppostgame-arg-function-arg-argv-index-src-mq3-client-ui-sppostgame-ml-386536126"></a>
### arg

```ml
function arg(argv, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `argv` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L113)

<a id="constant-constant-mq3-client-ui-sppostgame-award-accuracy-const-award-accuracy-0-src-mq3-client-ui-sppostgame-ml-461640015"></a>
### AWARD_ACCURACY

```ml
const AWARD_ACCURACY = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L19)

<a id="constant-constant-mq3-client-ui-sppostgame-award-excellent-const-award-excellent-2-src-mq3-client-ui-sppostgame-ml-1357084561"></a>
### AWARD_EXCELLENT

```ml
const AWARD_EXCELLENT = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L21)

<a id="constant-constant-mq3-client-ui-sppostgame-award-frags-const-award-frags-4-src-mq3-client-ui-sppostgame-ml-1293968183"></a>
### AWARD_FRAGS

```ml
const AWARD_FRAGS = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L23)

<a id="constant-constant-mq3-client-ui-sppostgame-award-gauntlet-const-award-gauntlet-3-src-mq3-client-ui-sppostgame-ml-38983408"></a>
### AWARD_GAUNTLET

```ml
const AWARD_GAUNTLET = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L22)

<a id="constant-constant-mq3-client-ui-sppostgame-award-impressive-const-award-impressive-1-src-mq3-client-ui-sppostgame-ml-44982964"></a>
### AWARD_IMPRESSIVE

```ml
const AWARD_IMPRESSIVE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L20)

<a id="constant-constant-mq3-client-ui-sppostgame-award-perfect-const-award-perfect-5-src-mq3-client-ui-sppostgame-ml-129906248"></a>
### AWARD_PERFECT

```ml
const AWARD_PERFECT = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L24)

<a id="constant-constant-mq3-client-ui-sppostgame-award-presentation-time-const-award-presentation-time-2000-src-mq3-client-ui-sppostgame-ml-219188855"></a>
### AWARD_PRESENTATION_TIME

```ml
const AWARD_PRESENTATION_TIME = 2000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L14)

<a id="function-function-mq3-client-ui-sppostgame-cleanname-function-cleanname-text-src-mq3-client-ui-sppostgame-ml-712529151"></a>
### cleanName

```ml
function cleanName(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L81)

<a id="function-function-mq3-client-ui-sppostgame-command-function-command-value-text-src-mq3-client-ui-sppostgame-ml-1196302812"></a>
### command

```ml
function command(value, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L32)

<a id="function-function-mq3-client-ui-sppostgame-create-function-create-game-src-mq3-client-ui-sppostgame-ml-1550401920"></a>
### create

```ml
function create(game)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `game` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L28)

<a id="function-function-mq3-client-ui-sppostgame-cvar-function-cvar-value-name-text-src-mq3-client-ui-sppostgame-ml-561472179"></a>
### cvar

```ml
function cvar(value, name, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L33)

<a id="function-function-mq3-client-ui-sppostgame-draw-function-draw-kind-x-y-w-h-text-style-color-asset-src-mq3-client-ui-sppostgame-ml-1236934573"></a>
### draw

```ml
function draw(kind, x, y, w, h, text, style, color, asset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `asset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L34)

<a id="constant-constant-mq3-client-ui-sppostgame-id-again-const-id-again-10-src-mq3-client-ui-sppostgame-ml-648371538"></a>
### ID_AGAIN

```ml
const ID_AGAIN = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L15)

<a id="constant-constant-mq3-client-ui-sppostgame-id-menu-const-id-menu-12-src-mq3-client-ui-sppostgame-ml-289905290"></a>
### ID_MENU

```ml
const ID_MENU = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L17)

<a id="constant-constant-mq3-client-ui-sppostgame-id-next-const-id-next-11-src-mq3-client-ui-sppostgame-ml-582553431"></a>
### ID_NEXT

```ml
const ID_NEXT = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L16)

<a id="constant-constant-mq3-client-ui-sppostgame-max-scoreboard-clients-const-max-scoreboard-clients-8-src-mq3-client-ui-sppostgame-ml-1066634905"></a>
### MAX_SCOREBOARD_CLIENTS

```ml
const MAX_SCOREBOARD_CLIENTS = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L13)

<a id="function-function-mq3-client-ui-sppostgame-medallocations-function-medallocations-src-mq3-client-ui-sppostgame-ml-2042265058"></a>
### medalLocations

```ml
function medalLocations()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L38)

<a id="function-function-mq3-client-ui-sppostgame-medalnames-function-medalnames-src-mq3-client-ui-sppostgame-ml-2058901622"></a>
### medalNames

```ml
function medalNames()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L35)

<a id="function-function-mq3-client-ui-sppostgame-medalpics-function-medalpics-src-mq3-client-ui-sppostgame-ml-474938130"></a>
### medalPics

```ml
function medalPics()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L36)

<a id="function-function-mq3-client-ui-sppostgame-medalsounds-function-medalsounds-src-mq3-client-ui-sppostgame-ml-1006218688"></a>
### medalSounds

```ml
function medalSounds()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L37)

<a id="function-function-mq3-client-ui-sppostgame-padded-function-padded-text-width-src-mq3-client-ui-sppostgame-ml-483215459"></a>
### padded

```ml
function padded(text, width)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L84)

<a id="function-function-mq3-client-ui-sppostgame-playerinfo-function-playerinfo-value-clientnum-src-mq3-client-ui-sppostgame-ml-2145525604"></a>
### playerInfo

```ml
function playerInfo(value, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L80)

- [mq3.client.ui_sppostgame.Postgame](Type-mq3-client-ui-sppostgame-postgame-205691195.md) — struct
<a id="function-function-mq3-client-ui-sppostgame-prepname-function-prepname-value-index-src-mq3-client-ui-sppostgame-ml-1963670899"></a>
### Prepname

```ml
function Prepname(value, index)
```

Prepname

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L87)

<a id="constant-constant-mq3-client-ui-sppostgame-rank-tied-flag-const-rank-tied-flag-16384-src-mq3-client-ui-sppostgame-ml-808515313"></a>
### RANK_TIED_FLAG

```ml
const RANK_TIED_FLAG = 16384
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L18)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-againevent-function-ui-sppostgamemenu-againevent-value-event-src-mq3-client-ui-sppostgame-ml-1873108659"></a>
### UI_SPPostgameMenu_AgainEvent

```ml
function UI_SPPostgameMenu_AgainEvent(value, event)
```

UI_SPPostgameMenu_AgainEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L41)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-cache-function-ui-sppostgamemenu-cache-buildscript-src-mq3-client-ui-sppostgame-ml-607776277"></a>
### UI_SPPostgameMenu_Cache

```ml
function UI_SPPostgameMenu_Cache(buildscript)
```

UI_SPPostgameMenu_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buildscript` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L97)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-drawawardsmedals-function-ui-sppostgamemenu-drawawardsmedals-value-max-src-mq3-client-ui-sppostgame-ml-1631014037"></a>
### UI_SPPostgameMenu_DrawAwardsMedals

```ml
function UI_SPPostgameMenu_DrawAwardsMedals(value, max)
```

UI_SPPostgameMenu_DrawAwardsMedals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `max` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L70)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-drawawardspresentation-function-ui-sppostgamemenu-drawawardspresentation-value-timer-src-mq3-client-ui-sppostgame-ml-1797837048"></a>
### UI_SPPostgameMenu_DrawAwardsPresentation

```ml
function UI_SPPostgameMenu_DrawAwardsPresentation(value, timer)
```

UI_SPPostgameMenu_DrawAwardsPresentation

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `timer` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L75)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-f-function-ui-sppostgamemenu-f-game-realtime-systeminfo-serverinfo-argv-playerconfigs-demoversion-src-mq3-client-ui-sppostgame-ml-1489830960"></a>
### UI_SPPostgameMenu_f

```ml
function UI_SPPostgameMenu_f(game, realtime, systemInfo, serverInfo, argv, playerConfigs, demoVersion)
```

UI_SPPostgameMenu_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `game` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |
| `systemInfo` | `dynamic` | — |  |
| `serverInfo` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |
| `playerConfigs` | `dynamic` | — |  |
| `demoVersion` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L116)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-init-function-ui-sppostgamemenu-init-value-realtime-src-mq3-client-ui-sppostgame-ml-1384845900"></a>
### UI_SPPostgameMenu_Init

```ml
function UI_SPPostgameMenu_Init(value, realtime)
```

UI_SPPostgameMenu_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L102)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-menudraw-function-ui-sppostgamemenu-menudraw-value-realtime-currentserverid-src-mq3-client-ui-sppostgame-ml-2003713991"></a>
### UI_SPPostgameMenu_MenuDraw

```ml
function UI_SPPostgameMenu_MenuDraw(value, realtime, currentServerId)
```

UI_SPPostgameMenu_MenuDraw

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |
| `currentServerId` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L126)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-menudrawscoreline-function-ui-sppostgamemenu-menudrawscoreline-value-n-y-src-mq3-client-ui-sppostgame-ml-1638777330"></a>
### UI_SPPostgameMenu_MenuDrawScoreLine

```ml
function UI_SPPostgameMenu_MenuDrawScoreLine(value, n, y)
```

UI_SPPostgameMenu_MenuDrawScoreLine

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `n` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L92)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-menuevent-function-ui-sppostgamemenu-menuevent-value-event-src-mq3-client-ui-sppostgame-ml-1363980889"></a>
### UI_SPPostgameMenu_MenuEvent

```ml
function UI_SPPostgameMenu_MenuEvent(value, event)
```

UI_SPPostgameMenu_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L51)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-menukey-function-ui-sppostgamemenu-menukey-value-key-realtime-cursorx-cursory-src-mq3-client-ui-sppostgame-ml-11024112"></a>
### UI_SPPostgameMenu_MenuKey

```ml
function UI_SPPostgameMenu_MenuKey(value, key, realtime, cursorx, cursory)
```

UI_SPPostgameMenu_MenuKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |
| `cursorx` | `dynamic` | — |  |
| `cursory` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L56)

<a id="function-function-mq3-client-ui-sppostgame-ui-sppostgamemenu-nextevent-function-ui-sppostgamemenu-nextevent-value-event-src-mq3-client-ui-sppostgame-ml-1295934733"></a>
### UI_SPPostgameMenu_NextEvent

```ml
function UI_SPPostgameMenu_NextEvent(value, event)
```

UI_SPPostgameMenu_NextEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_sppostgame.ml#L46)
