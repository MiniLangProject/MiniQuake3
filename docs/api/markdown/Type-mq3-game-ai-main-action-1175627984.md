# `mq3.game.ai_main.Action`

[Home](README.md) · [Source file](File-src-mq3-game-ai-main-ml-353661212.md)

<a id="struct-struct-mq3-game-ai-main-action-struct-action-src-mq3-game-ai-main-ml-1967476847"></a>
## Action

```ml
struct Action
```

`Action` record for ai main, containing `boundary`, `kind`, `subject`, `detail` and `number` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L30)

## Members

<a id="field-field-mq3-game-ai-main-action-boundary-boundary-src-mq3-game-ai-main-ml-1570237155"></a>
### boundary

```ml
boundary
```

Decision/action boundary at which this bot operation was recorded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L32)

<a id="field-field-mq3-game-ai-main-action-detail-detail-src-mq3-game-ai-main-ml-629520881"></a>
### detail

```ml
detail
```

Additional diagnostic or action detail supplied by the bot controller.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L38)

<a id="field-field-mq3-game-ai-main-action-dispatched-dispatched-src-mq3-game-ai-main-ml-1866689401"></a>
### dispatched

```ml
dispatched
```

Nonzero after the action has been delivered to its host callback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L42)

<a id="field-field-mq3-game-ai-main-action-kind-kind-src-mq3-game-ai-main-ml-1381401411"></a>
### kind

```ml
kind
```

Discriminator selecting the recorded bot action or decision event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L34)

<a id="field-field-mq3-game-ai-main-action-number-number-src-mq3-game-ai-main-ml-834068053"></a>
### number

```ml
number
```

Numeric argument attached to the recorded decision/host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L40)

<a id="field-field-mq3-game-ai-main-action-subject-subject-src-mq3-game-ai-main-ml-1634673795"></a>
### subject

```ml
subject
```

Entity/client or other subject to which the recorded action applies.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L36)
