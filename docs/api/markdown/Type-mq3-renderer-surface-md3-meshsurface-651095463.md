# `mq3.renderer.surface_md3.MeshSurface`

[Home](README.md) · [Source file](File-src-mq3-renderer-surface-md3-ml-438987327.md)

<a id="struct-struct-mq3-renderer-surface-md3-meshsurface-struct-meshsurface-src-mq3-renderer-surface-md3-ml-1499852241"></a>
## MeshSurface

```ml
struct MeshSurface
```

Data record for `mq3.renderer.surface_md3.MeshSurface`; groups `numFrames`, `numVerts`, `numTriangles`, `triangles`, `texCoords`, `frames`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L26)

## Members

<a id="field-field-mq3-renderer-surface-md3-meshsurface-frames-frames-src-mq3-renderer-surface-md3-ml-632824203"></a>
### frames

```ml
frames
```

Per-frame animation data retained for model interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L38)

<a id="field-field-mq3-renderer-surface-md3-meshsurface-numframes-numframes-src-mq3-renderer-surface-md3-ml-935894539"></a>
### numFrames

```ml
numFrames
```

Number of animation frames stored in the model surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L28)

<a id="field-field-mq3-renderer-surface-md3-meshsurface-numtriangles-numtriangles-src-mq3-renderer-surface-md3-ml-34556133"></a>
### numTriangles

```ml
numTriangles
```

Number of triangles stored in the model surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L32)

<a id="field-field-mq3-renderer-surface-md3-meshsurface-numverts-numverts-src-mq3-renderer-surface-md3-ml-127724387"></a>
### numVerts

```ml
numVerts
```

Number of vertices stored in the polygon or model surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L30)

<a id="field-field-mq3-renderer-surface-md3-meshsurface-packedframes-packedframes-src-mq3-renderer-surface-md3-ml-1278402883"></a>
### packedFrames

```ml
packedFrames
```

Packed MD3 vertex records for each animation frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L40)

<a id="field-field-mq3-renderer-surface-md3-meshsurface-texcoords-texcoords-src-mq3-renderer-surface-md3-ml-1108532671"></a>
### texCoords

```ml
texCoords
```

Per-vertex MD3 texture coordinates shared by all animation frames of the surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L36)

<a id="field-field-mq3-renderer-surface-md3-meshsurface-triangles-triangles-src-mq3-renderer-surface-md3-ml-167897347"></a>
### triangles

```ml
triangles
```

Triangle records or index triplets represented by this geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L34)
