# `mq3.game.memory.State`

[Home](README.md) · [Source file](File-src-mq3-game-memory-ml-2117335517.md)

<a id="struct-struct-mq3-game-memory-state-struct-state-src-mq3-game-memory-ml-603043807"></a>
## State

```ml
struct State
```

`State` record for memory, containing `pool`, `allocPoint` and `debugAlloc`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/memory.ml#L9)

## Members

<a id="field-field-mq3-game-memory-state-allocpoint-allocpoint-src-mq3-game-memory-ml-1197874492"></a>
### allocPoint

```ml
allocPoint
```

Next free byte offset in the game allocation arena.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/memory.ml#L13)

<a id="field-field-mq3-game-memory-state-debugalloc-debugalloc-src-mq3-game-memory-ml-1496950754"></a>
### debugAlloc

```ml
debugAlloc
```

Diagnostic setting enabling game-arena allocation reporting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/memory.ml#L15)

<a id="field-field-mq3-game-memory-state-pool-pool-src-mq3-game-memory-ml-778637814"></a>
### pool

```ml
pool
```

Backing byte buffer of the fixed game allocation arena.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/memory.ml#L11)
