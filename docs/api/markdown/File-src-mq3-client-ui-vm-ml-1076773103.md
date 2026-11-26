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

Connection-state value for normal gameplay after game-state loading, defined for dispatching UI operations in the context of the client's game state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L40)

<a id="constant-constant-mq3-client-ui-vm-ca-authorizing-const-ca-authorizing-2-src-mq3-client-ui-vm-ml-1932036325"></a>
### CA_AUTHORIZING

```ml
const CA_AUTHORIZING = 2
```

Client connection state while waiting for authorization to contact the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L37)

<a id="function-function-mq3-client-ui-vm-consolecommand-function-consolecommand-state-realtime-src-mq3-client-ui-vm-ml-1400599600"></a>
### consoleCommand

```ml
function consoleCommand(state, realtime)
```

Calls `mq3.client.ui_vm.invoke` from UI vm `consoleCommand`. The final path returns `invoke(state,[UI_CONSOLE_COMMAND,realtime])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.active`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L166)

<a id="function-function-mq3-client-ui-vm-create-function-create-host-src-mq3-client-ui-vm-ml-2024494568"></a>
### create

```ml
function create(host)
```

Calls `mq3.client.ui_vm.State` from UI vm `create`. The final path returns `State(host,void,false,false,0,0,0,-1,[])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record read through `host.machineRuntime`, `host.syscall`, `host.loadFn`, `host.callFn` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L96)

<a id="function-function-mq3-client-ui-vm-drawconnectscreen-function-drawconnectscreen-state-overlay-src-mq3-client-ui-vm-ml-1526418935"></a>
### drawConnectScreen

```ml
function drawConnectScreen(state, overlay)
```

Calls `mq3.client.ui_vm.invoke` from UI vm `drawConnectScreen`. The final path returns `invoke(state,[UI_DRAW_CONNECT_SCREEN,flag])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI vm state passed to the helper calls in `drawConnectScreen`. |
| `overlay` | `dynamic` | — | Value used by `if overlay then flag=1 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L170)

<a id="function-function-mq3-client-ui-vm-initialize-function-initialize-state-connectionstate-connectedtopureserver-vmui-src-mq3-client-ui-vm-ml-887433230"></a>
### initialize

```ml
function initialize(state, connectionState, connectedToPureServer, vmUi)
```

Updates `state.slot`, `state.active`, `state.apiVersion`, `state.uiStarted` during UI vm `initialize`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI vm record/storage; this routine assigns `state.slot`, `state.active`, `state.apiVersion`, `state.uiStarted`. |
| `connectionState` | `dynamic` | — | Value used by `if connectionState>=CA_AUTHORIZING and connectionState<CA_ACTIVE then connecting=1 end if`. |
| `connectedToPureServer` | `dynamic` | — | Value used by `if connectedToPureServer!=0 then mode=VMI_COMPILED end if`. |
| `vmUi` | `dynamic` | — | Value used by `mode=vmUi`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L119)

<a id="function-function-mq3-client-ui-vm-invoke-function-invoke-state-arguments-src-mq3-client-ui-vm-ml-1007047243"></a>
### invoke

```ml
function invoke(state, arguments)
```

Updates `state.callCount`, `state.lastExport`, `state.lastArgs` during UI vm `invoke`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI vm record/storage; this routine assigns `state.callCount`, `state.lastExport`, `state.lastArgs`. |
| `arguments` | `dynamic` | — | Sequence read at `arguments[0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L109)

<a id="function-function-mq3-client-ui-vm-isfullscreen-function-isfullscreen-state-src-mq3-client-ui-vm-ml-678153331"></a>
### isFullscreen

```ml
function isFullscreen(state)
```

Calls `mq3.client.ui_vm.invoke` from UI vm `isFullscreen`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI vm state passed to the helper calls in `isFullscreen`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L158)

<a id="constant-constant-mq3-client-ui-vm-keycatch-ui-const-keycatch-ui-2-src-mq3-client-ui-vm-ml-137168757"></a>
### KEYCATCH_UI

```ml
const KEYCATCH_UI = 2
```

UI keyboard-capture mask used when testing whether keyboard input belongs to the UI virtual machine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L35)

<a id="function-function-mq3-client-ui-vm-keyevent-function-keyevent-state-key-down-src-mq3-client-ui-vm-ml-231790894"></a>
### keyEvent

```ml
function keyEvent(state, key, down)
```

