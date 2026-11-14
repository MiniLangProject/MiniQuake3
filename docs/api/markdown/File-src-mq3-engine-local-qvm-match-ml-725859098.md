# `src/mq3/engine/local_qvm_match.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.engine.local_qvm_match`](Package-mq3-engine-local-qvm-match-1381184910.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_bspq3.ml` as `aasBspq3` → [src/mq3/botlib/aas_bspq3.ml](File-src-mq3-botlib-aas-bspq3-ml-738898527.md)
- `mq3/botlib/aas_client_movement.ml` as `aasClientMovement` → [src/mq3/botlib/aas_client_movement.ml](File-src-mq3-botlib-aas-client-movement-ml-551897611.md)
- `mq3/botlib/aas_client_movement_syscalls.ml` as `aasClientMovementSyscalls` → [src/mq3/botlib/aas_client_movement_syscalls.ml](File-src-mq3-botlib-aas-client-movement-syscalls-ml-1905598502.md)
- `mq3/botlib/aas_client_trace.ml` as `aasClientTrace` → [src/mq3/botlib/aas_client_trace.ml](File-src-mq3-botlib-aas-client-trace-ml-566175929.md)
- `mq3/botlib/aas_entities.ml` as `aasEntities` → [src/mq3/botlib/aas_entities.ml](File-src-mq3-botlib-aas-entities-ml-525847367.md)
- `mq3/botlib/aas_movement_queries.ml` as `aasMovementQueries` → [src/mq3/botlib/aas_movement_queries.ml](File-src-mq3-botlib-aas-movement-queries-ml-185789608.md)
- `mq3/botlib/aas_query_syscalls.ml` as `aasQuerySyscalls` → [src/mq3/botlib/aas_query_syscalls.ml](File-src-mq3-botlib-aas-query-syscalls-ml-688828371.md)
- `mq3/botlib/aas_route_extra_syscalls.ml` as `aasRouteExtraSyscalls` → [src/mq3/botlib/aas_route_extra_syscalls.ml](File-src-mq3-botlib-aas-route-extra-syscalls-ml-225802859.md)
- `mq3/botlib/aas_route_extras.ml` as `aasRouteExtras` → [src/mq3/botlib/aas_route_extras.ml](File-src-mq3-botlib-aas-route-extras-ml-1580573357.md)
- `mq3/botlib/aas_routing.ml` as `aasRouting` → [src/mq3/botlib/aas_routing.ml](File-src-mq3-botlib-aas-routing-ml-230871418.md)
- `mq3/botlib/aas_routing_cache.ml` as `aasRoutingCache` → [src/mq3/botlib/aas_routing_cache.ml](File-src-mq3-botlib-aas-routing-cache-ml-1923771141.md)
- `mq3/botlib/aas_runtime.ml` as `aasRuntime` → [src/mq3/botlib/aas_runtime.ml](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)
- `mq3/botlib/aas_syscalls.ml` as `aasSyscalls` → [src/mq3/botlib/aas_syscalls.ml](File-src-mq3-botlib-aas-syscalls-ml-1250251888.md)
- `mq3/botlib/aas_trace_areas.ml` as `aasTraceAreas` → [src/mq3/botlib/aas_trace_areas.ml](File-src-mq3-botlib-aas-trace-areas-ml-2060721500.md)
- `mq3/botlib/ai_avoid_spot_syscalls.ml` as `aiAvoidSpotSyscalls` → [src/mq3/botlib/ai_avoid_spot_syscalls.ml](File-src-mq3-botlib-ai-avoid-spot-syscalls-ml-1373977702.md)
- `mq3/botlib/ai_avoid_spots.ml` as `aiAvoidSpots` → [src/mq3/botlib/ai_avoid_spots.ml](File-src-mq3-botlib-ai-avoid-spots-ml-627085596.md)
- `mq3/botlib/ai_character_syscalls.ml` as `aiCharacterSyscalls` → [src/mq3/botlib/ai_character_syscalls.ml](File-src-mq3-botlib-ai-character-syscalls-ml-774112887.md)
- `mq3/botlib/ai_characters.ml` as `aiCharacters` → [src/mq3/botlib/ai_characters.ml](File-src-mq3-botlib-ai-characters-ml-311974577.md)
- `mq3/botlib/ai_chat_goal_tail.ml` as `aiChatGoalTail` → [src/mq3/botlib/ai_chat_goal_tail.ml](File-src-mq3-botlib-ai-chat-goal-tail-ml-1426920332.md)
- `mq3/botlib/ai_chat_goal_tail_syscalls.ml` as `aiChatGoalTailSyscalls` → [src/mq3/botlib/ai_chat_goal_tail_syscalls.ml](File-src-mq3-botlib-ai-chat-goal-tail-syscalls-ml-1115095799.md)
- `mq3/botlib/ai_chat_match_syscalls.ml` as `aiChatMatchSyscalls` → [src/mq3/botlib/ai_chat_match_syscalls.ml](File-src-mq3-botlib-ai-chat-match-syscalls-ml-384655140.md)
- `mq3/botlib/ai_chat_matches.ml` as `aiChatMatches` → [src/mq3/botlib/ai_chat_matches.ml](File-src-mq3-botlib-ai-chat-matches-ml-369456329.md)
- `mq3/botlib/ai_chat_output.ml` as `aiChatOutput` → [src/mq3/botlib/ai_chat_output.ml](File-src-mq3-botlib-ai-chat-output-ml-737978343.md)
- `mq3/botlib/ai_chat_output_syscalls.ml` as `aiChatOutputSyscalls` → [src/mq3/botlib/ai_chat_output_syscalls.ml](File-src-mq3-botlib-ai-chat-output-syscalls-ml-413294098.md)
- `mq3/botlib/ai_chat_profiles.ml` as `aiChatProfiles` → [src/mq3/botlib/ai_chat_profiles.ml](File-src-mq3-botlib-ai-chat-profiles-ml-1781106722.md)
- `mq3/botlib/ai_chat_string_syscalls.ml` as `aiChatStringSyscalls` → [src/mq3/botlib/ai_chat_string_syscalls.ml](File-src-mq3-botlib-ai-chat-string-syscalls-ml-973731990.md)
- `mq3/botlib/ai_chat_strings.ml` as `aiChatStrings` → [src/mq3/botlib/ai_chat_strings.ml](File-src-mq3-botlib-ai-chat-strings-ml-176982668.md)
- `mq3/botlib/ai_chat_syscalls.ml` as `aiChatSyscalls` → [src/mq3/botlib/ai_chat_syscalls.ml](File-src-mq3-botlib-ai-chat-syscalls-ml-1875910582.md)
- `mq3/botlib/ai_console_messages.ml` as `aiConsoleMessages` → [src/mq3/botlib/ai_console_messages.ml](File-src-mq3-botlib-ai-console-messages-ml-2082793327.md)
- `mq3/botlib/ai_goal_selection.ml` as `aiGoalSelection` → [src/mq3/botlib/ai_goal_selection.ml](File-src-mq3-botlib-ai-goal-selection-ml-603097719.md)
- `mq3/botlib/ai_goal_selection_syscalls.ml` as `aiGoalSelectionSyscalls` → [src/mq3/botlib/ai_goal_selection_syscalls.ml](File-src-mq3-botlib-ai-goal-selection-syscalls-ml-308758818.md)
- `mq3/botlib/ai_goal_state.ml` as `aiGoalState` → [src/mq3/botlib/ai_goal_state.ml](File-src-mq3-botlib-ai-goal-state-ml-857672002.md)
- `mq3/botlib/ai_goal_state_syscalls.ml` as `aiGoalStateSyscalls` → [src/mq3/botlib/ai_goal_state_syscalls.ml](File-src-mq3-botlib-ai-goal-state-syscalls-ml-641639453.md)
- `mq3/botlib/ai_item_weight_syscalls.ml` as `aiItemWeightSyscalls` → [src/mq3/botlib/ai_item_weight_syscalls.ml](File-src-mq3-botlib-ai-item-weight-syscalls-ml-2115613188.md)
- `mq3/botlib/ai_item_weights.ml` as `aiItemWeights` → [src/mq3/botlib/ai_item_weights.ml](File-src-mq3-botlib-ai-item-weights-ml-1163821802.md)
- `mq3/botlib/ai_level_items.ml` as `aiLevelItems` → [src/mq3/botlib/ai_level_items.ml](File-src-mq3-botlib-ai-level-items-ml-1268981414.md)
- `mq3/botlib/ai_map_goal_syscalls.ml` as `aiMapGoalSyscalls` → [src/mq3/botlib/ai_map_goal_syscalls.ml](File-src-mq3-botlib-ai-map-goal-syscalls-ml-1924372604.md)
- `mq3/botlib/ai_map_goals.ml` as `aiMapGoals` → [src/mq3/botlib/ai_map_goals.ml](File-src-mq3-botlib-ai-map-goals-ml-805849506.md)
- `mq3/botlib/ai_move_runtime.ml` as `aiMoveRuntime` → [src/mq3/botlib/ai_move_runtime.ml](File-src-mq3-botlib-ai-move-runtime-ml-1991141291.md)
- `mq3/botlib/ai_move_syscalls.ml` as `aiMoveSyscalls` → [src/mq3/botlib/ai_move_syscalls.ml](File-src-mq3-botlib-ai-move-syscalls-ml-1461001545.md)
- `mq3/botlib/ai_predict_visible_position.ml` as `aiPredictVisible` → [src/mq3/botlib/ai_predict_visible_position.ml](File-src-mq3-botlib-ai-predict-visible-position-ml-125650055.md)
- `mq3/botlib/ai_predict_visible_position_syscalls.ml` as `aiPredictVisibleSyscalls` → [src/mq3/botlib/ai_predict_visible_position_syscalls.ml](File-src-mq3-botlib-ai-predict-visible-position-syscalls-ml-707658354.md)
- `mq3/botlib/ai_resource_pools.ml` as `aiResourcePools` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/botlib/ai_resource_syscalls.ml` as `aiResourceSyscalls` → [src/mq3/botlib/ai_resource_syscalls.ml](File-src-mq3-botlib-ai-resource-syscalls-ml-1964322476.md)
- `mq3/botlib/ai_weapon_combat.ml` as `aiWeaponCombat` → [src/mq3/botlib/ai_weapon_combat.ml](File-src-mq3-botlib-ai-weapon-combat-ml-661609126.md)
- `mq3/botlib/ai_weapon_combat_syscalls.ml` as `aiWeaponCombatSyscalls` → [src/mq3/botlib/ai_weapon_combat_syscalls.ml](File-src-mq3-botlib-ai-weapon-combat-syscalls-ml-746037601.md)
- `mq3/botlib/ai_weapon_weight_syscalls.ml` as `aiWeaponWeightSyscalls` → [src/mq3/botlib/ai_weapon_weight_syscalls.ml](File-src-mq3-botlib-ai-weapon-weight-syscalls-ml-1967154333.md)
- `mq3/botlib/ai_weapon_weights.ml` as `aiWeaponWeights` → [src/mq3/botlib/ai_weapon_weights.ml](File-src-mq3-botlib-ai-weapon-weights-ml-776993711.md)
- `mq3/botlib/be_aas_file.ml` as `aasFile` → [src/mq3/botlib/be_aas_file.ml](File-src-mq3-botlib-be-aas-file-ml-8892360.md)
- `mq3/botlib/be_interface.ml` as `botInterface` → [src/mq3/botlib/be_interface.ml](File-src-mq3-botlib-be-interface-ml-674658449.md)
- `mq3/botlib/elementary_action_syscalls.ml` as `elementaryActionSyscalls` → [src/mq3/botlib/elementary_action_syscalls.ml](File-src-mq3-botlib-elementary-action-syscalls-ml-1930342062.md)
- `mq3/botlib/elementary_actions.ml` as `elementaryActions` → [src/mq3/botlib/elementary_actions.ml](File-src-mq3-botlib-elementary-actions-ml-737481412.md)
- `mq3/botlib/lifecycle_runtime.ml` as `botlibRuntime` → [src/mq3/botlib/lifecycle_runtime.ml](File-src-mq3-botlib-lifecycle-runtime-ml-1352513457.md)
- `mq3/botlib/server_bridge.ml` as `botServerBridge` → [src/mq3/botlib/server_bridge.ml](File-src-mq3-botlib-server-bridge-ml-1158932283.md)
- `mq3/botlib/server_imports.ml` as `botServerImports` → [src/mq3/botlib/server_imports.ml](File-src-mq3-botlib-server-imports-ml-1126004744.md)
- `mq3/client/cgame_console_commands.ml` as `nativeCgameCommands` → [src/mq3/client/cgame_console_commands.ml](File-src-mq3-client-cgame-console-commands-ml-1236537113.md)
- `mq3/client/cgame_draw.ml` as `nativeCgameDraw` → [src/mq3/client/cgame_draw.ml](File-src-mq3-client-cgame-draw-ml-658265827.md)
- `mq3/client/cgame_drawtools.ml` as `nativeCgameDrawtools` → [src/mq3/client/cgame_drawtools.ml](File-src-mq3-client-cgame-drawtools-ml-249217190.md)
- `mq3/client/cgame_effects.ml` as `nativeCgameEffects` → [src/mq3/client/cgame_effects.ml](File-src-mq3-client-cgame-effects-ml-498960699.md)
- `mq3/client/cgame_ents.ml` as `nativeCgameEnts` → [src/mq3/client/cgame_ents.ml](File-src-mq3-client-cgame-ents-ml-1890303843.md)
- `mq3/client/cgame_event.ml` as `nativeCgameEvent` → [src/mq3/client/cgame_event.ml](File-src-mq3-client-cgame-event-ml-1436945917.md)
- `mq3/client/cgame_localents.ml` as `nativeCgameLocalents` → [src/mq3/client/cgame_localents.ml](File-src-mq3-client-cgame-localents-ml-2123896286.md)
- `mq3/client/cgame_main.ml` as `nativeCgameMain` → [src/mq3/client/cgame_main.ml](File-src-mq3-client-cgame-main-ml-1652783738.md)
- `mq3/client/cgame_marks.ml` as `nativeCgameMarks` → [src/mq3/client/cgame_marks.ml](File-src-mq3-client-cgame-marks-ml-1111050399.md)
- `mq3/client/cgame_particles.ml` as `nativeCgameParticles` → [src/mq3/client/cgame_particles.ml](File-src-mq3-client-cgame-particles-ml-1614063868.md)
- `mq3/client/cgame_players.ml` as `nativeCgamePlayers` → [src/mq3/client/cgame_players.ml](File-src-mq3-client-cgame-players-ml-1793263463.md)
- `mq3/client/cgame_playerstate.ml` as `nativeCgamePlayerstate` → [src/mq3/client/cgame_playerstate.ml](File-src-mq3-client-cgame-playerstate-ml-1837037411.md)
- `mq3/client/cgame_predict.ml` as `nativeCgamePredict` → [src/mq3/client/cgame_predict.ml](File-src-mq3-client-cgame-predict-ml-1773632218.md)
- `mq3/client/cgame_servercmds.ml` as `nativeCgameServercmds` → [src/mq3/client/cgame_servercmds.ml](File-src-mq3-client-cgame-servercmds-ml-56240583.md)
- `mq3/client/cgame_snapshot.ml` as `nativeCgameSnapshot` → [src/mq3/client/cgame_snapshot.ml](File-src-mq3-client-cgame-snapshot-ml-1128039285.md)
- `mq3/client/cgame_usercmd.ml` as `cgameUsercmd` → [src/mq3/client/cgame_usercmd.ml](File-src-mq3-client-cgame-usercmd-ml-871099490.md)
- `mq3/client/cgame_view.ml` as `nativeCgameView` → [src/mq3/client/cgame_view.ml](File-src-mq3-client-cgame-view-ml-1544499938.md)
- `mq3/client/cgame_vm.ml` as `cgameVm` → [src/mq3/client/cgame_vm.ml](File-src-mq3-client-cgame-vm-ml-1871886258.md)
- `mq3/client/cgame_weapons.ml` as `nativeCgameWeapons` → [src/mq3/client/cgame_weapons.ml](File-src-mq3-client-cgame-weapons-ml-1641558282.md)
- `mq3/client/cinematic_runtime.ml` as `cinematics` → [src/mq3/client/cinematic_runtime.ml](File-src-mq3-client-cinematic-runtime-ml-1539162371.md)
- `mq3/client/cl_console.ml` as `clientConsole` → [src/mq3/client/cl_console.ml](File-src-mq3-client-cl-console-ml-1724798958.md)
- `mq3/client/command_ring.ml` as `matchCommandRing` → [src/mq3/client/command_ring.ml](File-src-mq3-client-command-ring-ml-1850754325.md)
- `mq3/client/console_input.ml` as `consoleInput` → [src/mq3/client/console_input.ml](File-src-mq3-client-console-input-ml-896040399.md)
- `mq3/client/key_bindings_config.ml` as `bindingConfig` → [src/mq3/client/key_bindings_config.ml](File-src-mq3-client-key-bindings-config-ml-2105830282.md)
- `mq3/client/server_command_stream.ml` as `serverCommandStream` → [src/mq3/client/server_command_stream.ml](File-src-mq3-client-server-command-stream-ml-1493457615.md)
- `mq3/client/ui_host_lifecycle.ml` as `uiHost` → [src/mq3/client/ui_host_lifecycle.ml](File-src-mq3-client-ui-host-lifecycle-ml-451482783.md)
- `mq3/client/ui_lan_browser.ml` as `uiLan` → [src/mq3/client/ui_lan_browser.ml](File-src-mq3-client-ui-lan-browser-ml-1771171938.md)
- `mq3/client/ui_lan_cache.ml` as `uiLanCache` → [src/mq3/client/ui_lan_cache.ml](File-src-mq3-client-ui-lan-cache-ml-483900424.md)
- `mq3/client/ui_lan_ingress.ml` as `uiLanIngress` → [src/mq3/client/ui_lan_ingress.ml](File-src-mq3-client-ui-lan-ingress-ml-732601155.md)
- `mq3/client/ui_lan_queries.ml` as `uiLanQueries` → [src/mq3/client/ui_lan_queries.ml](File-src-mq3-client-ui-lan-queries-ml-738625990.md)
- `mq3/client/ui_lan_udp.ml` as `uiLanUdp` → [src/mq3/client/ui_lan_udp.ml](File-src-mq3-client-ui-lan-udp-ml-1196583039.md)
- `mq3/client/ui_vm.ml` as `uiVm` → [src/mq3/client/ui_vm.ml](File-src-mq3-client-ui-vm-ml-1076773103.md)
- `mq3/collision/visibility.ml` as `visibility` → [src/mq3/collision/visibility.ml](File-src-mq3-collision-visibility-ml-1423508826.md)
- `mq3/collision/world.ml` as `collision` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/aas.ml` as `aasFormat` → [src/mq3/format/aas.ml](File-src-mq3-format-aas-ml-835678928.md)
- `mq3/format/bsp.ml` as `bsp` → [src/mq3/format/bsp.ml](File-src-mq3-format-bsp-ml-526613882.md)
- `mq3/format/md3.ml` as `md3` → [src/mq3/format/md3.ml](File-src-mq3-format-md3-ml-2098563759.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/game/constants.ml` as `gameConstants` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/game/movement.ml` as `nativeMovement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/playerstate.ml` as `playerstate` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)
- `mq3/game/trajectory.ml` as `gameTrajectory` → [src/mq3/game/trajectory.ml](File-src-mq3-game-trajectory-ml-1278285327.md)
- `mq3/qcommon/command_buffer.ml` as `commands` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/cvar.ml` as `cvar` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `mq3/qcommon/cvar_commands.ml` as `cvarCommands` → [src/mq3/qcommon/cvar_commands.ml](File-src-mq3-qcommon-cvar-commands-ml-1227862997.md)
- `mq3/qcommon/memory_file_seek.ml` as `memoryFileSeek` → [src/mq3/qcommon/memory_file_seek.ml](File-src-mq3-qcommon-memory-file-seek-ml-2115810861.md)
- `mq3/renderer/command_queue.ml` as `renderQueue` → [src/mq3/renderer/command_queue.ml](File-src-mq3-renderer-command-queue-ml-1425855282.md)
- `mq3/renderer/mark_fragments.ml` as `markFragments` → [src/mq3/renderer/mark_fragments.ml](File-src-mq3-renderer-mark-fragments-ml-1532505804.md)
- `mq3/renderer/model_bounds.ml` as `modelBounds` → [src/mq3/renderer/model_bounds.ml](File-src-mq3-renderer-model-bounds-ml-2002062224.md)
- `mq3/renderer/model_tags.ml` as `modelTags` → [src/mq3/renderer/model_tags.ml](File-src-mq3-renderer-model-tags-ml-707870696.md)
- `mq3/renderer/playable_light_grid.ml` as `lightGrid` → [src/mq3/renderer/playable_light_grid.ml](File-src-mq3-renderer-playable-light-grid-ml-1846122219.md)
- `mq3/renderer/pvs_query.ml` as `rendererPvs` → [src/mq3/renderer/pvs_query.ml](File-src-mq3-renderer-pvs-query-ml-1964657525.md)
- `mq3/renderer/qvm_scene_geometry.ml` as `qvmSceneGeometry` → [src/mq3/renderer/qvm_scene_geometry.ml](File-src-mq3-renderer-qvm-scene-geometry-ml-51177627.md)
- `mq3/renderer/scene_queue.ml` as `sceneQueue` → [src/mq3/renderer/scene_queue.ml](File-src-mq3-renderer-scene-queue-ml-703423413.md)
- `mq3/renderer/shader_remap.ml` as `shaderRemap` → [src/mq3/renderer/shader_remap.ml](File-src-mq3-renderer-shader-remap-ml-1685814656.md)
- `mq3/server/abi.ml` as `serverAbi` → [src/mq3/server/abi.ml](File-src-mq3-server-abi-ml-141226179.md)
- `mq3/server/game_vm.ml` as `gameVm` → [src/mq3/server/game_vm.ml](File-src-mq3-server-game-vm-ml-2099996303.md)
- `mq3/server/init_runtime.ml` as `serverInit` → [src/mq3/server/init_runtime.ml](File-src-mq3-server-init-runtime-ml-863108862.md)
- `mq3/server/snapshot_build.ml` as `snapshotBuild` → [src/mq3/server/snapshot_build.ml](File-src-mq3-server-snapshot-build-ml-2050633468.md)
- `mq3/server/world.ml` as `serverWorld` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)
- `mq3/vm/cgame_key_traps.ml` as `cgameKeys` → [src/mq3/vm/cgame_key_traps.ml](File-src-mq3-vm-cgame-key-traps-ml-2020826655.md)
- `mq3/vm/cgame_misc_traps.ml` as `cgameMisc` → [src/mq3/vm/cgame_misc_traps.ml](File-src-mq3-vm-cgame-misc-traps-ml-419606242.md)
- `mq3/vm/cgame_pc_traps.ml` as `cgamePc` → [src/mq3/vm/cgame_pc_traps.ml](File-src-mq3-vm-cgame-pc-traps-ml-1555701781.md)
- `mq3/vm/font_abi.ml` as `fontAbi` → [src/mq3/vm/font_abi.ml](File-src-mq3-vm-font-abi-ml-1952985199.md)
- `mq3/vm/pc_parser.ml` as `pcParser` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)
- `mq3/vm/runtime.ml` as `runtime` → [src/mq3/vm/runtime.ml](File-src-mq3-vm-runtime-ml-288435087.md)
- `mq3/vm/syscall_cgame.ml` as `cgameSyscall` → [src/mq3/vm/syscall_cgame.ml](File-src-mq3-vm-syscall-cgame-ml-1987612568.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)
- `mq3/vm/syscall_qagame.ml` as `qagame` → [src/mq3/vm/syscall_qagame.ml](File-src-mq3-vm-syscall-qagame-ml-1544842921.md)
- `mq3/vm/syscall_qagame_world.ml` as `qworld` → [src/mq3/vm/syscall_qagame_world.ml](File-src-mq3-vm-syscall-qagame-world-ml-663586900.md)
- `mq3/vm/syscall_ui.ml` as `uiSyscall` → [src/mq3/vm/syscall_ui.ml](File-src-mq3-vm-syscall-ui-ml-839264043.md)
- `mq3/vm/syscall_ui_media.ml` as `uiMedia` → [src/mq3/vm/syscall_ui_media.ml](File-src-mq3-vm-syscall-ui-media-ml-1111712958.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-engine-local-qvm-match-aasmovementareacontents-function-aasmovementareacontents-context-area-src-mq3-engine-local-qvm-match-ml-2029845238"></a>
### aasMovementAreaContents

```ml
function aasMovementAreaContents(context, area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L440)

