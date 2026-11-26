# `src/mq3/renderer/tr_bsp_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_bsp_runtime`](Package-mq3-renderer-tr-bsp-runtime-537185538.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/bsp.ml` as `bsp` → [src/mq3/format/bsp.ml](File-src-mq3-format-bsp-ml-526613882.md)
- `mq3/renderer/bsp_render_data.ml` as `render` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)
- `mq3/renderer/patch_stitch.ml` as `patchStitch` → [src/mq3/renderer/patch_stitch.ml](File-src-mq3-renderer-patch-stitch-ml-2036325899.md)
- `mq3/renderer/playable_flares.ml` as `playableFlares` → [src/mq3/renderer/playable_flares.ml](File-src-mq3-renderer-playable-flares-ml-2125885383.md)
- `mq3/renderer/playable_fog.ml` as `playableFog` → [src/mq3/renderer/playable_fog.ml](File-src-mq3-renderer-playable-fog-ml-140703890.md)
- `mq3/renderer/playable_light_grid.ml` as `lightGrid` → [src/mq3/renderer/playable_light_grid.ml](File-src-mq3-renderer-playable-light-grid-ml-1846122219.md)
- `mq3/renderer/qvm_scene_geometry.ml` as `sceneGeometry` → [src/mq3/renderer/qvm_scene_geometry.ml](File-src-mq3-renderer-qvm-scene-geometry-ml-51177627.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-tr-bsp-runtime-abs-function-abs-value-src-mq3-renderer-tr-bsp-runtime-ml-194890393"></a>
### abs

```ml
function abs(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L43)

<a id="function-function-mq3-renderer-tr-bsp-runtime-basename-function-basename-path-src-mq3-renderer-tr-bsp-runtime-ml-748872135"></a>
### basename

```ml
function basename(path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L46)

<a id="constant-constant-mq3-renderer-tr-bsp-runtime-contents-node-const-contents-node-1-src-mq3-renderer-tr-bsp-runtime-ml-448751015"></a>
### CONTENTS_NODE

```ml
const CONTENTS_NODE = -1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L22)

<a id="function-function-mq3-renderer-tr-bsp-runtime-createstate-function-createstate-src-mq3-renderer-tr-bsp-runtime-ml-549652534"></a>
### createState

```ml
function createState()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L39)

<a id="function-function-mq3-renderer-tr-bsp-runtime-f32-function-f32-map-offset-src-mq3-renderer-tr-bsp-runtime-ml-806715183"></a>
### f32

```ml
function f32(map, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L41)

<a id="function-function-mq3-renderer-tr-bsp-runtime-fail-function-fail-text-src-mq3-renderer-tr-bsp-runtime-ml-861428431"></a>
### fail

```ml
function fail(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L38)

- [mq3.renderer.tr_bsp_runtime.Grid](Type-mq3-renderer-tr-bsp-runtime-grid-406766564.md) — struct
<a id="function-function-mq3-renderer-tr-bsp-runtime-hsvtorgb-function-hsvtorgb-h-s-v-src-mq3-renderer-tr-bsp-runtime-ml-1405745009"></a>
### HSVtoRGB

```ml
function HSVtoRGB(h, s, v)
```

Exact tr_bsp.c six-sector HSV development-lightmap conversion.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — |  |
| `s` | `dynamic` | — |  |
| `v` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L59)

<a id="function-function-mq3-renderer-tr-bsp-runtime-i32-function-i32-map-offset-src-mq3-renderer-tr-bsp-runtime-ml-671524025"></a>
### i32

```ml
function i32(map, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L40)

<a id="constant-constant-mq3-renderer-tr-bsp-runtime-lightmap-by-vertex-const-lightmap-by-vertex-3-src-mq3-renderer-tr-bsp-runtime-ml-2140124617"></a>
### LIGHTMAP_BY_VERTEX

```ml
const LIGHTMAP_BY_VERTEX = -3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L23)

<a id="constant-constant-mq3-renderer-tr-bsp-runtime-lightmap-none-const-lightmap-none-1-src-mq3-renderer-tr-bsp-runtime-ml-613235079"></a>
### LIGHTMAP_NONE

