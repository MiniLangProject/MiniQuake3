# `mq3.format.qfiles.Dmodel`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-dmodel-struct-dmodel-src-mq3-format-qfiles-ml-1271213227"></a>
## Dmodel

```ml
struct Dmodel
```

Dmodel record for format.qfiles, containing `mins`, `maxs`, `firstSurface`, `numSurfaces`, `firstBrush`, `numBrushes`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L453)

## Members

<a id="field-field-mq3-format-qfiles-dmodel-firstbrush-firstbrush-src-mq3-format-qfiles-ml-631234352"></a>
### firstBrush

```ml
firstBrush
```

Index of the first collision brush belonging to this map model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L463)

<a id="field-field-mq3-format-qfiles-dmodel-firstsurface-firstsurface-src-mq3-format-qfiles-ml-573291298"></a>
### firstSurface

```ml
firstSurface
```

Index of the first surface belonging to this map model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L459)

<a id="field-field-mq3-format-qfiles-dmodel-maxs-maxs-src-mq3-format-qfiles-ml-854760278"></a>
### maxs

```ml
maxs
```

Maximum XYZ corner of the inline model described by this serialized BSP record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L457)

<a id="field-field-mq3-format-qfiles-dmodel-mins-mins-src-mq3-format-qfiles-ml-1598819182"></a>
### mins

```ml
mins
```

Minimum XYZ corner of the inline model described by this serialized BSP record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L455)

<a id="field-field-mq3-format-qfiles-dmodel-numbrushes-numbrushes-src-mq3-format-qfiles-ml-1451870528"></a>
### numBrushes

```ml
numBrushes
```

Number of collision brushes referenced by this map element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L465)

<a id="field-field-mq3-format-qfiles-dmodel-numsurfaces-numsurfaces-src-mq3-format-qfiles-ml-740000888"></a>
### numSurfaces

```ml
numSurfaces
```

Number of surfaces described by this model or file record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L461)
