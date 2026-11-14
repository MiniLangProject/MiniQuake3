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
| `state` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L210)

<a id="function-function-mq3-client-cgame-view-addtestmodel-function-addtestmodel-state-modelhandle-retailactive-src-mq3-client-cgame-view-ml-677482569"></a>
### addTestModel

```ml
function addTestModel(state, modelHandle, retailActive)
```

CG_AddTestModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `modelHandle` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L110)

<a id="function-function-mq3-client-cgame-view-boundary-function-boundary-state-domain-kind-entity-sound-value-emit-src-mq3-client-cgame-view-ml-1845959671"></a>
### boundary

```ml
function boundary(state, domain, kind, entity, sound, value, emit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `domain` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L76)

- [mq3.client.cgame_view.Boundary](Type-mq3-client-cgame-view-boundary-282885224.md) — struct
<a id="function-function-mq3-client-cgame-view-calcfov-function-calcfov-state-src-mq3-client-cgame-view-ml-2076882961"></a>
### calcFov

```ml
function calcFov(state)
```

CG_CalcFov

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L168)

<a id="function-function-mq3-client-cgame-view-calcviewvalues-function-calcviewvalues-state-src-mq3-client-cgame-view-ml-751167949"></a>
### calcViewValues

```ml
function calcViewValues(state)
```

CG_CalcViewValues

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L195)

<a id="function-function-mq3-client-cgame-view-calcvrect-function-calcvrect-state-src-mq3-client-cgame-view-ml-2069722255"></a>
### calcVrect

```ml
function calcVrect(state)
```

CG_CalcVrect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L120)

<a id="constant-constant-mq3-client-cgame-view-chan-announcer-const-chan-announcer-7-src-mq3-client-cgame-view-ml-532260468"></a>
### CHAN_ANNOUNCER

```ml
const CHAN_ANNOUNCER = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L32)

<a id="constant-constant-mq3-client-cgame-view-chan-item-const-chan-item-4-src-mq3-client-cgame-view-ml-484729009"></a>
### CHAN_ITEM

```ml
const CHAN_ITEM = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L31)

<a id="function-function-mq3-client-cgame-view-clearboundaries-function-clearboundaries-state-src-mq3-client-cgame-view-ml-1482399875"></a>
### clearBoundaries

```ml
function clearBoundaries(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L83)

<a id="constant-constant-mq3-client-cgame-view-contents-lava-const-contents-lava-8-src-mq3-client-cgame-view-ml-1318168221"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L19)

<a id="constant-constant-mq3-client-cgame-view-contents-slime-const-contents-slime-16-src-mq3-client-cgame-view-ml-1832751380"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L20)

<a id="constant-constant-mq3-client-cgame-view-contents-water-const-contents-water-32-src-mq3-client-cgame-view-ml-536658684"></a>
### CONTENTS_WATER

```ml
const CONTENTS_WATER = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L21)

<a id="function-function-mq3-client-cgame-view-copy3-function-copy3-v-src-mq3-client-cgame-view-ml-486398686"></a>
### copy3

```ml
function copy3(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L65)

<a id="function-function-mq3-client-cgame-view-create-function-create-src-mq3-client-cgame-view-ml-872812984"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L71)

<a id="constant-constant-mq3-client-cgame-view-damage-deflect-time-const-damage-deflect-time-cgabi-damage-deflect-time-src-mq3-client-cgame-view-ml-757426842"></a>
### DAMAGE_DEFLECT_TIME

```ml
const DAMAGE_DEFLECT_TIME = cgabi.DAMAGE_DEFLECT_TIME
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L39)

<a id="constant-constant-mq3-client-cgame-view-damage-return-time-const-damage-return-time-cgabi-damage-return-time-src-mq3-client-cgame-view-ml-1671970109"></a>
### DAMAGE_RETURN_TIME

```ml
const DAMAGE_RETURN_TIME = cgabi.DAMAGE_RETURN_TIME
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L40)

<a id="constant-constant-mq3-client-cgame-view-damage-time-const-damage-time-cgabi-damage-time-src-mq3-client-cgame-view-ml-627446490"></a>
### DAMAGE_TIME

