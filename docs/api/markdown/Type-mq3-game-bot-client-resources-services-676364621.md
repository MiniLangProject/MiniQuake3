# `mq3.game.bot_client_resources.Services`

[Home](README.md) · [Source file](File-src-mq3-game-bot-client-resources-ml-1593961093.md)

<a id="struct-struct-mq3-game-bot-client-resources-services-struct-services-src-mq3-game-bot-client-resources-ml-99091115"></a>
## Services

```ml
struct Services
```

`Services` record for bot client resources, containing `lifecycleState`, `aasInitializedFn`, `diagnosticFn`, `loadCharacterFn` and `allocGoalStateFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L42)

## Members

<a id="field-field-mq3-game-bot-client-resources-services-aasinitializedfn-aasinitializedfn-src-mq3-game-bot-client-resources-ml-1305574293"></a>
### aasInitializedFn

```ml
aasInitializedFn
```

Injected callback for AAS initialized; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L46)

<a id="field-field-mq3-game-bot-client-resources-services-allocchatstatefn-allocchatstatefn-src-mq3-game-bot-client-resources-ml-595594911"></a>
### allocChatStateFn

```ml
allocChatStateFn
```

Injected callback for alloc chat state; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L66)

<a id="field-field-mq3-game-bot-client-resources-services-allocgoalstatefn-allocgoalstatefn-src-mq3-game-bot-client-resources-ml-1133938789"></a>
### allocGoalStateFn

```ml
allocGoalStateFn
```

Injected callback for alloc goal state; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L52)

<a id="field-field-mq3-game-bot-client-resources-services-allocmovestatefn-allocmovestatefn-src-mq3-game-bot-client-resources-ml-1564005937"></a>
### allocMoveStateFn

```ml
allocMoveStateFn
```

Injected callback for alloc move state; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L76)

<a id="field-field-mq3-game-bot-client-resources-services-allocweaponstatefn-allocweaponstatefn-src-mq3-game-bot-client-resources-ml-2099038499"></a>
### allocWeaponStateFn

```ml
allocWeaponStateFn
```

Injected callback for alloc weapon state; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L60)

<a id="field-field-mq3-game-bot-client-resources-services-botlibvarsetfn-botlibvarsetfn-src-mq3-game-bot-client-resources-ml-1174358217"></a>
### botLibVarSetFn

```ml
botLibVarSetFn
```

Injected callback for bot lib var set; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L82)

<a id="field-field-mq3-game-bot-client-resources-services-characteristicfloatfn-characteristicfloatfn-src-mq3-game-bot-client-resources-ml-349748983"></a>
### characteristicFloatFn

```ml
characteristicFloatFn
```

Injected callback for characteristic float; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L78)

<a id="field-field-mq3-game-bot-client-resources-services-characteristicstringfn-characteristicstringfn-src-mq3-game-bot-client-resources-ml-1477175535"></a>
### characteristicStringFn

```ml
characteristicStringFn
```

Injected callback for characteristic string; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L54)

<a id="field-field-mq3-game-bot-client-resources-services-chatexitgamefn-chatexitgamefn-src-mq3-game-bot-client-resources-ml-2002020975"></a>
### chatExitGameFn

```ml
chatExitGameFn
```

Injected callback for chat exit game; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L94)

<a id="field-field-mq3-game-bot-client-resources-services-chattestfn-chattestfn-src-mq3-game-bot-client-resources-ml-1733863051"></a>
### chatTestFn

```ml
chatTestFn
```

Injected callback for chat test; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L84)

<a id="field-field-mq3-game-bot-client-resources-services-clearactivategoalstackfn-clearactivategoalstackfn-src-mq3-game-bot-client-resources-ml-1322089093"></a>
### clearActivateGoalStackFn

```ml
clearActivateGoalStackFn
```

Injected callback for clear activate goal stack; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L105)

<a id="field-field-mq3-game-bot-client-resources-services-context-context-src-mq3-game-bot-client-resources-ml-1433104903"></a>
### context

```ml
context
```

Opaque caller-supplied context available to bot character, goal, weapon, chat, and movement resource callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L108)

<a id="field-field-mq3-game-bot-client-resources-services-diagnosticfn-diagnosticfn-src-mq3-game-bot-client-resources-ml-452988869"></a>
### diagnosticFn

```ml
diagnosticFn
```

Injected callback for diagnostic; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L48)

<a id="field-field-mq3-game-bot-client-resources-services-enterchatfn-enterchatfn-src-mq3-game-bot-client-resources-ml-1539785059"></a>
### enterChatFn

```ml
enterChatFn
```

Injected callback for enter chat; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L96)

<a id="field-field-mq3-game-bot-client-resources-services-floattimefn-floattimefn-src-mq3-game-bot-client-resources-ml-412981791"></a>
### floatTimeFn

```ml
floatTimeFn
```

Injected callback for float time; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L74)

<a id="field-field-mq3-game-bot-client-resources-services-freecharacterfn-freecharacterfn-src-mq3-game-bot-client-resources-ml-2053792055"></a>
### freeCharacterFn

```ml
freeCharacterFn
```

Injected callback for free character; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L100)

<a id="field-field-mq3-game-bot-client-resources-services-freechatstatefn-freechatstatefn-src-mq3-game-bot-client-resources-ml-534464471"></a>
### freeChatStateFn

```ml
freeChatStateFn
```

Injected callback for free chat state; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L70)

<a id="field-field-mq3-game-bot-client-resources-services-freegoalstatefn-freegoalstatefn-src-mq3-game-bot-client-resources-ml-2017717135"></a>
### freeGoalStateFn

```ml
freeGoalStateFn
```

Injected callback for free goal state; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L58)

<a id="field-field-mq3-game-bot-client-resources-services-freemovestatefn-freemovestatefn-src-mq3-game-bot-client-resources-ml-1912583907"></a>
### freeMoveStateFn

```ml
freeMoveStateFn
```

Injected callback for free move state; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L98)

<a id="field-field-mq3-game-bot-client-resources-services-freewaypointsfn-freewaypointsfn-src-mq3-game-bot-client-resources-ml-802615359"></a>
### freeWaypointsFn

```ml
freeWaypointsFn
```

Injected callback for free waypoints; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L102)

<a id="field-field-mq3-game-bot-client-resources-services-freeweaponstatefn-freeweaponstatefn-src-mq3-game-bot-client-resources-ml-852432423"></a>
### freeWeaponStateFn

```ml
freeWeaponStateFn
```

Injected callback for free weapon state; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L64)

<a id="field-field-mq3-game-bot-client-resources-services-integerqueryfn-integerqueryfn-src-mq3-game-bot-client-resources-ml-1812931"></a>
### integerQueryFn

```ml
integerQueryFn
```

Injected callback for integer query; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L80)

<a id="field-field-mq3-game-bot-client-resources-services-lifecyclestate-lifecyclestate-src-mq3-game-bot-client-resources-ml-1280312197"></a>
### lifecycleState

```ml
lifecycleState
```

State shared by bot allocation, setup, shutdown, and frame processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L44)

<a id="field-field-mq3-game-bot-client-resources-services-loadcharacterfn-loadcharacterfn-src-mq3-game-bot-client-resources-ml-2111418627"></a>
### loadCharacterFn

```ml
loadCharacterFn
```

Injected callback for load character; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L50)

<a id="field-field-mq3-game-bot-client-resources-services-loadchatfilefn-loadchatfilefn-src-mq3-game-bot-client-resources-ml-2078094047"></a>
### loadChatFileFn

```ml
loadChatFileFn
```

Injected callback for load chat file; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L68)

<a id="field-field-mq3-game-bot-client-resources-services-loaditemweightsfn-loaditemweightsfn-src-mq3-game-bot-client-resources-ml-566277159"></a>
### loadItemWeightsFn

```ml
loadItemWeightsFn
```

Injected callback for load item weights; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L56)

<a id="field-field-mq3-game-bot-client-resources-services-loadweaponweightsfn-loadweaponweightsfn-src-mq3-game-bot-client-resources-ml-1363420019"></a>
### loadWeaponWeightsFn

```ml
loadWeaponWeightsFn
```

Injected callback for load weapon weights; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L62)

<a id="field-field-mq3-game-bot-client-resources-services-mutategoalfn-mutategoalfn-src-mq3-game-bot-client-resources-ml-35411201"></a>
### mutateGoalFn

```ml
mutateGoalFn
```

Injected callback for mutate goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L88)

<a id="field-field-mq3-game-bot-client-resources-services-readsessionfn-readsessionfn-src-mq3-game-bot-client-resources-ml-240656119"></a>
### readSessionFn

```ml
readSessionFn
```

Injected callback for read session; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L90)

<a id="field-field-mq3-game-bot-client-resources-services-schedulethinkfn-schedulethinkfn-src-mq3-game-bot-client-resources-ml-2015729495"></a>
### scheduleThinkFn

```ml
scheduleThinkFn
```

Injected callback for schedule think; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L86)

<a id="field-field-mq3-game-bot-client-resources-services-setchatgenderfn-setchatgenderfn-src-mq3-game-bot-client-resources-ml-1960752203"></a>
### setChatGenderFn

```ml
setChatGenderFn
```

Injected callback for set chat gender; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L72)

<a id="field-field-mq3-game-bot-client-resources-services-writesessionfn-writesessionfn-src-mq3-game-bot-client-resources-ml-996884421"></a>
### writeSessionFn

```ml
writeSessionFn
```

Injected callback for write session; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_client_resources.ml#L92)
