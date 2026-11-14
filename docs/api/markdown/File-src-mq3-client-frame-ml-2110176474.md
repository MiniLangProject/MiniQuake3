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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `runtime` | `dynamic` | — |  |
| `sendServices` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L44)

<a id="constant-constant-mq3-client-frame-ca-active-const-ca-active-8-src-mq3-client-frame-ml-215832813"></a>
### CA_ACTIVE

```ml
const CA_ACTIVE = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L11)

<a id="constant-constant-mq3-client-frame-ca-challenging-const-ca-challenging-4-src-mq3-client-frame-ml-1632304465"></a>
### CA_CHALLENGING

```ml
const CA_CHALLENGING = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L9)

<a id="constant-constant-mq3-client-frame-ca-cinematic-const-ca-cinematic-9-src-mq3-client-frame-ml-1842121164"></a>
### CA_CINEMATIC

```ml
const CA_CINEMATIC = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L12)

<a id="constant-constant-mq3-client-frame-ca-connected-const-ca-connected-5-src-mq3-client-frame-ml-1213831896"></a>
### CA_CONNECTED

```ml
const CA_CONNECTED = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L10)

<a id="constant-constant-mq3-client-frame-ca-disconnected-const-ca-disconnected-1-src-mq3-client-frame-ml-1690987642"></a>
### CA_DISCONNECTED

```ml
const CA_DISCONNECTED = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L8)

<a id="function-function-mq3-client-frame-call0-function-call0-fn-host-src-mq3-client-frame-ml-1693964108"></a>
### call0

```ml
function call0(fn, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fn` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L49)

<a id="function-function-mq3-client-frame-checktimeout-function-checktimeout-state-host-src-mq3-client-frame-ml-405969295"></a>
### checkTimeout

```ml
function checkTimeout(state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L61)

<a id="function-function-mq3-client-frame-checkuserinfo-function-checkuserinfo-state-host-src-mq3-client-frame-ml-1220019525"></a>
### checkUserinfo

```ml
function checkUserinfo(state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L51)

<a id="constant-constant-mq3-client-frame-cvar-userinfo-const-cvar-userinfo-2-src-mq3-client-frame-ml-101637595"></a>
### CVAR_USERINFO

```ml
const CVAR_USERINFO = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L14)

<a id="constant-constant-mq3-client-frame-keycatch-ui-const-keycatch-ui-2-src-mq3-client-frame-ml-1782586875"></a>
### KEYCATCH_UI

```ml
const KEYCATCH_UI = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L13)

<a id="function-function-mq3-client-frame-livesend-function-livesend-host-src-mq3-client-frame-ml-933063496"></a>
### liveSend

```ml
function liveSend(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L43)

<a id="function-function-mq3-client-frame-run-function-run-state-msec-host-src-mq3-client-frame-ml-2139911909"></a>
### run

```ml
function run(state, msec, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msec` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L76)

<a id="function-function-mq3-client-frame-runtime-function-runtime-src-mq3-client-frame-ml-2128324342"></a>
### runtime

```ml
function runtime()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L25)

- [mq3.client.frame.Runtime](Type-mq3-client-frame-runtime-223182724.md) — struct
<a id="function-function-mq3-client-frame-services-function-services-src-mq3-client-frame-ml-39845774"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L39)

- [mq3.client.frame.Services](Type-mq3-client-frame-services-1398414064.md) — struct
<a id="constant-constant-mq3-client-frame-uimenu-main-const-uimenu-main-1-src-mq3-client-frame-ml-1057386878"></a>
### UIMENU_MAIN

```ml
const UIMENU_MAIN = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L15)

<a id="constant-constant-mq3-client-frame-uimenu-need-cd-const-uimenu-need-cd-3-src-mq3-client-frame-ml-522143854"></a>
### UIMENU_NEED_CD

```ml
const UIMENU_NEED_CD = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/frame.ml#L16)