```ml
const DAMAGE_TIME = cgabi.DAMAGE_TIME
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L41)

<a id="function-function-mq3-client-cgame-view-damageblendblob-function-damageblendblob-state-retailactive-src-mq3-client-cgame-view-ml-662879574"></a>
### damageBlendBlob

```ml
function damageBlendBlob(state, retailActive)
```

CG_DamageBlendBlob

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L189)

<a id="constant-constant-mq3-client-cgame-view-df-fixed-fov-const-df-fixed-fov-16-src-mq3-client-cgame-view-ml-1231440484"></a>
### DF_FIXED_FOV

```ml
const DF_FIXED_FOV = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L18)

<a id="function-function-mq3-client-cgame-view-dispatch-function-dispatch-state-domain-kind-entity-sound-value-retailactive-src-mq3-client-cgame-view-ml-1303584637"></a>
### dispatch

```ml
function dispatch(state, domain, kind, entity, sound, value, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `domain` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L82)

<a id="function-function-mq3-client-cgame-view-drawactiveframe-function-drawactiveframe-state-servertime-stereoview-demoplayback-retailactive-src-mq3-client-cgame-view-ml-2030843875"></a>
### drawActiveFrame

```ml
function drawActiveFrame(state, serverTime, stereoView, demoPlayback, retailActive)
```

CG_DrawActiveFrame.  The subsystem calls retain original ordering.  The producer is selected by retailActive; observers still receive every action.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |
| `stereoView` | `dynamic` | — |  |
| `demoPlayback` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L223)

<a id="constant-constant-mq3-client-cgame-view-duck-time-const-duck-time-cgabi-duck-time-src-mq3-client-cgame-view-ml-743755738"></a>
### DUCK_TIME

```ml
const DUCK_TIME = cgabi.DUCK_TIME
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L36)

<a id="constant-constant-mq3-client-cgame-view-focus-distance-const-focus-distance-512-src-mq3-client-cgame-view-ml-312306325"></a>
### FOCUS_DISTANCE

```ml
const FOCUS_DISTANCE = 512.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L45)

<a id="function-function-mq3-client-cgame-view-frameboundary-function-frameboundary-state-kind-retailactive-src-mq3-client-cgame-view-ml-1022293164"></a>
### frameBoundary

```ml
function frameBoundary(state, kind, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L219)

<a id="function-function-mq3-client-cgame-view-identityaxis-function-identityaxis-src-mq3-client-cgame-view-ml-946739840"></a>
### identityAxis

```ml
function identityAxis()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L66)

<a id="constant-constant-mq3-client-cgame-view-land-deflect-time-const-land-deflect-time-cgabi-land-deflect-time-src-mq3-client-cgame-view-ml-1808731806"></a>
### LAND_DEFLECT_TIME

```ml
const LAND_DEFLECT_TIME = cgabi.LAND_DEFLECT_TIME
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L37)

<a id="constant-constant-mq3-client-cgame-view-land-return-time-const-land-return-time-cgabi-land-return-time-src-mq3-client-cgame-view-ml-777131065"></a>
### LAND_RETURN_TIME

```ml
const LAND_RETURN_TIME = cgabi.LAND_RETURN_TIME
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L38)

<a id="constant-constant-mq3-client-cgame-view-mask-water-const-mask-water-56-src-mq3-client-cgame-view-ml-1207741438"></a>
### MASK_WATER

```ml
const MASK_WATER = 56
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L22)

<a id="constant-constant-mq3-client-cgame-view-max-powerups-const-max-powerups-16-src-mq3-client-cgame-view-ml-1681451934"></a>
### MAX_POWERUPS

```ml
const MAX_POWERUPS = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L33)

<a id="constant-constant-mq3-client-cgame-view-max-soundbuffer-const-max-soundbuffer-cgabi-max-soundbuffer-src-mq3-client-cgame-view-ml-1933229179"></a>
### MAX_SOUNDBUFFER

```ml
const MAX_SOUNDBUFFER = cgabi.MAX_SOUNDBUFFER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L34)

<a id="function-function-mq3-client-cgame-view-nexttrace-function-nexttrace-state-target-src-mq3-client-cgame-view-ml-899529024"></a>
### nextTrace

