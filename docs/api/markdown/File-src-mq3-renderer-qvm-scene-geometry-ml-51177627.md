# `src/mq3/renderer/qvm_scene_geometry.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.qvm_scene_geometry`](Package-mq3-renderer-qvm-scene-geometry-1632458695.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/md3.ml` as `md3` → [src/mq3/format/md3.ml](File-src-mq3-format-md3-ml-2098563759.md)
- `mq3/renderer/bsp_render_data.ml` as `bspRender` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)
- `mq3/renderer/entity_surface_policy.ml` as `entityPolicy` → [src/mq3/renderer/entity_surface_policy.ml](File-src-mq3-renderer-entity-surface-policy-ml-628328091.md)
- `mq3/renderer/md3_entity.ml` as `md3Entity` → [src/mq3/renderer/md3_entity.ml](File-src-mq3-renderer-md3-entity-ml-1460630353.md)
- `mq3/renderer/playable_light_grid.ml` as `lightGrid` → [src/mq3/renderer/playable_light_grid.ml](File-src-mq3-renderer-playable-light-grid-ml-1846122219.md)
- `mq3/renderer/portal_view.ml` as `portalView` → [src/mq3/renderer/portal_view.ml](File-src-mq3-renderer-portal-view-ml-1859210863.md)
- `mq3/renderer/scene_queue.ml` as `sceneQueue` → [src/mq3/renderer/scene_queue.ml](File-src-mq3-renderer-scene-queue-ml-703423413.md)
- `mq3/renderer/surface_beam.ml` as `surfaceBeam` → [src/mq3/renderer/surface_beam.ml](File-src-mq3-renderer-surface-beam-ml-141570028.md)
- `mq3/renderer/surface_entities.ml` as `surfaceEntities` → [src/mq3/renderer/surface_entities.ml](File-src-mq3-renderer-surface-entities-ml-629652876.md)
- `mq3/renderer/surface_md3.ml` as `surfaceMd3` → [src/mq3/renderer/surface_md3.ml](File-src-mq3-renderer-surface-md3-ml-438987327.md)
- `mq3/renderer/surface_trails.ml` as `surfaceTrails` → [src/mq3/renderer/surface_trails.ml](File-src-mq3-renderer-surface-trails-ml-312199158.md)
- `mq3/renderer/view_math.ml` as `viewMath` → [src/mq3/renderer/view_math.ml](File-src-mq3-renderer-view-math-ml-126526929.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-qvm-scene-geometry-addbeam-function-addbeam-output-decoded-entityindex-src-mq3-renderer-qvm-scene-geometry-ml-1030201420"></a>
### addBeam

```ml
function addBeam(output, decoded, entityIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `decoded` | `dynamic` | — |  |
| `entityIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L362)

<a id="function-function-mq3-renderer-qvm-scene-geometry-addinlinemodel-function-addinlinemodel-output-decoded-wrapped-entityindex-src-mq3-renderer-qvm-scene-geometry-ml-160790983"></a>
### addInlineModel

```ml
function addInlineModel(output, decoded, wrapped, entityIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `decoded` | `dynamic` | — |  |
| `wrapped` | `dynamic` | — |  |
| `entityIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L317)

<a id="function-function-mq3-renderer-qvm-scene-geometry-addmodeloptimized-function-addmodeloptimized-output-decoded-selection-entityindex-maxtrianglespersurface-cache-normaltable-grid-refdef-shadowmode-fogcatalog-noworldmodel-src-mq3-renderer-qvm-scene-geometry-ml-1537608420"></a>
### addModelOptimized

```ml
function addModelOptimized(output, decoded, selection, entityIndex, maxTrianglesPerSurface, cache, normalTable, grid, refdef, shadowMode, fogCatalog, noWorldModel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `decoded` | `dynamic` | — |  |
| `selection` | `dynamic` | — |  |
| `entityIndex` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `normalTable` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `noWorldModel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L279)

<a id="function-function-mq3-renderer-qvm-scene-geometry-addpolys-function-addpolys-output-polys-src-mq3-renderer-qvm-scene-geometry-ml-353083036"></a>
### addPolys

