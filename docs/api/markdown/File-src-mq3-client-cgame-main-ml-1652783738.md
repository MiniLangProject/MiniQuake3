# `src/mq3/client/cgame_main.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_main`](Package-mq3-client-cgame-main-1719186952.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-cgame-main-action-function-action-boundary-kind-name-value-value2-number-flags-retailactive-src-mq3-client-cgame-main-ml-953347874"></a>
### action

```ml
function action(boundary, kind, name, value, value2, number, flags, retailActive)
```

Creates a `mq3.client.cgame_main.Action` record. Assigns `boundary` from `boundary`, `kind` from `kind`, `name` from `name`, `value` from `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `boundary` | `dynamic` | — | Value used to initialize `Action.boundary`. |
| `kind` | `dynamic` | — | Value used to initialize `Action.kind`. |
| `name` | `dynamic` | — | Value used to initialize `Action.name`. |
| `value` | `dynamic` | — | Value used to initialize `Action.value`. |
| `value2` | `dynamic` | — | Value used to initialize `Action.value2`. |
| `number` | `dynamic` | — | Value used to initialize `Action.number`. |
| `flags` | `dynamic` | — | Value used to initialize `Action.flags`. |
| `retailActive` | `dynamic` | — | Value used to initialize `Action.dispatched`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L323)

- [mq3.client.cgame_main.Action](Type-mq3-client-cgame-main-action-1053767360.md) — struct
<a id="function-function-mq3-client-cgame-main-argv-function-argv-args-index-src-mq3-client-cgame-main-ml-1460541111"></a>
### argv

```ml
function argv(args, index)
```

CG_Argv

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — | Sequence read at `args[index]`. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=len(args)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L357)

<a id="function-function-mq3-client-cgame-main-assetcache-function-assetcache-state-retailactive-src-mq3-client-cgame-main-ml-1272044528"></a>
### assetCache

```ml
function assetCache(state, retailActive)
```

CG_AssetCache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Accepted for compatibility with `assetCache`; the current implementation does not read it. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L630)

<a id="function-function-mq3-client-cgame-main-assetparse-function-assetparse-state-tokens-start-retailactive-src-mq3-client-cgame-main-ml-1566404112"></a>
### assetParse

```ml
function assetParse(state, tokens, start, retailActive)
```

CG_Asset_Parse

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game main record/storage; this routine assigns `state.hudAssets.textFont`, `state.hudAssets.smallFont`, `state.hudAssets.bigFont`, `state.hudAssets.gradientBar` and additional values. |
| `tokens` | `dynamic` | — | Sequence read at `tokens[start]`, `tokens[at]`, `tokens[at+1]`, `tokens[at+2]` and additional values. |
| `start` | `dynamic` | — | Value tested by `start>=len(tokens) or tokens[start]!="{"` before the calculation continues. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L488)

<a id="extern_function-extern-function-mq3-client-cgame-main-atof-extern-function-atof-text-as-cstr-from-ucrtbase-dll-returns-double-src-mq3-client-cgame-main-ml-483178875"></a>
### atof

```ml
extern function atof(text as cstr) from "ucrtbase.dll" returns double
```

Converts a NUL-terminated numeric C string to a double using the Windows C runtime. This binding is used by client game main.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — | NUL-terminated C string containing the decimal numeric text. |


**Returns:** The parsed floating-point value; a string with no initial numeric conversion yields zero.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L16)

<a id="extern_function-extern-function-mq3-client-cgame-main-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-client-cgame-main-ml-2118327986"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

Converts a NUL-terminated decimal C string to a signed 32-bit integer using the Windows C runtime. This binding is used by client game main.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — | NUL-terminated C string containing the decimal numeric text. |


**Returns:** The converted integer; a string with no initial numeric conversion yields zero.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L12)

<a id="function-function-mq3-client-cgame-main-basegraphics-function-basegraphics-src-mq3-client-cgame-main-ml-1499393620"></a>
### baseGraphics

```ml
function baseGraphics()
```

Lists the 140 client game main base graphics strings in their declared order, beginning with `"menu/art/skill1.tga"`, `"menu/art/skill2.tga"`, `"menu/art/skill3.tga"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L442)

<a id="function-function-mq3-client-cgame-main-basesounds-function-basesounds-src-mq3-client-cgame-main-ml-1935160008"></a>
### baseSounds

```ml
function baseSounds()
```

