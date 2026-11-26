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

Compute attach in engine.local_qvm_ui; the normal completion returns `uiSession.create(configured, inputContext, keyDownFn, mouseDeltaFn)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.engine.local_qvm_ui.serviceSet`. |
| `inputContext` | `dynamic` | — | Input context passed as `inputContext` to `mq3.client.original_ui_session.create`. |
| `keyDownFn` | `dynamic` | — | Key down fn passed as `keyDownFn` to `mq3.client.original_ui_session.create`. |
| `mouseDeltaFn` | `dynamic` | — | Mouse delta fn passed as `mouseDeltaFn` to `mq3.client.original_ui_session.create`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L65)

<a id="function-function-mq3-engine-local-qvm-ui-attachnative-function-attachnative-state-src-mq3-engine-local-qvm-ui-ml-353521265"></a>
### attachNative

```ml
function attachNative(state)
```

Return `mq3.engine.local_qvm_ui.attach(state, void, nativeKeyDown, nativeMouseDelta)` from `engine.local_qvm_ui.attachNative`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.engine.local_qvm_ui.attach`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L78)

<a id="function-function-mq3-engine-local-qvm-ui-bootandattachnative-function-bootandattachnative-state-menu-src-mq3-engine-local-qvm-ui-ml-1182127176"></a>
### bootAndAttachNative

```ml
function bootAndAttachNative(state, menu)
```

Compute boot and attach native in engine.local_qvm_ui; the normal completion returns `session`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `ui`. |
| `menu` | `dynamic` | — | Menu passed as `menu` to `mq3.client.original_ui_session.setMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L82)

<a id="function-function-mq3-engine-local-qvm-ui-commandcount-function-commandcount-state-src-mq3-engine-local-qvm-ui-ml-973048829"></a>
### commandCount

```ml
function commandCount(state)
```

Return `mq3.renderer.command_queue.count(state.context.renderQueue)` from `engine.local_qvm_ui.commandCount`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L53)

<a id="function-function-mq3-engine-local-qvm-ui-drawconnectscreen-function-drawconnectscreen-state-overlay-src-mq3-engine-local-qvm-ui-ml-203414941"></a>
### drawConnectScreen

```ml
function drawConnectScreen(state, overlay)
```

Return `mq3.client.ui_vm.drawConnectScreen(state.ui, overlay)` from `engine.local_qvm_ui.drawConnectScreen`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `ui`. |
| `overlay` | `dynamic` | — | Overlay passed as `overlay` to `mq3.client.ui_vm.drawConnectScreen`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L44)

<a id="function-function-mq3-engine-local-qvm-ui-drawscreen-function-drawscreen-state-connectionstate-now-cgamefn-cinematicfn-src-mq3-engine-local-qvm-ui-ml-525158490"></a>
### drawScreen

```ml
function drawScreen(state, connectionState, now, cgameFn, cinematicFn)
```

Compute draw screen in engine.local_qvm_ui; the normal completion returns `uiHost.drawScreen(configured, connectionState, now)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `ui`, `context`. |
| `connectionState` | `dynamic` | — | Conn state passed as `connState` to `mq3.client.ui_host_lifecycle.drawScreen`. |
| `now` | `dynamic` | — | Realtime passed as `realtime` to `mq3.client.ui_host_lifecycle.drawScreen`. |
| `cgameFn` | `dynamic` | — | Cgame fn passed as `cgameFn` to `mq3.client.ui_host_lifecycle.services`. |
| `cinematicFn` | `dynamic` | — | Cinematic fn passed as `cinematicFn` to `mq3.client.ui_host_lifecycle.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L96)

<a id="function-function-mq3-engine-local-qvm-ui-fail-function-fail-message-src-mq3-engine-local-qvm-ui-ml-1448749587"></a>
### fail

```ml
function fail(message)
```

Create the engine.local_qvm_ui error for `fail` with 7687 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("local QVM UI: " + message)` and `error(7687, ("local QVM UI: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L14)

<a id="function-function-mq3-engine-local-qvm-ui-fullscreen-function-fullscreen-state-src-mq3-engine-local-qvm-ui-ml-1940518557"></a>
### fullscreen

```ml
function fullscreen(state)
```

Return `mq3.client.ui_vm.isFullscreen(state.ui)` from `engine.local_qvm_ui.fullscreen`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `ui`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L47)

<a id="function-function-mq3-engine-local-qvm-ui-getcatcher-function-getcatcher-state-src-mq3-engine-local-qvm-ui-ml-935694693"></a>
### getCatcher

```ml
function getCatcher(state)
```

Return `mq3.engine.local_qvm_match.keyCatcher(state)` from `engine.local_qvm_ui.getCatcher`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value passed as `value` to `mq3.engine.local_qvm_match.keyCatcher`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L17)

