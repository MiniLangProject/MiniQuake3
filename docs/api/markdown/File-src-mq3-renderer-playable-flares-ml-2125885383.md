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

Returns `n.trunc32(value)` from `mq3.renderer.playable_flares.colorByte`; earlier branches return `0`, `255`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.trunc32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L190)

<a id="constant-constant-mq3-renderer-playable-flares-default-fade-const-default-fade-7-src-mq3-renderer-playable-flares-ml-1556207384"></a>
### DEFAULT_FADE

```ml
const DEFAULT_FADE = 7
```

Default rate used to fade flares after visibility transitions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L20)

<a id="constant-constant-mq3-renderer-playable-flares-default-size-const-default-size-40-src-mq3-renderer-playable-flares-ml-1004476649"></a>
### DEFAULT_SIZE

```ml
const DEFAULT_SIZE = 40
```

Default screen-space scale used when drawing a light flare.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L18)

<a id="function-function-mq3-renderer-playable-flares-drawone-function-drawone-catalog-fogcatalog-flare-state-projection-area-nowmilliseconds-applyfacing-src-mq3-renderer-playable-flares-ml-361502939"></a>
### drawOne

```ml
function drawOne(catalog, fogCatalog, flare, state, projection, area, nowMilliseconds, applyFacing)
```

Projects a flare, tests on-screen depth visibility, updates its fade state, and submits its visible quad.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.textureSlot`. |
| `fogCatalog` | `dynamic` | — | Value forwarded as `fogCatalog` to `mq3.renderer.playable_flares.foggedColor`. |
| `flare` | `dynamic` | — | Record providing `flare.origin`, `flare.normal`, `flare.color`. |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.playable_flares.updateState`. |
| `projection` | `dynamic` | — | Record providing `projection.position`, `projection.forward`. |
| `area` | `dynamic` | — | Record providing `area.x`, `area.width`, `area.y`, `area.height`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_flares.updateState`. |
| `applyFacing` | `dynamic` | — | Input tested by `applyFacing`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L246)

<a id="function-function-mq3-renderer-playable-flares-drawviewport-function-drawviewport-catalog-fogcatalog-lights-projection-area-nowmilliseconds-viewindex-src-mq3-renderer-playable-flares-ml-231982432"></a>
### drawViewport

```ml
function drawViewport(catalog, fogCatalog, lights, projection, area, nowMilliseconds, viewIndex)
```

Draws enabled static and dynamic flares for one view using persistent per-view visibility state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.enabled`, `catalog.flares`. |
| `fogCatalog` | `dynamic` | — | Value forwarded as `fogCatalog` to `mq3.renderer.playable_flares.drawOne`. |
| `lights` | `dynamic` | — | Indexed input read at `index`. |
| `projection` | `dynamic` | — | Value forwarded as `projection` to `mq3.renderer.playable_flares.drawOne`. |
| `area` | `dynamic` | — | Value forwarded as `area` to `mq3.renderer.playable_flares.drawOne`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_flares.drawOne`. |
| `viewIndex` | `dynamic` | — | Value forwarded as `viewIndex` to `mq3.renderer.playable_flares.ensureView`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L271)

<a id="function-function-mq3-renderer-playable-flares-ensuredynamicview-function-ensuredynamicview-catalog-viewindex-count-src-mq3-renderer-playable-flares-ml-2120918795"></a>
### ensureDynamicView

```ml
function ensureDynamicView(catalog, viewIndex, count)
```

Updates `catalog.dynamicStates`, `catalog.dynamicStates[viewIndex]` in `mq3.renderer.playable_flares.ensureDynamicView`; returns `states`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Mutable record or buffer; this call updates `catalog.dynamicStates`, `catalog.dynamicStates[viewIndex]`. |
| `viewIndex` | `dynamic` | — | Input tested by `viewIndex<0 or viewIndex>=MAX_VIEW_STATES`. |
| `count` | `dynamic` | — | Input used by `while len(states)<count states=states+[State(false,0,0.0)]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L209)

<a id="function-function-mq3-renderer-playable-flares-ensureview-function-ensureview-catalog-viewindex-src-mq3-renderer-playable-flares-ml-524426880"></a>
### ensureView

```ml
function ensureView(catalog, viewIndex)
```

Updates `catalog.states` in `mq3.renderer.playable_flares.ensureView`; returns `catalog.states[viewIndex]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Mutable record or buffer; this call updates `catalog.states`. |
| `viewIndex` | `dynamic` | — | Input tested by `viewIndex<0 or viewIndex>=MAX_VIEW_STATES`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L118)

<a id="function-function-mq3-renderer-playable-flares-f32-function-f32-map-offset-src-mq3-renderer-playable-flares-ml-2027149717"></a>
### f32

```ml
function f32(map, offset)
```

Returns `n.bitsFloat(value)` from `mq3.renderer.playable_flares.f32`; earlier branches return `fail("truncated float")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.readU32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L84)

