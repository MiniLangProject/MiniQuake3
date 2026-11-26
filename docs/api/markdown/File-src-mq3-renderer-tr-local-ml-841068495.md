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

Computes `numVertexes+verts>=maxVertexes or numIndexes+indexes>=maxIndexes` for `mq3.renderer.tr_local.checkOverflow`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numVertexes` | `dynamic` | — | Input used in the result expression `numVertexes+verts>=maxVertexes or numIndexes+indexes>=maxIndexes`. |
| `numIndexes` | `dynamic` | — | Input used in the result expression `numVertexes+verts>=maxVertexes or numIndexes+indexes>=maxIndexes`. |
| `verts` | `dynamic` | — | Input used in the result expression `numVertexes+verts>=maxVertexes or numIndexes+indexes>=maxIndexes`. |
| `indexes` | `dynamic` | — | Input used in the result expression `numVertexes+verts>=maxVertexes or numIndexes+indexes>=maxIndexes`. |
| `maxVertexes` | `dynamic` | — | Input used in the result expression `numVertexes+verts>=maxVertexes or numIndexes+indexes>=maxIndexes`. |
| `maxIndexes` | `dynamic` | — | Input used in the result expression `numVertexes+verts>=maxVertexes or numIndexes+indexes>=maxIndexes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L221)

<a id="function-function-mq3-renderer-tr-local-commandbytesavailable-function-commandbytesavailable-used-requested-src-mq3-renderer-tr-local-ml-964456921"></a>
### commandBytesAvailable

```ml
function commandBytesAvailable(used, requested)
```

Computes `requested>=0 and used>=0 and used+requested+4<=MAX_RENDER_COMMANDS` for `mq3.renderer.tr_local.commandBytesAvailable`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `used` | `dynamic` | — | Input used in the result expression `requested>=0 and used>=0 and used+requested+4<=MAX_RENDER_COMMANDS`. |
| `requested` | `dynamic` | — | Input used in the result expression `requested>=0 and used>=0 and used+requested+4<=MAX_RENDER_COMMANDS`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L213)

<a id="constant-constant-mq3-renderer-tr-local-contents-node-const-contents-node-1-src-mq3-renderer-tr-local-ml-1341465977"></a>
### CONTENTS_NODE

```ml
const CONTENTS_NODE = -1
```

Negative marker identifying an internal BSP node rather than a leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L47)

<a id="constant-constant-mq3-renderer-tr-local-cull-clip-const-cull-clip-1-src-mq3-renderer-tr-local-ml-2032061624"></a>
### CULL_CLIP

```ml
const CULL_CLIP = 1
```

Bounds classification indicating that the object intersects the view frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L77)

<a id="constant-constant-mq3-renderer-tr-local-cull-in-const-cull-in-0-src-mq3-renderer-tr-local-ml-131826761"></a>
### CULL_IN

```ml
const CULL_IN = 0
```

Bounds classification indicating that the object lies entirely inside the view frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L75)

<a id="constant-constant-mq3-renderer-tr-local-cull-out-const-cull-out-2-src-mq3-renderer-tr-local-ml-797537251"></a>
### CULL_OUT

```ml
const CULL_OUT = 2
```

Bounds classification indicating that the object lies entirely outside the view frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L79)

- [mq3.renderer.tr_local.DrawBufferCommand](Type-mq3-renderer-tr-local-drawbuffercommand-1424339868.md) — struct
- [mq3.renderer.tr_local.DrawSurf](Type-mq3-renderer-tr-local-drawsurf-1403694013.md) — struct
<a id="constant-constant-mq3-renderer-tr-local-drawsurf-mask-const-drawsurf-mask-65535-src-mq3-renderer-tr-local-ml-1264515125"></a>
### DRAWSURF_MASK

```ml
const DRAWSURF_MASK = 65535
```

Mask that wraps indices into the power-of-two draw-surface ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L59)

- [mq3.renderer.tr_local.EndFrameCommand](Type-mq3-renderer-tr-local-endframecommand-724257986.md) — struct
<a id="function-function-mq3-renderer-tr-local-enumnames-function-enumnames-src-mq3-renderer-tr-local-ml-58125248"></a>
### enumNames

