# `mq3.game.bot_seek_state.Services`

[Home](README.md) · [Source file](File-src-mq3-game-bot-seek-state-ml-2095182684.md)

<a id="struct-struct-mq3-game-bot-seek-state-services-struct-services-src-mq3-game-bot-seek-state-ml-1961372065"></a>
## Services

```ml
struct Services
```

`Services` record for bot seek state, containing `fightServices`, `navigationServices`, `observerFn`, `recordNodeFn` and `enterNodeFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L51)

## Members

<a id="field-field-mq3-game-bot-seek-state-services-activateoriginfn-activateoriginfn-src-mq3-game-bot-seek-state-ml-1013091435"></a>
### activateOriginFn

```ml
activateOriginFn
```

Injected callback for activate origin; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L145)

<a id="field-field-mq3-game-bot-seek-state-services-activatetouchfn-activatetouchfn-src-mq3-game-bot-seek-state-ml-1113689817"></a>
### activateTouchFn

```ml
activateTouchFn
```

Injected callback for activate touch; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L143)

<a id="field-field-mq3-game-bot-seek-state-services-activatetracefn-activatetracefn-src-mq3-game-bot-seek-state-ml-862735017"></a>
### activateTraceFn

```ml
activateTraceFn
```

Injected callback for activate trace; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L141)

<a id="field-field-mq3-game-bot-seek-state-services-activationnodefn-activationnodefn-src-mq3-game-bot-seek-state-ml-1952023373"></a>
### activationNodeFn

```ml
activationNodeFn
```

Injected callback for activation node; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L139)

<a id="field-field-mq3-game-bot-seek-state-services-attackfn-attackfn-src-mq3-game-bot-seek-state-ml-1273858981"></a>
### attackFn

```ml
attackFn
```

Injected callback for attack; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L147)

<a id="field-field-mq3-game-bot-seek-state-services-blockedfn-blockedfn-src-mq3-game-bot-seek-state-ml-774836721"></a>
### blockedFn

```ml
blockedFn
```

Injected callback for blocked; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L97)

<a id="field-field-mq3-game-bot-seek-state-services-chattimefn-chattimefn-src-mq3-game-bot-seek-state-ml-1387559891"></a>
### chatTimeFn

```ml
chatTimeFn
```

Injected callback for chat time; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L69)

<a id="field-field-mq3-game-bot-seek-state-services-chooseweaponfn-chooseweaponfn-src-mq3-game-bot-seek-state-ml-2020323159"></a>
### chooseWeaponFn

```ml
chooseWeaponFn
```

Injected callback for choose weapon; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L113)

<a id="field-field-mq3-game-bot-seek-state-services-clearactivatefn-clearactivatefn-src-mq3-game-bot-seek-state-ml-1689115025"></a>
### clearActivateFn

```ml
clearActivateFn
```

Injected callback for clear activate; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L137)

<a id="field-field-mq3-game-bot-seek-state-services-clearpathfn-clearpathfn-src-mq3-game-bot-seek-state-ml-412604641"></a>
### clearPathFn

```ml
clearPathFn
```

Injected callback for clear path; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L99)

<a id="field-field-mq3-game-bot-seek-state-services-context-context-src-mq3-game-bot-seek-state-ml-782534489"></a>
### context

```ml
context
```

Opaque caller-supplied context available to bot seek-state transitions, navigation, activation, and respawn callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L156)

<a id="field-field-mq3-game-bot-seek-state-services-deathchatfn-deathchatfn-src-mq3-game-bot-seek-state-ml-1220243941"></a>
### deathChatFn

```ml
deathChatFn
```

Injected callback for death chat; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L123)

<a id="field-field-mq3-game-bot-seek-state-services-dmnetservices-dmnetservices-src-mq3-game-bot-seek-state-ml-168381665"></a>
### dmnetServices

```ml
dmnetServices
```

Callbacks used to execute the bot deathmatch decision network.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L153)

<a id="field-field-mq3-game-bot-seek-state-services-emptygoalstackfn-emptygoalstackfn-src-mq3-game-bot-seek-state-ml-1936242537"></a>
### emptyGoalStackFn

```ml
emptyGoalStackFn
```

Injected callback for empty goal stack; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L75)

<a id="field-field-mq3-game-bot-seek-state-services-endlevelchatfn-endlevelchatfn-src-mq3-game-bot-seek-state-ml-1642004043"></a>
### endLevelChatFn

```ml
endLevelChatFn
```

Injected callback for end level chat; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L117)

<a id="field-field-mq3-game-bot-seek-state-services-enterchatfn-enterchatfn-src-mq3-game-bot-seek-state-ml-1980443773"></a>
### enterChatFn

```ml
enterChatFn
```

Injected callback for enter chat; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L125)

<a id="field-field-mq3-game-bot-seek-state-services-enternodefn-enternodefn-src-mq3-game-bot-seek-state-ml-1921669833"></a>
### enterNodeFn

```ml
enterNodeFn
```

Injected callback for enter node; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L61)

<a id="field-field-mq3-game-bot-seek-state-services-enterseeknbgfn-enterseeknbgfn-src-mq3-game-bot-seek-state-ml-68725115"></a>
### enterSeekNbgFn

```ml
enterSeekNbgFn
```

Injected callback for enter seek nbg; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L87)

<a id="field-field-mq3-game-bot-seek-state-services-fightservices-fightservices-src-mq3-game-bot-seek-state-ml-1909481745"></a>
### fightServices

```ml
fightServices
```

Callbacks and shared state used by the bot fight node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L53)

<a id="field-field-mq3-game-bot-seek-state-services-gesturefn-gesturefn-src-mq3-game-bot-seek-state-ml-152010653"></a>
### gestureFn

```ml
gestureFn
```

Injected callback for gesture; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L73)

<a id="field-field-mq3-game-bot-seek-state-services-goalnamefn-goalnamefn-src-mq3-game-bot-seek-state-ml-400064585"></a>
### goalNameFn

```ml
goalNameFn
```

Injected callback for goal name; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L65)

<a id="field-field-mq3-game-bot-seek-state-services-grapple-grapple-src-mq3-game-bot-seek-state-ml-1674771185"></a>
### grapple

```ml
grapple
```

Grappling-hook movement support supplied to the bot controller.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L105)

<a id="field-field-mq3-game-bot-seek-state-services-hittalkingchatfn-hittalkingchatfn-src-mq3-game-bot-seek-state-ml-11972223"></a>
### hitTalkingChatFn

```ml
hitTalkingChatFn
```

Injected callback for hit talking chat; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L121)

<a id="field-field-mq3-game-bot-seek-state-services-longtermgoalfn-longtermgoalfn-src-mq3-game-bot-seek-state-ml-1026450479"></a>
### longTermGoalFn

```ml
longTermGoalFn
```

Injected callback for long term goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L79)

<a id="field-field-mq3-game-bot-seek-state-services-mapscriptsfn-mapscriptsfn-src-mq3-game-bot-seek-state-ml-1356950241"></a>
### mapScriptsFn

```ml
mapScriptsFn
```

Injected callback for map scripts; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L71)

<a id="field-field-mq3-game-bot-seek-state-services-missionnearbyrangefn-missionnearbyrangefn-src-mq3-game-bot-seek-state-ml-2135412593"></a>
### missionNearbyRangeFn

```ml
missionNearbyRangeFn
```

Injected callback for mission nearby range; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L151)

<a id="field-field-mq3-game-bot-seek-state-services-movementviewtargetfn-movementviewtargetfn-src-mq3-game-bot-seek-state-ml-216760603"></a>
### movementViewTargetFn

```ml
movementViewTargetFn
```

Injected callback for movement view target; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L101)

<a id="field-field-mq3-game-bot-seek-state-services-movetogoalfn-movetogoalfn-src-mq3-game-bot-seek-state-ml-202043271"></a>
### moveToGoalFn

```ml
moveToGoalFn
```

Injected callback for move to goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L93)

<a id="field-field-mq3-game-bot-seek-state-services-navigationservices-navigationservices-src-mq3-game-bot-seek-state-ml-1019687129"></a>
### navigationServices

```ml
navigationServices
```

Callbacks and shared state used for bot navigation decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L55)

<a id="field-field-mq3-game-bot-seek-state-services-nearbygoalfn-nearbygoalfn-src-mq3-game-bot-seek-state-ml-695908201"></a>
### nearbyGoalFn

```ml
nearbyGoalFn
```

Injected callback for nearby goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L83)

<a id="field-field-mq3-game-bot-seek-state-services-observerfn-observerfn-src-mq3-game-bot-seek-state-ml-1958780449"></a>
### observerFn

```ml
observerFn
```

Injected callback for observer; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L57)

<a id="field-field-mq3-game-bot-seek-state-services-popgoalfn-popgoalfn-src-mq3-game-bot-seek-state-ml-1726433221"></a>
### popGoalFn

```ml
popGoalFn
```

Injected callback for pop goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L111)

<a id="field-field-mq3-game-bot-seek-state-services-predictobstaclesfn-predictobstaclesfn-src-mq3-game-bot-seek-state-ml-684992563"></a>
### predictObstaclesFn

```ml
predictObstaclesFn
```

Injected callback for predict obstacles; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L89)

<a id="field-field-mq3-game-bot-seek-state-services-randomchatfn-randomchatfn-src-mq3-game-bot-seek-state-ml-1509416019"></a>
### randomChatFn

```ml
randomChatFn
```

Injected callback for random chat; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L67)

<a id="field-field-mq3-game-bot-seek-state-services-reachedgoalfn-reachedgoalfn-src-mq3-game-bot-seek-state-ml-1518994005"></a>
### reachedGoalFn

```ml
reachedGoalFn
```

Injected callback for reached goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L107)

<a id="field-field-mq3-game-bot-seek-state-services-recordnodefn-recordnodefn-src-mq3-game-bot-seek-state-ml-1943501923"></a>
### recordNodeFn

```ml
recordNodeFn
```

Injected callback for record node; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L59)

<a id="field-field-mq3-game-bot-seek-state-services-resetavoidfn-resetavoidfn-src-mq3-game-bot-seek-state-ml-532800381"></a>
### resetAvoidFn

```ml
resetAvoidFn
```

Injected callback for reset avoid; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L95)

<a id="field-field-mq3-game-bot-seek-state-services-resetavoidgoalsfn-resetavoidgoalsfn-src-mq3-game-bot-seek-state-ml-2070102341"></a>
### resetAvoidGoalsFn

```ml
resetAvoidGoalsFn
```

Injected callback for reset avoid goals; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L135)

<a id="field-field-mq3-game-bot-seek-state-services-resetgoalstatefn-resetgoalstatefn-src-mq3-game-bot-seek-state-ml-55278951"></a>
### resetGoalStateFn

```ml
resetGoalStateFn
```

Injected callback for reset goal state; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L133)

<a id="field-field-mq3-game-bot-seek-state-services-resetlastavoidfn-resetlastavoidfn-src-mq3-game-bot-seek-state-ml-1664229233"></a>
### resetLastAvoidFn

```ml
resetLastAvoidFn
```

Injected callback for reset last avoid; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L85)

<a id="field-field-mq3-game-bot-seek-state-services-resetmovestatefn-resetmovestatefn-src-mq3-game-bot-seek-state-ml-1892723083"></a>
### resetMoveStateFn

```ml
resetMoveStateFn
```

Injected callback for reset move state; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L131)

<a id="field-field-mq3-game-bot-seek-state-services-resetstatefn-resetstatefn-src-mq3-game-bot-seek-state-ml-2001993145"></a>
### resetStateFn

```ml
resetStateFn
```

Injected callback for reset state; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L115)

<a id="field-field-mq3-game-bot-seek-state-services-respawnfn-respawnfn-src-mq3-game-bot-seek-state-ml-1277814137"></a>
### respawnFn

```ml
respawnFn
```

Injected callback for respawn; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L129)

<a id="field-field-mq3-game-bot-seek-state-services-roamgoalfn-roamgoalfn-src-mq3-game-bot-seek-state-ml-554214809"></a>
### roamGoalFn

```ml
roamGoalFn
```

Injected callback for roam goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L103)

<a id="field-field-mq3-game-bot-seek-state-services-secondgoalfn-secondgoalfn-src-mq3-game-bot-seek-state-ml-736226155"></a>
### secondGoalFn

```ml
secondGoalFn
```

Injected callback for second goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L109)

<a id="field-field-mq3-game-bot-seek-state-services-selectactivateweaponfn-selectactivateweaponfn-src-mq3-game-bot-seek-state-ml-288025183"></a>
### selectActivateWeaponFn

```ml
selectActivateWeaponFn
```

Injected callback for select activate weapon; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L149)

<a id="field-field-mq3-game-bot-seek-state-services-setupmovementfn-setupmovementfn-src-mq3-game-bot-seek-state-ml-2081418473"></a>
### setupMovementFn

```ml
setupMovementFn
```

Injected callback for setup movement; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L91)

<a id="field-field-mq3-game-bot-seek-state-services-startlevelchatfn-startlevelchatfn-src-mq3-game-bot-seek-state-ml-1195571493"></a>
### startLevelChatFn

```ml
startLevelChatFn
```

Injected callback for start level chat; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L119)

<a id="field-field-mq3-game-bot-seek-state-services-talkfn-talkfn-src-mq3-game-bot-seek-state-ml-1970883649"></a>
### talkFn

```ml
talkFn
```

Injected callback for talk; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L127)

<a id="field-field-mq3-game-bot-seek-state-services-teamgoalsfn-teamgoalsfn-src-mq3-game-bot-seek-state-ml-2016084677"></a>
### teamGoalsFn

```ml
teamGoalsFn
```

Injected callback for team goals; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L77)

<a id="field-field-mq3-game-bot-seek-state-services-topgoalfn-topgoalfn-src-mq3-game-bot-seek-state-ml-1653002821"></a>
### topGoalFn

```ml
topGoalFn
```

Injected callback for top goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L63)

<a id="field-field-mq3-game-bot-seek-state-services-wantscampfn-wantscampfn-src-mq3-game-bot-seek-state-ml-1091182745"></a>
### wantsCampFn

```ml
wantsCampFn
```

Injected callback for wants camp; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L81)
