# `src/mq3/client/playable_effects.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_effects`](Package-mq3-client-playable-effects-2130414046.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-playable-effects-alive-function-alive-effect-nowmilliseconds-src-mq3-client-playable-effects-ml-465423463"></a>
### alive

```ml
function alive(effect, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effect` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L76)

<a id="function-function-mq3-client-playable-effects-billboardsize-function-billboardsize-depth-src-mq3-client-playable-effects-ml-1491055793"></a>
### billboardSize

```ml
function billboardSize(depth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `depth` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L86)

<a id="function-function-mq3-client-playable-effects-category-function-category-classname-src-mq3-client-playable-effects-ml-886208391"></a>
### category

```ml
function category(classname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L33)

<a id="function-function-mq3-client-playable-effects-color-function-color-itemcategory-classname-src-mq3-client-playable-effects-ml-1480937640"></a>
### color

```ml
function color(itemCategory, classname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `itemCategory` | `dynamic` | — |  |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L45)

<a id="function-function-mq3-client-playable-effects-command-function-command-a-b-rgb-src-mq3-client-playable-effects-ml-707579908"></a>
### command

```ml
function command(a, b, rgb)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `rgb` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L80)

<a id="constant-constant-mq3-client-playable-effects-default-effect-milliseconds-const-default-effect-milliseconds-180-src-mq3-client-playable-effects-ml-2034347384"></a>
### DEFAULT_EFFECT_MILLISECONDS

```ml
const DEFAULT_EFFECT_MILLISECONDS = 180
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L18)

<a id="function-function-mq3-client-playable-effects-defaultshot-function-defaultshot-startpoint-impactpoint-nowmilliseconds-src-mq3-client-playable-effects-ml-5949286"></a>
### defaultShot

```ml
function defaultShot(startPoint, impactPoint, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `startPoint` | `dynamic` | — |  |
| `impactPoint` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L72)

<a id="function-function-mq3-client-playable-effects-draw-function-draw-lines-src-mq3-client-playable-effects-ml-1232547011"></a>
### draw

```ml
function draw(lines)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lines` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L160)

<a id="function-function-mq3-client-playable-effects-effectcolor-function-effectcolor-effect-nowmilliseconds-src-mq3-client-playable-effects-ml-1187559989"></a>
### effectColor

```ml
function effectColor(effect, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effect` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L116)

<a id="function-function-mq3-client-playable-effects-effectlines-function-effectlines-camera-effect-nowmilliseconds-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-effects-ml-1778075122"></a>
### effectLines

```ml
function effectLines(camera, effect, nowMilliseconds, width, height, horizontalFovDegrees, nearDistance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `effect` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `horizontalFovDegrees` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L124)

<a id="function-function-mq3-client-playable-effects-framelines-function-framelines-camera-items-effects-nowmilliseconds-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-effects-ml-363094809"></a>
### frameLines

```ml
function frameLines(camera, items, effects, nowMilliseconds, width, height, horizontalFovDegrees, nearDistance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `items` | `dynamic` | — |  |
| `effects` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `horizontalFovDegrees` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L144)

<a id="function-function-mq3-client-playable-effects-item-function-item-classname-origin-src-mq3-client-playable-effects-ml-1143389209"></a>
### item

```ml
function item(classname, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L27)

<a id="constant-constant-mq3-client-playable-effects-item-ammo-const-item-ammo-4-src-mq3-client-playable-effects-ml-1414286225"></a>
### ITEM_AMMO

```ml
const ITEM_AMMO = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L14)

<a id="constant-constant-mq3-client-playable-effects-item-armor-const-item-armor-2-src-mq3-client-playable-effects-ml-1965599923"></a>
### ITEM_ARMOR

```ml
const ITEM_ARMOR = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L12)

<a id="constant-constant-mq3-client-playable-effects-item-health-const-item-health-1-src-mq3-client-playable-effects-ml-1790964916"></a>
### ITEM_HEALTH

```ml
const ITEM_HEALTH = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L11)

<a id="constant-constant-mq3-client-playable-effects-item-holdable-const-item-holdable-6-src-mq3-client-playable-effects-ml-1936286251"></a>
### ITEM_HOLDABLE

