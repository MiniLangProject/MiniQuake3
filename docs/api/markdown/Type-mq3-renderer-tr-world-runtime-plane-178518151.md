# `mq3.renderer.tr_world_runtime.Plane`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-world-runtime-ml-1466231431.md)

<a id="struct-struct-mq3-renderer-tr-world-runtime-plane-struct-plane-src-mq3-renderer-tr-world-runtime-ml-109274493"></a>
## Plane

```ml
struct Plane
```

Data record for `mq3.renderer.tr_world_runtime.Plane`; groups `normal`, `dist`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_world_runtime.ml#L25)

## Members

<a id="field-field-mq3-renderer-tr-world-runtime-plane-dist-dist-src-mq3-renderer-tr-world-runtime-ml-772794975"></a>
### dist

```ml
dist
```

Signed plane distance measured along its normal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_world_runtime.ml#L29)

<a id="field-field-mq3-renderer-tr-world-runtime-plane-normal-normal-src-mq3-renderer-tr-world-runtime-ml-760483149"></a>
### normal

```ml
normal
```

World partition-plane normal used during BSP traversal and surface culling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_world_runtime.ml#L27)
