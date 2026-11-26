# `src/mq3/game/snapshot.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.snapshot`](Package-mq3-game-snapshot-1207793414.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)

## Declarations

<a id="function-function-mq3-game-snapshot-convert-function-convert-ps-s-snap-extrapolate-time-src-mq3-game-snapshot-ml-975029370"></a>
### convert

```ml
function convert(ps, s, snap, extrapolate, time)
```

Update `s.eType`, `s.number`, `s.pos.trType` and `s.pos.trBase` and related state during `convert`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — | Player movement state; accesses `pm_type`, `stats`, `clientNum`, `origin` and `velocity` and related fields. May update `ps.entityEventSequence` in place. |
| `s` | `dynamic` | — | S record; accesses `eType`, `number`, `pos`, `apos` and `angles2` and related fields. May update `s.eType`, `s.number` and `s.pos.trType` and additional fields in place. |
| `snap` | `dynamic` | — | Value used by `convert` in `if snap then snapVector(s.pos.trBase) end if`. |
| `extrapolate` | `dynamic` | — | Value used by `convert` in `if extrapolate then s.pos.trType = c.TR_LINEAR_STOP end if`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/snapshot.ml#L23)

<a id="function-function-mq3-game-snapshot-extrapolate-function-extrapolate-ps-s-time-snap-src-mq3-game-snapshot-ml-1481170021"></a>
### extrapolate

```ml
function extrapolate(ps, s, time, snap)
```

Forward `extrapolate` to `mq3.game.snapshot.convert` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — | Player movement state; accesses `pm_type`, `stats`, `clientNum`, `origin` and `velocity` and related fields. May update `ps.entityEventSequence` in place. |
| `s` | `dynamic` | — | S record; accesses `eType`, `number`, `pos`, `apos` and `angles2` and related fields. May update `s.eType`, `s.number` and `s.pos.trType` and additional fields in place. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |
| `snap` | `dynamic` | — | Value used by `convert` in `if snap then snapVector(s.pos.trBase) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/snapshot.ml#L63)

<a id="function-function-mq3-game-snapshot-fromplayer-function-fromplayer-ps-s-snap-src-mq3-game-snapshot-ml-1398061538"></a>
### fromPlayer

```ml
function fromPlayer(ps, s, snap)
```

Forward `fromPlayer` to `mq3.game.snapshot.convert` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — | Player movement state; accesses `pm_type`, `stats`, `clientNum`, `origin` and `velocity` and related fields. May update `ps.entityEventSequence` in place. |
| `s` | `dynamic` | — | S record; accesses `eType`, `number`, `pos`, `apos` and `angles2` and related fields. May update `s.eType`, `s.number` and `s.pos.trType` and additional fields in place. |
| `snap` | `dynamic` | — | Value used by `convert` in `if snap then snapVector(s.pos.trBase) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/snapshot.ml#L55)

<a id="function-function-mq3-game-snapshot-snapvector-function-snapvector-v-src-mq3-game-snapshot-ml-916038790"></a>
### snapVector

```ml
function snapVector(v)
```

Round vector components to the integer coordinates used by network entity snapshots.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Array or byte sequence accessed at `axis`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/snapshot.ml#L10)
