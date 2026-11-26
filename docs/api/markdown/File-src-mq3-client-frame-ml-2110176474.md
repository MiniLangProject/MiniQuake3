# `src/mq3/client/frame.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.frame`](Package-mq3-client-frame-255289150.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/send_cmd.ml` as `sendCmd` → [src/mq3/client/send_cmd.ml](File-src-mq3-client-send-cmd-ml-1342588170.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-client-frame-attachsend-function-attachsend-host-runtime-sendservices-src-mq3-client-frame-ml-751376414"></a>
### attachSend

```ml
function attachSend(host, runtime, sendServices)
```

Updates `host.sendRuntime`, `host.sendServices`, `host.sendCmdFn` during frame `attachSend`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Mutable frame record/storage; this routine assigns `host.sendRuntime`, `host.sendServices`, `host.sendCmdFn`. |
| `runtime` | `dynamic` | — | Value assigned to `host.sendRuntime`. |
| `sendServices` | `dynamic` | — | Value assigned to `host.sendServices`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L163)

<a id="constant-constant-mq3-client-frame-ca-active-const-ca-active-8-src-mq3-client-frame-ml-215832813"></a>
### CA_ACTIVE

```ml
const CA_ACTIVE = 8
```

Connection-state value for normal gameplay after game-state loading, defined for client-frame connection, timeout, and packet scheduling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L17)

<a id="constant-constant-mq3-client-frame-ca-challenging-const-ca-challenging-4-src-mq3-client-frame-ml-1632304465"></a>
### CA_CHALLENGING

```ml
const CA_CHALLENGING = 4
```

Client connection state while replying to the server challenge and requesting connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L11)

<a id="constant-constant-mq3-client-frame-ca-cinematic-const-ca-cinematic-9-src-mq3-client-frame-ml-1842121164"></a>
### CA_CINEMATIC

```ml
const CA_CINEMATIC = 9
```

Client connection state used for fullscreen cinematic playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L19)

<a id="constant-constant-mq3-client-frame-ca-connected-const-ca-connected-5-src-mq3-client-frame-ml-1213831896"></a>
### CA_CONNECTED

```ml
const CA_CONNECTED = 5
```

Connection-state value for a completed handshake before game-state loading, defined for client-frame connection, timeout, and packet scheduling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L14)

<a id="constant-constant-mq3-client-frame-ca-disconnected-const-ca-disconnected-1-src-mq3-client-frame-ml-1690987642"></a>
### CA_DISCONNECTED

```ml
const CA_DISCONNECTED = 1
```

Client connection state with no active server connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L9)

<a id="function-function-mq3-client-frame-call0-function-call0-fn-host-src-mq3-client-frame-ml-1693964108"></a>
### call0

```ml
function call0(fn, host)
```

Calls `fn` from frame `call0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fn` | `dynamic` | — | Value used by `if fn!=void then fn(host) end if`. |
| `host` | `dynamic` | — | host record passed to the frame helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L171)

<a id="function-function-mq3-client-frame-checktimeout-function-checktimeout-state-host-src-mq3-client-frame-ml-405969295"></a>
### checkTimeout

```ml
function checkTimeout(state, host)
```

Updates `state.timeoutCount` during frame `checkTimeout`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable frame record/storage; this routine assigns `state.timeoutCount`. |
| `host` | `dynamic` | — | Record read through `host.diagnosticFn`, `host.disconnectFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L189)

<a id="function-function-mq3-client-frame-checkuserinfo-function-checkuserinfo-state-host-src-mq3-client-frame-ml-1220019525"></a>
### checkUserinfo

```ml
function checkUserinfo(state, host)
```

Updates `state.modifiedFlags` during frame `checkUserinfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable frame record/storage; this routine assigns `state.modifiedFlags`. |
| `host` | `dynamic` | — | Record read through `host.infoStringFn`, `host.reliableFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L176)

<a id="constant-constant-mq3-client-frame-cvar-userinfo-const-cvar-userinfo-2-src-mq3-client-frame-ml-101637595"></a>
### CVAR_USERINFO

```ml
const CVAR_USERINFO = 2
```

Configuration-variable attribute that includes the value in user information sent to the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L24)

<a id="constant-constant-mq3-client-frame-keycatch-ui-const-keycatch-ui-2-src-mq3-client-frame-ml-1782586875"></a>
### KEYCATCH_UI

```ml
const KEYCATCH_UI = 2
```

UI keyboard-capture mask used when deciding whether the UI currently captures input during client-frame scheduling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L22)

<a id="function-function-mq3-client-frame-livesend-function-livesend-host-src-mq3-client-frame-ml-933063496"></a>
### liveSend

```ml
function liveSend(host)
```

Adapts `mq3.client.send_cmd.send` to frame `liveSend`, returning its result for `host.sendRuntime, host.sendRuntime.realtime, host.sendServices`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.sendRuntime`, `host.sendRuntime.realtime`, `host.sendServices`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L158)

<a id="function-function-mq3-client-frame-run-function-run-state-msec-host-src-mq3-client-frame-ml-2139911909"></a>
### run

```ml
function run(state, msec, host)
```

Updates `state.cdDialog`, `state.realFrametime`, `state.frametime`, `state.realtime` and additional values during frame `run`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable frame record/storage; this routine assigns `state.cdDialog`, `state.realFrametime`, `state.frametime`, `state.realtime` and additional values. |
| `msec` | `dynamic` | — | Time interval in milliseconds. |
| `host` | `dynamic` | — | Mutable frame record/storage; this routine assigns `host.sendRuntime.connectionState`, `host.sendRuntime.realtime`, `host.sendRuntime.serverRunning`, `host.sendRuntime.serverPaused` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L208)

<a id="function-function-mq3-client-frame-runtime-function-runtime-src-mq3-client-frame-ml-2128324342"></a>
### runtime

```ml
function runtime()
```

Creates a `mq3.client.frame.Runtime` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L88)

- [mq3.client.frame.Runtime](Type-mq3-client-frame-runtime-223182724.md) — struct
<a id="function-function-mq3-client-frame-services-function-services-src-mq3-client-frame-ml-39845774"></a>
### services

```ml
function services()
```

Creates a `mq3.client.frame.Services` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L152)

- [mq3.client.frame.Services](Type-mq3-client-frame-services-1398414064.md) — struct
<a id="constant-constant-mq3-client-frame-uimenu-main-const-uimenu-main-1-src-mq3-client-frame-ml-1057386878"></a>
### UIMENU_MAIN

```ml
const UIMENU_MAIN = 1
```

Engine-to-UI menu selector for the main screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L26)

<a id="constant-constant-mq3-client-frame-uimenu-need-cd-const-uimenu-need-cd-3-src-mq3-client-frame-ml-522143854"></a>
### UIMENU_NEED_CD

```ml
const UIMENU_NEED_CD = 3
```

Engine-to-UI menu selector for the need cd screen or menu state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L28)
