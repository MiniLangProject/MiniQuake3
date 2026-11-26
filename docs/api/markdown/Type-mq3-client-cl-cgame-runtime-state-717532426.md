# `mq3.client.cl_cgame_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-client-cl-cgame-runtime-ml-51368453.md)

<a id="struct-struct-mq3-client-cl-cgame-runtime-state-struct-state-src-mq3-client-cl-cgame-runtime-ml-351304939"></a>
## State

```ml
struct State
```

Stores engine client client game runtime state, including `host`, `gameState`, `glconfig`, `configstrings`, `commands`, `cmdNumber` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L75)

## Members

<a id="field-field-mq3-client-cl-cgame-runtime-state-clientnum-clientnum-src-mq3-client-cl-cgame-runtime-ml-1769537702"></a>
### clientNum

```ml
clientNum
```

Local client slot passed to the client-game VM initialization call.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L114)

<a id="field-field-mq3-client-cl-cgame-runtime-state-cmdnumber-cmdnumber-src-mq3-client-cl-cgame-runtime-ml-1112652582"></a>
### cmdNumber

```ml
cmdNumber
```

Monotonically advancing user-command sequence number for the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L88)

<a id="field-field-mq3-client-cl-cgame-runtime-state-commands-commands-src-mq3-client-cl-cgame-runtime-ml-1251565810"></a>
### commands

```ml
commands
```

When constructing this record, `create` supplies `commandRing.create()` for this member. Used by `CL_GetUserCmd` and `streamClearCommands` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L86)

<a id="field-field-mq3-client-cl-cgame-runtime-state-commandstream-commandstream-src-mq3-client-cl-cgame-runtime-ml-1796031110"></a>
### commandStream

```ml
commandStream
```

When constructing this record, `create` supplies `stream` for this member. Used by `CL_GetServerCommand` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L93)

<a id="field-field-mq3-client-cl-cgame-runtime-state-configstrings-configstrings-src-mq3-client-cl-cgame-runtime-ml-1331143202"></a>
### configstrings

```ml
configstrings
```

Server configuration strings indexed by the native protocol's configuration-string identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L83)

<a id="field-field-mq3-client-cl-cgame-runtime-state-connectedtopureserver-connectedtopureserver-src-mq3-client-cl-cgame-runtime-ml-1264782326"></a>
### connectedToPureServer

```ml
connectedToPureServer
```

When constructing this record, `create` supplies `0` for this member. Used by `CL_InitCGame` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L117)

<a id="field-field-mq3-client-cl-cgame-runtime-state-demoplaying-demoplaying-src-mq3-client-cl-cgame-runtime-ml-345817230"></a>
### demoPlaying

```ml
demoPlaying
```

True while the client receives its game data from a recorded demo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L122)

<a id="field-field-mq3-client-cl-cgame-runtime-state-gamestate-gamestate-src-mq3-client-cl-cgame-runtime-ml-295096102"></a>
### gameState

```ml
gameState
```

Server configuration strings and associated game-state storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L79)

<a id="field-field-mq3-client-cl-cgame-runtime-state-glconfig-glconfig-src-mq3-client-cl-cgame-runtime-ml-36655016"></a>
### glconfig

```ml
glconfig
```

Renderer configuration reported by the engine for the current display.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L81)

<a id="field-field-mq3-client-cl-cgame-runtime-state-host-host-src-mq3-client-cl-cgame-runtime-ml-471520122"></a>
### host

```ml
host
```

Host-adapter callbacks and context used to execute the module's engine operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L77)

<a id="field-field-mq3-client-cl-cgame-runtime-state-lastexecutedservercommand-lastexecutedservercommand-src-mq3-client-cl-cgame-runtime-ml-1913841482"></a>
### lastExecutedServerCommand

```ml
lastExecutedServerCommand
```

Highest server-command sequence already retrieved or executed by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L112)

<a id="field-field-mq3-client-cl-cgame-runtime-state-mapchecksum-mapchecksum-src-mq3-client-cl-cgame-runtime-ml-1443483730"></a>
### mapChecksum

```ml
mapChecksum
```

When constructing this record, `create` supplies `0` for this member. Used by `CL_CM_LoadMap` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L125)

<a id="field-field-mq3-client-cl-cgame-runtime-state-servermessagesequence-servermessagesequence-src-mq3-client-cl-cgame-runtime-ml-1680781750"></a>
### serverMessageSequence

```ml
serverMessageSequence
```

Highest server network-message sequence observed by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L110)

<a id="field-field-mq3-client-cl-cgame-runtime-state-snapshots-snapshots-src-mq3-client-cl-cgame-runtime-ml-1496003010"></a>
### snapshots

```ml
snapshots
```

Snapshot history indexed by sequence number for interpolation and delta decoding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L90)

<a id="field-field-mq3-client-cl-cgame-runtime-state-syscallhost-syscallhost-src-mq3-client-cl-cgame-runtime-ml-1355637342"></a>
### syscallHost

```ml
syscallHost
```

When constructing this record, `create` supplies `syscallHost` for this member. Used by `CL_CgameSystemCalls` and `wireSyscalls` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L105)

<a id="field-field-mq3-client-cl-cgame-runtime-state-syscallvm-syscallvm-src-mq3-client-cl-cgame-runtime-ml-299507122"></a>
### syscallVm

```ml
syscallVm
```

When constructing this record, `create` supplies `syscallVm` for this member. Used by `CL_CgameSystemCalls` and `wireSyscalls` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L108)

<a id="field-field-mq3-client-cl-cgame-runtime-state-timing-timing-src-mq3-client-cl-cgame-runtime-ml-804082794"></a>
### timing

```ml
timing
```

When constructing this record, `create` supplies `timingState` for this member. Used by `CL_CGameRendering` and `CL_AdjustTimeDelta` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L102)

<a id="field-field-mq3-client-cl-cgame-runtime-state-usercmd-usercmd-src-mq3-client-cl-cgame-runtime-ml-884672078"></a>
### usercmd

```ml
usercmd
```

When constructing this record, `create` supplies `cgameUsercmd.create()` for this member. Used by `CL_SetUserCmdValue` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L96)

<a id="field-field-mq3-client-cl-cgame-runtime-state-vm-vm-src-mq3-client-cl-cgame-runtime-ml-786438232"></a>
### vm

```ml
vm
```

When constructing this record, `create` supplies `vmState` for this member. Used by `CL_ShutdownCGame` and `CL_InitCGame` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L99)

<a id="field-field-mq3-client-cl-cgame-runtime-state-vmcgame-vmcgame-src-mq3-client-cl-cgame-runtime-ml-1131572518"></a>
### vmCgame

```ml
vmCgame
```

When constructing this record, `create` supplies `0` for this member. Used by `CL_InitCGame` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L120)
