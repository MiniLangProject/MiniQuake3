# `mq3.game.bot_deathmatch.State`

[Home](README.md) · [Source file](File-src-mq3-game-bot-deathmatch-ml-113231271.md)

<a id="struct-struct-mq3-game-bot-deathmatch-state-struct-state-src-mq3-game-bot-deathmatch-ml-1720642383"></a>
## State

```ml
struct State
```

`State` record for bot deathmatch, containing `gametype`, `missionpack`, `maxclients`, `mapname` and `configs` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L174)

## Members

<a id="field-field-mq3-game-bot-deathmatch-state-actions-actions-src-mq3-game-bot-deathmatch-ml-1280291002"></a>
### actions

```ml
actions
```

Recorded host actions emitted by bot decision logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L242)

<a id="field-field-mq3-game-bot-deathmatch-state-bluealtgoals-bluealtgoals-src-mq3-game-bot-deathmatch-ml-2081840488"></a>
### blueAltGoals

```ml
blueAltGoals
```

Alternate-route goals used when approaching the blue base.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L248)

<a id="field-field-mq3-game-bot-deathmatch-state-blueflag-blueflag-src-mq3-game-bot-deathmatch-ml-1718555078"></a>
### blueFlag

```ml
blueFlag
```

Goal/entity reference for the blue flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L196)

<a id="field-field-mq3-game-bot-deathmatch-state-blueobelisk-blueobelisk-src-mq3-game-bot-deathmatch-ml-1739335658"></a>
### blueObelisk

```ml
blueObelisk
```

Goal/entity reference for the blue team obelisk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L202)

<a id="field-field-mq3-game-bot-deathmatch-state-bspentities-bspentities-src-mq3-game-bot-deathmatch-ml-543038822"></a>
### bspEntities

```ml
bspEntities
```

Parsed map entity definitions from the BSP entity lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L192)

<a id="field-field-mq3-game-bot-deathmatch-state-combatservices-combatservices-src-mq3-game-bot-deathmatch-ml-1220802594"></a>
### combatServices

```ml
combatServices
```

Callbacks and shared state used by bot combat decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L206)

<a id="field-field-mq3-game-bot-deathmatch-state-commandservices-commandservices-src-mq3-game-bot-deathmatch-ml-2020361518"></a>
### commandServices

```ml
commandServices
```

Callbacks used to deliver or process game commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L214)

<a id="field-field-mq3-game-bot-deathmatch-state-configs-configs-src-mq3-game-bot-deathmatch-ml-45539758"></a>
### configs

```ml
configs
```

Configuration records associated with tracked clients or bot state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L184)

<a id="field-field-mq3-game-bot-deathmatch-state-deathmatchfn-deathmatchfn-src-mq3-game-bot-deathmatch-ml-1208452516"></a>
### deathmatchFn

```ml
deathmatchFn
```

Injected callback for deathmatch; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L228)

<a id="field-field-mq3-game-bot-deathmatch-state-entities-entities-src-mq3-game-bot-deathmatch-ml-151921032"></a>
### entities

```ml
entities
```

Game entity records indexed by entity number.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L188)

<a id="field-field-mq3-game-bot-deathmatch-state-entityeventtimes-entityeventtimes-src-mq3-game-bot-deathmatch-ml-1631336472"></a>
### entityEventTimes

```ml
entityEventTimes
```

Most recently consumed event timestamp for each entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L236)

<a id="field-field-mq3-game-bot-deathmatch-state-gametype-gametype-src-mq3-game-bot-deathmatch-ml-1952419638"></a>
### gametype

```ml
gametype
```

GT_* game-mode identifier used for deathmatch, team, and capture-the-flag bot task selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L176)

<a id="field-field-mq3-game-bot-deathmatch-state-hostactionfn-hostactionfn-src-mq3-game-bot-deathmatch-ml-4443606"></a>
### hostActionFn

```ml
hostActionFn
```

Injected callback for host action; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L244)

<a id="field-field-mq3-game-bot-deathmatch-state-inventoryservices-inventoryservices-src-mq3-game-bot-deathmatch-ml-666671894"></a>
### inventoryServices

```ml
inventoryServices
```

Callbacks used to update or query bot inventory values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L208)

<a id="field-field-mq3-game-bot-deathmatch-state-kamikazebodies-kamikazebodies-src-mq3-game-bot-deathmatch-ml-1884532776"></a>
### kamikazeBodies

```ml
kamikazeBodies
```

Corpse entities tracked for kamikaze effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L238)

<a id="field-field-mq3-game-bot-deathmatch-state-lasttasks-lasttasks-src-mq3-game-bot-deathmatch-ml-665869926"></a>
### lastTasks

```ml
lastTasks
```

Most recently assigned tasks indexed by bot/client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L232)

<a id="field-field-mq3-game-bot-deathmatch-state-lastteleportorigin-lastteleportorigin-src-mq3-game-bot-deathmatch-ml-1616893636"></a>
### lastTeleportOrigin

```ml
lastTeleportOrigin
```

Position recorded for the most recently observed teleport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L256)

<a id="field-field-mq3-game-bot-deathmatch-state-lastteleporttime-lastteleporttime-src-mq3-game-bot-deathmatch-ml-1777970022"></a>
### lastTeleportTime

```ml
lastTeleportTime
```

Timestamp of the most recently observed teleport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L254)

<a id="field-field-mq3-game-bot-deathmatch-state-mapname-mapname-src-mq3-game-bot-deathmatch-ml-1906760142"></a>
### mapname

```ml
mapname
```

Engine name/path identifier of the active map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L182)

