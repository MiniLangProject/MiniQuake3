# `src/mq3/client/cgame_ents.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_ents`](Package-mq3-client-cgame-ents-324167691.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `crt` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/game/trajectory.ml` as `trajectory` → [src/mq3/game/trajectory.ml](File-src-mq3-game-trajectory-ml-1278285327.md)
- `mq3/renderer/model_tags.ml` as `modelTags` → [src/mq3/renderer/model_tags.ml](File-src-mq3-renderer-model-tags-ml-707870696.md)
- `mq3/renderer/player_model_assembly.ml` as `assembly` → [src/mq3/renderer/player_model_assembly.ml](File-src-mq3-renderer-player-model-assembly-ml-170504265.md)
- `mq3/shared/bytedirs.ml` as `bytedirs` → [src/mq3/shared/bytedirs.ml](File-src-mq3-shared-bytedirs-ml-1818459093.md)
- `mq3/shared/directions.ml` as `directions` → [src/mq3/shared/directions.ml](File-src-mq3-shared-directions-ml-575237557.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-client-cgame-ents-add3-function-add3-first-second-src-mq3-client-cgame-ents-ml-1961806770"></a>
### add3

```ml
function add3(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L46)

<a id="function-function-mq3-client-cgame-ents-addcentity-function-addcentity-state-value-predicted-retailactive-src-mq3-client-cgame-ents-ml-413068543"></a>
### addCEntity

```ml
function addCEntity(state, value, predicted, retailActive)
```

CG_AddCEntity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `predicted` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L193)

<a id="function-function-mq3-client-cgame-ents-addpacketentities-function-addpacketentities-state-snap-nextsnap-predictedentity-retailactive-src-mq3-client-cgame-ents-ml-1840632352"></a>
### addPacketEntities

```ml
function addPacketEntities(state, snap, nextSnap, predictedEntity, retailActive)
```

CG_AddPacketEntities.  Snapshot entities are observed through private Cent records.  Boundary decisions are therefore read-only with respect to the VM.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `snap` | `dynamic` | — |  |
| `nextSnap` | `dynamic` | — |  |
| `predictedEntity` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L217)

<a id="function-function-mq3-client-cgame-ents-adjustpositionformover-function-adjustpositionformover-input-movervalue-fromtime-totime-src-mq3-client-cgame-ents-ml-2130914375"></a>
### adjustPositionForMover

```ml
function adjustPositionForMover(input, moverValue, fromTime, toTime)
```

CG_AdjustPositionForMover

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `moverValue` | `dynamic` | — |  |
| `fromTime` | `dynamic` | — |  |
| `toTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L165)

<a id="function-function-mq3-client-cgame-ents-audio-function-audio-state-kind-entity-origin-velocity-sound-emit-src-mq3-client-cgame-ents-ml-1588939537"></a>
### audio

```ml
function audio(state, kind, entity, origin, velocity, sound, emit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L64)

<a id="function-function-mq3-client-cgame-ents-beam-function-beam-state-value-emit-src-mq3-client-cgame-ents-ml-54085931"></a>
### beam

```ml
function beam(state, value, emit)
```

CG_Beam

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L155)

<a id="function-function-mq3-client-cgame-ents-boundary-function-boundary-state-boundaryname-kind-entity-origin-velocity-rendervalue-sound-value-emit-src-mq3-client-cgame-ents-ml-1589954536"></a>
### boundary

```ml
function boundary(state, boundaryName, kind, entity, origin, velocity, renderValue, sound, value, emit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundaryName` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `renderValue` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L57)

- [mq3.client.cgame_ents.Boundary](Type-mq3-client-cgame-ents-boundary-288664833.md) — struct
<a id="function-function-mq3-client-cgame-ents-calcentitylerppositions-function-calcentitylerppositions-state-value-predicted-src-mq3-client-cgame-ents-ml-1018692588"></a>
### calcEntityLerpPositions

```ml
function calcEntityLerpPositions(state, value, predicted)
```

CG_CalcEntityLerpPositions

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `predicted` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L180)

<a id="function-function-mq3-client-cgame-ents-cent-function-cent-source-src-mq3-client-cgame-ents-ml-693192503"></a>
### cent

```ml
function cent(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L51)

- [mq3.client.cgame_ents.Cent](Type-mq3-client-cgame-ents-cent-1686050009.md) — struct
<a id="constant-constant-mq3-client-cgame-ents-chan-item-const-chan-item-3-src-mq3-client-cgame-ents-ml-2043186250"></a>
### CHAN_ITEM

```ml
const CHAN_ITEM = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L34)

<a id="function-function-mq3-client-cgame-ents-clearboundaries-function-clearboundaries-state-src-mq3-client-cgame-ents-ml-152248115"></a>
### clearBoundaries

```ml
function clearBoundaries(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L225)

<a id="function-function-mq3-client-cgame-ents-copy3-function-copy3-value-src-mq3-client-cgame-ents-ml-1002658789"></a>
### copy3

```ml
function copy3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L45)

<a id="function-function-mq3-client-cgame-ents-create-function-create-maxentities-src-mq3-client-cgame-ents-ml-1243534461"></a>
### create

```ml
function create(maxEntities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxEntities` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L54)

<a id="function-function-mq3-client-cgame-ents-directionaxis-function-directionaxis-direction-spin-src-mq3-client-cgame-ents-ml-21017057"></a>
### directionAxis

```ml
function directionAxis(direction, spin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `direction` | `dynamic` | — |  |
| `spin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L128)

<a id="constant-constant-mq3-client-cgame-ents-ef-nodraw-const-ef-nodraw-128-src-mq3-client-cgame-ents-ml-602685758"></a>
### EF_NODRAW

```ml
const EF_NODRAW = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L23)

<a id="function-function-mq3-client-cgame-ents-ensurecent-function-ensurecent-state-source-src-mq3-client-cgame-ents-ml-1866124772"></a>
### ensureCent

```ml
function ensureCent(state, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L211)

<a id="function-function-mq3-client-cgame-ents-entityeffects-function-entityeffects-state-value-emit-src-mq3-client-cgame-ents-ml-2090073313"></a>
### entityEffects

```ml
function entityEffects(state, value, emit)
```

CG_EntityEffects

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L89)

<a id="constant-constant-mq3-client-cgame-ents-entitynum-max-normal-const-entitynum-max-normal-1022-src-mq3-client-cgame-ents-ml-985200602"></a>
### ENTITYNUM_MAX_NORMAL

```ml
const ENTITYNUM_MAX_NORMAL = 1022
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L21)

<a id="function-function-mq3-client-cgame-ents-general-function-general-state-value-emit-src-mq3-client-cgame-ents-ml-605395251"></a>
### general

```ml
function general(state, value, emit)
```

CG_General

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L99)

