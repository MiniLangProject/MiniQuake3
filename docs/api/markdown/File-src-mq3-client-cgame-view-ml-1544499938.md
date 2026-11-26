# `src/mq3/client/cgame_view.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_view`](Package-mq3-client-cgame-view-1468844280.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/cg_local.ml` as `cgabi` → [src/mq3/client/cg_local.ml](File-src-mq3-client-cg-local-ml-909335699.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textNumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/compat/transcendental.ml` as `crt` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/playerstate.ml` as `playerstate` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-client-cgame-view-addbufferedsound-function-addbufferedsound-state-sound-src-mq3-client-cgame-view-ml-34008480"></a>
### addBufferedSound

```ml
function addBufferedSound(state, sound)
```

CG_AddBufferedSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.soundBuffer[state.soundBufferIn]`, `state.soundBufferIn`, `state.soundBufferOut`. |
| `sound` | `dynamic` | — | Sound handle or asset name passed to the audio action. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L587)

<a id="function-function-mq3-client-cgame-view-addtestmodel-function-addtestmodel-state-modelhandle-retailactive-src-mq3-client-cgame-view-ml-677482569"></a>
### addTestModel

```ml
function addTestModel(state, modelHandle, retailActive)
```

CG_AddTestModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.testModel.model`, `state.testModel.origin`, `state.testModel.axis`, `state.testModel.dispatched`. |
| `modelHandle` | `dynamic` | — | Value assigned to `state.testModel.model`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L469)

<a id="function-function-mq3-client-cgame-view-boundary-function-boundary-state-domain-kind-entity-sound-value-emit-src-mq3-client-cgame-view-ml-1845959671"></a>
### boundary

```ml
function boundary(state, domain, kind, entity, sound, value, emit)
```

Updates `state.actions`, `state.scene`, `state.audio`, `state.system` and additional values during client game view `boundary`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.actions`, `state.scene`, `state.audio`, `state.system` and additional values. |
| `domain` | `dynamic` | — | Value used by `action=Boundary(domain,kind,entity,sound,value,emit)`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `entity` | `dynamic` | — | Value used by `action=Boundary(domain,kind,entity,sound,value,emit)`. |
| `sound` | `dynamic` | — | Sound handle or asset name passed to the audio action. |
| `value` | `dynamic` | — | Value used by `action=Boundary(domain,kind,entity,sound,value,emit)`. |
| `emit` | `dynamic` | — | Value used by `action=Boundary(domain,kind,entity,sound,value,emit)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L412)

- [mq3.client.cgame_view.Boundary](Type-mq3-client-cgame-view-boundary-282885224.md) — struct
<a id="function-function-mq3-client-cgame-view-calcfov-function-calcfov-state-src-mq3-client-cgame-view-ml-2076882961"></a>
### calcFov

```ml
function calcFov(state)
```

CG_CalcFov

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.refdef.fovX`, `state.refdef.fovY`, `state.zoomSensitivity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L538)

<a id="function-function-mq3-client-cgame-view-calcviewvalues-function-calcviewvalues-state-src-mq3-client-cgame-view-ml-751167949"></a>
### calcViewValues

```ml
function calcViewValues(state)
```

CG_CalcViewValues

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.refdef`, `state.refdef.vieworg`, `state.viewAngles`, `state.refdef.viewaxis` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L568)

<a id="function-function-mq3-client-cgame-view-calcvrect-function-calcvrect-state-src-mq3-client-cgame-view-ml-2069722255"></a>
### calcVrect

```ml
function calcVrect(state)
```

CG_CalcVrect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.viewsize`, `state.refdef.width`, `state.refdef.height`, `state.refdef.x` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L480)

<a id="constant-constant-mq3-client-cgame-view-chan-announcer-const-chan-announcer-7-src-mq3-client-cgame-view-ml-532260468"></a>
### CHAN_ANNOUNCER

```ml
const CHAN_ANNOUNCER = 7
```

Sound channel reserved for global announcer feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L51)

<a id="constant-constant-mq3-client-cgame-view-chan-item-const-chan-item-4-src-mq3-client-cgame-view-ml-484729009"></a>
### CHAN_ITEM

```ml
const CHAN_ITEM = 4
```

Sound channel used for item-related sounds associated with an entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L49)

