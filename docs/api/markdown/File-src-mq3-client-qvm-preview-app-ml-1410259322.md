# `src/mq3/client/qvm_preview_app.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.qvm_preview_app`](Package-mq3-client-qvm-preview-app-2129609326.md)

Reachable from entry: **yes**

## Imports

- `mq3/audio/qvm_playback.ml` as `qvmPlayback` → [src/mq3/audio/qvm_playback.ml](File-src-mq3-audio-qvm-playback-ml-324023706.md)
- `mq3/audio/qvm_sound_assets.ml` as `qvmSoundAssets` → [src/mq3/audio/qvm_sound_assets.ml](File-src-mq3-audio-qvm-sound-assets-ml-1587569282.md)
- `mq3/client/baseq3_console_background.ml` as `consoleBackground` → [src/mq3/client/baseq3_console_background.ml](File-src-mq3-client-baseq3-console-background-ml-1394936477.md)
- `mq3/client/baseq3_match_display.ml` as `baseMatchDisplay` → [src/mq3/client/baseq3_match_display.ml](File-src-mq3-client-baseq3-match-display-ml-1367704051.md)
- `mq3/client/cgame_clock.ml` as `cgameClock` → [src/mq3/client/cgame_clock.ml](File-src-mq3-client-cgame-clock-ml-1618125963.md)
- `mq3/client/cinematic_runtime.ml` as `cinematics` → [src/mq3/client/cinematic_runtime.ml](File-src-mq3-client-cinematic-runtime-ml-1539162371.md)
- `mq3/client/cl_console.ml` as `clientConsole` → [src/mq3/client/cl_console.ml](File-src-mq3-client-cl-console-ml-1724798958.md)
- `mq3/client/console_input.ml` as `consoleInput` → [src/mq3/client/console_input.ml](File-src-mq3-client-console-input-ml-896040399.md)
- `mq3/client/console_input_display.ml` as `consoleDisplay` → [src/mq3/client/console_input_display.ml](File-src-mq3-client-console-input-display-ml-1771363644.md)
- `mq3/client/input_command.ml` as `inputCommand` → [src/mq3/client/input_command.ml](File-src-mq3-client-input-command-ml-1980603655.md)
- `mq3/client/input_command_events.ml` as `timestampedInput` → [src/mq3/client/input_command_events.ml](File-src-mq3-client-input-command-events-ml-1691230747.md)
- `mq3/client/original_ui_session.ml` as `uiSession` → [src/mq3/client/original_ui_session.ml](File-src-mq3-client-original-ui-session-ml-619334882.md)
- `mq3/client/playable_fps_title.ml` as `fpsTitle` → [src/mq3/client/playable_fps_title.ml](File-src-mq3-client-playable-fps-title-ml-173965588.md)
- `mq3/client/playable_sky.ml` as `playableSky` → [src/mq3/client/playable_sky.ml](File-src-mq3-client-playable-sky-ml-624488737.md)
- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/client/ui_input_latch.ml` as `inputLatch` → [src/mq3/client/ui_input_latch.ml](File-src-mq3-client-ui-input-latch-ml-1943622233.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/engine/local_qvm_match.ml` as `match` → [src/mq3/engine/local_qvm_match.ml](File-src-mq3-engine-local-qvm-match-ml-725859098.md)
- `mq3/engine/local_qvm_ui.ml` as `localQvmUi` → [src/mq3/engine/local_qvm_ui.ml](File-src-mq3-engine-local-qvm-ui-ml-719408963.md)
- `mq3/platform/playable_ambient.ml` as `audioOutput` → [src/mq3/platform/playable_ambient.ml](File-src-mq3-platform-playable-ambient-ml-1461563654.md)
- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/qcommon/cvar.ml` as `cvar` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `mq3/renderer/bsp_render_data.ml` as `renderData` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)
- `mq3/renderer/command_queue.ml` as `renderCommands` → [src/mq3/renderer/command_queue.ml](File-src-mq3-renderer-command-queue-ml-1425855282.md)
- `mq3/renderer/playable_dynamic_lights.ml` as `dynamicLights` → [src/mq3/renderer/playable_dynamic_lights.ml](File-src-mq3-renderer-playable-dynamic-lights-ml-229722941.md)
- `mq3/renderer/playable_flares.ml` as `flares` → [src/mq3/renderer/playable_flares.ml](File-src-mq3-renderer-playable-flares-ml-2125885383.md)
- `mq3/renderer/playable_fog.ml` as `playableFog` → [src/mq3/renderer/playable_fog.ml](File-src-mq3-renderer-playable-fog-ml-140703890.md)
- `mq3/renderer/playable_light_grid.ml` as `lightGrid` → [src/mq3/renderer/playable_light_grid.ml](File-src-mq3-renderer-playable-light-grid-ml-1846122219.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/playable_world_batch.ml` as `worldBatch` → [src/mq3/renderer/playable_world_batch.ml](File-src-mq3-renderer-playable-world-batch-ml-1411140007.md)
- `mq3/renderer/portal_clip.ml` as `portalClip` → [src/mq3/renderer/portal_clip.ml](File-src-mq3-renderer-portal-clip-ml-347930170.md)
- `mq3/renderer/portal_render_pass.ml` as `portalPass` → [src/mq3/renderer/portal_render_pass.ml](File-src-mq3-renderer-portal-render-pass-ml-1378707998.md)
- `mq3/renderer/qvm_2d_batch.ml` as `qvm2d` → [src/mq3/renderer/qvm_2d_batch.ml](File-src-mq3-renderer-qvm-2d-batch-ml-1820350507.md)
- `mq3/renderer/qvm_scene_batch.ml` as `sceneBatch` → [src/mq3/renderer/qvm_scene_batch.ml](File-src-mq3-renderer-qvm-scene-batch-ml-1031575875.md)
- `mq3/renderer/qvm_scene_geometry.ml` as `sceneGeometry` → [src/mq3/renderer/qvm_scene_geometry.ml](File-src-mq3-renderer-qvm-scene-geometry-ml-51177627.md)
- `mq3/renderer/qvm_scene_materials.ml` as `sceneMaterials` → [src/mq3/renderer/qvm_scene_materials.ml](File-src-mq3-renderer-qvm-scene-materials-ml-310916497.md)
- `mq3/renderer/qvm_video_materials.ml` as `qvmVideo` → [src/mq3/renderer/qvm_video_materials.ml](File-src-mq3-renderer-qvm-video-materials-ml-550085236.md)
- `mq3/renderer/qvm_viewport.ml` as `qvmViewport` → [src/mq3/renderer/qvm_viewport.ml](File-src-mq3-renderer-qvm-viewport-ml-2024971226.md)
- `mq3/renderer/world_surface_selection.ml` as `worldSelection` → [src/mq3/renderer/world_surface_selection.ml](File-src-mq3-renderer-world-surface-selection-ml-1945526598.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `mq3/vm/syscall_qagame_world.ml` as `qworld` → [src/mq3/vm/syscall_qagame_world.ml](File-src-mq3-vm-syscall-qagame-world-ml-663586900.md)
- `std/ds/queue.ml` as `queues` → `../MiniLangCompilerML/std/ds/queue.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency
- `std/time.ml` as `time` → `../MiniLangCompilerML/std/time.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-qvm-preview-app-advancegametick-function-advancegametick-state-clientclock-servertime-input-src-mq3-client-qvm-preview-app-ml-1943102498"></a>
### advanceGameTick

```ml
function advanceGameTick(state, clientClock, serverTime, input)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientClock` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |
| `input` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L176)

