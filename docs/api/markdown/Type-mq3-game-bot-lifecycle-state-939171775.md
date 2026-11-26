# `mq3.game.bot_lifecycle.State`

[Home](README.md) · [Source file](File-src-mq3-game-bot-lifecycle-ml-1736646636.md)

<a id="struct-struct-mq3-game-bot-lifecycle-state-struct-state-src-mq3-game-bot-lifecycle-ml-240117799"></a>
## State

```ml
struct State
```

`State` record for bot lifecycle, containing `registry`, `botstates`, `numbots`, `interbreed` and `interbreedMatchCount` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L238)

## Members

<a id="field-field-mq3-game-bot-lifecycle-state-botlibloadmapfn-botlibloadmapfn-src-mq3-game-bot-lifecycle-ml-997791596"></a>
### botLibLoadMapFn

```ml
botLibLoadMapFn
```

Injected callback for bot lib load map; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L282)

<a id="field-field-mq3-game-bot-lifecycle-state-botlibsetupfn-botlibsetupfn-src-mq3-game-bot-lifecycle-ml-1548687560"></a>
### botLibSetupFn

```ml
botLibSetupFn
```

Injected callback for bot lib setup; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L278)

<a id="field-field-mq3-game-bot-lifecycle-state-botlibshutdownfn-botlibshutdownfn-src-mq3-game-bot-lifecycle-ml-1754758636"></a>
### botLibShutdownFn

```ml
botLibShutdownFn
```

Injected callback for bot lib shutdown; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L280)

<a id="field-field-mq3-game-bot-lifecycle-state-botlibvarsetfn-botlibvarsetfn-src-mq3-game-bot-lifecycle-ml-2139645850"></a>
### botLibVarSetFn

```ml
botLibVarSetFn
```

Injected callback for bot lib var set; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L276)

<a id="field-field-mq3-game-bot-lifecycle-state-botstates-botstates-src-mq3-game-bot-lifecycle-ml-1675825448"></a>
### botstates

```ml
botstates
```

Bot-state records indexed by client slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L242)

<a id="field-field-mq3-game-bot-lifecycle-state-clientresources-clientresources-src-mq3-game-bot-lifecycle-ml-1429526340"></a>
### clientResources

```ml
clientResources
```

Per-client botlib resource handles and lifecycle state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L311)

<a id="field-field-mq3-game-bot-lifecycle-state-context-context-src-mq3-game-bot-lifecycle-ml-1807074860"></a>
### context

```ml
context
```

Opaque caller-supplied context available to botlib setup, map loading, shutdown, and bot-state reset callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L309)

<a id="field-field-mq3-game-bot-lifecycle-state-cvareffectfn-cvareffectfn-src-mq3-game-bot-lifecycle-ml-1134009722"></a>
### cvarEffectFn

```ml
cvarEffectFn
```

Injected callback for console variable effect; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L274)

<a id="field-field-mq3-game-bot-lifecycle-state-deathmatchsetupfn-deathmatchsetupfn-src-mq3-game-bot-lifecycle-ml-602240108"></a>
### deathmatchSetupFn

```ml
deathmatchSetupFn
```

Injected callback for deathmatch setup; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L296)

<a id="field-field-mq3-game-bot-lifecycle-state-developer-developer-src-mq3-game-bot-lifecycle-ml-49147724"></a>
### developer

```ml
developer
```

Developer diagnostic setting exposed to the bot/game subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L264)

<a id="field-field-mq3-game-bot-lifecycle-state-freewaypointsfn-freewaypointsfn-src-mq3-game-bot-lifecycle-ml-154153084"></a>
### freeWaypointsFn

```ml
freeWaypointsFn
```

Injected callback for free waypoints; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L284)

<a id="field-field-mq3-game-bot-lifecycle-state-geneticselectionfn-geneticselectionfn-src-mq3-game-bot-lifecycle-ml-1638213214"></a>
### geneticSelectionFn

```ml
geneticSelectionFn
```

Injected callback for genetic selection; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L300)

<a id="field-field-mq3-game-bot-lifecycle-state-interbreed-interbreed-src-mq3-game-bot-lifecycle-ml-417485372"></a>
### interbreed

```ml
interbreed
```

Nonzero while genetic interbreeding of bot characters is enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L246)

<a id="field-field-mq3-game-bot-lifecycle-state-interbreedbots-interbreedbots-src-mq3-game-bot-lifecycle-ml-960730916"></a>
### interbreedbots

```ml
interbreedbots
```

Number of bots participating in an interbreeding run.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L268)

<a id="field-field-mq3-game-bot-lifecycle-state-interbreedchar-interbreedchar-src-mq3-game-bot-lifecycle-ml-2121487212"></a>
### interbreedchar

```ml
interbreedchar
```

Character definition used as input to bot interbreeding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L266)

<a id="field-field-mq3-game-bot-lifecycle-state-interbreedcycle-interbreedcycle-src-mq3-game-bot-lifecycle-ml-1142971140"></a>
### interbreedcycle

```ml
interbreedcycle
```

Number of matches between bot interbreeding cycles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L270)

<a id="field-field-mq3-game-bot-lifecycle-state-interbreedgoalfn-interbreedgoalfn-src-mq3-game-bot-lifecycle-ml-943572410"></a>
### interbreedGoalFn

