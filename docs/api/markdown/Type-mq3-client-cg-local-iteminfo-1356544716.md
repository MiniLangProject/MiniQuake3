# `mq3.client.cg_local.ItemInfo`

[Home](README.md) · [Source file](File-src-mq3-client-cg-local-ml-909335699.md)

<a id="struct-struct-mq3-client-cg-local-iteminfo-struct-iteminfo-src-mq3-client-cg-local-ml-1503586715"></a>
## ItemInfo

```ml
struct ItemInfo
```

Stores client game local item info record, including `registered`, `models`, `icon`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L529)

## Members

<a id="field-field-mq3-client-cg-local-iteminfo-icon-icon-src-mq3-client-cg-local-ml-1026352472"></a>
### icon

```ml
icon
```

Renderer resource handle used for icon; mirrors native `itemInfo_t.icon`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L535)

<a id="field-field-mq3-client-cg-local-iteminfo-models-models-src-mq3-client-cg-local-ml-609227546"></a>
### models

```ml
models
```

Renderer resource handles used for models; mirrors native `itemInfo_t.models`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L533)

<a id="field-field-mq3-client-cg-local-iteminfo-registered-registered-src-mq3-client-cg-local-ml-779360414"></a>
### registered

```ml
registered
```

True once the referenced media resources have been registered with the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cg_local.ml#L531)
