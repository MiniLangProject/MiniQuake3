# `src/mq3/renderer/playable_flares.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.playable_flares`](Package-mq3-renderer-playable-flares-1426262285.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/playable_fog.ml` as `playableFog` → [src/mq3/renderer/playable_fog.ml](File-src-mq3-renderer-playable-fog-ml-140703890.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)

## Declarations

- [mq3.renderer.playable_flares.Catalog](Type-mq3-renderer-playable-flares-catalog-1039013172.md) — struct
<a id="function-function-mq3-renderer-playable-flares-colorbyte-function-colorbyte-value-src-mq3-renderer-playable-flares-ml-1926270529"></a>
### colorByte

```ml
function colorByte(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L97)

<a id="constant-constant-mq3-renderer-playable-flares-default-fade-const-default-fade-7-src-mq3-renderer-playable-flares-ml-1556207384"></a>
### DEFAULT_FADE

```ml
const DEFAULT_FADE = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L16)

<a id="constant-constant-mq3-renderer-playable-flares-default-size-const-default-size-40-src-mq3-renderer-playable-flares-ml-1004476649"></a>
### DEFAULT_SIZE

```ml
const DEFAULT_SIZE = 40
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L15)

<a id="function-function-mq3-renderer-playable-flares-drawone-function-drawone-catalog-fogcatalog-flare-state-projection-area-nowmilliseconds-applyfacing-src-mq3-renderer-playable-flares-ml-361502939"></a>
### drawOne

```ml
function drawOne(catalog, fogCatalog, flare, state, projection, area, nowMilliseconds, applyFacing)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `flare` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `applyFacing` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L130)

<a id="function-function-mq3-renderer-playable-flares-drawviewport-function-drawviewport-catalog-fogcatalog-lights-projection-area-nowmilliseconds-viewindex-src-mq3-renderer-playable-flares-ml-231982432"></a>
### drawViewport

```ml
function drawViewport(catalog, fogCatalog, lights, projection, area, nowMilliseconds, viewIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `viewIndex` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L147)

<a id="function-function-mq3-renderer-playable-flares-ensuredynamicview-function-ensuredynamicview-catalog-viewindex-count-src-mq3-renderer-playable-flares-ml-2120918795"></a>
### ensureDynamicView

```ml
function ensureDynamicView(catalog, viewIndex, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `viewIndex` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L110)

<a id="function-function-mq3-renderer-playable-flares-ensureview-function-ensureview-catalog-viewindex-src-mq3-renderer-playable-flares-ml-524426880"></a>
### ensureView

```ml
function ensureView(catalog, viewIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `viewIndex` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L52)

<a id="function-function-mq3-renderer-playable-flares-f32-function-f32-map-offset-src-mq3-renderer-playable-flares-ml-2027149717"></a>
### f32

```ml
function f32(map, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L27)

<a id="constant-constant-mq3-renderer-playable-flares-face-stride-const-face-stride-104-src-mq3-renderer-playable-flares-ml-1416399680"></a>
### FACE_STRIDE

```ml
const FACE_STRIDE = 104
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L14)

<a id="function-function-mq3-renderer-playable-flares-facing-function-facing-origin-point-normal-src-mq3-renderer-playable-flares-ml-205865437"></a>
### facing

```ml
function facing(origin, point, normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L92)

<a id="function-function-mq3-renderer-playable-flares-fail-function-fail-message-src-mq3-renderer-playable-flares-ml-1828318161"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L25)

- [mq3.renderer.playable_flares.Flare](Type-mq3-renderer-playable-flares-flare-173432619.md) — struct
<a id="function-function-mq3-renderer-playable-flares-flaresize-function-flaresize-viewportwidth-eyedepth-sizevalue-src-mq3-renderer-playable-flares-ml-385506730"></a>
### flareSize

```ml
function flareSize(viewportWidth, eyeDepth, sizeValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `viewportWidth` | `dynamic` | — |  |
| `eyeDepth` | `dynamic` | — |  |
| `sizeValue` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L91)

<a id="function-function-mq3-renderer-playable-flares-foggedcolor-function-foggedcolor-flare-color-fogcatalog-vieworigin-forward-src-mq3-renderer-playable-flares-ml-402580846"></a>
### foggedColor

```ml
function foggedColor(flare, color, fogCatalog, viewOrigin, forward)
```

RB_RenderFlare begins flareShader with the retained fog number. Its additive blend selects ACFF_MODULATE_RGB in FinishShader, so fog attenuates RGB only.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flare` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L124)

