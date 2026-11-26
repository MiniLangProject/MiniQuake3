# `mq3.renderer.tr_image_runtime.Services`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-image-runtime-ml-1468528624.md)

<a id="struct-struct-mq3-renderer-tr-image-runtime-services-struct-services-src-mq3-renderer-tr-image-runtime-ml-594787725"></a>
## Services

```ml
struct Services
```

Callback table for `mq3.renderer.tr_image_runtime.Services`; exposes `skinLoadFn`, `writeJpegFn`, `deleteTextureFn`, `gammaFn`, `diagnosticFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L24)

## Members

<a id="field-field-mq3-renderer-tr-image-runtime-services-context-context-src-mq3-renderer-tr-image-runtime-ml-361256845"></a>
### context

```ml
context
```

Image-service state passed to skin loading, JPEG output, texture deletion, and gamma updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L36)

<a id="field-field-mq3-renderer-tr-image-runtime-services-deletetexturefn-deletetexturefn-src-mq3-renderer-tr-image-runtime-ml-1434702485"></a>
### deleteTextureFn

```ml
deleteTextureFn
```

Host callback used to perform delete texture operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L30)

<a id="field-field-mq3-renderer-tr-image-runtime-services-diagnosticfn-diagnosticfn-src-mq3-renderer-tr-image-runtime-ml-1927519979"></a>
### diagnosticFn

```ml
diagnosticFn
```

Host callback used to perform diagnostic operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L34)

<a id="field-field-mq3-renderer-tr-image-runtime-services-gammafn-gammafn-src-mq3-renderer-tr-image-runtime-ml-1109952437"></a>
### gammaFn

```ml
gammaFn
```

Host callback used to perform gamma operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L32)

<a id="field-field-mq3-renderer-tr-image-runtime-services-skinloadfn-skinloadfn-src-mq3-renderer-tr-image-runtime-ml-1125293219"></a>
### skinLoadFn

```ml
skinLoadFn
```

Host callback used to perform skin load operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L26)

<a id="field-field-mq3-renderer-tr-image-runtime-services-writejpegfn-writejpegfn-src-mq3-renderer-tr-image-runtime-ml-910018537"></a>
### writeJpegFn

```ml
writeJpegFn
```

Host callback used to perform write jpeg operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_image_runtime.ml#L28)
