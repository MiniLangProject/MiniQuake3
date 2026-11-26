# `src/mq3/renderer/qvm_scene_geometry.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.qvm_scene_geometry`](Package-mq3-renderer-qvm-scene-geometry-1632458695.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/md3.ml` as `md3` → [src/mq3/format/md3.ml](File-src-mq3-format-md3-ml-2098563759.md)
- `mq3/renderer/bsp_render_data.ml` as `bspRender` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)
- `mq3/renderer/entity_surface_policy.ml` as `entityPolicy` → [src/mq3/renderer/entity_surface_policy.ml](File-src-mq3-renderer-entity-surface-policy-ml-628328091.md)
- `mq3/renderer/md3_cache_index.ml` as `md3CacheIndex` → [src/mq3/renderer/md3_cache_index.ml](File-src-mq3-renderer-md3-cache-index-ml-212366937.md)
- `mq3/renderer/md3_entity.ml` as `md3Entity` → [src/mq3/renderer/md3_entity.ml](File-src-mq3-renderer-md3-entity-ml-1460630353.md)
- `mq3/renderer/native_md3.ml` as `nativeMd3` → [src/mq3/renderer/native_md3.ml](File-src-mq3-renderer-native-md3-ml-1567005747.md)
- `mq3/renderer/playable_light_grid.ml` as `lightGrid` → [src/mq3/renderer/playable_light_grid.ml](File-src-mq3-renderer-playable-light-grid-ml-1846122219.md)
- `mq3/renderer/portal_view.ml` as `portalView` → [src/mq3/renderer/portal_view.ml](File-src-mq3-renderer-portal-view-ml-1859210863.md)
- `mq3/renderer/scene_queue.ml` as `sceneQueue` → [src/mq3/renderer/scene_queue.ml](File-src-mq3-renderer-scene-queue-ml-703423413.md)
- `mq3/renderer/surface_beam.ml` as `surfaceBeam` → [src/mq3/renderer/surface_beam.ml](File-src-mq3-renderer-surface-beam-ml-141570028.md)
- `mq3/renderer/surface_entities.ml` as `surfaceEntities` → [src/mq3/renderer/surface_entities.ml](File-src-mq3-renderer-surface-entities-ml-629652876.md)
- `mq3/renderer/surface_md3.ml` as `surfaceMd3` → [src/mq3/renderer/surface_md3.ml](File-src-mq3-renderer-surface-md3-ml-438987327.md)
- `mq3/renderer/surface_trails.ml` as `surfaceTrails` → [src/mq3/renderer/surface_trails.ml](File-src-mq3-renderer-surface-trails-ml-312199158.md)
- `mq3/renderer/view_math.ml` as `viewMath` → [src/mq3/renderer/view_math.ml](File-src-mq3-renderer-view-math-ml-126526929.md)
- `std/array.ml` as `arrays` → `../../a7594a0c0299/MiniLangCompilerML/std/array.ml` — external dependency
- `std/ds/list.ml` as `lists` → `../../a7594a0c0299/MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-qvm-scene-geometry-addbeam-function-addbeam-output-decoded-entityindex-src-mq3-renderer-qvm-scene-geometry-ml-1030201420"></a>
### addBeam

```ml
function addBeam(output, decoded, entityIndex)
```

Builds `positions[corner]`, `coords[corner]`, `colors[corner]` in `mq3.renderer.qvm_scene_geometry.addBeam`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Value forwarded as `output` to `mq3.renderer.qvm_scene_geometry.appendTriangle`. |
| `decoded` | `dynamic` | — | Record providing `decoded.origin`, `decoded.oldorigin`, `decoded.shaderRGBA`, `decoded.shaderTexCoord`, `decoded.shaderTime`, `decoded.renderfx`. |
| `entityIndex` | `dynamic` | — | Value forwarded as `entityIndex` to `mq3.renderer.qvm_scene_geometry.triangle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L907)

<a id="function-function-mq3-renderer-qvm-scene-geometry-addinlinemodel-function-addinlinemodel-output-decoded-wrapped-entityindex-src-mq3-renderer-qvm-scene-geometry-ml-160790983"></a>
### addInlineModel

```ml
function addInlineModel(output, decoded, wrapped, entityIndex)
```

Updates `output.modelEntities` in `mq3.renderer.qvm_scene_geometry.addInlineModel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Mutable record or buffer; this call updates `output.modelEntities`. |
| `decoded` | `dynamic` | — | Record providing `decoded.origin`, `decoded.axis`, `decoded.shaderRGBA`, `decoded.shaderTexCoord`, `decoded.shaderTime`, `decoded.hModel`. |
| `wrapped` | `dynamic` | — | Indexed input read at `0`. |
| `entityIndex` | `dynamic` | — | Value forwarded as `entityIndex` to `mq3.renderer.qvm_scene_geometry.mappedTriangle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L843)

<a id="function-function-mq3-renderer-qvm-scene-geometry-addmodeloptimized-function-addmodeloptimized-output-decoded-selection-entityindex-maxtrianglespersurface-cache-normaltable-grid-refdef-shadowmode-fogcatalog-noworldmodel-src-mq3-renderer-qvm-scene-geometry-ml-1537608420"></a>
### addModelOptimized

```ml
function addModelOptimized(output, decoded, selection, entityIndex, maxTrianglesPerSurface, cache, normalTable, grid, refdef, shadowMode, fogCatalog, noWorldModel)
```

Updates `decoded.frame`, `decoded.oldframe`, `decoded.backlerp`, `output.sourceVertices`, `output.vertexTransforms` in `mq3.renderer.qvm_scene_geometry.addModelOptimized`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Mutable record or buffer; this call updates `output.sourceVertices`, `output.vertexTransforms`, `output.modelEntities`. |
| `decoded` | `dynamic` | — | Mutable record or buffer; this call updates `decoded.frame`, `decoded.oldframe`, `decoded.backlerp`. |
| `selection` | `dynamic` | — | Record providing `selection.model`, `selection.frames`, `selection.lod`. |
| `entityIndex` | `dynamic` | — | Value forwarded as `entityIndex` to `mq3.renderer.qvm_scene_geometry.appendIndexedModelTriangle`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Input tested by `limit>maxTrianglesPerSurface`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.qvm_scene_geometry.cachedFrame`. |
| `normalTable` | `dynamic` | — | Value forwarded as `normalTable` to `mq3.renderer.qvm_scene_geometry.cachedFrame`. |
| `grid` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_light_grid.noWorldEntitySample`. |
| `refdef` | `dynamic` | — | Record providing `refdef.flags`. |
| `shadowMode` | `dynamic` | — | Input tested by `fogNum==0 and shadowMode==3 and (decoded.renderfx&RF_SHADOW_PLANE)!=0`. |
| `fogCatalog` | `dynamic` | — | Value forwarded as `fogCatalog` to `mq3.renderer.qvm_scene_geometry.modelFogNum`. |
| `noWorldModel` | `dynamic` | — | Value forwarded as `noWorldModel` to `mq3.renderer.qvm_scene_geometry.modelFogNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L796)

<a id="function-function-mq3-renderer-qvm-scene-geometry-addpolys-function-addpolys-output-polys-src-mq3-renderer-qvm-scene-geometry-ml-353083036"></a>
### addPolys

```ml
function addPolys(output, polys)
```

Updates `output.polySurfaces` in `mq3.renderer.qvm_scene_geometry.addPolys`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Mutable record or buffer; this call updates `output.polySurfaces`. |
| `polys` | `dynamic` | — | Sequence traversed as `poly` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L919)

<a id="function-function-mq3-renderer-qvm-scene-geometry-addsprite-function-addsprite-output-decoded-refdef-entityindex-src-mq3-renderer-qvm-scene-geometry-ml-1404186748"></a>
### addSprite

```ml
function addSprite(output, decoded, refdef, entityIndex)
```

Updates `output.spriteEntities` in `mq3.renderer.qvm_scene_geometry.addSprite`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Mutable record or buffer; this call updates `output.spriteEntities`. |
| `decoded` | `dynamic` | — | Record providing `decoded.origin`, `decoded.radius`, `decoded.rotation`, `decoded.shaderRGBA`, `decoded.shaderTexCoord`, `decoded.shaderTime`. |
| `refdef` | `dynamic` | — | Record providing `refdef.viewaxis`. |
| `entityIndex` | `dynamic` | — | Value forwarded as `entityIndex` to `mq3.renderer.qvm_scene_geometry.triangle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L863)

<a id="function-function-mq3-renderer-qvm-scene-geometry-addtrail-function-addtrail-output-decoded-refdef-entityindex-src-mq3-renderer-qvm-scene-geometry-ml-1842387144"></a>
### addTrail