<a id="function-function-mq3-engine-local-qvm-ui-keyevent-function-keyevent-state-key-down-src-mq3-engine-local-qvm-ui-ml-1381999514"></a>
### keyEvent

```ml
function keyEvent(state, key, down)
```

Return `mq3.client.ui_vm.keyEvent(state.ui, key, down)` from `engine.local_qvm_ui.keyEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `ui`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.client.ui_vm.keyEvent`. |
| `down` | `dynamic` | — | Down passed as `down` to `mq3.client.ui_vm.keyEvent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L22)

<a id="function-function-mq3-engine-local-qvm-ui-mouseevent-function-mouseevent-state-dx-dy-src-mq3-engine-local-qvm-ui-ml-722567690"></a>
### mouseEvent

```ml
function mouseEvent(state, dx, dy)
```

Return `mq3.client.ui_vm.mouseEvent(state.ui, dx, dy)` from `engine.local_qvm_ui.mouseEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `ui`. |
| `dx` | `dynamic` | — | Dx passed as `dx` to `mq3.client.ui_vm.mouseEvent`. |
| `dy` | `dynamic` | — | Dy passed as `dy` to `mq3.client.ui_vm.mouseEvent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L32)

<a id="function-function-mq3-engine-local-qvm-ui-nativekeydown-function-nativekeydown-context-key-src-mq3-engine-local-qvm-ui-ml-1150154600"></a>
### nativeKeyDown

```ml
function nativeKeyDown(context, key)
```

Return `mq3.platform.playable_window.inputKeyDown(key)` from `engine.local_qvm_ui.nativeKeyDown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.platform.playable_window.inputKeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L72)

<a id="function-function-mq3-engine-local-qvm-ui-nativemousedelta-function-nativemousedelta-context-src-mq3-engine-local-qvm-ui-ml-961176847"></a>
### nativeMouseDelta

```ml
function nativeMouseDelta(context)
```

Return `mq3.platform.playable_window.mouseDelta()` from `engine.local_qvm_ui.nativeMouseDelta`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L75)

<a id="function-function-mq3-engine-local-qvm-ui-refresh-function-refresh-state-now-src-mq3-engine-local-qvm-ui-ml-1952797367"></a>
### refresh

```ml
function refresh(state, now)
```

Return `mq3.engine.local_qvm_match.refreshUi(state, now)` from `engine.local_qvm_ui.refresh`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value passed as `value` to `mq3.engine.local_qvm_match.refreshUi`. |
| `now` | `dynamic` | — | Time passed as `time` to `mq3.engine.local_qvm_match.refreshUi`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L36)

<a id="function-function-mq3-engine-local-qvm-ui-resetframecommands-function-resetframecommands-state-src-mq3-engine-local-qvm-ui-ml-380445689"></a>
### resetFrameCommands

```ml
function resetFrameCommands(state)
```

Reset frame commands in engine.local_qvm_ui; the normal completion returns `localMatch.beginRendererFrame(state)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value passed as `value` to `mq3.engine.local_qvm_match.beginRendererFrame`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L50)

<a id="function-function-mq3-engine-local-qvm-ui-serviceset-function-serviceset-state-src-mq3-engine-local-qvm-ui-ml-1243028329"></a>
### serviceSet

```ml
function serviceSet(state)
```

Compute service set in engine.local_qvm_ui; the normal completion returns `services`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `ui`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L56)

<a id="function-function-mq3-engine-local-qvm-ui-setmenu-function-setmenu-state-menu-src-mq3-engine-local-qvm-ui-ml-1106482704"></a>
### setMenu

```ml
function setMenu(state, menu)
```

Return `mq3.engine.local_qvm_match.setUiMenu(state, menu)` from `engine.local_qvm_ui.setMenu`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value passed as `value` to `mq3.engine.local_qvm_match.setUiMenu`. |
| `menu` | `dynamic` | — | Menu passed as `menu` to `mq3.engine.local_qvm_match.setUiMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L40)

<a id="function-function-mq3-engine-local-qvm-ui-stateevent-function-stateevent-state-key-down-src-mq3-engine-local-qvm-ui-ml-986364102"></a>
### stateEvent

```ml
function stateEvent(state, key, down)
```

Compute state event in engine.local_qvm_ui.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value passed as `value` to `mq3.engine.local_qvm_match.setKeyDown`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.engine.local_qvm_match.setKeyDown`. |
| `down` | `dynamic` | — | Down passed as `down` to `mq3.engine.local_qvm_match.setKeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_ui.ml#L27)
