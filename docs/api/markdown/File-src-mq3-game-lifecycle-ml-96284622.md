# `src/mq3/game/lifecycle.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.lifecycle`](Package-mq3-game-lifecycle-591003742.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/bodies.ml` as `bodies` → [src/mq3/game/bodies.ml](File-src-mq3-game-bodies-ml-247011888.md)
- `mq3/game/bot_ai_frame.ml` as `botAiFrame` → [src/mq3/game/bot_ai_frame.ml](File-src-mq3-game-bot-ai-frame-ml-144686062.md)
- `mq3/game/bot_client_resources.ml` as `botClientResources` → [src/mq3/game/bot_client_resources.ml](File-src-mq3-game-bot-client-resources-ml-1593961093.md)
- `mq3/game/bot_clients.ml` as `botClients` → [src/mq3/game/bot_clients.ml](File-src-mq3-game-bot-clients-ml-237353140.md)
- `mq3/game/bot_lifecycle.ml` as `bots` → [src/mq3/game/bot_lifecycle.ml](File-src-mq3-game-bot-lifecycle-ml-1736646636.md)
- `mq3/game/bot_population.ml` as `botPopulation` → [src/mq3/game/bot_population.ml](File-src-mq3-game-bot-population-ml-383691011.md)
- `mq3/game/bot_registry.ml` as `botRegistry` → [src/mq3/game/bot_registry.ml](File-src-mq3-game-bot-registry-ml-1422489899.md)
- `mq3/game/cvar_maintenance.ml` as `maintenance` → [src/mq3/game/cvar_maintenance.ml](File-src-mq3-game-cvar-maintenance-ml-54356974.md)
- `mq3/game/cvars.ml` as `gameCvars` → [src/mq3/game/cvars.ml](File-src-mq3-game-cvars-ml-718537019.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/g_bot.ml` as `gBot` → [src/mq3/game/g_bot.ml](File-src-mq3-game-g-bot-ml-1286040247.md)
- `mq3/game/g_client.ml` as `gClient` → [src/mq3/game/g_client.ml](File-src-mq3-game-g-client-ml-991769123.md)
- `mq3/game/g_items.ml` as `gItems` → [src/mq3/game/g_items.ml](File-src-mq3-game-g-items-ml-1981196396.md)
- `mq3/game/g_spawn.ml` as `gSpawn` → [src/mq3/game/g_spawn.ml](File-src-mq3-game-g-spawn-ml-1556105525.md)
- `mq3/game/initialization.ml` as `initialization` → [src/mq3/game/initialization.ml](File-src-mq3-game-initialization-ml-1982718888.md)
- `mq3/game/ip_filters.ml` as `ipFilters` → [src/mq3/game/ip_filters.ml](File-src-mq3-game-ip-filters-ml-868936231.md)
- `mq3/game/logging.ml` as `logging` → [src/mq3/game/logging.ml](File-src-mq3-game-logging-ml-1623089765.md)
- `mq3/game/memory.ml` as `memory` → [src/mq3/game/memory.ml](File-src-mq3-game-memory-ml-2117335517.md)
- `mq3/game/server_commands.ml` as `serverCommands` → [src/mq3/game/server_commands.ml](File-src-mq3-game-server-commands-ml-2072466884.md)
- `mq3/game/session.ml` as `sessions` → [src/mq3/game/session.ml](File-src-mq3-game-session-ml-1678952582.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/qcommon/cvar.ml` as `cv` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `mq3/server/world.ml` as `sv` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)
- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)

## Declarations

<a id="function-function-mq3-game-lifecycle-attach-function-attach-level-builddate-src-mq3-game-lifecycle-ml-352282580"></a>
### attach

```ml
function attach(level, buildDate)
```

