# `src/mq3/renderer/tr_cmds_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_cmds_runtime`](Package-mq3-renderer-tr-cmds-runtime-2137943374.md)

Reachable from entry: **no**

## Imports

- `mq3/renderer/command_queue.ml` as `commands` → [src/mq3/renderer/command_queue.ml](File-src-mq3-renderer-command-queue-ml-1425855282.md)

## Declarations

<a id="function-function-mq3-renderer-tr-cmds-runtime-backcounters-function-backcounters-src-mq3-renderer-tr-cmds-runtime-ml-947451382"></a>
### backCounters

```ml
function backCounters()
```

Constructs `mq3.renderer.tr_cmds_runtime.BackCounters` with `shaders` = `0`, `surfaces` = `0`, `vertexes` = `0`, `indexes` = `0` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L180)

- [mq3.renderer.tr_cmds_runtime.BackCounters](Type-mq3-renderer-tr-cmds-runtime-backcounters-878105578.md) — struct
<a id="function-function-mq3-renderer-tr-cmds-runtime-clearcounters-function-clearcounters-state-src-mq3-renderer-tr-cmds-runtime-ml-1519482705"></a>
### clearCounters

```ml
function clearCounters(state)
```

Updates `state.front`, `state.back` in `mq3.renderer.tr_cmds_runtime.clearCounters`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.front`, `state.back`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L208)

<a id="function-function-mq3-renderer-tr-cmds-runtime-configureoverdraw-function-configureoverdraw-state-src-mq3-renderer-tr-cmds-runtime-ml-2099892329"></a>
### configureOverdraw

```ml
function configureOverdraw(state)
```

Builds `c.measureOverdraw`, `c.measureOverdrawModified` in `mq3.renderer.tr_cmds_runtime.configureOverdraw`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.settings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L314)

<a id="function-function-mq3-renderer-tr-cmds-runtime-create-function-create-queue-backendstate-configuration-host-src-mq3-renderer-tr-cmds-runtime-ml-1016866612"></a>
### create

```ml
function create(queue, backendState, configuration, host)
```

Builds `mq3.renderer.tr_cmds_runtime.State` using `mq3.renderer.command_queue.create`, `mq3.renderer.command_queue.backend`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Initial value for `mq3.renderer.tr_cmds_runtime.State.queue`. |
| `backendState` | `dynamic` | — | Initial value for `mq3.renderer.tr_cmds_runtime.State.backend`. |
| `configuration` | `dynamic` | — | Initial value for `mq3.renderer.tr_cmds_runtime.State.settings`. |
| `host` | `dynamic` | — | Initial value for `mq3.renderer.tr_cmds_runtime.State.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L190)

<a id="constant-constant-mq3-renderer-tr-cmds-runtime-draw-surfs-bytes-const-draw-surfs-bytes-32-src-mq3-renderer-tr-cmds-runtime-ml-45844450"></a>
### DRAW_SURFS_BYTES

```ml
const DRAW_SURFS_BYTES = 32
```

Serialized byte size of the draw-surface submission command record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L17)

<a id="function-function-mq3-renderer-tr-cmds-runtime-emit-function-emit-state-kind-value-src-mq3-renderer-tr-cmds-runtime-ml-1356997922"></a>
### emit

```ml
function emit(state, kind, value)
```

Forwards a renderer-command event through the configured event service callback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.services`. |
| `kind` | `dynamic` | — | Argument 2 supplied to `state.services.eventFn`. |
| `value` | `dynamic` | — | Argument 3 supplied to `state.services.eventFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L204)

<a id="function-function-mq3-renderer-tr-cmds-runtime-executebatch-function-executebatch-state-src-mq3-renderer-tr-cmds-runtime-ml-1183747961"></a>
### executeBatch

```ml
function executeBatch(state)
```

Returns `commands.execute(state.backend,state.queue)` from `mq3.renderer.tr_cmds_runtime.executeBatch`; earlier branches return `state.services.executeFn(state.services.context,state.queue.commands)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.services`, `state.queue`, `state.backend`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L247)

<a id="function-function-mq3-renderer-tr-cmds-runtime-fail-function-fail-message-src-mq3-renderer-tr-cmds-runtime-ml-420679059"></a>
### fail

```ml
function fail(message)
```

