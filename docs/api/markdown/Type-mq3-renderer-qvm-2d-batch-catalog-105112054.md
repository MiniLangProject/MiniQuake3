# `mq3.renderer.qvm_2d_batch.Catalog`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-2d-batch-ml-1820350507.md)

<a id="struct-struct-mq3-renderer-qvm-2d-batch-catalog-struct-catalog-src-mq3-renderer-qvm-2d-batch-ml-141790267"></a>
## Catalog

```ml
struct Catalog
```

Data record for `mq3.renderer.qvm_2d_batch.Catalog`; groups `materials`, `textures`, `runs`, `archive`, `scriptIndex`, `scriptCount`, and 14 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L129)

## Members

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-archive-archive-src-mq3-renderer-qvm-2d-batch-ml-355561440"></a>
### archive

```ml
archive
```

Asset archive used to resolve game resources by virtual path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L137)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-assetcount-assetcount-src-mq3-renderer-qvm-2d-batch-ml-1611508390"></a>
### assetCount

```ml
assetCount
```

Number of registered assets when the cached catalog was prepared.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L161)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-emittedtriangles-emittedtriangles-src-mq3-renderer-qvm-2d-batch-ml-637856582"></a>
### emittedTriangles

```ml
emittedTriangles
```

Number of triangles submitted after expanding material passes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L145)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-endtextureslot-endtextureslot-src-mq3-renderer-qvm-2d-batch-ml-1520566156"></a>
### endTextureSlot

```ml
endTextureSlot
```

Exclusive upper bound of texture slots available to the catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L153)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-lastcommands-lastcommands-src-mq3-renderer-qvm-2d-batch-ml-884248472"></a>
### lastCommands

```ml
lastCommands
```

Drawing commands used to build the currently retained batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L157)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-materials-materials-src-mq3-renderer-qvm-2d-batch-ml-1889900504"></a>
### materials

```ml
materials
```

Resolved drawing materials retained by the catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L131)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-nexttextureslot-nexttextureslot-src-mq3-renderer-qvm-2d-batch-ml-1226467512"></a>
### nextTextureSlot

```ml
nextTextureSlot
```

Next texture slot available for a newly loaded image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L151)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-remaprevision-remaprevision-src-mq3-renderer-qvm-2d-batch-ml-2121197016"></a>
### remapRevision

```ml
remapRevision
```

Shader-remap generation used to detect stale material bindings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L159)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-resolvedquads-resolvedquads-src-mq3-renderer-qvm-2d-batch-ml-1071570932"></a>
### resolvedQuads

```ml
resolvedQuads
```

Number of quads whose materials resolved successfully.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L147)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-runs-runs-src-mq3-renderer-qvm-2d-batch-ml-1398416728"></a>
### runs

```ml
runs
```

Contiguous primitive ranges grouped for retained drawing or material submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L135)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-scriptcount-scriptcount-src-mq3-renderer-qvm-2d-batch-ml-1111405272"></a>
### scriptCount

```ml
scriptCount
```

Number of shader script sources loaded into the catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L141)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-scriptindex-scriptindex-src-mq3-renderer-qvm-2d-batch-ml-2028122608"></a>
### scriptIndex

```ml
scriptIndex
```

Index of parsed shader definitions used for material resolution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L139)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-shaderremaps-shaderremaps-src-mq3-renderer-qvm-2d-batch-ml-1585636278"></a>
### shaderRemaps

```ml
shaderRemaps
```

Shader name substitutions and associated effect-time offsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L155)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-sourceheight-sourceheight-src-mq3-renderer-qvm-2d-batch-ml-1440015384"></a>
### sourceHeight

```ml
sourceHeight
```

Height of the source coordinate system or image, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L165)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-sourcequads-sourcequads-src-mq3-renderer-qvm-2d-batch-ml-1795318524"></a>
### sourceQuads

```ml
sourceQuads
```

Number of quads extracted from the original drawing commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L143)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-sourcewidth-sourcewidth-src-mq3-renderer-qvm-2d-batch-ml-156392876"></a>
### sourceWidth

```ml
sourceWidth
```

Width of the source coordinate system or image, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L163)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-targetheight-targetheight-src-mq3-renderer-qvm-2d-batch-ml-1400764600"></a>
### targetHeight

```ml
targetHeight
```

Height of the destination viewport or image, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L169)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-targetwidth-targetwidth-src-mq3-renderer-qvm-2d-batch-ml-1365110136"></a>
### targetWidth

```ml
targetWidth
```

Width of the destination viewport or image, in pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L167)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-textures-textures-src-mq3-renderer-qvm-2d-batch-ml-506747828"></a>
### textures

```ml
textures
```

Texture resources retained by the material catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L133)

<a id="field-field-mq3-renderer-qvm-2d-batch-catalog-unresolvedquads-unresolvedquads-src-mq3-renderer-qvm-2d-batch-ml-53167460"></a>
### unresolvedQuads

```ml
unresolvedQuads
```

Number of quads whose materials could not be resolved.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L149)