```ml
function enumNames()
```

Lists the 111 declared names for `mq3.renderer.tr_local.enumNames`, including `ACFF_MODULATE_ALPHA`, `ACFF_MODULATE_RGB`, `ACFF_MODULATE_RGBA`, `ACFF_NONE`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L185)

<a id="constant-constant-mq3-renderer-tr-local-fog-table-size-const-fog-table-size-256-src-mq3-renderer-tr-local-ml-2108888270"></a>
### FOG_TABLE_SIZE

```ml
const FOG_TABLE_SIZE = 256
```

Number of samples in the fog-density lookup table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L67)

<a id="constant-constant-mq3-renderer-tr-local-functable-mask-const-functable-mask-1023-src-mq3-renderer-tr-local-ml-349863033"></a>
### FUNCTABLE_MASK

```ml
const FUNCTABLE_MASK = 1023
```

Mask that wraps waveform-table indices to the power-of-two table size.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L73)

<a id="constant-constant-mq3-renderer-tr-local-functable-size-const-functable-size-1024-src-mq3-renderer-tr-local-ml-191896256"></a>
### FUNCTABLE_SIZE

```ml
const FUNCTABLE_SIZE = 1024
```

Number of samples in the periodic shader waveform lookup table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L69)

<a id="constant-constant-mq3-renderer-tr-local-functable-size2-const-functable-size2-10-src-mq3-renderer-tr-local-ml-1597084424"></a>
### FUNCTABLE_SIZE2

```ml
const FUNCTABLE_SIZE2 = 10
```

Base-two exponent of the waveform-table size, used by fixed-point indexing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L71)

<a id="function-function-mq3-renderer-tr-local-functionnames-function-functionnames-src-mq3-renderer-tr-local-ml-1192941938"></a>
### functionNames

```ml
function functionNames()
```

Lists the 159 declared names for `mq3.renderer.tr_local.functionNames`, including `myftol`, `R_ModelInit`, `R_GetModelByHandle`, `R_LerpTag`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L189)

<a id="function-function-mq3-renderer-tr-local-globalnames-function-globalnames-src-mq3-renderer-tr-local-ml-80588024"></a>
### globalNames

```ml
function globalNames()
```

Lists the 98 declared names for `mq3.renderer.tr_local.globalNames`, including `backEnd`, `backEndData`, `glConfig`, `glState`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L191)

<a id="constant-constant-mq3-renderer-tr-local-gls-atest-bits-const-gls-atest-bits-1879048192-src-mq3-renderer-tr-local-ml-1717088040"></a>
### GLS_ATEST_BITS

```ml
const GLS_ATEST_BITS = 1879048192
```

Bit mask selecting the alpha-test mode in packed renderer state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L93)

<a id="constant-constant-mq3-renderer-tr-local-gls-default-const-gls-default-gls-depthmask-true-src-mq3-renderer-tr-local-ml-1410976218"></a>
### GLS_DEFAULT

```ml
const GLS_DEFAULT = GLS_DEPTHMASK_TRUE
```

Default packed renderer state, with depth-buffer writes enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L95)

<a id="constant-constant-mq3-renderer-tr-local-gls-depthfunc-equal-const-gls-depthfunc-equal-131072-src-mq3-renderer-tr-local-ml-1615204059"></a>
### GLS_DEPTHFUNC_EQUAL

```ml
const GLS_DEPTHFUNC_EQUAL = 131072
```

Packed-state flag requiring equality with the existing depth value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L91)

<a id="constant-constant-mq3-renderer-tr-local-gls-depthmask-true-const-gls-depthmask-true-256-src-mq3-renderer-tr-local-ml-1859091970"></a>
### GLS_DEPTHMASK_TRUE

```ml
const GLS_DEPTHMASK_TRUE = 256
```

Packed-state flag enabling writes to the depth buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L85)

<a id="constant-constant-mq3-renderer-tr-local-gls-depthtest-disable-const-gls-depthtest-disable-65536-src-mq3-renderer-tr-local-ml-1315741186"></a>
### GLS_DEPTHTEST_DISABLE

