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

Use `host.executeClientCommandFn` to perform `BotClientCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server imports state; accesses `clients`. |
| `clientNum` | `dynamic` | — | Client slot number. |
| `command` | `dynamic` | — | Value passed as argument 3 to `host.executeClientCommandFn`. |
| `host` | `dynamic` | — | Host service configuration; accesses `executeClientCommandFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L351)

<a id="function-function-mq3-botlib-server-imports-botdrawdebugpolygons-function-botdrawdebugpolygons-state-host-src-mq3-botlib-server-imports-ml-1687427799"></a>
### BotDrawDebugPolygons

```ml
function BotDrawDebugPolygons(state, host)
```

Use `host.drawPolyFn` to perform `BotDrawDebugPolygons`. Return paths include `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server imports state; accesses `maxDebugPolys` and `debugPolygons`. |
| `host` | `dynamic` | — | Host service configuration; accesses `drawPolyFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L340)

<a id="function-function-mq3-botlib-server-imports-botimport-bspentitydata-function-botimport-bspentitydata-host-src-mq3-botlib-server-imports-ml-1173033800"></a>
### BotImport_BSPEntityData

```ml
function BotImport_BSPEntityData(host)
```

Use `host.entityDataFn` to perform `BotImport_BSPEntityData`. Return paths include `host.entityDataFn(host.context)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host service configuration; accesses `entityDataFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L251)

<a id="function-function-mq3-botlib-server-imports-botimport-bspmodelminsmaxsorigin-function-botimport-bspmodelminsmaxsorigin-modelnum-angles-host-src-mq3-botlib-server-imports-ml-668612013"></a>
### BotImport_BSPModelMinsMaxsOrigin

```ml
function BotImport_BSPModelMinsMaxsOrigin(modelnum, angles, host)
```

Use `host.modelBoundsFn` to perform `BotImport_BSPModelMinsMaxsOrigin`. Return paths include `[mins,maxs,[0.0,0.0,0.0]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `modelnum` | `dynamic` | — | Value passed as argument 2 to `host.modelBoundsFn`. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |
| `host` | `dynamic` | — | Host service configuration; accesses `modelBoundsFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L256)

<a id="function-function-mq3-botlib-server-imports-botimport-debuglinecreate-function-botimport-debuglinecreate-state-src-mq3-botlib-server-imports-ml-859566565"></a>
### BotImport_DebugLineCreate

```ml
function BotImport_DebugLineCreate(state)
```

Forward `BotImport_DebugLineCreate` to `mq3.botlib.server_imports.BotImport_DebugPolygonCreate` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server imports state; accesses `maxDebugPolys` and `debugPolygons`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L318)

<a id="function-function-mq3-botlib-server-imports-botimport-debuglinedelete-function-botimport-debuglinedelete-state-line-src-mq3-botlib-server-imports-ml-1472626137"></a>
### BotImport_DebugLineDelete

```ml
function BotImport_DebugLineDelete(state, line)
```

Forward `BotImport_DebugLineDelete` to `mq3.botlib.server_imports.BotImport_DebugPolygonDelete` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server imports state; accesses `debugPolygons`. May update `state.debugPolygons[id].inuse` in place. |
| `line` | `dynamic` | — | Source line number attached to the diagnostic. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L322)

<a id="function-function-mq3-botlib-server-imports-botimport-debuglineshow-function-botimport-debuglineshow-state-line-start-finish-color-src-mq3-botlib-server-imports-ml-1120583259"></a>
### BotImport_DebugLineShow

```ml
function BotImport_DebugLineShow(state, line, start, finish, color)
```

