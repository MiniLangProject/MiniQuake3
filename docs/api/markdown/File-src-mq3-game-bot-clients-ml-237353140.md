# `src/mq3/game/bot_clients.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_clients`](Package-mq3-game-bot-clients-1896617376.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textNumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-game-bot-clients-addbottospawnqueue-function-addbottospawnqueue-level-state-clientnum-delay-src-mq3-game-bot-clients-ml-686101259"></a>
### addBotToSpawnQueue

```ml
function addBotToSpawnQueue(level, state, clientNum, delay)
```

Use `state.printFn` and `state.clientBeginFn` to perform `addBotToSpawnQueue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `state` | `dynamic` | — | Bot clients state; accesses `queue`, `printFn` and `clientBeginFn`. |
| `clientNum` | `dynamic` | — | Client slot number. |
| `delay` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.add32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L105)

<a id="function-function-mq3-game-bot-clients-beginclient-function-beginclient-level-state-entry-src-mq3-game-bot-clients-ml-385927613"></a>
### beginClient

```ml
function beginClient(level, state, entry)
```

Set `entry.spawnTime` to `0` in `mq3.game.bot_clients.beginClient`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `state` | `dynamic` | — | Bot clients state; accesses `clientBeginFn`, `userinfoFn` and `introSoundFn`. |
| `entry` | `dynamic` | — | Entry record; accesses `clientNum` and `spawnTime`. May update `entry.spawnTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L135)

<a id="constant-constant-mq3-game-bot-clients-bot-spawn-queue-depth-const-bot-spawn-queue-depth-16-src-mq3-game-bot-clients-ml-1842660522"></a>
### BOT_SPAWN_QUEUE_DEPTH

```ml
const BOT_SPAWN_QUEUE_DEPTH = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L12)

<a id="function-function-mq3-game-bot-clients-botconnect-function-botconnect-level-state-clientnum-restart-src-mq3-game-bot-clients-ml-520021791"></a>
### botConnect

```ml
function botConnect(level, state, clientNum, restart)
```

Use `state.userinfoFn`, `state.setupClientFn` and `state.dropClientFn` to perform `botConnect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `state.userinfoFn`. |
| `state` | `dynamic` | — | Bot clients state; accesses `userinfoFn`, `setupClientFn` and `dropClientFn`. |
| `clientNum` | `dynamic` | — | Client slot number. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L169)

- [mq3.game.bot_clients.BotSettings](Type-mq3-game-bot-clients-botsettings-1293764382.md) — struct
<a id="function-function-mq3-game-bot-clients-checkbotspawn-function-checkbotspawn-level-state-src-mq3-game-bot-clients-ml-116352531"></a>
### checkBotSpawn

```ml
function checkBotSpawn(level, state)
```

Use `state.minimumPlayersFn` to perform `checkBotSpawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `state` | `dynamic` | — | Bot clients state; accesses `minimumPlayersFn` and `queue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L151)

<a id="function-function-mq3-game-bot-clients-clientlimit-function-clientlimit-level-src-mq3-game-bot-clients-ml-391383348"></a>
### clientLimit

```ml
function clientLimit(level)
```

Validate the level's bot client range against the native sixty-four-client limit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L48)

<a id="constant-constant-mq3-game-bot-clients-con-connected-const-con-connected-2-src-mq3-game-bot-clients-ml-789366867"></a>
### CON_CONNECTED

```ml
const CON_CONNECTED = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L9)

<a id="function-function-mq3-game-bot-clients-countbotplayers-function-countbotplayers-level-state-team-src-mq3-game-bot-clients-ml-1415271368"></a>
### countBotPlayers

```ml
function countBotPlayers(level, state, team)
```

Apply `mq3.game.bot_clients.clientLimit` and `mq3.game.bot_clients.entityForClient` while evaluating `countBotPlayers`. Return paths include `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients` and `time`. |
| `state` | `dynamic` | — | Bot clients state; accesses `queue`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L81)

<a id="function-function-mq3-game-bot-clients-counthumanplayers-function-counthumanplayers-level-team-src-mq3-game-bot-clients-ml-2039272071"></a>
### countHumanPlayers

```ml
function countHumanPlayers(level, team)
```

Apply `mq3.game.bot_clients.clientLimit` and `mq3.game.bot_clients.entityForClient` while evaluating `countHumanPlayers`. Return paths include `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L65)

<a id="function-function-mq3-game-bot-clients-create-function-create-src-mq3-game-bot-clients-ml-834113734"></a>
### create

```ml
function create()
```

Build the `mq3.game.bot_clients.State` result for `create`. Return paths include `State(queue,void,void,void,void,void,void,void)`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L38)

<a id="function-function-mq3-game-bot-clients-entityforclient-function-entityforclient-level-client-src-mq3-game-bot-clients-ml-219907003"></a>
### entityForClient

```ml
function entityForClient(level, client)
```

Resolve a client player-state entity number after validating the native entity-table bounds.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `client` | `dynamic` | — | Client state; accesses `ps`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L56)

<a id="constant-constant-mq3-game-bot-clients-gt-single-player-const-gt-single-player-2-src-mq3-game-bot-clients-ml-704181717"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L11)

<a id="function-function-mq3-game-bot-clients-removequeuedbotbegin-function-removequeuedbotbegin-state-clientnum-src-mq3-game-bot-clients-ml-861973840"></a>
### removeQueuedBotBegin

```ml
function removeQueuedBotBegin(state, clientNum)
```

Cancel the pending spawn time of a matching queued bot client and report whether it was found.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot clients state; accesses `queue`. |
| `clientNum` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L122)

- [mq3.game.bot_clients.SpawnEntry](Type-mq3-game-bot-clients-spawnentry-2083918495.md) — struct
- [mq3.game.bot_clients.State](Type-mq3-game-bot-clients-state-876943711.md) — struct
<a id="constant-constant-mq3-game-bot-clients-svf-bot-const-svf-bot-8-src-mq3-game-bot-clients-ml-705778541"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L10)
