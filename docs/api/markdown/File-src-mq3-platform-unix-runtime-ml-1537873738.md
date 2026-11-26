# `src/mq3/platform/unix_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.unix_runtime`](Package-mq3-platform-unix-runtime-966210248.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/jit_compat.ml` as `jit` → [src/mq3/vm/jit_compat.ml](File-src-mq3-vm-jit-compat-ml-1033093697.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-platform-unix-runtime-copydword-function-copydword-destination-destinationoffset-source-sourceoffset-count-src-mq3-platform-unix-runtime-ml-2035840091"></a>
### _copyDWord

```ml
function _copyDWord(destination, destinationOffset, source, sourceOffset, count)
```

Calls `mq3.platform.unix_runtime.Com_Memcpy` with `(destination,destinationOffset,source,sourceOffset,count*4)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Value forwarded as `destination` to `mq3.platform.unix_runtime.Com_Memcpy`. |
| `destinationOffset` | `dynamic` | — | Value forwarded as `destinationOffset` to `mq3.platform.unix_runtime.Com_Memcpy`. |
| `source` | `dynamic` | — | Value forwarded as `source` to `mq3.platform.unix_runtime.Com_Memcpy`. |
| `sourceOffset` | `dynamic` | — | Value forwarded as `sourceOffset` to `mq3.platform.unix_runtime.Com_Memcpy`. |
| `count` | `dynamic` | — | Input used in the result expression `Com_Memcpy(destination,destinationOffset,source,sourceOffset,count*4)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L74)

- [mq3.platform.unix_runtime.Address](Type-mq3-platform-unix-runtime-address-1805079642.md) — struct
<a id="function-function-mq3-platform-unix-runtime-com-memcpy-function-com-memcpy-destination-destinationoffset-source-sourceoffset-count-src-mq3-platform-unix-runtime-ml-1585396127"></a>
### Com_Memcpy

```ml
function Com_Memcpy(destination, destinationOffset, source, sourceOffset, count)
```

Returns `destination` from `mq3.platform.unix_runtime.Com_Memcpy`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Argument 1 supplied to `copyBytes`. |
| `destinationOffset` | `dynamic` | — | Argument 2 supplied to `copyBytes`. |
| `source` | `dynamic` | — | Argument 3 supplied to `copyBytes`. |
| `sourceOffset` | `dynamic` | — | Argument 4 supplied to `copyBytes`. |
| `count` | `dynamic` | — | Argument 5 supplied to `copyBytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L57)

<a id="function-function-mq3-platform-unix-runtime-com-memset-function-com-memset-destination-offset-value-count-src-mq3-platform-unix-runtime-ml-539120043"></a>
### Com_Memset

```ml
function Com_Memset(destination, offset, value, count)
```

Updates `destination[offset+index]` in `mq3.platform.unix_runtime.Com_Memset`; returns `destination`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Mutable record or buffer; this call updates `destination[offset+index]`. |
| `offset` | `dynamic` | — | Input used by `for index=0 to count-1 destination[offset+index]=value&255`. |
| `value` | `dynamic` | — | Input used by `for index=0 to count-1 destination[offset+index]=value&255`. |
| `count` | `dynamic` | — | Input used by `for index=0 to count-1 destination[offset+index]=value&255`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L63)

<a id="function-function-mq3-platform-unix-runtime-com-prefetch-function-com-prefetch-memory-count-src-mq3-platform-unix-runtime-ml-1161591606"></a>
### Com_Prefetch

```ml
function Com_Prefetch(memory, count)
```

Computes `count` for `mq3.platform.unix_runtime.Com_Prefetch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `memory` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `count` | `dynamic` | — | Input used in the result expression `count`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L67)

<a id="function-function-mq3-platform-unix-runtime-create-function-create-src-mq3-platform-unix-runtime-ml-91702896"></a>
### create

```ml
function create()
```

Constructs `mq3.platform.unix_runtime.State` with `glInitialized` = `false`, `inputInitialized` = `false`, `joystickInitialized` = `false`, `soundInitialized` = `false` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L49)

<a id="function-function-mq3-platform-unix-runtime-createnullcursor-function-createnullcursor-state-src-mq3-platform-unix-runtime-ml-1285158637"></a>
### CreateNullCursor

```ml
function CreateNullCursor(state)
```

Returns `1` for the `mq3.platform.unix_runtime.CreateNullCursor` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L123)

- [mq3.platform.unix_runtime.Event](Type-mq3-platform-unix-runtime-event-892773070.md) — struct
<a id="function-function-mq3-platform-unix-runtime-fastftol-function-fastftol-value-src-mq3-platform-unix-runtime-ml-380049725"></a>
### fastftol

```ml
function fastftol(value)
```

Calls `mq3.compat.numeric.trunc32` with `(value)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.trunc32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L535)

<a id="function-function-mq3-platform-unix-runtime-floating-point-exception-handler-function-floating-point-exception-handler-state-src-mq3-platform-unix-runtime-ml-1914943221"></a>
### floating_point_exception_handler

```ml
function floating_point_exception_handler(state)
```

Returns `void` for the `mq3.platform.unix_runtime.floating_point_exception_handler` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L318)

<a id="function-function-mq3-platform-unix-runtime-glimp-endframe-function-glimp-endframe-state-src-mq3-platform-unix-runtime-ml-606287117"></a>
### GLimp_EndFrame

```ml
function GLimp_EndFrame(state)
```

Computes `state.glInitialized` for `mq3.platform.unix_runtime.GLimp_EndFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.glInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L88)

<a id="function-function-mq3-platform-unix-runtime-glimp-frontendsleep-function-glimp-frontendsleep-state-src-mq3-platform-unix-runtime-ml-255469339"></a>
### GLimp_FrontEndSleep

```ml
function GLimp_FrontEndSleep(state)
```

Returns `void` for the `mq3.platform.unix_runtime.GLimp_FrontEndSleep` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L198)

<a id="function-function-mq3-platform-unix-runtime-glimp-init-function-glimp-init-state-src-mq3-platform-unix-runtime-ml-517852485"></a>
### GLimp_Init

```ml
function GLimp_Init(state)
```

Updates `state.glInitialized`, `state.active` in `mq3.platform.unix_runtime.GLimp_Init`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.glInitialized`, `state.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L82)

<a id="function-function-mq3-platform-unix-runtime-glimp-logcomment-function-glimp-logcomment-state-text-src-mq3-platform-unix-runtime-ml-48815778"></a>
### GLimp_LogComment

```ml
function GLimp_LogComment(state, text)
```

Updates `state.events` in `mq3.platform.unix_runtime.GLimp_LogComment`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.events`. |
| `text` | `dynamic` | — | Input tested by `state.logging`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L98)

<a id="function-function-mq3-platform-unix-runtime-glimp-lognewframe-function-glimp-lognewframe-state-src-mq3-platform-unix-runtime-ml-402563999"></a>
### GLimp_LogNewFrame

```ml
function GLimp_LogNewFrame(state)
```

Updates `state.events` in `mq3.platform.unix_runtime.GLimp_LogNewFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.events`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L217)

<a id="function-function-mq3-platform-unix-runtime-glimp-renderersleep-function-glimp-renderersleep-state-src-mq3-platform-unix-runtime-ml-1792512165"></a>
### GLimp_RendererSleep

```ml
function GLimp_RendererSleep(state)
```

Returns `void` for the `mq3.platform.unix_runtime.GLimp_RendererSleep` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L195)

<a id="function-function-mq3-platform-unix-runtime-glimp-renderthreadwrapper-function-glimp-renderthreadwrapper-state-callback-context-src-mq3-platform-unix-runtime-ml-1592679715"></a>
### GLimp_RenderThreadWrapper

```ml
function GLimp_RenderThreadWrapper(state, callback, context)
```

Returns `void` from `mq3.platform.unix_runtime.GLimp_RenderThreadWrapper`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `callback` | `dynamic` | — | Input tested by `callback!=void`. |
| `context` | `dynamic` | — | Argument 1 supplied to `callback`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L192)

<a id="function-function-mq3-platform-unix-runtime-glimp-setgamma-function-glimp-setgamma-state-red-green-blue-src-mq3-platform-unix-runtime-ml-155174035"></a>
### GLimp_SetGamma

```ml
function GLimp_SetGamma(state, red, green, blue)
```

Updates `state.gamma` in `mq3.platform.unix_runtime.GLimp_SetGamma`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.gamma`. |
| `red` | `dynamic` | — | Input used by `state.gamma=[red,green,blue]`. |
| `green` | `dynamic` | — | Input used by `state.gamma=[red,green,blue]`. |
| `blue` | `dynamic` | — | Input used by `state.gamma=[red,green,blue]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L94)

<a id="function-function-mq3-platform-unix-runtime-glimp-shutdown-function-glimp-shutdown-state-src-mq3-platform-unix-runtime-ml-686621373"></a>
### GLimp_Shutdown

```ml
function GLimp_Shutdown(state)
```

Updates `state.glInitialized`, `state.active` in `mq3.platform.unix_runtime.GLimp_Shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.glInitialized`, `state.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L85)

