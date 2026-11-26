# `mq3.renderer.surface_md3.PackedVertex`

[Home](README.md) · [Source file](File-src-mq3-renderer-surface-md3-ml-438987327.md)

<a id="struct-struct-mq3-renderer-surface-md3-packedvertex-struct-packedvertex-src-mq3-renderer-surface-md3-ml-992919715"></a>
## PackedVertex

```ml
struct PackedVertex
```

Data record for `mq3.renderer.surface_md3.PackedVertex`; groups `xyz`, `packedNormal`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L19)

## Members

<a id="field-field-mq3-renderer-surface-md3-packedvertex-packednormal-packednormal-src-mq3-renderer-surface-md3-ml-1041745701"></a>
### packedNormal

```ml
packedNormal
```

MD3 normal encoded as two angular bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L23)

<a id="field-field-mq3-renderer-surface-md3-packedvertex-xyz-xyz-src-mq3-renderer-surface-md3-ml-263249819"></a>
### xyz

```ml
xyz
```

Three-dimensional vertex positions used by this geometry record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L21)
