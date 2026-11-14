# `src/mq3/client/qvm_menu_app.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.qvm_menu_app`](Package-mq3-client-qvm-menu-app-2008927821.md)

Reachable from entry: **yes**

## Imports

- `mq3/audio/qvm_playback.ml` as `qvmPlayback` → [src/mq3/audio/qvm_playback.ml](File-src-mq3-audio-qvm-playback-ml-324023706.md)
- `mq3/audio/qvm_sound_assets.ml` as `qvmSoundAssets` → [src/mq3/audio/qvm_sound_assets.ml](File-src-mq3-audio-qvm-sound-assets-ml-1587569282.md)
- `mq3/client/original_ui_session.ml` as `uiSession` → [src/mq3/client/original_ui_session.ml](File-src-mq3-client-original-ui-session-ml-619334882.md)
- `mq3/client/qvm_preview_app.ml` as `gameApp` → [src/mq3/client/qvm_preview_app.ml](File-src-mq3-client-qvm-preview-app-ml-1410259322.md)
- `mq3/client/ui_input_latch.ml` as `inputLatch` → [src/mq3/client/ui_input_latch.ml](File-src-mq3-client-ui-input-latch-ml-1943622233.md)
- `mq3/engine/local_qvm_match.ml` as `match` → [src/mq3/engine/local_qvm_match.ml](File-src-mq3-engine-local-qvm-match-ml-725859098.md)
- `mq3/engine/local_qvm_ui.ml` as `localQvmUi` → [src/mq3/engine/local_qvm_ui.ml](File-src-mq3-engine-local-qvm-ui-ml-719408963.md)
- `mq3/format/bsp.ml` as `bsp` → [src/mq3/format/bsp.ml](File-src-mq3-format-bsp-ml-526613882.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/platform/playable_ambient.ml` as `audioOutput` → [src/mq3/platform/playable_ambient.ml](File-src-mq3-platform-playable-ambient-ml-1461563654.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/qvm_2d_batch.ml` as `qvm2d` → [src/mq3/renderer/qvm_2d_batch.ml](File-src-mq3-renderer-qvm-2d-batch-ml-1820350507.md)
- `mq3/renderer/shader_index.ml` as `shaderIndex` → [src/mq3/renderer/shader_index.ml](File-src-mq3-renderer-shader-index-ml-492021135.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency
- `std/time.ml` as `time` → `../MiniLangCompilerML/std/time.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-qvm-menu-app-fail-function-fail-message-src-mq3-client-qvm-menu-app-ml-219657267"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L31)

<a id="constant-constant-mq3-client-qvm-menu-app-first-texture-slot-const-first-texture-slot-1-src-mq3-client-qvm-menu-app-ml-1030347800"></a>
### FIRST_TEXTURE_SLOT

```ml
const FIRST_TEXTURE_SLOT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L26)

<a id="constant-constant-mq3-client-qvm-menu-app-height-const-height-720-src-mq3-client-qvm-menu-app-ml-1697392696"></a>
### HEIGHT

```ml
const HEIGHT = 720
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L23)

<a id="function-function-mq3-client-qvm-menu-app-keydown-function-keydown-context-key-src-mq3-client-qvm-menu-app-ml-1209935378"></a>
### keyDown

```ml
function keyDown(context, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L32)

<a id="constant-constant-mq3-client-qvm-menu-app-max-texture-slots-const-max-texture-slots-300-src-mq3-client-qvm-menu-app-ml-572085514"></a>
### MAX_TEXTURE_SLOTS

```ml
const MAX_TEXTURE_SLOTS = 300
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L27)

<a id="function-function-mq3-client-qvm-menu-app-mousedelta-function-mousedelta-context-src-mq3-client-qvm-menu-app-ml-145030543"></a>
### mouseDelta

```ml
function mouseDelta(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L36)

- [mq3.client.qvm_menu_app.NativeInput](Type-mq3-client-qvm-menu-app-nativeinput-390673506.md) — struct
<a id="function-function-mq3-client-qvm-menu-app-observeinputevents-function-observeinputevents-input-events-src-mq3-client-qvm-menu-app-ml-1338522485"></a>
### observeInputEvents

```ml
function observeInputEvents(input, events)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `events` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L37)

<a id="function-function-mq3-client-qvm-menu-app-requestedmap-function-requestedmap-state-start-src-mq3-client-qvm-menu-app-ml-373265853"></a>
### requestedMap

```ml
function requestedMap(state, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L42)

<a id="function-function-mq3-client-qvm-menu-app-requestedquit-function-requestedquit-state-start-src-mq3-client-qvm-menu-app-ml-1291991575"></a>
### requestedQuit

```ml
function requestedQuit(state, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L57)

<a id="function-function-mq3-client-qvm-menu-app-run-function-run-archive-bootstrapmap-qvmroot-src-mq3-client-qvm-menu-app-ml-1503318232"></a>
### run

```ml
function run(archive, bootstrapMap, qvmRoot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `bootstrapMap` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L66)

<a id="constant-constant-mq3-client-qvm-menu-app-source-height-const-source-height-720-src-mq3-client-qvm-menu-app-ml-1893579200"></a>
### SOURCE_HEIGHT

```ml
const SOURCE_HEIGHT = 720
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L25)

<a id="constant-constant-mq3-client-qvm-menu-app-source-width-const-source-width-1280-src-mq3-client-qvm-menu-app-ml-723930664"></a>
### SOURCE_WIDTH

```ml
const SOURCE_WIDTH = 1280
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L24)

<a id="constant-constant-mq3-client-qvm-menu-app-width-const-width-1280-src-mq3-client-qvm-menu-app-ml-1328764194"></a>
### WIDTH

```ml
const WIDTH = 1280
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_menu_app.ml#L22)
