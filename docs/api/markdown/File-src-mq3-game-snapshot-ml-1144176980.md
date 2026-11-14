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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — |  |
| `s` | `dynamic` | — |  |
| `snap` | `dynamic` | — |  |
| `extrapolate` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/snapshot.ml#L15)

<a id="function-function-mq3-game-snapshot-extrapolate-function-extrapolate-ps-s-time-snap-src-mq3-game-snapshot-ml-1481170021"></a>
### extrapolate

```ml
function extrapolate(ps, s, time, snap)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — |  |
| `s` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `snap` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/snapshot.ml#L46)

<a id="function-function-mq3-game-snapshot-fromplayer-function-fromplayer-ps-s-snap-src-mq3-game-snapshot-ml-1398061538"></a>
### fromPlayer

```ml
function fromPlayer(ps, s, snap)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — |  |
| `s` | `dynamic` | — |  |
| `snap` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/snapshot.ml#L43)

<a id="function-function-mq3-game-snapshot-snapvector-function-snapvector-v-src-mq3-game-snapshot-ml-916038790"></a>
### snapVector

```ml
function snapVector(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/snapshot.ml#L8)
