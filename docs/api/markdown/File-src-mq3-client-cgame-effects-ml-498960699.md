# `src/mq3/client/cgame_effects.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_effects`](Package-mq3-client-cgame-effects-1563381861.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/cg_local.ml` as `cgabi` → [src/mq3/client/cg_local.ml](File-src-mq3-client-cg-local-ml-909335699.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-client-cgame-effects-bigexplode-function-bigexplode-state-origin-retailactive-src-mq3-client-cgame-effects-ml-699570678"></a>
### bigExplode

```ml
function bigExplode(state, origin, retailActive)
```

CG_BigExplode

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.blood`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L315)

<a id="function-function-mq3-client-cgame-effects-bleed-function-bleed-state-origin-entitynum-retailactive-src-mq3-client-cgame-effects-ml-1785957709"></a>
### bleed

```ml
function bleed(state, origin, entityNum, retailActive)
```

CG_Bleed

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.blood`, `state.time`, `state.predictedClient`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `entityNum` | `dynamic` | — | Entity number identifying a world or player entity. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L258)

<a id="constant-constant-mq3-client-cgame-effects-blood-explosion-shader-const-blood-explosion-shader-bloodexplosion-src-mq3-client-cgame-effects-ml-1775586426"></a>
### BLOOD_EXPLOSION_SHADER

```ml
const BLOOD_EXPLOSION_SHADER = "bloodExplosion"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L48)

<a id="function-function-mq3-client-cgame-effects-bubbletrail-function-bubbletrail-state-start-finish-spacing-retailactive-src-mq3-client-cgame-effects-ml-2039915180"></a>
### bubbleTrail

```ml
function bubbleTrail(state, start, finish, spacing, retailActive)
```

CG_BubbleTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.noProjectileTrail`, `state.time`. |
| `start` | `dynamic` | — | Sequence read at `start[0]`, `start[1]`, `start[2]`. |
| `finish` | `dynamic` | — | Sequence read at `finish[0]`, `finish[1]`, `finish[2]`. |
| `spacing` | `dynamic` | — | Value used by `if spacing<=0.0 then return error(7720,"bubble trail spacing must be positive") end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L116)

<a id="constant-constant-mq3-client-cgame-effects-chan-body-const-chan-body-4-src-mq3-client-cgame-effects-ml-925678475"></a>
### CHAN_BODY

```ml
const CHAN_BODY = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L35)

<a id="function-function-mq3-client-cgame-effects-clear-function-clear-state-src-mq3-client-cgame-effects-ml-1901186961"></a>
### clear

```ml
function clear(state)
```

Updates `state.actions` during client game effects `clear`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game effects record/storage; this routine assigns `state.actions`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L81)

<a id="function-function-mq3-client-cgame-effects-copy3-function-copy3-value-src-mq3-client-cgame-effects-ml-1890437099"></a>
### copy3

```ml
function copy3(value)
```

Copies the X, Y and Z components into a fresh client game effects vector.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[0]`, `value[1]`, `value[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L106)

<a id="function-function-mq3-client-cgame-effects-crandom-function-crandom-state-src-mq3-client-cgame-effects-ml-1345803547"></a>
### crandom

```ml
function crandom(state)
```

Computes `2.0*(randomFloat(state)-0.5)` for client game effects `crandom`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game effects state passed to the helper calls in `crandom`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L97)

<a id="function-function-mq3-client-cgame-effects-create-function-create-src-mq3-client-cgame-effects-ml-425149202"></a>
### create

```ml
function create()
```

Creates a `mq3.client.cgame_effects.State` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L58)

<a id="constant-constant-mq3-client-cgame-effects-dish-flash-model-const-dish-flash-model-models-weaphits-boom01-md3-src-mq3-client-cgame-effects-ml-266284382"></a>
### DISH_FLASH_MODEL

