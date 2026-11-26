# `src/mq3/client/ui_host_lifecycle.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_host_lifecycle`](Package-mq3-client-ui-host-lifecycle-1179727789.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-active-const-ca-active-8-src-mq3-client-ui-host-lifecycle-ml-584960795"></a>
### CA_ACTIVE

```ml
const CA_ACTIVE = 8
```

Connection-state value for normal gameplay after game-state loading, defined for coordinating UI lifecycle callbacks with connection progress.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L27)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-authorizing-const-ca-authorizing-2-src-mq3-client-ui-host-lifecycle-ml-1594483797"></a>
### CA_AUTHORIZING

```ml
const CA_AUTHORIZING = 2
```

Client connection state while waiting for authorization to contact the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L13)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-challenging-const-ca-challenging-4-src-mq3-client-ui-host-lifecycle-ml-1563881807"></a>
### CA_CHALLENGING

```ml
const CA_CHALLENGING = 4
```

Client connection state while replying to the server challenge and requesting connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L17)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-cinematic-const-ca-cinematic-9-src-mq3-client-ui-host-lifecycle-ml-1389203706"></a>
### CA_CINEMATIC

```ml
const CA_CINEMATIC = 9
```

Client connection state used for fullscreen cinematic playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L29)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-connected-const-ca-connected-5-src-mq3-client-ui-host-lifecycle-ml-973872774"></a>
### CA_CONNECTED

```ml
const CA_CONNECTED = 5
```

Connection-state value for a completed handshake before game-state loading, defined for coordinating UI lifecycle callbacks with connection progress.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L20)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-connecting-const-ca-connecting-3-src-mq3-client-ui-host-lifecycle-ml-533758526"></a>
### CA_CONNECTING

```ml
const CA_CONNECTING = 3
```

Client connection state while requesting a challenge from the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L15)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-disconnected-const-ca-disconnected-1-src-mq3-client-ui-host-lifecycle-ml-591674184"></a>
### CA_DISCONNECTED

```ml
const CA_DISCONNECTED = 1
```

Client connection state with no active server connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L11)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-loading-const-ca-loading-6-src-mq3-client-ui-host-lifecycle-ml-974194521"></a>
### CA_LOADING

```ml
const CA_LOADING = 6
```

Client connection state while level media and game state are being loaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L22)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-primed-const-ca-primed-7-src-mq3-client-ui-host-lifecycle-ml-753468058"></a>
### CA_PRIMED

```ml
const CA_PRIMED = 7
```

Client connection state with game state loaded, awaiting a playable snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L24)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-uninitialized-const-ca-uninitialized-0-src-mq3-client-ui-host-lifecycle-ml-1169931529"></a>
### CA_UNINITIALIZED

```ml
const CA_UNINITIALIZED = 0
```

Client connection state before the client subsystem has been initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L9)

<a id="function-function-mq3-client-ui-host-lifecycle-clearuicatcher-function-clearuicatcher-context-getfn-setfn-src-mq3-client-ui-host-lifecycle-ml-889883121"></a>
### clearUiCatcher

```ml
function clearUiCatcher(context, getFn, setFn)
```

