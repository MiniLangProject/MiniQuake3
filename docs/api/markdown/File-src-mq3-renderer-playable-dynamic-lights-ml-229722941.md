# `src/mq3/renderer/playable_dynamic_lights.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.playable_dynamic_lights`](Package-mq3-renderer-playable-dynamic-lights-179368959.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)

## Declarations

<a id="function-function-mq3-renderer-playable-dynamic-lights-affectsbounds-function-affectsbounds-light-origin-axis-bounds-src-mq3-renderer-playable-dynamic-lights-ml-124370436"></a>
### affectsBounds

```ml
function affectsBounds(light, origin, axis, bounds)
```

Exact R_DlightBmodel point-to-expanded-bounds test after R_TransformDlights. The renderer stores the same result as a bit mask on every bmodel surface; the retained batch evaluates the equivalent predicate per light/model pair.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `light` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `bounds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L83)

- [mq3.renderer.playable_dynamic_lights.Batch](Type-mq3-renderer-playable-dynamic-lights-batch-2087703573.md) — struct
<a id="function-function-mq3-renderer-playable-dynamic-lights-build-function-build-renderdata-receiveflags-src-mq3-renderer-playable-dynamic-lights-ml-82331954"></a>
### build

```ml
function build(renderData, receiveFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — |  |
| `receiveFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L38)

<a id="function-function-mq3-renderer-playable-dynamic-lights-buildoriented-function-buildoriented-renderdata-receiveflags-origins-axes-bounds-src-mq3-renderer-playable-dynamic-lights-ml-550615041"></a>
### buildOriented

```ml
function buildOriented(renderData, receiveFlags, origins, axes, bounds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — |  |
| `receiveFlags` | `dynamic` | — |  |
| `origins` | `dynamic` | — |  |
| `axes` | `dynamic` | — |  |
| `bounds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L48)

- [mq3.renderer.playable_dynamic_lights.Catalog](Type-mq3-renderer-playable-dynamic-lights-catalog-1157749806.md) — struct
<a id="function-function-mq3-renderer-playable-dynamic-lights-createcatalog-function-createcatalog-slot-src-mq3-renderer-playable-dynamic-lights-ml-1466308552"></a>
### createCatalog

```ml
function createCatalog(slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L34)

<a id="constant-constant-mq3-renderer-playable-dynamic-lights-dlight-size-const-dlight-size-16-src-mq3-renderer-playable-dynamic-lights-ml-707059798"></a>
### DLIGHT_SIZE

```ml
const DLIGHT_SIZE = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L11)

<a id="function-function-mq3-renderer-playable-dynamic-lights-draw-function-draw-batch-catalog-lights-projection-src-mq3-renderer-playable-dynamic-lights-ml-1482575391"></a>
### draw

```ml
function draw(batch, catalog, lights, projection)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L117)

<a id="function-function-mq3-renderer-playable-dynamic-lights-drawtarget-function-drawtarget-batch-catalog-lights-projection-area-src-mq3-renderer-playable-dynamic-lights-ml-2007895220"></a>
### drawTarget

```ml
function drawTarget(batch, catalog, lights, projection, area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L108)

<a id="function-function-mq3-renderer-playable-dynamic-lights-drawviewport-function-drawviewport-batch-catalog-lights-projection-area-src-mq3-renderer-playable-dynamic-lights-ml-885206448"></a>
### drawViewport

```ml
function drawViewport(batch, catalog, lights, projection, area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L118)

<a id="function-function-mq3-renderer-playable-dynamic-lights-fail-function-fail-message-src-mq3-renderer-playable-dynamic-lights-ml-1959002809"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L21)

- [mq3.renderer.playable_dynamic_lights.Light](Type-mq3-renderer-playable-dynamic-lights-light-2075992717.md) — struct
<a id="function-function-mq3-renderer-playable-dynamic-lights-localpoint-function-localpoint-point-origin-axis-src-mq3-renderer-playable-dynamic-lights-ml-1433144623"></a>
### localPoint

```ml
function localPoint(point, origin, axis)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L68)

<a id="function-function-mq3-renderer-playable-dynamic-lights-orientedvertex-function-orientedvertex-light-position-origin-axis-src-mq3-renderer-playable-dynamic-lights-ml-1451084332"></a>
### orientedVertex

```ml
function orientedVertex(light, position, origin, axis)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `light` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L74)

<a id="function-function-mq3-renderer-playable-dynamic-lights-release-function-release-catalog-src-mq3-renderer-playable-dynamic-lights-ml-357132559"></a>
### release

```ml
function release(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L36)

<a id="function-function-mq3-renderer-playable-dynamic-lights-textureimage-function-textureimage-src-mq3-renderer-playable-dynamic-lights-ml-503485734"></a>
### textureImage

```ml
function textureImage()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L23)

<a id="function-function-mq3-renderer-playable-dynamic-lights-update-function-update-batch-catalog-light-src-mq3-renderer-playable-dynamic-lights-ml-1382313363"></a>
### update

```ml
function update(batch, catalog, light)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `light` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L92)

<a id="function-function-mq3-renderer-playable-dynamic-lights-upload-function-upload-catalog-src-mq3-renderer-playable-dynamic-lights-ml-783259181"></a>
### upload

```ml
function upload(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L35)

<a id="function-function-mq3-renderer-playable-dynamic-lights-vertex-function-vertex-light-position-src-mq3-renderer-playable-dynamic-lights-ml-905735821"></a>
### vertex

```ml
function vertex(light, position)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `light` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_dynamic_lights.ml#L61)

- [mq3.renderer.playable_dynamic_lights.VertexResult](Type-mq3-renderer-playable-dynamic-lights-vertexresult-1266326260.md) — struct
