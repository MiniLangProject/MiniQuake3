# `mq3.renderer.scene_queue.DLight`

[Home](README.md) · [Source file](File-src-mq3-renderer-scene-queue-ml-703423413.md)

<a id="struct-struct-mq3-renderer-scene-queue-dlight-struct-dlight-src-mq3-renderer-scene-queue-ml-1451233431"></a>
## DLight

```ml
struct DLight
```

Data record for `mq3.renderer.scene_queue.DLight`; groups `origin`, `radius`, `color`, `additive`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L94)

## Members

<a id="field-field-mq3-renderer-scene-queue-dlight-additive-additive-src-mq3-renderer-scene-queue-ml-40220409"></a>
### additive

```ml
additive
```

Whether the dynamic light contributes additively rather than modulating the surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L102)

<a id="field-field-mq3-renderer-scene-queue-dlight-color-color-src-mq3-renderer-scene-queue-ml-2102366005"></a>
### color

```ml
color
```

RGB contribution requested for a dynamic light added to the scene queue.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L100)

<a id="field-field-mq3-renderer-scene-queue-dlight-origin-origin-src-mq3-renderer-scene-queue-ml-1484780077"></a>
### origin

```ml
origin
```

World-space center of a dynamic light submitted to the scene queue.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L96)

<a id="field-field-mq3-renderer-scene-queue-dlight-radius-radius-src-mq3-renderer-scene-queue-ml-2037718789"></a>
### radius

```ml
radius
```

Radius used for the light, sprite, beam, or bounded object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L98)
