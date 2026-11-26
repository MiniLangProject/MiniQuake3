# `mq3.format.qfiles.Md4Weight`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-md4weight-struct-md4weight-src-mq3-format-qfiles-ml-1191072755"></a>
## Md4Weight

```ml
struct Md4Weight
```

Md4Weight record for format.qfiles, containing `boneIndex`, `boneWeight`, `offset`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L337)

## Members

<a id="field-field-mq3-format-qfiles-md4weight-boneindex-boneindex-src-mq3-format-qfiles-ml-1344639152"></a>
### boneIndex

```ml
boneIndex
```

Index into the surface bone-reference table for this skinning influence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L339)

<a id="field-field-mq3-format-qfiles-md4weight-boneweight-boneweight-src-mq3-format-qfiles-ml-1892407656"></a>
### boneWeight

```ml
boneWeight
```

Fraction of the vertex position contributed by this bone influence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L341)

<a id="field-field-mq3-format-qfiles-md4weight-offset-offset-src-mq3-format-qfiles-ml-1744249498"></a>
### offset

```ml
offset
```

Bone-local XYZ position transformed by this skinning weight.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L343)
