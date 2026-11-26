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
| `light` | `dynamic` | — | Record providing `light.radius`, `light.origin`. |
| `origin` | `dynamic` | — | Value forwarded as `origin` to `mq3.renderer.playable_dynamic_lights.localPoint`. |
| `axis` | `dynamic` | — | Value forwarded as `axis` to `mq3.renderer.playable_dynamic_lights.localPoint`. |
| `bounds` | `dynamic` | — | Nested indexed data; outer entries read at `0`, `1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L153)

- [mq3.renderer.playable_dynamic_lights.Batch](Type-mq3-renderer-playable-dynamic-lights-batch-2087703573.md) — struct
<a id="function-function-mq3-renderer-playable-dynamic-lights-build-function-build-renderdata-receiveflags-src-mq3-renderer-playable-dynamic-lights-ml-82331954"></a>
### build

```ml
function build(renderData, receiveFlags)
```

Builds `mq3.renderer.playable_dynamic_lights.Batch` after updating `triangles[output]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — | Record providing `renderData.triangles`. |
| `receiveFlags` | `dynamic` | — | Indexed input read at `triangle.textureIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L86)

<a id="function-function-mq3-renderer-playable-dynamic-lights-buildoriented-function-buildoriented-renderdata-receiveflags-origins-axes-bounds-src-mq3-renderer-playable-dynamic-lights-ml-550615041"></a>
### buildOriented

```ml
function buildOriented(renderData, receiveFlags, origins, axes, bounds)
```

Builds `mq3.renderer.playable_dynamic_lights.Batch` after updating `triangles[output]`, `keptOrigins[output]`, `keptAxes[output]`, `keptBounds[output]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — | Record providing `renderData.triangles`. |
| `receiveFlags` | `dynamic` | — | Indexed input read at `triangle.textureIndex`. |
| `origins` | `dynamic` | — | Indexed input read at `sourceIndex`. |
| `axes` | `dynamic` | — | Indexed input read at `sourceIndex`. |
| `bounds` | `dynamic` | — | Indexed input read at `sourceIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L102)

- [mq3.renderer.playable_dynamic_lights.Catalog](Type-mq3-renderer-playable-dynamic-lights-catalog-1157749806.md) — struct
<a id="function-function-mq3-renderer-playable-dynamic-lights-createcatalog-function-createcatalog-slot-src-mq3-renderer-playable-dynamic-lights-ml-1466308552"></a>
### createCatalog

```ml
function createCatalog(slot)
```

Builds `mq3.renderer.playable_dynamic_lights.Catalog` for `mq3.renderer.playable_dynamic_lights.createCatalog`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Initial value for `mq3.renderer.playable_dynamic_lights.Catalog.textureSlot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L75)

<a id="constant-constant-mq3-renderer-playable-dynamic-lights-dlight-size-const-dlight-size-16-src-mq3-renderer-playable-dynamic-lights-ml-707059798"></a>
### DLIGHT_SIZE

```ml
const DLIGHT_SIZE = 16
```

Width and height in pixels of the generated dynamic-light texture.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L12)

<a id="function-function-mq3-renderer-playable-dynamic-lights-draw-function-draw-batch-catalog-lights-projection-src-mq3-renderer-playable-dynamic-lights-ml-1482575391"></a>
### draw

```ml
function draw(batch, catalog, lights, projection)
```

Calls `mq3.renderer.playable_dynamic_lights.drawTarget` with `(batch,catalog,lights,projection,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Value forwarded as `batch` to `mq3.renderer.playable_dynamic_lights.drawTarget`. |
| `catalog` | `dynamic` | — | Value forwarded as `catalog` to `mq3.renderer.playable_dynamic_lights.drawTarget`. |
| `lights` | `dynamic` | — | Value forwarded as `lights` to `mq3.renderer.playable_dynamic_lights.drawTarget`. |
| `projection` | `dynamic` | — | Value forwarded as `projection` to `mq3.renderer.playable_dynamic_lights.drawTarget`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L202)

<a id="function-function-mq3-renderer-playable-dynamic-lights-drawtarget-function-drawtarget-batch-catalog-lights-projection-area-src-mq3-renderer-playable-dynamic-lights-ml-2007895220"></a>
### drawTarget

```ml
function drawTarget(batch, catalog, lights, projection, area)
```

Draws dynamic-light batches using additive projected lighting and the requested camera/viewport.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Record providing `batch.commands`. |
| `catalog` | `dynamic` | — | Value forwarded as `catalog` to `mq3.renderer.playable_dynamic_lights.update`. |
| `lights` | `dynamic` | — | Sequence traversed as `light` while producing this result. |
| `projection` | `dynamic` | — | Argument 2 supplied to `mq3.platform.playable_window.submitWorldTriangleBatch`. |
| `area` | `dynamic` | — | Argument 3 supplied to `mq3.platform.playable_window.submitWorldTriangleBatchViewport`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L188)

<a id="function-function-mq3-renderer-playable-dynamic-lights-drawviewport-function-drawviewport-batch-catalog-lights-projection-area-src-mq3-renderer-playable-dynamic-lights-ml-885206448"></a>
### drawViewport

```ml
function drawViewport(batch, catalog, lights, projection, area)
```

Calls `mq3.renderer.playable_dynamic_lights.drawTarget` with `(batch,catalog,lights,projection,area)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Value forwarded as `batch` to `mq3.renderer.playable_dynamic_lights.drawTarget`. |
| `catalog` | `dynamic` | — | Value forwarded as `catalog` to `mq3.renderer.playable_dynamic_lights.drawTarget`. |
| `lights` | `dynamic` | — | Value forwarded as `lights` to `mq3.renderer.playable_dynamic_lights.drawTarget`. |
| `projection` | `dynamic` | — | Value forwarded as `projection` to `mq3.renderer.playable_dynamic_lights.drawTarget`. |
| `area` | `dynamic` | — | Value forwarded as `area` to `mq3.renderer.playable_dynamic_lights.drawTarget`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L209)