<a id="function-function-mq3-client-qvm-preview-app-anglecommand-function-anglecommand-degrees-deltaangle-src-mq3-client-qvm-preview-app-ml-2115190314"></a>
### angleCommand

```ml
function angleCommand(degrees, deltaAngle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `degrees` | `dynamic` | — |  |
| `deltaAngle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L112)

<a id="function-function-mq3-client-qvm-preview-app-applyinputevent-function-applyinputevent-state-matchstate-event-src-mq3-client-qvm-preview-app-ml-534614793"></a>
### applyInputEvent

```ml
function applyInputEvent(state, matchState, event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `matchState` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L133)

<a id="function-function-mq3-client-qvm-preview-app-attachworldeffects-function-attachworldeffects-batch-triangles-fogcatalog-dlightcatalog-dlightreceiveflags-src-mq3-client-qvm-preview-app-ml-1732177889"></a>
### attachWorldEffects

```ml
function attachWorldEffects(batch, triangles, fogCatalog, dlightCatalog, dlightReceiveFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `triangles` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `dlightCatalog` | `dynamic` | — |  |
| `dlightReceiveFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L201)

<a id="function-function-mq3-client-qvm-preview-app-bootframe-function-bootframe-archive-map-qvmroot-src-mq3-client-qvm-preview-app-ml-1136985614"></a>
### bootFrame

```ml
function bootFrame(archive, map, qvmRoot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L272)

<a id="function-function-mq3-client-qvm-preview-app-bootframesettings-function-bootframesettings-archive-map-qvmroot-settings-src-mq3-client-qvm-preview-app-ml-439464879"></a>
### bootFrameSettings

```ml
function bootFrameSettings(archive, map, qvmRoot, settings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L271)

<a id="function-function-mq3-client-qvm-preview-app-bootframesettingsnamed-function-bootframesettingsnamed-archive-map-mapname-qvmroot-settings-src-mq3-client-qvm-preview-app-ml-874531042"></a>
### bootFrameSettingsNamed

```ml
function bootFrameSettingsNamed(archive, map, mapName, qvmRoot, settings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L253)

<a id="constant-constant-mq3-client-qvm-preview-app-cinematic-texture-first-slot-const-cinematic-texture-first-slot-496-src-mq3-client-qvm-preview-app-ml-1801906326"></a>
### CINEMATIC_TEXTURE_FIRST_SLOT

```ml
const CINEMATIC_TEXTURE_FIRST_SLOT = 496
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L59)

<a id="function-function-mq3-client-qvm-preview-app-collectcinematicaudio-function-collectcinematicaudio-state-audio-src-mq3-client-qvm-preview-app-ml-242520023"></a>
### collectCinematicAudio

```ml
function collectCinematicAudio(state, audio)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `audio` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L242)

