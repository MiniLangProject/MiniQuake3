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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `score` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L227)

<a id="function-function-mq3-game-scores-calculateranks-function-calculateranks-level-src-mq3-game-scores-ml-1417113350"></a>
### calculateRanks

```ml
function calculateRanks(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L168)

<a id="function-function-mq3-game-scores-checkexitrules-function-checkexitrules-level-src-mq3-game-scores-ml-1413703838"></a>
### checkExitRules

```ml
function checkExitRules(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L137)

<a id="function-function-mq3-game-scores-checkintermissionexit-function-checkintermissionexit-level-src-mq3-game-scores-ml-1625981458"></a>
### checkIntermissionExit

```ml
function checkIntermissionExit(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L112)

<a id="function-function-mq3-game-scores-clientat-function-clientat-level-slot-src-mq3-game-scores-ml-2025992818"></a>
### clientAt

```ml
function clientAt(level, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L16)

<a id="function-function-mq3-game-scores-clientlimit-function-clientlimit-limit-src-mq3-game-scores-ml-1296174359"></a>
### clientLimit

```ml
function clientLimit(limit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `limit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L12)

<a id="function-function-mq3-game-scores-commandscore-function-commandscore-level-ent-src-mq3-game-scores-ml-1307509465"></a>
### commandScore

```ml
function commandScore(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L81)

<a id="function-function-mq3-game-scores-compareranks-function-compareranks-level-a-b-src-mq3-game-scores-ml-238853681"></a>
### compareRanks

```ml
function compareRanks(level, a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L46)

<a id="function-function-mq3-game-scores-integerdivide-function-integerdivide-a-b-src-mq3-game-scores-ml-583329763"></a>
### integerDivide

```ml
function integerDivide(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L20)

<a id="function-function-mq3-game-scores-logexit-function-logexit-level-reason-src-mq3-game-scores-ml-779340210"></a>
### logExit

```ml
function logExit(level, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L97)

<a id="function-function-mq3-game-scores-logline-function-logline-level-message-src-mq3-game-scores-ml-1635572171"></a>
### logLine

```ml
function logLine(level, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L35)

<a id="function-function-mq3-game-scores-matchboundary-function-matchboundary-level-kind-src-mq3-game-scores-ml-1664341838"></a>
### matchBoundary

```ml
function matchBoundary(level, kind)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L40)

<a id="function-function-mq3-game-scores-scoreboard-function-scoreboard-level-ent-src-mq3-game-scores-ml-915626053"></a>
### scoreboard

```ml
function scoreboard(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L63)

<a id="function-function-mq3-game-scores-scoreistied-function-scoreistied-level-src-mq3-game-scores-ml-766300914"></a>
### scoreIsTied

```ml
function scoreIsTied(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L92)

<a id="function-function-mq3-game-scores-scoreplum-function-scoreplum-level-ent-origin-score-src-mq3-game-scores-ml-2301185"></a>
### scorePlum

```ml
function scorePlum(level, ent, origin, score)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `score` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L221)

<a id="function-function-mq3-game-scores-send-function-send-level-slot-message-src-mq3-game-scores-ml-94416859"></a>
### send

```ml
function send(level, slot, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L30)

<a id="function-function-mq3-game-scores-sendall-function-sendall-level-src-mq3-game-scores-ml-172062144"></a>
### sendAll

```ml
function sendAll(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/scores.ml#L84)