<a id="function-function-mq3-engine-local-qvm-match-aasmovementpointarea-function-aasmovementpointarea-context-point-src-mq3-engine-local-qvm-match-ml-774880463"></a>
### aasMovementPointArea

```ml
function aasMovementPointArea(context, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L438)

<a id="function-function-mq3-engine-local-qvm-match-aasmovementpointpresence-function-aasmovementpointpresence-context-point-src-mq3-engine-local-qvm-match-ml-440481975"></a>
### aasMovementPointPresence

```ml
function aasMovementPointPresence(context, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L439)

<a id="function-function-mq3-engine-local-qvm-match-aasmovementtrace-function-aasmovementtrace-context-start-finish-presence-passentity-src-mq3-engine-local-qvm-match-ml-1974726373"></a>
### aasMovementTrace

```ml
function aasMovementTrace(context, start, finish, presence, passEntity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `presence` | `dynamic` | — |  |
| `passEntity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L426)

<a id="function-function-mq3-engine-local-qvm-match-aasmovementtraceareas-function-aasmovementtraceareas-context-start-finish-maximum-src-mq3-engine-local-qvm-match-ml-443296884"></a>
### aasMovementTraceAreas

```ml
function aasMovementTraceAreas(context, start, finish, maximum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L443)

<a id="function-function-mq3-engine-local-qvm-match-aaspointcontents-function-aaspointcontents-context-point-src-mq3-engine-local-qvm-match-ml-1187176623"></a>
### aasPointContents

```ml
function aasPointContents(context, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L425)

<a id="function-function-mq3-engine-local-qvm-match-addcgamepolys-function-addcgamepolys-context-vm-base-multiple-src-mq3-engine-local-qvm-match-ml-1801010937"></a>
### addCgamePolys

```ml
function addCgamePolys(context, vm, base, multiple)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `multiple` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1213)

<a id="function-function-mq3-engine-local-qvm-match-addcommand-function-addcommand-context-name-src-mq3-engine-local-qvm-match-ml-637601798"></a>
### addCommand

```ml
function addCommand(context, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1141)

<a id="function-function-mq3-engine-local-qvm-match-adjustportal-function-adjustportal-context-entity-isopen-src-mq3-engine-local-qvm-match-ml-826965394"></a>
### adjustPortal

```ml
function adjustPortal(context, entity, isOpen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `isOpen` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L337)

<a id="function-function-mq3-engine-local-qvm-match-allocatebot-function-allocatebot-context-src-mq3-engine-local-qvm-match-ml-382069247"></a>
### allocateBot

```ml
function allocateBot(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L352)

