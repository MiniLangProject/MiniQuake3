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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L75)

<a id="constant-constant-mq3-renderer-playable-fog-brush-side-stride-const-brush-side-stride-8-src-mq3-renderer-playable-fog-ml-1928351033"></a>
### BRUSH_SIDE_STRIDE

```ml
const BRUSH_SIDE_STRIDE = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L15)

<a id="constant-constant-mq3-renderer-playable-fog-brush-stride-const-brush-stride-12-src-mq3-renderer-playable-fog-ml-1112570926"></a>
### BRUSH_STRIDE

```ml
const BRUSH_STRIDE = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L14)

<a id="function-function-mq3-renderer-playable-fog-build-function-build-renderdata-catalog-src-mq3-renderer-playable-fog-ml-1508265223"></a>
### build

```ml
function build(renderData, catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L106)

- [mq3.renderer.playable_fog.Catalog](Type-mq3-renderer-playable-fog-catalog-1077776833.md) — struct
<a id="function-function-mq3-renderer-playable-fog-coordinates-function-coordinates-fog-position-vieworigin-forward-src-mq3-renderer-playable-fog-ml-133259803"></a>
### coordinates

```ml
function coordinates(fog, position, viewOrigin, forward)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fog` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L88)

<a id="function-function-mq3-renderer-playable-fog-density-function-density-fog-position-vieworigin-forward-src-mq3-renderer-playable-fog-ml-203399761"></a>
### density

```ml
function density(fog, position, viewOrigin, forward)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fog` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L104)

<a id="function-function-mq3-renderer-playable-fog-draw-function-draw-batch-catalog-projection-src-mq3-renderer-playable-fog-ml-1873960262"></a>
### draw

```ml
function draw(batch, catalog, projection)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L138)

<a id="function-function-mq3-renderer-playable-fog-drawtarget-function-drawtarget-batch-catalog-projection-area-src-mq3-renderer-playable-fog-ml-2135235563"></a>
### drawTarget

```ml
function drawTarget(batch, catalog, projection, area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L133)

<a id="function-function-mq3-renderer-playable-fog-drawviewport-function-drawviewport-batch-catalog-projection-area-src-mq3-renderer-playable-fog-ml-475046855"></a>
### drawViewport

```ml
function drawViewport(batch, catalog, projection, area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L139)

<a id="function-function-mq3-renderer-playable-fog-f32-function-f32-map-offset-src-mq3-renderer-playable-fog-ml-1087297979"></a>
### f32

```ml
function f32(map, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L26)

<a id="function-function-mq3-renderer-playable-fog-fail-function-fail-message-src-mq3-renderer-playable-fog-ml-1498685399"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L24)

- [mq3.renderer.playable_fog.Fog](Type-mq3-renderer-playable-fog-fog-528131882.md) — struct
<a id="constant-constant-mq3-renderer-playable-fog-fog-stride-const-fog-stride-72-src-mq3-renderer-playable-fog-ml-1849207764"></a>
### FOG_STRIDE

```ml
const FOG_STRIDE = 72
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L13)

<a id="constant-constant-mq3-renderer-playable-fog-fog-texture-height-const-fog-texture-height-32-src-mq3-renderer-playable-fog-ml-926204504"></a>
### FOG_TEXTURE_HEIGHT

```ml
const FOG_TEXTURE_HEIGHT = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L18)

<a id="constant-constant-mq3-renderer-playable-fog-fog-texture-width-const-fog-texture-width-256-src-mq3-renderer-playable-fog-ml-782583682"></a>
### FOG_TEXTURE_WIDTH

```ml
const FOG_TEXTURE_WIDTH = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L17)

- [mq3.renderer.playable_fog.FogBatch](Type-mq3-renderer-playable-fog-fogbatch-460027350.md) — struct
<a id="function-function-mq3-renderer-playable-fog-fogfactor-function-fogfactor-s-t-src-mq3-renderer-playable-fog-ml-749491453"></a>
### fogFactor

```ml
function fogFactor(s, t)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L56)

<a id="function-function-mq3-renderer-playable-fog-i32-function-i32-map-offset-src-mq3-renderer-playable-fog-ml-662549357"></a>
### i32

```ml
function i32(map, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L25)

<a id="function-function-mq3-renderer-playable-fog-load-function-load-map-index-src-mq3-renderer-playable-fog-ml-600508042"></a>
### load

```ml
function load(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L31)

<a id="function-function-mq3-renderer-playable-fog-plane-function-plane-map-index-src-mq3-renderer-playable-fog-ml-493655426"></a>
### plane

```ml
function plane(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L29)

<a id="constant-constant-mq3-renderer-playable-fog-plane-stride-const-plane-stride-16-src-mq3-renderer-playable-fog-ml-650648702"></a>
### PLANE_STRIDE

```ml
const PLANE_STRIDE = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L16)

<a id="function-function-mq3-renderer-playable-fog-recordname-function-recordname-map-offset-src-mq3-renderer-playable-fog-ml-532111997"></a>
### recordName

```ml
function recordName(map, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L28)

<a id="function-function-mq3-renderer-playable-fog-recordoffset-function-recordoffset-map-lump-index-stride-src-mq3-renderer-playable-fog-ml-1267007489"></a>
### recordOffset

```ml
function recordOffset(map, lump, index, stride)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `lump` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `stride` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L27)

<a id="function-function-mq3-renderer-playable-fog-release-function-release-catalog-src-mq3-renderer-playable-fog-ml-1990053321"></a>
### release

```ml
function release(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L86)

<a id="function-function-mq3-renderer-playable-fog-textureimage-function-textureimage-src-mq3-renderer-playable-fog-ml-541768800"></a>
### textureImage

```ml
function textureImage()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L64)

<a id="function-function-mq3-renderer-playable-fog-update-function-update-batch-catalog-vieworigin-forward-src-mq3-renderer-playable-fog-ml-1085563073"></a>
### update

```ml
function update(batch, catalog, viewOrigin, forward)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L120)

<a id="function-function-mq3-renderer-playable-fog-upload-function-upload-catalog-src-mq3-renderer-playable-fog-ml-733589335"></a>
### upload

```ml
function upload(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_fog.ml#L80)
