# `mq3.game.bot_navigation.Route`

[Home](README.md) · [Source file](File-src-mq3-game-bot-navigation-ml-746290412.md)

<a id="struct-struct-mq3-game-bot-navigation-route-struct-route-src-mq3-game-bot-navigation-ml-170232517"></a>
## Route

```ml
struct Route
```

`Route` record for bot navigation, containing `stopevent` and `endcontents`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L149)

## Members

<a id="field-field-mq3-game-bot-navigation-route-endcontents-endcontents-src-mq3-game-bot-navigation-ml-1765258358"></a>
### endcontents

```ml
endcontents
```

Contents mask at the final predicted movement position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L153)

<a id="field-field-mq3-game-bot-navigation-route-stopevent-stopevent-src-mq3-game-bot-navigation-ml-1758453054"></a>
### stopevent

```ml
stopevent
```

Event or mask that caused movement/route prediction to stop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L151)
