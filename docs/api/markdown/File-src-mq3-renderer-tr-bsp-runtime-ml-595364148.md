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

Returns `value` from `mq3.renderer.tr_bsp_runtime.abs`; earlier branches return `0.0-value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input tested by `value<0.0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L67)

<a id="function-function-mq3-renderer-tr-bsp-runtime-basename-function-basename-path-src-mq3-renderer-tr-bsp-runtime-ml-748872135"></a>
### basename

```ml
function basename(path)
```

Computes `basename` from `decode(slice(data,start,dot-start))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L78)

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

Constructs `mq3.renderer.tr_bsp_runtime.State` with `worldMapLoaded` = `false`, `externalVisData` = `void`, `world` = `void`, `sunDirection` = `[3.0/7.0,2.0/7.0,6.0/7.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L51)

<a id="function-function-mq3-renderer-tr-bsp-runtime-f32-function-f32-map-offset-src-mq3-renderer-tr-bsp-runtime-ml-806715183"></a>
### f32

```ml
function f32(map, offset)
```

Returns `n.bitsFloat(value)` from `mq3.renderer.tr_bsp_runtime.f32`; earlier branches return `fail("truncated float")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.readU32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L59)

<a id="function-function-mq3-renderer-tr-bsp-runtime-fail-function-fail-text-src-mq3-renderer-tr-bsp-runtime-ml-861428431"></a>
### fail

```ml
function fail(text)
```

Creates error `7710` with message `"tr_bsp: "+text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Input used in the result expression `error(7710,"tr_bsp: "+text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L49)

- [mq3.renderer.tr_bsp_runtime.Grid](Type-mq3-renderer-tr-bsp-runtime-grid-406766564.md) — struct
<a id="function-function-mq3-renderer-tr-bsp-runtime-hsvtorgb-function-hsvtorgb-h-s-v-src-mq3-renderer-tr-bsp-runtime-ml-1405745009"></a>
### HSVtoRGB

```ml
function HSVtoRGB(h, s, v)
```

Exact tr_bsp.c six-sector HSV development-lightmap conversion.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — | Input used by `scaled=h*5.0`. |
| `s` | `dynamic` | — | Input used by `p=v*(1.0-s)`. |
| `v` | `dynamic` | — | Input used by `p=v*(1.0-s)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L94)

<a id="function-function-mq3-renderer-tr-bsp-runtime-i32-function-i32-map-offset-src-mq3-renderer-tr-bsp-runtime-ml-671524025"></a>
### i32

```ml
function i32(map, offset)
```

Returns `value` from `mq3.renderer.tr_bsp_runtime.i32`; earlier branches return `fail("truncated integer")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.readI32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L55)

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

Returns `decode(slice(map.data,offset,count))` from `mq3.renderer.tr_bsp_runtime.nameAt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `slice`. |
| `capacity` | `dynamic` | — | Input used by `while count<capacity and map.data[offset+count]!=0 count=count+1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L64)

<a id="function-function-mq3-renderer-tr-bsp-runtime-nearpoint-function-nearpoint-a-b-tolerance-src-mq3-renderer-tr-bsp-runtime-ml-1628391854"></a>
### nearPoint

```ml
function nearPoint(a, b, tolerance)
```

Computes `abs(a[0]-b[0])<=tolerance and abs(a[1]-b[1])<=tolerance and abs(a[2]-b[2])<=tolerance` for `mq3.renderer.tr_bsp_runtime.nearPoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `tolerance` | `dynamic` | — | Input used in the result expression `abs(a[0]-b[0])<=tolerance and abs(a[1]-b[1])<=tolerance and abs(a[2]-b[2])<=tolerance`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L72)

- [mq3.renderer.tr_bsp_runtime.Node](Type-mq3-renderer-tr-bsp-runtime-node-223640768.md) — struct
<a id="function-function-mq3-renderer-tr-bsp-runtime-parseface-function-parseface-world-index-src-mq3-renderer-tr-bsp-runtime-ml-926190248"></a>
### ParseFace

```ml
function ParseFace(world, index)
```

Calls `mq3.renderer.tr_bsp_runtime.parseGeometry` with `(world,index,MST_PLANAR,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Value forwarded as `world` to `mq3.renderer.tr_bsp_runtime.parseGeometry`. |
| `index` | `dynamic` | — | Value forwarded as `index` to `mq3.renderer.tr_bsp_runtime.parseGeometry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L177)

<a id="function-function-mq3-renderer-tr-bsp-runtime-parseflare-function-parseflare-world-index-src-mq3-renderer-tr-bsp-runtime-ml-62053284"></a>
### ParseFlare

