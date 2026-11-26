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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `delay` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L84)

<a id="function-function-mq3-game-bot-clients-beginclient-function-beginclient-level-state-entry-src-mq3-game-bot-clients-ml-385927613"></a>
### beginClient

```ml
function beginClient(level, state, entry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `entry` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L107)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L133)

- [mq3.game.bot_clients.BotSettings](Type-mq3-game-bot-clients-botsettings-1293764382.md) — struct
<a id="function-function-mq3-game-bot-clients-checkbotspawn-function-checkbotspawn-level-state-src-mq3-game-bot-clients-ml-116352531"></a>
### checkBotSpawn

```ml
function checkBotSpawn(level, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L120)

<a id="function-function-mq3-game-bot-clients-clientlimit-function-clientlimit-level-src-mq3-game-bot-clients-ml-391383348"></a>
### clientLimit

```ml
function clientLimit(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L42)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L65)

<a id="function-function-mq3-game-bot-clients-counthumanplayers-function-counthumanplayers-level-team-src-mq3-game-bot-clients-ml-2039272071"></a>
### countHumanPlayers

```ml
function countHumanPlayers(level, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L53)

<a id="function-function-mq3-game-bot-clients-create-function-create-src-mq3-game-bot-clients-ml-834113734"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L34)

<a id="function-function-mq3-game-bot-clients-entityforclient-function-entityforclient-level-client-src-mq3-game-bot-clients-ml-219907003"></a>
### entityForClient

```ml
function entityForClient(level, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L47)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L98)

- [mq3.game.bot_clients.SpawnEntry](Type-mq3-game-bot-clients-spawnentry-2083918495.md) — struct
- [mq3.game.bot_clients.State](Type-mq3-game-bot-clients-state-876943711.md) — struct
<a id="constant-constant-mq3-game-bot-clients-svf-bot-const-svf-bot-8-src-mq3-game-bot-clients-ml-705778541"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_clients.ml#L10)
