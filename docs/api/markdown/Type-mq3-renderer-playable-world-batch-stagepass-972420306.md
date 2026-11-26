# `mq3.renderer.playable_world_batch.StagePass`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-world-batch-ml-1411140007.md)

<a id="struct-struct-mq3-renderer-playable-world-batch-stagepass-struct-stagepass-src-mq3-renderer-playable-world-batch-ml-1919076551"></a>
## StagePass

```ml
struct StagePass
```

Data record for `mq3.renderer.playable_world_batch.StagePass`; groups `commands`, `sourceUvs`, `sourceDeformUvs`, `sourcePositions`, `sourceIndexes`, `sourceNormals`, and 20 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L67)

## Members

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-cacheserial-cacheserial-src-mq3-renderer-playable-world-batch-ml-189615392"></a>
### cacheSerial

```ml
cacheSerial
```

Generation number identifying valid entries in the vertex cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L103)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-clamptime-clamptime-src-mq3-renderer-playable-world-batch-ml-1524865200"></a>
### clampTime

```ml
clampTime
```

Upper limit applied to the shader's effect time; zero disables clamping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L115)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-commands-commands-src-mq3-renderer-playable-world-batch-ml-738784056"></a>
### commands

```ml
commands
```

Operations or drawing commands queued by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L69)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-deforms-deforms-src-mq3-renderer-playable-world-batch-ml-1648550832"></a>
### deforms

```ml
deforms
```

Ordered vertex deformations applied by the shader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L97)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-depthequal-depthequal-src-mq3-renderer-playable-world-batch-ml-1711282206"></a>
### depthEqual

```ml
depthEqual
```

Whether depth testing accepts only fragments at the existing surface depth.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L107)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-fogadjustment-fogadjustment-src-mq3-renderer-playable-world-batch-ml-627841636"></a>
### fogAdjustment

```ml
fogAdjustment
```

Fog modulation applied to this material stage relative to the primary stage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L91)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-fogindexes-fogindexes-src-mq3-renderer-playable-world-batch-ml-795174456"></a>
### fogIndexes

```ml
fogIndexes
```

Fog-volume index associated with each retained primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L89)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-initialized-initialized-src-mq3-renderer-playable-world-batch-ml-1511640736"></a>
### initialized

```ml
initialized
```

Whether initialization completed successfully.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L117)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-normalnoise-normalnoise-src-mq3-renderer-playable-world-batch-ml-958715040"></a>
### normalNoise

```ml
normalNoise
```

Noise data used by animated normal-deformation effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L99)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-polygonoffset-polygonoffset-src-mq3-renderer-playable-world-batch-ml-252499416"></a>
### polygonOffset

```ml
polygonOffset
```

Whether polygon-offset depth bias is applied while drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L111)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-primary-primary-src-mq3-renderer-playable-world-batch-ml-537129536"></a>
### primary

```ml
primary
```

Whether this is the material's primary drawing pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L105)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-sort-sort-src-mq3-renderer-playable-world-batch-ml-241498872"></a>
### sort

```ml
sort
```

Shader ordering category used to schedule this material relative to other surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L109)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-sourcecolors-sourcecolors-src-mq3-renderer-playable-world-batch-ml-858798742"></a>
### sourceColors

```ml
sourceColors
```

Original vertex colors retained before shader color generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L81)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-sourcedeformuvs-sourcedeformuvs-src-mq3-renderer-playable-world-batch-ml-174248764"></a>
### sourceDeformUvs

```ml
sourceDeformUvs
```

Base texture coordinates retained for vertex-deformation calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L73)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-sourceentitycolors-sourceentitycolors-src-mq3-renderer-playable-world-batch-ml-660869776"></a>
### sourceEntityColors

```ml
sourceEntityColors
```

Entity color values retained for entity-driven shader stages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L83)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-sourceentitytexcoords-sourceentitytexcoords-src-mq3-renderer-playable-world-batch-ml-520148604"></a>
### sourceEntityTexCoords

```ml
sourceEntityTexCoords
```

Entity texture offsets retained for entity-driven modifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L85)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-sourceindexes-sourceindexes-src-mq3-renderer-playable-world-batch-ml-656445176"></a>
### sourceIndexes

```ml
sourceIndexes
```

Original vertex identifiers retained for cache reuse.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L77)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-sourcenormals-sourcenormals-src-mq3-renderer-playable-world-batch-ml-1858259464"></a>
### sourceNormals

```ml
sourceNormals
```

Original normals retained for deformation and lighting calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L79)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-sourcepositions-sourcepositions-src-mq3-renderer-playable-world-batch-ml-520786244"></a>
### sourcePositions

```ml
sourcePositions
```

Original vertex positions retained for time-dependent updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L75)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-sourceshadertimes-sourceshadertimes-src-mq3-renderer-playable-world-batch-ml-1148709992"></a>
### sourceShaderTimes

```ml
sourceShaderTimes
```

Entity shader-time offsets retained for time-dependent effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L87)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-sourceuvs-sourceuvs-src-mq3-renderer-playable-world-batch-ml-320312144"></a>
### sourceUvs

```ml
sourceUvs
```

Original texture coordinates retained for animated texture updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L71)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-specularnormals-specularnormals-src-mq3-renderer-playable-world-batch-ml-822014184"></a>
### specularNormals

```ml
specularNormals
```

Normals retained for view-dependent specular-alpha generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L119)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-stage-stage-src-mq3-renderer-playable-world-batch-ml-1880755056"></a>
### stage

```ml
stage
```

Runtime material stage executed by this drawing pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L93)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-textureindex-textureindex-src-mq3-renderer-playable-world-batch-ml-598920386"></a>
### textureIndex

```ml
textureIndex
```

Index identifying the texture or BSP shader assigned to the surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L95)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-timeoffset-timeoffset-src-mq3-renderer-playable-world-batch-ml-1044634416"></a>
### timeOffset

```ml
timeOffset
```

Offset in seconds applied to the material's shader time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L113)

<a id="field-field-mq3-renderer-playable-world-batch-stagepass-vertexcache-vertexcache-src-mq3-renderer-playable-world-batch-ml-922013392"></a>
### vertexCache

```ml
vertexCache
```

Reusable transformed-vertex data shared by compatible stage updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L101)
