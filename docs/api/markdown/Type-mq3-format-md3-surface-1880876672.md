# `mq3.format.md3.Surface`

[Home](README.md) · [Source file](File-src-mq3-format-md3-ml-2098563759.md)

<a id="struct-struct-mq3-format-md3-surface-struct-surface-src-mq3-format-md3-ml-65932275"></a>
## Surface

```ml
struct Surface
```

Surface record for format.md3, containing `name`, `shaders`, `mesh`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L67)

## Members

<a id="field-field-mq3-format-md3-surface-mesh-mesh-src-mq3-format-md3-ml-965568390"></a>
### mesh

```ml
mesh
```

Triangle geometry and per-frame vertices for this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L73)

<a id="field-field-mq3-format-md3-surface-name-name-src-mq3-format-md3-ml-1673699034"></a>
### name

```ml
name
```

Model surface name used by skin and shader lookup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L69)

<a id="field-field-mq3-format-md3-surface-shaders-shaders-src-mq3-format-md3-ml-64446152"></a>
### shaders

```ml
shaders
```

Shader-name strings read from this surface's MD3 shader records; shader definitions are resolved separately.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L71)
