# `src/mq3/platform/macosx_headers.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.macosx_headers`](Package-mq3-platform-macosx-headers-1993423411.md)

Reachable from entry: **no**

## Imports

- `mq3/renderer/qgl_linked.ml` as `linked` → [src/mq3/renderer/qgl_linked.ml](File-src-mq3-renderer-qgl-linked-ml-651241425.md)

## Declarations

<a id="function-function-mq3-platform-macosx-headers-glgeterror-function-glgeterror-state-src-mq3-platform-macosx-headers-ml-1716048909"></a>
### _glGetError

```ml
function _glGetError(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L93)

<a id="function-function-mq3-platform-macosx-headers-cgfix-getlastmousedelta-function-cgfix-getlastmousedelta-state-src-mq3-platform-macosx-headers-ml-2133358787"></a>
### CGFix_GetLastMouseDelta

```ml
function CGFix_GetLastMouseDelta(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L39)

<a id="function-function-mq3-platform-macosx-headers-cgfix-initialize-function-cgfix-initialize-state-src-mq3-platform-macosx-headers-ml-1539498593"></a>
### CGFix_Initialize

```ml
function CGFix_Initialize(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L37)

<a id="function-function-mq3-platform-macosx-headers-cgfix-recordmousedelta-function-cgfix-recordmousedelta-state-dx-dy-src-mq3-platform-macosx-headers-ml-1377914794"></a>
### CGFix_RecordMouseDelta

```ml
function CGFix_RecordMouseDelta(state, dx, dy)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `dx` | `dynamic` | — |  |
| `dy` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L38)

<a id="function-function-mq3-platform-macosx-headers-cgsnotify-function-cgsnotify-state-type-data-datalength-argument-src-mq3-platform-macosx-headers-ml-1681154302"></a>
### CGSNotify

```ml
function CGSNotify(state, type, data, dataLength, argument)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `dataLength` | `dynamic` | — |  |
| `argument` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L41)

<a id="function-function-mq3-platform-macosx-headers-contains-function-contains-values-needle-src-mq3-platform-macosx-headers-ml-641182199"></a>
### contains

```ml
function contains(values, needle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `needle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L84)

<a id="function-function-mq3-platform-macosx-headers-controllersymbols-function-controllersymbols-src-mq3-platform-macosx-headers-ml-972793292"></a>
### controllerSymbols

```ml
function controllerSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L10)

<a id="function-function-mq3-platform-macosx-headers-create-function-create-src-mq3-platform-macosx-headers-ml-741607102"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L33)

<a id="function-function-mq3-platform-macosx-headers-displaysymbols-function-displaysymbols-src-mq3-platform-macosx-headers-ml-1123919766"></a>
### displaySymbols

```ml
function displaySymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L11)

- [mq3.platform.macosx_headers.Event](Type-mq3-platform-macosx-headers-event-2116399717.md) — struct
<a id="function-function-mq3-platform-macosx-headers-eventrecord-function-eventrecord-type-time-location-flags-data-src-mq3-platform-macosx-headers-ml-1373800055"></a>
### eventRecord

```ml
function eventRecord(type, time, location, flags, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `location` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L42)

- [mq3.platform.macosx_headers.GammaTable](Type-mq3-platform-macosx-headers-gammatable-1261009872.md) — struct
<a id="function-function-mq3-platform-macosx-headers-glimpheadersymbols-function-glimpheadersymbols-src-mq3-platform-macosx-headers-ml-2034023074"></a>
### glimpHeaderSymbols

```ml
function glimpHeaderSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L12)

<a id="function-function-mq3-platform-macosx-headers-glstamp-function-glstamp-state-name-data-src-mq3-platform-macosx-headers-ml-472525854"></a>
### GLSTAMP

```ml
function GLSTAMP(state, name, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L99)

<a id="function-function-mq3-platform-macosx-headers-initializetimers-function-initializetimers-state-src-mq3-platform-macosx-headers-ml-799151169"></a>
### InitializeTimers

