# `src/mq3/platform/win_glimp_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.win_glimp_runtime`](Package-mq3-platform-win-glimp-runtime-1084587334.md)

Reachable from entry: **no**

## Imports

- `mq3/platform/win_headers.ml` as `winHeaders` → [src/mq3/platform/win_headers.ml](File-src-mq3-platform-win-headers-ml-1370828404.md)
- `mq3/platform/win_qgl_runtime.ml` as `winQgl` → [src/mq3/platform/win_qgl_runtime.ml](File-src-mq3-platform-win-qgl-runtime-ml-1575058175.md)
- `mq3/renderer/qgl.ml` as `qgl` → [src/mq3/renderer/qgl.ml](File-src-mq3-renderer-qgl-ml-2071350969.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-platform-win-glimp-runtime-create-function-create-src-mq3-platform-win-glimp-runtime-ml-479911334"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L30)

- [mq3.platform.win_glimp_runtime.Extensions](Type-mq3-platform-win-glimp-runtime-extensions-306663490.md) — struct
<a id="function-function-mq3-platform-win-glimp-runtime-glimp-endframe-function-glimp-endframe-state-drawbuffer-src-mq3-platform-win-glimp-runtime-ml-1309183397"></a>
### GLimp_EndFrame

```ml
function GLimp_EndFrame(state, drawBuffer)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `drawBuffer` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L103)

<a id="function-function-mq3-platform-win-glimp-runtime-glimp-frontendsleep-function-glimp-frontendsleep-state-src-mq3-platform-win-glimp-runtime-ml-747004283"></a>
### GLimp_FrontEndSleep

```ml
function GLimp_FrontEndSleep(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L109)

<a id="function-function-mq3-platform-win-glimp-runtime-glimp-init-function-glimp-init-state-platform-major-driver-modes-mode-extensiontext-src-mq3-platform-win-glimp-runtime-ml-1879999656"></a>
### GLimp_Init

```ml
function GLimp_Init(state, platform, major, driver, modes, mode, extensionText)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `platform` | `dynamic` | — |  |
| `major` | `dynamic` | — |  |
| `driver` | `dynamic` | — |  |
| `modes` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `extensionText` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L99)

<a id="function-function-mq3-platform-win-glimp-runtime-glimp-logcomment-function-glimp-logcomment-state-comment-src-mq3-platform-win-glimp-runtime-ml-1388687776"></a>
### GLimp_LogComment

```ml
function GLimp_LogComment(state, comment)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `comment` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L105)

<a id="function-function-mq3-platform-win-glimp-runtime-glimp-renderersleep-function-glimp-renderersleep-state-src-mq3-platform-win-glimp-runtime-ml-1488759829"></a>
### GLimp_RendererSleep

```ml
function GLimp_RendererSleep(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L108)

<a id="function-function-mq3-platform-win-glimp-runtime-glimp-renderthreadwrapper-function-glimp-renderthreadwrapper-state-src-mq3-platform-win-glimp-runtime-ml-1125637871"></a>
### GLimp_RenderThreadWrapper

```ml
function GLimp_RenderThreadWrapper(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L106)

<a id="function-function-mq3-platform-win-glimp-runtime-glimp-shutdown-function-glimp-shutdown-state-src-mq3-platform-win-glimp-runtime-ml-1067440365"></a>
### GLimp_Shutdown

```ml
function GLimp_Shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L104)

<a id="function-function-mq3-platform-win-glimp-runtime-glimp-spawnrenderthread-function-glimp-spawnrenderthread-state-enabled-src-mq3-platform-win-glimp-runtime-ml-1852302926"></a>
### GLimp_SpawnRenderThread

```ml
function GLimp_SpawnRenderThread(state, enabled)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `enabled` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L107)

<a id="function-function-mq3-platform-win-glimp-runtime-glimp-wakerenderer-function-glimp-wakerenderer-state-data-src-mq3-platform-win-glimp-runtime-ml-128472505"></a>
### GLimp_WakeRenderer

```ml
function GLimp_WakeRenderer(state, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L110)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-checkosversion-function-glw-checkosversion-platform-major-src-mq3-platform-win-glimp-runtime-ml-467845882"></a>
### GLW_CheckOSVersion

```ml
function GLW_CheckOSVersion(platform, major)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `platform` | `dynamic` | — |  |
| `major` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L91)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-choosepfd-function-glw-choosepfd-candidates-desired-allowsoftware-src-mq3-platform-win-glimp-runtime-ml-898147470"></a>
### GLW_ChoosePFD

