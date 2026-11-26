# `mq3.game.bot_ai_frame.Runtime`

[Home](README.md) · [Source file](File-src-mq3-game-bot-ai-frame-ml-144686062.md)

<a id="struct-struct-mq3-game-bot-ai-frame-runtime-struct-runtime-src-mq3-game-bot-ai-frame-ml-554681271"></a>
## Runtime

```ml
struct Runtime
```

`Runtime` record for bot ai frame, containing `botthinkResidual` and `lastucmd`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L45)

## Members

<a id="field-field-mq3-game-bot-ai-frame-runtime-botthinkresidual-botthinkresidual-src-mq3-game-bot-ai-frame-ml-1357877953"></a>
### botthinkResidual

```ml
botthinkResidual
```

Accumulated time not yet consumed by a bot thinking step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L47)

<a id="field-field-mq3-game-bot-ai-frame-runtime-lastucmd-lastucmd-src-mq3-game-bot-ai-frame-ml-1547042091"></a>
### lastucmd

```ml
lastucmd
```

User command generated or observed during the preceding bot frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L49)