```ml
function nextTrace(state, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L127)

<a id="function-function-mq3-client-cgame-view-offsetfirstpersonview-function-offsetfirstpersonview-state-src-mq3-client-cgame-view-ml-311534547"></a>
### offsetFirstPersonView

```ml
function offsetFirstPersonView(state)
```

CG_OffsetFirstPersonView

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L149)

<a id="function-function-mq3-client-cgame-view-offsetthirdpersonview-function-offsetthirdpersonview-state-src-mq3-client-cgame-view-ml-728583953"></a>
### offsetThirdPersonView

```ml
function offsetThirdPersonView(state)
```

CG_OffsetThirdPersonView

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L133)

<a id="constant-constant-mq3-client-cgame-view-pi-const-pi-3-14159265358979-src-mq3-client-cgame-view-ml-140269116"></a>
### PI

```ml
const PI = 3.14159265358979
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L46)

<a id="function-function-mq3-client-cgame-view-playbufferedsounds-function-playbufferedsounds-state-retailactive-src-mq3-client-cgame-view-ml-1748983028"></a>
### playBufferedSounds

```ml
function playBufferedSounds(state, retailActive)
```

CG_PlayBufferedSounds

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L215)

<a id="constant-constant-mq3-client-cgame-view-pmf-ducked-const-pmf-ducked-1-src-mq3-client-cgame-view-ml-768622202"></a>
### PMF_DUCKED

```ml
const PMF_DUCKED = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L17)

<a id="constant-constant-mq3-client-cgame-view-powerup-blink-time-const-powerup-blink-time-cgabi-powerup-blink-time-src-mq3-client-cgame-view-ml-1297344806"></a>
### POWERUP_BLINK_TIME

```ml
const POWERUP_BLINK_TIME = cgabi.POWERUP_BLINK_TIME
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L44)

<a id="constant-constant-mq3-client-cgame-view-powerup-blinks-const-powerup-blinks-cgabi-powerup-blinks-src-mq3-client-cgame-view-ml-597877655"></a>
### POWERUP_BLINKS

```ml
const POWERUP_BLINKS = cgabi.POWERUP_BLINKS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L43)

<a id="function-function-mq3-client-cgame-view-poweruptimersounds-function-poweruptimersounds-state-retailactive-src-mq3-client-cgame-view-ml-1222098676"></a>
### powerupTimerSounds

```ml
function powerupTimerSounds(state, retailActive)
```

CG_PowerupTimerSounds

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L205)

<a id="constant-constant-mq3-client-cgame-view-rdf-hyperspace-const-rdf-hyperspace-4-src-mq3-client-cgame-view-ml-1404107889"></a>
### RDF_HYPERSPACE

```ml
const RDF_HYPERSPACE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L28)

<a id="constant-constant-mq3-client-cgame-view-rdf-noworldmodel-const-rdf-noworldmodel-1-src-mq3-client-cgame-view-ml-2005645744"></a>
### RDF_NOWORLDMODEL

```ml
const RDF_NOWORLDMODEL = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L27)

<a id="function-function-mq3-client-cgame-view-refdef-function-refdef-src-mq3-client-cgame-view-ml-826344364"></a>
### refDef

```ml
function refDef()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L68)

- [mq3.client.cgame_view.RefDef](Type-mq3-client-cgame-view-refdef-2062196970.md) — struct
<a id="function-function-mq3-client-cgame-view-renderentity-function-renderentity-src-mq3-client-cgame-view-ml-80046264"></a>
### renderEntity

```ml
function renderEntity()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L67)

- [mq3.client.cgame_view.RenderEntity](Type-mq3-client-cgame-view-renderentity-791471253.md) — struct
<a id="constant-constant-mq3-client-cgame-view-rf-depthhack-const-rf-depthhack-8-src-mq3-client-cgame-view-ml-1857360085"></a>
### RF_DEPTHHACK

```ml
const RF_DEPTHHACK = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L25)

<a id="constant-constant-mq3-client-cgame-view-rf-first-person-const-rf-first-person-4-src-mq3-client-cgame-view-ml-538150869"></a>
### RF_FIRST_PERSON

```ml
const RF_FIRST_PERSON = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L24)

<a id="constant-constant-mq3-client-cgame-view-rf-minlight-const-rf-minlight-1-src-mq3-client-cgame-view-ml-1136212240"></a>
### RF_MINLIGHT

```ml
const RF_MINLIGHT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L23)

<a id="constant-constant-mq3-client-cgame-view-rt-sprite-const-rt-sprite-2-src-mq3-client-cgame-view-ml-962649823"></a>
### RT_SPRITE