```ml
function addTrail(output, decoded, refdef, entityIndex)
```

Computes `addTrail` from `addTrailSubmission(output,decoded,submission,entityIndex)` using `mq3.renderer.surface_trails.railCore`, `mq3.renderer.surface_trails.railRings`, `mq3.renderer.surface_trails.lightning`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Value forwarded as `output` to `mq3.renderer.qvm_scene_geometry.addTrailSubmission`. |
| `decoded` | `dynamic` | — | Record providing `decoded.reType`, `decoded.oldorigin`, `decoded.origin`, `decoded.shaderRGBA`. |
| `refdef` | `dynamic` | — | Record providing `refdef.vieworg`. |
| `entityIndex` | `dynamic` | — | Value forwarded as `entityIndex` to `mq3.renderer.qvm_scene_geometry.addTrailSubmission`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L895)

<a id="function-function-mq3-renderer-qvm-scene-geometry-addtrailsubmission-function-addtrailsubmission-output-decoded-submission-entityindex-src-mq3-renderer-qvm-scene-geometry-ml-1442380216"></a>
### addTrailSubmission

```ml
function addTrailSubmission(output, decoded, submission, entityIndex)
```

Builds `positions[corner]`, `coords[corner]`, `colors[corner]` in `mq3.renderer.qvm_scene_geometry.addTrailSubmission`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Value forwarded as `output` to `mq3.renderer.qvm_scene_geometry.appendTriangle`. |
| `decoded` | `dynamic` | — | Record providing `decoded.shaderRGBA`, `decoded.shaderTexCoord`, `decoded.shaderTime`, `decoded.customShader`, `decoded.renderfx`. |
| `submission` | `dynamic` | — | Record providing `submission.indexes`, `submission.vertices`. |
| `entityIndex` | `dynamic` | — | Value forwarded as `entityIndex` to `mq3.renderer.qvm_scene_geometry.triangle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L881)

<a id="function-function-mq3-renderer-qvm-scene-geometry-appendindexedmodeltriangle-function-appendindexedmodeltriangle-output-worldpositions-texcoords-worldnormals-vertexcolors-defaultcolor-entitytexcoord-shadertime-a-b-c-modelhandle-customskin-shaderhandle-shadername-surfacename-entityindex-surfaceindex-renderfx-fogindex-vertexbase-src-mq3-renderer-qvm-scene-geometry-ml-2051328754"></a>
### appendIndexedModelTriangle

```ml
function appendIndexedModelTriangle(output, worldPositions, texCoords, worldNormals, vertexColors, defaultColor, entityTexCoord, shaderTime, a, b, c, modelHandle, customSkin, shaderHandle, shaderName, surfaceName, entityIndex, surfaceIndex, renderfx, fogIndex, vertexBase)
```

Updates `output.triangles[output.triangleCount]`, `output.triangleCount` in `mq3.renderer.qvm_scene_geometry.appendIndexedModelTriangle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Mutable record or buffer; this call updates `output.triangles[output.triangleCount]`, `output.triangleCount`. |
| `worldPositions` | `dynamic` | — | Indexed input read at `a`, `b`, `c`, `index`. |
| `texCoords` | `dynamic` | — | Indexed input read at `a`, `b`, `c`, `corner`. |
| `worldNormals` | `dynamic` | — | Indexed input read at `a`, `b`, `c`, `index`. |
| `vertexColors` | `dynamic` | — | Indexed input read at `a`, `b`, `c`, `index`. |
| `defaultColor` | `dynamic` | — | Value assigned to `target.colors[corner]`, `target.entityColor`. |
| `entityTexCoord` | `dynamic` | — | Value assigned to `target.entityTexCoord`. |
| `shaderTime` | `dynamic` | — | Value assigned to `target.shaderTime`. |
| `a` | `dynamic` | — | Input tested by `vertexColors!=void`. |
| `b` | `dynamic` | — | Input tested by `vertexColors!=void`. |
| `c` | `dynamic` | — | Input tested by `vertexColors!=void`. |
| `modelHandle` | `dynamic` | — | Value assigned to `target.modelHandle`. |
| `customSkin` | `dynamic` | — | Value assigned to `target.customSkin`. |
| `shaderHandle` | `dynamic` | — | Value assigned to `target.shaderHandle`. |
| `shaderName` | `dynamic` | — | Value assigned to `target.shaderName`. |
| `surfaceName` | `dynamic` | — | Value assigned to `target.surfaceName`. |
| `entityIndex` | `dynamic` | — | Value assigned to `target.entityIndex`. |
| `surfaceIndex` | `dynamic` | — | Value assigned to `target.surfaceIndex`. |
| `renderfx` | `dynamic` | — | Value assigned to `target.renderfx`. |
| `fogIndex` | `dynamic` | — | Value assigned to `target.fogIndex`. |
| `vertexBase` | `dynamic` | — | Input tested by `target.vertexIds==void`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L490)

<a id="function-function-mq3-renderer-qvm-scene-geometry-appendpolytriangle-function-appendpolytriangle-output-poly-a-b-c-src-mq3-renderer-qvm-scene-geometry-ml-1465087557"></a>
### appendPolyTriangle

```ml
function appendPolyTriangle(output, poly, a, b, c)
```

Persistent Cgame decals revisit the same triangle slots each frame. Fill their retained records directly instead of constructing a temporary Triangle plus its nested arrays only for appendTriangle to copy them.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Mutable record or buffer; this call updates `output.triangles[slot]`, `output.triangleCount`. |
| `poly` | `dynamic` | — | Record providing `poly.hShader`. |
| `a` | `dynamic` | — | Record providing `a.xyz`, `a.st`, `a.modulate`. |
| `b` | `dynamic` | — | Record providing `b.xyz`, `b.st`, `b.modulate`. |
| `c` | `dynamic` | — | Record providing `c.xyz`, `c.st`, `c.modulate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L446)

<a id="function-function-mq3-renderer-qvm-scene-geometry-appendshadowtriangle-function-appendshadowtriangle-output-positions-entityindex-surfaceindex-src-mq3-renderer-qvm-scene-geometry-ml-712231299"></a>
### appendShadowTriangle

```ml
function appendShadowTriangle(output, positions, entityIndex, surfaceIndex)
```

Updates `output.shadowTriangles[output.shadowTriangleCount]`, `output.shadowTriangleCount` in `mq3.renderer.qvm_scene_geometry.appendShadowTriangle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Mutable record or buffer; this call updates `output.shadowTriangles[output.shadowTriangleCount]`, `output.shadowTriangleCount`. |
| `positions` | `dynamic` | — | Value used for `mq3.renderer.qvm_scene_geometry.ShadowTriangle.positions`. |
| `entityIndex` | `dynamic` | — | Value used for `mq3.renderer.qvm_scene_geometry.ShadowTriangle.entityIndex`. |
| `surfaceIndex` | `dynamic` | — | Value used for `mq3.renderer.qvm_scene_geometry.ShadowTriangle.surfaceIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L331)

<a id="function-function-mq3-renderer-qvm-scene-geometry-appendtriangle-function-appendtriangle-output-value-src-mq3-renderer-qvm-scene-geometry-ml-2028707254"></a>
### appendTriangle

```ml
function appendTriangle(output, value)
```

Updates `output.triangles[output.triangleCount]`, `output.triangleCount` in `mq3.renderer.qvm_scene_geometry.appendTriangle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Mutable record or buffer; this call updates `output.triangles[output.triangleCount]`, `output.triangleCount`. |
| `value` | `dynamic` | — | Record providing `value.positions`, `value.texCoords`, `value.normals`, `value.colors`, `value.entityColor`, `value.entityTexCoord`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L427)

<a id="function-function-mq3-renderer-qvm-scene-geometry-build-function-build-scene-assetkinds-modelassets-refdef-maxtrianglespersurface-src-mq3-renderer-qvm-scene-geometry-ml-1603782838"></a>
### build

```ml
function build(scene, assetKinds, modelAssets, refdef, maxTrianglesPerSurface)
```

Extracts queued scene entities and polygons and builds their render geometry against the asset registry.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.scene_queue.sceneEntities`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecords`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecords`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.buildRecords`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecords`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1275)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildportalrecords-function-buildportalrecords-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-src-mq3-renderer-qvm-scene-geometry-ml-956548383"></a>
### buildPortalRecords

```ml
function buildPortalRecords(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid)
```

Calls `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode` with `(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,void,true,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `normalTable` | `dynamic` | — | Value forwarded as `normalTable` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1071)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildportalrecordsculled-function-buildportalrecordsculled-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-src-mq3-renderer-qvm-scene-geometry-ml-1904958659"></a>
### buildPortalRecordsCulled

