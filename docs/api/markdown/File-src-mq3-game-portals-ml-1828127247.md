# `src/mq3/game/portals.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.portals`](Package-mq3-game-portals-1767270345.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/shared/directions.ml` as `directions` → [src/mq3/shared/directions.ml](File-src-mq3-shared-directions-ml-575237557.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-portals-camera-function-camera-level-ent-src-mq3-game-portals-ml-441145903"></a>
### camera

```ml
function camera(level, ent)
```

Update `ent.r.mins[axis]`, `ent.r.maxs[axis]` and `ent.s.clientNum` during `camera`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `r` and `s`. May update `ent.r.mins[axis]`, `ent.r.maxs[axis]` and `ent.s.clientNum` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/portals.ml#L68)

<a id="function-function-mq3-game-portals-locatecamera-function-locatecamera-level-ent-src-mq3-game-portals-ml-1504841795"></a>
### locateCamera

```ml
function locateCamera(level, ent)
```

Update `ent.r.ownerNum`, `ent.s.frame`, `ent.s.powerups` and `ent.s.clientNum` and related state during `locateCamera`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `target`, `r` and `s`. May update `ent.r.ownerNum`, `ent.s.frame` and `ent.s.powerups` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/portals.ml#L16)

<a id="function-function-mq3-game-portals-surface-function-surface-level-ent-src-mq3-game-portals-ml-1855125617"></a>
### surface

```ml
function surface(level, ent)
```

Update `ent.r.mins[axis]`, `ent.r.maxs[axis]`, `ent.r.svFlags` and `ent.s.eType` and related state during `surface`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `r`, `s`, `target`, `think` and `nextthink`. May update `ent.r.mins[axis]`, `ent.r.maxs[axis]` and `ent.r.svFlags` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/portals.ml#L48)
