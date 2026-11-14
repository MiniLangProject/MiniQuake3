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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L22)

- [mq3.renderer.tr_cmds_runtime.BackCounters](Type-mq3-renderer-tr-cmds-runtime-backcounters-878105578.md) — struct
<a id="function-function-mq3-renderer-tr-cmds-runtime-clearcounters-function-clearcounters-state-src-mq3-renderer-tr-cmds-runtime-ml-1519482705"></a>
### clearCounters

```ml
function clearCounters(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L35)

<a id="function-function-mq3-renderer-tr-cmds-runtime-configureoverdraw-function-configureoverdraw-state-src-mq3-renderer-tr-cmds-runtime-ml-2099892329"></a>
### configureOverdraw

```ml
function configureOverdraw(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L103)

<a id="function-function-mq3-renderer-tr-cmds-runtime-create-function-create-queue-backendstate-configuration-host-src-mq3-renderer-tr-cmds-runtime-ml-1016866612"></a>
### create

```ml
function create(queue, backendState, configuration, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |
| `backendState` | `dynamic` | — |  |
| `configuration` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L25)

<a id="constant-constant-mq3-renderer-tr-cmds-runtime-draw-surfs-bytes-const-draw-surfs-bytes-32-src-mq3-renderer-tr-cmds-runtime-ml-45844450"></a>
### DRAW_SURFS_BYTES

```ml
const DRAW_SURFS_BYTES = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L13)

<a id="function-function-mq3-renderer-tr-cmds-runtime-emit-function-emit-state-kind-value-src-mq3-renderer-tr-cmds-runtime-ml-1356997922"></a>
### emit

```ml
function emit(state, kind, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L33)

<a id="function-function-mq3-renderer-tr-cmds-runtime-executebatch-function-executebatch-state-src-mq3-renderer-tr-cmds-runtime-ml-1183747961"></a>
### executeBatch

```ml
function executeBatch(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L66)

<a id="function-function-mq3-renderer-tr-cmds-runtime-fail-function-fail-message-src-mq3-renderer-tr-cmds-runtime-ml-420679059"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L32)

<a id="function-function-mq3-renderer-tr-cmds-runtime-frontcounters-function-frontcounters-src-mq3-renderer-tr-cmds-runtime-ml-890505214"></a>
### frontCounters

```ml
function frontCounters()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L21)

- [mq3.renderer.tr_cmds_runtime.FrontCounters](Type-mq3-renderer-tr-cmds-runtime-frontcounters-977270382.md) — struct
<a id="function-function-mq3-renderer-tr-cmds-runtime-r-adddrawsurfcmd-function-r-adddrawsurfcmd-state-drawsurfs-numdrawsurfs-refdef-viewparms-src-mq3-renderer-tr-cmds-runtime-ml-1017614705"></a>
### R_AddDrawSurfCmd

```ml
function R_AddDrawSurfCmd(state, drawSurfs, numDrawSurfs, refdef, viewParms)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `drawSurfs` | `dynamic` | — |  |
| `numDrawSurfs` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |
| `viewParms` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L96)

<a id="function-function-mq3-renderer-tr-cmds-runtime-r-getcommandbuffer-function-r-getcommandbuffer-state-bytes-src-mq3-renderer-tr-cmds-runtime-ml-566043910"></a>
### R_GetCommandBuffer

```ml
function R_GetCommandBuffer(state, bytes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bytes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L95)

<a id="function-function-mq3-renderer-tr-cmds-runtime-r-initcommandbuffers-function-r-initcommandbuffers-state-src-mq3-renderer-tr-cmds-runtime-ml-159808589"></a>
### R_InitCommandBuffers

```ml
function R_InitCommandBuffers(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L50)

<a id="function-function-mq3-renderer-tr-cmds-runtime-r-issuerendercommands-function-r-issuerendercommands-state-runperformancecounters-src-mq3-renderer-tr-cmds-runtime-ml-586684389"></a>
### R_IssueRenderCommands

