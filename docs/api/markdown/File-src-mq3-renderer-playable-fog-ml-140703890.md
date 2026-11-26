# `src/mq3/renderer/playable_fog.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.playable_fog`](Package-mq3-renderer-playable-fog-62164712.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/shader_parser.ml` as `shaderParser` → [src/mq3/renderer/shader_parser.ml](File-src-mq3-renderer-shader-parser-ml-2114769074.md)

## Declarations

<a id="function-function-mq3-renderer-playable-fog-assigntexture-function-assigntexture-catalog-slot-src-mq3-renderer-playable-fog-ml-1612081699"></a>
### assignTexture

```ml
function assignTexture(catalog, slot)
```

Updates `catalog.textureSlot` in `mq3.renderer.playable_fog.assignTexture`; returns `1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Mutable record or buffer; this call updates `catalog.textureSlot`. |
| `slot` | `dynamic` | — | Value assigned to `catalog.textureSlot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L142)

<a id="constant-constant-mq3-renderer-playable-fog-brush-side-stride-const-brush-side-stride-8-src-mq3-renderer-playable-fog-ml-1928351033"></a>
### BRUSH_SIDE_STRIDE

```ml
const BRUSH_SIDE_STRIDE = 8
```

Byte stride of one brush-side record in the BSP brush-side lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L18)

<a id="constant-constant-mq3-renderer-playable-fog-brush-stride-const-brush-stride-12-src-mq3-renderer-playable-fog-ml-1112570926"></a>
### BRUSH_STRIDE

```ml
const BRUSH_STRIDE = 12
```

Byte stride of one brush record in the BSP brush lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L16)

<a id="function-function-mq3-renderer-playable-fog-build-function-build-renderdata-catalog-src-mq3-renderer-playable-fog-ml-1508265223"></a>
### build

```ml
function build(renderData, catalog)
```

Builds `mq3.renderer.playable_fog.FogBatch` after updating `positions[output]`, `indexes[output]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — | Record providing `renderData.triangles`. |
| `catalog` | `dynamic` | — | Record providing `catalog.fogs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L190)

- [mq3.renderer.playable_fog.Catalog](Type-mq3-renderer-playable-fog-catalog-1077776833.md) — struct
<a id="function-function-mq3-renderer-playable-fog-coordinates-function-coordinates-fog-position-vieworigin-forward-src-mq3-renderer-playable-fog-ml-133259803"></a>
### coordinates

```ml
function coordinates(fog, position, viewOrigin, forward)
```

Computes `coordinates` from `[s,t]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fog` | `dynamic` | — | Record providing `fog.tcScale`, `fog.hasSurface`, `fog.surface`. |
| `position` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `viewOrigin` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `forward` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L164)

<a id="function-function-mq3-renderer-playable-fog-density-function-density-fog-position-vieworigin-forward-src-mq3-renderer-playable-fog-ml-203399761"></a>
### density

```ml
function density(fog, position, viewOrigin, forward)
```

Returns `fogFactor(uv[0],uv[1])` from `mq3.renderer.playable_fog.density`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fog` | `dynamic` | — | Value forwarded as `fog` to `mq3.renderer.playable_fog.coordinates`. |
| `position` | `dynamic` | — | Value forwarded as `position` to `mq3.renderer.playable_fog.coordinates`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `viewOrigin` to `mq3.renderer.playable_fog.coordinates`. |
| `forward` | `dynamic` | — | Value forwarded as `forward` to `mq3.renderer.playable_fog.coordinates`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L185)

<a id="function-function-mq3-renderer-playable-fog-draw-function-draw-batch-catalog-projection-src-mq3-renderer-playable-fog-ml-1873960262"></a>
### draw

```ml
function draw(batch, catalog, projection)
```

Calls `mq3.renderer.playable_fog.drawTarget` with `(batch,catalog,projection,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Value forwarded as `batch` to `mq3.renderer.playable_fog.drawTarget`. |
| `catalog` | `dynamic` | — | Value forwarded as `catalog` to `mq3.renderer.playable_fog.drawTarget`. |
| `projection` | `dynamic` | — | Value forwarded as `projection` to `mq3.renderer.playable_fog.drawTarget`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L236)

