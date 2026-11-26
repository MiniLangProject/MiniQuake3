# `src/mq3/botlib/aas_bspq3.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_bspq3`](Package-mq3-botlib-aas-bspq3-649368793.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/server_imports.ml` as `imports` → [src/mq3/botlib/server_imports.ml](File-src-mq3-botlib-server-imports-ml-1126004744.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)

## Declarations

<a id="function-function-mq3-botlib-aas-bspq3-aas-areasconnected-function-aas-areasconnected-area1-area2-src-mq3-botlib-aas-bspq3-ml-1469472165"></a>
### AAS_AreasConnected

```ml
function AAS_AreasConnected(area1, area2)
```

Return `false` for `AAS_AreasConnected`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `area1` | `dynamic` | — | Not read by this implementation; retained in the `AAS_AreasConnected` signature. |
| `area2` | `dynamic` | — | Not read by this implementation; retained in the `AAS_AreasConnected` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L91)

<a id="function-function-mq3-botlib-aas-bspq3-aas-boxentities-function-aas-boxentities-absmins-absmaxs-list-maxcount-src-mq3-botlib-aas-bspq3-ml-567765257"></a>
### AAS_BoxEntities

```ml
function AAS_BoxEntities(absmins, absmaxs, list, maxcount)
```

Return `0` for `AAS_BoxEntities`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `absmins` | `dynamic` | — | Not read by this implementation; retained in the `AAS_BoxEntities` signature. |
| `absmaxs` | `dynamic` | — | Not read by this implementation; retained in the `AAS_BoxEntities` signature. |
| `list` | `dynamic` | — | Not read by this implementation; retained in the `AAS_BoxEntities` signature. |
| `maxcount` | `dynamic` | — | Not read by this implementation; retained in the `AAS_BoxEntities` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L75)

<a id="function-function-mq3-botlib-aas-bspq3-aas-bspentityinrange-function-aas-bspentityinrange-state-entity-src-mq3-botlib-aas-bspq3-ml-202152350"></a>
### AAS_BSPEntityInRange

```ml
function AAS_BSPEntityInRange(state, entity)
```

Test `state!=void and entity>0 and entity<state.numEntities` as the condition for `AAS_BSPEntityInRange`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS bspq3 state; accesses `numEntities`. |
| `entity` | `dynamic` | — | Operand used to evaluate the returned expression `state!=void and entity>0 and entity<state.numEntities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L102)

<a id="function-function-mq3-botlib-aas-bspq3-aas-bsplinkentity-function-aas-bsplinkentity-absmins-absmaxs-entnum-modelnum-src-mq3-botlib-aas-bspq3-ml-1552015382"></a>
### AAS_BSPLinkEntity

```ml
function AAS_BSPLinkEntity(absmins, absmaxs, entnum, modelnum)
```

Return `void` for `AAS_BSPLinkEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `absmins` | `dynamic` | — | Not read by this implementation; retained in the `AAS_BSPLinkEntity` signature. |
| `absmaxs` | `dynamic` | — | Not read by this implementation; retained in the `AAS_BSPLinkEntity` signature. |
| `entnum` | `dynamic` | — | Not read by this implementation; retained in the `AAS_BSPLinkEntity` signature. |
| `modelnum` | `dynamic` | — | Not read by this implementation; retained in the `AAS_BSPLinkEntity` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L69)

<a id="function-function-mq3-botlib-aas-bspq3-aas-bspmodelminsmaxsorigin-function-aas-bspmodelminsmaxsorigin-host-modelnum-angles-src-mq3-botlib-aas-bspq3-ml-243538977"></a>
### AAS_BSPModelMinsMaxsOrigin

```ml
function AAS_BSPModelMinsMaxsOrigin(host, modelnum, angles)
```

Forward `AAS_BSPModelMinsMaxsOrigin` to `mq3.botlib.server_imports.BotImport_BSPModelMinsMaxsOrigin` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host service configuration; accesses `modelBoundsFn` and `context`. |
| `modelnum` | `dynamic` | — | Value passed as argument 2 to `host.modelBoundsFn`. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L59)

<a id="function-function-mq3-botlib-aas-bspq3-aas-bsptracelight-function-aas-bsptracelight-start-finish-endpos-red-green-blue-src-mq3-botlib-aas-bspq3-ml-1064103204"></a>
### AAS_BSPTraceLight

