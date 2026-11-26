# `mq3.renderer.tr_bsp_runtime.Model`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-bsp-runtime-ml-595364148.md)

<a id="struct-struct-mq3-renderer-tr-bsp-runtime-model-struct-model-src-mq3-renderer-tr-bsp-runtime-ml-410320101"></a>
## Model

```ml
struct Model
```

Data record for `mq3.renderer.tr_bsp_runtime.Model`; groups `index`, `name`, `bounds`, `firstSurface`, `numSurfaces`, `renderData`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L77)

## Members

<a id="field-field-mq3-renderer-tr-bsp-runtime-model-bounds-bounds-src-mq3-renderer-tr-bsp-runtime-ml-1294804508"></a>
### bounds

```ml
bounds
```

Minimum and maximum corners enclosing the object or surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L83)

<a id="field-field-mq3-renderer-tr-bsp-runtime-model-firstsurface-firstsurface-src-mq3-renderer-tr-bsp-runtime-ml-489131716"></a>
### firstSurface

```ml
firstSurface
```

Index of the model's first surface in the world surface array.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L85)

<a id="field-field-mq3-renderer-tr-bsp-runtime-model-index-index-src-mq3-renderer-tr-bsp-runtime-ml-1869358578"></a>
### index

```ml
index
```

Position of this record in its owning table or list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L79)

<a id="field-field-mq3-renderer-tr-bsp-runtime-model-name-name-src-mq3-renderer-tr-bsp-runtime-ml-1755598404"></a>
### name

```ml
name
```

Inline BSP model name used to resolve the model's world-surface range.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L81)

<a id="field-field-mq3-renderer-tr-bsp-runtime-model-numsurfaces-numsurfaces-src-mq3-renderer-tr-bsp-runtime-ml-1567810774"></a>
### numSurfaces

```ml
numSurfaces
```

Number of surfaces belonging to the model or draw group.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L87)

<a id="field-field-mq3-renderer-tr-bsp-runtime-model-renderdata-renderdata-src-mq3-renderer-tr-bsp-runtime-ml-1980542502"></a>
### renderData

```ml
renderData
```

Prepared triangle and vertex data used to render the world or model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L89)
