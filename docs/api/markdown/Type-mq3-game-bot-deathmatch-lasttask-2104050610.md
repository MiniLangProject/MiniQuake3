# `mq3.game.bot_deathmatch.LastTask`

[Home](README.md) · [Source file](File-src-mq3-game-bot-deathmatch-ml-113231271.md)

<a id="struct-struct-mq3-game-bot-deathmatch-lasttask-struct-lasttask-src-mq3-game-bot-deathmatch-ml-866610911"></a>
## LastTask

```ml
struct LastTask
```

`LastTask` record for bot deathmatch, containing `valid`, `decisionmaker`, `ltgtype`, `teamgoal` and `teammate`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_deathmatch.ml#L146)

## Members

<a id="field-field-mq3-game-bot-deathmatch-lasttask-decisionmaker-decisionmaker-src-mq3-game-bot-deathmatch-ml-744364236"></a>
### decisionmaker

```ml
decisionmaker
```

Client/entity currently responsible for the bot team decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_deathmatch.ml#L150)

<a id="field-field-mq3-game-bot-deathmatch-lasttask-ltgtype-ltgtype-src-mq3-game-bot-deathmatch-ml-1155395160"></a>
### ltgtype

```ml
ltgtype
```

Current long-term goal category selected from the LTG_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_deathmatch.ml#L152)

<a id="field-field-mq3-game-bot-deathmatch-lasttask-teamgoal-teamgoal-src-mq3-game-bot-deathmatch-ml-625287700"></a>
### teamgoal

```ml
teamgoal
```

Navigation goal associated with the bot current team task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_deathmatch.ml#L154)

<a id="field-field-mq3-game-bot-deathmatch-lasttask-teammate-teammate-src-mq3-game-bot-deathmatch-ml-670687568"></a>
### teammate

```ml
teammate
```

Teammate entity/client selected for the current cooperative task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_deathmatch.ml#L156)

<a id="field-field-mq3-game-bot-deathmatch-lasttask-valid-valid-src-mq3-game-bot-deathmatch-ml-505708724"></a>
### valid

```ml
valid
```

True while a previously ordered bot task is available for restoration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_deathmatch.ml#L148)