Apply `mq3.botlib.server_imports.BotImport_DebugPolygonShow` while evaluating `BotImport_DebugLineShow`. Return paths include `BotImport_DebugPolygonShow(state,line,color,4,points)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server imports state; accesses `debugPolygons`. |
| `line` | `dynamic` | — | Source line number attached to the diagnostic. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `color` | `dynamic` | — | Value used by `BotImport_DebugPolygonShow` in `poly.color=color`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L329)

<a id="function-function-mq3-botlib-server-imports-botimport-debugpolygoncreate-function-botimport-debugpolygoncreate-state-color-numpoints-points-src-mq3-botlib-server-imports-ml-281384548"></a>
### BotImport_DebugPolygonCreate

```ml
function BotImport_DebugPolygonCreate(state, color, numPoints, points)
```

Apply `mq3.botlib.server_imports.BotImport_DebugPolygonShow` while evaluating `BotImport_DebugPolygonCreate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server imports state; accesses `maxDebugPolys` and `debugPolygons`. |
| `color` | `dynamic` | — | Value used by `BotImport_DebugPolygonShow` in `poly.color=color`. |
| `numPoints` | `dynamic` | — | Value used by `BotImport_DebugPolygonShow` in `if not validPolygon(state,id) or numPoints<0 or numPoints>128 or points==void or numPoints>len(points) then retu...`. |
| `points` | `dynamic` | — | Array or byte sequence accessed at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L294)

<a id="function-function-mq3-botlib-server-imports-botimport-debugpolygondelete-function-botimport-debugpolygondelete-state-id-src-mq3-botlib-server-imports-ml-2092133156"></a>
### BotImport_DebugPolygonDelete

```ml
function BotImport_DebugPolygonDelete(state, id)
```

Set `state.debugPolygons[id].inuse` to `false` in `mq3.botlib.server_imports.BotImport_DebugPolygonDelete`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server imports state; accesses `debugPolygons`. May update `state.debugPolygons[id].inuse` in place. |
| `id` | `dynamic` | — | Operand used to evaluate the returned expression `state!=void and id>=0 and id<state.maxDebugPolys`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L315)

<a id="function-function-mq3-botlib-server-imports-botimport-debugpolygonshow-function-botimport-debugpolygonshow-state-id-color-numpoints-points-src-mq3-botlib-server-imports-ml-1543872057"></a>
### BotImport_DebugPolygonShow

```ml
function BotImport_DebugPolygonShow(state, id, color, numPoints, points)
```

Apply `mq3.botlib.server_imports.validPolygon` and `mq3.botlib.server_imports.copyPoints` while evaluating `BotImport_DebugPolygonShow`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server imports state; accesses `debugPolygons`. |
| `id` | `dynamic` | — | Operand used to evaluate the returned expression `state!=void and id>=0 and id<state.maxDebugPolys`. |
| `color` | `dynamic` | — | Value used by `BotImport_DebugPolygonShow` in `poly.color=color`. |
| `numPoints` | `dynamic` | — | Value used by `BotImport_DebugPolygonShow` in `if not validPolygon(state,id) or numPoints<0 or numPoints>128 or points==void or numPoints>len(points) then retu...`. |
| `points` | `dynamic` | — | Array or byte sequence accessed at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L307)

<a id="function-function-mq3-botlib-server-imports-botimport-entitytrace-function-botimport-entitytrace-start-mins-maxs-finish-entnum-contentmask-host-src-mq3-botlib-server-imports-ml-426200115"></a>
### BotImport_EntityTrace

```ml
function BotImport_EntityTrace(start, mins, maxs, finish, entnum, contentmask, host)
```

Use `host.entityTraceFn` to perform `BotImport_EntityTrace`. Return paths include `convertTrace(host.entityTraceFn(host.context,start,mins,maxs,finish,entnum,contentmask))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | Value passed as argument 2 to `host.entityTraceFn`. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |
| `finish` | `dynamic` | — | Value passed as argument 5 to `host.entityTraceFn`. |
| `entnum` | `dynamic` | — | Entity number in the game or AAS entity table. |
| `contentmask` | `dynamic` | — | Value passed as argument 7 to `host.entityTraceFn`. |
| `host` | `dynamic` | — | Host service configuration; accesses `entityTraceFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L236)

<a id="function-function-mq3-botlib-server-imports-botimport-freememory-function-botimport-freememory-pointer-host-src-mq3-botlib-server-imports-ml-1770199487"></a>
### BotImport_FreeMemory

```ml
function BotImport_FreeMemory(pointer, host)
```

Use `host.freeFn` to perform `BotImport_FreeMemory`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pointer` | `dynamic` | — | Value passed as argument 2 to `host.freeFn`. |
| `host` | `dynamic` | — | Host service configuration; accesses `freeFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L272)