<a id="function-function-mq3-engine-local-qvm-match-applysavedclientstate-function-applysavedclientstate-context-settings-src-mq3-engine-local-qvm-match-ml-202179382"></a>
### applySavedClientState

```ml
function applySavedClientState(context, settings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L725)

<a id="function-function-mq3-engine-local-qvm-match-applysavedcvars-function-applysavedcvars-registry-settings-src-mq3-engine-local-qvm-match-ml-1350225616"></a>
### applySavedCvars

```ml
function applySavedCvars(registry, settings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L711)

<a id="function-function-mq3-engine-local-qvm-match-areasconnected-function-areasconnected-context-a-b-src-mq3-engine-local-qvm-match-ml-752668534"></a>
### areasConnected

```ml
function areasConnected(context, a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L343)

<a id="function-function-mq3-engine-local-qvm-match-beginclientmessage-function-beginclientmessage-value-team-playernum-src-mq3-engine-local-qvm-match-ml-1363789491"></a>
### beginClientMessage

```ml
function beginClientMessage(value, team, playerNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `playerNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1466)

<a id="function-function-mq3-engine-local-qvm-match-bestreachablejumppadarea-function-bestreachablejumppadarea-context-itemorigin-itemmins-itemmaxs-src-mq3-engine-local-qvm-match-ml-635631610"></a>
### bestReachableJumpPadArea

```ml
function bestReachableJumpPadArea(context, itemOrigin, itemMins, itemMaxs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `itemOrigin` | `dynamic` | — |  |
| `itemMins` | `dynamic` | — |  |
| `itemMaxs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L461)

<a id="function-function-mq3-engine-local-qvm-match-bindingconfigtext-function-bindingconfigtext-value-src-mq3-engine-local-qvm-match-ml-784112661"></a>
### bindingConfigText

```ml
function bindingConfigText(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1440)

<a id="function-function-mq3-engine-local-qvm-match-boot-function-boot-archive-map-now-src-mq3-engine-local-qvm-match-ml-323668418"></a>
### boot

```ml
function boot(archive, map, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L822)

- [mq3.engine.local_qvm_match.Boot](Type-mq3-engine-local-qvm-match-boot-1321265160.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-bootcgame-function-bootcgame-value-src-mq3-engine-local-qvm-match-ml-337881419"></a>
### bootCgame

```ml
function bootCgame(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1379)

<a id="function-function-mq3-engine-local-qvm-match-bootconfigured-function-bootconfigured-archive-map-now-qvmroot-botsenabled-src-mq3-engine-local-qvm-match-ml-584350289"></a>
### bootConfigured

```ml
function bootConfigured(archive, map, now, qvmRoot, botsEnabled)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `botsEnabled` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L814)

<a id="function-function-mq3-engine-local-qvm-match-bootconfigurednamed-function-bootconfigurednamed-archive-map-now-qvmroot-botsenabled-mapname-src-mq3-engine-local-qvm-match-ml-1136606466"></a>
### bootConfiguredNamed

```ml
function bootConfiguredNamed(archive, map, now, qvmRoot, botsEnabled, mapName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `botsEnabled` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L813)

<a id="function-function-mq3-engine-local-qvm-match-bootconfigurednamedmode-function-bootconfigurednamedmode-archive-map-now-qvmroot-botsenabled-mapname-startgame-src-mq3-engine-local-qvm-match-ml-2121695874"></a>
### bootConfiguredNamedMode

```ml
function bootConfiguredNamedMode(archive, map, now, qvmRoot, botsEnabled, mapName, startGame)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `botsEnabled` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `startGame` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L812)

<a id="function-function-mq3-engine-local-qvm-match-bootconfigurednamedmodesettings-function-bootconfigurednamedmodesettings-archive-map-now-qvmroot-botsenabled-mapname-startgame-settings-src-mq3-engine-local-qvm-match-ml-2025761987"></a>
### bootConfiguredNamedModeSettings

```ml
function bootConfiguredNamedModeSettings(archive, map, now, qvmRoot, botsEnabled, mapName, startGame, settings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `botsEnabled` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `startGame` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L739)

<a id="function-function-mq3-engine-local-qvm-match-bootui-function-bootui-value-src-mq3-engine-local-qvm-match-ml-1504093417"></a>
### bootUi

```ml
function bootUi(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1557)

<a id="function-function-mq3-engine-local-qvm-match-bootuishell-function-bootuishell-archive-map-now-qvmroot-src-mq3-engine-local-qvm-match-ml-652689664"></a>
### bootUiShell

```ml
function bootUiShell(archive, map, now, qvmRoot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L819)

<a id="function-function-mq3-engine-local-qvm-match-bootwithbots-function-bootwithbots-archive-map-now-qvmroot-src-mq3-engine-local-qvm-match-ml-2143698944"></a>
### bootWithBots

```ml
function bootWithBots(archive, map, now, qvmRoot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L820)

<a id="function-function-mq3-engine-local-qvm-match-bootwithbotsnamed-function-bootwithbotsnamed-archive-map-mapname-now-qvmroot-src-mq3-engine-local-qvm-match-ml-243510117"></a>
### bootWithBotsNamed

```ml
function bootWithBotsNamed(archive, map, mapName, now, qvmRoot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L821)

<a id="function-function-mq3-engine-local-qvm-match-bootwithqvms-function-bootwithqvms-archive-map-now-qvmroot-src-mq3-engine-local-qvm-match-ml-1141174360"></a>
### bootWithQvms

```ml
function bootWithQvms(archive, map, now, qvmRoot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L816)

<a id="function-function-mq3-engine-local-qvm-match-bootwithqvmssettings-function-bootwithqvmssettings-archive-map-now-qvmroot-settings-src-mq3-engine-local-qvm-match-ml-1952430347"></a>
### bootWithQvmsSettings

```ml
function bootWithQvmsSettings(archive, map, now, qvmRoot, settings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L818)

<a id="function-function-mq3-engine-local-qvm-match-bootwithqvmssettingsnamed-function-bootwithqvmssettingsnamed-archive-map-mapname-now-qvmroot-settings-src-mq3-engine-local-qvm-match-ml-68362326"></a>
### bootWithQvmsSettingsNamed

```ml
function bootWithQvmsSettingsNamed(archive, map, mapName, now, qvmRoot, settings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `qvmRoot` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L817)

<a id="function-function-mq3-engine-local-qvm-match-botcharacterread-function-botcharacterread-context-path-src-mq3-engine-local-qvm-match-ml-1327606166"></a>
### botCharacterRead

```ml
function botCharacterRead(context, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L369)

<a id="function-function-mq3-engine-local-qvm-match-botclientcommand-function-botclientcommand-context-client-text-src-mq3-engine-local-qvm-match-ml-1379008527"></a>
### botClientCommand

```ml
function botClientCommand(context, client, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L368)

<a id="function-function-mq3-engine-local-qvm-match-botenable-function-botenable-context-src-mq3-engine-local-qvm-match-ml-132581767"></a>
### botEnable

```ml
function botEnable(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L376)

<a id="function-function-mq3-engine-local-qvm-match-botlibfloat-function-botlibfloat-context-name-fallback-src-mq3-engine-local-qvm-match-ml-1238094220"></a>
### botlibFloat

```ml
function botlibFloat(context, name, fallback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `fallback` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L444)

<a id="function-function-mq3-engine-local-qvm-match-botlibloadmap-function-botlibloadmap-context-vm-base-src-mq3-engine-local-qvm-match-ml-603341739"></a>
### botlibLoadMap

```ml
function botlibLoadMap(context, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L396)

<a id="function-function-mq3-engine-local-qvm-match-botlibtext-function-botlibtext-context-name-fallback-src-mq3-engine-local-qvm-match-ml-34714036"></a>
### botlibText

```ml
function botlibText(context, name, fallback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `fallback` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L615)

<a id="function-function-mq3-engine-local-qvm-match-botlibvarget-function-botlibvarget-context-vm-base-src-mq3-engine-local-qvm-match-ml-13759683"></a>
### botlibVarGet

```ml
function botlibVarGet(context, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L382)

<a id="function-function-mq3-engine-local-qvm-match-botlibvarset-function-botlibvarset-context-vm-base-src-mq3-engine-local-qvm-match-ml-76222187"></a>
### botlibVarSet

```ml
function botlibVarSet(context, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L377)

<a id="function-function-mq3-engine-local-qvm-match-callvm-function-callvm-machineruntime-slot-args-src-mq3-engine-local-qvm-match-ml-801183644"></a>
### callVm

```ml
function callVm(machineRuntime, slot, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machineRuntime` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L182)

<a id="function-function-mq3-engine-local-qvm-match-capturerenderview-function-capturerenderview-context-vm-address-src-mq3-engine-local-qvm-match-ml-660870890"></a>
### captureRenderView

```ml
function captureRenderView(context, vm, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1249)

<a id="function-function-mq3-engine-local-qvm-match-captureusersettings-function-captureusersettings-value-src-mq3-engine-local-qvm-match-ml-1701576985"></a>
### captureUserSettings

```ml
function captureUserSettings(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L697)

<a id="function-function-mq3-engine-local-qvm-match-cgameboxtrace-function-cgameboxtrace-context-vm-base-capsule-transformed-src-mq3-engine-local-qvm-match-ml-2066624661"></a>
### cgameBoxTrace

```ml
function cgameBoxTrace(context, vm, base, capsule, transformed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |
| `transformed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1195)

<a id="function-function-mq3-engine-local-qvm-match-cgamemarkfragments-function-cgamemarkfragments-context-vm-base-src-mq3-engine-local-qvm-match-ml-110443655"></a>
### cgameMarkFragments

```ml
function cgameMarkFragments(context, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1252)

<a id="function-function-mq3-engine-local-qvm-match-cgamenullablevector-function-cgamenullablevector-vm-base-index-label-src-mq3-engine-local-qvm-match-ml-41087550"></a>
### cgameNullableVector

```ml
function cgameNullableVector(vm, base, index, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1187)

<a id="function-function-mq3-engine-local-qvm-match-cgamesensitivity-function-cgamesensitivity-value-src-mq3-engine-local-qvm-match-ml-1466267409"></a>
### cgameSensitivity

```ml
function cgameSensitivity(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1183)

<a id="function-function-mq3-engine-local-qvm-match-cgameservercommand-function-cgameservercommand-context-number-src-mq3-engine-local-qvm-match-ml-228804768"></a>
### cgameServerCommand

```ml
function cgameServerCommand(context, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1162)

<a id="function-function-mq3-engine-local-qvm-match-cgametraceresult-function-cgametraceresult-result-src-mq3-engine-local-qvm-match-ml-1442706097"></a>
### cgameTraceResult

```ml
function cgameTraceResult(result)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1191)

<a id="function-function-mq3-engine-local-qvm-match-cgameusercmdvalue-function-cgameusercmdvalue-value-src-mq3-engine-local-qvm-match-ml-1508790027"></a>
### cgameUserCmdValue

```ml
function cgameUserCmdValue(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1182)

<a id="function-function-mq3-engine-local-qvm-match-cgamevector-function-cgamevector-vm-base-index-label-src-mq3-engine-local-qvm-match-ml-1847396348"></a>
### cgameVector

```ml
function cgameVector(vm, base, index, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1186)

<a id="function-function-mq3-engine-local-qvm-match-chatoutputrandom-function-chatoutputrandom-context-src-mq3-engine-local-qvm-match-ml-1306914647"></a>
### chatOutputRandom

```ml
function chatOutputRandom(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L524)

<a id="function-function-mq3-engine-local-qvm-match-clearclient-function-clearclient-context-index-src-mq3-engine-local-qvm-match-ml-1544100829"></a>
### clearClient

```ml
function clearClient(context, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L375)

<a id="function-function-mq3-engine-local-qvm-match-clearconsolecommand-function-clearconsolecommand-commandstate-context-src-mq3-engine-local-qvm-match-ml-1775372043"></a>
### clearConsoleCommand

```ml
function clearConsoleCommand(commandState, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L234)

<a id="function-function-mq3-engine-local-qvm-match-clearscene-function-clearscene-context-src-mq3-engine-local-qvm-match-ml-1775677323"></a>
### clearScene

```ml
function clearScene(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1156)

<a id="function-function-mq3-engine-local-qvm-match-clientconsolestate-function-clientconsolestate-value-src-mq3-engine-local-qvm-match-ml-136856505"></a>
### clientConsoleState

```ml
function clientConsoleState(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1458)

<a id="function-function-mq3-engine-local-qvm-match-clientconsoleview-function-clientconsoleview-value-now-framemsec-version-src-mq3-engine-local-qvm-match-ml-1904545932"></a>
### clientConsoleView

```ml
function clientConsoleView(value, now, frameMsec, version)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `frameMsec` | `dynamic` | — |  |
| `version` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1462)

<a id="function-function-mq3-engine-local-qvm-match-clientgamecommand-function-clientgamecommand-commandstate-src-mq3-engine-local-qvm-match-ml-874618004"></a>
### clientGameCommand

```ml
function clientGameCommand(commandState)
```

qcommon/Cmd_ExecuteString callback chain.  These callbacks deliberately use the already-tokenized shared command state, which is also what trap_Argv and trap_Args read while the QVM export is running.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L840)

<a id="function-function-mq3-engine-local-qvm-match-clienttextchar-function-clienttextchar-value-ch-src-mq3-engine-local-qvm-match-ml-107557400"></a>
### clientTextChar

```ml
function clientTextChar(value, ch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `ch` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1452)

<a id="function-function-mq3-engine-local-qvm-match-clienttextkey-function-clienttextkey-value-key-shift-ctrl-src-mq3-engine-local-qvm-match-ml-218702227"></a>
### clientTextKey

```ml
function clientTextKey(value, key, shift, ctrl)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `shift` | `dynamic` | — |  |
| `ctrl` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1448)