<a id="function-function-mq3-client-cgame-view-clearboundaries-function-clearboundaries-state-src-mq3-client-cgame-view-ml-1482399875"></a>
### clearBoundaries

```ml
function clearBoundaries(state)
```

Updates `state.actions`, `state.scene`, `state.audio`, `state.system` during client game view `clearBoundaries`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.actions`, `state.scene`, `state.audio`, `state.system`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L429)

<a id="constant-constant-mq3-client-cgame-view-contents-lava-const-contents-lava-8-src-mq3-client-cgame-view-ml-1318168221"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = 8
```

Collision-content bit identifying lava volumes or surfaces during client traces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L25)

<a id="constant-constant-mq3-client-cgame-view-contents-slime-const-contents-slime-16-src-mq3-client-cgame-view-ml-1832751380"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = 16
```

Collision-content bit identifying slime volumes or surfaces during client traces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L27)

<a id="constant-constant-mq3-client-cgame-view-contents-water-const-contents-water-32-src-mq3-client-cgame-view-ml-536658684"></a>
### CONTENTS_WATER

```ml
const CONTENTS_WATER = 32
```

Collision-content bit identifying water volumes or surfaces during client traces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L29)

<a id="function-function-mq3-client-cgame-view-copy3-function-copy3-v-src-mq3-client-cgame-view-ml-486398686"></a>
### copy3

```ml
function copy3(v)
```

Copies the X, Y and Z components into a fresh client game view vector.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Sequence read at `v[0]`, `v[1]`, `v[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L385)

<a id="function-function-mq3-client-cgame-view-create-function-create-src-mq3-client-cgame-view-ml-872812984"></a>
### create

```ml
function create()
```

Calls `mq3.game.playerstate.create`, `mq3.client.cgame_view.State`, `mq3.client.cgame_view.refDef` and additional helpers from client game view `create`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L399)

<a id="constant-constant-mq3-client-cgame-view-damage-deflect-time-const-damage-deflect-time-cgabi-damage-deflect-time-src-mq3-client-cgame-view-ml-757426842"></a>
### DAMAGE_DEFLECT_TIME

```ml
const DAMAGE_DEFLECT_TIME = cgabi.DAMAGE_DEFLECT_TIME
```

Milliseconds spent deflecting the camera at the start of damage kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L65)

<a id="constant-constant-mq3-client-cgame-view-damage-return-time-const-damage-return-time-cgabi-damage-return-time-src-mq3-client-cgame-view-ml-1671970109"></a>
### DAMAGE_RETURN_TIME

```ml
const DAMAGE_RETURN_TIME = cgabi.DAMAGE_RETURN_TIME
```

Milliseconds spent returning the camera after damage deflection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L67)

<a id="constant-constant-mq3-client-cgame-view-damage-time-const-damage-time-cgabi-damage-time-src-mq3-client-cgame-view-ml-627446490"></a>
### DAMAGE_TIME

```ml
const DAMAGE_TIME = cgabi.DAMAGE_TIME
```

Total presentation duration in milliseconds of the damage indicator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L69)

<a id="function-function-mq3-client-cgame-view-damageblendblob-function-damageblendblob-state-retailactive-src-mq3-client-cgame-view-ml-662879574"></a>
### damageBlendBlob

```ml
function damageBlendBlob(state, retailActive)
```