Lists the 145 client game main base sounds strings in their declared order, beginning with `"sound/feedback/1_minute.wav"`, `"sound/feedback/5_minute.wav"`, `"sound/feedback/sudden_death.wav"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L430)

<a id="function-function-mq3-client-cgame-main-buildspectatorstring-function-buildspectatorstring-state-src-mq3-client-cgame-main-ml-1909250217"></a>
### buildSpectatorString

```ml
function buildSpectatorString(state)
```

CG_BuildSpectatorString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game main record/storage; this routine assigns `state.spectatorList`, `state.spectatorLen`, `state.spectatorWidth`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L458)

<a id="constant-constant-mq3-client-cgame-main-cg-console-command-const-cg-console-command-2-src-mq3-client-cgame-main-ml-1926490749"></a>
### CG_CONSOLE_COMMAND

```ml
const CG_CONSOLE_COMMAND = 2
```

CG VM entry-point ordinal used to handle a CGame console command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L57)

<a id="constant-constant-mq3-client-cgame-main-cg-crosshair-player-const-cg-crosshair-player-4-src-mq3-client-cgame-main-ml-863930465"></a>
### CG_CROSSHAIR_PLAYER

```ml
const CG_CROSSHAIR_PLAYER = 4
```

CG VM entry-point ordinal used to query the player currently under the crosshair.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L61)

<a id="constant-constant-mq3-client-cgame-main-cg-draw-active-frame-const-cg-draw-active-frame-3-src-mq3-client-cgame-main-ml-322443512"></a>
### CG_DRAW_ACTIVE_FRAME

```ml
const CG_DRAW_ACTIVE_FRAME = 3
```

CG VM entry-point ordinal used to render a CGame frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L59)

<a id="constant-constant-mq3-client-cgame-main-cg-event-handling-const-cg-event-handling-8-src-mq3-client-cgame-main-ml-1630742941"></a>
### CG_EVENT_HANDLING

```ml
const CG_EVENT_HANDLING = 8
```

CG VM entry-point ordinal used to switch CGame event-handling mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L69)

<a id="constant-constant-mq3-client-cgame-main-cg-init-const-cg-init-0-src-mq3-client-cgame-main-ml-1204025833"></a>
### CG_INIT

```ml
const CG_INIT = 0
```

CG VM entry-point ordinal used to initialize the CGame VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L53)

<a id="constant-constant-mq3-client-cgame-main-cg-key-event-const-cg-key-event-6-src-mq3-client-cgame-main-ml-812056715"></a>
### CG_KEY_EVENT

```ml
const CG_KEY_EVENT = 6
```

CG VM entry-point ordinal used to deliver a key event to CGame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L65)

<a id="constant-constant-mq3-client-cgame-main-cg-last-attacker-const-cg-last-attacker-5-src-mq3-client-cgame-main-ml-762733540"></a>
### CG_LAST_ATTACKER

```ml
const CG_LAST_ATTACKER = 5
```

CG VM entry-point ordinal used to query the latest attacker.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L63)

<a id="constant-constant-mq3-client-cgame-main-cg-mouse-event-const-cg-mouse-event-7-src-mq3-client-cgame-main-ml-1386472774"></a>
### CG_MOUSE_EVENT

```ml
const CG_MOUSE_EVENT = 7
```

CG VM entry-point ordinal used to deliver pointer motion to CGame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L67)

<a id="constant-constant-mq3-client-cgame-main-cg-shutdown-const-cg-shutdown-1-src-mq3-client-cgame-main-ml-639402052"></a>
### CG_SHUTDOWN

```ml
const CG_SHUTDOWN = 1
```

CG VM entry-point ordinal used to shut down the CGame VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L55)

<a id="function-function-mq3-client-cgame-main-client-function-client-src-mq3-client-cgame-main-ml-1743880804"></a>
### client

```ml
function client()
```

Creates a `mq3.client.cgame_main.Client` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L306)

- [mq3.client.cgame_main.Client](Type-mq3-client-cgame-main-client-1204603393.md) — struct
<a id="function-function-mq3-client-cgame-main-configstring-function-configstring-state-index-src-mq3-client-cgame-main-ml-431606295"></a>
### configString

```ml
function configString(state, index)
```

CG_ConfigString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.configstrings`. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=MAX_CONFIGSTRINGS` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L361)

<a id="function-function-mq3-client-cgame-main-create-function-create-src-mq3-client-cgame-main-ml-1215111156"></a>
### create

```ml
function create()
```

Calls `mq3.client.cgame_main.client`, `mq3.client.cgame_main.State`, `mq3.client.cgame_main.hudAssets` from client game main `create`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L310)

<a id="function-function-mq3-client-cgame-main-crosshairplayer-function-crosshairplayer-state-src-mq3-client-cgame-main-ml-2062898667"></a>
### crosshairPlayer

```ml
function crosshairPlayer(state)
```

CG_CrosshairPlayer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`, `state.crosshairClientTime`, `state.crosshairClientNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L409)

<a id="constant-constant-mq3-client-cgame-main-cs-game-version-const-cs-game-version-20-src-mq3-client-cgame-main-ml-2117492399"></a>
### CS_GAME_VERSION

```ml
const CS_GAME_VERSION = 20
```

Server configuration-string index for game version; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L25)

<a id="constant-constant-mq3-client-cgame-main-cs-items-const-cs-items-27-src-mq3-client-cgame-main-ml-221033244"></a>
### CS_ITEMS

```ml
const CS_ITEMS = 27
```

Server configuration-string index for items; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L29)

<a id="constant-constant-mq3-client-cgame-main-cs-level-start-time-const-cs-level-start-time-21-src-mq3-client-cgame-main-ml-1027365270"></a>
### CS_LEVEL_START_TIME

```ml
const CS_LEVEL_START_TIME = 21
```

Server configuration-string index for level start time; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L27)

<a id="constant-constant-mq3-client-cgame-main-cs-models-const-cs-models-32-src-mq3-client-cgame-main-ml-492798810"></a>
### CS_MODELS

```ml
const CS_MODELS = 32
```

Server configuration-string index for models; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L31)

<a id="constant-constant-mq3-client-cgame-main-cs-music-const-cs-music-2-src-mq3-client-cgame-main-ml-45113753"></a>
### CS_MUSIC

```ml
const CS_MUSIC = 2
```

Server configuration-string index for music; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L23)

<a id="constant-constant-mq3-client-cgame-main-cs-players-const-cs-players-544-src-mq3-client-cgame-main-ml-2010956152"></a>
### CS_PLAYERS

```ml
const CS_PLAYERS = 544
```

Server configuration-string index for players; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L35)

<a id="constant-constant-mq3-client-cgame-main-cs-sounds-const-cs-sounds-288-src-mq3-client-cgame-main-ml-1213014155"></a>
### CS_SOUNDS

```ml
const CS_SOUNDS = 288
```

Server configuration-string index for sounds; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L33)

- [mq3.client.cgame_main.Cvar](Type-mq3-client-cgame-main-cvar-2054669032.md) — struct
<a id="function-function-mq3-client-cgame-main-cvarget-function-cvarget-state-name-src-mq3-client-cgame-main-ml-1253818526"></a>
### cvarGet

```ml
function cvarGet(state, name)
```

CG_Cvar_Get

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game main state passed to the helper calls in `cvarGet`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding client game main resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L578)

<a id="function-function-mq3-client-cgame-main-cvarspec-function-cvarspec-name-defaultvalue-flags-src-mq3-client-cgame-main-ml-1290860860"></a>
### cvarSpec

```ml
function cvarSpec(name, defaultValue, flags)
```

Creates a `mq3.client.cgame_main.Cvar` record. Assigns `name` from `name`, `defaultValue` from `defaultValue`, `flags` from `flags`, `value` from `defaultValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value used to initialize `Cvar.name`. |
| `defaultValue` | `dynamic` | — | Value used to initialize `Cvar.defaultValue`, `Cvar.value`, `Cvar.integer`. |
| `flags` | `dynamic` | — | Value used to initialize `Cvar.flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L367)

<a id="function-function-mq3-client-cgame-main-cvarspecs-function-cvarspecs-src-mq3-client-cgame-main-ml-1276739776"></a>
### cvarSpecs

```ml
function cvarSpecs()
```

Calls `mq3.client.cgame_main.cvarSpec` from client game main `cvarSpecs`. The final path returns `effect`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L369)

<a id="function-function-mq3-client-cgame-main-drawcinematic-function-drawcinematic-handle-x-y-w-h-retailactive-src-mq3-client-cgame-main-ml-1024254357"></a>
### drawCinematic

```ml
function drawCinematic(handle, x, y, w, h, retailActive)
```

CG_DrawCinematic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `drawCinematic`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawCinematic`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawCinematic`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `drawCinematic`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `drawCinematic`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L616)

<a id="function-function-mq3-client-cgame-main-emit-function-emit-effect-boundary-kind-name-value-value2-number-flags-retailactive-src-mq3-client-cgame-main-ml-1622616355"></a>
### emit

```ml
function emit(effect, boundary, kind, name, value, value2, number, flags, retailActive)
```

Appends a client game main action record to the queued engine requests.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effect` | `dynamic` | — | Mutable client game main record/storage; this routine assigns `effect.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding client game main resource. |
| `value` | `dynamic` | — | Value used by `effect.actions=effect.actions+[action(boundary,kind,name,value,value2,number,flags,retailActive)]`. |
| `value2` | `dynamic` | — | Value used by `effect.actions=effect.actions+[action(boundary,kind,name,value,value2,number,flags,retailActive)]`. |
| `number` | `dynamic` | — | Value used by `effect.actions=effect.actions+[action(boundary,kind,name,value,value2,number,flags,retailActive)]`. |
| `flags` | `dynamic` | — | Value used by `effect.actions=effect.actions+[action(boundary,kind,name,value,value2,number,flags,retailActive)]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L338)