```ml
const GLS_DEPTHTEST_DISABLE = 65536
```

Packed-state flag disabling depth-buffer comparison.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L89)

<a id="constant-constant-mq3-renderer-tr-local-gls-dstblend-bits-const-gls-dstblend-bits-240-src-mq3-renderer-tr-local-ml-784197483"></a>
### GLS_DSTBLEND_BITS

```ml
const GLS_DSTBLEND_BITS = 240
```

Bit mask selecting the destination blend-factor field in packed renderer state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L83)

<a id="constant-constant-mq3-renderer-tr-local-gls-polymode-line-const-gls-polymode-line-4096-src-mq3-renderer-tr-local-ml-1556259614"></a>
### GLS_POLYMODE_LINE

```ml
const GLS_POLYMODE_LINE = 4096
```

Packed-state flag selecting wireframe polygon drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L87)

<a id="constant-constant-mq3-renderer-tr-local-gls-srcblend-bits-const-gls-srcblend-bits-15-src-mq3-renderer-tr-local-ml-1501534265"></a>
### GLS_SRCBLEND_BITS

```ml
const GLS_SRCBLEND_BITS = 15
```

Bit mask selecting the source blend-factor field in packed renderer state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L81)

<a id="constant-constant-mq3-renderer-tr-local-lightmap-2d-const-lightmap-2d-4-src-mq3-renderer-tr-local-ml-1073489356"></a>
### LIGHTMAP_2D

```ml
const LIGHTMAP_2D = -4
```

Negative lightmap selector used for two-dimensional drawing shaders.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L25)

<a id="constant-constant-mq3-renderer-tr-local-lightmap-by-vertex-const-lightmap-by-vertex-3-src-mq3-renderer-tr-local-ml-217408795"></a>
### LIGHTMAP_BY_VERTEX

```ml
const LIGHTMAP_BY_VERTEX = -3
```

Negative lightmap selector requesting vertex lighting instead of a lightmap image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L27)

<a id="constant-constant-mq3-renderer-tr-local-lightmap-none-const-lightmap-none-1-src-mq3-renderer-tr-local-ml-2029957009"></a>
### LIGHTMAP_NONE

```ml
const LIGHTMAP_NONE = -1
```

Negative lightmap selector for a shader that does not use baked lighting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L31)

<a id="constant-constant-mq3-renderer-tr-local-lightmap-whiteimage-const-lightmap-whiteimage-2-src-mq3-renderer-tr-local-ml-748016590"></a>
### LIGHTMAP_WHITEIMAGE

```ml
const LIGHTMAP_WHITEIMAGE = -2
```

Negative lightmap selector substituting the renderer's white image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L29)

<a id="function-function-mq3-renderer-tr-local-macronames-function-macronames-src-mq3-renderer-tr-local-ml-1094613194"></a>
### macroNames

```ml
function macroNames()
```

Lists the 73 declared names for `mq3.renderer.tr_local.macroNames`, including `CONTENTS_NODE`, `CULL_CLIP`, `CULL_IN`, `CULL_OUT`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L183)

<a id="constant-constant-mq3-renderer-tr-local-max-drawimages-const-max-drawimages-2048-src-mq3-renderer-tr-local-ml-1505014937"></a>
### MAX_DRAWIMAGES

```ml
const MAX_DRAWIMAGES = 2048
```

Maximum number of images retained by the renderer's image registry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L51)

<a id="constant-constant-mq3-renderer-tr-local-max-drawsurfs-const-max-drawsurfs-65536-src-mq3-renderer-tr-local-ml-2076526550"></a>
### MAX_DRAWSURFS

```ml
const MAX_DRAWSURFS = 65536
```

Capacity of the draw-surface ring used when queuing scene geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L57)

<a id="constant-constant-mq3-renderer-tr-local-max-face-points-const-max-face-points-64-src-mq3-renderer-tr-local-ml-1915838085"></a>
### MAX_FACE_POINTS

```ml
const MAX_FACE_POINTS = 64
```

Maximum number of points accepted by the legacy planar-face representation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L33)

