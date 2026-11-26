# `src/mq3/game/intermission.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.intermission`](Package-mq3-game-intermission-2085866910.md)

Reachable from entry: **no**

## Imports

- `mq3/game/arenas.ml` as `intermissionArenas` → [src/mq3/game/arenas.ml](File-src-mq3-game-arenas-ml-1267669936.md)
- `mq3/game/bot_lifecycle.ml` as `intermissionBots` → [src/mq3/game/bot_lifecycle.ml](File-src-mq3-game-bot-lifecycle-ml-1736646636.md)
- `mq3/game/client_spawn.ml` as `intermissionClientSpawn` → [src/mq3/game/client_spawn.ml](File-src-mq3-game-client-spawn-ml-1352690125.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/player_spawns.ml` as `intermissionSpawns` → [src/mq3/game/player_spawns.ml](File-src-mq3-game-player-spawns-ml-1960128696.md)
- `mq3/game/scores.ml` as `intermissionScores` → [src/mq3/game/scores.ml](File-src-mq3-game-scores-ml-660975489.md)
- `mq3/game/session.ml` as `intermissionSessions` → [src/mq3/game/session.ml](File-src-mq3-game-session-ml-1678952582.md)
- `mq3/game/team_changes.ml` as `intermissionTeamChanges` → [src/mq3/game/team_changes.ml](File-src-mq3-game-team-changes-ml-909995461.md)
- `mq3/game/tournament.ml` as `intermissionTournament` → [src/mq3/game/tournament.ml](File-src-mq3-game-tournament-ml-590125009.md)

## Declarations

<a id="function-function-mq3-game-intermission-begin-function-begin-level-src-mq3-game-intermission-ml-665221252"></a>
### begin

```ml
function begin(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/intermission.ml#L42)

<a id="function-function-mq3-game-intermission-exitlevel-function-exitlevel-level-src-mq3-game-intermission-ml-199365878"></a>
### exitLevel

```ml
function exitLevel(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/intermission.ml#L67)

<a id="function-function-mq3-game-intermission-intermissionclientlimit-function-intermissionclientlimit-limit-src-mq3-game-intermission-ml-1941874611"></a>
### intermissionClientLimit

```ml
function intermissionClientLimit(limit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `limit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/intermission.ml#L16)

<a id="function-function-mq3-game-intermission-intermissionmoveclient-function-intermissionmoveclient-level-ent-src-mq3-game-intermission-ml-728533771"></a>
### intermissionMoveClient

```ml
function intermissionMoveClient(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/intermission.ml#L21)

<a id="function-function-mq3-game-intermission-moveclient-function-moveclient-level-ent-src-mq3-game-intermission-ml-1569945443"></a>
### moveClient

```ml
function moveClient(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/intermission.ml#L38)
