# `mq3.game.ai_main.Services`

[Home](README.md) · [Source file](File-src-mq3-game-ai-main-ml-353661212.md)

<a id="struct-struct-mq3-game-ai-main-services-struct-services-src-mq3-game-ai-main-ml-1757899911"></a>
## Services

```ml
struct Services
```

`Services` record for ai main, containing `lifecycleState`, `frameServices`, `clientServices`, `commandServices` and `inputServices` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L81)

## Members

<a id="field-field-mq3-game-ai-main-services-aasinitializedfn-aasinitializedfn-src-mq3-game-ai-main-ml-778008055"></a>
### aasInitializedFn

```ml
aasInitializedFn
```

Injected callback for AAS initialized; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L111)

<a id="field-field-mq3-game-ai-main-services-actions-actions-src-mq3-game-ai-main-ml-764553173"></a>
### actions

```ml
actions
```

Recorded host actions emitted by bot decision logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L95)

<a id="field-field-mq3-game-ai-main-services-areainfofn-areainfofn-src-mq3-game-ai-main-ml-508072447"></a>
### areaInfoFn

```ml
areaInfoFn
```

Injected callback for area info; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L113)

<a id="field-field-mq3-game-ai-main-services-clientfromnamefn-clientfromnamefn-src-mq3-game-ai-main-ml-1435742749"></a>
### clientFromNameFn

```ml
clientFromNameFn
```

Injected callback for client from name; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L115)

<a id="field-field-mq3-game-ai-main-services-clientservices-clientservices-src-mq3-game-ai-main-ml-2002608907"></a>
### clientServices

```ml
clientServices
```

Callbacks used to manage bot/player client state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L87)

<a id="field-field-mq3-game-ai-main-services-commandservices-commandservices-src-mq3-game-ai-main-ml-672123977"></a>
### commandServices

```ml
commandServices
```

Callbacks used to deliver or process game commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L89)

<a id="field-field-mq3-game-ai-main-services-context-context-src-mq3-game-ai-main-ml-2066126753"></a>
### context

```ml
context
```

Opaque caller-supplied context available to top-level bot AI entity, trace, chat, cvar, and level callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L124)

<a id="field-field-mq3-game-ai-main-services-cvarstringfn-cvarstringfn-src-mq3-game-ai-main-ml-575704463"></a>
### cvarStringFn

```ml
cvarStringFn
```

Injected callback for console variable string; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L121)

<a id="field-field-mq3-game-ai-main-services-entityinfofn-entityinfofn-src-mq3-game-ai-main-ml-1288135047"></a>
### entityInfoFn

```ml
entityInfoFn
```

Injected callback for entity info; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L103)

<a id="field-field-mq3-game-ai-main-services-exitlevelfn-exitlevelfn-src-mq3-game-ai-main-ml-787092529"></a>
### exitLevelFn

```ml
exitLevelFn
```

Injected callback for exit level; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L117)

<a id="field-field-mq3-game-ai-main-services-frameservices-frameservices-src-mq3-game-ai-main-ml-740707137"></a>
### frameServices

```ml
frameServices
```

Callbacks used to perform a game or bot frame update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L85)

<a id="field-field-mq3-game-ai-main-services-initialchatfn-initialchatfn-src-mq3-game-ai-main-ml-1180390833"></a>
### initialChatFn

```ml
initialChatFn
```

Injected callback for initial chat; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L107)

<a id="field-field-mq3-game-ai-main-services-inputservices-inputservices-src-mq3-game-ai-main-ml-79190849"></a>
### inputServices

```ml
inputServices
```

Callbacks used to translate bot decisions into input commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L91)

<a id="field-field-mq3-game-ai-main-services-lifecyclestate-lifecyclestate-src-mq3-game-ai-main-ml-1743945427"></a>
### lifecycleState

```ml
lifecycleState
```

State shared by bot allocation, setup, shutdown, and frame processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L83)

<a id="field-field-mq3-game-ai-main-services-pointareafn-pointareafn-src-mq3-game-ai-main-ml-48533225"></a>
### pointAreaFn

```ml
pointAreaFn
```

Injected callback for point area; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L109)

<a id="field-field-mq3-game-ai-main-services-printfn-printfn-src-mq3-game-ai-main-ml-200579017"></a>
### printFn

```ml
printFn
```

Injected callback for print; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L99)

<a id="field-field-mq3-game-ai-main-services-retailactive-retailactive-src-mq3-game-ai-main-ml-25433239"></a>
### retailActive

```ml
retailActive
```

Nonzero when the retail-compatible bot decision path is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L97)

<a id="field-field-mq3-game-ai-main-services-sendconsolecommandfn-sendconsolecommandfn-src-mq3-game-ai-main-ml-1024012901"></a>
### sendConsoleCommandFn

```ml
sendConsoleCommandFn
```

Injected callback for send console command; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L119)

<a id="field-field-mq3-game-ai-main-services-sessions-sessions-src-mq3-game-ai-main-ml-1612420139"></a>
### sessions

```ml
sessions
```

Per-client session records retained by the game runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L93)

<a id="field-field-mq3-game-ai-main-services-synonymcontextfn-synonymcontextfn-src-mq3-game-ai-main-ml-1590666929"></a>
### synonymContextFn

```ml
synonymContextFn
```

Injected callback for synonym context; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L105)

<a id="field-field-mq3-game-ai-main-services-tracefn-tracefn-src-mq3-game-ai-main-ml-895808237"></a>
### traceFn

```ml
traceFn
```

Injected callback for trace; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L101)