```ml
function ParseFlare(world, index)
```

Builds `mq3.renderer.tr_bsp_runtime.Surface` using `mq3.renderer.playable_flares.parse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record providing `world.map`. |
| `index` | `dynamic` | — | Initial value for `mq3.renderer.tr_bsp_runtime.Surface.index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L189)

<a id="function-function-mq3-renderer-tr-bsp-runtime-parsegeometry-function-parsegeometry-world-index-expectedkind-lightmapoverride-src-mq3-renderer-tr-bsp-runtime-ml-1308587542"></a>
### parseGeometry

```ml
function parseGeometry(world, index, expectedKind, lightmapOverride)
```

Builds `mq3.renderer.tr_bsp_runtime.Surface` using `mq3.renderer.bsp_render_data.extractWithPatchError`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record providing `world.map`. |
| `index` | `dynamic` | — | Initial value for `mq3.renderer.tr_bsp_runtime.Surface.index`. |
| `expectedKind` | `dynamic` | — | Input tested by `info[2]!=expectedKind`. |
| `lightmapOverride` | `dynamic` | — | Input used by `lightmap=lightmapOverride`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L168)

<a id="function-function-mq3-renderer-tr-bsp-runtime-parsemesh-function-parsemesh-world-index-src-mq3-renderer-tr-bsp-runtime-ml-1756951264"></a>
### ParseMesh

```ml
function ParseMesh(world, index)
```

Calls `mq3.renderer.tr_bsp_runtime.parseGeometry` with `(world,index,MST_PATCH,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Value forwarded as `world` to `mq3.renderer.tr_bsp_runtime.parseGeometry`. |
| `index` | `dynamic` | — | Value forwarded as `index` to `mq3.renderer.tr_bsp_runtime.parseGeometry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L181)

<a id="function-function-mq3-renderer-tr-bsp-runtime-parsetrisurf-function-parsetrisurf-world-index-src-mq3-renderer-tr-bsp-runtime-ml-134026484"></a>
### ParseTriSurf

```ml
function ParseTriSurf(world, index)
```

Calls `mq3.renderer.tr_bsp_runtime.parseGeometry` with `(world,index,MST_TRIANGLE_SOUP,LIGHTMAP_BY_VERTEX)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Value forwarded as `world` to `mq3.renderer.tr_bsp_runtime.parseGeometry`. |
| `index` | `dynamic` | — | Value forwarded as `index` to `mq3.renderer.tr_bsp_runtime.parseGeometry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L185)

<a id="function-function-mq3-renderer-tr-bsp-runtime-patch-function-patch-world-index-src-mq3-renderer-tr-bsp-runtime-ml-1500667416"></a>
### patch

```ml
function patch(world, index)
```

Calls `mq3.renderer.tr_bsp_runtime.ParseMesh` with `(world,index)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Value forwarded as `world` to `mq3.renderer.tr_bsp_runtime.ParseMesh`. |
| `index` | `dynamic` | — | Value forwarded as `index` to `mq3.renderer.tr_bsp_runtime.ParseMesh`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L197)

- [mq3.renderer.tr_bsp_runtime.Plane](Type-mq3-renderer-tr-bsp-runtime-plane-1475956598.md) — struct
<a id="function-function-mq3-renderer-tr-bsp-runtime-planetype-function-planetype-normal-src-mq3-renderer-tr-bsp-runtime-ml-455208807"></a>
### planeType

```ml
function planeType(normal)
```

Returns `3` from `mq3.renderer.tr_bsp_runtime.planeType`; earlier branches return `axis`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Indexed input read at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L75)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-colorshiftlightingbytes-function-r-colorshiftlightingbytes-input-shift-src-mq3-renderer-tr-bsp-runtime-ml-765324234"></a>
### R_ColorShiftLightingBytes

```ml
function R_ColorShiftLightingBytes(input, shift)
```

Computes `R_ColorShiftLightingBytes` from `[shifted[0],shifted[1],shifted[2],alpha]` using `mq3.renderer.bsp_render_data.colorShiftLighting`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `shift` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.bsp_render_data.colorShiftLighting`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L102)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-fixsharedvertexloderror-function-r-fixsharedvertexloderror-grids-src-mq3-renderer-tr-bsp-runtime-ml-215881697"></a>
### R_FixSharedVertexLodError

```ml
function R_FixSharedVertexLodError(grids)
```