```ml
function buildPortalRecordsCulled(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid)
```

Builds lit portal-view geometry with a derived frustum and no previous geometry to reuse.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.refdefFrustum`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `normalTable` | `dynamic` | — | Value forwarded as `normalTable` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1151)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildportalrecordsculledshadows-function-buildportalrecordsculledshadows-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-shadowmode-src-mq3-renderer-qvm-scene-geometry-ml-396435900"></a>
### buildPortalRecordsCulledShadows

```ml
function buildPortalRecordsCulledShadows(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid, shadowMode)
```

Builds culled portal-view geometry with the requested shadow mode and no previous geometry reuse.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.refdefFrustum`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `normalTable` | `dynamic` | — | Value forwarded as `normalTable` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `shadowMode` | `dynamic` | — | Value forwarded as `shadowMode` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1166)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildportalrecordsculledshadowsfog-function-buildportalrecordsculledshadowsfog-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-shadowmode-fogcatalog-src-mq3-renderer-qvm-scene-geometry-ml-681336447"></a>
### buildPortalRecordsCulledShadowsFog

```ml
function buildPortalRecordsCulledShadowsFog(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid, shadowMode, fogCatalog)
```

Builds culled portal-view geometry with shadow/fog handling and refdef's no-world-model flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `refdef` | `dynamic` | — | Record providing `refdef.flags`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `normalTable` | `dynamic` | — | Value forwarded as `normalTable` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `shadowMode` | `dynamic` | — | Value forwarded as `shadowMode` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `fogCatalog` | `dynamic` | — | Value forwarded as `fogCatalog` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1182)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildportalrecordsculledshadowsfoglod-function-buildportalrecordsculledshadowsfoglod-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-shadowmode-fogcatalog-lodscale-lodbias-src-mq3-renderer-qvm-scene-geometry-ml-382407726"></a>
### buildPortalRecordsCulledShadowsFogLod

```ml
function buildPortalRecordsCulledShadowsFogLod(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid, shadowMode, fogCatalog, lodScale, lodBias)
```

Builds culled portal-view geometry with explicit shadow, fog, and MD3 LOD settings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `refdef` | `dynamic` | — | Record providing `refdef.flags`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `normalTable` | `dynamic` | — | Value forwarded as `normalTable` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `shadowMode` | `dynamic` | — | Value forwarded as `shadowMode` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `fogCatalog` | `dynamic` | — | Value forwarded as `fogCatalog` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `lodScale` | `dynamic` | — | Value forwarded as `lodScale` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `lodBias` | `dynamic` | — | Value forwarded as `lodBias` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1200)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecords-function-buildrecords-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-src-mq3-renderer-qvm-scene-geometry-ml-470850544"></a>
### buildRecords

```ml
function buildRecords(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface)
```

Calls `mq3.renderer.qvm_scene_geometry.buildRecordsCached` with `(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsCached`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsCached`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsCached`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsCached`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.buildRecordsCached`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsCached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1268)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordscached-function-buildrecordscached-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-normaltable-src-mq3-renderer-qvm-scene-geometry-ml-1575825383"></a>
### buildRecordsCached

```ml
function buildRecordsCached(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, normalTable)
```

Calls `mq3.renderer.qvm_scene_geometry.buildRecordsCachedLit` with `(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,normalTable,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsCachedLit`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsCachedLit`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsCachedLit`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsCachedLit`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.buildRecordsCachedLit`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsCachedLit`. |
| `normalTable` | `dynamic` | — | Value forwarded as `normalTable` to `mq3.renderer.qvm_scene_geometry.buildRecordsCachedLit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1260)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordscachedlit-function-buildrecordscachedlit-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-normaltable-grid-src-mq3-renderer-qvm-scene-geometry-ml-700980473"></a>
### buildRecordsCachedLit

```ml
function buildRecordsCachedLit(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, normalTable, grid)
```

Calls `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLit` with `(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,void,normalTable,grid)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLit`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLit`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLit`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLit`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLit`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLit`. |
| `normalTable` | `dynamic` | — | Value forwarded as `normalTable` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLit`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1224)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordsframecachedlit-function-buildrecordsframecachedlit-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-src-mq3-renderer-qvm-scene-geometry-ml-919173571"></a>
### buildRecordsFrameCachedLit

```ml
function buildRecordsFrameCachedLit(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid)
```

Calls `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse` with `(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |
| `normalTable` | `dynamic` | — | Value forwarded as `normalTable` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1214)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordsframecachedlitreuse-function-buildrecordsframecachedlitreuse-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-previous-src-mq3-renderer-qvm-scene-geometry-ml-1001436942"></a>
### buildRecordsFrameCachedLitReuse

```ml
function buildRecordsFrameCachedLitReuse(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid, previous)
```

Calls `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode` with `(entities,polys,assetKinds,modelAssets,refdef,maxTrianglesPerSurface,cache,normalTable,grid,previous,false,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `normalTable` | `dynamic` | — | Value forwarded as `normalTable` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `previous` | `dynamic` | — | Value forwarded as `previous` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1060)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordsframecachedlitreusemode-function-buildrecordsframecachedlitreusemode-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-previous-isportal-frustum-src-mq3-renderer-qvm-scene-geometry-ml-638268542"></a>
### buildRecordsFrameCachedLitReuseMode

```ml
function buildRecordsFrameCachedLitReuseMode(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid, previous, isPortal, frustum)
```

Forwards `buildRecordsFrameCachedLitReuseMode` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `normalTable` | `dynamic` | — | Value forwarded as `normalTable` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `previous` | `dynamic` | — | Value forwarded as `previous` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `isPortal` | `dynamic` | — | Value forwarded as `isPortal` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1048)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordsframecachedlitreusemodeshadow-function-buildrecordsframecachedlitreusemodeshadow-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-previous-isportal-frustum-shadowmode-src-mq3-renderer-qvm-scene-geometry-ml-1130255989"></a>
### buildRecordsFrameCachedLitReuseModeShadow

```ml
function buildRecordsFrameCachedLitReuseModeShadow(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid, previous, isPortal, frustum, shadowMode)
```

Forwards `buildRecordsFrameCachedLitReuseModeShadow` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `normalTable` | `dynamic` | — | Value forwarded as `normalTable` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `previous` | `dynamic` | — | Value forwarded as `previous` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `isPortal` | `dynamic` | — | Value forwarded as `isPortal` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `shadowMode` | `dynamic` | — | Value forwarded as `shadowMode` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1034)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordsframecachedlitreusemodeshadowfog-function-buildrecordsframecachedlitreusemodeshadowfog-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-previous-isportal-frustum-shadowmode-fogcatalog-noworldmodel-src-mq3-renderer-qvm-scene-geometry-ml-257955802"></a>
### buildRecordsFrameCachedLitReuseModeShadowFog

```ml
function buildRecordsFrameCachedLitReuseModeShadowFog(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid, previous, isPortal, frustum, shadowMode, fogCatalog, noWorldModel)
```

Forwards `buildRecordsFrameCachedLitReuseModeShadowFog` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `normalTable` | `dynamic` | — | Value forwarded as `normalTable` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `previous` | `dynamic` | — | Value forwarded as `previous` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `isPortal` | `dynamic` | — | Value forwarded as `isPortal` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `shadowMode` | `dynamic` | — | Value forwarded as `shadowMode` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `fogCatalog` | `dynamic` | — | Value forwarded as `fogCatalog` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `noWorldModel` | `dynamic` | — | Value forwarded as `noWorldModel` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1019)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordsframecachedlitreusemodeshadowfoglod-function-buildrecordsframecachedlitreusemodeshadowfoglod-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-normaltable-grid-previous-isportal-frustum-shadowmode-fogcatalog-noworldmodel-lodscale-lodbias-src-mq3-renderer-qvm-scene-geometry-ml-717888543"></a>
### buildRecordsFrameCachedLitReuseModeShadowFogLod

```ml
function buildRecordsFrameCachedLitReuseModeShadowFogLod(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, normalTable, grid, previous, isPortal, frustum, shadowMode, fogCatalog, noWorldModel, lodScale, lodBias)
```

