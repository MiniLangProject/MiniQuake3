# `mq3.renderer.tr_backend_runtime.ViewParms`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-backend-runtime-ml-370216411.md)

<a id="struct-struct-mq3-renderer-tr-backend-runtime-viewparms-struct-viewparms-src-mq3-renderer-tr-backend-runtime-ml-1983654977"></a>
## ViewParms

```ml
struct ViewParms
```

Data record for `mq3.renderer.tr_backend_runtime.ViewParms`; groups `projectionMatrix`, `viewportX`, `viewportY`, `viewportWidth`, `viewportHeight`, `isPortal`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L88)

## Members

<a id="field-field-mq3-renderer-tr-backend-runtime-viewparms-ismirror-ismirror-src-mq3-renderer-tr-backend-runtime-ml-1293992607"></a>
### isMirror

```ml
isMirror
```

Whether the view is reflected across a mirror surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L102)

<a id="field-field-mq3-renderer-tr-backend-runtime-viewparms-isportal-isportal-src-mq3-renderer-tr-backend-runtime-ml-1391089869"></a>
### isPortal

```ml
isPortal
```

Whether this view renders through a portal surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L100)

<a id="field-field-mq3-renderer-tr-backend-runtime-viewparms-orientationaxis-orientationaxis-src-mq3-renderer-tr-backend-runtime-ml-875760329"></a>
### orientationAxis

```ml
orientationAxis
```

Basis vectors of the current model orientation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L110)

<a id="field-field-mq3-renderer-tr-backend-runtime-viewparms-orientationorigin-orientationorigin-src-mq3-renderer-tr-backend-runtime-ml-1184113873"></a>
### orientationOrigin

```ml
orientationOrigin
```

Origin of the current model orientation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L108)

<a id="field-field-mq3-renderer-tr-backend-runtime-viewparms-portaldist-portaldist-src-mq3-renderer-tr-backend-runtime-ml-1887195557"></a>
### portalDist

```ml
portalDist
```

Signed distance of the plane clipping the portal view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L106)

<a id="field-field-mq3-renderer-tr-backend-runtime-viewparms-portalnormal-portalnormal-src-mq3-renderer-tr-backend-runtime-ml-1207896823"></a>
### portalNormal

```ml
portalNormal
```

Normal of the plane clipping the portal view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L104)

<a id="field-field-mq3-renderer-tr-backend-runtime-viewparms-projectionmatrix-projectionmatrix-src-mq3-renderer-tr-backend-runtime-ml-55971277"></a>
### projectionMatrix

```ml
projectionMatrix
```

Matrix mapping view-space coordinates into clip space.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L90)

<a id="field-field-mq3-renderer-tr-backend-runtime-viewparms-viewportheight-viewportheight-src-mq3-renderer-tr-backend-runtime-ml-285837315"></a>
### viewportHeight

```ml
viewportHeight
```

Height of the viewport, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L98)

<a id="field-field-mq3-renderer-tr-backend-runtime-viewparms-viewportwidth-viewportwidth-src-mq3-renderer-tr-backend-runtime-ml-1240771933"></a>
### viewportWidth

```ml
viewportWidth
```

Width of the viewport, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L96)

<a id="field-field-mq3-renderer-tr-backend-runtime-viewparms-viewportx-viewportx-src-mq3-renderer-tr-backend-runtime-ml-51219837"></a>
### viewportX

```ml
viewportX
```

Horizontal origin of the viewport, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L92)

<a id="field-field-mq3-renderer-tr-backend-runtime-viewparms-viewporty-viewporty-src-mq3-renderer-tr-backend-runtime-ml-1782483485"></a>
### viewportY

```ml
viewportY
```

Vertical origin of the viewport, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L94)

<a id="field-field-mq3-renderer-tr-backend-runtime-viewparms-worldmatrix-worldmatrix-src-mq3-renderer-tr-backend-runtime-ml-290903281"></a>
### worldMatrix

```ml
worldMatrix
```

Matrix transforming world coordinates for the current view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L112)
