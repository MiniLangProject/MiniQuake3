# `mq3.renderer.scene_queue.RefEntity`

[Home](README.md) · [Source file](File-src-mq3-renderer-scene-queue-ml-703423413.md)

<a id="struct-struct-mq3-renderer-scene-queue-refentity-struct-refentity-src-mq3-renderer-scene-queue-ml-1245256105"></a>
## RefEntity

```ml
struct RefEntity
```

Data record for `mq3.renderer.scene_queue.RefEntity`; groups `reType`, `payload`, `lightingCalculated`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L42)

## Members

<a id="field-field-mq3-renderer-scene-queue-refentity-lightingcalculated-lightingcalculated-src-mq3-renderer-scene-queue-ml-832907653"></a>
### lightingCalculated

```ml
lightingCalculated
```

Whether entity lighting has already been computed for this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L48)

<a id="field-field-mq3-renderer-scene-queue-refentity-payload-payload-src-mq3-renderer-scene-queue-ml-1535450933"></a>
### payload

```ml
payload
```

Operation-specific data interpreted according to the record's command or event type.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L46)

<a id="field-field-mq3-renderer-scene-queue-refentity-retype-retype-src-mq3-renderer-scene-queue-ml-379214295"></a>
### reType

```ml
reType
```

Renderer entity type selecting the model, sprite, beam, or portal path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L44)
