# `src/mq3/client/cgame_main.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_main`](Package-mq3-client-cgame-main-1719186952.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-cgame-main-action-function-action-boundary-kind-name-value-value2-number-flags-retailactive-src-mq3-client-cgame-main-ml-953347874"></a>
### action

```ml
function action(boundary, kind, name, value, value2, number, flags, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `value2` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L56)

- [mq3.client.cgame_main.Action](Type-mq3-client-cgame-main-action-1053767360.md) — struct
<a id="function-function-mq3-client-cgame-main-argv-function-argv-args-index-src-mq3-client-cgame-main-ml-1460541111"></a>
### argv

```ml
function argv(args, index)
```

CG_Argv

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L68)

<a id="function-function-mq3-client-cgame-main-assetcache-function-assetcache-state-retailactive-src-mq3-client-cgame-main-ml-1272044528"></a>
### assetCache

```ml
function assetCache(state, retailActive)
```

CG_AssetCache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L216)

<a id="function-function-mq3-client-cgame-main-assetparse-function-assetparse-state-tokens-start-retailactive-src-mq3-client-cgame-main-ml-1566404112"></a>
### assetParse

```ml
function assetParse(state, tokens, start, retailActive)
```

CG_Asset_Parse

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `tokens` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L149)

<a id="extern_function-extern-function-mq3-client-cgame-main-atof-extern-function-atof-text-as-cstr-from-ucrtbase-dll-returns-double-src-mq3-client-cgame-main-ml-483178875"></a>
### atof

```ml
extern function atof(text as cstr) from "ucrtbase.dll" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L10)

<a id="extern_function-extern-function-mq3-client-cgame-main-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-client-cgame-main-ml-2118327986"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L9)

<a id="function-function-mq3-client-cgame-main-basegraphics-function-basegraphics-src-mq3-client-cgame-main-ml-1499393620"></a>
### baseGraphics

```ml
function baseGraphics()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L120)

<a id="function-function-mq3-client-cgame-main-basesounds-function-basesounds-src-mq3-client-cgame-main-ml-1935160008"></a>
### baseSounds

```ml
function baseSounds()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L112)

<a id="function-function-mq3-client-cgame-main-buildspectatorstring-function-buildspectatorstring-state-src-mq3-client-cgame-main-ml-1909250217"></a>
### buildSpectatorString

```ml
function buildSpectatorString(state)
```

CG_BuildSpectatorString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L132)

<a id="constant-constant-mq3-client-cgame-main-cg-console-command-const-cg-console-command-2-src-mq3-client-cgame-main-ml-1926490749"></a>
### CG_CONSOLE_COMMAND

```ml
const CG_CONSOLE_COMMAND = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L30)

<a id="constant-constant-mq3-client-cgame-main-cg-crosshair-player-const-cg-crosshair-player-4-src-mq3-client-cgame-main-ml-863930465"></a>
### CG_CROSSHAIR_PLAYER

```ml
const CG_CROSSHAIR_PLAYER = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L32)

<a id="constant-constant-mq3-client-cgame-main-cg-draw-active-frame-const-cg-draw-active-frame-3-src-mq3-client-cgame-main-ml-322443512"></a>
### CG_DRAW_ACTIVE_FRAME

```ml
const CG_DRAW_ACTIVE_FRAME = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L31)

<a id="constant-constant-mq3-client-cgame-main-cg-event-handling-const-cg-event-handling-8-src-mq3-client-cgame-main-ml-1630742941"></a>
### CG_EVENT_HANDLING

```ml
const CG_EVENT_HANDLING = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L36)

<a id="constant-constant-mq3-client-cgame-main-cg-init-const-cg-init-0-src-mq3-client-cgame-main-ml-1204025833"></a>
### CG_INIT

```ml
const CG_INIT = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L28)

<a id="constant-constant-mq3-client-cgame-main-cg-key-event-const-cg-key-event-6-src-mq3-client-cgame-main-ml-812056715"></a>
### CG_KEY_EVENT

```ml
const CG_KEY_EVENT = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L34)

<a id="constant-constant-mq3-client-cgame-main-cg-last-attacker-const-cg-last-attacker-5-src-mq3-client-cgame-main-ml-762733540"></a>
### CG_LAST_ATTACKER

