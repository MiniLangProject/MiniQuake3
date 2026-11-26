# `mq3.client.playable_projectile_models.Catalog`

[Home](README.md) · [Source file](File-src-mq3-client-playable-projectile-models-ml-57815768.md)

<a id="struct-struct-mq3-client-playable-projectile-models-catalog-struct-catalog-src-mq3-client-playable-projectile-models-ml-672425837"></a>
## Catalog

```ml
struct Catalog
```

Stores playable projectile models catalog record, including `assets`, `textures`, `shaderIndex`, `scriptCount`, `firstTextureSlot`, `maxTextureSlots` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L67)

## Members

<a id="field-field-mq3-client-playable-projectile-models-catalog-assets-assets-src-mq3-client-playable-projectile-models-ml-859871978"></a>
### assets

```ml
assets
```

Loaded projectile model and sprite assets, looked up by projectile style.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L69)

<a id="field-field-mq3-client-playable-projectile-models-catalog-firsttextureslot-firsttextureslot-src-mq3-client-playable-projectile-models-ml-2034372718"></a>
### firstTextureSlot

```ml
firstTextureSlot
```

First texture-cache slot reserved for this module's media resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L80)

<a id="field-field-mq3-client-playable-projectile-models-catalog-maxtextureslots-maxtextureslots-src-mq3-client-playable-projectile-models-ml-787811360"></a>
### maxTextureSlots

```ml
maxTextureSlots
```

When constructing this record, `loadCatalog` supplies `maxTextureSlots` for this member. Used by `loadSprite` and `loadModel` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L83)

<a id="field-field-mq3-client-playable-projectile-models-catalog-scriptcount-scriptcount-src-mq3-client-playable-projectile-models-ml-1125084096"></a>
### scriptCount

```ml
scriptCount
```

When constructing this record, `loadCatalog` supplies `scripts[1]` for this member. Used by `loadModel` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L78)

<a id="field-field-mq3-client-playable-projectile-models-catalog-shaderindex-shaderindex-src-mq3-client-playable-projectile-models-ml-1384087892"></a>
### shaderIndex

```ml
shaderIndex
```

When constructing this record, `loadCatalog` supplies `scripts[0]` for this member. Used by `loadSprite` and `loadModel` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L75)

<a id="field-field-mq3-client-playable-projectile-models-catalog-skipped-skipped-src-mq3-client-playable-projectile-models-ml-1324484392"></a>
### skipped

```ml
skipped
```

When constructing this record, `loadCatalog` supplies an empty list for this member. Used by `appendFallback` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L86)

<a id="field-field-mq3-client-playable-projectile-models-catalog-textures-textures-src-mq3-client-playable-projectile-models-ml-1643192592"></a>
### textures

```ml
textures
```

When constructing this record, `loadCatalog` supplies an empty list for this member. Used by `textureByName` and `loadSprite` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L72)
