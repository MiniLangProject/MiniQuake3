# `mq3.renderer.bsp_render_data.RenderVertex`

[Home](README.md) · [Source file](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)

<a id="struct-struct-mq3-renderer-bsp-render-data-rendervertex-struct-rendervertex-src-mq3-renderer-bsp-render-data-ml-1210715031"></a>
## RenderVertex

```ml
struct RenderVertex
```

Data record for `mq3.renderer.bsp_render_data.RenderVertex`; groups `position`, `baseUV`, `lightmapUV`, `normal`, `color`, `entityColor`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L32)

## Members

<a id="field-field-mq3-renderer-bsp-render-data-rendervertex-baseuv-baseuv-src-mq3-renderer-bsp-render-data-ml-1589113563"></a>
### baseUV

```ml
baseUV
```

Base-material texture coordinates of the BSP vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L36)

<a id="field-field-mq3-renderer-bsp-render-data-rendervertex-color-color-src-mq3-renderer-bsp-render-data-ml-421801559"></a>
### color

```ml
color
```

BSP vertex color supplied to the world material's color generators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L42)

<a id="field-field-mq3-renderer-bsp-render-data-rendervertex-entitycolor-entitycolor-src-mq3-renderer-bsp-render-data-ml-1533225899"></a>
### entityColor

```ml
entityColor
```

Entity-supplied color used by entity-driven shader stages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L44)

<a id="field-field-mq3-renderer-bsp-render-data-rendervertex-entitytexcoord-entitytexcoord-src-mq3-renderer-bsp-render-data-ml-151170401"></a>
### entityTexCoord

```ml
entityTexCoord
```

Entity-supplied texture offset used by texture-coordinate modifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L46)

<a id="field-field-mq3-renderer-bsp-render-data-rendervertex-lightmapuv-lightmapuv-src-mq3-renderer-bsp-render-data-ml-507107709"></a>
### lightmapUV

```ml
lightmapUV
```

Baked-lightmap texture coordinates of the BSP vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L38)

<a id="field-field-mq3-renderer-bsp-render-data-rendervertex-normal-normal-src-mq3-renderer-bsp-render-data-ml-235160253"></a>
### normal

```ml
normal
```

BSP surface vertex normal retained when constructing drawable world triangles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L40)

<a id="field-field-mq3-renderer-bsp-render-data-rendervertex-position-position-src-mq3-renderer-bsp-render-data-ml-436518497"></a>
### position

```ml
position
```

Three-dimensional position of the vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L34)

<a id="field-field-mq3-renderer-bsp-render-data-rendervertex-shadertime-shadertime-src-mq3-renderer-bsp-render-data-ml-1073499951"></a>
### shaderTime

```ml
shaderTime
```

Time offset in seconds subtracted from the view time for entity shader effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L48)

<a id="field-field-mq3-renderer-bsp-render-data-rendervertex-sourceindex-sourceindex-src-mq3-renderer-bsp-render-data-ml-1617707275"></a>
### sourceIndex

```ml
sourceIndex
```

Original vertex index retained for caching and deduplication.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L50)
