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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `destinationOffset` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `sourceOffset` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L37)

- [mq3.platform.unix_runtime.Address](Type-mq3-platform-unix-runtime-address-1805079642.md) — struct
<a id="function-function-mq3-platform-unix-runtime-com-memcpy-function-com-memcpy-destination-destinationoffset-source-sourceoffset-count-src-mq3-platform-unix-runtime-ml-1585396127"></a>
### Com_Memcpy

```ml
function Com_Memcpy(destination, destinationOffset, source, sourceOffset, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `destinationOffset` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `sourceOffset` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L34)

<a id="function-function-mq3-platform-unix-runtime-com-memset-function-com-memset-destination-offset-value-count-src-mq3-platform-unix-runtime-ml-539120043"></a>
### Com_Memset

```ml
function Com_Memset(destination, offset, value, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L35)

<a id="function-function-mq3-platform-unix-runtime-com-prefetch-function-com-prefetch-memory-count-src-mq3-platform-unix-runtime-ml-1161591606"></a>
### Com_Prefetch

```ml
function Com_Prefetch(memory, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `memory` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L36)

<a id="function-function-mq3-platform-unix-runtime-create-function-create-src-mq3-platform-unix-runtime-ml-91702896"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L32)

<a id="function-function-mq3-platform-unix-runtime-createnullcursor-function-createnullcursor-state-src-mq3-platform-unix-runtime-ml-1285158637"></a>
### CreateNullCursor

```ml
function CreateNullCursor(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L50)

- [mq3.platform.unix_runtime.Event](Type-mq3-platform-unix-runtime-event-892773070.md) — struct
<a id="function-function-mq3-platform-unix-runtime-fastftol-function-fastftol-value-src-mq3-platform-unix-runtime-ml-380049725"></a>
### fastftol

```ml
function fastftol(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L173)

<a id="function-function-mq3-platform-unix-runtime-floating-point-exception-handler-function-floating-point-exception-handler-state-src-mq3-platform-unix-runtime-ml-1914943221"></a>
### floating_point_exception_handler

```ml
function floating_point_exception_handler(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L109)

<a id="function-function-mq3-platform-unix-runtime-glimp-endframe-function-glimp-endframe-state-src-mq3-platform-unix-runtime-ml-606287117"></a>
### GLimp_EndFrame

```ml
function GLimp_EndFrame(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L42)

<a id="function-function-mq3-platform-unix-runtime-glimp-frontendsleep-function-glimp-frontendsleep-state-src-mq3-platform-unix-runtime-ml-255469339"></a>
### GLimp_FrontEndSleep

```ml
function GLimp_FrontEndSleep(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L72)

<a id="function-function-mq3-platform-unix-runtime-glimp-init-function-glimp-init-state-src-mq3-platform-unix-runtime-ml-517852485"></a>
### GLimp_Init

```ml
function GLimp_Init(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L40)

<a id="function-function-mq3-platform-unix-runtime-glimp-logcomment-function-glimp-logcomment-state-text-src-mq3-platform-unix-runtime-ml-48815778"></a>
### GLimp_LogComment

```ml
function GLimp_LogComment(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L44)

<a id="function-function-mq3-platform-unix-runtime-glimp-lognewframe-function-glimp-lognewframe-state-src-mq3-platform-unix-runtime-ml-402563999"></a>
### GLimp_LogNewFrame

```ml
function GLimp_LogNewFrame(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L78)

<a id="function-function-mq3-platform-unix-runtime-glimp-renderersleep-function-glimp-renderersleep-state-src-mq3-platform-unix-runtime-ml-1792512165"></a>
### GLimp_RendererSleep

```ml
function GLimp_RendererSleep(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L71)

<a id="function-function-mq3-platform-unix-runtime-glimp-renderthreadwrapper-function-glimp-renderthreadwrapper-state-callback-context-src-mq3-platform-unix-runtime-ml-1592679715"></a>
### GLimp_RenderThreadWrapper

```ml
function GLimp_RenderThreadWrapper(state, callback, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L70)

<a id="function-function-mq3-platform-unix-runtime-glimp-setgamma-function-glimp-setgamma-state-red-green-blue-src-mq3-platform-unix-runtime-ml-155174035"></a>
### GLimp_SetGamma

```ml
function GLimp_SetGamma(state, red, green, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L43)

<a id="function-function-mq3-platform-unix-runtime-glimp-shutdown-function-glimp-shutdown-state-src-mq3-platform-unix-runtime-ml-686621373"></a>
### GLimp_Shutdown

```ml
function GLimp_Shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L41)

<a id="function-function-mq3-platform-unix-runtime-glimp-spawnrenderthread-function-glimp-spawnrenderthread-state-callback-src-mq3-platform-unix-runtime-ml-468802528"></a>
### GLimp_SpawnRenderThread

```ml
function GLimp_SpawnRenderThread(state, callback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L69)

<a id="function-function-mq3-platform-unix-runtime-glimp-wakerenderer-function-glimp-wakerenderer-state-data-src-mq3-platform-unix-runtime-ml-1181285833"></a>
### GLimp_WakeRenderer

