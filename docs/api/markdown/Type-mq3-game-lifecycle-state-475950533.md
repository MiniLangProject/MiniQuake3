# `mq3.game.lifecycle.State`

[Home](README.md) · [Source file](File-src-mq3-game-lifecycle-ml-96284622.md)

<a id="struct-struct-mq3-game-lifecycle-state-struct-state-src-mq3-game-lifecycle-ml-674610351"></a>
## State

```ml
struct State
```

`State` record for lifecycle, containing `buildDate`, `entitiesBound`, `clientsBound`, `openLogFn` and `closeLogFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L33)

## Members

<a id="field-field-mq3-game-lifecycle-state-botaiframe-botaiframe-src-mq3-game-lifecycle-ml-829520644"></a>
### botAiFrame

```ml
botAiFrame
```

State scheduling and executing bot AI frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L77)

<a id="field-field-mq3-game-lifecycle-state-botallocateclientfn-botallocateclientfn-src-mq3-game-lifecycle-ml-349605528"></a>
### botAllocateClientFn

```ml
botAllocateClientFn
```

Injected callback for bot allocate client; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L57)

<a id="field-field-mq3-game-lifecycle-state-botclientresources-botclientresources-src-mq3-game-lifecycle-ml-910151794"></a>
### botClientResources

```ml
botClientResources
```

Per-bot client resource handles owned by the level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L73)

<a id="field-field-mq3-game-lifecycle-state-botclients-botclients-src-mq3-game-lifecycle-ml-1470649850"></a>
### botClients

```ml
botClients
```

Bot client bookkeeping and connection state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L71)

<a id="field-field-mq3-game-lifecycle-state-botloadmapfn-botloadmapfn-src-mq3-game-lifecycle-ml-483725390"></a>
### botLoadMapFn

```ml
botLoadMapFn
```

Injected callback for bot load map; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L51)

<a id="field-field-mq3-game-lifecycle-state-botpopulation-botpopulation-src-mq3-game-lifecycle-ml-368337108"></a>
### botPopulation

```ml
botPopulation
```

State maintaining the configured minimum player population.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L75)

<a id="field-field-mq3-game-lifecycle-state-botregistry-botregistry-src-mq3-game-lifecycle-ml-1026330636"></a>
### botRegistry

```ml
botRegistry
```

Registry of configured definitions and active bot slots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L69)

<a id="field-field-mq3-game-lifecycle-state-botsetupfn-botsetupfn-src-mq3-game-lifecycle-ml-1688709948"></a>
### botSetupFn

```ml
botSetupFn
```

Injected callback for bot setup; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L49)

<a id="field-field-mq3-game-lifecycle-state-botshutdownfn-botshutdownfn-src-mq3-game-lifecycle-ml-1516629168"></a>
### botShutdownFn

```ml
botShutdownFn
```

Injected callback for bot shutdown; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L55)

<a id="field-field-mq3-game-lifecycle-state-botstate-botstate-src-mq3-game-lifecycle-ml-356557580"></a>
### botState

```ml
botState
```

Shared bot-AI frame state associated with the level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L67)

<a id="field-field-mq3-game-lifecycle-state-builddate-builddate-src-mq3-game-lifecycle-ml-2132113224"></a>
### buildDate

```ml
buildDate
```

Build-date string exposed by game/server information commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L35)

<a id="field-field-mq3-game-lifecycle-state-clientsbound-clientsbound-src-mq3-game-lifecycle-ml-1227443868"></a>
### clientsBound

```ml
clientsBound
```

Nonzero after game client storage is bound to the host engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L39)

<a id="field-field-mq3-game-lifecycle-state-closelogfn-closelogfn-src-mq3-game-lifecycle-ml-386930348"></a>
### closeLogFn

```ml
closeLogFn
```

Injected callback for close log; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L43)

<a id="field-field-mq3-game-lifecycle-state-cvareffectfn-cvareffectfn-src-mq3-game-lifecycle-ml-902310454"></a>
### cvarEffectFn

```ml
cvarEffectFn
```

Injected callback for console variable effect; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L65)

<a id="field-field-mq3-game-lifecycle-state-entitiesbound-entitiesbound-src-mq3-game-lifecycle-ml-1347797480"></a>
### entitiesBound

```ml
entitiesBound
```

Nonzero after game entity storage is bound to the host engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L37)

<a id="field-field-mq3-game-lifecycle-state-entityobservefn-entityobservefn-src-mq3-game-lifecycle-ml-83939692"></a>
### entityObserveFn

```ml
entityObserveFn
```

Injected callback for entity observe; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L63)

<a id="field-field-mq3-game-lifecycle-state-initbotsfn-initbotsfn-src-mq3-game-lifecycle-ml-941310524"></a>
### initBotsFn

```ml
initBotsFn
```

Injected callback for init bots; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L53)

<a id="field-field-mq3-game-lifecycle-state-integerqueryfn-integerqueryfn-src-mq3-game-lifecycle-ml-510050864"></a>
### integerQueryFn

```ml
integerQueryFn
```

Injected callback for integer query; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L59)

<a id="field-field-mq3-game-lifecycle-state-locatefn-locatefn-src-mq3-game-lifecycle-ml-295501160"></a>
### locateFn

```ml
locateFn
```

Injected callback for locate; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L47)

<a id="field-field-mq3-game-lifecycle-state-openlogfn-openlogfn-src-mq3-game-lifecycle-ml-590926484"></a>
### openLogFn

```ml
openLogFn
```

Injected callback for open log; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L41)

<a id="field-field-mq3-game-lifecycle-state-serverinfofn-serverinfofn-src-mq3-game-lifecycle-ml-1196738014"></a>
### serverInfoFn

```ml
serverInfoFn
```

Injected callback for server info; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L45)

<a id="field-field-mq3-game-lifecycle-state-spawneffectfn-spawneffectfn-src-mq3-game-lifecycle-ml-1249785468"></a>
### spawnEffectFn

```ml
spawnEffectFn
```

Injected callback for spawn effect; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/lifecycle.ml#L61)
