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

Forward `AddBotToSpawnQueue` to `mq3.game.bot_clients.addBotToSpawnQueue` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `state` | `dynamic` | — | Bot clients state; accesses `queue`, `printFn` and `clientBeginFn`. |
| `clientNum` | `dynamic` | — | Client slot number. |
| `delay` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.add32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L113)

<a id="constant-constant-mq3-game-g-bot-exec-append-const-exec-append-2-src-mq3-game-g-bot-ml-1171093705"></a>
### EXEC_APPEND

```ml
const EXEC_APPEND = 2
```

Console-command execution mode selecting append scheduling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L17)

<a id="function-function-mq3-game-g-bot-g-addbot-function-g-addbot-level-state-name-skill-team-delay-altname-src-mq3-game-g-bot-ml-1615760839"></a>
### G_AddBot

```ml
function G_AddBot(level, state, name, skill, team, delay, altname)
```

Forward `G_AddBot` to `mq3.game.bot_population.addBot` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`, `spawner` and `entities`. |
| `state` | `dynamic` | — | Bot population state; accesses `registry`, `allocateClientFn`, `setUserinfoFn`, `connectClientFn` and `clients`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `skill` | `dynamic` | — | Bot skill value used to select or interpolate characteristics. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `delay` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.add32`. |
| `altname` | `dynamic` | — | Value used by `addBot` in `if altname != void and altname != "" then botname = altname end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L133)

<a id="function-function-mq3-game-g-bot-g-addrandombot-function-g-addrandombot-level-state-team-src-mq3-game-g-bot-ml-1534982356"></a>
### G_AddRandomBot

```ml
function G_AddRandomBot(level, state, team)
```

Forward `G_AddRandomBot` to `mq3.game.bot_population.addRandomBot` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |
| `state` | `dynamic` | — | Bot population state; accesses `registry` and `spSkill`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L85)

<a id="function-function-mq3-game-g-bot-g-botconnect-function-g-botconnect-level-state-clientnum-restart-src-mq3-game-g-bot-ml-1395161799"></a>
### G_BotConnect

```ml
function G_BotConnect(level, state, clientNum, restart)
```

Forward `G_BotConnect` to `mq3.game.bot_clients.botConnect` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `state.userinfoFn`. |
| `state` | `dynamic` | — | Bot clients state; accesses `userinfoFn`, `setupClientFn` and `dropClientFn`. |
| `clientNum` | `dynamic` | — | Client slot number. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L123)

<a id="function-function-mq3-game-g-bot-g-checkbotspawn-function-g-checkbotspawn-level-state-src-mq3-game-g-bot-ml-1281254331"></a>
### G_CheckBotSpawn

```ml
function G_CheckBotSpawn(level, state)
```

Forward `G_CheckBotSpawn` to `mq3.game.bot_clients.checkBotSpawn` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `state` | `dynamic` | — | Bot clients state; accesses `minimumPlayersFn` and `queue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L107)

<a id="function-function-mq3-game-g-bot-g-checkminimumplayers-function-g-checkminimumplayers-level-state-src-mq3-game-g-bot-ml-1954748795"></a>
### G_CheckMinimumPlayers

```ml
function G_CheckMinimumPlayers(level, state)
```

Forward `G_CheckMinimumPlayers` to `mq3.game.bot_population.checkMinimumPlayers` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermissiontime`, `time`, `spawner` and `maxclients`. |
| `state` | `dynamic` | — | Bot population state; accesses `checkTime`, `minimumVm`, `minimumPlayers` and `clients`. May update `state.checkTime` and `state.minimumPlayers` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L103)

<a id="function-function-mq3-game-g-bot-g-countbotplayers-function-g-countbotplayers-level-state-team-src-mq3-game-g-bot-ml-2045679224"></a>
### G_CountBotPlayers

```ml
function G_CountBotPlayers(level, state, team)
```

Forward `G_CountBotPlayers` to `mq3.game.bot_clients.countBotPlayers` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients` and `time`. |
| `state` | `dynamic` | — | Bot clients state; accesses `queue`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L99)

<a id="function-function-mq3-game-g-bot-g-counthumanplayers-function-g-counthumanplayers-level-team-src-mq3-game-g-bot-ml-1435536597"></a>
### G_CountHumanPlayers

```ml
function G_CountHumanPlayers(level, team)
```

