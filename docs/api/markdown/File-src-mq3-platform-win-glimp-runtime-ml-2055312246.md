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

Constructs `mq3.platform.win_glimp_runtime.Runtime` with `osSupported` = `true`, `driverLoaded` = `false`, `windowCreated` = `false`, `contextCreated` = `false` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L35)

- [mq3.platform.win_glimp_runtime.Extensions](Type-mq3-platform-win-glimp-runtime-extensions-306663490.md) — struct
<a id="function-function-mq3-platform-win-glimp-runtime-glimp-endframe-function-glimp-endframe-state-drawbuffer-src-mq3-platform-win-glimp-runtime-ml-1309183397"></a>
### GLimp_EndFrame

```ml
function GLimp_EndFrame(state, drawBuffer)
```

Updates `state.swaps` in `mq3.platform.win_glimp_runtime.GLimp_EndFrame`; returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.swaps`. |
| `drawBuffer` | `dynamic` | — | Input tested by `state.active and drawBuffer!="GL_FRONT"`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L195)

<a id="function-function-mq3-platform-win-glimp-runtime-glimp-frontendsleep-function-glimp-frontendsleep-state-src-mq3-platform-win-glimp-runtime-ml-747004283"></a>
### GLimp_FrontEndSleep

```ml
function GLimp_FrontEndSleep(state)
```

Computes `state.renderCompleted` for `mq3.platform.win_glimp_runtime.GLimp_FrontEndSleep`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.renderCompleted`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L215)

<a id="function-function-mq3-platform-win-glimp-runtime-glimp-init-function-glimp-init-state-platform-major-driver-modes-mode-extensiontext-src-mq3-platform-win-glimp-runtime-ml-1879999656"></a>
### GLimp_Init

```ml
function GLimp_Init(state, platform, major, driver, modes, mode, extensionText)
```

Updates `state.osSupported`, `state.active` in `mq3.platform.win_glimp_runtime.GLimp_Init`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.osSupported`, `state.active`. |
| `platform` | `dynamic` | — | Value forwarded as `platform` to `mq3.platform.win_glimp_runtime.GLW_CheckOSVersion`. |
| `major` | `dynamic` | — | Value forwarded as `major` to `mq3.platform.win_glimp_runtime.GLW_CheckOSVersion`. |
| `driver` | `dynamic` | — | Value forwarded as `driver` to `mq3.platform.win_glimp_runtime.GLW_StartOpenGL`. |
| `modes` | `dynamic` | — | Value forwarded as `modes` to `mq3.platform.win_glimp_runtime.GLW_StartOpenGL`. |
| `mode` | `dynamic` | — | Value forwarded as `mode` to `mq3.platform.win_glimp_runtime.GLW_StartOpenGL`. |
| `extensionText` | `dynamic` | — | Value forwarded as `text` to `mq3.platform.win_glimp_runtime.GLW_InitExtensions`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L188)

<a id="function-function-mq3-platform-win-glimp-runtime-glimp-logcomment-function-glimp-logcomment-state-comment-src-mq3-platform-win-glimp-runtime-ml-1388687776"></a>
### GLimp_LogComment

```ml
function GLimp_LogComment(state, comment)
```

Updates `state.logs` in `mq3.platform.win_glimp_runtime.GLimp_LogComment`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.logs`. |
| `comment` | `dynamic` | — | Input used by `state.logs=state.logs+[comment]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L202)

<a id="function-function-mq3-platform-win-glimp-runtime-glimp-renderersleep-function-glimp-renderersleep-state-src-mq3-platform-win-glimp-runtime-ml-1488759829"></a>
### GLimp_RendererSleep

```ml
function GLimp_RendererSleep(state)
```

Updates `state.renderCompleted`, `state.renderCommands` in `mq3.platform.win_glimp_runtime.GLimp_RendererSleep`; returns `command`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.renderCompleted`, `state.renderCommands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L212)

<a id="function-function-mq3-platform-win-glimp-runtime-glimp-renderthreadwrapper-function-glimp-renderthreadwrapper-state-src-mq3-platform-win-glimp-runtime-ml-1125637871"></a>
### GLimp_RenderThreadWrapper

```ml
function GLimp_RenderThreadWrapper(state)
```

Updates `state.renderCommands`, `state.renderCompleted` in `mq3.platform.win_glimp_runtime.GLimp_RenderThreadWrapper`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.renderCommands`, `state.renderCompleted`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L205)

