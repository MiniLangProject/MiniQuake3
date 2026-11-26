# `mq3.game.bot_population.State`

[Home](README.md) · [Source file](File-src-mq3-game-bot-population-ml-383691011.md)

<a id="struct-struct-mq3-game-bot-population-state-struct-state-src-mq3-game-bot-population-ml-697254343"></a>
## State

```ml
struct State
```

`State` record for bot population, containing `registry`, `clients`, `checkTime`, `minimumPlayers` and `minimumVm` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_population.ml#L32)

## Members

<a id="field-field-mq3-game-bot-population-state-allocateclientfn-allocateclientfn-src-mq3-game-bot-population-ml-4832506"></a>
### allocateClientFn

```ml
allocateClientFn
```

Injected callback for allocate client; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_population.ml#L50)

<a id="field-field-mq3-game-bot-population-state-botenable-botenable-src-mq3-game-bot-population-ml-860624838"></a>
### botEnable

```ml
botEnable
```

Setting controlling bot creation and bot-AI processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_population.ml#L46)

<a id="field-field-mq3-game-bot-population-state-checktime-checktime-src-mq3-game-bot-population-ml-132082926"></a>
### checkTime

```ml
checkTime
```

Deadline for the next periodic condition check.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_population.ml#L38)

<a id="field-field-mq3-game-bot-population-state-clients-clients-src-mq3-game-bot-population-ml-326444450"></a>
### clients

```ml
clients
```

Client records indexed by client slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_population.ml#L36)

<a id="field-field-mq3-game-bot-population-state-clrunning-clrunning-src-mq3-game-bot-population-ml-2140786998"></a>
### clRunning

```ml
clRunning
```

Setting indicating whether a local client is running.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_population.ml#L48)

<a id="field-field-mq3-game-bot-population-state-connectclientfn-connectclientfn-src-mq3-game-bot-population-ml-547609122"></a>
### connectClientFn

```ml
connectClientFn
```

Injected callback for connect client; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_population.ml#L52)

<a id="field-field-mq3-game-bot-population-state-consolefn-consolefn-src-mq3-game-bot-population-ml-608354070"></a>
### consoleFn

```ml
consoleFn
```

Injected callback for console; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_population.ml#L56)

<a id="field-field-mq3-game-bot-population-state-cvarsetfn-cvarsetfn-src-mq3-game-bot-population-ml-1321379262"></a>
### cvarSetFn

```ml
cvarSetFn
```

Injected callback for console variable set; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_population.ml#L62)

<a id="field-field-mq3-game-bot-population-state-minimumplayers-minimumplayers-src-mq3-game-bot-population-ml-1085524198"></a>
### minimumPlayers

```ml
minimumPlayers
```

Target minimum player count maintained by bot population logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_population.ml#L40)

<a id="field-field-mq3-game-bot-population-state-minimumvm-minimumvm-src-mq3-game-bot-population-ml-504172402"></a>
### minimumVm

```ml
minimumVm
```

VM console-variable record controlling the minimum-player target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_population.ml#L42)

<a id="field-field-mq3-game-bot-population-state-printfn-printfn-src-mq3-game-bot-population-ml-1735405702"></a>
### printFn

```ml
printFn
```

Injected callback for print; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_population.ml#L60)

<a id="field-field-mq3-game-bot-population-state-registry-registry-src-mq3-game-bot-population-ml-650954208"></a>
### registry

```ml
registry
```

Registry of currently loaded preprocessor/token sources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_population.ml#L34)

<a id="field-field-mq3-game-bot-population-state-servercommandfn-servercommandfn-src-mq3-game-bot-population-ml-1873044106"></a>
### serverCommandFn

```ml
serverCommandFn
```

Injected callback for server command; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_population.ml#L58)

<a id="field-field-mq3-game-bot-population-state-setuserinfofn-setuserinfofn-src-mq3-game-bot-population-ml-618932442"></a>
### setUserinfoFn

```ml
setUserinfoFn
```

Injected callback for set user information; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_population.ml#L54)

<a id="field-field-mq3-game-bot-population-state-spskill-spskill-src-mq3-game-bot-population-ml-915670594"></a>
### spSkill

```ml
spSkill
```

Single-player bot skill setting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_population.ml#L44)