<a id="constant-constant-mq3-renderer-playable-flares-face-stride-const-face-stride-104-src-mq3-renderer-playable-flares-ml-1416399680"></a>
### FACE_STRIDE

```ml
const FACE_STRIDE = 104
```

Byte stride of one face record in the BSP surface lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L16)

<a id="function-function-mq3-renderer-playable-flares-facing-function-facing-origin-point-normal-src-mq3-renderer-playable-flares-ml-205865437"></a>
### facing

```ml
function facing(origin, point, normal)
```

Returns `(dx*normal[0]+dy*normal[1]+dz*normal[2])/length` from `mq3.renderer.playable_flares.facing`; earlier branches return `0.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `point` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `normal` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L183)

<a id="function-function-mq3-renderer-playable-flares-fail-function-fail-message-src-mq3-renderer-playable-flares-ml-1828318161"></a>
### fail

```ml
function fail(message)
```

Creates error `7696` with message `"playable flares: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7696,"playable flares: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L77)

- [mq3.renderer.playable_flares.Flare](Type-mq3-renderer-playable-flares-flare-173432619.md) — struct
<a id="function-function-mq3-renderer-playable-flares-flaresize-function-flaresize-viewportwidth-eyedepth-sizevalue-src-mq3-renderer-playable-flares-ml-385506730"></a>
### flareSize

```ml
function flareSize(viewportWidth, eyeDepth, sizeValue)
```

Returns `viewportWidth*(sizeValue/640.0+8.0/eyeDepth)` from `mq3.renderer.playable_flares.flareSize`; earlier branches return `0.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `viewportWidth` | `dynamic` | — | Input tested by `viewportWidth<1 or eyeDepth<=0.0`. |
| `eyeDepth` | `dynamic` | — | Input tested by `viewportWidth<1 or eyeDepth<=0.0`. |
| `sizeValue` | `dynamic` | — | Input used in the result expression `viewportWidth*(sizeValue/640.0+8.0/eyeDepth)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L178)

<a id="function-function-mq3-renderer-playable-flares-foggedcolor-function-foggedcolor-flare-color-fogcatalog-vieworigin-forward-src-mq3-renderer-playable-flares-ml-402580846"></a>
### foggedColor

```ml
function foggedColor(flare, color, fogCatalog, viewOrigin, forward)
```

RB_RenderFlare begins flareShader with the retained fog number. Its additive blend selects ACFF_MODULATE_RGB in FinishShader, so fog attenuates RGB only.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flare` | `dynamic` | — | Record providing `flare.fogIndex`, `flare.origin`. |
| `color` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_materials.modulateForFog`. |
| `fogCatalog` | `dynamic` | — | Record providing `fogCatalog.fogs`. |
| `viewOrigin` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_fog.density`. |
| `forward` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_fog.density`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L231)

<a id="function-function-mq3-renderer-playable-flares-fogindexat-function-fogindexat-fogcatalog-origin-src-mq3-renderer-playable-flares-ml-1073932909"></a>
### fogIndexAt

```ml
function fogIndexAt(fogCatalog, origin)
```

RB_AddDlightFlares assigns each submitted light to the first fog whose axial brush bounds contain its origin.  Fog zero is the outside fallback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fogCatalog` | `dynamic` | — | Record providing `fogCatalog.fogs`. |
| `origin` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L196)

<a id="function-function-mq3-renderer-playable-flares-i32-function-i32-map-offset-src-mq3-renderer-playable-flares-ml-1774398971"></a>
### i32

```ml
function i32(map, offset)
```

Returns `value` from `mq3.renderer.playable_flares.i32`; earlier branches return `fail("truncated integer")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.readI32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L88)

<a id="function-function-mq3-renderer-playable-flares-load-function-load-archive-map-scripts-textureslot-enabled-src-mq3-renderer-playable-flares-ml-310206068"></a>
### load

```ml
function load(archive, map, scripts, textureSlot, enabled)
```

Builds `mq3.renderer.playable_flares.Catalog` using `mq3.renderer.playable_materials.mappedImageName`, `mq3.renderer.playable_materials.loadImage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_materials.loadImage`. |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.playable_flares.parse`. |
| `scripts` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_materials.mappedImageName`. |
| `textureSlot` | `dynamic` | — | Initial value for `mq3.renderer.playable_flares.Catalog.textureSlot`. |
| `enabled` | `dynamic` | — | Input tested by `enabled or len(flares)>0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L130)

<a id="function-function-mq3-renderer-playable-flares-makestates-function-makestates-count-src-mq3-renderer-playable-flares-ml-2060215273"></a>
### makeStates

```ml
function makeStates(count)
```

Returns `result` from `mq3.renderer.playable_flares.makeStates`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | `dynamic` | — | Input used by `for index=0 to count-1 result=result+[State(false,0,0.0)]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L114)

<a id="constant-constant-mq3-renderer-playable-flares-max-view-states-const-max-view-states-16-src-mq3-renderer-playable-flares-ml-1009771882"></a>
### MAX_VIEW_STATES

