# `src/mq3/botlib/aas_entities.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_entities`](Package-mq3-botlib-aas-entities-1227782271.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_runtime.ml` as `aasRuntime` → [src/mq3/botlib/aas_runtime.ml](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-botlib-aas-entities-aas-bestreachableentityarea-function-aas-bestreachableentityarea-state-entnum-src-mq3-botlib-aas-entities-ml-379391240"></a>
### AAS_BestReachableEntityArea

```ml
function AAS_BestReachableEntityArea(state, entnum)
```

Apply `mq3.botlib.aas_runtime.areaReachability` while evaluating `AAS_BestReachableEntityArea`. Return paths include `fallback`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities`, `areaLinks` and `runtime`. |
| `entnum` | `dynamic` | — | Entity number in the game or AAS entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L172)

<a id="function-function-mq3-botlib-aas-entities-aas-entitybspdata-function-aas-entitybspdata-state-entnum-src-mq3-botlib-aas-entities-ml-603940314"></a>
### AAS_EntityBSPData

```ml
function AAS_EntityBSPData(state, entnum)
```

Build the `mq3.botlib.aas_entities.BspData` result for `AAS_EntityBSPData`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities` and `entities`. |
| `entnum` | `dynamic` | — | Entity number in the game or AAS entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L144)

<a id="function-function-mq3-botlib-aas-entities-aas-entityinfo-function-aas-entityinfo-state-entnum-src-mq3-botlib-aas-entities-ml-653752022"></a>
### AAS_EntityInfo

```ml
function AAS_EntityInfo(state, entnum)
```

Forward `AAS_EntityInfo` to `mq3.botlib.aas_entities.info` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities` and `entities`. |
| `entnum` | `dynamic` | — | Entity number in the game or AAS entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L112)

<a id="function-function-mq3-botlib-aas-entities-aas-entitymodelindex-function-aas-entitymodelindex-state-entnum-src-mq3-botlib-aas-entities-ml-1398818938"></a>
### AAS_EntityModelindex

```ml
function AAS_EntityModelindex(state, entnum)
```

Return `info(state,entnum).modelindex` for `AAS_EntityModelindex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities` and `entities`. |
| `entnum` | `dynamic` | — | Entity number in the game or AAS entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L120)

<a id="function-function-mq3-botlib-aas-entities-aas-entitymodelnum-function-aas-entitymodelnum-state-entnum-src-mq3-botlib-aas-entities-ml-650143034"></a>
### AAS_EntityModelNum

```ml
function AAS_EntityModelNum(state, entnum)
```

Return `info(state,entnum).modelindex` for `AAS_EntityModelNum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities` and `entities`. |
| `entnum` | `dynamic` | — | Entity number in the game or AAS entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L128)

<a id="function-function-mq3-botlib-aas-entities-aas-entityorigin-function-aas-entityorigin-state-entnum-src-mq3-botlib-aas-entities-ml-1241279066"></a>
### AAS_EntityOrigin

```ml
function AAS_EntityOrigin(state, entnum)
```

Forward `AAS_EntityOrigin` to `mq3.botlib.aas_entities.vector` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities` and `entities`. |
| `entnum` | `dynamic` | — | Entity number in the game or AAS entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L116)

<a id="function-function-mq3-botlib-aas-entities-aas-entitysize-function-aas-entitysize-state-entnum-src-mq3-botlib-aas-entities-ml-958537090"></a>
### AAS_EntitySize

```ml
function AAS_EntitySize(state, entnum)
```

Apply `mq3.botlib.aas_entities.info` and `mq3.botlib.aas_entities.vector` while evaluating `AAS_EntitySize`. Return paths include `[vector(value.mins),vector(value.maxs)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities` and `entities`. |
| `entnum` | `dynamic` | — | Entity number in the game or AAS entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L140)

<a id="function-function-mq3-botlib-aas-entities-aas-entitytype-function-aas-entitytype-state-entnum-src-mq3-botlib-aas-entities-ml-999019194"></a>
### AAS_EntityType

```ml
function AAS_EntityType(state, entnum)
```

Return `info(state,entnum).type` for `AAS_EntityType`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities` and `entities`. |
| `entnum` | `dynamic` | — | Entity number in the game or AAS entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L124)

<a id="function-function-mq3-botlib-aas-entities-aas-invalidateentities-function-aas-invalidateentities-state-src-mq3-botlib-aas-entities-ml-517835949"></a>
### AAS_InvalidateEntities

```ml
function AAS_InvalidateEntities(state)
```

Update `state.entities[index]`, `state.entities[index].valid` and `state.entities[index].number` during `AAS_InvalidateEntities`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities` and `entities`. May update `state.entities[index]`, `state.entities[index].valid` and `state.entities[index].number` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L152)

