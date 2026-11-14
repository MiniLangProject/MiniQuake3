# `src/mq3/renderer/playable_world_batch.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.playable_world_batch`](Package-mq3-renderer-playable-world-batch-671626911.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/noise.ml` as `rendererNoise` → [src/mq3/renderer/noise.ml](File-src-mq3-renderer-noise-ml-139152771.md)
- `mq3/renderer/playable_dynamic_lights.ml` as `dynamicLights` → [src/mq3/renderer/playable_dynamic_lights.ml](File-src-mq3-renderer-playable-dynamic-lights-ml-229722941.md)
- `mq3/renderer/playable_fog.ml` as `playableFog` → [src/mq3/renderer/playable_fog.ml](File-src-mq3-renderer-playable-fog-ml-140703890.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/shader_parser.ml` as `shaderParser` → [src/mq3/renderer/shader_parser.ml](File-src-mq3-renderer-shader-parser-ml-2114769074.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-renderer-playable-world-batch-affinefor-function-affinefor-stage-nowmilliseconds-src-mq3-renderer-playable-world-batch-ml-1378956146"></a>
### affineFor

```ml
function affineFor(stage, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L270)

<a id="function-function-mq3-renderer-playable-world-batch-appendresolved-function-appendresolved-commands-triangle-baseslot-uselightmap-src-mq3-renderer-playable-world-batch-ml-925146760"></a>
### appendResolved

```ml
function appendResolved(commands, triangle, baseSlot, useLightmap)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — |  |
| `triangle` | `dynamic` | — |  |
| `baseSlot` | `dynamic` | — |  |
| `useLightmap` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L25)

<a id="function-function-mq3-renderer-playable-world-batch-applyaffine-function-applyaffine-transform-uv-src-mq3-renderer-playable-world-batch-ml-1308538849"></a>
### applyAffine

```ml
function applyAffine(transform, uv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `transform` | `dynamic` | — |  |
| `uv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L286)

<a id="function-function-mq3-renderer-playable-world-batch-attachdynamiclights-function-attachdynamiclights-batch-renderdata-receiveflags-catalog-src-mq3-renderer-playable-world-batch-ml-142044639"></a>
### attachDynamicLights

```ml
function attachDynamicLights(batch, renderData, receiveFlags, catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `renderData` | `dynamic` | — |  |
| `receiveFlags` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L260)

<a id="function-function-mq3-renderer-playable-world-batch-attachdynamiclightsoriented-function-attachdynamiclightsoriented-batch-renderdata-receiveflags-catalog-origins-axes-bounds-src-mq3-renderer-playable-world-batch-ml-1774947484"></a>
### attachDynamicLightsOriented

```ml
function attachDynamicLightsOriented(batch, renderData, receiveFlags, catalog, origins, axes, bounds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `renderData` | `dynamic` | — |  |
| `receiveFlags` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `origins` | `dynamic` | — |  |
| `axes` | `dynamic` | — |  |
| `bounds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L264)

<a id="function-function-mq3-renderer-playable-world-batch-attachfog-function-attachfog-batch-renderdata-catalog-src-mq3-renderer-playable-world-batch-ml-1408784339"></a>
### attachFog

```ml
function attachFog(batch, renderData, catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `renderData` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L251)

<a id="function-function-mq3-renderer-playable-world-batch-autosprite2quad-function-autosprite2quad-pass-triangleindex-forward-src-mq3-renderer-playable-world-batch-ml-1887203224"></a>
### autosprite2Quad

```ml
function autosprite2Quad(pass, triangleIndex, forward)
```

Autosprite2Deform keeps the long axis fixed and rotates only the two short edges toward the view. Source indexes preserve Quake's directed-edge test.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — |  |
| `triangleIndex` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L339)

<a id="function-function-mq3-renderer-playable-world-batch-autospritecorner-function-autospritecorner-triangleindex-vertex-src-mq3-renderer-playable-world-batch-ml-2072326998"></a>
### autospriteCorner

```ml
function autospriteCorner(triangleIndex, vertex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangleIndex` | `dynamic` | — |  |
| `vertex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L328)

<a id="function-function-mq3-renderer-playable-world-batch-autospritequad-function-autospritequad-pass-triangleindex-leftdir-updir-src-mq3-renderer-playable-world-batch-ml-1377053455"></a>
### autospriteQuad

```ml
function autospriteQuad(pass, triangleIndex, leftDir, upDir)
```

AutospriteDeform rebuilds each independent pair of triangles as one square whose left/up axes follow the view. BSP extraction expands indexes, so the four original corners are recovered from each consecutive triangle pair.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — |  |
| `triangleIndex` | `dynamic` | — |  |
| `leftDir` | `dynamic` | — |  |
| `upDir` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L316)

