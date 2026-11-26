# `mq3.format.qfiles.Dsurface`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-dsurface-struct-dsurface-src-mq3-format-qfiles-ml-2005890999"></a>
## Dsurface

```ml
struct Dsurface
```

Dsurface record for format.qfiles, containing `shaderNum`, `fogNum`, `surfaceType`, `firstVert`, `numVerts`, `firstIndex`, and 10 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L552)

## Members

<a id="field-field-mq3-format-qfiles-dsurface-firstindex-firstindex-src-mq3-format-qfiles-ml-748652746"></a>
### firstIndex

```ml
firstIndex
```

Index of the first index element belonging to this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L564)

<a id="field-field-mq3-format-qfiles-dsurface-firstvert-firstvert-src-mq3-format-qfiles-ml-272686866"></a>
### firstVert

```ml
firstVert
```

Index of the first vertex belonging to this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L560)

<a id="field-field-mq3-format-qfiles-dsurface-fognum-fognum-src-mq3-format-qfiles-ml-114857974"></a>
### fogNum

```ml
fogNum
```

Index of the fog volume associated with this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L556)

<a id="field-field-mq3-format-qfiles-dsurface-lightmapheight-lightmapheight-src-mq3-format-qfiles-ml-195673984"></a>
### lightmapHeight

```ml
lightmapHeight
```

Height of this surface's lightmap rectangle, in texels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L576)

<a id="field-field-mq3-format-qfiles-dsurface-lightmapnum-lightmapnum-src-mq3-format-qfiles-ml-407484858"></a>
### lightmapNum

```ml
lightmapNum
```

Index of the lightmap used by this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L568)

<a id="field-field-mq3-format-qfiles-dsurface-lightmaporigin-lightmaporigin-src-mq3-format-qfiles-ml-1238584610"></a>
### lightmapOrigin

```ml
lightmapOrigin
```

World-space origin used to generate the surface's lightmap coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L578)

<a id="field-field-mq3-format-qfiles-dsurface-lightmapvecs-lightmapvecs-src-mq3-format-qfiles-ml-646787024"></a>
### lightmapVecs

```ml
lightmapVecs
```

Lightmap projection vectors; patch surfaces reuse the first two vectors for LOD bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L580)

<a id="field-field-mq3-format-qfiles-dsurface-lightmapwidth-lightmapwidth-src-mq3-format-qfiles-ml-1449236874"></a>
### lightmapWidth

```ml
lightmapWidth
```

Width of this surface's lightmap rectangle, in texels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L574)

<a id="field-field-mq3-format-qfiles-dsurface-lightmapx-lightmapx-src-mq3-format-qfiles-ml-475378162"></a>
### lightmapX

```ml
lightmapX
```

Horizontal origin of this surface's rectangle in its lightmap image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L570)

<a id="field-field-mq3-format-qfiles-dsurface-lightmapy-lightmapy-src-mq3-format-qfiles-ml-463574358"></a>
### lightmapY

```ml
lightmapY
```

Vertical origin of this surface's rectangle in its lightmap image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L572)

<a id="field-field-mq3-format-qfiles-dsurface-numindexes-numindexes-src-mq3-format-qfiles-ml-1216856930"></a>
### numIndexes

```ml
numIndexes
```

Number of index elements describing this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L566)

<a id="field-field-mq3-format-qfiles-dsurface-numverts-numverts-src-mq3-format-qfiles-ml-714520102"></a>
### numVerts

```ml
numVerts
```

Number of vertices described by this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L562)

<a id="field-field-mq3-format-qfiles-dsurface-patchheight-patchheight-src-mq3-format-qfiles-ml-390819598"></a>
### patchHeight

```ml
patchHeight
```

Number of control-point rows in the curved patch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L584)

<a id="field-field-mq3-format-qfiles-dsurface-patchwidth-patchwidth-src-mq3-format-qfiles-ml-1396068858"></a>
### patchWidth

```ml
patchWidth
```

Number of control points across the curved patch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L582)

<a id="field-field-mq3-format-qfiles-dsurface-shadernum-shadernum-src-mq3-format-qfiles-ml-1804764082"></a>
### shaderNum

```ml
shaderNum
```

Index of the shader referenced by this geometric element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L554)

<a id="field-field-mq3-format-qfiles-dsurface-surfacetype-surfacetype-src-mq3-format-qfiles-ml-2063601470"></a>
### surfaceType

```ml
surfaceType
```

BSP surface-kind identifier, such as planar, patch, or triangle mesh.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L558)
