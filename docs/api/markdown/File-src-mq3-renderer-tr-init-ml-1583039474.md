# `src/mq3/renderer/tr_init.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_init`](Package-mq3-renderer-tr-init-98503614.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/tr_public.ml` as `trPublic` → [src/mq3/renderer/tr_public.ml](File-src-mq3-renderer-tr-public-ml-911183383.md)

## Declarations

<a id="function-function-mq3-renderer-tr-init-action-function-action-state-boundary-kind-name-value-number-retailactive-src-mq3-renderer-tr-init-ml-1382374931"></a>
### action

```ml
function action(state, boundary, kind, name, value, number, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L17)

- [mq3.renderer.tr_init.Action](Type-mq3-renderer-tr-init-action-1714829674.md) — struct
<a id="function-function-mq3-renderer-tr-init-assertcvarrange-function-assertcvarrange-state-cv-minvalue-maxvalue-integral-retailactive-src-mq3-renderer-tr-init-ml-434167377"></a>
### assertCvarRange

```ml
function assertCvarRange(state, cv, minValue, maxValue, integral, retailActive)
```

AssertCvarRange

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cv` | `dynamic` | — |  |
| `minValue` | `dynamic` | — |  |
| `maxValue` | `dynamic` | — |  |
| `integral` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L23)

<a id="extern_function-extern-function-mq3-renderer-tr-init-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-renderer-tr-init-ml-210131682"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L19)

- [mq3.renderer.tr_init.Config](Type-mq3-renderer-tr-init-config-2068563774.md) — struct
<a id="function-function-mq3-renderer-tr-init-create-function-create-src-mq3-renderer-tr-init-ml-1682292170"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L16)

<a id="function-function-mq3-renderer-tr-init-cvar-function-cvar-name-value-flags-src-mq3-renderer-tr-init-ml-1406122867"></a>
### cvar

```ml
function cvar(name, value, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L18)

- [mq3.renderer.tr_init.Cvar](Type-mq3-renderer-tr-init-cvar-84215842.md) — struct
<a id="function-function-mq3-renderer-tr-init-cvarpairs-function-cvarpairs-src-mq3-renderer-tr-init-ml-1398337668"></a>
### cvarPairs

```ml
function cvarPairs()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L58)

<a id="function-function-mq3-renderer-tr-init-endregistration-function-endregistration-state-lowmemory-retailactive-src-mq3-renderer-tr-init-ml-687383031"></a>
### endRegistration

```ml
function endRegistration(state, lowMemory, retailActive)
```

RE_EndRegistration

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `lowMemory` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L66)

<a id="function-function-mq3-renderer-tr-init-findcvar-function-findcvar-state-name-src-mq3-renderer-tr-init-ml-1991401804"></a>
### findCvar

```ml
function findCvar(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L20)

<a id="function-function-mq3-renderer-tr-init-fourdigits-function-fourdigits-number-src-mq3-renderer-tr-init-ml-152215309"></a>
### fourDigits

```ml
function fourDigits(number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L42)

<a id="function-function-mq3-renderer-tr-init-getmodeinfo-function-getmodeinfo-mode-customwidth-customheight-customaspect-src-mq3-renderer-tr-init-ml-73809573"></a>
### getModeInfo

```ml
function getModeInfo(mode, customWidth, customHeight, customAspect)
```

R_GetModeInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `dynamic` | — |  |
| `customWidth` | `dynamic` | — |  |
| `customHeight` | `dynamic` | — |  |
| `customAspect` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L30)

<a id="function-function-mq3-renderer-tr-init-getrefapi-function-getrefapi-state-apiversion-retailactive-src-mq3-renderer-tr-init-ml-567462864"></a>
### getRefAPI

```ml
function getRefAPI(state, apiVersion, retailActive)
```

GetRefAPI

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `apiVersion` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L71)

<a id="function-function-mq3-renderer-tr-init-gfxinfo-function-gfxinfo-state-retailactive-src-mq3-renderer-tr-init-ml-969130648"></a>
### gfxInfo

```ml
function gfxInfo(state, retailActive)
```

GfxInfo_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L57)

<a id="function-function-mq3-renderer-tr-init-glcheckerrors-function-glcheckerrors-state-ignoreerrors-retailactive-src-mq3-renderer-tr-init-ml-1204588825"></a>
### glCheckErrors

```ml
function glCheckErrors(state, ignoreErrors, retailActive)
```

GL_CheckErrors

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ignoreErrors` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L27)

<a id="function-function-mq3-renderer-tr-init-glsetdefaultstate-function-glsetdefaultstate-state-retailactive-src-mq3-renderer-tr-init-ml-2121225896"></a>
### glSetDefaultState

```ml
function glSetDefaultState(state, retailActive)
```

GL_SetDefaultState

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L55)

<a id="function-function-mq3-renderer-tr-init-init-function-init-state-retailactive-src-mq3-renderer-tr-init-ml-170789482"></a>
### init

```ml
function init(state, retailActive)
```

R_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L62)

<a id="function-function-mq3-renderer-tr-init-initopengl-function-initopengl-state-retailactive-src-mq3-renderer-tr-init-ml-425344894"></a>
### initOpenGL

```ml
function initOpenGL(state, retailActive)
```

InitOpenGL

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L25)

<a id="function-function-mq3-renderer-tr-init-levelshot-function-levelshot-state-mapname-retailactive-src-mq3-renderer-tr-init-ml-1718230855"></a>
### levelShot

```ml
function levelShot(state, mapName, retailActive)
```

R_LevelShot

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L49)

- [mq3.renderer.tr_init.Mode](Type-mq3-renderer-tr-init-mode-1938199907.md) — struct
<a id="function-function-mq3-renderer-tr-init-modelist-function-modelist-state-retailactive-src-mq3-renderer-tr-init-ml-1854707354"></a>
### modeList

```ml
function modeList(state, retailActive)
```

R_ModeList_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L32)

<a id="function-function-mq3-renderer-tr-init-modes-function-modes-src-mq3-renderer-tr-init-ml-2081032950"></a>
### modes

```ml
function modes()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L28)

