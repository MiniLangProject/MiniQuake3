# `src/mq3/botlib/server_imports.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.server_imports`](Package-mq3-botlib-server-imports-1087034866.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/server_bridge.ml` as `bridge` → [src/mq3/botlib/server_bridge.ml](File-src-mq3-botlib-server-bridge-ml-1158932283.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-botlib-server-imports-botclientcommand-function-botclientcommand-state-clientnum-command-host-src-mq3-botlib-server-imports-ml-984298653"></a>
### BotClientCommand

```ml
function BotClientCommand(state, clientNum, command, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L125)

<a id="function-function-mq3-botlib-server-imports-botdrawdebugpolygons-function-botdrawdebugpolygons-state-host-src-mq3-botlib-server-imports-ml-1687427799"></a>
### BotDrawDebugPolygons

```ml
function BotDrawDebugPolygons(state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L119)

<a id="function-function-mq3-botlib-server-imports-botimport-bspentitydata-function-botimport-bspentitydata-host-src-mq3-botlib-server-imports-ml-1173033800"></a>
### BotImport_BSPEntityData

```ml
function BotImport_BSPEntityData(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L76)

<a id="function-function-mq3-botlib-server-imports-botimport-bspmodelminsmaxsorigin-function-botimport-bspmodelminsmaxsorigin-modelnum-angles-host-src-mq3-botlib-server-imports-ml-668612013"></a>
### BotImport_BSPModelMinsMaxsOrigin

```ml
function BotImport_BSPModelMinsMaxsOrigin(modelnum, angles, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelnum` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L77)

<a id="function-function-mq3-botlib-server-imports-botimport-debuglinecreate-function-botimport-debuglinecreate-state-src-mq3-botlib-server-imports-ml-859566565"></a>
### BotImport_DebugLineCreate

```ml
function BotImport_DebugLineCreate(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L109)

<a id="function-function-mq3-botlib-server-imports-botimport-debuglinedelete-function-botimport-debuglinedelete-state-line-src-mq3-botlib-server-imports-ml-1472626137"></a>
### BotImport_DebugLineDelete

```ml
function BotImport_DebugLineDelete(state, line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L110)

<a id="function-function-mq3-botlib-server-imports-botimport-debuglineshow-function-botimport-debuglineshow-state-line-start-finish-color-src-mq3-botlib-server-imports-ml-1120583259"></a>
### BotImport_DebugLineShow

```ml
function BotImport_DebugLineShow(state, line, start, finish, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L111)

<a id="function-function-mq3-botlib-server-imports-botimport-debugpolygoncreate-function-botimport-debugpolygoncreate-state-color-numpoints-points-src-mq3-botlib-server-imports-ml-281384548"></a>
### BotImport_DebugPolygonCreate

```ml
function BotImport_DebugPolygonCreate(state, color, numPoints, points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `numPoints` | `dynamic` | — |  |
| `points` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L96)

<a id="function-function-mq3-botlib-server-imports-botimport-debugpolygondelete-function-botimport-debugpolygondelete-state-id-src-mq3-botlib-server-imports-ml-2092133156"></a>
### BotImport_DebugPolygonDelete

```ml
function BotImport_DebugPolygonDelete(state, id)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L108)

<a id="function-function-mq3-botlib-server-imports-botimport-debugpolygonshow-function-botimport-debugpolygonshow-state-id-color-numpoints-points-src-mq3-botlib-server-imports-ml-1543872057"></a>
### BotImport_DebugPolygonShow

```ml
function BotImport_DebugPolygonShow(state, id, color, numPoints, points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `numPoints` | `dynamic` | — |  |
| `points` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L103)

<a id="function-function-mq3-botlib-server-imports-botimport-entitytrace-function-botimport-entitytrace-start-mins-maxs-finish-entnum-contentmask-host-src-mq3-botlib-server-imports-ml-426200115"></a>
### BotImport_EntityTrace

```ml
function BotImport_EntityTrace(start, mins, maxs, finish, entnum, contentmask, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `entnum` | `dynamic` | — |  |
| `contentmask` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L70)

<a id="function-function-mq3-botlib-server-imports-botimport-freememory-function-botimport-freememory-pointer-host-src-mq3-botlib-server-imports-ml-1770199487"></a>
### BotImport_FreeMemory

```ml
function BotImport_FreeMemory(pointer, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pointer` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L87)

<a id="function-function-mq3-botlib-server-imports-botimport-getmemory-function-botimport-getmemory-size-host-src-mq3-botlib-server-imports-ml-1501756959"></a>
### BotImport_GetMemory

```ml
function BotImport_GetMemory(size, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L86)

<a id="function-function-mq3-botlib-server-imports-botimport-hunkalloc-function-botimport-hunkalloc-size-host-src-mq3-botlib-server-imports-ml-1709562295"></a>
### BotImport_HunkAlloc

```ml
function BotImport_HunkAlloc(size, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L88)

