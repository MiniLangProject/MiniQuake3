# `mq3.game.bot_navigation.InitMove`

[Home](README.md) · [Source file](File-src-mq3-game-bot-navigation-ml-746290412.md)

<a id="struct-struct-mq3-game-bot-navigation-initmove-struct-initmove-src-mq3-game-bot-navigation-ml-1492221597"></a>
## InitMove

```ml
struct InitMove
```

`InitMove` record for bot navigation, containing `origin`, `velocity`, `viewoffset`, `entitynum` and `client` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L113)

## Members

<a id="field-field-mq3-game-bot-navigation-initmove-client-client-src-mq3-game-bot-navigation-ml-1900403430"></a>
### client

```ml
client
```

Client slot passed to botlib when initializing this bot's movement state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L123)

<a id="field-field-mq3-game-bot-navigation-initmove-entitynum-entitynum-src-mq3-game-bot-navigation-ml-1060858712"></a>
### entitynum

```ml
entitynum
```

Entity number passed to botlib for movement and collision setup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L121)

<a id="field-field-mq3-game-bot-navigation-initmove-origin-origin-src-mq3-game-bot-navigation-ml-1766569864"></a>
### origin

```ml
origin
```

Current bot position passed to botlib during movement-state initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L115)

<a id="field-field-mq3-game-bot-navigation-initmove-ormoveflags-ormoveflags-src-mq3-game-bot-navigation-ml-51673492"></a>
### orMoveflags

```ml
orMoveflags
```

Additional movement flags ORed into the bot movement request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L127)

<a id="field-field-mq3-game-bot-navigation-initmove-presencetype-presencetype-src-mq3-game-bot-navigation-ml-277068234"></a>
### presencetype

```ml
presencetype
```

Bot presence shape used when choosing navigation and collision bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L129)

<a id="field-field-mq3-game-bot-navigation-initmove-thinktime-thinktime-src-mq3-game-bot-navigation-ml-44431296"></a>
### thinktime

```ml
thinktime
```

Time interval used for the current bot thinking/update step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L125)

<a id="field-field-mq3-game-bot-navigation-initmove-velocity-velocity-src-mq3-game-bot-navigation-ml-1223766886"></a>
### velocity

```ml
velocity
```

Velocity vector used to advance movement or predict a position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L117)

<a id="field-field-mq3-game-bot-navigation-initmove-viewangles-viewangles-src-mq3-game-bot-navigation-ml-1686368322"></a>
### viewangles

```ml
viewangles
```

Player or bot viewing angles used for aiming and command generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L131)

<a id="field-field-mq3-game-bot-navigation-initmove-viewoffset-viewoffset-src-mq3-game-bot-navigation-ml-1630900776"></a>
### viewoffset

```ml
viewoffset
```

Offset from the entity origin to the bot viewing position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L119)
