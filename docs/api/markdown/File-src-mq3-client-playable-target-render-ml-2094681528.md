# `src/mq3/client/playable_target_render.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_target_render`](Package-mq3-client-playable-target-render-2094796798.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)

## Declarations

<a id="function-function-mq3-client-playable-target-render-alivelines-function-alivelines-feet-hips-chest-head-value-nowmilliseconds-src-mq3-client-playable-target-render-ml-1248521920"></a>
### aliveLines

```ml
function aliveLines(feet, hips, chest, head, value, nowMilliseconds)
```

Calls `mq3.client.playable_target_render.bodyColor`, `mq3.client.playable_target_render.clampWidth`, `mq3.client.playable_target_render.point` and additional helpers from playable target render `aliveLines`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `feet` | `dynamic` | — | Record read through `feet.y`, `feet.x`. |
| `hips` | `dynamic` | — | Record read through `hips.x`, `hips.y`. |
| `chest` | `dynamic` | — | Record read through `chest.depth`, `chest.x`, `chest.y`. |
| `head` | `dynamic` | — | Record read through `head.y`, `head.x`. |
| `value` | `dynamic` | — | Value tested by `healthFraction(value)<=0.5`, `healthFraction(value)<=0.25` before the calculation continues. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L173)

<a id="function-function-mq3-client-playable-target-render-bodycolor-function-bodycolor-value-nowmilliseconds-src-mq3-client-playable-target-render-ml-589483819"></a>
### bodyColor

```ml
function bodyColor(value, nowMilliseconds)
```

Calls `mq3.client.playable_target_render.healthFraction` from playable target render `bodyColor`. The final path returns `[80,176,255]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.alive`, `value.respawnAt`, `value.hitFlashUntil`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L118)

<a id="function-function-mq3-client-playable-target-render-clampwidth-function-clampwidth-value-src-mq3-client-playable-target-render-ml-1860776641"></a>
### clampWidth

```ml
function clampWidth(value)
```

Calls `mq3.compat.numeric.trunc32` from playable target render `clampWidth`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `result=numeric.trunc32(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L132)

<a id="function-function-mq3-client-playable-target-render-deadlines-function-deadlines-feet-head-value-nowmilliseconds-src-mq3-client-playable-target-render-ml-1831693761"></a>
### deadLines

```ml
function deadLines(feet, head, value, nowMilliseconds)
```

Calls `mq3.client.playable_target_render.bodyColor`, `mq3.client.playable_target_render.clampWidth`, `mq3.client.playable_target_render.point` and additional helpers from playable target render `deadLines`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `feet` | `dynamic` | — | Record read through `feet.x`, `feet.y`, `feet.depth`. |
| `head` | `dynamic` | — | Record read through `head.x`, `head.y`. |
| `value` | `dynamic` | — | Record read through `value.respawnAt`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L157)

<a id="constant-constant-mq3-client-playable-target-render-default-hit-flash-milliseconds-const-default-hit-flash-milliseconds-120-src-mq3-client-playable-target-render-ml-1083911954"></a>
### DEFAULT_HIT_FLASH_MILLISECONDS

```ml
const DEFAULT_HIT_FLASH_MILLISECONDS = 120
```

Default hit flash duration in milliseconds when the caller supplies no override.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L15)

<a id="constant-constant-mq3-client-playable-target-render-default-max-health-const-default-max-health-100-src-mq3-client-playable-target-render-ml-1225626024"></a>
### DEFAULT_MAX_HEALTH

```ml
const DEFAULT_MAX_HEALTH = 100
```

Fallback max health setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L11)

<a id="constant-constant-mq3-client-playable-target-render-default-respawn-milliseconds-const-default-respawn-milliseconds-3000-src-mq3-client-playable-target-render-ml-585010952"></a>
### DEFAULT_RESPAWN_MILLISECONDS

```ml
const DEFAULT_RESPAWN_MILLISECONDS = 3000
```

Default respawn duration in milliseconds when the caller supplies no override.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L13)

<a id="function-function-mq3-client-playable-target-render-draw-function-draw-lines-src-mq3-client-playable-target-render-ml-1030780707"></a>
### draw

```ml
function draw(lines)
```

Calls `mq3.platform.playable_window.drawLine` from playable target render `draw`. The final path returns `len(lines)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lines` | `dynamic` | — | Sequence whose length/content is inspected by `draw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L230)

<a id="function-function-mq3-client-playable-target-render-framelines-function-framelines-camera-targets-nowmilliseconds-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-target-render-ml-627809639"></a>
### frameLines

```ml
function frameLines(camera, targets, nowMilliseconds, width, height, horizontalFovDegrees, nearDistance)
```

Calls `mq3.client.playable_target_render.targetLines` from playable target render `frameLines`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `targets` | `dynamic` | — | Value used by `for each value in targets result=result+targetLines(camera,value,nowMilliseconds,width,height,horizontalFovDegrees,nearDistance) end for`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |
| `width` | `dynamic` | — | Width in the coordinate space used by `frameLines`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `frameLines`. |
| `horizontalFovDegrees` | `dynamic` | — | Horizontal camera field of view in degrees. |
| `nearDistance` | `dynamic` | — | Distance from the camera to the near clipping plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L222)

<a id="function-function-mq3-client-playable-target-render-healthfraction-function-healthfraction-value-src-mq3-client-playable-target-render-ml-1502439169"></a>
### healthFraction

```ml
function healthFraction(value)
```

Calls `mq3.compat.numeric.fdiv`, `mq3.compat.numeric.f32` from playable target render `healthFraction`. The final path returns `numeric.fdiv(numeric.f32(value.health),numeric.f32(value.maxHealth))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.maxHealth`, `value.health`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L73)