<a id="function-function-mq3-client-cgame-main-errormessage-function-errormessage-text-retailactive-src-mq3-client-cgame-main-ml-524479786"></a>
### errorMessage

```ml
function errorMessage(text, retailActive)
```

CG_Error Com_Error

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `errorMessage` in the client game main path. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L353)

<a id="function-function-mq3-client-cgame-main-eventhandling-function-eventhandling-state-type-src-mq3-client-cgame-main-ml-246418343"></a>
### eventHandling

```ml
function eventHandling(state, type)
```

CG_EventHandling

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game main record/storage; this routine assigns `state.eventType`. |
| `type` | `dynamic` | — | Value assigned to `state.eventType`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L656)

<a id="constant-constant-mq3-client-cgame-main-feeder-blueteam-list-const-feeder-blueteam-list-2-src-mq3-client-cgame-main-ml-1390524421"></a>
### FEEDER_BLUETEAM_LIST

```ml
const FEEDER_BLUETEAM_LIST = 2
```

Menu data-feeder identifier supplying the blueteam list list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L73)

<a id="constant-constant-mq3-client-cgame-main-feeder-redteam-list-const-feeder-redteam-list-1-src-mq3-client-cgame-main-ml-1364158196"></a>
### FEEDER_REDTEAM_LIST

