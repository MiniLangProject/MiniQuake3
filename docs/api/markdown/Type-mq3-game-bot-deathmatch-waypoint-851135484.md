# `mq3.game.bot_deathmatch.Waypoint`

[Home](README.md) · [Source file](File-src-mq3-game-bot-deathmatch-ml-113231271.md)

<a id="struct-struct-mq3-game-bot-deathmatch-waypoint-struct-waypoint-src-mq3-game-bot-deathmatch-ml-568215863"></a>
## Waypoint

```ml
struct Waypoint
```

`Waypoint` record for bot deathmatch, containing `name`, `origin`, `areanum` and `next`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L135)

## Members

<a id="field-field-mq3-game-bot-deathmatch-waypoint-areanum-areanum-src-mq3-game-bot-deathmatch-ml-1063187026"></a>
### areanum

```ml
areanum
```

AAS area containing the bot or spatial goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L141)

<a id="field-field-mq3-game-bot-deathmatch-waypoint-name-name-src-mq3-game-bot-deathmatch-ml-291683092"></a>
### name

```ml
name
```

Name used to refer to this navigation goal or waypoint in bot orders.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L137)

<a id="field-field-mq3-game-bot-deathmatch-waypoint-next-next-src-mq3-game-bot-deathmatch-ml-184269496"></a>
### next

```ml
next
```

Next waypoint in the linked navigation route.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L143)

<a id="field-field-mq3-game-bot-deathmatch-waypoint-origin-origin-src-mq3-game-bot-deathmatch-ml-1301868234"></a>
### origin

```ml
origin
```

World-space position of this waypoint in a bot navigation route.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L139)
