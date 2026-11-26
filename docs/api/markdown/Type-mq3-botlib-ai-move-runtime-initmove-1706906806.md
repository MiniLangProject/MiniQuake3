# `mq3.botlib.ai_move_runtime.InitMove`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-move-runtime-ml-1991141291.md)

<a id="struct-struct-mq3-botlib-ai-move-runtime-initmove-struct-initmove-src-mq3-botlib-ai-move-runtime-ml-12024871"></a>
## InitMove

```ml
struct InitMove
```

`InitMove` record for ai move runtime, containing `origin`, `velocity`, `viewOffset`, `entityNum` and `client` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L101)

## Members

<a id="field-field-mq3-botlib-ai-move-runtime-initmove-client-client-src-mq3-botlib-ai-move-runtime-ml-918096136"></a>
### client

```ml
client
```

Client number of the bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L111)

<a id="field-field-mq3-botlib-ai-move-runtime-initmove-entitynum-entitynum-src-mq3-botlib-ai-move-runtime-ml-271067526"></a>
### entityNum

```ml
entityNum
```

Number of the game entity associated with this result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L109)

<a id="field-field-mq3-botlib-ai-move-runtime-initmove-origin-origin-src-mq3-botlib-ai-move-runtime-ml-501039346"></a>
### origin

```ml
origin
```

Initial bot position copied into the movement state for this think cycle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L103)

<a id="field-field-mq3-botlib-ai-move-runtime-initmove-ormoveflags-ormoveflags-src-mq3-botlib-ai-move-runtime-ml-141698962"></a>
### orMoveFlags

```ml
orMoveFlags
```

Values ored to the movement flags.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L119)

<a id="field-field-mq3-botlib-ai-move-runtime-initmove-presencetype-presencetype-src-mq3-botlib-ai-move-runtime-ml-1948577876"></a>
### presenceType

```ml
presenceType
```

Presence-type mask describing the bot hull or stance allowed here.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L115)

<a id="field-field-mq3-botlib-ai-move-runtime-initmove-thinktime-thinktime-src-mq3-botlib-ai-move-runtime-ml-524778006"></a>
### thinkTime

```ml
thinkTime
```

Time the bot thinks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L113)

<a id="field-field-mq3-botlib-ai-move-runtime-initmove-velocity-velocity-src-mq3-botlib-ai-move-runtime-ml-114067124"></a>
### velocity

```ml
velocity
```

World-space linear velocity associated with the moving entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L105)

<a id="field-field-mq3-botlib-ai-move-runtime-initmove-viewangles-viewangles-src-mq3-botlib-ai-move-runtime-ml-1292114456"></a>
### viewAngles

```ml
viewAngles
```

Pitch, yaw, and roll angles describing the current view direction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L117)

<a id="field-field-mq3-botlib-ai-move-runtime-initmove-viewoffset-viewoffset-src-mq3-botlib-ai-move-runtime-ml-358676082"></a>
### viewOffset

```ml
viewOffset
```

Offset from the entity origin to the viewing position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L107)
