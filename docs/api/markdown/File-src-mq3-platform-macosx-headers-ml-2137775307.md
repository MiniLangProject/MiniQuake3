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

Updates `state.qglErrors` in `mq3.platform.macosx_headers._glGetError`; returns `code`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.qglErrors`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L215)

<a id="function-function-mq3-platform-macosx-headers-cgfix-getlastmousedelta-function-cgfix-getlastmousedelta-state-src-mq3-platform-macosx-headers-ml-2133358787"></a>
### CGFix_GetLastMouseDelta

```ml
function CGFix_GetLastMouseDelta(state)
```

Returns `[state.mouseDelta[0],state.mouseDelta[1]]` for `mq3.platform.macosx_headers.CGFix_GetLastMouseDelta`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.mouseDelta`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L59)

<a id="function-function-mq3-platform-macosx-headers-cgfix-initialize-function-cgfix-initialize-state-src-mq3-platform-macosx-headers-ml-1539498593"></a>
### CGFix_Initialize

```ml
function CGFix_Initialize(state)
```

Updates `state.mouseInitialized`, `state.mouseDelta` in `mq3.platform.macosx_headers.CGFix_Initialize`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.mouseInitialized`, `state.mouseDelta`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L51)

<a id="function-function-mq3-platform-macosx-headers-cgfix-recordmousedelta-function-cgfix-recordmousedelta-state-dx-dy-src-mq3-platform-macosx-headers-ml-1377914794"></a>
### CGFix_RecordMouseDelta

```ml
function CGFix_RecordMouseDelta(state, dx, dy)
```

Updates `state.mouseDelta` in `mq3.platform.macosx_headers.CGFix_RecordMouseDelta`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.mouseDelta`. |
| `dx` | `dynamic` | — | Input tested by `state.mouseInitialized`. |
| `dy` | `dynamic` | — | Input tested by `state.mouseInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L56)

<a id="function-function-mq3-platform-macosx-headers-cgsnotify-function-cgsnotify-state-type-data-datalength-argument-src-mq3-platform-macosx-headers-ml-1681154302"></a>
### CGSNotify

```ml
function CGSNotify(state, type, data, dataLength, argument)
```

Updates `state.notifications` in `mq3.platform.macosx_headers.CGSNotify`; returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.notifications`. |
| `type` | `dynamic` | — | Input used by `state.notifications=state.notifications+[[type,data,dataLength,argument]]`. |
| `data` | `dynamic` | — | Input used by `state.notifications=state.notifications+[[type,data,dataLength,argument]]`. |
| `dataLength` | `dynamic` | — | Input used by `state.notifications=state.notifications+[[type,data,dataLength,argument]]`. |
| `argument` | `dynamic` | — | Input used by `state.notifications=state.notifications+[[type,data,dataLength,argument]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L67)

<a id="function-function-mq3-platform-macosx-headers-contains-function-contains-values-needle-src-mq3-platform-macosx-headers-ml-641182199"></a>
### contains

```ml
function contains(values, needle)
```

Returns `false` from `mq3.platform.macosx_headers.contains`; earlier branches return `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Sequence traversed as `value` while producing this result. |
| `needle` | `dynamic` | — | Input used by `for each value in values if value==needle then return true`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L197)

<a id="function-function-mq3-platform-macosx-headers-controllersymbols-function-controllersymbols-src-mq3-platform-macosx-headers-ml-972793292"></a>
### controllerSymbols

```ml
function controllerSymbols()
```

Lists the 4 declared names for `mq3.platform.macosx_headers.controllerSymbols`, including `paste`, `requestTerminate`, `showBanner`, `quakeMain`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L13)

<a id="function-function-mq3-platform-macosx-headers-create-function-create-src-mq3-platform-macosx-headers-ml-741607102"></a>
### create

```ml
function create()
```

Constructs `mq3.platform.macosx_headers.State` with `mouseInitialized` = `false`, `mouseDelta` = `[0,0]`, `notifications` = `[]`, `bannerVisible` = `false` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L45)

<a id="function-function-mq3-platform-macosx-headers-displaysymbols-function-displaysymbols-src-mq3-platform-macosx-headers-ml-1123919766"></a>
### displaySymbols

```ml
function displaySymbols()
```

Lists the 9 declared names for `mq3.platform.macosx_headers.displaySymbols`, including `Sys_GetMatchingDisplayMode`, `Sys_StoreGammaTables`, `Sys_GetGammaTable`, `Sys_SetScreenFade`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L15)

