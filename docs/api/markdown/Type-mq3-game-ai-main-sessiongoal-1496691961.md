# `mq3.game.ai_main.SessionGoal`

[Home](README.md) · [Source file](File-src-mq3-game-ai-main-ml-353661212.md)

<a id="struct-struct-mq3-game-ai-main-sessiongoal-struct-sessiongoal-src-mq3-game-ai-main-ml-121510451"></a>
## SessionGoal

```ml
struct SessionGoal
```

`SessionGoal` record for ai main, containing `areanum`, `entitynum`, `flags`, `iteminfo` and `number` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_main.ml#L50)

## Members

<a id="field-field-mq3-game-ai-main-sessiongoal-areanum-areanum-src-mq3-game-ai-main-ml-1379727686"></a>
### areanum

```ml
areanum
```

AAS area containing the bot or spatial goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_main.ml#L52)

<a id="field-field-mq3-game-ai-main-sessiongoal-entitynum-entitynum-src-mq3-game-ai-main-ml-1207531834"></a>
### entitynum

```ml
entitynum
```

Entity number associated with the bot goal retained in session state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_main.ml#L54)

<a id="field-field-mq3-game-ai-main-sessiongoal-flags-flags-src-mq3-game-ai-main-ml-1436295270"></a>
### flags

```ml
flags
```

GFL_* flags describing this bot navigation goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_main.ml#L56)

<a id="field-field-mq3-game-ai-main-sessiongoal-iteminfo-iteminfo-src-mq3-game-ai-main-ml-793403664"></a>
### iteminfo

```ml
iteminfo
```

Item-definition index or information attached to this navigation goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_main.ml#L58)

<a id="field-field-mq3-game-ai-main-sessiongoal-maxs-maxs-src-mq3-game-ai-main-ml-1192246084"></a>
### maxs

```ml
maxs
```

Upper local bounding-box corner of the bot goal retained in session state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_main.ml#L66)

<a id="field-field-mq3-game-ai-main-sessiongoal-mins-mins-src-mq3-game-ai-main-ml-181342256"></a>
### mins

```ml
mins
```

Lower local bounding-box corner of the bot goal retained in session state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_main.ml#L64)

<a id="field-field-mq3-game-ai-main-sessiongoal-number-number-src-mq3-game-ai-main-ml-1554741452"></a>
### number

```ml
number
```

Botlib goal number identifying this navigation target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_main.ml#L60)

<a id="field-field-mq3-game-ai-main-sessiongoal-origin-origin-src-mq3-game-ai-main-ml-1786544058"></a>
### origin

```ml
origin
```

World-space target position of the bot goal retained in session state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_main.ml#L62)
