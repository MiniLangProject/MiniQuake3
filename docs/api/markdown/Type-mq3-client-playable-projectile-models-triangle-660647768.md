# `mq3.client.playable_projectile_models.Triangle`

[Home](README.md) · [Source file](File-src-mq3-client-playable-projectile-models-ml-57815768.md)

<a id="struct-struct-mq3-client-playable-projectile-models-triangle-struct-triangle-src-mq3-client-playable-projectile-models-ml-596060389"></a>
## Triangle

```ml
struct Triangle
```

Stores playable projectile models triangle record, including `positions`, `texCoords`, `normals`, `textureSlot`, `imageName`, `shaderName` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L89)

## Members

<a id="field-field-mq3-client-playable-projectile-models-triangle-imagename-imagename-src-mq3-client-playable-projectile-models-ml-413056941"></a>
### imageName

```ml
imageName
```

Image path identifying the texture used by this emitted projectile triangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L99)

<a id="field-field-mq3-client-playable-projectile-models-triangle-lightorigin-lightorigin-src-mq3-client-playable-projectile-models-ml-153321069"></a>
### lightOrigin

```ml
lightOrigin
```

When constructing this record, `wrapModelTriangle` supplies `source.lightOrigin` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L107)

<a id="field-field-mq3-client-playable-projectile-models-triangle-normals-normals-src-mq3-client-playable-projectile-models-ml-1251458773"></a>
### normals

```ml
normals
```

When constructing this record, `wrapModelTriangle` supplies `source.normals` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L95)

<a id="field-field-mq3-client-playable-projectile-models-triangle-positions-positions-src-mq3-client-playable-projectile-models-ml-108680289"></a>
### positions

```ml
positions
```

Ordered positions used to build the stored trail or spatial history.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L91)

<a id="field-field-mq3-client-playable-projectile-models-triangle-shadername-shadername-src-mq3-client-playable-projectile-models-ml-1459259925"></a>
### shaderName

```ml
shaderName
```

Virtual shader name used to register or resolve the displayed resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L101)

<a id="field-field-mq3-client-playable-projectile-models-triangle-style-style-src-mq3-client-playable-projectile-models-ml-1648420561"></a>
### style

```ml
style
```

Projectile style identifying the render asset that produced this textured triangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L103)

<a id="field-field-mq3-client-playable-projectile-models-triangle-surfaceindex-surfaceindex-src-mq3-client-playable-projectile-models-ml-562890571"></a>
### surfaceIndex

```ml
surfaceIndex
```

When constructing this record, `wrapModelTriangle` supplies `source.surfaceIndex` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L105)

<a id="field-field-mq3-client-playable-projectile-models-triangle-texcoords-texcoords-src-mq3-client-playable-projectile-models-ml-55631641"></a>
### texCoords

```ml
texCoords
```

When constructing this record, `wrapModelTriangle` supplies `source.texCoords` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L93)

<a id="field-field-mq3-client-playable-projectile-models-triangle-textureslot-textureslot-src-mq3-client-playable-projectile-models-ml-510372957"></a>
### textureSlot

```ml
textureSlot
```

Texture-cache slot assigned to the resource for renderer submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_projectile_models.ml#L97)