- [mq3.platform.macosx_headers.Event](Type-mq3-platform-macosx-headers-event-2116399717.md) — struct
<a id="function-function-mq3-platform-macosx-headers-eventrecord-function-eventrecord-type-time-location-flags-data-src-mq3-platform-macosx-headers-ml-1373800055"></a>
### eventRecord

```ml
function eventRecord(type, time, location, flags, data)
```

Returns `[type,time,location,flags,data]` for `mq3.platform.macosx_headers.eventRecord`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | `dynamic` | — | Input used in the result expression `[type,time,location,flags,data]`. |
| `time` | `dynamic` | — | Input used in the result expression `[type,time,location,flags,data]`. |
| `location` | `dynamic` | — | Input used in the result expression `[type,time,location,flags,data]`. |
| `flags` | `dynamic` | — | Input used in the result expression `[type,time,location,flags,data]`. |
| `data` | `dynamic` | — | Input used in the result expression `[type,time,location,flags,data]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L74)

- [mq3.platform.macosx_headers.GammaTable](Type-mq3-platform-macosx-headers-gammatable-1261009872.md) — struct
<a id="function-function-mq3-platform-macosx-headers-glimpheadersymbols-function-glimpheadersymbols-src-mq3-platform-macosx-headers-ml-2034023074"></a>
### glimpHeaderSymbols

```ml
function glimpHeaderSymbols()
```

Returns `[]` for the `mq3.platform.macosx_headers.glimpHeaderSymbols` compatibility entry point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L17)

<a id="function-function-mq3-platform-macosx-headers-glstamp-function-glstamp-state-name-data-src-mq3-platform-macosx-headers-ml-472525854"></a>
### GLSTAMP

```ml
function GLSTAMP(state, name, data)
```

Updates `state.timerStamps` in `mq3.platform.macosx_headers.GLSTAMP`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.timerStamps`. |
| `name` | `dynamic` | — | Input tested by `state.timers`. |
| `data` | `dynamic` | — | Input tested by `state.timers`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L235)

<a id="function-function-mq3-platform-macosx-headers-initializetimers-function-initializetimers-state-src-mq3-platform-macosx-headers-ml-799151169"></a>
### InitializeTimers

```ml
function InitializeTimers(state)
```

Updates `state.timers`, `state.timerStack`, `state.timerStamps` in `mq3.platform.macosx_headers.InitializeTimers`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.timers`, `state.timerStack`, `state.timerStamps`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L223)

<a id="constant-constant-mq3-platform-macosx-headers-kcgseventnotificationleftmousedragged-const-kcgseventnotificationleftmousedragged-716-src-mq3-platform-macosx-headers-ml-1606502191"></a>
### kCGSEventNotificationLeftMouseDragged

```ml
const kCGSEventNotificationLeftMouseDragged = 716
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L33)

<a id="constant-constant-mq3-platform-macosx-headers-kcgseventnotificationmousemoved-const-kcgseventnotificationmousemoved-715-src-mq3-platform-macosx-headers-ml-1693275036"></a>
### kCGSEventNotificationMouseMoved

```ml
const kCGSEventNotificationMouseMoved = 715
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L32)

<a id="constant-constant-mq3-platform-macosx-headers-kcgseventnotificationothermousedragged-const-kcgseventnotificationothermousedragged-737-src-mq3-platform-macosx-headers-ml-2098446122"></a>
### kCGSEventNotificationOtherMouseDragged

```ml
const kCGSEventNotificationOtherMouseDragged = 737
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L35)

<a id="constant-constant-mq3-platform-macosx-headers-kcgseventnotificationrightmousedragged-const-kcgseventnotificationrightmousedragged-717-src-mq3-platform-macosx-headers-ml-1151261120"></a>
### kCGSEventNotificationRightMouseDragged

```ml
const kCGSEventNotificationRightMouseDragged = 717
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L34)

<a id="function-function-mq3-platform-macosx-headers-localsymbols-function-localsymbols-src-mq3-platform-macosx-headers-ml-2090440518"></a>
### localSymbols

```ml
function localSymbols()
```

Lists the 12 declared names for `mq3.platform.macosx_headers.localSymbols`, including `Sys_InitInput`, `Sys_ShutdownInput`, `Sys_SetMouseInputRect`, `Sys_DisplayToUse`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L19)

<a id="function-function-mq3-platform-macosx-headers-mousedeltasymbols-function-mousedeltasymbols-src-mq3-platform-macosx-headers-ml-2071444170"></a>
### mouseDeltaSymbols

```ml
function mouseDeltaSymbols()
```

Lists the 2 declared names for `mq3.platform.macosx_headers.mouseDeltaSymbols`, including `CGFix_Initialize`, `CGFix_GetLastMouseDelta`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L9)

<a id="function-function-mq3-platform-macosx-headers-osx-getcglcontext-function-osx-getcglcontext-state-src-mq3-platform-macosx-headers-ml-1503586221"></a>
### OSX_GetCGLContext

```ml
function OSX_GetCGLContext(state)
```

Computes `state.cglContext` for `mq3.platform.macosx_headers.OSX_GetCGLContext`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.cglContext`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L177)