<a id="function-function-mq3-engine-local-qvm-match-clienttextstate-function-clienttextstate-value-src-mq3-engine-local-qvm-match-ml-1079973739"></a>
### clientTextState

```ml
function clientTextState(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1457)

<a id="function-function-mq3-engine-local-qvm-match-clientusercmd-function-clientusercmd-context-number-src-mq3-engine-local-qvm-match-ml-1514128640"></a>
### clientUsercmd

```ml
function clientUsercmd(context, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1173)

<a id="function-function-mq3-engine-local-qvm-match-closefile-function-closefile-context-handle-src-mq3-engine-local-qvm-match-ml-1578851621"></a>
### closeFile

```ml
function closeFile(context, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L260)

<a id="function-function-mq3-engine-local-qvm-match-commandclearnotify-function-commandclearnotify-context-src-mq3-engine-local-qvm-match-ml-528796023"></a>
### commandClearNotify

```ml
function commandClearNotify(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1158)

<a id="function-function-mq3-engine-local-qvm-match-commandclearusercmds-function-commandclearusercmds-context-src-mq3-engine-local-qvm-match-ml-768901575"></a>
### commandClearUsercmds

```ml
function commandClearUsercmds(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1159)

<a id="function-function-mq3-engine-local-qvm-match-commandcloseconsole-function-commandcloseconsole-context-src-mq3-engine-local-qvm-match-ml-1591450635"></a>
### commandCloseConsole

```ml
function commandCloseConsole(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1160)

<a id="function-function-mq3-engine-local-qvm-match-commandconfigstring-function-commandconfigstring-context-index-value-src-mq3-engine-local-qvm-match-ml-109333880"></a>
### commandConfigstring

```ml
function commandConfigstring(context, index, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1157)

<a id="function-function-mq3-engine-local-qvm-match-commandqueueconsole-function-commandqueueconsole-context-text-src-mq3-engine-local-qvm-match-ml-1192343152"></a>
### commandQueueConsole

```ml
function commandQueueConsole(context, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1161)

<a id="function-function-mq3-engine-local-qvm-match-configureaasmovement-function-configureaasmovement-context-src-mq3-engine-local-qvm-match-ml-1686499879"></a>
### configureAasMovement

```ml
function configureAasMovement(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L445)

<a id="function-function-mq3-engine-local-qvm-match-connectlocal-function-connectlocal-value-clientnum-src-mq3-engine-local-qvm-match-ml-1954352468"></a>
### connectLocal

```ml
function connectLocal(value, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L824)

<a id="function-function-mq3-engine-local-qvm-match-consolecommand-function-consolecommand-context-when-text-src-mq3-engine-local-qvm-match-ml-692367342"></a>
### consoleCommand

```ml
function consoleCommand(context, when, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `when` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L204)

<a id="function-function-mq3-engine-local-qvm-match-consolecrosshairplayer-function-consolecrosshairplayer-context-src-mq3-engine-local-qvm-match-ml-1497602495"></a>
### consoleCrosshairPlayer

```ml
function consoleCrosshairPlayer(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L237)

<a id="function-function-mq3-engine-local-qvm-match-consoleinputcommand-function-consoleinputcommand-context-text-src-mq3-engine-local-qvm-match-ml-461989738"></a>
### consoleInputCommand

```ml
function consoleInputCommand(context, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L216)

<a id="function-function-mq3-engine-local-qvm-match-consoleinputreliable-function-consoleinputreliable-context-text-src-mq3-engine-local-qvm-match-ml-2129379486"></a>
### consoleInputReliable

```ml
function consoleInputReliable(context, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L217)

<a id="function-function-mq3-engine-local-qvm-match-consolelastattacker-function-consolelastattacker-context-src-mq3-engine-local-qvm-match-ml-1590058407"></a>
### consoleLastAttacker

```ml
function consoleLastAttacker(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L238)

<a id="function-function-mq3-engine-local-qvm-match-consolescroll-function-consolescroll-context-operation-count-src-mq3-engine-local-qvm-match-ml-1297647875"></a>
### consoleScroll

```ml
function consoleScroll(context, operation, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `operation` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L220)

<a id="function-function-mq3-engine-local-qvm-match-consolestartdemoloop-function-consolestartdemoloop-context-src-mq3-engine-local-qvm-match-ml-627893551"></a>
### consoleStartDemoLoop

```ml
function consoleStartDemoLoop(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L228)

- [mq3.engine.local_qvm_match.Context](Type-mq3-engine-local-qvm-match-context-431375763.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-currentcmdnumber-function-currentcmdnumber-context-src-mq3-engine-local-qvm-match-ml-587439623"></a>
### currentCmdNumber

```ml
function currentCmdNumber(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1172)

<a id="function-function-mq3-engine-local-qvm-match-currentsnapshot-function-currentsnapshot-context-src-mq3-engine-local-qvm-match-ml-1293429613"></a>
### currentSnapshot

```ml
function currentSnapshot(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1101)

<a id="function-function-mq3-engine-local-qvm-match-decoderefdef-function-decoderefdef-vm-address-src-mq3-engine-local-qvm-match-ml-2107954831"></a>
### decodeRefdef

```ml
function decodeRefdef(vm, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1206)

<a id="function-function-mq3-engine-local-qvm-match-drawcgame-function-drawcgame-value-servertime-src-mq3-engine-local-qvm-match-ml-256344661"></a>
### drawCgame

```ml
function drawCgame(value, serverTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1410)

<a id="function-function-mq3-engine-local-qvm-match-drawcgameproductive-function-drawcgameproductive-value-servertime-src-mq3-engine-local-qvm-match-ml-1049306615"></a>
### drawCgameProductive

```ml
function drawCgameProductive(value, serverTime)
```

The native cgame mirror above is a differential-audit observer. Running it and rescanning its complete cvar table on every retail-QVM frame contributes no authoritative output. The playable path therefore executes only the original cgame QVM; probes continue to use drawCgame and retain the observer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1419)

<a id="function-function-mq3-engine-local-qvm-match-dropclient-function-dropclient-context-client-text-src-mq3-engine-local-qvm-match-ml-1799816351"></a>
### dropClient

```ml
function dropClient(context, client, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L266)

<a id="function-function-mq3-engine-local-qvm-match-dumpconsolecommand-function-dumpconsolecommand-commandstate-context-src-mq3-engine-local-qvm-match-ml-1292129205"></a>
### dumpConsoleCommand

```ml
function dumpConsoleCommand(commandState, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L235)

<a id="function-function-mq3-engine-local-qvm-match-emiterror-function-emiterror-context-text-src-mq3-engine-local-qvm-match-ml-1545631316"></a>
### emitError

```ml
function emitError(context, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L203)

<a id="function-function-mq3-engine-local-qvm-match-emitprint-function-emitprint-context-text-src-mq3-engine-local-qvm-match-ml-133921438"></a>
### emitPrint

```ml
function emitPrint(context, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L202)

<a id="function-function-mq3-engine-local-qvm-match-entitiesinbox-function-entitiesinbox-context-mins-maxs-capacity-src-mq3-engine-local-qvm-match-ml-650954407"></a>
### entitiesInBox

```ml
function entitiesInBox(context, mins, maxs, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L677)

<a id="function-function-mq3-engine-local-qvm-match-entitycontact-function-entitycontact-context-mins-maxs-entity-capsule-src-mq3-engine-local-qvm-match-ml-928910147"></a>
### entityContact

```ml
function entityContact(context, mins, maxs, entity, capsule)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L678)

<a id="function-function-mq3-engine-local-qvm-match-entityindex-function-entityindex-context-entity-src-mq3-engine-local-qvm-match-ml-855360328"></a>
### entityIndex

```ml
function entityIndex(context, entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L285)

<a id="function-function-mq3-engine-local-qvm-match-entitystring-function-entitystring-context-src-mq3-engine-local-qvm-match-ml-1613439367"></a>
### entityString

```ml
function entityString(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L374)

<a id="function-function-mq3-engine-local-qvm-match-entitytoken-function-entitytoken-context-src-mq3-engine-local-qvm-match-ml-61423423"></a>
### entityToken

```ml
function entityToken(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L370)

<a id="function-function-mq3-engine-local-qvm-match-executeclientconsole-function-executeclientconsole-value-text-src-mq3-engine-local-qvm-match-ml-69117668"></a>
### executeClientConsole

```ml
function executeClientConsole(value, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L868)

<a id="function-function-mq3-engine-local-qvm-match-executegameconsole-function-executegameconsole-value-text-src-mq3-engine-local-qvm-match-ml-1522386408"></a>
### executeGameConsole

```ml
function executeGameConsole(value, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L832)

<a id="function-function-mq3-engine-local-qvm-match-extendedcgame-function-extendedcgame-context-vm-base-op-src-mq3-engine-local-qvm-match-ml-1756676450"></a>
### extendedCgame

```ml
function extendedCgame(context, vm, base, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1291)

<a id="function-function-mq3-engine-local-qvm-match-extendedcgamehost-function-extendedcgamehost-context-vm-base-op-src-mq3-engine-local-qvm-match-ml-1827315910"></a>
### extendedCgameHost

```ml
function extendedCgameHost(context, vm, base, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1370)

<a id="function-function-mq3-engine-local-qvm-match-extendedqagame-function-extendedqagame-context-vm-base-op-src-mq3-engine-local-qvm-match-ml-882377538"></a>
### extendedQagame

```ml
function extendedQagame(context, vm, base, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L629)

<a id="function-function-mq3-engine-local-qvm-match-extendedui-function-extendedui-context-vm-base-op-src-mq3-engine-local-qvm-match-ml-458952590"></a>
### extendedUi

```ml
function extendedUi(context, vm, base, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1534)

<a id="function-function-mq3-engine-local-qvm-match-fail-function-fail-message-src-mq3-engine-local-qvm-match-ml-440115659"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L172)

- [mq3.engine.local_qvm_match.FileCursor](Type-mq3-engine-local-qvm-match-filecursor-2065435908.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-forwardclientcommand-function-forwardclientcommand-commandstate-text-src-mq3-engine-local-qvm-match-ml-45950409"></a>
### forwardClientCommand

```ml
function forwardClientCommand(commandState, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L864)

<a id="function-function-mq3-engine-local-qvm-match-freebot-function-freebot-context-index-src-mq3-engine-local-qvm-match-ml-1772130699"></a>
### freeBot

```ml
function freeBot(context, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L362)

<a id="function-function-mq3-engine-local-qvm-match-freevm-function-freevm-machineruntime-slot-src-mq3-engine-local-qvm-match-ml-1885899123"></a>
### freeVm

```ml
function freeVm(machineRuntime, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machineRuntime` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L184)

<a id="function-function-mq3-engine-local-qvm-match-gamemachine-function-gamemachine-context-src-mq3-engine-local-qvm-match-ml-804133277"></a>
### gameMachine

```ml
function gameMachine(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L290)

<a id="function-function-mq3-engine-local-qvm-match-gamestatebytes-function-gamestatebytes-context-src-mq3-engine-local-qvm-match-ml-1541280295"></a>
### gameStateBytes

```ml
function gameStateBytes(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1072)

<a id="function-function-mq3-engine-local-qvm-match-getconfigstring-function-getconfigstring-context-index-src-mq3-engine-local-qvm-match-ml-1464641735"></a>
### getConfigstring

```ml
function getConfigstring(context, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L281)

<a id="function-function-mq3-engine-local-qvm-match-getserverinfo-function-getserverinfo-context-src-mq3-engine-local-qvm-match-ml-725572425"></a>
### getServerinfo

```ml
function getServerinfo(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L284)

<a id="function-function-mq3-engine-local-qvm-match-getusercmd-function-getusercmd-context-index-src-mq3-engine-local-qvm-match-ml-773685125"></a>
### getUsercmd

```ml
function getUsercmd(context, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L682)

<a id="function-function-mq3-engine-local-qvm-match-getuserinfo-function-getuserinfo-context-index-src-mq3-engine-local-qvm-match-ml-1945770719"></a>
### getUserinfo

```ml
function getUserinfo(context, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L282)

<a id="function-function-mq3-engine-local-qvm-match-glconfigbytes-function-glconfigbytes-context-src-mq3-engine-local-qvm-match-ml-1996777791"></a>
### glconfigBytes

```ml
function glconfigBytes(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1084)

<a id="function-function-mq3-engine-local-qvm-match-goalselectiontrace-function-goalselectiontrace-context-start-finish-viewer-contents-src-mq3-engine-local-qvm-match-ml-1873800996"></a>
### goalSelectionTrace

```ml
function goalSelectionTrace(context, start, finish, viewer, contents)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `viewer` | `dynamic` | — |  |
| `contents` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L528)

<a id="function-function-mq3-engine-local-qvm-match-goalselectiontraveltime-function-goalselectiontraveltime-context-area-origin-goalarea-travelflags-src-mq3-engine-local-qvm-match-ml-421463085"></a>
### goalSelectionTravelTime

```ml
function goalSelectionTravelTime(context, area, origin, goalArea, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalArea` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L525)

<a id="function-function-mq3-engine-local-qvm-match-goalstatelog-function-goalstatelog-context-text-src-mq3-engine-local-qvm-match-ml-1430711742"></a>
### goalStateLog

```ml
function goalStateLog(context, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L522)

<a id="function-function-mq3-engine-local-qvm-match-goalstatename-function-goalstatename-context-number-src-mq3-engine-local-qvm-match-ml-95324134"></a>
### goalStateName

```ml
function goalStateName(context, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L521)

<a id="function-function-mq3-engine-local-qvm-match-goalstateprint-function-goalstateprint-context-level-text-src-mq3-engine-local-qvm-match-ml-1362916070"></a>
### goalStatePrint

