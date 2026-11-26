# `mq3.client.playable_item_models.Batch`

[Home](README.md) · [Source file](File-src-mq3-client-playable-item-models-ml-1740601852.md)

<a id="struct-struct-mq3-client-playable-item-models-batch-struct-batch-src-mq3-client-playable-item-models-ml-1977698627"></a>
## Batch

```ml
struct Batch
```

Stores playable item models batch record, including `triangles`, `drawnItems`, `skippedItems`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L164)

## Members

<a id="field-field-mq3-client-playable-item-models-batch-drawnitems-drawnitems-src-mq3-client-playable-item-models-ml-1771763477"></a>
### drawnItems

```ml
drawnItems
```

When constructing this record, `renderItems` supplies `drawn` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L168)

<a id="field-field-mq3-client-playable-item-models-batch-skippeditems-skippeditems-src-mq3-client-playable-item-models-ml-1960502097"></a>
### skippedItems

```ml
skippedItems
```

Number of candidate items omitted from the generated rendering batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L170)

<a id="field-field-mq3-client-playable-item-models-batch-triangles-triangles-src-mq3-client-playable-item-models-ml-1148985617"></a>
### triangles

```ml
triangles
```

When constructing this record, `renderItems` supplies `result` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_item_models.ml#L166)
