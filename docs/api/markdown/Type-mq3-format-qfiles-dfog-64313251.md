# `mq3.format.qfiles.Dfog`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-dfog-struct-dfog-src-mq3-format-qfiles-ml-1199012291"></a>
## Dfog

```ml
struct Dfog
```

Dfog record for format.qfiles, containing `shader`, `brushNum`, `visibleSide`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L530)

## Members

<a id="field-field-mq3-format-qfiles-dfog-brushnum-brushnum-src-mq3-format-qfiles-ml-492077303"></a>
### brushNum

```ml
brushNum
```

Index of the collision brush defining this fog volume.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L534)

<a id="field-field-mq3-format-qfiles-dfog-shader-shader-src-mq3-format-qfiles-ml-94000829"></a>
### shader

```ml
shader
```

Shader name or descriptor associated with this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L532)

<a id="field-field-mq3-format-qfiles-dfog-visibleside-visibleside-src-mq3-format-qfiles-ml-791810819"></a>
### visibleSide

```ml
visibleSide
```

Brush-side index exposed for fog clipping, or minus one when no side is selected.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L536)