```ml
const FEEDER_REDTEAM_LIST = 1
```

Menu data-feeder identifier supplying the redteam list list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L71)

<a id="constant-constant-mq3-client-cgame-main-feeder-scoreboard-const-feeder-scoreboard-3-src-mq3-client-cgame-main-ml-343809326"></a>
### FEEDER_SCOREBOARD

```ml
const FEEDER_SCOREBOARD = 3
```

Menu data-feeder identifier supplying the scoreboard list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L75)

<a id="function-function-mq3-client-cgame-main-feedercount-function-feedercount-state-feederid-src-mq3-client-cgame-main-ml-656299343"></a>
### feederCount

```ml
function feederCount(state, feederID)
```

CG_FeederCount

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.numScores`, `state.scores`. |
| `feederID` | `dynamic` | — | Value used by `if feederID==FEEDER_SCOREBOARD then return state.numScores end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L538)

<a id="function-function-mq3-client-cgame-main-feederitemimage-function-feederitemimage-feederid-index-src-mq3-client-cgame-main-ml-529662924"></a>
### feederItemImage

```ml
function feederItemImage(feederID, index)
```

CG_FeederItemImage

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `feederID` | `dynamic` | — | Accepted for compatibility with `feederItemImage`; the current implementation does not read it. |
| `index` | `dynamic` | — | Accepted for compatibility with `feederItemImage`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L569)

<a id="function-function-mq3-client-cgame-main-feederitemtext-function-feederitemtext-state-feederid-index-column-readymask-src-mq3-client-cgame-main-ml-605719670"></a>
### feederItemText

```ml
function feederItemText(state, feederID, index, column, readyMask)
```

CG_FeederItemText

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.scores`, `state.clients`, `state.gametype`. |
| `feederID` | `dynamic` | — | Value used by `if feederID==FEEDER_REDTEAM_LIST then team=TEAM_RED else if feederID==FEEDER_BLUETEAM_LIST then team=TEAM_BLUE end if`. |
| `index` | `dynamic` | — | Value used by `scoreIndex=infoFromScoreIndex(state,index,team)`. |
| `column` | `dynamic` | — | Value used by `if column==0 then if ci.botSkill>0 and ci.botSkill<=5 then return ["",ci.botSkill] end if`. |
| `readyMask` | `dynamic` | — | Value used by `else if column==2 then if (readyMask & (1<<sp.client))!=0 then return ["Ready",-1] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L559)

<a id="function-function-mq3-client-cgame-main-feederselection-function-feederselection-state-feederid-index-src-mq3-client-cgame-main-ml-27938387"></a>
### feederSelection

```ml
function feederSelection(state, feederID, index)
```

CG_FeederSelection

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game main record/storage; this routine assigns `state.selectedScore`. |
| `feederID` | `dynamic` | — | Value used by `if feederID==FEEDER_BLUETEAM_LIST then team=TEAM_BLUE end if`. |
| `index` | `dynamic` | — | Value assigned to `state.selectedScore`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L574)

<a id="function-function-mq3-client-cgame-main-findcvar-function-findcvar-state-name-src-mq3-client-cgame-main-ml-1958167258"></a>
### findCvar

```ml
function findCvar(state, name)
```

Searches the client game main collection for find cvar, returning `void` when no entry matches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.cvars`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding client game main resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L379)

<a id="function-function-mq3-client-cgame-main-forcemodelchange-function-forcemodelchange-state-retailactive-src-mq3-client-cgame-main-ml-1283477564"></a>
### forceModelChange

```ml
function forceModelChange(state, retailActive)
```

CG_ForceModelChange

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game main state passed to the helper calls in `forceModelChange`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L394)

<a id="function-function-mq3-client-cgame-main-getmenubuffer-function-getmenubuffer-filename-text-maxsize-src-mq3-client-cgame-main-ml-283392439"></a>
### getMenuBuffer

```ml
function getMenuBuffer(filename, text, maxSize)
```

CG_GetMenuBuffer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filename` | `dynamic` | — | File name passed to the corresponding file/asset operation. |
| `text` | `dynamic` | — | Text whose length/content is inspected by `getMenuBuffer`. |
| `maxSize` | `dynamic` | — | Value used by `if len(text)>=maxSize then return error(7843,"menu file too large: "+filename) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L482)

<a id="constant-constant-mq3-client-cgame-main-gt-team-const-gt-team-3-src-mq3-client-cgame-main-ml-636292634"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```

Native game-type value for team deathmatch, used when selecting mode-specific CGame media and initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L49)

