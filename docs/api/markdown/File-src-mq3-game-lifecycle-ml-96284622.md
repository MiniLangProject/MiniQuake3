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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `buildDate` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L319)

<a id="function-function-mq3-game-lifecycle-checkbotspawn-function-checkbotspawn-level-src-mq3-game-lifecycle-ml-5910352"></a>
### checkBotSpawn

```ml
function checkBotSpawn(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L198)

<a id="function-function-mq3-game-lifecycle-clearclients-function-clearclients-level-src-mq3-game-lifecycle-ml-457563868"></a>
### clearClients

```ml
function clearClients(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L313)

<a id="function-function-mq3-game-lifecycle-clearentities-function-clearentities-level-src-mq3-game-lifecycle-ml-102269176"></a>
### clearEntities

```ml
function clearEntities(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L221)

<a id="function-function-mq3-game-lifecycle-clearlevel-function-clearlevel-level-src-mq3-game-lifecycle-ml-102405576"></a>
### clearLevel

```ml
function clearLevel(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L201)

<a id="function-function-mq3-game-lifecycle-cvareffect-function-cvareffect-cvarstate-kind-index-key-value-src-mq3-game-lifecycle-ml-1313783875"></a>
### cvarEffect

```ml
function cvarEffect(cvarState, kind, index, key, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cvarState` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L83)

<a id="function-function-mq3-game-lifecycle-defaultbotconnect-function-defaultbotconnect-level-slot-restart-src-mq3-game-lifecycle-ml-991028081"></a>
### defaultBotConnect

```ml
function defaultBotConnect(level, slot, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L187)

<a id="function-function-mq3-game-lifecycle-defaultbotshutdownclient-function-defaultbotshutdownclient-level-slot-restart-src-mq3-game-lifecycle-ml-1347082285"></a>
### defaultBotShutdownClient

```ml
function defaultBotShutdownClient(level, slot, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L193)

<a id="function-function-mq3-game-lifecycle-defaultinitbots-function-defaultinitbots-level-restart-src-mq3-game-lifecycle-ml-1050292139"></a>
### defaultInitBots

```ml
function defaultInitBots(level, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L169)

<a id="function-function-mq3-game-lifecycle-defaultremovequeuedbotbegin-function-defaultremovequeuedbotbegin-level-slot-src-mq3-game-lifecycle-ml-925625176"></a>
### defaultRemoveQueuedBotBegin

```ml
function defaultRemoveQueuedBotBegin(level, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L190)

<a id="function-function-mq3-game-lifecycle-entityobserve-function-entityobserve-level-kind-ent-src-mq3-game-lifecycle-ml-2140878675"></a>
### entityObserve

```ml
function entityObserve(level, kind, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L95)

<a id="function-function-mq3-game-lifecycle-gameprint-function-gameprint-level-text-src-mq3-game-lifecycle-ml-827805307"></a>
### gamePrint

```ml
function gamePrint(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L65)

<a id="function-function-mq3-game-lifecycle-get-function-get-level-src-mq3-game-lifecycle-ml-1450409996"></a>
### get

```ml
function get(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L56)

<a id="function-function-mq3-game-lifecycle-init-function-init-level-leveltime-randomseed-restart-entitytext-src-mq3-game-lifecycle-ml-1486170376"></a>
### init

```ml
function init(level, levelTime, randomSeed, restart, entityText)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `levelTime` | `dynamic` | — |  |
| `randomSeed` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |
| `entityText` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L361)

<a id="function-function-mq3-game-lifecycle-integervalue-function-integervalue-level-name-src-mq3-game-lifecycle-ml-1376039701"></a>
### integerValue

```ml
function integerValue(level, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L76)

<a id="function-function-mq3-game-lifecycle-populationaddcommand-function-populationaddcommand-level-argv-src-mq3-game-lifecycle-ml-2112799042"></a>
### populationAddCommand

```ml
function populationAddCommand(level, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L159)

<a id="function-function-mq3-game-lifecycle-populationallocate-function-populationallocate-level-src-mq3-game-lifecycle-ml-394985472"></a>
### populationAllocate

