# `mq3.game.memory.Block`

[Home](README.md) · [Source file](File-src-mq3-game-memory-ml-2117335517.md)

<a id="struct-struct-mq3-game-memory-block-struct-block-src-mq3-game-memory-ml-428573871"></a>
## Block

```ml
struct Block
```

`Block` record for memory, containing `state`, `offset` and `size`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/memory.ml#L18)

## Members

<a id="field-field-mq3-game-memory-block-offset-offset-src-mq3-game-memory-ml-962625912"></a>
### offset

```ml
offset
```

Starting byte offset of the allocation in the arena pool.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/memory.ml#L22)

<a id="field-field-mq3-game-memory-block-size-size-src-mq3-game-memory-ml-74551896"></a>
### size

```ml
size
```

Requested byte length of this allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/memory.ml#L24)

<a id="field-field-mq3-game-memory-block-state-state-src-mq3-game-memory-ml-609886786"></a>
### state

```ml
state
```

Owning game-arena allocation state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/memory.ml#L20)