```ml
function goalStatePrint(context, level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L523)

<a id="function-function-mq3-engine-local-qvm-match-goalstatetime-function-goalstatetime-context-src-mq3-engine-local-qvm-match-ml-1670057989"></a>
### goalStateTime

```ml
function goalStateTime(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L520)

<a id="function-function-mq3-engine-local-qvm-match-imageloader-function-imageloader-services-path-src-mq3-engine-local-qvm-match-ml-1742200491"></a>
### imageLoader

```ml
function imageLoader(services, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L174)

<a id="function-function-mq3-engine-local-qvm-match-inpvs-function-inpvs-context-a-b-ignoreportals-src-mq3-engine-local-qvm-match-ml-1399134845"></a>
### inPvs

```ml
function inPvs(context, a, b, ignorePortals)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `ignorePortals` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L330)

<a id="function-function-mq3-engine-local-qvm-match-jumppadtarget-function-jumppadtarget-context-name-src-mq3-engine-local-qvm-match-ml-335011986"></a>
### jumpPadTarget

```ml
function jumpPadTarget(context, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L453)

<a id="function-function-mq3-engine-local-qvm-match-keybinding-function-keybinding-value-key-src-mq3-engine-local-qvm-match-ml-55130962"></a>
### keyBinding

```ml
function keyBinding(value, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1437)

<a id="function-function-mq3-engine-local-qvm-match-keycatcher-function-keycatcher-value-src-mq3-engine-local-qvm-match-ml-2061816365"></a>
### keyCatcher

```ml
function keyCatcher(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1442)

<a id="function-function-mq3-engine-local-qvm-match-keyisdown-function-keyisdown-value-key-src-mq3-engine-local-qvm-match-ml-1446136528"></a>
### keyIsDown

```ml
function keyIsDown(value, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1443)

<a id="function-function-mq3-engine-local-qvm-match-lerpmodeltag-function-lerpmodeltag-context-vm-base-src-mq3-engine-local-qvm-match-ml-1449103363"></a>
### lerpModelTag

```ml
function lerpModelTag(context, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1233)

<a id="function-function-mq3-engine-local-qvm-match-levelitemplace-function-levelitemplace-context-origin-mins-maxs-floating-src-mq3-engine-local-qvm-match-ml-299943881"></a>
### levelItemPlace

```ml
function levelItemPlace(context, origin, mins, maxs, floating)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `floating` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L487)

<a id="function-function-mq3-engine-local-qvm-match-lightforpoint-function-lightforpoint-context-vm-base-src-mq3-engine-local-qvm-match-ml-474732301"></a>
### lightForPoint

```ml
function lightForPoint(context, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1244)

<a id="function-function-mq3-engine-local-qvm-match-linkentity-function-linkentity-context-entity-src-mq3-engine-local-qvm-match-ml-1275015506"></a>
### linkEntity

```ml
function linkEntity(context, entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L344)

<a id="function-function-mq3-engine-local-qvm-match-loadbindingconfig-function-loadbindingconfig-value-text-src-mq3-engine-local-qvm-match-ml-1706957758"></a>
### loadBindingConfig

```ml
function loadBindingConfig(value, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1441)

<a id="function-function-mq3-engine-local-qvm-match-loadclientvm-function-loadclientvm-machineruntime-name-syscall-interpret-src-mq3-engine-local-qvm-match-ml-967047420"></a>
### loadClientVm

```ml
function loadClientVm(machineRuntime, name, syscall, interpret)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machineRuntime` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `syscall` | `dynamic` | — |  |
| `interpret` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L185)

<a id="function-function-mq3-engine-local-qvm-match-loadvm-function-loadvm-machineruntime-name-syscall-src-mq3-engine-local-qvm-match-ml-2128710009"></a>
### loadVm

```ml
function loadVm(machineRuntime, name, syscall)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machineRuntime` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `syscall` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L181)

<a id="function-function-mq3-engine-local-qvm-match-loadworld-function-loadworld-context-name-src-mq3-engine-local-qvm-match-ml-454792854"></a>
### loadWorld

```ml
function loadWorld(context, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1151)

<a id="function-function-mq3-engine-local-qvm-match-locategamedata-function-locategamedata-context-entities-count-entitystride-clients-clientstride-src-mq3-engine-local-qvm-match-ml-814056349"></a>
### locateGameData

```ml
function locateGameData(context, entities, count, entityStride, clients, clientStride)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `entities` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `entityStride` | `dynamic` | — |  |
| `clients` | `dynamic` | — |  |
| `clientStride` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L263)

<a id="constant-constant-mq3-engine-local-qvm-match-max-clients-const-max-clients-8-src-mq3-engine-local-qvm-match-ml-1997901781"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L141)

<a id="constant-constant-mq3-engine-local-qvm-match-max-configstrings-const-max-configstrings-1024-src-mq3-engine-local-qvm-match-ml-1651310406"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L140)

<a id="function-function-mq3-engine-local-qvm-match-memoryremaining-function-memoryremaining-context-src-mq3-engine-local-qvm-match-ml-225921405"></a>
### memoryRemaining

```ml
function memoryRemaining(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1184)

<a id="function-function-mq3-engine-local-qvm-match-messagemode2command-function-messagemode2command-commandstate-context-src-mq3-engine-local-qvm-match-ml-2115037371"></a>
### messageMode2Command

```ml
function messageMode2Command(commandState, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L231)

<a id="function-function-mq3-engine-local-qvm-match-messagemode3command-function-messagemode3command-commandstate-context-src-mq3-engine-local-qvm-match-ml-1595644193"></a>
### messageMode3Command

```ml
function messageMode3Command(commandState, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L232)

<a id="function-function-mq3-engine-local-qvm-match-messagemode4command-function-messagemode4command-commandstate-context-src-mq3-engine-local-qvm-match-ml-1759989851"></a>
### messageMode4Command

```ml
function messageMode4Command(commandState, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L233)

<a id="function-function-mq3-engine-local-qvm-match-messagemodecommand-function-messagemodecommand-commandstate-context-src-mq3-engine-local-qvm-match-ml-2112941377"></a>
### messageModeCommand

```ml
function messageModeCommand(commandState, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L230)

<a id="function-function-mq3-engine-local-qvm-match-milliseconds-function-milliseconds-context-src-mq3-engine-local-qvm-match-ml-1955536695"></a>
### milliseconds

```ml
function milliseconds(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L201)

<a id="function-function-mq3-engine-local-qvm-match-movebarrierjump-function-movebarrierjump-context-state-direction-speed-src-mq3-engine-local-qvm-match-ml-1750704202"></a>
### moveBarrierJump

```ml
function moveBarrierJump(context, state, direction, speed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L605)

<a id="function-function-mq3-engine-local-qvm-match-moveblocktrace-function-moveblocktrace-context-state-direction-checkbottom-src-mq3-engine-local-qvm-match-ml-1301637198"></a>
### moveBlockTrace

```ml
function moveBlockTrace(context, state, direction, checkBottom)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `checkBottom` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L539)

<a id="function-function-mq3-engine-local-qvm-match-moveclienttrace-function-moveclienttrace-context-start-finish-presence-passentity-src-mq3-engine-local-qvm-match-ml-198940815"></a>
### moveClientTrace

```ml
function moveClientTrace(context, start, finish, presence, passEntity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `presence` | `dynamic` | — |  |
| `passEntity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L535)

<a id="function-function-mq3-engine-local-qvm-match-moveelevatorstate-function-moveelevatorstate-context-state-reach-src-mq3-engine-local-qvm-match-ml-542055223"></a>
### moveElevatorState

```ml
function moveElevatorState(context, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L576)

<a id="function-function-mq3-engine-local-qvm-match-moveentitymodel-function-moveentitymodel-context-entity-src-mq3-engine-local-qvm-match-ml-623848808"></a>
### moveEntityModel

```ml
function moveEntityModel(context, entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L556)

<a id="function-function-mq3-engine-local-qvm-match-movefuncbobstate-function-movefuncbobstate-context-state-reach-src-mq3-engine-local-qvm-match-ml-2095778743"></a>
### moveFuncBobState

```ml
function moveFuncBobState(context, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L589)

<a id="function-function-mq3-engine-local-qvm-match-movegrappleconfig-function-movegrappleconfig-context-src-mq3-engine-local-qvm-match-ml-1551463511"></a>
### moveGrappleConfig

```ml
function moveGrappleConfig(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L616)

<a id="function-function-mq3-engine-local-qvm-match-movegrapplestate-function-movegrapplestate-context-state-reach-src-mq3-engine-local-qvm-match-ml-380816871"></a>
### moveGrappleState

```ml
function moveGrappleState(context, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L619)

<a id="function-function-mq3-engine-local-qvm-match-movegrappletrace-function-movegrappletrace-context-eye-target-entitynum-src-mq3-engine-local-qvm-match-ml-1100686500"></a>
### moveGrappleTrace

```ml
function moveGrappleTrace(context, eye, target, entityNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `eye` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L623)

<a id="function-function-mq3-engine-local-qvm-match-movegravity-function-movegravity-context-src-mq3-engine-local-qvm-match-ml-461993685"></a>
### moveGravity

```ml
function moveGravity(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L550)

<a id="function-function-mq3-engine-local-qvm-match-movegroundtrace-function-movegroundtrace-context-start-mins-maxs-finish-client-contents-src-mq3-engine-local-qvm-match-ml-1509971335"></a>
### moveGroundTrace

```ml
function moveGroundTrace(context, start, mins, maxs, finish, client, contents)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `contents` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L531)

<a id="function-function-mq3-engine-local-qvm-match-movehorizontalvelocityforjump-function-movehorizontalvelocityforjump-context-zvelocity-start-finish-src-mq3-engine-local-qvm-match-ml-208483177"></a>
### moveHorizontalVelocityForJump

```ml
function moveHorizontalVelocityForJump(context, zVelocity, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `zVelocity` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L551)

<a id="function-function-mq3-engine-local-qvm-match-movejumprunstart-function-movejumprunstart-context-state-reach-src-mq3-engine-local-qvm-match-ml-1027010903"></a>
### moveJumpRunStart

```ml
function moveJumpRunStart(context, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L545)

<a id="function-function-mq3-engine-local-qvm-match-movemodelreachability-function-movemodelreachability-context-model-src-mq3-engine-local-qvm-match-ml-678885428"></a>
### moveModelReachability

```ml
function moveModelReachability(context, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L564)

<a id="function-function-mq3-engine-local-qvm-match-movemodeltype-function-movemodeltype-context-model-src-mq3-engine-local-qvm-match-ml-969456706"></a>
### moveModelType

```ml
function moveModelType(context, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L557)

<a id="function-function-mq3-engine-local-qvm-match-movemoverinfo-function-movemoverinfo-context-model-src-mq3-engine-local-qvm-match-ml-1725431362"></a>
### moveMoverInfo

```ml
function moveMoverInfo(context, model)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L572)

<a id="function-function-mq3-engine-local-qvm-match-moveonground-function-moveonground-context-origin-presence-passentity-src-mq3-engine-local-qvm-match-ml-2077500068"></a>
### moveOnGround

```ml
function moveOnGround(context, origin, presence, passEntity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `presence` | `dynamic` | — |  |
| `passEntity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L538)

<a id="function-function-mq3-engine-local-qvm-match-moveroutereachability-function-moveroutereachability-context-area-origin-goalarea-travelflags-src-mq3-engine-local-qvm-match-ml-1797848199"></a>
### moveRouteReachability

```ml
function moveRouteReachability(context, area, origin, goalArea, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalArea` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L611)

<a id="function-function-mq3-engine-local-qvm-match-movesignedrandom-function-movesignedrandom-context-src-mq3-engine-local-qvm-match-ml-1301812439"></a>
### moveSignedRandom

```ml
function moveSignedRandom(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L614)

<a id="function-function-mq3-engine-local-qvm-match-moveswimming-function-moveswimming-context-origin-src-mq3-engine-local-qvm-match-ml-758884141"></a>
### moveSwimming

```ml
function moveSwimming(context, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L534)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictioncommands-function-nativepredictioncommands-context-src-mq3-engine-local-qvm-match-ml-1374941635"></a>
### nativePredictionCommands

```ml
function nativePredictionCommands(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L919)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictionentitypoint-function-nativepredictionentitypoint-host-value-point-src-mq3-engine-local-qvm-match-ml-516348009"></a>
### nativePredictionEntityPoint

```ml
function nativePredictionEntityPoint(host, value, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L911)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictionentitytrace-function-nativepredictionentitytrace-host-value-start-mins-maxs-finish-mask-src-mq3-engine-local-qvm-match-ml-1840573042"></a>
### nativePredictionEntityTrace

```ml
function nativePredictionEntityTrace(host, value, start, mins, maxs, finish, mask)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L904)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictionmover-function-nativepredictionmover-host-origin-ground-fromtime-totime-src-mq3-engine-local-qvm-match-ml-672250450"></a>
### nativePredictionMover

```ml
function nativePredictionMover(host, origin, ground, fromTime, toTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `ground` | `dynamic` | — |  |
| `fromTime` | `dynamic` | — |  |
| `toTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L915)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictionresult-function-nativepredictionresult-result-entitynum-src-mq3-engine-local-qvm-match-ml-185078944"></a>
### nativePredictionResult

```ml
function nativePredictionResult(result, entityNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L900)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictionservices-function-nativepredictionservices-context-src-mq3-engine-local-qvm-match-ml-2124931471"></a>
### nativePredictionServices

```ml
function nativePredictionServices(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L916)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictiontriggertouch-function-nativepredictiontriggertouch-host-value-origin-mins-maxs-src-mq3-engine-local-qvm-match-ml-1601793763"></a>
### nativePredictionTriggerTouch

```ml
function nativePredictionTriggerTouch(host, value, origin, mins, maxs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L912)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictionworldpoint-function-nativepredictionworldpoint-host-point-src-mq3-engine-local-qvm-match-ml-96913658"></a>
### nativePredictionWorldPoint

```ml
function nativePredictionWorldPoint(host, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L910)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictionworldtrace-function-nativepredictionworldtrace-host-start-mins-maxs-finish-mask-src-mq3-engine-local-qvm-match-ml-1372553475"></a>
### nativePredictionWorldTrace

```ml
function nativePredictionWorldTrace(host, start, mins, maxs, finish, mask)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L901)