<a id="constant-constant-mq3-client-qvm-preview-app-console-background-texture-slot-const-console-background-texture-slot-493-src-mq3-client-qvm-preview-app-ml-1871267541"></a>
### CONSOLE_BACKGROUND_TEXTURE_SLOT

```ml
const CONSOLE_BACKGROUND_TEXTURE_SLOT = 493
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L57)

<a id="constant-constant-mq3-client-qvm-preview-app-console-font-texture-slot-const-console-font-texture-slot-495-src-mq3-client-qvm-preview-app-ml-820461235"></a>
### CONSOLE_FONT_TEXTURE_SLOT

```ml
const CONSOLE_FONT_TEXTURE_SLOT = 495
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L58)

<a id="function-function-mq3-client-qvm-preview-app-consolecolor-function-consolecolor-index-src-mq3-client-qvm-preview-app-ml-1812814962"></a>
### consoleColor

```ml
function consoleColor(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L148)

<a id="function-function-mq3-client-qvm-preview-app-drawcinematics-function-drawcinematics-state-src-mq3-client-qvm-preview-app-ml-635420417"></a>
### drawCinematics

```ml
function drawCinematics(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L227)

<a id="function-function-mq3-client-qvm-preview-app-drawconsolefield-function-drawconsolefield-media-field-scalex-scaley-src-mq3-client-qvm-preview-app-ml-1392223159"></a>
### drawConsoleField

```ml
function drawConsoleField(media, field, scaleX, scaleY)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |
| `field` | `dynamic` | — |  |
| `scaleX` | `dynamic` | — |  |
| `scaleY` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L155)

<a id="function-function-mq3-client-qvm-preview-app-drawconsoleglyph-function-drawconsoleglyph-media-glyph-scalex-scaley-src-mq3-client-qvm-preview-app-ml-1785230289"></a>
### drawConsoleGlyph

```ml
function drawConsoleGlyph(media, glyph, scaleX, scaleY)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |
| `glyph` | `dynamic` | — |  |
| `scaleX` | `dynamic` | — |  |
| `scaleY` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L152)

<a id="function-function-mq3-client-qvm-preview-app-drawframe-function-drawframe-state-clientclock-realtime-src-mq3-client-qvm-preview-app-ml-832340283"></a>
### drawFrame

```ml
function drawFrame(state, clientClock, realtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientClock` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L185)

<a id="function-function-mq3-client-qvm-preview-app-drawproductiveconsole-function-drawproductiveconsole-media-background-matchstate-width-height-now-src-mq3-client-qvm-preview-app-ml-1382357431"></a>
### drawProductiveConsole

