# `mq3.game.bot_clients.State`

[Home](README.md) · [Source file](File-src-mq3-game-bot-clients-ml-237353140.md)

<a id="struct-struct-mq3-game-bot-clients-state-struct-state-src-mq3-game-bot-clients-ml-397931799"></a>
## State

```ml
struct State
```

`State` record for bot clients, containing `queue`, `minimumPlayersFn`, `clientBeginFn`, `userinfoFn` and `introSoundFn` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_clients.ml#L35)

## Members

<a id="field-field-mq3-game-bot-clients-state-clientbeginfn-clientbeginfn-src-mq3-game-bot-clients-ml-963102760"></a>
### clientBeginFn

```ml
clientBeginFn
```

Injected callback for client begin; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_clients.ml#L41)

<a id="field-field-mq3-game-bot-clients-state-dropclientfn-dropclientfn-src-mq3-game-bot-clients-ml-1526805600"></a>
### dropClientFn

```ml
dropClientFn
```

Injected callback for drop client; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_clients.ml#L49)

<a id="field-field-mq3-game-bot-clients-state-introsoundfn-introsoundfn-src-mq3-game-bot-clients-ml-801104450"></a>
### introSoundFn

```ml
introSoundFn
```

Injected callback for intro sound; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_clients.ml#L45)

<a id="field-field-mq3-game-bot-clients-state-minimumplayersfn-minimumplayersfn-src-mq3-game-bot-clients-ml-23649964"></a>
### minimumPlayersFn

```ml
minimumPlayersFn
```

Injected callback for minimum players; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_clients.ml#L39)

<a id="field-field-mq3-game-bot-clients-state-printfn-printfn-src-mq3-game-bot-clients-ml-2034652340"></a>
### printFn

```ml
printFn
```

Injected callback for print; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_clients.ml#L47)

<a id="field-field-mq3-game-bot-clients-state-queue-queue-src-mq3-game-bot-clients-ml-317464824"></a>
### queue

```ml
queue
```

Pending bot/client requests waiting to be processed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_clients.ml#L37)

<a id="field-field-mq3-game-bot-clients-state-setupclientfn-setupclientfn-src-mq3-game-bot-clients-ml-2037381100"></a>
### setupClientFn

```ml
setupClientFn
```

Injected callback for setup client; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_clients.ml#L51)

<a id="field-field-mq3-game-bot-clients-state-userinfofn-userinfofn-src-mq3-game-bot-clients-ml-488418202"></a>
### userinfoFn

```ml
userinfoFn
```

Injected callback for user information; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_clients.ml#L43)