```ml
function InitializeTimers(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L96)

<a id="constant-constant-mq3-platform-macosx-headers-kcgseventnotificationleftmousedragged-const-kcgseventnotificationleftmousedragged-716-src-mq3-platform-macosx-headers-ml-1606502191"></a>
### kCGSEventNotificationLeftMouseDragged

```ml
const kCGSEventNotificationLeftMouseDragged = 716
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L25)

<a id="constant-constant-mq3-platform-macosx-headers-kcgseventnotificationmousemoved-const-kcgseventnotificationmousemoved-715-src-mq3-platform-macosx-headers-ml-1693275036"></a>
### kCGSEventNotificationMouseMoved

```ml
const kCGSEventNotificationMouseMoved = 715
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L24)

<a id="constant-constant-mq3-platform-macosx-headers-kcgseventnotificationothermousedragged-const-kcgseventnotificationothermousedragged-737-src-mq3-platform-macosx-headers-ml-2098446122"></a>
### kCGSEventNotificationOtherMouseDragged

```ml
const kCGSEventNotificationOtherMouseDragged = 737
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L27)

<a id="constant-constant-mq3-platform-macosx-headers-kcgseventnotificationrightmousedragged-const-kcgseventnotificationrightmousedragged-717-src-mq3-platform-macosx-headers-ml-1151261120"></a>
### kCGSEventNotificationRightMouseDragged

```ml
const kCGSEventNotificationRightMouseDragged = 717
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L26)

<a id="function-function-mq3-platform-macosx-headers-localsymbols-function-localsymbols-src-mq3-platform-macosx-headers-ml-2090440518"></a>
### localSymbols

```ml
function localSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L13)

<a id="function-function-mq3-platform-macosx-headers-mousedeltasymbols-function-mousedeltasymbols-src-mq3-platform-macosx-headers-ml-2071444170"></a>
### mouseDeltaSymbols

```ml
function mouseDeltaSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L8)

<a id="function-function-mq3-platform-macosx-headers-osx-getcglcontext-function-osx-getcglcontext-state-src-mq3-platform-macosx-headers-ml-1503586221"></a>
### OSX_GetCGLContext

```ml
function OSX_GetCGLContext(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L77)

<a id="function-function-mq3-platform-macosx-headers-osx-getnsglcontext-function-osx-getnsglcontext-state-src-mq3-platform-macosx-headers-ml-344148089"></a>
### OSX_GetNSGLContext

```ml
function OSX_GetNSGLContext(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L76)

<a id="function-function-mq3-platform-macosx-headers-osx-glcontextclearcurrent-function-osx-glcontextclearcurrent-state-src-mq3-platform-macosx-headers-ml-1403769231"></a>
### OSX_GLContextClearCurrent

```ml
function OSX_GLContextClearCurrent(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L80)

<a id="function-function-mq3-platform-macosx-headers-osx-glcontextiscurrent-function-osx-glcontextiscurrent-state-src-mq3-platform-macosx-headers-ml-795709337"></a>
### OSX_GLContextIsCurrent

```ml
function OSX_GLContextIsCurrent(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L78)

<a id="function-function-mq3-platform-macosx-headers-osx-glcontextsetcurrent-function-osx-glcontextsetcurrent-state-src-mq3-platform-macosx-headers-ml-1738413397"></a>
### OSX_GLContextSetCurrent

```ml
function OSX_GLContextSetCurrent(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L79)

<a id="function-function-mq3-platform-macosx-headers-osx-setglcontext-function-osx-setglcontext-state-context-cglcontext-src-mq3-platform-macosx-headers-ml-2131557047"></a>
### OSX_SetGLContext

```ml
function OSX_SetGLContext(state, context, cglContext)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `cglContext` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L75)

<a id="function-function-mq3-platform-macosx-headers-otstart-function-otstart-state-node-src-mq3-platform-macosx-headers-ml-930298983"></a>
### OTSTART

```ml
function OTSTART(state, node)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `node` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L97)

<a id="function-function-mq3-platform-macosx-headers-otstop-function-otstop-state-src-mq3-platform-macosx-headers-ml-27814621"></a>
### OTSTOP

```ml
function OTSTOP(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L98)

<a id="function-function-mq3-platform-macosx-headers-paste-function-paste-state-text-src-mq3-platform-macosx-headers-ml-1579863156"></a>
### paste

```ml
function paste(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L44)