Update `level.lifecycleState`, `level.randSeed`, `level.shaderRemaps` and `level.itemRegistered` and related state during `attach`. Return paths include `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `lifecycleState`, `spawner`, `observeFn`, `randSeed` and `shaderRemaps` and related fields. May update `level.lifecycleState`, `level.randSeed` and `level.shaderRemaps` and additional fields in place. |
| `buildDate` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L456)

<a id="function-function-mq3-game-lifecycle-checkbotspawn-function-checkbotspawn-level-src-mq3-game-lifecycle-ml-5910352"></a>
### checkBotSpawn

```ml
function checkBotSpawn(level)
```

Forward `checkBotSpawn` to `mq3.game.bot_clients.checkBotSpawn` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L326)

<a id="function-function-mq3-game-lifecycle-clearclients-function-clearclients-level-src-mq3-game-lifecycle-ml-457563868"></a>
### clearClients

```ml
function clearClients(level)
```

Apply `mq3.game.entities.resetClient` while evaluating `clearClients`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L447)

<a id="function-function-mq3-game-lifecycle-clearentities-function-clearentities-level-src-mq3-game-lifecycle-ml-102269176"></a>
### clearEntities

```ml
function clearEntities(level)
```

Set `level.scene.entities[index]` to `r` in `mq3.game.lifecycle.clearEntities`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities` and `scene`. May update `level.scene.entities[index]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L353)

<a id="function-function-mq3-game-lifecycle-clearlevel-function-clearlevel-level-src-mq3-game-lifecycle-ml-102405576"></a>
### clearLevel

```ml
function clearLevel(level)
```

Update `level.num_entities`, `level.time`, `level.startTime` and `level.previousTime` and related state during `clearLevel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities`, `time`, `startTime`, `previousTime` and `maxclients` and related fields. May update `level.num_entities`, `level.time` and `level.startTime` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L331)

<a id="function-function-mq3-game-lifecycle-cvareffect-function-cvareffect-cvarstate-kind-index-key-value-src-mq3-game-lifecycle-ml-1313783875"></a>
### cvarEffect

```ml
function cvarEffect(cvarState, kind, index, key, value)
```

Apply `mq3.game.lifecycle.get` and `mq3.game.lifecycle.gamePrint` while evaluating `cvarEffect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cvarState` | `dynamic` | — | Cvar state record; accesses `level`. |
| `kind` | `dynamic` | — | Value passed as argument 2 to `state.cvarEffectFn`. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `value` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L126)

<a id="function-function-mq3-game-lifecycle-defaultbotconnect-function-defaultbotconnect-level-slot-restart-src-mq3-game-lifecycle-ml-991028081"></a>
### defaultBotConnect

```ml
function defaultBotConnect(level, slot, restart)
```

Forward `defaultBotConnect` to `mq3.game.bot_clients.botConnect` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `state.userinfoFn`. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L306)

<a id="function-function-mq3-game-lifecycle-defaultbotshutdownclient-function-defaultbotshutdownclient-level-slot-restart-src-mq3-game-lifecycle-ml-1347082285"></a>
### defaultBotShutdownClient

```ml
function defaultBotShutdownClient(level, slot, restart)
```

Apply `mq3.game.lifecycle.get` while evaluating `defaultBotShutdownClient`. Return paths include `state.shutdownClientFn(state,slot,restart)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `lifecycleState`. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L319)

<a id="function-function-mq3-game-lifecycle-defaultinitbots-function-defaultinitbots-level-restart-src-mq3-game-lifecycle-ml-1050292139"></a>
### defaultInitBots

```ml
function defaultInitBots(level, restart)
```

Apply `mq3.game.lifecycle.get`, `mq3.qcommon.cvar.createVm` and `mq3.qcommon.cvar.registerVm` while evaluating `defaultInitBots`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L284)

<a id="function-function-mq3-game-lifecycle-defaultremovequeuedbotbegin-function-defaultremovequeuedbotbegin-level-slot-src-mq3-game-lifecycle-ml-925625176"></a>
### defaultRemoveQueuedBotBegin