```ml
const CG_LAST_ATTACKER = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L33)

<a id="constant-constant-mq3-client-cgame-main-cg-mouse-event-const-cg-mouse-event-7-src-mq3-client-cgame-main-ml-1386472774"></a>
### CG_MOUSE_EVENT

```ml
const CG_MOUSE_EVENT = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L35)

<a id="constant-constant-mq3-client-cgame-main-cg-shutdown-const-cg-shutdown-1-src-mq3-client-cgame-main-ml-639402052"></a>
### CG_SHUTDOWN

```ml
const CG_SHUTDOWN = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L29)

<a id="function-function-mq3-client-cgame-main-client-function-client-src-mq3-client-cgame-main-ml-1743880804"></a>
### client

```ml
function client()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L50)

- [mq3.client.cgame_main.Client](Type-mq3-client-cgame-main-client-1204603393.md) — struct
<a id="function-function-mq3-client-cgame-main-configstring-function-configstring-state-index-src-mq3-client-cgame-main-ml-431606295"></a>
### configString

```ml
function configString(state, index)
```

CG_ConfigString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L70)

<a id="function-function-mq3-client-cgame-main-create-function-create-src-mq3-client-cgame-main-ml-1215111156"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L52)

<a id="function-function-mq3-client-cgame-main-crosshairplayer-function-crosshairplayer-state-src-mq3-client-cgame-main-ml-2062898667"></a>
### crosshairPlayer

```ml
function crosshairPlayer(state)
```

CG_CrosshairPlayer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L101)

<a id="constant-constant-mq3-client-cgame-main-cs-game-version-const-cs-game-version-20-src-mq3-client-cgame-main-ml-2117492399"></a>
### CS_GAME_VERSION

```ml
const CS_GAME_VERSION = 20
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L15)

<a id="constant-constant-mq3-client-cgame-main-cs-items-const-cs-items-27-src-mq3-client-cgame-main-ml-221033244"></a>
### CS_ITEMS

```ml
const CS_ITEMS = 27
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L17)

<a id="constant-constant-mq3-client-cgame-main-cs-level-start-time-const-cs-level-start-time-21-src-mq3-client-cgame-main-ml-1027365270"></a>
### CS_LEVEL_START_TIME

```ml
const CS_LEVEL_START_TIME = 21
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L16)

<a id="constant-constant-mq3-client-cgame-main-cs-models-const-cs-models-32-src-mq3-client-cgame-main-ml-492798810"></a>
### CS_MODELS

```ml
const CS_MODELS = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L18)

<a id="constant-constant-mq3-client-cgame-main-cs-music-const-cs-music-2-src-mq3-client-cgame-main-ml-45113753"></a>
### CS_MUSIC

```ml
const CS_MUSIC = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L14)

<a id="constant-constant-mq3-client-cgame-main-cs-players-const-cs-players-544-src-mq3-client-cgame-main-ml-2010956152"></a>
### CS_PLAYERS

```ml
const CS_PLAYERS = 544
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L20)

<a id="constant-constant-mq3-client-cgame-main-cs-sounds-const-cs-sounds-288-src-mq3-client-cgame-main-ml-1213014155"></a>
### CS_SOUNDS

```ml
const CS_SOUNDS = 288
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L19)

- [mq3.client.cgame_main.Cvar](Type-mq3-client-cgame-main-cvar-2054669032.md) — struct
<a id="function-function-mq3-client-cgame-main-cvarget-function-cvarget-state-name-src-mq3-client-cgame-main-ml-1253818526"></a>
### cvarGet

```ml
function cvarGet(state, name)
```

CG_Cvar_Get

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L200)

<a id="function-function-mq3-client-cgame-main-cvarspec-function-cvarspec-name-defaultvalue-flags-src-mq3-client-cgame-main-ml-1290860860"></a>
### cvarSpec

```ml
function cvarSpec(name, defaultValue, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `defaultValue` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L72)

<a id="function-function-mq3-client-cgame-main-cvarspecs-function-cvarspecs-src-mq3-client-cgame-main-ml-1276739776"></a>
### cvarSpecs