```ml
const ITEM_HOLDABLE = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L16)

<a id="constant-constant-mq3-client-playable-effects-item-powerup-const-item-powerup-5-src-mq3-client-playable-effects-ml-40924802"></a>
### ITEM_POWERUP

```ml
const ITEM_POWERUP = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L15)

<a id="constant-constant-mq3-client-playable-effects-item-team-const-item-team-7-src-mq3-client-playable-effects-ml-709972766"></a>
### ITEM_TEAM

```ml
const ITEM_TEAM = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L17)

<a id="constant-constant-mq3-client-playable-effects-item-unknown-const-item-unknown-0-src-mq3-client-playable-effects-ml-872995483"></a>
### ITEM_UNKNOWN

```ml
const ITEM_UNKNOWN = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L10)

<a id="constant-constant-mq3-client-playable-effects-item-weapon-const-item-weapon-3-src-mq3-client-playable-effects-ml-465430142"></a>
### ITEM_WEAPON

```ml
const ITEM_WEAPON = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L13)

<a id="function-function-mq3-client-playable-effects-itemlines-function-itemlines-camera-marker-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-effects-ml-344706193"></a>
### itemLines

```ml
function itemLines(camera, marker, width, height, horizontalFovDegrees, nearDistance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `marker` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `horizontalFovDegrees` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L93)

- [mq3.client.playable_effects.ItemMarker](Type-mq3-client-playable-effects-itemmarker-799855165.md) — struct
- [mq3.client.playable_effects.LineCommand](Type-mq3-client-playable-effects-linecommand-1903700667.md) — struct
<a id="function-function-mq3-client-playable-effects-liveeffects-function-liveeffects-effects-nowmilliseconds-src-mq3-client-playable-effects-ml-975550828"></a>
### liveEffects

```ml
function liveEffects(effects, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effects` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L138)

<a id="constant-constant-mq3-client-playable-effects-max-effect-milliseconds-const-max-effect-milliseconds-2000-src-mq3-client-playable-effects-ml-865715543"></a>
### MAX_EFFECT_MILLISECONDS

```ml
const MAX_EFFECT_MILLISECONDS = 2000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L19)

<a id="function-function-mq3-client-playable-effects-screenpoint-function-screenpoint-x-y-depth-src-mq3-client-playable-effects-ml-840422420"></a>
### screenPoint

```ml
function screenPoint(x, y, depth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `depth` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L84)

<a id="function-function-mq3-client-playable-effects-shot-function-shot-startpoint-impactpoint-nowmilliseconds-durationmilliseconds-src-mq3-client-playable-effects-ml-1413885170"></a>
### shot

```ml
function shot(startPoint, impactPoint, nowMilliseconds, durationMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `startPoint` | `dynamic` | — |  |
| `impactPoint` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `durationMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L61)

- [mq3.client.playable_effects.ShotEffect](Type-mq3-client-playable-effects-shoteffect-731222753.md) — struct
<a id="function-function-mq3-client-playable-effects-shotframelines-function-shotframelines-camera-effects-nowmilliseconds-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-effects-ml-2130632891"></a>
### shotFrameLines

```ml
function shotFrameLines(camera, effects, nowMilliseconds, width, height, horizontalFovDegrees, nearDistance)
```

Effects-only pass used when pickups are represented by their retail MD3 assets. Keeping it separate prevents the old diagnostic item glyphs from leaking into the finished scene while preserving the useful shot feedback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `effects` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `horizontalFovDegrees` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L154)

<a id="function-function-mq3-client-playable-effects-validpoint-function-validpoint-point-src-mq3-client-playable-effects-ml-1983630522"></a>
### validPoint

```ml
function validPoint(point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L25)

<a id="function-function-mq3-client-playable-effects-weaponshot-function-weaponshot-key-classname-startpoint-impactpoint-normal-worldhit-nowmilliseconds-src-mq3-client-playable-effects-ml-1403798156"></a>
### weaponShot

```ml
function weaponShot(key, classname, startPoint, impactPoint, normal, worldHit, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — |  |
| `classname` | `dynamic` | — |  |
| `startPoint` | `dynamic` | — |  |
| `impactPoint` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `worldHit` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_effects.ml#L67)
