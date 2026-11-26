# `mq3.renderer.tr_bsp_runtime.Visibility`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-bsp-runtime-ml-595364148.md)

<a id="struct-struct-mq3-renderer-tr-bsp-runtime-visibility-struct-visibility-src-mq3-renderer-tr-bsp-runtime-ml-25983985"></a>
## Visibility

```ml
struct Visibility
```

Data record for `mq3.renderer.tr_bsp_runtime.Visibility`; groups `numClusters`, `clusterBytes`, `data`, `novis`, `external`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L117)

## Members

<a id="field-field-mq3-renderer-tr-bsp-runtime-visibility-clusterbytes-clusterbytes-src-mq3-renderer-tr-bsp-runtime-ml-1357612799"></a>
### clusterBytes

```ml
clusterBytes
```

Number of bytes in one potentially-visible-cluster bitset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L121)

<a id="field-field-mq3-renderer-tr-bsp-runtime-visibility-data-data-src-mq3-renderer-tr-bsp-runtime-ml-1500402121"></a>
### data

```ml
data
```

Packed potentially-visible-cluster bitsets loaded from the BSP visibility lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L123)

<a id="field-field-mq3-renderer-tr-bsp-runtime-visibility-external-external-src-mq3-renderer-tr-bsp-runtime-ml-2116161883"></a>
### external

```ml
external
```

Whether visibility bytes are supplied by the collision subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L127)

<a id="field-field-mq3-renderer-tr-bsp-runtime-visibility-novis-novis-src-mq3-renderer-tr-bsp-runtime-ml-938863925"></a>
### novis

```ml
novis
```

Fallback visibility mask used when no valid PVS data is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L125)

<a id="field-field-mq3-renderer-tr-bsp-runtime-visibility-numclusters-numclusters-src-mq3-renderer-tr-bsp-runtime-ml-1250188817"></a>
### numClusters

```ml
numClusters
```

Number of clusters represented by the visibility table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L119)
