# `src/mq3/client/qvm_menu_app.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.qvm_menu_app`](Package-mq3-client-qvm-menu-app-2008927821.md)

Reachable from entry: **yes**

## Imports

- `mq3/audio/qvm_playback.ml` as `qvmPlayback` → [src/mq3/audio/qvm_playback.ml](File-src-mq3-audio-qvm-playback-ml-324023706.md)
- `mq3/audio/qvm_sound_assets.ml` as `qvmSoundAssets` → [src/mq3/audio/qvm_sound_assets.ml](File-src-mq3-audio-qvm-sound-assets-ml-1587569282.md)
- `mq3/client/cinematic_runtime.ml` as `cinematics` → [src/mq3/client/cinematic_runtime.ml](File-src-mq3-client-cinematic-runtime-ml-1539162371.md)
- `mq3/client/demo_playback.ml` as `demos` → [src/mq3/client/demo_playback.ml](File-src-mq3-client-demo-playback-ml-1167034666.md)
- `mq3/client/desktop_session.ml` as `desktopSession` → [src/mq3/client/desktop_session.ml](File-src-mq3-client-desktop-session-ml-419426432.md)
- `mq3/client/desktop_video.ml` as `desktopVideo` → [src/mq3/client/desktop_video.ml](File-src-mq3-client-desktop-video-ml-2115297537.md)
- `mq3/client/frame_timing.ml` as `frameTiming` → [src/mq3/client/frame_timing.ml](File-src-mq3-client-frame-timing-ml-1638282389.md)
- `mq3/client/map_loading.ml` as `mapLoading` → [src/mq3/client/map_loading.ml](File-src-mq3-client-map-loading-ml-2006073650.md)
- `mq3/client/original_ui_session.ml` as `uiSession` → [src/mq3/client/original_ui_session.ml](File-src-mq3-client-original-ui-session-ml-619334882.md)
- `mq3/client/qvm_preview_app.ml` as `gameApp` → [src/mq3/client/qvm_preview_app.ml](File-src-mq3-client-qvm-preview-app-ml-1410259322.md)
- `mq3/client/remote_play.ml` as `remote` → [src/mq3/client/remote_play.ml](File-src-mq3-client-remote-play-ml-1364331402.md)
- `mq3/engine/local_qvm_match.ml` as `match` → [src/mq3/engine/local_qvm_match.ml](File-src-mq3-engine-local-qvm-match-ml-725859098.md)
- `mq3/engine/local_qvm_ui.ml` as `localQvmUi` → [src/mq3/engine/local_qvm_ui.ml](File-src-mq3-engine-local-qvm-ui-ml-719408963.md)
- `mq3/format/bsp.ml` as `bsp` → [src/mq3/format/bsp.ml](File-src-mq3-format-bsp-ml-526613882.md)
- `mq3/format/mod_stack.ml` as `mods` → [src/mq3/format/mod_stack.ml](File-src-mq3-format-mod-stack-ml-1677131492.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/platform/playable_ambient.ml` as `audioOutput` → [src/mq3/platform/playable_ambient.ml](File-src-mq3-platform-playable-ambient-ml-1461563654.md)
- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/qcommon/command_buffer.ml` as `commands` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/qvm_2d_batch.ml` as `qvm2d` → [src/mq3/renderer/qvm_2d_batch.ml](File-src-mq3-renderer-qvm-2d-batch-ml-1820350507.md)
- `mq3/renderer/shader_index.ml` as `shaderIndex` → [src/mq3/renderer/shader_index.ml](File-src-mq3-renderer-shader-index-ml-492021135.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency
- `std/time.ml` as `time` → `../MiniLangCompilerML/std/time.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-client-qvm-menu-app-cinematic-texture-slot-const-cinematic-texture-slot-4055-src-mq3-client-qvm-menu-app-ml-2080074531"></a>
### CINEMATIC_TEXTURE_SLOT

```ml
const CINEMATIC_TEXTURE_SLOT = 4055
```

Texture-cache slot or starting slot reserved for the cinematic rendering resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_menu_app.ml#L41)

<a id="function-function-mq3-client-qvm-menu-app-fail-function-fail-message-src-mq3-client-qvm-menu-app-ml-219657267"></a>
### fail

```ml
function fail(message)
```

Creates the QVM menu app error `7688` with diagnostic text `"QVM menu: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"QVM menu: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_menu_app.ml#L56)

<a id="constant-constant-mq3-client-qvm-menu-app-first-texture-slot-const-first-texture-slot-1-src-mq3-client-qvm-menu-app-ml-1030347800"></a>
### FIRST_TEXTURE_SLOT

```ml
const FIRST_TEXTURE_SLOT = 1
```

Texture-cache slot or starting slot reserved for the first rendering resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_menu_app.ml#L37)

<a id="function-function-mq3-client-qvm-menu-app-loadlocalmatch-function-loadlocalmatch-archive-session-qvmroot-src-mq3-client-qvm-menu-app-ml-199632816"></a>
### loadLocalMatch

```ml
function loadLocalMatch(archive, session, qvmRoot)
```

Updates `session.action` during QVM menu app `loadLocalMatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `session` | `dynamic` | — | Mutable QVM menu app record/storage; this routine assigns `session.action`. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_menu_app.ml#L212)

<a id="function-function-mq3-client-qvm-menu-app-loadmap-function-loadmap-archive-dataroot-name-src-mq3-client-qvm-menu-app-ml-1837954293"></a>
### loadMap

```ml
function loadMap(archive, dataRoot, name)
```

Calls `mq3.engine.local_qvm_match.desktopFilePath`, `std.string.indexOf`, `mq3.format.pk3.read` and additional helpers from QVM menu app `loadMap`. The final path returns `bsp.load(mapData)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `dataRoot` | `dynamic` | — | Value used by `if name=="" or match.desktopFilePath(dataRoot,relative)=="" then return fail("invalid map name") end if`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding QVM menu app resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_menu_app.ml#L200)

<a id="constant-constant-mq3-client-qvm-menu-app-max-texture-slots-const-max-texture-slots-300-src-mq3-client-qvm-menu-app-ml-572085514"></a>
### MAX_TEXTURE_SLOTS

```ml
const MAX_TEXTURE_SLOTS = 300
```

Capacity limit for the texture slots collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_menu_app.ml#L39)

<a id="function-function-mq3-client-qvm-menu-app-renderstream-function-renderstream-basearchive-archive-installroot-qvmroot-session-source-src-mq3-client-qvm-menu-app-ml-441497051"></a>
### renderStream

```ml
function renderStream(baseArchive, archive, installRoot, qvmRoot, session, source)
```

Updates `session.action` during QVM menu app `renderStream`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `baseArchive` | `dynamic` | — | Value used by `mounted=try(mods.mount(baseArchive,installRoot,game))`. |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `installRoot` | `dynamic` | — | Value used by `mounted=try(mods.mount(baseArchive,installRoot,game))`. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. |
| `session` | `dynamic` | — | Mutable QVM menu app record/storage; this routine assigns `session.action`. |
| `source` | `dynamic` | — | Record read through `source.demo`, `source.transport.mapName`, `source.transport`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_menu_app.ml#L258)

<a id="function-function-mq3-client-qvm-menu-app-run-function-run-archive-bootstrapmap-qvmroot-src-mq3-client-qvm-menu-app-ml-1503318232"></a>
### run

```ml
function run(archive, bootstrapMap, qvmRoot)
```

Calls `mq3.platform.playable_window.executableDirectory`, `mq3.client.desktop_session.create`, `mq3.client.qvm_menu_app.loadLocalMatch` and additional helpers from QVM menu app `run`. The final path returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `bootstrapMap` | `dynamic` | — | Value used by `result=try(runMenu(activeArchive,bootstrapMap,qvmRoot,session,request=="levelselect"))`. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_menu_app.ml#L314)

<a id="function-function-mq3-client-qvm-menu-app-runcinematic-function-runcinematic-archive-session-measurepixels-src-mq3-client-qvm-menu-app-ml-1091549707"></a>
### runCinematic

```ml
function runCinematic(archive, session, measurePixels)
```

CL_PlayCinematic_f takes ownership of the disconnected screen. When the system RoQ ends, CL_HandleCinEnd queues the saved nextmap command.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `session` | `dynamic` | — | Record read through `session.target`, `session.videoWidth`, `session.videoHeight`. |
| `measurePixels` | `dynamic` | — | Value used by `if measurePixels then lit=window.presentedNonBlack()`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_menu_app.ml#L139)

<a id="function-function-mq3-client-qvm-menu-app-runmenu-function-runmenu-archive-bootstrapmap-qvmroot-session-openlevelselect-src-mq3-client-qvm-menu-app-ml-538961304"></a>
### runMenu

```ml
function runMenu(archive, bootstrapMap, qvmRoot, session, openLevelSelect)
```

Updates `session.videoWidth`, `session.videoHeight`, `session.videoRestart` during QVM menu app `runMenu`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. Record read through `archive.modArchive`. |
| `bootstrapMap` | `dynamic` | — | Value used by `state=match.bootUiShellSettings(archive,bootstrapMap,1000,qvmRoot,session.settings)`. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. |
| `session` | `dynamic` | — | Mutable QVM menu app record/storage; this routine assigns `session.videoWidth`, `session.videoHeight`, `session.videoRestart`. |
| `openLevelSelect` | `dynamic` | — | Value used by `if openLevelSelect then match.executeClientConsole(state,"levelselect") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_menu_app.ml#L64)

<a id="function-function-mq3-client-qvm-menu-app-runstream-function-runstream-basearchive-archive-installroot-qvmroot-session-demoplaying-src-mq3-client-qvm-menu-app-ml-255400437"></a>
### runStream

```ml
function runStream(baseArchive, archive, installRoot, qvmRoot, session, demoPlaying)
```

Updates `session.activeGame`, `session.dataRoot`, `session.settings`, `session.configLoaded` during QVM menu app `runStream`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `baseArchive` | `dynamic` | — | Value used by `result=try(renderStream(baseArchive,archive,installRoot,qvmRoot,session,source))`. |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `installRoot` | `dynamic` | — | Value used by `if not demoPlaying then remote.setBasePackages(transport,installRoot+"/baseq3") end if`. |
| `qvmRoot` | `dynamic` | — | Directory containing the retail QVM bytecode files. |
| `session` | `dynamic` | — | Mutable QVM menu app record/storage; this routine assigns `session.activeGame`, `session.dataRoot`, `session.settings`, `session.configLoaded`. |
| `demoPlaying` | `dynamic` | — | Value used by `if demoPlaying then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_menu_app.ml#L290)

- [mq3.client.qvm_menu_app.ScreenPoint](Type-mq3-client-qvm-menu-app-screenpoint-1566616169.md) — struct
<a id="constant-constant-mq3-client-qvm-menu-app-source-height-const-source-height-720-src-mq3-client-qvm-menu-app-ml-1893579200"></a>
### SOURCE_HEIGHT

```ml
const SOURCE_HEIGHT = 720
```

Nominal source-view height used when scaling QVM presentation into the preview target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_menu_app.ml#L35)

<a id="constant-constant-mq3-client-qvm-menu-app-source-width-const-source-width-1280-src-mq3-client-qvm-menu-app-ml-723930664"></a>
### SOURCE_WIDTH

```ml
const SOURCE_WIDTH = 1280
```

Nominal source-view width used when scaling QVM presentation into the preview target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_menu_app.ml#L33)

<a id="function-function-mq3-client-qvm-menu-app-switchgame-function-switchgame-session-mounted-src-mq3-client-qvm-menu-app-ml-125974246"></a>
### switchGame

```ml
function switchGame(session, mounted)
```

Updates `session.activeGame`, `session.dataRoot`, `session.settings`, `session.configLoaded` and additional values during QVM menu app `switchGame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `session` | `dynamic` | — | Mutable QVM menu app record/storage; this routine assigns `session.activeGame`, `session.dataRoot`, `session.settings`, `session.configLoaded` and additional values. |
| `mounted` | `dynamic` | — | Record read through `mounted.game`, `mounted.dataRoot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_menu_app.ml#L226)

<a id="function-function-mq3-client-qvm-menu-app-waitforserver-function-waitforserver-live-src-mq3-client-qvm-menu-app-ml-2042830486"></a>
### waitForServer

```ml
function waitForServer(live)
```

Calls `mq3.platform.playable_window.shouldClose`, `mq3.platform.playable_window.milliseconds`, `mq3.client.remote_play.pump` and additional helpers from QVM menu app `waitForServer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `live` | `dynamic` | — | Value used by `ready=try(remote.pump(live,now,64))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/qvm_menu_app.ml#L237)
