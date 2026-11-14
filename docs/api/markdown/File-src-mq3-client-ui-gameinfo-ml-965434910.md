# `src/mq3/client/ui_gameinfo.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_gameinfo`](Package-mq3-client-ui-gameinfo-1667320990.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-client-ui-gameinfo-arenas-per-tier-const-arenas-per-tier-4-src-mq3-client-ui-gameinfo-ml-1168433057"></a>
### ARENAS_PER_TIER

```ml
const ARENAS_PER_TIER = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L18)

<a id="constant-constant-mq3-client-ui-gameinfo-award-perfect-const-award-perfect-5-src-mq3-client-ui-gameinfo-ml-407832074"></a>
### AWARD_PERFECT

```ml
const AWARD_PERFECT = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L19)

- [mq3.client.ui_gameinfo.BestScore](Type-mq3-client-ui-gameinfo-bestscore-1866157436.md) — struct
<a id="function-function-mq3-client-ui-gameinfo-create-function-create-src-mq3-client-ui-gameinfo-ml-944916814"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L30)

<a id="function-function-mq3-client-ui-gameinfo-cvar-function-cvar-value-name-src-mq3-client-ui-gameinfo-ml-1008951368"></a>
### cvar

```ml
function cvar(value, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L34)

<a id="function-function-mq3-client-ui-gameinfo-diagnostic-function-diagnostic-value-text-src-mq3-client-ui-gameinfo-ml-1525353816"></a>
### diagnostic

```ml
function diagnostic(value, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L40)

- [mq3.client.ui_gameinfo.GameInfo](Type-mq3-client-ui-gameinfo-gameinfo-1477501930.md) — struct
<a id="function-function-mq3-client-ui-gameinfo-gametypebits-function-gametypebits-text-src-mq3-client-ui-gameinfo-ml-153888371"></a>
### GametypeBits

```ml
function GametypeBits(text)
```

Start-server type matcher fed by the arena type strings loaded here.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L104)

<a id="constant-constant-mq3-client-ui-gameinfo-gt-ctf-const-gt-ctf-4-src-mq3-client-ui-gameinfo-ml-1233866237"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L25)

<a id="constant-constant-mq3-client-ui-gameinfo-gt-ffa-const-gt-ffa-0-src-mq3-client-ui-gameinfo-ml-310416425"></a>
### GT_FFA

```ml
const GT_FFA = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L21)

<a id="constant-constant-mq3-client-ui-gameinfo-gt-single-player-const-gt-single-player-2-src-mq3-client-ui-gameinfo-ml-702790873"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L23)

<a id="constant-constant-mq3-client-ui-gameinfo-gt-team-const-gt-team-3-src-mq3-client-ui-gameinfo-ml-477731368"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L24)

<a id="constant-constant-mq3-client-ui-gameinfo-gt-tournament-const-gt-tournament-1-src-mq3-client-ui-gameinfo-ml-133292638"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L22)

<a id="function-function-mq3-client-ui-gameinfo-has-function-has-text-part-src-mq3-client-ui-gameinfo-ml-389695812"></a>
### has

```ml
function has(text, part)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `part` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L79)

<a id="constant-constant-mq3-client-ui-gameinfo-max-arenas-const-max-arenas-1024-src-mq3-client-ui-gameinfo-ml-1086636230"></a>
### MAX_ARENAS

```ml
const MAX_ARENAS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L14)

<a id="constant-constant-mq3-client-ui-gameinfo-max-arenas-text-const-max-arenas-text-8192-src-mq3-client-ui-gameinfo-ml-543147933"></a>
### MAX_ARENAS_TEXT

```ml
const MAX_ARENAS_TEXT = 8192
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L16)

<a id="constant-constant-mq3-client-ui-gameinfo-max-bots-const-max-bots-1024-src-mq3-client-ui-gameinfo-ml-1315971698"></a>
### MAX_BOTS

```ml
const MAX_BOTS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L15)

<a id="constant-constant-mq3-client-ui-gameinfo-max-bots-text-const-max-bots-text-8192-src-mq3-client-ui-gameinfo-ml-1487876857"></a>
### MAX_BOTS_TEXT

```ml
const MAX_BOTS_TEXT = 8192
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L17)

<a id="constant-constant-mq3-client-ui-gameinfo-poolsize-const-poolsize-131072-src-mq3-client-ui-gameinfo-ml-1467961713"></a>
### POOLSIZE

```ml
const POOLSIZE = 131072
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L13)

<a id="function-function-mq3-client-ui-gameinfo-same-function-same-left-right-src-mq3-client-ui-gameinfo-ml-1810185885"></a>
### same

```ml
function same(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L80)

<a id="function-function-mq3-client-ui-gameinfo-setcvar-function-setcvar-value-name-text-src-mq3-client-ui-gameinfo-ml-809232733"></a>
### setCvar

