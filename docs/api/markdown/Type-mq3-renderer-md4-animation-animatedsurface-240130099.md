# `mq3.renderer.md4_animation.AnimatedSurface`

[Home](README.md) · [Source file](File-src-mq3-renderer-md4-animation-ml-17219499.md)

<a id="struct-struct-mq3-renderer-md4-animation-animatedsurface-struct-animatedsurface-src-mq3-renderer-md4-animation-ml-307303501"></a>
## AnimatedSurface

```ml
struct AnimatedSurface
```

Data record for `mq3.renderer.md4_animation.AnimatedSurface`; groups `positions`, `normals`, `texCoords`, `indexes`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L58)

## Members

<a id="field-field-mq3-renderer-md4-animation-animatedsurface-indexes-indexes-src-mq3-renderer-md4-animation-ml-1640443059"></a>
### indexes

```ml
indexes
```

Skeletal surface triangle indices referencing the bone-transformed position array.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L66)

<a id="field-field-mq3-renderer-md4-animation-animatedsurface-normals-normals-src-mq3-renderer-md4-animation-ml-1976524707"></a>
### normals

```ml
normals
```

Vertex normals used when lighting or transforming the geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L62)

<a id="field-field-mq3-renderer-md4-animation-animatedsurface-positions-positions-src-mq3-renderer-md4-animation-ml-1038571999"></a>
### positions

```ml
positions
```

Vertex positions obtained by accumulating the weighted bone transformations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L60)

<a id="field-field-mq3-renderer-md4-animation-animatedsurface-texcoords-texcoords-src-mq3-renderer-md4-animation-ml-1561468559"></a>
### texCoords

```ml
texCoords
```

Texture-coordinate array paired with the bone-transformed surface vertices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L64)
