# `mq3.game.bot_chat.Entity`

[Home](README.md) · [Source file](File-src-mq3-game-bot-chat-ml-1879844588.md)

<a id="struct-struct-mq3-game-bot-chat-entity-struct-entity-src-mq3-game-bot-chat-ml-1582634665"></a>
## Entity

```ml
struct Entity
```

`Entity` record for bot chat, containing `valid`, `number`, `dead`, `invisible` and `shooting` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L120)

## Members

<a id="field-field-mq3-game-bot-chat-entity-dead-dead-src-mq3-game-bot-chat-ml-620718680"></a>
### dead

```ml
dead
```

Nonzero when the represented player or bot is dead.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L126)

<a id="field-field-mq3-game-bot-chat-entity-invisible-invisible-src-mq3-game-bot-chat-ml-1335510044"></a>
### invisible

```ml
invisible
```

Nonzero when the represented entity is concealed by invisibility.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L128)

<a id="field-field-mq3-game-bot-chat-entity-number-number-src-mq3-game-bot-chat-ml-1997594982"></a>
### number

```ml
number
```

Entity number identifying the tracked game object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L124)

<a id="field-field-mq3-game-bot-chat-entity-shooting-shooting-src-mq3-game-bot-chat-ml-429146262"></a>
### shooting

```ml
shooting
```

Nonzero when the represented entity is firing a weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L130)

<a id="field-field-mq3-game-bot-chat-entity-valid-valid-src-mq3-game-bot-chat-ml-471242700"></a>
### valid

```ml
valid
```

True when the queried entity can participate in bot chat visibility decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L122)

<a id="field-field-mq3-game-bot-chat-entity-visible-visible-src-mq3-game-bot-chat-ml-861106172"></a>
### visible

```ml
visible
```

Nonzero when the tracked target is visible to the observing bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L132)
