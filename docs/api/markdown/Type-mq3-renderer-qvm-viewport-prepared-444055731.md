# `mq3.renderer.qvm_viewport.Prepared`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-viewport-ml-2024971226.md)

<a id="struct-struct-mq3-renderer-qvm-viewport-prepared-struct-prepared-src-mq3-renderer-qvm-viewport-ml-330330165"></a>
## Prepared

```ml
struct Prepared
```

Data record for `mq3.renderer.qvm_viewport.Prepared`; groups `area`, `projection`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_viewport.ml#L10)

## Members

<a id="field-field-mq3-renderer-qvm-viewport-prepared-area-area-src-mq3-renderer-qvm-viewport-ml-1948104032"></a>
### area

```ml
area
```

Full target-pixel viewport rectangle, including portions outside the framebuffer; scissoring occurs later.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_viewport.ml#L12)

<a id="field-field-mq3-renderer-qvm-viewport-prepared-projection-projection-src-mq3-renderer-qvm-viewport-ml-1993664372"></a>
### projection

```ml
projection
```

Viewer Projection record with camera basis, pixel center, separate horizontal/vertical focal lengths, and near distance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_viewport.ml#L14)
