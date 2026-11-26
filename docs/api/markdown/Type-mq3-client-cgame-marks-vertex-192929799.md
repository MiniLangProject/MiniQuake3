# `mq3.client.cgame_marks.Vertex`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-marks-ml-1111050399.md)

<a id="struct-struct-mq3-client-cgame-marks-vertex-struct-vertex-src-mq3-client-cgame-marks-ml-1455441511"></a>
## Vertex

```ml
struct Vertex
```

Stores client game marks vertex record, including `xyz`, `st`, `modulate`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L30)

## Members

<a id="field-field-mq3-client-cgame-marks-vertex-modulate-modulate-src-mq3-client-cgame-marks-ml-1942762205"></a>
### modulate

```ml
modulate
```

When constructing this record, `makeVertex` supplies `[color[0],color[1],color[2],color[3]]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L39)

<a id="field-field-mq3-client-cgame-marks-vertex-st-st-src-mq3-client-cgame-marks-ml-811363209"></a>
### st

```ml
st
```

When constructing this record, `makeVertex` supplies `[0.5+qmath.DotProduct(delta,axis1)*scale,0.5+qmath.DotProduct(delta,axis2)*scale]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L36)

<a id="field-field-mq3-client-cgame-marks-vertex-xyz-xyz-src-mq3-client-cgame-marks-ml-1822755943"></a>
### xyz

```ml
xyz
```

When constructing this record, `makeVertex` supplies `copy3(point)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L32)
