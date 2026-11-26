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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/triggers.ml#L13)

<a id="function-function-mq3-game-triggers-teleportertouch-function-teleportertouch-level-self-other-trace-src-mq3-game-triggers-ml-77343593"></a>
### teleporterTouch

```ml
function teleporterTouch(level, self, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/triggers.ml#L17)

<a id="function-function-mq3-game-triggers-touch-function-touch-level-ent-src-mq3-game-triggers-ml-187947799"></a>
### touch

```ml
function touch(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/triggers.ml#L25)