Calls `mq3.renderer.patch_stitch.R_FixSharedVertexLodError` with `(grids)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grids` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.patch_stitch.R_FixSharedVertexLodError`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L299)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-fixsharedvertexloderror-r-function-r-fixsharedvertexloderror-r-grids-start-grid-src-mq3-renderer-tr-bsp-runtime-ml-1201443437"></a>
### R_FixSharedVertexLodError_r

```ml
function R_FixSharedVertexLodError_r(grids, start, grid)
```

Calls `mq3.renderer.patch_stitch.R_FixSharedVertexLodError_r` with `(grids,start,grid)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grids` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.patch_stitch.R_FixSharedVertexLodError_r`. |
| `start` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.patch_stitch.R_FixSharedVertexLodError_r`. |
| `grid` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.patch_stitch.R_FixSharedVertexLodError_r`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L296)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-getentitytoken-function-r-getentitytoken-world-size-src-mq3-renderer-tr-bsp-runtime-ml-139238013"></a>
### R_GetEntityToken

```ml
function R_GetEntityToken(world, size)
```

Updates `world.entityParser` in `mq3.renderer.tr_bsp_runtime.R_GetEntityToken`; returns `[true,decode(data)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Mutable record or buffer; this call updates `world.entityParser`. |
| `size` | `dynamic` | — | Input tested by `world==void or world.entityParser==void or size<=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L271)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadentities-function-r-loadentities-world-src-mq3-renderer-tr-bsp-runtime-ml-226588296"></a>
### R_LoadEntities

```ml
function R_LoadEntities(world)
```

Updates `world.entities`, `world.entityParser` in `mq3.renderer.tr_bsp_runtime.R_LoadEntities`; returns `lightGrid.worldGridSize(world.map)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Mutable record or buffer; this call updates `world.entities`, `world.entityParser`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L265)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadfogs-function-r-loadfogs-map-shaderindex-src-mq3-renderer-tr-bsp-runtime-ml-736638437"></a>
### R_LoadFogs

```ml
function R_LoadFogs(map, shaderIndex)
```

Computes `R_LoadFogs` from `playableFog.load(map,shaderIndex)` using `mq3.renderer.playable_fog.Catalog`, `mq3.renderer.playable_fog.textureImage`, `mq3.renderer.playable_fog.load`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`. |
| `shaderIndex` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_fog.load`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L258)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadlightgrid-function-r-loadlightgrid-map-src-mq3-renderer-tr-bsp-runtime-ml-355707300"></a>
### R_LoadLightGrid

```ml
function R_LoadLightGrid(map)
```

Calls `mq3.renderer.playable_light_grid.load` with `(map)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_light_grid.load`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L261)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadlightmaps-function-r-loadlightmaps-map-mapoverbrightbits-rendereroverbrightbits-debugintensity-src-mq3-renderer-tr-bsp-runtime-ml-781094683"></a>
### R_LoadLightmaps

```ml
function R_LoadLightmaps(map, mapOverbrightBits, rendererOverbrightBits, debugIntensity)
```

Builds `rgba[pixel*4]`, `rgba[pixel*4+1]`, `rgba[pixel*4+2]` in `mq3.renderer.tr_bsp_runtime.R_LoadLightmaps`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`. |
| `mapOverbrightBits` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.bsp_render_data.lightmapRgbaShift`. |
| `rendererOverbrightBits` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.bsp_render_data.lightmapRgbaShift`. |
| `debugIntensity` | `dynamic` | — | Input tested by `debugIntensity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L111)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadmarksurfaces-function-r-loadmarksurfaces-map-src-mq3-renderer-tr-bsp-runtime-ml-1822229846"></a>
### R_LoadMarksurfaces

```ml
function R_LoadMarksurfaces(map)
```

Returns `result` from `mq3.renderer.tr_bsp_runtime.R_LoadMarksurfaces`; earlier branches return `fail("marksurface outside surface array")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`, `map.offsets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L229)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadnodesandleafs-function-r-loadnodesandleafs-map-src-mq3-renderer-tr-bsp-runtime-ml-148686958"></a>
### R_LoadNodesAndLeafs

```ml
function R_LoadNodesAndLeafs(map)
```

Builds one indexed BSP node/leaf array and converts negative child encodings into leaf indices.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`, `map.offsets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L242)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadplanes-function-r-loadplanes-map-src-mq3-renderer-tr-bsp-runtime-ml-1004254614"></a>
### R_LoadPlanes

```ml
function R_LoadPlanes(map)
```

Loads BSP plane normals/distances and derives axial plane types and normal sign bits.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`, `map.offsets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L222)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadshaders-function-r-loadshaders-map-src-mq3-renderer-tr-bsp-runtime-ml-1093697096"></a>
### R_LoadShaders