Calls `mq3.client.ui_vm.invoke` from UI vm `keyEvent`. The final path returns `invoke(state,[UI_KEY_EVENT,key,flag])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI vm state passed to the helper calls in `keyEvent`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI vm entry. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L146)

<a id="function-function-mq3-client-ui-vm-mouseevent-function-mouseevent-state-dx-dy-src-mq3-client-ui-vm-ml-732626418"></a>
### mouseEvent

```ml
function mouseEvent(state, dx, dy)
```

Adapts `mq3.client.ui_vm.invoke` to UI vm `mouseEvent`, returning its result for `state, [UI_MOUSE_EVENT,dx,dy]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_vm.invoke`. |
| `dx` | `dynamic` | — | Argument 2 of `mq3.client.ui_vm.invoke`; passed as `[UI_MOUSE_EVENT,dx,dy]`. |
| `dy` | `dynamic` | — | Argument 2 of `mq3.client.ui_vm.invoke`; passed as `[UI_MOUSE_EVENT,dx,dy]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L151)

<a id="function-function-mq3-client-ui-vm-refresh-function-refresh-state-time-src-mq3-client-ui-vm-ml-1866753598"></a>
### refresh

```ml
function refresh(state, time)
```

Adapts `mq3.client.ui_vm.invoke` to UI vm `refresh`, returning its result for `state, [UI_REFRESH,time]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_vm.invoke`. |
| `time` | `dynamic` | — | Argument 2 of `mq3.client.ui_vm.invoke`; passed as `[UI_REFRESH,time]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L155)

<a id="function-function-mq3-client-ui-vm-requireactive-function-requireactive-state-src-mq3-client-ui-vm-ml-1383688749"></a>
### requireActive

```ml
function requireActive(state)
```

Evaluates UI vm `requireActive` and returns `error(3451,"UI VM: module is not active")`, `state.slot` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.active`, `state.slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L102)

<a id="function-function-mq3-client-ui-vm-services-function-services-machineruntime-syscall-loadfn-callfn-freefn-src-mq3-client-ui-vm-ml-1985802094"></a>
### services

```ml
function services(machineRuntime, syscall, loadFn, callFn, freeFn)
```

Creates a `mq3.client.ui_vm.Services` record. Assigns `machineRuntime` from `machineRuntime`, `syscall` from `syscall`, `loadFn` from `loadFn`, `callFn` from `callFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machineRuntime` | `dynamic` | — | Value used to initialize `Services.machineRuntime`. |
| `syscall` | `dynamic` | — | Value used to initialize `Services.syscall`. |
| `loadFn` | `dynamic` | — | Value used to initialize `Services.loadFn`. |
| `callFn` | `dynamic` | — | Value used to initialize `Services.callFn`. |
| `freeFn` | `dynamic` | — | Value used to initialize `Services.freeFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L91)

- [mq3.client.ui_vm.Services](Type-mq3-client-ui-vm-services-284829901.md) — struct
<a id="function-function-mq3-client-ui-vm-setactivemenu-function-setactivemenu-state-menu-src-mq3-client-ui-vm-ml-2126103760"></a>
### setActiveMenu

```ml
function setActiveMenu(state, menu)
```