<a id="function-function-mq3-platform-win-glimp-runtime-glimp-shutdown-function-glimp-shutdown-state-src-mq3-platform-win-glimp-runtime-ml-1067440365"></a>
### GLimp_Shutdown

```ml
function GLimp_Shutdown(state)
```

Updates `state.contextCreated`, `state.windowCreated`, `state.driverLoaded`, `state.active`, `state.displayChanged` in `mq3.platform.win_glimp_runtime.GLimp_Shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.contextCreated`, `state.windowCreated`, `state.driverLoaded`, `state.active`, `state.displayChanged`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L198)

<a id="function-function-mq3-platform-win-glimp-runtime-glimp-spawnrenderthread-function-glimp-spawnrenderthread-state-enabled-src-mq3-platform-win-glimp-runtime-ml-1852302926"></a>
### GLimp_SpawnRenderThread

```ml
function GLimp_SpawnRenderThread(state, enabled)
```

Updates `state.rendererThread`, `state.renderCompleted` in `mq3.platform.win_glimp_runtime.GLimp_SpawnRenderThread`; returns `enabled`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.rendererThread`, `state.renderCompleted`. |
| `enabled` | `dynamic` | — | Value assigned to `state.rendererThread`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L209)

<a id="function-function-mq3-platform-win-glimp-runtime-glimp-wakerenderer-function-glimp-wakerenderer-state-data-src-mq3-platform-win-glimp-runtime-ml-128472505"></a>
### GLimp_WakeRenderer

```ml
function GLimp_WakeRenderer(state, data)
```

Updates `state.renderCommands`, `state.renderCompleted` in `mq3.platform.win_glimp_runtime.GLimp_WakeRenderer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.renderCommands`, `state.renderCompleted`. |
| `data` | `dynamic` | — | Input used by `state.renderCommands=state.renderCommands+[data]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L219)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-checkosversion-function-glw-checkosversion-platform-major-src-mq3-platform-win-glimp-runtime-ml-467845882"></a>
### GLW_CheckOSVersion

```ml
function GLW_CheckOSVersion(platform, major)
```

Computes `platform==2 and major>=4` for `mq3.platform.win_glimp_runtime.GLW_CheckOSVersion`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `platform` | `dynamic` | — | Input used in the result expression `platform==2 and major>=4`. |
| `major` | `dynamic` | — | Input used in the result expression `platform==2 and major>=4`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L159)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-choosepfd-function-glw-choosepfd-candidates-desired-allowsoftware-src-mq3-platform-win-glimp-runtime-ml-898147470"></a>
### GLW_ChoosePFD

```ml
function GLW_ChoosePFD(candidates, desired, allowSoftware)
```

Computes `GLW_ChoosePFD` from `best.index` using `mq3.platform.win_glimp_runtime.pfdUsable`, `if`, `and`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `candidates` | `dynamic` | — | Sequence traversed as `value` while producing this result. |
| `desired` | `dynamic` | — | Record providing `desired.flags`, `desired.colorBits`, `desired.depthBits`, `desired.stencilBits`. |
| `allowSoftware` | `dynamic` | — | Value forwarded as `allowSoftware` to `mq3.platform.win_glimp_runtime.pfdUsable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L60)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-createpfd-function-glw-createpfd-colorbits-depthbits-stencilbits-stereo-src-mq3-platform-win-glimp-runtime-ml-1755742956"></a>
### GLW_CreatePFD

```ml
function GLW_CreatePFD(colorbits, depthbits, stencilbits, stereo)
```

Builds `mq3.platform.win_glimp_runtime.PFD` for `mq3.platform.win_glimp_runtime.GLW_CreatePFD`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colorbits` | `dynamic` | — | Initial value for `mq3.platform.win_glimp_runtime.PFD.colorBits`. |
| `depthbits` | `dynamic` | — | Initial value for `mq3.platform.win_glimp_runtime.PFD.depthBits`. |
| `stencilbits` | `dynamic` | — | Initial value for `mq3.platform.win_glimp_runtime.PFD.stencilBits`. |
| `stereo` | `dynamic` | — | Input tested by `stereo`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L43)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-createwindow-function-glw-createwindow-state-driver-width-height-colorbits-fullscreen-src-mq3-platform-win-glimp-runtime-ml-226654022"></a>
### GLW_CreateWindow

