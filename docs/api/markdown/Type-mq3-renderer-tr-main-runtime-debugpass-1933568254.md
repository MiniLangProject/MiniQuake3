# `mq3.renderer.tr_main_runtime.DebugPass`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-main-runtime-ml-668641946.md)

<a id="struct-struct-mq3-renderer-tr-main-runtime-debugpass-struct-debugpass-src-mq3-renderer-tr-main-runtime-ml-2050797697"></a>
## DebugPass

```ml
struct DebugPass
```

Data record for `mq3.renderer.tr_main_runtime.DebugPass`; groups `color`, `points`, `wireframe`, `depthMin`, `depthMax`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_main_runtime.ml#L71)

## Members

<a id="field-field-mq3-renderer-tr-main-runtime-debugpass-color-color-src-mq3-renderer-tr-main-runtime-ml-129097419"></a>
### color

```ml
color
```

Uniform color selected for the filled or wireframe debug polygon pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_main_runtime.ml#L73)

<a id="field-field-mq3-renderer-tr-main-runtime-debugpass-depthmax-depthmax-src-mq3-renderer-tr-main-runtime-ml-2143483073"></a>
### depthMax

```ml
depthMax
```

Upper bound of the depth range used by this rendering pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_main_runtime.ml#L81)

<a id="field-field-mq3-renderer-tr-main-runtime-debugpass-depthmin-depthmin-src-mq3-renderer-tr-main-runtime-ml-1411391757"></a>
### depthMin

```ml
depthMin
```

Lower bound of the depth range used by this rendering pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_main_runtime.ml#L79)

<a id="field-field-mq3-renderer-tr-main-runtime-debugpass-points-points-src-mq3-renderer-tr-main-runtime-ml-1607058397"></a>
### points

```ml
points
```

Points defining the face, polygon, or clipping result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_main_runtime.ml#L75)

<a id="field-field-mq3-renderer-tr-main-runtime-debugpass-wireframe-wireframe-src-mq3-renderer-tr-main-runtime-ml-305352503"></a>
### wireframe

```ml
wireframe
```

Whether polygon edges are drawn instead of filled triangles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_main_runtime.ml#L77)