<a id="constant-constant-mq3-renderer-tr-local-max-grid-size-const-max-grid-size-65-src-mq3-renderer-tr-local-ml-1106670668"></a>
### MAX_GRID_SIZE

```ml
const MAX_GRID_SIZE = 65
```

Largest tessellated patch-grid dimension accepted by the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L37)

<a id="constant-constant-mq3-renderer-tr-local-max-image-animations-const-max-image-animations-8-src-mq3-renderer-tr-local-ml-366032579"></a>
### MAX_IMAGE_ANIMATIONS

```ml
const MAX_IMAGE_ANIMATIONS = 8
```

Maximum number of images in an animated shader map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L21)

<a id="constant-constant-mq3-renderer-tr-local-max-lightmaps-const-max-lightmaps-256-src-mq3-renderer-tr-local-ml-90974474"></a>
### MAX_LIGHTMAPS

```ml
const MAX_LIGHTMAPS = 256
```

Maximum number of baked lightmap images retained by the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L53)

<a id="constant-constant-mq3-renderer-tr-local-max-mod-known-const-max-mod-known-1024-src-mq3-renderer-tr-local-ml-851737650"></a>
### MAX_MOD_KNOWN

```ml
const MAX_MOD_KNOWN = 1024
```

Maximum number of model records retained in the renderer's known-model table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L49)

<a id="constant-constant-mq3-renderer-tr-local-max-patch-size-const-max-patch-size-32-src-mq3-renderer-tr-local-ml-1425019920"></a>
### MAX_PATCH_SIZE

```ml
const MAX_PATCH_SIZE = 32
```

Largest control-point patch dimension accepted from BSP data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L35)

<a id="constant-constant-mq3-renderer-tr-local-max-polys-const-max-polys-600-src-mq3-renderer-tr-local-ml-1255886091"></a>
### MAX_POLYS

```ml
const MAX_POLYS = 600
```

Capacity of the submitted scene polygon array.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L99)

<a id="constant-constant-mq3-renderer-tr-local-max-polyverts-const-max-polyverts-3000-src-mq3-renderer-tr-local-ml-505414858"></a>
### MAX_POLYVERTS

```ml
const MAX_POLYVERTS = 3000
```

Capacity of the submitted scene polygon-vertex array.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L101)

<a id="constant-constant-mq3-renderer-tr-local-max-render-commands-const-max-render-commands-262144-src-mq3-renderer-tr-local-ml-140175768"></a>
### MAX_RENDER_COMMANDS

```ml
const MAX_RENDER_COMMANDS = 262144
```

Byte capacity of the serialized renderer command buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L97)

<a id="constant-constant-mq3-renderer-tr-local-max-shader-deforms-const-max-shader-deforms-3-src-mq3-renderer-tr-local-ml-1181299674"></a>
### MAX_SHADER_DEFORMS

```ml
const MAX_SHADER_DEFORMS = 3
```

Maximum number of vertex-deformation stages accepted by one shader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L19)

<a id="constant-constant-mq3-renderer-tr-local-max-shader-stages-const-max-shader-stages-8-src-mq3-renderer-tr-local-ml-1987486397"></a>
### MAX_SHADER_STAGES

```ml
const MAX_SHADER_STAGES = 8
```

Maximum number of texture and color stages retained in one shader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L15)

<a id="constant-constant-mq3-renderer-tr-local-max-shaders-const-max-shaders-16384-src-mq3-renderer-tr-local-ml-1081498329"></a>
### MAX_SHADERS

```ml
const MAX_SHADERS = 16384
```

Maximum number of shader records registered by the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L9)

<a id="constant-constant-mq3-renderer-tr-local-max-skins-const-max-skins-1024-src-mq3-renderer-tr-local-ml-2051034902"></a>
### MAX_SKINS

```ml
const MAX_SKINS = 1024
```

Maximum number of registered skin definitions retained by the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L55)

<a id="constant-constant-mq3-renderer-tr-local-max-state-name-const-max-state-name-32-src-mq3-renderer-tr-local-ml-1511788226"></a>
### MAX_STATE_NAME

```ml
const MAX_STATE_NAME = 32
```

