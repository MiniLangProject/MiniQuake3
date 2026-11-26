# `mq3.renderer.qvm_scene_geometry.Geometry`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-scene-geometry-ml-51177627.md)

<a id="struct-struct-mq3-renderer-qvm-scene-geometry-geometry-struct-geometry-src-mq3-renderer-qvm-scene-geometry-ml-163413883"></a>
## Geometry

```ml
struct Geometry
```

Data record for `mq3.renderer.qvm_scene_geometry.Geometry`; groups `triangles`, `triangleCount`, `modelEntities`, `spriteEntities`, `polySurfaces`, `skippedInline`, and 7 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L113)

## Members

<a id="field-field-mq3-renderer-qvm-scene-geometry-geometry-culledinline-culledinline-src-mq3-renderer-qvm-scene-geometry-ml-1789360183"></a>
### culledInline

```ml
culledInline
```

Number of inline model entities rejected by visibility or bounds checks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L135)

<a id="field-field-mq3-renderer-qvm-scene-geometry-geometry-modelentities-modelentities-src-mq3-renderer-qvm-scene-geometry-ml-167078751"></a>
### modelEntities

```ml
modelEntities
```

Number of model entities converted into renderable geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L119)

<a id="field-field-mq3-renderer-qvm-scene-geometry-geometry-polysurfaces-polysurfaces-src-mq3-renderer-qvm-scene-geometry-ml-594857379"></a>
### polySurfaces

```ml
polySurfaces
```

Number of submitted polygon surfaces converted into triangles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L123)

<a id="field-field-mq3-renderer-qvm-scene-geometry-geometry-portals-portals-src-mq3-renderer-qvm-scene-geometry-ml-1784167223"></a>
### portals

```ml
portals
```

Portal entities or surfaces collected while preparing the scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L133)

<a id="field-field-mq3-renderer-qvm-scene-geometry-geometry-shadowtrianglecount-shadowtrianglecount-src-mq3-renderer-qvm-scene-geometry-ml-578353663"></a>
### shadowTriangleCount

```ml
shadowTriangleCount
```

Number of triangles collected for shadow rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L139)

<a id="field-field-mq3-renderer-qvm-scene-geometry-geometry-shadowtriangles-shadowtriangles-src-mq3-renderer-qvm-scene-geometry-ml-1615812239"></a>
### shadowTriangles

```ml
shadowTriangles
```

Triangles collected for the stencil or projection shadow pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L137)

<a id="field-field-mq3-renderer-qvm-scene-geometry-geometry-skippedinline-skippedinline-src-mq3-renderer-qvm-scene-geometry-ml-346214511"></a>
### skippedInline

```ml
skippedInline
```

Number of inline model entities omitted from geometry conversion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L125)

<a id="field-field-mq3-renderer-qvm-scene-geometry-geometry-skippedunsupported-skippedunsupported-src-mq3-renderer-qvm-scene-geometry-ml-1194223421"></a>
### skippedUnsupported

```ml
skippedUnsupported
```

Number of entity types unsupported by the geometry converter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L127)

<a id="field-field-mq3-renderer-qvm-scene-geometry-geometry-sourcevertices-sourcevertices-src-mq3-renderer-qvm-scene-geometry-ml-1022095603"></a>
### sourceVertices

```ml
sourceVertices
```

Number of source vertices considered by geometry conversion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L129)

<a id="field-field-mq3-renderer-qvm-scene-geometry-geometry-spriteentities-spriteentities-src-mq3-renderer-qvm-scene-geometry-ml-1464899547"></a>
### spriteEntities

```ml
spriteEntities
```

Number of sprite entities converted into renderable geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L121)

<a id="field-field-mq3-renderer-qvm-scene-geometry-geometry-trianglecount-trianglecount-src-mq3-renderer-qvm-scene-geometry-ml-906080987"></a>
### triangleCount

```ml
triangleCount
```

Number of triangles represented by this geometry or result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L117)

<a id="field-field-mq3-renderer-qvm-scene-geometry-geometry-triangles-triangles-src-mq3-renderer-qvm-scene-geometry-ml-656518687"></a>
### triangles

```ml
triangles
```

Triangle records or index triplets represented by this geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L115)

<a id="field-field-mq3-renderer-qvm-scene-geometry-geometry-vertextransforms-vertextransforms-src-mq3-renderer-qvm-scene-geometry-ml-891805057"></a>
### vertexTransforms

```ml
vertexTransforms
```

Number of vertex transformations performed during geometry conversion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L131)