```ml
function R_LoadShaders(map)
```

Returns `values` from `mq3.renderer.tr_bsp_runtime.R_LoadShaders`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`, `map.offsets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L142)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadsubmodels-function-r-loadsubmodels-world-src-mq3-renderer-tr-bsp-runtime-ml-904621630"></a>
### R_LoadSubmodels

```ml
function R_LoadSubmodels(world)
```

Loads inline brush-model geometry and associates each submodel with its BSP surface range and bounds.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record providing `world.map`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L250)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadsurfaces-function-r-loadsurfaces-world-src-mq3-renderer-tr-bsp-runtime-ml-2138941328"></a>
### R_LoadSurfaces

```ml
function R_LoadSurfaces(world)
```

Decodes every BSP surface by planar, patch, triangle-soup, or flare type and rejects unknown kinds.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record providing `world.map`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L200)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-loadvisibility-function-r-loadvisibility-map-numclusters-externalvisdata-src-mq3-renderer-tr-bsp-runtime-ml-860882360"></a>
### R_LoadVisibility

```ml
function R_LoadVisibility(map, numClusters, externalVisData)
```

Builds `mq3.renderer.tr_bsp_runtime.Visibility` for `mq3.renderer.tr_bsp_runtime.R_LoadVisibility`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.lengths`, `map.offsets`, `map.data`. |
| `numClusters` | `dynamic` | — | Initial value for `mq3.renderer.tr_bsp_runtime.Visibility.numClusters`. |
| `externalVisData` | `dynamic` | — | Input used by `data=externalVisData`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L133)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-mergedheightpoints-function-r-mergedheightpoints-grid-offset-src-mq3-renderer-tr-bsp-runtime-ml-347344115"></a>
### R_MergedHeightPoints

```ml
function R_MergedHeightPoints(grid, offset)
```

Detects nearly coincident interior points along one patch-grid column using a 0.1-unit tolerance.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record providing `grid.height`, `grid.control`, `grid.width`. |
| `offset` | `dynamic` | — | Input used by `while j<grid.height-1 if nearPoint(grid.control[offset+i*grid.width].position,grid.control[offset+j*grid.width].position,0.1) then return true`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L289)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-mergedwidthpoints-function-r-mergedwidthpoints-grid-offset-src-mq3-renderer-tr-bsp-runtime-ml-177230375"></a>
### R_MergedWidthPoints

```ml
function R_MergedWidthPoints(grid, offset)
```

Returns `false` from `mq3.renderer.tr_bsp_runtime.R_MergedWidthPoints`; earlier branches return `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record providing `grid.width`, `grid.control`. |
| `offset` | `dynamic` | — | Input used by `while j<grid.width-1 if nearPoint(grid.control[offset+i].position,grid.control[offset+j].position,0.1) then return true`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L283)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-movepatchsurfacestohunk-function-r-movepatchsurfacestohunk-grids-src-mq3-renderer-tr-bsp-runtime-ml-1457952159"></a>
### R_MovePatchSurfacesToHunk

```ml
function R_MovePatchSurfacesToHunk(grids)
```

Returns `result` from `mq3.renderer.tr_bsp_runtime.R_MovePatchSurfacesToHunk`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grids` | `dynamic` | — | Sequence traversed as `grid` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L309)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-setparent-function-r-setparent-nodes-index-parent-src-mq3-renderer-tr-bsp-runtime-ml-1883934453"></a>
### R_SetParent

```ml
function R_SetParent(nodes, index, parent)
```

Builds `node.parent` in `mq3.renderer.tr_bsp_runtime.R_SetParent`; returns `R_SetParent(nodes,node.children[1],index)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `nodes` | `dynamic` | — | Value forwarded as `nodes` to `mq3.renderer.tr_bsp_runtime.R_SetParent`. |
| `index` | `dynamic` | — | Value forwarded as `parent` to `mq3.renderer.tr_bsp_runtime.R_SetParent`. |
| `parent` | `dynamic` | — | Value assigned to `node.parent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L236)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-stitchallpatches-function-r-stitchallpatches-grids-src-mq3-renderer-tr-bsp-runtime-ml-2041408005"></a>
### R_StitchAllPatches

```ml
function R_StitchAllPatches(grids)
```

Calls `mq3.renderer.patch_stitch.R_StitchAllPatches` with `(grids)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grids` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.patch_stitch.R_StitchAllPatches`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L306)

<a id="function-function-mq3-renderer-tr-bsp-runtime-r-stitchpatches-function-r-stitchpatches-grid1-grid2-src-mq3-renderer-tr-bsp-runtime-ml-595612687"></a>
### R_StitchPatches

