# `src/mq3/client/cl_cgame_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cl_cgame_runtime`](Package-mq3-client-cl-cgame-runtime-409676285.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/cgame_time.ml` as `cgameTime` → [src/mq3/client/cgame_time.ml](File-src-mq3-client-cgame-time-ml-148018170.md)
- `mq3/client/cgame_usercmd.ml` as `cgameUsercmd` → [src/mq3/client/cgame_usercmd.ml](File-src-mq3-client-cgame-usercmd-ml-871099490.md)
- `mq3/client/cgame_vm.ml` as `cgameVm` → [src/mq3/client/cgame_vm.ml](File-src-mq3-client-cgame-vm-ml-1871886258.md)
- `mq3/client/command_ring.ml` as `commandRing` → [src/mq3/client/command_ring.ml](File-src-mq3-client-command-ring-ml-1850754325.md)
- `mq3/client/server_command_stream.ml` as `serverCommands` → [src/mq3/client/server_command_stream.ml](File-src-mq3-client-server-command-stream-ml-1493457615.md)
- `mq3/client/snapshot_command.ml` as `snapshotCommand` → [src/mq3/client/snapshot_command.ml](File-src-mq3-client-snapshot-command-ml-285373799.md)
- `mq3/client/snapshot_parse.ml` as `snapshotParse` → [src/mq3/client/snapshot_parse.ml](File-src-mq3-client-snapshot-parse-ml-455311349.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/game/playerstate.ml` as `playerstate` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)
- `mq3/vm/syscall_cgame.ml` as `cgameSyscall` → [src/mq3/vm/syscall_cgame.ml](File-src-mq3-vm-syscall-cgame-ml-1987612568.md)

## Declarations

<a id="function-function-mq3-client-cl-cgame-runtime-cl-addcgamecommand-function-cl-addcgamecommand-state-cmdname-src-mq3-client-cl-cgame-runtime-ml-1927518318"></a>
### CL_AddCgameCommand

```ml
function CL_AddCgameCommand(state, cmdName)
```

Calls `state.host.addCommandFn` from engine client client game runtime `CL_AddCgameCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.host.addCommandFn`, `state.host.context`. |
| `cmdName` | `dynamic` | — | Value used by `if state==void or cmdName==void then return fail("invalid command") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L241)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-adjusttimedelta-function-cl-adjusttimedelta-state-src-mq3-client-cl-cgame-runtime-ml-1071581913"></a>
### CL_AdjustTimeDelta

```ml
function CL_AdjustTimeDelta(state)
```

Calls `mq3.client.cgame_time.adjustTimeDelta` from engine client client game runtime `CL_AdjustTimeDelta`. The final path returns `cgameTime.adjustTimeDelta(state.timing)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.timing`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L352)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-cgameerror-function-cl-cgameerror-state-text-src-mq3-client-cl-cgame-runtime-ml-2106570848"></a>
### CL_CgameError

```ml
function CL_CgameError(state, text)
```

Calls `state.host.errorFn` from engine client client game runtime `CL_CgameError`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.host.errorFn`, `state.host.context`. |
| `text` | `dynamic` | — | Text consumed or emitted by `CL_CgameError` in the engine client client game runtime path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L245)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-cgamerendering-function-cl-cgamerendering-state-stereo-src-mq3-client-cl-cgame-runtime-ml-815099127"></a>
### CL_CGameRendering

```ml
function CL_CGameRendering(state, stereo)
```

Calls `mq3.client.cgame_vm.drawActiveFrame` from engine client client game runtime `CL_CGameRendering`. The final path returns `cgameVm.drawActiveFrame(state.vm,state.timing.serverTime,stereo,state.demoPlaying)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.vm`, `state.timing.serverTime`, `state.demoPlaying`. |
| `stereo` | `dynamic` | — | Value used by `return cgameVm.drawActiveFrame(state.vm,state.timing.serverTime,stereo,state.demoPlaying)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L346)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-cgamesystemcalls-function-cl-cgamesystemcalls-state-base-src-mq3-client-cl-cgame-runtime-ml-70939966"></a>
### CL_CgameSystemCalls

