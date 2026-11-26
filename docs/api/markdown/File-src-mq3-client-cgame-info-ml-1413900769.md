# `src/mq3/client/cgame_info.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_info`](Package-mq3-client-cgame-info-194763525.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/command_buffer.ml` as `commandBuffer` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="extern_function-extern-function-mq3-client-cgame-info-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-client-cgame-info-ml-1773733638"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L8)

<a id="function-function-mq3-client-cgame-info-baseitemicons-function-baseitemicons-src-mq3-client-cgame-info-ml-104683526"></a>
### baseItemIcons

```ml
function baseItemIcons()
```

Baseq3 bg_itemlist order is the bit order of CS_ITEMS.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L47)

<a id="function-function-mq3-client-cgame-info-clean-function-clean-text-src-mq3-client-cgame-info-ml-1408830407"></a>
### clean

```ml
function clean(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L20)

<a id="function-function-mq3-client-cgame-info-create-function-create-src-mq3-client-cgame-info-ml-455228258"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L19)

- [mq3.client.cgame_info.Draw](Type-mq3-client-cgame-info-draw-298961247.md) — struct
<a id="function-function-mq3-client-cgame-info-drawinformation-function-drawinformation-state-serverinfo-systeminfo-motd-message-gametype-svrunning-availableassets-src-mq3-client-cgame-info-ml-301713500"></a>
### drawInformation

```ml
function drawInformation(state, serverInfo, systemInfo, motd, message, gametype, svRunning, availableAssets)
```

CG_DrawInformation

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverInfo` | `dynamic` | — |  |
| `systemInfo` | `dynamic` | — |  |
| `motd` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |
| `gametype` | `dynamic` | — |  |
| `svRunning` | `dynamic` | — |  |
| `availableAssets` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L68)

<a id="function-function-mq3-client-cgame-info-drawinformationwithshot-function-drawinformationwithshot-state-serverinfo-systeminfo-motd-message-gametype-svrunning-levelshot-src-mq3-client-cgame-info-ml-1449181912"></a>
### drawInformationWithShot

```ml
function drawInformationWithShot(state, serverInfo, systemInfo, motd, message, gametype, svRunning, levelshot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverInfo` | `dynamic` | — |  |
| `systemInfo` | `dynamic` | — |  |
| `motd` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |
| `gametype` | `dynamic` | — |  |
| `svRunning` | `dynamic` | — |  |
| `levelshot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L73)

<a id="function-function-mq3-client-cgame-info-drawloadingicons-function-drawloadingicons-state-src-mq3-client-cgame-info-ml-757835433"></a>
### drawLoadingIcons

```ml
function drawLoadingIcons(state)
```

CG_DrawLoadingIcons

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L59)

<a id="function-function-mq3-client-cgame-info-gametypename-function-gametypename-gametype-src-mq3-client-cgame-info-ml-524560352"></a>
### gametypeName

```ml
function gametypeName(gametype)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gametype` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L63)

<a id="constant-constant-mq3-client-cgame-info-gt-ctf-const-gt-ctf-4-src-mq3-client-cgame-info-ml-300612385"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L15)

<a id="constant-constant-mq3-client-cgame-info-gt-ffa-const-gt-ffa-0-src-mq3-client-cgame-info-ml-1798032509"></a>
### GT_FFA

```ml
const GT_FFA = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L11)

<a id="constant-constant-mq3-client-cgame-info-gt-single-player-const-gt-single-player-2-src-mq3-client-cgame-info-ml-594657053"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L13)

<a id="constant-constant-mq3-client-cgame-info-gt-team-const-gt-team-3-src-mq3-client-cgame-info-ml-1338752738"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L14)

<a id="constant-constant-mq3-client-cgame-info-gt-tournament-const-gt-tournament-1-src-mq3-client-cgame-info-ml-443562016"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L12)

- [mq3.client.cgame_info.Information](Type-mq3-client-cgame-info-information-431493297.md) — struct
<a id="function-function-mq3-client-cgame-info-line-function-line-result-y-text-src-mq3-client-cgame-info-ml-1868194463"></a>
### line

```ml
function line(result, y, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L66)

<a id="function-function-mq3-client-cgame-info-loadingclient-function-loadingclient-state-playerinfo-gametype-availableassets-src-mq3-client-cgame-info-ml-2147050968"></a>
### loadingClient

```ml
function loadingClient(state, playerInfo, gametype, availableAssets)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `playerInfo` | `dynamic` | — |  |
| `gametype` | `dynamic` | — |  |
| `availableAssets` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L41)

<a id="function-function-mq3-client-cgame-info-loadingitem-function-loadingitem-state-icon-pickupname-handle-src-mq3-client-cgame-info-ml-914388139"></a>
### loadingItem

```ml
function loadingItem(state, icon, pickupName, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `icon` | `dynamic` | — |  |
| `pickupName` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L31)

<a id="function-function-mq3-client-cgame-info-loadingstring-function-loadingstring-state-text-src-mq3-client-cgame-info-ml-1505844736"></a>
### loadingString

```ml
function loadingString(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L30)

<a id="constant-constant-mq3-client-cgame-info-max-loading-item-icons-const-max-loading-item-icons-26-src-mq3-client-cgame-info-ml-1419542253"></a>
### MAX_LOADING_ITEM_ICONS

```ml
const MAX_LOADING_ITEM_ICONS = 26
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L10)

<a id="constant-constant-mq3-client-cgame-info-max-loading-player-icons-const-max-loading-player-icons-16-src-mq3-client-cgame-info-ml-712601108"></a>
### MAX_LOADING_PLAYER_ICONS

```ml
const MAX_LOADING_PLAYER_ICONS = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L9)

<a id="function-function-mq3-client-cgame-info-playericoncandidates-function-playericoncandidates-playerinfo-src-mq3-client-cgame-info-ml-1464278091"></a>
### playerIconCandidates

```ml
function playerIconCandidates(playerInfo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `playerInfo` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L37)

<a id="function-function-mq3-client-cgame-info-splitmodel-function-splitmodel-value-src-mq3-client-cgame-info-ml-1401948745"></a>
### splitModel

```ml
function splitModel(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_info.ml#L34)

- [mq3.client.cgame_info.State](Type-mq3-client-cgame-info-state-1283701186.md) — struct