```ml
function addPolys(output, polys)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L371)

<a id="function-function-mq3-renderer-qvm-scene-geometry-addsprite-function-addsprite-output-decoded-refdef-entityindex-src-mq3-renderer-qvm-scene-geometry-ml-1404186748"></a>
### addSprite

```ml
function addSprite(output, decoded, refdef, entityIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `decoded` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `entityIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L332)

<a id="function-function-mq3-renderer-qvm-scene-geometry-addtrail-function-addtrail-output-decoded-refdef-entityindex-src-mq3-renderer-qvm-scene-geometry-ml-1842387144"></a>
### addTrail

```ml
function addTrail(output, decoded, refdef, entityIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `decoded` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `entityIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L354)

<a id="function-function-mq3-renderer-qvm-scene-geometry-addtrailsubmission-function-addtrailsubmission-output-decoded-submission-entityindex-src-mq3-renderer-qvm-scene-geometry-ml-1442380216"></a>
### addTrailSubmission

```ml
function addTrailSubmission(output, decoded, submission, entityIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `decoded` | `dynamic` | — |  |
| `submission` | `dynamic` | — |  |
| `entityIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L345)

<a id="function-function-mq3-renderer-qvm-scene-geometry-appendindexedmodeltriangle-function-appendindexedmodeltriangle-output-worldpositions-texcoords-worldnormals-vertexcolors-defaultcolor-entitytexcoord-shadertime-a-b-c-modelhandle-customskin-shaderhandle-shadername-surfacename-entityindex-surfaceindex-renderfx-fogindex-src-mq3-renderer-qvm-scene-geometry-ml-995054729"></a>
### appendIndexedModelTriangle

```ml
function appendIndexedModelTriangle(output, worldPositions, texCoords, worldNormals, vertexColors, defaultColor, entityTexCoord, shaderTime, a, b, c, modelHandle, customSkin, shaderHandle, shaderName, surfaceName, entityIndex, surfaceIndex, renderfx, fogIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `worldPositions` | `dynamic` | — |  |
| `texCoords` | `dynamic` | — |  |
| `worldNormals` | `dynamic` | — |  |
| `vertexColors` | `dynamic` | — |  |
| `defaultColor` | `dynamic` | — |  |
| `entityTexCoord` | `dynamic` | — |  |
| `shaderTime` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `modelHandle` | `dynamic` | — |  |
| `customSkin` | `dynamic` | — |  |
| `shaderHandle` | `dynamic` | — |  |
| `shaderName` | `dynamic` | — |  |
| `surfaceName` | `dynamic` | — |  |
| `entityIndex` | `dynamic` | — |  |
| `surfaceIndex` | `dynamic` | — |  |
| `renderfx` | `dynamic` | — |  |
| `fogIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L141)

<a id="function-function-mq3-renderer-qvm-scene-geometry-appendshadowtriangle-function-appendshadowtriangle-output-positions-entityindex-surfaceindex-src-mq3-renderer-qvm-scene-geometry-ml-712231299"></a>
### appendShadowTriangle

```ml
function appendShadowTriangle(output, positions, entityIndex, surfaceIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `positions` | `dynamic` | — |  |
| `entityIndex` | `dynamic` | — |  |
| `surfaceIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L96)

<a id="function-function-mq3-renderer-qvm-scene-geometry-appendtriangle-function-appendtriangle-output-value-src-mq3-renderer-qvm-scene-geometry-ml-2028707254"></a>
### appendTriangle

```ml
function appendTriangle(output, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L131)

<a id="function-function-mq3-renderer-qvm-scene-geometry-build-function-build-scene-assetkinds-modelassets-refdef-maxtrianglespersurface-src-mq3-renderer-qvm-scene-geometry-ml-1603782838"></a>
### build

```ml
function build(scene, assetKinds, modelAssets, refdef, maxTrianglesPerSurface)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L476)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildportalrecords-function-buildportalrecords-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-src-mq3-renderer-qvm-scene-geometry-ml-956548383"></a>
### buildPortalRecords

```ml
function buildPortalRecords(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `normalTable` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L427)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildportalrecordsculled-function-buildportalrecordsculled-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-src-mq3-renderer-qvm-scene-geometry-ml-1904958659"></a>
### buildPortalRecordsCulled

```ml
function buildPortalRecordsCulled(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `normalTable` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L448)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildportalrecordsculledshadows-function-buildportalrecordsculledshadows-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-shadowmode-src-mq3-renderer-qvm-scene-geometry-ml-396435900"></a>
### buildPortalRecordsCulledShadows

```ml
function buildPortalRecordsCulledShadows(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid, shadowMode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `normalTable` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L452)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildportalrecordsculledshadowsfog-function-buildportalrecordsculledshadowsfog-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-shadowmode-fogcatalog-src-mq3-renderer-qvm-scene-geometry-ml-681336447"></a>
### buildPortalRecordsCulledShadowsFog

```ml
function buildPortalRecordsCulledShadowsFog(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid, shadowMode, fogCatalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `normalTable` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L456)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildportalrecordsculledshadowsfoglod-function-buildportalrecordsculledshadowsfoglod-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-shadowmode-fogcatalog-lodscale-lodbias-src-mq3-renderer-qvm-scene-geometry-ml-382407726"></a>
### buildPortalRecordsCulledShadowsFogLod

```ml
function buildPortalRecordsCulledShadowsFogLod(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid, shadowMode, fogCatalog, lodScale, lodBias)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `normalTable` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `lodScale` | `dynamic` | — |  |
| `lodBias` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L460)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecords-function-buildrecords-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-src-mq3-renderer-qvm-scene-geometry-ml-470850544"></a>
### buildRecords

```ml
function buildRecords(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L475)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordscached-function-buildrecordscached-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-normaltable-src-mq3-renderer-qvm-scene-geometry-ml-1575825383"></a>
### buildRecordsCached

```ml
function buildRecordsCached(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, normalTable)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `normalTable` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L474)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordscachedlit-function-buildrecordscachedlit-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-normaltable-grid-src-mq3-renderer-qvm-scene-geometry-ml-700980473"></a>
### buildRecordsCachedLit

```ml
function buildRecordsCachedLit(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, normalTable, grid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `normalTable` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L465)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordsframecachedlit-function-buildrecordsframecachedlit-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-src-mq3-renderer-qvm-scene-geometry-ml-919173571"></a>
### buildRecordsFrameCachedLit

```ml
function buildRecordsFrameCachedLit(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `normalTable` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L464)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordsframecachedlitreuse-function-buildrecordsframecachedlitreuse-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-previous-src-mq3-renderer-qvm-scene-geometry-ml-1001436942"></a>
### buildRecordsFrameCachedLitReuse

```ml
function buildRecordsFrameCachedLitReuse(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid, previous)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `normalTable` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L426)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordsframecachedlitreusemode-function-buildrecordsframecachedlitreusemode-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-previous-isportal-frustum-src-mq3-renderer-qvm-scene-geometry-ml-638268542"></a>
### buildRecordsFrameCachedLitReuseMode

```ml
function buildRecordsFrameCachedLitReuseMode(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid, previous, isPortal, frustum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `normalTable` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |
| `isPortal` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L425)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordsframecachedlitreusemodeshadow-function-buildrecordsframecachedlitreusemodeshadow-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-previous-isportal-frustum-shadowmode-src-mq3-renderer-qvm-scene-geometry-ml-1130255989"></a>
### buildRecordsFrameCachedLitReuseModeShadow

```ml
function buildRecordsFrameCachedLitReuseModeShadow(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid, previous, isPortal, frustum, shadowMode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `normalTable` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |
| `isPortal` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L424)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordsframecachedlitreusemodeshadowfog-function-buildrecordsframecachedlitreusemodeshadowfog-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-previous-isportal-frustum-shadowmode-fogcatalog-noworldmodel-src-mq3-renderer-qvm-scene-geometry-ml-257955802"></a>
### buildRecordsFrameCachedLitReuseModeShadowFog

```ml
function buildRecordsFrameCachedLitReuseModeShadowFog(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid, previous, isPortal, frustum, shadowMode, fogCatalog, noWorldModel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `normalTable` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |
| `isPortal` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `noWorldModel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L423)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordsframecachedlitreusemodeshadowfoglod-function-buildrecordsframecachedlitreusemodeshadowfoglod-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-previous-isportal-frustum-shadowmode-fogcatalog-noworldmodel-lodscale-lodbias-src-mq3-renderer-qvm-scene-geometry-ml-717888543"></a>
### buildRecordsFrameCachedLitReuseModeShadowFogLod

```ml
function buildRecordsFrameCachedLitReuseModeShadowFogLod(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid, previous, isPortal, frustum, shadowMode, fogCatalog, noWorldModel, lodScale, lodBias)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `normalTable` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |
| `isPortal` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `noWorldModel` | `dynamic` | — |  |
| `lodScale` | `dynamic` | — |  |
| `lodBias` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L394)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordswithframecache-function-buildrecordswithframecache-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-grid-src-mq3-renderer-qvm-scene-geometry-ml-410922264"></a>
### buildRecordsWithFrameCache

```ml
function buildRecordsWithFrameCache(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, grid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L466)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordswithframecachereuse-function-buildrecordswithframecachereuse-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-grid-previous-src-mq3-renderer-qvm-scene-geometry-ml-576965047"></a>
### buildRecordsWithFrameCacheReuse

```ml
function buildRecordsWithFrameCacheReuse(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, grid, previous)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L470)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordswithframecachereuseculled-function-buildrecordswithframecachereuseculled-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-grid-previous-src-mq3-renderer-qvm-scene-geometry-ml-887566241"></a>
### buildRecordsWithFrameCacheReuseCulled

```ml
function buildRecordsWithFrameCacheReuseCulled(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, grid, previous)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L432)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordswithframecachereuseculledshadows-function-buildrecordswithframecachereuseculledshadows-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-grid-previous-shadowmode-src-mq3-renderer-qvm-scene-geometry-ml-487268706"></a>
### buildRecordsWithFrameCacheReuseCulledShadows

```ml
function buildRecordsWithFrameCacheReuseCulledShadows(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, grid, previous, shadowMode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L436)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordswithframecachereuseculledshadowsfog-function-buildrecordswithframecachereuseculledshadowsfog-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-grid-previous-shadowmode-fogcatalog-src-mq3-renderer-qvm-scene-geometry-ml-426911927"></a>
### buildRecordsWithFrameCacheReuseCulledShadowsFog

```ml
function buildRecordsWithFrameCacheReuseCulledShadowsFog(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, grid, previous, shadowMode, fogCatalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L440)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordswithframecachereuseculledshadowsfoglod-function-buildrecordswithframecachereuseculledshadowsfoglod-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-grid-previous-shadowmode-fogcatalog-lodscale-lodbias-src-mq3-renderer-qvm-scene-geometry-ml-846530150"></a>
### buildRecordsWithFrameCacheReuseCulledShadowsFogLod

```ml
function buildRecordsWithFrameCacheReuseCulledShadowsFogLod(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, grid, previous, shadowMode, fogCatalog, lodScale, lodBias)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `lodScale` | `dynamic` | — |  |
| `lodBias` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L444)

<a id="function-function-mq3-renderer-qvm-scene-geometry-cachedframe-function-cachedframe-cache-modelhandle-model-surfaceindex-frame-oldframe-backlerp-normaltable-src-mq3-renderer-qvm-scene-geometry-ml-1739507159"></a>
### cachedFrame

```ml
function cachedFrame(cache, modelHandle, model, surfaceIndex, frame, oldFrame, backlerp, normalTable)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `modelHandle` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `surfaceIndex` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |
| `normalTable` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L241)

<a id="function-function-mq3-renderer-qvm-scene-geometry-cachedtransform-function-cachedtransform-cache-decoded-modelcachekey-surfaceindex-framedata-src-mq3-renderer-qvm-scene-geometry-ml-1802128700"></a>
### cachedTransform

```ml
function cachedTransform(cache, decoded, modelCacheKey, surfaceIndex, frameData)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `decoded` | `dynamic` | — |  |
| `modelCacheKey` | `dynamic` | — |  |
| `surfaceIndex` | `dynamic` | — |  |
| `frameData` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L255)

