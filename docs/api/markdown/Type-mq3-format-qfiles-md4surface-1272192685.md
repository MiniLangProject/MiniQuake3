# `mq3.format.qfiles.Md4Surface`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-md4surface-struct-md4surface-src-mq3-format-qfiles-ml-1035647935"></a>
## Md4Surface

```ml
struct Md4Surface
```

Md4Surface record for format.qfiles, containing `ident`, `name`, `shader`, `shaderIndex`, `ofsHeader`, `numVerts`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L362)

## Members

<a id="field-field-mq3-format-qfiles-md4surface-ident-ident-src-mq3-format-qfiles-ml-1259784289"></a>
### ident

```ml
ident
```

MD4 signature stored in this surface record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L364)

<a id="field-field-mq3-format-qfiles-md4surface-name-name-src-mq3-format-qfiles-ml-377681295"></a>
### name

```ml
name
```

Name identifying the skinned surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L366)

<a id="field-field-mq3-format-qfiles-md4surface-numbonereferences-numbonereferences-src-mq3-format-qfiles-ml-459669889"></a>
### numBoneReferences

```ml
numBoneReferences
```

Number of entries in the surface's bone-reference table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L382)

<a id="field-field-mq3-format-qfiles-md4surface-numtriangles-numtriangles-src-mq3-format-qfiles-ml-1968019251"></a>
### numTriangles

```ml
numTriangles
```

Number of indexed triangles in this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L378)

<a id="field-field-mq3-format-qfiles-md4surface-numverts-numverts-src-mq3-format-qfiles-ml-371027473"></a>
### numVerts

```ml
numVerts
```

Number of vertices described by this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L374)

<a id="field-field-mq3-format-qfiles-md4surface-ofsbonereferences-ofsbonereferences-src-mq3-format-qfiles-ml-409549345"></a>
### ofsBoneReferences

```ml
ofsBoneReferences
```

Byte offset of the bone-reference table from the start of the surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L384)

<a id="field-field-mq3-format-qfiles-md4surface-ofsend-ofsend-src-mq3-format-qfiles-ml-97121263"></a>
### ofsEnd

```ml
ofsEnd
```

Byte offset of the end of this serialized record, relative to its start.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L386)

<a id="field-field-mq3-format-qfiles-md4surface-ofsheader-ofsheader-src-mq3-format-qfiles-ml-1802390625"></a>
### ofsHeader

```ml
ofsHeader
```

Negative byte offset from this surface to the enclosing model header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L372)

<a id="field-field-mq3-format-qfiles-md4surface-ofstriangles-ofstriangles-src-mq3-format-qfiles-ml-917511051"></a>
### ofsTriangles

```ml
ofsTriangles
```

Byte offset of the triangle-index table from the start of the surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L380)

<a id="field-field-mq3-format-qfiles-md4surface-ofsverts-ofsverts-src-mq3-format-qfiles-ml-319520757"></a>
### ofsVerts

```ml
ofsVerts
```

Byte offset of the vertex table from the start of the surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L376)

<a id="field-field-mq3-format-qfiles-md4surface-shader-shader-src-mq3-format-qfiles-ml-712328871"></a>
### shader

```ml
shader
```

Shader name or descriptor associated with this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L368)

<a id="field-field-mq3-format-qfiles-md4surface-shaderindex-shaderindex-src-mq3-format-qfiles-ml-490917165"></a>
### shaderIndex

```ml
shaderIndex
```

Runtime renderer shader handle associated with this model material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L370)