Adapts `mq3.client.ui_vm.invoke` to UI vm `setActiveMenu`, returning its result for `state, [UI_SET_ACTIVE_MENU,menu]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_vm.invoke`. |
| `menu` | `dynamic` | — | Argument 2 of `mq3.client.ui_vm.invoke`; passed as `[UI_SET_ACTIVE_MENU,menu]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L162)

<a id="function-function-mq3-client-ui-vm-shutdown-function-shutdown-state-src-mq3-client-ui-vm-ml-1553843307"></a>
### shutdown

```ml
function shutdown(state)
```

Updates `state.keyCatchers`, `state.uiStarted`, `state.slot`, `state.active` during UI vm `shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI vm record/storage; this routine assigns `state.keyCatchers`, `state.uiStarted`, `state.slot`, `state.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L135)

- [mq3.client.ui_vm.State](Type-mq3-client-ui-vm-state-459992910.md) — struct
<a id="constant-constant-mq3-client-ui-vm-ui-api-version-const-ui-api-version-6-src-mq3-client-ui-vm-ml-231608475"></a>
### UI_API_VERSION

```ml
const UI_API_VERSION = 6
```

UI virtual-machine interface version expected by the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L33)

<a id="constant-constant-mq3-client-ui-vm-ui-cd-api-version-const-ui-cd-api-version-3-src-mq3-client-ui-vm-ml-1334066534"></a>
### UI_CD_API_VERSION

```ml
const UI_CD_API_VERSION = 3
```

UI interface version associated with the native product-key support contract.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L29)

<a id="constant-constant-mq3-client-ui-vm-ui-console-command-const-ui-console-command-8-src-mq3-client-ui-vm-ml-405909721"></a>
### UI_CONSOLE_COMMAND

```ml
const UI_CONSOLE_COMMAND = 8
```

UI VM entry-point ordinal used to handle a UI console command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L23)

<a id="constant-constant-mq3-client-ui-vm-ui-draw-connect-screen-const-ui-draw-connect-screen-9-src-mq3-client-ui-vm-ml-890220196"></a>
### UI_DRAW_CONNECT_SCREEN

```ml
const UI_DRAW_CONNECT_SCREEN = 9
```

UI VM entry-point ordinal used to render the connection-progress screen.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L25)

<a id="constant-constant-mq3-client-ui-vm-ui-getapiversion-const-ui-getapiversion-0-src-mq3-client-ui-vm-ml-1689967871"></a>
### UI_GETAPIVERSION

```ml
const UI_GETAPIVERSION = 0
```

UI VM entry-point ordinal used to query the UI VM interface version.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L7)

<a id="constant-constant-mq3-client-ui-vm-ui-hasuniquecdkey-const-ui-hasuniquecdkey-10-src-mq3-client-ui-vm-ml-1198684520"></a>
### UI_HASUNIQUECDKEY

```ml
const UI_HASUNIQUECDKEY = 10
```

UI VM entry-point ordinal used to query whether the UI requires a unique product key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L27)

<a id="constant-constant-mq3-client-ui-vm-ui-init-const-ui-init-1-src-mq3-client-ui-vm-ml-1922200072"></a>
### UI_INIT

```ml
const UI_INIT = 1
```

UI VM entry-point ordinal used to initialize the UI VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L9)

<a id="constant-constant-mq3-client-ui-vm-ui-is-fullscreen-const-ui-is-fullscreen-6-src-mq3-client-ui-vm-ml-373426813"></a>
### UI_IS_FULLSCREEN

```ml
const UI_IS_FULLSCREEN = 6
```

UI VM entry-point ordinal used to query whether the UI covers the game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L19)

<a id="constant-constant-mq3-client-ui-vm-ui-key-event-const-ui-key-event-3-src-mq3-client-ui-vm-ml-30845414"></a>
### UI_KEY_EVENT

```ml
const UI_KEY_EVENT = 3
```

UI VM entry-point ordinal used to deliver a key event to the UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L13)

<a id="constant-constant-mq3-client-ui-vm-ui-mouse-event-const-ui-mouse-event-4-src-mq3-client-ui-vm-ml-1922737655"></a>
### UI_MOUSE_EVENT

```ml
const UI_MOUSE_EVENT = 4
```

UI VM entry-point ordinal used to deliver pointer motion to the UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L15)

<a id="constant-constant-mq3-client-ui-vm-ui-old-api-version-const-ui-old-api-version-4-src-mq3-client-ui-vm-ml-458792313"></a>
### UI_OLD_API_VERSION

```ml
const UI_OLD_API_VERSION = 4
```

Legacy UI interface version accepted by the engine adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L31)

<a id="constant-constant-mq3-client-ui-vm-ui-refresh-const-ui-refresh-5-src-mq3-client-ui-vm-ml-1204777286"></a>
### UI_REFRESH

```ml
const UI_REFRESH = 5
```

UI VM entry-point ordinal used to advance and render the UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L17)

<a id="constant-constant-mq3-client-ui-vm-ui-set-active-menu-const-ui-set-active-menu-7-src-mq3-client-ui-vm-ml-1559189380"></a>
### UI_SET_ACTIVE_MENU

```ml
const UI_SET_ACTIVE_MENU = 7
```

UI VM entry-point ordinal used to select the active UI menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L21)

<a id="constant-constant-mq3-client-ui-vm-ui-shutdown-const-ui-shutdown-2-src-mq3-client-ui-vm-ml-192115557"></a>
### UI_SHUTDOWN

```ml
const UI_SHUTDOWN = 2
```

UI VM entry-point ordinal used to shut down the UI VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L11)

<a id="function-function-mq3-client-ui-vm-usesuniquecdkey-function-usesuniquecdkey-state-src-mq3-client-ui-vm-ml-20953277"></a>
### usesUniqueCdKey

```ml
function usesUniqueCdKey(state)
```

Calls `mq3.client.ui_vm.invoke` from UI vm `usesUniqueCdKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L173)

<a id="constant-constant-mq3-client-ui-vm-vmi-compiled-const-vmi-compiled-2-src-mq3-client-ui-vm-ml-597660387"></a>
### VMI_COMPILED

```ml
const VMI_COMPILED = 2
```

VM execution mode selecting the engine's compiled VM path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_vm.ml#L42)
