# `mq3.format.qfiles.Dleaf`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-dleaf-struct-dleaf-src-mq3-format-qfiles-ml-95137073"></a>
## Dleaf

```ml
struct Dleaf
```

Dleaf record for format.qfiles, containing `cluster`, `area`, `mins`, `maxs`, `firstLeafSurface`, `numLeafSurfaces`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L495)

## Members

<a id="field-field-mq3-format-qfiles-dleaf-area-area-src-mq3-format-qfiles-ml-130326563"></a>
### area

```ml
area
```

Portal-area index containing this BSP leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L499)

<a id="field-field-mq3-format-qfiles-dleaf-cluster-cluster-src-mq3-format-qfiles-ml-286943229"></a>
### cluster

```ml
cluster
```

Visibility-cluster index of this leaf, or minus one for opaque space.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L497)

<a id="field-field-mq3-format-qfiles-dleaf-firstleafbrush-firstleafbrush-src-mq3-format-qfiles-ml-481668917"></a>
### firstLeafBrush

```ml
firstLeafBrush
```

Index of the first brush reference for this BSP leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L509)

<a id="field-field-mq3-format-qfiles-dleaf-firstleafsurface-firstleafsurface-src-mq3-format-qfiles-ml-385068555"></a>
### firstLeafSurface

```ml
firstLeafSurface
```

Index of the first surface reference for this BSP leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L505)

<a id="field-field-mq3-format-qfiles-dleaf-maxs-maxs-src-mq3-format-qfiles-ml-466160159"></a>
### maxs

```ml
maxs
```

Maximum XYZ corner of the region occupied by this serialized BSP leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L503)

<a id="field-field-mq3-format-qfiles-dleaf-mins-mins-src-mq3-format-qfiles-ml-963588619"></a>
### mins

```ml
mins
```

Minimum XYZ corner of the region occupied by this serialized BSP leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L501)

<a id="field-field-mq3-format-qfiles-dleaf-numleafbrushes-numleafbrushes-src-mq3-format-qfiles-ml-2141450381"></a>
### numLeafBrushes

```ml
numLeafBrushes
```

Number of brush references belonging to this BSP leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L511)

<a id="field-field-mq3-format-qfiles-dleaf-numleafsurfaces-numleafsurfaces-src-mq3-format-qfiles-ml-1109210785"></a>
### numLeafSurfaces

```ml
numLeafSurfaces
```

Number of surface references belonging to this BSP leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L507)
