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
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L189)

<a id="function-function-mq3-client-cgame-effects-bleed-function-bleed-state-origin-entitynum-retailactive-src-mq3-client-cgame-effects-ml-1785957709"></a>
### bleed

```ml
function bleed(state, origin, entityNum, retailActive)
```

CG_Bleed

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L164)

<a id="constant-constant-mq3-client-cgame-effects-blood-explosion-shader-const-blood-explosion-shader-bloodexplosion-src-mq3-client-cgame-effects-ml-1775586426"></a>
### BLOOD_EXPLOSION_SHADER

```ml
const BLOOD_EXPLOSION_SHADER = "bloodExplosion"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L48)

<a id="function-function-mq3-client-cgame-effects-bubbletrail-function-bubbletrail-state-start-finish-spacing-retailactive-src-mq3-client-cgame-effects-ml-2039915180"></a>
### bubbleTrail

```ml
function bubbleTrail(state, start, finish, spacing, retailActive)
```

CG_BubbleTrail

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `spacing` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L86)

<a id="constant-constant-mq3-client-cgame-effects-chan-body-const-chan-body-4-src-mq3-client-cgame-effects-ml-925678475"></a>
### CHAN_BODY

```ml
const CHAN_BODY = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L35)

<a id="function-function-mq3-client-cgame-effects-clear-function-clear-state-src-mq3-client-cgame-effects-ml-1901186961"></a>
### clear

```ml
function clear(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L70)

<a id="function-function-mq3-client-cgame-effects-copy3-function-copy3-value-src-mq3-client-cgame-effects-ml-1890437099"></a>
### copy3

```ml
function copy3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L82)

<a id="function-function-mq3-client-cgame-effects-crandom-function-crandom-state-src-mq3-client-cgame-effects-ml-1345803547"></a>
### crandom

```ml
function crandom(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L77)

<a id="function-function-mq3-client-cgame-effects-create-function-create-src-mq3-client-cgame-effects-ml-425149202"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L56)

<a id="constant-constant-mq3-client-cgame-effects-dish-flash-model-const-dish-flash-model-models-weaphits-boom01-md3-src-mq3-client-cgame-effects-ml-266284382"></a>
### DISH_FLASH_MODEL

```ml
const DISH_FLASH_MODEL = "models/weaphits/boom01.md3"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L44)

<a id="function-function-mq3-client-cgame-effects-effect-function-effect-boundary-kind-src-mq3-client-cgame-effects-ml-1472367082"></a>
### effect

```ml
function effect(boundary, kind)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L60)

- [mq3.client.cgame_effects.Effect](Type-mq3-client-cgame-effects-effect-307195720.md) — struct
<a id="constant-constant-mq3-client-cgame-effects-entitynum-none-const-entitynum-none-1023-src-mq3-client-cgame-effects-ml-2045724605"></a>
### ENTITYNUM_NONE

```ml
const ENTITYNUM_NONE = 1023
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L34)

<a id="function-function-mq3-client-cgame-effects-fragment-function-fragment-state-kind-origin-velocity-model-duration-spread-bounce-bouncesound-marktype-retailactive-src-mq3-client-cgame-effects-ml-198252413"></a>
### fragment

```ml
function fragment(state, kind, origin, velocity, model, duration, spread, bounce, bounceSound, markType, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `duration` | `dynamic` | — |  |
| `spread` | `dynamic` | — |  |
| `bounce` | `dynamic` | — |  |
| `bounceSound` | `dynamic` | — |  |
| `markType` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L169)

<a id="function-function-mq3-client-cgame-effects-gibplayer-function-gibplayer-state-origin-retailactive-src-mq3-client-cgame-effects-ml-2021119528"></a>
### gibPlayer

```ml
function gibPlayer(state, origin, retailActive)
```

CG_GibPlayer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L181)

<a id="function-function-mq3-client-cgame-effects-gibvelocity-function-gibvelocity-state-horizontal-jump-src-mq3-client-cgame-effects-ml-1236763881"></a>
### gibVelocity

```ml
function gibVelocity(state, horizontal, jump)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `horizontal` | `dynamic` | — |  |
| `jump` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L178)