Builds `output.triangleCount`, `output.modelEntities`, `output.spriteEntities`, `output.polySurfaces`, `output.skippedInline` in `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`; returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.decodeEntities`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.qvm_scene_geometry.addModelOptimized`. |
| `normalTable` | `dynamic` | — | Value forwarded as `normalTable` to `mq3.renderer.qvm_scene_geometry.addModelOptimized`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.addModelOptimized`. |
| `previous` | `dynamic` | — | Record providing `previous.triangles`, `previous.shadowTriangles`. |
| `isPortal` | `dynamic` | — | Value forwarded as `isPortal` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `shadowMode` | `dynamic` | — | Value forwarded as `shadowMode` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `fogCatalog` | `dynamic` | — | Value forwarded as `fogCatalog` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `noWorldModel` | `dynamic` | — | Value forwarded as `noWorldModel` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `lodScale` | `dynamic` | — | Value forwarded as `lodScale` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `lodBias` | `dynamic` | — | Value forwarded as `lodBias` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L973)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordswithframecache-function-buildrecordswithframecache-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-grid-src-mq3-renderer-qvm-scene-geometry-ml-410922264"></a>
### buildRecordsWithFrameCache

```ml
function buildRecordsWithFrameCache(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, grid)
```

Builds lit geometry using the required frame cache and its normal lookup table.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLit`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLit`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLit`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLit`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLit`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLit`. |
| `cache` | `dynamic` | — | Record providing `cache.normalTable`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1234)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordswithframecachereuse-function-buildrecordswithframecachereuse-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-grid-previous-src-mq3-renderer-qvm-scene-geometry-ml-576965047"></a>
### buildRecordsWithFrameCacheReuse

```ml
function buildRecordsWithFrameCacheReuse(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, grid, previous)
```

Builds lit frame-cached geometry while allowing reuse of the previous geometry result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |
| `cache` | `dynamic` | — | Record providing `cache.normalTable`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |
| `previous` | `dynamic` | — | Value forwarded as `previous` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1248)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordswithframecachereuseculled-function-buildrecordswithframecachereuseculled-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-grid-previous-src-mq3-renderer-qvm-scene-geometry-ml-887566241"></a>
### buildRecordsWithFrameCacheReuseCulled

```ml
function buildRecordsWithFrameCacheReuseCulled(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, grid, previous)
```

Builds lit ordinary-view geometry with frame-cache reuse and a frustum derived from refdef.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.refdefFrustum`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `cache` | `dynamic` | — | Record providing `cache.normalTable`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |
| `previous` | `dynamic` | — | Value forwarded as `previous` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1088)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordswithframecachereuseculledshadows-function-buildrecordswithframecachereuseculledshadows-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-grid-previous-shadowmode-src-mq3-renderer-qvm-scene-geometry-ml-487268706"></a>
### buildRecordsWithFrameCacheReuseCulledShadows

```ml
function buildRecordsWithFrameCacheReuseCulledShadows(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, grid, previous, shadowMode)
```

Builds culled, frame-cached ordinary-view geometry using the requested shadow mode.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.refdefFrustum`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `cache` | `dynamic` | — | Record providing `cache.normalTable`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `previous` | `dynamic` | — | Value forwarded as `previous` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |
| `shadowMode` | `dynamic` | — | Value forwarded as `shadowMode` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadow`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1103)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordswithframecachereuseculledshadowsfog-function-buildrecordswithframecachereuseculledshadowsfog-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-grid-previous-shadowmode-fogcatalog-src-mq3-renderer-qvm-scene-geometry-ml-426911927"></a>
### buildRecordsWithFrameCacheReuseCulledShadowsFog

```ml
function buildRecordsWithFrameCacheReuseCulledShadowsFog(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, grid, previous, shadowMode, fogCatalog)
```

Builds culled, frame-cached ordinary-view geometry with shadow and fog handling from refdef.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `refdef` | `dynamic` | — | Record providing `refdef.flags`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `cache` | `dynamic` | — | Record providing `cache.normalTable`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `previous` | `dynamic` | — | Value forwarded as `previous` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `shadowMode` | `dynamic` | — | Value forwarded as `shadowMode` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |
| `fogCatalog` | `dynamic` | — | Value forwarded as `fogCatalog` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFog`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1119)

<a id="function-function-mq3-renderer-qvm-scene-geometry-buildrecordswithframecachereuseculledshadowsfoglod-function-buildrecordswithframecachereuseculledshadowsfoglod-entities-polys-assetkinds-modelassets-refdef-maxtrianglespersurface-cache-grid-previous-shadowmode-fogcatalog-lodscale-lodbias-src-mq3-renderer-qvm-scene-geometry-ml-846530150"></a>
### buildRecordsWithFrameCacheReuseCulledShadowsFogLod

```ml
function buildRecordsWithFrameCacheReuseCulledShadowsFogLod(entities, polys, assetKinds, modelAssets, refdef, maxTrianglesPerSurface, cache, grid, previous, shadowMode, fogCatalog, lodScale, lodBias)
```

Builds culled, reusable ordinary-view geometry with explicit shadow, fog, and MD3 LOD settings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `refdef` | `dynamic` | — | Record providing `refdef.flags`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `cache` | `dynamic` | — | Record providing `cache.normalTable`. |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `previous` | `dynamic` | — | Value forwarded as `previous` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `shadowMode` | `dynamic` | — | Value forwarded as `shadowMode` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `fogCatalog` | `dynamic` | — | Value forwarded as `fogCatalog` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `lodScale` | `dynamic` | — | Value forwarded as `lodScale` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |
| `lodBias` | `dynamic` | — | Value forwarded as `lodBias` to `mq3.renderer.qvm_scene_geometry.buildRecordsFrameCachedLitReuseModeShadowFogLod`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1137)

<a id="function-function-mq3-renderer-qvm-scene-geometry-cachedframe-function-cachedframe-cache-modelhandle-model-surfaceindex-frame-oldframe-backlerp-normaltable-src-mq3-renderer-qvm-scene-geometry-ml-1739507159"></a>
### cachedFrame

```ml
function cachedFrame(cache, modelHandle, model, surfaceIndex, frame, oldFrame, backlerp, normalTable)
```

Updates `cache.frameLookupSteps`, `cache.hits`, `cache.entries[cache.entryNext]`, `cache.entryNext`, `cache.entryCount` in `mq3.renderer.qvm_scene_geometry.cachedFrame`; returns `entry`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Mutable record or buffer; this call updates `cache.frameLookupSteps`, `cache.hits`, `cache.entries[cache.entryNext]`, `cache.entryNext`, `cache.entryCount`. |
| `modelHandle` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.md3_cache_index.frameHash`. |
| `model` | `dynamic` | — | Record providing `model.surfaces`. |
| `surfaceIndex` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.md3_cache_index.frameHash`. |
| `frame` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.md3_cache_index.frameHash`. |
| `oldFrame` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.md3_cache_index.frameHash`. |
| `backlerp` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.md3_cache_index.frameHash`. |
| `normalTable` | `dynamic` | — | Input used by `table=normalTable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L707)

<a id="function-function-mq3-renderer-qvm-scene-geometry-cachedtransform-function-cachedtransform-cache-decoded-modelcachekey-surfaceindex-framedata-src-mq3-renderer-qvm-scene-geometry-ml-1802128700"></a>
### cachedTransform

```ml
function cachedTransform(cache, decoded, modelCacheKey, surfaceIndex, frameData)
```

Updates `cache.transformLookupSteps`, `cache.transformHits`, `cache.transforms[cache.transformNext]`, `cache.transformNext`, `cache.transformCount` in `mq3.renderer.qvm_scene_geometry.cachedTransform`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Mutable record or buffer; this call updates `cache.transformLookupSteps`, `cache.transformHits`, `cache.transforms[cache.transformNext]`, `cache.transformNext`, `cache.transformCount`. |
| `decoded` | `dynamic` | — | Record providing `decoded.frame`, `decoded.oldframe`, `decoded.backlerp`, `decoded.origin`, `decoded.axis`. |
| `modelCacheKey` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.md3_cache_index.transformHash`. |
| `surfaceIndex` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.md3_cache_index.transformHash`. |
| `frameData` | `dynamic` | — | Record providing `frameData.vertexCount`, `frameData.packed`, `frameData.xyz`, `frameData.normals`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L742)

<a id="function-function-mq3-renderer-qvm-scene-geometry-cachedvertexcolors-function-cachedvertexcolors-entry-lighting-alpha-src-mq3-renderer-qvm-scene-geometry-ml-321933454"></a>
### cachedVertexColors

```ml
function cachedVertexColors(entry, lighting, alpha)
```

Updates `entry.lightAmbient`, `entry.lightDirected`, `entry.lightDirection`, `entry.lightAlpha`, `entry.colors` in `mq3.renderer.qvm_scene_geometry.cachedVertexColors`; returns `colors`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — | Mutable record or buffer; this call updates `entry.lightAmbient`, `entry.lightDirected`, `entry.lightDirection`, `entry.lightAlpha`, `entry.colors`. |
| `lighting` | `dynamic` | — | Record providing `lighting.ambient`, `lighting.directed`, `lighting.direction`. |
| `alpha` | `dynamic` | — | Value assigned to `color[3]`, `entry.lightAlpha`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L774)

<a id="function-function-mq3-renderer-qvm-scene-geometry-createframecache-function-createframecache-normaltable-maxentries-src-mq3-renderer-qvm-scene-geometry-ml-52792963"></a>
### createFrameCache

```ml
function createFrameCache(normalTable, maxEntries)
```

Builds `mq3.renderer.qvm_scene_geometry.FrameCache` using `mq3.renderer.native_md3.tableBytes`, `mq3.renderer.md3_cache_index.create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normalTable` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.FrameCache.normalTable`. |
| `maxEntries` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.FrameCache.maxEntries`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L692)

<a id="function-function-mq3-renderer-qvm-scene-geometry-createnormaltable-function-createnormaltable-src-mq3-renderer-qvm-scene-geometry-ml-390105140"></a>
### createNormalTable

```ml
function createNormalTable()
```

Calls `mq3.renderer.surface_md3.normalTable` with `()` and returns its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L688)

<a id="function-function-mq3-renderer-qvm-scene-geometry-decodeentities-function-decodeentities-entities-src-mq3-renderer-qvm-scene-geometry-ml-2003747013"></a>
### decodeEntities

```ml
function decodeEntities(entities)
```

Builds `result[index]` in `mq3.renderer.qvm_scene_geometry.decodeEntities`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Sequence traversed as `value` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L572)

<a id="function-function-mq3-renderer-qvm-scene-geometry-expecteddecodedtriangles-function-expecteddecodedtriangles-decodedentities-polys-assetkinds-modelassets-maxtrianglespersurface-src-mq3-renderer-qvm-scene-geometry-ml-2013359956"></a>
### expectedDecodedTriangles

```ml
function expectedDecodedTriangles(decodedEntities, polys, assetKinds, modelAssets, maxTrianglesPerSurface)
```

Calls `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesMode` with `(decodedEntities,polys,assetKinds,modelAssets,maxTrianglesPerSurface,false,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decodedEntities` | `dynamic` | — | Value forwarded as `decodedEntities` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesMode`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesMode`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesMode`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesMode`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L664)

<a id="function-function-mq3-renderer-qvm-scene-geometry-expecteddecodedtrianglesmode-function-expecteddecodedtrianglesmode-decodedentities-polys-assetkinds-modelassets-maxtrianglespersurface-isportal-frustum-src-mq3-renderer-qvm-scene-geometry-ml-925012858"></a>
### expectedDecodedTrianglesMode

```ml
function expectedDecodedTrianglesMode(decodedEntities, polys, assetKinds, modelAssets, maxTrianglesPerSurface, isPortal, frustum)
```

Calls `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFog` with `(decodedEntities,polys,assetKinds,modelAssets,maxTrianglesPerSurface,isPortal,frustum,void,false)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decodedEntities` | `dynamic` | — | Value forwarded as `decodedEntities` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFog`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFog`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFog`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFog`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFog`. |
| `isPortal` | `dynamic` | — | Value forwarded as `isPortal` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFog`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFog`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L657)