<a id="function-function-mq3-platform-macosx-headers-osx-getnsglcontext-function-osx-getnsglcontext-state-src-mq3-platform-macosx-headers-ml-344148089"></a>
### OSX_GetNSGLContext

```ml
function OSX_GetNSGLContext(state)
```

Computes `state.context` for `mq3.platform.macosx_headers.OSX_GetNSGLContext`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L174)

<a id="function-function-mq3-platform-macosx-headers-osx-glcontextclearcurrent-function-osx-glcontextclearcurrent-state-src-mq3-platform-macosx-headers-ml-1403769231"></a>
### OSX_GLContextClearCurrent

```ml
function OSX_GLContextClearCurrent(state)
```

Updates `state.contextCurrent` in `mq3.platform.macosx_headers.OSX_GLContextClearCurrent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.contextCurrent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L186)

<a id="function-function-mq3-platform-macosx-headers-osx-glcontextiscurrent-function-osx-glcontextiscurrent-state-src-mq3-platform-macosx-headers-ml-795709337"></a>
### OSX_GLContextIsCurrent

```ml
function OSX_GLContextIsCurrent(state)
```

Computes `state.contextCurrent` for `mq3.platform.macosx_headers.OSX_GLContextIsCurrent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.contextCurrent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L180)

<a id="function-function-mq3-platform-macosx-headers-osx-glcontextsetcurrent-function-osx-glcontextsetcurrent-state-src-mq3-platform-macosx-headers-ml-1738413397"></a>
### OSX_GLContextSetCurrent

```ml
function OSX_GLContextSetCurrent(state)
```

Updates `state.contextCurrent` in `mq3.platform.macosx_headers.OSX_GLContextSetCurrent`; returns `state.contextCurrent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.contextCurrent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L183)

<a id="function-function-mq3-platform-macosx-headers-osx-setglcontext-function-osx-setglcontext-state-context-cglcontext-src-mq3-platform-macosx-headers-ml-2131557047"></a>
### OSX_SetGLContext

```ml
function OSX_SetGLContext(state, context, cglContext)
```

Updates `state.context`, `state.cglContext` in `mq3.platform.macosx_headers.OSX_SetGLContext`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.context`, `state.cglContext`. |
| `context` | `dynamic` | — | Value assigned to `state.context`. |
| `cglContext` | `dynamic` | — | Value assigned to `state.cglContext`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L171)

<a id="function-function-mq3-platform-macosx-headers-otstart-function-otstart-state-node-src-mq3-platform-macosx-headers-ml-930298983"></a>
### OTSTART

```ml
function OTSTART(state, node)
```

Updates `state.timerStack` in `mq3.platform.macosx_headers.OTSTART`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.timerStack`. |
| `node` | `dynamic` | — | Input tested by `state.timers`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L227)

<a id="function-function-mq3-platform-macosx-headers-otstop-function-otstop-state-src-mq3-platform-macosx-headers-ml-27814621"></a>
### OTSTOP

```ml
function OTSTOP(state)
```

Updates `state.timerStack` in `mq3.platform.macosx_headers.OTSTOP`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.timerStack`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L230)

<a id="function-function-mq3-platform-macosx-headers-paste-function-paste-state-text-src-mq3-platform-macosx-headers-ml-1579863156"></a>
### paste

```ml
function paste(state, text)
```

