# `src/mq3/game/memory.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.memory`](Package-mq3-game-memory-320646485.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-game-memory-allocate-function-allocate-level-size-src-mq3-game-memory-ml-533734383"></a>
### allocate

```ml
function allocate(level, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/memory.ml#L37)

- [mq3.game.memory.Block](Type-mq3-game-memory-block-653420342.md) — struct
<a id="function-function-mq3-game-memory-blockstring-function-blockstring-block-src-mq3-game-memory-ml-13385073"></a>
### blockString

```ml
function blockString(block)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `block` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/memory.ml#L87)

<a id="function-function-mq3-game-memory-debugvalue-function-debugvalue-level-state-src-mq3-game-memory-ml-1023303393"></a>
### debugValue

```ml
function debugValue(level, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/memory.ml#L24)

<a id="function-function-mq3-game-memory-get-function-get-level-src-mq3-game-memory-ml-1144133478"></a>
### get

```ml
function get(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/memory.ml#L17)

<a id="function-function-mq3-game-memory-init-function-init-level-src-mq3-game-memory-ml-1647915454"></a>
### init

```ml
function init(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/memory.ml#L21)

<a id="function-function-mq3-game-memory-memoryprint-function-memoryprint-level-text-src-mq3-game-memory-ml-2080755329"></a>
### memoryPrint

```ml
function memoryPrint(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/memory.ml#L33)

<a id="function-function-mq3-game-memory-newstring-function-newstring-level-value-src-mq3-game-memory-ml-682824391"></a>
### newString

```ml
function newString(level, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/memory.ml#L95)

<a id="function-function-mq3-game-memory-newstringblock-function-newstringblock-level-value-src-mq3-game-memory-ml-1502599137"></a>
### newStringBlock

```ml
function newStringBlock(level, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/memory.ml#L65)

<a id="constant-constant-mq3-game-memory-poolsize-const-poolsize-262144-src-mq3-game-memory-ml-756001792"></a>
### POOLSIZE

```ml
const POOLSIZE = 262144
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/memory.ml#L6)

<a id="function-function-mq3-game-memory-readbyte-function-readbyte-block-index-src-mq3-game-memory-ml-168995257"></a>
### readByte

```ml
function readByte(block, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `block` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/memory.ml#L56)

- [mq3.game.memory.State](Type-mq3-game-memory-state-1032474162.md) — struct
<a id="function-function-mq3-game-memory-status-function-status-level-src-mq3-game-memory-ml-228083238"></a>
### status

```ml
function status(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/memory.ml#L52)

<a id="function-function-mq3-game-memory-writebyte-function-writebyte-block-index-value-src-mq3-game-memory-ml-1560188906"></a>
### writeByte

```ml
function writeByte(block, index, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `block` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/memory.ml#L60)
