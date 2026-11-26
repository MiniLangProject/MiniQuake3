# `src/mq3/client/cgame_info.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_info`](Package-mq3-client-cgame-info-194763525.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/command_buffer.ml` as `commandBuffer` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="extern_function-extern-function-mq3-client-cgame-info-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-client-cgame-info-ml-1773733638"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

Converts a NUL-terminated decimal C string to a signed 32-bit integer using the Windows C runtime. This binding is used by client game info.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — | NUL-terminated C string containing the decimal numeric text. |


**Returns:** The converted integer; a string with no initial numeric conversion yields zero.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L11)

<a id="function-function-mq3-client-cgame-info-baseitemicons-function-baseitemicons-src-mq3-client-cgame-info-ml-104683526"></a>
### baseItemIcons

```ml
function baseItemIcons()
```

Baseq3 bg_itemlist order is the bit order of CS_ITEMS.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L119)

<a id="function-function-mq3-client-cgame-info-clean-function-clean-text-src-mq3-client-cgame-info-ml-1408830407"></a>
### clean

```ml
function clean(text)
```

Calls `decode` from client game info `clean`. The final path returns `decode(bytes(result))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `clean` in the client game info path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L75)

<a id="function-function-mq3-client-cgame-info-create-function-create-src-mq3-client-cgame-info-ml-455228258"></a>
### create

```ml
function create()
```

Creates a `mq3.client.cgame_info.State` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L72)

- [mq3.client.cgame_info.Draw](Type-mq3-client-cgame-info-draw-298961247.md) — struct
<a id="function-function-mq3-client-cgame-info-drawinformation-function-drawinformation-state-serverinfo-systeminfo-motd-message-gametype-svrunning-availableassets-src-mq3-client-cgame-info-ml-301713500"></a>
### drawInformation

```ml
function drawInformation(state, serverInfo, systemInfo, motd, message, gametype, svRunning, availableAssets)
```

CG_DrawInformation

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game info state passed to the helper calls in `drawInformation`. |
| `serverInfo` | `dynamic` | — | Value used by `levelshot="levelshots/"+info.value(serverInfo,"mapname")+".tga"`. |
| `systemInfo` | `dynamic` | — | Value used by `return drawInformationWithShot(state,serverInfo,systemInfo,motd,message,gametype,svRunning,levelshot)`. |
| `motd` | `dynamic` | — | Value used by `return drawInformationWithShot(state,serverInfo,systemInfo,motd,message,gametype,svRunning,levelshot)`. |
| `message` | `dynamic` | — | Value used by `return drawInformationWithShot(state,serverInfo,systemInfo,motd,message,gametype,svRunning,levelshot)`. |
| `gametype` | `dynamic` | — | Quake III game-type identifier. |
| `svRunning` | `dynamic` | — | Value used by `return drawInformationWithShot(state,serverInfo,systemInfo,motd,message,gametype,svRunning,levelshot)`. |
| `availableAssets` | `dynamic` | — | Asset names/resources available for model or menu selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L155)

<a id="function-function-mq3-client-cgame-info-drawinformationwithshot-function-drawinformationwithshot-state-serverinfo-systeminfo-motd-message-gametype-svrunning-levelshot-src-mq3-client-cgame-info-ml-1449181912"></a>
### drawInformationWithShot

```ml
function drawInformationWithShot(state, serverInfo, systemInfo, motd, message, gametype, svRunning, levelshot)
```

Calls `mq3.client.cgame_info.Information`, `mq3.client.cgame_info.Draw`, `mq3.client.cgame_info.drawLoadingIcons` and additional helpers from client game info `drawInformationWithShot`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.infoScreenText`. |
| `serverInfo` | `dynamic` | — | Value used by `if not svRunning then host=clean(commandBuffer.copyString(info.value(serverInfo,"sv_hostname"),1024))`. |
| `systemInfo` | `dynamic` | — | Value used by `if info.value(systemInfo,"sv_pure")!="" and bytes(info.value(systemInfo,"sv_pure"))[0]==49 then y=line(result,y,"Pure Server") end if`. |
| `motd` | `dynamic` | — | Value used by `if motd!="" then y=line(result,y,motd) end if`. |
| `message` | `dynamic` | — | Value used by `if message!="" then y=line(result,y,message) end if`. |
| `gametype` | `dynamic` | — | Quake III game-type identifier. |
| `svRunning` | `dynamic` | — | Value used by `if not svRunning then host=clean(commandBuffer.copyString(info.value(serverInfo,"sv_hostname"),1024))`. |
| `levelshot` | `dynamic` | — | Value used by `result.requestedShaders=[levelshot,"levelShotDetail"]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L169)

<a id="function-function-mq3-client-cgame-info-drawloadingicons-function-drawloadingicons-state-src-mq3-client-cgame-info-ml-757835433"></a>
### drawLoadingIcons

```ml
function drawLoadingIcons(state)
```

CG_DrawLoadingIcons

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.playerIcons`, `state.itemIcons`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L132)

<a id="function-function-mq3-client-cgame-info-gametypename-function-gametypename-gametype-src-mq3-client-cgame-info-ml-524560352"></a>
### gametypeName

```ml
function gametypeName(gametype)
```

