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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L18)

<a id="constant-constant-mq3-client-ui-gameinfo-award-perfect-const-award-perfect-5-src-mq3-client-ui-gameinfo-ml-407832074"></a>
### AWARD_PERFECT

```ml
const AWARD_PERFECT = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L19)

- [mq3.client.ui_gameinfo.BestScore](Type-mq3-client-ui-gameinfo-bestscore-1866157436.md) — struct
<a id="function-function-mq3-client-ui-gameinfo-create-function-create-src-mq3-client-ui-gameinfo-ml-944916814"></a>
### create

```ml
function create()
```

Creates a `mq3.client.ui_gameinfo.GameInfo` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L33)

<a id="function-function-mq3-client-ui-gameinfo-cvar-function-cvar-value-name-src-mq3-client-ui-gameinfo-ml-1008951368"></a>
### cvar

```ml
function cvar(value, name)
```

Evaluates UI gameinfo `cvar` and returns `value.cvars[index][1]`, `""` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.cvars`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI gameinfo resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L40)

<a id="function-function-mq3-client-ui-gameinfo-diagnostic-function-diagnostic-value-text-src-mq3-client-ui-gameinfo-ml-1525353816"></a>
### diagnostic

```ml
function diagnostic(value, text)
```

Updates `value.diagnostics` during UI gameinfo `diagnostic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI gameinfo record/storage; this routine assigns `value.diagnostics`. |
| `text` | `dynamic` | — | Text consumed or emitted by `diagnostic` in the UI gameinfo path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L53)

- [mq3.client.ui_gameinfo.GameInfo](Type-mq3-client-ui-gameinfo-gameinfo-1477501930.md) — struct
<a id="function-function-mq3-client-ui-gameinfo-gametypebits-function-gametypebits-text-src-mq3-client-ui-gameinfo-ml-153888371"></a>
### GametypeBits

```ml
function GametypeBits(text)
```

Start-server type matcher fed by the arena type strings loaded here.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `GametypeBits` in the UI gameinfo path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L137)

<a id="constant-constant-mq3-client-ui-gameinfo-gt-ctf-const-gt-ctf-4-src-mq3-client-ui-gameinfo-ml-1233866237"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L25)

<a id="constant-constant-mq3-client-ui-gameinfo-gt-ffa-const-gt-ffa-0-src-mq3-client-ui-gameinfo-ml-310416425"></a>
### GT_FFA

```ml
const GT_FFA = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L21)

<a id="constant-constant-mq3-client-ui-gameinfo-gt-single-player-const-gt-single-player-2-src-mq3-client-ui-gameinfo-ml-702790873"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L23)

<a id="constant-constant-mq3-client-ui-gameinfo-gt-team-const-gt-team-3-src-mq3-client-ui-gameinfo-ml-477731368"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L24)

<a id="constant-constant-mq3-client-ui-gameinfo-gt-tournament-const-gt-tournament-1-src-mq3-client-ui-gameinfo-ml-133292638"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L22)

<a id="function-function-mq3-client-ui-gameinfo-has-function-has-text-part-src-mq3-client-ui-gameinfo-ml-389695812"></a>
### has

```ml
function has(text, part)
```

Computes `strings.indexOf(text,part,0)>=0` for UI gameinfo `has`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `has` in the UI gameinfo path. |
| `part` | `dynamic` | — | Value used by `return strings.indexOf(text,part,0)>=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L104)

<a id="constant-constant-mq3-client-ui-gameinfo-max-arenas-const-max-arenas-1024-src-mq3-client-ui-gameinfo-ml-1086636230"></a>
### MAX_ARENAS

```ml
const MAX_ARENAS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L14)

<a id="constant-constant-mq3-client-ui-gameinfo-max-arenas-text-const-max-arenas-text-8192-src-mq3-client-ui-gameinfo-ml-543147933"></a>
### MAX_ARENAS_TEXT

```ml
const MAX_ARENAS_TEXT = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L16)

<a id="constant-constant-mq3-client-ui-gameinfo-max-bots-const-max-bots-1024-src-mq3-client-ui-gameinfo-ml-1315971698"></a>
### MAX_BOTS

```ml
const MAX_BOTS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L15)

