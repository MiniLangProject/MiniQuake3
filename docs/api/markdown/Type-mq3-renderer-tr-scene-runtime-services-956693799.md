# `mq3.renderer.tr_scene_runtime.Services`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-scene-runtime-ml-1958871231.md)

<a id="struct-struct-mq3-renderer-tr-scene-runtime-services-struct-services-src-mq3-renderer-tr-scene-runtime-ml-1757471251"></a>
## Services

```ml
struct Services
```

Callback table for `mq3.renderer.tr_scene_runtime.Services`; exposes `timeFn`, `renderViewFn`, `drawSurfFn`, `shaderFn`, `eventFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L103)

## Members

<a id="field-field-mq3-renderer-tr-scene-runtime-services-context-context-src-mq3-renderer-tr-scene-runtime-ml-212176355"></a>
### context

```ml
context
```

Scene-host state supplied to clock, view-rendering, draw-surface, shader, and event callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L115)

<a id="field-field-mq3-renderer-tr-scene-runtime-services-drawsurffn-drawsurffn-src-mq3-renderer-tr-scene-runtime-ml-34364611"></a>
### drawSurfFn

```ml
drawSurfFn
```

Host callback used to perform draw surf operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L109)

<a id="field-field-mq3-renderer-tr-scene-runtime-services-eventfn-eventfn-src-mq3-renderer-tr-scene-runtime-ml-1964204579"></a>
### eventFn

```ml
eventFn
```

Host callback used to perform event operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L113)

<a id="field-field-mq3-renderer-tr-scene-runtime-services-renderviewfn-renderviewfn-src-mq3-renderer-tr-scene-runtime-ml-1949429349"></a>
### renderViewFn

```ml
renderViewFn
```

Host callback used to perform render view operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L107)

<a id="field-field-mq3-renderer-tr-scene-runtime-services-shaderfn-shaderfn-src-mq3-renderer-tr-scene-runtime-ml-1350422977"></a>
### shaderFn

```ml
shaderFn
```

Host callback used to perform shader operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L111)

<a id="field-field-mq3-renderer-tr-scene-runtime-services-timefn-timefn-src-mq3-renderer-tr-scene-runtime-ml-948572469"></a>
### timeFn

```ml
timeFn
```

Host callback used to perform time operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_scene_runtime.ml#L105)
