# `mq3.renderer.tr_bsp_runtime.Surface`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-bsp-runtime-ml-595364148.md)

<a id="struct-struct-mq3-renderer-tr-bsp-runtime-surface-struct-surface-src-mq3-renderer-tr-bsp-runtime-ml-366884073"></a>
## Surface

```ml
struct Surface
```

Data record for `mq3.renderer.tr_bsp_runtime.Surface`; groups `index`, `kind`, `shader`, `fogIndex`, `data`, `flare`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L62)

## Members

<a id="field-field-mq3-renderer-tr-bsp-runtime-surface-data-data-src-mq3-renderer-tr-bsp-runtime-ml-994067156"></a>
### data

```ml
data
```

Geometry payload interpreted according to the surface kind.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L72)

<a id="field-field-mq3-renderer-tr-bsp-runtime-surface-flare-flare-src-mq3-renderer-tr-bsp-runtime-ml-1733015212"></a>
### flare

```ml
flare
```

Map flare data attached to the BSP surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L74)

<a id="field-field-mq3-renderer-tr-bsp-runtime-surface-fogindex-fogindex-src-mq3-renderer-tr-bsp-runtime-ml-845846836"></a>
### fogIndex

```ml
fogIndex
```

Index of the fog volume affecting the surface or primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L70)

<a id="field-field-mq3-renderer-tr-bsp-runtime-surface-index-index-src-mq3-renderer-tr-bsp-runtime-ml-1870891544"></a>
### index

```ml
index
```

Position of this record in its owning table or list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L64)

<a id="field-field-mq3-renderer-tr-bsp-runtime-surface-kind-kind-src-mq3-renderer-tr-bsp-runtime-ml-753761152"></a>
### kind

```ml
kind
```

BSP surface representation selecting face, patch grid, triangle mesh, or flare payload data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L66)

<a id="field-field-mq3-renderer-tr-bsp-runtime-surface-shader-shader-src-mq3-renderer-tr-bsp-runtime-ml-1537128554"></a>
### shader

```ml
shader
```

Resolved shader record or handle used for this drawing operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L68)
