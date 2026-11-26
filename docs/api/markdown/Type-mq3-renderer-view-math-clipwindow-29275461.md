# `mq3.renderer.view_math.ClipWindow`

[Home](README.md) · [Source file](File-src-mq3-renderer-view-math-ml-126526929.md)

<a id="struct-struct-mq3-renderer-view-math-clipwindow-struct-clipwindow-src-mq3-renderer-view-math-ml-44304339"></a>
## ClipWindow

```ml
struct ClipWindow
```

Data record for `mq3.renderer.view_math.ClipWindow`; groups `normalized`, `window`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L32)

## Members

<a id="field-field-mq3-renderer-view-math-clipwindow-normalized-normalized-src-mq3-renderer-view-math-ml-481398897"></a>
### normalized

```ml
normalized
```

Perspective-divided X/Y and depth Z remapped to the usual zero-to-one range; components are not clamped.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L34)

<a id="field-field-mq3-renderer-view-math-clipwindow-window-window-src-mq3-renderer-view-math-ml-801054411"></a>
### window

```ml
window
```

Viewport-relative pixel X/Y followed by the same remapped depth Z; only X/Y are rounded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/view_math.ml#L36)