```ml
function AAS_BSPTraceLight(start, finish, endpos, red, green, blue)
```

Return `0` for `AAS_BSPTraceLight`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | Not read by this implementation; retained in the `AAS_BSPTraceLight` signature. |
| `finish` | `dynamic` | — | Not read by this implementation; retained in the `AAS_BSPTraceLight` signature. |
| `endpos` | `dynamic` | — | Not read by this implementation; retained in the `AAS_BSPTraceLight` signature. |
| `red` | `dynamic` | — | Not read by this implementation; retained in the `AAS_BSPTraceLight` signature. |
| `green` | `dynamic` | — | Not read by this implementation; retained in the `AAS_BSPTraceLight` signature. |
| `blue` | `dynamic` | — | Not read by this implementation; retained in the `AAS_BSPTraceLight` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L83)

<a id="function-function-mq3-botlib-aas-bspq3-aas-dumpbspdata-function-aas-dumpbspdata-state-src-mq3-botlib-aas-bspq3-ml-1605030729"></a>
### AAS_DumpBSPData

```ml
function AAS_DumpBSPData(state)
```

Update `state.dentData`, `state.entDataSize` and `state.loaded` during `AAS_DumpBSPData`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS bspq3 state; accesses `dentData`, `entDataSize` and `loaded`. May update `state.dentData`, `state.entDataSize` and `state.loaded` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L157)

<a id="function-function-mq3-botlib-aas-bspq3-aas-entitycollision-function-aas-entitycollision-host-entnum-start-boxmins-boxmaxs-finish-contentmask-originaltrace-src-mq3-botlib-aas-bspq3-ml-1585740989"></a>
### AAS_EntityCollision

```ml
function AAS_EntityCollision(host, entnum, start, boxmins, boxmaxs, finish, contentmask, originalTrace)
```

Apply `mq3.botlib.server_imports.BotImport_EntityTrace` while evaluating `AAS_EntityCollision`. Return paths include `[false,originalTrace]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host service configuration; accesses `entityTraceFn` and `context`. |
| `entnum` | `dynamic` | — | Entity number in the game or AAS entity table. |
| `start` | `dynamic` | — | Value passed as argument 2 to `host.entityTraceFn`. |
| `boxmins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `boxmaxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |
| `finish` | `dynamic` | — | Value passed as argument 5 to `host.entityTraceFn`. |
| `contentmask` | `dynamic` | — | Value passed as argument 7 to `host.entityTraceFn`. |
| `originalTrace` | `dynamic` | — | Original trace record; accesses `fraction`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L42)

<a id="function-function-mq3-botlib-aas-bspq3-aas-floatforbspepairkey-function-aas-floatforbspepairkey-state-entity-key-src-mq3-botlib-aas-bspq3-ml-2095844105"></a>
### AAS_FloatForBSPEpairKey

```ml
function AAS_FloatForBSPEpairKey(state, entity, key)
```

Apply `mq3.botlib.aas_bspq3.AAS_ValueForBSPEpairKey` while evaluating `AAS_FloatForBSPEpairKey`. Return paths include `[true,numbers.atof32(pair[1])]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS bspq3 state; accesses `entities`. |
| `entity` | `dynamic` | — | Operand used to evaluate the returned expression `state!=void and entity>0 and entity<state.numEntities`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L123)

<a id="function-function-mq3-botlib-aas-bspq3-aas-freebspentities-function-aas-freebspentities-state-src-mq3-botlib-aas-bspq3-ml-1994323403"></a>
### AAS_FreeBSPEntities

```ml
function AAS_FreeBSPEntities(state)
```

Set `state.entities` to `[]` and `state.numEntities` to `0` in `mq3.botlib.aas_bspq3.AAS_FreeBSPEntities`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS bspq3 state; accesses `entities` and `numEntities`. May update `state.entities` and `state.numEntities` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L136)

<a id="function-function-mq3-botlib-aas-bspq3-aas-inphs-function-aas-inphs-p1-p2-src-mq3-botlib-aas-bspq3-ml-1023662685"></a>
### AAS_inPHS

```ml
function AAS_inPHS(p1, p2)
```