```ml
function populationAllocate(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L154)

<a id="function-function-mq3-game-lifecycle-populationconnect-function-populationconnect-level-slot-firsttime-isbot-src-mq3-game-lifecycle-ml-1127824582"></a>
### populationConnect

```ml
function populationConnect(level, slot, firstTime, isBot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `firstTime` | `dynamic` | — |  |
| `isBot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L151)

<a id="function-function-mq3-game-lifecycle-populationconsole-function-populationconsole-level-mode-text-src-mq3-game-lifecycle-ml-1842504268"></a>
### populationConsole

```ml
function populationConsole(level, mode, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L135)

<a id="function-function-mq3-game-lifecycle-populationcvarset-function-populationcvarset-level-key-value-src-mq3-game-lifecycle-ml-422911226"></a>
### populationCvarSet

```ml
function populationCvarSet(level, key, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L143)

<a id="function-function-mq3-game-lifecycle-populationlistcommand-function-populationlistcommand-level-argv-src-mq3-game-lifecycle-ml-1873204558"></a>
### populationListCommand

```ml
function populationListCommand(level, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L166)

<a id="function-function-mq3-game-lifecycle-populationminimum-function-populationminimum-level-src-mq3-game-lifecycle-ml-1735572222"></a>
### populationMinimum

```ml
function populationMinimum(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L129)

<a id="function-function-mq3-game-lifecycle-populationprint-function-populationprint-level-text-src-mq3-game-lifecycle-ml-1013114725"></a>
### populationPrint

```ml
function populationPrint(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L132)

<a id="function-function-mq3-game-lifecycle-populationserver-function-populationserver-level-slot-text-src-mq3-game-lifecycle-ml-895866421"></a>
### populationServer

```ml
function populationServer(level, slot, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L139)

<a id="function-function-mq3-game-lifecycle-populationsetuserinfo-function-populationsetuserinfo-level-slot-value-src-mq3-game-lifecycle-ml-1553682655"></a>
### populationSetUserinfo

```ml
function populationSetUserinfo(level, slot, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L147)

<a id="function-function-mq3-game-lifecycle-queuedbotbegin-function-queuedbotbegin-level-slot-src-mq3-game-lifecycle-ml-1405605288"></a>
### queuedBotBegin

```ml
function queuedBotBegin(level, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L111)

<a id="function-function-mq3-game-lifecycle-queuedbotdrop-function-queuedbotdrop-level-slot-message-src-mq3-game-lifecycle-ml-946538783"></a>
### queuedBotDrop

```ml
function queuedBotDrop(level, slot, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L115)

<a id="function-function-mq3-game-lifecycle-queuedbotprint-function-queuedbotprint-level-text-src-mq3-game-lifecycle-ml-270359101"></a>
### queuedBotPrint

```ml
function queuedBotPrint(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L119)

<a id="function-function-mq3-game-lifecycle-queuedbotuserinfo-function-queuedbotuserinfo-level-slot-src-mq3-game-lifecycle-ml-786508046"></a>
### queuedBotUserinfo

```ml
function queuedBotUserinfo(level, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L107)

<a id="function-function-mq3-game-lifecycle-registryprint-function-registryprint-level-text-src-mq3-game-lifecycle-ml-1889840205"></a>
### registryPrint

```ml
function registryPrint(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L104)

<a id="function-function-mq3-game-lifecycle-resourcebotsetup-function-resourcebotsetup-level-slot-settings-restart-src-mq3-game-lifecycle-ml-906963812"></a>
### resourceBotSetup

```ml
function resourceBotSetup(level, slot, settings, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L122)

<a id="function-function-mq3-game-lifecycle-resourcebotshutdown-function-resourcebotshutdown-state-slot-restart-src-mq3-game-lifecycle-ml-2053185676"></a>
### resourceBotShutdown

```ml
function resourceBotShutdown(state, slot, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L125)

<a id="function-function-mq3-game-lifecycle-shutdown-function-shutdown-level-restart-src-mq3-game-lifecycle-ml-405171057"></a>
### shutdown

```ml
function shutdown(level, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L419)

<a id="function-function-mq3-game-lifecycle-spawneffect-function-spawneffect-spawner-kind-index-key-value-src-mq3-game-lifecycle-ml-1787822708"></a>
### spawnEffect

```ml
function spawnEffect(spawner, kind, index, key, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `spawner` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L89)

<a id="function-function-mq3-game-lifecycle-startbotframe-function-startbotframe-level-time-src-mq3-game-lifecycle-ml-239923783"></a>
### startBotFrame

```ml
function startBotFrame(level, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L60)

- [mq3.game.lifecycle.State](Type-mq3-game-lifecycle-state-475950533.md) — struct
<a id="function-function-mq3-game-lifecycle-vm-function-vm-level-name-src-mq3-game-lifecycle-ml-1701472661"></a>
### vm

```ml
function vm(level, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L70)