```ml
interbreedGoalFn
```

Injected callback for interbreed goal; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L302)

<a id="field-field-mq3-game-bot-lifecycle-state-interbreedmatchcount-interbreedmatchcount-src-mq3-game-bot-lifecycle-ml-775023228"></a>
### interbreedMatchCount

```ml
interbreedMatchCount
```

Matches accumulated toward the next interbreeding cycle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L248)

<a id="field-field-mq3-game-bot-lifecycle-state-interbreedwrite-interbreedwrite-src-mq3-game-bot-lifecycle-ml-317524460"></a>
### interbreedwrite

```ml
interbreedwrite
```

Output character-file setting for the interbreeding result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L272)

<a id="field-field-mq3-game-bot-lifecycle-state-memorydump-memorydump-src-mq3-game-bot-lifecycle-ml-1763866430"></a>
### memorydump

```ml
memorydump
```

Control value requesting botlib memory diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L252)

<a id="field-field-mq3-game-bot-lifecycle-state-mutategoalfn-mutategoalfn-src-mq3-game-bot-lifecycle-ml-1424380898"></a>
### mutateGoalFn

```ml
mutateGoalFn
```

Injected callback for mutate goal; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L304)

<a id="field-field-mq3-game-bot-lifecycle-state-numbots-numbots-src-mq3-game-bot-lifecycle-ml-1343655052"></a>
### numbots

```ml
numbots
```

Number of allocated bot-state records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L244)

<a id="field-field-mq3-game-bot-lifecycle-state-pause-pause-src-mq3-game-bot-lifecycle-ml-316179788"></a>
### pause

```ml
pause
```

Control value that pauses bot thinking.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L256)

<a id="field-field-mq3-game-bot-lifecycle-state-registry-registry-src-mq3-game-bot-lifecycle-ml-1614405034"></a>
### registry

```ml
registry
```

Registry of currently loaded preprocessor/token sources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L240)

<a id="field-field-mq3-game-bot-lifecycle-state-report-report-src-mq3-game-bot-lifecycle-ml-1213666284"></a>
### report

```ml
report
```

Control value enabling bot-state diagnostic reporting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L258)

<a id="field-field-mq3-game-bot-lifecycle-state-resetavoidgoalsfn-resetavoidgoalsfn-src-mq3-game-bot-lifecycle-ml-1463069880"></a>
### resetAvoidGoalsFn

```ml
resetAvoidGoalsFn
```

Injected callback for reset avoid goals; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L292)

<a id="field-field-mq3-game-bot-lifecycle-state-resetavoidreachfn-resetavoidreachfn-src-mq3-game-bot-lifecycle-ml-461151500"></a>
### resetAvoidReachFn

```ml
resetAvoidReachFn
```

Injected callback for reset avoid reach; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L294)

<a id="field-field-mq3-game-bot-lifecycle-state-resetgoalstatefn-resetgoalstatefn-src-mq3-game-bot-lifecycle-ml-1607106070"></a>
### resetGoalStateFn

```ml
resetGoalStateFn
```

Injected callback for reset goal state; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L288)

<a id="field-field-mq3-game-bot-lifecycle-state-resetmovestatefn-resetmovestatefn-src-mq3-game-bot-lifecycle-ml-1545672770"></a>
### resetMoveStateFn

```ml
resetMoveStateFn
```

Injected callback for reset move state; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L286)

<a id="field-field-mq3-game-bot-lifecycle-state-resetweaponstatefn-resetweaponstatefn-src-mq3-game-bot-lifecycle-ml-114492796"></a>
### resetWeaponStateFn

```ml
resetWeaponStateFn
```

Injected callback for reset weapon state; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L290)

<a id="field-field-mq3-game-bot-lifecycle-state-savegoalfn-savegoalfn-src-mq3-game-bot-lifecycle-ml-932882224"></a>
### saveGoalFn

```ml
saveGoalFn
```

Injected callback for save goal; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L306)

<a id="field-field-mq3-game-bot-lifecycle-state-saveroutingcache-saveroutingcache-src-mq3-game-bot-lifecycle-ml-1733851130"></a>
### saveroutingcache

```ml
saveroutingcache
```

Control value requesting persistence of the AAS routing cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L254)

<a id="field-field-mq3-game-bot-lifecycle-state-shutdownclientfn-shutdownclientfn-src-mq3-game-bot-lifecycle-ml-1009801310"></a>
### shutdownClientFn

```ml
shutdownClientFn
```

Injected callback for shutdown client; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L298)

<a id="field-field-mq3-game-bot-lifecycle-state-testclusters-testclusters-src-mq3-game-bot-lifecycle-ml-668852422"></a>
### testclusters

```ml
testclusters
```

Control value enabling AAS cluster diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L262)

<a id="field-field-mq3-game-bot-lifecycle-state-testsolid-testsolid-src-mq3-game-bot-lifecycle-ml-1005426108"></a>
### testsolid

```ml
testsolid
```

Control value enabling bot/AAS solidity diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L260)

<a id="field-field-mq3-game-bot-lifecycle-state-thinktime-thinktime-src-mq3-game-bot-lifecycle-ml-653184776"></a>
### thinktime

```ml
thinktime
```

Time interval used for the current bot thinking/update step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_lifecycle.ml#L250)