```ml
const LIGHTMAP_NONE = -1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L25)

<a id="constant-constant-mq3-renderer-tr-bsp-runtime-lightmap-whiteimage-const-lightmap-whiteimage-2-src-mq3-renderer-tr-bsp-runtime-ml-1442244292"></a>
### LIGHTMAP_WHITEIMAGE

```ml
const LIGHTMAP_WHITEIMAGE = -2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L24)

<a id="constant-constant-mq3-renderer-tr-bsp-runtime-max-grid-size-const-max-grid-size-65-src-mq3-renderer-tr-bsp-runtime-ml-939646118"></a>
### MAX_GRID_SIZE

```ml
const MAX_GRID_SIZE = 65
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L26)

- [mq3.renderer.tr_bsp_runtime.Model](Type-mq3-renderer-tr-bsp-runtime-model-2135241169.md) — struct
<a id="constant-constant-mq3-renderer-tr-bsp-runtime-mst-flare-const-mst-flare-4-src-mq3-renderer-tr-bsp-runtime-ml-1318233097"></a>
### MST_FLARE

```ml
const MST_FLARE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L21)

<a id="constant-constant-mq3-renderer-tr-bsp-runtime-mst-patch-const-mst-patch-2-src-mq3-renderer-tr-bsp-runtime-ml-373143915"></a>
### MST_PATCH

```ml
const MST_PATCH = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L19)

<a id="constant-constant-mq3-renderer-tr-bsp-runtime-mst-planar-const-mst-planar-1-src-mq3-renderer-tr-bsp-runtime-ml-266375840"></a>
### MST_PLANAR

```ml
const MST_PLANAR = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L18)

<a id="constant-constant-mq3-renderer-tr-bsp-runtime-mst-triangle-soup-const-mst-triangle-soup-3-src-mq3-renderer-tr-bsp-runtime-ml-856686262"></a>
### MST_TRIANGLE_SOUP

```ml
const MST_TRIANGLE_SOUP = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L20)

<a id="function-function-mq3-renderer-tr-bsp-runtime-nameat-function-nameat-map-offset-capacity-src-mq3-renderer-tr-bsp-runtime-ml-451389057"></a>
### nameAt

```ml
function nameAt(map, offset, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L42)

<a id="function-function-mq3-renderer-tr-bsp-runtime-nearpoint-function-nearpoint-a-b-tolerance-src-mq3-renderer-tr-bsp-runtime-ml-1628391854"></a>
### nearPoint

```ml
function nearPoint(a, b, tolerance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `tolerance` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L44)

- [mq3.renderer.tr_bsp_runtime.Node](Type-mq3-renderer-tr-bsp-runtime-node-223640768.md) — struct
<a id="function-function-mq3-renderer-tr-bsp-runtime-parseface-function-parseface-world-index-src-mq3-renderer-tr-bsp-runtime-ml-926190248"></a>
### ParseFace

```ml
function ParseFace(world, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L110)

<a id="function-function-mq3-renderer-tr-bsp-runtime-parseflare-function-parseflare-world-index-src-mq3-renderer-tr-bsp-runtime-ml-62053284"></a>
### ParseFlare

```ml
function ParseFlare(world, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L113)

<a id="function-function-mq3-renderer-tr-bsp-runtime-parsegeometry-function-parsegeometry-world-index-expectedkind-lightmapoverride-src-mq3-renderer-tr-bsp-runtime-ml-1308587542"></a>
### parseGeometry

```ml
function parseGeometry(world, index, expectedKind, lightmapOverride)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `expectedKind` | `dynamic` | — |  |
| `lightmapOverride` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L104)

<a id="function-function-mq3-renderer-tr-bsp-runtime-parsemesh-function-parsemesh-world-index-src-mq3-renderer-tr-bsp-runtime-ml-1756951264"></a>
### ParseMesh

```ml
function ParseMesh(world, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L111)

<a id="function-function-mq3-renderer-tr-bsp-runtime-parsetrisurf-function-parsetrisurf-world-index-src-mq3-renderer-tr-bsp-runtime-ml-134026484"></a>
### ParseTriSurf

```ml
function ParseTriSurf(world, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L112)

<a id="function-function-mq3-renderer-tr-bsp-runtime-patch-function-patch-world-index-src-mq3-renderer-tr-bsp-runtime-ml-1500667416"></a>
### patch

