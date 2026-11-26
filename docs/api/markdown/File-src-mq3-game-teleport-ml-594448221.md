# `src/mq3/game/teleport.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.teleport`](Package-mq3-game-teleport-1812297037.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `entities` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/snapshot.ml` as `snapshot` → [src/mq3/game/snapshot.ml](File-src-mq3-game-snapshot-ml-1144176980.md)
- `mq3/server/world.ml` as `sv` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-teleport-killbox-function-killbox-level-ent-src-mq3-game-teleport-ml-825544335"></a>
### killBox

```ml
function killBox(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/teleport.ml#L20)

<a id="function-function-mq3-game-teleport-player-function-player-level-ent-origin-angles-src-mq3-game-teleport-ml-286361135"></a>
### player

```ml
function player(level, ent, origin, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/teleport.ml#L33)

<a id="function-function-mq3-game-teleport-setclientviewangle-function-setclientviewangle-ent-angles-src-mq3-game-teleport-ml-1408772677"></a>
### setClientViewAngle

```ml
function setClientViewAngle(ent, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/teleport.ml#L11)