```ml
function GLimp_WakeRenderer(state, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L73)

<a id="function-function-mq3-platform-unix-runtime-glw-initextensions-function-glw-initextensions-state-text-src-mq3-platform-unix-runtime-ml-509615550"></a>
### GLW_InitExtensions

```ml
function GLW_InitExtensions(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L48)

<a id="function-function-mq3-platform-unix-runtime-glw-initgamma-function-glw-initgamma-state-src-mq3-platform-unix-runtime-ml-155885585"></a>
### GLW_InitGamma

```ml
function GLW_InitGamma(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L49)

<a id="function-function-mq3-platform-unix-runtime-glw-loadopengl-function-glw-loadopengl-state-driver-src-mq3-platform-unix-runtime-ml-348420155"></a>
### GLW_LoadOpenGL

```ml
function GLW_LoadOpenGL(state, driver)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `driver` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L47)

<a id="function-function-mq3-platform-unix-runtime-glw-setmode-function-glw-setmode-state-mode-fullscreen-src-mq3-platform-unix-runtime-ml-206462139"></a>
### GLW_SetMode

```ml
function GLW_SetMode(state, mode, fullscreen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `fullscreen` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L45)

<a id="function-function-mq3-platform-unix-runtime-glw-startdriverandsetmode-function-glw-startdriverandsetmode-state-driver-mode-fullscreen-src-mq3-platform-unix-runtime-ml-1530422631"></a>
### GLW_StartDriverAndSetMode

```ml
function GLW_StartDriverAndSetMode(state, driver, mode, fullscreen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `driver` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `fullscreen` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L46)

<a id="function-function-mq3-platform-unix-runtime-handleevents-function-handleevents-state-src-mq3-platform-unix-runtime-ml-632731741"></a>
### HandleEvents

```ml
function HandleEvents(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L51)

<a id="function-function-mq3-platform-unix-runtime-hist-add-function-hist-add-state-text-src-mq3-platform-unix-runtime-ml-893481842"></a>
### Hist_Add

```ml
function Hist_Add(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L91)

<a id="function-function-mq3-platform-unix-runtime-hist-next-function-hist-next-state-src-mq3-platform-unix-runtime-ml-325151417"></a>
### Hist_Next

```ml
function Hist_Next(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L93)

<a id="function-function-mq3-platform-unix-runtime-hist-prev-function-hist-prev-state-src-mq3-platform-unix-runtime-ml-1288882765"></a>
### Hist_Prev

```ml
function Hist_Prev(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L92)

<a id="function-function-mq3-platform-unix-runtime-in-activate-function-in-activate-state-active-src-mq3-platform-unix-runtime-ml-1743189089"></a>
### IN_Activate

```ml
function IN_Activate(state, active)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `active` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L54)

<a id="function-function-mq3-platform-unix-runtime-in-activatemouse-function-in-activatemouse-state-src-mq3-platform-unix-runtime-ml-2142808681"></a>
### IN_ActivateMouse

```ml
function IN_ActivateMouse(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L55)

<a id="function-function-mq3-platform-unix-runtime-in-deactivatemouse-function-in-deactivatemouse-state-src-mq3-platform-unix-runtime-ml-1050294281"></a>
### IN_DeactivateMouse

```ml
function IN_DeactivateMouse(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L56)

<a id="function-function-mq3-platform-unix-runtime-in-frame-function-in-frame-state-src-mq3-platform-unix-runtime-ml-1389851993"></a>
### IN_Frame

```ml
function IN_Frame(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L59)

<a id="function-function-mq3-platform-unix-runtime-in-init-function-in-init-state-src-mq3-platform-unix-runtime-ml-810330405"></a>
### IN_Init

```ml
function IN_Init(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L57)

<a id="function-function-mq3-platform-unix-runtime-in-joymove-function-in-joymove-state-axes-src-mq3-platform-unix-runtime-ml-1320104488"></a>
### IN_JoyMove

```ml
function IN_JoyMove(state, axes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `axes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L61)

<a id="function-function-mq3-platform-unix-runtime-in-shutdown-function-in-shutdown-state-src-mq3-platform-unix-runtime-ml-43949733"></a>
### IN_Shutdown

```ml
function IN_Shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L58)

<a id="function-function-mq3-platform-unix-runtime-in-startupjoystick-function-in-startupjoystick-state-src-mq3-platform-unix-runtime-ml-1915396041"></a>
### IN_StartupJoystick

```ml
function IN_StartupJoystick(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L60)

<a id="function-function-mq3-platform-unix-runtime-initsig-function-initsig-state-src-mq3-platform-unix-runtime-ml-1605948807"></a>
### InitSig

```ml
function InitSig(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L82)

<a id="function-function-mq3-platform-unix-runtime-install-grabs-function-install-grabs-state-src-mq3-platform-unix-runtime-ml-2045148963"></a>
### install_grabs

```ml
function install_grabs(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L52)

<a id="function-function-mq3-platform-unix-runtime-kbd-close-function-kbd-close-state-src-mq3-platform-unix-runtime-ml-531686965"></a>
### KBD_Close

```ml
function KBD_Close(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L63)

