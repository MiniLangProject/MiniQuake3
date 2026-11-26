# `mq3.game.movement.Collision`

[Home](README.md) · [Source file](File-src-mq3-game-movement-ml-621504687.md)

<a id="struct-struct-mq3-game-movement-collision-struct-collision-src-mq3-game-movement-ml-993354273"></a>
## Collision

```ml
struct Collision
```

`Collision` record for movement, containing `trace`, `endpos` and `entityNum`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L11)

## Members

<a id="field-field-mq3-game-movement-collision-endpos-endpos-src-mq3-game-movement-ml-798169431"></a>
### endpos

```ml
endpos
```

Final position reached by the collision trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L15)

<a id="field-field-mq3-game-movement-collision-entitynum-entitynum-src-mq3-game-movement-ml-1700588125"></a>
### entityNum

```ml
entityNum
```

Entity number returned by or associated with this operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L17)

<a id="field-field-mq3-game-movement-collision-trace-trace-src-mq3-game-movement-ml-522791009"></a>
### trace

```ml
trace
```

Collision trace result or callback used by the movement calculation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L13)