```ml
const DISH_FLASH_MODEL = "models/weaphits/boom01.md3"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L44)

<a id="function-function-mq3-client-cgame-effects-effect-function-effect-boundary-kind-src-mq3-client-cgame-effects-ml-1472367082"></a>
### effect

```ml
function effect(boundary, kind)
```

Creates a `mq3.client.cgame_effects.Effect` record. Assigns `boundary` from `boundary`, `kind` from `kind`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `boundary` | `dynamic` | — | Value used to initialize `Effect.boundary`. |
| `kind` | `dynamic` | — | Value used to initialize `Effect.kind`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L65)

- [mq3.client.cgame_effects.Effect](Type-mq3-client-cgame-effects-effect-307195720.md) — struct
<a id="constant-constant-mq3-client-cgame-effects-entitynum-none-const-entitynum-none-1023-src-mq3-client-cgame-effects-ml-2045724605"></a>
### ENTITYNUM_NONE

```ml
const ENTITYNUM_NONE = 1023
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L34)

<a id="function-function-mq3-client-cgame-effects-fragment-function-fragment-state-kind-origin-velocity-model-duration-spread-bounce-bouncesound-marktype-retailactive-src-mq3-client-cgame-effects-ml-198252413"></a>
### fragment

```ml
function fragment(state, kind, origin, velocity, model, duration, spread, bounce, bounceSound, markType, retailActive)
```

Calls `mq3.client.cgame_effects.effect`, `mq3.compat.numeric.trunc32`, `mq3.client.cgame_effects.randomFloat` and additional helpers from client game effects `fragment`. The final path returns `publish(state,value,retailActive)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `velocity` | `dynamic` | — | Velocity vector used to advance or orient the effect. |
| `model` | `dynamic` | — | Value assigned to `value.model`. |
| `duration` | `dynamic` | — | Lifetime or interval in the same units as this operation's clock. |
| `spread` | `dynamic` | — | Value used by `value.endTime=state.time+duration+n.trunc32(randomFloat(state)*spread)`. |
| `bounce` | `dynamic` | — | Value assigned to `value.bounceFactor`. |
| `bounceSound` | `dynamic` | — | Value assigned to `value.bounceSound`. |
| `markType` | `dynamic` | — | Value assigned to `value.markType`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L275)

<a id="function-function-mq3-client-cgame-effects-gibplayer-function-gibplayer-state-origin-retailactive-src-mq3-client-cgame-effects-ml-2021119528"></a>
### gibPlayer

```ml
function gibPlayer(state, origin, retailActive)
```

CG_GibPlayer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.blood`, `state.gibs`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L304)

<a id="function-function-mq3-client-cgame-effects-gibvelocity-function-gibvelocity-state-horizontal-jump-src-mq3-client-cgame-effects-ml-1236763881"></a>
### gibVelocity

```ml
function gibVelocity(state, horizontal, jump)
```

Builds the client game effects `gibVelocity` sequence from `[crandom(state)*horizontal,crandom(state)*horizontal,jump+crandom(state)*horizontal]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game effects state passed to the helper calls in `gibVelocity`. |
| `horizontal` | `dynamic` | — | Whether the control/operation uses horizontal rather than vertical layout. |
| `jump` | `dynamic` | — | Value used by `return [crandom(state)*horizontal,crandom(state)*horizontal,jump+crandom(state)*horizontal]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L298)

<a id="constant-constant-mq3-client-cgame-effects-invul-impact-model-const-invul-impact-model-models-powerups-shield-impact-md3-src-mq3-client-cgame-effects-ml-20086680"></a>
### INVUL_IMPACT_MODEL

```ml
const INVUL_IMPACT_MODEL = "models/powerups/shield/impact.md3"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L46)

<a id="constant-constant-mq3-client-cgame-effects-invul-juiced-model-const-invul-juiced-model-models-powerups-shield-juicer-md3-src-mq3-client-cgame-effects-ml-1558054176"></a>
### INVUL_JUICED_MODEL

```ml
const INVUL_JUICED_MODEL = "models/powerups/shield/juicer.md3"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L47)

<a id="function-function-mq3-client-cgame-effects-invulnerabilityimpact-function-invulnerabilityimpact-state-origin-angles-retailactive-src-mq3-client-cgame-effects-ml-1255838336"></a>
### invulnerabilityImpact

