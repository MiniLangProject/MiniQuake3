# `mq3.format.qfiles.DrawVert`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-drawvert-struct-drawvert-src-mq3-format-qfiles-ml-1397873067"></a>
## DrawVert

```ml
struct DrawVert
```

DrawVert record for format.qfiles, containing `xyz`, `st`, `lightmap`, `normal`, `color`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L539)

## Members

<a id="field-field-mq3-format-qfiles-drawvert-color-color-src-mq3-format-qfiles-ml-1985077492"></a>
### color

```ml
color
```

Color components associated with the vertex or debug primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L549)

<a id="field-field-mq3-format-qfiles-drawvert-lightmap-lightmap-src-mq3-format-qfiles-ml-1131972136"></a>
### lightmap

```ml
lightmap
```

Lightmap texture coordinates for this vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L545)

<a id="field-field-mq3-format-qfiles-drawvert-normal-normal-src-mq3-format-qfiles-ml-1584572510"></a>
### normal

```ml
normal
```

Surface normal used to light this BSP rendering vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L547)

<a id="field-field-mq3-format-qfiles-drawvert-st-st-src-mq3-format-qfiles-ml-1817229250"></a>
### st

```ml
st
```

Two-dimensional texture coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L543)

<a id="field-field-mq3-format-qfiles-drawvert-xyz-xyz-src-mq3-format-qfiles-ml-1228697988"></a>
### xyz

```ml
xyz
```

XYZ position components stored by this vertex record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L541)
