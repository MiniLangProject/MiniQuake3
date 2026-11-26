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

Builds the client game ents `add3` sequence from `[n.fadd(first[0],second[0]),n.fadd(first[1],second[1]),n.fadd(first[2],second[2])]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Sequence read at `first[0]`, `first[1]`, `first[2]`. |
| `second` | `dynamic` | — | Sequence read at `second[0]`, `second[1]`, `second[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L214)

<a id="function-function-mq3-client-cgame-ents-addcentity-function-addcentity-state-value-predicted-retailactive-src-mq3-client-cgame-ents-ml-413068543"></a>
### addCEntity

```ml
function addCEntity(state, value, predicted, retailActive)
```

CG_AddCEntity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game ents record/storage; this routine assigns `state.errors`. |
| `value` | `dynamic` | — | Record read through `value.currentState`, `value.lerpOrigin`. |
| `predicted` | `dynamic` | — | Value used by `calculated=calcEntityLerpPositions(state,value,predicted)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L456)

<a id="function-function-mq3-client-cgame-ents-addpacketentities-function-addpacketentities-state-snap-nextsnap-predictedentity-retailactive-src-mq3-client-cgame-ents-ml-1840632352"></a>
### addPacketEntities

```ml
function addPacketEntities(state, snap, nextSnap, predictedEntity, retailActive)
```

CG_AddPacketEntities.  Snapshot entities are observed through private Cent records.  Boundary decisions are therefore read-only with respect to the VM.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game ents record/storage; this routine assigns `state.snap`, `state.nextSnap`, `state.localClient`, `state.predictedEntity` and additional values. |
| `snap` | `dynamic` | — | Record read through `snap.playerState.clientNum`, `snap.serverTime`, `snap.entities`. |
| `nextSnap` | `dynamic` | — | Record read through `nextSnap.serverTime`, `nextSnap.entities`. |
| `predictedEntity` | `dynamic` | — | Value assigned to `state.predictedEntity`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L488)

<a id="function-function-mq3-client-cgame-ents-adjustpositionformover-function-adjustpositionformover-input-movervalue-fromtime-totime-src-mq3-client-cgame-ents-ml-2130914375"></a>
### adjustPositionForMover

```ml
function adjustPositionForMover(input, moverValue, fromTime, toTime)
```

CG_AdjustPositionForMover

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Value used by `if moverValue==void or moverValue.currentState.number<=0 or moverValue.currentState.number>=ENTITYNUM_MAX_NORMAL or moverValue.currentState.eT...`. |
| `moverValue` | `dynamic` | — | Record read through `moverValue.currentState.number`, `moverValue.currentState.eType`, `moverValue.currentState.pos`. |
| `fromTime` | `dynamic` | — | Value used by `oldOrigin=trajectory.evaluate(moverValue.currentState.pos,fromTime)`. |
| `toTime` | `dynamic` | — | Value used by `origin=trajectory.evaluate(moverValue.currentState.pos,toTime)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L414)

<a id="function-function-mq3-client-cgame-ents-audio-function-audio-state-kind-entity-origin-velocity-sound-emit-src-mq3-client-cgame-ents-ml-1588939537"></a>
### audio

```ml
function audio(state, kind, entity, origin, velocity, sound, emit)
```

Adapts `mq3.client.cgame_ents.boundary` to client game ents `audio`, returning its result for `state, "audio", kind, entity, origin, velocity, void, sound, 0, emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_ents.boundary`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_ents.boundary`. |
| `entity` | `dynamic` | — | Argument 4 of `mq3.client.cgame_ents.boundary`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_ents.boundary`. |
| `velocity` | `dynamic` | — | Velocity vector used to advance or orient the effect. Forwarded to `mq3.client.cgame_ents.boundary`. |
| `sound` | `dynamic` | — | Argument 8 of `mq3.client.cgame_ents.boundary`. |
| `emit` | `dynamic` | — | Argument 10 of `mq3.client.cgame_ents.boundary`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L265)

<a id="function-function-mq3-client-cgame-ents-beam-function-beam-state-value-emit-src-mq3-client-cgame-ents-ml-54085931"></a>
### beam

```ml
function beam(state, value, emit)
```