```ml
function cvarSpecs()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L73)

<a id="function-function-mq3-client-cgame-main-drawcinematic-function-drawcinematic-handle-x-y-w-h-retailactive-src-mq3-client-cgame-main-ml-1024254357"></a>
### drawCinematic

```ml
function drawCinematic(handle, x, y, w, h, retailActive)
```

CG_DrawCinematic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L210)

<a id="function-function-mq3-client-cgame-main-emit-function-emit-effect-boundary-kind-name-value-value2-number-flags-retailactive-src-mq3-client-cgame-main-ml-1622616355"></a>
### emit

```ml
function emit(effect, boundary, kind, name, value, value2, number, flags, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effect` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `value2` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L58)

<a id="function-function-mq3-client-cgame-main-errormessage-function-errormessage-text-retailactive-src-mq3-client-cgame-main-ml-524479786"></a>
### errorMessage

```ml
function errorMessage(text, retailActive)
```

CG_Error Com_Error

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L66)

<a id="function-function-mq3-client-cgame-main-eventhandling-function-eventhandling-state-type-src-mq3-client-cgame-main-ml-246418343"></a>
### eventHandling

```ml
function eventHandling(state, type)
```

CG_EventHandling

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L229)

<a id="constant-constant-mq3-client-cgame-main-feeder-blueteam-list-const-feeder-blueteam-list-2-src-mq3-client-cgame-main-ml-1390524421"></a>
### FEEDER_BLUETEAM_LIST

```ml
const FEEDER_BLUETEAM_LIST = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L38)

<a id="constant-constant-mq3-client-cgame-main-feeder-redteam-list-const-feeder-redteam-list-1-src-mq3-client-cgame-main-ml-1364158196"></a>
### FEEDER_REDTEAM_LIST

```ml
const FEEDER_REDTEAM_LIST = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L37)

<a id="constant-constant-mq3-client-cgame-main-feeder-scoreboard-const-feeder-scoreboard-3-src-mq3-client-cgame-main-ml-343809326"></a>
### FEEDER_SCOREBOARD

```ml
const FEEDER_SCOREBOARD = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L39)

<a id="function-function-mq3-client-cgame-main-feedercount-function-feedercount-state-feederid-src-mq3-client-cgame-main-ml-656299343"></a>
### feederCount

```ml
function feederCount(state, feederID)
```

CG_FeederCount

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `feederID` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L179)

<a id="function-function-mq3-client-cgame-main-feederitemimage-function-feederitemimage-feederid-index-src-mq3-client-cgame-main-ml-529662924"></a>
### feederItemImage

```ml
function feederItemImage(feederID, index)
```

CG_FeederItemImage

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `feederID` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L196)

<a id="function-function-mq3-client-cgame-main-feederitemtext-function-feederitemtext-state-feederid-index-column-readymask-src-mq3-client-cgame-main-ml-605719670"></a>
### feederItemText

```ml
function feederItemText(state, feederID, index, column, readyMask)
```

CG_FeederItemText

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `feederID` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `column` | `dynamic` | — |  |
| `readyMask` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L188)

<a id="function-function-mq3-client-cgame-main-feederselection-function-feederselection-state-feederid-index-src-mq3-client-cgame-main-ml-27938387"></a>
### feederSelection

```ml
function feederSelection(state, feederID, index)
```

CG_FeederSelection

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `feederID` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L198)

<a id="function-function-mq3-client-cgame-main-findcvar-function-findcvar-state-name-src-mq3-client-cgame-main-ml-1958167258"></a>
### findCvar

```ml
function findCvar(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L80)

<a id="function-function-mq3-client-cgame-main-forcemodelchange-function-forcemodelchange-state-retailactive-src-mq3-client-cgame-main-ml-1283477564"></a>
### forceModelChange

```ml
function forceModelChange(state, retailActive)
```

CG_ForceModelChange

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L90)

<a id="function-function-mq3-client-cgame-main-getmenubuffer-function-getmenubuffer-filename-text-maxsize-src-mq3-client-cgame-main-ml-283392439"></a>
### getMenuBuffer

```ml
function getMenuBuffer(filename, text, maxSize)
```

CG_GetMenuBuffer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filename` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `maxSize` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L147)

