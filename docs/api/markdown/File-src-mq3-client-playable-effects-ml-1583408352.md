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

Computes `effect!=void and nowMilliseconds>=effect.bornAt and nowMilliseconds<effect.expiresAt` for playable effects `alive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effect` | `dynamic` | — | Record read through `effect.bornAt`, `effect.expiresAt`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L109)

<a id="function-function-mq3-client-playable-effects-billboardsize-function-billboardsize-depth-src-mq3-client-playable-effects-ml-1491055793"></a>
### billboardSize

```ml
function billboardSize(depth)
```

Calls `mq3.compat.numeric.trunc32` from playable effects `billboardSize`. The final path returns `size`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `depth` | `dynamic` | — | Value used by `size=numeric.trunc32(190.0/depth)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L129)

<a id="function-function-mq3-client-playable-effects-category-function-category-classname-src-mq3-client-playable-effects-ml-886208391"></a>
### category

```ml
function category(classname)
```

Calls `std.string.toLowerAscii`, `std.string.startsWith` from playable effects `category`. The final path returns `ITEM_UNKNOWN`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — | Value used by `lower=strings.toLowerAscii(classname)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L43)

<a id="function-function-mq3-client-playable-effects-color-function-color-itemcategory-classname-src-mq3-client-playable-effects-ml-1480937640"></a>
### color

```ml
function color(itemCategory, classname)
```

Calls `std.string.toLowerAscii`, `std.string.contains` from playable effects `color`. The final path returns `[180,180,180]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `itemCategory` | `dynamic` | — | Value used by `if itemCategory==ITEM_HEALTH then return [72,255,96] end if`. |
| `classname` | `dynamic` | — | Value used by `lower=strings.toLowerAscii(classname)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L58)

<a id="function-function-mq3-client-playable-effects-command-function-command-a-b-rgb-src-mq3-client-playable-effects-ml-707579908"></a>
### command

```ml
function command(a, b, rgb)
```

Creates a `mq3.client.playable_effects.LineCommand` record. Assigns `a` from `a`, `b` from `b`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Value used to initialize `LineCommand.a`. |
| `b` | `dynamic` | — | Value used to initialize `LineCommand.b`. |
| `rgb` | `dynamic` | — | Value used to initialize `LineCommand.red`, `LineCommand.green`, `LineCommand.blue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L117)

<a id="constant-constant-mq3-client-playable-effects-default-effect-milliseconds-const-default-effect-milliseconds-180-src-mq3-client-playable-effects-ml-2034347384"></a>
### DEFAULT_EFFECT_MILLISECONDS

```ml
const DEFAULT_EFFECT_MILLISECONDS = 180
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L18)

<a id="function-function-mq3-client-playable-effects-defaultshot-function-defaultshot-startpoint-impactpoint-nowmilliseconds-src-mq3-client-playable-effects-ml-5949286"></a>
### defaultShot

```ml
function defaultShot(startPoint, impactPoint, nowMilliseconds)
```

Adapts `mq3.client.playable_effects.shot` to playable effects `defaultShot`, returning its result for `startPoint, impactPoint, nowMilliseconds, DEFAULT_EFFECT_MILLISECONDS`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. Forwarded to `mq3.client.playable_effects.shot`. |
| `impactPoint` | `dynamic` | — | Argument 2 of `mq3.client.playable_effects.shot`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. Forwarded to `mq3.client.playable_effects.shot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L102)

<a id="function-function-mq3-client-playable-effects-draw-function-draw-lines-src-mq3-client-playable-effects-ml-1232547011"></a>
### draw

```ml
function draw(lines)
```

Calls `mq3.platform.playable_window.drawLine` from playable effects `draw`. The final path returns `len(lines)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lines` | `dynamic` | — | Sequence whose length/content is inspected by `draw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L242)

<a id="function-function-mq3-client-playable-effects-effectcolor-function-effectcolor-effect-nowmilliseconds-src-mq3-client-playable-effects-ml-1187559989"></a>
### effectColor

```ml
function effectColor(effect, nowMilliseconds)
```

Calls `mq3.compat.numeric.trunc32` from playable effects `effectColor`. The final path returns `[255,intensity,numeric.trunc32(intensity/3)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effect` | `dynamic` | — | Record read through `effect.expiresAt`, `effect.bornAt`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L169)

<a id="function-function-mq3-client-playable-effects-effectlines-function-effectlines-camera-effect-nowmilliseconds-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-effects-ml-1778075122"></a>
### effectLines

```ml
function effectLines(camera, effect, nowMilliseconds, width, height, horizontalFovDegrees, nearDistance)
```

