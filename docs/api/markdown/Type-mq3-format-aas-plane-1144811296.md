# `mq3.format.aas.Plane`

[Home](README.md) · [Source file](File-src-mq3-format-aas-ml-835678928.md)

<a id="struct-struct-mq3-format-aas-plane-struct-plane-src-mq3-format-aas-ml-339145385"></a>
## Plane

```ml
struct Plane
```

Plane record for format.aas, containing `normal`, `dist`, `type`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L246)

## Members

<a id="field-field-mq3-format-aas-plane-dist-dist-src-mq3-format-aas-ml-361851747"></a>
### dist

```ml
dist
```

Distance of the plane (normal vector * distance = point in plane).


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L250)

<a id="field-field-mq3-format-aas-plane-normal-normal-src-mq3-format-aas-ml-1483893065"></a>
### normal

```ml
normal
```

Unit normal stored with a navigation BSP plane in the AAS file.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L248)

<a id="field-field-mq3-format-aas-plane-type-type-src-mq3-format-aas-ml-734220191"></a>
### type

```ml
type
```

Axis classification used to accelerate AAS plane tests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/aas.ml#L252)
