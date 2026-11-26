# `mq3.format.qfiles.Md4Vertex`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-md4vertex-struct-md4vertex-src-mq3-format-qfiles-ml-405689963"></a>
## Md4Vertex

```ml
struct Md4Vertex
```

Md4Vertex record for format.qfiles, containing `normal`, `texCoords`, `numWeights`, `weights`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L346)

## Members

<a id="field-field-mq3-format-qfiles-md4vertex-normal-normal-src-mq3-format-qfiles-ml-1160603656"></a>
### normal

```ml
normal
```

Model-local normal vector blended with the skeletal vertex influences.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L348)

<a id="field-field-mq3-format-qfiles-md4vertex-numweights-numweights-src-mq3-format-qfiles-ml-937626556"></a>
### numWeights

```ml
numWeights
```

Number of bone weights attached to this skinned vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L352)

<a id="field-field-mq3-format-qfiles-md4vertex-texcoords-texcoords-src-mq3-format-qfiles-ml-1448620702"></a>
### texCoords

```ml
texCoords
```

Texture coordinates associated with the represented vertex or triangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L350)

<a id="field-field-mq3-format-qfiles-md4vertex-weights-weights-src-mq3-format-qfiles-ml-380423738"></a>
### weights

```ml
weights
```

Bone weights that transform this skinned vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L354)
