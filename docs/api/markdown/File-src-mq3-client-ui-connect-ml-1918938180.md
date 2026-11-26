# `src/mq3/client/ui_connect.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_connect`](Package-mq3-client-ui-connect-1313299274.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

- [mq3.client.ui_connect.Action](Type-mq3-client-ui-connect-action-787716638.md) — struct
<a id="constant-constant-mq3-client-ui-connect-ca-active-const-ca-active-8-src-mq3-client-ui-connect-ml-147954925"></a>
### CA_ACTIVE

```ml
const CA_ACTIVE = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L17)

<a id="constant-constant-mq3-client-ui-connect-ca-authorizing-const-ca-authorizing-2-src-mq3-client-ui-connect-ml-1709788335"></a>
### CA_AUTHORIZING

```ml
const CA_AUTHORIZING = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L11)

<a id="constant-constant-mq3-client-ui-connect-ca-challenging-const-ca-challenging-4-src-mq3-client-ui-connect-ml-1351343729"></a>
### CA_CHALLENGING

```ml
const CA_CHALLENGING = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L13)

<a id="constant-constant-mq3-client-ui-connect-ca-cinematic-const-ca-cinematic-9-src-mq3-client-ui-connect-ml-982015678"></a>
### CA_CINEMATIC

```ml
const CA_CINEMATIC = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L18)

<a id="constant-constant-mq3-client-ui-connect-ca-connected-const-ca-connected-5-src-mq3-client-ui-connect-ml-1690203786"></a>
### CA_CONNECTED

```ml
const CA_CONNECTED = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L14)

<a id="constant-constant-mq3-client-ui-connect-ca-connecting-const-ca-connecting-3-src-mq3-client-ui-connect-ml-2139275574"></a>
### CA_CONNECTING

```ml
const CA_CONNECTING = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L12)

<a id="constant-constant-mq3-client-ui-connect-ca-disconnected-const-ca-disconnected-1-src-mq3-client-ui-connect-ml-1330630896"></a>
### CA_DISCONNECTED

```ml
const CA_DISCONNECTED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L10)

<a id="constant-constant-mq3-client-ui-connect-ca-loading-const-ca-loading-6-src-mq3-client-ui-connect-ml-1046266219"></a>
### CA_LOADING

```ml
const CA_LOADING = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L15)

<a id="constant-constant-mq3-client-ui-connect-ca-primed-const-ca-primed-7-src-mq3-client-ui-connect-ml-1491007330"></a>
### CA_PRIMED

```ml
const CA_PRIMED = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L16)

<a id="constant-constant-mq3-client-ui-connect-ca-uninitialized-const-ca-uninitialized-0-src-mq3-client-ui-connect-ml-567287199"></a>
### CA_UNINITIALIZED

```ml
const CA_UNINITIALIZED = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L9)

<a id="function-function-mq3-client-ui-connect-clientstate-function-clientstate-connstate-connectpacketcount-servername-updateinfostring-messagestring-serverinfo-src-mq3-client-ui-connect-ml-957383471"></a>
### clientState

```ml
function clientState(connState, connectPacketCount, servername, updateInfoString, messageString, serverInfo)
```

Creates a `mq3.client.ui_connect.ClientState` record. Assigns `connState` from `connState`, `connectPacketCount` from `connectPacketCount`, `servername` from `servername`, `updateInfoString` from `updateInfoString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connState` | `dynamic` | — | Value used to initialize `ClientState.connState`. |
| `connectPacketCount` | `dynamic` | — | Value used to initialize `ClientState.connectPacketCount`. |
| `servername` | `dynamic` | — | Value used to initialize `ClientState.servername`. |
| `updateInfoString` | `dynamic` | — | Value used to initialize `ClientState.updateInfoString`. |
| `messageString` | `dynamic` | — | Value used to initialize `ClientState.messageString`. |
| `serverInfo` | `dynamic` | — | Value used to initialize `ClientState.serverInfo`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L39)

