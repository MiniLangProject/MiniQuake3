# `src/mq3/game/tournament.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.tournament`](Package-mq3-game-tournament-1674775717.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/game/team_changes.ml` as `teamChanges` → [src/mq3/game/team_changes.ml](File-src-mq3-game-team-changes-ml-909995461.md)
- `mq3/game/votes.ml` as `votes` → [src/mq3/game/votes.ml](File-src-mq3-game-votes-ml-1007667129.md)

## Declarations

<a id="function-function-mq3-game-tournament-addplayer-function-addplayer-level-src-mq3-game-tournament-ml-829232530"></a>
### addPlayer

```ml
function addPlayer(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/tournament.ml#L11)

<a id="function-function-mq3-game-tournament-adjustscores-function-adjustscores-level-src-mq3-game-tournament-ml-2020151254"></a>
### adjustScores

```ml
function adjustScores(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/tournament.ml#L42)

<a id="function-function-mq3-game-tournament-check-function-check-level-src-mq3-game-tournament-ml-500497606"></a>
### check

```ml
function check(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/tournament.ml#L84)

<a id="function-function-mq3-game-tournament-rankedslot-function-rankedslot-level-index-src-mq3-game-tournament-ml-476136828"></a>
### rankedSlot

```ml
function rankedSlot(level, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/tournament.ml#L25)

<a id="function-function-mq3-game-tournament-removeloser-function-removeloser-level-src-mq3-game-tournament-ml-1583491424"></a>
### removeLoser

```ml
function removeLoser(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/tournament.ml#L36)

<a id="function-function-mq3-game-tournament-removeranked-function-removeranked-level-index-src-mq3-game-tournament-ml-1726826956"></a>
### removeRanked

```ml
function removeRanked(level, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/tournament.ml#L30)

<a id="function-function-mq3-game-tournament-removewinner-function-removewinner-level-src-mq3-game-tournament-ml-962020266"></a>
### removeWinner

```ml
function removeWinner(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/tournament.ml#L39)

<a id="function-function-mq3-game-tournament-restart-function-restart-level-src-mq3-game-tournament-ml-1258596064"></a>
### restart

```ml
function restart(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/tournament.ml#L76)

<a id="function-function-mq3-game-tournament-setwarmup-function-setwarmup-level-value-writelog-src-mq3-game-tournament-ml-554457554"></a>
### setWarmup

```ml
function setWarmup(level, value, writeLog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `writeLog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/tournament.ml#L67)

<a id="function-function-mq3-game-tournament-teamcount-function-teamcount-level-ignoreclientnum-team-src-mq3-game-tournament-ml-1994846166"></a>
### teamCount

```ml
function teamCount(level, ignoreClientNum, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ignoreClientNum` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/tournament.ml#L54)
