# `src/mq3/renderer/tr_local.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_local`](Package-mq3-renderer-tr-local-1456096151.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-renderer-tr-local-checkoverflow-function-checkoverflow-numvertexes-numindexes-verts-indexes-maxvertexes-maxindexes-src-mq3-renderer-tr-local-ml-1491537266"></a>
### checkOverflow

```ml
function checkOverflow(numVertexes, numIndexes, verts, indexes, maxVertexes, maxIndexes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numVertexes` | `dynamic` | — |  |
| `numIndexes` | `dynamic` | — |  |
| `verts` | `dynamic` | — |  |
| `indexes` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L73)

<a id="function-function-mq3-renderer-tr-local-commandbytesavailable-function-commandbytesavailable-used-requested-src-mq3-renderer-tr-local-ml-964456921"></a>
### commandBytesAvailable

```ml
function commandBytesAvailable(used, requested)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `used` | `dynamic` | — |  |
| `requested` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L72)

<a id="constant-constant-mq3-renderer-tr-local-contents-node-const-contents-node-1-src-mq3-renderer-tr-local-ml-1341465977"></a>
### CONTENTS_NODE

```ml
const CONTENTS_NODE = -1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L26)

<a id="constant-constant-mq3-renderer-tr-local-cull-clip-const-cull-clip-1-src-mq3-renderer-tr-local-ml-2032061624"></a>
### CULL_CLIP

```ml
const CULL_CLIP = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L41)

<a id="constant-constant-mq3-renderer-tr-local-cull-in-const-cull-in-0-src-mq3-renderer-tr-local-ml-131826761"></a>
### CULL_IN

```ml
const CULL_IN = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L40)

<a id="constant-constant-mq3-renderer-tr-local-cull-out-const-cull-out-2-src-mq3-renderer-tr-local-ml-797537251"></a>
### CULL_OUT

```ml
const CULL_OUT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L42)

- [mq3.renderer.tr_local.DrawBufferCommand](Type-mq3-renderer-tr-local-drawbuffercommand-1424339868.md) — struct
- [mq3.renderer.tr_local.DrawSurf](Type-mq3-renderer-tr-local-drawsurf-1403694013.md) — struct
<a id="constant-constant-mq3-renderer-tr-local-drawsurf-mask-const-drawsurf-mask-65535-src-mq3-renderer-tr-local-ml-1264515125"></a>
### DRAWSURF_MASK

```ml
const DRAWSURF_MASK = 65535
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L32)

- [mq3.renderer.tr_local.EndFrameCommand](Type-mq3-renderer-tr-local-endframecommand-724257986.md) — struct
<a id="function-function-mq3-renderer-tr-local-enumnames-function-enumnames-src-mq3-renderer-tr-local-ml-58125248"></a>
### enumNames

```ml
function enumNames()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L63)

<a id="constant-constant-mq3-renderer-tr-local-fog-table-size-const-fog-table-size-256-src-mq3-renderer-tr-local-ml-2108888270"></a>
### FOG_TABLE_SIZE

```ml
const FOG_TABLE_SIZE = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L36)

<a id="constant-constant-mq3-renderer-tr-local-functable-mask-const-functable-mask-1023-src-mq3-renderer-tr-local-ml-349863033"></a>
### FUNCTABLE_MASK

```ml
const FUNCTABLE_MASK = 1023
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L39)

<a id="constant-constant-mq3-renderer-tr-local-functable-size-const-functable-size-1024-src-mq3-renderer-tr-local-ml-191896256"></a>
### FUNCTABLE_SIZE

```ml
const FUNCTABLE_SIZE = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L37)

<a id="constant-constant-mq3-renderer-tr-local-functable-size2-const-functable-size2-10-src-mq3-renderer-tr-local-ml-1597084424"></a>
### FUNCTABLE_SIZE2

```ml
const FUNCTABLE_SIZE2 = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L38)

<a id="function-function-mq3-renderer-tr-local-functionnames-function-functionnames-src-mq3-renderer-tr-local-ml-1192941938"></a>
### functionNames

```ml
function functionNames()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L65)

<a id="function-function-mq3-renderer-tr-local-globalnames-function-globalnames-src-mq3-renderer-tr-local-ml-80588024"></a>
### globalNames

