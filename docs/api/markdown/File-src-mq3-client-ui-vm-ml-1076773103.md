# `src/mq3/client/ui_vm.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_vm`](Package-mq3-client-ui-vm-1285266417.md)

Reachable from entry: **yes**

## Declarations

<a id="constant-constant-mq3-client-ui-vm-ca-active-const-ca-active-8-src-mq3-client-ui-vm-ml-858816895"></a>
### CA_ACTIVE

```ml
const CA_ACTIVE = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L22)

<a id="constant-constant-mq3-client-ui-vm-ca-authorizing-const-ca-authorizing-2-src-mq3-client-ui-vm-ml-1932036325"></a>
### CA_AUTHORIZING

```ml
const CA_AUTHORIZING = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L21)

<a id="function-function-mq3-client-ui-vm-consolecommand-function-consolecommand-state-realtime-src-mq3-client-ui-vm-ml-1400599600"></a>
### consoleCommand

```ml
function consoleCommand(state, realtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L70)

<a id="function-function-mq3-client-ui-vm-create-function-create-host-src-mq3-client-ui-vm-ml-2024494568"></a>
### create

```ml
function create(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L31)

<a id="function-function-mq3-client-ui-vm-drawconnectscreen-function-drawconnectscreen-state-overlay-src-mq3-client-ui-vm-ml-1526418935"></a>
### drawConnectScreen

```ml
function drawConnectScreen(state, overlay)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `overlay` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L71)

<a id="function-function-mq3-client-ui-vm-initialize-function-initialize-state-connectionstate-connectedtopureserver-vmui-src-mq3-client-ui-vm-ml-887433230"></a>
### initialize

```ml
function initialize(state, connectionState, connectedToPureServer, vmUi)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `connectionState` | `dynamic` | — |  |
| `connectedToPureServer` | `dynamic` | — |  |
| `vmUi` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L44)

<a id="function-function-mq3-client-ui-vm-invoke-function-invoke-state-arguments-src-mq3-client-ui-vm-ml-1007047243"></a>
### invoke

```ml
function invoke(state, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L39)

<a id="function-function-mq3-client-ui-vm-isfullscreen-function-isfullscreen-state-src-mq3-client-ui-vm-ml-678153331"></a>
### isFullscreen

```ml
function isFullscreen(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L68)

<a id="constant-constant-mq3-client-ui-vm-keycatch-ui-const-keycatch-ui-2-src-mq3-client-ui-vm-ml-137168757"></a>
### KEYCATCH_UI

```ml
const KEYCATCH_UI = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L20)

<a id="function-function-mq3-client-ui-vm-keyevent-function-keyevent-state-key-down-src-mq3-client-ui-vm-ml-231790894"></a>
### keyEvent

```ml
function keyEvent(state, key, down)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L65)

<a id="function-function-mq3-client-ui-vm-mouseevent-function-mouseevent-state-dx-dy-src-mq3-client-ui-vm-ml-732626418"></a>
### mouseEvent

```ml
function mouseEvent(state, dx, dy)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `dx` | `dynamic` | — |  |
| `dy` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L66)

<a id="function-function-mq3-client-ui-vm-refresh-function-refresh-state-time-src-mq3-client-ui-vm-ml-1866753598"></a>
### refresh

```ml
function refresh(state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L67)

<a id="function-function-mq3-client-ui-vm-requireactive-function-requireactive-state-src-mq3-client-ui-vm-ml-1383688749"></a>
### requireActive

```ml
function requireActive(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L35)

<a id="function-function-mq3-client-ui-vm-services-function-services-machineruntime-syscall-loadfn-callfn-freefn-src-mq3-client-ui-vm-ml-1985802094"></a>
### services

```ml
function services(machineRuntime, syscall, loadFn, callFn, freeFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machineRuntime` | `dynamic` | — |  |
| `syscall` | `dynamic` | — |  |
| `loadFn` | `dynamic` | — |  |
| `callFn` | `dynamic` | — |  |
| `freeFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L28)

- [mq3.client.ui_vm.Services](Type-mq3-client-ui-vm-services-284829901.md) — struct
<a id="function-function-mq3-client-ui-vm-setactivemenu-function-setactivemenu-state-menu-src-mq3-client-ui-vm-ml-2126103760"></a>
### setActiveMenu

```ml
function setActiveMenu(state, menu)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `menu` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L69)

<a id="function-function-mq3-client-ui-vm-shutdown-function-shutdown-state-src-mq3-client-ui-vm-ml-1553843307"></a>
### shutdown

```ml
function shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L58)

