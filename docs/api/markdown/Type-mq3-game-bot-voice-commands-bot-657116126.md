# `mq3.game.bot_voice_commands.Bot`

[Home](README.md) · [Source file](File-src-mq3-game-bot-voice-commands-ml-1061280133.md)

<a id="struct-struct-mq3-game-bot-voice-commands-bot-struct-bot-src-mq3-game-bot-voice-commands-ml-1814802511"></a>
## Bot

```ml
struct Bot
```

`Bot` record for bot voice commands, containing `client`, `cs`, `team`, `teamleader` and `decisionmaker` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L104)

## Members

<a id="field-field-mq3-game-bot-voice-commands-bot-arrivetime-arrivetime-src-mq3-game-bot-voice-commands-ml-1064115378"></a>
### arriveTime

```ml
arriveTime
```

Timestamp at which the bot arrived at the current team goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L140)

<a id="field-field-mq3-game-bot-voice-commands-bot-attackawaytime-attackawaytime-src-mq3-game-bot-voice-commands-ml-548034552"></a>
### attackawayTime

```ml
attackawayTime
```

Time controlling temporary excursions from an attack-base goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L130)

<a id="field-field-mq3-game-bot-voice-commands-bot-client-client-src-mq3-game-bot-voice-commands-ml-716926888"></a>
### client

```ml
client
```

Client slot of the bot receiving and interpreting voice commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L106)

<a id="field-field-mq3-game-bot-voice-commands-bot-cs-cs-src-mq3-game-bot-voice-commands-ml-1443744882"></a>
### cs

```ml
cs
```

Botlib chat-state handle owned by this bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L108)

<a id="field-field-mq3-game-bot-voice-commands-bot-decisionmaker-decisionmaker-src-mq3-game-bot-voice-commands-ml-1268777610"></a>
### decisionmaker

```ml
decisionmaker
```

Client/entity currently responsible for the bot team decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L114)

<a id="field-field-mq3-game-bot-voice-commands-bot-defendawaytime-defendawaytime-src-mq3-game-bot-voice-commands-ml-1141669956"></a>
### defendawayTime

```ml
defendawayTime
```

Time controlling how long the bot may leave its defense goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L132)

<a id="field-field-mq3-game-bot-voice-commands-bot-formationdist-formationdist-src-mq3-game-bot-voice-commands-ml-1978976266"></a>
### formationDist

```ml
formationDist
```

Desired separation from the teammate or formation leader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L144)

<a id="field-field-mq3-game-bot-voice-commands-bot-harvestawaytime-harvestawaytime-src-mq3-game-bot-voice-commands-ml-1422117778"></a>
### harvestawayTime

```ml
harvestawayTime
```

Time controlling temporary excursions from a harvesting goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L128)

<a id="field-field-mq3-game-bot-voice-commands-bot-lastgoalltgtype-lastgoalltgtype-src-mq3-game-bot-voice-commands-ml-697623658"></a>
### lastgoalLtgtype

```ml
lastgoalLtgtype
```

Long-term goal type retained from the preceding team task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L136)

<a id="field-field-mq3-game-bot-voice-commands-bot-leadtime-leadtime-src-mq3-game-bot-voice-commands-ml-51425760"></a>
### leadTime

```ml
leadTime
```

Deadline associated with leading a teammate toward a goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L134)

<a id="field-field-mq3-game-bot-voice-commands-bot-ltgtype-ltgtype-src-mq3-game-bot-voice-commands-ml-1428113382"></a>
### ltgtype

```ml
ltgtype
```

Current long-term goal category selected from the LTG_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L122)

<a id="field-field-mq3-game-bot-voice-commands-bot-ordered-ordered-src-mq3-game-bot-voice-commands-ml-134072482"></a>
### ordered

```ml
ordered
```

Nonzero when a teammate explicitly ordered the current team task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L116)

<a id="field-field-mq3-game-bot-voice-commands-bot-ordertime-ordertime-src-mq3-game-bot-voice-commands-ml-1521322122"></a>
### orderTime

```ml
orderTime
```

Timestamp at which the bot order was received.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L118)

<a id="field-field-mq3-game-bot-voice-commands-bot-rushbaseawaytime-rushbaseawaytime-src-mq3-game-bot-voice-commands-ml-1945657754"></a>
### rushbaseawayTime

```ml
rushbaseawayTime
```

Time controlling temporary excursions from a rush-base goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L146)

<a id="field-field-mq3-game-bot-voice-commands-bot-team-team-src-mq3-game-bot-voice-commands-ml-626326304"></a>
### team

```ml
team
```

Team assignment associated with the client, bot, or action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L110)

<a id="field-field-mq3-game-bot-voice-commands-bot-teamgoal-teamgoal-src-mq3-game-bot-voice-commands-ml-801079122"></a>
### teamgoal

```ml
teamgoal
```

Navigation goal associated with the bot current team task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L126)

<a id="field-field-mq3-game-bot-voice-commands-bot-teamgoaltime-teamgoaltime-src-mq3-game-bot-voice-commands-ml-672113468"></a>
### teamgoalTime

```ml
teamgoalTime
```

Deadline associated with the current cooperative team goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L124)

<a id="field-field-mq3-game-bot-voice-commands-bot-teamleader-teamleader-src-mq3-game-bot-voice-commands-ml-1469005394"></a>
### teamleader

```ml
teamleader
```

Name or identifier of the current bot-team leader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L112)

<a id="field-field-mq3-game-bot-voice-commands-bot-teammate-teammate-src-mq3-game-bot-voice-commands-ml-1262165502"></a>
### teammate

```ml
teammate
```

Teammate entity/client selected for the current cooperative task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L138)

<a id="field-field-mq3-game-bot-voice-commands-bot-teammatevisibletime-teammatevisibletime-src-mq3-game-bot-voice-commands-ml-385496958"></a>
### teammatevisibleTime

```ml
teammatevisibleTime
```

Last time the teammate associated with the task was visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L142)

<a id="field-field-mq3-game-bot-voice-commands-bot-teammessagetime-teammessagetime-src-mq3-game-bot-voice-commands-ml-1798577030"></a>
### teammessageTime

```ml
teammessageTime
```

Time controlling the next bot team message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L120)