<a id="function-function-mq3-renderer-playable-fog-drawtarget-function-drawtarget-batch-catalog-projection-area-src-mq3-renderer-playable-fog-ml-2135235563"></a>
### drawTarget

```ml
function drawTarget(batch, catalog, projection, area)
```

Updates view-dependent fog coordinates and draws the fog pass using alpha blending and equal-depth testing.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Record providing `batch.commands`. |
| `catalog` | `dynamic` | — | Record providing `catalog.textureSlot`. |
| `projection` | `dynamic` | — | Record providing `projection.position`, `projection.forward`. |
| `area` | `dynamic` | — | Argument 3 supplied to `mq3.platform.playable_window.submitWorldTriangleBatchViewport`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L227)

<a id="function-function-mq3-renderer-playable-fog-drawviewport-function-drawviewport-batch-catalog-projection-area-src-mq3-renderer-playable-fog-ml-475046855"></a>
### drawViewport

```ml
function drawViewport(batch, catalog, projection, area)
```

Calls `mq3.renderer.playable_fog.drawTarget` with `(batch,catalog,projection,area)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Value forwarded as `batch` to `mq3.renderer.playable_fog.drawTarget`. |
| `catalog` | `dynamic` | — | Value forwarded as `catalog` to `mq3.renderer.playable_fog.drawTarget`. |
| `projection` | `dynamic` | — | Value forwarded as `projection` to `mq3.renderer.playable_fog.drawTarget`. |
| `area` | `dynamic` | — | Value forwarded as `area` to `mq3.renderer.playable_fog.drawTarget`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L242)

<a id="function-function-mq3-renderer-playable-fog-f32-function-f32-map-offset-src-mq3-renderer-playable-fog-ml-1087297979"></a>
### f32

```ml
function f32(map, offset)
```

Calls `mq3.compat.numeric.bitsFloat` with `(n.readU32(map.data,offset))` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.readU32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L72)

<a id="function-function-mq3-renderer-playable-fog-fail-function-fail-message-src-mq3-renderer-playable-fog-ml-1498685399"></a>
### fail

```ml
function fail(message)
```

Creates error `7620` with message `"playable fog: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7620,"playable fog: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L64)

- [mq3.renderer.playable_fog.Fog](Type-mq3-renderer-playable-fog-fog-528131882.md) — struct
<a id="constant-constant-mq3-renderer-playable-fog-fog-stride-const-fog-stride-72-src-mq3-renderer-playable-fog-ml-1849207764"></a>
### FOG_STRIDE

```ml
const FOG_STRIDE = 72
```

Byte stride of one fog record in the BSP fog lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L14)

<a id="constant-constant-mq3-renderer-playable-fog-fog-texture-height-const-fog-texture-height-32-src-mq3-renderer-playable-fog-ml-926204504"></a>
### FOG_TEXTURE_HEIGHT

```ml
const FOG_TEXTURE_HEIGHT = 32
```

Height in pixels of the generated fog-density texture.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L24)

<a id="constant-constant-mq3-renderer-playable-fog-fog-texture-width-const-fog-texture-width-256-src-mq3-renderer-playable-fog-ml-782583682"></a>
### FOG_TEXTURE_WIDTH

```ml
const FOG_TEXTURE_WIDTH = 256
```

Width in pixels of the generated fog-density texture.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L22)

- [mq3.renderer.playable_fog.FogBatch](Type-mq3-renderer-playable-fog-fogbatch-460027350.md) — struct
<a id="function-function-mq3-renderer-playable-fog-fogfactor-function-fogfactor-s-t-src-mq3-renderer-playable-fog-ml-749491453"></a>
### fogFactor

```ml
function fogFactor(s, t)
```

Computes `fogFactor` from `trans.sqrt(index/255.0)` using `mq3.compat.numeric.trunc32`, `mq3.compat.transcendental.sqrt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — | Input used by `s=s-1.0/512.0`. |
| `t` | `dynamic` | — | Input tested by `s<0.0 or t<1.0/32.0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L119)

<a id="function-function-mq3-renderer-playable-fog-i32-function-i32-map-offset-src-mq3-renderer-playable-fog-ml-662549357"></a>
### i32

```ml
function i32(map, offset)
```

