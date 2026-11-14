# `src/main.ml`

[Home](README.md) · [Files](Files.md)

Package: [`(global)`](Package-global-1952375359.md)

Reachable from entry: **yes**

## Imports

- `mq3/audio/channel_paint.ml` as `audioChannelPaint` → [src/mq3/audio/channel_paint.ml](File-src-mq3-audio-channel-paint-ml-452074202.md)
- `mq3/audio/mixer_transfer.ml` as `audioMixerTransfer` → [src/mq3/audio/mixer_transfer.ml](File-src-mq3-audio-mixer-transfer-ml-1564271583.md)
- `mq3/audio/wav.ml` as `wav` → [src/mq3/audio/wav.ml](File-src-mq3-audio-wav-ml-983927564.md)
- `mq3/client/cgame_time.ml` as `clientCgameTime` → [src/mq3/client/cgame_time.ml](File-src-mq3-client-cgame-time-ml-148018170.md)
- `mq3/client/cgame_vm.ml` as `clientCgameVm` → [src/mq3/client/cgame_vm.ml](File-src-mq3-client-cgame-vm-ml-1871886258.md)
- `mq3/client/connectionless.ml` as `clientConnectionless` → [src/mq3/client/connectionless.ml](File-src-mq3-client-connectionless-ml-1561502254.md)
- `mq3/client/demo.ml` as `clientDemo` → [src/mq3/client/demo.ml](File-src-mq3-client-demo-ml-1236155596.md)
- `mq3/client/download.ml` as `clientDownload` → [src/mq3/client/download.ml](File-src-mq3-client-download-ml-170988721.md)
- `mq3/client/frame.ml` as `clientMainFrame` → [src/mq3/client/frame.ml](File-src-mq3-client-frame-ml-2110176474.md)
- `mq3/client/gamestate.ml` as `clientGamestate` → [src/mq3/client/gamestate.ml](File-src-mq3-client-gamestate-ml-1690167636.md)
- `mq3/client/netchan.ml` as `clientNetchan` → [src/mq3/client/netchan.ml](File-src-mq3-client-netchan-ml-1745063016.md)
- `mq3/client/network_ingress.ml` as `clientNetworkIngress` → [src/mq3/client/network_ingress.ml](File-src-mq3-client-network-ingress-ml-1289633455.md)
- `mq3/client/packet_event.ml` as `clientPacketEvent` → [src/mq3/client/packet_event.ml](File-src-mq3-client-packet-event-ml-580908436.md)
- `mq3/client/playable_app.ml` as `playableApp` → [src/mq3/client/playable_app.ml](File-src-mq3-client-playable-app-ml-15784959.md)
- `mq3/client/playable_viewer.ml` as `playableViewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/client/protocol_runtime.ml` as `clientProtocolRuntime` → [src/mq3/client/protocol_runtime.ml](File-src-mq3-client-protocol-runtime-ml-1085434472.md)
- `mq3/client/qvm_menu_app.ml` as `qvmMenuApp` → [src/mq3/client/qvm_menu_app.ml](File-src-mq3-client-qvm-menu-app-ml-631606489.md)
- `mq3/client/qvm_preview_app.ml` as `qvmPreviewApp` → [src/mq3/client/qvm_preview_app.ml](File-src-mq3-client-qvm-preview-app-ml-1410259322.md)
- `mq3/client/server_message.ml` as `serverMessage` → [src/mq3/client/server_message.ml](File-src-mq3-client-server-message-ml-749329636.md)
- `mq3/client/snapshot_command.ml` as `snapshotCommand` → [src/mq3/client/snapshot_command.ml](File-src-mq3-client-snapshot-command-ml-285373799.md)
- `mq3/client/snapshot_parse.ml` as `snapshotParse` → [src/mq3/client/snapshot_parse.ml](File-src-mq3-client-snapshot-parse-ml-455311349.md)
- `mq3/client/system_info.ml` as `clientSystemInfo` → [src/mq3/client/system_info.ml](File-src-mq3-client-system-info-ml-628530239.md)
- `mq3/client/ui_vm.ml` as `clientUiVm` → [src/mq3/client/ui_vm.ml](File-src-mq3-client-ui-vm-ml-1076773103.md)
- `mq3/collision/visibility.ml` as `vis` → [src/mq3/collision/visibility.ml](File-src-mq3-collision-visibility-ml-1423508826.md)
- `mq3/collision/world.ml` as `cm` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/engine/local_qvm_match.ml` as `localQvmMatch` → [src/mq3/engine/local_qvm_match.ml](File-src-mq3-engine-local-qvm-match-ml-725859098.md)
- `mq3/format/bsp.ml` as `bsp` → [src/mq3/format/bsp.ml](File-src-mq3-format-bsp-ml-526613882.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/game/bot_combat_ai.ml` as `botCombatAi` → [src/mq3/game/bot_combat_ai.ml](File-src-mq3-game-bot-combat-ai-ml-1348181617.md)
- `mq3/game/bot_fight_state.ml` as `botFightState` → [src/mq3/game/bot_fight_state.ml](File-src-mq3-game-bot-fight-state-ml-409372288.md)
- `mq3/game/bot_inventory_ai.ml` as `botInventoryAi` → [src/mq3/game/bot_inventory_ai.ml](File-src-mq3-game-bot-inventory-ai-ml-518509243.md)
- `mq3/game/bot_navigation.ml` as `botNavigation` → [src/mq3/game/bot_navigation.ml](File-src-mq3-game-bot-navigation-ml-746290412.md)
- `mq3/game/bot_seek_state.ml` as `botSeekState` → [src/mq3/game/bot_seek_state.ml](File-src-mq3-game-bot-seek-state-ml-2095182684.md)
- `mq3/game/bot_team_helpers.ml` as `botTeamHelpers` → [src/mq3/game/bot_team_helpers.ml](File-src-mq3-game-bot-team-helpers-ml-2010714111.md)
- `mq3/game/replay.ml` as `replay` → [src/mq3/game/replay.ml](File-src-mq3-game-replay-ml-1176474913.md)
- `mq3/platform/desktop_frame_host.ml` as `desktopFrameHost` → [src/mq3/platform/desktop_frame_host.ml](File-src-mq3-platform-desktop-frame-host-ml-537034802.md)
- `mq3/platform/engine_loop.ml` as `engineLoop` → [src/mq3/platform/engine_loop.ml](File-src-mq3-platform-engine-loop-ml-224472914.md)
- `mq3/platform/input_events.ml` as `inputEvents` → [src/mq3/platform/input_events.ml](File-src-mq3-platform-input-events-ml-1710405869.md)
- `mq3/platform/playable_audio.ml` as `playableAudio` → [src/mq3/platform/playable_audio.ml](File-src-mq3-platform-playable-audio-ml-1415322964.md)
- `mq3/platform/playable_window.ml` as `playableWindow` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/platform/udp.ml` as `platformUdp` → [src/mq3/platform/udp.ml](File-src-mq3-platform-udp-ml-646757928.md)
- `mq3/qcommon/command_buffer.ml` as `commandBuffer` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/message_delta.ml` as `messageDelta` → [src/mq3/qcommon/message_delta.ml](File-src-mq3-qcommon-message-delta-ml-1923515516.md)
- `mq3/qcommon/message_state_delta.ml` as `messageStateDelta` → [src/mq3/qcommon/message_state_delta.ml](File-src-mq3-qcommon-message-state-delta-ml-255612102.md)
- `mq3/qcommon/net_transport.ml` as `netTransport` → [src/mq3/qcommon/net_transport.ml](File-src-mq3-qcommon-net-transport-ml-1557933377.md)
- `mq3/qcommon/netchan.ml` as `netchan` → [src/mq3/qcommon/netchan.ml](File-src-mq3-qcommon-netchan-ml-1381353623.md)
- `mq3/qcommon/network_pump.ml` as `networkPump` → [src/mq3/qcommon/network_pump.ml](File-src-mq3-qcommon-network-pump-ml-493477247.md)
- `mq3/qcommon/startup_commands.ml` as `startupCommands` → [src/mq3/qcommon/startup_commands.ml](File-src-mq3-qcommon-startup-commands-ml-835791996.md)
- `mq3/renderer/bsp_preview.ml` as `rendererBspPreview` → [src/mq3/renderer/bsp_preview.ml](File-src-mq3-renderer-bsp-preview-ml-563591503.md)
- `mq3/renderer/command_queue.ml` as `rendererCommandQueue` → [src/mq3/renderer/command_queue.ml](File-src-mq3-renderer-command-queue-ml-1425855282.md)
- `mq3/renderer/draw_surfs.ml` as `rendererDrawSurfs` → [src/mq3/renderer/draw_surfs.ml](File-src-mq3-renderer-draw-surfs-ml-75092385.md)
- `mq3/renderer/image_processing.ml` as `rendererImageProcessing` → [src/mq3/renderer/image_processing.ml](File-src-mq3-renderer-image-processing-ml-681348538.md)
- `mq3/renderer/image_registry.ml` as `rendererImageRegistry` → [src/mq3/renderer/image_registry.ml](File-src-mq3-renderer-image-registry-ml-1972611638.md)
- `mq3/renderer/model_tags.ml` as `rendererModelTags` → [src/mq3/renderer/model_tags.ml](File-src-mq3-renderer-model-tags-ml-707870696.md)
- `mq3/renderer/qvm_scene_batch.ml` as `qvmSceneBatch` → [src/mq3/renderer/qvm_scene_batch.ml](File-src-mq3-renderer-qvm-scene-batch-ml-1031575875.md)
- `mq3/renderer/qvm_scene_geometry.ml` as `qvmSceneGeometry` → [src/mq3/renderer/qvm_scene_geometry.ml](File-src-mq3-renderer-qvm-scene-geometry-ml-51177627.md)
- `mq3/renderer/qvm_scene_materials.ml` as `qvmSceneMaterials` → [src/mq3/renderer/qvm_scene_materials.ml](File-src-mq3-renderer-qvm-scene-materials-ml-310916497.md)
- `mq3/renderer/scene_queue.ml` as `rendererSceneQueue` → [src/mq3/renderer/scene_queue.ml](File-src-mq3-renderer-scene-queue-ml-703423413.md)
- `mq3/renderer/shader_index.ml` as `rendererShaderIndex` → [src/mq3/renderer/shader_index.ml](File-src-mq3-renderer-shader-index-ml-492021135.md)
- `mq3/renderer/shader_parser.ml` as `rendererShaderParser` → [src/mq3/renderer/shader_parser.ml](File-src-mq3-renderer-shader-parser-ml-2114769074.md)
- `mq3/renderer/surface_entities.ml` as `rendererSurfaceEntities` → [src/mq3/renderer/surface_entities.ml](File-src-mq3-renderer-surface-entities-ml-629652876.md)
- `mq3/renderer/surface_grid.ml` as `rendererSurfaceGrid` → [src/mq3/renderer/surface_grid.ml](File-src-mq3-renderer-surface-grid-ml-668182529.md)
- `mq3/renderer/surface_md3.ml` as `rendererSurfaceMd3` → [src/mq3/renderer/surface_md3.ml](File-src-mq3-renderer-surface-md3-ml-438987327.md)
- `mq3/renderer/surface_mesh.ml` as `rendererSurfaceMesh` → [src/mq3/renderer/surface_mesh.ml](File-src-mq3-renderer-surface-mesh-ml-873120018.md)
- `mq3/renderer/surface_polychain.ml` as `rendererSurfacePolychain` → [src/mq3/renderer/surface_polychain.ml](File-src-mq3-renderer-surface-polychain-ml-2005384852.md)
- `mq3/renderer/texture_state.ml` as `rendererTextureState` → [src/mq3/renderer/texture_state.ml](File-src-mq3-renderer-texture-state-ml-1230714594.md)
- `mq3/renderer/tga.ml` as `rendererTga` → [src/mq3/renderer/tga.ml](File-src-mq3-renderer-tga-ml-193567265.md)
- `mq3/renderer/view_math.ml` as `rendererViewMath` → [src/mq3/renderer/view_math.ml](File-src-mq3-renderer-view-math-ml-126526929.md)
- `mq3/server/client_command.ml` as `serverClientCommand` → [src/mq3/server/client_command.ml](File-src-mq3-server-client-command-ml-1186902078.md)
- `mq3/server/client_command_dispatch.ml` as `serverClientCommandDispatch` → [src/mq3/server/client_command_dispatch.ml](File-src-mq3-server-client-command-dispatch-ml-253634273.md)
- `mq3/server/client_input.ml` as `serverClientInput` → [src/mq3/server/client_input.ml](File-src-mq3-server-client-input-ml-936991025.md)
- `mq3/server/client_message.ml` as `serverClientMessage` → [src/mq3/server/client_message.ml](File-src-mq3-server-client-message-ml-526567844.md)
- `mq3/server/client_pings.ml` as `serverClientPings` → [src/mq3/server/client_pings.ml](File-src-mq3-server-client-pings-ml-573754950.md)
- `mq3/server/connectionless.ml` as `serverConnectionless` → [src/mq3/server/connectionless.ml](File-src-mq3-server-connectionless-ml-1112827538.md)
- `mq3/server/download.ml` as `serverDownload` → [src/mq3/server/download.ml](File-src-mq3-server-download-ml-1708412053.md)
- `mq3/server/frame.ml` as `serverFrame` → [src/mq3/server/frame.ml](File-src-mq3-server-frame-ml-1912753238.md)
- `mq3/server/game_vm.ml` as `serverGameVm` → [src/mq3/server/game_vm.ml](File-src-mq3-server-game-vm-ml-2099996303.md)
- `mq3/server/netchan.ml` as `serverNetchan` → [src/mq3/server/netchan.ml](File-src-mq3-server-netchan-ml-1084677692.md)
- `mq3/server/network_ingress.ml` as `serverNetworkIngress` → [src/mq3/server/network_ingress.ml](File-src-mq3-server-network-ingress-ml-1810419035.md)
- `mq3/server/oob_connect.ml` as `oobConnect` → [src/mq3/server/oob_connect.ml](File-src-mq3-server-oob-connect-ml-829458266.md)
- `mq3/server/packet_event.ml` as `serverPacketEvent` → [src/mq3/server/packet_event.ml](File-src-mq3-server-packet-event-ml-761376352.md)
- `mq3/server/pause.ml` as `serverPause` → [src/mq3/server/pause.ml](File-src-mq3-server-pause-ml-1830413695.md)
- `mq3/server/pipeline.ml` as `serverPipeline` → [src/mq3/server/pipeline.ml](File-src-mq3-server-pipeline-ml-1429392167.md)
- `mq3/server/reliable_commands.ml` as `reliableCommands` → [src/mq3/server/reliable_commands.ml](File-src-mq3-server-reliable-commands-ml-1690433750.md)
- `mq3/server/snapshot_build.ml` as `snapshotBuild` → [src/mq3/server/snapshot_build.ml](File-src-mq3-server-snapshot-build-ml-2050633468.md)
- `mq3/server/snapshot_delta.ml` as `snapshotDelta` → [src/mq3/server/snapshot_delta.ml](File-src-mq3-server-snapshot-delta-ml-942379398.md)
- `mq3/server/snapshot_runtime.ml` as `snapshotRuntime` → [src/mq3/server/snapshot_runtime.ml](File-src-mq3-server-snapshot-runtime-ml-1458120552.md)
- `mq3/server/snapshot_schedule.ml` as `serverSnapshotSchedule` → [src/mq3/server/snapshot_schedule.ml](File-src-mq3-server-snapshot-schedule-ml-156964973.md)
- `mq3/server/snapshot_send.ml` as `snapshotSend` → [src/mq3/server/snapshot_send.ml](File-src-mq3-server-snapshot-send-ml-704467576.md)
- `mq3/server/timeouts.ml` as `serverTimeouts` → [src/mq3/server/timeouts.ml](File-src-mq3-server-timeouts-ml-1356487829.md)
- `mq3/server/user_move.ml` as `serverUserMove` → [src/mq3/server/user_move.ml](File-src-mq3-server-user-move-ml-1219627038.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `mq3/vm/interpreter.ml` as `vm` → [src/mq3/vm/interpreter.ml](File-src-mq3-vm-interpreter-ml-500037689.md)
- `mq3/vm/runtime.ml` as `vmRuntime` → [src/mq3/vm/runtime.ml](File-src-mq3-vm-runtime-ml-288435087.md)
- `mq3/vm/syscall_cgame.ml` as `vmSyscallCgame` → [src/mq3/vm/syscall_cgame.ml](File-src-mq3-vm-syscall-cgame-ml-1987612568.md)
- `mq3/vm/syscall_common.ml` as `vmSyscallCommon` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)
- `mq3/vm/syscall_qagame.ml` as `vmSyscallQagame` → [src/mq3/vm/syscall_qagame.ml](File-src-mq3-vm-syscall-qagame-ml-1544842921.md)
- `mq3/vm/syscall_qagame_world.ml` as `vmSyscallQagameWorld` → [src/mq3/vm/syscall_qagame_world.ml](File-src-mq3-vm-syscall-qagame-world-ml-663586900.md)
- `mq3/vm/syscall_ui.ml` as `vmSyscallUi` → [src/mq3/vm/syscall_ui.ml](File-src-mq3-vm-syscall-ui-ml-839264043.md)
- `mq3/vm/syscall_ui_media.ml` as `vmSyscallUiMedia` → [src/mq3/vm/syscall_ui_media.ml](File-src-mq3-vm-syscall-ui-media-ml-1111712958.md)
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency

## Declarations

<a id="function-function-formatvector-function-formatvector-vector-src-main-ml-1032235110"></a>
### formatVector

```ml
function formatVector(vector)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vector` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/main.ml#L106)

<a id="function-function-main-function-main-args-src-main-ml-776500952"></a>
### main

```ml
function main(args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/main.ml#L119)

<a id="function-function-printtrace-function-printtrace-result-src-main-ml-1040741020"></a>
### printTrace

```ml
function printTrace(result)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/main.ml#L110)