Calls `getFn`, `setFn` from UI host lifecycle `clearUiCatcher`. The final path returns `setFn(context,value&(~KEYCATCH_UI))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | context record passed to the UI host lifecycle helper calls. |
| `getFn` | `dynamic` | — | Callback invoked by `clearUiCatcher` for get. |
| `setFn` | `dynamic` | — | Callback invoked by `clearUiCatcher` for set. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L201)

<a id="constant-constant-mq3-client-ui-host-lifecycle-client-state-size-const-client-state-size-3084-src-mq3-client-ui-host-lifecycle-ml-1905050778"></a>
### CLIENT_STATE_SIZE

```ml
const CLIENT_STATE_SIZE = 3084
```

Size in bytes reserved for the native client-state structure during ABI marshalling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L37)

- [mq3.client.ui_host_lifecycle.ClientState](Type-mq3-client-ui-host-lifecycle-clientstate-175227767.md) — struct
<a id="function-function-mq3-client-ui-host-lifecycle-connecting-function-connecting-state-src-mq3-client-ui-host-lifecycle-ml-2099600855"></a>
### connecting

```ml
function connecting(state)
```

Evaluates UI host lifecycle `connecting` and returns `1`, `0` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI host lifecycle state passed to the helper calls in `connecting`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L142)

<a id="function-function-mq3-client-ui-host-lifecycle-createclientstate-function-createclientstate-connstate-connectpacketcount-clientnum-servername-updateinfostring-messagestring-src-mq3-client-ui-host-lifecycle-ml-926109293"></a>
### createClientState

```ml
function createClientState(connState, connectPacketCount, clientNum, servername, updateInfoString, messageString)
```

Calls `mq3.client.ui_host_lifecycle.ClientState`, `mq3.client.ui_host_lifecycle.validateClientState` from UI host lifecycle `createClientState`. The final path returns `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connState` | `dynamic` | — | Value used by `state=ClientState(connState,connectPacketCount,clientNum,servername,updateInfoString,messageString)`. |
| `connectPacketCount` | `dynamic` | — | Value used by `state=ClientState(connState,connectPacketCount,clientNum,servername,updateInfoString,messageString)`. |
| `clientNum` | `dynamic` | — | Client slot identifier used by the client/server protocol. |
| `servername` | `dynamic` | — | Value used by `state=ClientState(connState,connectPacketCount,clientNum,servername,updateInfoString,messageString)`. |
| `updateInfoString` | `dynamic` | — | Value used by `state=ClientState(connState,connectPacketCount,clientNum,servername,updateInfoString,messageString)`. |
| `messageString` | `dynamic` | — | Value used by `state=ClientState(connState,connectPacketCount,clientNum,servername,updateInfoString,messageString)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L106)

<a id="function-function-mq3-client-ui-host-lifecycle-drawscreen-function-drawscreen-host-connstate-realtime-src-mq3-client-ui-host-lifecycle-ml-2095120000"></a>
### drawScreen

```ml
function drawScreen(host, connState, realtime)
```

Calls `mq3.client.ui_host_lifecycle.requireServices`, `host.fullscreenFn`, `host.cinematicFn` and additional helpers from UI host lifecycle `drawScreen`. The final path returns `Frame(full,cgameFrames,cinematicFrames,menuCalls,refreshCalls,connectCalls,overlay)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.fullscreenFn`, `host.context`, `host.cinematicFn`, `host.menuFn` and additional values. |
| `connState` | `dynamic` | — | Value used by `if connState<CA_DISCONNECTED or connState>CA_CINEMATIC or connState==CA_AUTHORIZING then return fail("connection state cannot be drawn") end if`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L170)

<a id="function-function-mq3-client-ui-host-lifecycle-encodeclientstate-function-encodeclientstate-state-src-mq3-client-ui-host-lifecycle-ml-1863866791"></a>
### encodeClientState

```ml
function encodeClientState(state)
```

Calls `mq3.client.ui_host_lifecycle.validateClientState`, `mq3.compat.numeric.writeU32`, `mq3.client.ui_host_lifecycle.writeFixedString` from UI host lifecycle `encodeClientState`. The final path returns `data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.connState`, `state.connectPacketCount`, `state.clientNum`, `state.servername` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L132)

<a id="function-function-mq3-client-ui-host-lifecycle-fail-function-fail-message-src-mq3-client-ui-host-lifecycle-ml-1108561369"></a>
### fail

```ml
function fail(message)
```