<a id="constant-constant-mq3-client-cgame-effects-invul-impact-model-const-invul-impact-model-models-powerups-shield-impact-md3-src-mq3-client-cgame-effects-ml-20086680"></a>
### INVUL_IMPACT_MODEL

```ml
const INVUL_IMPACT_MODEL = "models/powerups/shield/impact.md3"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L46)

<a id="constant-constant-mq3-client-cgame-effects-invul-juiced-model-const-invul-juiced-model-models-powerups-shield-juicer-md3-src-mq3-client-cgame-effects-ml-1558054176"></a>
### INVUL_JUICED_MODEL

```ml
const INVUL_JUICED_MODEL = "models/powerups/shield/juicer.md3"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L47)

<a id="function-function-mq3-client-cgame-effects-invulnerabilityimpact-function-invulnerabilityimpact-state-origin-angles-retailactive-src-mq3-client-cgame-effects-ml-1255838336"></a>
### invulnerabilityImpact

```ml
function invulnerabilityImpact(state, origin, angles, retailActive)
```

CG_InvulnerabilityImpact

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L147)

<a id="function-function-mq3-client-cgame-effects-invulnerabilityjuiced-function-invulnerabilityjuiced-state-origin-retailactive-src-mq3-client-cgame-effects-ml-1039762204"></a>
### invulnerabilityJuiced

```ml
function invulnerabilityJuiced(state, origin, retailActive)
```

CG_InvulnerabilityJuiced

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L153)

<a id="constant-constant-mq3-client-cgame-effects-kamikaze-model-const-kamikaze-model-models-weaphits-kamboom2-md3-src-mq3-client-cgame-effects-ml-1750521420"></a>
### KAMIKAZE_MODEL

```ml
const KAMIKAZE_MODEL = "models/weaphits/kamboom2.md3"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L43)

<a id="function-function-mq3-client-cgame-effects-kamikazeeffect-function-kamikazeeffect-state-origin-retailactive-src-mq3-client-cgame-effects-ml-1097376010"></a>
### kamikazeEffect

```ml
function kamikazeEffect(state, origin, retailActive)
```

CG_KamikazeEffect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L116)

<a id="function-function-mq3-client-cgame-effects-launchexplode-function-launchexplode-state-origin-velocity-model-retailactive-src-mq3-client-cgame-effects-ml-573743474"></a>
### launchExplode

```ml
function launchExplode(state, origin, velocity, model, retailActive)
```

CG_LaunchExplode

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L176)

<a id="function-function-mq3-client-cgame-effects-launchgib-function-launchgib-state-origin-velocity-model-retailactive-src-mq3-client-cgame-effects-ml-197171976"></a>
### launchGib

```ml
function launchGib(state, origin, velocity, model, retailActive)
```

CG_LaunchGib

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L174)

<a id="constant-constant-mq3-client-cgame-effects-le-explosion-const-le-explosion-cgabi-le-explosion-src-mq3-client-cgame-effects-ml-2125148464"></a>
### LE_EXPLOSION

```ml
const LE_EXPLOSION = cgabi.LE_EXPLOSION
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L14)

<a id="constant-constant-mq3-client-cgame-effects-le-fade-rgb-const-le-fade-rgb-cgabi-le-fade-rgb-src-mq3-client-cgame-effects-ml-278667575"></a>
### LE_FADE_RGB

```ml
const LE_FADE_RGB = cgabi.LE_FADE_RGB
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L13)

<a id="constant-constant-mq3-client-cgame-effects-le-fragment-const-le-fragment-cgabi-le-fragment-src-mq3-client-cgame-effects-ml-1119387257"></a>
### LE_FRAGMENT

```ml
const LE_FRAGMENT = cgabi.LE_FRAGMENT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L16)

<a id="constant-constant-mq3-client-cgame-effects-le-invulimpact-const-le-invulimpact-cgabi-le-invulimpact-src-mq3-client-cgame-effects-ml-472861057"></a>
### LE_INVULIMPACT

```ml
const LE_INVULIMPACT = cgabi.LE_INVULIMPACT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L20)

<a id="constant-constant-mq3-client-cgame-effects-le-invuljuiced-const-le-invuljuiced-cgabi-le-invuljuiced-src-mq3-client-cgame-effects-ml-2040249287"></a>
### LE_INVULJUICED

```ml
const LE_INVULJUICED = cgabi.LE_INVULJUICED
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L21)