```ml
const RT_SPRITE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L26)

<a id="constant-constant-mq3-client-cgame-view-snapflag-not-active-const-snapflag-not-active-2-src-mq3-client-cgame-view-ml-1944179599"></a>
### SNAPFLAG_NOT_ACTIVE

```ml
const SNAPFLAG_NOT_ACTIVE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L29)

<a id="function-function-mq3-client-cgame-view-snapshot-function-snapshot-ps-flags-areamask-src-mq3-client-cgame-view-ml-1284050769"></a>
### snapshot

```ml
function snapshot(ps, flags, areamask)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `areamask` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L69)

- [mq3.client.cgame_view.Snapshot](Type-mq3-client-cgame-view-snapshot-708476526.md) — struct
- [mq3.client.cgame_view.State](Type-mq3-client-cgame-view-state-1848843591.md) — struct
<a id="constant-constant-mq3-client-cgame-view-step-time-const-step-time-cgabi-step-time-src-mq3-client-cgame-view-ml-1545991249"></a>
### STEP_TIME

```ml
const STEP_TIME = cgabi.STEP_TIME
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L35)

<a id="function-function-mq3-client-cgame-view-stepoffset-function-stepoffset-state-src-mq3-client-cgame-view-ml-1058445993"></a>
### stepOffset

```ml
function stepOffset(state)
```

CG_StepOffset

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L144)

<a id="constant-constant-mq3-client-cgame-view-stereo-right-const-stereo-right-2-src-mq3-client-cgame-view-ml-1145522927"></a>
### STEREO_RIGHT

```ml
const STEREO_RIGHT = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L30)

<a id="extern_function-extern-function-mq3-client-cgame-view-tan-extern-function-tan-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-client-cgame-view-ml-1223969052"></a>
### tan

```ml
extern function tan(value as double) from "ucrtbase.dll" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L15)

<a id="function-function-mq3-client-cgame-view-testgun-function-testgun-state-args-modelhandle-src-mq3-client-cgame-view-ml-1510643487"></a>
### testGun

```ml
function testGun(state, args, modelHandle)
```

CG_TestGun_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |
| `modelHandle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L97)

<a id="function-function-mq3-client-cgame-view-testmodel-function-testmodel-state-args-modelhandle-src-mq3-client-cgame-view-ml-1515491257"></a>
### testModel

```ml
function testModel(state, args, modelHandle)
```

CG_TestModel_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |
| `modelHandle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L86)

<a id="function-function-mq3-client-cgame-view-testmodelnextframe-function-testmodelnextframe-state-src-mq3-client-cgame-view-ml-1474869117"></a>
### testModelNextFrame

```ml
function testModelNextFrame(state)
```

CG_TestModelNextFrame_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L101)

<a id="function-function-mq3-client-cgame-view-testmodelnextskin-function-testmodelnextskin-state-src-mq3-client-cgame-view-ml-1391852615"></a>
### testModelNextSkin

```ml
function testModelNextSkin(state)
```

CG_TestModelNextSkin_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L105)

<a id="function-function-mq3-client-cgame-view-testmodelprevframe-function-testmodelprevframe-state-src-mq3-client-cgame-view-ml-1796908129"></a>
### testModelPrevFrame

```ml
function testModelPrevFrame(state)
```

CG_TestModelPrevFrame_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L103)

<a id="function-function-mq3-client-cgame-view-testmodelprevskin-function-testmodelprevskin-state-src-mq3-client-cgame-view-ml-558322291"></a>
### testModelPrevSkin

```ml
function testModelPrevSkin(state)
```

CG_TestModelPrevSkin_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L107)

- [mq3.client.cgame_view.Trace](Type-mq3-client-cgame-view-trace-945722175.md) — struct
<a id="constant-constant-mq3-client-cgame-view-zoom-time-const-zoom-time-cgabi-zoom-time-src-mq3-client-cgame-view-ml-2139468448"></a>
### ZOOM_TIME

```ml
const ZOOM_TIME = cgabi.ZOOM_TIME
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L42)

<a id="function-function-mq3-client-cgame-view-zoomdown-function-zoomdown-state-src-mq3-client-cgame-view-ml-1175139037"></a>
### zoomDown

```ml
function zoomDown(state)
```

CG_ZoomDown_f / CG_ZoomUp_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L164)

<a id="function-function-mq3-client-cgame-view-zoomup-function-zoomup-state-src-mq3-client-cgame-view-ml-1613893717"></a>
### zoomUp

```ml
function zoomUp(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L165)