```ml
function defaultRemoveQueuedBotBegin(level, slot)
```

Apply `mq3.game.bot_clients.removeQueuedBotBegin` and `mq3.game.lifecycle.get` while evaluating `defaultRemoveQueuedBotBegin`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `lifecycleState`. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L312)

<a id="function-function-mq3-game-lifecycle-entityobserve-function-entityobserve-level-kind-ent-src-mq3-game-lifecycle-ml-2140878675"></a>
### entityObserve

```ml
function entityObserve(level, kind, ent)
```

Apply `mq3.game.lifecycle.get` while evaluating `entityObserve`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities`. |
| `kind` | `dynamic` | — | Value passed as argument 2 to `state.entityObserveFn`. |
| `ent` | `dynamic` | — | Value passed as argument 3 to `state.entityObserveFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L148)

<a id="function-function-mq3-game-lifecycle-gameprint-function-gameprint-level-text-src-mq3-game-lifecycle-ml-827805307"></a>
### gamePrint

```ml
function gamePrint(level, text)
```

Use `level.gamePrintFn` to perform `gamePrint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L96)

<a id="function-function-mq3-game-lifecycle-get-function-get-level-src-mq3-game-lifecycle-ml-1450409996"></a>
### get

```ml
function get(level)
```

Require and return the module bindings attached to the game-level lifecycle state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `lifecycleState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L81)

<a id="function-function-mq3-game-lifecycle-init-function-init-level-leveltime-randomseed-restart-entitytext-src-mq3-game-lifecycle-ml-1486170376"></a>
### init

```ml
function init(level, levelTime, randomSeed, restart, entityText)
```

Update `level.spawner.parser`, `level.randSeed`, `level.time` and `level.startTime` and related state during `init`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `randSeed`, `time`, `startTime` and `sndFry` and related fields. May update `level.spawner.parser`, `level.randSeed` and `level.time` and additional fields in place. |
| `levelTime` | `dynamic` | — | Current server game time in milliseconds. |
| `randomSeed` | `dynamic` | — | State used to initialize the deterministic random sequence. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |
| `entityText` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L504)

<a id="function-function-mq3-game-lifecycle-integervalue-function-integervalue-level-name-src-mq3-game-lifecycle-ml-1376039701"></a>
### integerValue

```ml
function integerValue(level, name)
```

Apply `mq3.qcommon.cvar.find` and `mq3.game.lifecycle.get` while evaluating `integerValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L113)

<a id="function-function-mq3-game-lifecycle-populationaddcommand-function-populationaddcommand-level-argv-src-mq3-game-lifecycle-ml-2112799042"></a>
### populationAddCommand

```ml
function populationAddCommand(level, argv)
```

Apply `mq3.game.lifecycle.get`, `mq3.game.lifecycle.integerValue` and `mq3.qcommon.cvar.find` while evaluating `populationAddCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L268)

<a id="function-function-mq3-game-lifecycle-populationallocate-function-populationallocate-level-src-mq3-game-lifecycle-ml-394985472"></a>
### populationAllocate

```ml
function populationAllocate(level)
```

Apply `mq3.game.lifecycle.get` while evaluating `populationAllocate`. Return paths include `callback(level)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `lifecycleState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L260)

<a id="function-function-mq3-game-lifecycle-populationconnect-function-populationconnect-level-slot-firsttime-isbot-src-mq3-game-lifecycle-ml-1127824582"></a>
### populationConnect

```ml
function populationConnect(level, slot, firstTime, isBot)
```

Forward `populationConnect` to `mq3.game.g_client.ClientConnect` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`, `userinfoFn`, `filterPacketFn`, `cvarMaintenance` and `clients` and related fields. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |
| `firstTime` | `dynamic` | — | Value used by `connect` in `if firstTime or level.newSession then sessions.initClient(level,client,info) end if`. |
| `isBot` | `dynamic` | — | Value used by `connect` in `if isBot then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L255)