```ml
function GLW_CreateWindow(state, driver, width, height, colorbits, fullscreen)
```

Updates `state.windowCreated`, `state.fullscreen`, `state.mode.width`, `state.mode.height`, `state.mode.fullscreen` in `mq3.platform.win_glimp_runtime.GLW_CreateWindow`; returns `GLW_InitDriver(state,driver,colorbits,24,8,false,true)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.windowCreated`, `state.fullscreen`, `state.mode.width`, `state.mode.height`, `state.mode.fullscreen`. |
| `driver` | `dynamic` | — | Value forwarded as `driver` to `mq3.platform.win_glimp_runtime.GLW_InitDriver`. |
| `width` | `dynamic` | — | Value assigned to `state.mode.width`. |
| `height` | `dynamic` | — | Value assigned to `state.mode.height`. |
| `colorbits` | `dynamic` | — | Value forwarded as `colorbits` to `mq3.platform.win_glimp_runtime.GLW_InitDriver`. |
| `fullscreen` | `dynamic` | — | Value assigned to `state.fullscreen`, `state.mode.fullscreen`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L107)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-initdriver-function-glw-initdriver-state-driver-colorbits-depthbits-stencilbits-stereo-hostok-src-mq3-platform-win-glimp-runtime-ml-104548985"></a>
### GLW_InitDriver

```ml
function GLW_InitDriver(state, driver, colorbits, depthbits, stencilbits, stereo, hostOk)
```

Computes `GLW_InitDriver` from `result==TRY_PFD_SUCCESS` using `mq3.platform.win_glimp_runtime.GLW_CreatePFD`, `mq3.platform.win_glimp_runtime.GLW_MakeContext`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.platform.win_glimp_runtime.GLW_MakeContext`. |
| `driver` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `colorbits` | `dynamic` | — | Value forwarded as `colorbits` to `mq3.platform.win_glimp_runtime.GLW_CreatePFD`. |
| `depthbits` | `dynamic` | — | Value forwarded as `depthbits` to `mq3.platform.win_glimp_runtime.GLW_CreatePFD`. |
| `stencilbits` | `dynamic` | — | Value forwarded as `stencilbits` to `mq3.platform.win_glimp_runtime.GLW_CreatePFD`. |
| `stereo` | `dynamic` | — | Value forwarded as `stereo` to `mq3.platform.win_glimp_runtime.GLW_CreatePFD`. |
| `hostOk` | `dynamic` | — | Input tested by `not hostOk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L95)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-initextensions-function-glw-initextensions-state-text-allowextensions-src-mq3-platform-win-glimp-runtime-ml-1415398701"></a>
### GLW_InitExtensions

```ml
function GLW_InitExtensions(state, text, allowExtensions)
```