```ml
function GLW_ChoosePFD(candidates, desired, allowSoftware)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `candidates` | `dynamic` | — |  |
| `desired` | `dynamic` | — |  |
| `allowSoftware` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L42)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-createpfd-function-glw-createpfd-colorbits-depthbits-stencilbits-stereo-src-mq3-platform-win-glimp-runtime-ml-1755742956"></a>
### GLW_CreatePFD

```ml
function GLW_CreatePFD(colorbits, depthbits, stencilbits, stereo)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colorbits` | `dynamic` | — |  |
| `depthbits` | `dynamic` | — |  |
| `stencilbits` | `dynamic` | — |  |
| `stereo` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L33)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-createwindow-function-glw-createwindow-state-driver-width-height-colorbits-fullscreen-src-mq3-platform-win-glimp-runtime-ml-226654022"></a>
### GLW_CreateWindow

```ml
function GLW_CreateWindow(state, driver, width, height, colorbits, fullscreen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `driver` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `colorbits` | `dynamic` | — |  |
| `fullscreen` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L67)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-initdriver-function-glw-initdriver-state-driver-colorbits-depthbits-stencilbits-stereo-hostok-src-mq3-platform-win-glimp-runtime-ml-104548985"></a>
### GLW_InitDriver

```ml
function GLW_InitDriver(state, driver, colorbits, depthbits, stencilbits, stereo, hostOk)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `driver` | `dynamic` | — |  |
| `colorbits` | `dynamic` | — |  |
| `depthbits` | `dynamic` | — |  |
| `stencilbits` | `dynamic` | — |  |
| `stereo` | `dynamic` | — |  |
| `hostOk` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L62)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-initextensions-function-glw-initextensions-state-text-allowextensions-src-mq3-platform-win-glimp-runtime-ml-1415398701"></a>
### GLW_InitExtensions

```ml
function GLW_InitExtensions(state, text, allowExtensions)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `allowExtensions` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L83)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-loadopengl-function-glw-loadopengl-state-driver-loadsucceeded-modes-mode-colorbits-fullscreen-src-mq3-platform-win-glimp-runtime-ml-1785288667"></a>
### GLW_LoadOpenGL

```ml
function GLW_LoadOpenGL(state, driver, loadSucceeded, modes, mode, colorbits, fullscreen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `driver` | `dynamic` | — |  |
| `loadSucceeded` | `dynamic` | — |  |
| `modes` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `colorbits` | `dynamic` | — |  |
| `fullscreen` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L92)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-makecontext-function-glw-makecontext-state-pfd-choosesucceeded-setsucceeded-createsucceeded-makecurrentsucceeded-src-mq3-platform-win-glimp-runtime-ml-780480053"></a>
### GLW_MakeContext

```ml
function GLW_MakeContext(state, pfd, chooseSucceeded, setSucceeded, createSucceeded, makeCurrentSucceeded)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `pfd` | `dynamic` | — |  |
| `chooseSucceeded` | `dynamic` | — |  |
| `setSucceeded` | `dynamic` | — |  |
| `createSucceeded` | `dynamic` | — |  |
| `makeCurrentSucceeded` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L55)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-setmode-function-glw-setmode-state-driver-mode-colorbits-fullscreen-modes-displayaccepted-src-mq3-platform-win-glimp-runtime-ml-1916740021"></a>
### GLW_SetMode

```ml
function GLW_SetMode(state, driver, mode, colorbits, fullscreen, modes, displayAccepted)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `driver` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `colorbits` | `dynamic` | — |  |
| `fullscreen` | `dynamic` | — |  |
| `modes` | `dynamic` | — |  |
| `displayAccepted` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L75)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-startdriverandsetmode-function-glw-startdriverandsetmode-state-driver-mode-colorbits-fullscreen-modes-displayaccepted-src-mq3-platform-win-glimp-runtime-ml-1734195931"></a>
### GLW_StartDriverAndSetMode

```ml
function GLW_StartDriverAndSetMode(state, driver, mode, colorbits, fullscreen, modes, displayAccepted)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `driver` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `colorbits` | `dynamic` | — |  |
| `fullscreen` | `dynamic` | — |  |
| `modes` | `dynamic` | — |  |
| `displayAccepted` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L81)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-startopengl-function-glw-startopengl-state-driver-modes-mode-src-mq3-platform-win-glimp-runtime-ml-570450280"></a>
### GLW_StartOpenGL

```ml
function GLW_StartOpenGL(state, driver, modes, mode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `driver` | `dynamic` | — |  |
| `modes` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L98)

<a id="function-function-mq3-platform-win-glimp-runtime-hasextension-function-hasextension-text-name-src-mq3-platform-win-glimp-runtime-ml-536428202"></a>
### hasExtension

```ml
function hasExtension(text, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L82)

