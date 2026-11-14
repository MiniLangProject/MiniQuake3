# `src/mq3/client/cl_cgame_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cl_cgame_runtime`](Package-mq3-client-cl-cgame-runtime-409676285.md)

Reachable from entry: **no**

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cmdName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L125)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-adjusttimedelta-function-cl-adjusttimedelta-state-src-mq3-client-cl-cgame-runtime-ml-1071581913"></a>
### CL_AdjustTimeDelta

```ml
function CL_AdjustTimeDelta(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L188)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-cgameerror-function-cl-cgameerror-state-text-src-mq3-client-cl-cgame-runtime-ml-2106570848"></a>
### CL_CgameError

```ml
function CL_CgameError(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L126)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-cgamerendering-function-cl-cgamerendering-state-stereo-src-mq3-client-cl-cgame-runtime-ml-815099127"></a>
### CL_CGameRendering

```ml
function CL_CGameRendering(state, stereo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `stereo` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L184)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-cgamesystemcalls-function-cl-cgamesystemcalls-state-base-src-mq3-client-cl-cgame-runtime-ml-70939966"></a>
### CL_CgameSystemCalls

```ml
function CL_CgameSystemCalls(state, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L175)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-cm-loadmap-function-cl-cm-loadmap-state-mapname-src-mq3-client-cl-cgame-runtime-ml-872321206"></a>
### CL_CM_LoadMap

```ml
function CL_CM_LoadMap(state, mapname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `mapname` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L169)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-configstringmodified-function-cl-configstringmodified-state-index-value-src-mq3-client-cl-cgame-runtime-ml-1235629768"></a>
### CL_ConfigstringModified

```ml
function CL_ConfigstringModified(state, index, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L144)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-firstsnapshot-function-cl-firstsnapshot-state-src-mq3-client-cl-cgame-runtime-ml-1726194637"></a>
### CL_FirstSnapshot

```ml
function CL_FirstSnapshot(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L189)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-gamecommand-function-cl-gamecommand-state-src-mq3-client-cl-cgame-runtime-ml-1403197937"></a>
### CL_GameCommand

```ml
function CL_GameCommand(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L183)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-getcurrentcmdnumber-function-cl-getcurrentcmdnumber-state-src-mq3-client-cl-cgame-runtime-ml-898207197"></a>
### CL_GetCurrentCmdNumber

```ml
function CL_GetCurrentCmdNumber(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L94)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-getcurrentsnapshotnumber-function-cl-getcurrentsnapshotnumber-state-src-mq3-client-cl-cgame-runtime-ml-1545689277"></a>
### CL_GetCurrentSnapshotNumber

```ml
function CL_GetCurrentSnapshotNumber(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L102)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-getgamestate-function-cl-getgamestate-state-src-mq3-client-cl-cgame-runtime-ml-858766159"></a>
### CL_GetGameState

```ml
function CL_GetGameState(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L79)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-getglconfig-function-cl-getglconfig-state-src-mq3-client-cl-cgame-runtime-ml-848016633"></a>
### CL_GetGlconfig

```ml
function CL_GetGlconfig(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L80)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-getparseentitystate-function-cl-getparseentitystate-state-parseentitynumber-src-mq3-client-cl-cgame-runtime-ml-1701638340"></a>
### CL_GetParseEntityState

```ml
function CL_GetParseEntityState(state, parseEntityNumber)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `parseEntityNumber` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L96)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-getservercommand-function-cl-getservercommand-state-servercommandnumber-src-mq3-client-cl-cgame-runtime-ml-1698996452"></a>
### CL_GetServerCommand

```ml
function CL_GetServerCommand(state, serverCommandNumber)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverCommandNumber` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L162)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-getsnapshot-function-cl-getsnapshot-state-snapshotnumber-src-mq3-client-cl-cgame-runtime-ml-1928416"></a>
### CL_GetSnapshot

```ml
function CL_GetSnapshot(state, snapshotNumber)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `snapshotNumber` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L114)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-getusercmd-function-cl-getusercmd-state-cmdnumber-src-mq3-client-cl-cgame-runtime-ml-510619590"></a>
### CL_GetUserCmd

```ml
function CL_GetUserCmd(state, cmdNumber)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cmdNumber` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L88)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-initcgame-function-cl-initcgame-state-src-mq3-client-cl-cgame-runtime-ml-473607661"></a>
### CL_InitCGame

```ml
function CL_InitCGame(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L179)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-setcgametime-function-cl-setcgametime-state-src-mq3-client-cl-cgame-runtime-ml-517417929"></a>
### CL_SetCGameTime

```ml
function CL_SetCGameTime(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L190)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-setusercmdvalue-function-cl-setusercmdvalue-state-usercmdvalue-sensitivityscale-src-mq3-client-cl-cgame-runtime-ml-2121790548"></a>
### CL_SetUserCmdValue

