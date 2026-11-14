# `src/mq3/game/g_bot.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_bot`](Package-mq3-game-g-bot-2031739941.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/bot_clients.ml` as `clients` → [src/mq3/game/bot_clients.ml](File-src-mq3-game-bot-clients-ml-237353140.md)
- `mq3/game/bot_population.ml` as `population` → [src/mq3/game/bot_population.ml](File-src-mq3-game-bot-population-ml-383691011.md)
- `mq3/game/bot_registry.ml` as `registry` → [src/mq3/game/bot_registry.ml](File-src-mq3-game-bot-registry-ml-1422489899.md)
- `mq3/qcommon/cvar.ml` as `cv` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-g-bot-addbottospawnqueue-function-addbottospawnqueue-level-state-clientnum-delay-src-mq3-game-g-bot-ml-1069032111"></a>
### AddBotToSpawnQueue

```ml
function AddBotToSpawnQueue(level, state, clientNum, delay)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `delay` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L54)

<a id="constant-constant-mq3-game-g-bot-exec-append-const-exec-append-2-src-mq3-game-g-bot-ml-1171093705"></a>
### EXEC_APPEND

```ml
const EXEC_APPEND = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L16)

<a id="function-function-mq3-game-g-bot-g-addbot-function-g-addbot-level-state-name-skill-team-delay-altname-src-mq3-game-g-bot-ml-1615760839"></a>
### G_AddBot

```ml
function G_AddBot(level, state, name, skill, team, delay, altname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `skill` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `delay` | `dynamic` | — |  |
| `altname` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L58)

<a id="function-function-mq3-game-g-bot-g-addrandombot-function-g-addrandombot-level-state-team-src-mq3-game-g-bot-ml-1534982356"></a>
### G_AddRandomBot

```ml
function G_AddRandomBot(level, state, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L48)

<a id="function-function-mq3-game-g-bot-g-botconnect-function-g-botconnect-level-state-clientnum-restart-src-mq3-game-g-bot-ml-1395161799"></a>
### G_BotConnect

```ml
function G_BotConnect(level, state, clientNum, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L56)

<a id="function-function-mq3-game-g-bot-g-checkbotspawn-function-g-checkbotspawn-level-state-src-mq3-game-g-bot-ml-1281254331"></a>
### G_CheckBotSpawn

```ml
function G_CheckBotSpawn(level, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L53)

<a id="function-function-mq3-game-g-bot-g-checkminimumplayers-function-g-checkminimumplayers-level-state-src-mq3-game-g-bot-ml-1954748795"></a>
### G_CheckMinimumPlayers

```ml
function G_CheckMinimumPlayers(level, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L52)

<a id="function-function-mq3-game-g-bot-g-countbotplayers-function-g-countbotplayers-level-state-team-src-mq3-game-g-bot-ml-2045679224"></a>
### G_CountBotPlayers

```ml
function G_CountBotPlayers(level, state, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L51)

<a id="function-function-mq3-game-g-bot-g-counthumanplayers-function-g-counthumanplayers-level-team-src-mq3-game-g-bot-ml-1435536597"></a>
### G_CountHumanPlayers

```ml
function G_CountHumanPlayers(level, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L50)

<a id="function-function-mq3-game-g-bot-g-getarenainfobymap-function-g-getarenainfobymap-state-map-src-mq3-game-g-bot-ml-1620071901"></a>
### G_GetArenaInfoByMap

```ml
function G_GetArenaInfoByMap(state, map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L29)

<a id="function-function-mq3-game-g-bot-g-getbotinfobyname-function-g-getbotinfobyname-state-name-src-mq3-game-g-bot-ml-523730402"></a>
### G_GetBotInfoByName

```ml
function G_GetBotInfoByName(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L33)

<a id="function-function-mq3-game-g-bot-g-getbotinfobynumber-function-g-getbotinfobynumber-state-num-src-mq3-game-g-bot-ml-892898615"></a>
### G_GetBotInfoByNumber

```ml
function G_GetBotInfoByNumber(state, num)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `num` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L32)

