# `mq3.game.bot_ai_frame.Services`

[Home](README.md) · [Source file](File-src-mq3-game-bot-ai-frame-ml-144686062.md)

<a id="struct-struct-mq3-game-bot-ai-frame-services-struct-services-src-mq3-game-bot-ai-frame-ml-1398650789"></a>
## Services

```ml
struct Services
```

`Services` record for bot ai frame, containing `lifecycleState`, `runtimes`, `localTime`, `botlibResidual` and `lastBotThinkTime` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L93)

## Members

<a id="field-field-mq3-game-bot-ai-frame-services-aasinitializedfn-aasinitializedfn-src-mq3-game-bot-ai-frame-ml-1529688771"></a>
### aasInitializedFn

```ml
aasInitializedFn
```

Injected callback for AAS initialized; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L127)

<a id="field-field-mq3-game-bot-ai-frame-services-aastimefn-aastimefn-src-mq3-game-bot-ai-frame-ml-657266105"></a>
### aasTimeFn

```ml
aasTimeFn
```

Injected callback for AAS time; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L135)

<a id="field-field-mq3-game-bot-ai-frame-services-botaifn-botaifn-src-mq3-game-bot-ai-frame-ml-758771253"></a>
### botAiFn

```ml
botAiFn
```

Injected callback for bot ai; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L137)

<a id="field-field-mq3-game-bot-ai-frame-services-botlibresidual-botlibresidual-src-mq3-game-bot-ai-frame-ml-1041413387"></a>
### botlibResidual

```ml
botlibResidual
```

Accumulated time not yet consumed by a botlib update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L101)

<a id="field-field-mq3-game-bot-ai-frame-services-botlibstartframefn-botlibstartframefn-src-mq3-game-bot-ai-frame-ml-585771259"></a>
### botLibStartFrameFn

```ml
botLibStartFrameFn
```

Injected callback for bot lib start frame; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L125)

<a id="field-field-mq3-game-bot-ai-frame-services-botlibvarsetfn-botlibvarsetfn-src-mq3-game-bot-ai-frame-ml-1176172299"></a>
### botLibVarSetFn

```ml
botLibVarSetFn
```

Injected callback for bot lib var set; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L117)

<a id="field-field-mq3-game-bot-ai-frame-services-checkspawnfn-checkspawnfn-src-mq3-game-bot-ai-frame-ml-1637753043"></a>
### checkSpawnFn

```ml
checkSpawnFn
```

Injected callback for check spawn; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L109)

<a id="field-field-mq3-game-bot-ai-frame-services-commandservices-commandservices-src-mq3-game-bot-ai-frame-ml-325099329"></a>
### commandServices

```ml
commandServices
```

Callbacks used to deliver or process game commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L143)

<a id="field-field-mq3-game-bot-ai-frame-services-context-context-src-mq3-game-bot-ai-frame-ml-62685097"></a>
### context

```ml
context
```

Opaque caller-supplied context available to bot frame scheduling, entity updates, clock, and user-command callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L152)

<a id="field-field-mq3-game-bot-ai-frame-services-cvarsetfn-cvarsetfn-src-mq3-game-bot-ai-frame-ml-1138340281"></a>
### cvarSetFn

```ml
cvarSetFn
```

Injected callback for console variable set; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L119)

<a id="field-field-mq3-game-bot-ai-frame-services-fightservices-fightservices-src-mq3-game-bot-ai-frame-ml-313243353"></a>
### fightServices

```ml
fightServices
```

Callbacks and shared state used by the bot fight node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L147)

<a id="field-field-mq3-game-bot-ai-frame-services-floattime-floattime-src-mq3-game-bot-ai-frame-ml-524965477"></a>
### floattime

```ml
floattime
```

Current game time represented in seconds for botlib/AI calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L107)

<a id="field-field-mq3-game-bot-ai-frame-services-floattimefn-floattimefn-src-mq3-game-bot-ai-frame-ml-2054953913"></a>
### floatTimeFn

```ml
floatTimeFn
```

Injected callback for float time; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L131)

<a id="field-field-mq3-game-bot-ai-frame-services-inputservices-inputservices-src-mq3-game-bot-ai-frame-ml-357667593"></a>
### inputServices

