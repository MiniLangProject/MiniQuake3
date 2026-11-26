# `mq3.game.ai_dmnet.Services`

[Home](README.md) · [Source file](File-src-mq3-game-ai-dmnet-ml-1223783669.md)

<a id="struct-struct-mq3-game-ai-dmnet-services-struct-services-src-mq3-game-ai-dmnet-ml-336725579"></a>
## Services

```ml
struct Services
```

`Services` record for ai dmnet, containing `fightServices`, `seekServices`, `navigationServices`, `mission` and `nodeSwitches` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L157)

## Members

<a id="field-field-mq3-game-ai-dmnet-services-actions-actions-src-mq3-game-ai-dmnet-ml-1748786303"></a>
### actions

```ml
actions
```

Recorded host actions emitted by bot decision logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L185)

<a id="field-field-mq3-game-ai-dmnet-services-attackfn-attackfn-src-mq3-game-ai-dmnet-ml-1490850803"></a>
### attackFn

```ml
attackFn
```

Injected callback for attack; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L179)

<a id="field-field-mq3-game-ai-dmnet-services-context-context-src-mq3-game-ai-dmnet-ml-2035866459"></a>
### context

```ml
context
```

Opaque caller-supplied context available to decision-network timing, diagnostics, entity, trace, and attack callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L188)

<a id="field-field-mq3-game-ai-dmnet-services-entitystatefn-entitystatefn-src-mq3-game-ai-dmnet-ml-1216979635"></a>
### entityStateFn

```ml
entityStateFn
```

Injected callback for entity state; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L175)

<a id="field-field-mq3-game-ai-dmnet-services-fightservices-fightservices-src-mq3-game-ai-dmnet-ml-1924985883"></a>
### fightServices

```ml
fightServices
```

Callbacks and shared state used by the bot fight node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L159)

<a id="field-field-mq3-game-ai-dmnet-services-infovfn-infovfn-src-mq3-game-ai-dmnet-ml-878527043"></a>
### inFovFn

```ml
inFovFn
```

Injected callback for in field of view; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L181)

<a id="field-field-mq3-game-ai-dmnet-services-mission-mission-src-mq3-game-ai-dmnet-ml-970177827"></a>
### mission

```ml
mission
```

Additional service/state bundle for mission-pack game behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L165)

<a id="field-field-mq3-game-ai-dmnet-services-namefn-namefn-src-mq3-game-ai-dmnet-ml-1954390509"></a>
### nameFn

```ml
nameFn
```

Injected callback for name; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L169)

<a id="field-field-mq3-game-ai-dmnet-services-navigationservices-navigationservices-src-mq3-game-ai-dmnet-ml-449629255"></a>
### navigationServices

```ml
navigationServices
```

Callbacks and shared state used for bot navigation decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L163)

<a id="field-field-mq3-game-ai-dmnet-services-nodeswitches-nodeswitches-src-mq3-game-ai-dmnet-ml-1886641203"></a>
### nodeSwitches

```ml
nodeSwitches
```

Recorded transitions between bot decision-network nodes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L167)

<a id="field-field-mq3-game-ai-dmnet-services-printfn-printfn-src-mq3-game-ai-dmnet-ml-1229912603"></a>
### printFn

```ml
printFn
```

Injected callback for print; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L173)

<a id="field-field-mq3-game-ai-dmnet-services-retailactive-retailactive-src-mq3-game-ai-dmnet-ml-1130127977"></a>
### retailActive

```ml
retailActive
```

Nonzero when the retail-compatible bot decision path is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L183)

<a id="field-field-mq3-game-ai-dmnet-services-seekservices-seekservices-src-mq3-game-ai-dmnet-ml-689708915"></a>
### seekServices

```ml
seekServices
```

Callbacks used by the bot seek/goal-acquisition node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L161)

<a id="field-field-mq3-game-ai-dmnet-services-timefn-timefn-src-mq3-game-ai-dmnet-ml-1800785449"></a>
### timeFn

```ml
timeFn
```

Injected callback for time; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L171)

<a id="field-field-mq3-game-ai-dmnet-services-tracefn-tracefn-src-mq3-game-ai-dmnet-ml-1563412703"></a>
### traceFn

```ml
traceFn
```

Injected callback for trace; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L177)