```ml
function CL_CgameSystemCalls(state, base)
```

Calls `mq3.vm.syscall_cgame.dispatch` from engine client client game runtime `CL_CgameSystemCalls`. The final path returns `cgameSyscall.dispatch(state.syscallHost,state.syscallVm,base)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscallHost`, `state.syscallVm`. |
| `base` | `dynamic` | — | Value used by `return cgameSyscall.dispatch(state.syscallHost,state.syscallVm,base)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L330)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-cm-loadmap-function-cl-cm-loadmap-state-mapname-src-mq3-client-cl-cgame-runtime-ml-872321206"></a>
### CL_CM_LoadMap

```ml
function CL_CM_LoadMap(state, mapname)
```

Updates `state.mapChecksum` during engine client client game runtime `CL_CM_LoadMap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client client game runtime record/storage; this routine assigns `state.mapChecksum`. |
| `mapname` | `dynamic` | — | Value used by `if state==void or mapname==void then return fail("invalid map") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L317)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-configstringmodified-function-cl-configstringmodified-state-index-value-src-mq3-client-cl-cgame-runtime-ml-1235629768"></a>
### CL_ConfigstringModified

```ml
function CL_ConfigstringModified(state, index, value)
```

Calls `mq3.client.cl_cgame_runtime.rebuildGameState` from engine client client game runtime `CL_ConfigstringModified`. The final path returns `rebuildGameState(state,index,value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared engine client client game runtime state passed to the helper calls in `CL_ConfigstringModified`. |
| `index` | `dynamic` | — | Value used by `return rebuildGameState(state,index,value)`. |
| `value` | `dynamic` | — | Value used by `return rebuildGameState(state,index,value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L273)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-firstsnapshot-function-cl-firstsnapshot-state-src-mq3-client-cl-cgame-runtime-ml-1726194637"></a>
### CL_FirstSnapshot

```ml
function CL_FirstSnapshot(state)
```

Calls `mq3.client.cgame_time.firstSnapshot` from engine client client game runtime `CL_FirstSnapshot`. The final path returns `cgameTime.firstSnapshot(state.timing)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.timing`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L355)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-gamecommand-function-cl-gamecommand-state-src-mq3-client-cl-cgame-runtime-ml-1403197937"></a>
### CL_GameCommand

```ml
function CL_GameCommand(state)
```

Calls `mq3.client.cgame_vm.consoleCommand` from engine client client game runtime `CL_GameCommand`. The final path returns `cgameVm.consoleCommand(state.vm)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.vm`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L342)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-getcurrentcmdnumber-function-cl-getcurrentcmdnumber-state-src-mq3-client-cl-cgame-runtime-ml-898207197"></a>
### CL_GetCurrentCmdNumber

```ml
function CL_GetCurrentCmdNumber(state)
```

Evaluates engine client client game runtime `CL_GetCurrentCmdNumber` and returns `fail("missing state")`, `state.cmdNumber` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.cmdNumber`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L181)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-getcurrentsnapshotnumber-function-cl-getcurrentsnapshotnumber-state-src-mq3-client-cl-cgame-runtime-ml-1545689277"></a>
### CL_GetCurrentSnapshotNumber

```ml
function CL_GetCurrentSnapshotNumber(state)
```

Calls `mq3.vm.syscall_cgame.SnapshotNumber` from engine client client game runtime `CL_GetCurrentSnapshotNumber`. The final path returns `cgameSyscall.SnapshotNumber(state.snapshots.snap.messageNum,state.snapshots.snap.serverTime)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.snapshots.snap.messageNum`, `state.snapshots.snap.serverTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L194)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-getgamestate-function-cl-getgamestate-state-src-mq3-client-cl-cgame-runtime-ml-858766159"></a>
### CL_GetGameState

```ml
function CL_GetGameState(state)
```

Calls `mq3.client.cl_cgame_runtime.copyData` from engine client client game runtime `CL_GetGameState`. The final path returns `copyData(state.gameState)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.gameState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L157)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-getglconfig-function-cl-getglconfig-state-src-mq3-client-cl-cgame-runtime-ml-848016633"></a>
### CL_GetGlconfig

