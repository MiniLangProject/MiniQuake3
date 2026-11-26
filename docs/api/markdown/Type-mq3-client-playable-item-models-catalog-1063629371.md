# `mq3.client.playable_item_models.Catalog`

[Home](README.md) · [Source file](File-src-mq3-client-playable-item-models-ml-1740601852.md)

<a id="struct-struct-mq3-client-playable-item-models-catalog-struct-catalog-src-mq3-client-playable-item-models-ml-1550653345"></a>
## Catalog

```ml
struct Catalog
```

Stores playable item models catalog record, including `assets`, `textures`, `shaderIndex`, `scriptCount`, `firstTextureSlot`, `maxTextureSlots` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L113)

## Members

<a id="field-field-mq3-client-playable-item-models-catalog-assets-assets-src-mq3-client-playable-item-models-ml-92938550"></a>
### assets

```ml
assets
```

Loaded world-item render assets, looked up by the item's native classname.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L115)

<a id="field-field-mq3-client-playable-item-models-catalog-firsttextureslot-firsttextureslot-src-mq3-client-playable-item-models-ml-1174341722"></a>
### firstTextureSlot

```ml
firstTextureSlot
```

First texture-cache slot reserved for this module's media resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L125)

<a id="field-field-mq3-client-playable-item-models-catalog-maxtextureslots-maxtextureslots-src-mq3-client-playable-item-models-ml-609731716"></a>
### maxTextureSlots

```ml
maxTextureSlots
```

When constructing this record, `loadCatalog` supplies `maxTextureSlots` for this member. Used by `resolveBinding` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L128)

<a id="field-field-mq3-client-playable-item-models-catalog-scriptcount-scriptcount-src-mq3-client-playable-item-models-ml-384147492"></a>
### scriptCount

```ml
scriptCount
```

When constructing this record, `loadCatalog` supplies `scripts[1]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L123)

<a id="field-field-mq3-client-playable-item-models-catalog-shaderindex-shaderindex-src-mq3-client-playable-item-models-ml-646720168"></a>
### shaderIndex

```ml
shaderIndex
```

When constructing this record, `loadCatalog` supplies `scripts[0]` for this member. Used by `resolveBinding` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L121)

<a id="field-field-mq3-client-playable-item-models-catalog-skipped-skipped-src-mq3-client-playable-item-models-ml-1851845420"></a>
### skipped

```ml
skipped
```

When constructing this record, `loadCatalog` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L130)

<a id="field-field-mq3-client-playable-item-models-catalog-textures-textures-src-mq3-client-playable-item-models-ml-1342773044"></a>
### textures

```ml
textures
```

When constructing this record, `loadCatalog` supplies an empty list for this member. Used by `textureByName` and `resolveBinding` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L118)
