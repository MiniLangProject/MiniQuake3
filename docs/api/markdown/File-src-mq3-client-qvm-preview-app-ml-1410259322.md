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
- `std/ds/list.ml` as `lists` → `../../a7594a0c0299/MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency
- `std/time.ml` as `time` → `../../a7594a0c0299/MiniLangCompilerML/std/time.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-qvm-preview-app-advancegametick-function-advancegametick-state-clientclock-servertime-src-mq3-client-qvm-preview-app-ml-81921098"></a>
### advanceGameTick

```ml
function advanceGameTick(state, clientClock, serverTime)
```

Calls `mq3.engine.local_qvm_match.runServerTick`, `mq3.engine.local_qvm_match.snapshotProductive`, `mq3.client.cgame_clock.publishSnapshot` from QVM preview app `advanceGameTick`. The final path returns `published`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.context.snapshotNumber`. |
| `clientClock` | `dynamic` | — | Value used by `published=cgameClock.publishSnapshot(clientClock,state.context.snapshotNumber,snapshot.serverTime,0)`. |
| `serverTime` | `dynamic` | — | Authoritative server timestamp in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L393)

<a id="function-function-mq3-client-qvm-preview-app-applyinputevent-function-applyinputevent-bridge-matchstate-event-src-mq3-client-qvm-preview-app-ml-717691221"></a>
### applyInputEvent

```ml
function applyInputEvent(bridge, matchState, event)
```

Calls `mq3.engine.local_qvm_match.keyCatcher`, `mq3.engine.local_qvm_match.clientTextChar`, `bridge.ui.services.keyEventFn` and additional helpers from QVM preview app `applyInputEvent`. The final path returns `expanded`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bridge` | `dynamic` | — | Record read through `bridge.ui.services.keyEventFn`, `bridge.ui.services.context`, `bridge.ui.services.mouseEventFn`, `bridge.frame` and additional values. |
| `matchState` | `dynamic` | — | Record read through `matchState.cgame`, `matchState.context`. |
| `event` | `dynamic` | — | Record read through `event.type`, `event.value`, `event.value2`, `event.time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L274)

<a id="function-function-mq3-client-qvm-preview-app-attachworldeffects-function-attachworldeffects-batch-triangles-fogcatalog-dlightcatalog-dlightreceiveflags-src-mq3-client-qvm-preview-app-ml-1732177889"></a>
### attachWorldEffects

```ml
function attachWorldEffects(batch, triangles, fogCatalog, dlightCatalog, dlightReceiveFlags)
```

Calls `mq3.renderer.playable_world_batch.attachFog`, `mq3.renderer.playable_world_batch.attachDynamicLights` from QVM preview app `attachWorldEffects`. The final path returns `batch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Value used by `if fogCatalog!=void then attached=worldBatch.attachFog(batch,triangles,fogCatalog)`. |
| `triangles` | `dynamic` | — | Value used by `if fogCatalog!=void then attached=worldBatch.attachFog(batch,triangles,fogCatalog)`. |
| `fogCatalog` | `dynamic` | — | Value used by `if fogCatalog!=void then attached=worldBatch.attachFog(batch,triangles,fogCatalog)`. |
| `dlightCatalog` | `dynamic` | — | Value used by `if dlightCatalog!=void then attached=worldBatch.attachDynamicLights(batch,triangles,dlightReceiveFlags,dlightCatalog)`. |
| `dlightReceiveFlags` | `dynamic` | — | Value used by `if dlightCatalog!=void then attached=worldBatch.attachDynamicLights(batch,triangles,dlightReceiveFlags,dlightCatalog)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L433)

<a id="function-function-mq3-client-qvm-preview-app-bootframe-function-bootframe-archive-map-qvmroot-src-mq3-client-qvm-preview-app-ml-1136985614"></a>
### bootFrame

```ml
function bootFrame(archive, map, qvmRoot)
```

Adapts `mq3.client.qvm_preview_app.bootFrameSettings` to QVM preview app `bootFrame`, returning its result for `archive, map, qvmRoot, void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. Forwarded to `mq3.client.qvm_preview_app.bootFrameSettings`. |
| `map` | `dynamic` | — | Argument 2 of `mq3.client.qvm_preview_app.bootFrameSettings`. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. Forwarded to `mq3.client.qvm_preview_app.bootFrameSettings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L577)

<a id="function-function-mq3-client-qvm-preview-app-bootframesettings-function-bootframesettings-archive-map-qvmroot-settings-src-mq3-client-qvm-preview-app-ml-439464879"></a>
### bootFrameSettings

```ml
function bootFrameSettings(archive, map, qvmRoot, settings)
```

Adapts `mq3.client.qvm_preview_app.bootFrameSettingsNamed` to QVM preview app `bootFrameSettings`, returning its result for `archive, map, "q3dm1", qvmRoot, settings`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. Forwarded to `mq3.client.qvm_preview_app.bootFrameSettingsNamed`. |
| `map` | `dynamic` | — | Argument 2 of `mq3.client.qvm_preview_app.bootFrameSettingsNamed`. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. Forwarded to `mq3.client.qvm_preview_app.bootFrameSettingsNamed`. |
| `settings` | `dynamic` | — | Argument 5 of `mq3.client.qvm_preview_app.bootFrameSettingsNamed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L572)

<a id="function-function-mq3-client-qvm-preview-app-bootframesettingsnamed-function-bootframesettingsnamed-archive-map-mapname-qvmroot-settings-src-mq3-client-qvm-preview-app-ml-874531042"></a>
### bootFrameSettingsNamed

```ml
function bootFrameSettingsNamed(archive, map, mapName, qvmRoot, settings)
```

Calls `mq3.engine.local_qvm_match.bootWithQvmsSettingsNamed`, `mq3.engine.local_qvm_match.connectLocal`, `mq3.vm.syscall_qagame_world.userCommand` and additional helpers from QVM preview app `bootFrameSettingsNamed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `map` | `dynamic` | — | map record passed to the QVM preview app helper calls. |
| `mapName` | `dynamic` | — | Map name used to select the level and its associated assets. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. |
| `settings` | `dynamic` | — | Value used by `state=match.bootWithQvmsSettingsNamed(archive,map,mapName,1000,qvmRoot,settings)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L548)

<a id="function-function-mq3-client-qvm-preview-app-bootmatch-function-bootmatch-archive-map-mapname-qvmroot-settings-source-src-mq3-client-qvm-preview-app-ml-787280379"></a>
### bootMatch