<a id="constant-constant-mq3-client-cgame-main-gt-team-const-gt-team-3-src-mq3-client-cgame-main-ml-636292634"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L26)

<a id="constant-constant-mq3-client-cgame-main-gt-tournament-const-gt-tournament-1-src-mq3-client-cgame-main-ml-1967860844"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L25)

<a id="function-function-mq3-client-cgame-main-hudassets-function-hudassets-src-mq3-client-cgame-main-ml-2125143748"></a>
### hudAssets

```ml
function hudAssets()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L51)

- [mq3.client.cgame_main.HudAssets](Type-mq3-client-cgame-main-hudassets-665283646.md) — struct
<a id="function-function-mq3-client-cgame-main-infofromscoreindex-function-infofromscoreindex-state-index-team-src-mq3-client-cgame-main-ml-635857230"></a>
### infoFromScoreIndex

```ml
function infoFromScoreIndex(state, index, team)
```

CG_InfoFromScoreIndex

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L186)

<a id="function-function-mq3-client-cgame-main-init-function-init-state-servermessagenum-servercommandsequence-clientnum-gameversion-vidwidth-vidheight-items-retailactive-src-mq3-client-cgame-main-ml-1405693357"></a>
### init

```ml
function init(state, serverMessageNum, serverCommandSequence, clientNum, gameVersion, vidWidth, vidHeight, items, retailActive)
```

CG_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverMessageNum` | `dynamic` | — |  |
| `serverCommandSequence` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `gameVersion` | `dynamic` | — |  |
| `vidWidth` | `dynamic` | — |  |
| `vidHeight` | `dynamic` | — |  |
| `items` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L219)

- [mq3.client.cgame_main.Item](Type-mq3-client-cgame-main-item-495663849.md) — struct
<a id="function-function-mq3-client-cgame-main-keyevent-function-keyevent-state-key-down-src-mq3-client-cgame-main-ml-2005306932"></a>
### keyEvent

```ml
function keyEvent(state, key, down)
```

CG_KeyEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L231)

<a id="function-function-mq3-client-cgame-main-lastattacker-function-lastattacker-state-src-mq3-client-cgame-main-ml-589473373"></a>
### lastAttacker

```ml
function lastAttacker(state)
```

CG_LastAttacker

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L103)

<a id="function-function-mq3-client-cgame-main-loadhudmenu-function-loadhudmenu-state-hudtext-menufiles-retailactive-src-mq3-client-cgame-main-ml-1866665680"></a>
### loadHudMenu

```ml
function loadHudMenu(state, hudText, menuFiles, retailActive)
```

CG_LoadHudMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `hudText` | `dynamic` | — |  |
| `menuFiles` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L214)

<a id="function-function-mq3-client-cgame-main-loadmenu-function-loadmenu-state-tokens-start-files-retailactive-src-mq3-client-cgame-main-ml-821619769"></a>
### loadMenu

```ml
function loadMenu(state, tokens, start, files, retailActive)
```

CG_Load_Menu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `tokens` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `files` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L169)

<a id="function-function-mq3-client-cgame-main-loadmenus-function-loadmenus-state-menufile-text-files-retailactive-src-mq3-client-cgame-main-ml-1030752987"></a>
### loadMenus

```ml
function loadMenus(state, menuFile, text, files, retailActive)
```

CG_LoadMenus

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `menuFile` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `files` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L173)

<a id="constant-constant-mq3-client-cgame-main-max-clients-const-max-clients-64-src-mq3-client-cgame-main-ml-911047387"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L12)

<a id="constant-constant-mq3-client-cgame-main-max-configstrings-const-max-configstrings-1024-src-mq3-client-cgame-main-ml-1222498808"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L13)

<a id="function-function-mq3-client-cgame-main-menutokens-function-menutokens-text-src-mq3-client-cgame-main-ml-480236411"></a>
### menuTokens