CG_DamageBlendBlob

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.damageValue`, `state.ragePro`, `state.time`, `state.damageTime` and additional values. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L561)

<a id="constant-constant-mq3-client-cgame-view-df-fixed-fov-const-df-fixed-fov-16-src-mq3-client-cgame-view-ml-1231440484"></a>
### DF_FIXED_FOV

```ml
const DF_FIXED_FOV = 16
```

Deathmatch-option bit requiring the client to use the fixed field of view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L23)

<a id="function-function-mq3-client-cgame-view-dispatch-function-dispatch-state-domain-kind-entity-sound-value-retailactive-src-mq3-client-cgame-view-ml-1303584637"></a>
### dispatch

```ml
function dispatch(state, domain, kind, entity, sound, value, retailActive)
```

Adapts `mq3.client.cgame_view.boundary` to client game view `dispatch`, returning its result for `state, domain, kind, entity, sound, value, not retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_view.boundary`. |
| `domain` | `dynamic` | — | Argument 2 of `mq3.client.cgame_view.boundary`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_view.boundary`. |
| `entity` | `dynamic` | — | Argument 4 of `mq3.client.cgame_view.boundary`. |
| `sound` | `dynamic` | — | Argument 5 of `mq3.client.cgame_view.boundary`. |
| `value` | `dynamic` | — | Argument 6 of `mq3.client.cgame_view.boundary`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_view.boundary`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L426)

<a id="function-function-mq3-client-cgame-view-drawactiveframe-function-drawactiveframe-state-servertime-stereoview-demoplayback-retailactive-src-mq3-client-cgame-view-ml-2030843875"></a>
### drawActiveFrame

```ml
function drawActiveFrame(state, serverTime, stereoView, demoPlayback, retailActive)
```

CG_DrawActiveFrame.  The subsystem calls retain original ordering.  The producer is selected by retailActive; observers still receive every action.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.time`, `state.demoPlayback`, `state.clientFrame`, `state.renderingThirdPerson` and additional values. |
| `serverTime` | `dynamic` | — | Authoritative server timestamp in milliseconds. |
| `stereoView` | `dynamic` | — | Value used by `if stereoView!=STEREO_RIGHT then state.frameTime=state.time-state.oldTime`. |
| `demoPlayback` | `dynamic` | — | Value assigned to `state.demoPlayback`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L611)

<a id="constant-constant-mq3-client-cgame-view-duck-time-const-duck-time-cgabi-duck-time-src-mq3-client-cgame-view-ml-743755738"></a>
### DUCK_TIME

```ml
const DUCK_TIME = cgabi.DUCK_TIME
```

Duration in milliseconds of eye-height smoothing after a crouch transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L59)

<a id="constant-constant-mq3-client-cgame-view-focus-distance-const-focus-distance-512-src-mq3-client-cgame-view-ml-356134839"></a>
### FOCUS_DISTANCE

```ml
const FOCUS_DISTANCE = 512
```

Forward aim distance used to calculate the third-person camera's focus point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L77)

<a id="function-function-mq3-client-cgame-view-frameboundary-function-frameboundary-state-kind-retailactive-src-mq3-client-cgame-view-ml-1022293164"></a>
### frameBoundary

```ml
function frameBoundary(state, kind, retailActive)
```

Adapts `mq3.client.cgame_view.dispatch` to client game view `frameBoundary`, returning its result for `state, "system", kind, 0, 0, void, retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_view.dispatch`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_view.dispatch`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_view.dispatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L602)

<a id="function-function-mq3-client-cgame-view-identityaxis-function-identityaxis-src-mq3-client-cgame-view-ml-946739840"></a>
### identityAxis

```ml
function identityAxis()
```

Creates the three orthonormal unit axes used as the identity orientation in client game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L387)

<a id="constant-constant-mq3-client-cgame-view-land-deflect-time-const-land-deflect-time-cgabi-land-deflect-time-src-mq3-client-cgame-view-ml-1808731806"></a>
### LAND_DEFLECT_TIME

```ml
const LAND_DEFLECT_TIME = cgabi.LAND_DEFLECT_TIME
```

Milliseconds spent moving the view during the initial landing kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L61)

<a id="constant-constant-mq3-client-cgame-view-land-return-time-const-land-return-time-cgabi-land-return-time-src-mq3-client-cgame-view-ml-777131065"></a>
### LAND_RETURN_TIME

```ml
const LAND_RETURN_TIME = cgabi.LAND_RETURN_TIME
```

Milliseconds spent restoring the view after the landing kick.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L63)

<a id="constant-constant-mq3-client-cgame-view-mask-water-const-mask-water-56-src-mq3-client-cgame-view-ml-1207741438"></a>
### MASK_WATER

```ml
const MASK_WATER = 56
```

Combined collision-content mask selecting water-like volumes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L31)

<a id="constant-constant-mq3-client-cgame-view-max-powerups-const-max-powerups-16-src-mq3-client-cgame-view-ml-1681451934"></a>
### MAX_POWERUPS

```ml
const MAX_POWERUPS = 16
```

Capacity limit for the powerups collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L53)

<a id="constant-constant-mq3-client-cgame-view-max-soundbuffer-const-max-soundbuffer-cgabi-max-soundbuffer-src-mq3-client-cgame-view-ml-1933229179"></a>
### MAX_SOUNDBUFFER

```ml
const MAX_SOUNDBUFFER = cgabi.MAX_SOUNDBUFFER
```

Capacity limit for the soundbuffer collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L55)

<a id="function-function-mq3-client-cgame-view-nexttrace-function-nexttrace-state-target-src-mq3-client-cgame-view-ml-899529024"></a>
### nextTrace

```ml
function nextTrace(state, target)
```

Updates `state.traceAt` during client game view `nextTrace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.traceAt`. |
| `target` | `dynamic` | — | Value used by `return Trace(1.0,copy3(target))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L490)

