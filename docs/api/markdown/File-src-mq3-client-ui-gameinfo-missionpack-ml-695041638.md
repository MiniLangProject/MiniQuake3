# `src/mq3/client/ui_gameinfo_missionpack.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_gameinfo_missionpack`](Package-mq3-client-ui-gameinfo-missionpack-1365658046.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_gameinfo.ml` as `base` → [src/mq3/client/ui_gameinfo.ml](File-src-mq3-client-ui-gameinfo-ml-965434910.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.ui_gameinfo_missionpack.Action](Type-mq3-client-ui-gameinfo-missionpack-action-605553514.md) — struct
<a id="function-function-mq3-client-ui-gameinfo-missionpack-arenatypebits-function-arenatypebits-type-src-mq3-client-ui-gameinfo-missionpack-ml-943373912"></a>
### arenaTypeBits

```ml
function arenaTypeBits(type)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L46)

<a id="function-function-mq3-client-ui-gameinfo-missionpack-contains-function-contains-text-part-src-mq3-client-ui-gameinfo-missionpack-ml-1488198672"></a>
### contains

```ml
function contains(text, part)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `part` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L34)

<a id="function-function-mq3-client-ui-gameinfo-missionpack-create-function-create-retailactive-src-mq3-client-ui-gameinfo-missionpack-ml-1982330297"></a>
### create

```ml
function create(retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L27)

<a id="function-function-mq3-client-ui-gameinfo-missionpack-emit-function-emit-state-boundary-kind-name-text-number-src-mq3-client-ui-gameinfo-missionpack-ml-1673724962"></a>
### emit

```ml
function emit(state, boundary, kind, name, text, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L30)

<a id="constant-constant-mq3-client-ui-gameinfo-missionpack-gt-1fctf-const-gt-1fctf-5-src-mq3-client-ui-gameinfo-missionpack-ml-2024253888"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L18)

<a id="constant-constant-mq3-client-ui-gameinfo-missionpack-gt-ctf-const-gt-ctf-4-src-mq3-client-ui-gameinfo-missionpack-ml-709921389"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L17)

<a id="constant-constant-mq3-client-ui-gameinfo-missionpack-gt-ffa-const-gt-ffa-0-src-mq3-client-ui-gameinfo-missionpack-ml-538229641"></a>
### GT_FFA

```ml
const GT_FFA = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L13)

<a id="constant-constant-mq3-client-ui-gameinfo-missionpack-gt-harvester-const-gt-harvester-7-src-mq3-client-ui-gameinfo-missionpack-ml-1523922070"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L20)

<a id="constant-constant-mq3-client-ui-gameinfo-missionpack-gt-max-game-type-const-gt-max-game-type-8-src-mq3-client-ui-gameinfo-missionpack-ml-101962987"></a>
### GT_MAX_GAME_TYPE

```ml
const GT_MAX_GAME_TYPE = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L21)

<a id="constant-constant-mq3-client-ui-gameinfo-missionpack-gt-obelisk-const-gt-obelisk-6-src-mq3-client-ui-gameinfo-missionpack-ml-1405246687"></a>
### GT_OBELISK

```ml
const GT_OBELISK = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L19)

<a id="constant-constant-mq3-client-ui-gameinfo-missionpack-gt-single-player-const-gt-single-player-2-src-mq3-client-ui-gameinfo-missionpack-ml-1506228857"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L15)

<a id="constant-constant-mq3-client-ui-gameinfo-missionpack-gt-team-const-gt-team-3-src-mq3-client-ui-gameinfo-missionpack-ml-600464116"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L16)

<a id="constant-constant-mq3-client-ui-gameinfo-missionpack-gt-tournament-const-gt-tournament-1-src-mq3-client-ui-gameinfo-missionpack-ml-1768391286"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L14)

<a id="function-function-mq3-client-ui-gameinfo-missionpack-mapinfo-function-mapinfo-arena-number-src-mq3-client-ui-gameinfo-missionpack-ml-1085707844"></a>
### mapInfo

```ml
function mapInfo(arena, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `arena` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L57)

- [mq3.client.ui_gameinfo_missionpack.MapInfo](Type-mq3-client-ui-gameinfo-missionpack-mapinfo-1573515734.md) — struct
<a id="constant-constant-mq3-client-ui-gameinfo-missionpack-max-arenas-const-max-arenas-1024-src-mq3-client-ui-gameinfo-missionpack-ml-860444878"></a>
### MAX_ARENAS