<a id="function-function-mq3-platform-macosx-headers-privateapisymbols-function-privateapisymbols-src-mq3-platform-macosx-headers-ml-1259983818"></a>
### privateApiSymbols

```ml
function privateApiSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L9)

<a id="function-function-mq3-platform-macosx-headers-qglcall-function-qglcall-state-name-arguments-src-mq3-platform-macosx-headers-ml-2028582964"></a>
### qglCall

```ml
function qglCall(state, name, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L85)

<a id="function-function-mq3-platform-macosx-headers-qglcheckerror-function-qglcheckerror-state-message-src-mq3-platform-macosx-headers-ml-1534191334"></a>
### QGLCheckError

```ml
function QGLCheckError(state, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L94)

<a id="function-function-mq3-platform-macosx-headers-qglraiseerror-function-qglraiseerror-state-code-src-mq3-platform-macosx-headers-ml-832272872"></a>
### QGLRaiseError

```ml
function QGLRaiseError(state, code)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `code` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L92)

<a id="function-function-mq3-platform-macosx-headers-qglsymbols-function-qglsymbols-src-mq3-platform-macosx-headers-ml-687951702"></a>
### qglSymbols

```ml
function qglSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L14)

<a id="function-function-mq3-platform-macosx-headers-quakemain-function-quakemain-state-frames-src-mq3-platform-macosx-headers-ml-138026059"></a>
### quakeMain

```ml
function quakeMain(state, frames)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `frames` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L47)

<a id="function-function-mq3-platform-macosx-headers-requestterminate-function-requestterminate-state-src-mq3-platform-macosx-headers-ml-681648705"></a>
### requestTerminate

```ml
function requestTerminate(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L45)

<a id="function-function-mq3-platform-macosx-headers-showbanner-function-showbanner-state-src-mq3-platform-macosx-headers-ml-733296633"></a>
### showBanner

```ml
function showBanner(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L46)

- [mq3.platform.macosx_headers.State](Type-mq3-platform-macosx-headers-state-87376264.md) — struct
<a id="function-function-mq3-platform-macosx-headers-sys-annoyingbanner-function-sys-annoyingbanner-state-src-mq3-platform-macosx-headers-ml-1023207065"></a>
### Sys_AnnoyingBanner

```ml
function Sys_AnnoyingBanner(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L71)

<a id="function-function-mq3-platform-macosx-headers-sys-displaytouse-function-sys-displaytouse-state-src-mq3-platform-macosx-headers-ml-2013571817"></a>
### Sys_DisplayToUse

```ml
function Sys_DisplayToUse(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L69)

<a id="function-function-mq3-platform-macosx-headers-sys-fadescreen-function-sys-fadescreen-state-display-src-mq3-platform-macosx-headers-ml-305188603"></a>
### Sys_FadeScreen

```ml
function Sys_FadeScreen(state, display)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `display` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L60)

<a id="function-function-mq3-platform-macosx-headers-sys-fadescreens-function-sys-fadescreens-state-src-mq3-platform-macosx-headers-ml-427469887"></a>
### Sys_FadeScreens

```ml
function Sys_FadeScreens(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L61)

<a id="function-function-mq3-platform-macosx-headers-sys-getgammatable-function-sys-getgammatable-state-display-src-mq3-platform-macosx-headers-ml-1312701945"></a>
### Sys_GetGammaTable