```ml
function bootMatch(archive, map, mapName, qvmRoot, settings, source)
```

Calls `mq3.client.qvm_preview_app.bootFrameSettingsNamed`, `mq3.engine.local_qvm_match.bootServerStream`, `mq3.engine.local_qvm_match.drawCgameProductive` and additional helpers from QVM preview app `bootMatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `map` | `dynamic` | — | map record passed to the QVM preview app helper calls. |
| `mapName` | `dynamic` | — | Map name used to select the level and its associated assets. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. |
| `settings` | `dynamic` | — | Value used by `if source==void then return bootFrameSettingsNamed(archive,map,mapName,qvmRoot,settings) end if`. |
| `source` | `dynamic` | — | Record read through `source.protocol`, `source.demo`, `source.name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L586)

<a id="constant-constant-mq3-client-qvm-preview-app-cinematic-texture-first-slot-const-cinematic-texture-first-slot-4055-src-mq3-client-qvm-preview-app-ml-1695752903"></a>
### CINEMATIC_TEXTURE_FIRST_SLOT

```ml
const CINEMATIC_TEXTURE_FIRST_SLOT = 4055
```

Texture-cache slot or starting slot reserved for the cinematic rendering resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L75)

<a id="function-function-mq3-client-qvm-preview-app-clearclientinput-function-clearclientinput-bridge-src-mq3-client-qvm-preview-app-ml-7971657"></a>
### clearClientInput

```ml
function clearClientInput(bridge)
```

Adapts `mq3.client.qvm_preview_app.releaseGameInput` to QVM preview app `clearClientInput`, returning its result for `bridge, 0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bridge` | `dynamic` | — | Argument 1 of `mq3.client.qvm_preview_app.releaseGameInput`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L335)

- [mq3.client.qvm_preview_app.ClientInputBridge](Type-mq3-client-qvm-preview-app-clientinputbridge-886912792.md) — struct
<a id="function-function-mq3-client-qvm-preview-app-collectcinematicaudio-function-collectcinematicaudio-state-audio-src-mq3-client-qvm-preview-app-ml-242520023"></a>
### collectCinematicAudio

```ml
function collectCinematicAudio(state, audio)
```

Calls `mq3.client.cinematic_runtime.takeAudio`, `mq3.audio.qvm_playback.queueRaw` from QVM preview app `collectCinematicAudio`. The final path returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.context.cinematics`. |
| `audio` | `dynamic` | — | Value used by `for each chunk in chunks queued=qvmPlayback.queueRaw(audio,chunk,1.0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L530)

<a id="constant-constant-mq3-client-qvm-preview-app-console-background-texture-slot-const-console-background-texture-slot-4052-src-mq3-client-qvm-preview-app-ml-1551661290"></a>
### CONSOLE_BACKGROUND_TEXTURE_SLOT

```ml
const CONSOLE_BACKGROUND_TEXTURE_SLOT = 4052
```

Texture-cache slot or starting slot reserved for the console background rendering resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L71)

<a id="constant-constant-mq3-client-qvm-preview-app-console-font-texture-slot-const-console-font-texture-slot-4054-src-mq3-client-qvm-preview-app-ml-1607473704"></a>
### CONSOLE_FONT_TEXTURE_SLOT

```ml
const CONSOLE_FONT_TEXTURE_SLOT = 4054
```

Texture-cache slot or starting slot reserved for the console font rendering resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L73)

<a id="function-function-mq3-client-qvm-preview-app-consolecolor-function-consolecolor-index-src-mq3-client-qvm-preview-app-ml-1812814962"></a>
### consoleColor

```ml
function consoleColor(index)
```

Evaluates QVM preview app `consoleColor` and returns `[0,0,0]`, `[255,0,0]`, `[0,255,0]` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Value tested by `index==0`, `index==1` and additional values before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L338)

<a id="function-function-mq3-client-qvm-preview-app-drawcinematics-function-drawcinematics-state-mode-src-mq3-client-qvm-preview-app-ml-1324354788"></a>
### drawCinematics

```ml
function drawCinematics(state, mode)
```

Calls `mq3.client.cinematic_runtime.takeDraws`, `mq3.client.cinematic_runtime.presentation`, `mq3.platform.playable_window.uploadTextureNoMip` and additional helpers from QVM preview app `drawCinematics`. The final path returns `drawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.context.cinematics`. |
| `mode` | `dynamic` | — | Record read through `mode.width`, `mode.height`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L512)

<a id="function-function-mq3-client-qvm-preview-app-drawconsolefield-function-drawconsolefield-media-field-scalex-scaley-src-mq3-client-qvm-preview-app-ml-1392223159"></a>
### drawConsoleField

```ml
function drawConsoleField(media, field, scaleX, scaleY)
```

Calls `mq3.client.baseq3_match_display.appendString` from QVM preview app `drawConsoleField`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Value used by `return baseMatchDisplay.appendString(media,field.text,field.x,field.y,8,16,scaleX,scaleY,255,255,255,false)`. |
| `field` | `dynamic` | — | Record read through `field.active`, `field.text`, `field.x`, `field.y`. |
| `scaleX` | `dynamic` | — | Value used by `return baseMatchDisplay.appendString(media,field.text,field.x,field.y,8,16,scaleX,scaleY,255,255,255,false)`. |
| `scaleY` | `dynamic` | — | Value used by `return baseMatchDisplay.appendString(media,field.text,field.x,field.y,8,16,scaleX,scaleY,255,255,255,false)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L355)

<a id="function-function-mq3-client-qvm-preview-app-drawconsoleglyph-function-drawconsoleglyph-media-glyph-scalex-scaley-src-mq3-client-qvm-preview-app-ml-1785230289"></a>
### drawConsoleGlyph

```ml
function drawConsoleGlyph(media, glyph, scaleX, scaleY)
```

Calls `mq3.client.qvm_preview_app.consoleColor`, `mq3.client.baseq3_match_display.appendGlyphCode` from QVM preview app `drawConsoleGlyph`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Value used by `return baseMatchDisplay.appendGlyphCode(media,glyph.ch,glyph.x,glyph.y,8,16,scaleX,scaleY,color[0],color[1],color[2])`. |
| `glyph` | `dynamic` | — | Record read through `glyph.color`, `glyph.ch`, `glyph.x`, `glyph.y`. |
| `scaleX` | `dynamic` | — | Value used by `return baseMatchDisplay.appendGlyphCode(media,glyph.ch,glyph.x,glyph.y,8,16,scaleX,scaleY,color[0],color[1],color[2])`. |
| `scaleY` | `dynamic` | — | Value used by `return baseMatchDisplay.appendGlyphCode(media,glyph.ch,glyph.x,glyph.y,8,16,scaleX,scaleY,color[0],color[1],color[2])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L347)