```ml
function drawProductiveConsole(media, background, matchState, width, height, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — |  |
| `background` | `dynamic` | — |  |
| `matchState` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L158)

<a id="function-function-mq3-client-qvm-preview-app-ensureplayablebindings-function-ensureplayablebindings-state-src-mq3-client-qvm-preview-app-ml-95324173"></a>
### ensurePlayableBindings

```ml
function ensurePlayableBindings(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L170)

<a id="function-function-mq3-client-qvm-preview-app-fail-function-fail-message-src-mq3-client-qvm-preview-app-ml-962886303"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L70)

<a id="constant-constant-mq3-client-qvm-preview-app-height-const-height-720-src-mq3-client-qvm-preview-app-ml-699429638"></a>
### HEIGHT

```ml
const HEIGHT = 720
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L52)

<a id="function-function-mq3-client-qvm-preview-app-largestview-function-largestview-views-src-mq3-client-qvm-preview-app-ml-1166095238"></a>
### largestView

```ml
function largestView(views)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `views` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L79)

<a id="constant-constant-mq3-client-qvm-preview-app-max-qvm-2d-texture-slots-const-max-qvm-2d-texture-slots-93-src-mq3-client-qvm-preview-app-ml-2078260519"></a>
### MAX_QVM_2D_TEXTURE_SLOTS

```ml
const MAX_QVM_2D_TEXTURE_SLOTS = 93
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L56)

<a id="constant-constant-mq3-client-qvm-preview-app-max-qvm-texture-slots-const-max-qvm-texture-slots-64-src-mq3-client-qvm-preview-app-ml-74192923"></a>
### MAX_QVM_TEXTURE_SLOTS

```ml
const MAX_QVM_TEXTURE_SLOTS = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L54)

<a id="constant-constant-mq3-client-qvm-preview-app-max-world-triangles-const-max-world-triangles-20000-src-mq3-client-qvm-preview-app-ml-1133930495"></a>
### MAX_WORLD_TRIANGLES

```ml
const MAX_WORLD_TRIANGLES = 20000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L60)

<a id="function-function-mq3-client-qvm-preview-app-movementaxis-function-movementaxis-positive-negative-src-mq3-client-qvm-preview-app-ml-20105338"></a>
### movementAxis

```ml
function movementAxis(positive, negative)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `positive` | `dynamic` | — |  |
| `negative` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L115)

- [mq3.client.qvm_preview_app.NativeInput](Type-mq3-client-qvm-preview-app-nativeinput-2029931049.md) — struct
<a id="function-function-mq3-client-qvm-preview-app-nativekeydown-function-nativekeydown-input-key-src-mq3-client-qvm-preview-app-ml-655810527"></a>
### nativeKeyDown

```ml
function nativeKeyDown(input, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L120)

<a id="function-function-mq3-client-qvm-preview-app-nativemousedelta-function-nativemousedelta-input-src-mq3-client-qvm-preview-app-ml-1028687110"></a>
### nativeMouseDelta

```ml
function nativeMouseDelta(input)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L124)

<a id="function-function-mq3-client-qvm-preview-app-nativequakekey-function-nativequakekey-virtualkey-src-mq3-client-qvm-preview-app-ml-962849984"></a>
### nativeQuakeKey

```ml
function nativeQuakeKey(virtualKey)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `virtualKey` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L129)

<a id="function-function-mq3-client-qvm-preview-app-observenativeinputevents-function-observenativeinputevents-input-events-src-mq3-client-qvm-preview-app-ml-802665141"></a>
### observeNativeInputEvents

```ml
function observeNativeInputEvents(input, events)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `events` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L125)

- [mq3.client.qvm_preview_app.PipelineProfile](Type-mq3-client-qvm-preview-app-pipelineprofile-146312419.md) — struct
- [mq3.client.qvm_preview_app.PreparedPortal](Type-mq3-client-qvm-preview-app-preparedportal-1948659867.md) — struct
- [mq3.client.qvm_preview_app.PreparedView](Type-mq3-client-qvm-preview-app-preparedview-1114063912.md) — struct
<a id="function-function-mq3-client-qvm-preview-app-prepareportal-function-prepareportal-source-selectedworld-worldcatalog-qvmcatalog-archive-assets-kinds-framecache-grid-videomanager-worldcache-worldconfig-skyflags-fogcatalog-dlightcatalog-dlightreceiveflags-shadowmode-lodscale-lodbias-src-mq3-client-qvm-preview-app-ml-1326096735"></a>
### preparePortal

