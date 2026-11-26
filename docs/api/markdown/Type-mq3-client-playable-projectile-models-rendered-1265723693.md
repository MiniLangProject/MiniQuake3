# `mq3.client.playable_projectile_models.Rendered`

[Home](README.md) · [Source file](File-src-mq3-client-playable-projectile-models-ml-57815768.md)

<a id="struct-struct-mq3-client-playable-projectile-models-rendered-struct-rendered-src-mq3-client-playable-projectile-models-ml-996670229"></a>
## Rendered

```ml
struct Rendered
```

Stores playable projectile models rendered record, including `triangles`, `fallback`, `style`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L110)

## Members

<a id="field-field-mq3-client-playable-projectile-models-rendered-fallback-fallback-src-mq3-client-playable-projectile-models-ml-1048349030"></a>
### fallback

```ml
fallback
```

When constructing this record, `renderSnapshot` supplies `true` for this member. Used by `renderSnapshots` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L115)

<a id="field-field-mq3-client-playable-projectile-models-rendered-style-style-src-mq3-client-playable-projectile-models-ml-1581842702"></a>
### style

```ml
style
```

Projectile style associated with the completed model-or-sprite rendering result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L117)

<a id="field-field-mq3-client-playable-projectile-models-rendered-triangles-triangles-src-mq3-client-playable-projectile-models-ml-606033674"></a>
### triangles

```ml
triangles
```

When constructing this record, `renderSnapshot` supplies an empty list for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_projectile_models.ml#L112)
