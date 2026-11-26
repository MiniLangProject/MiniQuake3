# `mq3.server.game_vm.State`

[Home](README.md) · [Source file](File-src-mq3-server-game-vm-ml-2099996303.md)

<a id="struct-struct-mq3-server-game-vm-state-struct-state-src-mq3-server-game-vm-ml-1373555855"></a>
## State

```ml
struct State
```

State record for server.game_vm, containing `host`, `slot`, `active`, `entityParsePoint`, `botEnable`, `callCount`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L57)

## Members

<a id="field-field-mq3-server-game-vm-state-active-active-src-mq3-server-game-vm-ml-2070848778"></a>
### active

```ml
active
```

True while this entry participates in the active runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L63)

<a id="field-field-mq3-server-game-vm-state-botenable-botenable-src-mq3-server-game-vm-ml-2094399770"></a>
### botEnable

```ml
botEnable
```

True when server-side bot processing is enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L67)

<a id="field-field-mq3-server-game-vm-state-callcount-callcount-src-mq3-server-game-vm-ml-1629082150"></a>
### callCount

```ml
callCount
```

Number of call recorded by this state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L69)

<a id="field-field-mq3-server-game-vm-state-entityparsepoint-entityparsepoint-src-mq3-server-game-vm-ml-389789626"></a>
### entityParsePoint

```ml
entityParsePoint
```

Current position in the map entity text supplied to the game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L65)

<a id="field-field-mq3-server-game-vm-state-host-host-src-mq3-server-game-vm-ml-751696714"></a>
### host

```ml
host
```

Host callback interface supplying external services to this runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L59)

<a id="field-field-mq3-server-game-vm-state-lastargs-lastargs-src-mq3-server-game-vm-ml-533225096"></a>
### lastArgs

```ml
lastArgs
```

Argument values supplied to the most recently invoked game export.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L73)

<a id="field-field-mq3-server-game-vm-state-lastexport-lastexport-src-mq3-server-game-vm-ml-1257876746"></a>
### lastExport

```ml
lastExport
```

Game-VM export identifier invoked most recently.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L71)

<a id="field-field-mq3-server-game-vm-state-slot-slot-src-mq3-server-game-vm-ml-1856394006"></a>
### slot

```ml
slot
```

Index identifying this entry in its owning slot table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_vm.ml#L61)
