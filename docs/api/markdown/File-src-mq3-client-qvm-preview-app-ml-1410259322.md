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
- `mq3/client/cgame_vm.ml` as `cgameVm` → [src/mq3/client/cgame_vm.ml](File-src-mq3-client-cgame-vm-ml-1871886258.md)
- `mq3/client/cinematic_runtime.ml` as `cinematics` → [src/mq3/client/cinematic_runtime.ml](File-src-mq3-client-cinematic-runtime-ml-1539162371.md)
- `mq3/client/cl_console.ml` as `clientConsole` → [src/mq3/client/cl_console.ml](File-src-mq3-client-cl-console-ml-1724798958.md)
- `mq3/client/console_input.ml` as `consoleInput` → [src/mq3/client/console_input.ml](File-src-mq3-client-console-input-ml-896040399.md)
- `mq3/client/console_input_display.ml` as `consoleDisplay` → [src/mq3/client/console_input_display.ml](File-src-mq3-client-console-input-display-ml-1771363644.md)
- `mq3/client/demo_playback.ml` as `demos` → [src/mq3/client/demo_playback.ml](File-src-mq3-client-demo-playback-ml-1167034666.md)
- `mq3/client/desktop_session.ml` as `desktopSession` → [src/mq3/client/desktop_session.ml](File-src-mq3-client-desktop-session-ml-419426432.md)
- `mq3/client/desktop_video.ml` as `desktopVideo` → [src/mq3/client/desktop_video.ml](File-src-mq3-client-desktop-video-ml-2115297537.md)
- `mq3/client/frame_timing.ml` as `frameTiming` → [src/mq3/client/frame_timing.ml](File-src-mq3-client-frame-timing-ml-1638282389.md)
- `mq3/client/input_command_events.ml` as `timestampedInput` → [src/mq3/client/input_command_events.ml](File-src-mq3-client-input-command-events-ml-1691230747.md)
- `mq3/client/map_loading.ml` as `mapLoading` → [src/mq3/client/map_loading.ml](File-src-mq3-client-map-loading-ml-2006073650.md)
- `mq3/client/original_ui_session.ml` as `uiSession` → [src/mq3/client/original_ui_session.ml](File-src-mq3-client-original-ui-session-ml-619334882.md)
- `mq3/client/playable_fps_title.ml` as `fpsTitle` → [src/mq3/client/playable_fps_title.ml](File-src-mq3-client-playable-fps-title-ml-173965588.md)
- `mq3/client/playable_sky.ml` as `playableSky` → [src/mq3/client/playable_sky.ml](File-src-mq3-client-playable-sky-ml-624488737.md)
- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/client/qvm_frame_input.ml` as `frameInput` → [src/mq3/client/qvm_frame_input.ml](File-src-mq3-client-qvm-frame-input-ml-1180554640.md)
- `mq3/client/remote_play.ml` as `remote` → [src/mq3/client/remote_play.ml](File-src-mq3-client-remote-play-ml-1364331402.md)
- `mq3/client/ui_input_latch.ml` as `inputLatch` → [src/mq3/client/ui_input_latch.ml](File-src-mq3-client-ui-input-latch-ml-1943622233.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/engine/local_qvm_match.ml` as `match` → [src/mq3/engine/local_qvm_match.ml](File-src-mq3-engine-local-qvm-match-ml-725859098.md)
- `mq3/engine/local_qvm_ui.ml` as `localQvmUi` → [src/mq3/engine/local_qvm_ui.ml](File-src-mq3-engine-local-qvm-ui-ml-719408963.md)
- `mq3/platform/playable_ambient.ml` as `audioOutput` → [src/mq3/platform/playable_ambient.ml](File-src-mq3-platform-playable-ambient-ml-1461563654.md)
- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/qcommon/command_buffer.ml` as `inputCommands` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/cvar.ml` as `cvar` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `mq3/renderer/bsp_render_data.ml` as `renderData` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)
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
- `mq3/renderer/retained_world_batch.ml` as `retainedWorld` → [src/mq3/renderer/retained_world_batch.ml](File-src-mq3-renderer-retained-world-batch-ml-1153698861.md)
- `mq3/renderer/world_surface_selection.ml` as `worldSelection` → [src/mq3/renderer/world_surface_selection.ml](File-src-mq3-renderer-world-surface-selection-ml-1945526598.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `mq3/vm/syscall_qagame_world.ml` as `qworld` → [src/mq3/vm/syscall_qagame_world.ml](File-src-mq3-vm-syscall-qagame-world-ml-663586900.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency
- `std/time.ml` as `time` → `../MiniLangCompilerML/std/time.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-qvm-preview-app-advancegametick-function-advancegametick-state-clientclock-servertime-src-mq3-client-qvm-preview-app-ml-81921098"></a>
### advanceGameTick

```ml
function advanceGameTick(state, clientClock, serverTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientClock` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L229)

<a id="function-function-mq3-client-qvm-preview-app-applyinputevent-function-applyinputevent-bridge-matchstate-event-src-mq3-client-qvm-preview-app-ml-717691221"></a>
### applyInputEvent

```ml
function applyInputEvent(bridge, matchState, event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bridge` | `dynamic` | — |  |
| `matchState` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L143)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L256)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L334)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L333)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L314)

<a id="function-function-mq3-client-qvm-preview-app-bootmatch-function-bootmatch-archive-map-mapname-qvmroot-settings-source-src-mq3-client-qvm-preview-app-ml-787280379"></a>
### bootMatch

```ml
function bootMatch(archive, map, mapName, qvmRoot, settings, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L336)

<a id="constant-constant-mq3-client-qvm-preview-app-cinematic-texture-first-slot-const-cinematic-texture-first-slot-4055-src-mq3-client-qvm-preview-app-ml-1695752903"></a>
### CINEMATIC_TEXTURE_FIRST_SLOT

```ml
const CINEMATIC_TEXTURE_FIRST_SLOT = 4055
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L66)

<a id="function-function-mq3-client-qvm-preview-app-clearclientinput-function-clearclientinput-bridge-src-mq3-client-qvm-preview-app-ml-7971657"></a>
### clearClientInput

```ml
function clearClientInput(bridge)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bridge` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L196)

- [mq3.client.qvm_preview_app.ClientInputBridge](Type-mq3-client-qvm-preview-app-clientinputbridge-886912792.md) — struct
<a id="function-function-mq3-client-qvm-preview-app-collectcinematicaudio-function-collectcinematicaudio-state-audio-src-mq3-client-qvm-preview-app-ml-242520023"></a>
### collectCinematicAudio

```ml
function collectCinematicAudio(state, audio)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `audio` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L303)

<a id="constant-constant-mq3-client-qvm-preview-app-console-background-texture-slot-const-console-background-texture-slot-4052-src-mq3-client-qvm-preview-app-ml-1551661290"></a>
### CONSOLE_BACKGROUND_TEXTURE_SLOT

```ml
const CONSOLE_BACKGROUND_TEXTURE_SLOT = 4052
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L64)

<a id="constant-constant-mq3-client-qvm-preview-app-console-font-texture-slot-const-console-font-texture-slot-4054-src-mq3-client-qvm-preview-app-ml-1607473704"></a>
### CONSOLE_FONT_TEXTURE_SLOT

```ml
const CONSOLE_FONT_TEXTURE_SLOT = 4054
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L65)

<a id="function-function-mq3-client-qvm-preview-app-consolecolor-function-consolecolor-index-src-mq3-client-qvm-preview-app-ml-1812814962"></a>
### consoleColor

```ml
function consoleColor(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L197)

<a id="function-function-mq3-client-qvm-preview-app-drawcinematics-function-drawcinematics-state-mode-src-mq3-client-qvm-preview-app-ml-1324354788"></a>
### drawCinematics

```ml
function drawCinematics(state, mode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L288)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L204)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L201)

