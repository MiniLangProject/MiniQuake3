# `mq3.format.qfiles.Md4Frame`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-md4frame-struct-md4frame-src-mq3-format-qfiles-ml-1613076347"></a>
## Md4Frame

```ml
struct Md4Frame
```

Md4Frame record for format.qfiles, containing `bounds`, `localOrigin`, `radius`, `bones`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L394)

## Members

<a id="field-field-mq3-format-qfiles-md4frame-bones-bones-src-mq3-format-qfiles-ml-1112636575"></a>
### bones

```ml
bones
```

Bone transform matrices for this animation frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L402)

<a id="field-field-mq3-format-qfiles-md4frame-bounds-bounds-src-mq3-format-qfiles-ml-111141741"></a>
### bounds

```ml
bounds
```

Model-local minimum and maximum corners enclosing every surface and LOD in this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L396)

<a id="field-field-mq3-format-qfiles-md4frame-localorigin-localorigin-src-mq3-format-qfiles-ml-1570234535"></a>
### localOrigin

```ml
localOrigin
```

Model-local center used for the frame bounding sphere.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L398)

<a id="field-field-mq3-format-qfiles-md4frame-radius-radius-src-mq3-format-qfiles-ml-1984163075"></a>
### radius

```ml
radius
```

Radius of the represented sphere or capsule.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L400)