- [mq3.platform.win_glimp_runtime.Mode](Type-mq3-platform-win-glimp-runtime-mode-524687211.md) — struct
- [mq3.platform.win_glimp_runtime.PFD](Type-mq3-platform-win-glimp-runtime-pfd-111715386.md) — struct
<a id="constant-constant-mq3-platform-win-glimp-runtime-pfd-doublebuffer-const-pfd-doublebuffer-1-src-mq3-platform-win-glimp-runtime-ml-1262019352"></a>
### PFD_DOUBLEBUFFER

```ml
const PFD_DOUBLEBUFFER = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L18)

<a id="constant-constant-mq3-platform-win-glimp-runtime-pfd-draw-to-window-const-pfd-draw-to-window-4-src-mq3-platform-win-glimp-runtime-ml-1222760651"></a>
### PFD_DRAW_TO_WINDOW

```ml
const PFD_DRAW_TO_WINDOW = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L20)

<a id="constant-constant-mq3-platform-win-glimp-runtime-pfd-generic-format-const-pfd-generic-format-64-src-mq3-platform-win-glimp-runtime-ml-200095045"></a>
### PFD_GENERIC_FORMAT

```ml
const PFD_GENERIC_FORMAT = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L22)

<a id="constant-constant-mq3-platform-win-glimp-runtime-pfd-stereo-const-pfd-stereo-2-src-mq3-platform-win-glimp-runtime-ml-1450618003"></a>
### PFD_STEREO

```ml
const PFD_STEREO = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L19)

<a id="constant-constant-mq3-platform-win-glimp-runtime-pfd-support-opengl-const-pfd-support-opengl-32-src-mq3-platform-win-glimp-runtime-ml-390197742"></a>
### PFD_SUPPORT_OPENGL

```ml
const PFD_SUPPORT_OPENGL = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L21)

<a id="constant-constant-mq3-platform-win-glimp-runtime-pfd-type-rgba-const-pfd-type-rgba-0-src-mq3-platform-win-glimp-runtime-ml-994643549"></a>
### PFD_TYPE_RGBA

```ml
const PFD_TYPE_RGBA = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L23)

<a id="function-function-mq3-platform-win-glimp-runtime-pfdusable-function-pfdusable-value-desired-allowsoftware-src-mq3-platform-win-glimp-runtime-ml-14889091"></a>
### pfdUsable

```ml
function pfdUsable(value, desired, allowSoftware)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `desired` | `dynamic` | — |  |
| `allowSoftware` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L37)

<a id="function-function-mq3-platform-win-glimp-runtime-printcdserror-function-printcdserror-value-src-mq3-platform-win-glimp-runtime-ml-1161077183"></a>
### PrintCDSError

```ml
function PrintCDSError(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L71)

<a id="constant-constant-mq3-platform-win-glimp-runtime-rserr-invalid-fullscreen-const-rserr-invalid-fullscreen-1-src-mq3-platform-win-glimp-runtime-ml-147569856"></a>
### RSERR_INVALID_FULLSCREEN

```ml
const RSERR_INVALID_FULLSCREEN = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L12)

<a id="constant-constant-mq3-platform-win-glimp-runtime-rserr-invalid-mode-const-rserr-invalid-mode-2-src-mq3-platform-win-glimp-runtime-ml-2070144345"></a>
### RSERR_INVALID_MODE

```ml
const RSERR_INVALID_MODE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L13)

<a id="constant-constant-mq3-platform-win-glimp-runtime-rserr-ok-const-rserr-ok-0-src-mq3-platform-win-glimp-runtime-ml-1658772373"></a>
### RSERR_OK

```ml
const RSERR_OK = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L11)

<a id="constant-constant-mq3-platform-win-glimp-runtime-rserr-unknown-const-rserr-unknown-3-src-mq3-platform-win-glimp-runtime-ml-1361529200"></a>
### RSERR_UNKNOWN

```ml
const RSERR_UNKNOWN = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L14)

- [mq3.platform.win_glimp_runtime.Runtime](Type-mq3-platform-win-glimp-runtime-runtime-1470693324.md) — struct
<a id="constant-constant-mq3-platform-win-glimp-runtime-try-pfd-fail-hard-const-try-pfd-fail-hard-2-src-mq3-platform-win-glimp-runtime-ml-1811278703"></a>
### TRY_PFD_FAIL_HARD

```ml
const TRY_PFD_FAIL_HARD = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L17)

<a id="constant-constant-mq3-platform-win-glimp-runtime-try-pfd-fail-soft-const-try-pfd-fail-soft-1-src-mq3-platform-win-glimp-runtime-ml-2056490114"></a>
### TRY_PFD_FAIL_SOFT

```ml
const TRY_PFD_FAIL_SOFT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L16)

<a id="constant-constant-mq3-platform-win-glimp-runtime-try-pfd-success-const-try-pfd-success-0-src-mq3-platform-win-glimp-runtime-ml-1144451121"></a>
### TRY_PFD_SUCCESS

```ml
const TRY_PFD_SUCCESS = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L15)
