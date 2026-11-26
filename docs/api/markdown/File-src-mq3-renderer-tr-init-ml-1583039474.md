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

Updates `state.actions` in `mq3.renderer.tr_init.action`; returns `item`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.actions`. |
| `boundary` | `dynamic` | — | Value used for `mq3.renderer.tr_init.Action.boundary`. |
| `kind` | `dynamic` | — | Value used for `mq3.renderer.tr_init.Action.kind`. |
| `name` | `dynamic` | — | Value used for `mq3.renderer.tr_init.Action.name`. |
| `value` | `dynamic` | — | Value used for `mq3.renderer.tr_init.Action.value`. |
| `number` | `dynamic` | — | Value used for `mq3.renderer.tr_init.Action.number`. |
| `retailActive` | `dynamic` | — | Input used by `item=Action(boundary,kind,name,value,number,not retailActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L127)

- [mq3.renderer.tr_init.Action](Type-mq3-renderer-tr-init-action-1714829674.md) — struct
<a id="function-function-mq3-renderer-tr-init-assertcvarrange-function-assertcvarrange-state-cv-minvalue-maxvalue-integral-retailactive-src-mq3-renderer-tr-init-ml-434167377"></a>
### assertCvarRange

```ml
function assertCvarRange(state, cv, minValue, maxValue, integral, retailActive)
```

AssertCvarRange

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_init.action`. |
| `cv` | `dynamic` | — | Mutable record or buffer; this call updates `cv.value`, `cv.integer`. |
| `minValue` | `dynamic` | — | Value assigned to `cv.value`. |
| `maxValue` | `dynamic` | — | Value assigned to `cv.value`. |
| `integral` | `dynamic` | — | Input tested by `integral and toFloat(cv.integer)!=cv.value`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L149)

<a id="extern_function-extern-function-mq3-renderer-tr-init-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-renderer-tr-init-ml-210131682"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

Parses the leading decimal integer from a C string through the C runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — | NUL-terminated decimal text passed through the declared C-string binding. |


**Returns:** The parsed integer; zero when no decimal conversion is possible.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L136)

- [mq3.renderer.tr_init.Config](Type-mq3-renderer-tr-init-config-2068563774.md) — struct
<a id="function-function-mq3-renderer-tr-init-create-function-create-src-mq3-renderer-tr-init-ml-1682292170"></a>
### create

```ml
function create()
```

Constructs `mq3.renderer.tr_init.State` with `registered` = `false`, `cvars` = `[]`, `commands` = `[]`, `config` = `Config("","","","",0,0,0,0,0,0,0,0,false,false,0,false,false,0)` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L118)

<a id="function-function-mq3-renderer-tr-init-cvar-function-cvar-name-value-flags-src-mq3-renderer-tr-init-ml-1406122867"></a>
### cvar

```ml
function cvar(name, value, flags)
```

Constructs `mq3.renderer.tr_init.Cvar` with `integer` = `atoi(value)` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Initial value for `mq3.renderer.tr_init.Cvar.name`. |
| `value` | `dynamic` | — | Initial value for `mq3.renderer.tr_init.Cvar.value`. |
| `flags` | `dynamic` | — | Initial value for `mq3.renderer.tr_init.Cvar.flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L132)

- [mq3.renderer.tr_init.Cvar](Type-mq3-renderer-tr-init-cvar-84215842.md) — struct
<a id="function-function-mq3-renderer-tr-init-cvarpairs-function-cvarpairs-src-mq3-renderer-tr-init-ml-1398337668"></a>
### cvarPairs

```ml
function cvarPairs()
```

Builds the 21-element result for `mq3.renderer.tr_init.cvarPairs` from `["r_glDriver","opengl32"]`, `["r_allowExtensions","1"]`, `["r_picmip","1"]`, `["r_texturebits","0"]`, `["r_colorbits","0"]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L254)

<a id="function-function-mq3-renderer-tr-init-endregistration-function-endregistration-state-lowmemory-retailactive-src-mq3-renderer-tr-init-ml-687383031"></a>
### endRegistration

```ml
function endRegistration(state, lowMemory, retailActive)
```

RE_EndRegistration

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_init.action`. |
| `lowMemory` | `dynamic` | — | Input tested by `not lowMemory`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L272)

<a id="function-function-mq3-renderer-tr-init-findcvar-function-findcvar-state-name-src-mq3-renderer-tr-init-ml-1991401804"></a>
### findCvar

```ml
function findCvar(state, name)
```

Returns `void` from `mq3.renderer.tr_init.findCvar`; earlier branches return `cv`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.cvars`. |
| `name` | `dynamic` | — | Input used by `for each cv in state.cvars if cv.name==name then return cv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L140)