<a id="function-function-mq3-platform-unix-runtime-kbd-init-function-kbd-init-state-src-mq3-platform-unix-runtime-ml-516740053"></a>
### KBD_Init

```ml
function KBD_Init(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L62)

<a id="function-function-mq3-platform-unix-runtime-linuxcommonsymbols-function-linuxcommonsymbols-src-mq3-platform-unix-runtime-ml-382501660"></a>
### linuxCommonSymbols

```ml
function linuxCommonSymbols()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L10)

<a id="function-function-mq3-platform-unix-runtime-linuxglimpsymbols-function-linuxglimpsymbols-src-mq3-platform-unix-runtime-ml-951033228"></a>
### linuxGlimpSymbols

```ml
function linuxGlimpSymbols()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L11)

<a id="function-function-mq3-platform-unix-runtime-linuxjoysticksymbols-function-linuxjoysticksymbols-src-mq3-platform-unix-runtime-ml-1394088372"></a>
### linuxJoystickSymbols

```ml
function linuxJoystickSymbols()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L12)

<a id="function-function-mq3-platform-unix-runtime-linuxlocalsymbols-function-linuxlocalsymbols-src-mq3-platform-unix-runtime-ml-1979442028"></a>
### linuxLocalSymbols

```ml
function linuxLocalSymbols()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L13)

<a id="function-function-mq3-platform-unix-runtime-linuxqglsymbols-function-linuxqglsymbols-src-mq3-platform-unix-runtime-ml-1684487250"></a>
### linuxQglSymbols

```ml
function linuxQglSymbols()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L14)

<a id="function-function-mq3-platform-unix-runtime-linuxsignalssymbols-function-linuxsignalssymbols-src-mq3-platform-unix-runtime-ml-1748482144"></a>
### linuxSignalsSymbols

```ml
function linuxSignalsSymbols()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L15)

<a id="function-function-mq3-platform-unix-runtime-linuxsoundsymbols-function-linuxsoundsymbols-src-mq3-platform-unix-runtime-ml-1914306244"></a>
### linuxSoundSymbols

```ml
function linuxSoundSymbols()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L16)

<a id="constant-constant-mq3-platform-unix-runtime-na-bad-const-na-bad-1-src-mq3-platform-unix-runtime-ml-931683240"></a>
### NA_BAD

```ml
const NA_BAD = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L28)

<a id="constant-constant-mq3-platform-unix-runtime-na-ip-const-na-ip-4-src-mq3-platform-unix-runtime-ml-62011145"></a>
### NA_IP

```ml
const NA_IP = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L30)

<a id="constant-constant-mq3-platform-unix-runtime-na-loopback-const-na-loopback-2-src-mq3-platform-unix-runtime-ml-299013299"></a>
### NA_LOOPBACK

```ml
const NA_LOOPBACK = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L29)

<a id="function-function-mq3-platform-unix-runtime-net-baseadrtostring-function-net-baseadrtostring-address-src-mq3-platform-unix-runtime-ml-1029440956"></a>
### NET_BaseAdrToString

```ml
function NET_BaseAdrToString(address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L142)

<a id="function-function-mq3-platform-unix-runtime-net-errorstring-function-net-errorstring-code-src-mq3-platform-unix-runtime-ml-1093611855"></a>
### NET_ErrorString

```ml
function NET_ErrorString(code)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L143)

<a id="function-function-mq3-platform-unix-runtime-net-getlocaladdress-function-net-getlocaladdress-state-src-mq3-platform-unix-runtime-ml-1312316403"></a>
### NET_GetLocalAddress

```ml
function NET_GetLocalAddress(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L149)

<a id="function-function-mq3-platform-unix-runtime-net-init-function-net-init-state-src-mq3-platform-unix-runtime-ml-1504912197"></a>
### NET_Init

```ml
function NET_Init(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L145)

<a id="function-function-mq3-platform-unix-runtime-net-ipsocket-function-net-ipsocket-interfacename-port-src-mq3-platform-unix-runtime-ml-184691627"></a>
### NET_IPSocket

```ml
function NET_IPSocket(interfaceName, port)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `interfaceName` | `dynamic` | — |  |
| `port` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L144)

<a id="function-function-mq3-platform-unix-runtime-net-openip-function-net-openip-state-src-mq3-platform-unix-runtime-ml-526294889"></a>
### NET_OpenIP

```ml
function NET_OpenIP(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L146)

<a id="function-function-mq3-platform-unix-runtime-net-shutdown-function-net-shutdown-state-src-mq3-platform-unix-runtime-ml-1585380493"></a>
### NET_Shutdown

```ml
function NET_Shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L147)

<a id="function-function-mq3-platform-unix-runtime-net-sleep-function-net-sleep-msec-src-mq3-platform-unix-runtime-ml-728380310"></a>
### NET_Sleep

```ml
function NET_Sleep(msec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msec` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L148)