<a id="constant-constant-mq3-client-ui-gameinfo-max-bots-text-const-max-bots-text-8192-src-mq3-client-ui-gameinfo-ml-1487876857"></a>
### MAX_BOTS_TEXT

```ml
const MAX_BOTS_TEXT = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L17)

<a id="constant-constant-mq3-client-ui-gameinfo-poolsize-const-poolsize-131072-src-mq3-client-ui-gameinfo-ml-1467961713"></a>
### POOLSIZE

```ml
const POOLSIZE = 131072
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L13)

<a id="function-function-mq3-client-ui-gameinfo-same-function-same-left-right-src-mq3-client-ui-gameinfo-ml-1810185885"></a>
### same

```ml
function same(left, right)
```

Compares two UI gameinfo names using ASCII case-insensitive equality.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Argument 1 of `std.string.equalsIgnoreCaseAscii`. |
| `right` | `dynamic` | — | Argument 2 of `std.string.equalsIgnoreCaseAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L108)

<a id="function-function-mq3-client-ui-gameinfo-setcvar-function-setcvar-value-name-text-src-mq3-client-ui-gameinfo-ml-809232733"></a>
### setCvar

```ml
function setCvar(value, name, text)
```

Updates `value.cvars`, `value.writes` during UI gameinfo `setCvar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI gameinfo record/storage; this routine assigns `value.cvars`, `value.writes`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI gameinfo resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `setCvar` in the UI gameinfo path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L47)

<a id="function-function-mq3-client-ui-gameinfo-ui-alloc-function-ui-alloc-value-size-src-mq3-client-ui-gameinfo-ml-1001140782"></a>
### UI_Alloc

```ml
function UI_Alloc(value, size)
```

UI_Alloc

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI gameinfo record/storage; this routine assigns `value.outOfMemory`, `value.allocPoint`. |
| `size` | `dynamic` | — | Value tested by `value.allocPoint+size>POOLSIZE` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L58)

<a id="function-function-mq3-client-ui-gameinfo-ui-canshowtiervideo-function-ui-canshowtiervideo-value-tier-src-mq3-client-ui-gameinfo-ml-352115387"></a>
### UI_CanShowTierVideo

```ml
function UI_CanShowTierVideo(value, tier)
```

UI_CanShowTierVideo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.demoversion`. |
| `tier` | `dynamic` | — | Value used by `if tier==0 then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L246)

<a id="function-function-mq3-client-ui-gameinfo-ui-getarenainfobymap-function-ui-getarenainfobymap-value-map-src-mq3-client-ui-gameinfo-ml-1751852765"></a>
### UI_GetArenaInfoByMap

```ml
function UI_GetArenaInfoByMap(value, map)
```

UI_GetArenaInfoByMap

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.arenas`. |
| `map` | `dynamic` | — | map record passed to the UI gameinfo helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L154)

<a id="function-function-mq3-client-ui-gameinfo-ui-getarenainfobynumber-function-ui-getarenainfobynumber-value-num-src-mq3-client-ui-gameinfo-ml-1337937931"></a>
### UI_GetArenaInfoByNumber

```ml
function UI_GetArenaInfoByNumber(value, num)
```

UI_GetArenaInfoByNumber

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.arenas`. |
| `num` | `dynamic` | — | Value used by `if num<0 or num>=len(value.arenas) then diagnostic(value,"^1Invalid arena number: "+str(num)+"\\n")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L146)

<a id="function-function-mq3-client-ui-gameinfo-ui-getawardlevel-function-ui-getawardlevel-value-award-src-mq3-client-ui-gameinfo-ml-688167536"></a>
### UI_GetAwardLevel

```ml
function UI_GetAwardLevel(value, award)
```

UI_GetAwardLevel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.compat.textnumbers.atoi`; passed as `info.value(cvar(value,"g_spAwards"),"a"+str(award))`. |
| `award` | `dynamic` | — | Argument 1 of `mq3.compat.textnumbers.atoi`; passed as `info.value(cvar(value,"g_spAwards"),"a"+str(award))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L225)

<a id="function-function-mq3-client-ui-gameinfo-ui-getbestscore-function-ui-getbestscore-value-level-src-mq3-client-ui-gameinfo-ml-1119447527"></a>
### UI_GetBestScore

```ml
function UI_GetBestScore(value, level)
```

UI_GetBestScore

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.arenas`. |
| `level` | `dynamic` | — | Value used by `if level<0 or level>len(value.arenas) then return BestScore(0,0) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L201)

<a id="function-function-mq3-client-ui-gameinfo-ui-getbotinfobyname-function-ui-getbotinfobyname-value-name-src-mq3-client-ui-gameinfo-ml-1384024964"></a>
### UI_GetBotInfoByName

```ml
function UI_GetBotInfoByName(value, name)
```

UI_GetBotInfoByName

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.bots`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI gameinfo resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L194)