Return `true` for `AAS_inPHS`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p1` | `dynamic` | — | Not read by this implementation; retained in the `AAS_inPHS` signature. |
| `p2` | `dynamic` | — | Not read by this implementation; retained in the `AAS_inPHS` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L54)

<a id="function-function-mq3-botlib-aas-bspq3-aas-inpvs-function-aas-inpvs-host-p1-p2-src-mq3-botlib-aas-bspq3-ml-635954931"></a>
### AAS_inPVS

```ml
function AAS_inPVS(host, p1, p2)
```

Forward `AAS_inPVS` to `mq3.botlib.server_imports.BotImport_inPVS` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host service configuration; accesses `inPvsFn` and `context`. |
| `p1` | `dynamic` | — | Value passed as argument 2 to `host.inPvsFn`. |
| `p2` | `dynamic` | — | Value passed as argument 3 to `host.inPvsFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L50)

<a id="function-function-mq3-botlib-aas-bspq3-aas-intforbspepairkey-function-aas-intforbspepairkey-state-entity-key-src-mq3-botlib-aas-bspq3-ml-1495945307"></a>
### AAS_IntForBSPEpairKey

```ml
function AAS_IntForBSPEpairKey(state, entity, key)
```

Apply `mq3.botlib.aas_bspq3.AAS_ValueForBSPEpairKey` while evaluating `AAS_IntForBSPEpairKey`. Return paths include `[true,numbers.atoi(pair[1])]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS bspq3 state; accesses `entities`. |
| `entity` | `dynamic` | — | Operand used to evaluate the returned expression `state!=void and entity>0 and entity<state.numEntities`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L130)

<a id="function-function-mq3-botlib-aas-bspq3-aas-loadbspfile-function-aas-loadbspfile-state-entitydata-src-mq3-botlib-aas-bspq3-ml-1221409816"></a>
### AAS_LoadBSPFile

```ml
function AAS_LoadBSPFile(state, entityData)
```

Update `state.dentData`, `state.entDataSize` and `state.loaded` during `AAS_LoadBSPFile`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS bspq3 state; accesses `dentData`, `entDataSize` and `loaded`. May update `state.dentData`, `state.entDataSize` and `state.loaded` in place. |
| `entityData` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L163)

<a id="function-function-mq3-botlib-aas-bspq3-aas-nextbspentity-function-aas-nextbspentity-state-entity-src-mq3-botlib-aas-bspq3-ml-109412452"></a>
### AAS_NextBSPEntity

```ml
function AAS_NextBSPEntity(state, entity)
```

Advance to the next valid BSP entity number, returning zero at the end of the entity table.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS bspq3 state; accesses `numEntities`. |
| `entity` | `dynamic` | — | Operand used to evaluate the returned expression `entity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L96)

<a id="function-function-mq3-botlib-aas-bspq3-aas-parsebspentities-function-aas-parsebspentities-state-src-mq3-botlib-aas-bspq3-ml-1901848971"></a>
### AAS_ParseBSPEntities

```ml
function AAS_ParseBSPEntities(state)
```

Set `state.entities` to `entities` and `state.numEntities` to `len(entities)` in `mq3.botlib.aas_bspq3.AAS_ParseBSPEntities`. Return paths include `state.numEntities-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS bspq3 state; accesses `dentData`, `entities` and `numEntities`. May update `state.entities` and `state.numEntities` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L139)

<a id="function-function-mq3-botlib-aas-bspq3-aas-pointcontents-function-aas-pointcontents-host-point-src-mq3-botlib-aas-bspq3-ml-797317848"></a>
### AAS_PointContents

```ml
function AAS_PointContents(host, point)
```

Forward `AAS_PointContents` to `mq3.botlib.server_imports.BotImport_PointContents` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host service configuration; accesses `pointContentsFn` and `context`. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L32)

<a id="function-function-mq3-botlib-aas-bspq3-aas-printfreebsplinks-function-aas-printfreebsplinks-text-src-mq3-botlib-aas-bspq3-ml-815027497"></a>
### AAS_PrintFreeBSPLinks

```ml
function AAS_PrintFreeBSPLinks(text)
```

Declared by be_aas_bsp.h but not defined by the released Q3 BSP backend. Keep explicit compatibility entry points so callers see the same inert path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Not read by this implementation; retained in the `AAS_PrintFreeBSPLinks` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L87)

<a id="function-function-mq3-botlib-aas-bspq3-aas-trace-function-aas-trace-host-start-mins-maxs-finish-passent-contentmask-src-mq3-botlib-aas-bspq3-ml-1647102370"></a>
### AAS_Trace

```ml
function AAS_Trace(host, start, mins, maxs, finish, passent, contentmask)
```

Forward `AAS_Trace` to `mq3.botlib.server_imports.BotImport_Trace` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host service configuration; accesses `traceFn` and `context`. |
| `start` | `dynamic` | — | Value passed as argument 2 to `host.traceFn`. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |
| `finish` | `dynamic` | — | Value passed as argument 5 to `host.traceFn`. |
| `passent` | `dynamic` | — | Value passed as argument 6 to `host.traceFn`. |
| `contentmask` | `dynamic` | — | Value passed as argument 7 to `host.traceFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L28)