<a id="function-function-mq3-engine-local-qvm-match-observenativeeffects-function-observenativeeffects-context-renderstart-hudstart-retailactive-src-mq3-engine-local-qvm-match-ml-1025155027"></a>
### observeNativeEffects

```ml
function observeNativeEffects(context, renderStart, hudStart, retailActive)
```

Feed the native cg_effects mirror from the semantic event stream.  These calls execute the original parameter and lifetime logic but remain non-dispatching while cgame.qvm owns presentation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `renderStart` | `dynamic` | — |  |
| `hudStart` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L926)

<a id="function-function-mq3-engine-local-qvm-match-observenativeweapons-function-observenativeweapons-context-renderstart-retailactive-ps-src-mq3-engine-local-qvm-match-ml-1376903713"></a>
### observeNativeWeapons

```ml
function observeNativeWeapons(context, renderStart, retailActive, ps)
```

Run weapon side effects from the same decoded event records.  The native mirror resolves media, traces and impact decisions while retail cgame.qvm remains the only dispatcher.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `renderStart` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |
| `ps` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L953)

<a id="function-function-mq3-engine-local-qvm-match-openfile-function-openfile-context-name-mode-src-mq3-engine-local-qvm-match-ml-1982578695"></a>
### openFile

```ml
function openFile(context, name, mode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L240)

<a id="function-function-mq3-engine-local-qvm-match-pcadddefine-function-pcadddefine-context-vm-base-src-mq3-engine-local-qvm-match-ml-280882925"></a>
### pcAddDefine

```ml
function pcAddDefine(context, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1270)

<a id="function-function-mq3-engine-local-qvm-match-pcfreesource-function-pcfreesource-context-vm-base-src-mq3-engine-local-qvm-match-ml-1877721907"></a>
### pcFreeSource

```ml
function pcFreeSource(context, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1272)

<a id="function-function-mq3-engine-local-qvm-match-pcload-function-pcload-context-name-src-mq3-engine-local-qvm-match-ml-55216186"></a>
### pcLoad

```ml
function pcLoad(context, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L261)

<a id="function-function-mq3-engine-local-qvm-match-pcloadsource-function-pcloadsource-context-vm-base-src-mq3-engine-local-qvm-match-ml-2020522047"></a>
### pcLoadSource

```ml
function pcLoadSource(context, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1271)

<a id="function-function-mq3-engine-local-qvm-match-pcreadtoken-function-pcreadtoken-context-vm-base-src-mq3-engine-local-qvm-match-ml-630226163"></a>
### pcReadToken

```ml
function pcReadToken(context, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1273)

<a id="function-function-mq3-engine-local-qvm-match-pcsourceline-function-pcsourceline-context-vm-base-src-mq3-engine-local-qvm-match-ml-1917035147"></a>
### pcSourceLine

```ml
function pcSourceLine(context, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1277)

<a id="function-function-mq3-engine-local-qvm-match-pointcontents-function-pointcontents-context-point-passentity-src-mq3-engine-local-qvm-match-ml-86696553"></a>
### pointContents

```ml
function pointContents(context, point, passEntity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `passEntity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L676)

<a id="function-function-mq3-engine-local-qvm-match-predictvisibletrace-function-predictvisibletrace-context-start-finish-passentity-contents-src-mq3-engine-local-qvm-match-ml-1550091172"></a>
### predictVisibleTrace

```ml
function predictVisibleTrace(context, start, finish, passEntity, contents)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `passEntity` | `dynamic` | — |  |
| `contents` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L626)

<a id="function-function-mq3-engine-local-qvm-match-publishbotsnapshots-function-publishbotsnapshots-value-src-mq3-engine-local-qvm-match-ml-739252831"></a>
### publishBotSnapshots

```ml
function publishBotSnapshots(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1045)

<a id="function-function-mq3-engine-local-qvm-match-qagamefilelist-function-qagamefilelist-context-vm-base-src-mq3-engine-local-qvm-match-ml-1145772491"></a>
### qagameFileList

```ml
function qagameFileList(context, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L386)

<a id="function-function-mq3-engine-local-qvm-match-qagamerealtime-function-qagamerealtime-context-src-mq3-engine-local-qvm-match-ml-1958816979"></a>
### qagameRealTime

```ml
function qagameRealTime(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L734)

<a id="function-function-mq3-engine-local-qvm-match-qagameseek-function-qagameseek-context-handle-offset-origin-src-mq3-engine-local-qvm-match-ml-262310994"></a>
### qagameSeek

```ml
function qagameSeek(context, handle, offset, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L737)

<a id="function-function-mq3-engine-local-qvm-match-queueinputcommand-function-queueinputcommand-value-text-src-mq3-engine-local-qvm-match-ml-1578977576"></a>
### queueInputCommand

```ml
function queueInputCommand(value, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1439)

<a id="constant-constant-mq3-engine-local-qvm-match-r-absmax-const-r-absmax-476-src-mq3-engine-local-qvm-match-ml-1217611740"></a>
### R_ABSMAX

```ml
const R_ABSMAX = 476
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L154)

<a id="constant-constant-mq3-engine-local-qvm-match-r-absmin-const-r-absmin-464-src-mq3-engine-local-qvm-match-ml-797543911"></a>
### R_ABSMIN

```ml
const R_ABSMIN = 464
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L153)

<a id="constant-constant-mq3-engine-local-qvm-match-r-bmodel-const-r-bmodel-432-src-mq3-engine-local-qvm-match-ml-1349772606"></a>
### R_BMODEL

```ml
const R_BMODEL = 432
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L149)

<a id="constant-constant-mq3-engine-local-qvm-match-r-contents-const-r-contents-460-src-mq3-engine-local-qvm-match-ml-1403037075"></a>
### R_CONTENTS

```ml
const R_CONTENTS = 460
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L152)

<a id="constant-constant-mq3-engine-local-qvm-match-r-currentangles-const-r-currentangles-500-src-mq3-engine-local-qvm-match-ml-66871386"></a>
### R_CURRENTANGLES

```ml
const R_CURRENTANGLES = 500
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L156)

<a id="constant-constant-mq3-engine-local-qvm-match-r-currentorigin-const-r-currentorigin-488-src-mq3-engine-local-qvm-match-ml-1746609945"></a>
### R_CURRENTORIGIN

```ml
const R_CURRENTORIGIN = 488
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L155)

<a id="constant-constant-mq3-engine-local-qvm-match-r-linkcount-const-r-linkcount-420-src-mq3-engine-local-qvm-match-ml-1788208971"></a>
### R_LINKCOUNT

```ml
const R_LINKCOUNT = 420
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L146)

<a id="constant-constant-mq3-engine-local-qvm-match-r-linked-const-r-linked-416-src-mq3-engine-local-qvm-match-ml-2077103600"></a>
### R_LINKED

```ml
const R_LINKED = 416
```

The pinned 1.32b g_public.h intentionally embeds entityState_t at the start of entityShared_t. gentity_t consequently contains s followed by r.s and the engine-owned shared fields below. These are QVM byte offsets, not host layout.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L145)

<a id="constant-constant-mq3-engine-local-qvm-match-r-maxs-const-r-maxs-448-src-mq3-engine-local-qvm-match-ml-2042709915"></a>
### R_MAXS

```ml
const R_MAXS = 448
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L151)

<a id="constant-constant-mq3-engine-local-qvm-match-r-mins-const-r-mins-436-src-mq3-engine-local-qvm-match-ml-2056096262"></a>
### R_MINS

```ml
const R_MINS = 436
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L150)

<a id="constant-constant-mq3-engine-local-qvm-match-r-ownernum-const-r-ownernum-512-src-mq3-engine-local-qvm-match-ml-1093719155"></a>
### R_OWNERNUM

```ml
const R_OWNERNUM = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L157)

<a id="constant-constant-mq3-engine-local-qvm-match-r-singleclient-const-r-singleclient-428-src-mq3-engine-local-qvm-match-ml-1036301873"></a>
### R_SINGLECLIENT

```ml
const R_SINGLECLIENT = 428
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L148)

<a id="constant-constant-mq3-engine-local-qvm-match-r-svflags-const-r-svflags-424-src-mq3-engine-local-qvm-match-ml-467328867"></a>
### R_SVFLAGS

```ml
const R_SVFLAGS = 424
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L147)

<a id="function-function-mq3-engine-local-qvm-match-readfile-function-readfile-context-handle-count-src-mq3-engine-local-qvm-match-ml-167213814"></a>
### readFile

```ml
function readFile(context, handle, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L254)

<a id="function-function-mq3-engine-local-qvm-match-readloadedaas-function-readloadedaas-host-name-src-mq3-engine-local-qvm-match-ml-1619772469"></a>
### readLoadedAas

```ml
function readLoadedAas(host, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L395)

<a id="function-function-mq3-engine-local-qvm-match-readvector-function-readvector-data-at-src-mq3-engine-local-qvm-match-ml-1219529373"></a>
### readVector

```ml
function readVector(data, at)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `at` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L294)

- [mq3.engine.local_qvm_match.Refdef](Type-mq3-engine-local-qvm-match-refdef-2029122708.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-refreshui-function-refreshui-value-time-src-mq3-engine-local-qvm-match-ml-1895122644"></a>
### refreshUi

```ml
function refreshUi(value, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1573)

<a id="function-function-mq3-engine-local-qvm-match-registerasset-function-registerasset-context-name-src-mq3-engine-local-qvm-match-ml-377597408"></a>
### registerAsset

```ml
function registerAsset(context, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1116)

<a id="function-function-mq3-engine-local-qvm-match-registermodel-function-registermodel-context-name-src-mq3-engine-local-qvm-match-ml-1308069742"></a>
### registerModel

```ml
function registerModel(context, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1117)

<a id="function-function-mq3-engine-local-qvm-match-registerqvmfont-function-registerqvmfont-context-vm-base-src-mq3-engine-local-qvm-match-ml-245636643"></a>
### registerQvmFont

```ml
function registerQvmFont(context, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1264)

<a id="function-function-mq3-engine-local-qvm-match-registershader-function-registershader-context-name-src-mq3-engine-local-qvm-match-ml-2053519810"></a>
### registerShader

```ml
function registerShader(context, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1139)

<a id="function-function-mq3-engine-local-qvm-match-registershaderkind-function-registershaderkind-context-kind-name-src-mq3-engine-local-qvm-match-ml-448790880"></a>
### registerShaderKind

```ml
function registerShaderKind(context, kind, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1135)

<a id="function-function-mq3-engine-local-qvm-match-registershadernomip-function-registershadernomip-context-name-src-mq3-engine-local-qvm-match-ml-459574268"></a>
### registerShaderNoMip

```ml
function registerShaderNoMip(context, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1140)

<a id="function-function-mq3-engine-local-qvm-match-registerskin-function-registerskin-context-name-src-mq3-engine-local-qvm-match-ml-362935286"></a>
### registerSkin

```ml
function registerSkin(context, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1134)

<a id="function-function-mq3-engine-local-qvm-match-registertypedasset-function-registertypedasset-context-kind-name-src-mq3-engine-local-qvm-match-ml-231397380"></a>
### registerTypedAsset

```ml
function registerTypedAsset(context, kind, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1105)

<a id="function-function-mq3-engine-local-qvm-match-remaprenderershader-function-remaprenderershader-context-oldname-newname-timeoffset-src-mq3-engine-local-qvm-match-ml-881650414"></a>
### remapRendererShader

```ml
function remapRendererShader(context, oldName, newName, timeOffset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `oldName` | `dynamic` | — |  |
| `newName` | `dynamic` | — |  |
| `timeOffset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1282)

<a id="function-function-mq3-engine-local-qvm-match-removecommand-function-removecommand-context-name-src-mq3-engine-local-qvm-match-ml-1992684496"></a>
### removeCommand

```ml
function removeCommand(context, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1148)

<a id="function-function-mq3-engine-local-qvm-match-renderermodel-function-renderermodel-context-handle-src-mq3-engine-local-qvm-match-ml-828308817"></a>
### rendererModel

```ml
function rendererModel(context, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1222)

<a id="function-function-mq3-engine-local-qvm-match-renderermodelbounds-function-renderermodelbounds-context-handle-src-mq3-engine-local-qvm-match-ml-1857690883"></a>
### rendererModelBounds

```ml
function rendererModelBounds(context, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1226)

- [mq3.engine.local_qvm_match.RenderView](Type-mq3-engine-local-qvm-match-renderview-918227297.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-restartvm-function-restartvm-machineruntime-slot-src-mq3-engine-local-qvm-match-ml-1865379647"></a>
### restartVm

```ml
function restartVm(machineRuntime, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machineRuntime` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L183)

<a id="function-function-mq3-engine-local-qvm-match-runframe-function-runframe-value-servertime-src-mq3-engine-local-qvm-match-ml-1623437759"></a>
### runFrame

```ml
function runFrame(value, serverTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L881)

<a id="function-function-mq3-engine-local-qvm-match-sectorlistcommand-function-sectorlistcommand-commandstate-context-src-mq3-engine-local-qvm-match-ml-622313723"></a>
### sectorListCommand

```ml
function sectorListCommand(commandState, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L236)

<a id="function-function-mq3-engine-local-qvm-match-seedcvars-function-seedcvars-registry-src-mq3-engine-local-qvm-match-ml-192257151"></a>
### seedCvars

```ml
function seedCvars(registry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L687)

<a id="function-function-mq3-engine-local-qvm-match-sendclientcommand-function-sendclientcommand-context-name-src-mq3-engine-local-qvm-match-ml-1366753590"></a>
### sendClientCommand

```ml
function sendClientCommand(context, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1149)

<a id="function-function-mq3-engine-local-qvm-match-sendservercommand-function-sendservercommand-context-client-text-src-mq3-engine-local-qvm-match-ml-502127967"></a>
### sendServerCommand

```ml
function sendServerCommand(context, client, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L272)

<a id="function-function-mq3-engine-local-qvm-match-servergamecommand-function-servergamecommand-commandstate-src-mq3-engine-local-qvm-match-ml-1200573004"></a>
### serverGameCommand

```ml
function serverGameCommand(commandState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L856)

<a id="function-function-mq3-engine-local-qvm-match-setbrushmodel-function-setbrushmodel-context-entity-name-src-mq3-engine-local-qvm-match-ml-2001194077"></a>
### setBrushModel

```ml
function setBrushModel(context, entity, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L321)

<a id="function-function-mq3-engine-local-qvm-match-setconfigstring-function-setconfigstring-context-index-text-src-mq3-engine-local-qvm-match-ml-1876967942"></a>
### setConfigstring

```ml
function setConfigstring(context, index, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L280)

<a id="function-function-mq3-engine-local-qvm-match-setkeybinding-function-setkeybinding-value-key-text-src-mq3-engine-local-qvm-match-ml-1527451675"></a>
### setKeyBinding

```ml
function setKeyBinding(value, key, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1438)

<a id="function-function-mq3-engine-local-qvm-match-setkeydown-function-setkeydown-value-key-down-src-mq3-engine-local-qvm-match-ml-842274354"></a>
### setKeyDown

```ml
function setKeyDown(value, key, down)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1436)

<a id="function-function-mq3-engine-local-qvm-match-setuiconnection-function-setuiconnection-value-connstate-connectpacketcount-servername-messagestring-src-mq3-engine-local-qvm-match-ml-786082209"></a>
### setUiConnection

```ml
function setUiConnection(value, connState, connectPacketCount, servername, messageString)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `connState` | `dynamic` | — |  |
| `connectPacketCount` | `dynamic` | — |  |
| `servername` | `dynamic` | — |  |
| `messageString` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1576)

<a id="function-function-mq3-engine-local-qvm-match-setuimenu-function-setuimenu-value-menu-src-mq3-engine-local-qvm-match-ml-1320664122"></a>
### setUiMenu

```ml
function setUiMenu(value, menu)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `menu` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1574)

