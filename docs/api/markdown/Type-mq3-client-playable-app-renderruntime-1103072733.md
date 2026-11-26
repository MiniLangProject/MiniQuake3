# `mq3.client.playable_app.RenderRuntime`

[Home](README.md) · [Source file](File-src-mq3-client-playable-app-ml-15784959.md)

<a id="struct-struct-mq3-client-playable-app-renderruntime-struct-renderruntime-src-mq3-client-playable-app-ml-710217069"></a>
## RenderRuntime

```ml
struct RenderRuntime
```

Stores playable app render runtime record, including `lightGrid`, `collisionWorld`, `shadowCatalog`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L153)

## Members

<a id="field-field-mq3-client-playable-app-renderruntime-collisionworld-collisionworld-src-mq3-client-playable-app-ml-101658541"></a>
### collisionWorld

```ml
collisionWorld
```

When constructing this record, `runLimited` supplies `world` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L157)

<a id="field-field-mq3-client-playable-app-renderruntime-lightgrid-lightgrid-src-mq3-client-playable-app-ml-81858233"></a>
### lightGrid

```ml
lightGrid
```

When constructing this record, `runLimited` supplies `lightGrid` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L155)

<a id="field-field-mq3-client-playable-app-renderruntime-shadowcatalog-shadowcatalog-src-mq3-client-playable-app-ml-1176041769"></a>
### shadowCatalog

```ml
shadowCatalog
```

When constructing this record, `runLimited` supplies an absent (`void`) value for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_app.ml#L159)
