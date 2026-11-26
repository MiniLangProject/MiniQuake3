# `mq3.game.bot_navigation.NavTrace`

[Home](README.md) · [Source file](File-src-mq3-game-bot-navigation-ml-746290412.md)

<a id="struct-struct-mq3-game-bot-navigation-navtrace-struct-navtrace-src-mq3-game-bot-navigation-ml-914839777"></a>
## NavTrace

```ml
struct NavTrace
```

`NavTrace` record for bot navigation, containing `fraction`, `endpos` and `startsolid`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L206)

## Members

<a id="field-field-mq3-game-bot-navigation-navtrace-endpos-endpos-src-mq3-game-bot-navigation-ml-1118360417"></a>
### endpos

```ml
endpos
```

Final position reached by the collision trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L210)

<a id="field-field-mq3-game-bot-navigation-navtrace-fraction-fraction-src-mq3-game-bot-navigation-ml-2100490867"></a>
### fraction

```ml
fraction
```

Fraction of the requested trace completed before the first blocking collision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L208)

<a id="field-field-mq3-game-bot-navigation-navtrace-startsolid-startsolid-src-mq3-game-bot-navigation-ml-1315650293"></a>
### startsolid

```ml
startsolid
```

Nonzero when the requested trace begins inside solid space.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L212)