```ml
function Sys_GetGammaTable(state, display)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `display` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L58)

<a id="function-function-mq3-platform-macosx-headers-sys-getmatchingdisplaymode-function-sys-getmatchingdisplaymode-state-allowstretchedmodes-src-mq3-platform-macosx-headers-ml-2115360264"></a>
### Sys_GetMatchingDisplayMode

```ml
function Sys_GetMatchingDisplayMode(state, allowStretchedModes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `allowStretchedModes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L49)

<a id="function-function-mq3-platform-macosx-headers-sys-hide-function-sys-hide-state-src-mq3-platform-macosx-headers-ml-1659715789"></a>
### Sys_Hide

```ml
function Sys_Hide(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L73)

<a id="function-function-mq3-platform-macosx-headers-sys-initinput-function-sys-initinput-state-src-mq3-platform-macosx-headers-ml-19191437"></a>
### Sys_InitInput

```ml
function Sys_InitInput(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L66)

<a id="function-function-mq3-platform-macosx-headers-sys-ishidden-function-sys-ishidden-state-src-mq3-platform-macosx-headers-ml-744627245"></a>
### Sys_IsHidden

```ml
function Sys_IsHidden(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L72)

<a id="function-function-mq3-platform-macosx-headers-sys-pausegl-function-sys-pausegl-state-src-mq3-platform-macosx-headers-ml-1111914823"></a>
### Sys_PauseGL

```ml
function Sys_PauseGL(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L81)

<a id="function-function-mq3-platform-macosx-headers-sys-queevent-function-sys-queevent-state-time-kind-value1-value2-payload-src-mq3-platform-macosx-headers-ml-1179938985"></a>
### Sys_QueEvent

```ml
function Sys_QueEvent(state, time, kind, value1, value2, payload)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `value1` | `dynamic` | — |  |
| `value2` | `dynamic` | — |  |
| `payload` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L70)

<a id="function-function-mq3-platform-macosx-headers-sys-releasealldisplays-function-sys-releasealldisplays-state-src-mq3-platform-macosx-headers-ml-1239127109"></a>
### Sys_ReleaseAllDisplays

```ml
function Sys_ReleaseAllDisplays(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L64)

<a id="function-function-mq3-platform-macosx-headers-sys-resumegl-function-sys-resumegl-state-src-mq3-platform-macosx-headers-ml-1501534349"></a>
### Sys_ResumeGL

```ml
function Sys_ResumeGL(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L82)

<a id="function-function-mq3-platform-macosx-headers-sys-setmouseinputrect-function-sys-setmouseinputrect-state-rect-src-mq3-platform-macosx-headers-ml-944839509"></a>
### Sys_SetMouseInputRect

```ml
function Sys_SetMouseInputRect(state, rect)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L68)

<a id="function-function-mq3-platform-macosx-headers-sys-setscreenfade-function-sys-setscreenfade-state-table-fraction-src-mq3-platform-macosx-headers-ml-1776240795"></a>
### Sys_SetScreenFade

```ml
function Sys_SetScreenFade(state, table, fraction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `table` | `dynamic` | — |  |
| `fraction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L59)

<a id="function-function-mq3-platform-macosx-headers-sys-shutdowninput-function-sys-shutdowninput-state-src-mq3-platform-macosx-headers-ml-1922235293"></a>
### Sys_ShutdownInput

```ml
function Sys_ShutdownInput(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L67)

<a id="function-function-mq3-platform-macosx-headers-sys-storegammatables-function-sys-storegammatables-state-tables-src-mq3-platform-macosx-headers-ml-1895905472"></a>
### Sys_StoreGammaTables

```ml
function Sys_StoreGammaTables(state, tables)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `tables` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L57)

<a id="function-function-mq3-platform-macosx-headers-sys-unfadescreen-function-sys-unfadescreen-state-display-table-src-mq3-platform-macosx-headers-ml-1894115631"></a>
### Sys_UnfadeScreen

```ml
function Sys_UnfadeScreen(state, display, table)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `display` | `dynamic` | — |  |
| `table` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L62)

<a id="function-function-mq3-platform-macosx-headers-sys-unfadescreens-function-sys-unfadescreens-state-src-mq3-platform-macosx-headers-ml-52931589"></a>
### Sys_UnfadeScreens

```ml
function Sys_UnfadeScreens(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L63)

<a id="function-function-mq3-platform-macosx-headers-sys-unhide-function-sys-unhide-state-src-mq3-platform-macosx-headers-ml-803985409"></a>
### Sys_Unhide

```ml
function Sys_Unhide(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L74)

<a id="function-function-mq3-platform-macosx-headers-timersymbols-function-timersymbols-src-mq3-platform-macosx-headers-ml-227252106"></a>
### timerSymbols

```ml
function timerSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L22)