```ml
function setCvar(value, name, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L37)

<a id="function-function-mq3-client-ui-gameinfo-ui-alloc-function-ui-alloc-value-size-src-mq3-client-ui-gameinfo-ml-1001140782"></a>
### UI_Alloc

```ml
function UI_Alloc(value, size)
```

UI_Alloc

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L43)

<a id="function-function-mq3-client-ui-gameinfo-ui-canshowtiervideo-function-ui-canshowtiervideo-value-tier-src-mq3-client-ui-gameinfo-ml-352115387"></a>
### UI_CanShowTierVideo

```ml
function UI_CanShowTierVideo(value, tier)
```

UI_CanShowTierVideo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `tier` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L180)

<a id="function-function-mq3-client-ui-gameinfo-ui-getarenainfobymap-function-ui-getarenainfobymap-value-map-src-mq3-client-ui-gameinfo-ml-1751852765"></a>
### UI_GetArenaInfoByMap

```ml
function UI_GetArenaInfoByMap(value, map)
```

UI_GetArenaInfoByMap

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L117)

<a id="function-function-mq3-client-ui-gameinfo-ui-getarenainfobynumber-function-ui-getarenainfobynumber-value-num-src-mq3-client-ui-gameinfo-ml-1337937931"></a>
### UI_GetArenaInfoByNumber

```ml
function UI_GetArenaInfoByNumber(value, num)
```

UI_GetArenaInfoByNumber

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `num` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L111)

<a id="function-function-mq3-client-ui-gameinfo-ui-getawardlevel-function-ui-getawardlevel-value-award-src-mq3-client-ui-gameinfo-ml-688167536"></a>
### UI_GetAwardLevel

```ml
function UI_GetAwardLevel(value, award)
```

UI_GetAwardLevel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `award` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L165)

<a id="function-function-mq3-client-ui-gameinfo-ui-getbestscore-function-ui-getbestscore-value-level-src-mq3-client-ui-gameinfo-ml-1119447527"></a>
### UI_GetBestScore

```ml
function UI_GetBestScore(value, level)
```

UI_GetBestScore

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L149)

<a id="function-function-mq3-client-ui-gameinfo-ui-getbotinfobyname-function-ui-getbotinfobyname-value-name-src-mq3-client-ui-gameinfo-ml-1384024964"></a>
### UI_GetBotInfoByName

```ml
function UI_GetBotInfoByName(value, name)
```

UI_GetBotInfoByName

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L144)

<a id="function-function-mq3-client-ui-gameinfo-ui-getbotinfobynumber-function-ui-getbotinfobynumber-value-num-src-mq3-client-ui-gameinfo-ml-1232138295"></a>
### UI_GetBotInfoByNumber

```ml
function UI_GetBotInfoByNumber(value, num)
```

UI_GetBotInfoByNumber

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `num` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L139)

<a id="function-function-mq3-client-ui-gameinfo-ui-getcurrentgame-function-ui-getcurrentgame-value-src-mq3-client-ui-gameinfo-ml-1688968573"></a>
### UI_GetCurrentGame

```ml
function UI_GetCurrentGame(value)
```

UI_GetCurrentGame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L185)

<a id="function-function-mq3-client-ui-gameinfo-ui-getnumarenas-function-ui-getnumarenas-value-src-mq3-client-ui-gameinfo-ml-270945595"></a>
### UI_GetNumArenas

```ml
function UI_GetNumArenas(value)
```

UI_GetNumArenas / UI_GetNumSPArenas / UI_GetNumSPTiers / UI_GetNumBots

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L196)

<a id="function-function-mq3-client-ui-gameinfo-ui-getnumbots-function-ui-getnumbots-value-src-mq3-client-ui-gameinfo-ml-7541603"></a>
### UI_GetNumBots

```ml
function UI_GetNumBots(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L199)

<a id="function-function-mq3-client-ui-gameinfo-ui-getnumsparenas-function-ui-getnumsparenas-value-src-mq3-client-ui-gameinfo-ml-1094437293"></a>
### UI_GetNumSPArenas

```ml
function UI_GetNumSPArenas(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L197)

<a id="function-function-mq3-client-ui-gameinfo-ui-getnumsptiers-function-ui-getnumsptiers-value-src-mq3-client-ui-gameinfo-ml-1139531745"></a>
### UI_GetNumSPTiers

```ml
function UI_GetNumSPTiers(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L198)

<a id="function-function-mq3-client-ui-gameinfo-ui-getspecialarenainfo-function-ui-getspecialarenainfo-value-tag-src-mq3-client-ui-gameinfo-ml-1445686391"></a>
### UI_GetSpecialArenaInfo

```ml
function UI_GetSpecialArenaInfo(value, tag)
```

UI_GetSpecialArenaInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `tag` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L122)

<a id="function-function-mq3-client-ui-gameinfo-ui-initgameinfo-function-ui-initgameinfo-value-arenaname-arenatext-arenafiles-botname-bottext-botfiles-fsrestrict-src-mq3-client-ui-gameinfo-ml-1462961604"></a>
### UI_InitGameinfo

```ml
function UI_InitGameinfo(value, arenaName, arenaText, arenaFiles, botName, botText, botFiles, fsRestrict)
```