<a id="function-function-mq3-platform-unix-runtime-glimp-spawnrenderthread-function-glimp-spawnrenderthread-state-callback-src-mq3-platform-unix-runtime-ml-468802528"></a>
### GLimp_SpawnRenderThread

```ml
function GLimp_SpawnRenderThread(state, callback)
```

Computes `callback!=void` for `mq3.platform.unix_runtime.GLimp_SpawnRenderThread`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `callback` | `dynamic` | — | Input used in the result expression `callback!=void`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L187)

<a id="function-function-mq3-platform-unix-runtime-glimp-wakerenderer-function-glimp-wakerenderer-state-data-src-mq3-platform-unix-runtime-ml-1181285833"></a>
### GLimp_WakeRenderer

```ml
function GLimp_WakeRenderer(state, data)
```

Computes `data` for `mq3.platform.unix_runtime.GLimp_WakeRenderer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `data` | `dynamic` | — | Input used in the result expression `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L202)

<a id="function-function-mq3-platform-unix-runtime-glw-initextensions-function-glw-initextensions-state-text-src-mq3-platform-unix-runtime-ml-509615550"></a>
### GLW_InitExtensions

```ml
function GLW_InitExtensions(state, text)
```

Updates `state.events` in `mq3.platform.unix_runtime.GLW_InitExtensions`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.events`. |
| `text` | `dynamic` | — | Input used by `state.events=state.events+[["extensions",text]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L117)

<a id="function-function-mq3-platform-unix-runtime-glw-initgamma-function-glw-initgamma-state-src-mq3-platform-unix-runtime-ml-155885585"></a>
### GLW_InitGamma

```ml
function GLW_InitGamma(state)
```

Updates `state.gamma` in `mq3.platform.unix_runtime.GLW_InitGamma`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.gamma`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L120)

<a id="function-function-mq3-platform-unix-runtime-glw-loadopengl-function-glw-loadopengl-state-driver-src-mq3-platform-unix-runtime-ml-348420155"></a>
### GLW_LoadOpenGL

```ml
function GLW_LoadOpenGL(state, driver)
```

Calls `mq3.platform.unix_runtime.GLW_StartDriverAndSetMode` with `(state,driver,3,false)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.platform.unix_runtime.GLW_StartDriverAndSetMode`. |
| `driver` | `dynamic` | — | Value forwarded as `driver` to `mq3.platform.unix_runtime.GLW_StartDriverAndSetMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L113)

<a id="function-function-mq3-platform-unix-runtime-glw-setmode-function-glw-setmode-state-mode-fullscreen-src-mq3-platform-unix-runtime-ml-206462139"></a>
### GLW_SetMode

```ml
function GLW_SetMode(state, mode, fullscreen)
```

Updates `state.events` in `mq3.platform.unix_runtime.GLW_SetMode`; returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.events`. |
| `mode` | `dynamic` | — | Input used by `state.events=state.events+[["mode",mode,fullscreen]]`. |
| `fullscreen` | `dynamic` | — | Input used by `state.events=state.events+[["mode",mode,fullscreen]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L103)

<a id="function-function-mq3-platform-unix-runtime-glw-startdriverandsetmode-function-glw-startdriverandsetmode-state-driver-mode-fullscreen-src-mq3-platform-unix-runtime-ml-1530422631"></a>
### GLW_StartDriverAndSetMode

```ml
function GLW_StartDriverAndSetMode(state, driver, mode, fullscreen)
```

Returns `true` from `mq3.platform.unix_runtime.GLW_StartDriverAndSetMode`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.platform.unix_runtime.GLimp_Init`. |
| `driver` | `dynamic` | — | Input tested by `driver==""`. |
| `mode` | `dynamic` | — | Value forwarded as `mode` to `mq3.platform.unix_runtime.GLW_SetMode`. |
| `fullscreen` | `dynamic` | — | Value forwarded as `fullscreen` to `mq3.platform.unix_runtime.GLW_SetMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L109)

<a id="function-function-mq3-platform-unix-runtime-handleevents-function-handleevents-state-src-mq3-platform-unix-runtime-ml-632731741"></a>
### HandleEvents

```ml
function HandleEvents(state)
```

Calls `len` with `(state.events)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.events`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L126)

<a id="function-function-mq3-platform-unix-runtime-hist-add-function-hist-add-state-text-src-mq3-platform-unix-runtime-ml-893481842"></a>
### Hist_Add

```ml
function Hist_Add(state, text)
```

Updates `state.history`, `state.historyCursor` in `mq3.platform.unix_runtime.Hist_Add`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.history`, `state.historyCursor`. |
| `text` | `dynamic` | — | Input tested by `text==""`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L259)

<a id="function-function-mq3-platform-unix-runtime-hist-next-function-hist-next-state-src-mq3-platform-unix-runtime-ml-325151417"></a>
### Hist_Next

```ml
function Hist_Next(state)
```

Updates `state.historyCursor` in `mq3.platform.unix_runtime.Hist_Next`; returns `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.historyCursor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L265)

<a id="function-function-mq3-platform-unix-runtime-hist-prev-function-hist-prev-state-src-mq3-platform-unix-runtime-ml-1288882765"></a>
### Hist_Prev

```ml
function Hist_Prev(state)
```

Updates `state.historyCursor` in `mq3.platform.unix_runtime.Hist_Prev`; returns `state.history[state.historyCursor]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.historyCursor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L262)

<a id="function-function-mq3-platform-unix-runtime-in-activate-function-in-activate-state-active-src-mq3-platform-unix-runtime-ml-1743189089"></a>
### IN_Activate

```ml
function IN_Activate(state, active)
```

Updates `state.active` in `mq3.platform.unix_runtime.IN_Activate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.active`. |
| `active` | `dynamic` | — | Value assigned to `state.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L136)

<a id="function-function-mq3-platform-unix-runtime-in-activatemouse-function-in-activatemouse-state-src-mq3-platform-unix-runtime-ml-2142808681"></a>
### IN_ActivateMouse

```ml
function IN_ActivateMouse(state)
```

Updates `state.active` in `mq3.platform.unix_runtime.IN_ActivateMouse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L139)

<a id="function-function-mq3-platform-unix-runtime-in-deactivatemouse-function-in-deactivatemouse-state-src-mq3-platform-unix-runtime-ml-1050294281"></a>
### IN_DeactivateMouse

```ml
function IN_DeactivateMouse(state)
```

Updates `state.active` in `mq3.platform.unix_runtime.IN_DeactivateMouse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L142)

<a id="function-function-mq3-platform-unix-runtime-in-frame-function-in-frame-state-src-mq3-platform-unix-runtime-ml-1389851993"></a>
### IN_Frame

```ml
function IN_Frame(state)
```

Computes `state.inputInitialized` for `mq3.platform.unix_runtime.IN_Frame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.inputInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L151)

<a id="function-function-mq3-platform-unix-runtime-in-init-function-in-init-state-src-mq3-platform-unix-runtime-ml-810330405"></a>
### IN_Init

```ml
function IN_Init(state)
```

Updates `state.inputInitialized` in `mq3.platform.unix_runtime.IN_Init`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.inputInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L145)

<a id="function-function-mq3-platform-unix-runtime-in-joymove-function-in-joymove-state-axes-src-mq3-platform-unix-runtime-ml-1320104488"></a>
### IN_JoyMove

```ml
function IN_JoyMove(state, axes)
```

Updates `state.events` in `mq3.platform.unix_runtime.IN_JoyMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.events`. |
| `axes` | `dynamic` | — | Input tested by `state.joystickInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L158)