```ml
function invulnerabilityImpact(state, origin, angles, retailActive)
```

CG_InvulnerabilityImpact

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `angles` | `dynamic` | — | Value used by `value.angles=copy3(angles)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L229)

<a id="function-function-mq3-client-cgame-effects-invulnerabilityjuiced-function-invulnerabilityjuiced-state-origin-retailactive-src-mq3-client-cgame-effects-ml-1039762204"></a>
### invulnerabilityJuiced

```ml
function invulnerabilityJuiced(state, origin, retailActive)
```

CG_InvulnerabilityJuiced

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L238)

<a id="constant-constant-mq3-client-cgame-effects-kamikaze-model-const-kamikaze-model-models-weaphits-kamboom2-md3-src-mq3-client-cgame-effects-ml-1750521420"></a>
### KAMIKAZE_MODEL

```ml
const KAMIKAZE_MODEL = "models/weaphits/kamboom2.md3"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L43)

<a id="function-function-mq3-client-cgame-effects-kamikazeeffect-function-kamikazeeffect-state-origin-retailactive-src-mq3-client-cgame-effects-ml-1097376010"></a>
### kamikazeEffect

```ml
function kamikazeEffect(state, origin, retailActive)
```

CG_KamikazeEffect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L170)

<a id="function-function-mq3-client-cgame-effects-launchexplode-function-launchexplode-state-origin-velocity-model-retailactive-src-mq3-client-cgame-effects-ml-573743474"></a>
### launchExplode

```ml
function launchExplode(state, origin, velocity, model, retailActive)
```

CG_LaunchExplode

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_effects.fragment`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_effects.fragment`. |
| `velocity` | `dynamic` | — | Velocity vector used to advance or orient the effect. Forwarded to `mq3.client.cgame_effects.fragment`. |
| `model` | `dynamic` | — | Argument 5 of `mq3.client.cgame_effects.fragment`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_effects.fragment`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L292)

<a id="function-function-mq3-client-cgame-effects-launchgib-function-launchgib-state-origin-velocity-model-retailactive-src-mq3-client-cgame-effects-ml-197171976"></a>
### launchGib

```ml
function launchGib(state, origin, velocity, model, retailActive)
```

CG_LaunchGib

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_effects.fragment`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_effects.fragment`. |
| `velocity` | `dynamic` | — | Velocity vector used to advance or orient the effect. Forwarded to `mq3.client.cgame_effects.fragment`. |
| `model` | `dynamic` | — | Argument 5 of `mq3.client.cgame_effects.fragment`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_effects.fragment`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L285)

<a id="constant-constant-mq3-client-cgame-effects-le-explosion-const-le-explosion-cgabi-le-explosion-src-mq3-client-cgame-effects-ml-2125148464"></a>
### LE_EXPLOSION

```ml
const LE_EXPLOSION = cgabi.LE_EXPLOSION
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L14)

<a id="constant-constant-mq3-client-cgame-effects-le-fade-rgb-const-le-fade-rgb-cgabi-le-fade-rgb-src-mq3-client-cgame-effects-ml-278667575"></a>
### LE_FADE_RGB

```ml
const LE_FADE_RGB = cgabi.LE_FADE_RGB
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L13)

<a id="constant-constant-mq3-client-cgame-effects-le-fragment-const-le-fragment-cgabi-le-fragment-src-mq3-client-cgame-effects-ml-1119387257"></a>
### LE_FRAGMENT

```ml
const LE_FRAGMENT = cgabi.LE_FRAGMENT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L16)

<a id="constant-constant-mq3-client-cgame-effects-le-invulimpact-const-le-invulimpact-cgabi-le-invulimpact-src-mq3-client-cgame-effects-ml-472861057"></a>
### LE_INVULIMPACT

```ml
const LE_INVULIMPACT = cgabi.LE_INVULIMPACT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L20)

<a id="constant-constant-mq3-client-cgame-effects-le-invuljuiced-const-le-invuljuiced-cgabi-le-invuljuiced-src-mq3-client-cgame-effects-ml-2040249287"></a>
### LE_INVULJUICED