```ml
function menuTokens(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L143)

<a id="function-function-mq3-client-cgame-main-merge-function-merge-effect-other-src-mq3-client-cgame-main-ml-1281251817"></a>
### merge

```ml
function merge(effect, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effect` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L59)

<a id="function-function-mq3-client-cgame-main-mouseevent-function-mouseevent-state-x-y-src-mq3-client-cgame-main-ml-1611407826"></a>
### mouseEvent

```ml
function mouseEvent(state, x, y)
```

CG_MouseEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L233)

<a id="function-function-mq3-client-cgame-main-ownerdrawhandlekey-function-ownerdrawhandlekey-ownerdraw-flags-special-key-src-mq3-client-cgame-main-ml-725193166"></a>
### ownerDrawHandleKey

```ml
function ownerDrawHandleKey(ownerDraw, flags, special, key)
```

CG_OwnerDrawHandleKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ownerDraw` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L177)

<a id="function-function-mq3-client-cgame-main-ownerdrawwidth-function-ownerdrawwidth-ownerdraw-scale-gametypetext-statustext-killertext-redname-bluename-src-mq3-client-cgame-main-ml-211884012"></a>
### ownerDrawWidth

```ml
function ownerDrawWidth(ownerDraw, scale, gameTypeText, statusText, killerText, redName, blueName)
```

CG_OwnerDrawWidth

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ownerDraw` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `gameTypeText` | `dynamic` | — |  |
| `statusText` | `dynamic` | — |  |
| `killerText` | `dynamic` | — |  |
| `redName` | `dynamic` | — |  |
| `blueName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L204)

<a id="function-function-mq3-client-cgame-main-parsemenu-function-parsemenu-state-menufile-text-retailactive-src-mq3-client-cgame-main-ml-724865082"></a>
### parseMenu

```ml
function parseMenu(state, menuFile, text, retailActive)
```

CG_ParseMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `menuFile` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L165)

<a id="function-function-mq3-client-cgame-main-playcinematic-function-playcinematic-state-name-x-y-w-h-retailactive-src-mq3-client-cgame-main-ml-1362624281"></a>
### playCinematic

```ml
function playCinematic(state, name, x, y, w, h, retailActive)
```

CG_PlayCinematic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L206)

<a id="function-function-mq3-client-cgame-main-printmessage-function-printmessage-text-retailactive-src-mq3-client-cgame-main-ml-983892018"></a>
### printMessage

```ml
function printMessage(text, retailActive)
```

CG_Printf Com_Printf

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L63)

<a id="function-function-mq3-client-cgame-main-registerclients-function-registerclients-state-retailactive-src-mq3-client-cgame-main-ml-580628154"></a>
### registerClients

```ml
function registerClients(state, retailActive)
```

CG_RegisterClients

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L136)

<a id="function-function-mq3-client-cgame-main-registercvars-function-registercvars-state-svrunning-retailactive-src-mq3-client-cgame-main-ml-641210418"></a>
### registerCvars

```ml
function registerCvars(state, svRunning, retailActive)
```

CG_RegisterCvars

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `svRunning` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L83)

<a id="function-function-mq3-client-cgame-main-registergraphics-function-registergraphics-state-items-retailactive-src-mq3-client-cgame-main-ml-196895570"></a>
### registerGraphics

```ml
function registerGraphics(state, items, retailActive)
```

CG_RegisterGraphics

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `items` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L122)

<a id="function-function-mq3-client-cgame-main-registeritemsounds-function-registeritemsounds-item-itemnum-retailactive-src-mq3-client-cgame-main-ml-1506902349"></a>
### registerItemSounds

```ml
function registerItemSounds(item, itemNum, retailActive)
```

CG_RegisterItemSounds

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `item` | `dynamic` | — |  |
| `itemNum` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L108)

<a id="function-function-mq3-client-cgame-main-registersounds-function-registersounds-state-items-retailactive-src-mq3-client-cgame-main-ml-151687218"></a>
### registerSounds

```ml
function registerSounds(state, items, retailActive)
```

CG_RegisterSounds

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `items` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L114)

<a id="function-function-mq3-client-cgame-main-result-function-result-handled-value-src-mq3-client-cgame-main-ml-1906671231"></a>
### result

```ml
function result(handled, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handled` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L57)

- [mq3.client.cgame_main.Result](Type-mq3-client-cgame-main-result-1141204139.md) — struct
<a id="function-function-mq3-client-cgame-main-runcinematicframe-function-runcinematicframe-handle-retailactive-src-mq3-client-cgame-main-ml-611886313"></a>
### runCinematicFrame

