# `src/mq3/game/team_changes.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.team_changes`](Package-mq3-game-team-changes-367735885.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/bodies.ml` as `bodies` → [src/mq3/game/bodies.ml](File-src-mq3-game-bodies-ml-247011888.md)
- `mq3/game/client_info.ml` as `clientInfo` → [src/mq3/game/client_info.ml](File-src-mq3-game-client-info-ml-669662398.md)
- `mq3/game/client_spawn.ml` as `clientSpawn` → [src/mq3/game/client_spawn.ml](File-src-mq3-game-client-spawn-ml-1352690125.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/deaths.ml` as `deaths` → [src/mq3/game/deaths.ml](File-src-mq3-game-deaths-ml-761874289.md)
- `mq3/game/session.ml` as `sessions` → [src/mq3/game/session.ml](File-src-mq3-game-session-ml-1678952582.md)
- `mq3/game/tournament.ml` as `tournament` → [src/mq3/game/tournament.ml](File-src-mq3-game-tournament-ml-590125009.md)
- `mq3/game/votes.ml` as `votes` → [src/mq3/game/votes.ml](File-src-mq3-game-votes-ml-1007667129.md)
- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-team-changes-commandteam-function-commandteam-level-ent-argv-src-mq3-game-team-changes-ml-2012660647"></a>
### commandTeam

```ml
function commandTeam(level, ent, argv)
```

Set `ent.client.switchTeamTime` to `n.add32(level.time,5000)` in `mq3.game.team_changes.commandTeam`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time` and `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `client` and `slot`. May update `ent.client.switchTeamTime` in place. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_changes.ml#L79)

<a id="function-function-mq3-game-team-changes-setteam-function-setteam-level-ent-request-src-mq3-game-team-changes-ml-634986294"></a>
### setTeam

```ml
function setTeam(level, ent, request)
```

Update `ent.flags`, `ent.health` and `level.playerDieFn` during `setTeam`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `teamForceBalance`, `numNonSpectatorClients`, `maxGameClients` and `time` and related fields. May update `level.playerDieFn` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `flags` and `health`. May update `ent.flags` and `ent.health` in place. |
| `request` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_changes.ml#L21)

<a id="function-function-mq3-game-team-changes-stopfollowing-function-stopfollowing-level-ent-src-mq3-game-team-changes-ml-1375538395"></a>
### stopFollowing

```ml
function stopFollowing(level, ent)
```

Set `ent.r.svFlags` to `ent.r.svFlags & ~8` in `mq3.game.team_changes.stopFollowing`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `stopFollowing` signature. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `slot` and `r`. May update `ent.r.svFlags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/team_changes.ml#L68)