```ml
const LE_INVULJUICED = cgabi.LE_INVULJUICED
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L21)

<a id="constant-constant-mq3-client-cgame-effects-le-kamikaze-const-le-kamikaze-cgabi-le-kamikaze-src-mq3-client-cgame-effects-ml-1918918102"></a>
### LE_KAMIKAZE

```ml
const LE_KAMIKAZE = cgabi.LE_KAMIKAZE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L19)

<a id="constant-constant-mq3-client-cgame-effects-le-move-scale-fade-const-le-move-scale-fade-cgabi-le-move-scale-fade-src-mq3-client-cgame-effects-ml-591232356"></a>
### LE_MOVE_SCALE_FADE

```ml
const LE_MOVE_SCALE_FADE = cgabi.LE_MOVE_SCALE_FADE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L12)

<a id="constant-constant-mq3-client-cgame-effects-le-scoreplum-const-le-scoreplum-cgabi-le-scoreplum-src-mq3-client-cgame-effects-ml-1374214745"></a>
### LE_SCOREPLUM

```ml
const LE_SCOREPLUM = cgabi.LE_SCOREPLUM
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L17)

<a id="constant-constant-mq3-client-cgame-effects-le-showrefentity-const-le-showrefentity-cgabi-le-showrefentity-src-mq3-client-cgame-effects-ml-1265978878"></a>
### LE_SHOWREFENTITY

```ml
const LE_SHOWREFENTITY = cgabi.LE_SHOWREFENTITY
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L18)

<a id="constant-constant-mq3-client-cgame-effects-le-sprite-explosion-const-le-sprite-explosion-cgabi-le-sprite-explosion-src-mq3-client-cgame-effects-ml-718444836"></a>
### LE_SPRITE_EXPLOSION

```ml
const LE_SPRITE_EXPLOSION = cgabi.LE_SPRITE_EXPLOSION
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L15)

<a id="constant-constant-mq3-client-cgame-effects-lebs-blood-const-lebs-blood-cgabi-lebs-blood-src-mq3-client-cgame-effects-ml-2088876636"></a>
### LEBS_BLOOD

```ml
const LEBS_BLOOD = cgabi.LEBS_BLOOD
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L30)

<a id="constant-constant-mq3-client-cgame-effects-lebs-brass-const-lebs-brass-cgabi-lebs-brass-src-mq3-client-cgame-effects-ml-257741403"></a>
### LEBS_BRASS

```ml
const LEBS_BRASS = cgabi.LEBS_BRASS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L31)

<a id="constant-constant-mq3-client-cgame-effects-lebs-none-const-lebs-none-cgabi-lebs-none-src-mq3-client-cgame-effects-ml-1807886106"></a>
### LEBS_NONE

```ml
const LEBS_NONE = cgabi.LEBS_NONE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L29)

<a id="constant-constant-mq3-client-cgame-effects-lef-puff-dont-scale-const-lef-puff-dont-scale-cgabi-lef-puff-dont-scale-src-mq3-client-cgame-effects-ml-818432991"></a>
### LEF_PUFF_DONT_SCALE

```ml
const LEF_PUFF_DONT_SCALE = cgabi.LEF_PUFF_DONT_SCALE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L22)

<a id="constant-constant-mq3-client-cgame-effects-lemt-blood-const-lemt-blood-cgabi-lemt-blood-src-mq3-client-cgame-effects-ml-1923755090"></a>
### LEMT_BLOOD

```ml
const LEMT_BLOOD = cgabi.LEMT_BLOOD
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L33)

<a id="constant-constant-mq3-client-cgame-effects-lemt-none-const-lemt-none-cgabi-lemt-none-src-mq3-client-cgame-effects-ml-252928176"></a>
### LEMT_NONE

```ml
const LEMT_NONE = cgabi.LEMT_NONE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L32)

<a id="constant-constant-mq3-client-cgame-effects-lightning-shader-const-lightning-shader-lightningboltnew-src-mq3-client-cgame-effects-ml-588476248"></a>
### LIGHTNING_SHADER