```ml
function runCinematicFrame(handle, retailActive)
```

CG_RunCinematicFrame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L212)

- [mq3.client.cgame_main.Score](Type-mq3-client-cgame-main-score-1695914296.md) — struct
<a id="function-function-mq3-client-cgame-main-setscoreselection-function-setscoreselection-state-clientnum-hasmenu-retailactive-src-mq3-client-cgame-main-ml-903755616"></a>
### setScoreSelection

```ml
function setScoreSelection(state, clientNum, hasMenu, retailActive)
```

CG_SetScoreSelection

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `hasMenu` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L181)

<a id="function-function-mq3-client-cgame-main-shutdown-function-shutdown-state-retailactive-src-mq3-client-cgame-main-ml-1302453760"></a>
### shutdown

```ml
function shutdown(state, retailActive)
```

CG_Shutdown

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L227)

<a id="function-function-mq3-client-cgame-main-splitwords-function-splitwords-text-src-mq3-client-cgame-main-ml-1188929167"></a>
### splitWords

```ml
function splitWords(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L105)

<a id="function-function-mq3-client-cgame-main-startmusic-function-startmusic-state-retailactive-src-mq3-client-cgame-main-ml-1950110256"></a>
### startMusic

```ml
function startMusic(state, retailActive)
```

CG_StartMusic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L141)

- [mq3.client.cgame_main.State](Type-mq3-client-cgame-main-state-1163369719.md) — struct
<a id="function-function-mq3-client-cgame-main-stopcinematic-function-stopcinematic-handle-retailactive-src-mq3-client-cgame-main-ml-1339318873"></a>
### stopCinematic

```ml
function stopCinematic(handle, retailActive)
```

CG_StopCinematic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L208)

<a id="function-function-mq3-client-cgame-main-suffix-function-suffix-text-want-src-mq3-client-cgame-main-ml-1669933353"></a>
### suffix

```ml
function suffix(text, want)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `want` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L106)

<a id="constant-constant-mq3-client-cgame-main-team-blue-const-team-blue-2-src-mq3-client-cgame-main-ml-251438523"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L23)

<a id="constant-constant-mq3-client-cgame-main-team-free-const-team-free-0-src-mq3-client-cgame-main-ml-432045649"></a>
### TEAM_FREE

```ml
const TEAM_FREE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L21)

<a id="constant-constant-mq3-client-cgame-main-team-red-const-team-red-1-src-mq3-client-cgame-main-ml-39380068"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L22)

<a id="constant-constant-mq3-client-cgame-main-team-spectator-const-team-spectator-3-src-mq3-client-cgame-main-ml-978078842"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L24)

<a id="function-function-mq3-client-cgame-main-textpaintwithcursor-function-textpaintwithcursor-text-cursorpos-cursor-limit-style-retailactive-src-mq3-client-cgame-main-ml-1426501384"></a>
### textPaintWithCursor

```ml
function textPaintWithCursor(text, cursorPos, cursor, limit, style, retailActive)
```

CG_Text_PaintWithCursor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `cursorPos` | `dynamic` | — |  |
| `cursor` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L202)

<a id="function-function-mq3-client-cgame-main-updatecvars-function-updatecvars-state-updates-retailactive-src-mq3-client-cgame-main-ml-1809592228"></a>
### updateCvars

```ml
function updateCvars(state, updates, retailActive)
```

CG_UpdateCvars

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `updates` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L94)

<a id="function-function-mq3-client-cgame-main-vmmain-function-vmmain-state-command-args-items-gameversion-vidwidth-vidheight-retailactive-src-mq3-client-cgame-main-ml-877184929"></a>
### vmMain

```ml
function vmMain(state, command, args, items, gameVersion, vidWidth, vidHeight, retailActive)
```

vmMain

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |
| `items` | `dynamic` | — |  |
| `gameVersion` | `dynamic` | — |  |
| `vidWidth` | `dynamic` | — |  |
| `vidHeight` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L235)

<a id="constant-constant-mq3-client-cgame-main-wp-machinegun-const-wp-machinegun-2-src-mq3-client-cgame-main-ml-563110343"></a>
### WP_MACHINEGUN

```ml
const WP_MACHINEGUN = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_main.ml#L27)