<a id="function-function-mq3-botlib-server-imports-botimport-getmemory-function-botimport-getmemory-size-host-src-mq3-botlib-server-imports-ml-1501756959"></a>
### BotImport_GetMemory

```ml
function BotImport_GetMemory(size, host)
```

Use `host.allocFn` to perform `BotImport_GetMemory`. Return paths include `host.allocFn(host.context,size)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |
| `host` | `dynamic` | — | Host service configuration; accesses `allocFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L268)

<a id="function-function-mq3-botlib-server-imports-botimport-hunkalloc-function-botimport-hunkalloc-size-host-src-mq3-botlib-server-imports-ml-1709562295"></a>
### BotImport_HunkAlloc

```ml
function BotImport_HunkAlloc(size, host)
```

Use `host.hunkMarkFn` and `host.hunkAllocFn` to perform `BotImport_HunkAlloc`. Return paths include `host.hunkAllocFn(host.context,size)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |
| `host` | `dynamic` | — | Host service configuration; accesses `hunkAllocFn`, `hunkMarkFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L276)

<a id="function-function-mq3-botlib-server-imports-botimport-inpvs-function-botimport-inpvs-p1-p2-host-src-mq3-botlib-server-imports-ml-203611717"></a>
### BotImport_inPVS

```ml
function BotImport_inPVS(p1, p2, host)
```

Use `host.inPvsFn` to perform `BotImport_inPVS`. Return paths include `host.inPvsFn(host.context,p1,p2)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p1` | `dynamic` | — | Value passed as argument 2 to `host.inPvsFn`. |
| `p2` | `dynamic` | — | Value passed as argument 3 to `host.inPvsFn`. |
| `host` | `dynamic` | — | Host service configuration; accesses `inPvsFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L248)

<a id="function-function-mq3-botlib-server-imports-botimport-pointcontents-function-botimport-pointcontents-point-host-src-mq3-botlib-server-imports-ml-1103991258"></a>
### BotImport_PointContents

```ml
function BotImport_PointContents(point, host)
```

Use `host.pointContentsFn` to perform `BotImport_PointContents`. Return paths include `host.pointContentsFn(host.context,point,-1)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `host` | `dynamic` | — | Host service configuration; accesses `pointContentsFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L243)

<a id="function-function-mq3-botlib-server-imports-botimport-print-function-botimport-print-type-text-host-src-mq3-botlib-server-imports-ml-489157885"></a>
### BotImport_Print

```ml
function BotImport_Print(type, text, host)
```

Use `host.errorFn` and `host.printFn` to perform `BotImport_Print`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | `dynamic` | — | Value used by `BotImport_Print` in `if type==PRT_WARNING then rendered="^3Warning: "+text`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `host` | `dynamic` | — | Host service configuration; accesses `errorFn`, `context` and `printFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L169)

<a id="function-function-mq3-botlib-server-imports-botimport-trace-function-botimport-trace-start-mins-maxs-finish-passent-contentmask-host-src-mq3-botlib-server-imports-ml-1610111428"></a>
### BotImport_Trace

```ml
function BotImport_Trace(start, mins, maxs, finish, passent, contentmask, host)
```

Use `host.traceFn` to perform `BotImport_Trace`. Return paths include `convertTrace(host.traceFn(host.context,start,mins,maxs,finish,passent,contentmask))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | Value passed as argument 2 to `host.traceFn`. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |
| `finish` | `dynamic` | — | Value passed as argument 5 to `host.traceFn`. |
| `passent` | `dynamic` | — | Value passed as argument 6 to `host.traceFn`. |
| `contentmask` | `dynamic` | — | Value passed as argument 7 to `host.traceFn`. |
| `host` | `dynamic` | — | Host service configuration; accesses `traceFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L224)

- [mq3.botlib.server_imports.BspTrace](Type-mq3-botlib-server-imports-bsptrace-471967370.md) — struct
<a id="constant-constant-mq3-botlib-server-imports-button-attack-const-button-attack-1-src-mq3-botlib-server-imports-ml-365059660"></a>
### BUTTON_ATTACK

```ml
const BUTTON_ATTACK = 1
```

User-command button bit for attack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L18)

<a id="function-function-mq3-botlib-server-imports-client-function-client-src-mq3-botlib-server-imports-ml-1086865932"></a>
### client