<a id="function-function-mq3-client-qvm-preview-app-drawframe-function-drawframe-state-clientclock-realtime-demotime-src-mq3-client-qvm-preview-app-ml-914415569"></a>
### drawFrame

```ml
function drawFrame(state, clientClock, realtime, demoTime)
```

Calls `mq3.engine.local_qvm_match.beginRendererFrame`, `mq3.client.cgame_clock.frame`, `mq3.engine.local_qvm_match.drawCgameProductiveInFrame` from QVM preview app `drawFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.serverPaused`, `state.connectionState`, `state.context.errors`. |
| `clientClock` | `dynamic` | — | Record read through `clientClock.state.serverPaused`, `clientClock.state.connectionState`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |
| `demoTime` | `dynamic` | — | Value used by `drawTime=demoTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L405)

<a id="function-function-mq3-client-qvm-preview-app-drawproductiveconsole-function-drawproductiveconsole-media-background-matchstate-width-height-now-src-mq3-client-qvm-preview-app-ml-1382357431"></a>
### drawProductiveConsole

```ml
function drawProductiveConsole(media, background, matchState, width, height, now)
```

Calls `mq3.engine.local_qvm_match.clientConsoleState`, `mq3.client.console_input_display.draw`, `mq3.engine.local_qvm_match.clientTextState` and additional helpers from QVM preview app `drawProductiveConsole`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `media` | `dynamic` | — | Value used by `if runtime==void then return consoleDisplay.draw(media,match.clientTextState(matchState),width,height,now) end if`. |
| `background` | `dynamic` | — | Value used by `if bottom>=0 then painted=consoleBackground.draw(background,width,bottom+1,now)`. |
| `matchState` | `dynamic` | — | Value used by `runtime=match.clientConsoleState(matchState)`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawProductiveConsole`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawProductiveConsole`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L365)

<a id="function-function-mq3-client-qvm-preview-app-ensureplayablebindings-function-ensureplayablebindings-state-src-mq3-client-qvm-preview-app-ml-95324173"></a>
### ensurePlayableBindings

```ml
function ensurePlayableBindings(state)
```

Calls `mq3.engine.local_qvm_match.keyBinding`, `mq3.engine.local_qvm_match.setKeyBinding` from QVM preview app `ensurePlayableBindings`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared QVM preview app state passed to the helper calls in `ensurePlayableBindings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L383)

<a id="function-function-mq3-client-qvm-preview-app-fail-function-fail-message-src-mq3-client-qvm-preview-app-ml-962886303"></a>
### fail

```ml
function fail(message)
```

Creates the QVM preview app error `7682` with diagnostic text `"QVM preview: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"QVM preview: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L162)

<a id="function-function-mq3-client-qvm-preview-app-framepercentile-function-framepercentile-histogram-count-percent-src-mq3-client-qvm-preview-app-ml-1426739320"></a>
### framePercentile

```ml
function framePercentile(histogram, count, percent)
```

Adapts `mq3.client.frame_timing.percentile` to QVM preview app `framePercentile`, returning its result for `histogram, count, percent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `histogram` | `dynamic` | — | Argument 1 of `mq3.client.frame_timing.percentile`. |
| `count` | `dynamic` | — | Argument 2 of `mq3.client.frame_timing.percentile`. |
| `percent` | `dynamic` | — | Argument 3 of `mq3.client.frame_timing.percentile`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L167)

<a id="function-function-mq3-client-qvm-preview-app-largestview-function-largestview-views-src-mq3-client-qvm-preview-app-ml-1166095238"></a>
### largestView

```ml
function largestView(views)
```

Evaluates QVM preview app `largestView` and returns `void`, `result` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `views` | `dynamic` | — | Sequence read at `views[0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L182)

<a id="constant-constant-mq3-client-qvm-preview-app-max-qvm-2d-texture-slots-const-max-qvm-2d-texture-slots-980-src-mq3-client-qvm-preview-app-ml-1327128116"></a>
### MAX_QVM_2D_TEXTURE_SLOTS

```ml
const MAX_QVM_2D_TEXTURE_SLOTS = 980
```

Capacity limit for the qvm 2 d texture slots collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L69)

<a id="constant-constant-mq3-client-qvm-preview-app-max-qvm-texture-slots-const-max-qvm-texture-slots-1024-src-mq3-client-qvm-preview-app-ml-2139207022"></a>
### MAX_QVM_TEXTURE_SLOTS

```ml
const MAX_QVM_TEXTURE_SLOTS = 1024
```

Capacity limit for the qvm texture slots collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L64)

<a id="constant-constant-mq3-client-qvm-preview-app-md3-frame-cache-entries-const-md3-frame-cache-entries-32-src-mq3-client-qvm-preview-app-ml-1096608212"></a>
### MD3_FRAME_CACHE_ENTRIES

```ml
const MD3_FRAME_CACHE_ENTRIES = 32
```

Retention bound, not a scene/triangle budget: evicted poses are recomputed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L81)

<a id="function-function-mq3-client-qvm-preview-app-movementaxis-function-movementaxis-positive-negative-src-mq3-client-qvm-preview-app-ml-20105338"></a>
### movementAxis

```ml
function movementAxis(positive, negative)
```

Evaluates QVM preview app `movementAxis` and returns `127`, `-127`, `0` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `positive` | `dynamic` | — | Value used by `if positive and not negative then return 127 end if`. |
| `negative` | `dynamic` | — | Value used by `if positive and not negative then return 127 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L240)

- [mq3.client.qvm_preview_app.NativeInput](Type-mq3-client-qvm-preview-app-nativeinput-2029931049.md) — struct
<a id="function-function-mq3-client-qvm-preview-app-nativekeydown-function-nativekeydown-input-key-src-mq3-client-qvm-preview-app-ml-655810527"></a>
### nativeKeyDown

```ml
function nativeKeyDown(input, key)
```