Updates `state.extensionText`, `state.extensions.textureCompression`, `state.extensions.textureEnvAdd`, `state.extensions.multitexture`, `state.extensions.compiledVertexArray` in `mq3.platform.win_glimp_runtime.GLW_InitExtensions`; returns `state.extensions`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.extensionText`, `state.extensions.textureCompression`, `state.extensions.textureEnvAdd`, `state.extensions.multitexture`, `state.extensions.compiledVertexArray`. |
| `text` | `dynamic` | — | Value assigned to `state.extensionText`. |
| `allowExtensions` | `dynamic` | — | Input tested by `not allowExtensions`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L148)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-loadopengl-function-glw-loadopengl-state-driver-loadsucceeded-modes-mode-colorbits-fullscreen-src-mq3-platform-win-glimp-runtime-ml-1785288667"></a>
### GLW_LoadOpenGL

```ml
function GLW_LoadOpenGL(state, driver, loadSucceeded, modes, mode, colorbits, fullscreen)
```

Updates `state.driverLoaded`, `state.glwState.hinstOpenGL` in `mq3.platform.win_glimp_runtime.GLW_LoadOpenGL`; returns `GLW_StartDriverAndSetMode(state,driver,mode,colorbits,fullscreen,modes,true)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.driverLoaded`, `state.glwState.hinstOpenGL`. |
| `driver` | `dynamic` | — | Value assigned to `state.glwState.hinstOpenGL`. |
| `loadSucceeded` | `dynamic` | — | Value assigned to `state.driverLoaded`. |
| `modes` | `dynamic` | — | Value forwarded as `modes` to `mq3.platform.win_glimp_runtime.GLW_StartDriverAndSetMode`. |
| `mode` | `dynamic` | — | Value forwarded as `mode` to `mq3.platform.win_glimp_runtime.GLW_StartDriverAndSetMode`. |
| `colorbits` | `dynamic` | — | Value forwarded as `colorbits` to `mq3.platform.win_glimp_runtime.GLW_StartDriverAndSetMode`. |
| `fullscreen` | `dynamic` | — | Value forwarded as `fullscreen` to `mq3.platform.win_glimp_runtime.GLW_StartDriverAndSetMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L168)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-makecontext-function-glw-makecontext-state-pfd-choosesucceeded-setsucceeded-createsucceeded-makecurrentsucceeded-src-mq3-platform-win-glimp-runtime-ml-780480053"></a>
### GLW_MakeContext

```ml
function GLW_MakeContext(state, pfd, chooseSucceeded, setSucceeded, createSucceeded, makeCurrentSucceeded)
```

Updates `state.pfd`, `state.contextCreated` in `mq3.platform.win_glimp_runtime.GLW_MakeContext`; returns `TRY_PFD_SUCCESS`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.pfd`, `state.contextCreated`. |
| `pfd` | `dynamic` | — | Value assigned to `state.pfd`. |
| `chooseSucceeded` | `dynamic` | — | Input tested by `not chooseSucceeded`. |
| `setSucceeded` | `dynamic` | — | Input tested by `not setSucceeded`. |
| `createSucceeded` | `dynamic` | — | Input tested by `not createSucceeded`. |
| `makeCurrentSucceeded` | `dynamic` | — | Input tested by `not makeCurrentSucceeded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L80)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-setmode-function-glw-setmode-state-driver-mode-colorbits-fullscreen-modes-displayaccepted-src-mq3-platform-win-glimp-runtime-ml-1916740021"></a>
### GLW_SetMode

```ml
function GLW_SetMode(state, driver, mode, colorbits, fullscreen, modes, displayAccepted)
```