Forward `G_CountHumanPlayers` to `mq3.game.bot_clients.countHumanPlayers` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L94)

<a id="function-function-mq3-game-g-bot-g-getarenainfobymap-function-g-getarenainfobymap-state-map-src-mq3-game-g-bot-ml-1620071901"></a>
### G_GetArenaInfoByMap

```ml
function G_GetArenaInfoByMap(state, map)
```

Forward `G_GetArenaInfoByMap` to `mq3.game.bot_registry.getArenaInfoByMap` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `arenaInfos`. |
| `map` | `dynamic` | — | Value passed as argument 2 to `std.string.equalsIgnoreCaseAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L46)

<a id="function-function-mq3-game-g-bot-g-getbotinfobyname-function-g-getbotinfobyname-state-name-src-mq3-game-g-bot-ml-523730402"></a>
### G_GetBotInfoByName

```ml
function G_GetBotInfoByName(state, name)
```

Forward `G_GetBotInfoByName` to `mq3.game.bot_registry.getBotInfoByName` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `botInfos`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L63)

<a id="function-function-mq3-game-g-bot-g-getbotinfobynumber-function-g-getbotinfobynumber-state-num-src-mq3-game-g-bot-ml-892898615"></a>
### G_GetBotInfoByNumber

```ml
function G_GetBotInfoByNumber(state, num)
```

Forward `G_GetBotInfoByNumber` to `mq3.game.bot_registry.getBotInfoByNumber` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `botInfos`. |
| `num` | `dynamic` | — | Value passed as argument 1 to `str`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L59)

<a id="function-function-mq3-game-g-bot-g-initbots-function-g-initbots-level-state-restart-mapname-botenable-botsfile-arenasfile-src-mq3-game-g-bot-ml-1729334231"></a>
### G_InitBots

```ml
function G_InitBots(level, state, restart, mapname, botEnable, botsFile, arenasFile)
```

Apply `mq3.game.g_bot.G_LoadBots`, `mq3.game.g_bot.G_LoadArenas` and `mq3.game.bot_population.initSinglePlayer` while evaluating `G_InitBots`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `state` | `dynamic` | — | G bot state; accesses `registry`. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |
| `mapname` | `dynamic` | — | Value passed as argument 2 to `std.string.equalsIgnoreCaseAscii`. |
| `botEnable` | `dynamic` | — | Value used by `loadBots` in `if not botEnable then return void end if`. |
| `botsFile` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `arenasFile` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L164)

<a id="function-function-mq3-game-g-bot-g-loadarenas-function-g-loadarenas-state-arenasfile-src-mq3-game-g-bot-ml-266316441"></a>
### G_LoadArenas

```ml
function G_LoadArenas(state, arenasFile)
```

Forward `G_LoadArenas` to `mq3.game.bot_registry.loadArenas` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `arenaInfos`, `context` and `printFn`. May update `state.arenaInfos` in place. |
| `arenasFile` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L42)

<a id="function-function-mq3-game-g-bot-g-loadarenasfromfile-function-g-loadarenasfromfile-state-filename-src-mq3-game-g-bot-ml-2043826804"></a>
### G_LoadArenasFromFile

```ml
function G_LoadArenasFromFile(state, filename)
```

Forward `G_LoadArenasFromFile` to `mq3.game.bot_registry.loadArenasFromFile` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `arenaInfos`. May update `state.arenaInfos` in place. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L38)

<a id="function-function-mq3-game-g-bot-g-loadbots-function-g-loadbots-state-botenable-botsfile-src-mq3-game-g-bot-ml-1344246141"></a>
### G_LoadBots

```ml
function G_LoadBots(state, botEnable, botsFile)
```

Forward `G_LoadBots` to `mq3.game.bot_registry.loadBots` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `botInfos`. May update `state.botInfos` in place. |
| `botEnable` | `dynamic` | — | Value used by `loadBots` in `if not botEnable then return void end if`. |
| `botsFile` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L55)

<a id="function-function-mq3-game-g-bot-g-loadbotsfromfile-function-g-loadbotsfromfile-state-filename-src-mq3-game-g-bot-ml-2131974176"></a>
### G_LoadBotsFromFile

```ml
function G_LoadBotsFromFile(state, filename)
```

Forward `G_LoadBotsFromFile` to `mq3.game.bot_registry.loadBotsFromFile` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `botInfos`. May update `state.botInfos` in place. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L50)

<a id="function-function-mq3-game-g-bot-g-parseinfos-function-g-parseinfos-state-buf-max-src-mq3-game-g-bot-ml-558908072"></a>
### G_ParseInfos

```ml
function G_ParseInfos(state, buf, max)
```

Forward `G_ParseInfos` to `mq3.game.bot_registry.parseInfos` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot registry state; accesses `context` and `printFn`. |
| `buf` | `dynamic` | — | Text to parse, format or deliver. |
| `max` | `dynamic` | — | Value used by `parseInfos` in `if max < 0 then return error(490,"Negative info capacity") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L34)

