# `mq3.client.playable_item_models.Triangle`

[Home](README.md) · [Source file](File-src-mq3-client-playable-item-models-ml-1740601852.md)

<a id="struct-struct-mq3-client-playable-item-models-triangle-struct-triangle-src-mq3-client-playable-item-models-ml-2058422537"></a>
## Triangle

```ml
struct Triangle
```

Stores playable item models triangle record, including `positions`, `texCoords`, `normals`, `textureSlot`, `imageName`, `shaderName` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L142)

## Members

<a id="field-field-mq3-client-playable-item-models-triangle-classname-classname-src-mq3-client-playable-item-models-ml-1278785425"></a>
### classname

```ml
classname
```

Item classname identifying which world-item asset produced this rendered triangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L157)

<a id="field-field-mq3-client-playable-item-models-triangle-imagename-imagename-src-mq3-client-playable-item-models-ml-938232741"></a>
### imageName

```ml
imageName
```

Image path identifying the material used by this emitted world-item triangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L153)

<a id="field-field-mq3-client-playable-item-models-triangle-lightorigin-lightorigin-src-mq3-client-playable-item-models-ml-1024236389"></a>
### lightOrigin

```ml
lightOrigin
```

When constructing this record, `renderAsset` supplies `value.origin` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L161)

<a id="field-field-mq3-client-playable-item-models-triangle-normals-normals-src-mq3-client-playable-item-models-ml-2081421293"></a>
### normals

```ml
normals
```

When constructing this record, `renderAsset` supplies `normals` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L149)

<a id="field-field-mq3-client-playable-item-models-triangle-positions-positions-src-mq3-client-playable-item-models-ml-952238873"></a>
### positions

```ml
positions
```

Ordered positions used to build the stored trail or spatial history.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L144)

<a id="field-field-mq3-client-playable-item-models-triangle-shadername-shadername-src-mq3-client-playable-item-models-ml-1004909101"></a>
### shaderName

```ml
shaderName
```

Virtual shader name used to register or resolve the displayed resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L155)

<a id="field-field-mq3-client-playable-item-models-triangle-surfaceindex-surfaceindex-src-mq3-client-playable-item-models-ml-1737832011"></a>
### surfaceIndex

```ml
surfaceIndex
```

When constructing this record, `renderAsset` supplies `surface.surfaceIndex` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L159)

<a id="field-field-mq3-client-playable-item-models-triangle-texcoords-texcoords-src-mq3-client-playable-item-models-ml-382083153"></a>
### texCoords

```ml
texCoords
```

When constructing this record, `renderAsset` supplies `surface.triangleTexCoords[triangleIndex]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L147)

<a id="field-field-mq3-client-playable-item-models-triangle-textureslot-textureslot-src-mq3-client-playable-item-models-ml-1695490261"></a>
### textureSlot

```ml
textureSlot
```

Texture-cache slot assigned to the resource for renderer submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L151)