<a id="function-function-mq3-game-lifecycle-populationconsole-function-populationconsole-level-mode-text-src-mq3-game-lifecycle-ml-1842504268"></a>
### populationConsole

```ml
function populationConsole(level, mode, text)
```

Use `level.consoleCommandFn` to perform `populationConsole`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `consoleCommandFn`. |
| `mode` | `dynamic` | — | Value passed as argument 2 to `level.consoleCommandFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L222)

<a id="function-function-mq3-game-lifecycle-populationcvarset-function-populationcvarset-level-key-value-src-mq3-game-lifecycle-ml-422911226"></a>
### populationCvarSet

```ml
function populationCvarSet(level, key, value)
```

Use `level.cvarSetFn` to perform `populationCvarSet`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cvarSetFn`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `value` | `dynamic` | — | Value passed as argument 3 to `level.cvarSetFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L238)

<a id="function-function-mq3-game-lifecycle-populationlistcommand-function-populationlistcommand-level-argv-src-mq3-game-lifecycle-ml-1873204558"></a>
### populationListCommand

```ml
function populationListCommand(level, argv)
```

Apply `mq3.game.g_bot.Svcmd_BotList_f` and `mq3.game.lifecycle.get` while evaluating `populationListCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `state.printFn`. |
| `argv` | `dynamic` | — | Not read by this implementation; retained in the `populationListCommand` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L278)

<a id="function-function-mq3-game-lifecycle-populationminimum-function-populationminimum-level-src-mq3-game-lifecycle-ml-1735572222"></a>
### populationMinimum

```ml
function populationMinimum(level)
```

Forward `populationMinimum` to `mq3.game.bot_population.checkMinimumPlayers` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermissiontime`, `time`, `spawner` and `maxclients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L209)

<a id="function-function-mq3-game-lifecycle-populationprint-function-populationprint-level-text-src-mq3-game-lifecycle-ml-1013114725"></a>
### populationPrint

```ml
function populationPrint(level, text)
```

Forward `populationPrint` to `mq3.game.lifecycle.gamePrint` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L215)

<a id="function-function-mq3-game-lifecycle-populationserver-function-populationserver-level-slot-text-src-mq3-game-lifecycle-ml-895866421"></a>
### populationServer

```ml
function populationServer(level, slot, text)
```

Use `level.serverCommandFn` to perform `populationServer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `serverCommandFn`. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L230)

<a id="function-function-mq3-game-lifecycle-populationsetuserinfo-function-populationsetuserinfo-level-slot-value-src-mq3-game-lifecycle-ml-1553682655"></a>
### populationSetUserinfo

```ml
function populationSetUserinfo(level, slot, value)
```

Use `level.userinfoSetFn` to perform `populationSetUserinfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `userinfoSetFn`. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |
| `value` | `dynamic` | — | Value passed as argument 3 to `level.userinfoSetFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L246)

<a id="function-function-mq3-game-lifecycle-queuedbotbegin-function-queuedbotbegin-level-slot-src-mq3-game-lifecycle-ml-1405605288"></a>
### queuedBotBegin

```ml
function queuedBotBegin(level, slot)
```

Use `level.clientBeginFn` to perform `queuedBotBegin`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clientBeginFn`. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L173)

<a id="function-function-mq3-game-lifecycle-queuedbotdrop-function-queuedbotdrop-level-slot-message-src-mq3-game-lifecycle-ml-946538783"></a>
### queuedBotDrop

```ml
function queuedBotDrop(level, slot, message)
```

Use `level.dropClientFn` to perform `queuedBotDrop`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `dropClientFn`. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L181)

<a id="function-function-mq3-game-lifecycle-queuedbotprint-function-queuedbotprint-level-text-src-mq3-game-lifecycle-ml-270359101"></a>
### queuedBotPrint

