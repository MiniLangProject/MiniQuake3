# `mq3.game.bot_input.BotInput`

[Home](README.md) · [Source file](File-src-mq3-game-bot-input-ml-1155152552.md)

<a id="struct-struct-mq3-game-bot-input-botinput-struct-botinput-src-mq3-game-bot-input-ml-291349871"></a>
## BotInput

```ml
struct BotInput
```

`BotInput` record for bot input, containing `thinktime`, `dir`, `speed`, `viewangles` and `actionflags` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_input.ml#L78)

## Members

<a id="field-field-mq3-game-bot-input-botinput-actionflags-actionflags-src-mq3-game-bot-input-ml-311065642"></a>
### actionflags

```ml
actionflags
```

Bot action bits describing the requested buttons and movement actions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_input.ml#L88)

<a id="field-field-mq3-game-bot-input-botinput-dir-dir-src-mq3-game-bot-input-ml-922457466"></a>
### dir

```ml
dir
```

Requested movement direction vector supplied to bot input generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_input.ml#L82)

<a id="field-field-mq3-game-bot-input-botinput-speed-speed-src-mq3-game-bot-input-ml-1433841394"></a>
### speed

```ml
speed
```

Movement or travel speed used by this game object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_input.ml#L84)

<a id="field-field-mq3-game-bot-input-botinput-thinktime-thinktime-src-mq3-game-bot-input-ml-1836216090"></a>
### thinktime

```ml
thinktime
```

Time interval used for the current bot thinking/update step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_input.ml#L80)

<a id="field-field-mq3-game-bot-input-botinput-viewangles-viewangles-src-mq3-game-bot-input-ml-1813409528"></a>
### viewangles

```ml
viewangles
```

Player or bot viewing angles used for aiming and command generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_input.ml#L86)

<a id="field-field-mq3-game-bot-input-botinput-weapon-weapon-src-mq3-game-bot-input-ml-705037910"></a>
### weapon

```ml
weapon
```

Selected or reported weapon identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_input.ml#L90)