```ml
function preparePortal(source, selectedWorld, worldCatalog, qvmCatalog, archive, assets, kinds, frameCache, grid, videoManager, worldCache, worldConfig, skyFlags, fogCatalog, dlightCatalog, dlightReceiveFlags, shadowMode, lodScale, lodBias)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `selectedWorld` | `dynamic` | — |  |
| `worldCatalog` | `dynamic` | — |  |
| `qvmCatalog` | `dynamic` | — |  |
| `archive` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `frameCache` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `videoManager` | `dynamic` | — |  |
| `worldCache` | `dynamic` | — |  |
| `worldConfig` | `dynamic` | — |  |
| `skyFlags` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `dlightCatalog` | `dynamic` | — |  |
| `dlightReceiveFlags` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |
| `lodScale` | `dynamic` | — |  |
| `lodBias` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L206)

<a id="function-function-mq3-client-qvm-preview-app-prepareportals-function-prepareportals-preparedviews-selectedworld-worldcatalog-qvmcatalog-archive-assets-kinds-framecache-grid-videomanager-worldcache-worldconfig-skyflags-fogcatalog-dlightcatalog-dlightreceiveflags-shadowmode-lodscale-lodbias-src-mq3-client-qvm-preview-app-ml-1418604489"></a>
### preparePortals

```ml
function preparePortals(preparedViews, selectedWorld, worldCatalog, qvmCatalog, archive, assets, kinds, frameCache, grid, videoManager, worldCache, worldConfig, skyFlags, fogCatalog, dlightCatalog, dlightReceiveFlags, shadowMode, lodScale, lodBias)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `preparedViews` | `dynamic` | — |  |
| `selectedWorld` | `dynamic` | — |  |
| `worldCatalog` | `dynamic` | — |  |
| `qvmCatalog` | `dynamic` | — |  |
| `archive` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `frameCache` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `videoManager` | `dynamic` | — |  |
| `worldCache` | `dynamic` | — |  |
| `worldConfig` | `dynamic` | — |  |
| `skyFlags` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `dlightCatalog` | `dynamic` | — |  |
| `dlightReceiveFlags` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |
| `lodScale` | `dynamic` | — |  |
| `lodBias` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L224)

<a id="function-function-mq3-client-qvm-preview-app-prepareviews-function-prepareviews-views-catalog-archive-assets-kinds-framecache-grid-videomanager-previousviews-profile-fogcatalog-dlightcatalog-shadowmode-lodscale-lodbias-src-mq3-client-qvm-preview-app-ml-60845064"></a>
### prepareViews

```ml
function prepareViews(views, catalog, archive, assets, kinds, frameCache, grid, videoManager, previousViews, profile, fogCatalog, dlightCatalog, shadowMode, lodScale, lodBias)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `views` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `archive` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `frameCache` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |
| `videoManager` | `dynamic` | — |  |
| `previousViews` | `dynamic` | — |  |
| `profile` | `dynamic` | — |  |
| `fogCatalog` | `dynamic` | — |  |
| `dlightCatalog` | `dynamic` | — |  |
| `shadowMode` | `dynamic` | — |  |
| `lodScale` | `dynamic` | — |  |
| `lodBias` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L91)

<a id="constant-constant-mq3-client-qvm-preview-app-qvm-2d-texture-first-slot-const-qvm-2d-texture-first-slot-400-src-mq3-client-qvm-preview-app-ml-1886192913"></a>
### QVM_2D_TEXTURE_FIRST_SLOT

```ml
const QVM_2D_TEXTURE_FIRST_SLOT = 400
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L55)

<a id="constant-constant-mq3-client-qvm-preview-app-qvm-texture-first-slot-const-qvm-texture-first-slot-336-src-mq3-client-qvm-preview-app-ml-908698943"></a>
### QVM_TEXTURE_FIRST_SLOT

```ml
const QVM_TEXTURE_FIRST_SLOT = 336
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L53)

<a id="function-function-mq3-client-qvm-preview-app-refdefcamera-function-refdefcamera-refdef-src-mq3-client-qvm-preview-app-ml-123126834"></a>
### refdefCamera

```ml
function refdefCamera(refdef)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `refdef` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L88)

