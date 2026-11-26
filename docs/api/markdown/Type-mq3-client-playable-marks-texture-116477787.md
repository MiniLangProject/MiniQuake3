# `mq3.client.playable_marks.Texture`

[Home](README.md) · [Source file](File-src-mq3-client-playable-marks-ml-2118417332.md)

<a id="struct-struct-mq3-client-playable-marks-texture-struct-texture-src-mq3-client-playable-marks-ml-1296030437"></a>
## Texture

```ml
struct Texture
```

Stores playable marks texture record, including `kind`, `name`, `image`, `slot`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L34)

## Members

<a id="field-field-mq3-client-playable-marks-texture-image-image-src-mq3-client-playable-marks-ml-704067108"></a>
### image

```ml
image
```

When constructing this record, `load` supplies `loaded[1]` for this member. Used by `upload` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L41)

<a id="field-field-mq3-client-playable-marks-texture-kind-kind-src-mq3-client-playable-marks-ml-1929592816"></a>
### kind

```ml
kind
```

Effect or media category selecting the matching geometry, texture, or presentation behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L36)

<a id="field-field-mq3-client-playable-marks-texture-name-name-src-mq3-client-playable-marks-ml-600133282"></a>
### name

```ml
name
```

Virtual resource or definition name used to locate this entry in the client asset catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L38)

<a id="field-field-mq3-client-playable-marks-texture-slot-slot-src-mq3-client-playable-marks-ml-1340912828"></a>
### slot

```ml
slot
```

Texture or media-cache slot assigned to this asset for renderer submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L43)