<a id="function-function-mq3-renderer-qvm-scene-geometry-expecteddecodedtrianglesmodefog-function-expecteddecodedtrianglesmodefog-decodedentities-polys-assetkinds-modelassets-maxtrianglespersurface-isportal-frustum-fogcatalog-noworldmodel-src-mq3-renderer-qvm-scene-geometry-ml-1221373651"></a>
### expectedDecodedTrianglesModeFog

```ml
function expectedDecodedTrianglesModeFog(decodedEntities, polys, assetKinds, modelAssets, maxTrianglesPerSurface, isPortal, frustum, fogCatalog, noWorldModel)
```

Forwards `expectedDecodedTrianglesModeFog` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFogLod` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decodedEntities` | `dynamic` | — | Value forwarded as `decodedEntities` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFogLod`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFogLod`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFogLod`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFogLod`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFogLod`. |
| `isPortal` | `dynamic` | — | Value forwarded as `isPortal` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFogLod`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFogLod`. |
| `fogCatalog` | `dynamic` | — | Value forwarded as `fogCatalog` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFogLod`. |
| `noWorldModel` | `dynamic` | — | Value forwarded as `noWorldModel` to `mq3.renderer.qvm_scene_geometry.expectedDecodedTrianglesModeFogLod`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L648)

<a id="function-function-mq3-renderer-qvm-scene-geometry-expecteddecodedtrianglesmodefoglod-function-expecteddecodedtrianglesmodefoglod-decodedentities-polys-assetkinds-modelassets-maxtrianglespersurface-isportal-frustum-fogcatalog-noworldmodel-refdef-lodscale-lodbias-shadowmode-src-mq3-renderer-qvm-scene-geometry-ml-1376709223"></a>
### expectedDecodedTrianglesModeFogLod

```ml
function expectedDecodedTrianglesModeFogLod(decodedEntities, polys, assetKinds, modelAssets, maxTrianglesPerSurface, isPortal, frustum, fogCatalog, noWorldModel, refdef, lodScale, lodBias, shadowMode)
```

Forwards `expectedDecodedTrianglesModeFogLod` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decodedEntities` | `dynamic` | — | Value forwarded as `decodedEntities` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `polys` | `dynamic` | — | Value forwarded as `polys` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `isPortal` | `dynamic` | — | Value forwarded as `isPortal` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `fogCatalog` | `dynamic` | — | Value forwarded as `fogCatalog` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `noWorldModel` | `dynamic` | — | Value forwarded as `noWorldModel` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `lodScale` | `dynamic` | — | Value forwarded as `lodScale` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `lodBias` | `dynamic` | — | Value forwarded as `lodBias` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |
| `shadowMode` | `dynamic` | — | Value forwarded as `shadowMode` to `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L635)

<a id="function-function-mq3-renderer-qvm-scene-geometry-expectedtriangles-function-expectedtriangles-entities-polys-assetkinds-modelassets-maxtrianglespersurface-src-mq3-renderer-qvm-scene-geometry-ml-916215878"></a>
### expectedTriangles

```ml
function expectedTriangles(entities, polys, assetKinds, modelAssets, maxTrianglesPerSurface)
```

Estimates generated entity/polygon triangles, including supported beam/trail/sprite and projection-shadow geometry.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Sequence traversed as `value` while producing this result. |
| `polys` | `dynamic` | — | Sequence traversed as `poly` while producing this result. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.modelAt`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.modelAt`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.modelTriangleCount`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L556)

<a id="function-function-mq3-renderer-qvm-scene-geometry-fail-function-fail-message-src-mq3-renderer-qvm-scene-geometry-ml-1950264191"></a>
### fail

```ml
function fail(message)
```

Creates error `7670` with message `"QVM scene geometry: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7670,"QVM scene geometry: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L257)

- [mq3.renderer.qvm_scene_geometry.FrameCache](Type-mq3-renderer-qvm-scene-geometry-framecache-2005265354.md) — struct
- [mq3.renderer.qvm_scene_geometry.FrameEntry](Type-mq3-renderer-qvm-scene-geometry-frameentry-810044996.md) — struct
- [mq3.renderer.qvm_scene_geometry.Geometry](Type-mq3-renderer-qvm-scene-geometry-geometry-201466147.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-geometry-inlineculled-function-inlineculled-decoded-model-frustum-src-mq3-renderer-qvm-scene-geometry-ml-2119866939"></a>
### inlineCulled

```ml
function inlineCulled(decoded, model, frustum)
```

Computes `inlineCulled` from `result==viewMath.CULL_OUT` using `mq3.renderer.view_math.orientation`, `mq3.renderer.view_math.cullLocalBox`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoded` | `dynamic` | — | Record providing `decoded.origin`, `decoded.axis`. |
| `model` | `dynamic` | — | Indexed input read at `0`. |
| `frustum` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.view_math.cullLocalBox`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L581)