<a id="function-function-mq3-renderer-qvm-scene-geometry-cachedvertexcolors-function-cachedvertexcolors-entry-lighting-alpha-src-mq3-renderer-qvm-scene-geometry-ml-321933454"></a>
### cachedVertexColors

```ml
function cachedVertexColors(entry, lighting, alpha)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — |  |
| `lighting` | `dynamic` | — |  |
| `alpha` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L273)

<a id="function-function-mq3-renderer-qvm-scene-geometry-createframecache-function-createframecache-normaltable-maxentries-src-mq3-renderer-qvm-scene-geometry-ml-52792963"></a>
### createFrameCache

```ml
function createFrameCache(normalTable, maxEntries)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normalTable` | `dynamic` | — |  |
| `maxEntries` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L236)

<a id="function-function-mq3-renderer-qvm-scene-geometry-createnormaltable-function-createnormaltable-src-mq3-renderer-qvm-scene-geometry-ml-390105140"></a>
### createNormalTable

```ml
function createNormalTable()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L235)

<a id="function-function-mq3-renderer-qvm-scene-geometry-decodeentities-function-decodeentities-entities-src-mq3-renderer-qvm-scene-geometry-ml-2003747013"></a>
### decodeEntities

```ml
function decodeEntities(entities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L192)

<a id="function-function-mq3-renderer-qvm-scene-geometry-expecteddecodedtriangles-function-expecteddecodedtriangles-decodedentities-polys-assetkinds-modelassets-maxtrianglespersurface-src-mq3-renderer-qvm-scene-geometry-ml-2013359956"></a>
### expectedDecodedTriangles

```ml
function expectedDecodedTriangles(decodedEntities, polys, assetKinds, modelAssets, maxTrianglesPerSurface)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decodedEntities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L223)