```ml
const MAX_ARENAS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L11)

<a id="constant-constant-mq3-client-ui-gameinfo-missionpack-max-bots-const-max-bots-1024-src-mq3-client-ui-gameinfo-missionpack-ml-736222906"></a>
### MAX_BOTS

```ml
const MAX_BOTS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L12)

<a id="constant-constant-mq3-client-ui-gameinfo-missionpack-max-maps-const-max-maps-128-src-mq3-client-ui-gameinfo-missionpack-ml-782444162"></a>
### MAX_MAPS

```ml
const MAX_MAPS = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L10)

- [mq3.client.ui_gameinfo_missionpack.State](Type-mq3-client-ui-gameinfo-missionpack-state-1482826341.md) — struct
<a id="function-function-mq3-client-ui-gameinfo-missionpack-sync-function-sync-state-src-mq3-client-ui-gameinfo-missionpack-ml-277824969"></a>
### sync

```ml
function sync(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L33)

<a id="function-function-mq3-client-ui-gameinfo-missionpack-ui-getbotinfobyname-function-ui-getbotinfobyname-state-name-src-mq3-client-ui-gameinfo-missionpack-ml-951826564"></a>
### UI_GetBotInfoByName

```ml
function UI_GetBotInfoByName(state, name)
```

UI_GetBotInfoByName

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L94)

<a id="function-function-mq3-client-ui-gameinfo-missionpack-ui-getbotinfobynumber-function-ui-getbotinfobynumber-state-num-src-mq3-client-ui-gameinfo-missionpack-ml-164269735"></a>
### UI_GetBotInfoByNumber

```ml
function UI_GetBotInfoByNumber(state, num)
```

UI_GetBotInfoByNumber

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `num` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L89)

<a id="function-function-mq3-client-ui-gameinfo-missionpack-ui-getbotnamebynumber-function-ui-getbotnamebynumber-state-num-src-mq3-client-ui-gameinfo-missionpack-ml-1959370017"></a>
### UI_GetBotNameByNumber

```ml
function UI_GetBotNameByNumber(state, num)
```

UI_GetBotNameByNumber

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `num` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L100)

<a id="function-function-mq3-client-ui-gameinfo-missionpack-ui-getnumbots-function-ui-getnumbots-state-src-mq3-client-ui-gameinfo-missionpack-ml-458822243"></a>
### UI_GetNumBots

```ml
function UI_GetNumBots(state)
```

UI_GetNumBots

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L97)

<a id="function-function-mq3-client-ui-gameinfo-missionpack-ui-loadarenas-function-ui-loadarenas-state-primaryname-primarytext-additionalfiles-src-mq3-client-ui-gameinfo-missionpack-ml-547920335"></a>
### UI_LoadArenas

```ml
function UI_LoadArenas(state, primaryName, primaryText, additionalFiles)
```

UI_LoadArenas

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `primaryName` | `dynamic` | — |  |
| `primaryText` | `dynamic` | — |  |
| `additionalFiles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L62)

<a id="function-function-mq3-client-ui-gameinfo-missionpack-ui-loadarenasfromfile-function-ui-loadarenasfromfile-state-filename-text-src-mq3-client-ui-gameinfo-missionpack-ml-433373369"></a>
### UI_LoadArenasFromFile

```ml
function UI_LoadArenasFromFile(state, filename, text)
```

UI_LoadArenasFromFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L42)

<a id="function-function-mq3-client-ui-gameinfo-missionpack-ui-loadbots-function-ui-loadbots-state-primaryname-primarytext-additionalfiles-src-mq3-client-ui-gameinfo-missionpack-ml-743312307"></a>
### UI_LoadBots

```ml
function UI_LoadBots(state, primaryName, primaryText, additionalFiles)
```

UI_LoadBots

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `primaryName` | `dynamic` | — |  |
| `primaryText` | `dynamic` | — |  |
| `additionalFiles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L81)

<a id="function-function-mq3-client-ui-gameinfo-missionpack-ui-loadbotsfromfile-function-ui-loadbotsfromfile-state-filename-text-src-mq3-client-ui-gameinfo-missionpack-ml-2143445149"></a>
### UI_LoadBotsFromFile

```ml
function UI_LoadBotsFromFile(state, filename, text)
```

UI_LoadBotsFromFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L76)

<a id="function-function-mq3-client-ui-gameinfo-missionpack-ui-parseinfos-function-ui-parseinfos-state-text-max-src-mq3-client-ui-gameinfo-missionpack-ml-2118742308"></a>
### UI_ParseInfos

```ml
function UI_ParseInfos(state, text, max)
```

UI_ParseInfos

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `max` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo_missionpack.ml#L37)