Calls `mq3.client.ui_input_latch.keyDown`, `mq3.platform.playable_window.inputKeyDown` from QVM preview app `nativeKeyDown`. The final path returns `window.inputKeyDown(key)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Record read through `input.keys`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding QVM preview app entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L248)

<a id="function-function-mq3-client-qvm-preview-app-nativemousedelta-function-nativemousedelta-input-src-mq3-client-qvm-preview-app-ml-1028687110"></a>
### nativeMouseDelta

```ml
function nativeMouseDelta(input)
```

Reads `input.mouse` for QVM preview app `nativeMouseDelta`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Record read through `input.mouse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L254)

<a id="function-function-mq3-client-qvm-preview-app-observenativeinputevents-function-observenativeinputevents-input-events-src-mq3-client-qvm-preview-app-ml-802665141"></a>
### observeNativeInputEvents

```ml
function observeNativeInputEvents(input, events)
```

Calls `mq3.client.ui_input_latch.observe` from QVM preview app `observeNativeInputEvents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Record read through `input.keys`. |
| `events` | `dynamic` | — | Value used by `for each event in events observed=inputLatch.observe(input.keys,event.type,event.value,event.value2)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L258)

- [mq3.client.qvm_preview_app.PipelineProfile](Type-mq3-client-qvm-preview-app-pipelineprofile-146312419.md) — struct
- [mq3.client.qvm_preview_app.PreparedPortal](Type-mq3-client-qvm-preview-app-preparedportal-1948659867.md) — struct
- [mq3.client.qvm_preview_app.PreparedView](Type-mq3-client-qvm-preview-app-preparedview-1114063912.md) — struct
<a id="function-function-mq3-client-qvm-preview-app-prepareportal-function-prepareportal-source-selectedworld-portalcache-worldcatalog-qvmcatalog-archive-modelassets-assetnames-kinds-framecache-grid-videomanager-worldcache-worldconfig-skyflags-fogcatalog-dlightcatalog-dlightreceiveflags-shadowmode-lodscale-lodbias-src-mq3-client-qvm-preview-app-ml-31104732"></a>
### preparePortal

```ml
function preparePortal(source, selectedWorld, portalCache, worldCatalog, qvmCatalog, archive, modelAssets, assetNames, kinds, frameCache, grid, videoManager, worldCache, worldConfig, skyFlags, fogCatalog, dlightCatalog, dlightReceiveFlags, shadowMode, lodScale, lodBias)
```

