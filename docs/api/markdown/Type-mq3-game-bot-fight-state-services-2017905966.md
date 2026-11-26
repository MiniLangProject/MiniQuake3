# `mq3.game.bot_fight_state.Services`

[Home](README.md) · [Source file](File-src-mq3-game-bot-fight-state-ml-409372288.md)

<a id="struct-struct-mq3-game-bot-fight-state-services-struct-services-src-mq3-game-bot-fight-state-ml-1861638831"></a>
## Services

```ml
struct Services
```

`Services` record for bot fight state, containing `combatServices`, `observerFn`, `recordNodeFn`, `resetLastAvoidFn` and `enterNodeFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L55)

## Members

<a id="field-field-mq3-game-bot-fight-state-services-areareachablefn-areareachablefn-src-mq3-game-bot-fight-state-ml-808351169"></a>
### areaReachableFn

```ml
areaReachableFn
```

Injected callback for area reachable; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L79)

<a id="field-field-mq3-game-bot-fight-state-services-battleuseitemsfn-battleuseitemsfn-src-mq3-game-bot-fight-state-ml-206979335"></a>
### battleUseItemsFn

```ml
battleUseItemsFn
```

Injected callback for battle use items; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L83)

<a id="field-field-mq3-game-bot-fight-state-services-blockedfn-blockedfn-src-mq3-game-bot-fight-state-ml-703761249"></a>
### blockedFn

```ml
blockedFn
```

Injected callback for blocked; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L89)

<a id="field-field-mq3-game-bot-fight-state-services-chatenemysuicidefn-chatenemysuicidefn-src-mq3-game-bot-fight-state-ml-2100994817"></a>
### chatEnemySuicideFn

```ml
chatEnemySuicideFn
```

Injected callback for chat enemy suicide; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L67)

<a id="field-field-mq3-game-bot-fight-state-services-chathitnodeathfn-chathitnodeathfn-src-mq3-game-bot-fight-state-ml-1305348057"></a>
### chatHitNoDeathFn

```ml
chatHitNoDeathFn
```

Injected callback for chat hit no death; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L71)

<a id="field-field-mq3-game-bot-fight-state-services-chathitnokillfn-chathitnokillfn-src-mq3-game-bot-fight-state-ml-1854557993"></a>
### chatHitNoKillFn

```ml
chatHitNoKillFn
```

Injected callback for chat hit no kill; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L73)

<a id="field-field-mq3-game-bot-fight-state-services-chatkillfn-chatkillfn-src-mq3-game-bot-fight-state-ml-1658816569"></a>
### chatKillFn

```ml
chatKillFn
```

Injected callback for chat kill; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L69)

<a id="field-field-mq3-game-bot-fight-state-services-chattimefn-chattimefn-src-mq3-game-bot-fight-state-ml-899984143"></a>
### chatTimeFn

```ml
chatTimeFn
```

Injected callback for chat time; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L75)

<a id="field-field-mq3-game-bot-fight-state-services-chooseweaponfn-chooseweaponfn-src-mq3-game-bot-fight-state-ml-427930971"></a>
### chooseWeaponFn

```ml
chooseWeaponFn
```

Injected callback for choose weapon; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L87)

<a id="field-field-mq3-game-bot-fight-state-services-combatservices-combatservices-src-mq3-game-bot-fight-state-ml-471626669"></a>
### combatServices

```ml
combatServices
```

Callbacks and shared state used by bot combat decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L57)

<a id="field-field-mq3-game-bot-fight-state-services-context-context-src-mq3-game-bot-fight-state-ml-935186577"></a>
### context

```ml
context
```

Opaque caller-supplied context available to bot fight-state transitions, battle actions, and movement-goal callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L120)

<a id="field-field-mq3-game-bot-fight-state-services-dmnetservices-dmnetservices-src-mq3-game-bot-fight-state-ml-1078946361"></a>
### dmnetServices

```ml
dmnetServices
```

Callbacks used to execute the bot deathmatch decision network.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L117)

<a id="field-field-mq3-game-bot-fight-state-services-emptygoalstackfn-emptygoalstackfn-src-mq3-game-bot-fight-state-ml-2115128737"></a>
### emptyGoalStackFn

```ml
emptyGoalStackFn
```

Injected callback for empty goal stack; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L105)

<a id="field-field-mq3-game-bot-fight-state-services-enternodefn-enternodefn-src-mq3-game-bot-fight-state-ml-1136641041"></a>
### enterNodeFn

```ml
enterNodeFn
```

Injected callback for enter node; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L65)

<a id="field-field-mq3-game-bot-fight-state-services-grapple-grapple-src-mq3-game-bot-fight-state-ml-155687161"></a>
### grapple

```ml
grapple
```

Grappling-hook movement support supplied to the bot controller.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L85)

<a id="field-field-mq3-game-bot-fight-state-services-longtermgoalfn-longtermgoalfn-src-mq3-game-bot-fight-state-ml-694376203"></a>
### longTermGoalFn

```ml
longTermGoalFn
```

Injected callback for long term goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L109)

<a id="field-field-mq3-game-bot-fight-state-services-mapscriptsfn-mapscriptsfn-src-mq3-game-bot-fight-state-ml-1672383633"></a>
### mapScriptsFn

```ml
mapScriptsFn
```

Injected callback for map scripts; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L93)

<a id="field-field-mq3-game-bot-fight-state-services-missionenemytargetfn-missionenemytargetfn-src-mq3-game-bot-fight-state-ml-1430070731"></a>
### missionEnemyTargetFn

```ml
missionEnemyTargetFn
```

Injected callback for mission enemy target; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L113)

<a id="field-field-mq3-game-bot-fight-state-services-missionnearbyrangefn-missionnearbyrangefn-src-mq3-game-bot-fight-state-ml-737938417"></a>
### missionNearbyRangeFn

```ml
missionNearbyRangeFn
```

Injected callback for mission nearby range; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L115)

<a id="field-field-mq3-game-bot-fight-state-services-movementviewtargetfn-movementviewtargetfn-src-mq3-game-bot-fight-state-ml-1740595327"></a>
### movementViewTargetFn

```ml
movementViewTargetFn
```

Injected callback for movement view target; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L111)

<a id="field-field-mq3-game-bot-fight-state-services-nearbygoalfn-nearbygoalfn-src-mq3-game-bot-fight-state-ml-105335209"></a>
### nearbyGoalFn

```ml
nearbyGoalFn
```

Injected callback for nearby goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L97)

<a id="field-field-mq3-game-bot-fight-state-services-observerfn-observerfn-src-mq3-game-bot-fight-state-ml-1583624145"></a>
### observerFn

```ml
observerFn
```

Injected callback for observer; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L59)

<a id="field-field-mq3-game-bot-fight-state-services-pointareafn-pointareafn-src-mq3-game-bot-fight-state-ml-748747449"></a>
### pointAreaFn

```ml
pointAreaFn
```

Injected callback for point area; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L77)

<a id="field-field-mq3-game-bot-fight-state-services-popgoalfn-popgoalfn-src-mq3-game-bot-fight-state-ml-291750517"></a>
### popGoalFn

```ml
popGoalFn
```

Injected callback for pop goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L101)

<a id="field-field-mq3-game-bot-fight-state-services-reachedgoalfn-reachedgoalfn-src-mq3-game-bot-fight-state-ml-1113280525"></a>
### reachedGoalFn

```ml
reachedGoalFn
```

Injected callback for reached goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L103)

<a id="field-field-mq3-game-bot-fight-state-services-recordnodefn-recordnodefn-src-mq3-game-bot-fight-state-ml-1572214711"></a>
### recordNodeFn

```ml
recordNodeFn
```

Injected callback for record node; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L61)

<a id="field-field-mq3-game-bot-fight-state-services-resetavoidfn-resetavoidfn-src-mq3-game-bot-fight-state-ml-1302517749"></a>
### resetAvoidFn

```ml
resetAvoidFn
```

Injected callback for reset avoid; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L91)

<a id="field-field-mq3-game-bot-fight-state-services-resetlastavoidfn-resetlastavoidfn-src-mq3-game-bot-fight-state-ml-1276747425"></a>
### resetLastAvoidFn

```ml
resetLastAvoidFn
```

Injected callback for reset last avoid; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L63)

<a id="field-field-mq3-game-bot-fight-state-services-teamgoalsfn-teamgoalsfn-src-mq3-game-bot-fight-state-ml-797071093"></a>
### teamGoalsFn

```ml
teamGoalsFn
```

Injected callback for team goals; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L107)

<a id="field-field-mq3-game-bot-fight-state-services-topgoalfn-topgoalfn-src-mq3-game-bot-fight-state-ml-541164125"></a>
### topGoalFn

```ml
topGoalFn
```

Injected callback for top goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L99)

<a id="field-field-mq3-game-bot-fight-state-services-touchinggoalfn-touchinggoalfn-src-mq3-game-bot-fight-state-ml-204971105"></a>
### touchingGoalFn

```ml
touchingGoalFn
```

Injected callback for touching goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L95)

<a id="field-field-mq3-game-bot-fight-state-services-updatebattlefn-updatebattlefn-src-mq3-game-bot-fight-state-ml-94408399"></a>
### updateBattleFn

```ml
updateBattleFn
```

Injected callback for update battle; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L81)