<a id="function-function-mq3-renderer-playable-world-batch-autospriteuv-function-autospriteuv-triangleindex-vertex-src-mq3-renderer-playable-world-batch-ml-1964574270"></a>
### autospriteUV

```ml
function autospriteUV(triangleIndex, vertex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangleIndex` | `dynamic` | — |  |
| `vertex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L332)

- [mq3.renderer.playable_world_batch.Batch](Type-mq3-renderer-playable-world-batch-batch-1905366517.md) — struct
<a id="function-function-mq3-renderer-playable-world-batch-build-function-build-renderdata-materialslots-skytextureflags-src-mq3-renderer-playable-world-batch-ml-13370115"></a>
### build

```ml
function build(renderData, materialSlots, skyTextureFlags)
```

Compatibility builder: byte layout and single submission remain unchanged.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — |  |
| `materialSlots` | `dynamic` | — |  |
| `skyTextureFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L33)

<a id="function-function-mq3-renderer-playable-world-batch-buildmaterials-function-buildmaterials-renderdata-catalog-skytextureflags-src-mq3-renderer-playable-world-batch-ml-930560880"></a>
### buildMaterials

```ml
function buildMaterials(renderData, catalog, skyTextureFlags)
```

Static opaque primaries stay in the bit-identical base stream. Dynamic and supported blended stages become retained passes with their source UVs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `skyTextureFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L159)

<a id="function-function-mq3-renderer-playable-world-batch-buildstagepass-function-buildstagepass-renderdata-material-stage-primary-depthequal-flags-src-mq3-renderer-playable-world-batch-ml-395295605"></a>
### buildStagePass

```ml
function buildStagePass(renderData, material, stage, primary, depthEqual, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — |  |
| `material` | `dynamic` | — |  |
| `stage` | `dynamic` | — |  |
| `primary` | `dynamic` | — |  |
| `depthEqual` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L152)

<a id="function-function-mq3-renderer-playable-world-batch-buildstagepasstriangles-function-buildstagepasstriangles-triangles-material-stage-primary-depthequal-src-mq3-renderer-playable-world-batch-ml-803340179"></a>
### buildStagePassTriangles

```ml
function buildStagePassTriangles(triangles, material, stage, primary, depthEqual)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangles` | `dynamic` | — |  |
| `material` | `dynamic` | — |  |
| `stage` | `dynamic` | — |  |
| `primary` | `dynamic` | — |  |
| `depthEqual` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L124)

<a id="function-function-mq3-renderer-playable-world-batch-contains-function-contains-values-wanted-src-mq3-renderer-playable-world-batch-ml-1460987507"></a>
### contains

```ml
function contains(values, wanted)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `wanted` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L50)

<a id="function-function-mq3-renderer-playable-world-batch-containsposition-function-containsposition-values-wanted-src-mq3-renderer-playable-world-batch-ml-679283887"></a>
### containsPosition

```ml
function containsPosition(values, wanted)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `wanted` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L290)

<a id="function-function-mq3-renderer-playable-world-batch-countstagetriangles-function-countstagetriangles-renderdata-textureindex-flags-src-mq3-renderer-playable-world-batch-ml-52229624"></a>
### countStageTriangles

