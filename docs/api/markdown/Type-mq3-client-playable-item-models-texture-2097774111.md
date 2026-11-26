# `mq3.client.playable_item_models.Texture`

[Home](README.md) · [Source file](File-src-mq3-client-playable-item-models-ml-1740601852.md)

<a id="struct-struct-mq3-client-playable-item-models-texture-struct-texture-src-mq3-client-playable-item-models-ml-395015049"></a>
## Texture

```ml
struct Texture
```

Stores playable item models texture record, including `imageName`, `image`, `slot`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L47)

## Members

<a id="field-field-mq3-client-playable-item-models-texture-image-image-src-mq3-client-playable-item-models-ml-2143427944"></a>
### image

```ml
image
```

When constructing this record, `resolveBinding` supplies `loaded[1]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L51)

<a id="field-field-mq3-client-playable-item-models-texture-imagename-imagename-src-mq3-client-playable-item-models-ml-524869440"></a>
### imageName

```ml
imageName
```

Resolved image path of a loaded texture available to world-item materials.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L49)

<a id="field-field-mq3-client-playable-item-models-texture-slot-slot-src-mq3-client-playable-item-models-ml-590792624"></a>
### slot

```ml
slot
```

Texture or media-cache slot assigned to this asset for renderer submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L53)