<a id="function-function-mq3-client-ui-gameinfo-ui-getbotinfobynumber-function-ui-getbotinfobynumber-value-num-src-mq3-client-ui-gameinfo-ml-1232138295"></a>
### UI_GetBotInfoByNumber

```ml
function UI_GetBotInfoByNumber(value, num)
```

UI_GetBotInfoByNumber

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.bots`. |
| `num` | `dynamic` | — | Value used by `if num<0 or num>=len(value.bots) then diagnostic(value,"^1Invalid bot number: "+str(num)+"\\n")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L187)

<a id="function-function-mq3-client-ui-gameinfo-ui-getcurrentgame-function-ui-getcurrentgame-value-src-mq3-client-ui-gameinfo-ml-1688968573"></a>
### UI_GetCurrentGame

```ml
function UI_GetCurrentGame(value)
```

UI_GetCurrentGame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.numSinglePlayerArenas`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L252)

<a id="function-function-mq3-client-ui-gameinfo-ui-getnumarenas-function-ui-getnumarenas-value-src-mq3-client-ui-gameinfo-ml-270945595"></a>
### UI_GetNumArenas

```ml
function UI_GetNumArenas(value)
```

UI_GetNumArenas / UI_GetNumSPArenas / UI_GetNumSPTiers / UI_GetNumBots

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.arenas`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L265)

<a id="function-function-mq3-client-ui-gameinfo-ui-getnumbots-function-ui-getnumbots-value-src-mq3-client-ui-gameinfo-ml-7541603"></a>
### UI_GetNumBots

```ml
function UI_GetNumBots(value)
```

Returns the element/byte count of `value.bots` for UI gameinfo `UI_GetNumBots`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.bots`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L274)

<a id="function-function-mq3-client-ui-gameinfo-ui-getnumsparenas-function-ui-getnumsparenas-value-src-mq3-client-ui-gameinfo-ml-1094437293"></a>
### UI_GetNumSPArenas

```ml
function UI_GetNumSPArenas(value)
```

Reads `value.numSinglePlayerArenas` for UI gameinfo `UI_GetNumSPArenas`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.numSinglePlayerArenas`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L268)

<a id="function-function-mq3-client-ui-gameinfo-ui-getnumsptiers-function-ui-getnumsptiers-value-src-mq3-client-ui-gameinfo-ml-1139531745"></a>
### UI_GetNumSPTiers

```ml
function UI_GetNumSPTiers(value)
```

Adapts `mq3.compat.numeric.trunc32` to UI gameinfo `UI_GetNumSPTiers`, returning its result for `value.numSinglePlayerArenas/ARENAS_PER_TIER`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.numSinglePlayerArenas`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L271)

<a id="function-function-mq3-client-ui-gameinfo-ui-getspecialarenainfo-function-ui-getspecialarenainfo-value-tag-src-mq3-client-ui-gameinfo-ml-1445686391"></a>
### UI_GetSpecialArenaInfo

```ml
function UI_GetSpecialArenaInfo(value, tag)
```

UI_GetSpecialArenaInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.arenas`. |
| `tag` | `dynamic` | — | Value used by `for each arena in value.arenas if same(info.value(arena,"special"),tag) then return arena end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L161)

<a id="function-function-mq3-client-ui-gameinfo-ui-initgameinfo-function-ui-initgameinfo-value-arenaname-arenatext-arenafiles-botname-bottext-botfiles-fsrestrict-src-mq3-client-ui-gameinfo-ml-1462961604"></a>
### UI_InitGameinfo

```ml
function UI_InitGameinfo(value, arenaName, arenaText, arenaFiles, botName, botText, botFiles, fsRestrict)
```

UI_InitGameinfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI gameinfo record/storage; this routine assigns `value.demoversion`. |
| `arenaName` | `dynamic` | — | Value used by `UI_LoadArenas(value,arenaName,arenaText,arenaFiles)`. |
| `arenaText` | `dynamic` | — | Value used by `UI_LoadArenas(value,arenaName,arenaText,arenaFiles)`. |
| `arenaFiles` | `dynamic` | — | Value used by `UI_LoadArenas(value,arenaName,arenaText,arenaFiles)`. |
| `botName` | `dynamic` | — | Value used by `UI_LoadBots(value,botName,botText,botFiles)`. |
| `botText` | `dynamic` | — | Value used by `UI_LoadBots(value,botName,botText,botFiles)`. |
| `botFiles` | `dynamic` | — | Value used by `UI_LoadBots(value,botName,botText,botFiles)`. |
| `fsRestrict` | `dynamic` | — | Value assigned to `value.demoversion`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L297)

<a id="function-function-mq3-client-ui-gameinfo-ui-initmemory-function-ui-initmemory-value-src-mq3-client-ui-gameinfo-ml-1659676177"></a>
### UI_InitMemory

```ml
function UI_InitMemory(value)
```

UI_InitMemory

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI gameinfo record/storage; this routine assigns `value.allocPoint`, `value.outOfMemory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L64)

