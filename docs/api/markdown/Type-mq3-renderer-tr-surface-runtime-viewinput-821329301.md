# `mq3.renderer.tr_surface_runtime.ViewInput`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-surface-runtime-ml-230018798.md)

<a id="struct-struct-mq3-renderer-tr-surface-runtime-viewinput-struct-viewinput-src-mq3-renderer-tr-surface-runtime-ml-210197769"></a>
## ViewInput

```ml
struct ViewInput
```

Data record for `mq3.renderer.tr_surface_runtime.ViewInput`; groups `origin`, `axis`, `isMirror`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L66)

## Members

<a id="field-field-mq3-renderer-tr-surface-runtime-viewinput-axis-axis-src-mq3-renderer-tr-surface-runtime-ml-1977824362"></a>
### axis

```ml
axis
```

View basis supplying the facing directions for generated billboards and beam geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L70)

<a id="field-field-mq3-renderer-tr-surface-runtime-viewinput-ismirror-ismirror-src-mq3-renderer-tr-surface-runtime-ml-525070142"></a>
### isMirror

```ml
isMirror
```

Whether the view is reflected across a mirror surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L72)

<a id="field-field-mq3-renderer-tr-surface-runtime-viewinput-origin-origin-src-mq3-renderer-tr-surface-runtime-ml-929931840"></a>
### origin

```ml
origin
```

Eye position used to orient generated entity surfaces toward the viewer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L68)
