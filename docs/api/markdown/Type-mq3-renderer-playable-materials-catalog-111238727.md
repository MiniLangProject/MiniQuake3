# `mq3.renderer.playable_materials.Catalog`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-materials-ml-320329628.md)

<a id="struct-struct-mq3-renderer-playable-materials-catalog-struct-catalog-src-mq3-renderer-playable-materials-ml-78941121"></a>
## Catalog

```ml
struct Catalog
```

Data record for `mq3.renderer.playable_materials.Catalog`; groups `materials`, `scripts`, `attempted`, `loaded`, `textureCount`, `animatedStageCount`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L160)

## Members

<a id="field-field-mq3-renderer-playable-materials-catalog-animatedstagecount-animatedstagecount-src-mq3-renderer-playable-materials-ml-301251092"></a>
### animatedStageCount

```ml
animatedStageCount
```

Number of material stages that advance through image frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L172)

<a id="field-field-mq3-renderer-playable-materials-catalog-attempted-attempted-src-mq3-renderer-playable-materials-ml-1369203220"></a>
### attempted

```ml
attempted
```

Number of resource-loading attempts performed by the catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L166)

<a id="field-field-mq3-renderer-playable-materials-catalog-effectstagecount-effectstagecount-src-mq3-renderer-playable-materials-ml-477881316"></a>
### effectStageCount

```ml
effectStageCount
```

Number of material stages requiring additional effect processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L174)

<a id="field-field-mq3-renderer-playable-materials-catalog-loaded-loaded-src-mq3-renderer-playable-materials-ml-706180254"></a>
### loaded

```ml
loaded
```

Number of material resources successfully loaded while building the catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L168)

<a id="field-field-mq3-renderer-playable-materials-catalog-materials-materials-src-mq3-renderer-playable-materials-ml-1889441100"></a>
### materials

```ml
materials
```

Resolved drawing materials retained by the catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L162)

<a id="field-field-mq3-renderer-playable-materials-catalog-scripts-scripts-src-mq3-renderer-playable-materials-ml-2066701308"></a>
### scripts

```ml
scripts
```

Parsed shader script sources available to material resolution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L164)

<a id="field-field-mq3-renderer-playable-materials-catalog-texturecount-texturecount-src-mq3-renderer-playable-materials-ml-130803480"></a>
### textureCount

```ml
textureCount
```

Number of texture images referenced or loaded by the catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L170)
