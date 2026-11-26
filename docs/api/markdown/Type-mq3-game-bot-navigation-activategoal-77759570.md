# `mq3.game.bot_navigation.ActivateGoal`

[Home](README.md) · [Source file](File-src-mq3-game-bot-navigation-ml-746290412.md)

<a id="struct-struct-mq3-game-bot-navigation-activategoal-struct-activategoal-src-mq3-game-bot-navigation-ml-1196488625"></a>
## ActivateGoal

```ml
struct ActivateGoal
```

`ActivateGoal` record for bot navigation, containing `inuse`, `time`, `startTime`, `justusedTime` and `origin` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L215)

## Members

<a id="field-field-mq3-game-bot-navigation-activategoal-areas-areas-src-mq3-game-bot-navigation-ml-1859025343"></a>
### areas

```ml
areas
```

AAS routing-area numbers affected by the blocking or activatable entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L231)

<a id="field-field-mq3-game-bot-navigation-activategoal-areasdisabled-areasdisabled-src-mq3-game-bot-navigation-ml-2098229471"></a>
### areasdisabled

```ml
areasdisabled
```

Nonzero while the recorded AAS areas are disabled for routing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L233)

<a id="field-field-mq3-game-bot-navigation-activategoal-goal-goal-src-mq3-game-bot-navigation-ml-10612493"></a>
### goal

```ml
goal
```

Navigation or activation goal associated with the current task.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L227)

<a id="field-field-mq3-game-bot-navigation-activategoal-inuse-inuse-src-mq3-game-bot-navigation-ml-394296703"></a>
### inuse

```ml
inuse
```

Nonzero when this entity, client, or bot record currently represents a live allocated object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L217)

<a id="field-field-mq3-game-bot-navigation-activategoal-justusedtime-justusedtime-src-mq3-game-bot-navigation-ml-225059359"></a>
### justusedTime

```ml
justusedTime
```

Timestamp at which this activation goal was most recently used.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L223)

<a id="field-field-mq3-game-bot-navigation-activategoal-nextindex-nextindex-src-mq3-game-bot-navigation-ml-182250399"></a>
### nextIndex

```ml
nextIndex
```

Index of the next activation-goal record in the active chain.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L235)

<a id="field-field-mq3-game-bot-navigation-activategoal-numareas-numareas-src-mq3-game-bot-navigation-ml-490314287"></a>
### numareas

```ml
numareas
```

Number of AAS routing areas recorded for the activation goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L229)

<a id="field-field-mq3-game-bot-navigation-activategoal-origin-origin-src-mq3-game-bot-navigation-ml-631689647"></a>
### origin

```ml
origin
```

World-space activation target used while approaching or triggering an obstacle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L225)

<a id="field-field-mq3-game-bot-navigation-activategoal-shoot-shoot-src-mq3-game-bot-navigation-ml-27987279"></a>
### shoot

```ml
shoot
```

Nonzero when the activation goal must be triggered by shooting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L237)

<a id="field-field-mq3-game-bot-navigation-activategoal-starttime-starttime-src-mq3-game-bot-navigation-ml-2068181643"></a>
### startTime

```ml
startTime
```

Timestamp at which work on the activation goal began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L221)

<a id="field-field-mq3-game-bot-navigation-activategoal-target-target-src-mq3-game-bot-navigation-ml-1829875045"></a>
### target

```ml
target
```

Target-name selector identifying entities activated by this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L241)

<a id="field-field-mq3-game-bot-navigation-activategoal-time-time-src-mq3-game-bot-navigation-ml-1778502633"></a>
### time

```ml
time
```

Time limit associated with completing the activation goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L219)

<a id="field-field-mq3-game-bot-navigation-activategoal-weapon-weapon-src-mq3-game-bot-navigation-ml-1738728559"></a>
### weapon

```ml
weapon
```

Selected or reported weapon identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L239)
