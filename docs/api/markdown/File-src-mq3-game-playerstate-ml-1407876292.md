# `src/mq3/game/playerstate.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.playerstate`](Package-mq3-game-playerstate-479219764.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="constant-constant-mq3-game-playerstate-byte-size-const-byte-size-468-src-mq3-game-playerstate-ml-2052899959"></a>
### BYTE_SIZE

```ml
const BYTE_SIZE = 468
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/playerstate.ml#L7)

<a id="function-function-mq3-game-playerstate-copy-function-copy-source-src-mq3-game-playerstate-ml-145962029"></a>
### copy

```ml
function copy(source)
```

Create a `mq3.game.playerstate.PlayerState` record, initializing `commandTime` as `source.commandTime`, `pm_type` as `source.pm_type` and `bobCycle` as `source.bobCycle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `commandTime`, `pm_type`, `bobCycle`, `pm_flags` and `pm_time` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/playerstate.ml#L64)

<a id="function-function-mq3-game-playerstate-create-function-create-src-mq3-game-playerstate-ml-677961258"></a>
### create

```ml
function create()
```

Create a `mq3.game.playerstate.PlayerState` record, initializing `origin` as `[0.0,0.0,0.0]`, `velocity` as `[0.0,0.0,0.0]` and `delta_angles` as `[0,0,0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/playerstate.ml#L58)

<a id="function-function-mq3-game-playerstate-load-function-load-data-offset-src-mq3-game-playerstate-ml-432057859"></a>
### load

```ml
function load(data, offset)
```

Populate player state from the ordered word representation used by the network protocol.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Sequence whose length bounds the iteration or lookup in `load`. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/playerstate.ml#L117)

- [mq3.game.playerstate.PlayerState](Type-mq3-game-playerstate-playerstate-825163064.md) — struct
<a id="function-function-mq3-game-playerstate-words-function-words-ps-src-mq3-game-playerstate-ml-1763832683"></a>
### words

```ml
function words(ps)
```

Serialize player state into the ordered integer and floating-point bit patterns required by the snapshot protocol.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — | Player movement state; accesses `commandTime`, `pm_type`, `bobCycle`, `pm_flags` and `pm_time` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/playerstate.ml#L170)