```ml
function countStageTriangles(renderData, textureIndex, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — |  |
| `textureIndex` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L94)

<a id="function-function-mq3-renderer-playable-world-batch-createvertexcache-function-createvertexcache-sourceindexes-src-mq3-renderer-playable-world-batch-ml-148825539"></a>
### createVertexCache

```ml
function createVertexCache(sourceIndexes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sourceIndexes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L108)

<a id="function-function-mq3-renderer-playable-world-batch-deformednormal-function-deformednormal-position-normal-deforms-nowmilliseconds-noise-src-mq3-renderer-playable-world-batch-ml-564800094"></a>
### deformedNormal

```ml
function deformedNormal(position, normal, deforms, nowMilliseconds, noise)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `deforms` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `noise` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L387)

<a id="function-function-mq3-renderer-playable-world-batch-deformedposition-function-deformedposition-position-normal-uv-deforms-nowmilliseconds-src-mq3-renderer-playable-world-batch-ml-1390023845"></a>
### deformedPosition

```ml
function deformedPosition(position, normal, uv, deforms, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `uv` | `dynamic` | — |  |
| `deforms` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L371)

<a id="function-function-mq3-renderer-playable-world-batch-draw-function-draw-batch-projection-src-mq3-renderer-playable-world-batch-ml-1848115505"></a>
### draw

```ml
function draw(batch, projection)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L44)

<a id="function-function-mq3-renderer-playable-world-batch-drawmaterials-function-drawmaterials-batch-projection-nowmilliseconds-src-mq3-renderer-playable-world-batch-ml-1192077807"></a>
### drawMaterials

```ml
function drawMaterials(batch, projection, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L464)

<a id="function-function-mq3-renderer-playable-world-batch-drawmaterialslit-function-drawmaterialslit-batch-projection-nowmilliseconds-lights-src-mq3-renderer-playable-world-batch-ml-1546989170"></a>
### drawMaterialsLit

```ml
function drawMaterialsLit(batch, projection, nowMilliseconds, lights)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L463)

<a id="function-function-mq3-renderer-playable-world-batch-drawmaterialslittarget-function-drawmaterialslittarget-batch-projection-nowmilliseconds-lights-area-src-mq3-renderer-playable-world-batch-ml-776668523"></a>
### drawMaterialsLitTarget

```ml
function drawMaterialsLitTarget(batch, projection, nowMilliseconds, lights, area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L449)

<a id="function-function-mq3-renderer-playable-world-batch-drawmaterialslitviewport-function-drawmaterialslitviewport-batch-projection-nowmilliseconds-lights-area-src-mq3-renderer-playable-world-batch-ml-1054479403"></a>
### drawMaterialsLitViewport

```ml
function drawMaterialsLitViewport(batch, projection, nowMilliseconds, lights, area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L465)

<a id="function-function-mq3-renderer-playable-world-batch-drawmaterialsviewport-function-drawmaterialsviewport-batch-projection-nowmilliseconds-area-src-mq3-renderer-playable-world-batch-ml-1463560006"></a>
### drawMaterialsViewport

```ml
function drawMaterialsViewport(batch, projection, nowMilliseconds, area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L466)

<a id="function-function-mq3-renderer-playable-world-batch-dynamicmaterialstage-function-dynamicmaterialstage-material-stage-src-mq3-renderer-playable-world-batch-ml-1912916429"></a>
### dynamicMaterialStage

```ml
function dynamicMaterialStage(material, stage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `material` | `dynamic` | — |  |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L48)

<a id="function-function-mq3-renderer-playable-world-batch-dynamicstage-function-dynamicstage-stage-src-mq3-renderer-playable-world-batch-ml-1065626246"></a>
### dynamicStage

```ml
function dynamicStage(stage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L47)

<a id="function-function-mq3-renderer-playable-world-batch-edgevertices-function-edgevertices-index-src-mq3-renderer-playable-world-batch-ml-1571333844"></a>
### edgeVertices

