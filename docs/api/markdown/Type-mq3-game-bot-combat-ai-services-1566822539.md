# `mq3.game.bot_combat_ai.Services`

[Home](README.md) · [Source file](File-src-mq3-game-bot-combat-ai-ml-1348181617.md)

<a id="struct-struct-mq3-game-bot-combat-ai-services-struct-services-src-mq3-game-bot-combat-ai-ml-1201245059"></a>
## Services

```ml
struct Services
```

`Services` record for bot combat ai, containing `gametype`, `rocketjump`, `intermissiontime`, `floatTimeFn` and `pointContentsFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L202)

## Members

<a id="field-field-mq3-game-bot-combat-ai-services-attackfn-attackfn-src-mq3-game-bot-combat-ai-ml-1458020805"></a>
### attackFn

```ml
attackFn
```

Injected callback for attack; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L238)

<a id="field-field-mq3-game-bot-combat-ai-services-characteristicfloatfn-characteristicfloatfn-src-mq3-game-bot-combat-ai-ml-885170293"></a>
### characteristicFloatFn

```ml
characteristicFloatFn
```

Injected callback for characteristic float; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L214)

<a id="field-field-mq3-game-bot-combat-ai-services-context-context-src-mq3-game-bot-combat-ai-ml-1853428149"></a>
### context

```ml
context
```

Opaque caller-supplied context available to bot combat visibility, weapon, attack, and movement callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L251)

<a id="field-field-mq3-game-bot-combat-ai-services-entitydeadfn-entitydeadfn-src-mq3-game-bot-combat-ai-ml-1818670343"></a>
### entityDeadFn

```ml
entityDeadFn
```

Injected callback for entity dead; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L224)

<a id="field-field-mq3-game-bot-combat-ai-services-entityinfofn-entityinfofn-src-mq3-game-bot-combat-ai-ml-471504367"></a>
### entityInfoFn

```ml
entityInfoFn
```

Injected callback for entity info; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L216)

<a id="field-field-mq3-game-bot-combat-ai-services-floattimefn-floattimefn-src-mq3-game-bot-combat-ai-ml-167634597"></a>
### floatTimeFn

```ml
floatTimeFn
```

Injected callback for float time; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L210)

<a id="field-field-mq3-game-bot-combat-ai-services-gametype-gametype-src-mq3-game-bot-combat-ai-ml-1244623765"></a>
### gametype

```ml
gametype
```

GT_* game-mode identifier used for mode-specific bot combat and team-relationship decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L204)

<a id="field-field-mq3-game-bot-combat-ai-services-intermissiontime-intermissiontime-src-mq3-game-bot-combat-ai-ml-2094927115"></a>
### intermissiontime

```ml
intermissiontime
```

Timestamp at which the intermission began.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L208)

<a id="field-field-mq3-game-bot-combat-ai-services-lastteleportorigin-lastteleportorigin-src-mq3-game-bot-combat-ai-ml-756429415"></a>
### lastteleportOrigin

```ml
lastteleportOrigin
```

Position recorded for the most recently observed teleport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L222)

<a id="field-field-mq3-game-bot-combat-ai-services-lastteleporttime-lastteleporttime-src-mq3-game-bot-combat-ai-ml-1879253389"></a>
### lastteleportTime

```ml
lastteleportTime
```

Timestamp of the most recently observed teleport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L220)

<a id="field-field-mq3-game-bot-combat-ai-services-maxclients-maxclients-src-mq3-game-bot-combat-ai-ml-1436921341"></a>
### maxclients

```ml
maxclients
```

Configured number of client slots active in this game state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L218)

<a id="field-field-mq3-game-bot-combat-ai-services-movedirectionfn-movedirectionfn-src-mq3-game-bot-combat-ai-ml-254669269"></a>
### moveDirectionFn

```ml
moveDirectionFn
```

Injected callback for move direction; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L248)

<a id="field-field-mq3-game-bot-combat-ai-services-movetogoalfn-movetogoalfn-src-mq3-game-bot-combat-ai-ml-1893449291"></a>
### moveToGoalFn

```ml
moveToGoalFn
```

Injected callback for move to goal; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L246)

<a id="field-field-mq3-game-bot-combat-ai-services-pointcontentsfn-pointcontentsfn-src-mq3-game-bot-combat-ai-ml-295001209"></a>
### pointContentsFn

```ml
pointContentsFn
```

Injected callback for point contents; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L212)

<a id="field-field-mq3-game-bot-combat-ai-services-predictmovementfn-predictmovementfn-src-mq3-game-bot-combat-ai-ml-365048065"></a>
### predictMovementFn

```ml
predictMovementFn
```

Injected callback for predict movement; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L240)

<a id="field-field-mq3-game-bot-combat-ai-services-predictvisiblefn-predictvisiblefn-src-mq3-game-bot-combat-ai-ml-1718649247"></a>
### predictVisibleFn

```ml
predictVisibleFn
```

Injected callback for predict visible; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L242)

<a id="field-field-mq3-game-bot-combat-ai-services-randomfn-randomfn-src-mq3-game-bot-combat-ai-ml-1048370335"></a>
### randomFn

```ml
randomFn
```

Injected callback for random; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L232)

<a id="field-field-mq3-game-bot-combat-ai-services-rocketjump-rocketjump-src-mq3-game-bot-combat-ai-ml-583611445"></a>
### rocketjump

```ml
rocketjump
```

Nonzero when the bot is allowed or instructed to use a rocket jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L206)

<a id="field-field-mq3-game-bot-combat-ai-services-sameteamfn-sameteamfn-src-mq3-game-bot-combat-ai-ml-871234167"></a>
### sameTeamFn

```ml
sameTeamFn
```

Injected callback for same team; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L226)

<a id="field-field-mq3-game-bot-combat-ai-services-setupmovementfn-setupmovementfn-src-mq3-game-bot-combat-ai-ml-836915829"></a>
### setupMovementFn

```ml
setupMovementFn
```

Injected callback for setup movement; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L244)

<a id="field-field-mq3-game-bot-combat-ai-services-tracefn-tracefn-src-mq3-game-bot-combat-ai-ml-354039089"></a>
### traceFn

```ml
traceFn
```

Injected callback for trace; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L234)

<a id="field-field-mq3-game-bot-combat-ai-services-updatebattlefn-updatebattlefn-src-mq3-game-bot-combat-ai-ml-845416143"></a>
### updateBattleFn

```ml
updateBattleFn
```

Injected callback for update battle; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L230)

<a id="field-field-mq3-game-bot-combat-ai-services-visiblefn-visiblefn-src-mq3-game-bot-combat-ai-ml-836278037"></a>
### visibleFn

```ml
visibleFn
```

Injected callback for visible; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L228)

<a id="field-field-mq3-game-bot-combat-ai-services-weaponinfofn-weaponinfofn-src-mq3-game-bot-combat-ai-ml-1093319693"></a>
### weaponInfoFn

```ml
weaponInfoFn
```

Injected callback for weapon info; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L236)