<a id="function-function-mq3-client-qvm-preview-app-drawframe-function-drawframe-state-clientclock-realtime-demotime-src-mq3-client-qvm-preview-app-ml-914415569"></a>
### drawFrame

```ml
function drawFrame(state, clientClock, realtime, demoTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `clientClock` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |
| `demoTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L236)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L207)

<a id="function-function-mq3-client-qvm-preview-app-ensureplayablebindings-function-ensureplayablebindings-state-src-mq3-client-qvm-preview-app-ml-95324173"></a>
### ensurePlayableBindings

```ml
function ensurePlayableBindings(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L223)

<a id="function-function-mq3-client-qvm-preview-app-fail-function-fail-message-src-mq3-client-qvm-preview-app-ml-962886303"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L80)

<a id="function-function-mq3-client-qvm-preview-app-framepercentile-function-framepercentile-histogram-count-percent-src-mq3-client-qvm-preview-app-ml-1426739320"></a>
### framePercentile

```ml
function framePercentile(histogram, count, percent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `histogram` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `percent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L81)

<a id="function-function-mq3-client-qvm-preview-app-largestview-function-largestview-views-src-mq3-client-qvm-preview-app-ml-1166095238"></a>
### largestView

```ml
function largestView(views)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `views` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L92)

<a id="constant-constant-mq3-client-qvm-preview-app-max-qvm-2d-texture-slots-const-max-qvm-2d-texture-slots-980-src-mq3-client-qvm-preview-app-ml-1327128116"></a>
### MAX_QVM_2D_TEXTURE_SLOTS