<a id="function-function-mq3-client-cgame-ents-grapple-function-grapple-state-value-emit-src-mq3-client-cgame-ents-ml-2083297133"></a>
### grapple

```ml
function grapple(state, value, emit)
```

CG_Grapple

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L145)

<a id="constant-constant-mq3-client-cgame-ents-gt-ctf-const-gt-ctf-4-src-mq3-client-cgame-ents-ml-711826061"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L31)

<a id="function-function-mq3-client-cgame-ents-identityaxis-function-identityaxis-src-mq3-client-cgame-ents-ml-581483566"></a>
### identityAxis

```ml
function identityAxis()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L44)

<a id="function-function-mq3-client-cgame-ents-interpolateentityposition-function-interpolateentityposition-value-snaptime-nextsnaptime-fraction-src-mq3-client-cgame-ents-ml-1909276544"></a>
### interpolateEntityPosition

```ml
function interpolateEntityPosition(value, snapTime, nextSnapTime, fraction)
```

CG_InterpolateEntityPosition

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `snapTime` | `dynamic` | — |  |
| `nextSnapTime` | `dynamic` | — |  |
| `fraction` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L171)

<a id="function-function-mq3-client-cgame-ents-item-function-item-state-value-emit-src-mq3-client-cgame-ents-ml-434133103"></a>
### item

```ml
function item(state, value, emit)
```

CG_Item

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L113)

<a id="constant-constant-mq3-client-cgame-ents-item-scaleup-time-const-item-scaleup-time-1000-src-mq3-client-cgame-ents-ml-841356256"></a>
### ITEM_SCALEUP_TIME

```ml
const ITEM_SCALEUP_TIME = 1000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L22)

<a id="constant-constant-mq3-client-cgame-ents-max-clients-const-max-clients-64-src-mq3-client-cgame-ents-ml-1665980873"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L20)

<a id="function-function-mq3-client-cgame-ents-missile-function-missile-state-value-emit-src-mq3-client-cgame-ents-ml-1225137579"></a>
### missile

```ml
function missile(state, value, emit)
```

CG_Missile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L134)

<a id="function-function-mq3-client-cgame-ents-mover-function-mover-state-value-emit-src-mq3-client-cgame-ents-ml-1218246397"></a>
### mover

```ml
function mover(state, value, emit)
```

CG_Mover

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L150)

<a id="function-function-mq3-client-cgame-ents-portal-function-portal-state-value-emit-src-mq3-client-cgame-ents-ml-1604856411"></a>
### portal

```ml
function portal(state, value, emit)
```

CG_Portal

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L160)

<a id="function-function-mq3-client-cgame-ents-positionentityontag-function-positionentityontag-entity-parent-model-name-src-mq3-client-cgame-ents-ml-1726209933"></a>
### positionEntityOnTag

```ml
function positionEntityOnTag(entity, parent, model, name)
```

CG_PositionEntityOnTag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — |  |
| `parent` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L67)

<a id="function-function-mq3-client-cgame-ents-positionrotatedentityontag-function-positionrotatedentityontag-entity-parent-model-name-src-mq3-client-cgame-ents-ml-1685792527"></a>
### positionRotatedEntityOnTag

```ml
function positionRotatedEntityOnTag(entity, parent, model, name)
```

CG_PositionRotatedEntityOnTag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — |  |
| `parent` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L75)