Creates error `7740` with message `"tr_cmds: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7740,"tr_cmds: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L199)

<a id="function-function-mq3-renderer-tr-cmds-runtime-frontcounters-function-frontcounters-src-mq3-renderer-tr-cmds-runtime-ml-890505214"></a>
### frontCounters

```ml
function frontCounters()
```

Constructs `mq3.renderer.tr_cmds_runtime.FrontCounters` with `leafs` = `0`, `spherePatchIn` = `0`, `spherePatchClip` = `0`, `spherePatchOut` = `0` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L178)

- [mq3.renderer.tr_cmds_runtime.FrontCounters](Type-mq3-renderer-tr-cmds-runtime-frontcounters-977270382.md) — struct
<a id="function-function-mq3-renderer-tr-cmds-runtime-r-adddrawsurfcmd-function-r-adddrawsurfcmd-state-drawsurfs-numdrawsurfs-refdef-viewparms-src-mq3-renderer-tr-cmds-runtime-ml-1017614705"></a>
### R_AddDrawSurfCmd

```ml
function R_AddDrawSurfCmd(state, drawSurfs, numDrawSurfs, refdef, viewParms)
```

Returns `commands.app` from `mq3.renderer.tr_cmds_runtime.R_AddDrawSurfCmd`; earlier branches return `fail("negative draw-surface count")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.queue`. |
| `drawSurfs` | `dynamic` | — | Input used in the result expression `commands.append(state.queue,commands.RC_DRAW_SURFS,DRAW_SURFS_BYTES,[drawSurfs,numDrawSurfs,refdef,viewParms],void)`. |
| `numDrawSurfs` | `dynamic` | — | Input tested by `numDrawSurfs<0`. |
| `refdef` | `dynamic` | — | Input used in the result expression `commands.append(state.queue,commands.RC_DRAW_SURFS,DRAW_SURFS_BYTES,[drawSurfs,numDrawSurfs,refdef,viewParms],void)`. |
| `viewParms` | `dynamic` | — | Input used in the result expression `commands.append(state.queue,commands.RC_DRAW_SURFS,DRAW_SURFS_BYTES,[drawSurfs,numDrawSurfs,refdef,viewParms],void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L291)

<a id="function-function-mq3-renderer-tr-cmds-runtime-r-getcommandbuffer-function-r-getcommandbuffer-state-bytes-src-mq3-renderer-tr-cmds-runtime-ml-566043910"></a>
### R_GetCommandBuffer

```ml
function R_GetCommandBuffer(state, bytes)
```

Returns `commands.allocate(state.queue,bytes)` from `mq3.renderer.tr_cmds_runtime.R_GetCommandBuffer`; earlier branches return `fail("missing state")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.queue`. |
| `bytes` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.command_queue.allocate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L284)

<a id="function-function-mq3-renderer-tr-cmds-runtime-r-initcommandbuffers-function-r-initcommandbuffers-state-src-mq3-renderer-tr-cmds-runtime-ml-159808589"></a>
### R_InitCommandBuffers

```ml
function R_InitCommandBuffers(state)
```

Updates `state.smpActive` in `mq3.renderer.tr_cmds_runtime.R_InitCommandBuffers`; returns `state.smpActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.smpActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L227)

<a id="function-function-mq3-renderer-tr-cmds-runtime-r-issuerendercommands-function-r-issuerendercommands-state-runperformancecounters-src-mq3-renderer-tr-cmds-runtime-ml-586684389"></a>
### R_IssueRenderCommands

```ml
function R_IssueRenderCommands(state, runPerformanceCounters)
```

Updates `state.blockedOnRender`, `state.blockedOnMain`, `state.renderThreadActive` in `mq3.renderer.tr_cmds_runtime.R_IssueRenderCommands`; returns `executed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.blockedOnRender`, `state.blockedOnMain`, `state.renderThreadActive`. |
| `runPerformanceCounters` | `dynamic` | — | Input tested by `runPerformanceCounters`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L254)

<a id="function-function-mq3-renderer-tr-cmds-runtime-r-performancecounters-function-r-performancecounters-state-src-mq3-renderer-tr-cmds-runtime-ml-1502401213"></a>
### R_PerformanceCounters

```ml
function R_PerformanceCounters(state)
```

Formats the selected renderer performance-counter category and sends it through the command diagnostics path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.settings`, `state.back`, `state.front`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L211)

<a id="function-function-mq3-renderer-tr-cmds-runtime-r-shutdowncommandbuffers-function-r-shutdowncommandbuffers-state-src-mq3-renderer-tr-cmds-runtime-ml-1695518441"></a>
### R_ShutdownCommandBuffers

```ml
function R_ShutdownCommandBuffers(state)
```

Updates `state.smpActive`, `state.renderThreadActive` in `mq3.renderer.tr_cmds_runtime.R_ShutdownCommandBuffers`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.smpActive`, `state.renderThreadActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L239)

<a id="function-function-mq3-renderer-tr-cmds-runtime-r-syncrenderthread-function-r-syncrenderthread-state-src-mq3-renderer-tr-cmds-runtime-ml-1012056805"></a>
### R_SyncRenderThread

```ml
function R_SyncRenderThread(state)
```

Updates `state.renderThreadActive` in `mq3.renderer.tr_cmds_runtime.R_SyncRenderThread`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.renderThreadActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L274)

<a id="function-function-mq3-renderer-tr-cmds-runtime-re-beginframe-function-re-beginframe-state-stereoframe-src-mq3-renderer-tr-cmds-runtime-ml-328991232"></a>
### RE_BeginFrame

```ml
function RE_BeginFrame(state, stereoFrame)
```