<a id="function-function-mq3-client-playable-target-render-hit-function-hit-value-damage-nowmilliseconds-src-mq3-client-playable-target-render-ml-1328898300"></a>
### hit

```ml
function hit(value, damage, nowMilliseconds)
```

Updates `value.health`, `value.hitFlashUntil`, `value.alive`, `value.respawnAt` during playable target render `hit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable playable target render record/storage; this routine assigns `value.health`, `value.hitFlashUntil`, `value.alive`, `value.respawnAt`. |
| `damage` | `dynamic` | — | Value used by `if damage<0 then return error(7533,"hit damage cannot be negative") end if`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L91)

<a id="function-function-mq3-client-playable-target-render-line-function-line-a-b-rgb-src-mq3-client-playable-target-render-ml-2014525334"></a>
### line

```ml
function line(a, b, rgb)
```

Creates a `mq3.client.playable_target_render.LineCommand` record. Assigns `a` from `a`, `b` from `b`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Value used to initialize `LineCommand.a`. |
| `b` | `dynamic` | — | Value used to initialize `LineCommand.b`. |
| `rgb` | `dynamic` | — | Value used to initialize `LineCommand.red`, `LineCommand.green`, `LineCommand.blue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L58)

- [mq3.client.playable_target_render.LineCommand](Type-mq3-client-playable-target-render-linecommand-959595227.md) — struct
<a id="function-function-mq3-client-playable-target-render-point-function-point-x-y-depth-src-mq3-client-playable-target-render-ml-243916132"></a>
### point

```ml
function point(x, y, depth)
```

Adapts `mq3.client.playable_viewer.ScreenPoint` to playable target render `point`, returning its result for `x, y, depth`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Argument 1 of `mq3.client.playable_viewer.ScreenPoint`. |
| `y` | `dynamic` | — | Argument 2 of `mq3.client.playable_viewer.ScreenPoint`. |
| `depth` | `dynamic` | — | Argument 3 of `mq3.client.playable_viewer.ScreenPoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L53)

- [mq3.client.playable_target_render.PreviewTarget](Type-mq3-client-playable-target-render-previewtarget-1864519357.md) — struct
<a id="function-function-mq3-client-playable-target-render-respawnremaining-function-respawnremaining-value-nowmilliseconds-src-mq3-client-playable-target-render-ml-1276139193"></a>
### respawnRemaining

```ml
function respawnRemaining(value, nowMilliseconds)
```

Evaluates playable target render `respawnRemaining` and returns `0`, `value.respawnAt-nowMilliseconds` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.alive`, `value.respawnAt`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L82)

<a id="function-function-mq3-client-playable-target-render-target-function-target-origin-health-maxhealth-src-mq3-client-playable-target-render-ml-1572670796"></a>
### target

```ml
function target(origin, health, maxHealth)
```

Calls `mq3.client.playable_target_render.validPoint`, `mq3.client.playable_target_render.PreviewTarget`, `mq3.compat.numeric.f32` from playable target render `target`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `health` | `dynamic` | — | Value used by `value=health`. |
| `maxHealth` | `dynamic` | — | Value used by `if maxHealth<=0 then return error(7531,"preview target maximum health must be positive") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L64)

<a id="function-function-mq3-client-playable-target-render-targetlines-function-targetlines-camera-value-nowmilliseconds-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-target-render-ml-199673304"></a>
### targetLines

```ml
function targetLines(camera, value, nowMilliseconds, width, height, horizontalFovDegrees, nearDistance)
```

Calls `mq3.client.playable_target_render.validPoint`, `mq3.client.playable_viewer.projectPoint`, `mq3.client.playable_target_render.visibleBounds` and additional helpers from playable target render `targetLines`. The final path returns `aliveLines(feet,hips,chest,head,value,nowMilliseconds)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `value` | `dynamic` | — | Record read through `value.origin`, `value.alive`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |
| `width` | `dynamic` | — | Width in the coordinate space used by `targetLines`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `targetLines`. |
| `horizontalFovDegrees` | `dynamic` | — | Horizontal camera field of view in degrees. |
| `nearDistance` | `dynamic` | — | Distance from the camera to the near clipping plane. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L201)

<a id="function-function-mq3-client-playable-target-render-update-function-update-value-nowmilliseconds-src-mq3-client-playable-target-render-ml-1901322761"></a>
### update

```ml
function update(value, nowMilliseconds)
```

Updates `value.health`, `value.alive`, `value.respawnAt`, `value.hitFlashUntil` during playable target render `update`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable playable target render record/storage; this routine assigns `value.health`, `value.alive`, `value.respawnAt`, `value.hitFlashUntil`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L106)

<a id="function-function-mq3-client-playable-target-render-validpoint-function-validpoint-point-src-mq3-client-playable-target-render-ml-1791595834"></a>
### validPoint

```ml
function validPoint(point)
```

Computes `point!=void and len(point)==3` for playable target render `validPoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Sequence whose length/content is inspected by `validPoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L48)

<a id="function-function-mq3-client-playable-target-render-visiblebounds-function-visiblebounds-feet-head-width-height-src-mq3-client-playable-target-render-ml-1975889459"></a>
### visibleBounds

```ml
function visibleBounds(feet, head, width, height)
```

Tests projected head/feet against the viewport with 64-pixel horizontal and 96-pixel vertical margins.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `feet` | `dynamic` | — | Record read through `feet.x`, `feet.y`. |
| `head` | `dynamic` | — | Record read through `head.x`, `head.y`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `visibleBounds`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `visibleBounds`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L144)