<a id="function-function-mq3-client-ui-gameinfo-ui-loadarenas-function-ui-loadarenas-value-primaryname-primarytext-additionalfiles-src-mq3-client-ui-gameinfo-ml-1524890775"></a>
### UI_LoadArenas

```ml
function UI_LoadArenas(value, primaryName, primaryText, additionalFiles)
```

UI_LoadArenas

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI gameinfo record/storage; this routine assigns `value.arenas`, `value.arenas[index]`, `value.numSinglePlayerArenas`, `value.numSpecialSinglePlayerArenas`. |
| `primaryName` | `dynamic` | — | Value used by `UI_LoadArenasFromFile(value,primaryName,primaryText)`. |
| `primaryText` | `dynamic` | — | Value used by `UI_LoadArenasFromFile(value,primaryName,primaryText)`. |
| `additionalFiles` | `dynamic` | — | Value used by `for each entry in additionalFiles UI_LoadArenasFromFile(value,entry[0],entry[1]) end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L115)

<a id="function-function-mq3-client-ui-gameinfo-ui-loadarenasfromfile-function-ui-loadarenasfromfile-value-filename-text-src-mq3-client-ui-gameinfo-ml-86109605"></a>
### UI_LoadArenasFromFile

```ml
function UI_LoadArenasFromFile(value, filename, text)
```

UI_LoadArenasFromFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI gameinfo record/storage; this routine assigns `value.arenas`. |
| `filename` | `dynamic` | — | File name passed to the corresponding file/asset operation. |
| `text` | `dynamic` | — | Text consumed or emitted by `UI_LoadArenasFromFile` in the UI gameinfo path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L94)

<a id="function-function-mq3-client-ui-gameinfo-ui-loadbots-function-ui-loadbots-value-primaryname-primarytext-additionalfiles-src-mq3-client-ui-gameinfo-ml-1576693779"></a>
### UI_LoadBots

```ml
function UI_LoadBots(value, primaryName, primaryText, additionalFiles)
```

UI_LoadBots

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI gameinfo record/storage; this routine assigns `value.bots`. |
| `primaryName` | `dynamic` | — | Value used by `UI_LoadBotsFromFile(value,primaryName,primaryText)`. |
| `primaryText` | `dynamic` | — | Value used by `UI_LoadBotsFromFile(value,primaryName,primaryText)`. |
| `additionalFiles` | `dynamic` | — | Value used by `for each entry in additionalFiles UI_LoadBotsFromFile(value,entry[0],entry[1]) end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L180)

<a id="function-function-mq3-client-ui-gameinfo-ui-loadbotsfromfile-function-ui-loadbotsfromfile-value-filename-text-src-mq3-client-ui-gameinfo-ml-669328481"></a>
### UI_LoadBotsFromFile

```ml
function UI_LoadBotsFromFile(value, filename, text)
```

UI_LoadBotsFromFile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI gameinfo record/storage; this routine assigns `value.bots`. |
| `filename` | `dynamic` | — | File name passed to the corresponding file/asset operation. |
| `text` | `dynamic` | — | Text consumed or emitted by `UI_LoadBotsFromFile` in the UI gameinfo path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L169)

