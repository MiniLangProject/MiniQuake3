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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `feet` | `dynamic` | — |  |
| `hips` | `dynamic` | — |  |
| `chest` | `dynamic` | — |  |
| `head` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L95)

<a id="function-function-mq3-client-playable-target-render-bodycolor-function-bodycolor-value-nowmilliseconds-src-mq3-client-playable-target-render-ml-589483819"></a>
### bodyColor

```ml
function bodyColor(value, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L59)

<a id="function-function-mq3-client-playable-target-render-clampwidth-function-clampwidth-value-src-mq3-client-playable-target-render-ml-1860776641"></a>
### clampWidth

```ml
function clampWidth(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L71)

<a id="function-function-mq3-client-playable-target-render-deadlines-function-deadlines-feet-head-value-nowmilliseconds-src-mq3-client-playable-target-render-ml-1831693761"></a>
### deadLines

```ml
function deadLines(feet, head, value, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `feet` | `dynamic` | — |  |
| `head` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L86)

<a id="constant-constant-mq3-client-playable-target-render-default-hit-flash-milliseconds-const-default-hit-flash-milliseconds-120-src-mq3-client-playable-target-render-ml-1083911954"></a>
### DEFAULT_HIT_FLASH_MILLISECONDS

```ml
const DEFAULT_HIT_FLASH_MILLISECONDS = 120
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L11)

<a id="constant-constant-mq3-client-playable-target-render-default-max-health-const-default-max-health-100-src-mq3-client-playable-target-render-ml-1225626024"></a>
### DEFAULT_MAX_HEALTH

```ml
const DEFAULT_MAX_HEALTH = 100
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L9)

<a id="constant-constant-mq3-client-playable-target-render-default-respawn-milliseconds-const-default-respawn-milliseconds-3000-src-mq3-client-playable-target-render-ml-585010952"></a>
### DEFAULT_RESPAWN_MILLISECONDS

```ml
const DEFAULT_RESPAWN_MILLISECONDS = 3000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L10)

<a id="function-function-mq3-client-playable-target-render-draw-function-draw-lines-src-mq3-client-playable-target-render-ml-1030780707"></a>
### draw

```ml
function draw(lines)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lines` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L134)

<a id="function-function-mq3-client-playable-target-render-framelines-function-framelines-camera-targets-nowmilliseconds-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-target-render-ml-627809639"></a>
### frameLines

```ml
function frameLines(camera, targets, nowMilliseconds, width, height, horizontalFovDegrees, nearDistance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `targets` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `horizontalFovDegrees` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L128)

<a id="function-function-mq3-client-playable-target-render-healthfraction-function-healthfraction-value-src-mq3-client-playable-target-render-ml-1502439169"></a>
### healthFraction

```ml
function healthFraction(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L27)

<a id="function-function-mq3-client-playable-target-render-hit-function-hit-value-damage-nowmilliseconds-src-mq3-client-playable-target-render-ml-1328898300"></a>
### hit

```ml
function hit(value, damage, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L38)

<a id="function-function-mq3-client-playable-target-render-line-function-line-a-b-rgb-src-mq3-client-playable-target-render-ml-2014525334"></a>
### line

```ml
function line(a, b, rgb)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `rgb` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L18)

- [mq3.client.playable_target_render.LineCommand](Type-mq3-client-playable-target-render-linecommand-959595227.md) — struct
<a id="function-function-mq3-client-playable-target-render-point-function-point-x-y-depth-src-mq3-client-playable-target-render-ml-243916132"></a>
### point

```ml
function point(x, y, depth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `depth` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L17)

- [mq3.client.playable_target_render.PreviewTarget](Type-mq3-client-playable-target-render-previewtarget-1864519357.md) — struct
<a id="function-function-mq3-client-playable-target-render-respawnremaining-function-respawnremaining-value-nowmilliseconds-src-mq3-client-playable-target-render-ml-1276139193"></a>
### respawnRemaining

```ml
function respawnRemaining(value, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L33)

<a id="function-function-mq3-client-playable-target-render-target-function-target-origin-health-maxhealth-src-mq3-client-playable-target-render-ml-1572670796"></a>
### target

```ml
function target(origin, health, maxHealth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `health` | `dynamic` | — |  |
| `maxHealth` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L20)

<a id="function-function-mq3-client-playable-target-render-targetlines-function-targetlines-camera-value-nowmilliseconds-width-height-horizontalfovdegrees-neardistance-src-mq3-client-playable-target-render-ml-199673304"></a>
### targetLines

```ml
function targetLines(camera, value, nowMilliseconds, width, height, horizontalFovDegrees, nearDistance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `horizontalFovDegrees` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L115)

<a id="function-function-mq3-client-playable-target-render-update-function-update-value-nowmilliseconds-src-mq3-client-playable-target-render-ml-1901322761"></a>
### update

```ml
function update(value, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L50)

<a id="function-function-mq3-client-playable-target-render-validpoint-function-validpoint-point-src-mq3-client-playable-target-render-ml-1791595834"></a>
### validPoint

```ml
function validPoint(point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L16)

<a id="function-function-mq3-client-playable-target-render-visiblebounds-function-visiblebounds-feet-head-width-height-src-mq3-client-playable-target-render-ml-1975889459"></a>
### visibleBounds

```ml
function visibleBounds(feet, head, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `feet` | `dynamic` | — |  |
| `head` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_target_render.ml#L78)