<a id="function-function-mq3-client-cgame-view-offsetfirstpersonview-function-offsetfirstpersonview-state-src-mq3-client-cgame-view-ml-311534547"></a>
### offsetFirstPersonView

```ml
function offsetFirstPersonView(state)
```

CG_OffsetFirstPersonView

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.viewAngles[2]`, `state.viewAngles[0]`, `state.viewAngles[1]`, `state.refdef.vieworg[2]` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L515)

<a id="function-function-mq3-client-cgame-view-offsetthirdpersonview-function-offsetthirdpersonview-state-src-mq3-client-cgame-view-ml-728583953"></a>
### offsetThirdPersonView

```ml
function offsetThirdPersonView(state)
```

CG_OffsetThirdPersonView

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.refdef.vieworg[2]`, `state.viewAngles[1]`, `state.viewAngles[0]`, `state.refdef.vieworg`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L497)

<a id="constant-constant-mq3-client-cgame-view-pi-const-pi-3-141593-src-mq3-client-cgame-view-ml-906205867"></a>
### PI

```ml
const PI = 3.141593
```

Circle constant used to convert or evaluate angles in trigonometric calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L79)

<a id="function-function-mq3-client-cgame-view-playbufferedsounds-function-playbufferedsounds-state-retailactive-src-mq3-client-cgame-view-ml-1748983028"></a>
### playBufferedSounds

```ml
function playBufferedSounds(state, retailActive)
```

CG_PlayBufferedSounds

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.soundBuffer[state.soundBufferOut]`, `state.soundBufferOut`, `state.soundTime`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L594)

<a id="constant-constant-mq3-client-cgame-view-pmf-ducked-const-pmf-ducked-1-src-mq3-client-cgame-view-ml-768622202"></a>
### PMF_DUCKED

```ml
const PMF_DUCKED = 1
```

Player-movement state flag indicating ducked.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L21)

<a id="constant-constant-mq3-client-cgame-view-powerup-blink-time-const-powerup-blink-time-cgabi-powerup-blink-time-src-mq3-client-cgame-view-ml-1297344806"></a>
### POWERUP_BLINK_TIME

```ml
const POWERUP_BLINK_TIME = cgabi.POWERUP_BLINK_TIME
```

Duration in milliseconds of one powerup-expiration blink interval.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L75)

<a id="constant-constant-mq3-client-cgame-view-powerup-blinks-const-powerup-blinks-cgabi-powerup-blinks-src-mq3-client-cgame-view-ml-597877655"></a>
### POWERUP_BLINKS

```ml
const POWERUP_BLINKS = cgabi.POWERUP_BLINKS
```

Number of warning blinks played before a timed powerup expires.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L73)

<a id="function-function-mq3-client-cgame-view-poweruptimersounds-function-poweruptimersounds-state-retailactive-src-mq3-client-cgame-view-ml-1222098676"></a>
### powerupTimerSounds

```ml
function powerupTimerSounds(state, retailActive)
```

CG_PowerupTimerSounds

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.snap.ps.powerups`, `state.time`, `state.oldTime`, `state.snap.ps.clientNum` and additional values. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L580)

<a id="constant-constant-mq3-client-cgame-view-rdf-hyperspace-const-rdf-hyperspace-4-src-mq3-client-cgame-view-ml-1404107889"></a>
### RDF_HYPERSPACE

```ml
const RDF_HYPERSPACE = 4
```

View-rendering flag controlling hyperspace scene presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L43)

