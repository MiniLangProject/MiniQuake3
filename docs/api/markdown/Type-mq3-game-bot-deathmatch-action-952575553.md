# `mq3.game.bot_deathmatch.Action`

[Home](README.md) · [Source file](File-src-mq3-game-bot-deathmatch-ml-113231271.md)

<a id="struct-struct-mq3-game-bot-deathmatch-action-struct-action-src-mq3-game-bot-deathmatch-ml-181526243"></a>
## Action

```ml
struct Action
```

`Action` record for bot deathmatch, containing `kind`, `client`, `text`, `value` and `point` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_deathmatch.ml#L159)

## Members

<a id="field-field-mq3-game-bot-deathmatch-action-client-client-src-mq3-game-bot-deathmatch-ml-2135999535"></a>
### client

```ml
client
```

Client slot associated with the recorded deathmatch-bot action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_deathmatch.ml#L163)

<a id="field-field-mq3-game-bot-deathmatch-action-dispatched-dispatched-src-mq3-game-bot-deathmatch-ml-1885829343"></a>
### dispatched

```ml
dispatched
```

Nonzero after the action has been delivered to its host callback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_deathmatch.ml#L171)

<a id="field-field-mq3-game-bot-deathmatch-action-kind-kind-src-mq3-game-bot-deathmatch-ml-1911510929"></a>
### kind

```ml
kind
```

Discriminator selecting the recorded bot action or decision event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_deathmatch.ml#L161)

<a id="field-field-mq3-game-bot-deathmatch-action-point-point-src-mq3-game-bot-deathmatch-ml-2092784941"></a>
### point

```ml
point
```

World-space point attached to a navigation or host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_deathmatch.ml#L169)

<a id="field-field-mq3-game-bot-deathmatch-action-text-text-src-mq3-game-bot-deathmatch-ml-610701127"></a>
### text

```ml
text
```

Text payload supplied to the recorded command, chat, or host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_deathmatch.ml#L165)

<a id="field-field-mq3-game-bot-deathmatch-action-value-value-src-mq3-game-bot-deathmatch-ml-1353440297"></a>
### value

```ml
value
```

Numeric/result payload supplied to the recorded host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_deathmatch.ml#L167)