<a id="function-function-mq3-platform-unix-runtime-in-shutdown-function-in-shutdown-state-src-mq3-platform-unix-runtime-ml-43949733"></a>
### IN_Shutdown

```ml
function IN_Shutdown(state)
```

Updates `state.inputInitialized` in `mq3.platform.unix_runtime.IN_Shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.inputInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L148)

<a id="function-function-mq3-platform-unix-runtime-in-startupjoystick-function-in-startupjoystick-state-src-mq3-platform-unix-runtime-ml-1915396041"></a>
### IN_StartupJoystick

```ml
function IN_StartupJoystick(state)
```

Updates `state.joystickInitialized` in `mq3.platform.unix_runtime.IN_StartupJoystick`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.joystickInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L154)

<a id="function-function-mq3-platform-unix-runtime-initsig-function-initsig-state-src-mq3-platform-unix-runtime-ml-1605948807"></a>
### InitSig

```ml
function InitSig(state)
```

Updates `state.signals` in `mq3.platform.unix_runtime.InitSig`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.signals`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L230)

<a id="function-function-mq3-platform-unix-runtime-install-grabs-function-install-grabs-state-src-mq3-platform-unix-runtime-ml-2045148963"></a>
### install_grabs

```ml
function install_grabs(state)
```

Updates `state.active` in `mq3.platform.unix_runtime.install_grabs`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L129)

<a id="function-function-mq3-platform-unix-runtime-kbd-close-function-kbd-close-state-src-mq3-platform-unix-runtime-ml-531686965"></a>
### KBD_Close

```ml
function KBD_Close(state)
```

Calls `mq3.platform.unix_runtime.IN_Shutdown` with `(state)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.platform.unix_runtime.IN_Shutdown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L164)

<a id="function-function-mq3-platform-unix-runtime-kbd-init-function-kbd-init-state-src-mq3-platform-unix-runtime-ml-516740053"></a>
### KBD_Init

```ml
function KBD_Init(state)
```

Calls `mq3.platform.unix_runtime.IN_Init` with `(state)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.platform.unix_runtime.IN_Init`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L161)

<a id="function-function-mq3-platform-unix-runtime-linuxcommonsymbols-function-linuxcommonsymbols-src-mq3-platform-unix-runtime-ml-382501660"></a>
### linuxCommonSymbols

```ml
function linuxCommonSymbols()
```

Lists the 4 declared names for `mq3.platform.unix_runtime.linuxCommonSymbols`, including `Com_Memcpy`, `Com_Memset`, `Com_Prefetch`, `_copyDWord`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L11)

<a id="function-function-mq3-platform-unix-runtime-linuxglimpsymbols-function-linuxglimpsymbols-src-mq3-platform-unix-runtime-ml-951033228"></a>
### linuxGlimpSymbols

```ml
function linuxGlimpSymbols()
```

Lists the 35 declared names for `mq3.platform.unix_runtime.linuxGlimpSymbols`, including `CreateNullCursor`, `GLW_InitExtensions`, `GLW_InitGamma`, `GLW_LoadOpenGL`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L13)

<a id="function-function-mq3-platform-unix-runtime-linuxjoysticksymbols-function-linuxjoysticksymbols-src-mq3-platform-unix-runtime-ml-1394088372"></a>
### linuxJoystickSymbols

```ml
function linuxJoystickSymbols()
```

Lists the 2 declared names for `mq3.platform.unix_runtime.linuxJoystickSymbols`, including `IN_JoyMove`, `IN_StartupJoystick`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L15)

<a id="function-function-mq3-platform-unix-runtime-linuxlocalsymbols-function-linuxlocalsymbols-src-mq3-platform-unix-runtime-ml-1979442028"></a>
### linuxLocalSymbols

```ml
function linuxLocalSymbols()
```

Returns `[]` for the `mq3.platform.unix_runtime.linuxLocalSymbols` compatibility entry point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L17)

<a id="function-function-mq3-platform-unix-runtime-linuxqglsymbols-function-linuxqglsymbols-src-mq3-platform-unix-runtime-ml-1684487250"></a>
### linuxQglSymbols

```ml
function linuxQglSymbols()
```

Lists the 341 declared names for `mq3.platform.unix_runtime.linuxQglSymbols`, including `GLimp_LogNewFrame`, `QGL_EnableLogging`, `QGL_Init`, `QGL_Shutdown`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L19)

<a id="function-function-mq3-platform-unix-runtime-linuxsignalssymbols-function-linuxsignalssymbols-src-mq3-platform-unix-runtime-ml-1748482144"></a>
### linuxSignalsSymbols

```ml
function linuxSignalsSymbols()
```

Lists the 2 declared names for `mq3.platform.unix_runtime.linuxSignalsSymbols`, including `InitSig`, `signal_handler`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L21)

<a id="function-function-mq3-platform-unix-runtime-linuxsoundsymbols-function-linuxsoundsymbols-src-mq3-platform-unix-runtime-ml-1914306244"></a>
### linuxSoundSymbols

```ml
function linuxSoundSymbols()
```

Lists the 6 declared names for `mq3.platform.unix_runtime.linuxSoundSymbols`, including `SNDDMA_BeginPainting`, `SNDDMA_GetDMAPos`, `SNDDMA_Init`, `SNDDMA_Shutdown`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L23)

<a id="constant-constant-mq3-platform-unix-runtime-na-bad-const-na-bad-1-src-mq3-platform-unix-runtime-ml-931683240"></a>
### NA_BAD

```ml
const NA_BAD = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L44)

<a id="constant-constant-mq3-platform-unix-runtime-na-ip-const-na-ip-4-src-mq3-platform-unix-runtime-ml-62011145"></a>
### NA_IP

```ml
const NA_IP = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L46)

<a id="constant-constant-mq3-platform-unix-runtime-na-loopback-const-na-loopback-2-src-mq3-platform-unix-runtime-ml-299013299"></a>
### NA_LOOPBACK

```ml
const NA_LOOPBACK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L45)

<a id="function-function-mq3-platform-unix-runtime-net-baseadrtostring-function-net-baseadrtostring-address-src-mq3-platform-unix-runtime-ml-1029440956"></a>
### NET_BaseAdrToString

```ml
function NET_BaseAdrToString(address)
```

Computes `address.host` for `mq3.platform.unix_runtime.NET_BaseAdrToString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Record providing `address.host`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L427)

<a id="function-function-mq3-platform-unix-runtime-net-errorstring-function-net-errorstring-code-src-mq3-platform-unix-runtime-ml-1093611855"></a>
### NET_ErrorString

```ml
function NET_ErrorString(code)
```

Computes `"network error "+str(code)` for `mq3.platform.unix_runtime.NET_ErrorString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — | Input used in the result expression `"network error "+str(code)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L430)

<a id="function-function-mq3-platform-unix-runtime-net-getlocaladdress-function-net-getlocaladdress-state-src-mq3-platform-unix-runtime-ml-1312316403"></a>
### NET_GetLocalAddress

```ml
function NET_GetLocalAddress(state)
```

Constructs `mq3.platform.unix_runtime.Address` with `type` = `NA_LOOPBACK`, `host` = `"localhost"`, `port` = `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L449)

<a id="function-function-mq3-platform-unix-runtime-net-init-function-net-init-state-src-mq3-platform-unix-runtime-ml-1504912197"></a>
### NET_Init

```ml
function NET_Init(state)
```

Returns `true` for the `mq3.platform.unix_runtime.NET_Init` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L437)

<a id="function-function-mq3-platform-unix-runtime-net-ipsocket-function-net-ipsocket-interfacename-port-src-mq3-platform-unix-runtime-ml-184691627"></a>
### NET_IPSocket

```ml
function NET_IPSocket(interfaceName, port)
```