- [mq3.renderer.qvm_scene_geometry.InlineModel](Type-mq3-renderer-qvm-scene-geometry-inlinemodel-1638604735.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-geometry-inlineshadername-function-inlineshadername-map-textureindex-src-mq3-renderer-qvm-scene-geometry-ml-1386356815"></a>
### inlineShaderName

```ml
function inlineShaderName(map, textureIndex)
```

Computes `inlineShaderName` from `decode(slice(map.data,offset,length))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`, `map.offsets`, `map.data`. |
| `textureIndex` | `dynamic` | — | Input tested by `textureIndex<0 or textureIndex>=map.counts[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L383)

<a id="function-function-mq3-renderer-qvm-scene-geometry-isinlinemodel-function-isinlinemodel-model-src-mq3-renderer-qvm-scene-geometry-ml-705360061"></a>
### isInlineModel

```ml
function isInlineModel(model)
```

Computes `model!=void and typeof(model)=="array" and len(model)==1` for `mq3.renderer.qvm_scene_geometry.isInlineModel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Input used in the result expression `model!=void and typeof(model)=="array" and len(model)==1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L406)

<a id="function-function-mq3-renderer-qvm-scene-geometry-islodmodel-function-islodmodel-model-src-mq3-renderer-qvm-scene-geometry-ml-1138971501"></a>
### isLodModel

```ml
function isLodModel(model)
```

Computes `model!=void and typeof(model)=="array" and len(model)==2 and typeof(model[0])=="string" and model[0]=="$mq3/md3Lods"` for `mq3.renderer.qvm_scene_geometry.isLodModel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Indexed input read at `0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L412)

<a id="function-function-mq3-renderer-qvm-scene-geometry-loadinlinemodel-function-loadinlinemodel-map-index-maxtriangles-src-mq3-renderer-qvm-scene-geometry-ml-760708095"></a>
### loadInlineModel

```ml
function loadInlineModel(map, index, maxTriangles)
```

Builds `faces[face-first]`, `names[textureIndex]`, `dynamicLightFlags[textureIndex]` in `mq3.renderer.qvm_scene_geometry.loadInlineModel`; returns `[InlineModel(index,data,names,bounds,dynamicLightFlags)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`, `map.counts`, `map.offsets`. |
| `index` | `dynamic` | — | Value used for `mq3.renderer.qvm_scene_geometry.InlineModel.index`. |
| `maxTriangles` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.bsp_render_data.extract`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L392)

<a id="function-function-mq3-renderer-qvm-scene-geometry-locallightdirection-function-locallightdirection-lightdirection-axis-src-mq3-renderer-qvm-scene-geometry-ml-1050557950"></a>
### localLightDirection

```ml
function localLightDirection(lightDirection, axis)
```

Builds the 3-element result for `mq3.renderer.qvm_scene_geometry.localLightDirection` from `lightDirection[0]*axis[0][0]+lightDirection[1]*axis[0][1]+lightDirection[2]*axis[0][2]`, `lightDirection[0]*axis[1][0]+lightDirection[1]*axis[1][1]+lightDirection[2]*axis[1][2]`, `lightDirection[0]*axis[2][0]+lightDirection[1]*axis[2][1]+lightDirection[2]*axis[2][2]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lightDirection` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `axis` | `dynamic` | — | Nested indexed data; outer entries read at `0`, `1`, `2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L296)

<a id="function-function-mq3-renderer-qvm-scene-geometry-mappedtriangle-function-mappedtriangle-positions-coords-lightmapcoords-normals-colors-entitycolor-entitytexcoord-shadertime-modelhandle-customskin-shaderhandle-shadername-surfacename-entityindex-surfaceindex-renderfx-lightmapindex-fogindex-dynamiclight-dynamiclightorigin-dynamiclightaxis-dynamiclightbounds-src-mq3-renderer-qvm-scene-geometry-ml-1012114579"></a>
### mappedTriangle

```ml
function mappedTriangle(positions, coords, lightmapCoords, normals, colors, entityColor, entityTexCoord, shaderTime, modelHandle, customSkin, shaderHandle, shaderName, surfaceName, entityIndex, surfaceIndex, renderfx, lightmapIndex, fogIndex, dynamicLight, dynamicLightOrigin, dynamicLightAxis, dynamicLightBounds)
```

Constructs `mq3.renderer.qvm_scene_geometry.Triangle` with `vertexIds` = `void` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `positions` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.positions`. |
| `coords` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.texCoords`. |
| `lightmapCoords` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.lightmapCoords`. |
| `normals` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.normals`. |
| `colors` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.colors`. |
| `entityColor` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.entityColor`. |
| `entityTexCoord` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.entityTexCoord`. |
| `shaderTime` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.shaderTime`. |
| `modelHandle` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.modelHandle`. |
| `customSkin` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.customSkin`. |
| `shaderHandle` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.shaderHandle`. |
| `shaderName` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.shaderName`. |
| `surfaceName` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.surfaceName`. |
| `entityIndex` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.entityIndex`. |
| `surfaceIndex` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.surfaceIndex`. |
| `renderfx` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.renderfx`. |
| `lightmapIndex` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.lightmapIndex`. |
| `fogIndex` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.fogIndex`. |
| `dynamicLight` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.dynamicLight`. |
| `dynamicLightOrigin` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.dynamicLightOrigin`. |
| `dynamicLightAxis` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.dynamicLightAxis`. |
| `dynamicLightBounds` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.dynamicLightBounds`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L377)

<a id="function-function-mq3-renderer-qvm-scene-geometry-materializeframe-function-materializeframe-entry-src-mq3-renderer-qvm-scene-geometry-ml-269832388"></a>
### materializeFrame

```ml
function materializeFrame(entry)
```

Updates `entry.xyz`, `entry.normals` in `mq3.renderer.qvm_scene_geometry.materializeFrame`; returns `entry`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entry` | `dynamic` | — | Mutable record or buffer; this call updates `entry.xyz`, `entry.normals`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L733)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-max-shadow-edge-defs-const-max-shadow-edge-defs-32-src-mq3-renderer-qvm-scene-geometry-ml-665989806"></a>
### MAX_SHADOW_EDGE_DEFS

```ml
const MAX_SHADOW_EDGE_DEFS = 32
```

Maximum number of adjacency records retained for one shadow-mesh edge.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L45)

<a id="function-function-mq3-renderer-qvm-scene-geometry-md3lods-function-md3lods-levels-src-mq3-renderer-qvm-scene-geometry-ml-587748545"></a>
### md3Lods

```ml
function md3Lods(levels)
```

