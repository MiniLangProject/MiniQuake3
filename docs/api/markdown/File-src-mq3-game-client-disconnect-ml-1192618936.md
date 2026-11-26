# `src/mq3/game/client_disconnect.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.client_disconnect`](Package-mq3-game-client-disconnect-512220004.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/bot_clients.ml` as `botClients` → [src/mq3/game/bot_clients.ml](File-src-mq3-game-bot-clients-ml-237353140.md)
- `mq3/game/client_info.ml` as `clientInfo` → [src/mq3/game/client_info.ml](File-src-mq3-game-client-info-ml-669662398.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/deaths.ml` as `deaths` → [src/mq3/game/deaths.ml](File-src-mq3-game-deaths-ml-761874289.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/scores.ml` as `scores` → [src/mq3/game/scores.ml](File-src-mq3-game-scores-ml-660975489.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/game/team_changes.ml` as `teamChanges` → [src/mq3/game/team_changes.ml](File-src-mq3-game-team-changes-ml-909995461.md)
- `mq3/game/votes.ml` as `votes` → [src/mq3/game/votes.ml](File-src-mq3-game-votes-ml-1007667129.md)

## Declarations

<a id="function-function-mq3-game-client-disconnect-disconnect-function-disconnect-level-slot-src-mq3-game-client-disconnect-ml-2064860836"></a>
### disconnect

```ml
function disconnect(level, slot)
```

Set `level.clients[winner].wins` to `n.add32(level.clients[winner].wins,1)` in `mq3.game.client_disconnect.disconnect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `removeQueuedBotBeginFn`, `lifecycleState`, `entities`, `maxclients` and `clients` and related fields. May update `level.clients[winner].wins` in place. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_disconnect.ml#L19)
