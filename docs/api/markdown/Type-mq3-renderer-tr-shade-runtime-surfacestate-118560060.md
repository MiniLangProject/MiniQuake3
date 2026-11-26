# `mq3.renderer.tr_shade_runtime.SurfaceState`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-shade-runtime-ml-605145768.md)

<a id="struct-struct-mq3-renderer-tr-shade-runtime-surfacestate-struct-surfacestate-src-mq3-renderer-tr-shade-runtime-ml-2107760681"></a>
## SurfaceState

```ml
struct SurfaceState
```

Data record for `mq3.renderer.tr_shade_runtime.SurfaceState`; groups `shader`, `fogNum`, `dlightBits`, `shaderTime`, `numIndexes`, `numVertexes`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L62)

## Members

<a id="field-field-mq3-renderer-tr-shade-runtime-surfacestate-dlightbits-dlightbits-src-mq3-renderer-tr-shade-runtime-ml-649358641"></a>
### dlightBits

```ml
dlightBits
```

Bit mask identifying dynamic lights that affect this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L68)

<a id="field-field-mq3-renderer-tr-shade-runtime-surfacestate-fognum-fognum-src-mq3-renderer-tr-shade-runtime-ml-2136918549"></a>
### fogNum

```ml
fogNum
```

Fog volume number encoded or used by the draw surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L66)

<a id="field-field-mq3-renderer-tr-shade-runtime-surfacestate-iteratorname-iteratorname-src-mq3-renderer-tr-shade-runtime-ml-1622115103"></a>
### iteratorName

```ml
iteratorName
```

Backend iterator selected to execute the shader's drawing stages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L78)

<a id="field-field-mq3-renderer-tr-shade-runtime-surfacestate-numindexes-numindexes-src-mq3-renderer-tr-shade-runtime-ml-1618781521"></a>
### numIndexes

```ml
numIndexes
```

Number of indices currently stored or submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L72)

<a id="field-field-mq3-renderer-tr-shade-runtime-surfacestate-numpasses-numpasses-src-mq3-renderer-tr-shade-runtime-ml-1695765037"></a>
### numPasses

```ml
numPasses
```

Number of material passes required to draw the current surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L76)

<a id="field-field-mq3-renderer-tr-shade-runtime-surfacestate-numvertexes-numvertexes-src-mq3-renderer-tr-shade-runtime-ml-475768689"></a>
### numVertexes

```ml
numVertexes
```

Number of vertices currently stored or submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L74)

<a id="field-field-mq3-renderer-tr-shade-runtime-surfacestate-shader-shader-src-mq3-renderer-tr-shade-runtime-ml-1228817691"></a>
### shader

```ml
shader
```

Resolved shader record or handle used for this drawing operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L64)

<a id="field-field-mq3-renderer-tr-shade-runtime-surfacestate-shadertime-shadertime-src-mq3-renderer-tr-shade-runtime-ml-713988645"></a>
### shaderTime

```ml
shaderTime
```

Effective shader time in seconds after the material time offset and clamp have been applied.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L70)