```ml
const LIGHTNING_SHADER = "lightningBoltNew"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L42)

<a id="function-function-mq3-client-cgame-effects-lightningboltbeam-function-lightningboltbeam-state-start-finish-retailactive-src-mq3-client-cgame-effects-ml-1512983625"></a>
### lightningBoltBeam

```ml
function lightningBoltBeam(state, start, finish, retailActive)
```

CG_LightningBoltBeam

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `start` | `dynamic` | — | Value used by `value.position=copy3(start)`. |
| `finish` | `dynamic` | — | Value used by `value.oldPosition=copy3(finish)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L162)

<a id="function-function-mq3-client-cgame-effects-makeexplosion-function-makeexplosion-state-origin-direction-model-shader-msec-issprite-retailactive-src-mq3-client-cgame-effects-ml-1689024574"></a>
### makeExplosion

```ml
function makeExplosion(state, origin, direction, model, shader, msec, isSprite, retailActive)
```

CG_MakeExplosion

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. |
| `model` | `dynamic` | — | Value assigned to `value.model`. |
| `shader` | `dynamic` | — | Value assigned to `value.shader`. |
| `msec` | `dynamic` | — | Time interval in milliseconds. |
| `isSprite` | `dynamic` | — | Value used by `if isSprite then value.leType=LE_SPRITE_EXPLOSION`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L183)

<a id="function-function-mq3-client-cgame-effects-obeliskexplode-function-obeliskexplode-state-origin-entitynum-retailactive-src-mq3-client-cgame-effects-ml-461994573"></a>
### obeliskExplode

```ml
function obeliskExplode(state, origin, entityNum, retailActive)
```

CG_ObeliskExplode

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game effects state passed to the helper calls in `obeliskExplode`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `entityNum` | `dynamic` | — | Entity number identifying a world or player entity. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L196)

<a id="function-function-mq3-client-cgame-effects-obeliskpain-function-obeliskpain-state-origin-retailactive-src-mq3-client-cgame-effects-ml-588782168"></a>
### obeliskPain

```ml
function obeliskPain(state, origin, retailActive)
```

CG_ObeliskPain

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game effects state passed to the helper calls in `obeliskPain`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L220)

<a id="function-function-mq3-client-cgame-effects-publish-function-publish-state-value-retailactive-src-mq3-client-cgame-effects-ml-119347345"></a>
### publish

```ml
function publish(state, value, retailActive)
```

Updates `value.dispatched`, `state.actions`, `state.emitted`, `state.suppressed` during client game effects `publish`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game effects record/storage; this routine assigns `state.actions`, `state.emitted`, `state.suppressed`. |
| `value` | `dynamic` | — | Mutable client game effects record/storage; this routine assigns `value.dispatched`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L73)

<a id="function-function-mq3-client-cgame-effects-randint-function-randint-state-src-mq3-client-cgame-effects-ml-1889090099"></a>
### randInt

```ml
function randInt(state)
```

Updates `state.randomAt`, `state.randomSeed` during client game effects `randInt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game effects record/storage; this routine assigns `state.randomAt`, `state.randomSeed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L88)

<a id="function-function-mq3-client-cgame-effects-randomfloat-function-randomfloat-state-src-mq3-client-cgame-effects-ml-1768297421"></a>
### randomFloat

```ml
function randomFloat(state)
```

Adapts `mq3.compat.numeric.fdiv` to client game effects `randomFloat`, returning its result for `randInt(state), 32767.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.compat.numeric.fdiv`; passed as `randInt(state)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L94)

<a id="constant-constant-mq3-client-cgame-effects-rf-third-person-const-rf-third-person-2-src-mq3-client-cgame-effects-ml-87327329"></a>
### RF_THIRD_PERSON

```ml
const RF_THIRD_PERSON = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L28)

<a id="constant-constant-mq3-client-cgame-effects-rocket-explosion-shader-const-rocket-explosion-shader-rocketexplosion-src-mq3-client-cgame-effects-ml-1376717538"></a>
### ROCKET_EXPLOSION_SHADER