Updates `state.clipboard`, `state.events` in `mq3.platform.macosx_headers.paste`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.clipboard`, `state.events`. |
| `text` | `dynamic` | — | Value assigned to `state.clipboard`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L79)

<a id="function-function-mq3-platform-macosx-headers-privateapisymbols-function-privateapisymbols-src-mq3-platform-macosx-headers-ml-1259983818"></a>
### privateApiSymbols

```ml
function privateApiSymbols()
```

Returns `[]` for the `mq3.platform.macosx_headers.privateApiSymbols` compatibility entry point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L11)

<a id="function-function-mq3-platform-macosx-headers-qglcall-function-qglcall-state-name-arguments-src-mq3-platform-macosx-headers-ml-2028582964"></a>
### qglCall

```ml
function qglCall(state, name, arguments)
```

Updates `state.qglBeginStarted`, `state.qglCalls` in `mq3.platform.macosx_headers.qglCall`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.qglBeginStarted`, `state.qglCalls`. |
| `name` | `dynamic` | — | Value forwarded as `needle` to `mq3.platform.macosx_headers.contains`. |
| `arguments` | `dynamic` | — | Input used by `state.qglCalls=state.qglCalls+[[name,arguments]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L202)

<a id="function-function-mq3-platform-macosx-headers-qglcheckerror-function-qglcheckerror-state-message-src-mq3-platform-macosx-headers-ml-1534191334"></a>
### QGLCheckError

```ml
function QGLCheckError(state, message)
```

Updates `state.events` in `mq3.platform.macosx_headers.QGLCheckError`; returns `code`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.events`. |
| `message` | `dynamic` | — | Value used for `mq3.platform.macosx_headers.Event.payload`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L219)

<a id="function-function-mq3-platform-macosx-headers-qglraiseerror-function-qglraiseerror-state-code-src-mq3-platform-macosx-headers-ml-832272872"></a>
### QGLRaiseError

```ml
function QGLRaiseError(state, code)
```

Updates `state.qglErrors` in `mq3.platform.macosx_headers.QGLRaiseError`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.qglErrors`. |
| `code` | `dynamic` | — | Input used by `state.qglErrors=state.qglErrors+[code]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L212)

<a id="function-function-mq3-platform-macosx-headers-qglsymbols-function-qglsymbols-src-mq3-platform-macosx-headers-ml-687951702"></a>
### qglSymbols

```ml
function qglSymbols()
```

Returns `result` from `mq3.platform.macosx_headers.qglSymbols`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L21)

<a id="function-function-mq3-platform-macosx-headers-quakemain-function-quakemain-state-frames-src-mq3-platform-macosx-headers-ml-138026059"></a>
### quakeMain

```ml
function quakeMain(state, frames)
```

Updates `state.quakeFrames` in `mq3.platform.macosx_headers.quakeMain`; returns `state.quakeFrames`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.quakeFrames`. |
| `frames` | `dynamic` | — | Input used by `state.quakeFrames=state.quakeFrames+frames`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L89)

<a id="function-function-mq3-platform-macosx-headers-requestterminate-function-requestterminate-state-src-mq3-platform-macosx-headers-ml-681648705"></a>
### requestTerminate

```ml
function requestTerminate(state)
```

Updates `state.terminateRequested` in `mq3.platform.macosx_headers.requestTerminate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.terminateRequested`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L82)

<a id="function-function-mq3-platform-macosx-headers-showbanner-function-showbanner-state-src-mq3-platform-macosx-headers-ml-733296633"></a>
### showBanner

```ml
function showBanner(state)
```

Updates `state.bannerVisible` in `mq3.platform.macosx_headers.showBanner`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.bannerVisible`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L85)

- [mq3.platform.macosx_headers.State](Type-mq3-platform-macosx-headers-state-87376264.md) — struct
<a id="function-function-mq3-platform-macosx-headers-sys-annoyingbanner-function-sys-annoyingbanner-state-src-mq3-platform-macosx-headers-ml-1023207065"></a>
### Sys_AnnoyingBanner

```ml
function Sys_AnnoyingBanner(state)
```

Calls `mq3.platform.macosx_headers.showBanner` with `(state)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.platform.macosx_headers.showBanner`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L157)

<a id="function-function-mq3-platform-macosx-headers-sys-displaytouse-function-sys-displaytouse-state-src-mq3-platform-macosx-headers-ml-2013571817"></a>
### Sys_DisplayToUse

```ml
function Sys_DisplayToUse(state)
```

Computes `state.display` for `mq3.platform.macosx_headers.Sys_DisplayToUse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.display`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L146)

<a id="function-function-mq3-platform-macosx-headers-sys-fadescreen-function-sys-fadescreen-state-display-src-mq3-platform-macosx-headers-ml-305188603"></a>
### Sys_FadeScreen

```ml
function Sys_FadeScreen(state, display)
```

