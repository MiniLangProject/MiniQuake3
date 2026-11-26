# `mq3.game.pmove.Command`

[Home](README.md) · [Source file](File-src-mq3-game-pmove-ml-1046301421.md)

<a id="struct-struct-mq3-game-pmove-command-struct-command-src-mq3-game-pmove-ml-902608927"></a>
## Command

```ml
struct Command
```

`Command` record for pmove, containing `serverTime`, `angles`, `buttons`, `weapon` and `forwardmove` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L18)

## Members

<a id="field-field-mq3-game-pmove-command-angles-angles-src-mq3-game-pmove-ml-615147366"></a>
### angles

```ml
angles
```

Orientation angles used by the entity or movement operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L22)

<a id="field-field-mq3-game-pmove-command-buttons-buttons-src-mq3-game-pmove-ml-246051506"></a>
### buttons

```ml
buttons
```

Button bits from the current user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L24)

<a id="field-field-mq3-game-pmove-command-forwardmove-forwardmove-src-mq3-game-pmove-ml-2113491786"></a>
### forwardmove

```ml
forwardmove
```

Requested forward/backward movement component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L28)

<a id="field-field-mq3-game-pmove-command-rightmove-rightmove-src-mq3-game-pmove-ml-1593326726"></a>
### rightmove

```ml
rightmove
```

Requested right/left movement component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L30)

<a id="field-field-mq3-game-pmove-command-servertime-servertime-src-mq3-game-pmove-ml-1348859374"></a>
### serverTime

```ml
serverTime
```

Server timestamp carried by the current user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L20)

<a id="field-field-mq3-game-pmove-command-upmove-upmove-src-mq3-game-pmove-ml-1134569194"></a>
### upmove

```ml
upmove
```

Requested upward/downward movement component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L32)

<a id="field-field-mq3-game-pmove-command-weapon-weapon-src-mq3-game-pmove-ml-2083161390"></a>
### weapon

```ml
weapon
```

Selected or reported weapon identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L26)