CG_Beam

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game ents state passed to the helper calls in `beam`. |
| `value` | `dynamic` | — | Record read through `value.currentState`. |
| `emit` | `dynamic` | — | Value used by `scene(state,"beam",es.number,ent,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L397)

<a id="function-function-mq3-client-cgame-ents-boundary-function-boundary-state-boundaryname-kind-entity-origin-velocity-rendervalue-sound-value-emit-src-mq3-client-cgame-ents-ml-1589954536"></a>
### boundary

```ml
function boundary(state, boundaryName, kind, entity, origin, velocity, renderValue, sound, value, emit)
```

Updates `state.actions`, `state.scene`, `state.audio`, `state.soundPositions` and additional values during client game ents `boundary`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game ents record/storage; this routine assigns `state.actions`, `state.scene`, `state.audio`, `state.soundPositions` and additional values. |
| `boundaryName` | `dynamic` | — | Value used by `item=Boundary(boundaryName,kind,entity,copy3(origin),copy3(velocity),renderValue,sound,value,emit)`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `entity` | `dynamic` | — | Value used by `item=Boundary(boundaryName,kind,entity,copy3(origin),copy3(velocity),renderValue,sound,value,emit)`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `velocity` | `dynamic` | — | Velocity vector used to advance or orient the effect. |
| `renderValue` | `dynamic` | — | Value used by `item=Boundary(boundaryName,kind,entity,copy3(origin),copy3(velocity),renderValue,sound,value,emit)`. |
| `sound` | `dynamic` | — | Sound handle or asset name passed to the audio action. |
| `value` | `dynamic` | — | Value used by `item=Boundary(boundaryName,kind,entity,copy3(origin),copy3(velocity),renderValue,sound,value,emit)`. |
| `emit` | `dynamic` | — | Value used by `item=Boundary(boundaryName,kind,entity,copy3(origin),copy3(velocity),renderValue,sound,value,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L244)

- [mq3.client.cgame_ents.Boundary](Type-mq3-client-cgame-ents-boundary-288664833.md) — struct
<a id="function-function-mq3-client-cgame-ents-calcentitylerppositions-function-calcentitylerppositions-state-value-predicted-src-mq3-client-cgame-ents-ml-1018692588"></a>
### calcEntityLerpPositions

```ml
function calcEntityLerpPositions(state, value, predicted)
```

CG_CalcEntityLerpPositions

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.smoothClients`, `state.nextSnap`, `state.snap.serverTime`, `state.nextSnap.serverTime` and additional values. |
| `value` | `dynamic` | — | Mutable client game ents record/storage; this routine assigns `value.nextState.pos.trType`, `value.lerpOrigin`, `value.lerpAngles`. |
| `predicted` | `dynamic` | — | Value used by `if not predicted and es.groundEntityNum>0 and es.groundEntityNum<len(state.entities) then adjusted=adjustPositionForMover(value.lerpOrigin,sta...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L436)

<a id="function-function-mq3-client-cgame-ents-cent-function-cent-source-src-mq3-client-cgame-ents-ml-693192503"></a>
### cent

```ml
function cent(source)
```

Creates a `mq3.client.cgame_ents.Cent` record. Assigns `currentState` from `source`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record read through `source.origin`, `source.angles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L225)

- [mq3.client.cgame_ents.Cent](Type-mq3-client-cgame-ents-cent-1686050009.md) — struct
<a id="constant-constant-mq3-client-cgame-ents-chan-item-const-chan-item-3-src-mq3-client-cgame-ents-ml-2043186250"></a>
### CHAN_ITEM

```ml
const CHAN_ITEM = 3
```

Sound channel used for item-related sounds associated with an entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L52)

<a id="function-function-mq3-client-cgame-ents-clearboundaries-function-clearboundaries-state-src-mq3-client-cgame-ents-ml-152248115"></a>
### clearBoundaries

```ml
function clearBoundaries(state)
```

Updates `state.actions`, `state.scene`, `state.audio`, `state.soundPositions` during client game ents `clearBoundaries`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game ents record/storage; this routine assigns `state.actions`, `state.scene`, `state.audio`, `state.soundPositions`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L498)

<a id="function-function-mq3-client-cgame-ents-copy3-function-copy3-value-src-mq3-client-cgame-ents-ml-1002658789"></a>
### copy3

```ml
function copy3(value)
```

Copies the X, Y and Z components into a fresh client game ents vector.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[0]`, `value[1]`, `value[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L210)

<a id="function-function-mq3-client-cgame-ents-create-function-create-maxentities-src-mq3-client-cgame-ents-ml-1243534461"></a>
### create

```ml
function create(maxEntities)
```

Creates a `mq3.client.cgame_ents.State` record.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxEntities` | `dynamic` | — | Value used to initialize `State.entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L230)

<a id="function-function-mq3-client-cgame-ents-directionaxis-function-directionaxis-direction-spin-src-mq3-client-cgame-ents-ml-21017057"></a>
### directionAxis

```ml
function directionAxis(direction, spin)
```

Calls `mq3.shared.math.VectorNormalize2`, `mq3.shared.math.VectorLength`, `mq3.shared.directions.perpendicular` and additional helpers from client game ents `directionAxis`. The final path returns `axis`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. |
| `spin` | `dynamic` | — | Value used by `if spin!=0 then roll=q.AngleVectors([0.0,0.0,spin])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L358)

