# `mq3.format.qfiles.Md3Frame`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-md3frame-struct-md3frame-src-mq3-format-qfiles-ml-471471403"></a>
## Md3Frame

```ml
struct Md3Frame
```

Md3Frame record for format.qfiles, containing `bounds`, `localOrigin`, `radius`, `name`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L239)

## Members

<a id="field-field-mq3-format-qfiles-md3frame-bounds-bounds-src-mq3-format-qfiles-ml-1711844208"></a>
### bounds

```ml
bounds
```

Model-local minimum and maximum corners enclosing every surface in this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L241)

<a id="field-field-mq3-format-qfiles-md3frame-localorigin-localorigin-src-mq3-format-qfiles-ml-1353718394"></a>
### localOrigin

```ml
localOrigin
```

Model-local center used for the frame bounding sphere.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L243)

<a id="field-field-mq3-format-qfiles-md3frame-name-name-src-mq3-format-qfiles-ml-1743867860"></a>
### name

```ml
name
```

Frame name stored in the MD3 animation record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L247)

<a id="field-field-mq3-format-qfiles-md3frame-radius-radius-src-mq3-format-qfiles-ml-1945903746"></a>
### radius

```ml
radius
```

Radius of the represented sphere or capsule.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L245)
