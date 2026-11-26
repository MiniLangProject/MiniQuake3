# `mq3.client.playable_explosions.Catalog`

[Home](README.md) · [Source file](File-src-mq3-client-playable-explosions-ml-2142049028.md)

<a id="struct-struct-mq3-client-playable-explosions-catalog-struct-catalog-src-mq3-client-playable-explosions-ml-470471559"></a>
## Catalog

```ml
struct Catalog
```

Stores playable explosions catalog record, including `textures`, `profiles`, `plasmaModel`, `firstTextureSlot`, `textureCount`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L49)

## Members

<a id="field-field-mq3-client-playable-explosions-catalog-firsttextureslot-firsttextureslot-src-mq3-client-playable-explosions-ml-1805975076"></a>
### firstTextureSlot

```ml
firstTextureSlot
```

First texture-cache slot reserved for this module's media resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L58)

<a id="field-field-mq3-client-playable-explosions-catalog-plasmamodel-plasmamodel-src-mq3-client-playable-explosions-ml-55650054"></a>
### plasmaModel

```ml
plasmaModel
```

Model resource selected for the plasma presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L56)

<a id="field-field-mq3-client-playable-explosions-catalog-profiles-profiles-src-mq3-client-playable-explosions-ml-1994448230"></a>
### profiles

```ml
profiles
```

When constructing this record, `load` supplies `profiles` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L54)

<a id="field-field-mq3-client-playable-explosions-catalog-texturecount-texturecount-src-mq3-client-playable-explosions-ml-1980541590"></a>
### textureCount

```ml
textureCount
```

Number of texture resources or texture-cache slots represented by this media record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L60)

<a id="field-field-mq3-client-playable-explosions-catalog-textures-textures-src-mq3-client-playable-explosions-ml-1034877610"></a>
### textures

```ml
textures
```

When constructing this record, `load` supplies `textures` for this member. Used by `textureFor` and `upload` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_explosions.ml#L52)