<a id="function-function-mq3-platform-unix-runtime-netadrtosockadr-function-netadrtosockadr-address-src-mq3-platform-unix-runtime-ml-260928788"></a>
### NetadrToSockadr

```ml
function NetadrToSockadr(address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L140)

<a id="function-function-mq3-platform-unix-runtime-q-stristr-function-q-stristr-text-needle-src-mq3-platform-unix-runtime-ml-890161702"></a>
### Q_stristr

```ml
function Q_stristr(text, needle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `needle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L39)

<a id="function-function-mq3-platform-unix-runtime-qasmsymbols-function-qasmsymbols-src-mq3-platform-unix-runtime-ml-1514513646"></a>
### qasmSymbols

```ml
function qasmSymbols()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L17)

<a id="function-function-mq3-platform-unix-runtime-qgl-enablelogging-function-qgl-enablelogging-state-enabled-src-mq3-platform-unix-runtime-ml-21279100"></a>
### QGL_EnableLogging

```ml
function QGL_EnableLogging(state, enabled)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `enabled` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L77)

<a id="function-function-mq3-platform-unix-runtime-qgl-init-function-qgl-init-state-driver-src-mq3-platform-unix-runtime-ml-1841211359"></a>
### QGL_Init

```ml
function QGL_Init(state, driver)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `driver` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L75)

<a id="function-function-mq3-platform-unix-runtime-qgl-shutdown-function-qgl-shutdown-state-src-mq3-platform-unix-runtime-ml-2122809329"></a>
### QGL_Shutdown

```ml
function QGL_Shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L76)

<a id="function-function-mq3-platform-unix-runtime-qgldispatch-function-qgldispatch-state-name-arguments-src-mq3-platform-unix-runtime-ml-2094617498"></a>
### qglDispatch

```ml
function qglDispatch(state, name, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L79)

<a id="function-function-mq3-platform-unix-runtime-qwglgetprocaddress-function-qwglgetprocaddress-state-name-src-mq3-platform-unix-runtime-ml-1843470826"></a>
### qwglGetProcAddress

```ml
function qwglGetProcAddress(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L80)

<a id="function-function-mq3-platform-unix-runtime-qxerrorhandler-function-qxerrorhandler-state-code-src-mq3-platform-unix-runtime-ml-32356848"></a>
### qXErrorHandler

```ml
function qXErrorHandler(state, code)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `code` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L68)

<a id="function-function-mq3-platform-unix-runtime-repeated-press-function-repeated-press-state-key-time-src-mq3-platform-unix-runtime-ml-1372004869"></a>
### repeated_press

```ml
function repeated_press(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L67)

<a id="function-function-mq3-platform-unix-runtime-signal-handler-function-signal-handler-state-signal-src-mq3-platform-unix-runtime-ml-1486033045"></a>
### signal_handler

```ml
function signal_handler(state, signal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `signal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L83)

<a id="function-function-mq3-platform-unix-runtime-snd-memset-function-snd-memset-destination-value-count-src-mq3-platform-unix-runtime-ml-33134564"></a>
### Snd_Memset

```ml
function Snd_Memset(destination, value, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L89)

<a id="function-function-mq3-platform-unix-runtime-snddma-beginpainting-function-snddma-beginpainting-state-src-mq3-platform-unix-runtime-ml-1195256945"></a>
### SNDDMA_BeginPainting

```ml
function SNDDMA_BeginPainting(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L86)

<a id="function-function-mq3-platform-unix-runtime-snddma-getdmapos-function-snddma-getdmapos-state-src-mq3-platform-unix-runtime-ml-1019745913"></a>
### SNDDMA_GetDMAPos

```ml
function SNDDMA_GetDMAPos(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L85)

<a id="function-function-mq3-platform-unix-runtime-snddma-init-function-snddma-init-state-src-mq3-platform-unix-runtime-ml-2049090325"></a>
### SNDDMA_Init

```ml
function SNDDMA_Init(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L84)

<a id="function-function-mq3-platform-unix-runtime-snddma-shutdown-function-snddma-shutdown-state-src-mq3-platform-unix-runtime-ml-860364941"></a>
### SNDDMA_Shutdown

```ml
function SNDDMA_Shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L88)

<a id="function-function-mq3-platform-unix-runtime-snddma-submit-function-snddma-submit-state-src-mq3-platform-unix-runtime-ml-1185856777"></a>
### SNDDMA_Submit

```ml
function SNDDMA_Submit(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L87)

<a id="function-function-mq3-platform-unix-runtime-sockadrtonetadr-function-sockadrtonetadr-address-src-mq3-platform-unix-runtime-ml-1346841420"></a>
### SockadrToNetadr

```ml
function SockadrToNetadr(address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L141)

- [mq3.platform.unix_runtime.State](Type-mq3-platform-unix-runtime-state-1024097335.md) — struct
<a id="function-function-mq3-platform-unix-runtime-strlwr-function-strlwr-value-src-mq3-platform-unix-runtime-ml-1665452013"></a>
### strlwr