<a id="function-function-mq3-botlib-server-imports-botimport-inpvs-function-botimport-inpvs-p1-p2-host-src-mq3-botlib-server-imports-ml-203611717"></a>
### BotImport_inPVS

```ml
function BotImport_inPVS(p1, p2, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p1` | `dynamic` | — |  |
| `p2` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L75)

<a id="function-function-mq3-botlib-server-imports-botimport-pointcontents-function-botimport-pointcontents-point-host-src-mq3-botlib-server-imports-ml-1103991258"></a>
### BotImport_PointContents

```ml
function BotImport_PointContents(point, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L74)

<a id="function-function-mq3-botlib-server-imports-botimport-print-function-botimport-print-type-text-host-src-mq3-botlib-server-imports-ml-489157885"></a>
### BotImport_Print

```ml
function BotImport_Print(type, text, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L49)

<a id="function-function-mq3-botlib-server-imports-botimport-trace-function-botimport-trace-start-mins-maxs-finish-passent-contentmask-host-src-mq3-botlib-server-imports-ml-1610111428"></a>
### BotImport_Trace

```ml
function BotImport_Trace(start, mins, maxs, finish, passent, contentmask, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `passent` | `dynamic` | — |  |
| `contentmask` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L66)

- [mq3.botlib.server_imports.BspTrace](Type-mq3-botlib-server-imports-bsptrace-471967370.md) — struct
<a id="constant-constant-mq3-botlib-server-imports-button-attack-const-button-attack-1-src-mq3-botlib-server-imports-ml-365059660"></a>
### BUTTON_ATTACK

```ml
const BUTTON_ATTACK = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L13)

<a id="function-function-mq3-botlib-server-imports-client-function-client-src-mq3-botlib-server-imports-ml-1086865932"></a>
### client

```ml
function client()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L22)

- [mq3.botlib.server_imports.Client](Type-mq3-botlib-server-imports-client-934323811.md) — struct
<a id="function-function-mq3-botlib-server-imports-converttrace-function-converttrace-value-src-mq3-botlib-server-imports-ml-838529561"></a>
### convertTrace

```ml
function convertTrace(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L62)

<a id="function-function-mq3-botlib-server-imports-copypoints-function-copypoints-points-src-mq3-botlib-server-imports-ml-158370691"></a>
### copyPoints

```ml
function copyPoints(points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L95)

<a id="function-function-mq3-botlib-server-imports-create-function-create-maxclients-maxdebugpolys-src-mq3-botlib-server-imports-ml-593143086"></a>
### create

```ml
function create(maxClients, maxDebugPolys)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxClients` | `dynamic` | — |  |
| `maxDebugPolys` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L26)

<a id="constant-constant-mq3-botlib-server-imports-cs-active-const-cs-active-4-src-mq3-botlib-server-imports-ml-1212112185"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L10)

<a id="constant-constant-mq3-botlib-server-imports-cs-free-const-cs-free-0-src-mq3-botlib-server-imports-ml-1332374157"></a>
### CS_FREE

```ml
const CS_FREE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L9)

<a id="constant-constant-mq3-botlib-server-imports-cvar-cheat-const-cvar-cheat-512-src-mq3-botlib-server-imports-ml-990904503"></a>
### CVAR_CHEAT

```ml
const CVAR_CHEAT = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L19)

<a id="function-function-mq3-botlib-server-imports-cvardefinitions-function-cvardefinitions-src-mq3-botlib-server-imports-ml-2070394976"></a>
### cvarDefinitions

```ml
function cvarDefinitions()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L141)

- [mq3.botlib.server_imports.DebugPolygon](Type-mq3-botlib-server-imports-debugpolygon-214112003.md) — struct
<a id="function-function-mq3-botlib-server-imports-entityinpvs-function-entityinpvs-serverbridge-client-entitynum-src-mq3-botlib-server-imports-ml-123354604"></a>
### EntityInPVS

```ml
function EntityInPVS(serverBridge, client, entityNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverBridge` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L158)

<a id="constant-constant-mq3-botlib-server-imports-na-bot-const-na-bot-0-src-mq3-botlib-server-imports-ml-2130299105"></a>
### NA_BOT

```ml
const NA_BOT = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L11)

<a id="function-function-mq3-botlib-server-imports-polygon-function-polygon-src-mq3-botlib-server-imports-ml-1040926848"></a>
### polygon

```ml
function polygon()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L24)

<a id="constant-constant-mq3-botlib-server-imports-prt-error-const-prt-error-3-src-mq3-botlib-server-imports-ml-445862042"></a>
### PRT_ERROR

```ml
const PRT_ERROR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L16)

<a id="constant-constant-mq3-botlib-server-imports-prt-exit-const-prt-exit-5-src-mq3-botlib-server-imports-ml-1638874468"></a>
### PRT_EXIT

```ml
const PRT_EXIT = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L18)

