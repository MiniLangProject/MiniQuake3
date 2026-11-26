# `mq3.game.bot_command_matches.Goal`

[Home](README.md) · [Source file](File-src-mq3-game-bot-command-matches-ml-960564493.md)

<a id="struct-struct-mq3-game-bot-command-matches-goal-struct-goal-src-mq3-game-bot-command-matches-ml-251580859"></a>
## Goal

```ml
struct Goal
```

`Goal` record for bot command matches, containing `number`, `entitynum`, `areanum`, `origin` and `mins` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L229)

## Members

<a id="field-field-mq3-game-bot-command-matches-goal-areanum-areanum-src-mq3-game-bot-command-matches-ml-1984799806"></a>
### areanum

```ml
areanum
```

AAS area containing the bot or spatial goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L235)

<a id="field-field-mq3-game-bot-command-matches-goal-entitynum-entitynum-src-mq3-game-bot-command-matches-ml-699717106"></a>
### entitynum

```ml
entitynum
```

Entity number associated with the goal selected by a matched bot text command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L233)

<a id="field-field-mq3-game-bot-command-matches-goal-flags-flags-src-mq3-game-bot-command-matches-ml-1874203966"></a>
### flags

```ml
flags
```

GFL_* flags describing this bot navigation goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L243)

<a id="field-field-mq3-game-bot-command-matches-goal-maxs-maxs-src-mq3-game-bot-command-matches-ml-7354044"></a>
### maxs

```ml
maxs
```

Upper local bounding-box corner of the goal selected by a matched bot text command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L241)

<a id="field-field-mq3-game-bot-command-matches-goal-mins-mins-src-mq3-game-bot-command-matches-ml-1547401908"></a>
### mins

```ml
mins
```

Lower local bounding-box corner of the goal selected by a matched bot text command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L239)

<a id="field-field-mq3-game-bot-command-matches-goal-name-name-src-mq3-game-bot-command-matches-ml-1221038296"></a>
### name

```ml
name
```

Name used to refer to this navigation goal or waypoint in bot orders.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L245)

<a id="field-field-mq3-game-bot-command-matches-goal-number-number-src-mq3-game-bot-command-matches-ml-1287077156"></a>
### number

```ml
number
```

Botlib goal number identifying this navigation target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L231)

<a id="field-field-mq3-game-bot-command-matches-goal-origin-origin-src-mq3-game-bot-command-matches-ml-2030780694"></a>
### origin

```ml
origin
```

World-space target position of the goal selected by a matched bot text command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L237)
