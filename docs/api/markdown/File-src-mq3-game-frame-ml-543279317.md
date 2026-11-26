# `src/mq3/game/frame.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.frame`](Package-mq3-game-frame-807698651.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/bodies.ml` as `bodies` → [src/mq3/game/bodies.ml](File-src-mq3-game-bodies-ml-247011888.md)
- `mq3/game/bot_clients.ml` as `botClients` → [src/mq3/game/bot_clients.ml](File-src-mq3-game-bot-clients-ml-237353140.md)
- `mq3/game/client_active.ml` as `clientActive` → [src/mq3/game/client_active.ml](File-src-mq3-game-client-active-ml-1919364260.md)
- `mq3/game/client_frame.ml` as `clientFrame` → [src/mq3/game/client_frame.ml](File-src-mq3-game-client-frame-ml-1603528079.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/cvar_maintenance.ml` as `cvarMaintenance` → [src/mq3/game/cvar_maintenance.ml](File-src-mq3-game-cvar-maintenance-ml-54356974.md)
- `mq3/game/cvars.ml` as `cvars` → [src/mq3/game/cvars.ml](File-src-mq3-game-cvars-ml-718537019.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/g_items.ml` as `gItems` → [src/mq3/game/g_items.ml](File-src-mq3-game-g-items-ml-1981196396.md)
- `mq3/game/g_missile.ml` as `completeMissiles` → [src/mq3/game/g_missile.ml](File-src-mq3-game-g-missile-ml-350460060.md)
- `mq3/game/g_mover.ml` as `gMover` → [src/mq3/game/g_mover.ml](File-src-mq3-game-g-mover-ml-1861149167.md)
- `mq3/game/scores.ml` as `scores` → [src/mq3/game/scores.ml](File-src-mq3-game-scores-ml-660975489.md)
- `mq3/game/spawn_functions.ml` as `funcs` → [src/mq3/game/spawn_functions.ml](File-src-mq3-game-spawn-functions-ml-1306159949.md)
- `mq3/game/team_status.ml` as `teamStatus` → [src/mq3/game/team_status.ml](File-src-mq3-game-team-status-ml-1980544906.md)
- `mq3/game/tournament.ml` as `tournament` → [src/mq3/game/tournament.ml](File-src-mq3-game-tournament-ml-590125009.md)
- `mq3/game/votes.ml` as `votes` → [src/mq3/game/votes.ml](File-src-mq3-game-votes-ml-1007667129.md)

## Declarations

<a id="function-function-mq3-game-frame-run-function-run-level-leveltime-src-mq3-game-frame-ml-1476517703"></a>
### run

```ml
function run(level, levelTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `levelTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/frame.ml#L65)

<a id="function-function-mq3-game-frame-runentities-function-runentities-level-src-mq3-game-frame-ml-1513590918"></a>
### runEntities

```ml
function runEntities(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/frame.ml#L22)

<a id="function-function-mq3-game-frame-stage-function-stage-level-kind-arg-src-mq3-game-frame-ml-1465696878"></a>
### stage

```ml
function stage(level, kind, arg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `arg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/frame.ml#L59)