```ml
inputServices
```

Callbacks used to translate bot decisions into input commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L145)

<a id="field-field-mq3-game-bot-ai-frame-services-interbreedfn-interbreedfn-src-mq3-game-bot-ai-frame-ml-1654266029"></a>
### interbreedFn

```ml
interbreedFn
```

Injected callback for interbreed; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L121)

<a id="field-field-mq3-game-bot-ai-frame-services-lastbotthinktime-lastbotthinktime-src-mq3-game-bot-ai-frame-ml-62480977"></a>
### lastBotThinkTime

```ml
lastBotThinkTime
```

Timestamp at which bot thinking last ran.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L103)

<a id="field-field-mq3-game-bot-ai-frame-services-lifecyclestate-lifecyclestate-src-mq3-game-bot-ai-frame-ml-1615742967"></a>
### lifecycleState

```ml
lifecycleState
```

State shared by bot allocation, setup, shutdown, and frame processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L95)

<a id="field-field-mq3-game-bot-ai-frame-services-localtime-localtime-src-mq3-game-bot-ai-frame-ml-1760162097"></a>
### localTime

```ml
localTime
```

Local clock value maintained by the bot runtime adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L99)

<a id="field-field-mq3-game-bot-ai-frame-services-regularupdatetime-regularupdatetime-src-mq3-game-bot-ai-frame-ml-648719605"></a>
### regularUpdateTime

```ml
regularUpdateTime
```

Deadline for the next periodic bot-state update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L105)

<a id="field-field-mq3-game-bot-ai-frame-services-reportfn-reportfn-src-mq3-game-bot-ai-frame-ml-1210949993"></a>
### reportFn

```ml
reportFn
```

Injected callback for report; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L113)

<a id="field-field-mq3-game-bot-ai-frame-services-runtimes-runtimes-src-mq3-game-bot-ai-frame-ml-14936691"></a>
### runtimes

```ml
runtimes
```

Runtime instances used to execute bot decision logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L97)

<a id="field-field-mq3-game-bot-ai-frame-services-schedulethinkfn-schedulethinkfn-src-mq3-game-bot-ai-frame-ml-1081425241"></a>
### scheduleThinkFn

```ml
scheduleThinkFn
```

Injected callback for schedule think; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L123)

<a id="field-field-mq3-game-bot-ai-frame-services-seekservices-seekservices-src-mq3-game-bot-ai-frame-ml-1653978801"></a>
### seekServices

```ml
seekServices
```

Callbacks used by the bot seek/goal-acquisition node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L149)

<a id="field-field-mq3-game-bot-ai-frame-services-snapshotentityfn-snapshotentityfn-src-mq3-game-bot-ai-frame-ml-1993150039"></a>
### snapshotEntityFn

```ml
snapshotEntityFn
```

Injected callback for snapshot entity; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L141)

<a id="field-field-mq3-game-bot-ai-frame-services-updatecvarfn-updatecvarfn-src-mq3-game-bot-ai-frame-ml-287722255"></a>
### updateCvarFn

```ml
updateCvarFn
```

Injected callback for update console variable; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L111)

<a id="field-field-mq3-game-bot-ai-frame-services-updateentityfn-updateentityfn-src-mq3-game-bot-ai-frame-ml-2035560953"></a>
### updateEntityFn

```ml
updateEntityFn
```

Injected callback for update entity; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L129)

<a id="field-field-mq3-game-bot-ai-frame-services-updateentityitemsfn-updateentityitemsfn-src-mq3-game-bot-ai-frame-ml-79066665"></a>
### updateEntityItemsFn

```ml
updateEntityItemsFn
```

Injected callback for update entity items; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L133)

<a id="field-field-mq3-game-bot-ai-frame-services-updateinputfn-updateinputfn-src-mq3-game-bot-ai-frame-ml-218447837"></a>
### updateInputFn

```ml
updateInputFn
```

Injected callback for update input; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L139)

<a id="field-field-mq3-game-bot-ai-frame-services-usercommandfn-usercommandfn-src-mq3-game-bot-ai-frame-ml-1649449205"></a>
### userCommandFn

```ml
userCommandFn
```

Injected callback for user command; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_ai_frame.ml#L115)