<a id="constant-constant-mq3-botlib-server-imports-prt-fatal-const-prt-fatal-4-src-mq3-botlib-server-imports-ml-72632125"></a>
### PRT_FATAL

```ml
const PRT_FATAL = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L17)

<a id="constant-constant-mq3-botlib-server-imports-prt-message-const-prt-message-1-src-mq3-botlib-server-imports-ml-1945284976"></a>
### PRT_MESSAGE

```ml
const PRT_MESSAGE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L14)

<a id="constant-constant-mq3-botlib-server-imports-prt-warning-const-prt-warning-2-src-mq3-botlib-server-imports-ml-1119016251"></a>
### PRT_WARNING

```ml
const PRT_WARNING = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L15)

<a id="function-function-mq3-botlib-server-imports-services-function-services-context-src-mq3-botlib-server-imports-ml-1332162371"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L34)

- [mq3.botlib.server_imports.Services](Type-mq3-botlib-server-imports-services-1272614492.md) — struct
- [mq3.botlib.server_imports.State](Type-mq3-botlib-server-imports-state-1846213001.md) — struct
<a id="function-function-mq3-botlib-server-imports-sv-botallocateclient-function-sv-botallocateclient-state-src-mq3-botlib-server-imports-ml-2089232465"></a>
### SV_BotAllocateClient

```ml
function SV_BotAllocateClient(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L36)

<a id="function-function-mq3-botlib-server-imports-sv-botdispatch-function-sv-botdispatch-serverbridge-vm-base-op-src-mq3-botlib-server-imports-ml-1903239749"></a>
### SV_BotDispatch

```ml
function SV_BotDispatch(serverBridge, vm, base, op)
```

Keep the QVM trap boundary in the sv_bot port as well: the productive local server routes the three server-side bot traps through this module, while the compact bridge owns the VM-buffer encoding shared by native and QVM matches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverBridge` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L157)

<a id="function-function-mq3-botlib-server-imports-sv-botframe-function-sv-botframe-state-time-host-src-mq3-botlib-server-imports-ml-2090784898"></a>
### SV_BotFrame

```ml
function SV_BotFrame(state, time, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L129)

<a id="function-function-mq3-botlib-server-imports-sv-botfreeclient-function-sv-botfreeclient-state-clientnum-src-mq3-botlib-server-imports-ml-1931130890"></a>
### SV_BotFreeClient

```ml
function SV_BotFreeClient(state, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L44)

<a id="function-function-mq3-botlib-server-imports-sv-botgetconsolemessage-function-sv-botgetconsolemessage-serverbridge-client-src-mq3-botlib-server-imports-ml-425952807"></a>
### SV_BotGetConsoleMessage

```ml
function SV_BotGetConsoleMessage(serverBridge, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverBridge` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L152)

<a id="function-function-mq3-botlib-server-imports-sv-botgetsnapshotentity-function-sv-botgetsnapshotentity-serverbridge-client-sequence-src-mq3-botlib-server-imports-ml-493302652"></a>
### SV_BotGetSnapshotEntity

```ml
function SV_BotGetSnapshotEntity(serverBridge, client, sequence)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverBridge` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `sequence` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L153)

<a id="function-function-mq3-botlib-server-imports-sv-botinitbotlib-function-sv-botinitbotlib-state-maxdebugpolys-host-src-mq3-botlib-server-imports-ml-2033209049"></a>
### SV_BotInitBotLib

```ml
function SV_BotInitBotLib(state, maxDebugPolys, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `maxDebugPolys` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L145)

<a id="function-function-mq3-botlib-server-imports-sv-botinitcvars-function-sv-botinitcvars-host-src-mq3-botlib-server-imports-ml-1528451210"></a>
### SV_BotInitCvars

```ml
function SV_BotInitCvars(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L144)

<a id="function-function-mq3-botlib-server-imports-sv-botlibsetup-function-sv-botlibsetup-state-host-src-mq3-botlib-server-imports-ml-668305911"></a>
### SV_BotLibSetup

```ml
function SV_BotLibSetup(state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L134)

<a id="function-function-mq3-botlib-server-imports-sv-botlibshutdown-function-sv-botlibshutdown-state-host-src-mq3-botlib-server-imports-ml-1492304883"></a>
### SV_BotLibShutdown

```ml
function SV_BotLibShutdown(state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L139)

<a id="constant-constant-mq3-botlib-server-imports-svf-bot-const-svf-bot-8-src-mq3-botlib-server-imports-ml-1043181493"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L12)

<a id="function-function-mq3-botlib-server-imports-validpolygon-function-validpolygon-state-id-src-mq3-botlib-server-imports-ml-356765948"></a>
### validPolygon

```ml
function validPolygon(state, id)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_imports.ml#L94)