<a id="constant-constant-mq3-client-cgame-main-gt-tournament-const-gt-tournament-1-src-mq3-client-cgame-main-ml-1967860844"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```

Native game-type value for one-on-one tournament play, used when selecting mode-specific CGame media and initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L46)

<a id="function-function-mq3-client-cgame-main-hudassets-function-hudassets-src-mq3-client-cgame-main-ml-2125143748"></a>
### hudAssets

```ml
function hudAssets()
```

Creates a `mq3.client.cgame_main.HudAssets` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L308)

- [mq3.client.cgame_main.HudAssets](Type-mq3-client-cgame-main-hudassets-665283646.md) — struct
<a id="function-function-mq3-client-cgame-main-infofromscoreindex-function-infofromscoreindex-state-index-team-src-mq3-client-cgame-main-ml-635857230"></a>
### infoFromScoreIndex

```ml
function infoFromScoreIndex(state, index, team)
```

CG_InfoFromScoreIndex

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.gametype`, `state.scores`. |
| `index` | `dynamic` | — | Value tested by `count==index` before the calculation continues. |
| `team` | `dynamic` | — | Value used by `for i=0 to len(state.scores)-1 if state.scores[i].team==team then if count==index then return i end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L552)

<a id="function-function-mq3-client-cgame-main-init-function-init-state-servermessagenum-servercommandsequence-clientnum-gameversion-vidwidth-vidheight-items-retailactive-src-mq3-client-cgame-main-ml-1405693357"></a>
### init

```ml
function init(state, serverMessageNum, serverCommandSequence, clientNum, gameVersion, vidWidth, vidHeight, items, retailActive)
```

CG_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game main record/storage; this routine assigns `state.initialized`, `state.loading`, `state.clientNum`, `state.processedSnapshotNum` and additional values. |
| `serverMessageNum` | `dynamic` | — | Value assigned to `state.processedSnapshotNum`. |
| `serverCommandSequence` | `dynamic` | — | Value assigned to `state.serverCommandSequence`. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |
| `gameVersion` | `dynamic` | — | Value used by `if gameVersion!=state.gameVersion then return error(7844,"Client/Server game mismatch: "+state.gameVersion+"/"+gameVersion) end if`. |
| `vidWidth` | `dynamic` | — | Value assigned to `state.screenXScale`. |
| `vidHeight` | `dynamic` | — | Value assigned to `state.screenYScale`. |
| `items` | `dynamic` | — | Value used by `merge(effect,registerSounds(state,items,retailActive))`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L642)

- [mq3.client.cgame_main.Item](Type-mq3-client-cgame-main-item-495663849.md) — struct
<a id="function-function-mq3-client-cgame-main-keyevent-function-keyevent-state-key-down-src-mq3-client-cgame-main-ml-2005306932"></a>
### keyEvent

```ml
function keyEvent(state, key, down)
```

CG_KeyEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Accepted for compatibility with `keyEvent`; the current implementation does not read it. |
| `key` | `dynamic` | — | Accepted for compatibility with `keyEvent`; the current implementation does not read it. |
| `down` | `dynamic` | — | Accepted for compatibility with `keyEvent`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L661)

<a id="function-function-mq3-client-cgame-main-lastattacker-function-lastattacker-state-src-mq3-client-cgame-main-ml-589473373"></a>
### lastAttacker

```ml
function lastAttacker(state)
```

CG_LastAttacker

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.attackerTime`, `state.attackerNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L412)

<a id="function-function-mq3-client-cgame-main-loadhudmenu-function-loadhudmenu-state-hudtext-menufiles-retailactive-src-mq3-client-cgame-main-ml-1866665680"></a>
### loadHudMenu

```ml
function loadHudMenu(state, hudText, menuFiles, retailActive)
```

CG_LoadHudMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game main record/storage; this routine assigns `state.hudFile`. |
| `hudText` | `dynamic` | — | Value used by `merge(effect,loadMenus(state,state.hudFile,hudText,menuFiles,retailActive))`. |
| `menuFiles` | `dynamic` | — | Value used by `merge(effect,loadMenus(state,state.hudFile,hudText,menuFiles,retailActive))`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L626)

<a id="function-function-mq3-client-cgame-main-loadmenu-function-loadmenu-state-tokens-start-files-retailactive-src-mq3-client-cgame-main-ml-821619769"></a>
### loadMenu

```ml
function loadMenu(state, tokens, start, files, retailActive)
```

CG_Load_Menu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game main state passed to the helper calls in `loadMenu`. |
| `tokens` | `dynamic` | — | Sequence read at `tokens[start]`, `tokens[at]`. |
| `start` | `dynamic` | — | Value tested by `start>=len(tokens) or tokens[start]!="{"` before the calculation continues. |
| `files` | `dynamic` | — | Value used by `for each file in files if file[0]==name then text=file[1] end if end for`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L517)

<a id="function-function-mq3-client-cgame-main-loadmenus-function-loadmenus-state-menufile-text-files-retailactive-src-mq3-client-cgame-main-ml-1030752987"></a>
### loadMenus

```ml
function loadMenus(state, menuFile, text, files, retailActive)
```

CG_LoadMenus

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game main state passed to the helper calls in `loadMenus`. |
| `menuFile` | `dynamic` | — | Accepted for compatibility with `loadMenus`; the current implementation does not read it. |
| `text` | `dynamic` | — | Text consumed or emitted by `loadMenus` in the client game main path. |
| `files` | `dynamic` | — | Value used by `if key=="loadmenu" then nested=loadMenu(state,tokens,at,files,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L526)