<a id="function-function-mq3-renderer-playable-flares-fogindexat-function-fogindexat-fogcatalog-origin-src-mq3-renderer-playable-flares-ml-1073932909"></a>
### fogIndexAt

```ml
function fogIndexAt(fogCatalog, origin)
```

RB_AddDlightFlares assigns each submitted light to the first fog whose axial brush bounds contain its origin.  Fog zero is the outside fallback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fogCatalog` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L101)

<a id="function-function-mq3-renderer-playable-flares-i32-function-i32-map-offset-src-mq3-renderer-playable-flares-ml-1774398971"></a>
### i32

```ml
function i32(map, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L28)

<a id="function-function-mq3-renderer-playable-flares-load-function-load-archive-map-scripts-textureslot-enabled-src-mq3-renderer-playable-flares-ml-310206068"></a>
### load

```ml
function load(archive, map, scripts, textureSlot, enabled)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `scripts` | `dynamic` | — |  |
| `textureSlot` | `dynamic` | — |  |
| `enabled` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L58)

<a id="function-function-mq3-renderer-playable-flares-makestates-function-makestates-count-src-mq3-renderer-playable-flares-ml-2060215273"></a>
### makeStates

```ml
function makeStates(count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L51)

<a id="constant-constant-mq3-renderer-playable-flares-max-view-states-const-max-view-states-16-src-mq3-renderer-playable-flares-ml-1009771882"></a>
### MAX_VIEW_STATES

```ml
const MAX_VIEW_STATES = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L18)

<a id="constant-constant-mq3-renderer-playable-flares-mst-flare-const-mst-flare-4-src-mq3-renderer-playable-flares-ml-490546623"></a>
### MST_FLARE

```ml
const MST_FLARE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L13)

<a id="function-function-mq3-renderer-playable-flares-parse-function-parse-map-src-mq3-renderer-playable-flares-ml-1020740748"></a>
### parse

```ml
function parse(map)
```

ParseFlare in tr_bsp.c copies these fields directly from dsurface_t.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L31)

- [mq3.renderer.playable_flares.Point](Type-mq3-renderer-playable-flares-point-586923605.md) — struct
<a id="function-function-mq3-renderer-playable-flares-release-function-release-catalog-src-mq3-renderer-playable-flares-ml-314946743"></a>
### release

```ml
function release(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L74)

<a id="function-function-mq3-renderer-playable-flares-retiredynamicstates-function-retiredynamicstates-states-submittedcount-nowmilliseconds-src-mq3-renderer-playable-flares-ml-1494944380"></a>
### retireDynamicStates

```ml
function retireDynamicStates(states, submittedCount, nowMilliseconds)
```

RB_RenderFlares frees active entries that were not submitted this frame. Slot identity matches the stable refdef dlight-array address used by Baseq3.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `states` | `dynamic` | — |  |
| `submittedCount` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L118)

- [mq3.renderer.playable_flares.State](Type-mq3-renderer-playable-flares-state-337903418.md) — struct
<a id="function-function-mq3-renderer-playable-flares-updatestate-function-updatestate-state-visible-nowmilliseconds-faderate-src-mq3-renderer-playable-flares-ml-2089516995"></a>
### updateState

```ml
function updateState(state, visible, nowMilliseconds, fadeRate)
```

RB_TestFlare changes visibility at now-1 and clamps the linear fade.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `visible` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `fadeRate` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L77)

<a id="function-function-mq3-renderer-playable-flares-upload-function-upload-catalog-src-mq3-renderer-playable-flares-ml-336003029"></a>
### upload

```ml
function upload(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L68)

<a id="function-function-mq3-renderer-playable-flares-validmap-function-validmap-map-src-mq3-renderer-playable-flares-ml-1729017914"></a>
### validMap

```ml
function validMap(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L26)

<a id="constant-constant-mq3-renderer-playable-flares-visibility-tolerance-const-visibility-tolerance-24-src-mq3-renderer-playable-flares-ml-1802405693"></a>
### VISIBILITY_TOLERANCE

```ml
const VISIBILITY_TOLERANCE = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L17)

<a id="function-function-mq3-renderer-playable-flares-visibleatdepth-function-visibleatdepth-flaredepth-surfacedepth-src-mq3-renderer-playable-flares-ml-1869683045"></a>
### visibleAtDepth

```ml
function visibleAtDepth(flareDepth, surfaceDepth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flareDepth` | `dynamic` | — |  |
| `surfaceDepth` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_flares.ml#L90)