```ml
function queuedBotPrint(level, text)
```

Forward `queuedBotPrint` to `mq3.game.lifecycle.gamePrint` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L188)

<a id="function-function-mq3-game-lifecycle-queuedbotuserinfo-function-queuedbotuserinfo-level-slot-src-mq3-game-lifecycle-ml-786508046"></a>
### queuedBotUserinfo

```ml
function queuedBotUserinfo(level, slot)
```

Use `level.userinfoFn` to perform `queuedBotUserinfo`. Return paths include `level.userinfoFn(level,slot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `userinfoFn`. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L166)

<a id="function-function-mq3-game-lifecycle-registryprint-function-registryprint-level-text-src-mq3-game-lifecycle-ml-1889840205"></a>
### registryPrint

```ml
function registryPrint(level, text)
```

Forward `registryPrint` to `mq3.game.lifecycle.gamePrint` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L160)

<a id="function-function-mq3-game-lifecycle-resourcebotsetup-function-resourcebotsetup-level-slot-settings-restart-src-mq3-game-lifecycle-ml-906963812"></a>
### resourceBotSetup

```ml
function resourceBotSetup(level, slot, settings, restart)
```

Forward `resourceBotSetup` to `mq3.game.bot_client_resources.setupClient` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `lifecycleState`. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |
| `settings` | `dynamic` | — | Settings record; accesses `characterfile`, `skill` and `team`. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L196)

<a id="function-function-mq3-game-lifecycle-resourcebotshutdown-function-resourcebotshutdown-state-slot-restart-src-mq3-game-lifecycle-ml-2053185676"></a>
### resourceBotShutdown

```ml
function resourceBotShutdown(state, slot, restart)
```

Apply `mq3.game.bot_client_resources.shutdownClient` while evaluating `resourceBotShutdown`. Return paths include `botClientResources.shutdownClient(state.clientResources,slot,restart)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Lifecycle state; accesses `clientResources`. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L203)

<a id="function-function-mq3-game-lifecycle-shutdown-function-shutdown-level-restart-src-mq3-game-lifecycle-ml-405171057"></a>
### shutdown

```ml
function shutdown(level, restart)
```

Apply `mq3.game.lifecycle.get`, `mq3.game.lifecycle.gamePrint` and `mq3.game.logging.write` while evaluating `shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `logFile`. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L565)

<a id="function-function-mq3-game-lifecycle-spawneffect-function-spawneffect-spawner-kind-index-key-value-src-mq3-game-lifecycle-ml-1787822708"></a>
### spawnEffect

```ml
function spawnEffect(spawner, kind, index, key, value)
```

Apply `mq3.game.lifecycle.get` and `mq3.game.logging.write` while evaluating `spawnEffect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `spawner` | `dynamic` | — | Spawner record; accesses `level`. |
| `kind` | `dynamic` | — | Value passed as argument 2 to `state.spawnEffectFn`. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L138)

<a id="function-function-mq3-game-lifecycle-startbotframe-function-startbotframe-level-time-src-mq3-game-lifecycle-ml-239923783"></a>
### startBotFrame

```ml
function startBotFrame(level, time)
```

Apply `mq3.game.lifecycle.get` and `mq3.game.bot_ai_frame.startFrame` while evaluating `startBotFrame`. Return paths include `botAiFrame.startFrame(level,state.botAiFrame,time)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `lifecycleState`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L88)

- [mq3.game.lifecycle.State](Type-mq3-game-lifecycle-state-475950533.md) — struct
<a id="function-function-mq3-game-lifecycle-vm-function-vm-level-name-src-mq3-game-lifecycle-ml-1701472661"></a>
### vm

```ml
function vm(level, name)
```

Apply `mq3.game.cvars.moduleState` while evaluating `vm`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gameCvars`. |
| `name` | `dynamic` | — | Lookup text matched against `row.vmName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L104)