```ml
function CL_GetGlconfig(state)
```

Calls `mq3.client.cl_cgame_runtime.copyData` from engine client client game runtime `CL_GetGlconfig`. The final path returns `copyData(state.glconfig)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.glconfig`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L160)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-getparseentitystate-function-cl-getparseentitystate-state-parseentitynumber-src-mq3-client-cl-cgame-runtime-ml-1701638340"></a>
### CL_GetParseEntityState

```ml
function CL_GetParseEntityState(state, parseEntityNumber)
```

Calls `mq3.client.cl_cgame_runtime.EntityResult` from engine client client game runtime `CL_GetParseEntityState`. The final path returns `EntityResult(true,parsed.parseEntities[parseEntityNumber&(MAX_PARSE_ENTITIES-1)])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.snapshots.entityState`. |
| `parseEntityNumber` | `dynamic` | — | Value used by `if parseEntityNumber>=parsed.parseEntitiesNum then return fail("future parse entity") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L186)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-getservercommand-function-cl-getservercommand-state-servercommandnumber-src-mq3-client-cl-cgame-runtime-ml-1698996452"></a>
### CL_GetServerCommand

```ml
function CL_GetServerCommand(state, serverCommandNumber)
```

Updates `state.lastExecutedServerCommand` during engine client client game runtime `CL_GetServerCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client client game runtime record/storage; this routine assigns `state.lastExecutedServerCommand`. |
| `serverCommandNumber` | `dynamic` | — | Value used by `result=serverCommands.get(state.commandStream,host,serverCommandNumber)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L307)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-getsnapshot-function-cl-getsnapshot-state-snapshotnumber-src-mq3-client-cl-cgame-runtime-ml-1928416"></a>
### CL_GetSnapshot

```ml
function CL_GetSnapshot(state, snapshotNumber)
```

Calls `mq3.vm.syscall_cgame.BytesResult`, `mq3.client.cl_cgame_runtime.snapshotBytes` from engine client client game runtime `CL_GetSnapshot`. The final path returns `cgameSyscall.BytesResult(true,snapshotBytes(state,value))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.snapshots.snap`, `state.snapshots.snapshots`, `state.snapshots.entityState.parseEntitiesNum`. |
| `snapshotNumber` | `dynamic` | — | Value used by `if snapshotNumber>current.messageNum then return fail("future snapshot") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L223)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-getusercmd-function-cl-getusercmd-state-cmdnumber-src-mq3-client-cl-cgame-runtime-ml-510619590"></a>
### CL_GetUserCmd

```ml
function CL_GetUserCmd(state, cmdNumber)
```

