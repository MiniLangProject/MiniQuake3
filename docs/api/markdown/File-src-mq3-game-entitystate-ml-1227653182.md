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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entitystate.ml#L126)

<a id="function-function-mq3-game-entitystate-create-function-create-src-mq3-game-entitystate-ml-1222851506"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entitystate.ml#L39)

- [mq3.game.entitystate.EntityState](Type-mq3-game-entitystate-entitystate-2108234152.md) — struct
<a id="function-function-mq3-game-entitystate-load-function-load-data-offset-src-mq3-game-entitystate-ml-212007151"></a>
### load

```ml
function load(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entitystate.ml#L43)

<a id="function-function-mq3-game-entitystate-words-function-words-state-src-mq3-game-entitystate-ml-2096263879"></a>
### words

```ml
function words(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/entitystate.ml#L85)