Calls `mq3.compat.numeric.readI32` with `(map.data,offset)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.readI32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L68)

<a id="function-function-mq3-renderer-playable-fog-load-function-load-map-index-src-mq3-renderer-playable-fog-ml-600508042"></a>
### load

```ml
function load(map, index)
```

Builds `mq3.renderer.playable_fog.Catalog` using `mq3.renderer.shader_parser.parseIndexed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`. |
| `index` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.shader_parser.parseIndexed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L91)

<a id="function-function-mq3-renderer-playable-fog-plane-function-plane-map-index-src-mq3-renderer-playable-fog-ml-493655426"></a>
### plane

```ml
function plane(map, index)
```

Returns `[[f32(map,offset),f32(map,offset+4),f32(map,offset+8)],f32(map,offset+12)]` from `mq3.renderer.playable_fog.plane`; earlier branches return `offset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.playable_fog.recordOffset`. |
| `index` | `dynamic` | — | Value forwarded as `index` to `mq3.renderer.playable_fog.recordOffset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L86)

<a id="constant-constant-mq3-renderer-playable-fog-plane-stride-const-plane-stride-16-src-mq3-renderer-playable-fog-ml-650648702"></a>
### PLANE_STRIDE

```ml
const PLANE_STRIDE = 16
```

Byte stride of one plane record in the BSP plane lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L20)

<a id="function-function-mq3-renderer-playable-fog-recordname-function-recordname-map-offset-src-mq3-renderer-playable-fog-ml-532111997"></a>
### recordName

```ml
function recordName(map, offset)
```

Returns `decode(slice(map.data,offset,length))` from `mq3.renderer.playable_fog.recordName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `slice`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L82)

<a id="function-function-mq3-renderer-playable-fog-recordoffset-function-recordoffset-map-lump-index-stride-src-mq3-renderer-playable-fog-ml-1267007489"></a>
### recordOffset

```ml
function recordOffset(map, lump, index, stride)
```

Returns `map.offsets[lump]+index*stride` from `mq3.renderer.playable_fog.recordOffset`; earlier branches return `fail("BSP fog reference outside lump")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`, `map.offsets`. |
| `lump` | `dynamic` | — | Input tested by `index<0 or index>=map.counts[lump]`. |
| `index` | `dynamic` | — | Input tested by `index<0 or index>=map.counts[lump]`. |
| `stride` | `dynamic` | — | Input used in the result expression `map.offsets[lump]+index*stride`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L78)

<a id="function-function-mq3-renderer-playable-fog-release-function-release-catalog-src-mq3-renderer-playable-fog-ml-1990053321"></a>
### release

```ml
function release(catalog)
```

Returns `void` from `mq3.renderer.playable_fog.release`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.textureSlot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L157)

<a id="function-function-mq3-renderer-playable-fog-textureimage-function-textureimage-src-mq3-renderer-playable-fog-ml-541768800"></a>
### textureImage

```ml
function textureImage()
```

Builds `pixels[(y*FOG_TEXTURE_WIDTH+x)*4+3]` in `mq3.renderer.playable_fog.textureImage`; returns `materials.Image(FOG_TEXTURE_WIDTH,FOG_TEXTURE_HEIGHT,pixels)`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L128)

<a id="function-function-mq3-renderer-playable-fog-update-function-update-batch-catalog-vieworigin-forward-src-mq3-renderer-playable-fog-ml-1085563073"></a>
### update

```ml
function update(batch, catalog, viewOrigin, forward)
```

Computes `update` from `batch.commands.count` using `mq3.compat.numeric.trunc32`, `mq3.platform.playable_window.writeBatchI32`, `mq3.renderer.playable_fog.coordinates`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Record providing `batch.commands`, `batch.fogIndexes`, `batch.sourcePositions`. |
| `catalog` | `dynamic` | — | Record providing `catalog.fogs`, `catalog.textureSlot`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `viewOrigin` to `mq3.renderer.playable_fog.coordinates`. |
| `forward` | `dynamic` | — | Value forwarded as `forward` to `mq3.renderer.playable_fog.coordinates`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L209)

<a id="function-function-mq3-renderer-playable-fog-upload-function-upload-catalog-src-mq3-renderer-playable-fog-ml-733589335"></a>
### upload

```ml
function upload(catalog)
```

Uploads the fog lookup image to its assigned native texture slot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.textureSlot`, `catalog.texture`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_fog.ml#L149)
