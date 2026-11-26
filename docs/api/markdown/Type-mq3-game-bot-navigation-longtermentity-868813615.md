# `mq3.game.bot_navigation.LongTermEntity`

[Home](README.md) · [Source file](File-src-mq3-game-bot-navigation-ml-746290412.md)

<a id="struct-struct-mq3-game-bot-navigation-longtermentity-struct-longtermentity-src-mq3-game-bot-navigation-ml-324930037"></a>
## LongTermEntity

```ml
struct LongTermEntity
```

`LongTermEntity` record for bot navigation, containing `valid`, `origin`, `mins`, `maxs` and `angles`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L182)

## Members

<a id="field-field-mq3-game-bot-navigation-longtermentity-angles-angles-src-mq3-game-bot-navigation-ml-527589644"></a>
### angles

```ml
angles
```

Orientation angles used by the entity or movement operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L192)

<a id="field-field-mq3-game-bot-navigation-longtermentity-maxs-maxs-src-mq3-game-bot-navigation-ml-896719070"></a>
### maxs

```ml
maxs
```

Upper local collision-bound corner of the entity considered for a long-term goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L190)

<a id="field-field-mq3-game-bot-navigation-longtermentity-mins-mins-src-mq3-game-bot-navigation-ml-1594066370"></a>
### mins

```ml
mins
```

Lower local collision-bound corner of the entity considered for a long-term goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L188)

<a id="field-field-mq3-game-bot-navigation-longtermentity-origin-origin-src-mq3-game-bot-navigation-ml-128617136"></a>
### origin

```ml
origin
```

Reported world-space position of the entity considered for a long-term goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L186)

<a id="field-field-mq3-game-bot-navigation-longtermentity-valid-valid-src-mq3-game-bot-navigation-ml-236195916"></a>
### valid

```ml
valid
```

True when entity information is available for long-term goal selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L184)
