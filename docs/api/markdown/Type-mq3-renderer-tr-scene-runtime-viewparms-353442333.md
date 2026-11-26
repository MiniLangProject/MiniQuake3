# `mq3.renderer.tr_scene_runtime.ViewParms`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-scene-runtime-ml-1958871231.md)

<a id="struct-struct-mq3-renderer-tr-scene-runtime-viewparms-struct-viewparms-src-mq3-renderer-tr-scene-runtime-ml-2087222289"></a>
## ViewParms

```ml
struct ViewParms
```

Data record for `mq3.renderer.tr_scene_runtime.ViewParms`; groups `viewportX`, `viewportY`, `viewportWidth`, `viewportHeight`, `isPortal`, `fovX`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L80)

## Members

<a id="field-field-mq3-renderer-tr-scene-runtime-viewparms-axis-axis-src-mq3-renderer-tr-scene-runtime-ml-705011931"></a>
### axis

```ml
axis
```

Prepared camera basis used for the scene's view and projection calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L98)

<a id="field-field-mq3-renderer-tr-scene-runtime-viewparms-fovx-fovx-src-mq3-renderer-tr-scene-runtime-ml-85158211"></a>
### fovX

```ml
fovX
```

Horizontal camera field of view, in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L92)

<a id="field-field-mq3-renderer-tr-scene-runtime-viewparms-fovy-fovy-src-mq3-renderer-tr-scene-runtime-ml-1889122625"></a>
### fovY

```ml
fovY
```

Vertical camera field of view, in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L94)

<a id="field-field-mq3-renderer-tr-scene-runtime-viewparms-isportal-isportal-src-mq3-renderer-tr-scene-runtime-ml-1031343177"></a>
### isPortal

```ml
isPortal
```

Whether this view renders through a portal surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L90)

<a id="field-field-mq3-renderer-tr-scene-runtime-viewparms-origin-origin-src-mq3-renderer-tr-scene-runtime-ml-247643917"></a>
### origin

```ml
origin
```

Camera position used to prepare projection and visibility for the scene view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L96)

<a id="field-field-mq3-renderer-tr-scene-runtime-viewparms-pvsorigin-pvsorigin-src-mq3-renderer-tr-scene-runtime-ml-1733387145"></a>
### pvsOrigin

```ml
pvsOrigin
```

Position used to choose the visibility cluster for this view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L100)

<a id="field-field-mq3-renderer-tr-scene-runtime-viewparms-viewportheight-viewportheight-src-mq3-renderer-tr-scene-runtime-ml-132933859"></a>
### viewportHeight

```ml
viewportHeight
```

Height of the viewport, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L88)

<a id="field-field-mq3-renderer-tr-scene-runtime-viewparms-viewportwidth-viewportwidth-src-mq3-renderer-tr-scene-runtime-ml-362261209"></a>
### viewportWidth

```ml
viewportWidth
```

Width of the viewport, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L86)

<a id="field-field-mq3-renderer-tr-scene-runtime-viewparms-viewportx-viewportx-src-mq3-renderer-tr-scene-runtime-ml-1340162505"></a>
### viewportX

```ml
viewportX
```

Horizontal origin of the viewport, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L82)

<a id="field-field-mq3-renderer-tr-scene-runtime-viewparms-viewporty-viewporty-src-mq3-renderer-tr-scene-runtime-ml-1450724345"></a>
### viewportY

```ml
viewportY
```

Vertical origin of the viewport, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L84)