```ml
function R_IssueRenderCommands(state, runPerformanceCounters)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `runPerformanceCounters` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L70)

<a id="function-function-mq3-renderer-tr-cmds-runtime-r-performancecounters-function-r-performancecounters-state-src-mq3-renderer-tr-cmds-runtime-ml-1502401213"></a>
### R_PerformanceCounters

```ml
function R_PerformanceCounters(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L36)

<a id="function-function-mq3-renderer-tr-cmds-runtime-r-shutdowncommandbuffers-function-r-shutdowncommandbuffers-state-src-mq3-renderer-tr-cmds-runtime-ml-1695518441"></a>
### R_ShutdownCommandBuffers

```ml
function R_ShutdownCommandBuffers(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L60)

<a id="function-function-mq3-renderer-tr-cmds-runtime-r-syncrenderthread-function-r-syncrenderthread-state-src-mq3-renderer-tr-cmds-runtime-ml-1012056805"></a>
### R_SyncRenderThread

```ml
function R_SyncRenderThread(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L88)

<a id="function-function-mq3-renderer-tr-cmds-runtime-re-beginframe-function-re-beginframe-state-stereoframe-src-mq3-renderer-tr-cmds-runtime-ml-328991232"></a>
### RE_BeginFrame

```ml
function RE_BeginFrame(state, stereoFrame)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `stereoFrame` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L115)

<a id="function-function-mq3-renderer-tr-cmds-runtime-re-endframe-function-re-endframe-state-src-mq3-renderer-tr-cmds-runtime-ml-1236738521"></a>
### RE_EndFrame

```ml
function RE_EndFrame(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L132)

<a id="function-function-mq3-renderer-tr-cmds-runtime-re-setcolor-function-re-setcolor-state-rgba-src-mq3-renderer-tr-cmds-runtime-ml-1621964701"></a>
### RE_SetColor

```ml
function RE_SetColor(state, rgba)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rgba` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L100)

<a id="function-function-mq3-renderer-tr-cmds-runtime-re-stretchpic-function-re-stretchpic-state-x-y-w-h-s1-t1-s2-t2-shader-src-mq3-renderer-tr-cmds-runtime-ml-165668916"></a>
### RE_StretchPic

```ml
function RE_StretchPic(state, x, y, w, h, s1, t1, s2, t2, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `s1` | `dynamic` | — |  |
| `t1` | `dynamic` | — |  |
| `s2` | `dynamic` | — |  |
| `t2` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L101)

<a id="function-function-mq3-renderer-tr-cmds-runtime-services-function-services-src-mq3-renderer-tr-cmds-runtime-ml-1282015870"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L24)

- [mq3.renderer.tr_cmds_runtime.Services](Type-mq3-renderer-tr-cmds-runtime-services-2141671456.md) — struct
<a id="function-function-mq3-renderer-tr-cmds-runtime-settings-function-settings-src-mq3-renderer-tr-cmds-runtime-ml-217141690"></a>
### settings

```ml
function settings()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L23)

- [mq3.renderer.tr_cmds_runtime.Settings](Type-mq3-renderer-tr-cmds-runtime-settings-272563117.md) — struct
- [mq3.renderer.tr_cmds_runtime.State](Type-mq3-renderer-tr-cmds-runtime-state-1273923861.md) — struct
<a id="constant-constant-mq3-renderer-tr-cmds-runtime-stereo-center-const-stereo-center-0-src-mq3-renderer-tr-cmds-runtime-ml-2072287729"></a>
### STEREO_CENTER

```ml
const STEREO_CENTER = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L10)

<a id="constant-constant-mq3-renderer-tr-cmds-runtime-stereo-left-const-stereo-left-1-src-mq3-renderer-tr-cmds-runtime-ml-1160974322"></a>
### STEREO_LEFT

```ml
const STEREO_LEFT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L11)

<a id="constant-constant-mq3-renderer-tr-cmds-runtime-stereo-right-const-stereo-right-2-src-mq3-renderer-tr-cmds-runtime-ml-2078498975"></a>
### STEREO_RIGHT

```ml
const STEREO_RIGHT = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_cmds_runtime.ml#L12)