```ml
function edgeVertices(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L333)

<a id="function-function-mq3-renderer-playable-world-batch-fail-function-fail-text-src-mq3-renderer-playable-world-batch-ml-1564841641"></a>
### fail

```ml
function fail(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L21)

<a id="function-function-mq3-renderer-playable-world-batch-groupedtriangles-function-groupedtriangles-renderdata-flags-count-src-mq3-renderer-playable-world-batch-ml-1779176292"></a>
### groupedTriangles

```ml
function groupedTriangles(renderData, flags, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L100)

<a id="function-function-mq3-renderer-playable-world-batch-hasdeform-function-hasdeform-deforms-kind-src-mq3-renderer-playable-world-batch-ml-1106879382"></a>
### hasDeform

```ml
function hasDeform(deforms, kind)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `deforms` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L289)

<a id="function-function-mq3-renderer-playable-world-batch-hasentitytranslate-function-hasentitytranslate-stage-src-mq3-renderer-playable-world-batch-ml-1921778762"></a>
### hasEntityTranslate

```ml
function hasEntityTranslate(stage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L288)

<a id="function-function-mq3-renderer-playable-world-batch-hasturbulence-function-hasturbulence-stage-src-mq3-renderer-playable-world-batch-ml-1090867404"></a>
### hasTurbulence

```ml
function hasTurbulence(stage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L287)

<a id="function-function-mq3-renderer-playable-world-batch-identityaffine-function-identityaffine-src-mq3-renderer-playable-world-batch-ml-296001038"></a>
### identityAffine

```ml
function identityAffine()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L269)

<a id="function-function-mq3-renderer-playable-world-batch-issky-function-issky-triangle-flags-src-mq3-renderer-playable-world-batch-ml-382614641"></a>
### isSky

```ml
function isSky(triangle, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L23)

- [mq3.renderer.playable_world_batch.MaterialBatch](Type-mq3-renderer-playable-world-batch-materialbatch-2042443654.md) — struct
<a id="function-function-mq3-renderer-playable-world-batch-materialfor-function-materialfor-catalog-textureindex-src-mq3-renderer-playable-world-batch-ml-1077792682"></a>
### materialFor

```ml
function materialFor(catalog, textureIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `textureIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L46)

<a id="function-function-mq3-renderer-playable-world-batch-materialtable-function-materialtable-renderdata-catalog-src-mq3-renderer-playable-world-batch-ml-53648789"></a>
### materialTable

```ml
function materialTable(renderData, catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L95)

<a id="function-function-mq3-renderer-playable-world-batch-materialusesbsplightmap-function-materialusesbsplightmap-material-src-mq3-renderer-playable-world-batch-ml-2086389251"></a>
### materialUsesBspLightmap

```ml
function materialUsesBspLightmap(material)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `material` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L49)

<a id="function-function-mq3-renderer-playable-world-batch-passchanges-function-passchanges-pass-fogcatalog-src-mq3-renderer-playable-world-batch-ml-1493992092"></a>
### passChanges

```ml
function passChanges(pass, fogCatalog)
```

A retained pass exists for render-state reasons as well as for changing vertex data.  Blend, alpha-test, clamp, depth and polygon-offset state do not require MiniLang to rewrite every vertex every frame.  Keep those command bytes until topology/source data changes; animated, view-dependent and fog-modulated passes continue through the exact Quake update path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L301)

<a id="function-function-mq3-renderer-playable-world-batch-passhasfog-function-passhasfog-pass-src-mq3-renderer-playable-world-batch-ml-516851215"></a>
### passHasFog

