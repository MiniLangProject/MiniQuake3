# `mq3.format.qfiles.Md3Header`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-md3header-struct-md3header-src-mq3-format-qfiles-ml-1381221123"></a>
## Md3Header

```ml
struct Md3Header
```

Md3Header record for format.qfiles, containing `ident`, `version`, `name`, `flags`, `numFrames`, `numTags`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L310)

## Members

<a id="field-field-mq3-format-qfiles-md3header-flags-flags-src-mq3-format-qfiles-ml-1506945816"></a>
### flags

```ml
flags
```

Raw model flags preserved from the MD3 header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L318)

<a id="field-field-mq3-format-qfiles-md3header-ident-ident-src-mq3-format-qfiles-ml-1474799768"></a>
### ident

```ml
ident
```

Magic value identifying the MD3 model file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L312)

<a id="field-field-mq3-format-qfiles-md3header-name-name-src-mq3-format-qfiles-ml-934119578"></a>
### name

```ml
name
```

Model name stored in the MD3 header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L316)

<a id="field-field-mq3-format-qfiles-md3header-numframes-numframes-src-mq3-format-qfiles-ml-1374840288"></a>
### numFrames

```ml
numFrames
```

Number of animation frames represented by this model, surface, or animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L320)

<a id="field-field-mq3-format-qfiles-md3header-numskins-numskins-src-mq3-format-qfiles-ml-53218328"></a>
### numSkins

```ml
numSkins
```

Number of skin slots declared by the model header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L326)

<a id="field-field-mq3-format-qfiles-md3header-numsurfaces-numsurfaces-src-mq3-format-qfiles-ml-2025087080"></a>
### numSurfaces

```ml
numSurfaces
```

Number of surfaces described by this model or file record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L324)

<a id="field-field-mq3-format-qfiles-md3header-numtags-numtags-src-mq3-format-qfiles-ml-565113040"></a>
### numTags

```ml
numTags
```

Number of attachment tags stored for each model frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L322)

<a id="field-field-mq3-format-qfiles-md3header-ofsend-ofsend-src-mq3-format-qfiles-ml-501104318"></a>
### ofsEnd

```ml
ofsEnd
```

Byte offset of the end of this serialized record, relative to its start.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L334)

<a id="field-field-mq3-format-qfiles-md3header-ofsframes-ofsframes-src-mq3-format-qfiles-ml-895018328"></a>
### ofsFrames

```ml
ofsFrames
```

Byte offset from the file header to the frame records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L328)

<a id="field-field-mq3-format-qfiles-md3header-ofssurfaces-ofssurfaces-src-mq3-format-qfiles-ml-1098422904"></a>
### ofsSurfaces

```ml
ofsSurfaces
```

Byte offset from the file header to the first mesh surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L332)

<a id="field-field-mq3-format-qfiles-md3header-ofstags-ofstags-src-mq3-format-qfiles-ml-1767661788"></a>
### ofsTags

```ml
ofsTags
```

Byte offset from the file header to the attachment tags for all frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L330)

<a id="field-field-mq3-format-qfiles-md3header-version-version-src-mq3-format-qfiles-ml-471886196"></a>
### version

```ml
version
```

MD3 file-format version.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L314)