```ml
function CL_SetUserCmdValue(state, userCmdValue, sensitivityScale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `userCmdValue` | `dynamic` | — |  |
| `sensitivityScale` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L124)

<a id="function-function-mq3-client-cl-cgame-runtime-cl-shutdowncgame-function-cl-shutdowncgame-state-src-mq3-client-cl-cgame-runtime-ml-891191309"></a>
### CL_ShutdownCGame

```ml
function CL_ShutdownCGame(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L173)

<a id="constant-constant-mq3-client-cl-cgame-runtime-cmd-backup-const-cmd-backup-64-src-mq3-client-cl-cgame-runtime-ml-1056211241"></a>
### CMD_BACKUP

```ml
const CMD_BACKUP = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L20)

<a id="function-function-mq3-client-cl-cgame-runtime-copydata-function-copydata-value-src-mq3-client-cl-cgame-runtime-ml-638219329"></a>
### copyData

```ml
function copyData(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L66)

<a id="function-function-mq3-client-cl-cgame-runtime-create-function-create-host-vmstate-timingstate-syscallhost-syscallvm-src-mq3-client-cl-cgame-runtime-ml-568123128"></a>
### create

```ml
function create(host, vmState, timingState, syscallHost, syscallVm)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `vmState` | `dynamic` | — |  |
| `timingState` | `dynamic` | — |  |
| `syscallHost` | `dynamic` | — |  |
| `syscallVm` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L72)

<a id="constant-constant-mq3-client-cl-cgame-runtime-cs-systeminfo-const-cs-systeminfo-1-src-mq3-client-cl-cgame-runtime-ml-493024408"></a>
### CS_SYSTEMINFO

```ml
const CS_SYSTEMINFO = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L26)

<a id="function-function-mq3-client-cl-cgame-runtime-defaultgamestate-function-defaultgamestate-src-mq3-client-cl-cgame-runtime-ml-1337913882"></a>
### defaultGameState

```ml
function defaultGameState()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L70)

- [mq3.client.cl_cgame_runtime.EntityResult](Type-mq3-client-cl-cgame-runtime-entityresult-75123767.md) — struct
<a id="function-function-mq3-client-cl-cgame-runtime-fail-function-fail-message-src-mq3-client-cl-cgame-runtime-ml-683619787"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L64)

<a id="function-function-mq3-client-cl-cgame-runtime-floatasint-function-floatasint-value-src-mq3-client-cl-cgame-runtime-ml-773324149"></a>
### FloatAsInt

```ml
function FloatAsInt(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L174)

<a id="constant-constant-mq3-client-cl-cgame-runtime-max-configstrings-const-max-configstrings-1024-src-mq3-client-cl-cgame-runtime-ml-2133110194"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L24)

<a id="constant-constant-mq3-client-cl-cgame-runtime-max-entities-in-snapshot-const-max-entities-in-snapshot-256-src-mq3-client-cl-cgame-runtime-ml-722545178"></a>
### MAX_ENTITIES_IN_SNAPSHOT

```ml
const MAX_ENTITIES_IN_SNAPSHOT = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L23)

<a id="constant-constant-mq3-client-cl-cgame-runtime-max-gamestate-chars-const-max-gamestate-chars-16000-src-mq3-client-cl-cgame-runtime-ml-1839155974"></a>
### MAX_GAMESTATE_CHARS

```ml
const MAX_GAMESTATE_CHARS = 16000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L25)

<a id="constant-constant-mq3-client-cl-cgame-runtime-max-parse-entities-const-max-parse-entities-2048-src-mq3-client-cl-cgame-runtime-ml-1754286235"></a>
### MAX_PARSE_ENTITIES

```ml
const MAX_PARSE_ENTITIES = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L22)

<a id="constant-constant-mq3-client-cl-cgame-runtime-packet-backup-const-packet-backup-32-src-mq3-client-cl-cgame-runtime-ml-1308431776"></a>
### PACKET_BACKUP

```ml
const PACKET_BACKUP = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L21)

<a id="function-function-mq3-client-cl-cgame-runtime-packgamestate-function-packgamestate-state-src-mq3-client-cl-cgame-runtime-ml-1397593309"></a>
### packGameState

```ml
function packGameState(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L131)

<a id="function-function-mq3-client-cl-cgame-runtime-rebuildgamestate-function-rebuildgamestate-state-index-value-src-mq3-client-cl-cgame-runtime-ml-58510184"></a>
### rebuildGameState

```ml
function rebuildGameState(state, index, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L139)

<a id="function-function-mq3-client-cl-cgame-runtime-services-function-services-src-mq3-client-cl-cgame-runtime-ml-695559202"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L65)