<a id="function-function-mq3-renderer-qvm-scene-geometry-expecteddecodedtrianglesmode-function-expecteddecodedtrianglesmode-decodedentities-polys-assetkinds-modelassets-maxtrianglespersurface-isportal-frustum-src-mq3-renderer-qvm-scene-geometry-ml-925012858"></a>
### expectedDecodedTrianglesMode

```ml
function expectedDecodedTrianglesMode(decodedEntities, polys, assetKinds, modelAssets, maxTrianglesPerSurface, isPortal, frustum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decodedEntities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `isPortal` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L222)

<a id="function-function-mq3-renderer-qvm-scene-geometry-expecteddecodedtrianglesmodefog-function-expecteddecodedtrianglesmodefog-decodedentities-polys-assetkinds-modelassets-maxtrianglespersurface-isportal-frustum-fogcatalog-noworldmodel-src-mq3-renderer-qvm-scene-geometry-ml-1221373651"></a>
### expectedDecodedTrianglesModeFog

```ml
function expectedDecodedTrianglesModeFog(decodedEntities, polys, assetKinds, modelAssets, maxTrianglesPerSurface, isPortal, frustum, fogCatalog, noWorldModel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decodedEntities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `isPortal` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `noWorldModel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L221)

<a id="function-function-mq3-renderer-qvm-scene-geometry-expecteddecodedtrianglesmodefoglod-function-expecteddecodedtrianglesmodefoglod-decodedentities-polys-assetkinds-modelassets-maxtrianglespersurface-isportal-frustum-fogcatalog-noworldmodel-refdef-lodscale-lodbias-shadowmode-src-mq3-renderer-qvm-scene-geometry-ml-1376709223"></a>
### expectedDecodedTrianglesModeFogLod

```ml
function expectedDecodedTrianglesModeFogLod(decodedEntities, polys, assetKinds, modelAssets, maxTrianglesPerSurface, isPortal, frustum, fogCatalog, noWorldModel, refdef, lodScale, lodBias, shadowMode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decodedEntities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `isPortal` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `noWorldModel` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `lodScale` | `dynamic` | — |  |
| `lodBias` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L201)

<a id="function-function-mq3-renderer-qvm-scene-geometry-expectedtriangles-function-expectedtriangles-entities-polys-assetkinds-modelassets-maxtrianglespersurface-src-mq3-renderer-qvm-scene-geometry-ml-916215878"></a>
### expectedTriangles

```ml
function expectedTriangles(entities, polys, assetKinds, modelAssets, maxTrianglesPerSurface)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `polys` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L178)

<a id="function-function-mq3-renderer-qvm-scene-geometry-fail-function-fail-message-src-mq3-renderer-qvm-scene-geometry-ml-1950264191"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L44)

- [mq3.renderer.qvm_scene_geometry.FrameCache](Type-mq3-renderer-qvm-scene-geometry-framecache-2005265354.md) — struct
- [mq3.renderer.qvm_scene_geometry.FrameEntry](Type-mq3-renderer-qvm-scene-geometry-frameentry-810044996.md) — struct
- [mq3.renderer.qvm_scene_geometry.Geometry](Type-mq3-renderer-qvm-scene-geometry-geometry-201466147.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-geometry-inlineculled-function-inlineculled-decoded-model-frustum-src-mq3-renderer-qvm-scene-geometry-ml-2119866939"></a>
### inlineCulled

```ml
function inlineCulled(decoded, model, frustum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoded` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L197)

- [mq3.renderer.qvm_scene_geometry.InlineModel](Type-mq3-renderer-qvm-scene-geometry-inlinemodel-1638604735.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-geometry-inlineshadername-function-inlineshadername-map-textureindex-src-mq3-renderer-qvm-scene-geometry-ml-1386356815"></a>
### inlineShaderName

```ml
function inlineShaderName(map, textureIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `textureIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L106)

<a id="function-function-mq3-renderer-qvm-scene-geometry-isinlinemodel-function-isinlinemodel-model-src-mq3-renderer-qvm-scene-geometry-ml-705360061"></a>
### isInlineModel

```ml
function isInlineModel(model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L123)

<a id="function-function-mq3-renderer-qvm-scene-geometry-islodmodel-function-islodmodel-model-src-mq3-renderer-qvm-scene-geometry-ml-1138971501"></a>
### isLodModel

```ml
function isLodModel(model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L125)

<a id="function-function-mq3-renderer-qvm-scene-geometry-loadinlinemodel-function-loadinlinemodel-map-index-maxtriangles-src-mq3-renderer-qvm-scene-geometry-ml-760708095"></a>
### loadInlineModel

```ml
function loadInlineModel(map, index, maxTriangles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L111)

<a id="function-function-mq3-renderer-qvm-scene-geometry-locallightdirection-function-locallightdirection-lightdirection-axis-src-mq3-renderer-qvm-scene-geometry-ml-1050557950"></a>
### localLightDirection

```ml
function localLightDirection(lightDirection, axis)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lightDirection` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L70)

<a id="function-function-mq3-renderer-qvm-scene-geometry-mappedtriangle-function-mappedtriangle-positions-coords-lightmapcoords-normals-colors-entitycolor-entitytexcoord-shadertime-modelhandle-customskin-shaderhandle-shadername-surfacename-entityindex-surfaceindex-renderfx-lightmapindex-fogindex-dynamiclight-dynamiclightorigin-dynamiclightaxis-dynamiclightbounds-src-mq3-renderer-qvm-scene-geometry-ml-1012114579"></a>
### mappedTriangle

```ml
function mappedTriangle(positions, coords, lightmapCoords, normals, colors, entityColor, entityTexCoord, shaderTime, modelHandle, customSkin, shaderHandle, shaderName, surfaceName, entityIndex, surfaceIndex, renderfx, lightmapIndex, fogIndex, dynamicLight, dynamicLightOrigin, dynamicLightAxis, dynamicLightBounds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `positions` | `dynamic` | — |  |
| `coords` | `dynamic` | — |  |
| `lightmapCoords` | `dynamic` | — |  |
| `normals` | `dynamic` | — |  |
| `colors` | `dynamic` | — |  |
| `entityColor` | `dynamic` | — |  |
| `entityTexCoord` | `dynamic` | — |  |
| `shaderTime` | `dynamic` | — |  |
| `modelHandle` | `dynamic` | — |  |
| `customSkin` | `dynamic` | — |  |
| `shaderHandle` | `dynamic` | — |  |
| `shaderName` | `dynamic` | — |  |
| `surfaceName` | `dynamic` | — |  |
| `entityIndex` | `dynamic` | — |  |
| `surfaceIndex` | `dynamic` | — |  |
| `renderfx` | `dynamic` | — |  |
| `lightmapIndex` | `dynamic` | — |  |
| `fogIndex` | `dynamic` | — |  |
| `dynamicLight` | `dynamic` | — |  |
| `dynamicLightOrigin` | `dynamic` | — |  |
| `dynamicLightAxis` | `dynamic` | — |  |
| `dynamicLightBounds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L103)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-max-shadow-edge-defs-const-max-shadow-edge-defs-32-src-mq3-renderer-qvm-scene-geometry-ml-665989806"></a>
### MAX_SHADOW_EDGE_DEFS

```ml
const MAX_SHADOW_EDGE_DEFS = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L32)

<a id="function-function-mq3-renderer-qvm-scene-geometry-md3lods-function-md3lods-levels-src-mq3-renderer-qvm-scene-geometry-ml-587748545"></a>
### md3Lods

```ml
function md3Lods(levels)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `levels` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L124)