```ml
function strlwr(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L174)

<a id="function-function-mq3-platform-unix-runtime-sys-appactivate-function-sys-appactivate-state-src-mq3-platform-unix-runtime-ml-2118922409"></a>
### Sys_AppActivate

```ml
function Sys_AppActivate(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L113)

<a id="function-function-mq3-platform-unix-runtime-sys-beginprofiling-function-sys-beginprofiling-state-src-mq3-platform-unix-runtime-ml-1912013833"></a>
### Sys_BeginProfiling

```ml
function Sys_BeginProfiling(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L115)

<a id="function-function-mq3-platform-unix-runtime-sys-beginstreamedfile-function-sys-beginstreamedfile-state-file-readahead-src-mq3-platform-unix-runtime-ml-1427397644"></a>
### Sys_BeginStreamedFile

```ml
function Sys_BeginStreamedFile(state, file, readAhead)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `file` | `dynamic` | — |  |
| `readAhead` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L124)

<a id="function-function-mq3-platform-unix-runtime-sys-checkcd-function-sys-checkcd-state-src-mq3-platform-unix-runtime-ml-1677975583"></a>
### Sys_CheckCD

```ml
function Sys_CheckCD(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L112)

<a id="function-function-mq3-platform-unix-runtime-sys-configurefpu-function-sys-configurefpu-state-src-mq3-platform-unix-runtime-ml-1627328537"></a>
### Sys_ConfigureFPU

```ml
function Sys_ConfigureFPU(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L108)

<a id="function-function-mq3-platform-unix-runtime-sys-consoleinput-function-sys-consoleinput-state-src-mq3-platform-unix-runtime-ml-1635696093"></a>
### Sys_ConsoleInput

```ml
function Sys_ConsoleInput(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L100)

<a id="function-function-mq3-platform-unix-runtime-sys-consoleinputinit-function-sys-consoleinputinit-state-src-mq3-platform-unix-runtime-ml-287615769"></a>
### Sys_ConsoleInputInit

```ml
function Sys_ConsoleInputInit(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L98)

<a id="function-function-mq3-platform-unix-runtime-sys-consoleinputshutdown-function-sys-consoleinputshutdown-state-src-mq3-platform-unix-runtime-ml-580973321"></a>
### Sys_ConsoleInputShutdown

```ml
function Sys_ConsoleInputShutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L99)

<a id="function-function-mq3-platform-unix-runtime-sys-cwd-function-sys-cwd-state-src-mq3-platform-unix-runtime-ml-1498865641"></a>
### Sys_Cwd

```ml
function Sys_Cwd(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L155)

<a id="function-function-mq3-platform-unix-runtime-sys-defaultcdpath-function-sys-defaultcdpath-state-src-mq3-platform-unix-runtime-ml-893174315"></a>
### Sys_DefaultCDPath

```ml
function Sys_DefaultCDPath(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L156)

<a id="function-function-mq3-platform-unix-runtime-sys-defaulthomepath-function-sys-defaulthomepath-state-src-mq3-platform-unix-runtime-ml-1447202287"></a>
### Sys_DefaultHomePath

```ml
function Sys_DefaultHomePath(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L157)

<a id="function-function-mq3-platform-unix-runtime-sys-defaultinstallpath-function-sys-defaultinstallpath-state-src-mq3-platform-unix-runtime-ml-1851126449"></a>
### Sys_DefaultInstallPath

```ml
function Sys_DefaultInstallPath(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L158)

<a id="function-function-mq3-platform-unix-runtime-sys-endstreamedfile-function-sys-endstreamedfile-state-file-src-mq3-platform-unix-runtime-ml-161778075"></a>
### Sys_EndStreamedFile

```ml
function Sys_EndStreamedFile(state, file)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `file` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L125)

<a id="function-function-mq3-platform-unix-runtime-sys-error-function-sys-error-state-text-src-mq3-platform-unix-runtime-ml-1912329106"></a>
### Sys_Error

```ml
function Sys_Error(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L104)

<a id="function-function-mq3-platform-unix-runtime-sys-exit-function-sys-exit-state-code-src-mq3-platform-unix-runtime-ml-933762844"></a>
### Sys_Exit

```ml
function Sys_Exit(state, code)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `code` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L106)

<a id="function-function-mq3-platform-unix-runtime-sys-filetime-function-sys-filetime-state-path-src-mq3-platform-unix-runtime-ml-130090374"></a>
### Sys_FileTime

```ml
function Sys_FileTime(state, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L123)

<a id="function-function-mq3-platform-unix-runtime-sys-freefilelist-function-sys-freefilelist-state-list-src-mq3-platform-unix-runtime-ml-1510683885"></a>
### Sys_FreeFileList

```ml
function Sys_FreeFileList(state, list)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `list` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L169)

<a id="function-function-mq3-platform-unix-runtime-sys-functionchecksum-function-sys-functionchecksum-value-src-mq3-platform-unix-runtime-ml-1296410049"></a>
### Sys_FunctionCheckSum

```ml
function Sys_FunctionCheckSum(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L122)

<a id="function-function-mq3-platform-unix-runtime-sys-functioncmp-function-sys-functioncmp-left-right-src-mq3-platform-unix-runtime-ml-1274372533"></a>
### Sys_FunctionCmp

```ml
function Sys_FunctionCmp(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L121)