UI_InitGameinfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `arenaName` | `dynamic` | — |  |
| `arenaText` | `dynamic` | — |  |
| `arenaFiles` | `dynamic` | — |  |
| `botName` | `dynamic` | — |  |
| `botText` | `dynamic` | — |  |
| `botFiles` | `dynamic` | — |  |
| `fsRestrict` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L212)

<a id="function-function-mq3-client-ui-gameinfo-ui-initmemory-function-ui-initmemory-value-src-mq3-client-ui-gameinfo-ml-1659676177"></a>
### UI_InitMemory

```ml
function UI_InitMemory(value)
```

UI_InitMemory

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L48)

<a id="function-function-mq3-client-ui-gameinfo-ui-loadarenas-function-ui-loadarenas-value-primaryname-primarytext-additionalfiles-src-mq3-client-ui-gameinfo-ml-1524890775"></a>
### UI_LoadArenas

```ml
function UI_LoadArenas(value, primaryName, primaryText, additionalFiles)
```

UI_LoadArenas

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `primaryName` | `dynamic` | — |  |
| `primaryText` | `dynamic` | — |  |
| `additionalFiles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L83)

<a id="function-function-mq3-client-ui-gameinfo-ui-loadarenasfromfile-function-ui-loadarenasfromfile-value-filename-text-src-mq3-client-ui-gameinfo-ml-86109605"></a>
### UI_LoadArenasFromFile

```ml
function UI_LoadArenasFromFile(value, filename, text)
```

UI_LoadArenasFromFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L72)

<a id="function-function-mq3-client-ui-gameinfo-ui-loadbots-function-ui-loadbots-value-primaryname-primarytext-additionalfiles-src-mq3-client-ui-gameinfo-ml-1576693779"></a>
### UI_LoadBots

```ml
function UI_LoadBots(value, primaryName, primaryText, additionalFiles)
```

UI_LoadBots

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `primaryName` | `dynamic` | — |  |
| `primaryText` | `dynamic` | — |  |
| `additionalFiles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L134)

<a id="function-function-mq3-client-ui-gameinfo-ui-loadbotsfromfile-function-ui-loadbotsfromfile-value-filename-text-src-mq3-client-ui-gameinfo-ml-669328481"></a>
### UI_LoadBotsFromFile

```ml
function UI_LoadBotsFromFile(value, filename, text)
```

UI_LoadBotsFromFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L127)

<a id="function-function-mq3-client-ui-gameinfo-ui-logawarddata-function-ui-logawarddata-value-award-data-src-mq3-client-ui-gameinfo-ml-921804968"></a>
### UI_LogAwardData

```ml
function UI_LogAwardData(value, award, data)
```

UI_LogAwardData

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `award` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L160)

<a id="function-function-mq3-client-ui-gameinfo-ui-newgame-function-ui-newgame-value-src-mq3-client-ui-gameinfo-ml-115179669"></a>
### UI_NewGame

```ml
function UI_NewGame(value)
```

UI_NewGame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L191)

<a id="function-function-mq3-client-ui-gameinfo-ui-parseinfos-function-ui-parseinfos-value-text-max-src-mq3-client-ui-gameinfo-ml-66411732"></a>
### UI_ParseInfos

```ml
function UI_ParseInfos(value, text, max)
```

UI_ParseInfos

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `max` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L51)

<a id="function-function-mq3-client-ui-gameinfo-ui-setbestscore-function-ui-setbestscore-value-level-score-src-mq3-client-ui-gameinfo-ml-218431387"></a>
### UI_SetBestScore

```ml
function UI_SetBestScore(value, level, score)
```

UI_SetBestScore

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `level` | `dynamic` | — |  |
| `score` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L155)

<a id="function-function-mq3-client-ui-gameinfo-ui-showtiervideo-function-ui-showtiervideo-value-tier-src-mq3-client-ui-gameinfo-ml-691714241"></a>
### UI_ShowTierVideo

```ml
function UI_ShowTierVideo(value, tier)
```

UI_ShowTierVideo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `tier` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L175)

<a id="function-function-mq3-client-ui-gameinfo-ui-spunlock-f-function-ui-spunlock-f-value-src-mq3-client-ui-gameinfo-ml-614005575"></a>
### UI_SPUnlock_f

```ml
function UI_SPUnlock_f(value)
```

UI_SPUnlock_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L202)

<a id="function-function-mq3-client-ui-gameinfo-ui-spunlockmedals-f-function-ui-spunlockmedals-f-value-src-mq3-client-ui-gameinfo-ml-698429799"></a>
### UI_SPUnlockMedals_f

```ml
function UI_SPUnlockMedals_f(value)
```

UI_SPUnlockMedals_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L207)

<a id="function-function-mq3-client-ui-gameinfo-ui-tiercompleted-function-ui-tiercompleted-value-levelwon-src-mq3-client-ui-gameinfo-ml-1141770031"></a>
### UI_TierCompleted

```ml
function UI_TierCompleted(value, levelWon)
```

UI_TierCompleted

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `levelWon` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_gameinfo.ml#L168)