Calls `mq3.client.command_ring.get`, `mq3.vm.syscall_cgame.BytesResult`, `mq3.client.cl_cgame_runtime.usercmdBytes` from engine client client game runtime `CL_GetUserCmd`. The final path returns `cgameSyscall.BytesResult(true,usercmdBytes(value))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.commands`, `state.cmdNumber`. |
| `cmdNumber` | `dynamic` | — | Value used by `value=commandRing.get(state.commands,state.cmdNumber,cmdNumber)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L173)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-initcgame-function-cl-initcgame-state-src-mq3-client-cl-cgame-runtime-ml-473607661"></a>
### CL_InitCGame

```ml
function CL_InitCGame(state)
```

Calls `mq3.client.cgame_vm.initialize` from engine client client game runtime `CL_InitCGame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.vm`, `state.serverMessageSequence`, `state.lastExecutedServerCommand`, `state.clientNum` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L336)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-setcgametime-function-cl-setcgametime-state-src-mq3-client-cl-cgame-runtime-ml-517417929"></a>
### CL_SetCGameTime

```ml
function CL_SetCGameTime(state)
```

Calls `mq3.client.cgame_time.setCGameTime` from engine client client game runtime `CL_SetCGameTime`. The final path returns `cgameTime.setCGameTime(state.timing)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.timing`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L358)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-setusercmdvalue-function-cl-setusercmdvalue-state-usercmdvalue-sensitivityscale-src-mq3-client-cl-cgame-runtime-ml-2121790548"></a>
### CL_SetUserCmdValue

```ml
function CL_SetUserCmdValue(state, userCmdValue, sensitivityScale)
```

Calls `mq3.client.cgame_usercmd.set` from engine client client game runtime `CL_SetUserCmdValue`. The final path returns `cgameUsercmd.set(state.usercmd,userCmdValue,sensitivityScale)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.usercmd`. |
| `userCmdValue` | `dynamic` | — | Value used by `return cgameUsercmd.set(state.usercmd,userCmdValue,sensitivityScale)`. |
| `sensitivityScale` | `dynamic` | — | Value used by `return cgameUsercmd.set(state.usercmd,userCmdValue,sensitivityScale)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L237)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-shutdowncgame-function-cl-shutdowncgame-state-src-mq3-client-cl-cgame-runtime-ml-891191309"></a>
### CL_ShutdownCGame

```ml
function CL_ShutdownCGame(state)
```

Calls `mq3.client.cgame_vm.shutdown` from engine client client game runtime `CL_ShutdownCGame`. The final path returns `cgameVm.shutdown(state.vm)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.vm`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L323)

<a id="constant-constant-mq3-client-cl-cgame-runtime-cmd-backup-const-cmd-backup-64-src-mq3-client-cl-cgame-runtime-ml-1056211241"></a>
### CMD_BACKUP

```ml
const CMD_BACKUP = 64
```

Number of recent user commands retained in the command-history ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L21)

<a id="function-function-mq3-client-cl-cgame-runtime-copydata-function-copydata-value-src-mq3-client-cl-cgame-runtime-ml-638219329"></a>
### copyData

```ml
function copyData(value)
```

Calls `copyBytes` from engine client client game runtime `copyData`. The final path returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence whose length/content is inspected by `copyData`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L135)

<a id="function-function-mq3-client-cl-cgame-runtime-create-function-create-host-vmstate-timingstate-syscallhost-syscallvm-src-mq3-client-cl-cgame-runtime-ml-568123128"></a>
### create

```ml
function create(host, vmState, timingState, syscallHost, syscallVm)
```

Calls `mq3.client.cl_cgame_runtime.services`, `mq3.client.snapshot_command.create`, `mq3.client.server_command_stream.create` and additional helpers from engine client client game runtime `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | host record passed to the engine client client game runtime helper calls. |
| `vmState` | `dynamic` | — | Value used by `return State(host,defaultGameState(),bytes(cgameSyscall.GLCONFIG_SIZE,0),configstrings,commandRing.create(),0,snapshots,stream,cgameUsercmd.cr...`. |
| `timingState` | `dynamic` | — | Value used by `if timingState==void then timingState=cgameTime.create(cgameTime.services()) end if`. |
| `syscallHost` | `dynamic` | — | Value used by `return State(host,defaultGameState(),bytes(cgameSyscall.GLCONFIG_SIZE,0),configstrings,commandRing.create(),0,snapshots,stream,cgameUsercmd.cr...`. |
| `syscallVm` | `dynamic` | — | Value used by `return State(host,defaultGameState(),bytes(cgameSyscall.GLCONFIG_SIZE,0),configstrings,commandRing.create(),0,snapshots,stream,cgameUsercmd.cr...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L148)

<a id="constant-constant-mq3-client-cl-cgame-runtime-cs-systeminfo-const-cs-systeminfo-1-src-mq3-client-cl-cgame-runtime-ml-493024408"></a>
### CS_SYSTEMINFO

```ml
const CS_SYSTEMINFO = 1
```

Server configuration-string index for systeminfo; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L34)

<a id="function-function-mq3-client-cl-cgame-runtime-defaultgamestate-function-defaultgamestate-src-mq3-client-cl-cgame-runtime-ml-1337913882"></a>
### defaultGameState

```ml
function defaultGameState()
```

Calls `mq3.compat.numeric.writeU32` from engine client client game runtime `defaultGameState`. The final path returns `output`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L140)