<a id="function-function-mq3-platform-unix-runtime-sys-getclipboarddata-function-sys-getclipboarddata-state-src-mq3-platform-unix-runtime-ml-1870063809"></a>
### Sys_GetClipboardData

```ml
function Sys_GetClipboardData(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L118)

<a id="function-function-mq3-platform-unix-runtime-sys-getcurrentuser-function-sys-getcurrentuser-state-src-mq3-platform-unix-runtime-ml-631326641"></a>
### Sys_GetCurrentUser

```ml
function Sys_GetCurrentUser(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L162)

<a id="function-function-mq3-platform-unix-runtime-sys-getevent-function-sys-getevent-state-src-mq3-platform-unix-runtime-ml-582919877"></a>
### Sys_GetEvent

```ml
function Sys_GetEvent(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L132)

<a id="function-function-mq3-platform-unix-runtime-sys-getpacket-function-sys-getpacket-state-src-mq3-platform-unix-runtime-ml-2058464149"></a>
### Sys_GetPacket

```ml
function Sys_GetPacket(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L152)

<a id="function-function-mq3-platform-unix-runtime-sys-getprocessorid-function-sys-getprocessorid-state-src-mq3-platform-unix-runtime-ml-1447839965"></a>
### Sys_GetProcessorId

```ml
function Sys_GetProcessorId(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L171)

<a id="function-function-mq3-platform-unix-runtime-sys-in-restart-f-function-sys-in-restart-f-state-src-mq3-platform-unix-runtime-ml-154008417"></a>
### Sys_In_Restart_f

```ml
function Sys_In_Restart_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L114)

<a id="function-function-mq3-platform-unix-runtime-sys-init-function-sys-init-state-src-mq3-platform-unix-runtime-ml-1774883393"></a>
### Sys_Init

```ml
function Sys_Init(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L107)

<a id="function-function-mq3-platform-unix-runtime-sys-initstreamthread-function-sys-initstreamthread-state-src-mq3-platform-unix-runtime-ml-740446701"></a>
### Sys_InitStreamThread

```ml
function Sys_InitStreamThread(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L128)

<a id="function-function-mq3-platform-unix-runtime-sys-islanaddress-function-sys-islanaddress-address-src-mq3-platform-unix-runtime-ml-701267892"></a>
### Sys_IsLANAddress

```ml
function Sys_IsLANAddress(address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L150)

<a id="function-function-mq3-platform-unix-runtime-sys-listfiles-function-sys-listfiles-state-directory-extension-src-mq3-platform-unix-runtime-ml-895500407"></a>
### Sys_ListFiles

```ml
function Sys_ListFiles(state, directory, extension)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `directory` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L167)

<a id="function-function-mq3-platform-unix-runtime-sys-listfilteredfiles-function-sys-listfilteredfiles-state-directory-extension-filter-src-mq3-platform-unix-runtime-ml-1854960635"></a>
### Sys_ListFilteredFiles

```ml
function Sys_ListFilteredFiles(state, directory, extension, filter)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `directory` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |
| `filter` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L168)

<a id="function-function-mq3-platform-unix-runtime-sys-loaddll-function-sys-loaddll-state-name-src-mq3-platform-unix-runtime-ml-624168886"></a>
### Sys_LoadDll

```ml
function Sys_LoadDll(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L119)

<a id="function-function-mq3-platform-unix-runtime-sys-lowphysicalmemory-function-sys-lowphysicalmemory-state-src-mq3-platform-unix-runtime-ml-1640400637"></a>
### Sys_LowPhysicalMemory

```ml
function Sys_LowPhysicalMemory(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L110)

<a id="function-function-mq3-platform-unix-runtime-sys-milliseconds-function-sys-milliseconds-state-src-mq3-platform-unix-runtime-ml-1796632257"></a>
### Sys_Milliseconds

```ml
function Sys_Milliseconds(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L164)

<a id="function-function-mq3-platform-unix-runtime-sys-mkdir-function-sys-mkdir-state-path-src-mq3-platform-unix-runtime-ml-1499951668"></a>
### Sys_Mkdir

```ml
function Sys_Mkdir(state, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L166)

<a id="function-function-mq3-platform-unix-runtime-sys-monkeyshouldbespanked-function-sys-monkeyshouldbespanked-state-src-mq3-platform-unix-runtime-ml-2131039879"></a>
### Sys_MonkeyShouldBeSpanked

```ml
function Sys_MonkeyShouldBeSpanked(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L111)

<a id="function-function-mq3-platform-unix-runtime-sys-parseargs-function-sys-parseargs-state-args-src-mq3-platform-unix-runtime-ml-795763220"></a>
### Sys_ParseArgs

```ml
function Sys_ParseArgs(state, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L117)

<a id="function-function-mq3-platform-unix-runtime-sys-print-function-sys-print-state-text-src-mq3-platform-unix-runtime-ml-1407838760"></a>
### Sys_Print

```ml
function Sys_Print(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L101)