```ml
const ROCKET_EXPLOSION_SHADER = "rocketExplosion"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L45)

<a id="constant-constant-mq3-client-cgame-effects-rt-lightning-const-rt-lightning-5-src-mq3-client-cgame-effects-ml-1221568460"></a>
### RT_LIGHTNING

```ml
const RT_LIGHTNING = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L27)

<a id="constant-constant-mq3-client-cgame-effects-rt-model-const-rt-model-1-src-mq3-client-cgame-effects-ml-939194898"></a>
### RT_MODEL

```ml
const RT_MODEL = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L25)

<a id="constant-constant-mq3-client-cgame-effects-rt-sprite-const-rt-sprite-2-src-mq3-client-cgame-effects-ml-1928790433"></a>
### RT_SPRITE

```ml
const RT_SPRITE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L26)

<a id="function-function-mq3-client-cgame-effects-scoreplum-function-scoreplum-state-client-origin-score-retailactive-src-mq3-client-cgame-effects-ml-144516659"></a>
### scorePlum

```ml
function scorePlum(state, client, origin, score, retailActive)
```

CG_ScorePlum

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game effects record/storage; this routine assigns `state.lastScorePosition`. |
| `client` | `dynamic` | — | Value used by `if client!=state.predictedClient or not state.scorePlum then return void end if`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `score` | `dynamic` | — | Value assigned to `value.radius`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L248)

<a id="function-function-mq3-client-cgame-effects-setrandomints-function-setrandomints-state-values-src-mq3-client-cgame-effects-ml-655378243"></a>
### setRandomInts

```ml
function setRandomInts(state, values)
```

Updates `state.randomInts`, `state.randomAt` during client game effects `setRandomInts`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game effects record/storage; this routine assigns `state.randomInts`, `state.randomAt`. |
| `values` | `dynamic` | — | Value assigned to `state.randomInts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L85)

<a id="constant-constant-mq3-client-cgame-effects-smoke2-model-const-smoke2-model-models-weapons2-shells-s-shell-md3-src-mq3-client-cgame-effects-ml-1416443140"></a>
### SMOKE2_MODEL

```ml
const SMOKE2_MODEL = "models/weapons2/shells/s_shell.md3"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L49)

<a id="constant-constant-mq3-client-cgame-effects-smoke-ragepro-shader-const-smoke-ragepro-shader-smokepuffragepro-src-mq3-client-cgame-effects-ml-1613419777"></a>
### SMOKE_RAGEPRO_SHADER

```ml
const SMOKE_RAGEPRO_SHADER = "smokePuffRagePro"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L38)

<a id="function-function-mq3-client-cgame-effects-smokepuff-function-smokepuff-state-p-velocity-radius-r-g-b-a-duration-starttime-fadeintime-flags-shader-retailactive-src-mq3-client-cgame-effects-ml-213204150"></a>
### smokePuff

```ml
function smokePuff(state, p, velocity, radius, r, g, b, a, duration, startTime, fadeInTime, flags, shader, retailActive)
```

CG_SmokePuff

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.ragePro`. |
| `p` | `dynamic` | — | Value used by `value.position=copy3(p)`. |
| `velocity` | `dynamic` | — | Velocity vector used to advance or orient the effect. |
| `radius` | `dynamic` | — | Radius used by the spatial or visual calculation. |
| `r` | `dynamic` | — | Value used by `value.color=[r,g,b,a]`. |
| `g` | `dynamic` | — | Value used by `value.color=[r,g,b,a]`. |
| `b` | `dynamic` | — | Value used by `value.color=[r,g,b,a]`. |
| `a` | `dynamic` | — | Value used by `value.color=[r,g,b,a]`. |
| `duration` | `dynamic` | — | Lifetime or interval in the same units as this operation's clock. |
| `startTime` | `dynamic` | — | Value assigned to `value.startTime`, `value.endTime`, `value.shaderTime`. |
| `fadeInTime` | `dynamic` | — | Value assigned to `value.fadeInTime`. |
| `flags` | `dynamic` | — | Value assigned to `value.flags`. |
| `shader` | `dynamic` | — | Value assigned to `value.shader`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L142)