<a id="function-function-mq3-client-cl-cgame-runtime-encodesnapshot-function-encodesnapshot-snapshots-value-output-src-mq3-client-cl-cgame-runtime-ml-2138111045"></a>
### encodeSnapshot

```ml
function encodeSnapshot(snapshots, value, output)
```

Calls `fillBytes`, `mq3.compat.numeric.writeU32`, `copyBytes` and additional helpers from engine client client game runtime `encodeSnapshot`. The final path returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshots` | `dynamic` | — | Record read through `snapshots.entityState.parseEntities`. |
| `value` | `dynamic` | — | Record read through `value.snapFlags`, `value.ping`, `value.serverTime`, `value.areaMask` and additional values. |
| `output` | `dynamic` | — | Sequence whose length/content is inspected by `encodeSnapshot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L207)

- [mq3.client.cl_cgame_runtime.EntityResult](Type-mq3-client-cl-cgame-runtime-entityresult-75123767.md) — struct
<a id="function-function-mq3-client-cl-cgame-runtime-fail-function-fail-message-src-mq3-client-cl-cgame-runtime-ml-683619787"></a>
### fail

```ml
function fail(message)
```

Creates the engine client client game runtime error `7760` with diagnostic text `"cl_cgame: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"cl_cgame: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L130)

<a id="function-function-mq3-client-cl-cgame-runtime-floatasint-function-floatasint-value-src-mq3-client-cl-cgame-runtime-ml-773324149"></a>
### FloatAsInt

```ml
function FloatAsInt(value)
```

Adapts `mq3.compat.numeric.i32` to engine client client game runtime `FloatAsInt`, returning its result for `n.floatBits(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `mq3.compat.numeric.i32`; passed as `n.floatBits(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L326)

<a id="constant-constant-mq3-client-cl-cgame-runtime-max-configstrings-const-max-configstrings-1024-src-mq3-client-cl-cgame-runtime-ml-2133110194"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```

Capacity limit for the configstrings collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L30)

<a id="constant-constant-mq3-client-cl-cgame-runtime-max-entities-in-snapshot-const-max-entities-in-snapshot-256-src-mq3-client-cl-cgame-runtime-ml-722545178"></a>
### MAX_ENTITIES_IN_SNAPSHOT

```ml
const MAX_ENTITIES_IN_SNAPSHOT = 256
```

Capacity limit for the entities in snapshot collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L28)

<a id="constant-constant-mq3-client-cl-cgame-runtime-max-gamestate-chars-const-max-gamestate-chars-16000-src-mq3-client-cl-cgame-runtime-ml-1839155974"></a>
### MAX_GAMESTATE_CHARS

```ml
const MAX_GAMESTATE_CHARS = 16000
```

Capacity of the packed server configuration-string character storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L32)

<a id="constant-constant-mq3-client-cl-cgame-runtime-max-parse-entities-const-max-parse-entities-2048-src-mq3-client-cl-cgame-runtime-ml-1754286235"></a>
### MAX_PARSE_ENTITIES

```ml
const MAX_PARSE_ENTITIES = 2048
```

Capacity limit for the parse entities collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L25)

<a id="constant-constant-mq3-client-cl-cgame-runtime-packet-backup-const-packet-backup-32-src-mq3-client-cl-cgame-runtime-ml-1308431776"></a>
### PACKET_BACKUP