```ml
function patch(world, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L118)

- [mq3.renderer.tr_bsp_runtime.Plane](Type-mq3-renderer-tr-bsp-runtime-plane-1475956598.md) — struct
<a id="function-function-mq3-renderer-tr-bsp-runtime-planetype-function-planetype-normal-src-mq3-renderer-tr-bsp-runtime-ml-455208807"></a>
### planeType

```ml
function planeType(normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L45)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-colorshiftlightingbytes-function-r-colorshiftlightingbytes-input-shift-src-mq3-renderer-tr-bsp-runtime-ml-765324234"></a>
### R_ColorShiftLightingBytes

```ml
function R_ColorShiftLightingBytes(input, shift)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `shift` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L64)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-fixsharedvertexloderror-function-r-fixsharedvertexloderror-grids-src-mq3-renderer-tr-bsp-runtime-ml-215881697"></a>
### R_FixSharedVertexLodError

```ml
function R_FixSharedVertexLodError(grids)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grids` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L181)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-fixsharedvertexloderror-r-function-r-fixsharedvertexloderror-r-grids-start-grid-src-mq3-renderer-tr-bsp-runtime-ml-1201443437"></a>
### R_FixSharedVertexLodError_r

```ml
function R_FixSharedVertexLodError_r(grids, start, grid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grids` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L180)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-getentitytoken-function-r-getentitytoken-world-size-src-mq3-renderer-tr-bsp-runtime-ml-139238013"></a>
### R_GetEntityToken

```ml
function R_GetEntityToken(world, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L168)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadentities-function-r-loadentities-world-src-mq3-renderer-tr-bsp-runtime-ml-226588296"></a>
### R_LoadEntities

```ml
function R_LoadEntities(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L165)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadfogs-function-r-loadfogs-map-shaderindex-src-mq3-renderer-tr-bsp-runtime-ml-736638437"></a>
### R_LoadFogs

```ml
function R_LoadFogs(map, shaderIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `shaderIndex` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L162)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadlightgrid-function-r-loadlightgrid-map-src-mq3-renderer-tr-bsp-runtime-ml-355707300"></a>
### R_LoadLightGrid

```ml
function R_LoadLightGrid(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L163)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadlightmaps-function-r-loadlightmaps-map-mapoverbrightbits-rendereroverbrightbits-debugintensity-src-mq3-renderer-tr-bsp-runtime-ml-781094683"></a>
### R_LoadLightmaps

```ml
function R_LoadLightmaps(map, mapOverbrightBits, rendererOverbrightBits, debugIntensity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `mapOverbrightBits` | `dynamic` | — |  |
| `rendererOverbrightBits` | `dynamic` | — |  |
| `debugIntensity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L68)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadmarksurfaces-function-r-loadmarksurfaces-map-src-mq3-renderer-tr-bsp-runtime-ml-1822229846"></a>
### R_LoadMarksurfaces

```ml
function R_LoadMarksurfaces(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L144)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadnodesandleafs-function-r-loadnodesandleafs-map-src-mq3-renderer-tr-bsp-runtime-ml-148686958"></a>
### R_LoadNodesAndLeafs

```ml
function R_LoadNodesAndLeafs(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L151)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadplanes-function-r-loadplanes-map-src-mq3-renderer-tr-bsp-runtime-ml-1004254614"></a>
### R_LoadPlanes

```ml
function R_LoadPlanes(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L139)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadshaders-function-r-loadshaders-map-src-mq3-renderer-tr-bsp-runtime-ml-1093697096"></a>
### R_LoadShaders

```ml
function R_LoadShaders(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L90)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadsubmodels-function-r-loadsubmodels-world-src-mq3-renderer-tr-bsp-runtime-ml-904621630"></a>
### R_LoadSubmodels

```ml
function R_LoadSubmodels(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L157)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadsurfaces-function-r-loadsurfaces-world-src-mq3-renderer-tr-bsp-runtime-ml-2138941328"></a>
### R_LoadSurfaces

```ml
function R_LoadSurfaces(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L119)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadvisibility-function-r-loadvisibility-map-numclusters-externalvisdata-src-mq3-renderer-tr-bsp-runtime-ml-860882360"></a>
### R_LoadVisibility

```ml
function R_LoadVisibility(map, numClusters, externalVisData)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `numClusters` | `dynamic` | — |  |
| `externalVisData` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L83)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-mergedheightpoints-function-r-mergedheightpoints-grid-offset-src-mq3-renderer-tr-bsp-runtime-ml-347344115"></a>
### R_MergedHeightPoints

```ml
function R_MergedHeightPoints(grid, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L177)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-mergedwidthpoints-function-r-mergedwidthpoints-grid-offset-src-mq3-renderer-tr-bsp-runtime-ml-177230375"></a>
### R_MergedWidthPoints

```ml
function R_MergedWidthPoints(grid, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L174)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-movepatchsurfacestohunk-function-r-movepatchsurfacestohunk-grids-src-mq3-renderer-tr-bsp-runtime-ml-1457952159"></a>
### R_MovePatchSurfacesToHunk

```ml
function R_MovePatchSurfacesToHunk(grids)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grids` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L184)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-setparent-function-r-setparent-nodes-index-parent-src-mq3-renderer-tr-bsp-runtime-ml-1883934453"></a>
### R_SetParent