```ml
function globalNames()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L66)

<a id="constant-constant-mq3-renderer-tr-local-gls-atest-bits-const-gls-atest-bits-1879048192-src-mq3-renderer-tr-local-ml-1717088040"></a>
### GLS_ATEST_BITS

```ml
const GLS_ATEST_BITS = 1879048192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L49)

<a id="constant-constant-mq3-renderer-tr-local-gls-default-const-gls-default-gls-depthmask-true-src-mq3-renderer-tr-local-ml-1410976218"></a>
### GLS_DEFAULT

```ml
const GLS_DEFAULT = GLS_DEPTHMASK_TRUE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L50)

<a id="constant-constant-mq3-renderer-tr-local-gls-depthfunc-equal-const-gls-depthfunc-equal-131072-src-mq3-renderer-tr-local-ml-1615204059"></a>
### GLS_DEPTHFUNC_EQUAL

```ml
const GLS_DEPTHFUNC_EQUAL = 131072
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L48)

<a id="constant-constant-mq3-renderer-tr-local-gls-depthmask-true-const-gls-depthmask-true-256-src-mq3-renderer-tr-local-ml-1859091970"></a>
### GLS_DEPTHMASK_TRUE

```ml
const GLS_DEPTHMASK_TRUE = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L45)

<a id="constant-constant-mq3-renderer-tr-local-gls-depthtest-disable-const-gls-depthtest-disable-65536-src-mq3-renderer-tr-local-ml-1315741186"></a>
### GLS_DEPTHTEST_DISABLE

```ml
const GLS_DEPTHTEST_DISABLE = 65536
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L47)

<a id="constant-constant-mq3-renderer-tr-local-gls-dstblend-bits-const-gls-dstblend-bits-240-src-mq3-renderer-tr-local-ml-784197483"></a>
### GLS_DSTBLEND_BITS

```ml
const GLS_DSTBLEND_BITS = 240
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L44)

<a id="constant-constant-mq3-renderer-tr-local-gls-polymode-line-const-gls-polymode-line-4096-src-mq3-renderer-tr-local-ml-1556259614"></a>
### GLS_POLYMODE_LINE

```ml
const GLS_POLYMODE_LINE = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L46)

<a id="constant-constant-mq3-renderer-tr-local-gls-srcblend-bits-const-gls-srcblend-bits-15-src-mq3-renderer-tr-local-ml-1501534265"></a>
### GLS_SRCBLEND_BITS

```ml
const GLS_SRCBLEND_BITS = 15
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L43)

<a id="constant-constant-mq3-renderer-tr-local-lightmap-2d-const-lightmap-2d-4-src-mq3-renderer-tr-local-ml-1073489356"></a>
### LIGHTMAP_2D

```ml
const LIGHTMAP_2D = -4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L15)

<a id="constant-constant-mq3-renderer-tr-local-lightmap-by-vertex-const-lightmap-by-vertex-3-src-mq3-renderer-tr-local-ml-217408795"></a>
### LIGHTMAP_BY_VERTEX

```ml
const LIGHTMAP_BY_VERTEX = -3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L16)

<a id="constant-constant-mq3-renderer-tr-local-lightmap-none-const-lightmap-none-1-src-mq3-renderer-tr-local-ml-2029957009"></a>
### LIGHTMAP_NONE

```ml
const LIGHTMAP_NONE = -1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L18)

<a id="constant-constant-mq3-renderer-tr-local-lightmap-whiteimage-const-lightmap-whiteimage-2-src-mq3-renderer-tr-local-ml-748016590"></a>
### LIGHTMAP_WHITEIMAGE

```ml
const LIGHTMAP_WHITEIMAGE = -2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L17)

<a id="function-function-mq3-renderer-tr-local-macronames-function-macronames-src-mq3-renderer-tr-local-ml-1094613194"></a>
### macroNames

```ml
function macroNames()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L62)

<a id="constant-constant-mq3-renderer-tr-local-max-drawimages-const-max-drawimages-2048-src-mq3-renderer-tr-local-ml-1505014937"></a>
### MAX_DRAWIMAGES

```ml
const MAX_DRAWIMAGES = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L28)

<a id="constant-constant-mq3-renderer-tr-local-max-drawsurfs-const-max-drawsurfs-65536-src-mq3-renderer-tr-local-ml-2076526550"></a>
### MAX_DRAWSURFS

```ml
const MAX_DRAWSURFS = 65536
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L31)

<a id="constant-constant-mq3-renderer-tr-local-max-face-points-const-max-face-points-64-src-mq3-renderer-tr-local-ml-1915838085"></a>
### MAX_FACE_POINTS