<a id="function-function-mq3-renderer-playable-dynamic-lights-fail-function-fail-message-src-mq3-renderer-playable-dynamic-lights-ml-1959002809"></a>
### fail

```ml
function fail(message)
```

Creates error `7630` with message `"playable dynamic lights: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7630,"playable dynamic lights: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L59)

- [mq3.renderer.playable_dynamic_lights.Light](Type-mq3-renderer-playable-dynamic-lights-light-2075992717.md) — struct
<a id="function-function-mq3-renderer-playable-dynamic-lights-localpoint-function-localpoint-point-origin-axis-src-mq3-renderer-playable-dynamic-lights-ml-1433144623"></a>
### localPoint

```ml
function localPoint(point, origin, axis)
```

Transforms a point into an oriented light/entity frame by subtracting its origin and projecting onto three axes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `origin` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `axis` | `dynamic` | — | Nested indexed data; outer entries read at `0`, `1`, `2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L129)

<a id="function-function-mq3-renderer-playable-dynamic-lights-orientedvertex-function-orientedvertex-light-position-origin-axis-src-mq3-renderer-playable-dynamic-lights-ml-1451084332"></a>
### orientedVertex

```ml
function orientedVertex(light, position, origin, axis)
```

Computes `orientedVertex` from `vertex(Light(localLight,light.radius,light.color,light.additive),localPosition)` using `mq3.renderer.playable_dynamic_lights.localPoint`, `mq3.renderer.playable_dynamic_lights.vertex`, `mq3.renderer.playable_dynamic_lights.Light`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `light` | `dynamic` | — | Record providing `light.origin`, `light.radius`, `light.color`, `light.additive`. |
| `position` | `dynamic` | — | Value forwarded as `point` to `mq3.renderer.playable_dynamic_lights.localPoint`. |
| `origin` | `dynamic` | — | Value forwarded as `origin` to `mq3.renderer.playable_dynamic_lights.localPoint`. |
| `axis` | `dynamic` | — | Value forwarded as `axis` to `mq3.renderer.playable_dynamic_lights.localPoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L140)

<a id="function-function-mq3-renderer-playable-dynamic-lights-release-function-release-catalog-src-mq3-renderer-playable-dynamic-lights-ml-357132559"></a>
### release

```ml
function release(catalog)
```

Returns `void` from `mq3.renderer.playable_dynamic_lights.release`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.textureSlot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L81)

<a id="function-function-mq3-renderer-playable-dynamic-lights-textureimage-function-textureimage-src-mq3-renderer-playable-dynamic-lights-ml-503485734"></a>
### textureImage

```ml
function textureImage()
```

Builds `pixels[offset]`, `pixels[offset+1]`, `pixels[offset+2]` in `mq3.renderer.playable_dynamic_lights.textureImage`; returns `materials.Image(DLIGHT_SIZE,DLIGHT_SIZE,pixels)`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L62)

<a id="function-function-mq3-renderer-playable-dynamic-lights-update-function-update-batch-catalog-light-src-mq3-renderer-playable-dynamic-lights-ml-1382313363"></a>
### update

```ml
function update(batch, catalog, light)
```

Computes `update` from `batch.commands.count` using `mq3.platform.playable_window.resetTriangleBatch`, `mq3.renderer.playable_dynamic_lights.vertex`, `mq3.renderer.playable_dynamic_lights.affectsBounds`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Record providing `batch.commands`, `batch.triangles`, `batch.origins`, `batch.axes`, `batch.bounds`. |
| `catalog` | `dynamic` | — | Record providing `catalog.textureSlot`. |
| `light` | `dynamic` | — | Record providing `light.radius`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L166)

<a id="function-function-mq3-renderer-playable-dynamic-lights-upload-function-upload-catalog-src-mq3-renderer-playable-dynamic-lights-ml-783259181"></a>
### upload

```ml
function upload(catalog)
```

Returns `1` from `mq3.renderer.playable_dynamic_lights.upload`; earlier branches return `fail("could not upload projected-light texture")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.textureSlot`, `catalog.image`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L78)

<a id="function-function-mq3-renderer-playable-dynamic-lights-vertex-function-vertex-light-position-src-mq3-renderer-playable-dynamic-lights-ml-905735821"></a>
### vertex

```ml
function vertex(light, position)
```

Builds `mq3.renderer.playable_dynamic_lights.VertexResult` for `mq3.renderer.playable_dynamic_lights.vertex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `light` | `dynamic` | — | Record providing `light.radius`, `light.origin`, `light.color`. |
| `position` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_dynamic_lights.ml#L118)

- [mq3.renderer.playable_dynamic_lights.VertexResult](Type-mq3-renderer-playable-dynamic-lights-vertexresult-1266326260.md) — struct
