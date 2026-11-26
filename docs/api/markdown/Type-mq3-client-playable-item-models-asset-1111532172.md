# `mq3.client.playable_item_models.Asset`

[Home](README.md) · [Source file](File-src-mq3-client-playable-item-models-ml-1740601852.md)

<a id="struct-struct-mq3-client-playable-item-models-asset-struct-asset-src-mq3-client-playable-item-models-ml-2052803147"></a>
## Asset

```ml
struct Asset
```

Stores playable item models asset record, including `classname`, `category`, `modelPath`, `skinPath`, `model`, `bindings` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L86)

## Members

<a id="field-field-mq3-client-playable-item-models-asset-bindings-bindings-src-mq3-client-playable-item-models-ml-1828962313"></a>
### bindings

```ml
bindings
```

Key-to-command associations available to the UI controls editor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L98)

<a id="field-field-mq3-client-playable-item-models-asset-bobamplitude-bobamplitude-src-mq3-client-playable-item-models-ml-1983861465"></a>
### bobAmplitude

```ml
bobAmplitude
```

When constructing this record, `loadDefinition` supplies `def.bobAmplitude` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L107)

<a id="field-field-mq3-client-playable-item-models-asset-category-category-src-mq3-client-playable-item-models-ml-979409989"></a>
### category

```ml
category
```

When constructing this record, `loadDefinition` supplies `def.category` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L90)

<a id="field-field-mq3-client-playable-item-models-asset-classname-classname-src-mq3-client-playable-item-models-ml-1415003917"></a>
### classname

```ml
classname
```

Item classname that keys this loaded model asset in the world-item catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L88)

<a id="field-field-mq3-client-playable-item-models-asset-heightoffset-heightoffset-src-mq3-client-playable-item-models-ml-464768289"></a>
### heightOffset

```ml
heightOffset
```

When constructing this record, `loadDefinition` supplies `def.heightOffset` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L105)

<a id="field-field-mq3-client-playable-item-models-asset-model-model-src-mq3-client-playable-item-models-ml-1138587913"></a>
### model

```ml
model
```

Model resource selected for rendering the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L96)

<a id="field-field-mq3-client-playable-item-models-asset-modelpath-modelpath-src-mq3-client-playable-item-models-ml-1713982897"></a>
### modelPath

```ml
modelPath
```

Virtual path used to load the model resource for this client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L92)

<a id="field-field-mq3-client-playable-item-models-asset-scale-scale-src-mq3-client-playable-item-models-ml-1419223945"></a>
### scale

```ml
scale
```

When constructing this record, `loadDefinition` supplies `def.scale` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L103)

<a id="field-field-mq3-client-playable-item-models-asset-skinpath-skinpath-src-mq3-client-playable-item-models-ml-1137088905"></a>
### skinPath

```ml
skinPath
```

When constructing this record, `loadDefinition` supplies `def.skinPath` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L94)

<a id="field-field-mq3-client-playable-item-models-asset-sourcetriangles-sourcetriangles-src-mq3-client-playable-item-models-ml-1092637785"></a>
### sourceTriangles

```ml
sourceTriangles
```

When constructing this record, `loadDefinition` supplies `sourceTriangles` for this member. Used by `renderAsset` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L101)

<a id="field-field-mq3-client-playable-item-models-asset-spindegreespersecond-spindegreespersecond-src-mq3-client-playable-item-models-ml-945494613"></a>
### spinDegreesPerSecond

```ml
spinDegreesPerSecond
```

When constructing this record, `loadDefinition` supplies `def.spinDegreesPerSecond` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L110)
