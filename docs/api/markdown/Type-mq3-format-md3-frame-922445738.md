# `mq3.format.md3.Frame`

[Home](README.md) · [Source file](File-src-mq3-format-md3-ml-2098563759.md)

<a id="struct-struct-mq3-format-md3-frame-struct-frame-src-mq3-format-md3-ml-1034931075"></a>
## Frame

```ml
struct Frame
```

Frame record for format.md3, containing `mins`, `maxs`, `localOrigin`, `radius`, `name`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L45)

## Members

<a id="field-field-mq3-format-md3-frame-localorigin-localorigin-src-mq3-format-md3-ml-1588447494"></a>
### localOrigin

```ml
localOrigin
```

Model-local center used for the frame bounding sphere.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L51)

<a id="field-field-mq3-format-md3-frame-maxs-maxs-src-mq3-format-md3-ml-1770203636"></a>
### maxs

```ml
maxs
```

Maximum XYZ corner of all model surfaces in this MD3 animation frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L49)

<a id="field-field-mq3-format-md3-frame-mins-mins-src-mq3-format-md3-ml-1141660188"></a>
### mins

```ml
mins
```

Minimum XYZ corner of all model surfaces in this MD3 animation frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L47)

<a id="field-field-mq3-format-md3-frame-name-name-src-mq3-format-md3-ml-843726824"></a>
### name

```ml
name
```

Frame name retained from the MD3 animation record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L55)

<a id="field-field-mq3-format-md3-frame-radius-radius-src-mq3-format-md3-ml-468010510"></a>
### radius

```ml
radius
```

Model-local bounding-sphere radius stored for this animation frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L53)