Returns `["$mq3/md3Lods",levels]` for `mq3.renderer.qvm_scene_geometry.md3Lods`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `levels` | `dynamic` | — | Input used in the result expression `["$mq3/md3Lods",levels]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L409)

- [mq3.renderer.qvm_scene_geometry.Md3Selection](Type-mq3-renderer-qvm-scene-geometry-md3selection-1893054183.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-geometry-modelat-function-modelat-assetkinds-modelassets-handle-src-mq3-renderer-qvm-scene-geometry-ml-647464931"></a>
### modelAt

```ml
function modelAt(assetKinds, modelAssets, handle)
```

Returns `modelAssets[handle-1]` from `mq3.renderer.qvm_scene_geometry.modelAt`; earlier branches return `void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `assetKinds` | `dynamic` | — | Indexed input read at `handle-1`. |
| `modelAssets` | `dynamic` | — | Indexed input read at `handle-1`. |
| `handle` | `dynamic` | — | Input tested by `handle<=0 or handle>len(assetKinds) or assetKinds[handle-1]!="model" or handle>len(modelAssets)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L420)

<a id="function-function-mq3-renderer-qvm-scene-geometry-modelfognum-function-modelfognum-decoded-model-fogcatalog-noworldmodel-src-mq3-renderer-qvm-scene-geometry-ml-1923314846"></a>
### modelFogNum

```ml
function modelFogNum(decoded, model, fogCatalog, noWorldModel)
```

Computes `modelFogNum` from `md3Entity.computeFogNum(fogs,decoded.origin,model.frames[frames.frame],noWorldModel)` using `mq3.renderer.md3_entity.normalizeFrames`, `mq3.renderer.md3_entity.computeFogNum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoded` | `dynamic` | — | Record providing `decoded.frame`, `decoded.oldframe`, `decoded.renderfx`, `decoded.origin`. |
| `model` | `dynamic` | — | Record providing `model.numFrames`, `model.frames`. |
| `fogCatalog` | `dynamic` | — | Record providing `fogCatalog.fogs`. |
| `noWorldModel` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.md3_entity.computeFogNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L524)

<a id="function-function-mq3-renderer-qvm-scene-geometry-modeltrianglecount-function-modeltrianglecount-model-maxtrianglespersurface-src-mq3-renderer-qvm-scene-geometry-ml-1947258400"></a>
### modelTriangleCount

```ml
function modelTriangleCount(model, maxTrianglesPerSurface)
```

Counts inline-model triangles or capped per-surface MD3 triangles for allocation planning.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Record providing `model.surfaces`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Input tested by `amount>maxTrianglesPerSurface`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L513)

<a id="function-function-mq3-renderer-qvm-scene-geometry-normal-function-normal-src-mq3-renderer-qvm-scene-geometry-ml-2010563862"></a>
### normal

```ml
function normal()
```

Returns `[0.0,0.0,1.0]` for `mq3.renderer.qvm_scene_geometry.normal`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L259)

<a id="function-function-mq3-renderer-qvm-scene-geometry-planneddecodedtrianglesmodefoglod-function-planneddecodedtrianglesmodefoglod-decodedentities-polys-assetkinds-modelassets-maxtrianglespersurface-isportal-frustum-fogcatalog-noworldmodel-refdef-lodscale-lodbias-shadowmode-plans-src-mq3-renderer-qvm-scene-geometry-ml-2035729245"></a>
### plannedDecodedTrianglesModeFogLod

```ml
function plannedDecodedTrianglesModeFogLod(decodedEntities, polys, assetKinds, modelAssets, maxTrianglesPerSurface, isPortal, frustum, fogCatalog, noWorldModel, refdef, lodScale, lodBias, shadowMode, plans)
```

Updates `plans[entityIndex]` in `mq3.renderer.qvm_scene_geometry.plannedDecodedTrianglesModeFogLod`; returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decodedEntities` | `dynamic` | — | Sequence traversed as `decoded` while producing this result. |
| `polys` | `dynamic` | — | Sequence traversed as `poly` while producing this result. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.modelAt`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.modelAt`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.modelTriangleCount`. |
| `isPortal` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.entity_surface_policy.visible`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.qvm_scene_geometry.inlineCulled`. |
| `fogCatalog` | `dynamic` | — | Value forwarded as `fogCatalog` to `mq3.renderer.qvm_scene_geometry.modelFogNum`. |
| `noWorldModel` | `dynamic` | — | Value forwarded as `noWorldModel` to `mq3.renderer.qvm_scene_geometry.modelFogNum`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.selectMd3`. |
| `lodScale` | `dynamic` | — | Value forwarded as `lodScale` to `mq3.renderer.qvm_scene_geometry.selectMd3`. |
| `lodBias` | `dynamic` | — | Value forwarded as `lodBias` to `mq3.renderer.qvm_scene_geometry.selectMd3`. |
| `shadowMode` | `dynamic` | — | Input tested by `not isInlineModel(asset) and shadowMode==3 and (decoded.renderfx&RF_SHADOW_PLANE)!=0`. |
| `plans` | `dynamic` | — | Mutable record or buffer; this call updates `plans[entityIndex]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L600)

<a id="function-function-mq3-renderer-qvm-scene-geometry-portalviewforplane-function-portalviewforplane-geometry-normal-dist-refdef-src-mq3-renderer-qvm-scene-geometry-ml-582646861"></a>
### portalViewForPlane

```ml
function portalViewForPlane(geometry, normal, dist, refdef)
```

Computes `portalViewForPlane` from `portalView.prepare(normal,dist,geometry.portals,refdef.time,refdef.vieworg,refdef.viewaxis)` using `mq3.renderer.portal_view.prepare`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `geometry` | `dynamic` | — | Record providing `geometry.portals`. |
| `normal` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.portal_view.prepare`. |
| `dist` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.portal_view.prepare`. |
| `refdef` | `dynamic` | — | Record providing `refdef.time`, `refdef.vieworg`, `refdef.viewaxis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1284)

<a id="function-function-mq3-renderer-qvm-scene-geometry-primarymd3-function-primarymd3-model-src-mq3-renderer-qvm-scene-geometry-ml-1464340229"></a>
### primaryMd3

```ml
function primaryMd3(model)
```

Returns `model` from `mq3.renderer.qvm_scene_geometry.primaryMd3`; earlier branches return `void`, `model[1][0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Value forwarded as `model` to `mq3.renderer.qvm_scene_geometry.isLodModel`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L415)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-projection-shadow-shader-const-projection-shadow-shader-mq3-projectionshadow-src-mq3-renderer-qvm-scene-geometry-ml-1820046822"></a>
### PROJECTION_SHADOW_SHADER

```ml
const PROJECTION_SHADOW_SHADER = "$mq3/projectionShadow"
```

Builtin shader name used for projected entity shadows.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L43)

<a id="function-function-mq3-renderer-qvm-scene-geometry-projectionshadowpoint-function-projectionshadowpoint-position-shadowplane-lightdirection-src-mq3-renderer-qvm-scene-geometry-ml-1380152296"></a>
### projectionShadowPoint

```ml
function projectionShadowPoint(position, shadowPlane, lightDirection)
```

Calls `mq3.renderer.qvm_scene_geometry.projectionShadowPointOriented` with `(position,shadowPlane,lightDirection,[0.0,0.0,0.0],[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]])` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | `dynamic` | — | Value forwarded as `position` to `mq3.renderer.qvm_scene_geometry.projectionShadowPointOriented`. |
| `shadowPlane` | `dynamic` | — | Value forwarded as `shadowPlane` to `mq3.renderer.qvm_scene_geometry.projectionShadowPointOriented`. |
| `lightDirection` | `dynamic` | — | Value forwarded as `lightDirection` to `mq3.renderer.qvm_scene_geometry.projectionShadowPointOriented`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L290)

<a id="function-function-mq3-renderer-qvm-scene-geometry-projectionshadowpointoriented-function-projectionshadowpointoriented-position-shadowplane-lightdirection-origin-axis-src-mq3-renderer-qvm-scene-geometry-ml-1142303503"></a>
### projectionShadowPointOriented

```ml
function projectionShadowPointOriented(position, shadowPlane, lightDirection, origin, axis)
```

RB_ProjectionShadowDeform in tr_shadows.c projects model vertices onto the entity's horizontal shadow plane along its sampled light direction.  The original clamps shallow light directions so projected shadows cannot become unbounded; retain that rule before dividing by the vertical component.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `shadowPlane` | `dynamic` | — | Input used by `h=position[0]*ground[0]+position[1]*ground[1]+position[2]*ground[2]+origin[2]-shadowPlane`. |
| `lightDirection` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `origin` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `axis` | `dynamic` | — | Nested indexed data; outer entries read at `0`, `1`, `2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L269)

<a id="function-function-mq3-renderer-qvm-scene-geometry-refdeffrustum-function-refdeffrustum-refdef-src-mq3-renderer-qvm-scene-geometry-ml-2068301298"></a>
### refdefFrustum

```ml
function refdefFrustum(refdef)
```