```ml
const MAX_VIEW_STATES = 16
```

Maximum number of independent view-specific flare states retained.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L24)

<a id="constant-constant-mq3-renderer-playable-flares-mst-flare-const-mst-flare-4-src-mq3-renderer-playable-flares-ml-490546623"></a>
### MST_FLARE

```ml
const MST_FLARE = 4
```

BSP surface type for a map-defined light flare.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L14)

<a id="function-function-mq3-renderer-playable-flares-parse-function-parse-map-src-mq3-renderer-playable-flares-ml-1020740748"></a>
### parse

```ml
function parse(map)
```

ParseFlare in tr_bsp.c copies these fields directly from dsurface_t.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`, `map.offsets`, `map.data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L92)

- [mq3.renderer.playable_flares.Point](Type-mq3-renderer-playable-flares-point-586923605.md) — struct
<a id="function-function-mq3-renderer-playable-flares-release-function-release-catalog-src-mq3-renderer-playable-flares-ml-314946743"></a>
### release

```ml
function release(catalog)
```

Returns `void` from `mq3.renderer.playable_flares.release`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.image`, `catalog.textureSlot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L150)

<a id="function-function-mq3-renderer-playable-flares-retiredynamicstates-function-retiredynamicstates-states-submittedcount-nowmilliseconds-src-mq3-renderer-playable-flares-ml-1494944380"></a>
### retireDynamicStates

```ml
function retireDynamicStates(states, submittedCount, nowMilliseconds)
```

RB_RenderFlares frees active entries that were not submitted this frame. Slot identity matches the stable refdef dlight-array address used by Baseq3.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `states` | `dynamic` | — | Mutable record or buffer; this call updates `states[index].visible`, `states[index].fadeTime`, `states[index].drawIntensity`. |
| `submittedCount` | `dynamic` | — | Input used by `for index=submittedCount to len(states)-1 states[index].visible=false`. |
| `nowMilliseconds` | `dynamic` | — | Input used by `states[index].fadeTime=nowMilliseconds-2000`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L220)

- [mq3.renderer.playable_flares.State](Type-mq3-renderer-playable-flares-state-337903418.md) — struct
<a id="function-function-mq3-renderer-playable-flares-updatestate-function-updatestate-state-visible-nowmilliseconds-faderate-src-mq3-renderer-playable-flares-ml-2089516995"></a>
### updateState

```ml
function updateState(state, visible, nowMilliseconds, fadeRate)
```

RB_TestFlare changes visibility at now-1 and clamps the linear fade.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.visible`, `state.fadeTime`, `state.drawIntensity`. |
| `visible` | `dynamic` | — | Input tested by `visible`. |
| `nowMilliseconds` | `dynamic` | — | Input used by `state.fadeTime=nowMilliseconds-1`. |
| `fadeRate` | `dynamic` | — | Input tested by `fadeRate<0.0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L157)

<a id="function-function-mq3-renderer-playable-flares-upload-function-upload-catalog-src-mq3-renderer-playable-flares-ml-336003029"></a>
### upload

```ml
function upload(catalog)
```

Uploads the enabled flare catalog image to its assigned texture slot and reports upload failure.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.enabled`, `catalog.textureSlot`, `catalog.image`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L142)

<a id="function-function-mq3-renderer-playable-flares-validmap-function-validmap-map-src-mq3-renderer-playable-flares-ml-1729017914"></a>
### validMap

```ml
function validMap(map)
```

Computes `map!=void and typeof(map.data)=="bytes" and map.offsets!=void and len(map.offsets)>13 and map.counts!=void and len(map.counts)>13` for `mq3.renderer.playable_flares.validMap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`, `map.offsets`, `map.counts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L80)

<a id="constant-constant-mq3-renderer-playable-flares-visibility-tolerance-const-visibility-tolerance-24-src-mq3-renderer-playable-flares-ml-1802405693"></a>
### VISIBILITY_TOLERANCE

```ml
const VISIBILITY_TOLERANCE = 24
```

Tolerance used when comparing flare depth with sampled scene depth.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L22)

<a id="function-function-mq3-renderer-playable-flares-visibleatdepth-function-visibleatdepth-flaredepth-surfacedepth-src-mq3-renderer-playable-flares-ml-1869683045"></a>
### visibleAtDepth

```ml
function visibleAtDepth(flareDepth, surfaceDepth)
```

Computes `surfaceDepth>0.0 and flareDepth-surfaceDepth<VISIBILITY_TOLERANCE` for `mq3.renderer.playable_flares.visibleAtDepth`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flareDepth` | `dynamic` | — | Input used in the result expression `surfaceDepth>0.0 and flareDepth-surfaceDepth<VISIBILITY_TOLERANCE`. |
| `surfaceDepth` | `dynamic` | — | Input used in the result expression `surfaceDepth>0.0 and flareDepth-surfaceDepth<VISIBILITY_TOLERANCE`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L173)
