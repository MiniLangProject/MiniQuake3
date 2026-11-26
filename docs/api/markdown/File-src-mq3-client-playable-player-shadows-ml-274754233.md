# `src/mq3/client/playable_player_shadows.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_player_shadows`](Package-mq3-client-playable-player-shadows-339712303.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/collision/world.ml` as `collision` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-client-playable-player-shadows-axes-function-axes-shadow-src-mq3-client-playable-player-shadows-ml-2068141570"></a>
### axes

```ml
function axes(shadow)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shadow` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L48)

- [mq3.client.playable_player_shadows.Catalog](Type-mq3-client-playable-player-shadows-catalog-199763454.md) — struct
<a id="function-function-mq3-client-playable-player-shadows-color-function-color-shadow-src-mq3-client-playable-player-shadows-ml-374587060"></a>
### color

```ml
function color(shadow)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shadow` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L53)

<a id="function-function-mq3-client-playable-player-shadows-draw-function-draw-shadows-catalog-projection-src-mq3-client-playable-player-shadows-ml-786066437"></a>
### draw

```ml
function draw(shadows, catalog, projection)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shadows` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L55)

<a id="function-function-mq3-client-playable-player-shadows-fail-function-fail-message-src-mq3-client-playable-player-shadows-ml-1774094565"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L23)

<a id="function-function-mq3-client-playable-player-shadows-load-function-load-archive-textureslot-src-mq3-client-playable-player-shadows-ml-1670245405"></a>
### load

```ml
function load(archive, textureSlot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `textureSlot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L24)

<a id="constant-constant-mq3-client-playable-player-shadows-mask-playersolid-const-mask-playersolid-33619969-src-mq3-client-playable-player-shadows-ml-2057640905"></a>
### MASK_PLAYERSOLID

```ml
const MASK_PLAYERSOLID = 33619969
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L17)

<a id="function-function-mq3-client-playable-player-shadows-perpendicular-function-perpendicular-normal-src-mq3-client-playable-player-shadows-ml-545382807"></a>
### perpendicular

```ml
function perpendicular(normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L44)

<a id="constant-constant-mq3-client-playable-player-shadows-pi-const-pi-3-141593-src-mq3-client-playable-player-shadows-ml-101999151"></a>
### PI

```ml
const PI = 3.141593
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L18)

<a id="function-function-mq3-client-playable-player-shadows-point-function-point-shadow-axis1-axis2-x-y-src-mq3-client-playable-player-shadows-ml-2146266484"></a>
### point

```ml
function point(shadow, axis1, axis2, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shadow` | `dynamic` | — |  |
| `axis1` | `dynamic` | — |  |
| `axis2` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L52)

<a id="function-function-mq3-client-playable-player-shadows-release-function-release-catalog-src-mq3-client-playable-player-shadows-ml-677537927"></a>
### release

```ml
function release(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L30)

- [mq3.client.playable_player_shadows.Shadow](Type-mq3-client-playable-player-shadows-shadow-430357955.md) — struct
<a id="constant-constant-mq3-client-playable-player-shadows-shadow-distance-const-shadow-distance-128-src-mq3-client-playable-player-shadows-ml-1269344070"></a>
### SHADOW_DISTANCE

```ml
const SHADOW_DISTANCE = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L15)

<a id="constant-constant-mq3-client-playable-player-shadows-shadow-radius-const-shadow-radius-24-src-mq3-client-playable-player-shadows-ml-222979687"></a>
### SHADOW_RADIUS

```ml
const SHADOW_RADIUS = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L16)

<a id="function-function-mq3-client-playable-player-shadows-trace-function-trace-world-origin-orientation-src-mq3-client-playable-player-shadows-ml-1572982104"></a>
### trace

```ml
function trace(world, origin, orientation)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `orientation` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L42)

<a id="function-function-mq3-client-playable-player-shadows-tracewith-function-tracewith-tracefn-context-origin-orientation-src-mq3-client-playable-player-shadows-ml-207494638"></a>
### traceWith

```ml
function traceWith(traceFn, context, origin, orientation)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `orientation` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L33)

<a id="function-function-mq3-client-playable-player-shadows-upload-function-upload-catalog-src-mq3-client-playable-player-shadows-ml-1521347545"></a>
### upload

```ml
function upload(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L29)

<a id="function-function-mq3-client-playable-player-shadows-worldtrace-function-worldtrace-context-startpoint-endpoint-mins-maxs-src-mq3-client-playable-player-shadows-ml-496757738"></a>
### worldTrace

```ml
function worldTrace(context, startPoint, endPoint, mins, maxs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `startPoint` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_shadows.ml#L32)
