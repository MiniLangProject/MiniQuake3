# `src/mq3/game/entitystate.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.entitystate`](Package-mq3-game-entitystate-1551981306.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/trajectory.ml` as `tr` → [src/mq3/game/trajectory.ml](File-src-mq3-game-trajectory-ml-1278285327.md)

## Declarations

<a id="constant-constant-mq3-game-entitystate-byte-size-const-byte-size-208-src-mq3-game-entitystate-ml-1112205611"></a>
### BYTE_SIZE

```ml
const BYTE_SIZE = 208
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entitystate.ml#L7)

<a id="function-function-mq3-game-entitystate-copy-function-copy-source-src-mq3-game-entitystate-ml-172337713"></a>
### copy

```ml
function copy(source)
```

Apply `mq3.game.entitystate.create` while evaluating `copy`. Return paths include `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `number`, `eType`, `eFlags`, `pos` and `apos` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entitystate.ml#L135)

<a id="function-function-mq3-game-entitystate-create-function-create-src-mq3-game-entitystate-ml-1222851506"></a>
### create

```ml
function create()
```

Create a `mq3.game.entitystate.EntityState` record, initializing `pos` as `tr.Trajectory(0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0])`, `apos` as `tr.Trajectory(0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0])` and `origin` as `[0.0,0.0,0.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entitystate.ml#L41)

- [mq3.game.entitystate.EntityState](Type-mq3-game-entitystate-entitystate-2108234152.md) — struct
<a id="function-function-mq3-game-entitystate-load-function-load-data-offset-src-mq3-game-entitystate-ml-212007151"></a>
### load

```ml
function load(data, offset)
```

Populate an entity state from its ordered snapshot-word representation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Sequence whose length bounds the iteration or lookup in `load`. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entitystate.ml#L48)

<a id="function-function-mq3-game-entitystate-words-function-words-state-src-mq3-game-entitystate-ml-2096263879"></a>
### words

```ml
function words(state)
```

Serialize an entity state into the ordered 32-bit words used by Quake III snapshot fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Entitystate state; accesses `number`, `eType`, `eFlags`, `pos` and `apos` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entitystate.ml#L92)