Calls `mq3.client.playable_effects.alive`, `mq3.client.playable_effects.effectColor`, `mq3.client.playable_viewer.projectLine` and additional helpers from playable effects `effectLines`. The final path returns `lines`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `effect` | `dynamic` | — | Record read through `effect.startPoint`, `effect.impactPoint`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |
| `width` | `dynamic` | — | Width in the coordinate space used by `effectLines`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `effectLines`. |
| `horizontalFovDegrees` | `dynamic` | — | Horizontal camera field of view in degrees. |
| `nearDistance` | `dynamic` | — | Distance from the camera to the near clipping plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L185)

<a id="function-function-mq3-client-playable-effects-framelines-function-framelines-camera-items-effects-nowmilliseconds-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-effects-ml-363094809"></a>
### frameLines

```ml
function frameLines(camera, items, effects, nowMilliseconds, width, height, horizontalFovDegrees, nearDistance)
```

Calls `mq3.client.playable_effects.itemLines`, `mq3.client.playable_effects.effectLines` from playable effects `frameLines`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `items` | `dynamic` | — | Value used by `for each marker in items result=result+itemLines(camera,marker,width,height,horizontalFovDegrees,nearDistance) end for`. |
| `effects` | `dynamic` | — | Value used by `for each effect in effects result=result+effectLines(camera,effect,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance) end for`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |
| `width` | `dynamic` | — | Width in the coordinate space used by `frameLines`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `frameLines`. |
| `horizontalFovDegrees` | `dynamic` | — | Horizontal camera field of view in degrees. |
| `nearDistance` | `dynamic` | — | Distance from the camera to the near clipping plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L217)

<a id="function-function-mq3-client-playable-effects-item-function-item-classname-origin-src-mq3-client-playable-effects-ml-1143389209"></a>
### item

```ml
function item(classname, origin)
```

Calls `mq3.client.playable_effects.validPoint`, `mq3.client.playable_effects.ItemMarker`, `mq3.compat.numeric.f32` from playable effects `item`. The final path returns `ItemMarker(classname,[numeric.f32(origin[0]),numeric.f32(origin[1]),numeric.f32(origin[2])],true)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — | Sequence whose length/content is inspected by `item`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L35)

<a id="constant-constant-mq3-client-playable-effects-item-ammo-const-item-ammo-4-src-mq3-client-playable-effects-ml-1414286225"></a>
### ITEM_AMMO

```ml
const ITEM_AMMO = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L14)

<a id="constant-constant-mq3-client-playable-effects-item-armor-const-item-armor-2-src-mq3-client-playable-effects-ml-1965599923"></a>
### ITEM_ARMOR

```ml
const ITEM_ARMOR = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L12)

<a id="constant-constant-mq3-client-playable-effects-item-health-const-item-health-1-src-mq3-client-playable-effects-ml-1790964916"></a>
### ITEM_HEALTH

```ml
const ITEM_HEALTH = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L11)

<a id="constant-constant-mq3-client-playable-effects-item-holdable-const-item-holdable-6-src-mq3-client-playable-effects-ml-1936286251"></a>
### ITEM_HOLDABLE

```ml
const ITEM_HOLDABLE = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L16)

<a id="constant-constant-mq3-client-playable-effects-item-powerup-const-item-powerup-5-src-mq3-client-playable-effects-ml-40924802"></a>
### ITEM_POWERUP

```ml
const ITEM_POWERUP = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L15)

<a id="constant-constant-mq3-client-playable-effects-item-team-const-item-team-7-src-mq3-client-playable-effects-ml-709972766"></a>
### ITEM_TEAM

```ml
const ITEM_TEAM = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L17)

<a id="constant-constant-mq3-client-playable-effects-item-unknown-const-item-unknown-0-src-mq3-client-playable-effects-ml-872995483"></a>
### ITEM_UNKNOWN

```ml
const ITEM_UNKNOWN = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L10)

<a id="constant-constant-mq3-client-playable-effects-item-weapon-const-item-weapon-3-src-mq3-client-playable-effects-ml-465430142"></a>
### ITEM_WEAPON

