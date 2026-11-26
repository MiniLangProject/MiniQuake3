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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entnum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L104)

<a id="function-function-mq3-botlib-aas-entities-aas-entitybspdata-function-aas-entitybspdata-state-entnum-src-mq3-botlib-aas-entities-ml-603940314"></a>
### AAS_EntityBSPData

```ml
function AAS_EntityBSPData(state, entnum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entnum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L89)

<a id="function-function-mq3-botlib-aas-entities-aas-entityinfo-function-aas-entityinfo-state-entnum-src-mq3-botlib-aas-entities-ml-653752022"></a>
### AAS_EntityInfo

```ml
function AAS_EntityInfo(state, entnum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entnum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L78)

<a id="function-function-mq3-botlib-aas-entities-aas-entitymodelindex-function-aas-entitymodelindex-state-entnum-src-mq3-botlib-aas-entities-ml-1398818938"></a>
### AAS_EntityModelindex

```ml
function AAS_EntityModelindex(state, entnum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entnum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L80)

<a id="function-function-mq3-botlib-aas-entities-aas-entitymodelnum-function-aas-entitymodelnum-state-entnum-src-mq3-botlib-aas-entities-ml-650143034"></a>
### AAS_EntityModelNum

```ml
function AAS_EntityModelNum(state, entnum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entnum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L82)

<a id="function-function-mq3-botlib-aas-entities-aas-entityorigin-function-aas-entityorigin-state-entnum-src-mq3-botlib-aas-entities-ml-1241279066"></a>
### AAS_EntityOrigin

```ml
function AAS_EntityOrigin(state, entnum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entnum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L79)

<a id="function-function-mq3-botlib-aas-entities-aas-entitysize-function-aas-entitysize-state-entnum-src-mq3-botlib-aas-entities-ml-958537090"></a>
### AAS_EntitySize

```ml
function AAS_EntitySize(state, entnum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entnum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L88)

<a id="function-function-mq3-botlib-aas-entities-aas-entitytype-function-aas-entitytype-state-entnum-src-mq3-botlib-aas-entities-ml-999019194"></a>
### AAS_EntityType

```ml
function AAS_EntityType(state, entnum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entnum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L81)

<a id="function-function-mq3-botlib-aas-entities-aas-invalidateentities-function-aas-invalidateentities-state-src-mq3-botlib-aas-entities-ml-517835949"></a>
### AAS_InvalidateEntities

```ml
function AAS_InvalidateEntities(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L93)

<a id="function-function-mq3-botlib-aas-entities-aas-nearestentity-function-aas-nearestentity-state-origin-modelindex-src-mq3-botlib-aas-entities-ml-1036063566"></a>
### AAS_NearestEntity

```ml
function AAS_NearestEntity(state, origin, modelindex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `modelindex` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L99)

<a id="function-function-mq3-botlib-aas-entities-aas-nextentity-function-aas-nextentity-state-entnum-src-mq3-botlib-aas-entities-ml-1581803626"></a>
### AAS_NextEntity

```ml
function AAS_NextEntity(state, entnum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entnum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L108)

<a id="function-function-mq3-botlib-aas-entities-aas-originofmoverwithmodelnum-function-aas-originofmoverwithmodelnum-state-modelnum-src-mq3-botlib-aas-entities-ml-1023323540"></a>
### AAS_OriginOfMoverWithModelNum

```ml
function AAS_OriginOfMoverWithModelNum(state, modelnum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `modelnum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L83)

<a id="function-function-mq3-botlib-aas-entities-aas-resetentitylinks-function-aas-resetentitylinks-state-src-mq3-botlib-aas-entities-ml-781537781"></a>
### AAS_ResetEntityLinks

```ml
function AAS_ResetEntityLinks(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L92)

<a id="function-function-mq3-botlib-aas-entities-aas-unlinkinvalidentities-function-aas-unlinkinvalidentities-state-src-mq3-botlib-aas-entities-ml-2120248275"></a>
### AAS_UnlinkInvalidEntities

```ml
function AAS_UnlinkInvalidEntities(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L96)

<a id="function-function-mq3-botlib-aas-entities-aas-updateentity-function-aas-updateentity-state-entnum-value-bspbounds-src-mq3-botlib-aas-entities-ml-867841873"></a>
### AAS_UpdateEntity

```ml
function AAS_UpdateEntity(state, entnum, value, bspBounds)
```

Exact be_aas_entity.c ownership surface.  These functions deliberately use the productive State above, so QVM updates and native bot queries observe the same validity, history and area-link records.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entnum` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `bspBounds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L77)

<a id="function-function-mq3-botlib-aas-entities-bindruntime-function-bindruntime-state-runtime-src-mq3-botlib-aas-entities-ml-1515742107"></a>
### bindRuntime

```ml
function bindRuntime(state, runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L30)

- [mq3.botlib.aas_entities.BspData](Type-mq3-botlib-aas-entities-bspdata-210972280.md) — struct
<a id="function-function-mq3-botlib-aas-entities-create-function-create-maxentities-src-mq3-botlib-aas-entities-ml-1792814709"></a>
### create

```ml
function create(maxEntities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxEntities` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L24)

<a id="function-function-mq3-botlib-aas-entities-emptyinfo-function-emptyinfo-src-mq3-botlib-aas-entities-ml-1038105468"></a>
### emptyInfo

```ml
function emptyInfo()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L22)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L68)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L33)

- [mq3.botlib.aas_entities.State](Type-mq3-botlib-aas-entities-state-761540788.md) — struct
<a id="function-function-mq3-botlib-aas-entities-unlink-function-unlink-state-number-src-mq3-botlib-aas-entities-ml-1189623696"></a>
### unlink

```ml
function unlink(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L31)

<a id="function-function-mq3-botlib-aas-entities-update-function-update-state-number-value-bspbounds-src-mq3-botlib-aas-entities-ml-430629615"></a>
### update

```ml
function update(state, number, value, bspBounds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `bspBounds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L43)

<a id="function-function-mq3-botlib-aas-entities-vector-function-vector-value-src-mq3-botlib-aas-entities-ml-2129282001"></a>
### vector

```ml
function vector(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L20)

<a id="function-function-mq3-botlib-aas-entities-zeros-function-zeros-src-mq3-botlib-aas-entities-ml-265422364"></a>
### zeros

```ml
function zeros()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L21)