<a id="function-function-mq3-renderer-tr-init-fourdigits-function-fourdigits-number-src-mq3-renderer-tr-init-ml-152215309"></a>
### fourDigits

```ml
function fourDigits(number)
```

Returns `str(a)+str(b)+str(c)+str(d)` from `mq3.renderer.tr_init.fourDigits`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Input tested by `number<0 or number>9999`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L216)

<a id="function-function-mq3-renderer-tr-init-getmodeinfo-function-getmodeinfo-mode-customwidth-customheight-customaspect-src-mq3-renderer-tr-init-ml-73809573"></a>
### getModeInfo

```ml
function getModeInfo(mode, customWidth, customHeight, customAspect)
```

R_GetModeInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `dynamic` | — | Input tested by `mode==-1`. |
| `customWidth` | `dynamic` | — | Input tested by `mode==-1`. |
| `customHeight` | `dynamic` | — | Input tested by `mode==-1`. |
| `customAspect` | `dynamic` | — | Input tested by `mode==-1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L166)

<a id="function-function-mq3-renderer-tr-init-getrefapi-function-getrefapi-state-apiversion-retailactive-src-mq3-renderer-tr-init-ml-567462864"></a>
### getRefAPI

```ml
function getRefAPI(state, apiVersion, retailActive)
```

GetRefAPI

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.apiExports`. |
| `apiVersion` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.tr_public.compatible`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.rendererPrint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L287)

<a id="function-function-mq3-renderer-tr-init-gfxinfo-function-gfxinfo-state-retailactive-src-mq3-renderer-tr-init-ml-969130648"></a>
### gfxInfo

```ml
function gfxInfo(state, retailActive)
```

GfxInfo_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.config`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L252)

<a id="function-function-mq3-renderer-tr-init-glcheckerrors-function-glcheckerrors-state-ignoreerrors-retailactive-src-mq3-renderer-tr-init-ml-1204588825"></a>
### glCheckErrors

```ml
function glCheckErrors(state, ignoreErrors, retailActive)
```

GL_CheckErrors

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.glError`. |
| `ignoreErrors` | `dynamic` | — | Input tested by `state.glError==0 or ignoreErrors`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L158)

<a id="function-function-mq3-renderer-tr-init-glsetdefaultstate-function-glsetdefaultstate-state-retailactive-src-mq3-renderer-tr-init-ml-2121225896"></a>
### glSetDefaultState

```ml
function glSetDefaultState(state, retailActive)
```

GL_SetDefaultState

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.textureMode`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L248)

<a id="function-function-mq3-renderer-tr-init-init-function-init-state-retailactive-src-mq3-renderer-tr-init-ml-170789482"></a>
### init

```ml
function init(state, retailActive)
```

R_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.actions`, `state.registered`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L262)

<a id="function-function-mq3-renderer-tr-init-initopengl-function-initopengl-state-retailactive-src-mq3-renderer-tr-init-ml-425344894"></a>
### initOpenGL

```ml
function initOpenGL(state, retailActive)
```

InitOpenGL

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.config.maxTextureSize`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L153)

<a id="function-function-mq3-renderer-tr-init-levelshot-function-levelshot-state-mapname-retailactive-src-mq3-renderer-tr-init-ml-1718230855"></a>
### levelShot

```ml
function levelShot(state, mapName, retailActive)
```

R_LevelShot

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_init.action`. |
| `mapName` | `dynamic` | — | Input used by `name="levelshots/"+mapName+".tga"`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L232)

- [mq3.renderer.tr_init.Mode](Type-mq3-renderer-tr-init-mode-1938199907.md) — struct
<a id="function-function-mq3-renderer-tr-init-modelist-function-modelist-state-retailactive-src-mq3-renderer-tr-init-ml-1854707354"></a>
### modeList

```ml
function modeList(state, retailActive)
```

R_ModeList_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_init.action`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L170)

<a id="function-function-mq3-renderer-tr-init-modes-function-modes-src-mq3-renderer-tr-init-ml-2081032950"></a>
### modes

```ml
function modes()
```

Builds the 12-element result for `mq3.renderer.tr_init.modes` from `Mode("Mode 0: 320x240",320,240,1.0)`, `Mode("Mode 1: 400x300",400,300,1.0)`, `Mode("Mode 2: 512x384",512,384,1.0)`, `Mode("Mode 3: 640x480",640,480,1.0)`, `Mode("Mode 4: 800x600",800,600,1.0)`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L160)

<a id="function-function-mq3-renderer-tr-init-nextscreenshot-function-nextscreenshot-state-jpeg-existing-src-mq3-renderer-tr-init-ml-1772491472"></a>
### nextScreenshot

```ml
function nextScreenshot(state, jpeg, existing)
```

