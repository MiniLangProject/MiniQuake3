# `mq3.format.qfiles.Md4Lod`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-md4lod-struct-md4lod-src-mq3-format-qfiles-ml-128570087"></a>
## Md4Lod

```ml
struct Md4Lod
```

Md4Lod record for format.qfiles, containing `numSurfaces`, `ofsSurfaces`, `ofsEnd`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L405)

## Members

<a id="field-field-mq3-format-qfiles-md4lod-numsurfaces-numsurfaces-src-mq3-format-qfiles-ml-98789285"></a>
### numSurfaces

```ml
numSurfaces
```

Number of surfaces described by this model or file record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L407)

<a id="field-field-mq3-format-qfiles-md4lod-ofsend-ofsend-src-mq3-format-qfiles-ml-958100291"></a>
### ofsEnd

```ml
ofsEnd
```

Byte offset of the end of this serialized record, relative to its start.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L411)

<a id="field-field-mq3-format-qfiles-md4lod-ofssurfaces-ofssurfaces-src-mq3-format-qfiles-ml-411740501"></a>
### ofsSurfaces

```ml
ofsSurfaces
```

Byte offset from this LOD header to its first mesh surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L409)