Updates `state.fadedDisplays` in `mq3.platform.macosx_headers.Sys_FadeScreen`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.fadedDisplays`. |
| `display` | `dynamic` | — | Value forwarded as `needle` to `mq3.platform.macosx_headers.contains`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L118)

<a id="function-function-mq3-platform-macosx-headers-sys-fadescreens-function-sys-fadescreens-state-src-mq3-platform-macosx-headers-ml-427469887"></a>
### Sys_FadeScreens

```ml
function Sys_FadeScreens(state)
```

Returns `void` from `mq3.platform.macosx_headers.Sys_FadeScreens`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.displayModes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L121)

<a id="function-function-mq3-platform-macosx-headers-sys-getgammatable-function-sys-getgammatable-state-display-src-mq3-platform-macosx-headers-ml-1312701945"></a>
### Sys_GetGammaTable

```ml
function Sys_GetGammaTable(state, display)
```

Returns `void` from `mq3.platform.macosx_headers.Sys_GetGammaTable`; earlier branches return `table`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.gammaTables`. |
| `display` | `dynamic` | — | Input used by `for each table in state.gammaTables if table.display==display then return table`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L109)

<a id="function-function-mq3-platform-macosx-headers-sys-getmatchingdisplaymode-function-sys-getmatchingdisplaymode-state-allowstretchedmodes-src-mq3-platform-macosx-headers-ml-2115360264"></a>
### Sys_GetMatchingDisplayMode

```ml
function Sys_GetMatchingDisplayMode(state, allowStretchedModes)
```

Selects the first allowed display mode, optionally permitting stretched modes; returns void when none matches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.displayModes`, `state.stretchedModes`. |
| `allowStretchedModes` | `dynamic` | — | Input tested by `allowStretchedModes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L94)

<a id="function-function-mq3-platform-macosx-headers-sys-hide-function-sys-hide-state-src-mq3-platform-macosx-headers-ml-1659715789"></a>
### Sys_Hide

```ml
function Sys_Hide(state)
```

Updates `state.hidden` in `mq3.platform.macosx_headers.Sys_Hide`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.hidden`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L163)

<a id="function-function-mq3-platform-macosx-headers-sys-initinput-function-sys-initinput-state-src-mq3-platform-macosx-headers-ml-19191437"></a>
### Sys_InitInput

```ml
function Sys_InitInput(state)
```

Updates `state.inputInitialized` in `mq3.platform.macosx_headers.Sys_InitInput`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.inputInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L136)

<a id="function-function-mq3-platform-macosx-headers-sys-ishidden-function-sys-ishidden-state-src-mq3-platform-macosx-headers-ml-744627245"></a>
### Sys_IsHidden

```ml
function Sys_IsHidden(state)
```

Computes `state.hidden` for `mq3.platform.macosx_headers.Sys_IsHidden`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.hidden`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L160)

<a id="function-function-mq3-platform-macosx-headers-sys-pausegl-function-sys-pausegl-state-src-mq3-platform-macosx-headers-ml-1111914823"></a>
### Sys_PauseGL

```ml
function Sys_PauseGL(state)
```

Updates `state.pauseCount`, `state.contextCurrent` in `mq3.platform.macosx_headers.Sys_PauseGL`; returns `state.pauseCount`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.pauseCount`, `state.contextCurrent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L189)

<a id="function-function-mq3-platform-macosx-headers-sys-queevent-function-sys-queevent-state-time-kind-value1-value2-payload-src-mq3-platform-macosx-headers-ml-1179938985"></a>
### Sys_QueEvent

```ml
function Sys_QueEvent(state, time, kind, value1, value2, payload)
```

Updates `state.events` in `mq3.platform.macosx_headers.Sys_QueEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.events`. |
| `time` | `dynamic` | — | Value used for `mq3.platform.macosx_headers.Event.time`. |
| `kind` | `dynamic` | — | Value used for `mq3.platform.macosx_headers.Event.kind`. |
| `value1` | `dynamic` | — | Value used for `mq3.platform.macosx_headers.Event.value1`. |
| `value2` | `dynamic` | — | Value used for `mq3.platform.macosx_headers.Event.value2`. |
| `payload` | `dynamic` | — | Value used for `mq3.platform.macosx_headers.Event.payload`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L154)

<a id="function-function-mq3-platform-macosx-headers-sys-releasealldisplays-function-sys-releasealldisplays-state-src-mq3-platform-macosx-headers-ml-1239127109"></a>
### Sys_ReleaseAllDisplays

```ml
function Sys_ReleaseAllDisplays(state)
```

