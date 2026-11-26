# `mq3.renderer.qvm_scene_materials.Catalog`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-scene-materials-ml-310916497.md)

<a id="struct-struct-mq3-renderer-qvm-scene-materials-catalog-struct-catalog-src-mq3-renderer-qvm-scene-materials-ml-253515231"></a>
## Catalog

```ml
struct Catalog
```

Data record for `mq3.renderer.qvm_scene_materials.Catalog`; groups `triangles`, `materials`, `textures`, `scriptIndex`, `scriptCount`, `loadedSkins`, and 7 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L84)

## Members

<a id="field-field-mq3-renderer-qvm-scene-materials-catalog-bindings-bindings-src-mq3-renderer-qvm-scene-materials-ml-1522209960"></a>
### bindings

```ml
bindings
```

Bindings associating names or handles with their backing resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L98)

<a id="field-field-mq3-renderer-qvm-scene-materials-catalog-imagecache-imagecache-src-mq3-renderer-qvm-scene-materials-ml-1570021970"></a>
### imageCache

```ml
imageCache
```

Decoded images reused across material and skin lookups.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L110)

<a id="field-field-mq3-renderer-qvm-scene-materials-catalog-loadedskins-loadedskins-src-mq3-renderer-qvm-scene-materials-ml-1396745432"></a>
### loadedSkins

```ml
loadedSkins
```

Skin definitions already loaded for material resolution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L96)

<a id="field-field-mq3-renderer-qvm-scene-materials-catalog-materials-materials-src-mq3-renderer-qvm-scene-materials-ml-1462230568"></a>
### materials

```ml
materials
```

Resolved drawing materials retained by the catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L88)

<a id="field-field-mq3-renderer-qvm-scene-materials-catalog-nexttextureslot-nexttextureslot-src-mq3-renderer-qvm-scene-materials-ml-314645576"></a>
### nextTextureSlot

```ml
nextTextureSlot
```

Next texture slot available for a newly loaded image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L104)

<a id="field-field-mq3-renderer-qvm-scene-materials-catalog-recentbinding-recentbinding-src-mq3-renderer-qvm-scene-materials-ml-910108508"></a>
### recentBinding

```ml
recentBinding
```

Most recently resolved surface-to-material binding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L106)

<a id="field-field-mq3-renderer-qvm-scene-materials-catalog-resolvedtriangles-resolvedtriangles-src-mq3-renderer-qvm-scene-materials-ml-1566449528"></a>
### resolvedTriangles

```ml
resolvedTriangles
```

Number of triangles whose shaders resolved successfully.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L100)

<a id="field-field-mq3-renderer-qvm-scene-materials-catalog-scriptcount-scriptcount-src-mq3-renderer-qvm-scene-materials-ml-1586296616"></a>
### scriptCount

```ml
scriptCount
```

Number of shader script sources loaded into the catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L94)

<a id="field-field-mq3-renderer-qvm-scene-materials-catalog-scriptindex-scriptindex-src-mq3-renderer-qvm-scene-materials-ml-2039103376"></a>
### scriptIndex

```ml
scriptIndex
```

Index of parsed shader definitions used for material resolution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L92)

<a id="field-field-mq3-renderer-qvm-scene-materials-catalog-shaderremaps-shaderremaps-src-mq3-renderer-qvm-scene-materials-ml-584648370"></a>
### shaderRemaps

```ml
shaderRemaps
```

Shader name substitutions and associated effect-time offsets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L108)

<a id="field-field-mq3-renderer-qvm-scene-materials-catalog-textures-textures-src-mq3-renderer-qvm-scene-materials-ml-1810144436"></a>
### textures

```ml
textures
```

Texture resources retained by the material catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L90)

<a id="field-field-mq3-renderer-qvm-scene-materials-catalog-triangles-triangles-src-mq3-renderer-qvm-scene-materials-ml-860844640"></a>
### triangles

```ml
triangles
```

Triangle records or index triplets represented by this geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L86)

<a id="field-field-mq3-renderer-qvm-scene-materials-catalog-unresolvedtriangles-unresolvedtriangles-src-mq3-renderer-qvm-scene-materials-ml-1588625596"></a>
### unresolvedTriangles

```ml
unresolvedTriangles
```

Number of triangles whose materials could not be resolved.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L102)