- [mq3.renderer.qvm_scene_geometry.Md3Selection](Type-mq3-renderer-qvm-scene-geometry-md3selection-1893054183.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-geometry-modelat-function-modelat-assetkinds-modelassets-handle-src-mq3-renderer-qvm-scene-geometry-ml-647464931"></a>
### modelAt

```ml
function modelAt(assetKinds, modelAssets, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L127)

<a id="function-function-mq3-renderer-qvm-scene-geometry-modelfognum-function-modelfognum-decoded-model-fogcatalog-noworldmodel-src-mq3-renderer-qvm-scene-geometry-ml-1923314846"></a>
### modelFogNum

```ml
function modelFogNum(decoded, model, fogCatalog, noWorldModel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoded` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `noWorldModel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L159)

<a id="function-function-mq3-renderer-qvm-scene-geometry-modeltrianglecount-function-modeltrianglecount-model-maxtrianglespersurface-src-mq3-renderer-qvm-scene-geometry-ml-1947258400"></a>
### modelTriangleCount

```ml
function modelTriangleCount(model, maxTrianglesPerSurface)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L153)

<a id="function-function-mq3-renderer-qvm-scene-geometry-normal-function-normal-src-mq3-renderer-qvm-scene-geometry-ml-2010563862"></a>
### normal

```ml
function normal()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L45)

