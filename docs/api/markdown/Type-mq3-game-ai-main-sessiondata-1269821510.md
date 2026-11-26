# `mq3.game.ai_main.SessionData`

[Home](README.md) · [Source file](File-src-mq3-game-ai-main-ml-353661212.md)

<a id="struct-struct-mq3-game-ai-main-sessiondata-struct-sessiondata-src-mq3-game-ai-main-ml-282934365"></a>
## SessionData

```ml
struct SessionData
```

`SessionData` record for ai main, containing `decisionmaker`, `ltgtype`, `teammate` and `goal`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_main.ml#L69)

## Members

<a id="field-field-mq3-game-ai-main-sessiondata-decisionmaker-decisionmaker-src-mq3-game-ai-main-ml-761989733"></a>
### decisionmaker

```ml
decisionmaker
```

Client/entity currently responsible for the bot team decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_main.ml#L71)

<a id="field-field-mq3-game-ai-main-sessiondata-goal-goal-src-mq3-game-ai-main-ml-1443490911"></a>
### goal

```ml
goal
```

Navigation or activation goal associated with the current task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_main.ml#L77)

<a id="field-field-mq3-game-ai-main-sessiondata-ltgtype-ltgtype-src-mq3-game-ai-main-ml-708437233"></a>
### ltgtype

```ml
ltgtype
```

Current long-term goal category selected from the LTG_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_main.ml#L73)

<a id="field-field-mq3-game-ai-main-sessiondata-teammate-teammate-src-mq3-game-ai-main-ml-810678009"></a>
### teammate

```ml
teammate
```

Teammate entity/client selected for the current cooperative task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_main.ml#L75)
