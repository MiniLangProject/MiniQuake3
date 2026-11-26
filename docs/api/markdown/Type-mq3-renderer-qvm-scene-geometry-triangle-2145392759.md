# `mq3.renderer.qvm_scene_geometry.Triangle`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-scene-geometry-ml-51177627.md)

<a id="struct-struct-mq3-renderer-qvm-scene-geometry-triangle-struct-triangle-src-mq3-renderer-qvm-scene-geometry-ml-328624859"></a>
## Triangle

```ml
struct Triangle
```

Data record for `mq3.renderer.qvm_scene_geometry.Triangle`; groups `positions`, `texCoords`, `normals`, `colors`, `entityColor`, `entityTexCoord`, and 17 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L48)

## Members

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-colors-colors-src-mq3-renderer-qvm-scene-geometry-ml-565195899"></a>
### colors

```ml
colors
```

Corner colors carried by the expanded scene triangle for material color generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L56)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-customskin-customskin-src-mq3-renderer-qvm-scene-geometry-ml-832045183"></a>
### customSkin

```ml
customSkin
```

Explicit skin handle overriding the model's default skin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L66)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-dynamiclight-dynamiclight-src-mq3-renderer-qvm-scene-geometry-ml-1502848149"></a>
### dynamicLight

```ml
dynamicLight
```

Dynamic-light selection or state used when drawing this geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L86)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-dynamiclightaxis-dynamiclightaxis-src-mq3-renderer-qvm-scene-geometry-ml-671350983"></a>
### dynamicLightAxis

```ml
dynamicLightAxis
```

Orientation basis used to transform dynamic-light coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L90)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-dynamiclightbounds-dynamiclightbounds-src-mq3-renderer-qvm-scene-geometry-ml-189815531"></a>
### dynamicLightBounds

```ml
dynamicLightBounds
```

Bounds used to reject dynamic lights that cannot affect the geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L92)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-dynamiclightorigin-dynamiclightorigin-src-mq3-renderer-qvm-scene-geometry-ml-713508901"></a>
### dynamicLightOrigin

```ml
dynamicLightOrigin
```

Dynamic-light origin expressed in the geometry's coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L88)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-entitycolor-entitycolor-src-mq3-renderer-qvm-scene-geometry-ml-688487491"></a>
### entityColor

```ml
entityColor
```

Entity-supplied color used by entity-driven shader stages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L58)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-entityindex-entityindex-src-mq3-renderer-qvm-scene-geometry-ml-1729677331"></a>
### entityIndex

```ml
entityIndex
```

Index of the scene entity that produced this geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L74)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-entitytexcoord-entitytexcoord-src-mq3-renderer-qvm-scene-geometry-ml-1511444401"></a>
### entityTexCoord

```ml
entityTexCoord
```

Entity-supplied texture offset used by texture-coordinate modifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L60)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-fogindex-fogindex-src-mq3-renderer-qvm-scene-geometry-ml-1348431123"></a>
### fogIndex

```ml
fogIndex
```

Index of the fog volume affecting the surface or primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L84)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-lightmapcoords-lightmapcoords-src-mq3-renderer-qvm-scene-geometry-ml-162792595"></a>
### lightmapCoords

```ml
lightmapCoords
```

Coordinates used to sample the baked lightmap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L80)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-lightmapindex-lightmapindex-src-mq3-renderer-qvm-scene-geometry-ml-968847443"></a>
### lightmapIndex

```ml
lightmapIndex
```

Index or special selector identifying the surface's baked lightmap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L82)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-modelhandle-modelhandle-src-mq3-renderer-qvm-scene-geometry-ml-1805710095"></a>
### modelHandle

```ml
modelHandle
```

Registered model handle used to identify cached mesh data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L64)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-normals-normals-src-mq3-renderer-qvm-scene-geometry-ml-1876371803"></a>
### normals

```ml
normals
```

Vertex normals used when lighting or transforming the geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L54)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-positions-positions-src-mq3-renderer-qvm-scene-geometry-ml-1508494911"></a>
### positions

```ml
positions
```

Three world-space corners produced by expansion of a VM-submitted scene entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L50)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-renderfx-renderfx-src-mq3-renderer-qvm-scene-geometry-ml-2138663959"></a>
### renderfx

```ml
renderfx
```

Bit mask of entity rendering options, such as depth hack or shadow suppression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L78)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-shaderhandle-shaderhandle-src-mq3-renderer-qvm-scene-geometry-ml-1444199517"></a>
### shaderHandle

```ml
shaderHandle
```

Registered shader handle used to resolve the drawing material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L68)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-shadername-shadername-src-mq3-renderer-qvm-scene-geometry-ml-895102227"></a>
### shaderName

```ml
shaderName
```

Material name resolved for the expanded entity or model-surface triangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L70)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-shadertime-shadertime-src-mq3-renderer-qvm-scene-geometry-ml-1131897643"></a>
### shaderTime

```ml
shaderTime
```

Time offset in seconds subtracted from the view time for entity shader effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L62)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-surfaceindex-surfaceindex-src-mq3-renderer-qvm-scene-geometry-ml-1270591997"></a>
### surfaceIndex

```ml
surfaceIndex
```

Index of the source surface within the model or world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L76)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-surfacename-surfacename-src-mq3-renderer-qvm-scene-geometry-ml-915679679"></a>
### surfaceName

```ml
surfaceName
```

Model-surface name used to select a skin or material mapping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L72)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-texcoords-texcoords-src-mq3-renderer-qvm-scene-geometry-ml-10758671"></a>
### texCoords

```ml
texCoords
```

Texture coordinates of the three corners after expanding a submitted scene entity into triangles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L52)

<a id="field-field-mq3-renderer-qvm-scene-geometry-triangle-vertexids-vertexids-src-mq3-renderer-qvm-scene-geometry-ml-1803720863"></a>
### vertexIds

```ml
vertexIds
```

Source vertex identifiers retained for sharing or caching transformed results.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L94)