Returns `1` from `mq3.platform.unix_runtime.NET_IPSocket`; earlier branches return `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `interfaceName` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `port` | `dynamic` | — | Input tested by `port<0 or port>65535`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L434)

<a id="function-function-mq3-platform-unix-runtime-net-openip-function-net-openip-state-src-mq3-platform-unix-runtime-ml-526294889"></a>
### NET_OpenIP

```ml
function NET_OpenIP(state)
```

Returns `true` for the `mq3.platform.unix_runtime.NET_OpenIP` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L440)

<a id="function-function-mq3-platform-unix-runtime-net-shutdown-function-net-shutdown-state-src-mq3-platform-unix-runtime-ml-1585380493"></a>
### NET_Shutdown

```ml
function NET_Shutdown(state)
```

Updates `state.packets` in `mq3.platform.unix_runtime.NET_Shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.packets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L443)

<a id="function-function-mq3-platform-unix-runtime-net-sleep-function-net-sleep-msec-src-mq3-platform-unix-runtime-ml-728380310"></a>
### NET_Sleep

```ml
function NET_Sleep(msec)
```

Returns `void` for the `mq3.platform.unix_runtime.NET_Sleep` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msec` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L446)

<a id="function-function-mq3-platform-unix-runtime-netadrtosockadr-function-netadrtosockadr-address-src-mq3-platform-unix-runtime-ml-260928788"></a>
### NetadrToSockadr

```ml
function NetadrToSockadr(address)
```

Computes `address` for `mq3.platform.unix_runtime.NetadrToSockadr`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Input used in the result expression `address`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L421)

<a id="function-function-mq3-platform-unix-runtime-q-stristr-function-q-stristr-text-needle-src-mq3-platform-unix-runtime-ml-890161702"></a>
### Q_stristr

```ml
function Q_stristr(text, needle)
```

Calls `std.string.indexOf` with `(strings.toLowerAscii(text),strings.toLowerAscii(needle),0)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Argument 1 supplied to `std.string.toLowerAscii`. |
| `needle` | `dynamic` | — | Argument 1 supplied to `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L79)

<a id="function-function-mq3-platform-unix-runtime-qasmsymbols-function-qasmsymbols-src-mq3-platform-unix-runtime-ml-1514513646"></a>
### qasmSymbols

```ml
function qasmSymbols()
```

Returns `[]` for the `mq3.platform.unix_runtime.qasmSymbols` compatibility entry point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L25)

<a id="function-function-mq3-platform-unix-runtime-qgl-enablelogging-function-qgl-enablelogging-state-enabled-src-mq3-platform-unix-runtime-ml-21279100"></a>
### QGL_EnableLogging

```ml
function QGL_EnableLogging(state, enabled)
```

Updates `state.logging` in `mq3.platform.unix_runtime.QGL_EnableLogging`; returns `enabled`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.logging`. |
| `enabled` | `dynamic` | — | Value assigned to `state.logging`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L214)

<a id="function-function-mq3-platform-unix-runtime-qgl-init-function-qgl-init-state-driver-src-mq3-platform-unix-runtime-ml-1841211359"></a>
### QGL_Init

```ml
function QGL_Init(state, driver)
```

Updates `state.glInitialized`, `state.events` in `mq3.platform.unix_runtime.QGL_Init`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.glInitialized`, `state.events`. |
| `driver` | `dynamic` | — | Input tested by `driver==""`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L207)

<a id="function-function-mq3-platform-unix-runtime-qgl-shutdown-function-qgl-shutdown-state-src-mq3-platform-unix-runtime-ml-2122809329"></a>
### QGL_Shutdown

```ml
function QGL_Shutdown(state)
```

Updates `state.glInitialized`, `state.logging` in `mq3.platform.unix_runtime.QGL_Shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.glInitialized`, `state.logging`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L210)

<a id="function-function-mq3-platform-unix-runtime-qgldispatch-function-qgldispatch-state-name-arguments-src-mq3-platform-unix-runtime-ml-2094617498"></a>
### qglDispatch

```ml
function qglDispatch(state, name, arguments)
```

Updates `state.events` in `mq3.platform.unix_runtime.qglDispatch`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.events`. |
| `name` | `dynamic` | — | Input used by `state.events=state.events+[[name,arguments]]`. |
| `arguments` | `dynamic` | — | Input used by `state.events=state.events+[[name,arguments]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L222)

<a id="function-function-mq3-platform-unix-runtime-qwglgetprocaddress-function-qwglgetprocaddress-state-name-src-mq3-platform-unix-runtime-ml-1843470826"></a>
### qwglGetProcAddress

```ml
function qwglGetProcAddress(state, name)
```

Returns `1` from `mq3.platform.unix_runtime.qwglGetProcAddress`; earlier branches return `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.glInitialized`. |
| `name` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L226)

<a id="function-function-mq3-platform-unix-runtime-qxerrorhandler-function-qxerrorhandler-state-code-src-mq3-platform-unix-runtime-ml-32356848"></a>
### qXErrorHandler

```ml
function qXErrorHandler(state, code)
```

Updates `state.warnings` in `mq3.platform.unix_runtime.qXErrorHandler`; returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.warnings`. |
| `code` | `dynamic` | — | Input used by `state.warnings=state.warnings+["X11 error "+str(code)]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L183)

<a id="function-function-mq3-platform-unix-runtime-repeated-press-function-repeated-press-state-key-time-src-mq3-platform-unix-runtime-ml-1372004869"></a>
### repeated_press

```ml
function repeated_press(state, key, time)
```

Returns `false` for the `mq3.platform.unix_runtime.repeated_press` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `key` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `time` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L179)

<a id="function-function-mq3-platform-unix-runtime-signal-handler-function-signal-handler-state-signal-src-mq3-platform-unix-runtime-ml-1486033045"></a>
### signal_handler

```ml
function signal_handler(state, signal)
```

Updates `state.errors` in `mq3.platform.unix_runtime.signal_handler`; returns `error(7981,"Unix signal "+str(signal))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.errors`. |
| `signal` | `dynamic` | — | Input used by `state.errors=state.errors+["signal "+str(signal)]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L234)

<a id="function-function-mq3-platform-unix-runtime-snd-memset-function-snd-memset-destination-value-count-src-mq3-platform-unix-runtime-ml-33134564"></a>
### Snd_Memset

```ml
function Snd_Memset(destination, value, count)
```

Calls `mq3.platform.unix_runtime.Com_Memset` with `(destination,0,value,count)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Value forwarded as `destination` to `mq3.platform.unix_runtime.Com_Memset`. |
| `value` | `dynamic` | — | Value forwarded as `value` to `mq3.platform.unix_runtime.Com_Memset`. |
| `count` | `dynamic` | — | Value forwarded as `count` to `mq3.platform.unix_runtime.Com_Memset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L254)

<a id="function-function-mq3-platform-unix-runtime-snddma-beginpainting-function-snddma-beginpainting-state-src-mq3-platform-unix-runtime-ml-1195256945"></a>
### SNDDMA_BeginPainting

```ml
function SNDDMA_BeginPainting(state)
```

Computes `state.soundInitialized` for `mq3.platform.unix_runtime.SNDDMA_BeginPainting`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.soundInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L243)

<a id="function-function-mq3-platform-unix-runtime-snddma-getdmapos-function-snddma-getdmapos-state-src-mq3-platform-unix-runtime-ml-1019745913"></a>
### SNDDMA_GetDMAPos

```ml
function SNDDMA_GetDMAPos(state)
```

Returns `0` for the `mq3.platform.unix_runtime.SNDDMA_GetDMAPos` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L240)

<a id="function-function-mq3-platform-unix-runtime-snddma-init-function-snddma-init-state-src-mq3-platform-unix-runtime-ml-2049090325"></a>
### SNDDMA_Init

```ml
function SNDDMA_Init(state)
```

Updates `state.soundInitialized` in `mq3.platform.unix_runtime.SNDDMA_Init`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.soundInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L237)

<a id="function-function-mq3-platform-unix-runtime-snddma-shutdown-function-snddma-shutdown-state-src-mq3-platform-unix-runtime-ml-860364941"></a>
### SNDDMA_Shutdown

```ml
function SNDDMA_Shutdown(state)
```