Character capacity of an alternate shader-state name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L13)

<a id="constant-constant-mq3-renderer-tr-local-max-states-per-shader-const-max-states-per-shader-32-src-mq3-renderer-tr-local-ml-41164696"></a>
### MAX_STATES_PER_SHADER

```ml
const MAX_STATES_PER_SHADER = 32
```

Maximum number of alternate states declared for one shader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L11)

<a id="constant-constant-mq3-renderer-tr-local-num-texture-bundles-const-num-texture-bundles-2-src-mq3-renderer-tr-local-ml-1292352267"></a>
### NUM_TEXTURE_BUNDLES

```ml
const NUM_TEXTURE_BUNDLES = 2
```

Number of texture bundles available to a shader stage for multitexture combining.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L23)

<a id="function-function-mq3-renderer-tr-local-packsort-function-packsort-shadernum-entitynum-fognum-dlightmap-src-mq3-renderer-tr-local-ml-773886406"></a>
### packSort

```ml
function packSort(shaderNum, entityNum, fogNum, dlightMap)
```

Computes `(shaderNum<<QSORT_SHADERNUM_SHIFT)|(entityNum<<QSORT_ENTITYNUM_SHIFT)|(fogNum<<QSORT_FOGNUM_SHIFT)|dlightMap` for `mq3.renderer.tr_local.packSort`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shaderNum` | `dynamic` | — | Input used in the result expression `(shaderNum<<QSORT_SHADERNUM_SHIFT)\|(entityNum<<QSORT_ENTITYNUM_SHIFT)\|(fogNum<<QSORT_FOGNUM_SHIFT)\|dlightMap`. |
| `entityNum` | `dynamic` | — | Input used in the result expression `(shaderNum<<QSORT_SHADERNUM_SHIFT)\|(entityNum<<QSORT_ENTITYNUM_SHIFT)\|(fogNum<<QSORT_FOGNUM_SHIFT)\|dlightMap`. |
| `fogNum` | `dynamic` | — | Input used in the result expression `(shaderNum<<QSORT_SHADERNUM_SHIFT)\|(entityNum<<QSORT_ENTITYNUM_SHIFT)\|(fogNum<<QSORT_FOGNUM_SHIFT)\|dlightMap`. |
| `dlightMap` | `dynamic` | — | Input used in the result expression `(shaderNum<<QSORT_SHADERNUM_SHIFT)\|(entityNum<<QSORT_ENTITYNUM_SHIFT)\|(fogNum<<QSORT_FOGNUM_SHIFT)\|dlightMap`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L197)

<a id="constant-constant-mq3-renderer-tr-local-qsort-entitynum-shift-const-qsort-entitynum-shift-7-src-mq3-renderer-tr-local-ml-318583610"></a>
### QSORT_ENTITYNUM_SHIFT

```ml
const QSORT_ENTITYNUM_SHIFT = 7
```

Bit position of the entity number in a packed draw-surface sort key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L63)

<a id="constant-constant-mq3-renderer-tr-local-qsort-fognum-shift-const-qsort-fognum-shift-2-src-mq3-renderer-tr-local-ml-1042212139"></a>
### QSORT_FOGNUM_SHIFT

```ml
const QSORT_FOGNUM_SHIFT = 2
```

Bit position of the fog number in a packed draw-surface sort key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L65)

<a id="constant-constant-mq3-renderer-tr-local-qsort-shadernum-shift-const-qsort-shadernum-shift-17-src-mq3-renderer-tr-local-ml-105114731"></a>
### QSORT_SHADERNUM_SHIFT

```ml
const QSORT_SHADERNUM_SHIFT = 17
```

Bit position of the shader index in a packed draw-surface sort key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L61)

- [mq3.renderer.tr_local.RenderCommandList](Type-mq3-renderer-tr-local-rendercommandlist-1197161940.md) — struct
- [mq3.renderer.tr_local.ScreenshotCommand](Type-mq3-renderer-tr-local-screenshotcommand-50920148.md) — struct
- [mq3.renderer.tr_local.SetColorCommand](Type-mq3-renderer-tr-local-setcolorcommand-380578405.md) — struct
<a id="constant-constant-mq3-renderer-tr-local-side-back-const-side-back-1-src-mq3-renderer-tr-local-ml-1935443016"></a>
### SIDE_BACK

```ml
const SIDE_BACK = 1
```

Plane-classification result indicating the back half-space.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L43)

<a id="constant-constant-mq3-renderer-tr-local-side-front-const-side-front-0-src-mq3-renderer-tr-local-ml-405430205"></a>
### SIDE_FRONT

```ml
const SIDE_FRONT = 0
```

Plane-classification result indicating the front half-space.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L41)

<a id="constant-constant-mq3-renderer-tr-local-side-on-const-side-on-2-src-mq3-renderer-tr-local-ml-1833613643"></a>
### SIDE_ON

```ml
const SIDE_ON = 2
```

Plane-classification result indicating that the point lies on the plane within tolerance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L45)

<a id="constant-constant-mq3-renderer-tr-local-smp-frames-const-smp-frames-2-src-mq3-renderer-tr-local-ml-1610799747"></a>
### SMP_FRAMES

```ml
const SMP_FRAMES = 2
```

Number of frame buffers exchanged between frontend and render thread.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L7)

<a id="function-function-mq3-renderer-tr-local-sortdlight-function-sortdlight-value-src-mq3-renderer-tr-local-ml-3844129"></a>
### sortDlight

```ml
function sortDlight(value)
```

Computes `value&3` for `mq3.renderer.tr_local.sortDlight`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value&3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L209)

<a id="function-function-mq3-renderer-tr-local-sortentity-function-sortentity-value-src-mq3-renderer-tr-local-ml-1930962113"></a>
### sortEntity

```ml
function sortEntity(value)
```

Computes `(value>>QSORT_ENTITYNUM_SHIFT)&1023` for `mq3.renderer.tr_local.sortEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `(value>>QSORT_ENTITYNUM_SHIFT)&1023`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L203)