- [mq3.client.cl_cgame_runtime.Services](Type-mq3-client-cl-cgame-runtime-services-364554929.md) — struct
<a id="function-function-mq3-client-cl-cgame-runtime-snapshotbytes-function-snapshotbytes-state-value-src-mq3-client-cl-cgame-runtime-ml-59239514"></a>
### snapshotBytes

```ml
function snapshotBytes(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L107)

- [mq3.client.cl_cgame_runtime.State](Type-mq3-client-cl-cgame-runtime-state-717532426.md) — struct
<a id="function-function-mq3-client-cl-cgame-runtime-streamclearcommands-function-streamclearcommands-state-src-mq3-client-cl-cgame-runtime-ml-888827079"></a>
### streamClearCommands

```ml
function streamClearCommands(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L149)

<a id="function-function-mq3-client-cl-cgame-runtime-streamclearnotify-function-streamclearnotify-state-src-mq3-client-cl-cgame-runtime-ml-1925827725"></a>
### streamClearNotify

```ml
function streamClearNotify(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L150)

<a id="function-function-mq3-client-cl-cgame-runtime-streamcloseconsole-function-streamcloseconsole-state-src-mq3-client-cl-cgame-runtime-ml-972541553"></a>
### streamCloseConsole

```ml
function streamCloseConsole(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L154)

<a id="function-function-mq3-client-cl-cgame-runtime-streamconfig-function-streamconfig-state-index-value-src-mq3-client-cl-cgame-runtime-ml-2112751240"></a>
### streamConfig

```ml
function streamConfig(state, index, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L145)

<a id="function-function-mq3-client-cl-cgame-runtime-streamqueueconsole-function-streamqueueconsole-state-text-src-mq3-client-cl-cgame-runtime-ml-22057198"></a>
### streamQueueConsole

```ml
function streamQueueConsole(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L158)

<a id="function-function-mq3-client-cl-cgame-runtime-syscallcommandnumber-function-syscallcommandnumber-state-src-mq3-client-cl-cgame-runtime-ml-832738517"></a>
### syscallCommandNumber

```ml
function syscallCommandNumber(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L197)

<a id="function-function-mq3-client-cl-cgame-runtime-syscallgamestate-function-syscallgamestate-state-src-mq3-client-cl-cgame-runtime-ml-421962221"></a>
### syscallGameState

```ml
function syscallGameState(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L192)

<a id="function-function-mq3-client-cl-cgame-runtime-syscallglconfig-function-syscallglconfig-state-src-mq3-client-cl-cgame-runtime-ml-409763469"></a>
### syscallGlconfig

```ml
function syscallGlconfig(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L193)

<a id="function-function-mq3-client-cl-cgame-runtime-syscallservercommand-function-syscallservercommand-state-number-src-mq3-client-cl-cgame-runtime-ml-572492448"></a>
### syscallServerCommand

```ml
function syscallServerCommand(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L196)

<a id="function-function-mq3-client-cl-cgame-runtime-syscallsetusercmd-function-syscallsetusercmd-state-value-sensitivity-src-mq3-client-cl-cgame-runtime-ml-101994233"></a>
### syscallSetUserCmd

```ml
function syscallSetUserCmd(state, value, sensitivity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `sensitivity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L199)

<a id="function-function-mq3-client-cl-cgame-runtime-syscallsnapshot-function-syscallsnapshot-state-number-src-mq3-client-cl-cgame-runtime-ml-1561507286"></a>
### syscallSnapshot

```ml
function syscallSnapshot(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L195)

<a id="function-function-mq3-client-cl-cgame-runtime-syscallsnapshotnumber-function-syscallsnapshotnumber-state-src-mq3-client-cl-cgame-runtime-ml-899102133"></a>
### syscallSnapshotNumber

```ml
function syscallSnapshotNumber(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L194)

<a id="function-function-mq3-client-cl-cgame-runtime-syscallusercmd-function-syscallusercmd-state-number-src-mq3-client-cl-cgame-runtime-ml-1416995660"></a>
### syscallUserCmd

```ml
function syscallUserCmd(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L198)

<a id="function-function-mq3-client-cl-cgame-runtime-usercmdbytes-function-usercmdbytes-command-src-mq3-client-cl-cgame-runtime-ml-874934473"></a>
### usercmdBytes

```ml
function usercmdBytes(command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `command` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L82)

<a id="function-function-mq3-client-cl-cgame-runtime-wiresyscalls-function-wiresyscalls-state-host-machine-src-mq3-client-cl-cgame-runtime-ml-573712430"></a>
### wireSyscalls

```ml
function wireSyscalls(state, host, machine)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `machine` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L200)

<a id="function-function-mq3-client-cl-cgame-runtime-writewords-function-writewords-output-offset-words-src-mq3-client-cl-cgame-runtime-ml-1533018715"></a>
### writeWords

```ml
function writeWords(output, offset, words)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `words` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_cgame_runtime.ml#L106)