```ml
function client()
```

Create a `mq3.botlib.server_imports.Client` record, initializing `state` as `CS_FREE`, `entityNumber` as `-1` and `origin` as `[0.0,0.0,0.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L56)

- [mq3.botlib.server_imports.Client](Type-mq3-botlib-server-imports-client-934323811.md) — struct
<a id="function-function-mq3-botlib-server-imports-converttrace-function-converttrace-value-src-mq3-botlib-server-imports-ml-838529561"></a>
### convertTrace

```ml
function convertTrace(value)
```

Build the `mq3.botlib.server_imports.BspTrace` result for `convertTrace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `allsolid`, `startsolid`, `fraction`, `endpos` and `planeDist` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L212)

<a id="function-function-mq3-botlib-server-imports-copypoints-function-copypoints-points-src-mq3-botlib-server-imports-ml-158370691"></a>
### copyPoints

```ml
function copyPoints(points)
```

Copy each three-component polygon point into an independent coordinate array.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Value used by `copyPoints` in `if points!=void then for each point in points result=result+[[point[0],point[1],point[2]]] end for end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L288)

<a id="function-function-mq3-botlib-server-imports-create-function-create-maxclients-maxdebugpolys-src-mq3-botlib-server-imports-ml-593143086"></a>
### create

```ml
function create(maxClients, maxDebugPolys)
```

Build the `mq3.botlib.server_imports.State` result for `create`. Return paths include `State(clients,0,0,false,false,polys,maxDebugPolys)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxClients` | `dynamic` | — | Value used by `create` in `if maxClients<0 or maxDebugPolys<0 then return error(7590,"bot server imports: invalid capacity") end if`. |
| `maxDebugPolys` | `dynamic` | — | Initial value stored in `mq3.botlib.server_imports.State.maxDebugPolys`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L88)

<a id="constant-constant-mq3-botlib-server-imports-cs-active-const-cs-active-4-src-mq3-botlib-server-imports-ml-1212112185"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```

Client-state value identifying an in-game client available through the bot-library server imports.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L12)

<a id="constant-constant-mq3-botlib-server-imports-cs-free-const-cs-free-0-src-mq3-botlib-server-imports-ml-1332374157"></a>
### CS_FREE

```ml
const CS_FREE = 0
```

Client-state value identifying an unoccupied server slot available for bot allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L10)

<a id="constant-constant-mq3-botlib-server-imports-cvar-cheat-const-cvar-cheat-512-src-mq3-botlib-server-imports-ml-990904503"></a>
### CVAR_CHEAT

```ml
const CVAR_CHEAT = 512
```

Can not be changed if cheats are disabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L30)

<a id="function-function-mq3-botlib-server-imports-cvardefinitions-function-cvardefinitions-src-mq3-botlib-server-imports-ml-2070394976"></a>
### cvarDefinitions

```ml
function cvarDefinitions()
```