<a id="function-function-mq3-renderer-qvm-scene-geometry-portalviewforplane-function-portalviewforplane-geometry-normal-dist-refdef-src-mq3-renderer-qvm-scene-geometry-ml-582646861"></a>
### portalViewForPlane

```ml
function portalViewForPlane(geometry, normal, dist, refdef)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `geometry` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `dist` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L480)

<a id="function-function-mq3-renderer-qvm-scene-geometry-primarymd3-function-primarymd3-model-src-mq3-renderer-qvm-scene-geometry-ml-1464340229"></a>
### primaryMd3

```ml
function primaryMd3(model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L126)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-projection-shadow-shader-const-projection-shadow-shader-mq3-projectionshadow-src-mq3-renderer-qvm-scene-geometry-ml-1820046822"></a>
### PROJECTION_SHADOW_SHADER

```ml
const PROJECTION_SHADOW_SHADER = "$mq3/projectionShadow"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L31)

<a id="function-function-mq3-renderer-qvm-scene-geometry-projectionshadowpoint-function-projectionshadowpoint-position-shadowplane-lightdirection-src-mq3-renderer-qvm-scene-geometry-ml-1380152296"></a>
### projectionShadowPoint

```ml
function projectionShadowPoint(position, shadowPlane, lightDirection)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | `dynamic` | — |  |
| `shadowPlane` | `dynamic` | — |  |
| `lightDirection` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L67)