<a id="function-function-mq3-engine-local-qvm-match-setuiupdateinfo-function-setuiupdateinfo-value-updateinfostring-src-mq3-engine-local-qvm-match-ml-1701241043"></a>
### setUiUpdateInfo

```ml
function setUiUpdateInfo(value, updateInfoString)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `updateInfoString` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1581)

<a id="function-function-mq3-engine-local-qvm-match-setusercmdvalue-function-setusercmdvalue-context-value-sensitivity-src-mq3-engine-local-qvm-match-ml-439539003"></a>
### setUsercmdValue

```ml
function setUsercmdValue(context, value, sensitivity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `sensitivity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1181)

<a id="function-function-mq3-engine-local-qvm-match-setuserinfo-function-setuserinfo-context-index-text-src-mq3-engine-local-qvm-match-ml-14628622"></a>
### setUserinfo

```ml
function setUserinfo(context, index, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L283)

<a id="function-function-mq3-engine-local-qvm-match-shutdown-function-shutdown-value-src-mq3-engine-local-qvm-match-ml-1820924873"></a>
### shutdown

```ml
function shutdown(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1586)

<a id="function-function-mq3-engine-local-qvm-match-signed16-function-signed16-value-src-mq3-engine-local-qvm-match-ml-1428695893"></a>
### signed16

```ml
function signed16(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L588)

<a id="function-function-mq3-engine-local-qvm-match-snapshot-function-snapshot-value-clientnum-src-mq3-engine-local-qvm-match-ml-1473650044"></a>
### snapshot

```ml
function snapshot(value, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L990)

- [mq3.engine.local_qvm_match.Snapshot](Type-mq3-engine-local-qvm-match-snapshot-1670007188.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-snapshotareasconnected-function-snapshotareasconnected-host-first-second-src-mq3-engine-local-qvm-match-ml-1853250142"></a>
### snapshotAreasConnected

```ml
function snapshotAreasConnected(host, first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L898)

<a id="function-function-mq3-engine-local-qvm-match-snapshotbytes-function-snapshotbytes-context-number-src-mq3-engine-local-qvm-match-ml-1570091802"></a>
### snapshotBytes

```ml
function snapshotBytes(context, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1089)

<a id="function-function-mq3-engine-local-qvm-match-snapshotclusterpvs-function-snapshotclusterpvs-host-cluster-src-mq3-engine-local-qvm-match-ml-237423286"></a>
### snapshotClusterPvs

```ml
function snapshotClusterPvs(host, cluster)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L897)

<a id="function-function-mq3-engine-local-qvm-match-snapshotcore-function-snapshotcore-value-clientnum-src-mq3-engine-local-qvm-match-ml-1586285384"></a>
### snapshotCore

```ml
function snapshotCore(value, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L971)

<a id="function-function-mq3-engine-local-qvm-match-snapshotleafarea-function-snapshotleafarea-host-leaf-src-mq3-engine-local-qvm-match-ml-1153079088"></a>
### snapshotLeafArea

```ml
function snapshotLeafArea(host, leaf)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `leaf` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L894)

<a id="function-function-mq3-engine-local-qvm-match-snapshotleafcluster-function-snapshotleafcluster-host-leaf-src-mq3-engine-local-qvm-match-ml-371741920"></a>
### snapshotLeafCluster

```ml
function snapshotLeafCluster(host, leaf)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `leaf` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L895)

<a id="function-function-mq3-engine-local-qvm-match-snapshotpointleaf-function-snapshotpointleaf-host-origin-src-mq3-engine-local-qvm-match-ml-737119374"></a>
### snapshotPointLeaf

```ml
function snapshotPointLeaf(host, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L893)

<a id="function-function-mq3-engine-local-qvm-match-snapshotproductive-function-snapshotproductive-value-clientnum-src-mq3-engine-local-qvm-match-ml-945293176"></a>
### snapshotProductive

```ml
function snapshotProductive(value, clientNum)
```

Production snapshots are consumed by the authoritative retail cgame QVM. Differential native prediction/effect/HUD mirrors belong in probes, not in the frame loop; they otherwise duplicate most client work for every tick.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1040)

<a id="function-function-mq3-engine-local-qvm-match-snapshotwriteareabits-function-snapshotwriteareabits-host-bits-area-src-mq3-engine-local-qvm-match-ml-43747119"></a>
### snapshotWriteAreaBits

```ml
function snapshotWriteAreaBits(host, bits, area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L896)

- [mq3.engine.local_qvm_match.SoundCommand](Type-mq3-engine-local-qvm-match-soundcommand-396981036.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-soundevent-function-soundevent-kind-entity-channel-handle-origin-velocity-axis-flag-text-text2-src-mq3-engine-local-qvm-match-ml-169641728"></a>
### soundEvent

```ml
function soundEvent(kind, entity, channel, handle, origin, velocity, axis, flag, text, text2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `flag` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `text2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1212)

<a id="function-function-mq3-engine-local-qvm-match-soundvector-function-soundvector-vm-address-label-src-mq3-engine-local-qvm-match-ml-362516767"></a>
### soundVector

```ml
function soundVector(vm, address, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1211)

<a id="function-function-mq3-engine-local-qvm-match-submitusercmd-function-submitusercmd-value-clientnum-command-src-mq3-engine-local-qvm-match-ml-1770195777"></a>
### submitUsercmd

```ml
function submitUsercmd(value, clientNum, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L873)

<a id="function-function-mq3-engine-local-qvm-match-syncclienttextinput-function-syncclienttextinput-value-src-mq3-engine-local-qvm-match-ml-1966487803"></a>
### syncClientTextInput

```ml
function syncClientTextInput(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1444)

<a id="function-function-mq3-engine-local-qvm-match-syncconsoleinputcatcher-function-syncconsoleinputcatcher-context-src-mq3-engine-local-qvm-match-ml-1474879751"></a>
### syncConsoleInputCatcher

```ml
function syncConsoleInputCatcher(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L218)

<a id="function-function-mq3-engine-local-qvm-match-syncconsoleruntime-function-syncconsoleruntime-context-src-mq3-engine-local-qvm-match-ml-635375083"></a>
### syncConsoleRuntime

```ml
function syncConsoleRuntime(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L219)

<a id="function-function-mq3-engine-local-qvm-match-syncspatialentity-function-syncspatialentity-context-index-src-mq3-engine-local-qvm-match-ml-1314439605"></a>
### syncSpatialEntity

```ml
function syncSpatialEntity(context, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L301)

<a id="function-function-mq3-engine-local-qvm-match-toggleclientconsole-function-toggleclientconsole-value-src-mq3-engine-local-qvm-match-ml-989849529"></a>
### toggleClientConsole

```ml
function toggleClientConsole(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1465)

<a id="function-function-mq3-engine-local-qvm-match-toggleconsolecommand-function-toggleconsolecommand-commandstate-context-src-mq3-engine-local-qvm-match-ml-1566587545"></a>
### toggleConsoleCommand

```ml
function toggleConsoleCommand(commandState, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L229)

<a id="function-function-mq3-engine-local-qvm-match-traceworld-function-traceworld-context-start-mins-maxs-finish-passentity-mask-capsule-src-mq3-engine-local-qvm-match-ml-288896713"></a>
### traceWorld

```ml
function traceWorld(context, start, mins, maxs, finish, passEntity, mask, capsule)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `passEntity` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L672)

<a id="function-function-mq3-engine-local-qvm-match-typedassethandle-function-typedassethandle-context-kind-name-src-mq3-engine-local-qvm-match-ml-434623608"></a>
### typedAssetHandle

```ml
function typedAssetHandle(context, kind, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1113)

<a id="function-function-mq3-engine-local-qvm-match-uibinding-function-uibinding-context-key-src-mq3-engine-local-qvm-match-ml-985437138"></a>
### uiBinding

```ml
function uiBinding(context, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1428)

<a id="function-function-mq3-engine-local-qvm-match-uicdkey-function-uicdkey-context-src-mq3-engine-local-qvm-match-ml-1386187599"></a>
### uiCdKey

```ml
function uiCdKey(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1523)

<a id="function-function-mq3-engine-local-qvm-match-uicinematicdraw-function-uicinematicdraw-context-handle-src-mq3-engine-local-qvm-match-ml-1678928419"></a>
### uiCinematicDraw

```ml
function uiCinematicDraw(context, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1531)

<a id="function-function-mq3-engine-local-qvm-match-uicinematicextents-function-uicinematicextents-context-handle-x-y-w-h-src-mq3-engine-local-qvm-match-ml-278143737"></a>
### uiCinematicExtents

```ml
function uiCinematicExtents(context, handle, x, y, w, h)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1532)

<a id="function-function-mq3-engine-local-qvm-match-uicinematicrun-function-uicinematicrun-context-handle-src-mq3-engine-local-qvm-match-ml-579014365"></a>
### uiCinematicRun

```ml
function uiCinematicRun(context, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1530)

<a id="function-function-mq3-engine-local-qvm-match-uicinematicstop-function-uicinematicstop-context-handle-src-mq3-engine-local-qvm-match-ml-1591900091"></a>
### uiCinematicStop

```ml
function uiCinematicStop(context, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1529)

<a id="function-function-mq3-engine-local-qvm-match-uiclearkeys-function-uiclearkeys-context-src-mq3-engine-local-qvm-match-ml-324857193"></a>
### uiClearKeys

```ml
function uiClearKeys(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1433)

<a id="function-function-mq3-engine-local-qvm-match-uiclientstate-function-uiclientstate-context-src-mq3-engine-local-qvm-match-ml-1228788311"></a>
### uiClientState

```ml
function uiClientState(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1425)

<a id="function-function-mq3-engine-local-qvm-match-uiclipboard-function-uiclipboard-context-src-mq3-engine-local-qvm-match-ml-447647351"></a>
### uiClipboard

```ml
function uiClipboard(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1424)

<a id="function-function-mq3-engine-local-qvm-match-uiconfigstring-function-uiconfigstring-context-index-src-mq3-engine-local-qvm-match-ml-1171305321"></a>
### uiConfigString

```ml
function uiConfigString(context, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1426)

<a id="function-function-mq3-engine-local-qvm-match-uifilelist-function-uifilelist-context-path-extension-src-mq3-engine-local-qvm-match-ml-1002450825"></a>
### uiFileList

```ml
function uiFileList(context, path, extension)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1471)

<a id="function-function-mq3-engine-local-qvm-match-uigamecommand-function-uigamecommand-commandstate-src-mq3-engine-local-qvm-match-ml-2108986878"></a>
### uiGameCommand

```ml
function uiGameCommand(commandState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L860)

<a id="function-function-mq3-engine-local-qvm-match-uigetcatcher-function-uigetcatcher-context-src-mq3-engine-local-qvm-match-ml-480860967"></a>
### uiGetCatcher

```ml
function uiGetCatcher(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1434)