<a id="constant-constant-mq3-client-cgame-main-max-clients-const-max-clients-64-src-mq3-client-cgame-main-ml-911047387"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```

Capacity limit for the clients collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L19)

<a id="constant-constant-mq3-client-cgame-main-max-configstrings-const-max-configstrings-1024-src-mq3-client-cgame-main-ml-1222498808"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```

Capacity limit for the configstrings collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L21)

<a id="function-function-mq3-client-cgame-main-menutokens-function-menutokens-text-src-mq3-client-cgame-main-ml-480236411"></a>
### menuTokens

```ml
function menuTokens(text)
```

Calls `decode`, `slice` from client game main `menuTokens`. The final path returns `effect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `menuTokens` in the client game main path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L475)

<a id="function-function-mq3-client-cgame-main-merge-function-merge-effect-other-src-mq3-client-cgame-main-ml-1281251817"></a>
### merge

```ml
function merge(effect, other)
```

Updates `effect.actions` during client game main `merge`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effect` | `dynamic` | — | Mutable client game main record/storage; this routine assigns `effect.actions`. |
| `other` | `dynamic` | — | Record read through `other.actions`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L342)

<a id="function-function-mq3-client-cgame-main-mouseevent-function-mouseevent-state-x-y-src-mq3-client-cgame-main-ml-1611407826"></a>
### mouseEvent

```ml
function mouseEvent(state, x, y)
```

CG_MouseEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game main record/storage; this routine assigns `state.cursorX`, `state.cursorY`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `mouseEvent`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `mouseEvent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L666)

<a id="function-function-mq3-client-cgame-main-ownerdrawhandlekey-function-ownerdrawhandlekey-ownerdraw-flags-special-key-src-mq3-client-cgame-main-ml-725193166"></a>
### ownerDrawHandleKey

```ml
function ownerDrawHandleKey(ownerDraw, flags, special, key)
```

CG_OwnerDrawHandleKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ownerDraw` | `dynamic` | — | Accepted for compatibility with `ownerDrawHandleKey`; the current implementation does not read it. |
| `flags` | `dynamic` | — | Accepted for compatibility with `ownerDrawHandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `ownerDrawHandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Accepted for compatibility with `ownerDrawHandleKey`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L534)

<a id="function-function-mq3-client-cgame-main-ownerdrawwidth-function-ownerdrawwidth-ownerdraw-scale-gametypetext-statustext-killertext-redname-bluename-src-mq3-client-cgame-main-ml-211884012"></a>
### ownerDrawWidth

```ml
function ownerDrawWidth(ownerDraw, scale, gameTypeText, statusText, killerText, redName, blueName)
```

CG_OwnerDrawWidth

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ownerDraw` | `dynamic` | — | Value used by `if ownerDraw==1 then text=gameTypeText else if ownerDraw==2 then text=statusText else if ownerDraw==3 then text=killerText else if ownerDraw==...`. |
| `scale` | `dynamic` | — | Value used by `return numeric.trunc32(len(text)*8*scale)`. |
| `gameTypeText` | `dynamic` | — | Value used by `if ownerDraw==1 then text=gameTypeText else if ownerDraw==2 then text=statusText else if ownerDraw==3 then text=killerText else if ownerDraw==...`. |
| `statusText` | `dynamic` | — | Value used by `if ownerDraw==1 then text=gameTypeText else if ownerDraw==2 then text=statusText else if ownerDraw==3 then text=killerText else if ownerDraw==...`. |
| `killerText` | `dynamic` | — | Value used by `if ownerDraw==1 then text=gameTypeText else if ownerDraw==2 then text=statusText else if ownerDraw==3 then text=killerText else if ownerDraw==...`. |
| `redName` | `dynamic` | — | Value used by `if ownerDraw==1 then text=gameTypeText else if ownerDraw==2 then text=statusText else if ownerDraw==3 then text=killerText else if ownerDraw==...`. |
| `blueName` | `dynamic` | — | Value used by `if ownerDraw==1 then text=gameTypeText else if ownerDraw==2 then text=statusText else if ownerDraw==3 then text=killerText else if ownerDraw==...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L595)

<a id="function-function-mq3-client-cgame-main-parsemenu-function-parsemenu-state-menufile-text-retailactive-src-mq3-client-cgame-main-ml-724865082"></a>
### parseMenu

```ml
function parseMenu(state, menuFile, text, retailActive)
```

CG_ParseMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game main record/storage; this routine assigns `state.menuFiles`. |
| `menuFile` | `dynamic` | — | Value used by `at=nested.value else if key=="menudef" then emit(effect,"ui","new-menu",menuFile,"","",at,0,retailActive)`. |
| `text` | `dynamic` | — | Text consumed or emitted by `parseMenu` in the client game main path. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L508)

<a id="function-function-mq3-client-cgame-main-playcinematic-function-playcinematic-state-name-x-y-w-h-retailactive-src-mq3-client-cgame-main-ml-1362624281"></a>
### playCinematic

```ml
function playCinematic(state, name, x, y, w, h, retailActive)
```

CG_PlayCinematic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game main record/storage; this routine assigns `state.nextCinematicHandle`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding client game main resource. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `playCinematic`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `playCinematic`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `playCinematic`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `playCinematic`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L604)