```ml
function R_StitchPatches(grid1, grid2)
```

Calls `mq3.renderer.patch_stitch.R_StitchPatches` with `(grid1,grid2)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid1` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.patch_stitch.R_StitchPatches`. |
| `grid2` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.patch_stitch.R_StitchPatches`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L303)

<a id="function-function-mq3-renderer-tr-bsp-runtime-re-loadworldmap-function-re-loadworldmap-state-name-data-shaderindex-src-mq3-renderer-tr-bsp-runtime-ml-1060394389"></a>
### RE_LoadWorldMap

```ml
function RE_LoadWorldMap(state, name, data, shaderIndex)
```

Updates `state.worldMapLoaded`, `state.world` in `mq3.renderer.tr_bsp_runtime.RE_LoadWorldMap`; returns `world`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.worldMapLoaded`, `state.world`. |
| `name` | `dynamic` | — | Argument 1 supplied to `std.fs.readAllBytes`. |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.format.bsp.load`. |
| `shaderIndex` | `dynamic` | — | Value forwarded as `shaderIndex` to `mq3.renderer.tr_bsp_runtime.R_LoadFogs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L316)

<a id="function-function-mq3-renderer-tr-bsp-runtime-re-setworldvisdata-function-re-setworldvisdata-state-vis-src-mq3-renderer-tr-bsp-runtime-ml-1578561549"></a>
### RE_SetWorldVisData

```ml
function RE_SetWorldVisData(state, vis)
```

Updates `state.externalVisData` in `mq3.renderer.tr_bsp_runtime.RE_SetWorldVisData`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.externalVisData`. |
| `vis` | `dynamic` | — | Value assigned to `state.externalVisData`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L128)

<a id="function-function-mq3-renderer-tr-bsp-runtime-samelodgroup-function-samelodgroup-a-b-src-mq3-renderer-tr-bsp-runtime-ml-70825987"></a>
### sameLodGroup

```ml
function sameLodGroup(a, b)
```

Computes `a.lodRadius==b.lodRadius and a.lodOrigin==b.lodOrigin` for `mq3.renderer.tr_bsp_runtime.sameLodGroup`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record providing `a.lodRadius`, `a.lodOrigin`. |
| `b` | `dynamic` | — | Record providing `b.lodRadius`, `b.lodOrigin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L279)

- [mq3.renderer.tr_bsp_runtime.Shader](Type-mq3-renderer-tr-bsp-runtime-shader-1371725973.md) — struct
<a id="function-function-mq3-renderer-tr-bsp-runtime-shaderforshadernum-function-shaderforshadernum-world-shadernum-lightmapnum-src-mq3-renderer-tr-bsp-runtime-ml-886658415"></a>
### ShaderForShaderNum

```ml
function ShaderForShaderNum(world, shaderNum, lightmapNum)
```

Builds `mq3.renderer.tr_bsp_runtime.Shader` for `mq3.renderer.tr_bsp_runtime.ShaderForShaderNum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record providing `world.shaders`. |
| `shaderNum` | `dynamic` | — | Input tested by `world==void or shaderNum<0 or shaderNum>=len(world.shaders)`. |
| `lightmapNum` | `dynamic` | — | Initial value for `mq3.renderer.tr_bsp_runtime.Shader.lightmapIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L151)

- [mq3.renderer.tr_bsp_runtime.State](Type-mq3-renderer-tr-bsp-runtime-state-1447583673.md) — struct
- [mq3.renderer.tr_bsp_runtime.Surface](Type-mq3-renderer-tr-bsp-runtime-surface-696433887.md) — struct
<a id="function-function-mq3-renderer-tr-bsp-runtime-surfaceinfo-function-surfaceinfo-world-index-src-mq3-renderer-tr-bsp-runtime-ml-1452664610"></a>
### surfaceInfo

```ml
function surfaceInfo(world, index)
```

Returns `[i32(world.map,offset),i32(world.map,offset+4)+1,i32(world.map,offset+8)]` from `mq3.renderer.tr_bsp_runtime.surfaceInfo`; earlier branches return `fail("surface index outside BSP")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Record providing `world.map`. |
| `index` | `dynamic` | — | Input tested by `index<0 or index>=world.map.counts[13]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L159)

- [mq3.renderer.tr_bsp_runtime.Visibility](Type-mq3-renderer-tr-bsp-runtime-visibility-987638648.md) — struct
- [mq3.renderer.tr_bsp_runtime.World](Type-mq3-renderer-tr-bsp-runtime-world-292307360.md) — struct
