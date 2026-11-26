# `mq3.game.server_commands.State`

[Home](README.md) · [Source file](File-src-mq3-game-server-commands-ml-2072466884.md)

<a id="struct-struct-mq3-game-server-commands-state-struct-state-src-mq3-game-server-commands-ml-751193343"></a>
## State

```ml
struct State
```

`State` record for server commands, containing `addBotFn`, `botListFn` and `abortPodiumFn`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L17)

## Members

<a id="field-field-mq3-game-server-commands-state-abortpodiumfn-abortpodiumfn-src-mq3-game-server-commands-ml-1274641516"></a>
### abortPodiumFn

```ml
abortPodiumFn
```

Injected callback for abort podium; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L23)

<a id="field-field-mq3-game-server-commands-state-addbotfn-addbotfn-src-mq3-game-server-commands-ml-1409833788"></a>
### addBotFn

```ml
addBotFn
```

Injected callback for add bot; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L19)

<a id="field-field-mq3-game-server-commands-state-botlistfn-botlistfn-src-mq3-game-server-commands-ml-1592888268"></a>
### botListFn

```ml
botListFn
```

Injected callback for bot list; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L21)
