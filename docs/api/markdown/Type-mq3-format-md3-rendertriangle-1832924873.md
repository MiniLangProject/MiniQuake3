# `mq3.format.md3.RenderTriangle`

[Home](README.md) · [Source file](File-src-mq3-format-md3-ml-2098563759.md)

<a id="struct-struct-mq3-format-md3-rendertriangle-struct-rendertriangle-src-mq3-format-md3-ml-1323276059"></a>
## RenderTriangle

```ml
struct RenderTriangle
```

RenderTriangle record for format.md3, containing `positions`, `texCoords`, `normals`, `surfaceIndex`, `shaderName`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L99)

## Members

<a id="field-field-mq3-format-md3-rendertriangle-normals-normals-src-mq3-format-md3-ml-908672369"></a>
### normals

```ml
normals
```

Interpolated normal vectors at the generated triangle vertices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L105)

<a id="field-field-mq3-format-md3-rendertriangle-positions-positions-src-mq3-format-md3-ml-27113677"></a>
### positions

```ml
positions
```

Three interpolated model-local vertex positions; renderTrianglesCached does not apply a world transform.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L101)

<a id="field-field-mq3-format-md3-rendertriangle-shadername-shadername-src-mq3-format-md3-ml-883254073"></a>
### shaderName

```ml
shaderName
```

Asset name of the shader used to render this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L109)

<a id="field-field-mq3-format-md3-rendertriangle-surfaceindex-surfaceindex-src-mq3-format-md3-ml-1518213507"></a>
### surfaceIndex

```ml
surfaceIndex
```

Index of the model surface from which this render triangle was produced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L107)

<a id="field-field-mq3-format-md3-rendertriangle-texcoords-texcoords-src-mq3-format-md3-ml-177030725"></a>
### texCoords

```ml
texCoords
```

Texture coordinates associated with the represented vertex or triangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/md3.ml#L103)