Return the ordered cvar definitions table for server imports: 30 entries beginning with `["bot_enable","1",0]` and `["bot_developer","0",CVAR_CHEAT]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L378)

- [mq3.botlib.server_imports.DebugPolygon](Type-mq3-botlib-server-imports-debugpolygon-214112003.md) — struct
<a id="function-function-mq3-botlib-server-imports-entityinpvs-function-entityinpvs-serverbridge-client-entitynum-src-mq3-botlib-server-imports-ml-123354604"></a>
### EntityInPVS

```ml
function EntityInPVS(serverBridge, client, entityNum)
```

Apply `mq3.botlib.server_bridge.clientAt` while evaluating `EntityInPVS`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverBridge` | `dynamic` | — | Server bridge state; accesses `clients`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.clients[client]`. |
| `entityNum` | `dynamic` | — | Entity number in the game or AAS entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L416)

<a id="constant-constant-mq3-botlib-server-imports-na-bot-const-na-bot-0-src-mq3-botlib-server-imports-ml-2130299105"></a>
### NA_BOT

```ml
const NA_BOT = 0
```

Network-address kind reserved for an in-process bot client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L14)

<a id="function-function-mq3-botlib-server-imports-polygon-function-polygon-src-mq3-botlib-server-imports-ml-1040926848"></a>
### polygon

```ml
function polygon()
```

Create a `mq3.botlib.server_imports.DebugPolygon` record with the declared empty defaults.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L67)

<a id="constant-constant-mq3-botlib-server-imports-prt-error-const-prt-error-3-src-mq3-botlib-server-imports-ml-445862042"></a>
### PRT_ERROR

```ml
const PRT_ERROR = 3
```

Bot-library diagnostic severity for error.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L24)

<a id="constant-constant-mq3-botlib-server-imports-prt-exit-const-prt-exit-5-src-mq3-botlib-server-imports-ml-1638874468"></a>
### PRT_EXIT

```ml
const PRT_EXIT = 5
```

Bot-library diagnostic severity for exit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L28)

<a id="constant-constant-mq3-botlib-server-imports-prt-fatal-const-prt-fatal-4-src-mq3-botlib-server-imports-ml-72632125"></a>
### PRT_FATAL

```ml
const PRT_FATAL = 4
```

Bot-library diagnostic severity for fatal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L26)

<a id="constant-constant-mq3-botlib-server-imports-prt-message-const-prt-message-1-src-mq3-botlib-server-imports-ml-1945284976"></a>
### PRT_MESSAGE

```ml
const PRT_MESSAGE = 1
```

Bot-library diagnostic severity for message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L20)

<a id="constant-constant-mq3-botlib-server-imports-prt-warning-const-prt-warning-2-src-mq3-botlib-server-imports-ml-1119016251"></a>
### PRT_WARNING

```ml
const PRT_WARNING = 2
```

Bot-library diagnostic severity for warning.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L22)

<a id="function-function-mq3-botlib-server-imports-services-function-services-context-src-mq3-botlib-server-imports-ml-1332162371"></a>
### services

```ml
function services(context)
```

Create a `mq3.botlib.server_imports.Services` record, initializing `context` from `context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L145)

- [mq3.botlib.server_imports.Services](Type-mq3-botlib-server-imports-services-1272614492.md) — struct
- [mq3.botlib.server_imports.State](Type-mq3-botlib-server-imports-state-1846213001.md) — struct
<a id="function-function-mq3-botlib-server-imports-sv-botallocateclient-function-sv-botallocateclient-state-src-mq3-botlib-server-imports-ml-2089232465"></a>
### SV_BotAllocateClient

```ml
function SV_BotAllocateClient(state)
```

Activate the first free server client slot as a bot and initialize its entity number, time, address type and rate.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server imports state; accesses `clients` and `now`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L149)

<a id="function-function-mq3-botlib-server-imports-sv-botdispatch-function-sv-botdispatch-serverbridge-vm-base-op-src-mq3-botlib-server-imports-ml-1903239749"></a>
### SV_BotDispatch

```ml
function SV_BotDispatch(serverBridge, vm, base, op)
```

Keep the QVM trap boundary in the sv_bot port as well: the productive local server routes the three server-side bot traps through this module, while the compact bridge owns the VM-buffer encoding shared by native and QVM matches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverBridge` | `dynamic` | — | Server bridge state; accesses `clients`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L411)

<a id="function-function-mq3-botlib-server-imports-sv-botframe-function-sv-botframe-state-time-host-src-mq3-botlib-server-imports-ml-2090784898"></a>
### SV_BotFrame

```ml
function SV_BotFrame(state, time, host)
```

Use `host.gameFrameFn` to perform `SV_BotFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server imports state; accesses `botEnable` and `gameVmActive`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |
| `host` | `dynamic` | — | Host service configuration; accesses `gameFrameFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L359)

<a id="function-function-mq3-botlib-server-imports-sv-botfreeclient-function-sv-botfreeclient-state-clientnum-src-mq3-botlib-server-imports-ml-1931130890"></a>
### SV_BotFreeClient

```ml
function SV_BotFreeClient(state, clientNum)
```

Free a validated bot client slot, clear its name and remove the bot entity flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server imports state; accesses `clients`. |
| `clientNum` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L160)

<a id="function-function-mq3-botlib-server-imports-sv-botgetconsolemessage-function-sv-botgetconsolemessage-serverbridge-client-src-mq3-botlib-server-imports-ml-425952807"></a>
### SV_BotGetConsoleMessage

```ml
function SV_BotGetConsoleMessage(serverBridge, client)
```

Forward `SV_BotGetConsoleMessage` to `mq3.botlib.server_bridge.nextConsoleMessage` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverBridge` | `dynamic` | — | Server bridge state; accesses `now`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.clients[client]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L398)

