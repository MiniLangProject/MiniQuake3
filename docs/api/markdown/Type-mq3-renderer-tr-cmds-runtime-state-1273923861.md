# `mq3.renderer.tr_cmds_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-cmds-runtime-ml-2143950218.md)

<a id="struct-struct-mq3-renderer-tr-cmds-runtime-state-struct-state-src-mq3-renderer-tr-cmds-runtime-ml-1543424931"></a>
## State

```ml
struct State
```

Data record for `mq3.renderer.tr_cmds_runtime.State`; groups `queue`, `backend`, `smpActive`, `renderThreadActive`, `blockedOnRender`, `blockedOnMain`, and 9 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L144)

## Members

<a id="field-field-mq3-renderer-tr-cmds-runtime-state-back-back-src-mq3-renderer-tr-cmds-runtime-ml-681355982"></a>
### back

```ml
back
```

Backend drawing counters collected for renderer statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L174)

<a id="field-field-mq3-renderer-tr-cmds-runtime-state-backend-backend-src-mq3-renderer-tr-cmds-runtime-ml-2094011680"></a>
### backend

```ml
backend
```

Backend implementation used to execute platform or drawing operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L148)

<a id="field-field-mq3-renderer-tr-cmds-runtime-state-blockedonmain-blockedonmain-src-mq3-renderer-tr-cmds-runtime-ml-1327578740"></a>
### blockedOnMain

```ml
blockedOnMain
```

Number of renderer waits for the frontend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L156)

<a id="field-field-mq3-renderer-tr-cmds-runtime-state-blockedonrender-blockedonrender-src-mq3-renderer-tr-cmds-runtime-ml-749831476"></a>
### blockedOnRender

```ml
blockedOnRender
```

Number of frontend waits for the render thread.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L154)

<a id="field-field-mq3-renderer-tr-cmds-runtime-state-finishcalled-finishcalled-src-mq3-renderer-tr-cmds-runtime-ml-612672300"></a>
### finishCalled

```ml
finishCalled
```

Whether a graphics completion barrier was already issued for this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L166)

<a id="field-field-mq3-renderer-tr-cmds-runtime-state-framecount-framecount-src-mq3-renderer-tr-cmds-runtime-ml-621034840"></a>
### frameCount

```ml
frameCount
```

Sequence count of frames processed by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L160)

<a id="field-field-mq3-renderer-tr-cmds-runtime-state-framescenenum-framescenenum-src-mq3-renderer-tr-cmds-runtime-ml-2010815552"></a>
### frameSceneNum

```ml
frameSceneNum
```

Sequence number of the scene within the current frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L162)

<a id="field-field-mq3-renderer-tr-cmds-runtime-state-front-front-src-mq3-renderer-tr-cmds-runtime-ml-1688713236"></a>
### front

```ml
front
```

Frontend visibility and culling counters collected for renderer statistics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L172)

<a id="field-field-mq3-renderer-tr-cmds-runtime-state-frontendmsec-frontendmsec-src-mq3-renderer-tr-cmds-runtime-ml-21136648"></a>
### frontEndMsec

```ml
frontEndMsec
```

Milliseconds spent preparing the frontend's scene commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L164)

<a id="field-field-mq3-renderer-tr-cmds-runtime-state-queue-queue-src-mq3-renderer-tr-cmds-runtime-ml-1538548028"></a>
### queue

```ml
queue
```

Queue holding operations waiting to be executed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L146)

<a id="field-field-mq3-renderer-tr-cmds-runtime-state-renderthreadactive-renderthreadactive-src-mq3-renderer-tr-cmds-runtime-ml-1448021460"></a>
### renderThreadActive

```ml
renderThreadActive
```

Whether a dedicated thread is executing renderer commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L152)

<a id="field-field-mq3-renderer-tr-cmds-runtime-state-services-services-src-mq3-renderer-tr-cmds-runtime-ml-918567544"></a>
### services

```ml
services
```

Injected host operations used by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L170)

<a id="field-field-mq3-renderer-tr-cmds-runtime-state-settings-settings-src-mq3-renderer-tr-cmds-runtime-ml-2050902158"></a>
### settings

```ml
settings
```

Configuration values governing the active subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L168)

<a id="field-field-mq3-renderer-tr-cmds-runtime-state-smpactive-smpactive-src-mq3-renderer-tr-cmds-runtime-ml-139873688"></a>
### smpActive

```ml
smpActive
```

Whether a separate render thread is currently active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L150)

<a id="field-field-mq3-renderer-tr-cmds-runtime-state-smpframe-smpframe-src-mq3-renderer-tr-cmds-runtime-ml-449038258"></a>
### smpFrame

```ml
smpFrame
```

Index of the frame buffer shared between frontend and render thread.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L158)
