# `mq3.renderer.tr_shade_runtime.DlightPass`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-shade-runtime-ml-605145768.md)

<a id="struct-struct-mq3-renderer-tr-shade-runtime-dlightpass-struct-dlightpass-src-mq3-renderer-tr-shade-runtime-ml-737630941"></a>
## DlightPass

```ml
struct DlightPass
```

Data record for `mq3.renderer.tr_shade_runtime.DlightPass`; groups `lightIndex`, `uvs`, `colors`, `indexes`, `additive`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L117)

## Members

<a id="field-field-mq3-renderer-tr-shade-runtime-dlightpass-additive-additive-src-mq3-renderer-tr-shade-runtime-ml-246113566"></a>
### additive

```ml
additive
```

Whether the dynamic light contributes additively rather than modulating the surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L127)

<a id="field-field-mq3-renderer-tr-shade-runtime-dlightpass-colors-colors-src-mq3-renderer-tr-shade-runtime-ml-1944981014"></a>
### colors

```ml
colors
```

Per-vertex colors containing the projected dynamic-light contribution for this pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L123)

<a id="field-field-mq3-renderer-tr-shade-runtime-dlightpass-indexes-indexes-src-mq3-renderer-tr-shade-runtime-ml-1731126574"></a>
### indexes

```ml
indexes
```

Selected triangle indices retained for the projected dynamic-light pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L125)

<a id="field-field-mq3-renderer-tr-shade-runtime-dlightpass-lightindex-lightindex-src-mq3-renderer-tr-shade-runtime-ml-1440874694"></a>
### lightIndex

```ml
lightIndex
```

Index of the dynamic light used by the lighting pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L119)

<a id="field-field-mq3-renderer-tr-shade-runtime-dlightpass-uvs-uvs-src-mq3-renderer-tr-shade-runtime-ml-2083686046"></a>
### uvs

```ml
uvs
```

Texture coordinates generated for the pass or its vertices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L121)