Updates `state.finishCalled`, `state.frameCount`, `state.frameSceneNum` in `mq3.renderer.tr_cmds_runtime.RE_BeginFrame`; returns `queued`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.finishCalled`, `state.frameCount`, `state.frameSceneNum`. |
| `stereoFrame` | `dynamic` | — | Input tested by `stereoFrame==STEREO_LEFT`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L329)

<a id="function-function-mq3-renderer-tr-cmds-runtime-re-endframe-function-re-endframe-state-src-mq3-renderer-tr-cmds-runtime-ml-1236738521"></a>
### RE_EndFrame

```ml
function RE_EndFrame(state)
```

Updates `state.smpFrame`, `state.frontEndMsec`, `state.back.msec` in `mq3.renderer.tr_cmds_runtime.RE_EndFrame`; returns `[frontMsec,backMsec]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.smpFrame`, `state.frontEndMsec`, `state.back.msec`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L348)

<a id="function-function-mq3-renderer-tr-cmds-runtime-re-setcolor-function-re-setcolor-state-rgba-src-mq3-renderer-tr-cmds-runtime-ml-1621964701"></a>
### RE_SetColor

```ml
function RE_SetColor(state, rgba)
```

Returns `commands.setColor(state.queue,rgba)` from `mq3.renderer.tr_cmds_runtime.RE_SetColor`; earlier branches return `fail("missing state")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.queue`. |
| `rgba` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.command_queue.setColor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L298)

<a id="function-function-mq3-renderer-tr-cmds-runtime-re-stretchpic-function-re-stretchpic-state-x-y-w-h-s1-t1-s2-t2-shader-src-mq3-renderer-tr-cmds-runtime-ml-165668916"></a>
### RE_StretchPic

```ml
function RE_StretchPic(state, x, y, w, h, s1, t1, s2, t2, shader)
```

Returns `commands.stretchPic(state.queue,x,y,w,h,s1,t1,s2,t2,shader)` from `mq3.renderer.tr_cmds_runtime.RE_StretchPic`; earlier branches return `fail("missing state")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.queue`. |
| `x` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.command_queue.stretchPic`. |
| `y` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.command_queue.stretchPic`. |
| `w` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.command_queue.stretchPic`. |
| `h` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.command_queue.stretchPic`. |
| `s1` | `dynamic` | — | Argument 6 supplied to `mq3.renderer.command_queue.stretchPic`. |
| `t1` | `dynamic` | — | Argument 7 supplied to `mq3.renderer.command_queue.stretchPic`. |
| `s2` | `dynamic` | — | Argument 8 supplied to `mq3.renderer.command_queue.stretchPic`. |
| `t2` | `dynamic` | — | Argument 9 supplied to `mq3.renderer.command_queue.stretchPic`. |
| `shader` | `dynamic` | — | Argument 10 supplied to `mq3.renderer.command_queue.stretchPic`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L310)

<a id="function-function-mq3-renderer-tr-cmds-runtime-services-function-services-src-mq3-renderer-tr-cmds-runtime-ml-1282015870"></a>
### services

```ml
function services()
```

Constructs `mq3.renderer.tr_cmds_runtime.Services` with `eventFn` = `void`, `spawnThreadFn` = `void`, `frontEndSleepFn` = `void`, `wakeRendererFn` = `void` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L184)

- [mq3.renderer.tr_cmds_runtime.Services](Type-mq3-renderer-tr-cmds-runtime-services-2141671456.md) — struct
<a id="function-function-mq3-renderer-tr-cmds-runtime-settings-function-settings-src-mq3-renderer-tr-cmds-runtime-ml-217141690"></a>
### settings

```ml
function settings()
```

Constructs `mq3.renderer.tr_cmds_runtime.Settings` with `speeds` = `0`, `smp` = `false`, `showSmp` = `false`, `skipBackEnd` = `false` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L182)

- [mq3.renderer.tr_cmds_runtime.Settings](Type-mq3-renderer-tr-cmds-runtime-settings-272563117.md) — struct
- [mq3.renderer.tr_cmds_runtime.State](Type-mq3-renderer-tr-cmds-runtime-state-1273923861.md) — struct
<a id="constant-constant-mq3-renderer-tr-cmds-runtime-stereo-center-const-stereo-center-0-src-mq3-renderer-tr-cmds-runtime-ml-2072287729"></a>
### STEREO_CENTER

```ml
const STEREO_CENTER = 0
```

Stereo-frame selector for the ordinary centered view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L11)

<a id="constant-constant-mq3-renderer-tr-cmds-runtime-stereo-left-const-stereo-left-1-src-mq3-renderer-tr-cmds-runtime-ml-1160974322"></a>
### STEREO_LEFT

```ml
const STEREO_LEFT = 1
```

Stereo-frame selector for the left-eye view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L13)

<a id="constant-constant-mq3-renderer-tr-cmds-runtime-stereo-right-const-stereo-right-2-src-mq3-renderer-tr-cmds-runtime-ml-2078498975"></a>
### STEREO_RIGHT

```ml
const STEREO_RIGHT = 2
```

Stereo-frame selector for the right-eye view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_cmds_runtime.ml#L15)