<a id="function-function-mq3-renderer-tr-init-nextscreenshot-function-nextscreenshot-state-jpeg-existing-src-mq3-renderer-tr-init-ml-1772491472"></a>
### nextScreenshot

```ml
function nextScreenshot(state, jpeg, existing)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `jpeg` | `dynamic` | — |  |
| `existing` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L47)

<a id="function-function-mq3-renderer-tr-init-rbtakescreenshot-function-rbtakescreenshot-state-x-y-width-height-name-retailactive-src-mq3-renderer-tr-init-ml-782640655"></a>
### rbTakeScreenshot

```ml
function rbTakeScreenshot(state, x, y, width, height, name, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L39)

<a id="function-function-mq3-renderer-tr-init-rbtakescreenshotjpeg-function-rbtakescreenshotjpeg-state-x-y-width-height-name-retailactive-src-mq3-renderer-tr-init-ml-2023939871"></a>
### rbTakeScreenshotJpeg

```ml
function rbTakeScreenshotJpeg(state, x, y, width, height, name, retailActive)
```

RB_TakeScreenshotJPEG

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L38)

<a id="constant-constant-mq3-renderer-tr-init-ref-api-version-const-ref-api-version-trpublic-ref-api-version-src-mq3-renderer-tr-init-ml-1244570913"></a>
### REF_API_VERSION

```ml
const REF_API_VERSION = trPublic.REF_API_VERSION
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L9)

<a id="function-function-mq3-renderer-tr-init-register-function-register-state-retailactive-src-mq3-renderer-tr-init-ml-804130258"></a>
### register

```ml
function register(state, retailActive)
```

R_Register

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L60)

<a id="function-function-mq3-renderer-tr-init-renderererror-function-renderererror-state-text-retailactive-src-mq3-renderer-tr-init-ml-441870525"></a>
### rendererError

```ml
function rendererError(state, text, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L69)

<a id="function-function-mq3-renderer-tr-init-rendererprint-function-rendererprint-state-text-retailactive-src-mq3-renderer-tr-init-ml-1199327379"></a>
### rendererPrint

```ml
function rendererPrint(state, text, retailActive)
```

Error-/Print-Grenzen

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L68)

<a id="function-function-mq3-renderer-tr-init-screenshot-function-screenshot-state-args-existing-retailactive-src-mq3-renderer-tr-init-ml-88907850"></a>
### screenShot

```ml
function screenShot(state, args, existing, retailActive)
```

R_ScreenShot_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |
| `existing` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L51)

<a id="function-function-mq3-renderer-tr-init-screenshotfilename-function-screenshotfilename-number-src-mq3-renderer-tr-init-ml-1408760617"></a>
### screenshotFilename

```ml
function screenshotFilename(number)
```

R_ScreenshotFilename

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L44)

<a id="function-function-mq3-renderer-tr-init-screenshotfilenamejpeg-function-screenshotfilenamejpeg-number-src-mq3-renderer-tr-init-ml-1600162389"></a>
### screenshotFilenameJpeg

```ml
function screenshotFilenameJpeg(number)
```

R_ScreenshotFilenameJPEG

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L46)

<a id="function-function-mq3-renderer-tr-init-screenshotjpeg-function-screenshotjpeg-state-args-existing-retailactive-src-mq3-renderer-tr-init-ml-1270151902"></a>
### screenShotJpeg

```ml
function screenShotJpeg(state, args, existing, retailActive)
```

R_ScreenShotJPEG_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |
| `existing` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L53)

<a id="function-function-mq3-renderer-tr-init-shutdown-function-shutdown-state-destroywindow-retailactive-src-mq3-renderer-tr-init-ml-1871029158"></a>
### shutdown

```ml
function shutdown(state, destroyWindow, retailActive)
```

RE_Shutdown

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `destroyWindow` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L64)

- [mq3.renderer.tr_init.State](Type-mq3-renderer-tr-init-state-1325716581.md) — struct
<a id="function-function-mq3-renderer-tr-init-takescreenshot-function-takescreenshot-state-x-y-width-height-name-jpeg-retailactive-src-mq3-renderer-tr-init-ml-1283934357"></a>
### takeScreenshot

```ml
function takeScreenshot(state, x, y, width, height, name, jpeg, retailActive)
```

R_TakeScreenshot

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `jpeg` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L41)

<a id="function-function-mq3-renderer-tr-init-takescreenshotcmd-function-takescreenshotcmd-state-x-y-width-height-name-jpeg-retailactive-src-mq3-renderer-tr-init-ml-354097027"></a>
### takeScreenshotCmd

```ml
function takeScreenshotCmd(state, x, y, width, height, name, jpeg, retailActive)
```

RB_TakeScreenshotCmd

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `jpeg` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L36)

<a id="function-function-mq3-renderer-tr-init-tga-function-tga-width-height-rgb-src-mq3-renderer-tr-init-ml-984178704"></a>
### tga

```ml
function tga(width, height, rgb)
```

tga

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `rgb` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L34)
