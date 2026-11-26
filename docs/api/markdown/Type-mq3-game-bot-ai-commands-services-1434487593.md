# `mq3.game.bot_ai_commands.Services`

[Home](README.md) · [Source file](File-src-mq3-game-bot-ai-commands-ml-200092467.md)

<a id="struct-struct-mq3-game-bot-ai-commands-services-struct-services-src-mq3-game-bot-ai-commands-ml-780334911"></a>
## Services

```ml
struct Services
```

`Services` record for bot ai commands, containing `lifecycleState`, `frameLevel`, `maxclients`, `gametype` and `resetInputFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L51)

## Members

<a id="field-field-mq3-game-bot-ai-commands-services-carryingflagfn-carryingflagfn-src-mq3-game-bot-ai-commands-ml-643521619"></a>
### carryingFlagFn

```ml
carryingFlagFn
```

Injected callback for carrying flag; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L81)

<a id="field-field-mq3-game-bot-ai-commands-services-clientnamefn-clientnamefn-src-mq3-game-bot-ai-commands-ml-1507560017"></a>
### clientNameFn

```ml
clientNameFn
```

Injected callback for client name; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L73)

<a id="field-field-mq3-game-bot-ai-commands-services-context-context-src-mq3-game-bot-ai-commands-ml-1965900609"></a>
### context

```ml
context
```

Opaque caller-supplied context available to bot command processing, client-state lookup, and diagnostic callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L98)

<a id="field-field-mq3-game-bot-ai-commands-services-deathmatchsetupfn-deathmatchsetupfn-src-mq3-game-bot-ai-commands-ml-1994267225"></a>
### deathmatchSetupFn

```ml
deathmatchSetupFn
```

Injected callback for deathmatch setup; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L69)

<a id="field-field-mq3-game-bot-ai-commands-services-diagnosticfn-diagnosticfn-src-mq3-game-bot-ai-commands-ml-2054734187"></a>
### diagnosticFn

```ml
diagnosticFn
```

Injected callback for diagnostic; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L71)

<a id="field-field-mq3-game-bot-ai-commands-services-easyclientnamefn-easyclientnamefn-src-mq3-game-bot-ai-commands-ml-201236141"></a>
### easyClientNameFn

```ml
easyClientNameFn
```

Injected callback for easy client name; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L75)

<a id="field-field-mq3-game-bot-ai-commands-services-fightservices-fightservices-src-mq3-game-bot-ai-commands-ml-642574497"></a>
### fightServices

```ml
fightServices
```

Callbacks and shared state used by the bot fight node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L91)

<a id="field-field-mq3-game-bot-ai-commands-services-framelevel-framelevel-src-mq3-game-bot-ai-commands-ml-969305967"></a>
### frameLevel

```ml
frameLevel
```

Game-level state supplied to bot frame processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L55)

<a id="field-field-mq3-game-bot-ai-commands-services-gametype-gametype-src-mq3-game-bot-ai-commands-ml-172433529"></a>
### gametype

```ml
gametype
```

GT_* game-mode identifier used for bot command processing and mode-specific player information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L59)

<a id="field-field-mq3-game-bot-ai-commands-services-getclientstatefn-getclientstatefn-src-mq3-game-bot-ai-commands-ml-496740441"></a>
### getClientStateFn

```ml
getClientStateFn
```

Injected callback for get client state; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L63)

<a id="field-field-mq3-game-bot-ai-commands-services-getplayerconfigfn-getplayerconfigfn-src-mq3-game-bot-ai-commands-ml-288142081"></a>
### getPlayerConfigFn

```ml
getPlayerConfigFn
```

Injected callback for get player config; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L85)

<a id="field-field-mq3-game-bot-ai-commands-services-goalnamefn-goalnamefn-src-mq3-game-bot-ai-commands-ml-1088314665"></a>
### goalNameFn

```ml
goalNameFn
```

Injected callback for goal name; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L77)

<a id="field-field-mq3-game-bot-ai-commands-services-lifecyclestate-lifecyclestate-src-mq3-game-bot-ai-commands-ml-1576674859"></a>
### lifecycleState

```ml
lifecycleState
```

State shared by bot allocation, setup, shutdown, and frame processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L53)

<a id="field-field-mq3-game-bot-ai-commands-services-maxclients-maxclients-src-mq3-game-bot-ai-commands-ml-2019429153"></a>
### maxclients

```ml
maxclients
```

Configured number of client slots active in this game state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L57)

<a id="field-field-mq3-game-bot-ai-commands-services-nextservercommandfn-nextservercommandfn-src-mq3-game-bot-ai-commands-ml-2060643409"></a>
### nextServerCommandFn

```ml
nextServerCommandFn
```

Injected callback for next server command; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L65)

<a id="field-field-mq3-game-bot-ai-commands-services-nodestepfn-nodestepfn-src-mq3-game-bot-ai-commands-ml-2009736817"></a>
### nodeStepFn

```ml
nodeStepFn
```

Injected callback for node step; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L95)

<a id="field-field-mq3-game-bot-ai-commands-services-printfn-printfn-src-mq3-game-bot-ai-commands-ml-1690165217"></a>
### printFn

```ml
printFn
```

Injected callback for print; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L89)

<a id="field-field-mq3-game-bot-ai-commands-services-queuemessagefn-queuemessagefn-src-mq3-game-bot-ai-commands-ml-573723905"></a>
### queueMessageFn

```ml
queueMessageFn
```

Injected callback for queue message; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L67)

<a id="field-field-mq3-game-bot-ai-commands-services-resetinputfn-resetinputfn-src-mq3-game-bot-ai-commands-ml-1388144195"></a>
### resetInputFn

```ml
resetInputFn
```

Injected callback for reset input; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L61)

<a id="field-field-mq3-game-bot-ai-commands-services-seekservices-seekservices-src-mq3-game-bot-ai-commands-ml-1740523177"></a>
### seekServices

```ml
seekServices
```

Callbacks used by the bot seek/goal-acquisition node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L93)

<a id="field-field-mq3-game-bot-ai-commands-services-setbotinfofn-setbotinfofn-src-mq3-game-bot-ai-commands-ml-282373503"></a>
### setBotInfoFn

```ml
setBotInfoFn
```

Injected callback for set bot info; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L87)

<a id="field-field-mq3-game-bot-ai-commands-services-teamfn-teamfn-src-mq3-game-bot-ai-commands-ml-1205774147"></a>
### teamFn

```ml
teamFn
```

Injected callback for team; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L83)

<a id="field-field-mq3-game-bot-ai-commands-services-topgoalnumberfn-topgoalnumberfn-src-mq3-game-bot-ai-commands-ml-1772056825"></a>
### topGoalNumberFn

```ml
topGoalNumberFn
```

Injected callback for top goal number; invoked through the Services service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L79)
