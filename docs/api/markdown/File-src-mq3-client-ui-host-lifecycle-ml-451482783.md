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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L16)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-authorizing-const-ca-authorizing-2-src-mq3-client-ui-host-lifecycle-ml-1594483797"></a>
### CA_AUTHORIZING

```ml
const CA_AUTHORIZING = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L10)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-challenging-const-ca-challenging-4-src-mq3-client-ui-host-lifecycle-ml-1563881807"></a>
### CA_CHALLENGING

```ml
const CA_CHALLENGING = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L12)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-cinematic-const-ca-cinematic-9-src-mq3-client-ui-host-lifecycle-ml-1389203706"></a>
### CA_CINEMATIC

```ml
const CA_CINEMATIC = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L17)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-connected-const-ca-connected-5-src-mq3-client-ui-host-lifecycle-ml-973872774"></a>
### CA_CONNECTED

```ml
const CA_CONNECTED = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L13)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-connecting-const-ca-connecting-3-src-mq3-client-ui-host-lifecycle-ml-533758526"></a>
### CA_CONNECTING

```ml
const CA_CONNECTING = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L11)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-disconnected-const-ca-disconnected-1-src-mq3-client-ui-host-lifecycle-ml-591674184"></a>
### CA_DISCONNECTED

```ml
const CA_DISCONNECTED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L9)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-loading-const-ca-loading-6-src-mq3-client-ui-host-lifecycle-ml-974194521"></a>
### CA_LOADING

```ml
const CA_LOADING = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L14)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-primed-const-ca-primed-7-src-mq3-client-ui-host-lifecycle-ml-753468058"></a>
### CA_PRIMED

```ml
const CA_PRIMED = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L15)

<a id="constant-constant-mq3-client-ui-host-lifecycle-ca-uninitialized-const-ca-uninitialized-0-src-mq3-client-ui-host-lifecycle-ml-1169931529"></a>
### CA_UNINITIALIZED

```ml
const CA_UNINITIALIZED = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L8)

<a id="function-function-mq3-client-ui-host-lifecycle-clearuicatcher-function-clearuicatcher-context-getfn-setfn-src-mq3-client-ui-host-lifecycle-ml-889883121"></a>
### clearUiCatcher

```ml
function clearUiCatcher(context, getFn, setFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `getFn` | `dynamic` | — |  |
| `setFn` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L95)

<a id="constant-constant-mq3-client-ui-host-lifecycle-client-state-size-const-client-state-size-3084-src-mq3-client-ui-host-lifecycle-ml-1905050778"></a>
### CLIENT_STATE_SIZE

```ml
const CLIENT_STATE_SIZE = 3084
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L21)

- [mq3.client.ui_host_lifecycle.ClientState](Type-mq3-client-ui-host-lifecycle-clientstate-175227767.md) — struct
<a id="function-function-mq3-client-ui-host-lifecycle-connecting-function-connecting-state-src-mq3-client-ui-host-lifecycle-ml-2099600855"></a>
### connecting

```ml
function connecting(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L55)

<a id="function-function-mq3-client-ui-host-lifecycle-createclientstate-function-createclientstate-connstate-connectpacketcount-clientnum-servername-updateinfostring-messagestring-src-mq3-client-ui-host-lifecycle-ml-926109293"></a>
### createClientState

```ml
function createClientState(connState, connectPacketCount, clientNum, servername, updateInfoString, messageString)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connState` | `dynamic` | — |  |
| `connectPacketCount` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `servername` | `dynamic` | — |  |
| `updateInfoString` | `dynamic` | — |  |
| `messageString` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L29)

<a id="function-function-mq3-client-ui-host-lifecycle-drawscreen-function-drawscreen-host-connstate-realtime-src-mq3-client-ui-host-lifecycle-ml-2095120000"></a>
### drawScreen

```ml
function drawScreen(host, connState, realtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `connState` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L68)

<a id="function-function-mq3-client-ui-host-lifecycle-encodeclientstate-function-encodeclientstate-state-src-mq3-client-ui-host-lifecycle-ml-1863866791"></a>
### encodeClientState

```ml
function encodeClientState(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L47)

<a id="function-function-mq3-client-ui-host-lifecycle-fail-function-fail-message-src-mq3-client-ui-host-lifecycle-ml-1108561369"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L27)

- [mq3.client.ui_host_lifecycle.Frame](Type-mq3-client-ui-host-lifecycle-frame-1297113514.md) — struct
<a id="constant-constant-mq3-client-ui-host-lifecycle-keycatch-ui-const-keycatch-ui-2-src-mq3-client-ui-host-lifecycle-ml-714717589"></a>
### KEYCATCH_UI

```ml
const KEYCATCH_UI = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L18)

<a id="constant-constant-mq3-client-ui-host-lifecycle-max-string-chars-const-max-string-chars-1024-src-mq3-client-ui-host-lifecycle-ml-991430720"></a>
### MAX_STRING_CHARS

```ml
const MAX_STRING_CHARS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L20)

<a id="function-function-mq3-client-ui-host-lifecycle-requireservices-function-requireservices-host-src-mq3-client-ui-host-lifecycle-ml-1561420562"></a>
### requireServices

```ml
function requireServices(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L63)

<a id="function-function-mq3-client-ui-host-lifecycle-services-function-services-context-fullscreenfn-refreshfn-menufn-connectfn-cgamefn-cinematicfn-catcherfn-src-mq3-client-ui-host-lifecycle-ml-2117803758"></a>
### services

```ml
function services(context, fullscreenFn, refreshFn, menuFn, connectFn, cgameFn, cinematicFn, catcherFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `fullscreenFn` | `dynamic` | — |  |
| `refreshFn` | `dynamic` | — |  |
| `menuFn` | `dynamic` | — |  |
| `connectFn` | `dynamic` | — |  |
| `cgameFn` | `dynamic` | — |  |
| `cinematicFn` | `dynamic` | — |  |
| `catcherFn` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L59)

- [mq3.client.ui_host_lifecycle.Services](Type-mq3-client-ui-host-lifecycle-services-152448193.md) — struct
<a id="constant-constant-mq3-client-ui-host-lifecycle-uimenu-main-const-uimenu-main-1-src-mq3-client-ui-host-lifecycle-ml-1594123532"></a>
### UIMENU_MAIN

```ml
const UIMENU_MAIN = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L19)

<a id="function-function-mq3-client-ui-host-lifecycle-validateclientstate-function-validateclientstate-state-src-mq3-client-ui-host-lifecycle-ml-2051628975"></a>
### validateClientState

```ml
function validateClientState(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L34)

<a id="function-function-mq3-client-ui-host-lifecycle-writefixedstring-function-writefixedstring-data-offset-text-src-mq3-client-ui-host-lifecycle-ml-1118556074"></a>
### writeFixedString

```ml
function writeFixedString(data, offset, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_host_lifecycle.ml#L41)
