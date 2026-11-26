# `mq3.game.bot_deathmatch.Goal`

[Home](README.md) · [Source file](File-src-mq3-game-bot-deathmatch-ml-113231271.md)

<a id="struct-struct-mq3-game-bot-deathmatch-goal-struct-goal-src-mq3-game-bot-deathmatch-ml-181470067"></a>
## Goal

```ml
struct Goal
```

`Goal` record for bot deathmatch, containing `number`, `entitynum`, `areanum`, `origin` and `mins` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L80)

## Members

<a id="field-field-mq3-game-bot-deathmatch-goal-areanum-areanum-src-mq3-game-bot-deathmatch-ml-1074796102"></a>
### areanum

```ml
areanum
```

AAS area containing the bot or spatial goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L86)

<a id="field-field-mq3-game-bot-deathmatch-goal-entitynum-entitynum-src-mq3-game-bot-deathmatch-ml-1970796658"></a>
### entitynum

```ml
entitynum
```

Entity number associated with the goal used by deathmatch and team-task selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L84)

<a id="field-field-mq3-game-bot-deathmatch-goal-maxs-maxs-src-mq3-game-bot-deathmatch-ml-182164"></a>
### maxs

```ml
maxs
```

Upper local bounding-box corner of the goal used by deathmatch and team-task selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L92)

<a id="field-field-mq3-game-bot-deathmatch-goal-mins-mins-src-mq3-game-bot-deathmatch-ml-1441359164"></a>
### mins

```ml
mins
```

Lower local bounding-box corner of the goal used by deathmatch and team-task selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L90)

<a id="field-field-mq3-game-bot-deathmatch-goal-number-number-src-mq3-game-bot-deathmatch-ml-802501580"></a>
### number

```ml
number
```

Botlib goal number identifying this navigation target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L82)

<a id="field-field-mq3-game-bot-deathmatch-goal-origin-origin-src-mq3-game-bot-deathmatch-ml-838406190"></a>
### origin

```ml
origin
```

World-space target position of the goal used by deathmatch and team-task selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L88)