<a id="function-function-mq3-client-cgame-main-printmessage-function-printmessage-text-retailactive-src-mq3-client-cgame-main-ml-983892018"></a>
### printMessage

```ml
function printMessage(text, retailActive)
```

CG_Printf Com_Printf

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `printMessage` in the client game main path. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L348)

<a id="function-function-mq3-client-cgame-main-registerclients-function-registerclients-state-retailactive-src-mq3-client-cgame-main-ml-580628154"></a>
### registerClients

```ml
function registerClients(state, retailActive)
```

CG_RegisterClients

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.clientNum`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L464)

<a id="function-function-mq3-client-cgame-main-registercvars-function-registercvars-state-svrunning-retailactive-src-mq3-client-cgame-main-ml-641210418"></a>
### registerCvars

```ml
function registerCvars(state, svRunning, retailActive)
```

CG_RegisterCvars

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game main record/storage; this routine assigns `state.cvars`, `state.forceModelModificationCount`. |
| `svRunning` | `dynamic` | — | Value used by `emit(effect,"state","local-server","",svRunning,"",atoi(svRunning),0,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L385)

<a id="function-function-mq3-client-cgame-main-registergraphics-function-registergraphics-state-items-retailactive-src-mq3-client-cgame-main-ml-196895570"></a>
### registerGraphics

```ml
function registerGraphics(state, items, retailActive)
```

CG_RegisterGraphics

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.mapname`. |
| `items` | `dynamic` | — | Sequence read at `items[i]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L447)

<a id="function-function-mq3-client-cgame-main-registeritemsounds-function-registeritemsounds-item-itemnum-retailactive-src-mq3-client-cgame-main-ml-1506902349"></a>
### registerItemSounds

```ml
function registerItemSounds(item, itemNum, retailActive)
```

CG_RegisterItemSounds

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `item` | `dynamic` | — | Record read through `item.pickupSound`, `item.sounds`, `item.classname`. |
| `itemNum` | `dynamic` | — | Value used by `if item.pickupSound!="" then emit(effect,"audio","register-sound",item.pickupSound,"","",itemNum,0,retailActive) end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L425)

<a id="function-function-mq3-client-cgame-main-registersounds-function-registersounds-state-items-retailactive-src-mq3-client-cgame-main-ml-151687218"></a>
### registerSounds

```ml
function registerSounds(state, items, retailActive)
```

CG_RegisterSounds

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game main state passed to the helper calls in `registerSounds`. |
| `items` | `dynamic` | — | Sequence read at `items[i]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L435)

<a id="function-function-mq3-client-cgame-main-result-function-result-handled-value-src-mq3-client-cgame-main-ml-1906671231"></a>
### result

```ml
function result(handled, value)
```

Creates a `mq3.client.cgame_main.Result` record. Assigns `handled` from `handled`, `value` from `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handled` | `dynamic` | — | Value used to initialize `Result.handled`. |
| `value` | `dynamic` | — | Value used to initialize `Result.value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L327)

- [mq3.client.cgame_main.Result](Type-mq3-client-cgame-main-result-1141204139.md) — struct
<a id="function-function-mq3-client-cgame-main-runcinematicframe-function-runcinematicframe-handle-retailactive-src-mq3-client-cgame-main-ml-611886313"></a>
### runCinematicFrame

```ml
function runCinematicFrame(handle, retailActive)
```

CG_RunCinematicFrame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `runCinematicFrame`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L620)

- [mq3.client.cgame_main.Score](Type-mq3-client-cgame-main-score-1695914296.md) — struct
<a id="function-function-mq3-client-cgame-main-setscoreselection-function-setscoreselection-state-clientnum-hasmenu-retailactive-src-mq3-client-cgame-main-ml-903755616"></a>
### setScoreSelection

```ml
function setScoreSelection(state, clientNum, hasMenu, retailActive)
```

CG_SetScoreSelection

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game main record/storage; this routine assigns `state.selectedScore`. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |
| `hasMenu` | `dynamic` | — | Value used by `if hasMenu and len(state.scores)>0 then feeder=FEEDER_SCOREBOARD`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L544)

<a id="function-function-mq3-client-cgame-main-shutdown-function-shutdown-state-retailactive-src-mq3-client-cgame-main-ml-1302453760"></a>
### shutdown

```ml
function shutdown(state, retailActive)
```

CG_Shutdown

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game main record/storage; this routine assigns `state.initialized`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L652)

<a id="function-function-mq3-client-cgame-main-splitwords-function-splitwords-text-src-mq3-client-cgame-main-ml-1188929167"></a>
### splitWords

```ml
function splitWords(text)
```

Calls `decode`, `slice` from client game main `splitWords`. The final path returns `effect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `splitWords` in the client game main path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L416)

<a id="function-function-mq3-client-cgame-main-startmusic-function-startmusic-state-retailactive-src-mq3-client-cgame-main-ml-1950110256"></a>
### startMusic

```ml
function startMusic(state, retailActive)
```

CG_StartMusic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game main state passed to the helper calls in `startMusic`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L471)

