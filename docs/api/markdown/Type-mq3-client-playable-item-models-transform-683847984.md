# `mq3.client.playable_item_models.Transform`

[Home](README.md) · [Source file](File-src-mq3-client-playable-item-models-ml-1740601852.md)

<a id="struct-struct-mq3-client-playable-item-models-transform-struct-transform-src-mq3-client-playable-item-models-ml-1361678207"></a>
## Transform

```ml
struct Transform
```

Stores playable item models transform record, including `origin`, `axis`, `scale`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L133)

## Members

<a id="field-field-mq3-client-playable-item-models-transform-axis-axis-src-mq3-client-playable-item-models-ml-1868989967"></a>
### axis

```ml
axis
```

Three orientation basis vectors used to transform the rendered object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L137)

<a id="field-field-mq3-client-playable-item-models-transform-origin-origin-src-mq3-client-playable-item-models-ml-18944189"></a>
### origin

```ml
origin
```

World-space translation applied after rotating and scaling a world-item model vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L135)

<a id="field-field-mq3-client-playable-item-models-transform-scale-scale-src-mq3-client-playable-item-models-ml-374043197"></a>
### scale

```ml
scale
```

When constructing this record, `transform` supplies `scale` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_item_models.ml#L139)
