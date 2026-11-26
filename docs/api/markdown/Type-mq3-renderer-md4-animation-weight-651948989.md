# `mq3.renderer.md4_animation.Weight`

[Home](README.md) · [Source file](File-src-mq3-renderer-md4-animation-ml-17219499.md)

<a id="struct-struct-mq3-renderer-md4-animation-weight-struct-weight-src-mq3-renderer-md4-animation-ml-1427999907"></a>
## Weight

```ml
struct Weight
```

Data record for `mq3.renderer.md4_animation.Weight`; groups `boneIndex`, `boneWeight`, `offset`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md4_animation.ml#L14)

## Members

<a id="field-field-mq3-renderer-md4-animation-weight-boneindex-boneindex-src-mq3-renderer-md4-animation-ml-1068373785"></a>
### boneIndex

```ml
boneIndex
```

Index of the skeleton bone contributing this vertex weight.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md4_animation.ml#L16)

<a id="field-field-mq3-renderer-md4-animation-weight-boneweight-boneweight-src-mq3-renderer-md4-animation-ml-1354256729"></a>
### boneWeight

```ml
boneWeight
```

Blend weight of the bone's contribution to the animated vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md4_animation.ml#L18)

<a id="field-field-mq3-renderer-md4-animation-weight-offset-offset-src-mq3-renderer-md4-animation-ml-247886355"></a>
### offset

```ml
offset
```

Vertex offset in the coordinate system of the influencing bone.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md4_animation.ml#L20)
