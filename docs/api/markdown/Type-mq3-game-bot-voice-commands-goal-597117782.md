# `mq3.game.bot_voice_commands.Goal`

[Home](README.md) · [Source file](File-src-mq3-game-bot-voice-commands-ml-1061280133.md)

<a id="struct-struct-mq3-game-bot-voice-commands-goal-struct-goal-src-mq3-game-bot-voice-commands-ml-2083169803"></a>
## Goal

```ml
struct Goal
```

`Goal` record for bot voice commands, containing `entitynum`, `areanum`, `origin`, `mins` and `maxs` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L67)

## Members

<a id="field-field-mq3-game-bot-voice-commands-goal-areanum-areanum-src-mq3-game-bot-voice-commands-ml-310699918"></a>
### areanum

```ml
areanum
```

AAS area containing the bot or spatial goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L71)

<a id="field-field-mq3-game-bot-voice-commands-goal-entitynum-entitynum-src-mq3-game-bot-voice-commands-ml-1138585522"></a>
### entitynum

```ml
entitynum
```

Entity number associated with the goal selected by a bot voice command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L69)

<a id="field-field-mq3-game-bot-voice-commands-goal-maxs-maxs-src-mq3-game-bot-voice-commands-ml-1208688072"></a>
### maxs

```ml
maxs
```

Upper local bounding-box corner of the goal selected by a bot voice command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L77)

<a id="field-field-mq3-game-bot-voice-commands-goal-mins-mins-src-mq3-game-bot-voice-commands-ml-1996470656"></a>
### mins

```ml
mins
```

Lower local bounding-box corner of the goal selected by a bot voice command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L75)

<a id="field-field-mq3-game-bot-voice-commands-goal-origin-origin-src-mq3-game-bot-voice-commands-ml-187883086"></a>
### origin

```ml
origin
```

World-space target position of the goal selected by a bot voice command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L73)

<a id="field-field-mq3-game-bot-voice-commands-goal-tag-tag-src-mq3-game-bot-voice-commands-ml-1557719674"></a>
### tag

```ml
tag
```

Identifier identifying the voice-command navigation goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L79)
