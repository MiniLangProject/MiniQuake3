# `mq3.renderer.tr_light_runtime.Surface`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-light-runtime-ml-1502188283.md)

<a id="struct-struct-mq3-renderer-tr-light-runtime-surface-struct-surface-src-mq3-renderer-tr-light-runtime-ml-503219559"></a>
## Surface

```ml
struct Surface
```

Data record for `mq3.renderer.tr_light_runtime.Surface`; groups `surfaceType`, `dlightBits`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L46)

## Members

<a id="field-field-mq3-renderer-tr-light-runtime-surface-dlightbits-dlightbits-src-mq3-renderer-tr-light-runtime-ml-841273508"></a>
### dlightBits

```ml
dlightBits
```

Bit mask identifying dynamic lights that affect this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L50)

<a id="field-field-mq3-renderer-tr-light-runtime-surface-surfacetype-surfacetype-src-mq3-renderer-tr-light-runtime-ml-180765592"></a>
### surfaceType

```ml
surfaceType
```

Surface-dispatch tag identifying the concrete geometry representation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L48)