```ml
const MAX_QVM_2D_TEXTURE_SLOTS = 980
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L63)

<a id="constant-constant-mq3-client-qvm-preview-app-max-qvm-texture-slots-const-max-qvm-texture-slots-1024-src-mq3-client-qvm-preview-app-ml-2139207022"></a>
### MAX_QVM_TEXTURE_SLOTS

```ml
const MAX_QVM_TEXTURE_SLOTS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L61)

<a id="constant-constant-mq3-client-qvm-preview-app-md3-frame-cache-entries-const-md3-frame-cache-entries-32-src-mq3-client-qvm-preview-app-ml-1096608212"></a>
### MD3_FRAME_CACHE_ENTRIES

```ml
const MD3_FRAME_CACHE_ENTRIES = 32
```

Retention bound, not a scene/triangle budget: evicted poses are recomputed.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L70)

<a id="function-function-mq3-client-qvm-preview-app-movementaxis-function-movementaxis-positive-negative-src-mq3-client-qvm-preview-app-ml-20105338"></a>
### movementAxis

```ml
function movementAxis(positive, negative)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `positive` | `dynamic` | — |  |
| `negative` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L125)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L130)

<a id="function-function-mq3-client-qvm-preview-app-nativemousedelta-function-nativemousedelta-input-src-mq3-client-qvm-preview-app-ml-1028687110"></a>
### nativeMouseDelta

```ml
function nativeMouseDelta(input)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L134)

<a id="function-function-mq3-client-qvm-preview-app-observenativeinputevents-function-observenativeinputevents-input-events-src-mq3-client-qvm-preview-app-ml-802665141"></a>
### observeNativeInputEvents

```ml
function observeNativeInputEvents(input, events)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `events` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L135)

- [mq3.client.qvm_preview_app.PipelineProfile](Type-mq3-client-qvm-preview-app-pipelineprofile-146312419.md) — struct
- [mq3.client.qvm_preview_app.PreparedPortal](Type-mq3-client-qvm-preview-app-preparedportal-1948659867.md) — struct
- [mq3.client.qvm_preview_app.PreparedView](Type-mq3-client-qvm-preview-app-preparedview-1114063912.md) — struct
<a id="function-function-mq3-client-qvm-preview-app-prepareportal-function-prepareportal-source-selectedworld-portalcache-worldcatalog-qvmcatalog-archive-modelassets-assetnames-kinds-framecache-grid-videomanager-worldcache-worldconfig-skyflags-fogcatalog-dlightcatalog-dlightreceiveflags-shadowmode-lodscale-lodbias-src-mq3-client-qvm-preview-app-ml-31104732"></a>
### preparePortal

```ml
function preparePortal(source, selectedWorld, portalCache, worldCatalog, qvmCatalog, archive, modelAssets, assetNames, kinds, frameCache, grid, videoManager, worldCache, worldConfig, skyFlags, fogCatalog, dlightCatalog, dlightReceiveFlags, shadowMode, lodScale, lodBias)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `selectedWorld` | `dynamic` | — |  |
| `portalCache` | `dynamic` | — |  |
| `worldCatalog` | `dynamic` | — |  |
| `qvmCatalog` | `dynamic` | — |  |
| `archive` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `assetNames` | `dynamic` | — |  |
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L261)

