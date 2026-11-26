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

Set `level.spawner.warmupTime` to `-1` in `mq3.game.tournament.addPlayer`. Return paths include `teamChanges.setTeam(level,level.entities[nextSlot],"f")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `numPlayingClients`, `intermissiontime`, `maxclients`, `clients` and `spawner` and related fields. May update `level.spawner.warmupTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/tournament.ml#L13)

<a id="function-function-mq3-game-tournament-adjustscores-function-adjustscores-level-src-mq3-game-tournament-ml-2020151254"></a>
### adjustScores

```ml
function adjustScores(level)
```

Set `level.clients[slot].wins` to `n.add32(level.clients[slot].wins,1)` and `level.clients[slot].losses` to `n.add32(level.clients[slot].losses,1)` in `mq3.game.tournament.adjustScores`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. May update `level.clients[slot].wins` and `level.clients[slot].losses` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/tournament.ml#L56)

<a id="function-function-mq3-game-tournament-check-function-check-level-src-mq3-game-tournament-ml-500497606"></a>
### check

```ml
function check(level)
```

Set `level.warmupModificationCount` to `level.warmupCvarModificationCount` and `level.spawner.warmupTime` to `-1` in `mq3.game.tournament.check`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `numPlayingClients`, `tournamentAddFn`, `warmupCvarModificationCount` and `warmupModificationCount` and related fields. May update `level.warmupModificationCount` and `level.spawner.warmupTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/tournament.ml#L110)

<a id="function-function-mq3-game-tournament-rankedslot-function-rankedslot-level-index-src-mq3-game-tournament-ml-476136828"></a>
### rankedSlot

```ml
function rankedSlot(level, index)
```

Read a sorted tournament client slot and reject values outside persistent client storage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `sortedClients`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/tournament.ml#L30)

<a id="function-function-mq3-game-tournament-removeloser-function-removeloser-level-src-mq3-game-tournament-ml-1583491424"></a>
### removeLoser

```ml
function removeLoser(level)
```

Forward `removeLoser` to `mq3.game.tournament.removeRanked` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `numPlayingClients`, `clients` and `entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/tournament.ml#L46)

<a id="function-function-mq3-game-tournament-removeranked-function-removeranked-level-index-src-mq3-game-tournament-ml-1726826956"></a>
### removeRanked

```ml
function removeRanked(level, index)
```

Apply `mq3.game.tournament.rankedSlot` and `mq3.game.team_changes.setTeam` while evaluating `removeRanked`. Return paths include `teamChanges.setTeam(level,level.entities[slot],"s")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `numPlayingClients`, `clients` and `entities`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/tournament.ml#L38)

<a id="function-function-mq3-game-tournament-removewinner-function-removewinner-level-src-mq3-game-tournament-ml-962020266"></a>
### removeWinner

```ml
function removeWinner(level)
```

Forward `removeWinner` to `mq3.game.tournament.removeRanked` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `numPlayingClients`, `clients` and `entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/tournament.ml#L51)

<a id="function-function-mq3-game-tournament-restart-function-restart-level-src-mq3-game-tournament-ml-1258596064"></a>
### restart

```ml
function restart(level)
```

Set `level.spawner.warmupTime` to `n.add32(level.spawner.warmupTime,10000)` and `level.restarted` to `true` in `mq3.game.tournament.restart`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `cvarSetFn`, `consoleCommandFn` and `restarted`. May update `level.spawner.warmupTime` and `level.restarted` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/tournament.ml#L100)

<a id="function-function-mq3-game-tournament-setwarmup-function-setwarmup-level-value-writelog-src-mq3-game-tournament-ml-554457554"></a>
### setWarmup

```ml
function setWarmup(level, value, writeLog)
```

Set `level.spawner.warmupTime` to `n.i32(value)` in `mq3.game.tournament.setWarmup`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `gameLogFn`. May update `level.spawner.warmupTime` in place. |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.i32`. |
| `writeLog` | `dynamic` | — | Value used by `setWarmup` in `if writeLog then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/tournament.ml#L89)

<a id="function-function-mq3-game-tournament-teamcount-function-teamcount-level-ignoreclientnum-team-src-mq3-game-tournament-ml-1994846166"></a>
### teamCount

```ml
function teamCount(level, ignoreClientNum, team)
```

Count connected clients on the requested team while excluding the specified client slot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients` and `clients`. |
| `ignoreClientNum` | `dynamic` | — | Value used by `teamCount` in `if slot == ignoreClientNum then continue end if`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/tournament.ml#L72)