<a id="constant-constant-mq3-client-cgame-ents-ef-nodraw-const-ef-nodraw-128-src-mq3-client-cgame-ents-ml-602685758"></a>
### EF_NODRAW

```ml
const EF_NODRAW = 128
```

Entity-state flag selecting nodraw behavior in client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L28)

<a id="function-function-mq3-client-cgame-ents-ensurecent-function-ensurecent-state-source-src-mq3-client-cgame-ents-ml-1866124772"></a>
### ensureCent

```ml
function ensureCent(state, source)
```

Updates `state.entities[source.number]`, `state.entities[source.number].currentState` during client game ents `ensureCent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game ents record/storage; this routine assigns `state.entities[source.number]`, `state.entities[source.number].currentState`. |
| `source` | `dynamic` | — | Record read through `source.number`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L477)

<a id="function-function-mq3-client-cgame-ents-entityeffects-function-entityeffects-state-value-emit-src-mq3-client-cgame-ents-ml-2090073313"></a>
### entityEffects

```ml
function entityEffects(state, value, emit)
```

CG_EntityEffects

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game ents state passed to the helper calls in `entityEffects`. |
| `value` | `dynamic` | — | Record read through `value.currentState`, `value.lerpOrigin`. |
| `emit` | `dynamic` | — | Value used by `setEntitySoundPosition(state,value,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L304)

<a id="constant-constant-mq3-client-cgame-ents-entitynum-max-normal-const-entitynum-max-normal-1022-src-mq3-client-cgame-ents-ml-985200602"></a>
### ENTITYNUM_MAX_NORMAL

```ml
const ENTITYNUM_MAX_NORMAL = 1022
```

Highest range bound reserved for ordinary entities before protocol sentinel values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L24)

<a id="function-function-mq3-client-cgame-ents-general-function-general-state-value-emit-src-mq3-client-cgame-ents-ml-605395251"></a>
### general

```ml
function general(state, value, emit)
```

CG_General

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.localClient`. |
| `value` | `dynamic` | — | Record read through `value.currentState`, `value.lerpOrigin`, `value.lerpAngles`. |
| `emit` | `dynamic` | — | Value used by `return scene(state,"general",es.number,ent,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L317)

<a id="function-function-mq3-client-cgame-ents-grapple-function-grapple-state-value-emit-src-mq3-client-cgame-ents-ml-2083297133"></a>
### grapple

```ml
function grapple(state, value, emit)
```