<a id="function-function-mq3-client-qvm-preview-app-prepareportals-function-prepareportals-preparedviews-selectedworld-portalcache-worldcatalog-qvmcatalog-archive-modelassets-assetnames-kinds-framecache-grid-videomanager-worldcache-worldconfig-skyflags-fogcatalog-dlightcatalog-dlightreceiveflags-shadowmode-lodscale-lodbias-src-mq3-client-qvm-preview-app-ml-1825222794"></a>
### preparePortals

```ml
function preparePortals(preparedViews, selectedWorld, portalCache, worldCatalog, qvmCatalog, archive, modelAssets, assetNames, kinds, frameCache, grid, videoManager, worldCache, worldConfig, skyFlags, fogCatalog, dlightCatalog, dlightReceiveFlags, shadowMode, lodScale, lodBias)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `preparedViews` | `dynamic` | — |  |
| `selectedWorld` | `dynamic` | — |  |
| `portalCache` | `dynamic` | — |  |
| `worldCatalog` | `dynamic` | — |  |
| `qvmCatalog` | `dynamic` | — |  |
| `archive` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `assetNames` | `dynamic` | — |  |
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L285)

<a id="function-function-mq3-client-qvm-preview-app-prepareviews-function-prepareviews-views-catalog-archive-modelassets-assetnames-kinds-framecache-grid-videomanager-previousviews-profile-fogcatalog-dlightcatalog-shadowmode-lodscale-lodbias-mode-src-mq3-client-qvm-preview-app-ml-702764398"></a>
### prepareViews

```ml
function prepareViews(views, catalog, archive, modelAssets, assetNames, kinds, frameCache, grid, videoManager, previousViews, profile, fogCatalog, dlightCatalog, shadowMode, lodScale, lodBias, mode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `views` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `archive` | `dynamic` | — |  |
| `modelAssets` | `dynamic` | — |  |
| `assetNames` | `dynamic` | — |  |
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
| `mode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L104)

<a id="function-function-mq3-client-qvm-preview-app-queueexpandedinput-function-queueexpandedinput-matchstate-framestate-expanded-src-mq3-client-qvm-preview-app-ml-1802369317"></a>
### queueExpandedInput

```ml
function queueExpandedInput(matchState, frameState, expanded)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matchState` | `dynamic` | — |  |
| `frameState` | `dynamic` | — |  |
| `expanded` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L139)

<a id="constant-constant-mq3-client-qvm-preview-app-qvm-2d-texture-first-slot-const-qvm-2d-texture-first-slot-3072-src-mq3-client-qvm-preview-app-ml-954539603"></a>
### QVM_2D_TEXTURE_FIRST_SLOT

```ml
const QVM_2D_TEXTURE_FIRST_SLOT = 3072
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L62)

<a id="constant-constant-mq3-client-qvm-preview-app-qvm-texture-first-slot-const-qvm-texture-first-slot-2048-src-mq3-client-qvm-preview-app-ml-587016905"></a>
### QVM_TEXTURE_FIRST_SLOT

```ml
const QVM_TEXTURE_FIRST_SLOT = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L60)

<a id="function-function-mq3-client-qvm-preview-app-refdefcamera-function-refdefcamera-refdef-src-mq3-client-qvm-preview-app-ml-123126834"></a>
### refdefCamera

```ml
function refdefCamera(refdef)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `refdef` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L101)

<a id="function-function-mq3-client-qvm-preview-app-refreshuiframe-function-refreshuiframe-ui-servertime-src-mq3-client-qvm-preview-app-ml-902152318"></a>
### refreshUiFrame

```ml
function refreshUiFrame(ui, serverTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ui` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L180)

<a id="function-function-mq3-client-qvm-preview-app-releasecinematics-function-releasecinematics-src-mq3-client-qvm-preview-app-ml-1685856072"></a>
### releaseCinematics

```ml
function releaseCinematics()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L311)

<a id="function-function-mq3-client-qvm-preview-app-releasegameinput-function-releasegameinput-bridge-time-src-mq3-client-qvm-preview-app-ml-613051542"></a>
### releaseGameInput

```ml
function releaseGameInput(bridge, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bridge` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L186)

<a id="function-function-mq3-client-qvm-preview-app-requestedquit-function-requestedquit-state-src-mq3-client-qvm-preview-app-ml-1441453187"></a>
### requestedQuit

```ml
function requestedQuit(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L84)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L691)