<a id="function-function-mq3-platform-unix-runtime-sys-printbinversion-function-sys-printbinversion-state-src-mq3-platform-unix-runtime-ml-1886615637"></a>
### Sys_PrintBinVersion

```ml
function Sys_PrintBinVersion(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L116)

<a id="function-function-mq3-platform-unix-runtime-sys-printf-function-sys-printf-state-text-src-mq3-platform-unix-runtime-ml-1091302602"></a>
### Sys_Printf

```ml
function Sys_Printf(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L102)

<a id="function-function-mq3-platform-unix-runtime-sys-processorcount-function-sys-processorcount-state-src-mq3-platform-unix-runtime-ml-296190513"></a>
### Sys_ProcessorCount

```ml
function Sys_ProcessorCount(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L163)

<a id="function-function-mq3-platform-unix-runtime-sys-queevent-function-sys-queevent-state-time-kind-value1-value2-src-mq3-platform-unix-runtime-ml-1373879547"></a>
### Sys_QueEvent

```ml
function Sys_QueEvent(state, time, kind, value1, value2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `value1` | `dynamic` | — |  |
| `value2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L131)

<a id="function-function-mq3-platform-unix-runtime-sys-quit-function-sys-quit-state-src-mq3-platform-unix-runtime-ml-1101858973"></a>
### Sys_Quit

```ml
function Sys_Quit(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L105)

<a id="function-function-mq3-platform-unix-runtime-sys-sendkeyevents-function-sys-sendkeyevents-state-src-mq3-platform-unix-runtime-ml-417121573"></a>
### Sys_SendKeyEvents

```ml
function Sys_SendKeyEvents(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L64)

<a id="function-function-mq3-platform-unix-runtime-sys-sendpacket-function-sys-sendpacket-state-length-data-address-src-mq3-platform-unix-runtime-ml-2037045007"></a>
### Sys_SendPacket

```ml
function Sys_SendPacket(state, length, data, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L151)

<a id="function-function-mq3-platform-unix-runtime-sys-setdefaultcdpath-function-sys-setdefaultcdpath-state-value-src-mq3-platform-unix-runtime-ml-1031467334"></a>
### Sys_SetDefaultCDPath

```ml
function Sys_SetDefaultCDPath(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L159)

<a id="function-function-mq3-platform-unix-runtime-sys-setdefaulthomepath-function-sys-setdefaulthomepath-state-value-src-mq3-platform-unix-runtime-ml-1701091450"></a>
### Sys_SetDefaultHomePath

```ml
function Sys_SetDefaultHomePath(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L160)

<a id="function-function-mq3-platform-unix-runtime-sys-setdefaultinstallpath-function-sys-setdefaultinstallpath-state-value-src-mq3-platform-unix-runtime-ml-555471684"></a>
### Sys_SetDefaultInstallPath

```ml
function Sys_SetDefaultInstallPath(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L161)

<a id="function-function-mq3-platform-unix-runtime-sys-showconsole-function-sys-showconsole-state-level-quitonclose-src-mq3-platform-unix-runtime-ml-448204113"></a>
### Sys_ShowConsole

```ml
function Sys_ShowConsole(state, level, quitOnClose)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `level` | `dynamic` | — |  |
| `quitOnClose` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L170)

<a id="function-function-mq3-platform-unix-runtime-sys-showip-function-sys-showip-state-src-mq3-platform-unix-runtime-ml-1673658965"></a>
### Sys_ShowIP

```ml
function Sys_ShowIP(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L153)

<a id="function-function-mq3-platform-unix-runtime-sys-shutdownstreamthread-function-sys-shutdownstreamthread-state-src-mq3-platform-unix-runtime-ml-450633433"></a>
### Sys_ShutdownStreamThread

```ml
function Sys_ShutdownStreamThread(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L129)

<a id="function-function-mq3-platform-unix-runtime-sys-snapvector-function-sys-snapvector-value-src-mq3-platform-unix-runtime-ml-270491777"></a>
### Sys_SnapVector

```ml
function Sys_SnapVector(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L172)

<a id="function-function-mq3-platform-unix-runtime-sys-streamedread-function-sys-streamedread-state-buffer-size-count-file-src-mq3-platform-unix-runtime-ml-96943447"></a>
### Sys_StreamedRead

```ml
function Sys_StreamedRead(state, buffer, size, count, file)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `file` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L126)

<a id="function-function-mq3-platform-unix-runtime-sys-streamseek-function-sys-streamseek-state-file-offset-origin-src-mq3-platform-unix-runtime-ml-1093845250"></a>
### Sys_StreamSeek

```ml
function Sys_StreamSeek(state, file, offset, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `file` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L127)

<a id="function-function-mq3-platform-unix-runtime-sys-streamthread-function-sys-streamthread-state-src-mq3-platform-unix-runtime-ml-1500489605"></a>
### Sys_StreamThread

```ml
function Sys_StreamThread(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L130)

<a id="function-function-mq3-platform-unix-runtime-sys-stringtoadr-function-sys-stringtoadr-text-src-mq3-platform-unix-runtime-ml-2107411553"></a>
### Sys_StringToAdr