<a id="function-function-mq3-botlib-aas-entities-aas-nearestentity-function-aas-nearestentity-state-origin-modelindex-src-mq3-botlib-aas-entities-ml-1036063566"></a>
### AAS_NearestEntity

```ml
function AAS_NearestEntity(state, origin, modelindex)
```

Find the nearest entity with the requested model index inside the original forty-unit horizontal search window.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities` and `entities`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `modelindex` | `dynamic` | — | Value used by `AAS_NearestEntity` in `if value==void or value.modelindex!=modelindex then continue end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L164)

<a id="function-function-mq3-botlib-aas-entities-aas-nextentity-function-aas-nextentity-state-entnum-src-mq3-botlib-aas-entities-ml-1581803626"></a>
### AAS_NextEntity

```ml
function AAS_NextEntity(state, entnum)
```

Scan forward to the next valid entity in an initialized AAS runtime, returning zero when none remains.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `runtime`, `maxEntities` and `entities`. |
| `entnum` | `dynamic` | — | Entity number in the game or AAS entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L179)

<a id="function-function-mq3-botlib-aas-entities-aas-originofmoverwithmodelnum-function-aas-originofmoverwithmodelnum-state-modelnum-src-mq3-botlib-aas-entities-ml-1023323540"></a>
### AAS_OriginOfMoverWithModelNum

```ml
function AAS_OriginOfMoverWithModelNum(state, modelnum)
```

Apply `mq3.botlib.aas_entities.zeros` and `mq3.botlib.aas_entities.vector` while evaluating `AAS_OriginOfMoverWithModelNum`. Return paths include `[false,zeros()]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities` and `entities`. |
| `modelnum` | `dynamic` | — | Value used by `AAS_OriginOfMoverWithModelNum` in `if value!=void and value.type==ET_MOVER and value.modelindex==modelnum then return [true,vector(value.origin)] e...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L132)

<a id="function-function-mq3-botlib-aas-entities-aas-resetentitylinks-function-aas-resetentitylinks-state-src-mq3-botlib-aas-entities-ml-781537781"></a>
### AAS_ResetEntityLinks

```ml
function AAS_ResetEntityLinks(state)
```

Set `state.areaLinks[index]` to `[]` in `mq3.botlib.aas_entities.AAS_ResetEntityLinks`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities` and `areaLinks`. May update `state.areaLinks[index]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L149)

<a id="function-function-mq3-botlib-aas-entities-aas-unlinkinvalidentities-function-aas-unlinkinvalidentities-state-src-mq3-botlib-aas-entities-ml-2120248275"></a>
### AAS_UnlinkInvalidEntities

```ml
function AAS_UnlinkInvalidEntities(state)
```

Apply `mq3.botlib.aas_entities.unlink` while evaluating `AAS_UnlinkInvalidEntities`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities` and `entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L157)

<a id="function-function-mq3-botlib-aas-entities-aas-updateentity-function-aas-updateentity-state-entnum-value-bspbounds-src-mq3-botlib-aas-entities-ml-867841873"></a>
### AAS_UpdateEntity

```ml
function AAS_UpdateEntity(state, entnum, value, bspBounds)
```

Exact be_aas_entity.c ownership surface.  These functions deliberately use the productive State above, so QVM updates and native bot queries observe the same validity, history and area-link records.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities`, `entities`, `frames`, `time` and `runtime` and related fields. May update `state.entities[number]` and `state.areaLinks[number]` in place. |
| `entnum` | `dynamic` | — | Entity number in the game or AAS entity table. |
| `value` | `dynamic` | — | Value record; accesses `mins`, `maxs`, `solid`, `origin` and `angles` and related fields. |
| `bspBounds` | `dynamic` | — | Array or byte sequence accessed at `0` and `1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L108)

<a id="function-function-mq3-botlib-aas-entities-bindruntime-function-bindruntime-state-runtime-src-mq3-botlib-aas-entities-ml-1515742107"></a>
### bindRuntime

```ml
function bindRuntime(state, runtime)
```

Set `state.runtime` to `runtime` in `mq3.botlib.aas_entities.bindRuntime`. Return paths include `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `runtime`. May update `state.runtime` in place. |
| `runtime` | `dynamic` | — | Value used by `bindRuntime` in `if state!=void then state.runtime=runtime end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L43)

- [mq3.botlib.aas_entities.BspData](Type-mq3-botlib-aas-entities-bspdata-210972280.md) — struct
<a id="function-function-mq3-botlib-aas-entities-create-function-create-maxentities-src-mq3-botlib-aas-entities-ml-1792814709"></a>
### create

```ml
function create(maxEntities)
```

Build the `mq3.botlib.aas_entities.State` result for `create`. Return paths include `State(array(maxEntities,void),maxEntities,0.0,0,links,void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxEntities` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_entities.State.maxEntities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L34)

<a id="function-function-mq3-botlib-aas-entities-emptyinfo-function-emptyinfo-src-mq3-botlib-aas-entities-ml-1038105468"></a>
### emptyInfo

```ml
function emptyInfo()
```

Create a `mq3.botlib.aas_entities.EntityInfo` record, initializing `origin` as `zeros()`, `angles` as `zeros()` and `oldOrigin` as `zeros()`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L30)

- [mq3.botlib.aas_entities.EntityInfo](Type-mq3-botlib-aas-entities-entityinfo-384620320.md) — struct
<a id="constant-constant-mq3-botlib-aas-entities-entitynum-world-const-entitynum-world-1022-src-mq3-botlib-aas-entities-ml-139914000"></a>
### ENTITYNUM_WORLD

```ml
const ENTITYNUM_WORLD = 1022
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L12)

