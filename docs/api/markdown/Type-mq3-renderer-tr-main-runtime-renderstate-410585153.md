# `mq3.renderer.tr_main_runtime.RenderState`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-main-runtime-ml-668641946.md)

<a id="struct-struct-mq3-renderer-tr-main-runtime-renderstate-struct-renderstate-src-mq3-renderer-tr-main-runtime-ml-1071691499"></a>
## RenderState

```ml
struct RenderState
```

Data record for `mq3.renderer.tr_main_runtime.RenderState`; groups `viewCount`, `frameSceneNum`, `frameCount`, `numDrawSurfs`, `viewParms`, `queue`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_main_runtime.ml#L108)

## Members

<a id="field-field-mq3-renderer-tr-main-runtime-renderstate-framecount-framecount-src-mq3-renderer-tr-main-runtime-ml-570561656"></a>
### frameCount

```ml
frameCount
```

Sequence count of frames processed by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_main_runtime.ml#L114)

<a id="field-field-mq3-renderer-tr-main-runtime-renderstate-framescenenum-framescenenum-src-mq3-renderer-tr-main-runtime-ml-773096736"></a>
### frameSceneNum

```ml
frameSceneNum
```

Sequence number of the scene within the current frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_main_runtime.ml#L112)

<a id="field-field-mq3-renderer-tr-main-runtime-renderstate-numdrawsurfs-numdrawsurfs-src-mq3-renderer-tr-main-runtime-ml-96378250"></a>
### numDrawSurfs

```ml
numDrawSurfs
```

Number of draw surfaces currently queued.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_main_runtime.ml#L116)

<a id="field-field-mq3-renderer-tr-main-runtime-renderstate-queue-queue-src-mq3-renderer-tr-main-runtime-ml-978300860"></a>
### queue

```ml
queue
```

Queue holding operations waiting to be executed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_main_runtime.ml#L120)

<a id="field-field-mq3-renderer-tr-main-runtime-renderstate-services-services-src-mq3-renderer-tr-main-runtime-ml-1220518968"></a>
### services

```ml
services
```

Injected host operations used by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_main_runtime.ml#L122)

<a id="field-field-mq3-renderer-tr-main-runtime-renderstate-viewcount-viewcount-src-mq3-renderer-tr-main-runtime-ml-594605028"></a>
### viewCount

```ml
viewCount
```

Generation number used to avoid processing a surface twice in one view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_main_runtime.ml#L110)

<a id="field-field-mq3-renderer-tr-main-runtime-renderstate-viewparms-viewparms-src-mq3-renderer-tr-main-runtime-ml-518436704"></a>
### viewParms

```ml
viewParms
```

Derived camera matrices, clipping planes, and viewport settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_main_runtime.ml#L118)
