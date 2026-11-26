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

Apply `mq3.game.memory.get`, `mq3.game.memory.debugValue` and `mq3.game.memory.memoryPrint` while evaluating `allocate`. Return paths include `block`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `memoryState`. May update `level.memoryState` in place. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/memory.ml#L59)

- [mq3.game.memory.Block](Type-mq3-game-memory-block-653420342.md) — struct
<a id="function-function-mq3-game-memory-blockstring-function-blockstring-block-src-mq3-game-memory-ml-13385073"></a>
### blockString

```ml
function blockString(block)
```

Decode a zero-terminated string within an allocated game-memory block and reject unterminated data.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `block` | `dynamic` | — | Block record; accesses `size`, `state` and `offset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/memory.ml#L123)

<a id="function-function-mq3-game-memory-debugvalue-function-debugvalue-level-state-src-mq3-game-memory-ml-1023303393"></a>
### debugValue

```ml
function debugValue(level, state)
```

Read g_debugAlloc from the bound cvar table, or use the allocation state's local debug setting.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gameCvars`. |
| `state` | `dynamic` | — | Memory state; accesses `debugAlloc`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/memory.ml#L40)

<a id="function-function-mq3-game-memory-get-function-get-level-src-mq3-game-memory-ml-1144133478"></a>
### get

```ml
function get(level)
```

Set `level.memoryState` to `State(bytes(POOLSIZE,0),0,0)` in `mq3.game.memory.get`. Return paths include `level.memoryState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `memoryState`. May update `level.memoryState` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/memory.ml#L28)

<a id="function-function-mq3-game-memory-init-function-init-level-src-mq3-game-memory-ml-1647915454"></a>
### init

```ml
function init(level)
```

Apply `mq3.game.memory.get` while evaluating `init`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `memoryState`. May update `level.memoryState` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/memory.ml#L34)

<a id="function-function-mq3-game-memory-memoryprint-function-memoryprint-level-text-src-mq3-game-memory-ml-2080755329"></a>
### memoryPrint

```ml
function memoryPrint(level, text)
```

Use `level.gamePrintFn` to perform `memoryPrint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/memory.ml#L52)

<a id="function-function-mq3-game-memory-newstring-function-newstring-level-value-src-mq3-game-memory-ml-682824391"></a>
### newString

```ml
function newString(level, value)
```

Forward `newString` to `mq3.game.memory.blockString` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `memoryState`. May update `level.memoryState` in place. |
| `value` | `dynamic` | — | Value passed as argument 1 to `typeof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/memory.ml#L134)

<a id="function-function-mq3-game-memory-newstringblock-function-newstringblock-level-value-src-mq3-game-memory-ml-1502599137"></a>
### newStringBlock

```ml
function newStringBlock(level, value)
```

Apply `mq3.game.memory.allocate` while evaluating `newStringBlock`. Return paths include `block`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `memoryState`. May update `level.memoryState` in place. |
| `value` | `dynamic` | — | Value passed as argument 1 to `typeof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/memory.ml#L99)

<a id="constant-constant-mq3-game-memory-poolsize-const-poolsize-262144-src-mq3-game-memory-ml-756001792"></a>
### POOLSIZE

```ml
const POOLSIZE = 262144
```

Byte capacity of the fixed game-module allocation pool.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/memory.ml#L7)

<a id="function-function-mq3-game-memory-readbyte-function-readbyte-block-index-src-mq3-game-memory-ml-168995257"></a>
### readByte

```ml
function readByte(block, index)
```

Read a byte from the game allocation pool after resolving the requested address.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `block` | `dynamic` | — | Block record; accesses `size`, `state` and `offset`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/memory.ml#L83)

- [mq3.game.memory.State](Type-mq3-game-memory-state-1032474162.md) — struct
<a id="function-function-mq3-game-memory-status-function-status-level-src-mq3-game-memory-ml-228083238"></a>
### status

```ml
function status(level)
```

Apply `mq3.game.memory.get` and `mq3.game.memory.memoryPrint` while evaluating `status`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `memoryState`. May update `level.memoryState` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/memory.ml#L76)

<a id="function-function-mq3-game-memory-writebyte-function-writebyte-block-index-value-src-mq3-game-memory-ml-1560188906"></a>
### writeByte

```ml
function writeByte(block, index, value)
```

Write a byte into the game allocation pool after resolving the requested address.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `block` | `dynamic` | — | Block record; accesses `size`, `state` and `offset`. May update `block.state.pool[block.offset+index]` in place. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `value` | `dynamic` | — | Value passed as argument 1 to `typeof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/memory.ml#L91)
