# `mq3.renderer.tr_sky.SkySide`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-sky-ml-1241105341.md)

<a id="struct-struct-mq3-renderer-tr-sky-skyside-struct-skyside-src-mq3-renderer-tr-sky-ml-300786709"></a>
## SkySide

```ml
struct SkySide
```

Data record for `mq3.renderer.tr_sky.SkySide`; groups `image`, `axis`, `mesh`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L57)

## Members

<a id="field-field-mq3-renderer-tr-sky-skyside-axis-axis-src-mq3-renderer-tr-sky-ml-1663630413"></a>
### axis

```ml
axis
```

Skybox cube-face index used to orient this side of the sky mesh.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L61)

<a id="field-field-mq3-renderer-tr-sky-skyside-image-image-src-mq3-renderer-tr-sky-ml-543944491"></a>
### image

```ml
image
```

Skybox texture selected for this oriented cube face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L59)

<a id="field-field-mq3-renderer-tr-sky-skyside-mesh-mesh-src-mq3-renderer-tr-sky-ml-994031009"></a>
### mesh

```ml
mesh
```

Vertex and index geometry prepared for the skybox face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L63)