<a id="function-function-mq3-client-cgame-ents-renderentity-function-renderentity-src-mq3-client-cgame-ents-ml-984449182"></a>
### renderEntity

```ml
function renderEntity()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L48)

- [mq3.client.cgame_ents.RenderEntity](Type-mq3-client-cgame-ents-renderentity-580160012.md) — struct
<a id="constant-constant-mq3-client-cgame-ents-rf-minlight-const-rf-minlight-1-src-mq3-client-cgame-ents-ml-875634624"></a>
### RF_MINLIGHT

```ml
const RF_MINLIGHT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L25)

<a id="constant-constant-mq3-client-cgame-ents-rf-noshadow-const-rf-noshadow-64-src-mq3-client-cgame-ents-ml-1261167025"></a>
### RF_NOSHADOW

```ml
const RF_NOSHADOW = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L26)

<a id="constant-constant-mq3-client-cgame-ents-rf-third-person-const-rf-third-person-2-src-mq3-client-cgame-ents-ml-232339451"></a>
### RF_THIRD_PERSON

```ml
const RF_THIRD_PERSON = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L24)

<a id="constant-constant-mq3-client-cgame-ents-rt-beam-const-rt-beam-4-src-mq3-client-cgame-ents-ml-1568151933"></a>
### RT_BEAM

```ml
const RT_BEAM = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L29)

<a id="constant-constant-mq3-client-cgame-ents-rt-model-const-rt-model-0-src-mq3-client-cgame-ents-ml-1427133711"></a>
### RT_MODEL

```ml
const RT_MODEL = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L27)

<a id="constant-constant-mq3-client-cgame-ents-rt-portalsurface-const-rt-portalsurface-6-src-mq3-client-cgame-ents-ml-1941114705"></a>
### RT_PORTALSURFACE

```ml
const RT_PORTALSURFACE = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L30)

<a id="constant-constant-mq3-client-cgame-ents-rt-sprite-const-rt-sprite-2-src-mq3-client-cgame-ents-ml-405228643"></a>
### RT_SPRITE

```ml
const RT_SPRITE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L28)

<a id="function-function-mq3-client-cgame-ents-scene-function-scene-state-kind-entity-value-emit-src-mq3-client-cgame-ents-ml-929790700"></a>
### scene

```ml
function scene(state, kind, entity, value, emit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L63)

<a id="function-function-mq3-client-cgame-ents-setentitysoundposition-function-setentitysoundposition-state-value-emit-src-mq3-client-cgame-ents-ml-1746493795"></a>
### setEntitySoundPosition

```ml
function setEntitySoundPosition(state, value, emit)
```

CG_SetEntitySoundPosition

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L82)

- [mq3.client.cgame_ents.Snapshot](Type-mq3-client-cgame-ents-snapshot-985388967.md) — struct
<a id="constant-constant-mq3-client-cgame-ents-solid-bmodel-const-solid-bmodel-16777215-src-mq3-client-cgame-ents-ml-980191329"></a>
### SOLID_BMODEL

```ml
const SOLID_BMODEL = 16777215
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L19)

<a id="function-function-mq3-client-cgame-ents-speaker-function-speaker-state-value-emit-src-mq3-client-cgame-ents-ml-1514678849"></a>
### speaker

```ml
function speaker(state, value, emit)
```

CG_Speaker

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L104)

- [mq3.client.cgame_ents.State](Type-mq3-client-cgame-ents-state-1099874224.md) — struct
<a id="function-function-mq3-client-cgame-ents-sub3-function-sub3-first-second-src-mq3-client-cgame-ents-ml-1384735286"></a>
### sub3

```ml
function sub3(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L47)

<a id="constant-constant-mq3-client-cgame-ents-team-blue-const-team-blue-2-src-mq3-client-cgame-ents-ml-1022799807"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L33)

<a id="constant-constant-mq3-client-cgame-ents-team-red-const-team-red-1-src-mq3-client-cgame-ents-ml-1858262844"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L32)

<a id="function-function-mq3-client-cgame-ents-teambase-function-teambase-state-value-emit-src-mq3-client-cgame-ents-ml-687795847"></a>
### teamBase

```ml
function teamBase(state, value, emit)
```

CG_TeamBase (baseq3 branch)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L188)

<a id="function-function-mq3-client-cgame-ents-weaponmidpoint-function-weaponmidpoint-state-weapon-src-mq3-client-cgame-ents-ml-1749170565"></a>
### weaponMidpoint

```ml
function weaponMidpoint(state, weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L108)

<a id="constant-constant-mq3-client-cgame-ents-wp-num-weapons-const-wp-num-weapons-11-src-mq3-client-cgame-ents-ml-1663284551"></a>
### WP_NUM_WEAPONS

```ml
const WP_NUM_WEAPONS = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L36)

<a id="constant-constant-mq3-client-cgame-ents-wp-plasmagun-const-wp-plasmagun-8-src-mq3-client-cgame-ents-ml-402349111"></a>
### WP_PLASMAGUN

```ml
const WP_PLASMAGUN = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L35)