<a id="function-function-mq3-client-ui-gameinfo-ui-logawarddata-function-ui-logawarddata-value-award-data-src-mq3-client-ui-gameinfo-ml-921804968"></a>
### UI_LogAwardData

```ml
function UI_LogAwardData(value, award, data)
```

UI_LogAwardData

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `if award>AWARD_PERFECT then diagnostic(value,"^1Bad award "+str(award)+" in UI_LogAwardData\\n")`. |
| `award` | `dynamic` | — | Value used by `if award>AWARD_PERFECT then diagnostic(value,"^1Bad award "+str(award)+" in UI_LogAwardData\\n")`. |
| `data` | `dynamic` | — | Value used by `if data==0 then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L218)

<a id="function-function-mq3-client-ui-gameinfo-ui-newgame-function-ui-newgame-value-src-mq3-client-ui-gameinfo-ml-115179669"></a>
### UI_NewGame

```ml
function UI_NewGame(value)
```

UI_NewGame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `for skill=1 to 5 setCvar(value,"g_spScores"+str(skill),"") end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L259)

<a id="function-function-mq3-client-ui-gameinfo-ui-parseinfos-function-ui-parseinfos-value-text-max-src-mq3-client-ui-gameinfo-ml-66411732"></a>
### UI_ParseInfos

```ml
function UI_ParseInfos(value, text, max)
```

UI_ParseInfos

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `if token!="{" then diagnostic(value,"Missing { in info file\\n")`. |
| `text` | `dynamic` | — | Text consumed or emitted by `UI_ParseInfos` in the UI gameinfo path. |
| `max` | `dynamic` | — | Value used by `if len(parsed)==max then diagnostic(value,"Max infos exceeded\\n")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L70)

<a id="function-function-mq3-client-ui-gameinfo-ui-setbestscore-function-ui-setbestscore-value-level-score-src-mq3-client-ui-gameinfo-ml-218431387"></a>
### UI_SetBestScore

```ml
function UI_SetBestScore(value, level, score)
```

UI_SetBestScore

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `skill=numbers.atoi(cvar(value,"g_spSkill"))`. |
| `level` | `dynamic` | — | Value used by `key="l"+str(level)`. |
| `score` | `dynamic` | — | Value used by `if score<1 or score>8 then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L210)

<a id="function-function-mq3-client-ui-gameinfo-ui-showtiervideo-function-ui-showtiervideo-value-tier-src-mq3-client-ui-gameinfo-ml-691714241"></a>
### UI_ShowTierVideo

```ml
function UI_ShowTierVideo(value, tier)
```

UI_ShowTierVideo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `numbers.atoi(info.value(videos,key))!=0` before the calculation continues. |
| `tier` | `dynamic` | — | Value used by `if tier<=0 then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L239)

<a id="function-function-mq3-client-ui-gameinfo-ui-spunlock-f-function-ui-spunlock-f-value-src-mq3-client-ui-gameinfo-ml-614005575"></a>
### UI_SPUnlock_f

```ml
function UI_SPUnlock_f(value)
```

UI_SPUnlock_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI gameinfo record/storage; this routine assigns `value.levelMenuReinitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L278)

<a id="function-function-mq3-client-ui-gameinfo-ui-spunlockmedals-f-function-ui-spunlockmedals-f-value-src-mq3-client-ui-gameinfo-ml-698429799"></a>
### UI_SPUnlockMedals_f

```ml
function UI_SPUnlockMedals_f(value)
```

UI_SPUnlockMedals_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `awards=cvar(value,"g_spAwards")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L284)

<a id="function-function-mq3-client-ui-gameinfo-ui-tiercompleted-function-ui-tiercompleted-value-levelwon-src-mq3-client-ui-gameinfo-ml-1141770031"></a>
### UI_TierCompleted

```ml
function UI_TierCompleted(value, levelWon)
```

UI_TierCompleted

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `tier==UI_GetNumSPTiers(value)`, `training!=void and levelWon==numbers.atoi(info.value(training,"num"))` and additional values before the calculation continues. |
| `levelWon` | `dynamic` | — | Value used by `tier=numeric.trunc32(levelWon/ARENAS_PER_TIER)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_gameinfo.ml#L230)
