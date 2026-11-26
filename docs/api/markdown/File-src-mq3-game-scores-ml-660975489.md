# `src/mq3/game/scores.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.scores`](Package-mq3-game-scores-466780569.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/intermission.ml` as `matchIntermission` → [src/mq3/game/intermission.ml](File-src-mq3-game-intermission-ml-2122930812.md)
- `mq3/game/rank_sort.ml` as `rankSort` → [src/mq3/game/rank_sort.ml](File-src-mq3-game-rank-sort-ml-1294973587.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)

## Declarations

<a id="function-function-mq3-game-scores-addscore-function-addscore-level-ent-origin-score-src-mq3-game-scores-ml-1453590861"></a>
### addScore

```ml
function addScore(level, ent, origin, score)
```

Set `ent.client.ps.persistant[c.PERS_SCORE]` to `n.add32(ent.client.ps.persistant[c.PERS_SCORE],score)` and `level.teamScores[team]` to `n.add32(level.teamScores[team],score)` in `mq3.game.scores.addScore`. Return paths include `calculateRanks(level)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `teamScores`. May update `level.teamScores[team]` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. May update `ent.client.ps.persistant[c.PERS_SCORE]` in place. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `score` | `dynamic` | — | Value used by `scorePlum` in `plum.s.time = score`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L278)

<a id="function-function-mq3-game-scores-calculateranks-function-calculateranks-level-src-mq3-game-scores-ml-1417113350"></a>
### calculateRanks

```ml
function calculateRanks(level)
```

Update `level.follow1`, `level.follow2`, `level.numConnectedClients` and `level.numNonSpectatorClients` and related state during `calculateRanks`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`, `follow1`, `follow2`, `numConnectedClients` and `numNonSpectatorClients` and related fields. May update `level.follow1`, `level.follow2` and `level.numConnectedClients` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L209)

<a id="function-function-mq3-game-scores-checkexitrules-function-checkexitrules-level-src-mq3-game-scores-ml-1413703838"></a>
### checkExitRules

```ml
function checkExitRules(level)
```

Set `level.intermissionQueued` to `0` in `mq3.game.scores.checkExitRules`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermissiontime`, `intermissionQueued`, `time`, `timelimit` and `spawner` and related fields. May update `level.intermissionQueued` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L176)

<a id="function-function-mq3-game-scores-checkintermissionexit-function-checkintermissionexit-level-src-mq3-game-scores-ml-1625981458"></a>
### checkIntermissionExit

```ml
function checkIntermissionExit(level)
```

Update `level.readyToExit` and `level.exitTime` during `checkIntermissionExit`. Return paths include `matchBoundary(level,2)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `maxclientsCvar`, `clients`, `entities` and `time` and related fields. May update `level.readyToExit` and `level.exitTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L149)

<a id="function-function-mq3-game-scores-clientat-function-clientat-level-slot-src-mq3-game-scores-ml-2025992818"></a>
### clientAt

```ml
function clientAt(level, slot)
```

Read the persistent client record for a validated slot from zero through sixty-three.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L21)

<a id="function-function-mq3-game-scores-clientlimit-function-clientlimit-limit-src-mq3-game-scores-ml-1296174359"></a>
### clientLimit

```ml
function clientLimit(limit)
```

Validate a scoreboard client limit against the native sixty-four-client storage capacity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `limit` | `dynamic` | — | Operand used to evaluate the returned expression `limit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L14)

<a id="function-function-mq3-game-scores-commandscore-function-commandscore-level-ent-src-mq3-game-scores-ml-1307509465"></a>
### commandScore

```ml
function commandScore(level, ent)
```

Forward `commandScore` to `mq3.game.scores.scoreboard` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `numConnectedClients`, `sortedClients`, `time`, `entities` and `teamScores`. |
| `ent` | `dynamic` | — | Game entity; accesses `slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L109)

<a id="function-function-mq3-game-scores-compareranks-function-compareranks-level-a-b-src-mq3-game-scores-ml-238853681"></a>
### compareRanks

```ml
function compareRanks(level, a, b)
```

Apply `mq3.game.scores.clientAt` while evaluating `compareRanks`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |
| `a` | `dynamic` | — | Slot in the owning table or pool. |
| `b` | `dynamic` | — | Slot in the owning table or pool. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L68)

<a id="function-function-mq3-game-scores-integerdivide-function-integerdivide-a-b-src-mq3-game-scores-ml-583329763"></a>
### integerDivide

```ml
function integerDivide(a, b)
```

Divide signed 32-bit integers with truncation toward zero, rejecting zero divisors and the minimum-integer overflow case.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.i32`. |
| `b` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.i32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L28)

<a id="function-function-mq3-game-scores-logexit-function-logexit-level-reason-src-mq3-game-scores-ml-779340210"></a>
### logExit

```ml
function logExit(level, reason)
```

Set `level.intermissionQueued` to `level.time` in `mq3.game.scores.logExit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermissionQueued`, `time`, `spawner`, `numConnectedClients` and `teamScores` and related fields. May update `level.intermissionQueued` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L132)

<a id="function-function-mq3-game-scores-logline-function-logline-level-message-src-mq3-game-scores-ml-1635572171"></a>
### logLine

```ml
function logLine(level, message)
```

Use `level.gameLogFn` to perform `logLine`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gameLogFn`. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L50)

<a id="function-function-mq3-game-scores-matchboundary-function-matchboundary-level-kind-src-mq3-game-scores-ml-1664341838"></a>
### matchBoundary

```ml
function matchBoundary(level, kind)
```

Use `level.matchTransitionFn` to perform `matchBoundary`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `matchTransitionFn`. |
| `kind` | `dynamic` | — | Value passed as argument 2 to `level.matchTransitionFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L58)

<a id="function-function-mq3-game-scores-scoreboard-function-scoreboard-level-ent-src-mq3-game-scores-ml-915626053"></a>
### scoreboard

```ml
function scoreboard(level, ent)
```

Apply `mq3.game.scores.clientLimit`, `mq3.game.scores.clientAt` and `mq3.game.scores.integerDivide` while evaluating `scoreboard`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `numConnectedClients`, `sortedClients`, `time`, `entities` and `teamScores`. |
| `ent` | `dynamic` | — | Game entity; accesses `slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L88)

<a id="function-function-mq3-game-scores-scoreistied-function-scoreistied-level-src-mq3-game-scores-ml-766300914"></a>
### scoreIsTied

```ml
function scoreIsTied(level)
```

Apply `mq3.game.scores.clientAt` while evaluating `scoreIsTied`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `numPlayingClients`, `spawner`, `teamScores` and `sortedClients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L124)

<a id="function-function-mq3-game-scores-scoreplum-function-scoreplum-level-ent-origin-score-src-mq3-game-scores-ml-2301185"></a>
### scorePlum

```ml
function scorePlum(level, ent, origin, score)
```

Apply `mq3.game.entities.tempEntity` while evaluating `scorePlum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `score` | `dynamic` | — | Value used by `scorePlum` in `plum.s.time = score`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L267)

<a id="function-function-mq3-game-scores-send-function-send-level-slot-message-src-mq3-game-scores-ml-94416859"></a>
### send

```ml
function send(level, slot, message)
```

Use `level.serverCommandFn` to perform `send`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `serverCommandFn`. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L42)

<a id="function-function-mq3-game-scores-sendall-function-sendall-level-src-mq3-game-scores-ml-172062144"></a>
### sendAll

```ml
function sendAll(level)
```

Apply `mq3.game.scores.clientLimit` and `mq3.game.scores.scoreboard` while evaluating `sendAll`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`, `clients` and `entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L114)
