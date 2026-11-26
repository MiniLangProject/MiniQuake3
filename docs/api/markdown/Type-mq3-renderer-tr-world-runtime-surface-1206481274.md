# `mq3.renderer.tr_world_runtime.Surface`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-world-runtime-ml-1466231431.md)

<a id="struct-struct-mq3-renderer-tr-world-runtime-surface-struct-surface-src-mq3-renderer-tr-world-runtime-ml-1416912639"></a>
## Surface

```ml
struct Surface
```

Data record for `mq3.renderer.tr_world_runtime.Surface`; groups `kind`, `bounds`, `localOrigin`, `meshRadius`, `plane`, `cullType`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L39)

## Members

<a id="field-field-mq3-renderer-tr-world-runtime-surface-bounds-bounds-src-mq3-renderer-tr-world-runtime-ml-627493310"></a>
### bounds

```ml
bounds
```

Minimum and maximum corners enclosing the object or surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L43)

<a id="field-field-mq3-renderer-tr-world-runtime-surface-culltype-culltype-src-mq3-renderer-tr-world-runtime-ml-1047006788"></a>
### cullType

```ml
cullType
```

Front-face, back-face, or two-sided surface-culling rule.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L51)

<a id="field-field-mq3-renderer-tr-world-runtime-surface-dlightbits-dlightbits-src-mq3-renderer-tr-world-runtime-ml-983452636"></a>
### dlightBits

```ml
dlightBits
```

Bit mask identifying dynamic lights that affect this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L57)

<a id="field-field-mq3-renderer-tr-world-runtime-surface-fogindex-fogindex-src-mq3-renderer-tr-world-runtime-ml-1945713640"></a>
### fogIndex

```ml
fogIndex
```

Index of the fog volume affecting the surface or primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L55)

<a id="field-field-mq3-renderer-tr-world-runtime-surface-kind-kind-src-mq3-renderer-tr-world-runtime-ml-2088662356"></a>
### kind

```ml
kind
```

World-surface category used to choose bounds culling and dynamic-light intersection rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L41)

<a id="field-field-mq3-renderer-tr-world-runtime-surface-localorigin-localorigin-src-mq3-renderer-tr-world-runtime-ml-451432364"></a>
### localOrigin

```ml
localOrigin
```

Center of the mesh's local-space bounding sphere.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L45)

<a id="field-field-mq3-renderer-tr-world-runtime-surface-meshradius-meshradius-src-mq3-renderer-tr-world-runtime-ml-537187038"></a>
### meshRadius

```ml
meshRadius
```

Radius of the mesh's local-space bounding sphere.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L47)

<a id="field-field-mq3-renderer-tr-world-runtime-surface-plane-plane-src-mq3-renderer-tr-world-runtime-ml-290400820"></a>
### plane

```ml
plane
```

Splitting or clipping plane associated with the BSP node or surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L49)

<a id="field-field-mq3-renderer-tr-world-runtime-surface-viewcount-viewcount-src-mq3-renderer-tr-world-runtime-ml-1939064888"></a>
### viewCount

```ml
viewCount
```

Generation number used to avoid processing a surface twice in one view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L53)
