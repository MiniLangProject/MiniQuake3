# `mq3.renderer.scene_queue.State`

[Home](README.md) · [Source file](File-src-mq3-renderer-scene-queue-ml-703423413.md)

<a id="struct-struct-mq3-renderer-scene-queue-state-struct-state-src-mq3-renderer-scene-queue-ml-55301875"></a>
## State

```ml
struct State
```

Data record for `mq3.renderer.scene_queue.State`; groups `registered`, `hardwareType`, `worldLoaded`, `fogBounds`, `maxPolys`, `maxPolyVerts`, and 9 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L114)

## Members

<a id="field-field-mq3-renderer-scene-queue-state-context-context-src-mq3-renderer-scene-queue-ml-1037577442"></a>
### context

```ml
context
```

Host state supplied when reporting invalid or rejected scene submissions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L144)

<a id="field-field-mq3-renderer-scene-queue-state-diagnosticfn-diagnosticfn-src-mq3-renderer-scene-queue-ml-1825419476"></a>
### diagnosticFn

```ml
diagnosticFn
```

Host callback used to perform diagnostic operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L142)

<a id="field-field-mq3-renderer-scene-queue-state-dlights-dlights-src-mq3-renderer-scene-queue-ml-678295670"></a>
### dlights

```ml
dlights
```

Dynamic lights submitted to the current scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L130)

<a id="field-field-mq3-renderer-scene-queue-state-entities-entities-src-mq3-renderer-scene-queue-ml-1244127252"></a>
### entities

```ml
entities
```

Entity records associated with the current world, scene, or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L128)

<a id="field-field-mq3-renderer-scene-queue-state-firstscenedlight-firstscenedlight-src-mq3-renderer-scene-queue-ml-2134542714"></a>
### firstSceneDlight

```ml
firstSceneDlight
```

First dynamic light belonging to the current scene within the shared frame buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L138)

<a id="field-field-mq3-renderer-scene-queue-state-firstsceneentity-firstsceneentity-src-mq3-renderer-scene-queue-ml-1339327588"></a>
### firstSceneEntity

```ml
firstSceneEntity
```

First entity belonging to the current scene within the shared frame buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L136)

<a id="field-field-mq3-renderer-scene-queue-state-firstscenepoly-firstscenepoly-src-mq3-renderer-scene-queue-ml-1601076322"></a>
### firstScenePoly

```ml
firstScenePoly
```

First polygon belonging to the current scene within the shared frame buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L140)

<a id="field-field-mq3-renderer-scene-queue-state-fogbounds-fogbounds-src-mq3-renderer-scene-queue-ml-444047734"></a>
### fogBounds

```ml
fogBounds
```

World-space bounds of fog volumes used to classify submitted polygons.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L122)

<a id="field-field-mq3-renderer-scene-queue-state-hardwaretype-hardwaretype-src-mq3-renderer-scene-queue-ml-1323420218"></a>
### hardwareType

```ml
hardwareType
```

Detected graphics-hardware family used to select compatibility behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L118)

<a id="field-field-mq3-renderer-scene-queue-state-maxpolys-maxpolys-src-mq3-renderer-scene-queue-ml-2019168528"></a>
### maxPolys

```ml
maxPolys
```

Maximum number of polygons accepted by the scene buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L124)

<a id="field-field-mq3-renderer-scene-queue-state-maxpolyverts-maxpolyverts-src-mq3-renderer-scene-queue-ml-48889542"></a>
### maxPolyVerts

```ml
maxPolyVerts
```

Maximum number of polygon vertices accepted by the scene buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L126)

<a id="field-field-mq3-renderer-scene-queue-state-numpolyverts-numpolyverts-src-mq3-renderer-scene-queue-ml-1418015962"></a>
### numPolyVerts

```ml
numPolyVerts
```

Number of polygon vertices currently stored in the scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L134)

<a id="field-field-mq3-renderer-scene-queue-state-polys-polys-src-mq3-renderer-scene-queue-ml-1717617802"></a>
### polys

```ml
polys
```

Polygons submitted to the current scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L132)

<a id="field-field-mq3-renderer-scene-queue-state-registered-registered-src-mq3-renderer-scene-queue-ml-885278694"></a>
### registered

```ml
registered
```

Whether the subsystem has completed resource registration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L116)

<a id="field-field-mq3-renderer-scene-queue-state-worldloaded-worldloaded-src-mq3-renderer-scene-queue-ml-1770630246"></a>
### worldLoaded

```ml
worldLoaded
```

Whether a world map is available to the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L120)