<a id="function-function-mq3-client-cgame-effects-smokerandom-function-smokerandom-state-src-mq3-client-cgame-effects-ml-435936083"></a>
### smokeRandom

```ml
function smokeRandom(state)
```

Updates `state.smokeSeed` during client game effects `smokeRandom`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game effects record/storage; this routine assigns `state.smokeSeed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L100)

<a id="function-function-mq3-client-cgame-effects-soundaction-function-soundaction-state-kind-origin-sound-retailactive-src-mq3-client-cgame-effects-ml-2033745959"></a>
### soundAction

```ml
function soundAction(state, kind, origin, sound, retailActive)
```

Calls `mq3.client.cgame_effects.effect`, `mq3.client.cgame_effects.copy3`, `mq3.client.cgame_effects.publish` from client game effects `soundAction`. The final path returns `publish(state,value,retailActive)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game effects state passed to the helper calls in `soundAction`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `sound` | `dynamic` | — | Value assigned to `value.shader`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L212)

<a id="function-function-mq3-client-cgame-effects-spawneffect-function-spawneffect-state-origin-retailactive-src-mq3-client-cgame-effects-ml-1947804834"></a>
### spawnEffect

```ml
function spawnEffect(state, origin, retailActive)
```

CG_SpawnEffect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`, `state.missionpack`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L151)

- [mq3.client.cgame_effects.State](Type-mq3-client-cgame-effects-state-1269913826.md) — struct
<a id="constant-constant-mq3-client-cgame-effects-teleport-missionpack-model-const-teleport-missionpack-model-models-powerups-pop-md3-src-mq3-client-cgame-effects-ml-1624284145"></a>
### TELEPORT_MISSIONPACK_MODEL

```ml
const TELEPORT_MISSIONPACK_MODEL = "models/powerups/pop.md3"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L41)

<a id="constant-constant-mq3-client-cgame-effects-teleport-model-const-teleport-model-models-misc-telep-md3-src-mq3-client-cgame-effects-ml-2135169923"></a>
### TELEPORT_MODEL

```ml
const TELEPORT_MODEL = "models/misc/telep.md3"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L40)

<a id="constant-constant-mq3-client-cgame-effects-teleport-shader-const-teleport-shader-teleporteffect-src-mq3-client-cgame-effects-ml-811091115"></a>
### TELEPORT_SHADER

```ml
const TELEPORT_SHADER = "teleportEffect"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L39)

<a id="constant-constant-mq3-client-cgame-effects-tr-gravity-const-tr-gravity-5-src-mq3-client-cgame-effects-ml-1328676796"></a>
### TR_GRAVITY

```ml
const TR_GRAVITY = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L24)

<a id="constant-constant-mq3-client-cgame-effects-tr-linear-const-tr-linear-2-src-mq3-client-cgame-effects-ml-790742305"></a>
### TR_LINEAR

```ml
const TR_LINEAR = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L23)

<a id="function-function-mq3-client-cgame-effects-variationsound-function-variationsound-prefix-choice-src-mq3-client-cgame-effects-ml-1965045827"></a>
### variationSound

```ml
function variationSound(prefix, choice)
```

Evaluates client game effects `variationSound` and returns `"sound/items/"+prefix+suffix` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prefix` | `dynamic` | — | Value used by `return "sound/items/"+prefix+suffix`. |
| `choice` | `dynamic` | — | Value used by `if choice==2 then suffix="02.wav" else if choice==3 then suffix="03.wav" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L203)

<a id="constant-constant-mq3-client-cgame-effects-water-bubble-shader-const-water-bubble-shader-waterbubble-src-mq3-client-cgame-effects-ml-1556804892"></a>
### WATER_BUBBLE_SHADER

```ml
const WATER_BUBBLE_SHADER = "waterBubble"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L37)

<a id="function-function-mq3-client-cgame-effects-white-function-white-src-mq3-client-cgame-effects-ml-1912419416"></a>
### white

```ml
function white()
```

Builds the client game effects `white` sequence from `[1.0,1.0,1.0,1.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L108)