<a id="function-function-mq3-renderer-qvm-scene-geometry-projectionshadowpointoriented-function-projectionshadowpointoriented-position-shadowplane-lightdirection-origin-axis-src-mq3-renderer-qvm-scene-geometry-ml-1142303503"></a>
### projectionShadowPointOriented

```ml
function projectionShadowPointOriented(position, shadowPlane, lightDirection, origin, axis)
```

RB_ProjectionShadowDeform in tr_shadows.c projects model vertices onto the entity's horizontal shadow plane along its sampled light direction.  The original clamps shallow light directions so projected shadows cannot become unbounded; retain that rule before dividing by the vertical component.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | `dynamic` | — |  |
| `shadowPlane` | `dynamic` | — |  |
| `lightDirection` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L50)

<a id="function-function-mq3-renderer-qvm-scene-geometry-refdeffrustum-function-refdeffrustum-refdef-src-mq3-renderer-qvm-scene-geometry-ml-2068301298"></a>
### refdefFrustum

```ml
function refdefFrustum(refdef)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `refdef` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L428)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rf-depthhack-const-rf-depthhack-8-src-mq3-renderer-qvm-scene-geometry-ml-379588973"></a>
### RF_DEPTHHACK

```ml
const RF_DEPTHHACK = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L28)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rf-noshadow-const-rf-noshadow-64-src-mq3-renderer-qvm-scene-geometry-ml-1734906989"></a>
### RF_NOSHADOW

```ml
const RF_NOSHADOW = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L29)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rf-shadow-plane-const-rf-shadow-plane-256-src-mq3-renderer-qvm-scene-geometry-ml-1543535186"></a>
### RF_SHADOW_PLANE

```ml
const RF_SHADOW_PLANE = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L30)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rt-beam-const-rt-beam-3-src-mq3-renderer-qvm-scene-geometry-ml-753962898"></a>
### RT_BEAM

```ml
const RT_BEAM = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L24)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rt-lightning-const-rt-lightning-6-src-mq3-renderer-qvm-scene-geometry-ml-92763083"></a>
### RT_LIGHTNING

```ml
const RT_LIGHTNING = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L27)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rt-model-const-rt-model-0-src-mq3-renderer-qvm-scene-geometry-ml-17209395"></a>
### RT_MODEL

```ml
const RT_MODEL = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L22)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rt-rail-core-const-rt-rail-core-4-src-mq3-renderer-qvm-scene-geometry-ml-500759457"></a>
### RT_RAIL_CORE

```ml
const RT_RAIL_CORE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L25)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rt-rail-rings-const-rt-rail-rings-5-src-mq3-renderer-qvm-scene-geometry-ml-1185568004"></a>
### RT_RAIL_RINGS

```ml
const RT_RAIL_RINGS = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L26)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rt-sprite-const-rt-sprite-2-src-mq3-renderer-qvm-scene-geometry-ml-942595087"></a>
### RT_SPRITE

```ml
const RT_SPRITE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L23)

<a id="function-function-mq3-renderer-qvm-scene-geometry-selectmd3-function-selectmd3-decoded-asset-refdef-frustum-lodscale-lodbias-src-mq3-renderer-qvm-scene-geometry-ml-1399542753"></a>
### selectMd3