<a id="function-function-mq3-client-qvm-preview-app-rundesktopmatch-function-rundesktopmatch-archive-map-mapname-qvmroot-settings-session-src-mq3-client-qvm-preview-app-ml-1785129682"></a>
### runDesktopMatch

```ml
function runDesktopMatch(archive, map, mapName, qvmRoot, settings, session)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L682)

<a id="function-function-mq3-client-qvm-preview-app-rundesktopstream-function-rundesktopstream-archive-map-mapname-qvmroot-settings-session-source-src-mq3-client-qvm-preview-app-ml-1664250057"></a>
### runDesktopStream

```ml
function runDesktopStream(archive, map, mapName, qvmRoot, settings, session, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L683)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L688)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L687)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L686)

<a id="function-function-mq3-client-qvm-preview-app-runmatch-function-runmatch-archive-map-mapname-qvmroot-maxframes-settings-session-source-src-mq3-client-qvm-preview-app-ml-1388974959"></a>
### runMatch

```ml
function runMatch(archive, map, mapName, qvmRoot, maxFrames, settings, session, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `maxFrames` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L382)

<a id="function-function-mq3-client-qvm-preview-app-runmatchwithloading-function-runmatchwithloading-archive-map-mapname-qvmroot-maxframes-settings-session-source-screen-initialwidth-initialheight-src-mq3-client-qvm-preview-app-ml-1787234940"></a>
### runMatchWithLoading

```ml
function runMatchWithLoading(archive, map, mapName, qvmRoot, maxFrames, settings, session, source, screen, initialWidth, initialHeight)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `maxFrames` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `screen` | `dynamic` | — |  |
| `initialWidth` | `dynamic` | — |  |
| `initialHeight` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L400)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L689)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L690)

- [mq3.client.qvm_preview_app.ScreenPoint](Type-mq3-client-qvm-preview-app-screenpoint-1997150010.md) — struct
<a id="function-function-mq3-client-qvm-preview-app-selectioncamera-function-selectioncamera-view-src-mq3-client-qvm-preview-app-ml-657531987"></a>
### selectionCamera

```ml
function selectionCamera(view)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L98)

<a id="function-function-mq3-client-qvm-preview-app-sendstreamframe-function-sendstreamframe-state-source-created-now-src-mq3-client-qvm-preview-app-ml-407189168"></a>
### sendStreamFrame

```ml
function sendStreamFrame(state, source, created, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `created` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L363)

<a id="constant-constant-mq3-client-qvm-preview-app-source-height-const-source-height-720-src-mq3-client-qvm-preview-app-ml-1988144262"></a>
### SOURCE_HEIGHT

```ml
const SOURCE_HEIGHT = 720
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L68)

<a id="constant-constant-mq3-client-qvm-preview-app-source-width-const-source-width-1280-src-mq3-client-qvm-preview-app-ml-1418421168"></a>
### SOURCE_WIDTH

```ml
const SOURCE_WIDTH = 1280
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L67)

<a id="function-function-mq3-client-qvm-preview-app-stoploading-function-stoploading-screen-state-session-result-src-mq3-client-qvm-preview-app-ml-1751609184"></a>
### stopLoading

```ml
function stopLoading(screen, state, session, result)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `screen` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `session` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L391)

- [mq3.client.qvm_preview_app.StreamSource](Type-mq3-client-qvm-preview-app-streamsource-1230160357.md) — struct
<a id="function-function-mq3-client-qvm-preview-app-updatestream-function-updatestream-state-source-clientclock-servertime-demotime-src-mq3-client-qvm-preview-app-ml-417134119"></a>
### updateStream

```ml
function updateStream(state, source, clientClock, serverTime, demoTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `clientClock` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |
| `demoTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L349)

<a id="function-function-mq3-client-qvm-preview-app-uploadlightmaps-function-uploadlightmaps-map-src-mq3-client-qvm-preview-app-ml-1440600492"></a>
### uploadLightmaps

```ml
function uploadLightmaps(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L248)

<a id="constant-constant-mq3-client-qvm-preview-app-world-texture-first-slot-const-world-texture-first-slot-256-src-mq3-client-qvm-preview-app-ml-311842162"></a>
### WORLD_TEXTURE_FIRST_SLOT

```ml
const WORLD_TEXTURE_FIRST_SLOT = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L59)