Returns `viewMath.setupFrustum(refdef.vieworg,refdef.viewaxis,refdef.fovX,refdef.fovY)` from `mq3.renderer.qvm_scene_geometry.refdefFrustum`; earlier branches return `fail("refdef is required for frustum culling")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `refdef` | `dynamic` | — | Record providing `refdef.vieworg`, `refdef.viewaxis`, `refdef.fovX`, `refdef.fovY`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L1074)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rf-depthhack-const-rf-depthhack-8-src-mq3-renderer-qvm-scene-geometry-ml-379588973"></a>
### RF_DEPTHHACK

```ml
const RF_DEPTHHACK = 8
```

Entity-rendering flag that uses the shortened depth range for first-person weapons.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L37)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rf-noshadow-const-rf-noshadow-64-src-mq3-renderer-qvm-scene-geometry-ml-1734906989"></a>
### RF_NOSHADOW

```ml
const RF_NOSHADOW = 64
```

Entity-rendering flag that suppresses shadow generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L39)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rf-shadow-plane-const-rf-shadow-plane-256-src-mq3-renderer-qvm-scene-geometry-ml-1543535186"></a>
### RF_SHADOW_PLANE

```ml
const RF_SHADOW_PLANE = 256
```

Entity-rendering flag that enables projection onto the supplied shadow plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L41)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rt-beam-const-rt-beam-3-src-mq3-renderer-qvm-scene-geometry-ml-753962898"></a>
### RT_BEAM

```ml
const RT_BEAM = 3
```

Renderer entity type for a beam between two endpoints.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L29)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rt-lightning-const-rt-lightning-6-src-mq3-renderer-qvm-scene-geometry-ml-92763083"></a>
### RT_LIGHTNING

```ml
const RT_LIGHTNING = 6
```

Renderer entity type for the lightning-gun beam.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L35)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rt-model-const-rt-model-0-src-mq3-renderer-qvm-scene-geometry-ml-17209395"></a>
### RT_MODEL

```ml
const RT_MODEL = 0
```

Renderer entity type for an animated or inline model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L25)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rt-rail-core-const-rt-rail-core-4-src-mq3-renderer-qvm-scene-geometry-ml-500759457"></a>
### RT_RAIL_CORE

```ml
const RT_RAIL_CORE = 4
```

Renderer entity type for the core of a railgun trail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L31)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rt-rail-rings-const-rt-rail-rings-5-src-mq3-renderer-qvm-scene-geometry-ml-1185568004"></a>
### RT_RAIL_RINGS

```ml
const RT_RAIL_RINGS = 5
```

Renderer entity type for rings around a railgun trail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L33)

<a id="constant-constant-mq3-renderer-qvm-scene-geometry-rt-sprite-const-rt-sprite-2-src-mq3-renderer-qvm-scene-geometry-ml-942595087"></a>
### RT_SPRITE

```ml
const RT_SPRITE = 2
```

Renderer entity type for a camera-facing sprite.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L27)

<a id="function-function-mq3-renderer-qvm-scene-geometry-selectmd3-function-selectmd3-decoded-asset-refdef-frustum-lodscale-lodbias-src-mq3-renderer-qvm-scene-geometry-ml-1399542753"></a>
### selectMd3

```ml
function selectMd3(decoded, asset, refdef, frustum, lodScale, lodBias)
```

Builds `mq3.renderer.qvm_scene_geometry.Md3Selection` using `mq3.renderer.md3_entity.normalizeFrames`, `mq3.renderer.md3_entity.lodProjection`, `mq3.renderer.md3_entity.computeLod`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoded` | `dynamic` | — | Record providing `decoded.frame`, `decoded.oldframe`, `decoded.renderfx`, `decoded.origin`, `decoded.axis`, `decoded.nonNormalizedAxes`. |
| `asset` | `dynamic` | — | Value forwarded as `model` to `mq3.renderer.qvm_scene_geometry.isLodModel`. |
| `refdef` | `dynamic` | — | Record providing `refdef.fovY`, `refdef.vieworg`, `refdef.viewaxis`. |
| `frustum` | `dynamic` | — | Argument 7 supplied to `mq3.renderer.md3_entity.cullModel`. |
| `lodScale` | `dynamic` | — | Argument 8 supplied to `mq3.renderer.md3_entity.computeLod`. |
| `lodBias` | `dynamic` | — | Argument 9 supplied to `mq3.renderer.md3_entity.computeLod`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L536)

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
| `positions` | `dynamic` | — | Indexed input read at `i1`, `i2`, `i3`, `vertexIndex`. |
| `indexes` | `dynamic` | — | Indexed input read at `base`, `base+1`, `base+2`. |
| `numTriangles` | `dynamic` | — | Argument 1 supplied to `array`. |
| `lightDirection` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L306)

<a id="function-function-mq3-renderer-qvm-scene-geometry-stencilshadowcapacity-function-stencilshadowcapacity-decodedentities-assetkinds-modelassets-maxtrianglespersurface-isportal-frustum-shadowmode-fogcatalog-noworldmodel-refdef-lodscale-lodbias-src-mq3-renderer-qvm-scene-geometry-ml-1583210040"></a>
### stencilShadowCapacity

```ml
function stencilShadowCapacity(decodedEntities, assetKinds, modelAssets, maxTrianglesPerSurface, isPortal, frustum, shadowMode, fogCatalog, noWorldModel, refdef, lodScale, lodBias)
```

Reserves up to six shadow triangles per eligible visible MD3 triangle when stencil shadows are enabled.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decodedEntities` | `dynamic` | — | Sequence traversed as `decoded` while producing this result. |
| `assetKinds` | `dynamic` | — | Value forwarded as `assetKinds` to `mq3.renderer.qvm_scene_geometry.modelAt`. |
| `modelAssets` | `dynamic` | — | Value forwarded as `modelAssets` to `mq3.renderer.qvm_scene_geometry.modelAt`. |
| `maxTrianglesPerSurface` | `dynamic` | — | Value forwarded as `maxTrianglesPerSurface` to `mq3.renderer.qvm_scene_geometry.modelTriangleCount`. |
| `isPortal` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.entity_surface_policy.visible`. |
| `frustum` | `dynamic` | — | Value forwarded as `frustum` to `mq3.renderer.qvm_scene_geometry.selectMd3`. |
| `shadowMode` | `dynamic` | — | Input tested by `shadowMode!=2`. |
| `fogCatalog` | `dynamic` | — | Value forwarded as `fogCatalog` to `mq3.renderer.qvm_scene_geometry.modelFogNum`. |
| `noWorldModel` | `dynamic` | — | Value forwarded as `noWorldModel` to `mq3.renderer.qvm_scene_geometry.modelFogNum`. |
| `refdef` | `dynamic` | — | Value forwarded as `refdef` to `mq3.renderer.qvm_scene_geometry.selectMd3`. |
| `lodScale` | `dynamic` | — | Value forwarded as `lodScale` to `mq3.renderer.qvm_scene_geometry.selectMd3`. |
| `lodBias` | `dynamic` | — | Value forwarded as `lodBias` to `mq3.renderer.qvm_scene_geometry.selectMd3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L944)

- [mq3.renderer.qvm_scene_geometry.TransformEntry](Type-mq3-renderer-qvm-scene-geometry-transformentry-1468067707.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-geometry-transformtriangle-function-transformtriangle-source-orientation-color-modelhandle-customskin-shaderhandle-surfacename-entityindex-lighting-renderfx-src-mq3-renderer-qvm-scene-geometry-ml-83671773"></a>
### transformTriangle

```ml
function transformTriangle(source, orientation, color, modelHandle, customSkin, shaderHandle, surfaceName, entityIndex, lighting, renderfx)
```

Builds `positions[corner]`, `normals[corner]`, `colors[corner]`, `colors[corner][3]` in `mq3.renderer.qvm_scene_geometry.transformTriangle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record providing `source.positions`, `source.normals`, `source.texCoords`, `source.shaderName`, `source.surfaceIndex`. |
| `orientation` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.view_math.localPointToWorld`. |
| `color` | `dynamic` | — | Value forwarded as `entityColor` to `mq3.renderer.qvm_scene_geometry.triangle`. |
| `modelHandle` | `dynamic` | — | Value forwarded as `modelHandle` to `mq3.renderer.qvm_scene_geometry.triangle`. |
| `customSkin` | `dynamic` | — | Value forwarded as `customSkin` to `mq3.renderer.qvm_scene_geometry.triangle`. |
| `shaderHandle` | `dynamic` | — | Value forwarded as `shaderHandle` to `mq3.renderer.qvm_scene_geometry.triangle`. |
| `surfaceName` | `dynamic` | — | Value forwarded as `surfaceName` to `mq3.renderer.qvm_scene_geometry.triangle`. |
| `entityIndex` | `dynamic` | — | Value forwarded as `entityIndex` to `mq3.renderer.qvm_scene_geometry.triangle`. |
| `lighting` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_light_grid.vertexColor`. |
| `renderfx` | `dynamic` | — | Value forwarded as `renderfx` to `mq3.renderer.qvm_scene_geometry.triangle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L676)

<a id="function-function-mq3-renderer-qvm-scene-geometry-triangle-function-triangle-positions-coords-normals-colors-entitycolor-entitytexcoord-shadertime-modelhandle-customskin-shaderhandle-shadername-surfacename-entityindex-surfaceindex-renderfx-src-mq3-renderer-qvm-scene-geometry-ml-1256987599"></a>
### triangle

```ml
function triangle(positions, coords, normals, colors, entityColor, entityTexCoord, shaderTime, modelHandle, customSkin, shaderHandle, shaderName, surfaceName, entityIndex, surfaceIndex, renderfx)
```

Constructs `mq3.renderer.qvm_scene_geometry.Triangle` with `lightmapCoords` = `[[0.0,0.0],[0.0,0.0],[0.0,0.0]]`, `lightmapIndex` = `-1`, `fogIndex` = `-1`, `dynamicLight` = `false` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `positions` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.positions`. |
| `coords` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.texCoords`. |
| `normals` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.normals`. |
| `colors` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.colors`. |
| `entityColor` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.entityColor`. |
| `entityTexCoord` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.entityTexCoord`. |
| `shaderTime` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.shaderTime`. |
| `modelHandle` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.modelHandle`. |
| `customSkin` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.customSkin`. |
| `shaderHandle` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.shaderHandle`. |
| `shaderName` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.shaderName`. |
| `surfaceName` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.surfaceName`. |
| `entityIndex` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.entityIndex`. |
| `surfaceIndex` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.surfaceIndex`. |
| `renderfx` | `dynamic` | — | Initial value for `mq3.renderer.qvm_scene_geometry.Triangle.renderfx`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L351)

- [mq3.renderer.qvm_scene_geometry.Triangle](Type-mq3-renderer-qvm-scene-geometry-triangle-2145392759.md) — struct