<a id="function-function-mq3-botlib-server-imports-sv-botgetsnapshotentity-function-sv-botgetsnapshotentity-serverbridge-client-sequence-src-mq3-botlib-server-imports-ml-493302652"></a>
### SV_BotGetSnapshotEntity

```ml
function SV_BotGetSnapshotEntity(serverBridge, client, sequence)
```

Forward `SV_BotGetSnapshotEntity` to `mq3.botlib.server_bridge.snapshotEntity` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverBridge` | `dynamic` | — | Server bridge state; accesses `clients`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.clients[client]`. |
| `sequence` | `dynamic` | — | Operand used to evaluate the returned expression `value.snapshotEntities[sequence].number`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L403)

<a id="function-function-mq3-botlib-server-imports-sv-botinitbotlib-function-sv-botinitbotlib-state-maxdebugpolys-host-src-mq3-botlib-server-imports-ml-2033209049"></a>
### SV_BotInitBotLib

```ml
function SV_BotInitBotLib(state, maxDebugPolys, host)
```

Update `state.debugPolygons`, `state.maxDebugPolys` and `state.botlibReady` during `SV_BotInitBotLib`. Return paths include `state.botlibReady`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server imports state; accesses `debugPolygons`, `maxDebugPolys` and `botlibReady`. May update `state.debugPolygons`, `state.maxDebugPolys` and `state.botlibReady` in place. |
| `maxDebugPolys` | `dynamic` | — | Value used by `SV_BotInitBotLib` in `if state==void or maxDebugPolys<0 then return error(7597,"bot import: invalid botlib init") end if`. |
| `host` | `dynamic` | — | Host service configuration; accesses `getApiFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L388)

<a id="function-function-mq3-botlib-server-imports-sv-botinitcvars-function-sv-botinitcvars-host-src-mq3-botlib-server-imports-ml-1528451210"></a>
### SV_BotInitCvars

```ml
function SV_BotInitCvars(host)
```

Use `host.cvarGetFn` to perform `SV_BotInitCvars`. Return paths include `len(values)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host service configuration; accesses `cvarGetFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L383)

<a id="function-function-mq3-botlib-server-imports-sv-botlibsetup-function-sv-botlibsetup-state-host-src-mq3-botlib-server-imports-ml-668305911"></a>
### SV_BotLibSetup

```ml
function SV_BotLibSetup(state, host)
```

Use `host.printFn` and `host.setupFn` to perform `SV_BotLibSetup`. Return paths include `host.setupFn(host.context)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server imports state; accesses `botEnable` and `botlibReady`. |
| `host` | `dynamic` | — | Host service configuration; accesses `setupFn`, `printFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L367)

<a id="function-function-mq3-botlib-server-imports-sv-botlibshutdown-function-sv-botlibshutdown-state-host-src-mq3-botlib-server-imports-ml-1492304883"></a>
### SV_BotLibShutdown

```ml
function SV_BotLibShutdown(state, host)
```

Use `host.shutdownFn` to perform `SV_BotLibShutdown`. Return paths include `host.shutdownFn(host.context)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server imports state; accesses `botlibReady`. |
| `host` | `dynamic` | — | Host service configuration; accesses `shutdownFn` and `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L375)

<a id="constant-constant-mq3-botlib-server-imports-svf-bot-const-svf-bot-8-src-mq3-botlib-server-imports-ml-1043181493"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```

Set if the entity is a bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L16)

<a id="function-function-mq3-botlib-server-imports-validpolygon-function-validpolygon-state-id-src-mq3-botlib-server-imports-ml-356765948"></a>
### validPolygon

```ml
function validPolygon(state, id)
```

Test `state!=void and id>=0 and id<state.maxDebugPolys` as the condition for `validPolygon`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server imports state; accesses `maxDebugPolys`. |
| `id` | `dynamic` | — | Operand used to evaluate the returned expression `state!=void and id>=0 and id<state.maxDebugPolys`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L285)