Updates `state.soundInitialized` in `mq3.platform.unix_runtime.SNDDMA_Shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.soundInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L249)

<a id="function-function-mq3-platform-unix-runtime-snddma-submit-function-snddma-submit-state-src-mq3-platform-unix-runtime-ml-1185856777"></a>
### SNDDMA_Submit

```ml
function SNDDMA_Submit(state)
```

Computes `state.soundInitialized` for `mq3.platform.unix_runtime.SNDDMA_Submit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.soundInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L246)

<a id="function-function-mq3-platform-unix-runtime-sockadrtonetadr-function-sockadrtonetadr-address-src-mq3-platform-unix-runtime-ml-1346841420"></a>
### SockadrToNetadr

```ml
function SockadrToNetadr(address)
```

Computes `address` for `mq3.platform.unix_runtime.SockadrToNetadr`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Input used in the result expression `address`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L424)

- [mq3.platform.unix_runtime.State](Type-mq3-platform-unix-runtime-state-1024097335.md) — struct
<a id="function-function-mq3-platform-unix-runtime-strlwr-function-strlwr-value-src-mq3-platform-unix-runtime-ml-1665452013"></a>
### strlwr

```ml
function strlwr(value)
```

Calls `std.string.toLowerAscii` with `(value)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L538)

<a id="function-function-mq3-platform-unix-runtime-sys-appactivate-function-sys-appactivate-state-src-mq3-platform-unix-runtime-ml-2118922409"></a>
### Sys_AppActivate

```ml
function Sys_AppActivate(state)
```

Updates `state.active` in `mq3.platform.unix_runtime.Sys_AppActivate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L330)

<a id="function-function-mq3-platform-unix-runtime-sys-beginprofiling-function-sys-beginprofiling-state-src-mq3-platform-unix-runtime-ml-1912013833"></a>
### Sys_BeginProfiling

```ml
function Sys_BeginProfiling(state)
```

Returns `void` for the `mq3.platform.unix_runtime.Sys_BeginProfiling` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L336)

<a id="function-function-mq3-platform-unix-runtime-sys-beginstreamedfile-function-sys-beginstreamedfile-state-file-readahead-src-mq3-platform-unix-runtime-ml-1427397644"></a>
### Sys_BeginStreamedFile

```ml
function Sys_BeginStreamedFile(state, file, readAhead)
```

Returns `void` for the `mq3.platform.unix_runtime.Sys_BeginStreamedFile` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `file` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `readAhead` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L370)

<a id="function-function-mq3-platform-unix-runtime-sys-checkcd-function-sys-checkcd-state-src-mq3-platform-unix-runtime-ml-1677975583"></a>
### Sys_CheckCD

```ml
function Sys_CheckCD(state)
```

Returns `true` for the `mq3.platform.unix_runtime.Sys_CheckCD` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L327)

<a id="function-function-mq3-platform-unix-runtime-sys-configurefpu-function-sys-configurefpu-state-src-mq3-platform-unix-runtime-ml-1627328537"></a>
### Sys_ConfigureFPU

```ml
function Sys_ConfigureFPU(state)
```

Returns `true` for the `mq3.platform.unix_runtime.Sys_ConfigureFPU` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L315)

<a id="function-function-mq3-platform-unix-runtime-sys-consoleinput-function-sys-consoleinput-state-src-mq3-platform-unix-runtime-ml-1635696093"></a>
### Sys_ConsoleInput

```ml
function Sys_ConsoleInput(state)
```

Returns `void` for the `mq3.platform.unix_runtime.Sys_ConsoleInput` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L286)

<a id="function-function-mq3-platform-unix-runtime-sys-consoleinputinit-function-sys-consoleinputinit-state-src-mq3-platform-unix-runtime-ml-287615769"></a>
### Sys_ConsoleInputInit

```ml
function Sys_ConsoleInputInit(state)
```

Returns `true` for the `mq3.platform.unix_runtime.Sys_ConsoleInputInit` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L280)

<a id="function-function-mq3-platform-unix-runtime-sys-consoleinputshutdown-function-sys-consoleinputshutdown-state-src-mq3-platform-unix-runtime-ml-580973321"></a>
### Sys_ConsoleInputShutdown

```ml
function Sys_ConsoleInputShutdown(state)
```

Returns `void` for the `mq3.platform.unix_runtime.Sys_ConsoleInputShutdown` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L283)

<a id="function-function-mq3-platform-unix-runtime-sys-cwd-function-sys-cwd-state-src-mq3-platform-unix-runtime-ml-1498865641"></a>
### Sys_Cwd

```ml
function Sys_Cwd(state)
```

Computes `state.paths[0]` for `mq3.platform.unix_runtime.Sys_Cwd`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.paths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L468)

<a id="function-function-mq3-platform-unix-runtime-sys-defaultcdpath-function-sys-defaultcdpath-state-src-mq3-platform-unix-runtime-ml-893174315"></a>
### Sys_DefaultCDPath

```ml
function Sys_DefaultCDPath(state)
```

Computes `state.paths[1]` for `mq3.platform.unix_runtime.Sys_DefaultCDPath`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.paths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L471)

<a id="function-function-mq3-platform-unix-runtime-sys-defaulthomepath-function-sys-defaulthomepath-state-src-mq3-platform-unix-runtime-ml-1447202287"></a>
### Sys_DefaultHomePath

```ml
function Sys_DefaultHomePath(state)
```

Computes `state.paths[2]` for `mq3.platform.unix_runtime.Sys_DefaultHomePath`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.paths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L474)

<a id="function-function-mq3-platform-unix-runtime-sys-defaultinstallpath-function-sys-defaultinstallpath-state-src-mq3-platform-unix-runtime-ml-1851126449"></a>
### Sys_DefaultInstallPath

```ml
function Sys_DefaultInstallPath(state)
```

Computes `state.paths[3]` for `mq3.platform.unix_runtime.Sys_DefaultInstallPath`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.paths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L477)

<a id="function-function-mq3-platform-unix-runtime-sys-endstreamedfile-function-sys-endstreamedfile-state-file-src-mq3-platform-unix-runtime-ml-161778075"></a>
### Sys_EndStreamedFile

```ml
function Sys_EndStreamedFile(state, file)
```

Returns `void` for the `mq3.platform.unix_runtime.Sys_EndStreamedFile` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `file` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L374)

<a id="function-function-mq3-platform-unix-runtime-sys-error-function-sys-error-state-text-src-mq3-platform-unix-runtime-ml-1912329106"></a>
### Sys_Error

```ml
function Sys_Error(state, text)
```

Updates `state.errors` in `mq3.platform.unix_runtime.Sys_Error`; returns `error(7981,text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.errors`. |
| `text` | `dynamic` | — | Argument 2 supplied to `error`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L302)

<a id="function-function-mq3-platform-unix-runtime-sys-exit-function-sys-exit-state-code-src-mq3-platform-unix-runtime-ml-933762844"></a>
### Sys_Exit

```ml
function Sys_Exit(state, code)
```

Updates `state.quitRequested` in `mq3.platform.unix_runtime.Sys_Exit`; returns `code`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.quitRequested`. |
| `code` | `dynamic` | — | Input used in the result expression `code`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L309)

<a id="function-function-mq3-platform-unix-runtime-sys-filetime-function-sys-filetime-state-path-src-mq3-platform-unix-runtime-ml-130090374"></a>
### Sys_FileTime

```ml
function Sys_FileTime(state, path)
```

Returns `-1` for the `mq3.platform.unix_runtime.Sys_FileTime` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `path` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L365)

<a id="function-function-mq3-platform-unix-runtime-sys-freefilelist-function-sys-freefilelist-state-list-src-mq3-platform-unix-runtime-ml-1510683885"></a>
### Sys_FreeFileList

```ml
function Sys_FreeFileList(state, list)
```

Returns `void` for the `mq3.platform.unix_runtime.Sys_FreeFileList` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `list` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L521)

<a id="function-function-mq3-platform-unix-runtime-sys-functionchecksum-function-sys-functionchecksum-value-src-mq3-platform-unix-runtime-ml-1296410049"></a>
### Sys_FunctionCheckSum

```ml
function Sys_FunctionCheckSum(value)
```

Computes `value` for `mq3.platform.unix_runtime.Sys_FunctionCheckSum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L361)

