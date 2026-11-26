# `mq3.server.game_interface.SvEntity`

[Home](README.md) · [Source file](File-src-mq3-server-game-interface-ml-1640517219.md)

<a id="struct-struct-mq3-server-game-interface-sventity-struct-sventity-src-mq3-server-game-interface-ml-282983899"></a>
## SvEntity

```ml
struct SvEntity
```

SvEntity record for server.game_interface, containing `number`, `areanum`, `areanum2`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L18)

## Members

<a id="field-field-mq3-server-game-interface-sventity-areanum-areanum-src-mq3-server-game-interface-ml-1771696009"></a>
### areanum

```ml
areanum
```

Primary collision area exposed to game VM entity and visibility operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L22)

<a id="field-field-mq3-server-game-interface-sventity-areanum2-areanum2-src-mq3-server-game-interface-ml-1116278267"></a>
### areanum2

```ml
areanum2
```

Second AAS area number used by the operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L24)

<a id="field-field-mq3-server-game-interface-sventity-number-number-src-mq3-server-game-interface-ml-369182943"></a>
### number

```ml
number
```

Game-entity number identifying this server-side bookkeeping record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L20)