```ml
const PACKET_BACKUP = 32
```

Number of packet records retained in the client packet-history ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L23)

<a id="function-function-mq3-client-cl-cgame-runtime-packgamestate-function-packgamestate-state-src-mq3-client-cl-cgame-runtime-ml-1397593309"></a>
### packGameState

```ml
function packGameState(state)
```

Updates `state.gameState` during engine client client game runtime `packGameState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client client game runtime record/storage; this routine assigns `state.gameState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L252)

<a id="function-function-mq3-client-cl-cgame-runtime-rebuildgamestate-function-rebuildgamestate-state-index-value-src-mq3-client-cl-cgame-runtime-ml-58510184"></a>
### rebuildGameState

```ml
function rebuildGameState(state, index, value)
```

Updates `state.configstrings[index]` during engine client client game runtime `rebuildGameState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client client game runtime record/storage; this routine assigns `state.configstrings[index]`. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=MAX_CONFIGSTRINGS`, `if state.configstrings[index]==value` and additional values before the calculation continues. |
| `value` | `dynamic` | — | Value tested by `if state.configstrings[index]==value` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L264)

<a id="function-function-mq3-client-cl-cgame-runtime-services-function-services-src-mq3-client-cl-cgame-runtime-ml-695559202"></a>
### services

```ml
function services()
```

Creates a `mq3.client.cl_cgame_runtime.Services` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L132)

- [mq3.client.cl_cgame_runtime.Services](Type-mq3-client-cl-cgame-runtime-services-364554929.md) — struct
<a id="function-function-mq3-client-cl-cgame-runtime-snapshotbytes-function-snapshotbytes-state-value-src-mq3-client-cl-cgame-runtime-ml-59239514"></a>
### snapshotBytes

```ml
function snapshotBytes(state, value)
```

Adapts `mq3.client.cl_cgame_runtime.encodeSnapshot` to engine client client game runtime `snapshotBytes`, returning its result for `state.snapshots, value, bytes(cgameSyscall.SNAPSHOT_SIZE,0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.snapshots`. |
| `value` | `dynamic` | — | Argument 2 of `mq3.client.cl_cgame_runtime.encodeSnapshot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L217)

- [mq3.client.cl_cgame_runtime.State](Type-mq3-client-cl-cgame-runtime-state-717532426.md) — struct
<a id="function-function-mq3-client-cl-cgame-runtime-streamclearcommands-function-streamclearcommands-state-src-mq3-client-cl-cgame-runtime-ml-888827079"></a>
### streamClearCommands

```ml
function streamClearCommands(state)
```

Adapts `mq3.client.command_ring.clear` to engine client client game runtime `streamClearCommands`, returning its result for `state.commands`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.commands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L284)

<a id="function-function-mq3-client-cl-cgame-runtime-streamclearnotify-function-streamclearnotify-state-src-mq3-client-cl-cgame-runtime-ml-1925827725"></a>
### streamClearNotify

```ml
function streamClearNotify(state)
```

Calls `state.host.clearNotifyFn` from engine client client game runtime `streamClearNotify`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.host.clearNotifyFn`, `state.host.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L287)

<a id="function-function-mq3-client-cl-cgame-runtime-streamcloseconsole-function-streamcloseconsole-state-src-mq3-client-cl-cgame-runtime-ml-972541553"></a>
### streamCloseConsole

```ml
function streamCloseConsole(state)
```

Calls `state.host.closeConsoleFn` from engine client client game runtime `streamCloseConsole`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.host.closeConsoleFn`, `state.host.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L293)

<a id="function-function-mq3-client-cl-cgame-runtime-streamconfig-function-streamconfig-state-index-value-src-mq3-client-cl-cgame-runtime-ml-2112751240"></a>
### streamConfig

```ml
function streamConfig(state, index, value)
```

Calls `mq3.client.cl_cgame_runtime.packGameState`, `state.host.systemInfoFn` from engine client client game runtime `streamConfig`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.host.systemInfoFn`, `state.host.context`. |
| `index` | `dynamic` | — | Value tested by `if index==CS_SYSTEMINFO and state.host.systemInfoFn!=void` before the calculation continues. |
| `value` | `dynamic` | — | Accepted for compatibility with `streamConfig`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L278)

