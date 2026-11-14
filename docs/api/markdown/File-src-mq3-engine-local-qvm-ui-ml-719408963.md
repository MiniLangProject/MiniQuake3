# `src/mq3/engine/local_qvm_ui.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.engine.local_qvm_ui`](Package-mq3-engine-local-qvm-ui-232747571.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/original_ui_session.ml` as `uiSession` → [src/mq3/client/original_ui_session.ml](File-src-mq3-client-original-ui-session-ml-619334882.md)
- `mq3/client/ui_host_lifecycle.ml` as `uiHost` → [src/mq3/client/ui_host_lifecycle.ml](File-src-mq3-client-ui-host-lifecycle-ml-451482783.md)
- `mq3/client/ui_vm.ml` as `uiVm` → [src/mq3/client/ui_vm.ml](File-src-mq3-client-ui-vm-ml-1076773103.md)
- `mq3/engine/local_qvm_match.ml` as `localMatch` → [src/mq3/engine/local_qvm_match.ml](File-src-mq3-engine-local-qvm-match-ml-725859098.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/command_queue.ml` as `q2commands` → [src/mq3/renderer/command_queue.ml](File-src-mq3-renderer-command-queue-ml-1425855282.md)

## Declarations

<a id="function-function-mq3-engine-local-qvm-ui-attach-function-attach-state-inputcontext-keydownfn-mousedeltafn-src-mq3-engine-local-qvm-ui-ml-336125708"></a>
### attach

```ml
function attach(state, inputContext, keyDownFn, mouseDeltaFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `inputContext` | `dynamic` | — |  |
| `keyDownFn` | `dynamic` | — |  |
| `mouseDeltaFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L27)

<a id="function-function-mq3-engine-local-qvm-ui-attachnative-function-attachnative-state-src-mq3-engine-local-qvm-ui-ml-353521265"></a>
### attachNative

```ml
function attachNative(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L33)

<a id="function-function-mq3-engine-local-qvm-ui-bootandattachnative-function-bootandattachnative-state-menu-src-mq3-engine-local-qvm-ui-ml-1182127176"></a>
### bootAndAttachNative

```ml
function bootAndAttachNative(state, menu)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `menu` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L34)

<a id="function-function-mq3-engine-local-qvm-ui-commandcount-function-commandcount-state-src-mq3-engine-local-qvm-ui-ml-973048829"></a>
### commandCount

```ml
function commandCount(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L22)

<a id="function-function-mq3-engine-local-qvm-ui-drawconnectscreen-function-drawconnectscreen-state-overlay-src-mq3-engine-local-qvm-ui-ml-203414941"></a>
### drawConnectScreen

```ml
function drawConnectScreen(state, overlay)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `overlay` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L19)

<a id="function-function-mq3-engine-local-qvm-ui-drawscreen-function-drawscreen-state-connectionstate-now-cgamefn-cinematicfn-src-mq3-engine-local-qvm-ui-ml-525158490"></a>
### drawScreen

```ml
function drawScreen(state, connectionState, now, cgameFn, cinematicFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `connectionState` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `cgameFn` | `dynamic` | — |  |
| `cinematicFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L42)

<a id="function-function-mq3-engine-local-qvm-ui-fail-function-fail-message-src-mq3-engine-local-qvm-ui-ml-1448749587"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L12)

<a id="function-function-mq3-engine-local-qvm-ui-fullscreen-function-fullscreen-state-src-mq3-engine-local-qvm-ui-ml-1940518557"></a>
### fullscreen

```ml
function fullscreen(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L20)

<a id="function-function-mq3-engine-local-qvm-ui-getcatcher-function-getcatcher-state-src-mq3-engine-local-qvm-ui-ml-935694693"></a>
### getCatcher

```ml
function getCatcher(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L13)

<a id="function-function-mq3-engine-local-qvm-ui-keyevent-function-keyevent-state-key-down-src-mq3-engine-local-qvm-ui-ml-1381999514"></a>
### keyEvent

```ml
function keyEvent(state, key, down)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L14)

<a id="function-function-mq3-engine-local-qvm-ui-mouseevent-function-mouseevent-state-dx-dy-src-mq3-engine-local-qvm-ui-ml-722567690"></a>
### mouseEvent

```ml
function mouseEvent(state, dx, dy)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `dx` | `dynamic` | — |  |
| `dy` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L16)

<a id="function-function-mq3-engine-local-qvm-ui-nativekeydown-function-nativekeydown-context-key-src-mq3-engine-local-qvm-ui-ml-1150154600"></a>
### nativeKeyDown

```ml
function nativeKeyDown(context, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L31)

<a id="function-function-mq3-engine-local-qvm-ui-nativemousedelta-function-nativemousedelta-context-src-mq3-engine-local-qvm-ui-ml-961176847"></a>
### nativeMouseDelta

```ml
function nativeMouseDelta(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L32)

<a id="function-function-mq3-engine-local-qvm-ui-refresh-function-refresh-state-now-src-mq3-engine-local-qvm-ui-ml-1952797367"></a>
### refresh

```ml
function refresh(state, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L17)

<a id="function-function-mq3-engine-local-qvm-ui-resetframecommands-function-resetframecommands-state-src-mq3-engine-local-qvm-ui-ml-380445689"></a>
### resetFrameCommands

```ml
function resetFrameCommands(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L21)

<a id="function-function-mq3-engine-local-qvm-ui-serviceset-function-serviceset-state-src-mq3-engine-local-qvm-ui-ml-1243028329"></a>
### serviceSet

```ml
function serviceSet(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L23)

<a id="function-function-mq3-engine-local-qvm-ui-setmenu-function-setmenu-state-menu-src-mq3-engine-local-qvm-ui-ml-1106482704"></a>
### setMenu

```ml
function setMenu(state, menu)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `menu` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L18)

<a id="function-function-mq3-engine-local-qvm-ui-stateevent-function-stateevent-state-key-down-src-mq3-engine-local-qvm-ui-ml-986364102"></a>
### stateEvent

```ml
function stateEvent(state, key, down)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L15)