CG_Grapple

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `value` | `dynamic` | — | Mutable client game ents record/storage; this routine assigns `value.lerpAngles`. |
| `emit` | `dynamic` | — | Value used by `scene(state,"grapple-trail",es.number,trail,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L381)

<a id="constant-constant-mq3-client-cgame-ents-gt-ctf-const-gt-ctf-4-src-mq3-client-cgame-ents-ml-711826061"></a>
### GT_CTF

```ml
const GT_CTF = 4
```

Native game-type value for capture the flag, used when selecting flag and item presentation for snapshot entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L46)

<a id="function-function-mq3-client-cgame-ents-identityaxis-function-identityaxis-src-mq3-client-cgame-ents-ml-581483566"></a>
### identityAxis

```ml
function identityAxis()
```

Creates the three orthonormal unit axes used as the identity orientation in client game ents.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L207)

<a id="function-function-mq3-client-cgame-ents-interpolateentityposition-function-interpolateentityposition-value-snaptime-nextsnaptime-fraction-src-mq3-client-cgame-ents-ml-1909276544"></a>
### interpolateEntityPosition

```ml
function interpolateEntityPosition(value, snapTime, nextSnapTime, fraction)
```

CG_InterpolateEntityPosition

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable client game ents record/storage; this routine assigns `value.lerpOrigin`, `value.lerpAngles`. |
| `snapTime` | `dynamic` | — | Value used by `current=trajectory.evaluate(value.currentState.pos,snapTime)`. |
| `nextSnapTime` | `dynamic` | — | Value used by `next=trajectory.evaluate(value.nextState.pos,nextSnapTime)`. |
| `fraction` | `dynamic` | — | Interpolation or blend fraction between the endpoint values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L424)

<a id="function-function-mq3-client-cgame-ents-item-function-item-state-value-emit-src-mq3-client-cgame-ents-ml-434133103"></a>
### item

```ml
function item(state, value, emit)
```

CG_Item

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.simpleItems`, `state.time`. |
| `value` | `dynamic` | — | Mutable client game ents record/storage; this routine assigns `value.lerpAngles`. |
| `emit` | `dynamic` | — | Value used by `return scene(state,"item-sprite",es.number,ent,emit) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L340)

<a id="constant-constant-mq3-client-cgame-ents-item-scaleup-time-const-item-scaleup-time-1000-src-mq3-client-cgame-ents-ml-841356256"></a>
### ITEM_SCALEUP_TIME

```ml
const ITEM_SCALEUP_TIME = 1000
```

Duration in milliseconds of the item-pickup scale animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L26)

<a id="constant-constant-mq3-client-cgame-ents-max-clients-const-max-clients-64-src-mq3-client-cgame-ents-ml-1665980873"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```

Capacity limit for the clients collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L22)

<a id="function-function-mq3-client-cgame-ents-missile-function-missile-state-value-emit-src-mq3-client-cgame-ents-ml-1225137579"></a>
### missile

```ml
function missile(state, value, emit)
```

CG_Missile

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.missileLights`, `state.missileSounds`, `state.time`. |
| `value` | `dynamic` | — | Mutable client game ents record/storage; this routine assigns `value.lerpAngles`. |
| `emit` | `dynamic` | — | Value used by `scene(state,"missile-trail",es.number,trail,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L367)

<a id="function-function-mq3-client-cgame-ents-mover-function-mover-state-value-emit-src-mq3-client-cgame-ents-ml-1218246397"></a>
### mover

```ml
function mover(state, value, emit)
```

CG_Mover

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `value` | `dynamic` | — | Record read through `value.currentState`, `value.lerpOrigin`, `value.lerpAngles`. |
| `emit` | `dynamic` | — | Value used by `scene(state,"mover",es.number,ent,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L389)

<a id="function-function-mq3-client-cgame-ents-portal-function-portal-state-value-emit-src-mq3-client-cgame-ents-ml-1604856411"></a>
### portal

```ml
function portal(state, value, emit)
```

CG_Portal

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game ents state passed to the helper calls in `portal`. |
| `value` | `dynamic` | — | Record read through `value.currentState`, `value.lerpOrigin`. |
| `emit` | `dynamic` | — | Value used by `scene(state,"portal",es.number,ent,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L405)

<a id="function-function-mq3-client-cgame-ents-positionentityontag-function-positionentityontag-entity-parent-model-name-src-mq3-client-cgame-ents-ml-1726209933"></a>
### positionEntityOnTag

```ml
function positionEntityOnTag(entity, parent, model, name)
```

CG_PositionEntityOnTag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Mutable client game ents record/storage; this routine assigns `entity.origin`, `entity.axis`, `entity.backlerp`. |
| `parent` | `dynamic` | — | Record read through `parent.oldframe`, `parent.frame`, `parent.backlerp`, `parent.origin` and additional values. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this client game ents operation. |
| `name` | `dynamic` | — | Name used to select or register the corresponding client game ents resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L272)