- [mq3.botlib.aas_entities.EntityState](Type-mq3-botlib-aas-entities-entitystate-1005246113.md) — struct
<a id="constant-constant-mq3-botlib-aas-entities-et-mover-const-et-mover-4-src-mq3-botlib-aas-entities-ml-1210706893"></a>
### ET_MOVER

```ml
const ET_MOVER = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L11)

<a id="function-function-mq3-botlib-aas-entities-info-function-info-state-number-src-mq3-botlib-aas-entities-ml-182735016"></a>
### info

```ml
function info(state, number)
```

Apply `mq3.botlib.aas_entities.emptyInfo` while evaluating `info`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities` and `entities`. |
| `number` | `dynamic` | — | Value used by `info` in `if state==void or number<0 or number>=state.maxEntities then return emptyInfo() end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L95)

<a id="constant-constant-mq3-botlib-aas-entities-presence-normal-const-presence-normal-2-src-mq3-botlib-aas-entities-ml-1214756979"></a>
### PRESENCE_NORMAL

```ml
const PRESENCE_NORMAL = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L13)

<a id="constant-constant-mq3-botlib-aas-entities-solid-bbox-const-solid-bbox-2-src-mq3-botlib-aas-entities-ml-804270667"></a>
### SOLID_BBOX

```ml
const SOLID_BBOX = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L10)

<a id="constant-constant-mq3-botlib-aas-entities-solid-bsp-const-solid-bsp-3-src-mq3-botlib-aas-entities-ml-1677679586"></a>
### SOLID_BSP

```ml
const SOLID_BSP = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L9)

<a id="function-function-mq3-botlib-aas-entities-startframe-function-startframe-state-time-src-mq3-botlib-aas-entities-ml-1866880860"></a>
### startFrame

```ml
function startFrame(state, time)
```

Update `state.time`, `state.frames` and `state.entities[index].valid` during `startFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `time`, `frames` and `entities`. May update `state.time`, `state.frames` and `state.entities[index].valid` in place. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L52)

- [mq3.botlib.aas_entities.State](Type-mq3-botlib-aas-entities-state-761540788.md) — struct
<a id="function-function-mq3-botlib-aas-entities-unlink-function-unlink-state-number-src-mq3-botlib-aas-entities-ml-1189623696"></a>
### unlink

```ml
function unlink(state, number)
```

Set `state.areaLinks[number]` to `[]` in `mq3.botlib.aas_entities.unlink`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities` and `areaLinks`. May update `state.areaLinks[number]` in place. |
| `number` | `dynamic` | — | Value used by `unlink` in `if state!=void and number>=0 and number<state.maxEntities and len(state.areaLinks[number])>0 then state.areaLink...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L47)

<a id="function-function-mq3-botlib-aas-entities-update-function-update-state-number-value-bspbounds-src-mq3-botlib-aas-entities-ml-430629615"></a>
### update

```ml
function update(state, number, value, bspBounds)
```

Set `state.entities[number]` to `info` and `state.areaLinks[number]` to `aasRuntime.bboxAreas(state.runtime,absmins,absmaxs,128)` in `mq3.botlib.aas_entities.update`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS entities state; accesses `maxEntities`, `entities`, `frames`, `time` and `runtime` and related fields. May update `state.entities[number]` and `state.areaLinks[number]` in place. |
| `number` | `dynamic` | — | Value used by `unlink` in `if state!=void and number>=0 and number<state.maxEntities and len(state.areaLinks[number])>0 then state.areaLink...`. |
| `value` | `dynamic` | — | Value record; accesses `mins`, `maxs`, `solid`, `origin` and `angles` and related fields. |
| `bspBounds` | `dynamic` | — | Array or byte sequence accessed at `0` and `1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L67)

<a id="function-function-mq3-botlib-aas-entities-vector-function-vector-value-src-mq3-botlib-aas-entities-ml-2129282001"></a>
### vector

```ml
function vector(value)
```

Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for aas entities.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L26)

<a id="function-function-mq3-botlib-aas-entities-zeros-function-zeros-src-mq3-botlib-aas-entities-ml-265422364"></a>
### zeros

```ml
function zeros()
```

Return a new array `[0.0,0.0,0.0]` for `zeros`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L28)