<a id="function-function-mq3-game-g-bot-g-removequeuedbotbegin-function-g-removequeuedbotbegin-state-clientnum-src-mq3-game-g-bot-ml-1766479324"></a>
### G_RemoveQueuedBotBegin

```ml
function G_RemoveQueuedBotBegin(state, clientNum)
```

Forward `G_RemoveQueuedBotBegin` to `mq3.game.bot_clients.removeQueuedBotBegin` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot clients state; accesses `queue`. |
| `clientNum` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L117)

<a id="function-function-mq3-game-g-bot-g-removerandombot-function-g-removerandombot-level-state-team-src-mq3-game-g-bot-ml-656751656"></a>
### G_RemoveRandomBot

```ml
function G_RemoveRandomBot(level, state, team)
```

Forward `G_RemoveRandomBot` to `mq3.game.bot_population.removeRandomBot` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |
| `state` | `dynamic` | — | Bot population state; accesses `consoleFn`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L90)

<a id="function-function-mq3-game-g-bot-g-spawnbots-function-g-spawnbots-level-state-botlist-basedelay-src-mq3-game-g-bot-ml-1506109632"></a>
### G_SpawnBots

```ml
function G_SpawnBots(level, state, botList, baseDelay)
```

Forward `G_SpawnBots` to `mq3.game.bot_population.spawnBots` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `state.consoleFn`. |
| `state` | `dynamic` | — | Bot population state; accesses `spSkill` and `cvarSetFn`. May update `state.spSkill` in place. |
| `botList` | `dynamic` | — | Text to parse, format or deliver. |
| `baseDelay` | `dynamic` | — | Value used by `spawnBots` in `delay = baseDelay`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L154)

<a id="function-function-mq3-game-g-bot-playerintrosound-function-playerintrosound-level-modelandskin-src-mq3-game-g-bot-ml-548189087"></a>
### PlayerIntroSound

```ml
function PlayerIntroSound(level, modelAndSkin)
```

Use `level.consoleCommandFn` to perform `PlayerIntroSound`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `consoleCommandFn`. |
| `modelAndSkin` | `dynamic` | — | Value used by `PlayerIntroSound` in `model = modelAndSkin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L68)

<a id="function-function-mq3-game-g-bot-svcmd-addbot-f-function-svcmd-addbot-f-level-state-argv-src-mq3-game-g-bot-ml-1340016129"></a>
### Svcmd_AddBot_f

```ml
function Svcmd_AddBot_f(level, state, argv)
```

Apply `mq3.game.bot_population.serviceAddBot` while evaluating `Svcmd_AddBot_f`. Return paths include `population.serviceAddBot(level,state,args)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time` and `startTime`. |
| `state` | `dynamic` | — | Bot population state; accesses `botEnable`, `clRunning` and `serverCommandFn`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L140)

<a id="function-function-mq3-game-g-bot-svcmd-botlist-f-function-svcmd-botlist-f-level-state-src-mq3-game-g-bot-ml-1651102971"></a>
### Svcmd_BotList_f

```ml
function Svcmd_BotList_f(level, state)
```

Forward `Svcmd_BotList_f` to `mq3.game.bot_population.botList` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `state.printFn`. |
| `state` | `dynamic` | — | Bot population state; accesses `registry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L148)

<a id="function-function-mq3-game-g-bot-trap-cvar-variablevalue-function-trap-cvar-variablevalue-level-var-name-src-mq3-game-g-bot-ml-1888003737"></a>
### trap_Cvar_VariableValue

```ml
function trap_Cvar_VariableValue(level, var_name)
```

Apply `mq3.qcommon.cvar.find` while evaluating `trap_Cvar_VariableValue`. Return paths include `numbers.atof32(variable.string)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `var_name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_bot.ml#L22)