<a id="function-function-mq3-platform-unix-runtime-sys-functioncmp-function-sys-functioncmp-left-right-src-mq3-platform-unix-runtime-ml-1274372533"></a>
### Sys_FunctionCmp

```ml
function Sys_FunctionCmp(left, right)
```

Computes `left==right` for `mq3.platform.unix_runtime.Sys_FunctionCmp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Input used in the result expression `left==right`. |
| `right` | `dynamic` | — | Input used in the result expression `left==right`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L358)

<a id="function-function-mq3-platform-unix-runtime-sys-getclipboarddata-function-sys-getclipboarddata-state-src-mq3-platform-unix-runtime-ml-1870063809"></a>
### Sys_GetClipboardData

```ml
function Sys_GetClipboardData(state)
```

Returns `void` for the `mq3.platform.unix_runtime.Sys_GetClipboardData` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L346)

<a id="function-function-mq3-platform-unix-runtime-sys-getcurrentuser-function-sys-getcurrentuser-state-src-mq3-platform-unix-runtime-ml-631326641"></a>
### Sys_GetCurrentUser

```ml
function Sys_GetCurrentUser(state)
```

Computes `state.user` for `mq3.platform.unix_runtime.Sys_GetCurrentUser`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.user`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L492)

<a id="function-function-mq3-platform-unix-runtime-sys-getevent-function-sys-getevent-state-src-mq3-platform-unix-runtime-ml-582919877"></a>
### Sys_GetEvent

```ml
function Sys_GetEvent(state)
```

Updates `state.systemEvents` in `mq3.platform.unix_runtime.Sys_GetEvent`; returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.systemEvents`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L406)

<a id="function-function-mq3-platform-unix-runtime-sys-getpacket-function-sys-getpacket-state-src-mq3-platform-unix-runtime-ml-2058464149"></a>
### Sys_GetPacket

```ml
function Sys_GetPacket(state)
```

Returns `void` for the `mq3.platform.unix_runtime.Sys_GetPacket` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L461)

<a id="function-function-mq3-platform-unix-runtime-sys-getprocessorid-function-sys-getprocessorid-state-src-mq3-platform-unix-runtime-ml-1447839965"></a>
### Sys_GetProcessorId

```ml
function Sys_GetProcessorId(state)
```

Returns `0` for the `mq3.platform.unix_runtime.Sys_GetProcessorId` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L529)

<a id="function-function-mq3-platform-unix-runtime-sys-in-restart-f-function-sys-in-restart-f-state-src-mq3-platform-unix-runtime-ml-154008417"></a>
### Sys_In_Restart_f

```ml
function Sys_In_Restart_f(state)
```

Updates `state.inputInitialized` in `mq3.platform.unix_runtime.Sys_In_Restart_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.inputInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L333)

<a id="function-function-mq3-platform-unix-runtime-sys-init-function-sys-init-state-src-mq3-platform-unix-runtime-ml-1774883393"></a>
### Sys_Init

```ml
function Sys_Init(state)
```

Computes `state` for `mq3.platform.unix_runtime.Sys_Init`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Input used in the result expression `state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L312)

<a id="function-function-mq3-platform-unix-runtime-sys-initstreamthread-function-sys-initstreamthread-state-src-mq3-platform-unix-runtime-ml-740446701"></a>
### Sys_InitStreamThread

```ml
function Sys_InitStreamThread(state)
```

Returns `true` for the `mq3.platform.unix_runtime.Sys_InitStreamThread` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L390)

<a id="function-function-mq3-platform-unix-runtime-sys-islanaddress-function-sys-islanaddress-address-src-mq3-platform-unix-runtime-ml-701267892"></a>
### Sys_IsLANAddress

```ml
function Sys_IsLANAddress(address)
```

Computes `address!=void and (address.type==NA_LOOPBACK or strings.indexOf(address.host,"192.168.",0)==0 or strings.indexOf(address.host,"10.",0)==0)` for `mq3.platform.unix_runtime.Sys_IsLANAddress`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Record providing `address.type`, `address.host`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L452)

<a id="function-function-mq3-platform-unix-runtime-sys-listfiles-function-sys-listfiles-state-directory-extension-src-mq3-platform-unix-runtime-ml-895500407"></a>
### Sys_ListFiles

```ml
function Sys_ListFiles(state, directory, extension)
```

Returns `[]` for the `mq3.platform.unix_runtime.Sys_ListFiles` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `directory` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `extension` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L511)

<a id="function-function-mq3-platform-unix-runtime-sys-listfilteredfiles-function-sys-listfilteredfiles-state-directory-extension-filter-src-mq3-platform-unix-runtime-ml-1854960635"></a>
### Sys_ListFilteredFiles

```ml
function Sys_ListFilteredFiles(state, directory, extension, filter)
```

Returns `[]` for the `mq3.platform.unix_runtime.Sys_ListFilteredFiles` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `directory` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `extension` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `filter` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L517)

<a id="function-function-mq3-platform-unix-runtime-sys-loaddll-function-sys-loaddll-state-name-src-mq3-platform-unix-runtime-ml-624168886"></a>
### Sys_LoadDll

```ml
function Sys_LoadDll(state, name)
```

Returns `void` for the `mq3.platform.unix_runtime.Sys_LoadDll` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `name` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L350)

<a id="function-function-mq3-platform-unix-runtime-sys-lowphysicalmemory-function-sys-lowphysicalmemory-state-src-mq3-platform-unix-runtime-ml-1640400637"></a>
### Sys_LowPhysicalMemory

```ml
function Sys_LowPhysicalMemory(state)
```

Returns `false` for the `mq3.platform.unix_runtime.Sys_LowPhysicalMemory` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L321)

<a id="function-function-mq3-platform-unix-runtime-sys-milliseconds-function-sys-milliseconds-state-src-mq3-platform-unix-runtime-ml-1796632257"></a>
### Sys_Milliseconds

```ml
function Sys_Milliseconds(state)
```

Computes `state.currentTime` for `mq3.platform.unix_runtime.Sys_Milliseconds`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.currentTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L498)

<a id="function-function-mq3-platform-unix-runtime-sys-mkdir-function-sys-mkdir-state-path-src-mq3-platform-unix-runtime-ml-1499951668"></a>
### Sys_Mkdir

```ml
function Sys_Mkdir(state, path)
```

Returns `true` for the `mq3.platform.unix_runtime.Sys_Mkdir` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `path` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L506)

<a id="function-function-mq3-platform-unix-runtime-sys-monkeyshouldbespanked-function-sys-monkeyshouldbespanked-state-src-mq3-platform-unix-runtime-ml-2131039879"></a>
### Sys_MonkeyShouldBeSpanked

```ml
function Sys_MonkeyShouldBeSpanked(state)
```

Returns `false` for the `mq3.platform.unix_runtime.Sys_MonkeyShouldBeSpanked` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L324)

<a id="function-function-mq3-platform-unix-runtime-sys-parseargs-function-sys-parseargs-state-args-src-mq3-platform-unix-runtime-ml-795763220"></a>
### Sys_ParseArgs

```ml
function Sys_ParseArgs(state, args)
```

Computes `args` for `mq3.platform.unix_runtime.Sys_ParseArgs`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `args` | `dynamic` | — | Input used in the result expression `args`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L343)

<a id="function-function-mq3-platform-unix-runtime-sys-print-function-sys-print-state-text-src-mq3-platform-unix-runtime-ml-1407838760"></a>
### Sys_Print

```ml
function Sys_Print(state, text)
```

Updates `state.events` in `mq3.platform.unix_runtime.Sys_Print`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.events`. |
| `text` | `dynamic` | — | Input used by `state.events=state.events+[["print",text]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L290)

<a id="function-function-mq3-platform-unix-runtime-sys-printbinversion-function-sys-printbinversion-state-src-mq3-platform-unix-runtime-ml-1886615637"></a>
### Sys_PrintBinVersion

```ml
function Sys_PrintBinVersion(state)
```

Computes `"MiniQuake3"` for `mq3.platform.unix_runtime.Sys_PrintBinVersion`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L339)

<a id="function-function-mq3-platform-unix-runtime-sys-printf-function-sys-printf-state-text-src-mq3-platform-unix-runtime-ml-1091302602"></a>
### Sys_Printf

```ml
function Sys_Printf(state, text)
```

Calls `mq3.platform.unix_runtime.Sys_Print` with `(state,text)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.platform.unix_runtime.Sys_Print`. |
| `text` | `dynamic` | — | Value forwarded as `text` to `mq3.platform.unix_runtime.Sys_Print`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L294)

<a id="function-function-mq3-platform-unix-runtime-sys-processorcount-function-sys-processorcount-state-src-mq3-platform-unix-runtime-ml-296190513"></a>
### Sys_ProcessorCount

```ml
function Sys_ProcessorCount(state)
```

Returns `1` for the `mq3.platform.unix_runtime.Sys_ProcessorCount` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L495)

<a id="function-function-mq3-platform-unix-runtime-sys-queevent-function-sys-queevent-state-time-kind-value1-value2-src-mq3-platform-unix-runtime-ml-1373879547"></a>
### Sys_QueEvent

```ml
function Sys_QueEvent(state, time, kind, value1, value2)
```

Updates `state.systemEvents` in `mq3.platform.unix_runtime.Sys_QueEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.systemEvents`. |
| `time` | `dynamic` | — | Value used for `mq3.platform.unix_runtime.Event.time`. |
| `kind` | `dynamic` | — | Value used for `mq3.platform.unix_runtime.Event.kind`. |
| `value1` | `dynamic` | — | Value used for `mq3.platform.unix_runtime.Event.value1`. |
| `value2` | `dynamic` | — | Value used for `mq3.platform.unix_runtime.Event.value2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L403)

