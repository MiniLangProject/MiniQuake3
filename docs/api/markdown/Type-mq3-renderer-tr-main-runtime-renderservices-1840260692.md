# `mq3.renderer.tr_main_runtime.RenderServices`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-main-runtime-ml-668641946.md)

<a id="struct-struct-mq3-renderer-tr-main-runtime-renderservices-struct-renderservices-src-mq3-renderer-tr-main-runtime-ml-1543969087"></a>
## RenderServices

```ml
struct RenderServices
```

Callback table for `mq3.renderer.tr_main_runtime.RenderServices`; exposes `addWorldFn`, `addPolygonsFn`, `setupProjectionFn`, `addEntitiesFn`, `addCommandFn`, `debugFn`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L91)

## Members

<a id="field-field-mq3-renderer-tr-main-runtime-renderservices-addcommandfn-addcommandfn-src-mq3-renderer-tr-main-runtime-ml-919291877"></a>
### addCommandFn

```ml
addCommandFn
```

Host callback used to perform add command operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L101)

<a id="field-field-mq3-renderer-tr-main-runtime-renderservices-addentitiesfn-addentitiesfn-src-mq3-renderer-tr-main-runtime-ml-2073092637"></a>
### addEntitiesFn

```ml
addEntitiesFn
```

Host callback used to perform add entities operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L99)

<a id="field-field-mq3-renderer-tr-main-runtime-renderservices-addpolygonsfn-addpolygonsfn-src-mq3-renderer-tr-main-runtime-ml-545982537"></a>
### addPolygonsFn

```ml
addPolygonsFn
```

Host callback used to perform add polygons operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L95)

<a id="field-field-mq3-renderer-tr-main-runtime-renderservices-addworldfn-addworldfn-src-mq3-renderer-tr-main-runtime-ml-202836871"></a>
### addWorldFn

```ml
addWorldFn
```

Host callback used to perform add world operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L93)

<a id="field-field-mq3-renderer-tr-main-runtime-renderservices-context-context-src-mq3-renderer-tr-main-runtime-ml-837560629"></a>
### context

```ml
context
```

Frontend host state passed while collecting world, polygon, entity, and debug drawing commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L105)

<a id="field-field-mq3-renderer-tr-main-runtime-renderservices-debugfn-debugfn-src-mq3-renderer-tr-main-runtime-ml-1154484845"></a>
### debugFn

```ml
debugFn
```

Host callback used to perform debug operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L103)

<a id="field-field-mq3-renderer-tr-main-runtime-renderservices-setupprojectionfn-setupprojectionfn-src-mq3-renderer-tr-main-runtime-ml-429503073"></a>
### setupProjectionFn

```ml
setupProjectionFn
```

Host callback used to perform setup projection operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L97)