<a id="constant-constant-mq3-client-cgame-view-rdf-noworldmodel-const-rdf-noworldmodel-1-src-mq3-client-cgame-view-ml-2005645744"></a>
### RDF_NOWORLDMODEL

```ml
const RDF_NOWORLDMODEL = 1
```

View-rendering flag controlling noworldmodel scene presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L41)

<a id="function-function-mq3-client-cgame-view-refdef-function-refdef-src-mq3-client-cgame-view-ml-826344364"></a>
### refDef

```ml
function refDef()
```

Creates a `mq3.client.cgame_view.RefDef` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L391)

- [mq3.client.cgame_view.RefDef](Type-mq3-client-cgame-view-refdef-2062196970.md) — struct
<a id="function-function-mq3-client-cgame-view-renderentity-function-renderentity-src-mq3-client-cgame-view-ml-80046264"></a>
### renderEntity

```ml
function renderEntity()
```

Creates a `mq3.client.cgame_view.RenderEntity` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L389)

- [mq3.client.cgame_view.RenderEntity](Type-mq3-client-cgame-view-renderentity-791471253.md) — struct
<a id="constant-constant-mq3-client-cgame-view-rf-depthhack-const-rf-depthhack-8-src-mq3-client-cgame-view-ml-1857360085"></a>
### RF_DEPTHHACK

```ml
const RF_DEPTHHACK = 8
```

Renderer flag that compresses the viewmodel depth range to reduce first-person weapon clipping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L37)

<a id="constant-constant-mq3-client-cgame-view-rf-first-person-const-rf-first-person-4-src-mq3-client-cgame-view-ml-538150869"></a>
### RF_FIRST_PERSON

```ml
const RF_FIRST_PERSON = 4
```

Renderer flag restricting the entity to the first-person view, as used by the view weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L35)

<a id="constant-constant-mq3-client-cgame-view-rf-minlight-const-rf-minlight-1-src-mq3-client-cgame-view-ml-1136212240"></a>
### RF_MINLIGHT

```ml
const RF_MINLIGHT = 1
```

Renderer flag guaranteeing a minimum amount of lighting for the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L33)

<a id="constant-constant-mq3-client-cgame-view-rt-sprite-const-rt-sprite-2-src-mq3-client-cgame-view-ml-962649823"></a>
### RT_SPRITE

```ml
const RT_SPRITE = 2
```

Renderer-entity type selecting the sprite primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L39)

<a id="constant-constant-mq3-client-cgame-view-snapflag-not-active-const-snapflag-not-active-2-src-mq3-client-cgame-view-ml-1944179599"></a>
### SNAPFLAG_NOT_ACTIVE

```ml
const SNAPFLAG_NOT_ACTIVE = 2
```

Snapshot flag indicating that the server state is not yet active for normal gameplay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L45)

<a id="function-function-mq3-client-cgame-view-snapshot-function-snapshot-ps-flags-areamask-src-mq3-client-cgame-view-ml-1284050769"></a>
### snapshot

```ml
function snapshot(ps, flags, areamask)
```

Creates a `mq3.client.cgame_view.Snapshot` record. Assigns `ps` from `ps`, `snapFlags` from `flags`, `areamask` from `areamask`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — | Value used to initialize `Snapshot.ps`. |
| `flags` | `dynamic` | — | Value used to initialize `Snapshot.snapFlags`. |
| `areamask` | `dynamic` | — | Value used to initialize `Snapshot.areamask`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L396)

- [mq3.client.cgame_view.Snapshot](Type-mq3-client-cgame-view-snapshot-708476526.md) — struct
- [mq3.client.cgame_view.State](Type-mq3-client-cgame-view-state-1848843591.md) — struct
<a id="constant-constant-mq3-client-cgame-view-step-time-const-step-time-cgabi-step-time-src-mq3-client-cgame-view-ml-1545991249"></a>
### STEP_TIME

```ml
const STEP_TIME = cgabi.STEP_TIME
```

Duration in milliseconds of camera smoothing after stepping onto a ledge.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L57)

<a id="function-function-mq3-client-cgame-view-stepoffset-function-stepoffset-state-src-mq3-client-cgame-view-ml-1058445993"></a>
### stepOffset

```ml
function stepOffset(state)
```

CG_StepOffset

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.refdef.vieworg[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L509)