<a id="function-function-mq3-platform-unix-runtime-sys-quit-function-sys-quit-state-src-mq3-platform-unix-runtime-ml-1101858973"></a>
### Sys_Quit

```ml
function Sys_Quit(state)
```

Updates `state.quitRequested` in `mq3.platform.unix_runtime.Sys_Quit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.quitRequested`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L305)

<a id="function-function-mq3-platform-unix-runtime-sys-sendkeyevents-function-sys-sendkeyevents-state-src-mq3-platform-unix-runtime-ml-417121573"></a>
### Sys_SendKeyEvents

```ml
function Sys_SendKeyEvents(state)
```

Calls `mq3.platform.unix_runtime.HandleEvents` with `(state)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.platform.unix_runtime.HandleEvents`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L167)

<a id="function-function-mq3-platform-unix-runtime-sys-sendpacket-function-sys-sendpacket-state-length-data-address-src-mq3-platform-unix-runtime-ml-2037045007"></a>
### Sys_SendPacket

```ml
function Sys_SendPacket(state, length, data, address)
```

Updates `state.packets` in `mq3.platform.unix_runtime.Sys_SendPacket`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.packets`. |
| `length` | `dynamic` | — | Input used by `count=length`. |
| `data` | `dynamic` | — | Argument 1 supplied to `slice`. |
| `address` | `dynamic` | — | Input used by `state.packets=state.packets+[[address,slice(data,0,count)]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L458)

<a id="function-function-mq3-platform-unix-runtime-sys-setdefaultcdpath-function-sys-setdefaultcdpath-state-value-src-mq3-platform-unix-runtime-ml-1031467334"></a>
### Sys_SetDefaultCDPath

```ml
function Sys_SetDefaultCDPath(state, value)
```

Updates `state.paths[1]` in `mq3.platform.unix_runtime.Sys_SetDefaultCDPath`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.paths[1]`. |
| `value` | `dynamic` | — | Value assigned to `state.paths[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L481)

<a id="function-function-mq3-platform-unix-runtime-sys-setdefaulthomepath-function-sys-setdefaulthomepath-state-value-src-mq3-platform-unix-runtime-ml-1701091450"></a>
### Sys_SetDefaultHomePath

```ml
function Sys_SetDefaultHomePath(state, value)
```

Updates `state.paths[2]` in `mq3.platform.unix_runtime.Sys_SetDefaultHomePath`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.paths[2]`. |
| `value` | `dynamic` | — | Value assigned to `state.paths[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L485)

<a id="function-function-mq3-platform-unix-runtime-sys-setdefaultinstallpath-function-sys-setdefaultinstallpath-state-value-src-mq3-platform-unix-runtime-ml-555471684"></a>
### Sys_SetDefaultInstallPath

```ml
function Sys_SetDefaultInstallPath(state, value)
```

Updates `state.paths[3]` in `mq3.platform.unix_runtime.Sys_SetDefaultInstallPath`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.paths[3]`. |
| `value` | `dynamic` | — | Value assigned to `state.paths[3]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L489)

<a id="function-function-mq3-platform-unix-runtime-sys-showconsole-function-sys-showconsole-state-level-quitonclose-src-mq3-platform-unix-runtime-ml-448204113"></a>
### Sys_ShowConsole

```ml
function Sys_ShowConsole(state, level, quitOnClose)
```

Returns `void` for the `mq3.platform.unix_runtime.Sys_ShowConsole` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `level` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `quitOnClose` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L526)

<a id="function-function-mq3-platform-unix-runtime-sys-showip-function-sys-showip-state-src-mq3-platform-unix-runtime-ml-1673658965"></a>
### Sys_ShowIP

```ml
function Sys_ShowIP(state)
```

Lists the 1 declared names for `mq3.platform.unix_runtime.Sys_ShowIP`, including `127.0.0.1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L464)

<a id="function-function-mq3-platform-unix-runtime-sys-shutdownstreamthread-function-sys-shutdownstreamthread-state-src-mq3-platform-unix-runtime-ml-450633433"></a>
### Sys_ShutdownStreamThread

```ml
function Sys_ShutdownStreamThread(state)
```

Returns `void` for the `mq3.platform.unix_runtime.Sys_ShutdownStreamThread` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L393)

<a id="function-function-mq3-platform-unix-runtime-sys-snapvector-function-sys-snapvector-value-src-mq3-platform-unix-runtime-ml-270491777"></a>
### Sys_SnapVector

```ml
function Sys_SnapVector(value)
```

Returns `[n.trunc32(value[0]),n.trunc32(value[1]),n.trunc32(value[2])]` for `mq3.platform.unix_runtime.Sys_SnapVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L532)

<a id="function-function-mq3-platform-unix-runtime-sys-streamedread-function-sys-streamedread-state-buffer-size-count-file-src-mq3-platform-unix-runtime-ml-96943447"></a>
### Sys_StreamedRead

```ml
function Sys_StreamedRead(state, buffer, size, count, file)
```

Returns `0` for the `mq3.platform.unix_runtime.Sys_StreamedRead` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `buffer` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `size` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `count` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `file` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L381)

<a id="function-function-mq3-platform-unix-runtime-sys-streamseek-function-sys-streamseek-state-file-offset-origin-src-mq3-platform-unix-runtime-ml-1093845250"></a>
### Sys_StreamSeek

```ml
function Sys_StreamSeek(state, file, offset, origin)
```

Returns `void` for the `mq3.platform.unix_runtime.Sys_StreamSeek` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `file` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `offset` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `origin` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L387)

<a id="function-function-mq3-platform-unix-runtime-sys-streamthread-function-sys-streamthread-state-src-mq3-platform-unix-runtime-ml-1500489605"></a>
### Sys_StreamThread

```ml
function Sys_StreamThread(state)
```

Returns `void` for the `mq3.platform.unix_runtime.Sys_StreamThread` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L396)

<a id="function-function-mq3-platform-unix-runtime-sys-stringtoadr-function-sys-stringtoadr-text-src-mq3-platform-unix-runtime-ml-2107411553"></a>
### Sys_StringToAdr

```ml
function Sys_StringToAdr(text)
```