Updates `state.lastScreenshotJpeg`, `state.lastScreenshot` in `mq3.renderer.tr_init.nextScreenshot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.lastScreenshotJpeg`, `state.lastScreenshot`. |
| `jpeg` | `dynamic` | — | Input tested by `jpeg`. |
| `existing` | `dynamic` | — | Sequence traversed as `file` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L227)

<a id="function-function-mq3-renderer-tr-init-rbtakescreenshot-function-rbtakescreenshot-state-x-y-width-height-name-retailactive-src-mq3-renderer-tr-init-ml-782640655"></a>
### rbTakeScreenshot

```ml
function rbTakeScreenshot(state, x, y, width, height, name, retailActive)
```

Returns `name` from `mq3.renderer.tr_init.rbTakeScreenshot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_init.action`. |
| `x` | `dynamic` | — | Input used by `action(state,"gl","read-pixels-rgb",name,str(x)+","+str(y)+","+str(width)+","+str(height),24,retailActive)`. |
| `y` | `dynamic` | — | Input used by `action(state,"gl","read-pixels-rgb",name,str(x)+","+str(y)+","+str(width)+","+str(height),24,retailActive)`. |
| `width` | `dynamic` | — | Input used by `action(state,"gl","read-pixels-rgb",name,str(x)+","+str(y)+","+str(width)+","+str(height),24,retailActive)`. |
| `height` | `dynamic` | — | Input used by `action(state,"gl","read-pixels-rgb",name,str(x)+","+str(y)+","+str(width)+","+str(height),24,retailActive)`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.tr_init.action`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L203)

<a id="function-function-mq3-renderer-tr-init-rbtakescreenshotjpeg-function-rbtakescreenshotjpeg-state-x-y-width-height-name-retailactive-src-mq3-renderer-tr-init-ml-2023939871"></a>
### rbTakeScreenshotJpeg

```ml
function rbTakeScreenshotJpeg(state, x, y, width, height, name, retailActive)
```

RB_TakeScreenshotJPEG

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_init.action`. |
| `x` | `dynamic` | — | Input used by `action(state,"gl","read-pixels-rgba",name,str(x)+","+str(y)+","+str(width)+","+str(height),95,retailActive)`. |
| `y` | `dynamic` | — | Input used by `action(state,"gl","read-pixels-rgba",name,str(x)+","+str(y)+","+str(width)+","+str(height),95,retailActive)`. |
| `width` | `dynamic` | — | Input used by `action(state,"gl","read-pixels-rgba",name,str(x)+","+str(y)+","+str(width)+","+str(height),95,retailActive)`. |
| `height` | `dynamic` | — | Input used by `action(state,"gl","read-pixels-rgba",name,str(x)+","+str(y)+","+str(width)+","+str(height),95,retailActive)`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.tr_init.action`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L194)

<a id="constant-constant-mq3-renderer-tr-init-ref-api-version-const-ref-api-version-trpublic-ref-api-version-src-mq3-renderer-tr-init-ml-1244570913"></a>
### REF_API_VERSION

```ml
const REF_API_VERSION = trPublic.REF_API_VERSION
```

Renderer import/export ABI version expected by the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L10)

<a id="function-function-mq3-renderer-tr-init-register-function-register-state-retailactive-src-mq3-renderer-tr-init-ml-804130258"></a>
### register

```ml
function register(state, retailActive)
```

R_Register

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.cvars`, `state.commands`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L258)

<a id="function-function-mq3-renderer-tr-init-renderererror-function-renderererror-state-text-retailactive-src-mq3-renderer-tr-init-ml-441870525"></a>
### rendererError

```ml
function rendererError(state, text, retailActive)
```

Calls `mq3.renderer.tr_init.action` with `(state,"system","fatal-error","renderer",text,0,retailActive)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_init.action`. |
| `text` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.tr_init.action`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L282)

<a id="function-function-mq3-renderer-tr-init-rendererprint-function-rendererprint-state-text-retailactive-src-mq3-renderer-tr-init-ml-1199327379"></a>
### rendererPrint

```ml
function rendererPrint(state, text, retailActive)
```

Error-/Print-Grenzen

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_init.action`. |
| `text` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.tr_init.action`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L277)

<a id="function-function-mq3-renderer-tr-init-screenshot-function-screenshot-state-args-existing-retailactive-src-mq3-renderer-tr-init-ml-88907850"></a>
### screenShot

```ml
function screenShot(state, args, existing, retailActive)
```

R_ScreenShot_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.config`. |
| `args` | `dynamic` | — | Indexed input read at `1`. |
| `existing` | `dynamic` | — | Value forwarded as `existing` to `mq3.renderer.tr_init.nextScreenshot`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.levelShot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L238)

<a id="function-function-mq3-renderer-tr-init-screenshotfilename-function-screenshotfilename-number-src-mq3-renderer-tr-init-ml-1408760617"></a>
### screenshotFilename

