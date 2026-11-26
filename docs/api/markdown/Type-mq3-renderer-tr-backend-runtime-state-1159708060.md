# `mq3.renderer.tr_backend_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-backend-runtime-ml-370216411.md)

<a id="struct-struct-mq3-renderer-tr-backend-runtime-state-struct-state-src-mq3-renderer-tr-backend-runtime-ml-236914963"></a>
## State

```ml
struct State
```

Data record for `mq3.renderer.tr_backend_runtime.State`; groups `textureState`, `gl`, `commandBackend`, `services`, `width`, `height`, and 19 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L219)

## Members

<a id="field-field-mq3-renderer-tr-backend-runtime-state-color2d-color2d-src-mq3-renderer-tr-backend-runtime-ml-292603546"></a>
### color2D

```ml
color2D
```

RGBA modulation color used for two-dimensional drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L259)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-commandbackend-commandbackend-src-mq3-renderer-tr-backend-runtime-ml-1737330620"></a>
### commandBackend

```ml
commandBackend
```

Backend state used to execute queued renderer commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L225)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-currententity-currententity-src-mq3-renderer-tr-backend-runtime-ml-1012142114"></a>
### currentEntity

```ml
currentEntity
```

Renderer entity whose surfaces are currently being processed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L249)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-finishcalled-finishcalled-src-mq3-renderer-tr-backend-runtime-ml-1922441906"></a>
### finishCalled

```ml
finishCalled
```

Whether a graphics completion barrier was already issued for this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L235)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-frames-frames-src-mq3-renderer-tr-backend-runtime-ml-512712706"></a>
### frames

```ml
frames
```

Number of completed backend frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L269)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-gl-gl-src-mq3-renderer-tr-backend-runtime-ml-576916748"></a>
### gl

```ml
gl
```

Cached graphics state used by the renderer backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L223)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-height-height-src-mq3-renderer-tr-backend-runtime-ml-470232248"></a>
### height

```ml
height
```

Height in pixels of the framebuffer used to establish the backend 2D projection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L231)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-ishyperspace-ishyperspace-src-mq3-renderer-tr-backend-runtime-ml-1020352190"></a>
### isHyperspace

```ml
isHyperspace
```

Whether the special hyperspace rendering effect is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L237)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-msec-msec-src-mq3-renderer-tr-backend-runtime-ml-1622303270"></a>
### msec

```ml
msec
```

Elapsed duration of the operation or frame, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L263)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-numindexes-numindexes-src-mq3-renderer-tr-backend-runtime-ml-909334730"></a>
### numIndexes

```ml
numIndexes
```

Number of indices currently stored or submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L257)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-overdraw-overdraw-src-mq3-renderer-tr-backend-runtime-ml-1394901570"></a>
### overdraw

```ml
overdraw
```

Accumulated overdraw measurement for the rendered frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L261)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-projection2d-projection2d-src-mq3-renderer-tr-backend-runtime-ml-603226308"></a>
### projection2D

```ml
projection2D
```

Whether the backend currently uses its two-dimensional projection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L233)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-rawimages-rawimages-src-mq3-renderer-tr-backend-runtime-ml-337426770"></a>
### rawImages

```ml
rawImages
```

Cinematic or raw image resources retained by the backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L265)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-refdef-refdef-src-mq3-renderer-tr-backend-runtime-ml-1724917818"></a>
### refdef

```ml
refdef
```

Camera, viewport, timing, and rendering flags for the view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L243)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-services-services-src-mq3-renderer-tr-backend-runtime-ml-122825994"></a>
### services

```ml
services
```

Injected host operations used by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L227)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-skyrenderedthisview-skyrenderedthisview-src-mq3-renderer-tr-backend-runtime-ml-874213290"></a>
### skyRenderedThisView

```ml
skyRenderedThisView
```

Whether the sky pass has already been submitted for this view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L239)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-smpframe-smpframe-src-mq3-renderer-tr-backend-runtime-ml-1042811156"></a>
### smpFrame

```ml
smpFrame
```

Index of the frame buffer shared between frontend and render thread.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L241)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-tessdlight-tessdlight-src-mq3-renderer-tr-backend-runtime-ml-778015824"></a>
### tessDlight

```ml
tessDlight
```

Dynamic-light state currently selected for the tessellation buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L255)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-tessfog-tessfog-src-mq3-renderer-tr-backend-runtime-ml-1010209614"></a>
### tessFog

```ml
tessFog
```

Fog volume currently selected for the tessellation buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L253)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-tessshader-tessshader-src-mq3-renderer-tr-backend-runtime-ml-1656817038"></a>
### tessShader

```ml
tessShader
```

Shader currently selected for the tessellation buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L251)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-texturestate-texturestate-src-mq3-renderer-tr-backend-runtime-ml-1451340094"></a>
### textureState

```ml
textureState
```

Cached texture bindings and active texture-unit state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L221)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-uploads-uploads-src-mq3-renderer-tr-backend-runtime-ml-70383482"></a>
### uploads

```ml
uploads
```

Image uploads recorded or prepared by the backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L267)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-viewparms-viewparms-src-mq3-renderer-tr-backend-runtime-ml-2113308274"></a>
### viewParms

```ml
viewParms
```

Derived camera matrices, clipping planes, and viewport settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L245)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-width-width-src-mq3-renderer-tr-backend-runtime-ml-365939846"></a>
### width

```ml
width
```

Width in pixels of the framebuffer used to establish the backend 2D projection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L229)

<a id="field-field-mq3-renderer-tr-backend-runtime-state-worldentity-worldentity-src-mq3-renderer-tr-backend-runtime-ml-244984202"></a>
### worldEntity

```ml
worldEntity
```

Renderer entity representing static world geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L247)