```ml
const ITEM_WEAPON = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L13)

<a id="function-function-mq3-client-playable-effects-itemlines-function-itemlines-camera-marker-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-effects-ml-344706193"></a>
### itemLines

```ml
function itemLines(camera, marker, width, height, horizontalFovDegrees, nearDistance)
```

Calls `mq3.client.playable_viewer.projectPoint`, `mq3.client.playable_effects.category`, `mq3.client.playable_effects.color` and additional helpers from playable effects `itemLines`. The final path returns `lines`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `marker` | `dynamic` | — | Record read through `marker.active`, `marker.origin`, `marker.classname`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `itemLines`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `itemLines`. |
| `horizontalFovDegrees` | `dynamic` | — | Horizontal camera field of view in degrees. |
| `nearDistance` | `dynamic` | — | Distance from the camera to the near clipping plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L143)

- [mq3.client.playable_effects.ItemMarker](Type-mq3-client-playable-effects-itemmarker-799855165.md) — struct
- [mq3.client.playable_effects.LineCommand](Type-mq3-client-playable-effects-linecommand-1903700667.md) — struct
<a id="function-function-mq3-client-playable-effects-liveeffects-function-liveeffects-effects-nowmilliseconds-src-mq3-client-playable-effects-ml-975550828"></a>
### liveEffects

```ml
function liveEffects(effects, nowMilliseconds)
```

Calls `mq3.client.playable_effects.alive` from playable effects `liveEffects`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `effects` | `dynamic` | — | Value used by `for each effect in effects if alive(effect,nowMilliseconds) then result=result+[effect] end if end for`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L202)

<a id="constant-constant-mq3-client-playable-effects-max-effect-milliseconds-const-max-effect-milliseconds-2000-src-mq3-client-playable-effects-ml-865715543"></a>
### MAX_EFFECT_MILLISECONDS

```ml
const MAX_EFFECT_MILLISECONDS = 2000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L19)

<a id="function-function-mq3-client-playable-effects-screenpoint-function-screenpoint-x-y-depth-src-mq3-client-playable-effects-ml-840422420"></a>
### screenPoint

```ml
function screenPoint(x, y, depth)
```

Adapts `mq3.client.playable_viewer.ScreenPoint` to playable effects `screenPoint`, returning its result for `x, y, depth`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Argument 1 of `mq3.client.playable_viewer.ScreenPoint`. |
| `y` | `dynamic` | — | Argument 2 of `mq3.client.playable_viewer.ScreenPoint`. |
| `depth` | `dynamic` | — | Argument 3 of `mq3.client.playable_viewer.ScreenPoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L125)

<a id="function-function-mq3-client-playable-effects-shot-function-shot-startpoint-impactpoint-nowmilliseconds-durationmilliseconds-src-mq3-client-playable-effects-ml-1413885170"></a>
### shot

```ml
function shot(startPoint, impactPoint, nowMilliseconds, durationMilliseconds)
```

Calls `mq3.client.playable_effects.validPoint`, `mq3.client.playable_effects.ShotEffect` from playable effects `shot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. |
| `impactPoint` | `dynamic` | — | Value used by `if not validPoint(startPoint) or not validPoint(impactPoint) then return error(7502,"shot effect needs two three-component points") end if`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |
| `durationMilliseconds` | `dynamic` | — | Value used by `if durationMilliseconds<=0 or durationMilliseconds>MAX_EFFECT_MILLISECONDS then return error(7503,"shot effect duration is outside preview bou...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L79)

- [mq3.client.playable_effects.ShotEffect](Type-mq3-client-playable-effects-shoteffect-731222753.md) — struct
<a id="function-function-mq3-client-playable-effects-shotframelines-function-shotframelines-camera-effects-nowmilliseconds-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-effects-ml-2130632891"></a>
### shotFrameLines

```ml
function shotFrameLines(camera, effects, nowMilliseconds, width, height, horizontalFovDegrees, nearDistance)
```

Effects-only pass used when pickups are represented by their retail MD3 assets. Keeping it separate prevents the old diagnostic item glyphs from leaking into the finished scene while preserving the useful shot feedback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `effects` | `dynamic` | — | Value used by `for each effect in effects result=result+effectLines(camera,effect,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance) end for`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |
| `width` | `dynamic` | — | Width in the coordinate space used by `shotFrameLines`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `shotFrameLines`. |
| `horizontalFovDegrees` | `dynamic` | — | Horizontal camera field of view in degrees. |
| `nearDistance` | `dynamic` | — | Distance from the camera to the near clipping plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L234)

<a id="function-function-mq3-client-playable-effects-validpoint-function-validpoint-point-src-mq3-client-playable-effects-ml-1983630522"></a>
### validPoint

```ml
function validPoint(point)
```

Computes `point!=void and len(point)==3` for playable effects `validPoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Sequence whose length/content is inspected by `validPoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L30)

<a id="function-function-mq3-client-playable-effects-weaponshot-function-weaponshot-key-classname-startpoint-impactpoint-normal-worldhit-nowmilliseconds-src-mq3-client-playable-effects-ml-1403798156"></a>
### weaponShot

```ml
function weaponShot(key, classname, startPoint, impactPoint, normal, worldHit, nowMilliseconds)
```

Calls `mq3.client.playable_effects.defaultShot` from playable effects `weaponShot`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Value assigned to `value.key`. |
| `classname` | `dynamic` | — | Value assigned to `value.classname`. |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. |
| `impactPoint` | `dynamic` | — | Value used by `value=defaultShot(startPoint,impactPoint,nowMilliseconds)`. |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. |
| `worldHit` | `dynamic` | — | Value assigned to `value.worldHit`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_effects.ml#L93)
