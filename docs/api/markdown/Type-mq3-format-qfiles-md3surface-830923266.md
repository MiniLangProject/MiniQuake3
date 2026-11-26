# `mq3.format.qfiles.Md3Surface`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-md3surface-struct-md3surface-src-mq3-format-qfiles-ml-108983915"></a>
## Md3Surface

```ml
struct Md3Surface
```

Md3Surface record for format.qfiles, containing `ident`, `name`, `flags`, `numFrames`, `numShaders`, `numVerts`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L259)

## Members

<a id="field-field-mq3-format-qfiles-md3surface-flags-flags-src-mq3-format-qfiles-ml-1519049636"></a>
### flags

```ml
flags
```

Raw surface flags preserved from the MD3 file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L265)

<a id="field-field-mq3-format-qfiles-md3surface-ident-ident-src-mq3-format-qfiles-ml-1714194660"></a>
### ident

```ml
ident
```

MD3 signature stored in this surface record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L261)

<a id="field-field-mq3-format-qfiles-md3surface-name-name-src-mq3-format-qfiles-ml-1212989606"></a>
### name

```ml
name
```

Surface name used to associate geometry with a skin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L263)

<a id="field-field-mq3-format-qfiles-md3surface-numframes-numframes-src-mq3-format-qfiles-ml-1942923532"></a>
### numFrames

```ml
numFrames
```

Number of animation frames represented by this model, surface, or animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L267)

<a id="field-field-mq3-format-qfiles-md3surface-numshaders-numshaders-src-mq3-format-qfiles-ml-76710236"></a>
### numShaders

```ml
numShaders
```

Number of shader references stored for this model surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L269)

<a id="field-field-mq3-format-qfiles-md3surface-numtriangles-numtriangles-src-mq3-format-qfiles-ml-1984674562"></a>
### numTriangles

```ml
numTriangles
```

Number of indexed triangles in this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L273)

<a id="field-field-mq3-format-qfiles-md3surface-numverts-numverts-src-mq3-format-qfiles-ml-18623496"></a>
### numVerts

```ml
numVerts
```

Number of vertices described by this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L271)

<a id="field-field-mq3-format-qfiles-md3surface-ofsend-ofsend-src-mq3-format-qfiles-ml-716422362"></a>
### ofsEnd

```ml
ofsEnd
```

Byte offset of the end of this serialized record, relative to its start.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L283)

<a id="field-field-mq3-format-qfiles-md3surface-ofsshaders-ofsshaders-src-mq3-format-qfiles-ml-2056328696"></a>
### ofsShaders

```ml
ofsShaders
```

Byte offset from this surface header to its shader references.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L277)

<a id="field-field-mq3-format-qfiles-md3surface-ofsst-ofsst-src-mq3-format-qfiles-ml-1506738316"></a>
### ofsSt

```ml
ofsSt
```

Byte offset from this surface header to texture coordinates shared by all frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L279)

<a id="field-field-mq3-format-qfiles-md3surface-ofstriangles-ofstriangles-src-mq3-format-qfiles-ml-627085522"></a>
### ofsTriangles

```ml
ofsTriangles
```

Byte offset of the triangle-index table from the start of the surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L275)

<a id="field-field-mq3-format-qfiles-md3surface-ofsxyznormals-ofsxyznormals-src-mq3-format-qfiles-ml-1278893180"></a>
### ofsXyzNormals

```ml
ofsXyzNormals
```

Byte offset from this surface header to the per-frame packed positions and normals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L281)
