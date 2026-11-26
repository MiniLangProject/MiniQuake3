# `mq3.botlib.server_imports.DebugPolygon`

[Home](README.md) · [Source file](File-src-mq3-botlib-server-imports-ml-1126004744.md)

<a id="struct-struct-mq3-botlib-server-imports-debugpolygon-struct-debugpolygon-src-mq3-botlib-server-imports-ml-370583289"></a>
## DebugPolygon

```ml
struct DebugPolygon
```

`DebugPolygon` record for server imports, containing `inuse`, `color` and `points`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L58)

## Members

<a id="field-field-mq3-botlib-server-imports-debugpolygon-color-color-src-mq3-botlib-server-imports-ml-1624988316"></a>
### color

```ml
color
```

Color components associated with the vertex or debug primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L62)

<a id="field-field-mq3-botlib-server-imports-debugpolygon-inuse-inuse-src-mq3-botlib-server-imports-ml-368818112"></a>
### inuse

```ml
inuse
```

True when this debug polygon or managed entry owns an active slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L60)

<a id="field-field-mq3-botlib-server-imports-debugpolygon-points-points-src-mq3-botlib-server-imports-ml-1514280338"></a>
### points

```ml
points
```

XYZ points defining the debug shape, polygon, or winding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_imports.ml#L64)
