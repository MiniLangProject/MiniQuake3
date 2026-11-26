# `mq3.game.bot_navigation.Goal`

[Home](README.md) · [Source file](File-src-mq3-game-bot-navigation-ml-746290412.md)

<a id="struct-struct-mq3-game-bot-navigation-goal-struct-goal-src-mq3-game-bot-navigation-ml-1208827849"></a>
## Goal

```ml
struct Goal
```

`Goal` record for bot navigation, containing `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L156)

## Members

<a id="field-field-mq3-game-bot-navigation-goal-areanum-areanum-src-mq3-game-bot-navigation-ml-121792116"></a>
### areanum

```ml
areanum
```

AAS area containing the bot or spatial goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L158)

<a id="field-field-mq3-game-bot-navigation-goal-entitynum-entitynum-src-mq3-game-bot-navigation-ml-362502072"></a>
### entitynum

```ml
entitynum
```

Entity number associated with the bot navigation goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L160)

<a id="field-field-mq3-game-bot-navigation-goal-flags-flags-src-mq3-game-bot-navigation-ml-1796447204"></a>
### flags

```ml
flags
```

GFL_* flags describing this bot navigation goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L172)

<a id="field-field-mq3-game-bot-navigation-goal-iteminfo-iteminfo-src-mq3-game-bot-navigation-ml-1383077050"></a>
### iteminfo

```ml
iteminfo
```

Item-definition index or information attached to this navigation goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L168)

<a id="field-field-mq3-game-bot-navigation-goal-maxs-maxs-src-mq3-game-bot-navigation-ml-1089098742"></a>
### maxs

```ml
maxs
```

Upper local bounding-box corner of the bot navigation goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L166)

<a id="field-field-mq3-game-bot-navigation-goal-mins-mins-src-mq3-game-bot-navigation-ml-181735610"></a>
### mins

```ml
mins
```

Lower local bounding-box corner of the bot navigation goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L164)

<a id="field-field-mq3-game-bot-navigation-goal-number-number-src-mq3-game-bot-navigation-ml-792070550"></a>
### number

```ml
number
```

Botlib goal number identifying this navigation target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L170)

<a id="field-field-mq3-game-bot-navigation-goal-origin-origin-src-mq3-game-bot-navigation-ml-1322577256"></a>
### origin

```ml
origin
```

World-space target position of the bot navigation goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L162)