<a id="function-function-mq3-botlib-aas-bspq3-aas-unlinkfrombspleaves-function-aas-unlinkfrombspleaves-leaves-src-mq3-botlib-aas-bspq3-ml-1614857814"></a>
### AAS_UnlinkFromBSPLeaves

```ml
function AAS_UnlinkFromBSPLeaves(leaves)
```

These are intentional empty Q3 implementations, not missing adapters.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `leaves` | `dynamic` | — | Not read by this implementation; retained in the `AAS_UnlinkFromBSPLeaves` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L63)

<a id="function-function-mq3-botlib-aas-bspq3-aas-valueforbspepairkey-function-aas-valueforbspepairkey-state-entity-key-src-mq3-botlib-aas-bspq3-ml-1085814063"></a>
### AAS_ValueForBSPEpairKey

```ml
function AAS_ValueForBSPEpairKey(state, entity, key)
```

Apply `mq3.botlib.aas_bspq3.AAS_BSPEntityInRange` while evaluating `AAS_ValueForBSPEpairKey`. Return paths include `[false,""]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS bspq3 state; accesses `entities`. |
| `entity` | `dynamic` | — | Operand used to evaluate the returned expression `state!=void and entity>0 and entity<state.numEntities`. |
| `key` | `dynamic` | — | Lookup text matched against `pair[0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L107)

<a id="function-function-mq3-botlib-aas-bspq3-aas-vectorforbspepairkey-function-aas-vectorforbspepairkey-state-entity-key-src-mq3-botlib-aas-bspq3-ml-1330432161"></a>
### AAS_VectorForBSPEpairKey

```ml
function AAS_VectorForBSPEpairKey(state, entity, key)
```

Apply `mq3.botlib.aas_bspq3.AAS_ValueForBSPEpairKey` while evaluating `AAS_VectorForBSPEpairKey`. Return paths include `[true,parsed[1]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS bspq3 state; accesses `entities`. |
| `entity` | `dynamic` | — | Operand used to evaluate the returned expression `state!=void and entity>0 and entity<state.numEntities`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L115)

<a id="constant-constant-mq3-botlib-aas-bspq3-blerr-noerror-const-blerr-noerror-0-src-mq3-botlib-aas-bspq3-ml-444693151"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L13)

<a id="function-function-mq3-botlib-aas-bspq3-create-function-create-src-mq3-botlib-aas-bspq3-ml-1812771406"></a>
### create

```ml
function create()
```

Create a `mq3.botlib.aas_bspq3.State` record with the declared empty defaults.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L18)

<a id="constant-constant-mq3-botlib-aas-bspq3-max-bspentities-const-max-bspentities-2048-src-mq3-botlib-aas-bspq3-ml-1296339775"></a>
### MAX_BSPENTITIES

```ml
const MAX_BSPENTITIES = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L12)

<a id="function-function-mq3-botlib-aas-bspq3-printcontents-function-printcontents-contents-src-mq3-botlib-aas-bspq3-ml-314720146"></a>
### PrintContents

```ml
function PrintContents(contents)
```

Decode the BSP contents mask into the ordered names of the enabled contents flags.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `contents` | `dynamic` | — | Value used by `PrintContents` in `for each pair in values if (contents&pair[0])!=0 then result=result+[pair[1]] end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_bspq3.ml#L171)

- [mq3.botlib.aas_bspq3.State](Type-mq3-botlib-aas-bspq3-state-1438629734.md) — struct
