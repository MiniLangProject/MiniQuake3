# `mq3.renderer.md4_animation.Vertex`

[Home](README.md) · [Source file](File-src-mq3-renderer-md4-animation-ml-17219499.md)

<a id="struct-struct-mq3-renderer-md4-animation-vertex-struct-vertex-src-mq3-renderer-md4-animation-ml-487902223"></a>
## Vertex

```ml
struct Vertex
```

Data record for `mq3.renderer.md4_animation.Vertex`; groups `normal`, `texCoords`, `weights`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L23)

## Members

<a id="field-field-mq3-renderer-md4-animation-vertex-normal-normal-src-mq3-renderer-md4-animation-ml-1592376861"></a>
### normal

```ml
normal
```

Unskinned vertex normal transformed by the weighted skeletal bone matrices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L25)

<a id="field-field-mq3-renderer-md4-animation-vertex-texcoords-texcoords-src-mq3-renderer-md4-animation-ml-730335695"></a>
### texCoords

```ml
texCoords
```

Texture coordinates stored with the unskinned skeletal vertex and preserved during bone deformation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L28)

<a id="field-field-mq3-renderer-md4-animation-vertex-weights-weights-src-mq3-renderer-md4-animation-ml-1336577835"></a>
### weights

```ml
weights
```

Bone influences used to deform this skeletal vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L30)
