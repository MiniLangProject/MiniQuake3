# `mq3.renderer.playable_world_batch.MaterialBatch`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-world-batch-ml-1411140007.md)

<a id="struct-struct-mq3-renderer-playable-world-batch-materialbatch-struct-materialbatch-src-mq3-renderer-playable-world-batch-ml-1643032755"></a>
## MaterialBatch

```ml
struct MaterialBatch
```

Data record for `mq3.renderer.playable_world_batch.MaterialBatch`; groups `base`, `passes`, `sourceTriangles`, `drawableTriangles`, `emittedTriangles`, `skippedSky`, and 17 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L122)

## Members

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-alphatestpasses-alphatestpasses-src-mq3-renderer-playable-world-batch-ml-859414280"></a>
### alphaTestPasses

```ml
alphaTestPasses
```

Number of drawing passes that use alpha test processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L144)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-animatedpasses-animatedpasses-src-mq3-renderer-playable-world-batch-ml-1044009236"></a>
### animatedPasses

```ml
animatedPasses
```

Number of drawing passes that use animated processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L136)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-base-base-src-mq3-renderer-playable-world-batch-ml-596897518"></a>
### base

```ml
base
```

Base pass or value from which the current effect is derived.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L124)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-blendedpasses-blendedpasses-src-mq3-renderer-playable-world-batch-ml-831582308"></a>
### blendedPasses

```ml
blendedPasses
```

Number of drawing passes that use blended processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L140)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-clampedpasses-clampedpasses-src-mq3-renderer-playable-world-batch-ml-1706011968"></a>
### clampedPasses

```ml
clampedPasses
```

Number of drawing passes that use clamped processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L156)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-deformedpasses-deformedpasses-src-mq3-renderer-playable-world-batch-ml-1280541034"></a>
### deformedPasses

```ml
deformedPasses
```

Number of drawing passes that use deformed processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L158)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-destinationalphapasses-destinationalphapasses-src-mq3-renderer-playable-world-batch-ml-432312002"></a>
### destinationAlphaPasses

```ml
destinationAlphaPasses
```

Number of drawing passes that use destination alpha processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L154)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-dlightbatch-dlightbatch-src-mq3-renderer-playable-world-batch-ml-135170964"></a>
### dlightBatch

```ml
dlightBatch
```

Prepared geometry and commands for dynamic-light contributions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L166)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-dlightcatalog-dlightcatalog-src-mq3-renderer-playable-world-batch-ml-402092436"></a>
### dlightCatalog

```ml
dlightCatalog
```

Shared textures and resources used by dynamic-light drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L168)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-drawabletriangles-drawabletriangles-src-mq3-renderer-playable-world-batch-ml-2110850144"></a>
### drawableTriangles

```ml
drawableTriangles
```

Number of source triangles that can be submitted for drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L130)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-emittedtriangles-emittedtriangles-src-mq3-renderer-playable-world-batch-ml-664794190"></a>
### emittedTriangles

```ml
emittedTriangles
```

Number of triangles submitted after expanding material passes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L132)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-environmentpasses-environmentpasses-src-mq3-renderer-playable-world-batch-ml-918297004"></a>
### environmentPasses

```ml
environmentPasses
```

Number of drawing passes that use environment processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L150)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-filterpasses-filterpasses-src-mq3-renderer-playable-world-batch-ml-893842666"></a>
### filterPasses

```ml
filterPasses
```

Number of drawing passes that use filter processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L152)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-fogbatch-fogbatch-src-mq3-renderer-playable-world-batch-ml-1042203224"></a>
### fogBatch

```ml
fogBatch
```

Prepared geometry and commands for the fog contribution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L162)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-fogcatalog-fogcatalog-src-mq3-renderer-playable-world-batch-ml-1207735970"></a>
### fogCatalog

```ml
fogCatalog
```

Fog volumes and shared fog resources used by the batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L164)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-generatorpasses-generatorpasses-src-mq3-renderer-playable-world-batch-ml-90396552"></a>
### generatorPasses

```ml
generatorPasses
```

Number of drawing passes that use generator processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L142)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-passes-passes-src-mq3-renderer-playable-world-batch-ml-1076653978"></a>
### passes

```ml
passes
```

Drawing passes required by the material or retained batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L126)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-polygonoffsetpasses-polygonoffsetpasses-src-mq3-renderer-playable-world-batch-ml-705572396"></a>
### polygonOffsetPasses

```ml
polygonOffsetPasses
```

Number of drawing passes that use polygon offset processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L160)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-skippedsky-skippedsky-src-mq3-renderer-playable-world-batch-ml-206049566"></a>
### skippedSky

```ml
skippedSky
```

Number of sky primitives handled outside the normal material batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L134)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-sourcetriangles-sourcetriangles-src-mq3-renderer-playable-world-batch-ml-980200784"></a>
### sourceTriangles

```ml
sourceTriangles
```

Number of source triangles considered when preparing the batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L128)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-stretchpasses-stretchpasses-src-mq3-renderer-playable-world-batch-ml-757096440"></a>
### stretchPasses

```ml
stretchPasses
```

Number of drawing passes that use stretch processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L148)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-turbulentpasses-turbulentpasses-src-mq3-renderer-playable-world-batch-ml-1083806688"></a>
### turbulentPasses

```ml
turbulentPasses
```

Number of drawing passes that use turbulent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L146)

<a id="field-field-mq3-renderer-playable-world-batch-materialbatch-uvmodifiedpasses-uvmodifiedpasses-src-mq3-renderer-playable-world-batch-ml-1903056902"></a>
### uvModifiedPasses

```ml
uvModifiedPasses
```

Number of drawing passes that use uv modified processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L138)
