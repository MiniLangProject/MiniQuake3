# `mq3.format.qfiles.Md4Header`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-md4header-struct-md4header-src-mq3-format-qfiles-ml-799682497"></a>
## Md4Header

```ml
struct Md4Header
```

Md4Header record for format.qfiles, containing `ident`, `version`, `name`, `numFrames`, `numBones`, `ofsBoneNames`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L414)

## Members

<a id="field-field-mq3-format-qfiles-md4header-ident-ident-src-mq3-format-qfiles-ml-894870023"></a>
### ident

```ml
ident
```

Magic value identifying the MD4 model file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L416)

<a id="field-field-mq3-format-qfiles-md4header-name-name-src-mq3-format-qfiles-ml-1107930381"></a>
### name

```ml
name
```

Model name stored in the MD4 header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L420)

<a id="field-field-mq3-format-qfiles-md4header-numbones-numbones-src-mq3-format-qfiles-ml-1568061793"></a>
### numBones

```ml
numBones
```

Number of skeleton bones represented by the model or frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L424)

<a id="field-field-mq3-format-qfiles-md4header-numframes-numframes-src-mq3-format-qfiles-ml-16544431"></a>
### numFrames

```ml
numFrames
```

Number of animation frames represented by this model, surface, or animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L422)

<a id="field-field-mq3-format-qfiles-md4header-numlods-numlods-src-mq3-format-qfiles-ml-116436827"></a>
### numLods

```ml
numLods
```

Number of level-of-detail records in the model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L430)

<a id="field-field-mq3-format-qfiles-md4header-ofsbonenames-ofsbonenames-src-mq3-format-qfiles-ml-1219089591"></a>
### ofsBoneNames

```ml
ofsBoneNames
```

Byte offset from the file header to fixed-length bone-name strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L426)

<a id="field-field-mq3-format-qfiles-md4header-ofsend-ofsend-src-mq3-format-qfiles-ml-2120806333"></a>
### ofsEnd

```ml
ofsEnd
```

Byte offset of the end of this serialized record, relative to its start.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L434)

<a id="field-field-mq3-format-qfiles-md4header-ofsframes-ofsframes-src-mq3-format-qfiles-ml-452986791"></a>
### ofsFrames

```ml
ofsFrames
```

Byte offset from the file header to the skeletal animation frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L428)

<a id="field-field-mq3-format-qfiles-md4header-ofslods-ofslods-src-mq3-format-qfiles-ml-242551911"></a>
### ofsLods

```ml
ofsLods
```

Byte offset of the level-of-detail table from the start of the model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L432)

<a id="field-field-mq3-format-qfiles-md4header-version-version-src-mq3-format-qfiles-ml-657855675"></a>
### version

```ml
version
```

MD4 file-format version.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L418)
