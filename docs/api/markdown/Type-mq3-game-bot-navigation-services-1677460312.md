# `mq3.game.bot_navigation.Services`

[Home](README.md) · [Source file](File-src-mq3-game-bot-navigation-ml-746290412.md)

<a id="struct-struct-mq3-game-bot-navigation-services-struct-services-src-mq3-game-bot-navigation-ml-1720354905"></a>
## Services

```ml
struct Services
```

`Services` record for bot navigation, containing `initMoveStateFn`, `moveInDirectionFn`, `randomFn`, `floatTimeFn` and `predictRouteFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L244)

## Members

<a id="field-field-mq3-game-bot-navigation-services-activationstackinusefn-activationstackinusefn-src-mq3-game-bot-navigation-ml-221925893"></a>
### activationStackInUseFn

```ml
activationStackInUseFn
```

Injected callback for activation stack in use; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L260)

<a id="field-field-mq3-game-bot-navigation-services-aggressionfn-aggressionfn-src-mq3-game-bot-navigation-ml-1582399629"></a>
### aggressionFn

```ml
aggressionFn
```

Injected callback for aggression; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L307)

<a id="field-field-mq3-game-bot-navigation-services-areacontentsfn-areacontentsfn-src-mq3-game-bot-navigation-ml-1917324443"></a>
### areaContentsFn

```ml
areaContentsFn
```

Injected callback for area contents; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L301)

<a id="field-field-mq3-game-bot-navigation-services-areareachabilityfn-areareachabilityfn-src-mq3-game-bot-navigation-ml-1978666053"></a>
### areaReachabilityFn

```ml
areaReachabilityFn
```

Injected callback for area reachability; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L299)

<a id="field-field-mq3-game-bot-navigation-services-areatraveltimefn-areatraveltimefn-src-mq3-game-bot-navigation-ml-1103446493"></a>
### areaTravelTimeFn

```ml
areaTravelTimeFn
```

Injected callback for area travel time; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L271)

<a id="field-field-mq3-game-bot-navigation-services-bboxareasfn-bboxareasfn-src-mq3-game-bot-navigation-ml-194243917"></a>
### bboxAreasFn

```ml
bboxAreasFn
```

Injected callback for bbox areas; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L297)

<a id="field-field-mq3-game-bot-navigation-services-buttonactivategoalfn-buttonactivategoalfn-src-mq3-game-bot-navigation-ml-942845445"></a>
### buttonActivateGoalFn

```ml
buttonActivateGoalFn
```

Injected callback for button activate goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L291)

<a id="field-field-mq3-game-bot-navigation-services-carryingflagfn-carryingflagfn-src-mq3-game-bot-navigation-ml-1987441031"></a>
### carryingFlagFn

```ml
carryingFlagFn
```

Injected callback for carrying flag; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L331)

<a id="field-field-mq3-game-bot-navigation-services-characteristicfn-characteristicfn-src-mq3-game-bot-navigation-ml-1778404143"></a>
### characteristicFn

```ml
characteristicFn
```

Injected callback for characteristic; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L305)

<a id="field-field-mq3-game-bot-navigation-services-chooseltgfn-chooseltgfn-src-mq3-game-bot-navigation-ml-1884600029"></a>
### chooseLtgFn

```ml
chooseLtgFn
```

Injected callback for choose ltg; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L343)

<a id="field-field-mq3-game-bot-navigation-services-choosenbgfn-choosenbgfn-src-mq3-game-bot-navigation-ml-1320875973"></a>
### chooseNbgFn

```ml
chooseNbgFn
```

Injected callback for choose nbg; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L321)

<a id="field-field-mq3-game-bot-navigation-services-chooseweaponfn-chooseweaponfn-src-mq3-game-bot-navigation-ml-1787502023"></a>
### chooseWeaponFn

```ml
chooseWeaponFn
```

Injected callback for choose weapon; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L341)

<a id="field-field-mq3-game-bot-navigation-services-clearactivationstackfn-clearactivationstackfn-src-mq3-game-bot-navigation-ml-1929740931"></a>
### clearActivationStackFn

```ml
clearActivationStackFn
```

Injected callback for clear activation stack; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L262)

<a id="field-field-mq3-game-bot-navigation-services-context-context-src-mq3-game-bot-navigation-ml-1393084093"></a>
### context

```ml
context
```

Opaque caller-supplied context available to bot route prediction, movement, activation, and goal-selection callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L375)

<a id="field-field-mq3-game-bot-navigation-services-crouchfn-crouchfn-src-mq3-game-bot-navigation-ml-838909877"></a>
### crouchFn

```ml
crouchFn
```

Injected callback for crouch; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L357)

<a id="field-field-mq3-game-bot-navigation-services-diagnosticfn-diagnosticfn-src-mq3-game-bot-navigation-ml-1867489583"></a>
### diagnosticFn

```ml
diagnosticFn
```

Injected callback for diagnostic; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L303)

<a id="field-field-mq3-game-bot-navigation-services-dooractivategoalfn-dooractivategoalfn-src-mq3-game-bot-navigation-ml-1748265269"></a>
### doorActivateGoalFn

```ml
doorActivateGoalFn
```

Injected callback for door activate goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L289)

<a id="field-field-mq3-game-bot-navigation-services-enableactivategoalareasfn-enableactivategoalareasfn-src-mq3-game-bot-navigation-ml-93526805"></a>
### enableActivateGoalAreasFn

```ml
enableActivateGoalAreasFn
```

Injected callback for enable activate goal areas; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L269)

<a id="field-field-mq3-game-bot-navigation-services-enableroutingareafn-enableroutingareafn-src-mq3-game-bot-navigation-ml-1210687341"></a>
### enableRoutingAreaFn

```ml
enableRoutingAreaFn
```

Injected callback for enable routing area; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L273)

<a id="field-field-mq3-game-bot-navigation-services-enteractivatenodefn-enteractivatenodefn-src-mq3-game-bot-navigation-ml-1729865625"></a>
### enterActivateNodeFn

```ml
enterActivateNodeFn
```

Injected callback for enter activate node; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L277)

<a id="field-field-mq3-game-bot-navigation-services-enterseeknbgfn-enterseeknbgfn-src-mq3-game-bot-navigation-ml-1652222635"></a>
### enterSeekNbgFn

```ml
enterSeekNbgFn
```

Injected callback for enter seek nbg; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L370)

<a id="field-field-mq3-game-bot-navigation-services-entityinfofn-entityinfofn-src-mq3-game-bot-navigation-ml-1489725999"></a>
### entityInfoFn

```ml
entityInfoFn
```

Injected callback for entity info; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L275)

<a id="field-field-mq3-game-bot-navigation-services-entitylongterminfofn-entitylongterminfofn-src-mq3-game-bot-navigation-ml-548275295"></a>
### entityLongTermInfoFn

```ml
entityLongTermInfoFn
```

Injected callback for entity long term info; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L347)

<a id="field-field-mq3-game-bot-navigation-services-entityvisiblefn-entityvisiblefn-src-mq3-game-bot-navigation-ml-1704632857"></a>
### entityVisibleFn

```ml
entityVisibleFn
```

Injected callback for entity visible; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L349)

<a id="field-field-mq3-game-bot-navigation-services-flaggoalfn-flaggoalfn-src-mq3-game-bot-navigation-ml-673040179"></a>
### flagGoalFn

```ml
flagGoalFn
```

Injected callback for flag goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L368)

<a id="field-field-mq3-game-bot-navigation-services-floatkeyfn-floatkeyfn-src-mq3-game-bot-navigation-ml-1455880971"></a>
### floatKeyFn

```ml
floatKeyFn
```

Injected callback for float key; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L283)

<a id="field-field-mq3-game-bot-navigation-services-floattimefn-floattimefn-src-mq3-game-bot-navigation-ml-1230319781"></a>
### floatTimeFn

```ml
floatTimeFn
```

Injected callback for float time; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L252)

<a id="field-field-mq3-game-bot-navigation-services-gametype-gametype-src-mq3-game-bot-navigation-ml-509973829"></a>
### gametype

```ml
gametype
```

GT_* game-mode identifier used for mode-specific bot navigation and long-term goal decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L372)

<a id="field-field-mq3-game-bot-navigation-services-gesturefn-gesturefn-src-mq3-game-bot-navigation-ml-699580465"></a>
### gestureFn

```ml
gestureFn
```

Injected callback for gesture; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L355)

<a id="field-field-mq3-game-bot-navigation-services-getactivategoalfn-getactivategoalfn-src-mq3-game-bot-navigation-ml-598773557"></a>
### getActivateGoalFn

```ml
getActivateGoalFn
```

Injected callback for get activate goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L258)

<a id="field-field-mq3-game-bot-navigation-services-goforactivategoalfn-goforactivategoalfn-src-mq3-game-bot-navigation-ml-1988073093"></a>
### goForActivateGoalFn

```ml
goForActivateGoalFn
```

Injected callback for go for activate goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L266)

<a id="field-field-mq3-game-bot-navigation-services-initmovestatefn-initmovestatefn-src-mq3-game-bot-navigation-ml-1193435725"></a>
### initMoveStateFn

```ml
initMoveStateFn
```

Injected callback for init move state; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L246)

<a id="field-field-mq3-game-bot-navigation-services-intkeyfn-intkeyfn-src-mq3-game-bot-navigation-ml-1252652513"></a>
### intKeyFn

```ml
intKeyFn
```

Injected callback for int key; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L285)

<a id="field-field-mq3-game-bot-navigation-services-isgoingtoactivatefn-isgoingtoactivatefn-src-mq3-game-bot-navigation-ml-1351917709"></a>
### isGoingToActivateFn

```ml
isGoingToActivateFn
```

Injected callback for is going to activate; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L264)

<a id="field-field-mq3-game-bot-navigation-services-itemnotvisiblefn-itemnotvisiblefn-src-mq3-game-bot-navigation-ml-1645305421"></a>
### itemNotVisibleFn

```ml
itemNotVisibleFn
```

Injected callback for item not visible; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L335)

<a id="field-field-mq3-game-bot-navigation-services-levelitemgoalfn-levelitemgoalfn-src-mq3-game-bot-navigation-ml-1323364549"></a>
### levelItemGoalFn

```ml
levelItemGoalFn
```

Injected callback for level item goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L311)

<a id="field-field-mq3-game-bot-navigation-services-modelboundsfn-modelboundsfn-src-mq3-game-bot-navigation-ml-766905137"></a>
### modelBoundsFn

```ml
modelBoundsFn
```

Injected callback for model bounds; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L295)

<a id="field-field-mq3-game-bot-navigation-services-modelentityfn-modelentityfn-src-mq3-game-bot-navigation-ml-627856949"></a>
### modelEntityFn

```ml
modelEntityFn
```

Injected callback for model entity; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L256)

<a id="field-field-mq3-game-bot-navigation-services-moveindirectionfn-moveindirectionfn-src-mq3-game-bot-navigation-ml-1493069321"></a>
### moveInDirectionFn

```ml
moveInDirectionFn
```

Injected callback for move in direction; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L248)

<a id="field-field-mq3-game-bot-navigation-services-nextbspentityfn-nextbspentityfn-src-mq3-game-bot-navigation-ml-1241045181"></a>
### nextBspEntityFn

```ml
nextBspEntityFn
```

Injected callback for next BSP entity; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L279)

<a id="field-field-mq3-game-bot-navigation-services-nextcampspotfn-nextcampspotfn-src-mq3-game-bot-navigation-ml-1323165721"></a>
### nextCampSpotFn

```ml
nextCampSpotFn
```

Injected callback for next camp spot; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L309)

<a id="field-field-mq3-game-bot-navigation-services-notifyfn-notifyfn-src-mq3-game-bot-navigation-ml-623747787"></a>
### notifyFn

```ml
notifyFn
```

Injected callback for notify; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L351)

<a id="field-field-mq3-game-bot-navigation-services-persistentpowerupweaponfn-persistentpowerupweaponfn-src-mq3-game-bot-navigation-ml-1485738633"></a>
### persistentPowerupWeaponFn

```ml
persistentPowerupWeaponFn
```

Injected callback for persistent powerup weapon; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L364)

<a id="field-field-mq3-game-bot-navigation-services-pointareafn-pointareafn-src-mq3-game-bot-navigation-ml-835608893"></a>
### pointAreaFn

```ml
pointAreaFn
```

Injected callback for point area; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L317)

<a id="field-field-mq3-game-bot-navigation-services-pointcontentsentityfn-pointcontentsentityfn-src-mq3-game-bot-navigation-ml-490199061"></a>
### pointContentsEntityFn

```ml
pointContentsEntityFn
```

Injected callback for point contents entity; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L361)

<a id="field-field-mq3-game-bot-navigation-services-pointcontentsfn-pointcontentsfn-src-mq3-game-bot-navigation-ml-1884932673"></a>
### pointContentsFn

```ml
pointContentsFn
```

Injected callback for point contents; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L325)

<a id="field-field-mq3-game-bot-navigation-services-popgoalfn-popgoalfn-src-mq3-game-bot-navigation-ml-1042010057"></a>
### popGoalFn

```ml
popGoalFn
```

Injected callback for pop goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L327)

<a id="field-field-mq3-game-bot-navigation-services-predictroutefn-predictroutefn-src-mq3-game-bot-navigation-ml-1693510837"></a>
### predictRouteFn

```ml
predictRouteFn
```

Injected callback for predict route; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L254)

<a id="field-field-mq3-game-bot-navigation-services-pushgoalfn-pushgoalfn-src-mq3-game-bot-navigation-ml-565847663"></a>
### pushGoalFn

```ml
pushGoalFn
```

Injected callback for push goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L319)

<a id="field-field-mq3-game-bot-navigation-services-randomfn-randomfn-src-mq3-game-bot-navigation-ml-1399562819"></a>
### randomFn

```ml
randomFn
```

Injected callback for random; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L250)

<a id="field-field-mq3-game-bot-navigation-services-removeavoidgoalfn-removeavoidgoalfn-src-mq3-game-bot-navigation-ml-1022920453"></a>
### removeAvoidGoalFn

```ml
removeAvoidGoalFn
```

Injected callback for remove avoid goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L313)

<a id="field-field-mq3-game-bot-navigation-services-resetavoidgoalsfn-resetavoidgoalsfn-src-mq3-game-bot-navigation-ml-615927465"></a>
### resetAvoidGoalsFn

```ml
resetAvoidGoalsFn
```

Injected callback for reset avoid goals; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L329)

<a id="field-field-mq3-game-bot-navigation-services-resetavoidreachfn-resetavoidreachfn-src-mq3-game-bot-navigation-ml-2015472485"></a>
### resetAvoidReachFn

```ml
resetAvoidReachFn
```

Injected callback for reset avoid reach; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L345)

<a id="field-field-mq3-game-bot-navigation-services-resetlastavoidreachfn-resetlastavoidreachfn-src-mq3-game-bot-navigation-ml-104949033"></a>
### resetLastAvoidReachFn

```ml
resetLastAvoidReachFn
```

Injected callback for reset last avoid reach; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L353)

<a id="field-field-mq3-game-bot-navigation-services-roamgoalfn-roamgoalfn-src-mq3-game-bot-navigation-ml-1662039517"></a>
### roamGoalFn

```ml
roamGoalFn
```

Injected callback for roam goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L359)

<a id="field-field-mq3-game-bot-navigation-services-setavoidgoaltimefn-setavoidgoaltimefn-src-mq3-game-bot-navigation-ml-1070773899"></a>
### setAvoidGoalTimeFn

```ml
setAvoidGoalTimeFn
```

Injected callback for set avoid goal time; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L339)

<a id="field-field-mq3-game-bot-navigation-services-stringkeyfn-stringkeyfn-src-mq3-game-bot-navigation-ml-1676000233"></a>
### stringKeyFn

```ml
stringKeyFn
```

Injected callback for string key; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L281)

<a id="field-field-mq3-game-bot-navigation-services-swimmingfn-swimmingfn-src-mq3-game-bot-navigation-ml-50998283"></a>
### swimmingFn

```ml
swimmingFn
```

Injected callback for swimming; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L337)

<a id="field-field-mq3-game-bot-navigation-services-teamfn-teamfn-src-mq3-game-bot-navigation-ml-1236846307"></a>
### teamFn

```ml
teamFn
```

Injected callback for team; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L366)

<a id="field-field-mq3-game-bot-navigation-services-topgoalfn-topgoalfn-src-mq3-game-bot-navigation-ml-1186477129"></a>
### topGoalFn

```ml
topGoalFn
```

Injected callback for top goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L323)

<a id="field-field-mq3-game-bot-navigation-services-touchinggoalfn-touchinggoalfn-src-mq3-game-bot-navigation-ml-770630453"></a>
### touchingGoalFn

```ml
touchingGoalFn
```

Injected callback for touching goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L333)

<a id="field-field-mq3-game-bot-navigation-services-tracefn-tracefn-src-mq3-game-bot-navigation-ml-186923225"></a>
### traceFn

```ml
traceFn
```

Injected callback for trace; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L315)

<a id="field-field-mq3-game-bot-navigation-services-triggeractivategoalfn-triggeractivategoalfn-src-mq3-game-bot-navigation-ml-2011495541"></a>
### triggerActivateGoalFn

```ml
triggerActivateGoalFn
```

Injected callback for trigger activate goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L293)

<a id="field-field-mq3-game-bot-navigation-services-vectorkeyfn-vectorkeyfn-src-mq3-game-bot-navigation-ml-642101973"></a>
### vectorKeyFn

```ml
vectorKeyFn
```

Injected callback for vector key; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_navigation.ml#L287)