```ml
function passHasFog(pass)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L291)

<a id="function-function-mq3-renderer-playable-world-batch-refreshmaterials-function-refreshmaterials-batch-renderdata-catalog-skytextureflags-src-mq3-renderer-playable-world-batch-ml-1495440422"></a>
### refreshMaterials

```ml
function refreshMaterials(batch, renderData, catalog, skyTextureFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `renderData` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `skyTextureFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L221)

<a id="function-function-mq3-renderer-playable-world-batch-refreshstagepass-function-refreshstagepass-pass-renderdata-src-mq3-renderer-playable-world-batch-ml-2061349663"></a>
### refreshStagePass

```ml
function refreshStagePass(pass, renderData)
```

Refreshes a retained material batch when triangle/material topology is unchanged.  The byte buffers and nested source arrays keep their storage; callers fall back to buildMaterials when this returns false.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — |  |
| `renderData` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L200)

<a id="function-function-mq3-renderer-playable-world-batch-releasematerials-function-releasematerials-catalog-src-mq3-renderer-playable-world-batch-ml-1958158671"></a>
### releaseMaterials

```ml
function releaseMaterials(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L82)

<a id="function-function-mq3-renderer-playable-world-batch-resolvedlightmapslot-function-resolvedlightmapslot-triangle-src-mq3-renderer-playable-world-batch-ml-52268542"></a>
### resolvedLightmapSlot

```ml
function resolvedLightmapSlot(triangle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L24)

<a id="function-function-mq3-renderer-playable-world-batch-sortedmaterials-function-sortedmaterials-values-src-mq3-renderer-playable-world-batch-ml-1548489570"></a>
### sortedMaterials

```ml
function sortedMaterials(values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L51)

<a id="function-function-mq3-renderer-playable-world-batch-specularalpha-function-specularalpha-position-normal-vieworigin-src-mq3-renderer-playable-world-batch-ml-514220667"></a>
### specularAlpha

```ml
function specularAlpha(position, normal, viewOrigin)
```

RB_CalcSpecularAlpha keeps this hard-coded light origin in the original renderer and raises the reflected view coefficient to the fourth power.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L403)

- [mq3.renderer.playable_world_batch.StagePass](Type-mq3-renderer-playable-world-batch-stagepass-972420306.md) — struct
<a id="function-function-mq3-renderer-playable-world-batch-updatepass-function-updatepass-pass-nowmilliseconds-src-mq3-renderer-playable-world-batch-ml-1332761149"></a>
### updatePass

```ml
function updatePass(pass, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L448)

<a id="function-function-mq3-renderer-playable-world-batch-updatepassaxes-function-updatepassaxes-pass-vieworigin-leftdir-updir-nowmilliseconds-src-mq3-renderer-playable-world-batch-ml-609918520"></a>
### updatePassAxes

```ml
function updatePassAxes(pass, viewOrigin, leftDir, upDir, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `leftDir` | `dynamic` | — |  |
| `upDir` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L446)

<a id="function-function-mq3-renderer-playable-world-batch-updatepassaxesfog-function-updatepassaxesfog-pass-vieworigin-leftdir-updir-nowmilliseconds-fogcatalog-src-mq3-renderer-playable-world-batch-ml-2048888017"></a>
### updatePassAxesFog

```ml
function updatePassAxesFog(pass, viewOrigin, leftDir, upDir, nowMilliseconds, fogCatalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `leftDir` | `dynamic` | — |  |
| `upDir` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L409)

<a id="function-function-mq3-renderer-playable-world-batch-updatepassview-function-updatepassview-pass-vieworigin-nowmilliseconds-src-mq3-renderer-playable-world-batch-ml-64007940"></a>
### updatePassView

```ml
function updatePassView(pass, viewOrigin, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L447)

<a id="function-function-mq3-renderer-playable-world-batch-uploadmaterials-function-uploadmaterials-catalog-src-mq3-renderer-playable-world-batch-ml-1474389197"></a>
### uploadMaterials

```ml
function uploadMaterials(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L63)

- [mq3.renderer.playable_world_batch.UvAffine](Type-mq3-renderer-playable-world-batch-uvaffine-1068578019.md) — struct
- [mq3.renderer.playable_world_batch.VertexCache](Type-mq3-renderer-playable-world-batch-vertexcache-993990901.md) — struct
<a id="function-function-mq3-renderer-playable-world-batch-vertexlight-function-vertexlight-vertex-src-mq3-renderer-playable-world-batch-ml-21699612"></a>
### vertexLight

```ml
function vertexLight(vertex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L22)
