# `mq3.client.playable_marks.Catalog`

[Home](README.md) · [Source file](File-src-mq3-client-playable-marks-ml-2118417332.md)

<a id="struct-struct-mq3-client-playable-marks-catalog-struct-catalog-src-mq3-client-playable-marks-ml-901145213"></a>
## Catalog

```ml
struct Catalog
```

Stores playable marks catalog record, including `textures`, `firstTextureSlot`, `textureCount`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L46)

## Members

<a id="field-field-mq3-client-playable-marks-catalog-firsttextureslot-firsttextureslot-src-mq3-client-playable-marks-ml-1869435030"></a>
### firstTextureSlot

```ml
firstTextureSlot
```

First texture-cache slot reserved for this module's media resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L51)

<a id="field-field-mq3-client-playable-marks-catalog-texturecount-texturecount-src-mq3-client-playable-marks-ml-906255356"></a>
### textureCount

```ml
textureCount
```

Number of texture resources or texture-cache slots represented by this media record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L53)

<a id="field-field-mq3-client-playable-marks-catalog-textures-textures-src-mq3-client-playable-marks-ml-1809414200"></a>
### textures

```ml
textures
```

When constructing this record, `load` supplies `textures` for this member. Used by `upload` and `release` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L49)