Calls `mq3.platform.unix_runtime.Sys_StringToSockaddr` with `(text,27960)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Value forwarded as `text` to `mq3.platform.unix_runtime.Sys_StringToSockaddr`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L418)

<a id="function-function-mq3-platform-unix-runtime-sys-stringtosockaddr-function-sys-stringtosockaddr-text-defaultport-src-mq3-platform-unix-runtime-ml-142573995"></a>
### Sys_StringToSockaddr

```ml
function Sys_StringToSockaddr(text, defaultPort)
```

Builds `mq3.platform.unix_runtime.Address` for `mq3.platform.unix_runtime.Sys_StringToSockaddr`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Argument 1 supplied to `std.string.split`. |
| `defaultPort` | `dynamic` | — | Input used by `port=defaultPort`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L411)

<a id="function-function-mq3-platform-unix-runtime-sys-unloaddll-function-sys-unloaddll-state-handle-src-mq3-platform-unix-runtime-ml-2142462989"></a>
### Sys_UnloadDll

```ml
function Sys_UnloadDll(state, handle)
```

Returns `void` for the `mq3.platform.unix_runtime.Sys_UnloadDll` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `handle` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L354)

<a id="function-function-mq3-platform-unix-runtime-sys-warn-function-sys-warn-state-text-src-mq3-platform-unix-runtime-ml-921067382"></a>
### Sys_Warn

```ml
function Sys_Warn(state, text)
```

Updates `state.warnings` in `mq3.platform.unix_runtime.Sys_Warn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.warnings`. |
| `text` | `dynamic` | — | Input used by `state.warnings=state.warnings+[text]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L298)

<a id="function-function-mq3-platform-unix-runtime-sys-xtimetosystime-function-sys-xtimetosystime-state-time-src-mq3-platform-unix-runtime-ml-1407740988"></a>
### Sys_XTimeToSysTime

```ml
function Sys_XTimeToSysTime(state, time)
```

Computes `time` for `mq3.platform.unix_runtime.Sys_XTimeToSysTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `time` | `dynamic` | — | Input used in the result expression `time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L502)

<a id="function-function-mq3-platform-unix-runtime-tty-back-function-tty-back-state-src-mq3-platform-unix-runtime-ml-1264155065"></a>
### tty_Back

```ml
function tty_Back(state)
```

Calls `mq3.platform.unix_runtime.Hist_Prev` with `(state)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.platform.unix_runtime.Hist_Prev`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L268)

<a id="function-function-mq3-platform-unix-runtime-tty-flushin-function-tty-flushin-state-src-mq3-platform-unix-runtime-ml-2034239907"></a>
### tty_FlushIn

```ml
function tty_FlushIn(state)
```

Updates `state.historyCursor` in `mq3.platform.unix_runtime.tty_FlushIn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.historyCursor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L271)

<a id="function-function-mq3-platform-unix-runtime-tty-hide-function-tty-hide-state-src-mq3-platform-unix-runtime-ml-1757806533"></a>
### tty_Hide

```ml
function tty_Hide(state)
```

Updates `state.active` in `mq3.platform.unix_runtime.tty_Hide`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L274)

<a id="function-function-mq3-platform-unix-runtime-tty-show-function-tty-show-state-src-mq3-platform-unix-runtime-ml-2086826129"></a>
### tty_Show

```ml
function tty_Show(state)
```

Updates `state.active` in `mq3.platform.unix_runtime.tty_Show`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L277)

<a id="function-function-mq3-platform-unix-runtime-uninstall-grabs-function-uninstall-grabs-state-src-mq3-platform-unix-runtime-ml-866473413"></a>
### uninstall_grabs

```ml
function uninstall_grabs(state)
```

Updates `state.active` in `mq3.platform.unix_runtime.uninstall_grabs`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L132)

<a id="function-function-mq3-platform-unix-runtime-unixglwsymbols-function-unixglwsymbols-src-mq3-platform-unix-runtime-ml-797116364"></a>
### unixGlwSymbols

```ml
function unixGlwSymbols()
```

Returns `[]` for the `mq3.platform.unix_runtime.unixGlwSymbols` compatibility entry point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L27)

<a id="function-function-mq3-platform-unix-runtime-unixmain-function-unixmain-state-framecount-framefn-context-src-mq3-platform-unix-runtime-ml-1667934653"></a>
### unixMain

```ml
function unixMain(state, frameCount, frameFn, context)
```

Returns `state` from `mq3.platform.unix_runtime.unixMain`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.quitRequested`. |
| `frameCount` | `dynamic` | — | Input used by `for index=0 to frameCount-1 if state.quitRequested then break`. |
| `frameFn` | `dynamic` | — | Input used by `frameFn(context)`. |
| `context` | `dynamic` | — | Argument 1 supplied to `frameFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L554)

<a id="function-function-mq3-platform-unix-runtime-unixmainsymbols-function-unixmainsymbols-src-mq3-platform-unix-runtime-ml-824741404"></a>
### unixMainSymbols

```ml
function unixMainSymbols()
```

Lists the 43 declared names for `mq3.platform.unix_runtime.unixMainSymbols`, including `Hist_Add`, `Hist_Next`, `Hist_Prev`, `Sys_AppActivate`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L29)

<a id="function-function-mq3-platform-unix-runtime-unixnetsymbols-function-unixnetsymbols-src-mq3-platform-unix-runtime-ml-876182252"></a>
### unixNetSymbols

```ml
function unixNetSymbols()
```

Lists the 16 declared names for `mq3.platform.unix_runtime.unixNetSymbols`, including `NET_BaseAdrToString`, `NET_ErrorString`, `NET_GetLocalAddress`, `NET_IPSocket`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L31)

<a id="function-function-mq3-platform-unix-runtime-unixsharedsymbols-function-unixsharedsymbols-src-mq3-platform-unix-runtime-ml-31313744"></a>
### unixSharedSymbols

```ml
function unixSharedSymbols()
```

Lists the 20 declared names for `mq3.platform.unix_runtime.unixSharedSymbols`, including `Sys_Cwd`, `Sys_DefaultCDPath`, `Sys_DefaultHomePath`, `Sys_DefaultInstallPath`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L33)

<a id="function-function-mq3-platform-unix-runtime-unixvmx86symbols-function-unixvmx86symbols-src-mq3-platform-unix-runtime-ml-414680164"></a>
### unixVmX86Symbols

```ml
function unixVmX86Symbols()
```

Lists the 2 declared names for `mq3.platform.unix_runtime.unixVmX86Symbols`, including `VM_CallCompiled`, `VM_Compile`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L35)

<a id="function-function-mq3-platform-unix-runtime-vm-callcompiled-function-vm-callcompiled-compiled-args-src-mq3-platform-unix-runtime-ml-200912856"></a>
### VM_CallCompiled

```ml
function VM_CallCompiled(compiled, args)
```

Calls `mq3.vm.jit_compat.VM_CallCompiled` with `(compiled,args)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `compiled` | `dynamic` | — | Argument 1 supplied to `mq3.vm.jit_compat.VM_CallCompiled`. |
| `args` | `dynamic` | — | Argument 2 supplied to `mq3.vm.jit_compat.VM_CallCompiled`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L547)

<a id="function-function-mq3-platform-unix-runtime-vm-compile-function-vm-compile-image-callback-src-mq3-platform-unix-runtime-ml-603218990"></a>
### VM_Compile

```ml
function VM_Compile(image, callback)
```

Calls `mq3.vm.jit_compat.VM_Compile` with `(image,callback,"x86")` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — | Argument 1 supplied to `mq3.vm.jit_compat.VM_Compile`. |
| `callback` | `dynamic` | — | Argument 2 supplied to `mq3.vm.jit_compat.VM_Compile`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L543)

<a id="function-function-mq3-platform-unix-runtime-x11-pendinginput-function-x11-pendinginput-state-src-mq3-platform-unix-runtime-ml-1732292133"></a>
### X11_PendingInput

```ml
function X11_PendingInput(state)
```

Computes `len(state.events)>0` for `mq3.platform.unix_runtime.X11_PendingInput`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.events`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L170)

<a id="function-function-mq3-platform-unix-runtime-xlatekey-function-xlatekey-state-key-src-mq3-platform-unix-runtime-ml-1785830688"></a>
### XLateKey

```ml
function XLateKey(state, key)
```

Computes `key` for `mq3.platform.unix_runtime.XLateKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `key` | `dynamic` | — | Input used in the result expression `key`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/unix_runtime.ml#L174)
