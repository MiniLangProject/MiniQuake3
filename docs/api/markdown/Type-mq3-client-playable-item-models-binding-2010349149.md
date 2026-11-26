# `mq3.client.playable_item_models.Binding`

[Home](README.md) · [Source file](File-src-mq3-client-playable-item-models-ml-1740601852.md)

<a id="struct-struct-mq3-client-playable-item-models-binding-struct-binding-src-mq3-client-playable-item-models-ml-1857103129"></a>
## Binding

```ml
struct Binding
```

Stores playable item models binding record, including `surfaceIndex`, `surfaceName`, `shaderName`, `imageName`, `image`, `textureSlot`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L56)

## Members

<a id="field-field-mq3-client-playable-item-models-binding-image-image-src-mq3-client-playable-item-models-ml-653100358"></a>
### image

```ml
image
```

When constructing this record, `resolveBinding` supplies `texture.image` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L66)

<a id="field-field-mq3-client-playable-item-models-binding-imagename-imagename-src-mq3-client-playable-item-models-ml-842169702"></a>
### imageName

```ml
imageName
```

Image path bound to a model surface's shader for world-item drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L64)

<a id="field-field-mq3-client-playable-item-models-binding-shadername-shadername-src-mq3-client-playable-item-models-ml-2062166134"></a>
### shaderName

```ml
shaderName
```

Virtual shader name used to register or resolve the displayed resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L62)

<a id="field-field-mq3-client-playable-item-models-binding-surfaceindex-surfaceindex-src-mq3-client-playable-item-models-ml-671257216"></a>
### surfaceIndex

```ml
surfaceIndex
```

When constructing this record, `resolveBinding` supplies `surfaceIndex` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L58)

<a id="field-field-mq3-client-playable-item-models-binding-surfacename-surfacename-src-mq3-client-playable-item-models-ml-702616858"></a>
### surfaceName

```ml
surfaceName
```

When constructing this record, `resolveBinding` supplies `surface.name` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L60)

<a id="field-field-mq3-client-playable-item-models-binding-textureslot-textureslot-src-mq3-client-playable-item-models-ml-2147071374"></a>
### textureSlot

```ml
textureSlot
```

Texture-cache slot assigned to the resource for renderer submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L68)