<a id="function-function-mq3-client-cgame-ents-positionrotatedentityontag-function-positionrotatedentityontag-entity-parent-model-name-src-mq3-client-cgame-ents-ml-1685792527"></a>
### positionRotatedEntityOnTag

```ml
function positionRotatedEntityOnTag(entity, parent, model, name)
```

CG_PositionRotatedEntityOnTag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Mutable client game ents record/storage; this routine assigns `entity.origin`, `entity.axis`. |
| `parent` | `dynamic` | — | Record read through `parent.oldframe`, `parent.frame`, `parent.backlerp`, `parent.origin` and additional values. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this client game ents operation. |
| `name` | `dynamic` | — | Name used to select or register the corresponding client game ents resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L284)

<a id="function-function-mq3-client-cgame-ents-renderentity-function-renderentity-src-mq3-client-cgame-ents-ml-984449182"></a>
### renderEntity

```ml
function renderEntity()
```

Creates a `mq3.client.cgame_ents.RenderEntity` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L220)

- [mq3.client.cgame_ents.RenderEntity](Type-mq3-client-cgame-ents-renderentity-580160012.md) — struct
<a id="constant-constant-mq3-client-cgame-ents-rf-minlight-const-rf-minlight-1-src-mq3-client-cgame-ents-ml-875634624"></a>
### RF_MINLIGHT

```ml
const RF_MINLIGHT = 1
```

Renderer flag guaranteeing a minimum amount of lighting for the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L33)

<a id="constant-constant-mq3-client-cgame-ents-rf-noshadow-const-rf-noshadow-64-src-mq3-client-cgame-ents-ml-1261167025"></a>
### RF_NOSHADOW

```ml
const RF_NOSHADOW = 64
```

Renderer flag suppressing shadow generation for the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L35)

<a id="constant-constant-mq3-client-cgame-ents-rf-third-person-const-rf-third-person-2-src-mq3-client-cgame-ents-ml-232339451"></a>
### RF_THIRD_PERSON

```ml
const RF_THIRD_PERSON = 2
```

Renderer flag excluding the entity from its own first-person view while allowing external or reflected views.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L31)

<a id="constant-constant-mq3-client-cgame-ents-rt-beam-const-rt-beam-4-src-mq3-client-cgame-ents-ml-1568151933"></a>
### RT_BEAM

```ml
const RT_BEAM = 4
```

Renderer-entity type selecting the beam primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L41)

<a id="constant-constant-mq3-client-cgame-ents-rt-model-const-rt-model-0-src-mq3-client-cgame-ents-ml-1427133711"></a>
### RT_MODEL

```ml
const RT_MODEL = 0
```

Renderer-entity type selecting the model primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L37)

<a id="constant-constant-mq3-client-cgame-ents-rt-portalsurface-const-rt-portalsurface-6-src-mq3-client-cgame-ents-ml-1941114705"></a>
### RT_PORTALSURFACE

```ml
const RT_PORTALSURFACE = 6
```

Renderer-entity type selecting the portalsurface primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L43)

<a id="constant-constant-mq3-client-cgame-ents-rt-sprite-const-rt-sprite-2-src-mq3-client-cgame-ents-ml-405228643"></a>
### RT_SPRITE

```ml
const RT_SPRITE = 2
```

Renderer-entity type selecting the sprite primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L39)

<a id="function-function-mq3-client-cgame-ents-scene-function-scene-state-kind-entity-value-emit-src-mq3-client-cgame-ents-ml-929790700"></a>
### scene

```ml
function scene(state, kind, entity, value, emit)
```

