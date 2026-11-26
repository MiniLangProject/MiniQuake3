# `mq3.game.ai_team.Action`

[Home](README.md) · [Source file](File-src-mq3-game-ai-team-ml-162745936.md)

<a id="struct-struct-mq3-game-ai-team-action-struct-action-src-mq3-game-ai-team-ml-2046707675"></a>
## Action

```ml
struct Action
```

`Action` record for ai team, containing `kind`, `client`, `target`, `text` and `args` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L38)

## Members

<a id="field-field-mq3-game-ai-team-action-args-args-src-mq3-game-ai-team-ml-863302549"></a>
### args

```ml
args
```

Arguments attached to the recorded command or host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L48)

<a id="field-field-mq3-game-ai-team-action-client-client-src-mq3-game-ai-team-ml-597369177"></a>
### client

```ml
client
```

Client slot associated with the recorded team-order or team-chat action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L42)

<a id="field-field-mq3-game-ai-team-action-kind-kind-src-mq3-game-ai-team-ml-1425145087"></a>
### kind

```ml
kind
```

Discriminator selecting the recorded bot action or decision event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L40)

<a id="field-field-mq3-game-ai-team-action-suppressed-suppressed-src-mq3-game-ai-team-ml-1892641551"></a>
### suppressed

```ml
suppressed
```

Nonzero when an action was deliberately withheld from dispatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L50)

<a id="field-field-mq3-game-ai-team-action-target-target-src-mq3-game-ai-team-ml-1514075189"></a>
### target

```ml
target
```

Target-name selector identifying entities activated by this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L44)

<a id="field-field-mq3-game-ai-team-action-text-text-src-mq3-game-ai-team-ml-553302665"></a>
### text

```ml
text
```

Text payload supplied to the recorded command, chat, or host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L46)