Evaluates client game info `gametypeName` and returns `"Free For All"`, `"Single Player"`, `"Tournament"` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gametype` | `dynamic` | — | Quake III game-type identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L138)

<a id="constant-constant-mq3-client-cgame-info-gt-ctf-const-gt-ctf-4-src-mq3-client-cgame-info-ml-300612385"></a>
### GT_CTF

```ml
const GT_CTF = 4
```

Native game-type value for capture the flag, used when composing the loading screen's game-mode and rules text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L30)

<a id="constant-constant-mq3-client-cgame-info-gt-ffa-const-gt-ffa-0-src-mq3-client-cgame-info-ml-1798032509"></a>
### GT_FFA

```ml
const GT_FFA = 0
```

Native game-type identifier selecting free-for-all deathmatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L18)

<a id="constant-constant-mq3-client-cgame-info-gt-single-player-const-gt-single-player-2-src-mq3-client-cgame-info-ml-594657053"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```

Native game-type value for single-player arena progression, used when composing the loading screen's game-mode and rules text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L24)

<a id="constant-constant-mq3-client-cgame-info-gt-team-const-gt-team-3-src-mq3-client-cgame-info-ml-1338752738"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```

Native game-type value for team deathmatch, used when composing the loading screen's game-mode and rules text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L27)

<a id="constant-constant-mq3-client-cgame-info-gt-tournament-const-gt-tournament-1-src-mq3-client-cgame-info-ml-443562016"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```

Native game-type value for one-on-one tournament play, used when composing the loading screen's game-mode and rules text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L21)

- [mq3.client.cgame_info.Information](Type-mq3-client-cgame-info-information-431493297.md) — struct
<a id="function-function-mq3-client-cgame-info-line-function-line-result-y-text-src-mq3-client-cgame-info-ml-1868194463"></a>
### line

```ml
function line(result, y, text)
```

Updates `result.commands` during client game info `line`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Mutable client game info record/storage; this routine assigns `result.commands`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `line`. |
| `text` | `dynamic` | — | Text consumed or emitted by `line` in the client game info path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L145)

<a id="function-function-mq3-client-cgame-info-loadingclient-function-loadingclient-state-playerinfo-gametype-availableassets-src-mq3-client-cgame-info-ml-2147050968"></a>
### loadingClient

```ml
function loadingClient(state, playerInfo, gametype, availableAssets)
```

Updates `state.playerIcons`, `state.registeredShaders`, `state.registeredSounds` during client game info `loadingClient`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game info record/storage; this routine assigns `state.playerIcons`, `state.registeredShaders`, `state.registeredSounds`. |
| `playerInfo` | `dynamic` | — | Value used by `candidates=playerIconCandidates(playerInfo)`. |
| `gametype` | `dynamic` | — | Quake III game-type identifier. |
| `availableAssets` | `dynamic` | — | Asset names/resources available for model or menu selection. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L113)

<a id="function-function-mq3-client-cgame-info-loadingitem-function-loadingitem-state-icon-pickupname-handle-src-mq3-client-cgame-info-ml-914388139"></a>
### loadingItem

```ml
function loadingItem(state, icon, pickupName, handle)
```

Updates `state.itemIcons`, `state.registeredShaders` during client game info `loadingItem`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game info record/storage; this routine assigns `state.itemIcons`, `state.registeredShaders`. |
| `icon` | `dynamic` | — | Value used by `if icon!="" and len(state.itemIcons)<MAX_LOADING_ITEM_ICONS then state.itemIcons=state.itemIcons+[handle]`. |
| `pickupName` | `dynamic` | — | Value used by `loadingString(state,pickupName)`. |
| `handle` | `dynamic` | — | Handle identifying the parser, file, media or control resource consumed by `loadingItem`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L94)

<a id="function-function-mq3-client-cgame-info-loadingstring-function-loadingstring-state-text-src-mq3-client-cgame-info-ml-1505844736"></a>
### loadingString

```ml
function loadingString(state, text)
```

Updates `state.infoScreenText`, `state.updates` during client game info `loadingString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game info record/storage; this routine assigns `state.infoScreenText`, `state.updates`. |
| `text` | `dynamic` | — | Text consumed or emitted by `loadingString` in the client game info path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L88)

<a id="constant-constant-mq3-client-cgame-info-max-loading-item-icons-const-max-loading-item-icons-26-src-mq3-client-cgame-info-ml-1419542253"></a>
### MAX_LOADING_ITEM_ICONS

```ml
const MAX_LOADING_ITEM_ICONS = 26
```

Capacity limit for the loading item icons collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L16)

<a id="constant-constant-mq3-client-cgame-info-max-loading-player-icons-const-max-loading-player-icons-16-src-mq3-client-cgame-info-ml-712601108"></a>
### MAX_LOADING_PLAYER_ICONS

```ml
const MAX_LOADING_PLAYER_ICONS = 16
```

Capacity limit for the loading player icons collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L14)

<a id="function-function-mq3-client-cgame-info-playericoncandidates-function-playericoncandidates-playerinfo-src-mq3-client-cgame-info-ml-1464278091"></a>
### playerIconCandidates

```ml
function playerIconCandidates(playerInfo)
```

Calls `mq3.client.cgame_info.splitModel`, `mq3.shared.info.value` from client game info `playerIconCandidates`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `playerInfo` | `dynamic` | — | Value used by `modelSkin=splitModel(info.value(playerInfo,"model"))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L104)

<a id="function-function-mq3-client-cgame-info-splitmodel-function-splitmodel-value-src-mq3-client-cgame-info-ml-1401948745"></a>
### splitModel

```ml
function splitModel(value)
```

Calls `std.string.split` from client game info `splitModel`. The final path returns `[value,"default"]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `parts=strings.split(value,"/")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_info.ml#L99)

- [mq3.client.cgame_info.State](Type-mq3-client-cgame-info-state-1283701186.md) — struct