```ml
function Sys_StringToAdr(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L139)

<a id="function-function-mq3-platform-unix-runtime-sys-stringtosockaddr-function-sys-stringtosockaddr-text-defaultport-src-mq3-platform-unix-runtime-ml-142573995"></a>
### Sys_StringToSockaddr

```ml
function Sys_StringToSockaddr(text, defaultPort)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `defaultPort` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L134)

<a id="function-function-mq3-platform-unix-runtime-sys-unloaddll-function-sys-unloaddll-state-handle-src-mq3-platform-unix-runtime-ml-2142462989"></a>
### Sys_UnloadDll

```ml
function Sys_UnloadDll(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L120)

<a id="function-function-mq3-platform-unix-runtime-sys-warn-function-sys-warn-state-text-src-mq3-platform-unix-runtime-ml-921067382"></a>
### Sys_Warn

```ml
function Sys_Warn(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L103)

<a id="function-function-mq3-platform-unix-runtime-sys-xtimetosystime-function-sys-xtimetosystime-state-time-src-mq3-platform-unix-runtime-ml-1407740988"></a>
### Sys_XTimeToSysTime

```ml
function Sys_XTimeToSysTime(state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L165)

<a id="function-function-mq3-platform-unix-runtime-tty-back-function-tty-back-state-src-mq3-platform-unix-runtime-ml-1264155065"></a>
### tty_Back

```ml
function tty_Back(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L94)

<a id="function-function-mq3-platform-unix-runtime-tty-flushin-function-tty-flushin-state-src-mq3-platform-unix-runtime-ml-2034239907"></a>
### tty_FlushIn

```ml
function tty_FlushIn(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L95)

<a id="function-function-mq3-platform-unix-runtime-tty-hide-function-tty-hide-state-src-mq3-platform-unix-runtime-ml-1757806533"></a>
### tty_Hide

```ml
function tty_Hide(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L96)

<a id="function-function-mq3-platform-unix-runtime-tty-show-function-tty-show-state-src-mq3-platform-unix-runtime-ml-2086826129"></a>
### tty_Show

```ml
function tty_Show(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L97)

<a id="function-function-mq3-platform-unix-runtime-uninstall-grabs-function-uninstall-grabs-state-src-mq3-platform-unix-runtime-ml-866473413"></a>
### uninstall_grabs

```ml
function uninstall_grabs(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L53)

<a id="function-function-mq3-platform-unix-runtime-unixglwsymbols-function-unixglwsymbols-src-mq3-platform-unix-runtime-ml-797116364"></a>
### unixGlwSymbols

```ml
function unixGlwSymbols()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L18)

<a id="function-function-mq3-platform-unix-runtime-unixmain-function-unixmain-state-framecount-framefn-context-src-mq3-platform-unix-runtime-ml-1667934653"></a>
### unixMain

```ml
function unixMain(state, frameCount, frameFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `frameCount` | `dynamic` | — |  |
| `frameFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L179)

<a id="function-function-mq3-platform-unix-runtime-unixmainsymbols-function-unixmainsymbols-src-mq3-platform-unix-runtime-ml-824741404"></a>
### unixMainSymbols

```ml
function unixMainSymbols()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L19)

<a id="function-function-mq3-platform-unix-runtime-unixnetsymbols-function-unixnetsymbols-src-mq3-platform-unix-runtime-ml-876182252"></a>
### unixNetSymbols

```ml
function unixNetSymbols()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L20)

<a id="function-function-mq3-platform-unix-runtime-unixsharedsymbols-function-unixsharedsymbols-src-mq3-platform-unix-runtime-ml-31313744"></a>
### unixSharedSymbols

```ml
function unixSharedSymbols()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L21)

<a id="function-function-mq3-platform-unix-runtime-unixvmx86symbols-function-unixvmx86symbols-src-mq3-platform-unix-runtime-ml-414680164"></a>
### unixVmX86Symbols

```ml
function unixVmX86Symbols()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L22)

<a id="function-function-mq3-platform-unix-runtime-vm-callcompiled-function-vm-callcompiled-compiled-args-src-mq3-platform-unix-runtime-ml-200912856"></a>
### VM_CallCompiled

```ml
function VM_CallCompiled(compiled, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `compiled` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L177)

<a id="function-function-mq3-platform-unix-runtime-vm-compile-function-vm-compile-image-callback-src-mq3-platform-unix-runtime-ml-603218990"></a>
### VM_Compile

```ml
function VM_Compile(image, callback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L176)

<a id="function-function-mq3-platform-unix-runtime-x11-pendinginput-function-x11-pendinginput-state-src-mq3-platform-unix-runtime-ml-1732292133"></a>
### X11_PendingInput

```ml
function X11_PendingInput(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L65)

<a id="function-function-mq3-platform-unix-runtime-xlatekey-function-xlatekey-state-key-src-mq3-platform-unix-runtime-ml-1785830688"></a>
### XLateKey

```ml
function XLateKey(state, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L66)