Updates `state.mode`, `state.displayChanged` in `mq3.platform.win_glimp_runtime.GLW_SetMode`; returns `RSERR_OK`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.mode`, `state.displayChanged`. |
| `driver` | `dynamic` | — | Value forwarded as `driver` to `mq3.platform.win_glimp_runtime.GLW_CreateWindow`. |
| `mode` | `dynamic` | — | Input tested by `mode<0 or mode>=len(modes)`. |
| `colorbits` | `dynamic` | — | Value forwarded as `colorbits` to `mq3.platform.win_glimp_runtime.GLW_CreateWindow`. |
| `fullscreen` | `dynamic` | — | Value assigned to `state.displayChanged`. |
| `modes` | `dynamic` | — | Indexed input read at `mode`. |
| `displayAccepted` | `dynamic` | — | Input tested by `fullscreen and not displayAccepted`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L125)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-startdriverandsetmode-function-glw-startdriverandsetmode-state-driver-mode-colorbits-fullscreen-modes-displayaccepted-src-mq3-platform-win-glimp-runtime-ml-1734195931"></a>
### GLW_StartDriverAndSetMode

```ml
function GLW_StartDriverAndSetMode(state, driver, mode, colorbits, fullscreen, modes, displayAccepted)
```

Computes `GLW_SetMode(state,driver,mode,colorbits,fullscreen,modes,displayAccepted)==RSERR_OK` for `mq3.platform.win_glimp_runtime.GLW_StartDriverAndSetMode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.platform.win_glimp_runtime.GLW_SetMode`. |
| `driver` | `dynamic` | — | Value forwarded as `driver` to `mq3.platform.win_glimp_runtime.GLW_SetMode`. |
| `mode` | `dynamic` | — | Value forwarded as `mode` to `mq3.platform.win_glimp_runtime.GLW_SetMode`. |
| `colorbits` | `dynamic` | — | Value forwarded as `colorbits` to `mq3.platform.win_glimp_runtime.GLW_SetMode`. |
| `fullscreen` | `dynamic` | — | Value forwarded as `fullscreen` to `mq3.platform.win_glimp_runtime.GLW_SetMode`. |
| `modes` | `dynamic` | — | Value forwarded as `modes` to `mq3.platform.win_glimp_runtime.GLW_SetMode`. |
| `displayAccepted` | `dynamic` | — | Value forwarded as `displayAccepted` to `mq3.platform.win_glimp_runtime.GLW_SetMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L139)

<a id="function-function-mq3-platform-win-glimp-runtime-glw-startopengl-function-glw-startopengl-state-driver-modes-mode-src-mq3-platform-win-glimp-runtime-ml-570450280"></a>
### GLW_StartOpenGL

```ml
function GLW_StartOpenGL(state, driver, modes, mode)
```

Calls `mq3.platform.win_glimp_runtime.GLW_LoadOpenGL` with `(state,driver,true,modes,mode,24,false)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.platform.win_glimp_runtime.GLW_LoadOpenGL`. |
| `driver` | `dynamic` | — | Value forwarded as `driver` to `mq3.platform.win_glimp_runtime.GLW_LoadOpenGL`. |
| `modes` | `dynamic` | — | Value forwarded as `modes` to `mq3.platform.win_glimp_runtime.GLW_LoadOpenGL`. |
| `mode` | `dynamic` | — | Value forwarded as `mode` to `mq3.platform.win_glimp_runtime.GLW_LoadOpenGL`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L179)

<a id="function-function-mq3-platform-win-glimp-runtime-hasextension-function-hasextension-text-name-src-mq3-platform-win-glimp-runtime-ml-536428202"></a>
### hasExtension

```ml
function hasExtension(text, name)
```

Returns `strings.contains(padded," "+name+" ")` from `mq3.platform.win_glimp_runtime.hasExtension`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Input used by `padded=" "+text+" "`. |
| `name` | `dynamic` | — | Input used in the result expression `strings.contains(padded," "+name+" ")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L143)

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

Checks pixel type, required flags, depth/stencil precision, and software-renderer policy for a pixel-format candidate.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.flags`, `value.pixelType`, `value.depthBits`, `value.stencilBits`. |
| `desired` | `dynamic` | — | Record providing `desired.flags`, `desired.stencilBits`. |
| `allowSoftware` | `dynamic` | — | Input tested by `not allowSoftware and (value.flags&PFD_GENERIC_FORMAT)!=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L51)

<a id="function-function-mq3-platform-win-glimp-runtime-printcdserror-function-printcdserror-value-src-mq3-platform-win-glimp-runtime-ml-1161077183"></a>
### PrintCDSError

```ml
function PrintCDSError(value)
```

Computes `PrintCDSError` from `"unknown error"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input tested by `value==0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_glimp_runtime.ml#L113)

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