<a id="function-function-mq3-client-cl-cgame-runtime-streamqueueconsole-function-streamqueueconsole-state-text-src-mq3-client-cl-cgame-runtime-ml-22057198"></a>
### streamQueueConsole

```ml
function streamQueueConsole(state, text)
```

Calls `state.host.queueConsoleFn` from engine client client game runtime `streamQueueConsole`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.host.queueConsoleFn`, `state.host.context`. |
| `text` | `dynamic` | — | Text consumed or emitted by `streamQueueConsole` in the engine client client game runtime path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L300)

<a id="function-function-mq3-client-cl-cgame-runtime-syscallcommandnumber-function-syscallcommandnumber-state-src-mq3-client-cl-cgame-runtime-ml-832738517"></a>
### syscallCommandNumber

```ml
function syscallCommandNumber(state)
```

Adapts `mq3.client.cl_cgame_runtime.CL_GetCurrentCmdNumber` to engine client client game runtime `syscallCommandNumber`, returning its result for `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_cgame_runtime.CL_GetCurrentCmdNumber`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L379)

<a id="function-function-mq3-client-cl-cgame-runtime-syscallgamestate-function-syscallgamestate-state-src-mq3-client-cl-cgame-runtime-ml-421962221"></a>
### syscallGameState

```ml
function syscallGameState(state)
```

Adapts `mq3.client.cl_cgame_runtime.CL_GetGameState` to engine client client game runtime `syscallGameState`, returning its result for `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_cgame_runtime.CL_GetGameState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L362)

<a id="function-function-mq3-client-cl-cgame-runtime-syscallglconfig-function-syscallglconfig-state-src-mq3-client-cl-cgame-runtime-ml-409763469"></a>
### syscallGlconfig

```ml
function syscallGlconfig(state)
```

Adapts `mq3.client.cl_cgame_runtime.CL_GetGlconfig` to engine client client game runtime `syscallGlconfig`, returning its result for `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_cgame_runtime.CL_GetGlconfig`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L365)

<a id="function-function-mq3-client-cl-cgame-runtime-syscallservercommand-function-syscallservercommand-state-number-src-mq3-client-cl-cgame-runtime-ml-572492448"></a>
### syscallServerCommand

```ml
function syscallServerCommand(state, number)
```

Adapts `mq3.client.cl_cgame_runtime.CL_GetServerCommand` to engine client client game runtime `syscallServerCommand`, returning its result for `state, number`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_cgame_runtime.CL_GetServerCommand`. |
| `number` | `dynamic` | — | Argument 2 of `mq3.client.cl_cgame_runtime.CL_GetServerCommand`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L376)

<a id="function-function-mq3-client-cl-cgame-runtime-syscallsetusercmd-function-syscallsetusercmd-state-value-sensitivity-src-mq3-client-cl-cgame-runtime-ml-101994233"></a>
### syscallSetUserCmd

```ml
function syscallSetUserCmd(state, value, sensitivity)
```

Adapts `mq3.client.cl_cgame_runtime.CL_SetUserCmdValue` to engine client client game runtime `syscallSetUserCmd`, returning its result for `state, value, sensitivity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_cgame_runtime.CL_SetUserCmdValue`. |
| `value` | `dynamic` | — | Argument 2 of `mq3.client.cl_cgame_runtime.CL_SetUserCmdValue`. |
| `sensitivity` | `dynamic` | — | Argument 3 of `mq3.client.cl_cgame_runtime.CL_SetUserCmdValue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L388)