<a id="function-function-mq3-client-qvm-preview-app-releasecinematics-function-releasecinematics-src-mq3-client-qvm-preview-app-ml-1685856072"></a>
### releaseCinematics

```ml
function releaseCinematics()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L250)

<a id="function-function-mq3-client-qvm-preview-app-releasegameinput-function-releasegameinput-state-time-src-mq3-client-qvm-preview-app-ml-481058498"></a>
### releaseGameInput

```ml
function releaseGameInput(state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L147)

<a id="function-function-mq3-client-qvm-preview-app-requestedquit-function-requestedquit-state-src-mq3-client-qvm-preview-app-ml-1441453187"></a>
### requestedQuit

```ml
function requestedQuit(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L71)

<a id="function-function-mq3-client-qvm-preview-app-run-function-run-archive-map-qvmroot-src-mq3-client-qvm-preview-app-ml-492092014"></a>
### run

```ml
function run(archive, map, qvmRoot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L432)

<a id="function-function-mq3-client-qvm-preview-app-runlimited-function-runlimited-archive-map-qvmroot-maxframes-src-mq3-client-qvm-preview-app-ml-1574487700"></a>
### runLimited

```ml
function runLimited(archive, map, qvmRoot, maxFrames)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `maxFrames` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L429)

<a id="function-function-mq3-client-qvm-preview-app-runlimitedsettings-function-runlimitedsettings-archive-map-qvmroot-maxframes-settings-src-mq3-client-qvm-preview-app-ml-1012234959"></a>
### runLimitedSettings

```ml
function runLimitedSettings(archive, map, qvmRoot, maxFrames, settings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `maxFrames` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L428)

<a id="function-function-mq3-client-qvm-preview-app-runlimitedsettingsnamed-function-runlimitedsettingsnamed-archive-map-mapname-qvmroot-maxframes-settings-src-mq3-client-qvm-preview-app-ml-946218626"></a>
### runLimitedSettingsNamed

```ml
function runLimitedSettingsNamed(archive, map, mapName, qvmRoot, maxFrames, settings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `maxFrames` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L274)

<a id="function-function-mq3-client-qvm-preview-app-runwithsettings-function-runwithsettings-archive-map-qvmroot-settings-src-mq3-client-qvm-preview-app-ml-1966946263"></a>
### runWithSettings

```ml
function runWithSettings(archive, map, qvmRoot, settings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L430)

<a id="function-function-mq3-client-qvm-preview-app-runwithsettingsnamed-function-runwithsettingsnamed-archive-map-mapname-qvmroot-settings-src-mq3-client-qvm-preview-app-ml-101609094"></a>
### runWithSettingsNamed

```ml
function runWithSettingsNamed(archive, map, mapName, qvmRoot, settings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L431)

- [mq3.client.qvm_preview_app.ScreenPoint](Type-mq3-client-qvm-preview-app-screenpoint-1997150010.md) — struct
<a id="function-function-mq3-client-qvm-preview-app-selectioncamera-function-selectioncamera-view-src-mq3-client-qvm-preview-app-ml-657531987"></a>
### selectionCamera

```ml
function selectionCamera(view)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L85)

<a id="constant-constant-mq3-client-qvm-preview-app-source-height-const-source-height-720-src-mq3-client-qvm-preview-app-ml-1988144262"></a>
### SOURCE_HEIGHT

```ml
const SOURCE_HEIGHT = 720
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L62)

<a id="constant-constant-mq3-client-qvm-preview-app-source-width-const-source-width-1280-src-mq3-client-qvm-preview-app-ml-1418421168"></a>
### SOURCE_WIDTH

```ml
const SOURCE_WIDTH = 1280
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L61)

<a id="function-function-mq3-client-qvm-preview-app-uploadlightmaps-function-uploadlightmaps-map-src-mq3-client-qvm-preview-app-ml-1440600492"></a>
### uploadLightmaps

```ml
function uploadLightmaps(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L193)

<a id="constant-constant-mq3-client-qvm-preview-app-width-const-width-1280-src-mq3-client-qvm-preview-app-ml-1540593926"></a>
### WIDTH

```ml
const WIDTH = 1280
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L51)
