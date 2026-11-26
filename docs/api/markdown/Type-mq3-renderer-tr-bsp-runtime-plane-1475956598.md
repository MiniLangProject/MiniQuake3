# `mq3.renderer.tr_bsp_runtime.Plane`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-bsp-runtime-ml-595364148.md)

<a id="struct-struct-mq3-renderer-tr-bsp-runtime-plane-struct-plane-src-mq3-renderer-tr-bsp-runtime-ml-1302156835"></a>
## Plane

```ml
struct Plane
```

Data record for `mq3.renderer.tr_bsp_runtime.Plane`; groups `normal`, `dist`, `type`, `signbits`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L51)

## Members

<a id="field-field-mq3-renderer-tr-bsp-runtime-plane-dist-dist-src-mq3-renderer-tr-bsp-runtime-ml-985716659"></a>
### dist

```ml
dist
```

Signed plane distance measured along its normal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L55)

<a id="field-field-mq3-renderer-tr-bsp-runtime-plane-normal-normal-src-mq3-renderer-tr-bsp-runtime-ml-203333393"></a>
### normal

```ml
normal
```

BSP plane direction loaded for partition, surface, and visibility calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L53)

<a id="field-field-mq3-renderer-tr-bsp-runtime-plane-signbits-signbits-src-mq3-renderer-tr-bsp-runtime-ml-148520817"></a>
### signbits

```ml
signbits
```

Sign-bit mask of the plane normal used for fast bounds classification.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L59)

<a id="field-field-mq3-renderer-tr-bsp-runtime-plane-type-type-src-mq3-renderer-tr-bsp-runtime-ml-1960182183"></a>
### type

```ml
type
```

Plane classification used to select axial or general distance calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L57)