<a id="constant-constant-mq3-client-cgame-effects-le-kamikaze-const-le-kamikaze-cgabi-le-kamikaze-src-mq3-client-cgame-effects-ml-1918918102"></a>
### LE_KAMIKAZE

```ml
const LE_KAMIKAZE = cgabi.LE_KAMIKAZE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L19)

<a id="constant-constant-mq3-client-cgame-effects-le-move-scale-fade-const-le-move-scale-fade-cgabi-le-move-scale-fade-src-mq3-client-cgame-effects-ml-591232356"></a>
### LE_MOVE_SCALE_FADE

```ml
const LE_MOVE_SCALE_FADE = cgabi.LE_MOVE_SCALE_FADE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L12)

<a id="constant-constant-mq3-client-cgame-effects-le-scoreplum-const-le-scoreplum-cgabi-le-scoreplum-src-mq3-client-cgame-effects-ml-1374214745"></a>
### LE_SCOREPLUM

```ml
const LE_SCOREPLUM = cgabi.LE_SCOREPLUM
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L17)

<a id="constant-constant-mq3-client-cgame-effects-le-showrefentity-const-le-showrefentity-cgabi-le-showrefentity-src-mq3-client-cgame-effects-ml-1265978878"></a>
### LE_SHOWREFENTITY

```ml
const LE_SHOWREFENTITY = cgabi.LE_SHOWREFENTITY
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L18)

<a id="constant-constant-mq3-client-cgame-effects-le-sprite-explosion-const-le-sprite-explosion-cgabi-le-sprite-explosion-src-mq3-client-cgame-effects-ml-718444836"></a>
### LE_SPRITE_EXPLOSION

```ml
const LE_SPRITE_EXPLOSION = cgabi.LE_SPRITE_EXPLOSION
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L15)

<a id="constant-constant-mq3-client-cgame-effects-lebs-blood-const-lebs-blood-cgabi-lebs-blood-src-mq3-client-cgame-effects-ml-2088876636"></a>
### LEBS_BLOOD

```ml
const LEBS_BLOOD = cgabi.LEBS_BLOOD
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L30)

<a id="constant-constant-mq3-client-cgame-effects-lebs-brass-const-lebs-brass-cgabi-lebs-brass-src-mq3-client-cgame-effects-ml-257741403"></a>
### LEBS_BRASS

```ml
const LEBS_BRASS = cgabi.LEBS_BRASS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L31)

<a id="constant-constant-mq3-client-cgame-effects-lebs-none-const-lebs-none-cgabi-lebs-none-src-mq3-client-cgame-effects-ml-1807886106"></a>
### LEBS_NONE

```ml
const LEBS_NONE = cgabi.LEBS_NONE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L29)

<a id="constant-constant-mq3-client-cgame-effects-lef-puff-dont-scale-const-lef-puff-dont-scale-cgabi-lef-puff-dont-scale-src-mq3-client-cgame-effects-ml-818432991"></a>
### LEF_PUFF_DONT_SCALE

```ml
const LEF_PUFF_DONT_SCALE = cgabi.LEF_PUFF_DONT_SCALE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L22)

<a id="constant-constant-mq3-client-cgame-effects-lemt-blood-const-lemt-blood-cgabi-lemt-blood-src-mq3-client-cgame-effects-ml-1923755090"></a>
### LEMT_BLOOD

```ml
const LEMT_BLOOD = cgabi.LEMT_BLOOD
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L33)

<a id="constant-constant-mq3-client-cgame-effects-lemt-none-const-lemt-none-cgabi-lemt-none-src-mq3-client-cgame-effects-ml-252928176"></a>
### LEMT_NONE

```ml
const LEMT_NONE = cgabi.LEMT_NONE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L32)

<a id="constant-constant-mq3-client-cgame-effects-lightning-shader-const-lightning-shader-lightningboltnew-src-mq3-client-cgame-effects-ml-588476248"></a>
### LIGHTNING_SHADER

```ml
const LIGHTNING_SHADER = "lightningBoltNew"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L42)