<a id="function-function-mq3-client-cl-cgame-runtime-syscallsnapshot-function-syscallsnapshot-state-number-src-mq3-client-cl-cgame-runtime-ml-1561507286"></a>
### syscallSnapshot

```ml
function syscallSnapshot(state, number)
```

Adapts `mq3.client.cl_cgame_runtime.CL_GetSnapshot` to engine client client game runtime `syscallSnapshot`, returning its result for `state, number`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_cgame_runtime.CL_GetSnapshot`. |
| `number` | `dynamic` | — | Argument 2 of `mq3.client.cl_cgame_runtime.CL_GetSnapshot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L372)

<a id="function-function-mq3-client-cl-cgame-runtime-syscallsnapshotnumber-function-syscallsnapshotnumber-state-src-mq3-client-cl-cgame-runtime-ml-899102133"></a>
### syscallSnapshotNumber

```ml
function syscallSnapshotNumber(state)
```

Adapts `mq3.client.cl_cgame_runtime.CL_GetCurrentSnapshotNumber` to engine client client game runtime `syscallSnapshotNumber`, returning its result for `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_cgame_runtime.CL_GetCurrentSnapshotNumber`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L368)

<a id="function-function-mq3-client-cl-cgame-runtime-syscallusercmd-function-syscallusercmd-state-number-src-mq3-client-cl-cgame-runtime-ml-1416995660"></a>
### syscallUserCmd

```ml
function syscallUserCmd(state, number)
```

Adapts `mq3.client.cl_cgame_runtime.CL_GetUserCmd` to engine client client game runtime `syscallUserCmd`, returning its result for `state, number`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_cgame_runtime.CL_GetUserCmd`. |
| `number` | `dynamic` | — | Argument 2 of `mq3.client.cl_cgame_runtime.CL_GetUserCmd`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L383)

<a id="function-function-mq3-client-cl-cgame-runtime-usercmdbytes-function-usercmdbytes-command-src-mq3-client-cl-cgame-runtime-ml-874934473"></a>
### usercmdBytes

```ml
function usercmdBytes(command)
```

Calls `mq3.compat.numeric.writeU32` from engine client client game runtime `usercmdBytes`. The final path returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `command` | `dynamic` | — | Record read through `command.serverTime`, `command.angles`, `command.buttons`, `command.weapon` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L164)

<a id="function-function-mq3-client-cl-cgame-runtime-wiresyscalls-function-wiresyscalls-state-host-machine-src-mq3-client-cl-cgame-runtime-ml-573712430"></a>
### wireSyscalls

```ml
function wireSyscalls(state, host, machine)
```

Updates `host.context`, `host.getGameStateFn`, `host.getGlconfigFn`, `host.getCurrentSnapshotNumberFn` and additional values during engine client client game runtime `wireSyscalls`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client client game runtime record/storage; this routine assigns `state.syscallHost`, `state.syscallVm`. |
| `host` | `dynamic` | — | Mutable engine client client game runtime record/storage; this routine assigns `host.context`, `host.getGameStateFn`, `host.getGlconfigFn`, `host.getCurrentSnapshotNumberFn` and additional values. |
| `machine` | `dynamic` | — | Value assigned to `state.syscallVm`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L393)

<a id="function-function-mq3-client-cl-cgame-runtime-writewords-function-writewords-output-offset-words-src-mq3-client-cl-cgame-runtime-ml-1533018715"></a>
### writeWords

```ml
function writeWords(output, offset, words)
```

Calls `mq3.compat.numeric.writeU32` from engine client client game runtime `writeWords`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Value used by `for index=0 to len(words)-1 n.writeU32(output,offset+index*4,words[index]) end for`. |
| `offset` | `dynamic` | — | Value used by `for index=0 to len(words)-1 n.writeU32(output,offset+index*4,words[index]) end for`. |
| `words` | `dynamic` | — | Sequence read at `words[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_cgame_runtime.ml#L202)