```ml
function R_SetParent(nodes, index, parent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `nodes` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `parent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L147)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-stitchallpatches-function-r-stitchallpatches-grids-src-mq3-renderer-tr-bsp-runtime-ml-2041408005"></a>
### R_StitchAllPatches

```ml
function R_StitchAllPatches(grids)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grids` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L183)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-stitchpatches-function-r-stitchpatches-grid1-grid2-src-mq3-renderer-tr-bsp-runtime-ml-595612687"></a>
### R_StitchPatches

```ml
function R_StitchPatches(grid1, grid2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid1` | `dynamic` | — |  |
| `grid2` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L182)

<a id="function-function-mq3-renderer-tr-bsp-runtime-re-loadworldmap-function-re-loadworldmap-state-name-data-shaderindex-src-mq3-renderer-tr-bsp-runtime-ml-1060394389"></a>
### RE_LoadWorldMap

```ml
function RE_LoadWorldMap(state, name, data, shaderIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `shaderIndex` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L186)

<a id="function-function-mq3-renderer-tr-bsp-runtime-re-setworldvisdata-function-re-setworldvisdata-state-vis-src-mq3-renderer-tr-bsp-runtime-ml-1578561549"></a>
### RE_SetWorldVisData

```ml
function RE_SetWorldVisData(state, vis)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `vis` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L82)

<a id="function-function-mq3-renderer-tr-bsp-runtime-samelodgroup-function-samelodgroup-a-b-src-mq3-renderer-tr-bsp-runtime-ml-70825987"></a>
### sameLodGroup

```ml
function sameLodGroup(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L173)

- [mq3.renderer.tr_bsp_runtime.Shader](Type-mq3-renderer-tr-bsp-runtime-shader-1371725973.md) — struct
<a id="function-function-mq3-renderer-tr-bsp-runtime-shaderforshadernum-function-shaderforshadernum-world-shadernum-lightmapnum-src-mq3-renderer-tr-bsp-runtime-ml-886658415"></a>
### ShaderForShaderNum

```ml
function ShaderForShaderNum(world, shaderNum, lightmapNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `shaderNum` | `dynamic` | — |  |
| `lightmapNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L95)

- [mq3.renderer.tr_bsp_runtime.State](Type-mq3-renderer-tr-bsp-runtime-state-1447583673.md) — struct
- [mq3.renderer.tr_bsp_runtime.Surface](Type-mq3-renderer-tr-bsp-runtime-surface-696433887.md) — struct
<a id="function-function-mq3-renderer-tr-bsp-runtime-surfaceinfo-function-surfaceinfo-world-index-src-mq3-renderer-tr-bsp-runtime-ml-1452664610"></a>
### surfaceInfo

```ml
function surfaceInfo(world, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L100)

- [mq3.renderer.tr_bsp_runtime.Visibility](Type-mq3-renderer-tr-bsp-runtime-visibility-987638648.md) — struct
- [mq3.renderer.tr_bsp_runtime.World](Type-mq3-renderer-tr-bsp-runtime-world-292307360.md) — struct