```ml
const MAX_FACE_POINTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L19)

<a id="constant-constant-mq3-renderer-tr-local-max-grid-size-const-max-grid-size-65-src-mq3-renderer-tr-local-ml-1106670668"></a>
### MAX_GRID_SIZE

```ml
const MAX_GRID_SIZE = 65
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L21)

<a id="constant-constant-mq3-renderer-tr-local-max-image-animations-const-max-image-animations-8-src-mq3-renderer-tr-local-ml-366032579"></a>
### MAX_IMAGE_ANIMATIONS

```ml
const MAX_IMAGE_ANIMATIONS = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L13)

<a id="constant-constant-mq3-renderer-tr-local-max-lightmaps-const-max-lightmaps-256-src-mq3-renderer-tr-local-ml-90974474"></a>
### MAX_LIGHTMAPS

```ml
const MAX_LIGHTMAPS = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L29)

<a id="constant-constant-mq3-renderer-tr-local-max-mod-known-const-max-mod-known-1024-src-mq3-renderer-tr-local-ml-851737650"></a>
### MAX_MOD_KNOWN

```ml
const MAX_MOD_KNOWN = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L27)

<a id="constant-constant-mq3-renderer-tr-local-max-patch-size-const-max-patch-size-32-src-mq3-renderer-tr-local-ml-1425019920"></a>
### MAX_PATCH_SIZE

```ml
const MAX_PATCH_SIZE = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L20)

<a id="constant-constant-mq3-renderer-tr-local-max-polys-const-max-polys-600-src-mq3-renderer-tr-local-ml-1255886091"></a>
### MAX_POLYS

```ml
const MAX_POLYS = 600
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L52)

<a id="constant-constant-mq3-renderer-tr-local-max-polyverts-const-max-polyverts-3000-src-mq3-renderer-tr-local-ml-505414858"></a>
### MAX_POLYVERTS

```ml
const MAX_POLYVERTS = 3000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L53)

<a id="constant-constant-mq3-renderer-tr-local-max-render-commands-const-max-render-commands-262144-src-mq3-renderer-tr-local-ml-140175768"></a>
### MAX_RENDER_COMMANDS

```ml
const MAX_RENDER_COMMANDS = 262144
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L51)

<a id="constant-constant-mq3-renderer-tr-local-max-shader-deforms-const-max-shader-deforms-3-src-mq3-renderer-tr-local-ml-1181299674"></a>
### MAX_SHADER_DEFORMS

```ml
const MAX_SHADER_DEFORMS = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L12)

<a id="constant-constant-mq3-renderer-tr-local-max-shader-stages-const-max-shader-stages-8-src-mq3-renderer-tr-local-ml-1987486397"></a>
### MAX_SHADER_STAGES

```ml
const MAX_SHADER_STAGES = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L10)

<a id="constant-constant-mq3-renderer-tr-local-max-shaders-const-max-shaders-16384-src-mq3-renderer-tr-local-ml-1081498329"></a>
### MAX_SHADERS

```ml
const MAX_SHADERS = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L7)

<a id="constant-constant-mq3-renderer-tr-local-max-skins-const-max-skins-1024-src-mq3-renderer-tr-local-ml-2051034902"></a>
### MAX_SKINS

```ml
const MAX_SKINS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L30)

<a id="constant-constant-mq3-renderer-tr-local-max-state-name-const-max-state-name-32-src-mq3-renderer-tr-local-ml-1511788226"></a>
### MAX_STATE_NAME

```ml
const MAX_STATE_NAME = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L9)

<a id="constant-constant-mq3-renderer-tr-local-max-states-per-shader-const-max-states-per-shader-32-src-mq3-renderer-tr-local-ml-41164696"></a>
### MAX_STATES_PER_SHADER

```ml
const MAX_STATES_PER_SHADER = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L8)

<a id="constant-constant-mq3-renderer-tr-local-num-texture-bundles-const-num-texture-bundles-2-src-mq3-renderer-tr-local-ml-1292352267"></a>
### NUM_TEXTURE_BUNDLES

```ml
const NUM_TEXTURE_BUNDLES = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L14)

<a id="function-function-mq3-renderer-tr-local-packsort-function-packsort-shadernum-entitynum-fognum-dlightmap-src-mq3-renderer-tr-local-ml-773886406"></a>
### packSort