<a id="function-function-mq3-client-cgame-effects-lightningboltbeam-function-lightningboltbeam-state-start-finish-retailactive-src-mq3-client-cgame-effects-ml-1512983625"></a>
### lightningBoltBeam

```ml
function lightningBoltBeam(state, start, finish, retailActive)
```

CG_LightningBoltBeam

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L111)

<a id="function-function-mq3-client-cgame-effects-makeexplosion-function-makeexplosion-state-origin-direction-model-shader-msec-issprite-retailactive-src-mq3-client-cgame-effects-ml-1689024574"></a>
### makeExplosion

```ml
function makeExplosion(state, origin, direction, model, shader, msec, isSprite, retailActive)
```

CG_MakeExplosion

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `msec` | `dynamic` | — |  |
| `isSprite` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L121)

<a id="function-function-mq3-client-cgame-effects-obeliskexplode-function-obeliskexplode-state-origin-entitynum-retailactive-src-mq3-client-cgame-effects-ml-461994573"></a>
### obeliskExplode

```ml
function obeliskExplode(state, origin, entityNum, retailActive)
```

CG_ObeliskExplode

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L130)

<a id="function-function-mq3-client-cgame-effects-obeliskpain-function-obeliskpain-state-origin-retailactive-src-mq3-client-cgame-effects-ml-588782168"></a>
### obeliskPain

```ml
function obeliskPain(state, origin, retailActive)
```

CG_ObeliskPain

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L142)

<a id="function-function-mq3-client-cgame-effects-publish-function-publish-state-value-retailactive-src-mq3-client-cgame-effects-ml-119347345"></a>
### publish

```ml
function publish(state, value, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L64)

<a id="function-function-mq3-client-cgame-effects-randint-function-randint-state-src-mq3-client-cgame-effects-ml-1889090099"></a>
### randInt

```ml
function randInt(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L72)

<a id="function-function-mq3-client-cgame-effects-randomfloat-function-randomfloat-state-src-mq3-client-cgame-effects-ml-1768297421"></a>
### randomFloat

```ml
function randomFloat(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L76)

<a id="constant-constant-mq3-client-cgame-effects-rf-third-person-const-rf-third-person-2-src-mq3-client-cgame-effects-ml-87327329"></a>
### RF_THIRD_PERSON

```ml
const RF_THIRD_PERSON = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L28)

<a id="constant-constant-mq3-client-cgame-effects-rocket-explosion-shader-const-rocket-explosion-shader-rocketexplosion-src-mq3-client-cgame-effects-ml-1376717538"></a>
### ROCKET_EXPLOSION_SHADER

```ml
const ROCKET_EXPLOSION_SHADER = "rocketExplosion"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L45)

<a id="constant-constant-mq3-client-cgame-effects-rt-lightning-const-rt-lightning-5-src-mq3-client-cgame-effects-ml-1221568460"></a>
### RT_LIGHTNING

```ml
const RT_LIGHTNING = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L27)

<a id="constant-constant-mq3-client-cgame-effects-rt-model-const-rt-model-1-src-mq3-client-cgame-effects-ml-939194898"></a>
### RT_MODEL

```ml
const RT_MODEL = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L25)

<a id="constant-constant-mq3-client-cgame-effects-rt-sprite-const-rt-sprite-2-src-mq3-client-cgame-effects-ml-1928790433"></a>
### RT_SPRITE

```ml
const RT_SPRITE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L26)

<a id="function-function-mq3-client-cgame-effects-scoreplum-function-scoreplum-state-client-origin-score-retailactive-src-mq3-client-cgame-effects-ml-144516659"></a>
### scorePlum

```ml
function scorePlum(state, client, origin, score, retailActive)
```

CG_ScorePlum

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `score` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L158)

<a id="function-function-mq3-client-cgame-effects-setrandomints-function-setrandomints-state-values-src-mq3-client-cgame-effects-ml-655378243"></a>
### setRandomInts

```ml
function setRandomInts(state, values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L71)

<a id="constant-constant-mq3-client-cgame-effects-smoke2-model-const-smoke2-model-models-weapons2-shells-s-shell-md3-src-mq3-client-cgame-effects-ml-1416443140"></a>
### SMOKE2_MODEL

```ml
const SMOKE2_MODEL = "models/weapons2/shells/s_shell.md3"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L49)