<a id="field-field-mq3-game-bot-deathmatch-state-maxbspmodelindex-maxbspmodelindex-src-mq3-game-bot-deathmatch-ml-2075382850"></a>
### maxBspModelIndex

```ml
maxBspModelIndex
```

Largest BSP inline-model index available to bot world queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L252)

<a id="field-field-mq3-game-bot-deathmatch-state-maxclients-maxclients-src-mq3-game-bot-deathmatch-ml-934871782"></a>
### maxclients

```ml
maxclients
```

Configured number of client slots active in this game state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L180)

<a id="field-field-mq3-game-bot-deathmatch-state-missionpack-missionpack-src-mq3-game-bot-deathmatch-ml-2050307374"></a>
### missionpack

```ml
missionpack
```

Nonzero when mission-pack rules and content are enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L178)

<a id="field-field-mq3-game-bot-deathmatch-state-navigationservices-navigationservices-src-mq3-game-bot-deathmatch-ml-149367886"></a>
### navigationServices

```ml
navigationServices
```

Callbacks and shared state used for bot navigation decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L210)

<a id="field-field-mq3-game-bot-deathmatch-state-neutralflag-neutralflag-src-mq3-game-bot-deathmatch-ml-415262162"></a>
### neutralFlag

```ml
neutralFlag
```

Goal/entity reference for the neutral flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L198)

<a id="field-field-mq3-game-bot-deathmatch-state-neutralobelisk-neutralobelisk-src-mq3-game-bot-deathmatch-ml-1858828498"></a>
### neutralObelisk

```ml
neutralObelisk
```

Goal/entity reference for the neutral harvester obelisk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L204)

<a id="field-field-mq3-game-bot-deathmatch-state-now-now-src-mq3-game-bot-deathmatch-ml-1709204778"></a>
### now

```ml
now
```

Current clock value supplied to the bot decision step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L216)

<a id="field-field-mq3-game-bot-deathmatch-state-ordertimes-ordertimes-src-mq3-game-bot-deathmatch-ml-1239698758"></a>
### orderTimes

```ml
orderTimes
```

Order timestamps indexed by bot/client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L234)

<a id="field-field-mq3-game-bot-deathmatch-state-pointareafn-pointareafn-src-mq3-game-bot-deathmatch-ml-535640878"></a>
### pointAreaFn

```ml
pointAreaFn
```

Injected callback for point area; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L220)

<a id="field-field-mq3-game-bot-deathmatch-state-randomvalue-randomvalue-src-mq3-game-bot-deathmatch-ml-643273662"></a>
### randomValue

```ml
randomValue
```

Deterministic random input supplied to the current bot decision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L218)

<a id="field-field-mq3-game-bot-deathmatch-state-redaltgoals-redaltgoals-src-mq3-game-bot-deathmatch-ml-572694502"></a>
### redAltGoals

```ml
redAltGoals
```

Alternate-route goals used when approaching the red base.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L246)

<a id="field-field-mq3-game-bot-deathmatch-state-redflag-redflag-src-mq3-game-bot-deathmatch-ml-608405622"></a>
### redFlag

```ml
redFlag
```

Goal/entity reference for the red flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L194)

<a id="field-field-mq3-game-bot-deathmatch-state-redobelisk-redobelisk-src-mq3-game-bot-deathmatch-ml-2141449070"></a>
### redObelisk

```ml
redObelisk
```

Goal/entity reference for the red team obelisk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L200)

<a id="field-field-mq3-game-bot-deathmatch-state-setup-setup-src-mq3-game-bot-deathmatch-ml-1078410314"></a>
### setup

```ml
setup
```

Nonzero after bot/game subsystem setup has completed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L250)

<a id="field-field-mq3-game-bot-deathmatch-state-skins-skins-src-mq3-game-bot-deathmatch-ml-1284195974"></a>
### skins

```ml
skins
```

Registered or selected player skin resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L186)

<a id="field-field-mq3-game-bot-deathmatch-state-snapshotentities-snapshotentities-src-mq3-game-bot-deathmatch-ml-1479067268"></a>
### snapshotEntities

```ml
snapshotEntities
```

Entity-state records supplied by the current snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L190)

<a id="field-field-mq3-game-bot-deathmatch-state-soundnames-soundnames-src-mq3-game-bot-deathmatch-ml-931495308"></a>
### soundNames

```ml
soundNames
```

Resource names indexed by registered sound identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L240)

<a id="field-field-mq3-game-bot-deathmatch-state-strategyfn-strategyfn-src-mq3-game-bot-deathmatch-ml-1627337632"></a>
### strategyFn

```ml
strategyFn
```

Injected callback for strategy; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L226)

<a id="field-field-mq3-game-bot-deathmatch-state-teamstate-teamstate-src-mq3-game-bot-deathmatch-ml-2037619046"></a>
### teamState

```ml
teamState
```

Shared bot team-decision state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L212)

<a id="field-field-mq3-game-bot-deathmatch-state-traceareasfn-traceareasfn-src-mq3-game-bot-deathmatch-ml-1408889400"></a>
### traceAreasFn

```ml
traceAreasFn
```

Injected callback for trace areas; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L222)

<a id="field-field-mq3-game-bot-deathmatch-state-visiblefn-visiblefn-src-mq3-game-bot-deathmatch-ml-716686854"></a>
### visibleFn

```ml
visibleFn
```

Injected callback for visible; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L224)

<a id="field-field-mq3-game-bot-deathmatch-state-waypoints-waypoints-src-mq3-game-bot-deathmatch-ml-362820862"></a>
### waypoints

```ml
waypoints
```

Named waypoint records available to navigation and team orders.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L230)
