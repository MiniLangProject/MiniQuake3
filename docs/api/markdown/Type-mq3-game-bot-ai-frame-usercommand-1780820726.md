# `mq3.game.bot_ai_frame.UserCommand`

[Home](README.md) · [Source file](File-src-mq3-game-bot-ai-frame-ml-144686062.md)

<a id="struct-struct-mq3-game-bot-ai-frame-usercommand-struct-usercommand-src-mq3-game-bot-ai-frame-ml-1266484583"></a>
## UserCommand

```ml
struct UserCommand
```

`UserCommand` record for bot ai frame, containing `serverTime`, `buttons`, `angles`, `weapon` and `forwardmove` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L27)

## Members

<a id="field-field-mq3-game-bot-ai-frame-usercommand-angles-angles-src-mq3-game-bot-ai-frame-ml-1997480265"></a>
### angles

```ml
angles
```

Orientation angles used by the entity or movement operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L33)

<a id="field-field-mq3-game-bot-ai-frame-usercommand-buttons-buttons-src-mq3-game-bot-ai-frame-ml-39874221"></a>
### buttons

```ml
buttons
```

Button bits from the current user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L31)

<a id="field-field-mq3-game-bot-ai-frame-usercommand-forwardmove-forwardmove-src-mq3-game-bot-ai-frame-ml-754468253"></a>
### forwardmove

```ml
forwardmove
```

Requested forward/backward movement component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L37)

<a id="field-field-mq3-game-bot-ai-frame-usercommand-rightmove-rightmove-src-mq3-game-bot-ai-frame-ml-665734233"></a>
### rightmove

```ml
rightmove
```

Requested right/left movement component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L39)

<a id="field-field-mq3-game-bot-ai-frame-usercommand-servertime-servertime-src-mq3-game-bot-ai-frame-ml-988144961"></a>
### serverTime

```ml
serverTime
```

Server timestamp carried by the current user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L29)

<a id="field-field-mq3-game-bot-ai-frame-usercommand-upmove-upmove-src-mq3-game-bot-ai-frame-ml-1028217357"></a>
### upmove

```ml
upmove
```

Requested upward/downward movement component.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L41)

<a id="field-field-mq3-game-bot-ai-frame-usercommand-weapon-weapon-src-mq3-game-bot-ai-frame-ml-299510929"></a>
### weapon

```ml
weapon
```

Selected or reported weapon identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L35)
