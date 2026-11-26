# `mq3.client.playable_projectile_models.Asset`

[Home](README.md) · [Source file](File-src-mq3-client-playable-projectile-models-ml-57815768.md)

<a id="struct-struct-mq3-client-playable-projectile-models-asset-struct-asset-src-mq3-client-playable-projectile-models-ml-1128232095"></a>
## Asset

```ml
struct Asset
```

Stores playable projectile models asset record, including `style`, `kind`, `modelPath`, `shaderName`, `modelAsset`, `textureSlot` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L45)

## Members

<a id="field-field-mq3-client-playable-projectile-models-asset-image-image-src-mq3-client-playable-projectile-models-ml-1004713313"></a>
### image

```ml
image
```

When constructing this record, `loadSprite` supplies `texture.image` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L62)

<a id="field-field-mq3-client-playable-projectile-models-asset-imagename-imagename-src-mq3-client-playable-projectile-models-ml-1699355881"></a>
### imageName

```ml
imageName
```

Resolved image path used by this loaded projectile sprite or model material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L60)

<a id="field-field-mq3-client-playable-projectile-models-asset-kind-kind-src-mq3-client-playable-projectile-models-ml-1735072033"></a>
### kind

```ml
kind
```

Effect or media category selecting the matching geometry, texture, or presentation behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L49)

<a id="field-field-mq3-client-playable-projectile-models-asset-modelasset-modelasset-src-mq3-client-playable-projectile-models-ml-361708723"></a>
### modelAsset

```ml
modelAsset
```

When constructing this record, `loadSprite` supplies an absent (`void`) value for this member. Used by `renderModel` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L56)

<a id="field-field-mq3-client-playable-projectile-models-asset-modelpath-modelpath-src-mq3-client-playable-projectile-models-ml-1325124217"></a>
### modelPath

```ml
modelPath
```

Virtual path used to load the model resource for this client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L51)

<a id="field-field-mq3-client-playable-projectile-models-asset-radius-radius-src-mq3-client-playable-projectile-models-ml-1651556273"></a>
### radius

```ml
radius
```

World-space billboard radius retained with a loaded projectile sprite asset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L64)

<a id="field-field-mq3-client-playable-projectile-models-asset-shadername-shadername-src-mq3-client-playable-projectile-models-ml-397051201"></a>
### shaderName

```ml
shaderName
```

Virtual shader name used to register or resolve the displayed resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L53)

<a id="field-field-mq3-client-playable-projectile-models-asset-style-style-src-mq3-client-playable-projectile-models-ml-1570485021"></a>
### style

```ml
style
```

Projectile style used as the lookup key for this loaded render asset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L47)

<a id="field-field-mq3-client-playable-projectile-models-asset-textureslot-textureslot-src-mq3-client-playable-projectile-models-ml-1697459081"></a>
### textureSlot

```ml
textureSlot
```

Texture-cache slot assigned to the resource for renderer submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L58)