<a id="function-function-mq3-renderer-tr-local-sortfog-function-sortfog-value-src-mq3-renderer-tr-local-ml-661283301"></a>
### sortFog

```ml
function sortFog(value)
```

Computes `(value>>QSORT_FOGNUM_SHIFT)&31` for `mq3.renderer.tr_local.sortFog`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `(value>>QSORT_FOGNUM_SHIFT)&31`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L206)

<a id="function-function-mq3-renderer-tr-local-sortshader-function-sortshader-value-src-mq3-renderer-tr-local-ml-709787177"></a>
### sortShader

```ml
function sortShader(value)
```

Computes `value>>QSORT_SHADERNUM_SHIFT` for `mq3.renderer.tr_local.sortShader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value>>QSORT_SHADERNUM_SHIFT`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L200)

- [mq3.renderer.tr_local.StretchPicCommand](Type-mq3-renderer-tr-local-stretchpiccommand-826043849.md) — struct
- [mq3.renderer.tr_local.SwapBuffersCommand](Type-mq3-renderer-tr-local-swapbufferscommand-157634796.md) — struct
<a id="constant-constant-mq3-renderer-tr-local-tr-max-texmods-const-tr-max-texmods-4-src-mq3-renderer-tr-local-ml-634580007"></a>
### TR_MAX_TEXMODS

```ml
const TR_MAX_TEXMODS = 4
```

Maximum number of texture-coordinate modifiers accepted by one shader stage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L17)

<a id="function-function-mq3-renderer-tr-local-typenames-function-typenames-src-mq3-renderer-tr-local-ml-1655223538"></a>
### typeNames

```ml
function typeNames()
```

Lists the 61 declared names for `mq3.renderer.tr_local.typeNames`, including `acff_t`, `alphaGen_t`, `backEndCounters_t`, `backEndData_t`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L187)

<a id="constant-constant-mq3-renderer-tr-local-vertexsize-const-vertexsize-8-src-mq3-renderer-tr-local-ml-877534101"></a>
### VERTEXSIZE

```ml
const VERTEXSIZE = 8
```

Number of scalar slots in the legacy packed face-vertex layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_local.ml#L39)