```ml
function packSort(shaderNum, entityNum, fogNum, dlightMap)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shaderNum` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `fogNum` | `dynamic` | — |  |
| `dlightMap` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L67)

<a id="constant-constant-mq3-renderer-tr-local-qsort-entitynum-shift-const-qsort-entitynum-shift-7-src-mq3-renderer-tr-local-ml-318583610"></a>
### QSORT_ENTITYNUM_SHIFT

```ml
const QSORT_ENTITYNUM_SHIFT = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L34)

<a id="constant-constant-mq3-renderer-tr-local-qsort-fognum-shift-const-qsort-fognum-shift-2-src-mq3-renderer-tr-local-ml-1042212139"></a>
### QSORT_FOGNUM_SHIFT

```ml
const QSORT_FOGNUM_SHIFT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L35)

<a id="constant-constant-mq3-renderer-tr-local-qsort-shadernum-shift-const-qsort-shadernum-shift-17-src-mq3-renderer-tr-local-ml-105114731"></a>
### QSORT_SHADERNUM_SHIFT

```ml
const QSORT_SHADERNUM_SHIFT = 17
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L33)

- [mq3.renderer.tr_local.RenderCommandList](Type-mq3-renderer-tr-local-rendercommandlist-1197161940.md) — struct
- [mq3.renderer.tr_local.ScreenshotCommand](Type-mq3-renderer-tr-local-screenshotcommand-50920148.md) — struct
- [mq3.renderer.tr_local.SetColorCommand](Type-mq3-renderer-tr-local-setcolorcommand-380578405.md) — struct
<a id="constant-constant-mq3-renderer-tr-local-side-back-const-side-back-1-src-mq3-renderer-tr-local-ml-1935443016"></a>
### SIDE_BACK

```ml
const SIDE_BACK = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L24)

<a id="constant-constant-mq3-renderer-tr-local-side-front-const-side-front-0-src-mq3-renderer-tr-local-ml-405430205"></a>
### SIDE_FRONT

```ml
const SIDE_FRONT = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L23)

<a id="constant-constant-mq3-renderer-tr-local-side-on-const-side-on-2-src-mq3-renderer-tr-local-ml-1833613643"></a>
### SIDE_ON

```ml
const SIDE_ON = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L25)

<a id="constant-constant-mq3-renderer-tr-local-smp-frames-const-smp-frames-2-src-mq3-renderer-tr-local-ml-1610799747"></a>
### SMP_FRAMES

```ml
const SMP_FRAMES = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L6)

<a id="function-function-mq3-renderer-tr-local-sortdlight-function-sortdlight-value-src-mq3-renderer-tr-local-ml-3844129"></a>
### sortDlight

```ml
function sortDlight(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L71)

<a id="function-function-mq3-renderer-tr-local-sortentity-function-sortentity-value-src-mq3-renderer-tr-local-ml-1930962113"></a>
### sortEntity

```ml
function sortEntity(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L69)

<a id="function-function-mq3-renderer-tr-local-sortfog-function-sortfog-value-src-mq3-renderer-tr-local-ml-661283301"></a>
### sortFog

```ml
function sortFog(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L70)

<a id="function-function-mq3-renderer-tr-local-sortshader-function-sortshader-value-src-mq3-renderer-tr-local-ml-709787177"></a>
### sortShader

```ml
function sortShader(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L68)

- [mq3.renderer.tr_local.StretchPicCommand](Type-mq3-renderer-tr-local-stretchpiccommand-826043849.md) — struct
- [mq3.renderer.tr_local.SwapBuffersCommand](Type-mq3-renderer-tr-local-swapbufferscommand-157634796.md) — struct
<a id="constant-constant-mq3-renderer-tr-local-tr-max-texmods-const-tr-max-texmods-4-src-mq3-renderer-tr-local-ml-634580007"></a>
### TR_MAX_TEXMODS

```ml
const TR_MAX_TEXMODS = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L11)

<a id="function-function-mq3-renderer-tr-local-typenames-function-typenames-src-mq3-renderer-tr-local-ml-1655223538"></a>
### typeNames

```ml
function typeNames()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L64)

<a id="constant-constant-mq3-renderer-tr-local-vertexsize-const-vertexsize-8-src-mq3-renderer-tr-local-ml-877534101"></a>
### VERTEXSIZE

```ml
const VERTEXSIZE = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_local.ml#L22)
