# `mq3.game.bot_chat.Player`

[Home](README.md) · [Source file](File-src-mq3-game-bot-chat-ml-1879844588.md)

<a id="struct-struct-mq3-game-bot-chat-player-struct-player-src-mq3-game-bot-chat-ml-867754001"></a>
## Player

```ml
struct Player
```

`Player` record for bot chat, containing `active`, `name`, `team` and `score`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L109)

## Members

<a id="field-field-mq3-game-bot-chat-player-active-active-src-mq3-game-bot-chat-ml-1924188870"></a>
### active

```ml
active
```

Nonzero when this player participates in the tracked game state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L111)

<a id="field-field-mq3-game-bot-chat-player-name-name-src-mq3-game-bot-chat-ml-1506967176"></a>
### name

```ml
name
```

Player name used by bot chat composition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L113)

<a id="field-field-mq3-game-bot-chat-player-score-score-src-mq3-game-bot-chat-ml-997473874"></a>
### score

```ml
score
```

Score currently recorded for the represented player or bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L117)

<a id="field-field-mq3-game-bot-chat-player-team-team-src-mq3-game-bot-chat-ml-1336217732"></a>
### team

```ml
team
```

Team assignment associated with the client, bot, or action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L115)