- [mq3.client.ui_vm.State](Type-mq3-client-ui-vm-state-459992910.md) — struct
<a id="constant-constant-mq3-client-ui-vm-ui-api-version-const-ui-api-version-6-src-mq3-client-ui-vm-ml-231608475"></a>
### UI_API_VERSION

```ml
const UI_API_VERSION = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L19)

<a id="constant-constant-mq3-client-ui-vm-ui-cd-api-version-const-ui-cd-api-version-3-src-mq3-client-ui-vm-ml-1334066534"></a>
### UI_CD_API_VERSION

```ml
const UI_CD_API_VERSION = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L17)

<a id="constant-constant-mq3-client-ui-vm-ui-console-command-const-ui-console-command-8-src-mq3-client-ui-vm-ml-405909721"></a>
### UI_CONSOLE_COMMAND

```ml
const UI_CONSOLE_COMMAND = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L14)

<a id="constant-constant-mq3-client-ui-vm-ui-draw-connect-screen-const-ui-draw-connect-screen-9-src-mq3-client-ui-vm-ml-890220196"></a>
### UI_DRAW_CONNECT_SCREEN

```ml
const UI_DRAW_CONNECT_SCREEN = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L15)

<a id="constant-constant-mq3-client-ui-vm-ui-getapiversion-const-ui-getapiversion-0-src-mq3-client-ui-vm-ml-1689967871"></a>
### UI_GETAPIVERSION

```ml
const UI_GETAPIVERSION = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L6)

<a id="constant-constant-mq3-client-ui-vm-ui-hasuniquecdkey-const-ui-hasuniquecdkey-10-src-mq3-client-ui-vm-ml-1198684520"></a>
### UI_HASUNIQUECDKEY

```ml
const UI_HASUNIQUECDKEY = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L16)

<a id="constant-constant-mq3-client-ui-vm-ui-init-const-ui-init-1-src-mq3-client-ui-vm-ml-1922200072"></a>
### UI_INIT

```ml
const UI_INIT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L7)

<a id="constant-constant-mq3-client-ui-vm-ui-is-fullscreen-const-ui-is-fullscreen-6-src-mq3-client-ui-vm-ml-373426813"></a>
### UI_IS_FULLSCREEN

```ml
const UI_IS_FULLSCREEN = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L12)

<a id="constant-constant-mq3-client-ui-vm-ui-key-event-const-ui-key-event-3-src-mq3-client-ui-vm-ml-30845414"></a>
### UI_KEY_EVENT

```ml
const UI_KEY_EVENT = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L9)

<a id="constant-constant-mq3-client-ui-vm-ui-mouse-event-const-ui-mouse-event-4-src-mq3-client-ui-vm-ml-1922737655"></a>
### UI_MOUSE_EVENT

```ml
const UI_MOUSE_EVENT = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L10)

<a id="constant-constant-mq3-client-ui-vm-ui-old-api-version-const-ui-old-api-version-4-src-mq3-client-ui-vm-ml-458792313"></a>
### UI_OLD_API_VERSION

```ml
const UI_OLD_API_VERSION = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L18)

<a id="constant-constant-mq3-client-ui-vm-ui-refresh-const-ui-refresh-5-src-mq3-client-ui-vm-ml-1204777286"></a>
### UI_REFRESH

```ml
const UI_REFRESH = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L11)

<a id="constant-constant-mq3-client-ui-vm-ui-set-active-menu-const-ui-set-active-menu-7-src-mq3-client-ui-vm-ml-1559189380"></a>
### UI_SET_ACTIVE_MENU

```ml
const UI_SET_ACTIVE_MENU = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L13)

<a id="constant-constant-mq3-client-ui-vm-ui-shutdown-const-ui-shutdown-2-src-mq3-client-ui-vm-ml-192115557"></a>
### UI_SHUTDOWN

```ml
const UI_SHUTDOWN = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L8)

<a id="function-function-mq3-client-ui-vm-usesuniquecdkey-function-usesuniquecdkey-state-src-mq3-client-ui-vm-ml-20953277"></a>
### usesUniqueCdKey

```ml
function usesUniqueCdKey(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L72)

<a id="constant-constant-mq3-client-ui-vm-vmi-compiled-const-vmi-compiled-2-src-mq3-client-ui-vm-ml-597660387"></a>
### VMI_COMPILED

```ml
const VMI_COMPILED = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L23)
