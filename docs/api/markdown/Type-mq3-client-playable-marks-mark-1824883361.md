# `mq3.client.playable_marks.Mark`

[Home](README.md) · [Source file](File-src-mq3-client-playable-marks-ml-2118417332.md)

<a id="struct-struct-mq3-client-playable-marks-mark-struct-mark-src-mq3-client-playable-marks-ml-974228429"></a>
## Mark

```ml
struct Mark
```

Stores playable marks mark record, including `key`, `kind`, `origin`, `normal`, `radius`, `orientation` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L56)

## Members

<a id="field-field-mq3-client-playable-marks-mark-alphafade-alphafade-src-mq3-client-playable-marks-ml-969462382"></a>
### alphaFade

```ml
alphaFade
```

True when the mark fades its alpha channel instead of its RGB components.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L75)

<a id="field-field-mq3-client-playable-marks-mark-bornat-bornat-src-mq3-client-playable-marks-ml-977360058"></a>
### bornAt

```ml
bornAt
```

When constructing this record, `append` supplies `bornAt` for this member. Used by `hasKey` and `update` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L73)

<a id="field-field-mq3-client-playable-marks-mark-key-key-src-mq3-client-playable-marks-ml-80914154"></a>
### key

```ml
key
```

When constructing this record, `append` supplies `key` for this member. Used by `hasKey` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L59)

<a id="field-field-mq3-client-playable-marks-mark-kind-kind-src-mq3-client-playable-marks-ml-624312066"></a>
### kind

```ml
kind
```

Effect or media category selecting the matching geometry, texture, or presentation behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L61)

<a id="field-field-mq3-client-playable-marks-mark-normal-normal-src-mq3-client-playable-marks-ml-1967269800"></a>
### normal

```ml
normal
```

Supporting surface normal used to construct the decal's tangent basis.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L65)

<a id="field-field-mq3-client-playable-marks-mark-orientation-orientation-src-mq3-client-playable-marks-ml-651729294"></a>
### orientation

```ml
orientation
```

When constructing this record, `append` supplies `orientation(key,bornAt)` for this member. Used by `axes` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L70)

<a id="field-field-mq3-client-playable-marks-mark-origin-origin-src-mq3-client-playable-marks-ml-633058954"></a>
### origin

```ml
origin
```

World-space decal center used with the surface basis to construct the mark's corners.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L63)

<a id="field-field-mq3-client-playable-marks-mark-radius-radius-src-mq3-client-playable-marks-ml-1912094938"></a>
### radius

```ml
radius
```

World-space half-size of the surface-aligned impact decal quad.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_marks.ml#L67)
