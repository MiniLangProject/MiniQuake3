# `src/mq3/renderer/portal_render_pass.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.portal_render_pass`](Package-mq3-renderer-portal-render-pass-616994596.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/renderer/portal_view.ml` as `portalView` → [src/mq3/renderer/portal_view.ml](File-src-mq3-renderer-portal-view-ml-1859210863.md)
- `mq3/renderer/world_surface_selection.ml` as `worldSelection` → [src/mq3/renderer/world_surface_selection.ml](File-src-mq3-renderer-world-surface-selection-ml-1945526598.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/ds/list.ml` as `lists` → `../../a7594a0c0299/MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/ds/set.ml` as `sets` → `../../a7594a0c0299/MiniLangCompilerML/std/ds/set.ml` — external dependency
- `std/sort.ml` as `sorting` → `../../a7594a0c0299/MiniLangCompilerML/std/sort.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-portal-render-pass-before-function-before-left-right-src-mq3-renderer-portal-render-pass-ml-311208021"></a>
### before

```ml
function before(left, right)
```

Computes `left.distanceSquared<right.distanceSquared or (left.distanceSquared==right.distanceSquared and left.faceIndex<right.faceIndex)` for `mq3.renderer.portal_render_pass.before`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Record providing `left.distanceSquared`, `left.faceIndex`. |
| `right` | `dynamic` | — | Record providing `right.distanceSquared`, `right.faceIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L125)

<a id="function-function-mq3-renderer-portal-render-pass-cachedworldbatch-function-cachedworldbatch-cache-faces-normal-dist-src-mq3-renderer-portal-render-pass-ml-1123776111"></a>
### cachedWorldBatch

```ml
function cachedWorldBatch(cache, faces, normal, dist)
```

Updates `cache.hits` in `mq3.renderer.portal_render_pass.cachedWorldBatch`; returns `cache.batch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Mutable record or buffer; this call updates `cache.hits`. |
| `faces` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.world_surface_selection.sameFaces`. |
| `normal` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `dist` | `dynamic` | — | Input tested by `cache.batch==void or cache.dist!=dist or cache.normal[0]!=normal[0] or cache.normal[1]!=normal[1] or cache.normal[2]!=normal[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L85)

<a id="function-function-mq3-renderer-portal-render-pass-compose-function-compose-services-portal-src-mq3-renderer-portal-render-pass-ml-42640574"></a>
### compose

```ml
function compose(services, portal)
```

Computes `compose` from `drawn+value` using `services.drawPortalFn`, `services.clearDepthFn`, `services.drawMainFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Record providing `services.clearDepthFn`, `services.drawMainFn`, `services.drawPortalFn`, `services.context`. |
| `portal` | `dynamic` | — | Argument 2 supplied to `services.drawPortalFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L216)

- [mq3.renderer.portal_render_pass.ComposeServices](Type-mq3-renderer-portal-render-pass-composeservices-375393362.md) — struct
<a id="function-function-mq3-renderer-portal-render-pass-fail-function-fail-message-src-mq3-renderer-portal-render-pass-ml-736748327"></a>
### fail

```ml
function fail(message)
```

Creates error `7702` with message `"portal render pass: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7702,"portal render pass: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L105)

- [mq3.renderer.portal_render_pass.Plan](Type-mq3-renderer-portal-render-pass-plan-1216886981.md) — struct
<a id="function-function-mq3-renderer-portal-render-pass-planefor-function-planefor-triangle-vieworigin-src-mq3-renderer-portal-render-pass-ml-970024339"></a>
### planeFor

```ml
function planeFor(triangle, viewOrigin)
```

Builds `mq3.renderer.portal_render_pass.Surface` using `mq3.shared.math.VectorLength`, `mq3.shared.math.CrossProduct`, `mq3.shared.math.VectorNormalize`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — | Record providing `triangle.vertices`, `triangle.faceIndex`, `triangle.textureIndex`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `b` to `mq3.renderer.portal_render_pass.squaredDistance`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L113)

<a id="function-function-mq3-renderer-portal-render-pass-prepare-function-prepare-renderdata-catalog-geometry-sourcerefdef-isportal-src-mq3-renderer-portal-render-pass-ml-2049993458"></a>
### prepare

```ml
function prepare(renderData, catalog, geometry, sourceRefdef, isPortal)
```

Baseq3 renders at most the first viable portal view in a main view and refuses recursion.  Here distance provides deterministic draw-surface ordering when several selected portal faces share sort == SS_PORTAL.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — | Record providing `renderData.triangles`. |
| `catalog` | `dynamic` | — | Record providing `catalog.materials`. |
| `geometry` | `dynamic` | — | Record providing `geometry.portals`. |
| `sourceRefdef` | `dynamic` | — | Record providing `sourceRefdef.flags`, `sourceRefdef.width`, `sourceRefdef.fovX`, `sourceRefdef.height`, `sourceRefdef.fovY`, `sourceRefdef.vieworg`. |
| `isPortal` | `dynamic` | — | Input tested by `isPortal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L168)