- [mq3.client.ui_connect.ClientState](Type-mq3-client-ui-connect-clientstate-1978890188.md) — struct
<a id="function-function-mq3-client-ui-connect-configure-function-configure-state-client-realtime-downloadname-downloadsize-downloadcount-downloadtime-src-mq3-client-ui-connect-ml-1650606181"></a>
### configure

```ml
function configure(state, client, realtime, downloadName, downloadSize, downloadCount, downloadTime)
```

Updates `state.client`, `state.realtime`, `state.downloadName`, `state.downloadSize` and additional values during UI connect `configure`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI connect record/storage; this routine assigns `state.client`, `state.realtime`, `state.downloadName`, `state.downloadSize` and additional values. |
| `client` | `dynamic` | — | Value assigned to `state.client`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |
| `downloadName` | `dynamic` | — | Value assigned to `state.downloadName`. |
| `downloadSize` | `dynamic` | — | Value assigned to `state.downloadSize`. |
| `downloadCount` | `dynamic` | — | Value assigned to `state.downloadCount`. |
| `downloadTime` | `dynamic` | — | Value assigned to `state.downloadTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L116)

<a id="function-function-mq3-client-ui-connect-create-function-create-retailactive-src-mq3-client-ui-connect-ml-1496739353"></a>
### create

```ml
function create(retailActive)
```

Creates a `mq3.client.ui_connect.State` record. Assigns `retailActive` from `retailActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Value used to initialize `State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L42)

<a id="function-function-mq3-client-ui-connect-displaydownloadinfo-function-displaydownloadinfo-state-downloadname-src-mq3-client-ui-connect-ml-1102411562"></a>
### displayDownloadInfo

```ml
function displayDownloadInfo(state, downloadName)
```

UI_DisplayDownloadInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.downloadSize`, `state.downloadCount`, `state.downloadTime`, `state.realtime`. |
| `downloadName` | `dynamic` | — | Value used by `nameText=downloadName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L100)

<a id="constant-constant-mq3-client-ui-connect-download-left-const-download-left-262-src-mq3-client-ui-connect-ml-1755349219"></a>
### DOWNLOAD_LEFT

```ml
const DOWNLOAD_LEFT = 262
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L21)

- [mq3.client.ui_connect.DownloadInfo](Type-mq3-client-ui-connect-downloadinfo-2065230024.md) — struct
<a id="function-function-mq3-client-ui-connect-drawconnectscreen-function-drawconnectscreen-state-overlay-src-mq3-client-ui-connect-ml-961893839"></a>
### drawConnectScreen

```ml
function drawConnectScreen(state, overlay)
```

UI_DrawConnectScreen

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI connect record/storage; this routine assigns `state.actions`, `state.cacheCalls`, `state.lastLoadingText`, `state.lastConnState`. |
| `overlay` | `dynamic` | — | Value used by `if not overlay then emit(state,"background",0,0,640,480,"","white","white","menuback",0) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L121)

<a id="function-function-mq3-client-ui-connect-drawtext-function-drawtext-state-x-y-text-style-color-src-mq3-client-ui-connect-ml-445524993"></a>
### drawText

```ml
function drawText(state, x, y, text, style, color)
```

Calls `mq3.client.ui_connect.emit` from UI connect `drawText`. The final path returns `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI connect state passed to the helper calls in `drawText`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawText`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawText`. |
| `text` | `dynamic` | — | Text consumed or emitted by `drawText` in the UI connect path. |
| `style` | `dynamic` | — | Value used by `emit(state,"text",x,y,0,0,text,style,color,"",0)`. |
| `color` | `dynamic` | — | Color value used by the UI connect drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L85)

<a id="function-function-mq3-client-ui-connect-drawwrapped-function-drawwrapped-state-x-y-width-height-text-style-color-src-mq3-client-ui-connect-ml-1283487048"></a>
### drawWrapped

```ml
function drawWrapped(state, x, y, width, height, text, style, color)
```

