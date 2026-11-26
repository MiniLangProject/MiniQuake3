# `mq3.renderer.tr_light_runtime.Orientation`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-light-runtime-ml-1502188283.md)

<a id="struct-struct-mq3-renderer-tr-light-runtime-orientation-struct-orientation-src-mq3-renderer-tr-light-runtime-ml-381252409"></a>
## Orientation

```ml
struct Orientation
```

Data record for `mq3.renderer.tr_light_runtime.Orientation`; groups `origin`, `axis`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_light_runtime.ml#L28)

## Members

<a id="field-field-mq3-renderer-tr-light-runtime-orientation-axis-axis-src-mq3-renderer-tr-light-runtime-ml-1690101857"></a>
### axis

```ml
axis
```

Object basis used to rotate incoming light directions into entity-local space.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_light_runtime.ml#L32)

<a id="field-field-mq3-renderer-tr-light-runtime-orientation-origin-origin-src-mq3-renderer-tr-light-runtime-ml-428850275"></a>
### origin

```ml
origin
```

Entity origin used to transform world lighting into the object's local coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_light_runtime.ml#L30)