<a id="function-function-mq3-engine-local-qvm-match-uigetoverstrike-function-uigetoverstrike-context-src-mq3-engine-local-qvm-match-ml-419309727"></a>
### uiGetOverstrike

```ml
function uiGetOverstrike(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1431)

<a id="function-function-mq3-engine-local-qvm-match-uikeydown-function-uikeydown-context-key-src-mq3-engine-local-qvm-match-ml-546377958"></a>
### uiKeyDown

```ml
function uiKeyDown(context, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1430)

<a id="function-function-mq3-engine-local-qvm-match-uikeyname-function-uikeyname-context-key-src-mq3-engine-local-qvm-match-ml-518397648"></a>
### uiKeyName

```ml
function uiKeyName(context, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1427)

<a id="function-function-mq3-engine-local-qvm-match-uilanadd-function-uilanadd-context-source-name-address-src-mq3-engine-local-qvm-match-ml-1968397871"></a>
### uiLanAdd

```ml
function uiLanAdd(context, source, name, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1495)

<a id="function-function-mq3-engine-local-qvm-match-uilanclearping-function-uilanclearping-context-index-src-mq3-engine-local-qvm-match-ml-263155101"></a>
### uiLanClearPing

```ml
function uiLanClearPing(context, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1498)

<a id="function-function-mq3-engine-local-qvm-match-uilancompare-function-uilancompare-context-source-sortkey-sortdir-first-second-src-mq3-engine-local-qvm-match-ml-1627882684"></a>
### uiLanCompare

```ml
function uiLanCompare(context, source, sortKey, sortDir, first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `sortKey` | `dynamic` | — |  |
| `sortDir` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1516)

<a id="function-function-mq3-engine-local-qvm-match-uilanisvisible-function-uilanisvisible-context-source-index-src-mq3-engine-local-qvm-match-ml-536471492"></a>
### uiLanIsVisible

```ml
function uiLanIsVisible(context, source, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1506)

<a id="function-function-mq3-engine-local-qvm-match-uilanload-function-uilanload-context-src-mq3-engine-local-qvm-match-ml-768982545"></a>
### uiLanLoad

```ml
function uiLanLoad(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1493)

<a id="function-function-mq3-engine-local-qvm-match-uilanmarkvisible-function-uilanmarkvisible-context-source-index-visible-src-mq3-engine-local-qvm-match-ml-333825758"></a>
### uiLanMarkVisible

```ml
function uiLanMarkVisible(context, source, index, visible)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `visible` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1505)

<a id="function-function-mq3-engine-local-qvm-match-uilanping-function-uilanping-context-index-src-mq3-engine-local-qvm-match-ml-1529683"></a>
### uiLanPing

```ml
function uiLanPing(context, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1499)

<a id="function-function-mq3-engine-local-qvm-match-uilanpingcount-function-uilanpingcount-context-src-mq3-engine-local-qvm-match-ml-2014966563"></a>
### uiLanPingCount

```ml
function uiLanPingCount(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1497)

<a id="function-function-mq3-engine-local-qvm-match-uilanpinginfo-function-uilanpinginfo-context-index-src-mq3-engine-local-qvm-match-ml-41741463"></a>
### uiLanPingInfo

```ml
function uiLanPingInfo(context, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1500)

<a id="function-function-mq3-engine-local-qvm-match-uilanremove-function-uilanremove-context-source-address-src-mq3-engine-local-qvm-match-ml-663335026"></a>
### uiLanRemove

```ml
function uiLanRemove(context, source, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1496)

<a id="function-function-mq3-engine-local-qvm-match-uilanresetpings-function-uilanresetpings-context-source-src-mq3-engine-local-qvm-match-ml-1752763802"></a>
### uiLanResetPings

```ml
function uiLanResetPings(context, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1511)

<a id="function-function-mq3-engine-local-qvm-match-uilansave-function-uilansave-context-src-mq3-engine-local-qvm-match-ml-529591739"></a>
### uiLanSave

```ml
function uiLanSave(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1494)

<a id="function-function-mq3-engine-local-qvm-match-uilanserveraddress-function-uilanserveraddress-context-source-index-src-mq3-engine-local-qvm-match-ml-1154254868"></a>
### uiLanServerAddress

```ml
function uiLanServerAddress(context, source, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1502)

<a id="function-function-mq3-engine-local-qvm-match-uilanservercount-function-uilanservercount-context-source-src-mq3-engine-local-qvm-match-ml-967307644"></a>
### uiLanServerCount

```ml
function uiLanServerCount(context, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1501)

<a id="function-function-mq3-engine-local-qvm-match-uilanserverinfo-function-uilanserverinfo-context-source-index-src-mq3-engine-local-qvm-match-ml-135954884"></a>
### uiLanServerInfo

```ml
function uiLanServerInfo(context, source, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1503)

<a id="function-function-mq3-engine-local-qvm-match-uilanserverping-function-uilanserverping-context-source-index-src-mq3-engine-local-qvm-match-ml-1177729924"></a>
### uiLanServerPing

```ml
function uiLanServerPing(context, source, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1504)

<a id="function-function-mq3-engine-local-qvm-match-uilanserverstatus-function-uilanserverstatus-context-address-src-mq3-engine-local-qvm-match-ml-1193607833"></a>
### uiLanServerStatus

```ml
function uiLanServerStatus(context, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1512)

<a id="function-function-mq3-engine-local-qvm-match-uilanupdatepings-function-uilanupdatepings-context-source-src-mq3-engine-local-qvm-match-ml-569583000"></a>
### uiLanUpdatePings

```ml
function uiLanUpdatePings(context, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1507)

<a id="function-function-mq3-engine-local-qvm-match-uilocalsound-function-uilocalsound-context-handle-channel-src-mq3-engine-local-qvm-match-ml-1837573318"></a>
### uiLocalSound

```ml
function uiLocalSound(context, handle, channel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1518)

<a id="function-function-mq3-engine-local-qvm-match-uipb-function-uipb-context-status-src-mq3-engine-local-qvm-match-ml-604421649"></a>
### uiPb

```ml
function uiPb(context, status)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `status` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1527)

<a id="function-function-mq3-engine-local-qvm-match-uiplaycinematic-function-uiplaycinematic-context-name-x-y-w-h-bits-src-mq3-engine-local-qvm-match-ml-281931764"></a>
### uiPlayCinematic

```ml
function uiPlayCinematic(context, name, x, y, w, h, bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1528)

<a id="function-function-mq3-engine-local-qvm-match-uirealtime-function-uirealtime-context-src-mq3-engine-local-qvm-match-ml-294429287"></a>
### uiRealTime

```ml
function uiRealTime(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1521)

<a id="function-function-mq3-engine-local-qvm-match-uiregistersound-function-uiregistersound-context-name-compressed-src-mq3-engine-local-qvm-match-ml-906267845"></a>
### uiRegisterSound

```ml
function uiRegisterSound(context, name, compressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `compressed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1517)

<a id="function-function-mq3-engine-local-qvm-match-uiremap-function-uiremap-context-oldname-newname-timeoffset-src-mq3-engine-local-qvm-match-ml-1087033818"></a>
### uiRemap

```ml
function uiRemap(context, oldName, newName, timeOffset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `oldName` | `dynamic` | — |  |
| `newName` | `dynamic` | — |  |
| `timeOffset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1522)

<a id="function-function-mq3-engine-local-qvm-match-uiseek-function-uiseek-context-handle-offset-origin-src-mq3-engine-local-qvm-match-ml-2077635546"></a>
### uiSeek

```ml
function uiSeek(context, handle, offset, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1526)

<a id="function-function-mq3-engine-local-qvm-match-uisetbinding-function-uisetbinding-context-key-text-src-mq3-engine-local-qvm-match-ml-460410493"></a>
### uiSetBinding

```ml
function uiSetBinding(context, key, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1429)

<a id="function-function-mq3-engine-local-qvm-match-uisetcatcher-function-uisetcatcher-context-value-src-mq3-engine-local-qvm-match-ml-1330758810"></a>
### uiSetCatcher

```ml
function uiSetCatcher(context, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1435)

<a id="function-function-mq3-engine-local-qvm-match-uisetcdkey-function-uisetcdkey-context-key-src-mq3-engine-local-qvm-match-ml-561483280"></a>
### uiSetCdKey

```ml
function uiSetCdKey(context, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1524)

<a id="function-function-mq3-engine-local-qvm-match-uisetcolor-function-uisetcolor-context-color-src-mq3-engine-local-qvm-match-ml-1271296320"></a>
### uiSetColor

```ml
function uiSetColor(context, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1491)

<a id="function-function-mq3-engine-local-qvm-match-uisetoverstrike-function-uisetoverstrike-context-value-src-mq3-engine-local-qvm-match-ml-306075018"></a>
### uiSetOverstrike

```ml
function uiSetOverstrike(context, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1432)

<a id="function-function-mq3-engine-local-qvm-match-uistartmusic-function-uistartmusic-context-intro-trackloop-src-mq3-engine-local-qvm-match-ml-420019570"></a>
### uiStartMusic

```ml
function uiStartMusic(context, intro, trackLoop)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `intro` | `dynamic` | — |  |
| `trackLoop` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1520)

<a id="function-function-mq3-engine-local-qvm-match-uistopmusic-function-uistopmusic-context-src-mq3-engine-local-qvm-match-ml-479295153"></a>
### uiStopMusic

```ml
function uiStopMusic(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1519)

<a id="function-function-mq3-engine-local-qvm-match-uistretchpic-function-uistretchpic-context-values-shader-src-mq3-engine-local-qvm-match-ml-1881177806"></a>
### uiStretchPic

```ml
function uiStretchPic(context, values, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1492)

<a id="function-function-mq3-engine-local-qvm-match-uiunique-function-uiunique-values-value-src-mq3-engine-local-qvm-match-ml-359805103"></a>
### uiUnique

```ml
function uiUnique(values, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1467)

<a id="function-function-mq3-engine-local-qvm-match-uiverifycdkey-function-uiverifycdkey-context-key-checksum-src-mq3-engine-local-qvm-match-ml-1345454823"></a>
### uiVerifyCdKey

```ml
function uiVerifyCdKey(context, key, checksum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `checksum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1525)

<a id="function-function-mq3-engine-local-qvm-match-unlinkentity-function-unlinkentity-context-entity-src-mq3-engine-local-qvm-match-ml-835707934"></a>
### unlinkEntity

```ml
function unlinkEntity(context, entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L348)

<a id="function-function-mq3-engine-local-qvm-match-updateaasentity-function-updateaasentity-context-vm-base-src-mq3-engine-local-qvm-match-ml-330797949"></a>
### updateAasEntity

```ml
function updateAasEntity(context, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L415)

<a id="function-function-mq3-engine-local-qvm-match-updateclientconsole-function-updateclientconsole-value-now-framemsec-src-mq3-engine-local-qvm-match-ml-598295128"></a>
### updateClientConsole

```ml
function updateClientConsole(value, now, frameMsec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `frameMsec` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1459)

<a id="function-function-mq3-engine-local-qvm-match-updatescreen-function-updatescreen-context-src-mq3-engine-local-qvm-match-ml-1325828907"></a>
### updateScreen

```ml
function updateScreen(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1150)

- [mq3.engine.local_qvm_match.UserSettings](Type-mq3-engine-local-qvm-match-usersettings-1631405870.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-vminfocommand-function-vminfocommand-commandstate-machineruntime-src-mq3-engine-local-qvm-match-ml-298854993"></a>
### vmInfoCommand

```ml
function vmInfoCommand(commandState, machineRuntime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `machineRuntime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L193)

<a id="function-function-mq3-engine-local-qvm-match-vmprofilecommand-function-vmprofilecommand-commandstate-machineruntime-src-mq3-engine-local-qvm-match-ml-1955188885"></a>
### vmProfileCommand

```ml
function vmProfileCommand(commandState, machineRuntime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `machineRuntime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L188)

<a id="function-function-mq3-engine-local-qvm-match-vmruntimeaddcommand-function-vmruntimeaddcommand-host-name-machineruntime-src-mq3-engine-local-qvm-match-ml-677537586"></a>
### vmRuntimeAddCommand

```ml
function vmRuntimeAddCommand(host, name, machineRuntime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `machineRuntime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L197)

<a id="function-function-mq3-engine-local-qvm-match-vmruntimedeveloper-function-vmruntimedeveloper-host-src-mq3-engine-local-qvm-match-ml-1928387616"></a>
### vmRuntimeDeveloper

```ml
function vmRuntimeDeveloper(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L187)

<a id="function-function-mq3-engine-local-qvm-match-vmruntimeregister-function-vmruntimeregister-host-name-value-flags-src-mq3-engine-local-qvm-match-ml-943298985"></a>
### vmRuntimeRegister

```ml
function vmRuntimeRegister(host, name, value, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L186)

<a id="function-function-mq3-engine-local-qvm-match-writefile-function-writefile-context-handle-data-src-mq3-engine-local-qvm-match-ml-1585405023"></a>
### writeFile

```ml
function writeFile(context, handle, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L259)

<a id="function-function-mq3-engine-local-qvm-match-writespatialentity-function-writespatialentity-context-index-src-mq3-engine-local-qvm-match-ml-1908738781"></a>
### writeSpatialEntity

```ml
function writeSpatialEntity(context, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L313)

<a id="function-function-mq3-engine-local-qvm-match-writevector-function-writevector-data-at-value-src-mq3-engine-local-qvm-match-ml-823677804"></a>
### writeVector

```ml
function writeVector(data, at, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `at` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L297)

<a id="function-function-mq3-engine-local-qvm-match-writewords-function-writewords-output-offset-words-src-mq3-engine-local-qvm-match-ml-965889647"></a>
### writeWords

```ml
function writeWords(output, offset, words)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `words` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L1067)