Calls `mq3.client.ui_connect.emit` from UI connect `drawWrapped`. The final path returns `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI connect state passed to the helper calls in `drawWrapped`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `drawWrapped`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `drawWrapped`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawWrapped`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawWrapped`. |
| `text` | `dynamic` | — | Text consumed or emitted by `drawWrapped` in the UI connect path. |
| `style` | `dynamic` | — | Value used by `emit(state,"wrapped-text",x,y,width,height,text,style,color,"",0)`. |
| `color` | `dynamic` | — | Color value used by the UI connect drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L95)

<a id="function-function-mq3-client-ui-connect-emit-function-emit-state-kind-x-y-width-height-text-style-color-asset-value-src-mq3-client-ui-connect-ml-1358673393"></a>
### emit

```ml
function emit(state, kind, x, y, width, height, text, style, color, asset, value)
```

Appends a UI connect action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI connect record/storage; this routine assigns `state.actions`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `emit`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `emit`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `emit`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `emit`. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI connect path. |
| `style` | `dynamic` | — | Value used by `item=Action("ui-connect",kind,x,y,width,height,text,style,color,asset,value,not state.retailActive)`. |
| `color` | `dynamic` | — | Color value used by the UI connect drawing or interpolation operation. |
| `asset` | `dynamic` | — | Value used by `item=Action("ui-connect",kind,x,y,width,height,text,style,color,asset,value,not state.retailActive)`. |
| `value` | `dynamic` | — | Value used by `item=Action("ui-connect",kind,x,y,width,height,text,style,color,asset,value,not state.retailActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L55)

<a id="constant-constant-mq3-client-ui-connect-exec-append-const-exec-append-2-src-mq3-client-ui-connect-ml-121945955"></a>
### EXEC_APPEND

```ml
const EXEC_APPEND = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L20)

<a id="function-function-mq3-client-ui-connect-idiv-function-idiv-a-b-src-mq3-client-ui-connect-ml-1838657535"></a>
### idiv

```ml
function idiv(a, b)
```

Computes signed integer division through the MiniLang numeric compatibility helper.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Value used by `negative=(a<0)!=(b<0)`. |
| `b` | `dynamic` | — | Value tested by `b==0` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L59)

<a id="constant-constant-mq3-client-ui-connect-k-escape-const-k-escape-27-src-mq3-client-ui-connect-ml-356760220"></a>
### K_ESCAPE

```ml
const K_ESCAPE = 27
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L19)

<a id="function-function-mq3-client-ui-connect-keyconnect-function-keyconnect-state-key-src-mq3-client-ui-connect-ml-2027778272"></a>
### keyConnect

```ml
function keyConnect(state, key)
```

UI_KeyConnect

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI connect state passed to the helper calls in `keyConnect`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI connect entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L135)

<a id="function-function-mq3-client-ui-connect-printtime-function-printtime-time-src-mq3-client-ui-connect-ml-1341022905"></a>
### printTime

```ml
function printTime(time)
```

UI_PrintTime

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | `dynamic` | — | Value used by `seconds=idiv(time,1000)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L74)

<a id="function-function-mq3-client-ui-connect-readablesize-function-readablesize-value-src-mq3-client-ui-connect-ml-135015465"></a>
### readableSize

```ml
function readableSize(value)
```

UI_ReadableSize

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value>gb`, `value>mb` and additional values before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L68)

<a id="function-function-mq3-client-ui-connect-sessiondrawconnectscreen-function-sessiondrawconnectscreen-context-overlay-src-mq3-client-ui-connect-ml-969316329"></a>
### sessionDrawConnectScreen

```ml
function sessionDrawConnectScreen(context, overlay)
```

Adapter for original_ui_session.Services.connectFn when the shared host context owns this module's State as `connectScreen`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record read through `context.connectScreen`. |
| `overlay` | `dynamic` | — | Value used by `return drawConnectScreen(context.connectScreen,overlay)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L130)

- [mq3.client.ui_connect.State](Type-mq3-client-ui-connect-state-1587894641.md) — struct
<a id="function-function-mq3-client-ui-connect-twodigits-function-twodigits-value-src-mq3-client-ui-connect-ml-1162759193"></a>
### twoDigits

```ml
function twoDigits(value)
```

Evaluates UI connect `twoDigits` and returns `"0"+str(value)`, `str(value)` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value>=0 and value<10` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L64)