Creates the UI host lifecycle error `3460` with diagnostic text `"UI host lifecycle: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"UI host lifecycle: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L97)

- [mq3.client.ui_host_lifecycle.Frame](Type-mq3-client-ui-host-lifecycle-frame-1297113514.md) — struct
<a id="constant-constant-mq3-client-ui-host-lifecycle-keycatch-ui-const-keycatch-ui-2-src-mq3-client-ui-host-lifecycle-ml-714717589"></a>
### KEYCATCH_UI

```ml
const KEYCATCH_UI = 2
```

UI keyboard-capture mask used when coordinating menu activation and UI keyboard-event dispatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L31)

<a id="constant-constant-mq3-client-ui-host-lifecycle-max-string-chars-const-max-string-chars-1024-src-mq3-client-ui-host-lifecycle-ml-991430720"></a>
### MAX_STRING_CHARS

```ml
const MAX_STRING_CHARS = 1024
```

Maximum length of a protocol, command, or configuration string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L35)

<a id="function-function-mq3-client-ui-host-lifecycle-requireservices-function-requireservices-host-src-mq3-client-ui-host-lifecycle-ml-1561420562"></a>
### requireServices

```ml
function requireServices(host)
```

Evaluates UI host lifecycle `requireServices` and returns `fail("complete screen services are required")`, `void` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.fullscreenFn`, `host.refreshFn`, `host.menuFn`, `host.connectFn` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L161)

<a id="function-function-mq3-client-ui-host-lifecycle-services-function-services-context-fullscreenfn-refreshfn-menufn-connectfn-cgamefn-cinematicfn-catcherfn-src-mq3-client-ui-host-lifecycle-ml-2117803758"></a>
### services

```ml
function services(context, fullscreenFn, refreshFn, menuFn, connectFn, cgameFn, cinematicFn, catcherFn)
```

Creates a `mq3.client.ui_host_lifecycle.Services` record. Assigns `context` from `context`, `fullscreenFn` from `fullscreenFn`, `refreshFn` from `refreshFn`, `menuFn` from `menuFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Value used to initialize `Services.context`. |
| `fullscreenFn` | `dynamic` | — | Value used to initialize `Services.fullscreenFn`. |
| `refreshFn` | `dynamic` | — | Value used to initialize `Services.refreshFn`. |
| `menuFn` | `dynamic` | — | Value used to initialize `Services.menuFn`. |
| `connectFn` | `dynamic` | — | Value used to initialize `Services.connectFn`. |
| `cgameFn` | `dynamic` | — | Value used to initialize `Services.cgameFn`. |
| `cinematicFn` | `dynamic` | — | Value used to initialize `Services.cinematicFn`. |
| `catcherFn` | `dynamic` | — | Value used to initialize `Services.catcherFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L155)

- [mq3.client.ui_host_lifecycle.Services](Type-mq3-client-ui-host-lifecycle-services-152448193.md) — struct
<a id="constant-constant-mq3-client-ui-host-lifecycle-uimenu-main-const-uimenu-main-1-src-mq3-client-ui-host-lifecycle-ml-1594123532"></a>
### UIMENU_MAIN

```ml
const UIMENU_MAIN = 1
```

Engine-to-UI menu selector for the main screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L33)

<a id="function-function-mq3-client-ui-host-lifecycle-validateclientstate-function-validateclientstate-state-src-mq3-client-ui-host-lifecycle-ml-2051628975"></a>
### validateClientState

```ml
function validateClientState(state)
```

Evaluates UI host lifecycle `validateClientState` and returns `fail("invalid connection state")`, `fail("packet count and client number must be integers")`, `fail("client-state text must be strings")` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.connState`, `state.connectPacketCount`, `state.clientNum`, `state.servername` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L113)

<a id="function-function-mq3-client-ui-host-lifecycle-writefixedstring-function-writefixedstring-data-offset-text-src-mq3-client-ui-host-lifecycle-ml-1118556074"></a>
### writeFixedString

```ml
function writeFixedString(data, offset, text)
```

Calls `copyBytes` from UI host lifecycle `writeFixedString`. The final path returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value used by `if count>0 then copyBytes(data,offset,encoded,0,count) end if`. |
| `offset` | `dynamic` | — | Value used by `if count>0 then copyBytes(data,offset,encoded,0,count) end if`. |
| `text` | `dynamic` | — | Text consumed or emitted by `writeFixedString` in the UI host lifecycle path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L124)