<a id="constant-constant-mq3-client-cgame-effects-smoke-ragepro-shader-const-smoke-ragepro-shader-smokepuffragepro-src-mq3-client-cgame-effects-ml-1613419777"></a>
### SMOKE_RAGEPRO_SHADER

```ml
const SMOKE_RAGEPRO_SHADER = "smokePuffRagePro"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L38)

<a id="function-function-mq3-client-cgame-effects-smokepuff-function-smokepuff-state-p-velocity-radius-r-g-b-a-duration-starttime-fadeintime-flags-shader-retailactive-src-mq3-client-cgame-effects-ml-213204150"></a>
### smokePuff

```ml
function smokePuff(state, p, velocity, radius, r, g, b, a, duration, startTime, fadeInTime, flags, shader, retailActive)
```

CG_SmokePuff

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `r` | `dynamic` | — |  |
| `g` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `duration` | `dynamic` | — |  |
| `startTime` | `dynamic` | — |  |
| `fadeInTime` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L98)

<a id="function-function-mq3-client-cgame-effects-smokerandom-function-smokerandom-state-src-mq3-client-cgame-effects-ml-435936083"></a>
### smokeRandom

```ml
function smokeRandom(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L78)

<a id="function-function-mq3-client-cgame-effects-soundaction-function-soundaction-state-kind-origin-sound-retailactive-src-mq3-client-cgame-effects-ml-2033745959"></a>
### soundAction

```ml
function soundAction(state, kind, origin, sound, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L137)

<a id="function-function-mq3-client-cgame-effects-spawneffect-function-spawneffect-state-origin-retailactive-src-mq3-client-cgame-effects-ml-1947804834"></a>
### spawnEffect

```ml
function spawnEffect(state, origin, retailActive)
```

CG_SpawnEffect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L104)

- [mq3.client.cgame_effects.State](Type-mq3-client-cgame-effects-state-1269913826.md) — struct
<a id="constant-constant-mq3-client-cgame-effects-teleport-missionpack-model-const-teleport-missionpack-model-models-powerups-pop-md3-src-mq3-client-cgame-effects-ml-1624284145"></a>
### TELEPORT_MISSIONPACK_MODEL

```ml
const TELEPORT_MISSIONPACK_MODEL = "models/powerups/pop.md3"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L41)

<a id="constant-constant-mq3-client-cgame-effects-teleport-model-const-teleport-model-models-misc-telep-md3-src-mq3-client-cgame-effects-ml-2135169923"></a>
### TELEPORT_MODEL

```ml
const TELEPORT_MODEL = "models/misc/telep.md3"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L40)

<a id="constant-constant-mq3-client-cgame-effects-teleport-shader-const-teleport-shader-teleporteffect-src-mq3-client-cgame-effects-ml-811091115"></a>
### TELEPORT_SHADER

```ml
const TELEPORT_SHADER = "teleportEffect"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L39)

<a id="constant-constant-mq3-client-cgame-effects-tr-gravity-const-tr-gravity-5-src-mq3-client-cgame-effects-ml-1328676796"></a>
### TR_GRAVITY

```ml
const TR_GRAVITY = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L24)

<a id="constant-constant-mq3-client-cgame-effects-tr-linear-const-tr-linear-2-src-mq3-client-cgame-effects-ml-790742305"></a>
### TR_LINEAR

```ml
const TR_LINEAR = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L23)

<a id="function-function-mq3-client-cgame-effects-variationsound-function-variationsound-prefix-choice-src-mq3-client-cgame-effects-ml-1965045827"></a>
### variationSound

```ml
function variationSound(prefix, choice)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prefix` | `dynamic` | — |  |
| `choice` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L134)

<a id="constant-constant-mq3-client-cgame-effects-water-bubble-shader-const-water-bubble-shader-waterbubble-src-mq3-client-cgame-effects-ml-1556804892"></a>
### WATER_BUBBLE_SHADER

```ml
const WATER_BUBBLE_SHADER = "waterBubble"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L37)

<a id="function-function-mq3-client-cgame-effects-white-function-white-src-mq3-client-cgame-effects-ml-1912419416"></a>
### white

```ml
function white()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_effects.ml#L83)
