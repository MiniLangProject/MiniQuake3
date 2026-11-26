# `mq3.client.playable_projectile_models.Definition`

[Home](README.md) · [Source file](File-src-mq3-client-playable-projectile-models-ml-57815768.md)

<a id="struct-struct-mq3-client-playable-projectile-models-definition-struct-definition-src-mq3-client-playable-projectile-models-ml-1996167373"></a>
## Definition

```ml
struct Definition
```

Stores playable projectile models definition record, including `style`, `kind`, `modelPath`, `shaderName`, `radius`, `expectedTextures`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L30)

## Members

<a id="field-field-mq3-client-playable-projectile-models-definition-expectedtextures-expectedtextures-src-mq3-client-playable-projectile-models-ml-1859873374"></a>
### expectedTextures

```ml
expectedTextures
```

When constructing this record, `definition` supplies `4` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L42)

<a id="field-field-mq3-client-playable-projectile-models-definition-kind-kind-src-mq3-client-playable-projectile-models-ml-862410114"></a>
### kind

```ml
kind
```

Effect or media category selecting the matching geometry, texture, or presentation behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L34)

<a id="field-field-mq3-client-playable-projectile-models-definition-modelpath-modelpath-src-mq3-client-playable-projectile-models-ml-176931078"></a>
### modelPath

```ml
modelPath
```

Virtual path used to load the model resource for this client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L36)

<a id="field-field-mq3-client-playable-projectile-models-definition-radius-radius-src-mq3-client-playable-projectile-models-ml-2048101130"></a>
### radius

```ml
radius
```

World-space sprite radius configured for this projectile style; model-backed styles use zero.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L40)

<a id="field-field-mq3-client-playable-projectile-models-definition-shadername-shadername-src-mq3-client-playable-projectile-models-ml-2083058238"></a>
### shaderName

```ml
shaderName
```

Virtual shader name used to register or resolve the displayed resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L38)

<a id="field-field-mq3-client-playable-projectile-models-definition-style-style-src-mq3-client-playable-projectile-models-ml-510662074"></a>
### style

```ml
style
```

Projectile style that selects this model or sprite resource definition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L32)