- [mq3.client.cgame_main.State](Type-mq3-client-cgame-main-state-1163369719.md) — struct
<a id="function-function-mq3-client-cgame-main-stopcinematic-function-stopcinematic-handle-retailactive-src-mq3-client-cgame-main-ml-1339318873"></a>
### stopCinematic

```ml
function stopCinematic(handle, retailActive)
```

CG_StopCinematic

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `stopCinematic`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L608)

<a id="function-function-mq3-client-cgame-main-suffix-function-suffix-text-want-src-mq3-client-cgame-main-ml-1669933353"></a>
### suffix

```ml
function suffix(text, want)
```

Calls `std.string.equalsIgnoreCaseAscii`, `std.string.substr` from client game main `suffix`. The final path returns `strings.equalsIgnoreCaseAscii(strings.substr(text,len(text)-len(want),len(want)),want)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text whose length/content is inspected by `suffix`. |
| `want` | `dynamic` | — | Sequence whose length/content is inspected by `suffix`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L420)

<a id="constant-constant-mq3-client-cgame-main-team-blue-const-team-blue-2-src-mq3-client-cgame-main-ml-251438523"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```

Native team identifier for blue, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L41)

<a id="constant-constant-mq3-client-cgame-main-team-free-const-team-free-0-src-mq3-client-cgame-main-ml-432045649"></a>
### TEAM_FREE

```ml
const TEAM_FREE = 0
```

Native team identifier for free, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L37)

<a id="constant-constant-mq3-client-cgame-main-team-red-const-team-red-1-src-mq3-client-cgame-main-ml-39380068"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```

Native team identifier for red, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L39)

<a id="constant-constant-mq3-client-cgame-main-team-spectator-const-team-spectator-3-src-mq3-client-cgame-main-ml-978078842"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```

Native team identifier for spectator, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L43)

<a id="function-function-mq3-client-cgame-main-textpaintwithcursor-function-textpaintwithcursor-text-cursorpos-cursor-limit-style-retailactive-src-mq3-client-cgame-main-ml-1426501384"></a>
### textPaintWithCursor

```ml
function textPaintWithCursor(text, cursorPos, cursor, limit, style, retailActive)
```

CG_Text_PaintWithCursor

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `textPaintWithCursor` in the client game main path. |
| `cursorPos` | `dynamic` | — | Value used by `emit(effect,"ui","paint-text",text,str(cursor),"",cursorPos,style,retailActive)`. |
| `cursor` | `dynamic` | — | Value used by `emit(effect,"ui","paint-text",text,str(cursor),"",cursorPos,style,retailActive)`. |
| `limit` | `dynamic` | — | Accepted for compatibility with `textPaintWithCursor`; the current implementation does not read it. |
| `style` | `dynamic` | — | Value used by `emit(effect,"ui","paint-text",text,str(cursor),"",cursorPos,style,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L586)

<a id="function-function-mq3-client-cgame-main-updatecvars-function-updatecvars-state-updates-retailactive-src-mq3-client-cgame-main-ml-1809592228"></a>
### updateCvars

```ml
function updateCvars(state, updates, retailActive)
```

CG_UpdateCvars

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game main record/storage; this routine assigns `state.drawTeamOverlayModificationCount`, `state.forceModelModificationCount`. |
| `updates` | `dynamic` | — | Value used by `for each update in updates cv=findCvar(state,update[0])`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L401)

<a id="function-function-mq3-client-cgame-main-vmmain-function-vmmain-state-command-args-items-gameversion-vidwidth-vidheight-retailactive-src-mq3-client-cgame-main-ml-877184929"></a>
### vmMain

```ml
function vmMain(state, command, args, items, gameVersion, vidWidth, vidHeight, retailActive)
```

vmMain

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game main state passed to the helper calls in `vmMain`. |
| `command` | `dynamic` | — | Value used by `if command==CG_INIT then return init(state,args[0],args[1],args[2],gameVersion,vidWidth,vidHeight,items,retailActive) end if`. |
| `args` | `dynamic` | — | Sequence read at `args[0]`, `args[1]`, `args[2]`. |
| `items` | `dynamic` | — | Value used by `if command==CG_INIT then return init(state,args[0],args[1],args[2],gameVersion,vidWidth,vidHeight,items,retailActive) end if`. |
| `gameVersion` | `dynamic` | — | Value used by `if command==CG_INIT then return init(state,args[0],args[1],args[2],gameVersion,vidWidth,vidHeight,items,retailActive) end if`. |
| `vidWidth` | `dynamic` | — | Value used by `if command==CG_INIT then return init(state,args[0],args[1],args[2],gameVersion,vidWidth,vidHeight,items,retailActive) end if`. |
| `vidHeight` | `dynamic` | — | Value used by `if command==CG_INIT then return init(state,args[0],args[1],args[2],gameVersion,vidWidth,vidHeight,items,retailActive) end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L676)

<a id="constant-constant-mq3-client-cgame-main-wp-machinegun-const-wp-machinegun-2-src-mq3-client-cgame-main-ml-563110343"></a>
### WP_MACHINEGUN

```ml
const WP_MACHINEGUN = 2
```

Native weapon identifier selecting the machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_main.ml#L51)