- [mq3.renderer.portal_render_pass.Refdef](Type-mq3-renderer-portal-render-pass-refdef-994927790.md) — struct
<a id="function-function-mq3-renderer-portal-render-pass-squareddistance-function-squareddistance-a-b-src-mq3-renderer-portal-render-pass-ml-931224495"></a>
### squaredDistance

```ml
function squaredDistance(a, b)
```

Returns `x*x+y*y+z*z` from `mq3.renderer.portal_render_pass.squaredDistance`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L109)

<a id="function-function-mq3-renderer-portal-render-pass-storeworldbatch-function-storeworldbatch-cache-faces-normal-dist-batch-src-mq3-renderer-portal-render-pass-ml-1284737083"></a>
### storeWorldBatch

```ml
function storeWorldBatch(cache, faces, normal, dist, batch)
```

Updates `cache.faces`, `cache.normal`, `cache.dist`, `cache.batch`, `cache.builds` in `mq3.renderer.portal_render_pass.storeWorldBatch`; returns `batch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Mutable record or buffer; this call updates `cache.faces`, `cache.normal`, `cache.dist`, `cache.batch`, `cache.builds`. |
| `faces` | `dynamic` | — | Value assigned to `cache.faces`. |
| `normal` | `dynamic` | — | Value assigned to `cache.normal`. |
| `dist` | `dynamic` | — | Value assigned to `cache.dist`. |
| `batch` | `dynamic` | — | Value assigned to `cache.batch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L97)

- [mq3.renderer.portal_render_pass.Surface](Type-mq3-renderer-portal-render-pass-surface-600674701.md) — struct
<a id="function-function-mq3-renderer-portal-render-pass-trianglefacesview-function-trianglefacesview-triangle-vieworigin-src-mq3-renderer-portal-render-pass-ml-830017621"></a>
### triangleFacesView

```ml
function triangleFacesView(triangle, viewOrigin)
```

SurfIsOffscreen counts only triangles whose first vertex faces the eye. A surface with every triangle backfaced cannot contribute a portal view.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — | Record providing `triangle.vertices`. |
| `viewOrigin` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L155)

<a id="function-function-mq3-renderer-portal-render-pass-triangleinfrustum-function-triangleinfrustum-triangle-refdef-slopex-slopey-src-mq3-renderer-portal-render-pass-ml-647433721"></a>
### triangleInFrustum

```ml
function triangleInFrustum(triangle, refdef, slopeX, slopeY)
```

tr_main.c:SurfIsOffscreen rejects a portal surface when every vertex is outside the same clip plane.  The draw-surface selection alone is coarser: its face bounds can intersect the frustum while the portal triangle does not.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — | Record providing `triangle.vertices`. |
| `refdef` | `dynamic` | — | Record providing `refdef.vieworg`, `refdef.viewaxis`. |
| `slopeX` | `dynamic` | — | Input tested by `side>=depth*slopeX`. |
| `slopeY` | `dynamic` | — | Input tested by `up>=depth*slopeY`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L136)

<a id="function-function-mq3-renderer-portal-render-pass-worldbatchcache-function-worldbatchcache-src-mq3-renderer-portal-render-pass-ml-513195180"></a>
### worldBatchCache

```ml
function worldBatchCache()
```

Constructs `mq3.renderer.portal_render_pass.WorldBatchCache` with `faces` = `void`, `normal` = `void`, `dist` = `0.0`, `batch` = `void` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/portal_render_pass.ml#L79)

- [mq3.renderer.portal_render_pass.WorldBatchCache](Type-mq3-renderer-portal-render-pass-worldbatchcache-1725520348.md) — struct