Adapts `mq3.client.cgame_ents.boundary` to client game ents `scene`, returning its result for `state, "scene", kind, entity, value.origin, [0.0,0.0,0.0], value, 0, 0, emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_ents.boundary`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_ents.boundary`. |
| `entity` | `dynamic` | — | Argument 4 of `mq3.client.cgame_ents.boundary`. |
| `value` | `dynamic` | — | Record read through `value.origin`. |
| `emit` | `dynamic` | — | Argument 10 of `mq3.client.cgame_ents.boundary`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L256)

<a id="function-function-mq3-client-cgame-ents-setentitysoundposition-function-setentitysoundposition-state-value-emit-src-mq3-client-cgame-ents-ml-1746493795"></a>
### setEntitySoundPosition

```ml
function setEntitySoundPosition(state, value, emit)
```

CG_SetEntitySoundPosition

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inlineMidpoints`. |
| `value` | `dynamic` | — | Record read through `value.lerpOrigin`, `value.currentState`. |
| `emit` | `dynamic` | — | Value used by `boundary(state,"sound-position","update",es.number,origin,[0.0,0.0,0.0],void,0,0,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L294)

- [mq3.client.cgame_ents.Snapshot](Type-mq3-client-cgame-ents-snapshot-985388967.md) — struct
<a id="constant-constant-mq3-client-cgame-ents-solid-bmodel-const-solid-bmodel-16777215-src-mq3-client-cgame-ents-ml-980191329"></a>
### SOLID_BMODEL

```ml
const SOLID_BMODEL = 16777215
```

Encoded solid value indicating that the entity uses an inline brush collision model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L20)

<a id="function-function-mq3-client-cgame-ents-speaker-function-speaker-state-value-emit-src-mq3-client-cgame-ents-ml-1514678849"></a>
### speaker

```ml
function speaker(state, value, emit)
```

CG_Speaker

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`, `state.random`. |
| `value` | `dynamic` | — | Mutable client game ents record/storage; this routine assigns `value.miscTime`. |
| `emit` | `dynamic` | — | Value used by `result=audio(state,"speaker",es.number,value.lerpOrigin,[0.0,0.0,0.0],es.eventParm,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L325)

- [mq3.client.cgame_ents.State](Type-mq3-client-cgame-ents-state-1099874224.md) — struct
<a id="function-function-mq3-client-cgame-ents-sub3-function-sub3-first-second-src-mq3-client-cgame-ents-ml-1384735286"></a>
### sub3

```ml
function sub3(first, second)
```

Builds the client game ents `sub3` sequence from `[n.fsub(first[0],second[0]),n.fsub(first[1],second[1]),n.fsub(first[2],second[2])]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Sequence read at `first[0]`, `first[1]`, `first[2]`. |
| `second` | `dynamic` | — | Sequence read at `second[0]`, `second[1]`, `second[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L218)

<a id="constant-constant-mq3-client-cgame-ents-team-blue-const-team-blue-2-src-mq3-client-cgame-ents-ml-1022799807"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```

Native team identifier for blue, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L50)

<a id="constant-constant-mq3-client-cgame-ents-team-red-const-team-red-1-src-mq3-client-cgame-ents-ml-1858262844"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```

Native team identifier for red, used by player and team presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L48)

<a id="function-function-mq3-client-cgame-ents-teambase-function-teambase-state-value-emit-src-mq3-client-cgame-ents-ml-687795847"></a>
### teamBase

```ml
function teamBase(state, value, emit)
```

CG_TeamBase (baseq3 branch)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.gametype`. |
| `value` | `dynamic` | — | Record read through `value.currentState`, `value.lerpOrigin`. |
| `emit` | `dynamic` | — | Value used by `scene(state,kind,es.number,ent,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L447)

<a id="function-function-mq3-client-cgame-ents-weaponmidpoint-function-weaponmidpoint-state-weapon-src-mq3-client-cgame-ents-ml-1749170565"></a>
### weaponMidpoint

```ml
function weaponMidpoint(state, weapon)
```

Evaluates client game ents `weaponMidpoint` and returns `state.weaponMidpoints[weapon]`, `[0.0,0.0,0.0]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.weaponMidpoints`. |
| `weapon` | `dynamic` | — | Value used by `if weapon>=0 and weapon<len(state.weaponMidpoints) then return state.weaponMidpoints[weapon] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L332)

<a id="constant-constant-mq3-client-cgame-ents-wp-num-weapons-const-wp-num-weapons-11-src-mq3-client-cgame-ents-ml-1663284551"></a>
### WP_NUM_WEAPONS

```ml
const WP_NUM_WEAPONS = 11
```

Number of native weapon slots, used to size weapon-indexed tables rather than select a weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L56)

<a id="constant-constant-mq3-client-cgame-ents-wp-plasmagun-const-wp-plasmagun-8-src-mq3-client-cgame-ents-ml-402349111"></a>
### WP_PLASMAGUN

```ml
const WP_PLASMAGUN = 8
```

Native weapon identifier selecting the plasma gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L54)