<a id="function-function-mq3-game-g-bot-g-initbots-function-g-initbots-level-state-restart-mapname-botenable-botsfile-arenasfile-src-mq3-game-g-bot-ml-1729334231"></a>
### G_InitBots

```ml
function G_InitBots(level, state, restart, mapname, botEnable, botsFile, arenasFile)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |
| `mapname` | `dynamic` | — |  |
| `botEnable` | `dynamic` | — |  |
| `botsFile` | `dynamic` | — |  |
| `arenasFile` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L69)

<a id="function-function-mq3-game-g-bot-g-loadarenas-function-g-loadarenas-state-arenasfile-src-mq3-game-g-bot-ml-266316441"></a>
### G_LoadArenas

```ml
function G_LoadArenas(state, arenasFile)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `arenasFile` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L28)

<a id="function-function-mq3-game-g-bot-g-loadarenasfromfile-function-g-loadarenasfromfile-state-filename-src-mq3-game-g-bot-ml-2043826804"></a>
### G_LoadArenasFromFile

```ml
function G_LoadArenasFromFile(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L27)

<a id="function-function-mq3-game-g-bot-g-loadbots-function-g-loadbots-state-botenable-botsfile-src-mq3-game-g-bot-ml-1344246141"></a>
### G_LoadBots

```ml
function G_LoadBots(state, botEnable, botsFile)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `botEnable` | `dynamic` | — |  |
| `botsFile` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L31)

<a id="function-function-mq3-game-g-bot-g-loadbotsfromfile-function-g-loadbotsfromfile-state-filename-src-mq3-game-g-bot-ml-2131974176"></a>
### G_LoadBotsFromFile

```ml
function G_LoadBotsFromFile(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L30)

<a id="function-function-mq3-game-g-bot-g-parseinfos-function-g-parseinfos-state-buf-max-src-mq3-game-g-bot-ml-558908072"></a>
### G_ParseInfos

```ml
function G_ParseInfos(state, buf, max)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `buf` | `dynamic` | — |  |
| `max` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L26)

<a id="function-function-mq3-game-g-bot-g-removequeuedbotbegin-function-g-removequeuedbotbegin-state-clientnum-src-mq3-game-g-bot-ml-1766479324"></a>
### G_RemoveQueuedBotBegin

```ml
function G_RemoveQueuedBotBegin(state, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L55)

<a id="function-function-mq3-game-g-bot-g-removerandombot-function-g-removerandombot-level-state-team-src-mq3-game-g-bot-ml-656751656"></a>
### G_RemoveRandomBot

```ml
function G_RemoveRandomBot(level, state, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L49)

<a id="function-function-mq3-game-g-bot-g-spawnbots-function-g-spawnbots-level-state-botlist-basedelay-src-mq3-game-g-bot-ml-1506109632"></a>
### G_SpawnBots

```ml
function G_SpawnBots(level, state, botList, baseDelay)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `botList` | `dynamic` | — |  |
| `baseDelay` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L67)

<a id="function-function-mq3-game-g-bot-playerintrosound-function-playerintrosound-level-modelandskin-src-mq3-game-g-bot-ml-548189087"></a>
### PlayerIntroSound

```ml
function PlayerIntroSound(level, modelAndSkin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `modelAndSkin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L35)

<a id="function-function-mq3-game-g-bot-svcmd-addbot-f-function-svcmd-addbot-f-level-state-argv-src-mq3-game-g-bot-ml-1340016129"></a>
### Svcmd_AddBot_f

```ml
function Svcmd_AddBot_f(level, state, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L61)

<a id="function-function-mq3-game-g-bot-svcmd-botlist-f-function-svcmd-botlist-f-level-state-src-mq3-game-g-bot-ml-1651102971"></a>
### Svcmd_BotList_f

```ml
function Svcmd_BotList_f(level, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L66)

<a id="function-function-mq3-game-g-bot-trap-cvar-variablevalue-function-trap-cvar-variablevalue-level-var-name-src-mq3-game-g-bot-ml-1888003737"></a>
### trap_Cvar_VariableValue

```ml
function trap_Cvar_VariableValue(level, var_name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `var_name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_bot.ml#L18)