Updates `portalCache.clippedFaces` during QVM preview app `preparePortal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record read through `source.geometry`, `source.source.refdef`, `source.source.scene.dlights`, `source.source.scene.entities` and additional values. |
| `selectedWorld` | `dynamic` | — | Value used by `plan=portalPass.prepare(selectedWorld,worldCatalog,source.geometry,source.source.refdef,false)`. |
| `portalCache` | `dynamic` | — | Mutable QVM preview app record/storage; this routine assigns `portalCache.clippedFaces`. |
| `worldCatalog` | `dynamic` | — | Value used by `plan=portalPass.prepare(selectedWorld,worldCatalog,source.geometry,source.source.refdef,false)`. |
| `qvmCatalog` | `dynamic` | — | Value used by `refreshed=sceneMaterials.refresh(qvmCatalog,archive,geometry.triangles,assetNames,kinds,QVM_TEXTURE_FIRST_SLOT+MAX_QVM_TEXTURE_SLOTS)`. |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `modelAssets` | `dynamic` | — | Loaded model resources used by the rendering operation. |
| `assetNames` | `dynamic` | — | Value used by `refreshed=sceneMaterials.refresh(qvmCatalog,archive,geometry.triangles,assetNames,kinds,QVM_TEXTURE_FIRST_SLOT+MAX_QVM_TEXTURE_SLOTS)`. |
| `kinds` | `dynamic` | — | Value used by `geometry=sceneGeometry.buildPortalRecordsCulledShadowsFogLod(source.source.scene.entities,source.source.scene.polys,kinds,modelAssets,plan.ref...`. |
| `frameCache` | `dynamic` | — | Record read through `frameCache.normalTable`. |
| `grid` | `dynamic` | — | Value used by `if grid!=void then ignored=lightGrid.setDynamicLights(grid,source.source.scene.dlights) end if`. |
| `videoManager` | `dynamic` | — | Value used by `boundVideo=qvmVideo.bindCatalog(videoManager,qvmCatalog,plan.refdef.time)`. |
| `worldCache` | `dynamic` | — | Value used by `chosen=worldSelection.selectPortalCached(worldCache,refdefCamera(plan.refdef),plan.view.pvsOrigin,portalConfig)`. |
| `worldConfig` | `dynamic` | — | Record read through `worldConfig.width`, `worldConfig.height`. |
| `skyFlags` | `dynamic` | — | Value used by `world=worldBatch.buildMaterials(clippedWorld,worldCatalog,skyFlags)`. |
| `fogCatalog` | `dynamic` | — | Value used by `geometry=sceneGeometry.buildPortalRecordsCulledShadowsFogLod(source.source.scene.entities,source.source.scene.polys,kinds,modelAssets,plan.ref...`. |
| `dlightCatalog` | `dynamic` | — | Value used by `if len(source.source.scene.dlights)>0 then attached=sceneBatch.attachDynamicLights(batch,qvmCatalog,dlightCatalog)`. |
| `dlightReceiveFlags` | `dynamic` | — | Value used by `attached=attachWorldEffects(world,clippedWorld,fogCatalog,dlightCatalog,dlightReceiveFlags)`. |
| `shadowMode` | `dynamic` | — | Value used by `geometry=sceneGeometry.buildPortalRecordsCulledShadowsFogLod(source.source.scene.entities,source.source.scene.polys,kinds,modelAssets,plan.ref...`. |
| `lodScale` | `dynamic` | — | Value used by `geometry=sceneGeometry.buildPortalRecordsCulledShadowsFogLod(source.source.scene.entities,source.source.scene.polys,kinds,modelAssets,plan.ref...`. |
| `lodBias` | `dynamic` | — | Value used by `geometry=sceneGeometry.buildPortalRecordsCulledShadowsFogLod(source.source.scene.entities,source.source.scene.polys,kinds,modelAssets,plan.ref...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L460)

<a id="function-function-mq3-client-qvm-preview-app-prepareportals-function-prepareportals-preparedviews-selectedworld-portalcache-worldcatalog-qvmcatalog-archive-modelassets-assetnames-kinds-framecache-grid-videomanager-worldcache-worldconfig-skyflags-fogcatalog-dlightcatalog-dlightreceiveflags-shadowmode-lodscale-lodbias-src-mq3-client-qvm-preview-app-ml-1825222794"></a>
### preparePortals

```ml
function preparePortals(preparedViews, selectedWorld, portalCache, worldCatalog, qvmCatalog, archive, modelAssets, assetNames, kinds, frameCache, grid, videoManager, worldCache, worldConfig, skyFlags, fogCatalog, dlightCatalog, dlightReceiveFlags, shadowMode, lodScale, lodBias)
```

Calls `std.ds.list.List.withCapacity`, `mq3.client.qvm_preview_app.preparePortal`, `result.add` and additional helpers from QVM preview app `preparePortals`. The final path returns `result.toArray()`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `preparedViews` | `dynamic` | — | Sequence whose length/content is inspected by `preparePortals`. |
| `selectedWorld` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `portalCache` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `worldCatalog` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `qvmCatalog` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `modelAssets` | `dynamic` | — | Loaded model resources used by the rendering operation. |
| `assetNames` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `kinds` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `frameCache` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `grid` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `videoManager` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `worldCache` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `worldConfig` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `skyFlags` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `fogCatalog` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `dlightCatalog` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `dlightReceiveFlags` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `shadowMode` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `lodScale` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |
| `lodBias` | `dynamic` | — | Value used by `for each source in preparedViews portal=preparePortal(source,selectedWorld,portalCache,worldCatalog,qvmCatalog,archive,modelAssets,assetNames,...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L506)

<a id="function-function-mq3-client-qvm-preview-app-prepareviews-function-prepareviews-views-catalog-archive-modelassets-assetnames-kinds-framecache-grid-videomanager-previousviews-profile-fogcatalog-dlightcatalog-shadowmode-lodscale-lodbias-mode-src-mq3-client-qvm-preview-app-ml-702764398"></a>
### prepareViews

```ml
function prepareViews(views, catalog, archive, modelAssets, assetNames, kinds, frameCache, grid, videoManager, previousViews, profile, fogCatalog, dlightCatalog, shadowMode, lodScale, lodBias, mode)
```

Updates `profile.expansion`, `profile.material`, `profile.batch` during QVM preview app `prepareViews`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `views` | `dynamic` | — | Sequence whose length/content is inspected by `prepareViews`. |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `modelAssets` | `dynamic` | — | Loaded model resources used by the rendering operation. |
| `assetNames` | `dynamic` | — | Value used by `refreshed=sceneMaterials.refresh(catalog,archive,expanded.triangles,assetNames,kinds,QVM_TEXTURE_FIRST_SLOT+MAX_QVM_TEXTURE_SLOTS)`. |
| `kinds` | `dynamic` | — | Value used by `expanded=sceneGeometry.buildRecordsWithFrameCacheReuseCulledShadowsFogLod(view.scene.entities,view.scene.polys,kinds,modelAssets,view.refdef,8...`. |
| `frameCache` | `dynamic` | — | Value used by `expanded=sceneGeometry.buildRecordsWithFrameCacheReuseCulledShadowsFogLod(view.scene.entities,view.scene.polys,kinds,modelAssets,view.refdef,8...`. |
| `grid` | `dynamic` | — | Value used by `if grid!=void then ignored=lightGrid.setDynamicLights(grid,view.scene.dlights) end if`. |
| `videoManager` | `dynamic` | — | Value used by `boundVideo=qvmVideo.bindCatalog(videoManager,catalog,view.refdef.time)`. |
| `previousViews` | `dynamic` | — | Sequence read at `previousViews[viewIndex]`. |
| `profile` | `dynamic` | — | Mutable QVM preview app record/storage; this routine assigns `profile.expansion`, `profile.material`, `profile.batch`. |
| `fogCatalog` | `dynamic` | — | Value used by `expanded=sceneGeometry.buildRecordsWithFrameCacheReuseCulledShadowsFogLod(view.scene.entities,view.scene.polys,kinds,modelAssets,view.refdef,8...`. |
| `dlightCatalog` | `dynamic` | — | Value used by `if len(view.scene.dlights)>0 then attached=sceneBatch.attachDynamicLights(batch,catalog,dlightCatalog)`. |
| `shadowMode` | `dynamic` | — | Value used by `expanded=sceneGeometry.buildRecordsWithFrameCacheReuseCulledShadowsFogLod(view.scene.entities,view.scene.polys,kinds,modelAssets,view.refdef,8...`. |
| `lodScale` | `dynamic` | — | Value used by `expanded=sceneGeometry.buildRecordsWithFrameCacheReuseCulledShadowsFogLod(view.scene.entities,view.scene.polys,kinds,modelAssets,view.refdef,8...`. |
| `lodBias` | `dynamic` | — | Value used by `expanded=sceneGeometry.buildRecordsWithFrameCacheReuseCulledShadowsFogLod(view.scene.entities,view.scene.polys,kinds,modelAssets,view.refdef,8...`. |
| `mode` | `dynamic` | — | Record read through `mode.width`, `mode.height`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L216)

<a id="function-function-mq3-client-qvm-preview-app-queueexpandedinput-function-queueexpandedinput-matchstate-framestate-expanded-src-mq3-client-qvm-preview-app-ml-1802369317"></a>
### queueExpandedInput

```ml
function queueExpandedInput(matchState, frameState, expanded)
```

Calls `mq3.client.qvm_frame_input.handlesAction`, `mq3.engine.local_qvm_match.queueInputCommand` from QVM preview app `queueExpandedInput`. The final path returns `expanded`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matchState` | `dynamic` | — | Value used by `for each command in expanded if not command.button or not frameInput.handlesAction(frameState,command.action) then match.queueInputCommand(mat...`. |
| `frameState` | `dynamic` | — | Value used by `for each command in expanded if not command.button or not frameInput.handlesAction(frameState,command.action) then match.queueInputCommand(mat...`. |
| `expanded` | `dynamic` | — | Value used by `if expanded is error then return expanded end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L266)

<a id="constant-constant-mq3-client-qvm-preview-app-qvm-2d-texture-first-slot-const-qvm-2d-texture-first-slot-3072-src-mq3-client-qvm-preview-app-ml-954539603"></a>
### QVM_2D_TEXTURE_FIRST_SLOT

```ml
const QVM_2D_TEXTURE_FIRST_SLOT = 3072
```

Texture-cache slot or starting slot reserved for the qvm 2 d rendering resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L66)

<a id="constant-constant-mq3-client-qvm-preview-app-qvm-texture-first-slot-const-qvm-texture-first-slot-2048-src-mq3-client-qvm-preview-app-ml-587016905"></a>
### QVM_TEXTURE_FIRST_SLOT

```ml
const QVM_TEXTURE_FIRST_SLOT = 2048
```

Texture-cache slot or starting slot reserved for the qvm rendering resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L62)

<a id="function-function-mq3-client-qvm-preview-app-refdefcamera-function-refdefcamera-refdef-src-mq3-client-qvm-preview-app-ml-123126834"></a>
### refdefCamera

```ml
function refdefCamera(refdef)
```

Calls `mq3.shared.math.vectoangles`, `mq3.client.playable_viewer.camera` from QVM preview app `refdefCamera`. The final path returns `viewer.camera(refdef.vieworg,angles[1],angles[0],0.0,0.0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `refdef` | `dynamic` | — | Record read through `refdef.viewaxis`, `refdef.vieworg`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L195)

<a id="function-function-mq3-client-qvm-preview-app-refreshuiframe-function-refreshuiframe-ui-servertime-src-mq3-client-qvm-preview-app-ml-902152318"></a>
### refreshUiFrame

```ml
function refreshUiFrame(ui, serverTime)
```

Updates `ui.frameCount` during QVM preview app `refreshUiFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ui` | `dynamic` | — | Mutable QVM preview app record/storage; this routine assigns `ui.frameCount`. |
| `serverTime` | `dynamic` | — | Authoritative server timestamp in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L314)

<a id="function-function-mq3-client-qvm-preview-app-releasecinematics-function-releasecinematics-src-mq3-client-qvm-preview-app-ml-1685856072"></a>
### releaseCinematics

```ml
function releaseCinematics()
```

Calls `mq3.platform.playable_window.releaseTexture` from QVM preview app `releaseCinematics`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L539)

<a id="function-function-mq3-client-qvm-preview-app-releasegameinput-function-releasegameinput-bridge-time-src-mq3-client-qvm-preview-app-ml-613051542"></a>
### releaseGameInput

```ml
function releaseGameInput(bridge, time)
```

Calls `mq3.engine.local_qvm_match.keyIsDown`, `mq3.client.qvm_frame_input.applyBound`, `mq3.engine.local_qvm_match.keyBinding` and additional helpers from QVM preview app `releaseGameInput`. The final path returns `frameInput.releaseAll(bridge.frame,bridge.plan,time)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bridge` | `dynamic` | — | Record read through `bridge.matchState`, `bridge.frame`, `bridge.plan`. |
| `time` | `dynamic` | — | Value used by `expanded=frameInput.applyBound(bridge.frame,bridge.plan,time,window.INPUT_KEY,key,0,match.keyBinding(bridge.matchState,key),match.keyCatcher(b...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L323)

<a id="function-function-mq3-client-qvm-preview-app-requestedquit-function-requestedquit-state-src-mq3-client-qvm-preview-app-ml-1441453187"></a>
### requestedQuit

```ml
function requestedQuit(state)
```

Calls `std.string.toLowerAscii`, `std.string.replaceAll`, `std.string.split` and additional helpers from QVM preview app `requestedQuit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.context`, `state.context.console`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L172)

<a id="function-function-mq3-client-qvm-preview-app-run-function-run-archive-map-qvmroot-src-mq3-client-qvm-preview-app-ml-492092014"></a>
### run

```ml
function run(archive, map, qvmRoot)
```

Adapts `mq3.client.qvm_preview_app.runLimited` to QVM preview app `run`, returning its result for `archive, map, qvmRoot, -1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. Forwarded to `mq3.client.qvm_preview_app.runLimited`. |
| `map` | `dynamic` | — | Argument 2 of `mq3.client.qvm_preview_app.runLimited`. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. Forwarded to `mq3.client.qvm_preview_app.runLimited`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L1026)

<a id="function-function-mq3-client-qvm-preview-app-rundesktopmatch-function-rundesktopmatch-archive-map-mapname-qvmroot-settings-session-src-mq3-client-qvm-preview-app-ml-1785129682"></a>
### runDesktopMatch

```ml
function runDesktopMatch(archive, map, mapName, qvmRoot, settings, session)
```

Adapts `mq3.client.qvm_preview_app.runMatch` to QVM preview app `runDesktopMatch`, returning its result for `archive, map, mapName, qvmRoot, -1, settings, session, void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. Forwarded to `mq3.client.qvm_preview_app.runMatch`. |
| `map` | `dynamic` | — | Argument 2 of `mq3.client.qvm_preview_app.runMatch`. |
| `mapName` | `dynamic` | — | Map name used to select the level and its associated assets. Forwarded to `mq3.client.qvm_preview_app.runMatch`. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. Forwarded to `mq3.client.qvm_preview_app.runMatch`. |
| `settings` | `dynamic` | — | Argument 6 of `mq3.client.qvm_preview_app.runMatch`. |
| `session` | `dynamic` | — | Argument 7 of `mq3.client.qvm_preview_app.runMatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L976)

<a id="function-function-mq3-client-qvm-preview-app-rundesktopstream-function-rundesktopstream-archive-map-mapname-qvmroot-settings-session-source-src-mq3-client-qvm-preview-app-ml-1664250057"></a>
### runDesktopStream

```ml
function runDesktopStream(archive, map, mapName, qvmRoot, settings, session, source)
```

Adapts `mq3.client.qvm_preview_app.runMatch` to QVM preview app `runDesktopStream`, returning its result for `archive, map, mapName, qvmRoot, -1, settings, session, source`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. Forwarded to `mq3.client.qvm_preview_app.runMatch`. |
| `map` | `dynamic` | — | Argument 2 of `mq3.client.qvm_preview_app.runMatch`. |
| `mapName` | `dynamic` | — | Map name used to select the level and its associated assets. Forwarded to `mq3.client.qvm_preview_app.runMatch`. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. Forwarded to `mq3.client.qvm_preview_app.runMatch`. |
| `settings` | `dynamic` | — | Argument 6 of `mq3.client.qvm_preview_app.runMatch`. |
| `session` | `dynamic` | — | Argument 7 of `mq3.client.qvm_preview_app.runMatch`. |
| `source` | `dynamic` | — | Argument 8 of `mq3.client.qvm_preview_app.runMatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L985)

<a id="function-function-mq3-client-qvm-preview-app-runlimited-function-runlimited-archive-map-qvmroot-maxframes-src-mq3-client-qvm-preview-app-ml-1574487700"></a>
### runLimited

```ml
function runLimited(archive, map, qvmRoot, maxFrames)
```

Adapts `mq3.client.qvm_preview_app.runLimitedSettings` to QVM preview app `runLimited`, returning its result for `archive, map, qvmRoot, maxFrames, void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. Forwarded to `mq3.client.qvm_preview_app.runLimitedSettings`. |
| `map` | `dynamic` | — | Argument 2 of `mq3.client.qvm_preview_app.runLimitedSettings`. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. Forwarded to `mq3.client.qvm_preview_app.runLimitedSettings`. |
| `maxFrames` | `dynamic` | — | Argument 4 of `mq3.client.qvm_preview_app.runLimitedSettings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L1008)

<a id="function-function-mq3-client-qvm-preview-app-runlimitedsettings-function-runlimitedsettings-archive-map-qvmroot-maxframes-settings-src-mq3-client-qvm-preview-app-ml-1012234959"></a>
### runLimitedSettings

```ml
function runLimitedSettings(archive, map, qvmRoot, maxFrames, settings)
```

Adapts `mq3.client.qvm_preview_app.runLimitedSettingsNamed` to QVM preview app `runLimitedSettings`, returning its result for `archive, map, "q3dm1", qvmRoot, maxFrames, settings`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. Forwarded to `mq3.client.qvm_preview_app.runLimitedSettingsNamed`. |
| `map` | `dynamic` | — | Argument 2 of `mq3.client.qvm_preview_app.runLimitedSettingsNamed`. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. Forwarded to `mq3.client.qvm_preview_app.runLimitedSettingsNamed`. |
| `maxFrames` | `dynamic` | — | Argument 5 of `mq3.client.qvm_preview_app.runLimitedSettingsNamed`. |
| `settings` | `dynamic` | — | Argument 6 of `mq3.client.qvm_preview_app.runLimitedSettingsNamed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L1002)

<a id="function-function-mq3-client-qvm-preview-app-runlimitedsettingsnamed-function-runlimitedsettingsnamed-archive-map-mapname-qvmroot-maxframes-settings-src-mq3-client-qvm-preview-app-ml-946218626"></a>
### runLimitedSettingsNamed

```ml
function runLimitedSettingsNamed(archive, map, mapName, qvmRoot, maxFrames, settings)
```

Adapts `mq3.client.qvm_preview_app.runMatch` to QVM preview app `runLimitedSettingsNamed`, returning its result for `archive, map, mapName, qvmRoot, maxFrames, settings, void, void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. Forwarded to `mq3.client.qvm_preview_app.runMatch`. |
| `map` | `dynamic` | — | Argument 2 of `mq3.client.qvm_preview_app.runMatch`. |
| `mapName` | `dynamic` | — | Map name used to select the level and its associated assets. Forwarded to `mq3.client.qvm_preview_app.runMatch`. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. Forwarded to `mq3.client.qvm_preview_app.runMatch`. |
| `maxFrames` | `dynamic` | — | Argument 5 of `mq3.client.qvm_preview_app.runMatch`. |
| `settings` | `dynamic` | — | Argument 6 of `mq3.client.qvm_preview_app.runMatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L995)

<a id="function-function-mq3-client-qvm-preview-app-runmatch-function-runmatch-archive-map-mapname-qvmroot-maxframes-settings-session-source-src-mq3-client-qvm-preview-app-ml-1388974959"></a>
### runMatch

```ml
function runMatch(archive, map, mapName, qvmRoot, maxFrames, settings, session, source)
```

Calls `mq3.platform.playable_window.open`, `mq3.client.map_loading.create`, `mq3.platform.playable_window.shutdown` and additional helpers from QVM preview app `runMatch`. The final path returns `loaded`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `map` | `dynamic` | — | map record passed to the QVM preview app helper calls. |
| `mapName` | `dynamic` | — | Map name used to select the level and its associated assets. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. |
| `maxFrames` | `dynamic` | — | Value used by `if archive==void or map==void or maxFrames==0 or maxFrames< -1 then return fail("invalid launch input") end if`. |
| `settings` | `dynamic` | — | Value used by `loaded=try(runMatchWithLoading(archive,map,mapName,qvmRoot,maxFrames,settings,session,source,screen,SOURCE_WIDTH,SOURCE_HEIGHT))`. |
| `session` | `dynamic` | — | session record passed to the QVM preview app helper calls. |
| `source` | `dynamic` | — | Record read through `source.name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L652)

<a id="function-function-mq3-client-qvm-preview-app-runmatchwithloading-function-runmatchwithloading-archive-map-mapname-qvmroot-maxframes-settings-session-source-screen-initialwidth-initialheight-src-mq3-client-qvm-preview-app-ml-1787234940"></a>
### runMatchWithLoading

```ml
function runMatchWithLoading(archive, map, mapName, qvmRoot, maxFrames, settings, session, source, screen, initialWidth, initialHeight)
```

Updates `session.videoWidth`, `session.videoHeight`, `session.action`, `session.videoRestart` during QVM preview app `runMatchWithLoading`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `map` | `dynamic` | — | Record read through `map.counts`. |
| `mapName` | `dynamic` | — | Map name used to select the level and its associated assets. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. |
| `maxFrames` | `dynamic` | — | Value used by `interactiveInput=maxFrames<0`. |
| `settings` | `dynamic` | — | Value used by `state=try(bootMatch(archive,map,mapName,qvmRoot,settings,source))`. |
| `session` | `dynamic` | — | Mutable QVM preview app record/storage; this routine assigns `session.videoWidth`, `session.videoHeight`, `session.action`, `session.videoRestart`. |
| `source` | `dynamic` | — | Record read through `source.demo`, `source.transport.completed`, `source.scene.dlights`, `source.refdef.flags` and additional values. |
| `screen` | `dynamic` | — | Record read through `screen.startedAt`, `screen.catalog`, `screen.scripts`, `screen.indexMillis`. |
| `initialWidth` | `dynamic` | — | Value used by `loading=mapLoading.show(screen,"maps/"+mapName+".bsp",initialWidth,initialHeight,void,false)`. |
| `initialHeight` | `dynamic` | — | Value used by `loading=mapLoading.show(screen,"maps/"+mapName+".bsp",initialWidth,initialHeight,void,false)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L687)

<a id="function-function-mq3-client-qvm-preview-app-runwithsettings-function-runwithsettings-archive-map-qvmroot-settings-src-mq3-client-qvm-preview-app-ml-1966946263"></a>
### runWithSettings

```ml
function runWithSettings(archive, map, qvmRoot, settings)
```

Adapts `mq3.client.qvm_preview_app.runLimitedSettings` to QVM preview app `runWithSettings`, returning its result for `archive, map, qvmRoot, -1, settings`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. Forwarded to `mq3.client.qvm_preview_app.runLimitedSettings`. |
| `map` | `dynamic` | — | Argument 2 of `mq3.client.qvm_preview_app.runLimitedSettings`. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. Forwarded to `mq3.client.qvm_preview_app.runLimitedSettings`. |
| `settings` | `dynamic` | — | Argument 5 of `mq3.client.qvm_preview_app.runLimitedSettings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L1014)

<a id="function-function-mq3-client-qvm-preview-app-runwithsettingsnamed-function-runwithsettingsnamed-archive-map-mapname-qvmroot-settings-src-mq3-client-qvm-preview-app-ml-101609094"></a>
### runWithSettingsNamed

```ml
function runWithSettingsNamed(archive, map, mapName, qvmRoot, settings)
```

Adapts `mq3.client.qvm_preview_app.runLimitedSettingsNamed` to QVM preview app `runWithSettingsNamed`, returning its result for `archive, map, mapName, qvmRoot, -1, settings`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. Forwarded to `mq3.client.qvm_preview_app.runLimitedSettingsNamed`. |
| `map` | `dynamic` | — | Argument 2 of `mq3.client.qvm_preview_app.runLimitedSettingsNamed`. |
| `mapName` | `dynamic` | — | Map name used to select the level and its associated assets. Forwarded to `mq3.client.qvm_preview_app.runLimitedSettingsNamed`. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. Forwarded to `mq3.client.qvm_preview_app.runLimitedSettingsNamed`. |
| `settings` | `dynamic` | — | Argument 6 of `mq3.client.qvm_preview_app.runLimitedSettingsNamed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L1021)

- [mq3.client.qvm_preview_app.ScreenPoint](Type-mq3-client-qvm-preview-app-screenpoint-1997150010.md) — struct
<a id="function-function-mq3-client-qvm-preview-app-selectioncamera-function-selectioncamera-view-src-mq3-client-qvm-preview-app-ml-657531987"></a>
### selectionCamera

```ml
function selectionCamera(view)
```

Calls `mq3.shared.math.vectoangles`, `mq3.client.playable_viewer.camera` from QVM preview app `selectionCamera`. The final path returns `viewer.camera(view.refdef.vieworg,angles[1],angles[0],0.0,0.0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `view` | `dynamic` | — | Record read through `view.refdef.viewaxis`, `view.refdef.vieworg`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L190)

<a id="function-function-mq3-client-qvm-preview-app-sendstreamframe-function-sendstreamframe-state-source-created-now-src-mq3-client-qvm-preview-app-ml-407189168"></a>
### sendStreamFrame

```ml
function sendStreamFrame(state, source, created, now)
```

Updates `source.systemInfo` during QVM preview app `sendStreamFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.context.configstrings`, `state.context.cvars`, `state.context`. |
| `source` | `dynamic` | — | Mutable QVM preview app record/storage; this routine assigns `source.systemInfo`. |
| `created` | `dynamic` | — | Value used by `if created==void then return false end if`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L624)

<a id="constant-constant-mq3-client-qvm-preview-app-source-height-const-source-height-720-src-mq3-client-qvm-preview-app-ml-1988144262"></a>
### SOURCE_HEIGHT

```ml
const SOURCE_HEIGHT = 720
```

Nominal source-view height used when scaling QVM presentation into the preview target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L79)

<a id="constant-constant-mq3-client-qvm-preview-app-source-width-const-source-width-1280-src-mq3-client-qvm-preview-app-ml-1418421168"></a>
### SOURCE_WIDTH

```ml
const SOURCE_WIDTH = 1280
```

Nominal source-view width used when scaling QVM presentation into the preview target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L77)

<a id="function-function-mq3-client-qvm-preview-app-stoploading-function-stoploading-screen-state-session-result-src-mq3-client-qvm-preview-app-ml-1751609184"></a>
### stopLoading

```ml
function stopLoading(screen, state, session, result)
```

Updates `session.action` during QVM preview app `stopLoading`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `screen` | `dynamic` | — | Value used by `mapLoading.release(screen)`. |
| `state` | `dynamic` | — | Shared QVM preview app state passed to the helper calls in `stopLoading`. |
| `session` | `dynamic` | — | Mutable QVM preview app record/storage; this routine assigns `session.action`. |
| `result` | `dynamic` | — | Value used by `if result is error then return result end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L666)

- [mq3.client.qvm_preview_app.StreamSource](Type-mq3-client-qvm-preview-app-streamsource-1230160357.md) — struct
<a id="function-function-mq3-client-qvm-preview-app-updatestream-function-updatestream-state-source-clientclock-servertime-demotime-src-mq3-client-qvm-preview-app-ml-417134119"></a>
### updateStream

```ml
function updateStream(state, source, clientClock, serverTime, demoTime)
```

Calls `mq3.client.demo_playback.advance`, `mq3.client.remote_play.pump`, `mq3.engine.local_qvm_match.refreshServerStream` and additional helpers from QVM preview app `updateStream`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.context.snapshotNumber`. |
| `source` | `dynamic` | — | Record read through `source.demo`, `source.transport`, `source.protocol.dispatcher.snapshotState.snap`. |
| `clientClock` | `dynamic` | — | Record read through `clientClock.snapshotNumber`. |
| `serverTime` | `dynamic` | — | Authoritative server timestamp in milliseconds. |
| `demoTime` | `dynamic` | — | Value used by `read=try(demos.advance(source.transport,demoTime,serverTime))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L605)

<a id="function-function-mq3-client-qvm-preview-app-uploadlightmaps-function-uploadlightmaps-map-src-mq3-client-qvm-preview-app-ml-1440600492"></a>
### uploadLightmaps

```ml
function uploadLightmaps(map)
```

Calls `mq3.renderer.bsp_render_data.lightmapRgba`, `mq3.platform.playable_window.uploadTexture` from QVM preview app `uploadLightmaps`. The final path returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record read through `map.counts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L419)

<a id="constant-constant-mq3-client-qvm-preview-app-world-texture-first-slot-const-world-texture-first-slot-256-src-mq3-client-qvm-preview-app-ml-311842162"></a>
### WORLD_TEXTURE_FIRST_SLOT

```ml
const WORLD_TEXTURE_FIRST_SLOT = 256
```

Texture-cache slot or starting slot reserved for the world rendering resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_preview_app.ml#L60)
