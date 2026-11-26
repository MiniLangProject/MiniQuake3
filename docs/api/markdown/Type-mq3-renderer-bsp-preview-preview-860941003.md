# `mq3.renderer.bsp_preview.Preview`

[Home](README.md) · [Source file](File-src-mq3-renderer-bsp-preview-ml-563591503.md)

<a id="struct-struct-mq3-renderer-bsp-preview-preview-struct-preview-src-mq3-renderer-bsp-preview-ml-1875564449"></a>
## Preview

```ml
struct Preview
```

Data record for `mq3.renderer.bsp_preview.Preview`; groups `lines`, `surfaceCount`, `triangleCount`, `truncated`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/bsp_preview.ml#L23)

## Members

<a id="field-field-mq3-renderer-bsp-preview-preview-lines-lines-src-mq3-renderer-bsp-preview-ml-848197635"></a>
### lines

```ml
lines
```

Line segments generated for the wireframe or debug drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/bsp_preview.ml#L25)

<a id="field-field-mq3-renderer-bsp-preview-preview-surfacecount-surfacecount-src-mq3-renderer-bsp-preview-ml-520266039"></a>
### surfaceCount

```ml
surfaceCount
```

Number of source surfaces represented by this result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/bsp_preview.ml#L27)

<a id="field-field-mq3-renderer-bsp-preview-preview-trianglecount-trianglecount-src-mq3-renderer-bsp-preview-ml-665992291"></a>
### triangleCount

```ml
triangleCount
```

Number of triangles represented by this geometry or result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/bsp_preview.ml#L29)

<a id="field-field-mq3-renderer-bsp-preview-preview-truncated-truncated-src-mq3-renderer-bsp-preview-ml-16089047"></a>
### truncated

```ml
truncated
```

Whether a configured limit prevented retaining every source primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/bsp_preview.ml#L31)
