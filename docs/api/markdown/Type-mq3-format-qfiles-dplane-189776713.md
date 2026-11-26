# `mq3.format.qfiles.Dplane`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-dplane-struct-dplane-src-mq3-format-qfiles-ml-1256064495"></a>
## Dplane

```ml
struct Dplane
```

Dplane record for format.qfiles, containing `normal`, `dist`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L477)

## Members

<a id="field-field-mq3-format-qfiles-dplane-dist-dist-src-mq3-format-qfiles-ml-263579745"></a>
### dist

```ml
dist
```

Distance of the plane (normal vector * distance = point in plane).


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L481)

<a id="field-field-mq3-format-qfiles-dplane-normal-normal-src-mq3-format-qfiles-ml-777479251"></a>
### normal

```ml
normal
```

Unit normal of the splitting or brush plane stored in the BSP plane lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/qfiles.ml#L479)
