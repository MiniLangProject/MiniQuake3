# `mq3.game.bot_chat.Bot`

[Home](README.md) · [Source file](File-src-mq3-game-bot-chat-ml-1879844588.md)

<a id="struct-struct-mq3-game-bot-chat-bot-struct-bot-src-mq3-game-bot-chat-ml-750951441"></a>
## Bot

```ml
struct Bot
```

`Bot` record for bot chat, containing `client`, `entitynum`, `character`, `cs` and `score` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L152)

## Members

<a id="field-field-mq3-game-bot-chat-bot-botdeathtype-botdeathtype-src-mq3-game-bot-chat-ml-1816686856"></a>
### botdeathtype

```ml
botdeathtype
```

Cause-of-death identifier for the bot most recent death.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L186)

<a id="field-field-mq3-game-bot-chat-bot-botsuicide-botsuicide-src-mq3-game-bot-chat-ml-1100711508"></a>
### botsuicide

```ml
botsuicide
```

Nonzero when the bot most recent death was a suicide.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L190)

<a id="field-field-mq3-game-bot-chat-bot-character-character-src-mq3-game-bot-chat-ml-1051916814"></a>
### character

```ml
character
```

Loaded bot-character handle used to query behavioral characteristics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L158)

<a id="field-field-mq3-game-bot-chat-bot-chatto-chatto-src-mq3-game-bot-chat-ml-925640472"></a>
### chatto

```ml
chatto
```

Recipient mode selecting global, team, or other chat delivery.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L166)

<a id="field-field-mq3-game-bot-chat-bot-client-client-src-mq3-game-bot-chat-ml-1869423188"></a>
### client

```ml
client
```

Client slot of the bot whose chat state and conversation are being evaluated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L154)

<a id="field-field-mq3-game-bot-chat-bot-cs-cs-src-mq3-game-bot-chat-ml-30908654"></a>
### cs

```ml
cs
```

Botlib chat-state handle owned by this bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L160)

<a id="field-field-mq3-game-bot-chat-bot-dead-dead-src-mq3-game-bot-chat-ml-1302277510"></a>
### dead

```ml
dead
```

Nonzero when the represented player or bot is dead.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L170)

<a id="field-field-mq3-game-bot-chat-bot-enemy-enemy-src-mq3-game-bot-chat-ml-1576898206"></a>
### enemy

```ml
enemy
```

Current enemy entity selected by the bot decision logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L184)

<a id="field-field-mq3-game-bot-chat-bot-enemydeathtype-enemydeathtype-src-mq3-game-bot-chat-ml-124300562"></a>
### enemydeathtype

```ml
enemydeathtype
```

Cause-of-death identifier for the enemy most recent death.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L188)

<a id="field-field-mq3-game-bot-chat-bot-entitynum-entitynum-src-mq3-game-bot-chat-ml-1289645318"></a>
### entitynum

```ml
entitynum
```

Entity number used for visibility and opponent queries during bot chat decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L156)

<a id="field-field-mq3-game-bot-chat-bot-eye-eye-src-mq3-game-bot-chat-ml-232706130"></a>
### eye

```ml
eye
```

Eye position used as the origin of visibility and aiming queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L176)

<a id="field-field-mq3-game-bot-chat-bot-inventory-inventory-src-mq3-game-bot-chat-ml-1602803206"></a>
### inventory

```ml
inventory
```

Bot inventory slots containing weapon ownership, ammunition, health, and tactical observations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L174)

<a id="field-field-mq3-game-bot-chat-bot-lastchattime-lastchattime-src-mq3-game-bot-chat-ml-28238780"></a>
### lastchatTime

```ml
lastchatTime
```

Timestamp of the last chat message emitted by the bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L164)

<a id="field-field-mq3-game-bot-chat-bot-lasthurtclient-lasthurtclient-src-mq3-game-bot-chat-ml-895556214"></a>
### lasthurtClient

```ml
lasthurtClient
```

Client identifier credited with the most recent incoming damage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L196)

<a id="field-field-mq3-game-bot-chat-bot-lasthurtmod-lasthurtmod-src-mq3-game-bot-chat-ml-91206618"></a>
### lasthurtMod

```ml
lasthurtMod
```

Cause-of-damage identifier for the most recent incoming damage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L198)

<a id="field-field-mq3-game-bot-chat-bot-lastkilledby-lastkilledby-src-mq3-game-bot-chat-ml-1882790202"></a>
### lastkilledby

```ml
lastkilledby
```

Client identifier of the player who most recently killed this bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L180)

<a id="field-field-mq3-game-bot-chat-bot-lastkilledplayer-lastkilledplayer-src-mq3-game-bot-chat-ml-587785834"></a>
### lastkilledplayer

```ml
lastkilledplayer
```

Client identifier of the player most recently killed by this bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L182)

<a id="field-field-mq3-game-bot-chat-bot-ltgtype-ltgtype-src-mq3-game-bot-chat-ml-1807790550"></a>
### ltgtype

```ml
ltgtype
```

Current long-term goal category selected from the LTG_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L192)

<a id="field-field-mq3-game-bot-chat-bot-observer-observer-src-mq3-game-bot-chat-ml-619505238"></a>
### observer

```ml
observer
```

Nonzero when the bot/client observes instead of participating in play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L168)

<a id="field-field-mq3-game-bot-chat-bot-origin-origin-src-mq3-game-bot-chat-ml-661921382"></a>
### origin

```ml
origin
```

Current bot position used by chat-related spatial and visibility checks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L172)

<a id="field-field-mq3-game-bot-chat-bot-score-score-src-mq3-game-bot-chat-ml-689826242"></a>
### score

```ml
score
```

Score currently recorded for the represented player or bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L162)

<a id="field-field-mq3-game-bot-chat-bot-thinktime-thinktime-src-mq3-game-bot-chat-ml-276487158"></a>
### thinktime

```ml
thinktime
```

Time interval used for the current bot thinking/update step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L194)

<a id="field-field-mq3-game-bot-chat-bot-viewangles-viewangles-src-mq3-game-bot-chat-ml-137933344"></a>
### viewangles

```ml
viewangles
```

Player or bot viewing angles used for aiming and command generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L178)