Updates `state.fadedDisplays`, `state.displayModes` in `mq3.platform.macosx_headers.Sys_ReleaseAllDisplays`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.fadedDisplays`, `state.displayModes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L132)

<a id="function-function-mq3-platform-macosx-headers-sys-resumegl-function-sys-resumegl-state-src-mq3-platform-macosx-headers-ml-1501534349"></a>
### Sys_ResumeGL

```ml
function Sys_ResumeGL(state)
```

Updates `state.pauseCount` in `mq3.platform.macosx_headers.Sys_ResumeGL`; returns `state.pauseCount`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.pauseCount`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L192)

<a id="function-function-mq3-platform-macosx-headers-sys-setmouseinputrect-function-sys-setmouseinputrect-state-rect-src-mq3-platform-macosx-headers-ml-944839509"></a>
### Sys_SetMouseInputRect

```ml
function Sys_SetMouseInputRect(state, rect)
```

Updates `state.mouseRect` in `mq3.platform.macosx_headers.Sys_SetMouseInputRect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.mouseRect`. |
| `rect` | `dynamic` | — | Value assigned to `state.mouseRect`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L143)

<a id="function-function-mq3-platform-macosx-headers-sys-setscreenfade-function-sys-setscreenfade-state-table-fraction-src-mq3-platform-macosx-headers-ml-1776240795"></a>
### Sys_SetScreenFade

```ml
function Sys_SetScreenFade(state, table, fraction)
```

Updates `state.fadeFraction` in `mq3.platform.macosx_headers.Sys_SetScreenFade`; returns `table`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.fadeFraction`. |
| `table` | `dynamic` | — | Input used in the result expression `table`. |
| `fraction` | `dynamic` | — | Value assigned to `state.fadeFraction`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L114)

<a id="function-function-mq3-platform-macosx-headers-sys-shutdowninput-function-sys-shutdowninput-state-src-mq3-platform-macosx-headers-ml-1922235293"></a>
### Sys_ShutdownInput

```ml
function Sys_ShutdownInput(state)
```

Updates `state.inputInitialized` in `mq3.platform.macosx_headers.Sys_ShutdownInput`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.inputInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L139)

<a id="function-function-mq3-platform-macosx-headers-sys-storegammatables-function-sys-storegammatables-state-tables-src-mq3-platform-macosx-headers-ml-1895905472"></a>
### Sys_StoreGammaTables

```ml
function Sys_StoreGammaTables(state, tables)
```

Updates `state.gammaTables` in `mq3.platform.macosx_headers.Sys_StoreGammaTables`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.gammaTables`. |
| `tables` | `dynamic` | — | Value assigned to `state.gammaTables`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L105)

<a id="function-function-mq3-platform-macosx-headers-sys-unfadescreen-function-sys-unfadescreen-state-display-table-src-mq3-platform-macosx-headers-ml-1894115631"></a>
### Sys_UnfadeScreen

```ml
function Sys_UnfadeScreen(state, display, table)
```

Updates `state.fadedDisplays` in `mq3.platform.macosx_headers.Sys_UnfadeScreen`; returns `table`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.fadedDisplays`. |
| `display` | `dynamic` | — | Input used by `for each value in state.fadedDisplays if value!=display then kept=kept+[value]`. |
| `table` | `dynamic` | — | Input used in the result expression `table`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L126)

<a id="function-function-mq3-platform-macosx-headers-sys-unfadescreens-function-sys-unfadescreens-state-src-mq3-platform-macosx-headers-ml-52931589"></a>
### Sys_UnfadeScreens

```ml
function Sys_UnfadeScreens(state)
```

Updates `state.fadedDisplays` in `mq3.platform.macosx_headers.Sys_UnfadeScreens`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.fadedDisplays`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L129)

<a id="function-function-mq3-platform-macosx-headers-sys-unhide-function-sys-unhide-state-src-mq3-platform-macosx-headers-ml-803985409"></a>
### Sys_Unhide

```ml
function Sys_Unhide(state)
```

Updates `state.hidden` in `mq3.platform.macosx_headers.Sys_Unhide`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.hidden`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L166)

<a id="function-function-mq3-platform-macosx-headers-timersymbols-function-timersymbols-src-mq3-platform-macosx-headers-ml-227252106"></a>
### timerSymbols

```ml
function timerSymbols()
```

Lists the 19 declared names for `mq3.platform.macosx_headers.timerSymbols`, including `rootNode`, `markFragmentsNode1`, `markFragmentsNode2`, `markFragmentsGrid`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/macosx_headers.ml#L30)