<a id="constant-constant-mq3-client-cgame-view-stereo-right-const-stereo-right-2-src-mq3-client-cgame-view-ml-1145522927"></a>
### STEREO_RIGHT

```ml
const STEREO_RIGHT = 2
```

Stereo-view selector for the right-eye camera view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L47)

<a id="extern_function-extern-function-mq3-client-cgame-view-tan-extern-function-tan-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-client-cgame-view-ml-1223969052"></a>
### tan

```ml
extern function tan(value as double) from "ucrtbase.dll" returns double
```

Evaluates the tangent of an angle in radians using the Windows C runtime. This binding is used by client game view.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Angle in radians, passed as a native double. |


**Returns:** The tangent of the supplied angle.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L18)

<a id="function-function-mq3-client-cgame-view-testgun-function-testgun-state-args-modelhandle-src-mq3-client-cgame-view-ml-1510643487"></a>
### testGun

```ml
function testGun(state, args, modelHandle)
```

CG_TestGun_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.testGun`, `state.testModel.renderfx`. |
| `args` | `dynamic` | — | Value used by `ok=testModel(state,args,modelHandle)`. |
| `modelHandle` | `dynamic` | — | Value used by `ok=testModel(state,args,modelHandle)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L449)

<a id="function-function-mq3-client-cgame-view-testmodel-function-testmodel-state-args-modelhandle-src-mq3-client-cgame-view-ml-1515491257"></a>
### testModel

```ml
function testModel(state, args, modelHandle)
```

CG_TestModel_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.testModel`, `state.testModelName`, `state.testGun`, `state.testModel.model` and additional values. |
| `args` | `dynamic` | — | Sequence read at `args[1]`, `args[2]`. |
| `modelHandle` | `dynamic` | — | Value assigned to `state.testModel.model`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L435)

<a id="function-function-mq3-client-cgame-view-testmodelnextframe-function-testmodelnextframe-state-src-mq3-client-cgame-view-ml-1474869117"></a>
### testModelNextFrame

```ml
function testModelNextFrame(state)
```

CG_TestModelNextFrame_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.testModel.frame`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L454)

<a id="function-function-mq3-client-cgame-view-testmodelnextskin-function-testmodelnextskin-state-src-mq3-client-cgame-view-ml-1391852615"></a>
### testModelNextSkin

```ml
function testModelNextSkin(state)
```

CG_TestModelNextSkin_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.testModel.skinNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L460)

<a id="function-function-mq3-client-cgame-view-testmodelprevframe-function-testmodelprevframe-state-src-mq3-client-cgame-view-ml-1796908129"></a>
### testModelPrevFrame

```ml
function testModelPrevFrame(state)
```

CG_TestModelPrevFrame_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.testModel.frame`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L457)

<a id="function-function-mq3-client-cgame-view-testmodelprevskin-function-testmodelprevskin-state-src-mq3-client-cgame-view-ml-558322291"></a>
### testModelPrevSkin

```ml
function testModelPrevSkin(state)
```

CG_TestModelPrevSkin_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.testModel.skinNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L463)

- [mq3.client.cgame_view.Trace](Type-mq3-client-cgame-view-trace-945722175.md) — struct
<a id="constant-constant-mq3-client-cgame-view-zoom-time-const-zoom-time-cgabi-zoom-time-src-mq3-client-cgame-view-ml-2139468448"></a>
### ZOOM_TIME

```ml
const ZOOM_TIME = cgabi.ZOOM_TIME
```

Duration in milliseconds of the transition into or out of the zoomed view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L71)

<a id="function-function-mq3-client-cgame-view-zoomdown-function-zoomdown-state-src-mq3-client-cgame-view-ml-1175139037"></a>
### zoomDown

```ml
function zoomDown(state)
```

CG_ZoomDown_f / CG_ZoomUp_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.zoomed`, `state.zoomTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L531)

<a id="function-function-mq3-client-cgame-view-zoomup-function-zoomup-state-src-mq3-client-cgame-view-ml-1613893717"></a>
### zoomUp

```ml
function zoomUp(state)
```

Updates `state.zoomed`, `state.zoomTime` during client game view `zoomUp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game view record/storage; this routine assigns `state.zoomed`, `state.zoomTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L534)