```ml
function selectMd3(decoded, asset, refdef, frustum, lodScale, lodBias)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoded` | `dynamic` | — |  |
| `asset` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |
| `lodScale` | `dynamic` | — |  |
| `lodBias` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L164)

- [mq3.renderer.qvm_scene_geometry.ShadowEdge](Type-mq3-renderer-qvm-scene-geometry-shadowedge-1206710918.md) — struct
- [mq3.renderer.qvm_scene_geometry.ShadowTriangle](Type-mq3-renderer-qvm-scene-geometry-shadowtriangle-1287111975.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-geometry-shadowvolumesides-function-shadowvolumesides-positions-indexes-numtriangles-lightdirection-src-mq3-renderer-qvm-scene-geometry-ml-246906970"></a>
### shadowVolumeSides

```ml
function shadowVolumeSides(positions, indexes, numTriangles, lightDirection)
```

R_AddEdgeDef/R_RenderShadowEdges/RB_ShadowTessEnd. Every returned item is the four vertices of one GL_TRIANGLE_STRIP silhouette side. The original 32-edge-per-start-vertex overflow rule is retained for malformed meshes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `positions` | `dynamic` | — |  |
| `indexes` | `dynamic` | — |  |
| `numTriangles` | `dynamic` | — |  |
| `lightDirection` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L76)

<a id="function-function-mq3-renderer-qvm-scene-geometry-stencilshadowcapacity-function-stencilshadowcapacity-decodedentities-assetkinds-modelassets-maxtrianglespersurface-isportal-frustum-shadowmode-fogcatalog-noworldmodel-refdef-lodscale-lodbias-src-mq3-renderer-qvm-scene-geometry-ml-1583210040"></a>
### stencilShadowCapacity

```ml
function stencilShadowCapacity(decodedEntities, assetKinds, modelAssets, maxTrianglesPerSurface, isPortal, frustum, shadowMode, fogCatalog, noWorldModel, refdef, lodScale, lodBias)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decodedEntities` | `dynamic` | — |  |
| `assetKinds` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `maxTrianglesPerSurface` | `dynamic` | — |  |
| `isPortal` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `noWorldModel` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `lodScale` | `dynamic` | — |  |
| `lodBias` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L383)

- [mq3.renderer.qvm_scene_geometry.TransformEntry](Type-mq3-renderer-qvm-scene-geometry-transformentry-1468067707.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-geometry-transformtriangle-function-transformtriangle-source-orientation-color-modelhandle-customskin-shaderhandle-surfacename-entityindex-lighting-renderfx-src-mq3-renderer-qvm-scene-geometry-ml-83671773"></a>
### transformTriangle

```ml
function transformTriangle(source, orientation, color, modelHandle, customSkin, shaderHandle, surfaceName, entityIndex, lighting, renderfx)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `orientation` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `modelHandle` | `dynamic` | — |  |
| `customSkin` | `dynamic` | — |  |
| `shaderHandle` | `dynamic` | — |  |
| `surfaceName` | `dynamic` | — |  |
| `entityIndex` | `dynamic` | — |  |
| `lighting` | `dynamic` | — |  |
| `renderfx` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L224)

<a id="function-function-mq3-renderer-qvm-scene-geometry-triangle-function-triangle-positions-coords-normals-colors-entitycolor-entitytexcoord-shadertime-modelhandle-customskin-shaderhandle-shadername-surfacename-entityindex-surfaceindex-renderfx-src-mq3-renderer-qvm-scene-geometry-ml-1256987599"></a>
### triangle

```ml
function triangle(positions, coords, normals, colors, entityColor, entityTexCoord, shaderTime, modelHandle, customSkin, shaderHandle, shaderName, surfaceName, entityIndex, surfaceIndex, renderfx)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `positions` | `dynamic` | — |  |
| `coords` | `dynamic` | — |  |
| `normals` | `dynamic` | — |  |
| `colors` | `dynamic` | — |  |
| `entityColor` | `dynamic` | — |  |
| `entityTexCoord` | `dynamic` | — |  |
| `shaderTime` | `dynamic` | — |  |
| `modelHandle` | `dynamic` | — |  |
| `customSkin` | `dynamic` | — |  |
| `shaderHandle` | `dynamic` | — |  |
| `shaderName` | `dynamic` | — |  |
| `surfaceName` | `dynamic` | — |  |
| `entityIndex` | `dynamic` | — |  |
| `surfaceIndex` | `dynamic` | — |  |
| `renderfx` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L100)

- [mq3.renderer.qvm_scene_geometry.Triangle](Type-mq3-renderer-qvm-scene-geometry-triangle-2145392759.md) — struct
