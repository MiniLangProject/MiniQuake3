# `mq3.game.ai_dmnet.Action`

[Home](README.md) · [Source file](File-src-mq3-game-ai-dmnet-ml-1223783669.md)

<a id="struct-struct-mq3-game-ai-dmnet-action-struct-action-src-mq3-game-ai-dmnet-ml-753280259"></a>
## Action

```ml
struct Action
```

`Action` record for ai dmnet, containing `boundary`, `kind`, `subject`, `detail` and `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_dmnet.ml#L111)

## Members

<a id="field-field-mq3-game-ai-dmnet-action-boundary-boundary-src-mq3-game-ai-dmnet-ml-1645974373"></a>
### boundary

```ml
boundary
```

Decision/action boundary at which this bot operation was recorded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_dmnet.ml#L113)

<a id="field-field-mq3-game-ai-dmnet-action-detail-detail-src-mq3-game-ai-dmnet-ml-1721809499"></a>
### detail

```ml
detail
```

Additional diagnostic or action detail supplied by the bot controller.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_dmnet.ml#L119)

<a id="field-field-mq3-game-ai-dmnet-action-dispatched-dispatched-src-mq3-game-ai-dmnet-ml-1958321731"></a>
### dispatched

```ml
dispatched
```

Nonzero after the action has been delivered to its host callback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_dmnet.ml#L121)

<a id="field-field-mq3-game-ai-dmnet-action-kind-kind-src-mq3-game-ai-dmnet-ml-1053032717"></a>
### kind

```ml
kind
```

Discriminator selecting the recorded bot action or decision event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_dmnet.ml#L115)

<a id="field-field-mq3-game-ai-dmnet-action-subject-subject-src-mq3-game-ai-dmnet-ml-1911738081"></a>
### subject

```ml
subject
```

Entity/client or other subject to which the recorded action applies.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_dmnet.ml#L117)
