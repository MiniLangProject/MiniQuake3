# `mq3.renderer.tr_backend_runtime.DrawPayload`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-backend-runtime-ml-370216411.md)

<a id="struct-struct-mq3-renderer-tr-backend-runtime-drawpayload-struct-drawpayload-src-mq3-renderer-tr-backend-runtime-ml-57770385"></a>
## DrawPayload

```ml
struct DrawPayload
```

Data record for `mq3.renderer.tr_backend_runtime.DrawPayload`; groups `refdef`, `viewParms`, `drawSurfs`, `shaders`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L155)

## Members

<a id="field-field-mq3-renderer-tr-backend-runtime-drawpayload-drawsurfs-drawsurfs-src-mq3-renderer-tr-backend-runtime-ml-694572933"></a>
### drawSurfs

```ml
drawSurfs
```

Surfaces queued for ordering and drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L161)

<a id="field-field-mq3-renderer-tr-backend-runtime-drawpayload-refdef-refdef-src-mq3-renderer-tr-backend-runtime-ml-382084901"></a>
### refdef

```ml
refdef
```

Camera, viewport, timing, and rendering flags for the view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L157)

<a id="field-field-mq3-renderer-tr-backend-runtime-drawpayload-shaders-shaders-src-mq3-renderer-tr-backend-runtime-ml-533493421"></a>
### shaders

```ml
shaders
```

Shader records available to resolve the queued drawing surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L163)

<a id="field-field-mq3-renderer-tr-backend-runtime-drawpayload-viewparms-viewparms-src-mq3-renderer-tr-backend-runtime-ml-1208789"></a>
### viewParms

```ml
viewParms
```

Derived camera matrices, clipping planes, and viewport settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L159)