```ml
function screenshotFilename(number)
```

R_ScreenshotFilename

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Value forwarded as `number` to `mq3.renderer.tr_init.fourDigits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L219)

<a id="function-function-mq3-renderer-tr-init-screenshotfilenamejpeg-function-screenshotfilenamejpeg-number-src-mq3-renderer-tr-init-ml-1600162389"></a>
### screenshotFilenameJpeg

```ml
function screenshotFilenameJpeg(number)
```

R_ScreenshotFilenameJPEG

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Value forwarded as `number` to `mq3.renderer.tr_init.fourDigits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L222)

<a id="function-function-mq3-renderer-tr-init-screenshotjpeg-function-screenshotjpeg-state-args-existing-retailactive-src-mq3-renderer-tr-init-ml-1270151902"></a>
### screenShotJpeg

```ml
function screenShotJpeg(state, args, existing, retailActive)
```

R_ScreenShotJPEG_f

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.config`. |
| `args` | `dynamic` | — | Indexed input read at `1`. |
| `existing` | `dynamic` | — | Value forwarded as `existing` to `mq3.renderer.tr_init.nextScreenshot`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.levelShot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L244)

<a id="function-function-mq3-renderer-tr-init-shutdown-function-shutdown-state-destroywindow-retailactive-src-mq3-renderer-tr-init-ml-1871029158"></a>
### shutdown

```ml
function shutdown(state, destroyWindow, retailActive)
```

RE_Shutdown

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.registered`. |
| `destroyWindow` | `dynamic` | — | Input tested by `destroyWindow`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L267)

- [mq3.renderer.tr_init.State](Type-mq3-renderer-tr-init-state-1325716581.md) — struct
<a id="function-function-mq3-renderer-tr-init-takescreenshot-function-takescreenshot-state-x-y-width-height-name-jpeg-retailactive-src-mq3-renderer-tr-init-ml-1283934357"></a>
### takeScreenshot

```ml
function takeScreenshot(state, x, y, width, height, name, jpeg, retailActive)
```

R_TakeScreenshot

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_init.action`. |
| `x` | `dynamic` | — | Input used by `action(state,"command-buffer","screenshot",name,str(x)+","+str(y)+","+str(width)+","+str(height),jpeg,retailActive)`. |
| `y` | `dynamic` | — | Input used by `action(state,"command-buffer","screenshot",name,str(x)+","+str(y)+","+str(width)+","+str(height),jpeg,retailActive)`. |
| `width` | `dynamic` | — | Input used by `action(state,"command-buffer","screenshot",name,str(x)+","+str(y)+","+str(width)+","+str(height),jpeg,retailActive)`. |
| `height` | `dynamic` | — | Input used by `action(state,"command-buffer","screenshot",name,str(x)+","+str(y)+","+str(width)+","+str(height),jpeg,retailActive)`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.tr_init.action`. |
| `jpeg` | `dynamic` | — | Value forwarded as `number` to `mq3.renderer.tr_init.action`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L213)

<a id="function-function-mq3-renderer-tr-init-takescreenshotcmd-function-takescreenshotcmd-state-x-y-width-height-name-jpeg-retailactive-src-mq3-renderer-tr-init-ml-354097027"></a>
### takeScreenshotCmd

```ml
function takeScreenshotCmd(state, x, y, width, height, name, jpeg, retailActive)
```

RB_TakeScreenshotCmd

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.tr_init.rbTakeScreenshotJpeg`. |
| `x` | `dynamic` | — | Value forwarded as `x` to `mq3.renderer.tr_init.rbTakeScreenshotJpeg`. |
| `y` | `dynamic` | — | Value forwarded as `y` to `mq3.renderer.tr_init.rbTakeScreenshotJpeg`. |
| `width` | `dynamic` | — | Value forwarded as `width` to `mq3.renderer.tr_init.rbTakeScreenshotJpeg`. |
| `height` | `dynamic` | — | Value forwarded as `height` to `mq3.renderer.tr_init.rbTakeScreenshotJpeg`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.tr_init.rbTakeScreenshotJpeg`. |
| `jpeg` | `dynamic` | — | Input tested by `jpeg`. |
| `retailActive` | `dynamic` | — | Value forwarded as `retailActive` to `mq3.renderer.tr_init.rbTakeScreenshotJpeg`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L185)

<a id="function-function-mq3-renderer-tr-init-tga-function-tga-width-height-rgb-src-mq3-renderer-tr-init-ml-984178704"></a>
### tga

```ml
function tga(width, height, rgb)
```

tga

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Input used by `header[12]=width&255`. |
| `height` | `dynamic` | — | Input used by `header[14]=height&255`. |
| `rgb` | `dynamic` | — | Indexed input read at `i+2`, `i+1`, `i`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_init.ml#L175)
