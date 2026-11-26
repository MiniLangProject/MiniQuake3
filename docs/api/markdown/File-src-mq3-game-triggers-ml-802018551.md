# `src/mq3/game/triggers.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.triggers`](Package-mq3-game-triggers-1411222523.md)

Reachable from entry: **no**

## Imports

- `mq3/collision/brush.ml` as `brush` → [src/mq3/collision/brush.ml](File-src-mq3-collision-brush-ml-582513812.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `entities` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/jumppad.ml` as `pad` → [src/mq3/game/jumppad.ml](File-src-mq3-game-jumppad-ml-1270203041.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/teleport.ml` as `teleport` → [src/mq3/game/teleport.ml](File-src-mq3-game-teleport-ml-594448221.md)
- `mq3/game/trajectory.ml` as `trajectory` → [src/mq3/game/trajectory.ml](File-src-mq3-game-trajectory-ml-1278285327.md)
- `mq3/server/world.ml` as `sv` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)

## Declarations

<a id="function-function-mq3-game-triggers-pushtouch-function-pushtouch-level-self-other-trace-src-mq3-game-triggers-ml-553052121"></a>
### pushTouch

```ml
function pushTouch(level, self, other, trace)
```

Apply `mq3.game.jumppad.touch` while evaluating `pushTouch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `pushTouch` signature. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`. |
| `other` | `dynamic` | — | Other record; accesses `client`. |
| `trace` | `dynamic` | — | Not read by this implementation; retained in the `pushTouch` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/triggers.ml#L18)

<a id="function-function-mq3-game-triggers-teleportertouch-function-teleportertouch-level-self-other-trace-src-mq3-game-triggers-ml-77343593"></a>
### teleporterTouch

```ml
function teleporterTouch(level, self, other, trace)
```

Apply `mq3.game.entities.pickTarget`, `mq3.game.teleport.player` and `mq3.game.entities.diagnostic` while evaluating `teleporterTouch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `spawnflags` and `target`. |
| `other` | `dynamic` | — | Other record; accesses `client`. |
| `trace` | `dynamic` | — | Not read by this implementation; retained in the `teleporterTouch` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/triggers.ml#L27)

<a id="function-function-mq3-game-triggers-touch-function-touch-level-ent-src-mq3-game-triggers-ml-187947799"></a>
### touch

```ml
function touch(level, ent)
```

Set `ent.client.ps.jumppad_frame` to `0` and `ent.client.ps.jumppad_ent` to `0` in `mq3.game.triggers.touch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`, `entities`, `doorTouch` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `r` and `touch`. May update `ent.client.ps.jumppad_frame` and `ent.client.ps.jumppad_ent` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/triggers.ml#L38)
