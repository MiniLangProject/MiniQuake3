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
- `mq3/botlib/aas_sample.ml` as `aasSample` → [src/mq3/botlib/aas_sample.ml](File-src-mq3-botlib-aas-sample-ml-257202176.md)
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
- `mq3/client/cl_cgame_runtime.ml` as `clientCgame` → [src/mq3/client/cl_cgame_runtime.ml](File-src-mq3-client-cl-cgame-runtime-ml-51368453.md)
- `mq3/client/cl_console.ml` as `clientConsole` → [src/mq3/client/cl_console.ml](File-src-mq3-client-cl-console-ml-1724798958.md)
- `mq3/client/command_ring.ml` as `matchCommandRing` → [src/mq3/client/command_ring.ml](File-src-mq3-client-command-ring-ml-1850754325.md)
- `mq3/client/console_input.ml` as `consoleInput` → [src/mq3/client/console_input.ml](File-src-mq3-client-console-input-ml-896040399.md)
- `mq3/client/gamestate.ml` as `gamestate` → [src/mq3/client/gamestate.ml](File-src-mq3-client-gamestate-ml-1690167636.md)
- `mq3/client/key_bindings_config.ml` as `bindingConfig` → [src/mq3/client/key_bindings_config.ml](File-src-mq3-client-key-bindings-config-ml-2105830282.md)
- `mq3/client/qvm_frame_input.ml` as `clientFrameInput` → [src/mq3/client/qvm_frame_input.ml](File-src-mq3-client-qvm-frame-input-ml-1180554640.md)
- `mq3/client/server_command_stream.ml` as `serverCommandStream` → [src/mq3/client/server_command_stream.ml](File-src-mq3-client-server-command-stream-ml-1493457615.md)
- `mq3/client/server_stream.ml` as `serverStream` → [src/mq3/client/server_stream.ml](File-src-mq3-client-server-stream-ml-1251342773.md)
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
- `mq3/format/mod_stack.ml` as `modStack` → [src/mq3/format/mod_stack.ml](File-src-mq3-format-mod-stack-ml-1677131492.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/game/constants.ml` as `gameConstants` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/game/movement.ml` as `nativeMovement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/playerstate.ml` as `playerstate` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)
- `mq3/game/trajectory.ml` as `gameTrajectory` → [src/mq3/game/trajectory.ml](File-src-mq3-game-trajectory-ml-1278285327.md)
- `mq3/platform/win_main_runtime.ml` as `botCacheWinMain` → [src/mq3/platform/win_main_runtime.ml](File-src-mq3-platform-win-main-runtime-ml-2060063046.md)
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
- `mq3/vm/cgame_collision_cache.ml` as `cgameCollisionCache` → [src/mq3/vm/cgame_collision_cache.ml](File-src-mq3-vm-cgame-collision-cache-ml-322754460.md)
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

Compute aas movement area contents in engine.local_qvm_match; the normal completion returns `info.contents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aas`. |
| `area` | `dynamic` | — | Area num passed as `areaNum` to `mq3.botlib.aas_runtime.areaInfo`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L810)

<a id="function-function-mq3-engine-local-qvm-match-aasmovementpointarea-function-aasmovementpointarea-context-point-src-mq3-engine-local-qvm-match-ml-774880463"></a>
### aasMovementPointArea

```ml
function aasMovementPointArea(context, point)
```

Return `mq3.botlib.aas_runtime.pointAreaNum(context.aas, point)` from `engine.local_qvm_match.aasMovementPointArea`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aas`. |
| `point` | `dynamic` | — | Point passed as `point` to `mq3.botlib.aas_runtime.pointAreaNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L802)

<a id="function-function-mq3-engine-local-qvm-match-aasmovementpointpresence-function-aasmovementpointpresence-context-point-src-mq3-engine-local-qvm-match-ml-440481975"></a>
### aasMovementPointPresence

```ml
function aasMovementPointPresence(context, point)
```

Return `mq3.botlib.aas_runtime.pointPresenceType(context.aas, point)` from `engine.local_qvm_match.aasMovementPointPresence`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aas`. |
| `point` | `dynamic` | — | Point passed as `point` to `mq3.botlib.aas_runtime.pointPresenceType`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L806)

<a id="function-function-mq3-engine-local-qvm-match-aasmovementtrace-function-aasmovementtrace-context-start-finish-presence-passentity-src-mq3-engine-local-qvm-match-ml-1974726373"></a>
### aasMovementTrace

```ml
function aasMovementTrace(context, start, finish, presence, passEntity)
```

Apply `mq3.botlib.aas_runtime.presenceTypeBoundingBox`, `mq3.botlib.aas_client_trace.trace`, `mq3.server.world.trace` for aas movement trace in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aas`, `spatialScene`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.botlib.aas_client_trace.trace`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.botlib.aas_client_trace.trace`. |
| `presence` | `dynamic` | — | Presence type passed as `presenceType` to `mq3.botlib.aas_runtime.presenceTypeBoundingBox`. |
| `passEntity` | `dynamic` | — | Pass entity used in `(passEntity >= 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L787)

<a id="function-function-mq3-engine-local-qvm-match-aasmovementtraceareas-function-aasmovementtraceareas-context-start-finish-maximum-src-mq3-engine-local-qvm-match-ml-443296884"></a>
### aasMovementTraceAreas

```ml
function aasMovementTraceAreas(context, start, finish, maximum)
```

Return `mq3.botlib.aas_trace_areas.trace(context.aas, start, finish, maximum)` from `engine.local_qvm_match.aasMovementTraceAreas`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aas`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.botlib.aas_trace_areas.trace`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.botlib.aas_trace_areas.trace`. |
| `maximum` | `dynamic` | — | Maximum passed as `maximum` to `mq3.botlib.aas_trace_areas.trace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L818)

<a id="function-function-mq3-engine-local-qvm-match-aaspointcontents-function-aaspointcontents-context-point-src-mq3-engine-local-qvm-match-ml-1187176623"></a>
### aasPointContents

```ml
function aasPointContents(context, point)
```

Return `mq3.engine.local_qvm_match.pointContents(context, point, - 1)` from `engine.local_qvm_match.aasPointContents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.pointContents`. |
| `point` | `dynamic` | — | Point passed as `point` to `mq3.engine.local_qvm_match.pointContents`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L780)

<a id="function-function-mq3-engine-local-qvm-match-addcgamepolys-function-addcgamepolys-context-vm-base-multiple-src-mq3-engine-local-qvm-match-ml-1801010937"></a>
### addCgamePolys

```ml
function addCgamePolys(context, vm, base, multiple)
```

Add cgame polys in engine.local_qvm_match; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `scene`. |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `multiple` | `dynamic` | — | Multiple operand used by `addCgamePolys`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2401)

<a id="function-function-mq3-engine-local-qvm-match-addcommand-function-addcommand-context-name-src-mq3-engine-local-qvm-match-ml-637601798"></a>
### addCommand

```ml
function addCommand(context, name)
```

Add command in engine.local_qvm_match; updates `context.console`.

Direct state writes: `context.console`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `commandState`, `console`. Updated in place: `console`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.command_buffer.addCommand`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2210)

<a id="function-function-mq3-engine-local-qvm-match-adjustportal-function-adjustportal-context-entity-isopen-src-mq3-engine-local-qvm-match-ml-826965394"></a>
### adjustPortal

```ml
function adjustPortal(context, entity, isOpen)
```

Compute adjust portal in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `spatialScene`, `collisionWorld`. |
| `entity` | `dynamic` | — | Entity passed as `entity` to `mq3.engine.local_qvm_match.entityIndex`. |
| `isOpen` | `dynamic` | — | Open passed as `open` to `mq3.collision.visibility.adjustAreaPortalState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L605)

<a id="function-function-mq3-engine-local-qvm-match-allocatebot-function-allocatebot-context-src-mq3-engine-local-qvm-match-ml-382069247"></a>
### allocateBot

```ml
function allocateBot(context)
```

Update `context.botAllocations` in engine.local_qvm_match; the normal completion returns `- 1`.

Direct state writes: `context.botAllocations`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `clientStates`, `botServer`, `botAllocations`, `gameEntities`, `entityStride`, `machineRuntime`. Updated in place: `botAllocations`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L634)

<a id="function-function-mq3-engine-local-qvm-match-anykeydown-function-anykeydown-value-src-mq3-engine-local-qvm-match-ml-953703605"></a>
### anyKeyDown

```ml
function anyKeyDown(value)
```

Test any key down in engine.local_qvm_match; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2907)

<a id="function-function-mq3-engine-local-qvm-match-applysavedclientstate-function-applysavedclientstate-context-settings-src-mq3-engine-local-qvm-match-ml-202179382"></a>
### applySavedClientState

```ml
function applySavedClientState(context, settings)
```

Apply saved client state in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameKeys`, `userinfos`, `commandState`. |
| `settings` | `dynamic` | — | Record exposing `bindings`, `userinfos`, `pendingBotCommands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1385)

<a id="function-function-mq3-engine-local-qvm-match-applysavedcvars-function-applysavedcvars-registry-settings-src-mq3-engine-local-qvm-match-ml-1350225616"></a>
### applySavedCvars

```ml
function applySavedCvars(registry, settings)
```

Apply saved cvars in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.qcommon.cvar.get`. |
| `settings` | `dynamic` | — | Record exposing `cvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1368)

<a id="function-function-mq3-engine-local-qvm-match-areasconnected-function-areasconnected-context-a-b-src-mq3-engine-local-qvm-match-ml-752668534"></a>
### areasConnected

```ml
function areasConnected(context, a, b)
```

Return `mq3.collision.visibility.areasConnected(context.collisionWorld.visibility, a, b)` from `engine.local_qvm_match.areasConnected`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `collisionWorld`. |
| `a` | `dynamic` | — | Area 1 passed as `area1` to `mq3.collision.visibility.areasConnected`. |
| `b` | `dynamic` | — | Area 2 passed as `area2` to `mq3.collision.visibility.areasConnected`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L615)

<a id="function-function-mq3-engine-local-qvm-match-attachinputclear-function-attachinputclear-value-context-callback-src-mq3-engine-local-qvm-match-ml-1378851915"></a>
### attachInputClear

```ml
function attachInputClear(value, context, callback)
```

Test attach input clear in engine.local_qvm_match; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |
| `context` | `dynamic` | — | Context used in `(value.context == void)` and `((value == void) or (value.context == void))`. |
| `callback` | `dynamic` | — | Callback invoked for callback; the call sites below define the callback arguments. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2864)

<a id="function-function-mq3-engine-local-qvm-match-beginclientmessage-function-beginclientmessage-value-team-playernum-src-mq3-engine-local-qvm-match-ml-1363789491"></a>
### beginClientMessage

```ml
function beginClientMessage(value, team, playerNum)
```

Begin client message in engine.local_qvm_match; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |
| `team` | `dynamic` | — | Team passed as `team` to `mq3.client.console_input.beginMessage`. |
| `playerNum` | `dynamic` | — | Player num passed as `playerNum` to `mq3.client.console_input.beginMessage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2972)

<a id="function-function-mq3-engine-local-qvm-match-beginrendererframe-function-beginrendererframe-value-src-mq3-engine-local-qvm-match-ml-394307333"></a>
### beginRendererFrame

```ml
function beginRendererFrame(value)
```

R_ToggleSmpFrame owns frame capacities; RE_ClearScene only separates views within that frame. Reset before cgame/UI draw calls, never per RenderScene: the main view, portal views and 3D HUD must share one bounded submission set.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2706)

<a id="function-function-mq3-engine-local-qvm-match-bestreachablejumppadarea-function-bestreachablejumppadarea-context-itemorigin-itemmins-itemmaxs-src-mq3-engine-local-qvm-match-ml-635631610"></a>
### bestReachableJumpPadArea

```ml
function bestReachableJumpPadArea(context, itemOrigin, itemMins, itemMaxs)
```

Compute best reachable jump pad area in engine.local_qvm_match; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `botBspEntities`, `collisionWorld`, `aas`, `aasMovement`. |
| `itemOrigin` | `dynamic` | — | Item origin used in `itemOrigin[0]` and `itemOrigin[1]`. |
| `itemMins` | `dynamic` | — | Item mins used in `itemMins[0]` and `itemMins[1]`. |
| `itemMaxs` | `dynamic` | — | Item maxs used in `itemMaxs[0]` and `itemMaxs[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L850)

<a id="function-function-mq3-engine-local-qvm-match-bindingconfigtext-function-bindingconfigtext-value-src-mq3-engine-local-qvm-match-ml-784112661"></a>
### bindingConfigText

```ml
function bindingConfigText(value)
```

Compute binding config text in engine.local_qvm_match; the normal completion returns `bindingConfig.bindingText(bindingConfig.create(value.context.cgameKeys))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2897)

<a id="function-function-mq3-engine-local-qvm-match-boot-function-boot-archive-map-now-src-mq3-engine-local-qvm-match-ml-323668418"></a>
### boot

```ml
function boot(archive, map, now)
```

Return `mq3.engine.local_qvm_match.bootConfigured(archive, map, now, "", false)` from `engine.local_qvm_match.boot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfigured`. |
| `map` | `dynamic` | — | Map passed as `map` to `mq3.engine.local_qvm_match.bootConfigured`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.engine.local_qvm_match.bootConfigured`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1602)

- [mq3.engine.local_qvm_match.Boot](Type-mq3-engine-local-qvm-match-boot-1321265160.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-bootcgame-function-bootcgame-value-src-mq3-engine-local-qvm-match-ml-337881419"></a>
### bootCgame

```ml
function bootCgame(value)
```

Update `value.cgame` in engine.local_qvm_match; the normal completion returns `client`.

Direct state writes: `value.cgame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`, `runtime`. Updated in place: `cgame`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2668)

<a id="function-function-mq3-engine-local-qvm-match-bootconfigured-function-bootconfigured-archive-map-now-qvmroot-botsenabled-src-mq3-engine-local-qvm-match-ml-584350289"></a>
### bootConfigured

```ml
function bootConfigured(archive, map, now, qvmRoot, botsEnabled)
```

Return `mq3.engine.local_qvm_match.bootConfiguredNamed(archive, map, now, qvmRoot, botsEnabled, "q3dm1")` from `engine.local_qvm_match.bootConfigured`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfiguredNamed`. |
| `map` | `dynamic` | — | Map passed as `map` to `mq3.engine.local_qvm_match.bootConfiguredNamed`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.engine.local_qvm_match.bootConfiguredNamed`. |
| `qvmRoot` | `dynamic` | — | Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfiguredNamed`. |
| `botsEnabled` | `dynamic` | — | Bots enabled passed as `botsEnabled` to `mq3.engine.local_qvm_match.bootConfiguredNamed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1549)

<a id="function-function-mq3-engine-local-qvm-match-bootconfigurednamed-function-bootconfigurednamed-archive-map-now-qvmroot-botsenabled-mapname-src-mq3-engine-local-qvm-match-ml-1136606466"></a>
### bootConfiguredNamed

```ml
function bootConfiguredNamed(archive, map, now, qvmRoot, botsEnabled, mapName)
```

Return `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings(archive, map, now, qvmRoot, botsEnabled, mapName, true, void)` from `engine.local_qvm_match.bootConfiguredNamed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `map` | `dynamic` | — | Map passed as `map` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `qvmRoot` | `dynamic` | — | Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `botsEnabled` | `dynamic` | — | Bots enabled passed as `botsEnabled` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `mapName` | `dynamic` | — | Map name passed as `mapName` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1542)

<a id="function-function-mq3-engine-local-qvm-match-bootconfigurednamedmode-function-bootconfigurednamedmode-archive-map-now-qvmroot-botsenabled-mapname-startgame-src-mq3-engine-local-qvm-match-ml-2121695874"></a>
### bootConfiguredNamedMode

```ml
function bootConfiguredNamedMode(archive, map, now, qvmRoot, botsEnabled, mapName, startGame)
```

Return `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings(archive, map, now, qvmRoot, botsEnabled, mapName, startGame, void)` from `engine.local_qvm_match.bootConfiguredNamedMode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `map` | `dynamic` | — | Map passed as `map` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `qvmRoot` | `dynamic` | — | Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `botsEnabled` | `dynamic` | — | Bots enabled passed as `botsEnabled` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `mapName` | `dynamic` | — | Map name passed as `mapName` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `startGame` | `dynamic` | — | Start game passed as `startGame` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1534)

<a id="function-function-mq3-engine-local-qvm-match-bootconfigurednamedmodesettings-function-bootconfigurednamedmodesettings-archive-map-now-qvmroot-botsenabled-mapname-startgame-settings-src-mq3-engine-local-qvm-match-ml-2025761987"></a>
### bootConfiguredNamedModeSettings

```ml
function bootConfiguredNamedModeSettings(archive, map, now, qvmRoot, botsEnabled, mapName, startGame, settings)
```

Compute boot configured named mode settings in engine.local_qvm_match; the normal completion returns `boot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Initial `archive` field stored in the returned or constructed `mq3.engine.local_qvm_match.Context` record. |
| `map` | `dynamic` | — | Record exposing `data`, `offsets`, `lengths`. |
| `now` | `dynamic` | — | Server time passed as `serverTime` to `mq3.vm.syscall_qagame_world.userCommand`. |
| `qvmRoot` | `dynamic` | — | Initial `qvmRoot` field stored in the returned or constructed `mq3.engine.local_qvm_match.Context` record. |
| `botsEnabled` | `dynamic` | — | Bots enabled operand used by `bootConfiguredNamedModeSettings`; its reads are shown in the implementation. |
| `mapName` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.cvar.set2`. |
| `startGame` | `dynamic` | — | Start game used in `(startGame and (map == void))` and `(((archive == void) or (now < 0)) or (startGame and (map == void)))`. |
| `settings` | `dynamic` | — | Settings passed as `settings` to `mq3.engine.local_qvm_match.applySavedCvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1428)

<a id="function-function-mq3-engine-local-qvm-match-bootserverstream-function-bootserverstream-archive-map-mapname-qvmroot-settings-protocol-demoplaying-sourcename-now-src-mq3-engine-local-qvm-match-ml-1249129575"></a>
### bootServerStream

```ml
function bootServerStream(archive, map, mapName, qvmRoot, settings, protocol, demoPlaying, sourceName, now)
```

Compute boot server stream in engine.local_qvm_match; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `map` | `dynamic` | — | Map passed as `map` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `mapName` | `dynamic` | — | Map name passed as `mapName` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `qvmRoot` | `dynamic` | — | Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `settings` | `dynamic` | — | Settings passed as `settings` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `protocol` | `dynamic` | — | Record exposing `gamestateState`. |
| `demoPlaying` | `dynamic` | — | Demo playing passed as `demoPlaying` to `mq3.client.server_stream.attach`. |
| `sourceName` | `dynamic` | — | Servername passed as `servername` to `mq3.client.ui_host_lifecycle.createClientState`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2790)

<a id="function-function-mq3-engine-local-qvm-match-bootui-function-bootui-value-src-mq3-engine-local-qvm-match-ml-1504093417"></a>
### bootUi

```ml
function bootUi(value)
```

Update `value.ui` in engine.local_qvm_match; the normal completion returns `ui`.

Direct state writes: `value.ui`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`, `runtime`. Updated in place: `ui`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3275)

<a id="function-function-mq3-engine-local-qvm-match-bootuishell-function-bootuishell-archive-map-now-qvmroot-src-mq3-engine-local-qvm-match-ml-652689664"></a>
### bootUiShell

```ml
function bootUiShell(archive, map, now, qvmRoot)
```

Return `mq3.engine.local_qvm_match.bootConfiguredNamedMode(archive, map, now, qvmRoot, false, "q3dm1", false)` from `engine.local_qvm_match.bootUiShell`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfiguredNamedMode`. |
| `map` | `dynamic` | — | Map passed as `map` to `mq3.engine.local_qvm_match.bootConfiguredNamedMode`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.engine.local_qvm_match.bootConfiguredNamedMode`. |
| `qvmRoot` | `dynamic` | — | Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfiguredNamedMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1577)

<a id="function-function-mq3-engine-local-qvm-match-bootuishellsettings-function-bootuishellsettings-archive-map-now-qvmroot-settings-src-mq3-engine-local-qvm-match-ml-1972640281"></a>
### bootUiShellSettings

```ml
function bootUiShellSettings(archive, map, now, qvmRoot, settings)
```

Return `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings(archive, map, now, qvmRoot, false, "q3dm1", false, settings)` from `engine.local_qvm_match.bootUiShellSettings`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `map` | `dynamic` | — | Map passed as `map` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `qvmRoot` | `dynamic` | — | Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `settings` | `dynamic` | — | Settings passed as `settings` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1584)

<a id="function-function-mq3-engine-local-qvm-match-bootwithbots-function-bootwithbots-archive-map-now-qvmroot-src-mq3-engine-local-qvm-match-ml-2143698944"></a>
### bootWithBots

```ml
function bootWithBots(archive, map, now, qvmRoot)
```

Return `mq3.engine.local_qvm_match.bootConfigured(archive, map, now, qvmRoot, true)` from `engine.local_qvm_match.bootWithBots`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfigured`. |
| `map` | `dynamic` | — | Map passed as `map` to `mq3.engine.local_qvm_match.bootConfigured`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.engine.local_qvm_match.bootConfigured`. |
| `qvmRoot` | `dynamic` | — | Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfigured`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1590)

<a id="function-function-mq3-engine-local-qvm-match-bootwithbotsnamed-function-bootwithbotsnamed-archive-map-mapname-now-qvmroot-src-mq3-engine-local-qvm-match-ml-243510117"></a>
### bootWithBotsNamed

```ml
function bootWithBotsNamed(archive, map, mapName, now, qvmRoot)
```

Return `mq3.engine.local_qvm_match.bootConfiguredNamed(archive, map, now, qvmRoot, true, mapName)` from `engine.local_qvm_match.bootWithBotsNamed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfiguredNamed`. |
| `map` | `dynamic` | — | Map passed as `map` to `mq3.engine.local_qvm_match.bootConfiguredNamed`. |
| `mapName` | `dynamic` | — | Map name passed as `mapName` to `mq3.engine.local_qvm_match.bootConfiguredNamed`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.engine.local_qvm_match.bootConfiguredNamed`. |
| `qvmRoot` | `dynamic` | — | Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfiguredNamed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1597)

<a id="function-function-mq3-engine-local-qvm-match-bootwithqvms-function-bootwithqvms-archive-map-now-qvmroot-src-mq3-engine-local-qvm-match-ml-1141174360"></a>
### bootWithQvms

```ml
function bootWithQvms(archive, map, now, qvmRoot)
```

Return `mq3.engine.local_qvm_match.bootConfigured(archive, map, now, qvmRoot, false)` from `engine.local_qvm_match.bootWithQvms`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfigured`. |
| `map` | `dynamic` | — | Map passed as `map` to `mq3.engine.local_qvm_match.bootConfigured`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.engine.local_qvm_match.bootConfigured`. |
| `qvmRoot` | `dynamic` | — | Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfigured`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1556)

<a id="function-function-mq3-engine-local-qvm-match-bootwithqvmssettings-function-bootwithqvmssettings-archive-map-now-qvmroot-settings-src-mq3-engine-local-qvm-match-ml-1952430347"></a>
### bootWithQvmsSettings

```ml
function bootWithQvmsSettings(archive, map, now, qvmRoot, settings)
```

Return `mq3.engine.local_qvm_match.bootWithQvmsSettingsNamed(archive, map, "q3dm1", now, qvmRoot, settings)` from `engine.local_qvm_match.bootWithQvmsSettings`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.engine.local_qvm_match.bootWithQvmsSettingsNamed`. |
| `map` | `dynamic` | — | Map passed as `map` to `mq3.engine.local_qvm_match.bootWithQvmsSettingsNamed`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.engine.local_qvm_match.bootWithQvmsSettingsNamed`. |
| `qvmRoot` | `dynamic` | — | Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootWithQvmsSettingsNamed`. |
| `settings` | `dynamic` | — | Settings passed as `settings` to `mq3.engine.local_qvm_match.bootWithQvmsSettingsNamed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1571)

<a id="function-function-mq3-engine-local-qvm-match-bootwithqvmssettingsnamed-function-bootwithqvmssettingsnamed-archive-map-mapname-now-qvmroot-settings-src-mq3-engine-local-qvm-match-ml-68362326"></a>
### bootWithQvmsSettingsNamed

```ml
function bootWithQvmsSettingsNamed(archive, map, mapName, now, qvmRoot, settings)
```

Return `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings(archive, map, now, qvmRoot, false, mapName, true, settings)` from `engine.local_qvm_match.bootWithQvmsSettingsNamed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `map` | `dynamic` | — | Map passed as `map` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `mapName` | `dynamic` | — | Map name passed as `mapName` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `qvmRoot` | `dynamic` | — | Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |
| `settings` | `dynamic` | — | Settings passed as `settings` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1564)

<a id="function-function-mq3-engine-local-qvm-match-botcachedirectory-function-botcachedirectory-context-src-mq3-engine-local-qvm-match-ml-505267375"></a>
### botCacheDirectory

```ml
function botCacheDirectory(context)
```

Compute bot cache directory in engine.local_qvm_match; the normal completion returns `fs.joinPath(context.qvmRoot, "maps")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `archive`, `qvmRoot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L718)

<a id="function-function-mq3-engine-local-qvm-match-botcharacterread-function-botcharacterread-context-path-src-mq3-engine-local-qvm-match-ml-1327606166"></a>
### botCharacterRead

```ml
function botCharacterRead(context, path)
```

Compute bot character read in engine.local_qvm_match; the normal completion returns `data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `archive`. |
| `path` | `dynamic` | — | Name passed as `name` to `mq3.format.pk3.read`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L665)

<a id="function-function-mq3-engine-local-qvm-match-botclientcommand-function-botclientcommand-context-client-text-src-mq3-engine-local-qvm-match-ml-1379008527"></a>
### botClientCommand

```ml
function botClientCommand(context, client, text)
```

Update `context.console` in engine.local_qvm_match.

Direct state writes: `context.console`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `console`. Updated in place: `console`. |
| `client` | `dynamic` | — | Client used in `(context.console + [[client, ("bot " + text)]])`. |
| `text` | `dynamic` | — | Text used in `("bot " + text)` and `(context.console + [[client, ("bot " + text)]])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L661)

<a id="function-function-mq3-engine-local-qvm-match-botenable-function-botenable-context-src-mq3-engine-local-qvm-match-ml-132581767"></a>
### botEnable

```ml
function botEnable(context)
```

Compute bot enable in engine.local_qvm_match; the normal completion returns `variable.integer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L681)

<a id="function-function-mq3-engine-local-qvm-match-botlibfloat-function-botlibfloat-context-name-fallback-src-mq3-engine-local-qvm-match-ml-1238094220"></a>
### botlibFloat

```ml
function botlibFloat(context, name, fallback)
```

Compute botlib float in engine.local_qvm_match; the normal completion returns `n.f32(toNumber(value))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `botlib`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.botlib.lifecycle_runtime.varGet`. |
| `fallback` | `dynamic` | — | Value returned unchanged by this function. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L823)

<a id="function-function-mq3-engine-local-qvm-match-botlibloadmap-function-botlibloadmap-context-vm-base-src-mq3-engine-local-qvm-match-ml-603341739"></a>
### botlibLoadMap

```ml
function botlibLoadMap(context, vm, base)
```

Update `context.aas`, `context.aasRouter`, `context.aasRouteCache`, `context.aasCachePath` in engine.local_qvm_match; the normal completion returns `botInterface.BLERR_NOERROR`.

Direct state writes: `context.aas`, `context.aasRouter`, `context.aasRouteCache`, `context.aasCachePath`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `botlib`, `aiVisiblePosition`, `archive`, `aas`, `aasEntities`, `aasRouter`, `aasRouteCache` and further fields. Updated in place: `aas`, `aasRouter`, `aasRouteCache`, `aasCachePath`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L739)

<a id="function-function-mq3-engine-local-qvm-match-botlibtext-function-botlibtext-context-name-fallback-src-mq3-engine-local-qvm-match-ml-34714036"></a>
### botlibText

```ml
function botlibText(context, name, fallback)
```

Compute botlib text in engine.local_qvm_match; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `botlib`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.botlib.lifecycle_runtime.varGet`. |
| `fallback` | `dynamic` | — | Value returned unchanged by this function. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1213)

<a id="function-function-mq3-engine-local-qvm-match-botlibvarget-function-botlibvarget-context-vm-base-src-mq3-engine-local-qvm-match-ml-13759683"></a>
### botlibVarGet

```ml
function botlibVarGet(context, vm, base)
```

Compute botlib var get in engine.local_qvm_match; the normal completion returns `botInterface.BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `botlib`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L695)

<a id="function-function-mq3-engine-local-qvm-match-botlibvarset-function-botlibvarset-context-vm-base-src-mq3-engine-local-qvm-match-ml-76222187"></a>
### botlibVarSet

```ml
function botlibVarSet(context, vm, base)
```

Compute botlib var set in engine.local_qvm_match; the normal completion returns `botInterface.Export_BotLibVarSet(context.botlib, name, value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `botlib`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L686)

<a id="function-function-mq3-engine-local-qvm-match-callvm-function-callvm-machineruntime-slot-args-src-mq3-engine-local-qvm-match-ml-801183644"></a>
### callVm

```ml
function callVm(machineRuntime, slot, args)
```

Return `mq3.vm.runtime.call(machineRuntime, slot, args)` from `engine.local_qvm_match.callVm`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machineRuntime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.vm.runtime.call`. |
| `slot` | `dynamic` | — | Slot passed as `slot` to `mq3.vm.runtime.call`. |
| `args` | `dynamic` | — | Args passed as `args` to `mq3.vm.runtime.call`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L215)

<a id="function-function-mq3-engine-local-qvm-match-capturerenderview-function-capturerenderview-context-vm-address-src-mq3-engine-local-qvm-match-ml-660870890"></a>
### captureRenderView

```ml
function captureRenderView(context, vm, address)
```

Update `context.latestRefdef`, `context.renderViews` in engine.local_qvm_match; the normal completion returns `0`.

Direct state writes: `context.latestRefdef`, `context.renderViews`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `scene`, `renderViews`. Updated in place: `latestRefdef`, `renderViews`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.engine.local_qvm_match.decodeRefdef`. |
| `address` | `dynamic` | — | Address passed as `address` to `mq3.engine.local_qvm_match.decodeRefdef`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2464)

<a id="function-function-mq3-engine-local-qvm-match-captureusersettings-function-captureusersettings-value-src-mq3-engine-local-qvm-match-ml-1701576985"></a>
### captureUserSettings

```ml
function captureUserSettings(value)
```

Compute capture user settings in engine.local_qvm_match; the normal completion returns `UserSettings(savedCvars.toArray(), bindings, userinfos, [])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1351)

<a id="function-function-mq3-engine-local-qvm-match-cgameboxtrace-function-cgameboxtrace-context-vm-base-capsule-transformed-src-mq3-engine-local-qvm-match-ml-2066624661"></a>
### cgameBoxTrace

```ml
function cgameBoxTrace(context, vm, base, capsule, transformed)
```

Update `context.cgameCollisionQueries` in engine.local_qvm_match; the normal completion returns `cgameBoxTraceReference(context, vm, base, capsule, transformed)`.

Direct state writes: `context.cgameCollisionQueries`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameCollisionQueries`, `collisionWorld`. Updated in place: `cgameCollisionQueries`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.collision.world.writeVmTemporaryBoxTrace`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.collision.world.writeVmTemporaryBoxTrace`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.engine.local_qvm_match.cgameBoxTraceReference`. |
| `transformed` | `dynamic` | — | Transformed passed as `transformed` to `mq3.engine.local_qvm_match.cgameBoxTraceReference`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2354)

<a id="function-function-mq3-engine-local-qvm-match-cgameboxtracecached-function-cgameboxtracecached-context-vm-base-capsule-transformed-src-mq3-engine-local-qvm-match-ml-903773633"></a>
### cgameBoxTraceCached

```ml
function cgameBoxTraceCached(context, vm, base, capsule, transformed)
```

Update `context.cgameCollisionQueries` in engine.local_qvm_match.

Direct state writes: `context.cgameCollisionQueries`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameCollisionQueries`, `cgameQueryMemo`. Updated in place: `cgameCollisionQueries`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.cgame_collision_cache.trace`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.cgame_collision_cache.trace`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.vm.cgame_collision_cache.trace`. |
| `transformed` | `dynamic` | — | Transformed passed as `transformed` to `mq3.vm.cgame_collision_cache.trace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2367)

<a id="function-function-mq3-engine-local-qvm-match-cgameboxtracereference-function-cgameboxtracereference-context-vm-base-capsule-transformed-src-mq3-engine-local-qvm-match-ml-1146774447"></a>
### cgameBoxTraceReference

```ml
function cgameBoxTraceReference(context, vm, base, capsule, transformed)
```

Compute cgame box trace reference in engine.local_qvm_match; the normal completion returns `qworld.writeTrace(vm, output, cgameTraceResult(result))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `collisionWorld`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.collision.world.transformedTrace`. |
| `transformed` | `dynamic` | — | Transformed operand used by `cgameBoxTraceReference`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2336)

<a id="function-function-mq3-engine-local-qvm-match-cgamemarkfragments-function-cgamemarkfragments-context-vm-base-src-mq3-engine-local-qvm-match-ml-110443655"></a>
### cgameMarkFragments

```ml
function cgameMarkFragments(context, vm, base)
```

Return `mq3.engine.local_qvm_match.cgameMarkFragmentsReference(context, vm, base)` from `engine.local_qvm_match.cgameMarkFragments`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.cgameMarkFragmentsReference`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.engine.local_qvm_match.cgameMarkFragmentsReference`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.engine.local_qvm_match.cgameMarkFragmentsReference`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2497)

<a id="function-function-mq3-engine-local-qvm-match-cgamemarkfragmentscached-function-cgamemarkfragmentscached-context-vm-base-src-mq3-engine-local-qvm-match-ml-570378819"></a>
### cgameMarkFragmentsCached

```ml
function cgameMarkFragmentsCached(context, vm, base)
```

Compute cgame mark fragments cached in engine.local_qvm_match; the normal completion returns `cgameCollisionCache.markFragments(context.cgameQueryMemo, context, vm, base, cgameMarkFragmentsPrepared)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameQueryMemo`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.engine.local_qvm_match.cgameMarkFragmentsReference`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.engine.local_qvm_match.cgameMarkFragmentsReference`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2502)

<a id="function-function-mq3-engine-local-qvm-match-cgamemarkfragmentsprepared-function-cgamemarkfragmentsprepared-context-vm-base-src-mq3-engine-local-qvm-match-ml-851539507"></a>
### cgameMarkFragmentsPrepared

```ml
function cgameMarkFragmentsPrepared(context, vm, base)
```

Return `mq3.engine.local_qvm_match.writeCgameMarks(context, vm, base, context.markGeometry)` from `engine.local_qvm_match.cgameMarkFragmentsPrepared`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `markGeometry`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.engine.local_qvm_match.writeCgameMarks`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.engine.local_qvm_match.writeCgameMarks`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2476)

<a id="function-function-mq3-engine-local-qvm-match-cgamemarkfragmentsreference-function-cgamemarkfragmentsreference-context-vm-base-src-mq3-engine-local-qvm-match-ml-2119160267"></a>
### cgameMarkFragmentsReference

```ml
function cgameMarkFragmentsReference(context, vm, base)
```

Return `mq3.engine.local_qvm_match.writeCgameMarks(context, vm, base, void)` from `engine.local_qvm_match.cgameMarkFragmentsReference`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.writeCgameMarks`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.engine.local_qvm_match.writeCgameMarks`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.engine.local_qvm_match.writeCgameMarks`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2471)

<a id="function-function-mq3-engine-local-qvm-match-cgamenullablevector-function-cgamenullablevector-vm-base-index-label-src-mq3-engine-local-qvm-match-ml-41087550"></a>
### cgameNullableVector

```ml
function cgameNullableVector(vm, base, index, label)
```

Compute cgame nullable vector in engine.local_qvm_match; the normal completion returns `common.readFloatVector(vm, address, 3, label)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.vm.syscall_common.argument`. |
| `label` | `dynamic` | — | Label passed as `label` to `mq3.vm.syscall_common.readFloatVector`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2320)

<a id="function-function-mq3-engine-local-qvm-match-cgamesensitivity-function-cgamesensitivity-value-src-mq3-engine-local-qvm-match-ml-1466267409"></a>
### cgameSensitivity

```ml
function cgameSensitivity(value)
```

Compute cgame sensitivity in engine.local_qvm_match; the normal completion returns `cgameUsercmd.sensitivity(value.context.cgameUsercmd)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2304)

<a id="function-function-mq3-engine-local-qvm-match-cgameservercommand-function-cgameservercommand-context-number-src-mq3-engine-local-qvm-match-ml-228804768"></a>
### cgameServerCommand

```ml
function cgameServerCommand(context, number)
```

Compute cgame server command in engine.local_qvm_match; the normal completion returns `fetched`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `serverStream`, `cgameServerCommands`, `commandState`, `nativeServerCmds`, `now`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.client.server_command_stream.get`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2270)

<a id="function-function-mq3-engine-local-qvm-match-cgametraceresult-function-cgametraceresult-result-src-mq3-engine-local-qvm-match-ml-1442706097"></a>
### cgameTraceResult

```ml
function cgameTraceResult(result)
```

Apply `mq3.vm.syscall_qagame_world.TraceResult` for cgame trace result in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Record exposing `trace`, `endpos`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2326)

<a id="function-function-mq3-engine-local-qvm-match-cgameusercmdvalue-function-cgameusercmdvalue-value-src-mq3-engine-local-qvm-match-ml-1508790027"></a>
### cgameUserCmdValue

```ml
function cgameUserCmdValue(value)
```

Compute cgame user cmd value in engine.local_qvm_match; the normal completion returns `cgameUsercmd.weapon(value.context.cgameUsercmd)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2301)

<a id="function-function-mq3-engine-local-qvm-match-cgamevector-function-cgamevector-vm-base-index-label-src-mq3-engine-local-qvm-match-ml-1847396348"></a>
### cgameVector

```ml
function cgameVector(vm, base, index, label)
```

Return `mq3.vm.syscall_common.readFloatVector(vm, common.argument(vm, base, index), 3, label)` from `engine.local_qvm_match.cgameVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readFloatVector`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.vm.syscall_common.argument`. |
| `label` | `dynamic` | — | Label passed as `label` to `mq3.vm.syscall_common.readFloatVector`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2314)

<a id="function-function-mq3-engine-local-qvm-match-chatoutputrandom-function-chatoutputrandom-context-src-mq3-engine-local-qvm-match-ml-1306914647"></a>
### chatOutputRandom

```ml
function chatOutputRandom(context)
```

Return `mq3.botlib.ai_goal_selection.randomFloat(context.aiGoalSelection)` from `engine.local_qvm_match.chatOutputRandom`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aiGoalSelection`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L937)

<a id="function-function-mq3-engine-local-qvm-match-clearclient-function-clearclient-context-index-src-mq3-engine-local-qvm-match-ml-1544100829"></a>
### clearClient

```ml
function clearClient(context, index)
```

Compute engine.local_qvm_match.clearClient as `void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `index` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L678)

<a id="function-function-mq3-engine-local-qvm-match-clearconsolecommand-function-clearconsolecommand-commandstate-context-src-mq3-engine-local-qvm-match-ml-1775372043"></a>
### clearConsoleCommand

```ml
function clearConsoleCommand(commandState, context)
```

Clear console command in engine.local_qvm_match; the normal completion returns `clientConsole.Con_Clear_f(runtime)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.syncConsoleRuntime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L358)

<a id="function-function-mq3-engine-local-qvm-match-clearscene-function-clearscene-context-src-mq3-engine-local-qvm-match-ml-1775677323"></a>
### clearScene

```ml
function clearScene(context)
```

Clear scene in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `scene`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2244)

<a id="function-function-mq3-engine-local-qvm-match-clientconsolestate-function-clientconsolestate-value-src-mq3-engine-local-qvm-match-ml-136856505"></a>
### clientConsoleState

```ml
function clientConsoleState(value)
```

Compute client console state in engine.local_qvm_match; the normal completion returns `value.context.clientTextInput.consoleRuntime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2949)

<a id="function-function-mq3-engine-local-qvm-match-clientconsoleview-function-clientconsoleview-value-now-framemsec-version-src-mq3-engine-local-qvm-match-ml-1904545932"></a>
### clientConsoleView

```ml
function clientConsoleView(value, now, frameMsec, version)
```

Compute client console view in engine.local_qvm_match; the normal completion returns `clientConsole.Con_DrawConsole(clientConsoleState(value), 640, 640, 480, version)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.engine.local_qvm_match.updateClientConsole`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.engine.local_qvm_match.updateClientConsole`. |
| `frameMsec` | `dynamic` | — | Frame msec passed as `frameMsec` to `mq3.engine.local_qvm_match.updateClientConsole`. |
| `version` | `dynamic` | — | Version passed as `version` to `mq3.client.cl_console.Con_DrawConsole`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2962)

<a id="function-function-mq3-engine-local-qvm-match-clientgamecommand-function-clientgamecommand-commandstate-src-mq3-engine-local-qvm-match-ml-874618004"></a>
### clientGameCommand

```ml
function clientGameCommand(commandState)
```

qcommon/Cmd_ExecuteString callback chain.  These callbacks deliberately use the already-tokenized shared command state, which is also what trap_Argv and trap_Args read while the QVM export is running.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1628)

<a id="function-function-mq3-engine-local-qvm-match-clientmessageescape-function-clientmessageescape-value-src-mq3-engine-local-qvm-match-ml-526109015"></a>
### clientMessageEscape

```ml
function clientMessageEscape(value)
```

Compute client message escape in engine.local_qvm_match; the normal completion returns `handled`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2932)

<a id="function-function-mq3-engine-local-qvm-match-clienttextchar-function-clienttextchar-value-ch-src-mq3-engine-local-qvm-match-ml-107557400"></a>
### clientTextChar

```ml
function clientTextChar(value, ch)
```

Compute client text char in engine.local_qvm_match; the normal completion returns `handled`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |
| `ch` | `dynamic` | — | Ch passed as `ch` to `mq3.client.console_input.charEvent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2939)

<a id="function-function-mq3-engine-local-qvm-match-clienttextkey-function-clienttextkey-value-key-shift-ctrl-src-mq3-engine-local-qvm-match-ml-218702227"></a>
### clientTextKey

```ml
function clientTextKey(value, key, shift, ctrl)
```

Compute client text key in engine.local_qvm_match; the normal completion returns `handled`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.client.console_input.consoleKey`. |
| `shift` | `dynamic` | — | Shift passed as `shift` to `mq3.client.console_input.consoleKey`. |
| `ctrl` | `dynamic` | — | Ctrl passed as `ctrl` to `mq3.client.console_input.consoleKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2926)

<a id="function-function-mq3-engine-local-qvm-match-clienttextstate-function-clienttextstate-value-src-mq3-engine-local-qvm-match-ml-1079973739"></a>
### clientTextState

```ml
function clientTextState(value)
```

Compute client text state in engine.local_qvm_match; the normal completion returns `value.context.clientTextInput`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2946)

<a id="function-function-mq3-engine-local-qvm-match-clientusercmd-function-clientusercmd-context-number-src-mq3-engine-local-qvm-match-ml-1514128640"></a>
### clientUsercmd

```ml
function clientUsercmd(context, number)
```

Compute client usercmd in engine.local_qvm_match; the normal completion returns `cgameSyscall.BytesResult(true, output)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `usercmdHistory`, `commandNumber`. |
| `number` | `dynamic` | — | Command number passed as `commandNumber` to `mq3.client.command_ring.get`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2286)

<a id="function-function-mq3-engine-local-qvm-match-closefile-function-closefile-context-handle-src-mq3-engine-local-qvm-match-ml-1578851621"></a>
### closeFile

```ml
function closeFile(context, handle)
```

Close file in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `files`. |
| `handle` | `dynamic` | — | Handle used in `(handle > 0)` and `(handle < len(context.files))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L452)

<a id="function-function-mq3-engine-local-qvm-match-commandclearnotify-function-commandclearnotify-context-src-mq3-engine-local-qvm-match-ml-528796023"></a>
### commandClearNotify

```ml
function commandClearNotify(context)
```

Update `context.prints` in engine.local_qvm_match.

Direct state writes: `context.prints`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Updated in place: `prints`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2254)

<a id="function-function-mq3-engine-local-qvm-match-commandclearusercmds-function-commandclearusercmds-context-src-mq3-engine-local-qvm-match-ml-768901575"></a>
### commandClearUsercmds

```ml
function commandClearUsercmds(context)
```

Return `mq3.client.command_ring.clear(context.usercmdHistory)` from `engine.local_qvm_match.commandClearUsercmds`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `usercmdHistory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2257)

<a id="function-function-mq3-engine-local-qvm-match-commandcloseconsole-function-commandcloseconsole-context-src-mq3-engine-local-qvm-match-ml-1591450635"></a>
### commandCloseConsole

```ml
function commandCloseConsole(context)
```

Update `context.uiKeyCatcher` in engine.local_qvm_match.

Direct state writes: `context.uiKeyCatcher`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiKeyCatcher`. Updated in place: `uiKeyCatcher`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2262)

<a id="function-function-mq3-engine-local-qvm-match-commandconfigstring-function-commandconfigstring-context-index-value-src-mq3-engine-local-qvm-match-ml-109333880"></a>
### commandConfigstring

```ml
function commandConfigstring(context, index, value)
```

Compute command configstring in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `configstrings`. |
| `index` | `dynamic` | — | Index used in `(index >= 0)` and `(index < len(context.configstrings))`. |
| `value` | `dynamic` | — | Value operand used by `commandConfigstring`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2249)

<a id="function-function-mq3-engine-local-qvm-match-commandqueueconsole-function-commandqueueconsole-context-text-src-mq3-engine-local-qvm-match-ml-1192343152"></a>
### commandQueueConsole

```ml
function commandQueueConsole(context, text)
```

Return `mq3.qcommon.command_buffer.addText(context.commandState, text)` from `engine.local_qvm_match.commandQueueConsole`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `commandState`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.command_buffer.addText`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2266)

<a id="function-function-mq3-engine-local-qvm-match-configureaasmovement-function-configureaasmovement-context-src-mq3-engine-local-qvm-match-ml-1686499879"></a>
### configureAasMovement

```ml
function configureAasMovement(context)
```

Compute configure aas movement in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aasMovement`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L826)

<a id="function-function-mq3-engine-local-qvm-match-connectlocal-function-connectlocal-value-clientnum-src-mq3-engine-local-qvm-match-ml-1954352468"></a>
### connectLocal

```ml
function connectLocal(value, clientNum)
```

Compute connect local in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`, `game`. |
| `clientNum` | `dynamic` | — | Client num passed as `clientNum` to `mq3.server.game_vm.clientConnect`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1607)

<a id="function-function-mq3-engine-local-qvm-match-consolecommand-function-consolecommand-context-when-text-src-mq3-engine-local-qvm-match-ml-692367342"></a>
### consoleCommand

```ml
function consoleCommand(context, when, text)
```

Update `context.console` in engine.local_qvm_match; the normal completion returns `commands.executeText(context.commandState, when, text)`.

Direct state writes: `context.console`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `console`, `uiLanQueries`, `now`, `commandState`. Updated in place: `console`. |
| `when` | `dynamic` | — | When passed as `when` to `mq3.qcommon.command_buffer.executeText`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.command_buffer.executeText`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L292)

<a id="function-function-mq3-engine-local-qvm-match-consolecrosshairplayer-function-consolecrosshairplayer-context-src-mq3-engine-local-qvm-match-ml-1497602495"></a>
### consoleCrosshairPlayer

```ml
function consoleCrosshairPlayer(context)
```

Return `mq3.client.cgame_main.crosshairPlayer(context.nativeMain)` from `engine.local_qvm_match.consoleCrosshairPlayer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `nativeMain`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L369)

<a id="function-function-mq3-engine-local-qvm-match-consoleinputcommand-function-consoleinputcommand-context-text-src-mq3-engine-local-qvm-match-ml-461989738"></a>
### consoleInputCommand

```ml
function consoleInputCommand(context, text)
```

Return `mq3.qcommon.command_buffer.addText(context.commandState, text)` from `engine.local_qvm_match.consoleInputCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `commandState`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.command_buffer.addText`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L307)

<a id="function-function-mq3-engine-local-qvm-match-consoleinputreliable-function-consoleinputreliable-context-text-src-mq3-engine-local-qvm-match-ml-2129379486"></a>
### consoleInputReliable

```ml
function consoleInputReliable(context, text)
```

Compute console input reliable in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.sendClientCommand`. |
| `text` | `dynamic` | — | Name passed as `name` to `mq3.engine.local_qvm_match.sendClientCommand`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L311)

<a id="function-function-mq3-engine-local-qvm-match-consolelastattacker-function-consolelastattacker-context-src-mq3-engine-local-qvm-match-ml-1590058407"></a>
### consoleLastAttacker

```ml
function consoleLastAttacker(context)
```

Return `mq3.client.cgame_main.lastAttacker(context.nativeMain)` from `engine.local_qvm_match.consoleLastAttacker`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `nativeMain`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L372)

<a id="function-function-mq3-engine-local-qvm-match-consolescroll-function-consolescroll-context-operation-count-src-mq3-engine-local-qvm-match-ml-1297647875"></a>
### consoleScroll

```ml
function consoleScroll(context, operation, count)
```

Test console scroll in engine.local_qvm_match; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.syncConsoleRuntime`. |
| `operation` | `dynamic` | — | Operation used in `(operation == "top")` and `(operation == "pageup")`. |
| `count` | `dynamic` | — | Count used in `(count < 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L324)

<a id="function-function-mq3-engine-local-qvm-match-consolestartdemoloop-function-consolestartdemoloop-context-src-mq3-engine-local-qvm-match-ml-627893551"></a>
### consoleStartDemoLoop

```ml
function consoleStartDemoLoop(context)
```

Return `mq3.qcommon.command_buffer.executeText(context.commandState, commands.EXEC_APPEND, "d1\n")` from `engine.local_qvm_match.consoleStartDemoLoop`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `commandState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L334)

- [mq3.engine.local_qvm_match.Context](Type-mq3-engine-local-qvm-match-context-431375763.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-currentcmdnumber-function-currentcmdnumber-context-src-mq3-engine-local-qvm-match-ml-587439623"></a>
### currentCmdNumber

```ml
function currentCmdNumber(context)
```

Compute engine.local_qvm_match.currentCmdNumber as `context.commandNumber`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `commandNumber`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2282)

<a id="function-function-mq3-engine-local-qvm-match-currentsnapshot-function-currentsnapshot-context-src-mq3-engine-local-qvm-match-ml-1293429613"></a>
### currentSnapshot

```ml
function currentSnapshot(context)
```

Compute current snapshot in engine.local_qvm_match; the normal completion returns `cgameSyscall.SnapshotNumber(context.snapshotNumber, serverTime)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `now`, `latestSnapshot`, `snapshotNumber`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2134)

<a id="function-function-mq3-engine-local-qvm-match-decoderefdef-function-decoderefdef-vm-address-src-mq3-engine-local-qvm-match-ml-2107954831"></a>
### decodeRefdef

```ml
function decodeRefdef(vm, address)
```

Decode refdef in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `address` | `dynamic` | — | Value passed as `value` to `mq3.vm.syscall_common.pointer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2374)

<a id="function-function-mq3-engine-local-qvm-match-desktopfilepath-function-desktopfilepath-root-name-src-mq3-engine-local-qvm-match-ml-803694561"></a>
### desktopFilePath

```ml
function desktopFilePath(root, name)
```

Compute desktop file path in engine.local_qvm_match; the normal completion returns `fs.joinPath(root, relative)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `root` | `dynamic` | — | Root used in `(root == "")` and `fs.joinPath(root, relative)`. |
| `name` | `dynamic` | — | Name used in `typeof(name)` and `(name == "")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L377)

<a id="function-function-mq3-engine-local-qvm-match-drawcgame-function-drawcgame-value-servertime-src-mq3-engine-local-qvm-match-ml-256344661"></a>
### drawCgame

```ml
function drawCgame(value, serverTime)
```

Compute draw cgame in engine.local_qvm_match; the normal completion returns `drawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `cgame`, `context`. |
| `serverTime` | `dynamic` | — | Server time passed as `serverTime` to `mq3.client.cgame_vm.drawActiveFrame`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2715)

<a id="function-function-mq3-engine-local-qvm-match-drawcgameproductive-function-drawcgameproductive-value-servertime-src-mq3-engine-local-qvm-match-ml-1049306615"></a>
### drawCgameProductive

```ml
function drawCgameProductive(value, serverTime)
```

The native cgame mirror above is a differential-audit observer. Running it and rescanning its complete cvar table on every retail-QVM frame contributes no authoritative output. The playable path therefore executes only the original cgame QVM; probes continue to use drawCgame and retain the observer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `cgame`. |
| `serverTime` | `dynamic` | — | Server time passed as `serverTime` to `mq3.engine.local_qvm_match.drawCgameProductiveInFrame`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2727)

<a id="function-function-mq3-engine-local-qvm-match-drawcgameproductiveinframe-function-drawcgameproductiveinframe-value-servertime-src-mq3-engine-local-qvm-match-ml-979713663"></a>
### drawCgameProductiveInFrame

```ml
function drawCgameProductiveInFrame(value, serverTime)
```

Compute draw cgame productive in frame in engine.local_qvm_match; the normal completion returns `drawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `cgame`, `context`. |
| `serverTime` | `dynamic` | — | Server time passed as `serverTime` to `mq3.client.cgame_vm.drawActiveFrame`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2736)

<a id="function-function-mq3-engine-local-qvm-match-dropclient-function-dropclient-context-client-text-src-mq3-engine-local-qvm-match-ml-1799816351"></a>
### dropClient

```ml
function dropClient(context, client, text)
```

Update `context.console` in engine.local_qvm_match.

Direct state writes: `context.console`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `clientStates`, `game`, `userinfos`, `linked`, `botServer`, `console`. Updated in place: `console`. |
| `client` | `dynamic` | — | Client num passed as `clientNum` to `mq3.server.game_vm.clientDisconnect`. |
| `text` | `dynamic` | — | Text used in `("drop " + text)` and `(context.console + [[client, ("drop " + text)]])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L476)

<a id="function-function-mq3-engine-local-qvm-match-dumpconsolecommand-function-dumpconsolecommand-commandstate-context-src-mq3-engine-local-qvm-match-ml-1292129205"></a>
### dumpConsoleCommand

```ml
function dumpConsoleCommand(commandState, context)
```

Compute dump console command in engine.local_qvm_match; the normal completion returns `not (typeof(result) == "error")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.argc`. |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.syncConsoleRuntime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L362)

<a id="function-function-mq3-engine-local-qvm-match-emiterror-function-emiterror-context-text-src-mq3-engine-local-qvm-match-ml-1545631316"></a>
### emitError

```ml
function emitError(context, text)
```

Emit error in engine.local_qvm_match; updates `context.errors`.

Direct state writes: `context.errors`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `errors`. Updated in place: `errors`. |
| `text` | `dynamic` | — | Text used in `(context.errors + [text])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L285)

<a id="function-function-mq3-engine-local-qvm-match-emitprint-function-emitprint-context-text-src-mq3-engine-local-qvm-match-ml-133921438"></a>
### emitPrint

```ml
function emitPrint(context, text)
```

Emit print in engine.local_qvm_match; updates `context.prints`.

Direct state writes: `context.prints`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLanCacheHost`, `prints`, `clientTextInput`, `now`. Updated in place: `prints`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.client.cl_console.CL_ConsolePrint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L270)

<a id="function-function-mq3-engine-local-qvm-match-encodesnapshot-function-encodesnapshot-context-value-output-src-mq3-engine-local-qvm-match-ml-1050993905"></a>
### encodeSnapshot

```ml
function encodeSnapshot(context, value, output)
```

Encode snapshot in engine.local_qvm_match; the normal completion returns `output`.

Direct state writes: `output elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameServerCommands`. |
| `value` | `dynamic` | — | Record exposing `serverTime`, `areaBits`, `playerState`, `entities`. |
| `output` | `dynamic` | — | Mutable sequence written at `(12 + index)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2088)

<a id="function-function-mq3-engine-local-qvm-match-entitiesinbox-function-entitiesinbox-context-mins-maxs-capacity-src-mq3-engine-local-qvm-match-ml-650954407"></a>
### entitiesInBox

```ml
function entitiesInBox(context, mins, maxs, capacity)
```

Return `mq3.server.world.areaEntities(context.spatialScene, mins, maxs, capacity)` from `engine.local_qvm_match.entitiesInBox`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `spatialScene`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.server.world.areaEntities`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.server.world.areaEntities`. |
| `capacity` | `dynamic` | — | Capacity passed as `capacity` to `mq3.server.world.areaEntities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1317)

<a id="function-function-mq3-engine-local-qvm-match-entitycontact-function-entitycontact-context-mins-maxs-entity-capsule-src-mq3-engine-local-qvm-match-ml-928910147"></a>
### entityContact

```ml
function entityContact(context, mins, maxs, entity, capsule)
```

Compute entity contact in engine.local_qvm_match; the normal completion returns `serverWorld.entityContact(context.spatialScene, mins, maxs, index, capsule)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `spatialScene`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.server.world.entityContact`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.server.world.entityContact`. |
| `entity` | `dynamic` | — | Entity passed as `entity` to `mq3.engine.local_qvm_match.entityIndex`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.server.world.entityContact`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1324)

<a id="function-function-mq3-engine-local-qvm-match-entityindex-function-entityindex-context-entity-src-mq3-engine-local-qvm-match-ml-855360328"></a>
### entityIndex

```ml
function entityIndex(context, entity)
```

Compute entity index in engine.local_qvm_match; the normal completion returns `index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `entityStride`, `gameEntities`, `entityCount`. |
| `entity` | `dynamic` | — | Entity used in `(entity < context.gameEntities)` and `(entity - context.gameEntities)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L526)

<a id="function-function-mq3-engine-local-qvm-match-entitystring-function-entitystring-context-src-mq3-engine-local-qvm-match-ml-1613439367"></a>
### entityString

```ml
function entityString(context)
```

Compute engine.local_qvm_match.entityString as `context.entityParser`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `entityParser`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L674)

<a id="function-function-mq3-engine-local-qvm-match-entitytoken-function-entitytoken-context-src-mq3-engine-local-qvm-match-ml-61423423"></a>
### entityToken

```ml
function entityToken(context)
```

Compute entity token in engine.local_qvm_match; the normal completion returns `qagame.TokenResult((token != ""), token)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `entityParser`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L668)

<a id="function-function-mq3-engine-local-qvm-match-executeclientconsole-function-executeclientconsole-value-text-src-mq3-engine-local-qvm-match-ml-69117668"></a>
### executeClientConsole

```ml
function executeClientConsole(value, text)
```

Execute client console in engine.local_qvm_match; the normal completion returns `commands.executeText(value.context.commandState, commands.EXEC_NOW, text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.command_buffer.executeText`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1672)

<a id="function-function-mq3-engine-local-qvm-match-executegameconsole-function-executegameconsole-value-text-src-mq3-engine-local-qvm-match-ml-1522386408"></a>
### executeGameConsole

```ml
function executeGameConsole(value, text)
```

Execute game console in engine.local_qvm_match; the normal completion returns `gameVm.consoleCommand(value.game)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`, `game`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.command_buffer.tokenizeString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1619)

<a id="function-function-mq3-engine-local-qvm-match-extendedcgame-function-extendedcgame-context-vm-base-op-src-mq3-engine-local-qvm-match-ml-1756676450"></a>
### extendedCgame

```ml
function extendedCgame(context, vm, base, op)
```

Update `context.cgameCollisionQueries`, `context.soundCommands`, `context.uiKeyCatcher` in engine.local_qvm_match; the normal completion returns `error(7643, ("local QVM match: unsupported retail cgame trap " + str(op)))`.

Direct state writes: `context.cgameCollisionQueries`, `context.soundCommands`, `context.uiKeyCatcher`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `collisionWorld`, `cgameCollisionQueries`, `soundCommands`, `scene`, `renderQueue`, `uiKeyCatcher`, `rendererEntityTokens` and further fields. Updated in place: `cgameCollisionQueries`, `soundCommands`, `uiKeyCatcher`. |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `op` | `dynamic` | — | Op used in `str(op)` and `(op == 18)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2570)

<a id="function-function-mq3-engine-local-qvm-match-extendedcgamehost-function-extendedcgamehost-context-vm-base-op-src-mq3-engine-local-qvm-match-ml-1827315910"></a>
### extendedCgameHost

```ml
function extendedCgameHost(context, vm, base, op)
```

Compute extended cgame host in engine.local_qvm_match; the normal completion returns `extendedCgame(context, vm, base, op)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameTrapCounts`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.engine.local_qvm_match.cgameBoxTraceCached`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.engine.local_qvm_match.cgameBoxTraceCached`. |
| `op` | `dynamic` | — | Op passed as `op` to `mq3.engine.local_qvm_match.extendedCgame`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2654)

<a id="function-function-mq3-engine-local-qvm-match-extendedqagame-function-extendedqagame-context-vm-base-op-src-mq3-engine-local-qvm-match-ml-882377538"></a>
### extendedQagame

```ml
function extendedQagame(context, vm, base, op)
```

Update `context.lastBotTrap`, `context.aas`, `context.aasRouter`, `context.aasRouteCache` in engine.local_qvm_match; the normal completion returns `error(7643, ("local QVM match: unsupported retail qagame trap " + str(op)))`.

Direct state writes: `context.lastBotTrap`, `context.aas`, `context.aasRouter`, `context.aasRouteCache`, `context.aasCachePath`, `context.aasEntities`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aiMoveRuntime`, `aiVisiblePosition`, `aiLevelItems`, `aiMapGoals`, `aiChatStrings`, `aiChatMatches`, `aiChatOutput` and further fields. Updated in place: `lastBotTrap`, `aas`, `aasRouter`, `aasRouteCache`, `aasCachePath`, `aasEntities`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.engine.local_qvm_match.qagameFileList`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.engine.local_qvm_match.qagameFileList`. |
| `op` | `dynamic` | — | Op passed as `op` to `mq3.botlib.server_imports.SV_BotDispatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1251)

<a id="function-function-mq3-engine-local-qvm-match-extendedui-function-extendedui-context-vm-base-op-src-mq3-engine-local-qvm-match-ml-458952590"></a>
### extendedUi

```ml
function extendedUi(context, vm, base, op)
```

Compute extended ui in engine.local_qvm_match; the normal completion returns `error(7643, ("local QVM match: unsupported retail UI trap " + str(op)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `scene`. |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `op` | `dynamic` | — | Op used in `str(op)` and `(op == 22)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3248)

<a id="function-function-mq3-engine-local-qvm-match-fail-function-fail-message-src-mq3-engine-local-qvm-match-ml-440115659"></a>
### fail

```ml
function fail(message)
```

Create the engine.local_qvm_match error for `fail` with 7640 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("local QVM match: " + message)` and `error(7640, ("local QVM match: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L189)

- [mq3.engine.local_qvm_match.FileCursor](Type-mq3-engine-local-qvm-match-filecursor-2065435908.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-forwardclientcommand-function-forwardclientcommand-commandstate-text-src-mq3-engine-local-qvm-match-ml-45950409"></a>
### forwardClientCommand

```ml
function forwardClientCommand(commandState, text)
```

Test forward client command in engine.local_qvm_match; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Record exposing `context`. |
| `text` | `dynamic` | — | Name passed as `name` to `mq3.engine.local_qvm_match.sendClientCommand`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1665)

<a id="function-function-mq3-engine-local-qvm-match-freebot-function-freebot-context-index-src-mq3-engine-local-qvm-match-ml-1772130699"></a>
### freeBot

```ml
function freeBot(context, index)
```

Update `context.botFrees` in engine.local_qvm_match.

Direct state writes: `context.botFrees`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `clientStates`, `userinfos`, `usercmds`, `now`, `botFrees`, `botServer`, `gameEntities` and further fields. Updated in place: `botFrees`. |
| `index` | `dynamic` | — | Client passed as `client` to `mq3.botlib.server_bridge.resetClient`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L649)

<a id="function-function-mq3-engine-local-qvm-match-freevm-function-freevm-machineruntime-slot-src-mq3-engine-local-qvm-match-ml-1885899123"></a>
### freeVm

```ml
function freeVm(machineRuntime, slot)
```

Return `mq3.vm.runtime.free(machineRuntime, slot)` from `engine.local_qvm_match.freeVm`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machineRuntime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.vm.runtime.free`. |
| `slot` | `dynamic` | — | Slot passed as `slot` to `mq3.vm.runtime.free`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L223)

<a id="function-function-mq3-engine-local-qvm-match-gamemachine-function-gamemachine-context-src-mq3-engine-local-qvm-match-ml-804133277"></a>
### gameMachine

```ml
function gameMachine(context)
```

Compute game machine in engine.local_qvm_match; the normal completion returns `context.machineRuntime.current.machine`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `machineRuntime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L533)

<a id="function-function-mq3-engine-local-qvm-match-gamestatebytes-function-gamestatebytes-context-src-mq3-engine-local-qvm-match-ml-1541280295"></a>
### gameStateBytes

```ml
function gameStateBytes(context)
```

Compute game state bytes in engine.local_qvm_match; the normal completion returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `configstrings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2063)

<a id="function-function-mq3-engine-local-qvm-match-getconfigstring-function-getconfigstring-context-index-src-mq3-engine-local-qvm-match-ml-1464641735"></a>
### getConfigstring

```ml
function getConfigstring(context, index)
```

Get configstring in engine.local_qvm_match; the normal completion returns `context.configstrings[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `configstrings`. |
| `index` | `dynamic` | — | Zero-based index into `context.configstrings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L504)

<a id="function-function-mq3-engine-local-qvm-match-getserverinfo-function-getserverinfo-context-src-mq3-engine-local-qvm-match-ml-725572425"></a>
### getServerinfo

```ml
function getServerinfo(context)
```

Get serverinfo in engine.local_qvm_match; the normal completion returns `cvar.infoString(context.cvars, cvar.SERVERINFO)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `serverStream`, `configstrings`, `cvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L516)

<a id="function-function-mq3-engine-local-qvm-match-getusercmd-function-getusercmd-context-index-src-mq3-engine-local-qvm-match-ml-773685125"></a>
### getUsercmd

```ml
function getUsercmd(context, index)
```

Get usercmd in engine.local_qvm_match; the normal completion returns `context.usercmds[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `usercmds`, `now`. |
| `index` | `dynamic` | — | Zero-based index into `context.usercmds`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1331)

<a id="function-function-mq3-engine-local-qvm-match-getuserinfo-function-getuserinfo-context-index-src-mq3-engine-local-qvm-match-ml-1945770719"></a>
### getUserinfo

```ml
function getUserinfo(context, index)
```

Get userinfo in engine.local_qvm_match; the normal completion returns `context.userinfos[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `userinfos`. |
| `index` | `dynamic` | — | Zero-based index into `context.userinfos`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L508)

<a id="function-function-mq3-engine-local-qvm-match-glconfigbytes-function-glconfigbytes-context-src-mq3-engine-local-qvm-match-ml-1996777791"></a>
### glconfigBytes

```ml
function glconfigBytes(context)
```

Compute glconfig bytes in engine.local_qvm_match; the normal completion returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2077)

<a id="function-function-mq3-engine-local-qvm-match-goalselectionitemquery-function-goalselectionitemquery-context-area-origin-travelflags-src-mq3-engine-local-qvm-match-ml-729227931"></a>
### goalSelectionItemQuery

```ml
function goalSelectionItemQuery(context, area, origin, travelFlags)
```

Return `mq3.botlib.aas_routing_cache.itemQuery(context.aasRouteCache, area, origin, travelFlags)` from `engine.local_qvm_match.goalSelectionItemQuery`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aasRouteCache`. |
| `area` | `dynamic` | — | Area passed as `area` to `mq3.botlib.aas_routing_cache.itemQuery`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.botlib.aas_routing_cache.itemQuery`. |
| `travelFlags` | `dynamic` | — | Flags passed as `flags` to `mq3.botlib.aas_routing_cache.itemQuery`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L952)

<a id="function-function-mq3-engine-local-qvm-match-goalselectiontrace-function-goalselectiontrace-context-start-finish-viewer-contents-src-mq3-engine-local-qvm-match-ml-1873800996"></a>
### goalSelectionTrace

```ml
function goalSelectionTrace(context, start, finish, viewer, contents)
```

Compute goal selection trace in engine.local_qvm_match; the normal completion returns `serverWorld.trace(context.spatialScene, start, finish, zero, zero, viewer, contents, false).trace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `spatialScene`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.server.world.trace`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.server.world.trace`. |
| `viewer` | `dynamic` | — | Pass entity passed as `passEntity` to `mq3.server.world.trace`. |
| `contents` | `dynamic` | — | Mask passed as `mask` to `mq3.server.world.trace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L961)

<a id="function-function-mq3-engine-local-qvm-match-goalselectiontraveltime-function-goalselectiontraveltime-context-area-origin-goalarea-travelflags-src-mq3-engine-local-qvm-match-ml-421463085"></a>
### goalSelectionTravelTime

```ml
function goalSelectionTravelTime(context, area, origin, goalArea, travelFlags)
```

Compute goal selection travel time in engine.local_qvm_match; the normal completion returns `aasRoutingCache.itemTravelTime(context.aasRouteCache, area, origin, goalArea, travelFlags)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aasRouteCache`. |
| `area` | `dynamic` | — | Area num passed as `areaNum` to `mq3.botlib.aas_routing_cache.itemTravelTime`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.botlib.aas_routing_cache.itemTravelTime`. |
| `goalArea` | `dynamic` | — | Goal area num passed as `goalAreaNum` to `mq3.botlib.aas_routing_cache.itemTravelTime`. |
| `travelFlags` | `dynamic` | — | Travel flags passed as `travelFlags` to `mq3.botlib.aas_routing_cache.itemTravelTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L944)

<a id="function-function-mq3-engine-local-qvm-match-goalstatelog-function-goalstatelog-context-text-src-mq3-engine-local-qvm-match-ml-1430711742"></a>
### goalStateLog

```ml
function goalStateLog(context, text)
```

Compute goal state log in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.emitPrint`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.engine.local_qvm_match.emitPrint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L929)

<a id="function-function-mq3-engine-local-qvm-match-goalstatename-function-goalstatename-context-number-src-mq3-engine-local-qvm-match-ml-95324134"></a>
### goalStateName

```ml
function goalStateName(context, number)
```

Return `mq3.botlib.ai_level_items.goalName(context.aiLevelItems, number)` from `engine.local_qvm_match.goalStateName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aiLevelItems`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.botlib.ai_level_items.goalName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L925)

<a id="function-function-mq3-engine-local-qvm-match-goalstateprint-function-goalstateprint-context-level-text-src-mq3-engine-local-qvm-match-ml-1362916070"></a>
### goalStatePrint

```ml
function goalStatePrint(context, level, text)
```

Compute goal state print in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.emitPrint`. |
| `level` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.engine.local_qvm_match.emitPrint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L934)

<a id="function-function-mq3-engine-local-qvm-match-goalstatetime-function-goalstatetime-context-src-mq3-engine-local-qvm-match-ml-1670057989"></a>
### goalStateTime

```ml
function goalStateTime(context)
```

Return `mq3.botlib.aas_runtime.getTime(context.aas)` from `engine.local_qvm_match.goalStateTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aas`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L921)

<a id="function-function-mq3-engine-local-qvm-match-imageloader-function-imageloader-services-path-src-mq3-engine-local-qvm-match-ml-1742200491"></a>
### imageLoader

```ml
function imageLoader(services, path)
```

Compute image loader in engine.local_qvm_match; the normal completion returns `data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Record exposing `context`. |
| `path` | `dynamic` | — | Name passed as `name` to `mq3.format.pk3.findEntry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L194)

<a id="function-function-mq3-engine-local-qvm-match-inpvs-function-inpvs-context-a-b-ignoreportals-src-mq3-engine-local-qvm-match-ml-1399134845"></a>
### inPvs

```ml
function inPvs(context, a, b, ignorePortals)
```

Compute in pvs in engine.local_qvm_match; the normal completion returns `visibility.clusterVisible(context.collisionWorld.visibility, sourceCluster, cluster)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `spatialScene`, `collisionWorld`. |
| `a` | `dynamic` | — | P 1 passed as `p1` to `mq3.server.world.inPVS`. |
| `b` | `dynamic` | — | P 2 passed as `p2` to `mq3.server.world.inPVS`. |
| `ignorePortals` | `dynamic` | — | Ignore portals operand used by `inPvs`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L595)

<a id="function-function-mq3-engine-local-qvm-match-jumppadtarget-function-jumppadtarget-context-name-src-mq3-engine-local-qvm-match-ml-335011986"></a>
### jumpPadTarget

```ml
function jumpPadTarget(context, name)
```

Compute jump pad target in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `botBspEntities`. |
| `name` | `dynamic` | — | Name used in `(name == "")` and `(targetName[1] == name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L837)

<a id="function-function-mq3-engine-local-qvm-match-keybinding-function-keybinding-value-key-src-mq3-engine-local-qvm-match-ml-55130962"></a>
### keyBinding

```ml
function keyBinding(value, key)
```

Compute key binding in engine.local_qvm_match; the normal completion returns `cgameKeys.getBinding(value.context.cgameKeys, key)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.vm.cgame_key_traps.getBinding`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2885)

<a id="function-function-mq3-engine-local-qvm-match-keycatcher-function-keycatcher-value-src-mq3-engine-local-qvm-match-ml-2061816365"></a>
### keyCatcher

```ml
function keyCatcher(value)
```

Compute key catcher in engine.local_qvm_match; the normal completion returns `cgameKeys.getCatcher(value.context.cgameKeys)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2904)

<a id="function-function-mq3-engine-local-qvm-match-keyisdown-function-keyisdown-value-key-src-mq3-engine-local-qvm-match-ml-1446136528"></a>
### keyIsDown

```ml
function keyIsDown(value, key)
```

Compute key is down in engine.local_qvm_match; the normal completion returns `cgameKeys.isDown(value.context.cgameKeys, key)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.vm.cgame_key_traps.isDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2914)

<a id="function-function-mq3-engine-local-qvm-match-lerpmodeltag-function-lerpmodeltag-context-vm-base-src-mq3-engine-local-qvm-match-ml-1449103363"></a>
### lerpModelTag

```ml
function lerpModelTag(context, vm, base)
```

Update `context.cgameTagQueries` in engine.local_qvm_match; the normal completion returns `0`.

Direct state writes: `context.cgameTagQueries`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameTagQueries`. Updated in place: `cgameTagQueries`. |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2438)

<a id="function-function-mq3-engine-local-qvm-match-levelitemplace-function-levelitemplace-context-origin-mins-maxs-floating-src-mq3-engine-local-qvm-match-ml-299943881"></a>
### levelItemPlace

```ml
function levelItemPlace(context, origin, mins, maxs, floating)
```

Compute level item place in engine.local_qvm_match; the normal completion returns `[0, settled]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `spatialScene`, `aas`. |
| `origin` | `dynamic` | — | Point passed as `point` to `mq3.engine.local_qvm_match.pointContents`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.server.world.trace`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.server.world.trace`. |
| `floating` | `dynamic` | — | Floating used in `(floating and ((pointContents(context, origin, - 1) & aasClientMovement.CONTENTS_WATER) == 0))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L882)

<a id="function-function-mq3-engine-local-qvm-match-lightforpoint-function-lightforpoint-context-vm-base-src-mq3-engine-local-qvm-match-ml-474732301"></a>
### lightForPoint

```ml
function lightForPoint(context, vm, base)
```

Compute light for point in engine.local_qvm_match; the normal completion returns `1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `lightGrid`, `scene`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.engine.local_qvm_match.cgameVector`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.engine.local_qvm_match.cgameVector`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2453)

<a id="function-function-mq3-engine-local-qvm-match-linkentity-function-linkentity-context-entity-src-mq3-engine-local-qvm-match-ml-1275015506"></a>
### linkEntity

```ml
function linkEntity(context, entity)
```

Compute link entity in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `spatialScene`. |
| `entity` | `dynamic` | — | Entity passed as `entity` to `mq3.engine.local_qvm_match.entityIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L619)

<a id="function-function-mq3-engine-local-qvm-match-loadbindingconfig-function-loadbindingconfig-value-text-src-mq3-engine-local-qvm-match-ml-1706957758"></a>
### loadBindingConfig

```ml
function loadBindingConfig(value, text)
```

Load binding config in engine.local_qvm_match; the normal completion returns `bindingConfig.loadText(bindingConfig.create(value.context.cgameKeys), value.context.commandState, text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.client.key_bindings_config.loadText`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2901)

<a id="function-function-mq3-engine-local-qvm-match-loadclientvm-function-loadclientvm-machineruntime-name-syscall-interpret-src-mq3-engine-local-qvm-match-ml-967047420"></a>
### loadClientVm

```ml
function loadClientVm(machineRuntime, name, syscall, interpret)
```

Return `mq3.vm.runtime.loadMode(machineRuntime, name, syscall, interpret)` from `engine.local_qvm_match.loadClientVm`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machineRuntime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.vm.runtime.loadMode`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.vm.runtime.loadMode`. |
| `syscall` | `dynamic` | — | Syscall passed as `syscall` to `mq3.vm.runtime.loadMode`. |
| `interpret` | `dynamic` | — | Mode passed as `mode` to `mq3.vm.runtime.loadMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L229)

<a id="function-function-mq3-engine-local-qvm-match-loadvm-function-loadvm-machineruntime-name-syscall-src-mq3-engine-local-qvm-match-ml-2128710009"></a>
### loadVm

```ml
function loadVm(machineRuntime, name, syscall)
```

Return `mq3.vm.runtime.load(machineRuntime, name, syscall)` from `engine.local_qvm_match.loadVm`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machineRuntime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.vm.runtime.load`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.vm.runtime.load`. |
| `syscall` | `dynamic` | — | Syscall passed as `syscall` to `mq3.vm.runtime.load`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L210)

<a id="function-function-mq3-engine-local-qvm-match-loadworld-function-loadworld-context-name-src-mq3-engine-local-qvm-match-ml-454792854"></a>
### loadWorld

```ml
function loadWorld(context, name)
```

Load world in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `rendererEntityTokens`. |
| `name` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2238)

<a id="function-function-mq3-engine-local-qvm-match-locategamedata-function-locategamedata-context-entities-count-entitystride-clients-clientstride-src-mq3-engine-local-qvm-match-ml-814056349"></a>
### locateGameData

```ml
function locateGameData(context, entities, count, entityStride, clients, clientStride)
```

Update `context.gameEntities`, `context.gameClients`, `context.entityCount`, `context.entityStride` in engine.local_qvm_match.

Direct state writes: `context.gameEntities`, `context.gameClients`, `context.entityCount`, `context.entityStride`, `context.clientStride`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Updated in place: `gameEntities`, `gameClients`, `entityCount`, `entityStride`, `clientStride`. |
| `entities` | `dynamic` | — | Entities operand used by `locateGameData`; its reads are shown in the implementation. |
| `count` | `dynamic` | — | Count operand used by `locateGameData`; its reads are shown in the implementation. |
| `entityStride` | `dynamic` | — | Entity stride operand used by `locateGameData`; its reads are shown in the implementation. |
| `clients` | `dynamic` | — | Clients operand used by `locateGameData`; its reads are shown in the implementation. |
| `clientStride` | `dynamic` | — | Client stride operand used by `locateGameData`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L467)

<a id="constant-constant-mq3-engine-local-qvm-match-max-clients-const-max-clients-64-src-mq3-engine-local-qvm-match-ml-288321111"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L149)

<a id="constant-constant-mq3-engine-local-qvm-match-max-configstrings-const-max-configstrings-1024-src-mq3-engine-local-qvm-match-ml-1651310406"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L148)

<a id="function-function-mq3-engine-local-qvm-match-memoryremaining-function-memoryremaining-context-src-mq3-engine-local-qvm-match-ml-225921405"></a>
### memoryRemaining

```ml
function memoryRemaining(context)
```

Compute engine.local_qvm_match.memoryRemaining as `((8 * 1024) * 1024)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2307)

<a id="function-function-mq3-engine-local-qvm-match-messagemode2command-function-messagemode2command-commandstate-context-src-mq3-engine-local-qvm-match-ml-2115037371"></a>
### messageMode2Command

```ml
function messageMode2Command(commandState, context)
```

Test message mode2 command in engine.local_qvm_match; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `context` | `dynamic` | — | Record exposing `clientTextInput`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L346)

<a id="function-function-mq3-engine-local-qvm-match-messagemode3command-function-messagemode3command-commandstate-context-src-mq3-engine-local-qvm-match-ml-1595644193"></a>
### messageMode3Command

```ml
function messageMode3Command(commandState, context)
```

Compute message mode3 command in engine.local_qvm_match; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.syncConsoleRuntime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L350)

<a id="function-function-mq3-engine-local-qvm-match-messagemode4command-function-messagemode4command-commandstate-context-src-mq3-engine-local-qvm-match-ml-1759989851"></a>
### messageMode4Command

```ml
function messageMode4Command(commandState, context)
```

Compute message mode4 command in engine.local_qvm_match; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.syncConsoleRuntime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L354)

<a id="function-function-mq3-engine-local-qvm-match-messagemodecommand-function-messagemodecommand-commandstate-context-src-mq3-engine-local-qvm-match-ml-2112941377"></a>
### messageModeCommand

```ml
function messageModeCommand(commandState, context)
```

Test message mode command in engine.local_qvm_match; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `context` | `dynamic` | — | Record exposing `clientTextInput`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L342)

<a id="function-function-mq3-engine-local-qvm-match-milliseconds-function-milliseconds-context-src-mq3-engine-local-qvm-match-ml-1955536695"></a>
### milliseconds

```ml
function milliseconds(context)
```

Compute engine.local_qvm_match.milliseconds as `context.now`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `now`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L264)

<a id="function-function-mq3-engine-local-qvm-match-moveagainstladder-function-moveagainstladder-context-origin-src-mq3-engine-local-qvm-match-ml-529565289"></a>
### moveAgainstLadder

```ml
function moveAgainstLadder(context, origin)
```

Return `mq3.botlib.aas_sample.againstLadder(context.aas, origin)` from `engine.local_qvm_match.moveAgainstLadder`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aas`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.botlib.aas_sample.againstLadder`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L997)

<a id="function-function-mq3-engine-local-qvm-match-movebarrierjump-function-movebarrierjump-context-state-direction-speed-src-mq3-engine-local-qvm-match-ml-1750704202"></a>
### moveBarrierJump

```ml
function moveBarrierJump(context, state, direction, speed)
```

Test move barrier jump in engine.local_qvm_match; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aasMovement`. |
| `state` | `dynamic` | — | Record exposing `origin`, `entityNum`, `thinkTime`. |
| `direction` | `dynamic` | — | Direction used in `direction[0]` and `direction[1]`. |
| `speed` | `dynamic` | — | Right floating-point operand. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1141)

<a id="function-function-mq3-engine-local-qvm-match-moveblocktrace-function-moveblocktrace-context-state-direction-checkbottom-src-mq3-engine-local-qvm-match-ml-1301637198"></a>
### moveBlockTrace

```ml
function moveBlockTrace(context, state, direction, checkBottom)
```

Compute move block trace in engine.local_qvm_match; the normal completion returns `aiMoveRuntime.GroundTrace(result.trace.startsolid, result.trace.fraction, result.entityNum, result.endpos)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aasMovement`, `spatialScene`. |
| `state` | `dynamic` | — | Record exposing `presenceType`, `origin`, `entityNum`. |
| `direction` | `dynamic` | — | Direction used in `direction[2]` and `direction[0]`. |
| `checkBottom` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1031)

<a id="function-function-mq3-engine-local-qvm-match-moveclienttrace-function-moveclienttrace-context-start-finish-presence-passentity-src-mq3-engine-local-qvm-match-ml-198940815"></a>
### moveClientTrace

```ml
function moveClientTrace(context, start, finish, presence, passEntity)
```

Compute move client trace in engine.local_qvm_match; the normal completion returns `aiMoveRuntime.GroundTrace(result.startsolid, result.fraction, result.ent, result.endpos)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.aasMovementTrace`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.engine.local_qvm_match.aasMovementTrace`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.engine.local_qvm_match.aasMovementTrace`. |
| `presence` | `dynamic` | — | Presence passed as `presence` to `mq3.engine.local_qvm_match.aasMovementTrace`. |
| `passEntity` | `dynamic` | — | Pass entity passed as `passEntity` to `mq3.engine.local_qvm_match.aasMovementTrace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L985)

<a id="function-function-mq3-engine-local-qvm-match-moveelevatorstate-function-moveelevatorstate-context-state-reach-src-mq3-engine-local-qvm-match-ml-542055223"></a>
### moveElevatorState

```ml
function moveElevatorState(context, state, reach)
```

Compute move elevator state in engine.local_qvm_match; the normal completion returns `aiMoveRuntime.ElevatorState(onMover, down, bottom, context.aasMovement.settings.maxbarrier)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `collisionWorld`, `spatialScene`, `aasEntities`, `aasMovement`. |
| `state` | `dynamic` | — | Record exposing `origin`, `entityNum`. |
| `reach` | `dynamic` | — | Record exposing `faceNum`, `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1101)

<a id="function-function-mq3-engine-local-qvm-match-moveentitymodel-function-moveentitymodel-context-entity-src-mq3-engine-local-qvm-match-ml-623848808"></a>
### moveEntityModel

```ml
function moveEntityModel(context, entity)
```

Compute engine.local_qvm_match.moveEntityModel as `aasEntities.info(context.aasEntities, entity).modelindex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aasEntities`. |
| `entity` | `dynamic` | — | Number passed as `number` to `mq3.botlib.aas_entities.info`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1062)

<a id="function-function-mq3-engine-local-qvm-match-movefuncbobstate-function-movefuncbobstate-context-state-reach-src-mq3-engine-local-qvm-match-ml-2095778743"></a>
### moveFuncBobState

```ml
function moveFuncBobState(context, state, reach)
```

Compute move func bob state in engine.local_qvm_match; the normal completion returns `aiMoveRuntime.FuncBobState(onMover, start, finish, origin, bottom, context.aasMovement.settings.maxbarrier)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `collisionWorld`, `spatialScene`, `aasEntities`, `aasMovement`. |
| `state` | `dynamic` | — | Record exposing `origin`, `entityNum`. |
| `reach` | `dynamic` | — | Record exposing `faceNum`, `edgeNum`, `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1120)

<a id="function-function-mq3-engine-local-qvm-match-movegapdistance-function-movegapdistance-context-origin-direction-entitynum-src-mq3-engine-local-qvm-match-ml-350431031"></a>
### moveGapDistance

```ml
function moveGapDistance(context, origin, direction, entityNum)
```

Compute move gap distance in engine.local_qvm_match; the normal completion returns `0.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aasMovement`. |
| `origin` | `dynamic` | — | Start passed as `start` to `mq3.engine.local_qvm_match.aasMovementTrace`. |
| `direction` | `dynamic` | — | Direction used in `direction[0]` and `direction[1]`. |
| `entityNum` | `dynamic` | — | Pass entity passed as `passEntity` to `mq3.engine.local_qvm_match.aasMovementTrace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1003)

<a id="function-function-mq3-engine-local-qvm-match-movegrappleconfig-function-movegrappleconfig-context-src-mq3-engine-local-qvm-match-ml-1551463511"></a>
### moveGrappleConfig

```ml
function moveGrappleConfig(context)
```

Delegate `moveGrappleConfig` to `mq3.botlib.ai_move_runtime.GrappleConfig` and return its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `botlib`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1216)

<a id="function-function-mq3-engine-local-qvm-match-movegrapplestate-function-movegrapplestate-context-state-reach-src-mq3-engine-local-qvm-match-ml-380816871"></a>
### moveGrappleState

```ml
function moveGrappleState(context, state, reach)
```

Compute move grapple state in engine.local_qvm_match; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `botlib`, `aasEntities`. |
| `state` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `reach` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1223)

<a id="function-function-mq3-engine-local-qvm-match-movegrappletrace-function-movegrappletrace-context-eye-target-entitynum-src-mq3-engine-local-qvm-match-ml-1100686500"></a>
### moveGrappleTrace

```ml
function moveGrappleTrace(context, eye, target, entityNum)
```

Compute move grapple trace in engine.local_qvm_match; the normal completion returns `serverWorld.trace(context.spatialScene, eye, target, zero, zero, entityNum, 65537, false).endpos`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `spatialScene`. |
| `eye` | `dynamic` | — | Start passed as `start` to `mq3.server.world.trace`. |
| `target` | `dynamic` | — | Finish passed as `finish` to `mq3.server.world.trace`. |
| `entityNum` | `dynamic` | — | Pass entity passed as `passEntity` to `mq3.server.world.trace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1232)

<a id="function-function-mq3-engine-local-qvm-match-movegravity-function-movegravity-context-src-mq3-engine-local-qvm-match-ml-461993685"></a>
### moveGravity

```ml
function moveGravity(context)
```

Compute engine.local_qvm_match.moveGravity as `context.aasMovement.settings.gravity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aasMovement`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1048)

<a id="function-function-mq3-engine-local-qvm-match-movegroundtrace-function-movegroundtrace-context-start-mins-maxs-finish-client-contents-src-mq3-engine-local-qvm-match-ml-1509971335"></a>
### moveGroundTrace

```ml
function moveGroundTrace(context, start, mins, maxs, finish, client, contents)
```

Compute move ground trace in engine.local_qvm_match; the normal completion returns `aiMoveRuntime.GroundTrace(result.trace.startsolid, result.trace.fraction, result.entityNum, result.endpos)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `spatialScene`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.server.world.trace`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.server.world.trace`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.server.world.trace`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.server.world.trace`. |
| `client` | `dynamic` | — | Pass entity passed as `passEntity` to `mq3.server.world.trace`. |
| `contents` | `dynamic` | — | Mask passed as `mask` to `mq3.server.world.trace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L972)

<a id="function-function-mq3-engine-local-qvm-match-movehorizontalvelocityforjump-function-movehorizontalvelocityforjump-context-zvelocity-start-finish-src-mq3-engine-local-qvm-match-ml-208483177"></a>
### moveHorizontalVelocityForJump

```ml
function moveHorizontalVelocityForJump(context, zVelocity, start, finish)
```

Compute move horizontal velocity for jump in engine.local_qvm_match; the normal completion returns `[true, speed]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aasMovement`. |
| `zVelocity` | `dynamic` | — | Left floating-point operand. |
| `start` | `dynamic` | — | Start used in `start[2]` and `start[0]`. |
| `finish` | `dynamic` | — | Finish used in `finish[2]` and `finish[0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1054)

<a id="function-function-mq3-engine-local-qvm-match-movejumprunstart-function-movejumprunstart-context-state-reach-src-mq3-engine-local-qvm-match-ml-1027010903"></a>
### moveJumpRunStart

```ml
function moveJumpRunStart(context, state, reach)
```

Compute move jump run start in engine.local_qvm_match; the normal completion returns `predicted.endpos`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aasMovement`. |
| `state` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `reach` | `dynamic` | — | Record exposing `start`, `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1041)

<a id="function-function-mq3-engine-local-qvm-match-movemodelreachability-function-movemodelreachability-context-model-src-mq3-engine-local-qvm-match-ml-678885428"></a>
### moveModelReachability

```ml
function moveModelReachability(context, model)
```

Compute move model reachability in engine.local_qvm_match; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aasRouter`. |
| `model` | `dynamic` | — | Model used in `(reach.faceNum == model)` and `((reach.faceNum & 65535) == model)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1082)

<a id="function-function-mq3-engine-local-qvm-match-movemodeltype-function-movemodeltype-context-model-src-mq3-engine-local-qvm-match-ml-969456706"></a>
### moveModelType

```ml
function moveModelType(context, model)
```

Compute move model type in engine.local_qvm_match; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `botBspEntities`. |
| `model` | `dynamic` | — | Model used in `str(model)` and `(model <= 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1066)

<a id="function-function-mq3-engine-local-qvm-match-movemoverinfo-function-movemoverinfo-context-model-src-mq3-engine-local-qvm-match-ml-1725431362"></a>
### moveMoverInfo

```ml
function moveMoverInfo(context, model)
```

Compute move mover info in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aasEntities`. |
| `model` | `dynamic` | — | Model used in `(info.modelindex == model)` and `(info.valid and (info.modelindex == model))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1093)

<a id="function-function-mq3-engine-local-qvm-match-moveonground-function-moveonground-context-origin-presence-passentity-src-mq3-engine-local-qvm-match-ml-2077500068"></a>
### moveOnGround

```ml
function moveOnGround(context, origin, presence, passEntity)
```

Return `mq3.botlib.aas_client_movement.onGround(context.aasMovement, origin, presence, passEntity, context.aasMovement.settings.maxsteepness)` from `engine.local_qvm_match.moveOnGround`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aasMovement`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.botlib.aas_client_movement.onGround`. |
| `presence` | `dynamic` | — | Presence passed as `presence` to `mq3.botlib.aas_client_movement.onGround`. |
| `passEntity` | `dynamic` | — | Pass entity passed as `passEntity` to `mq3.botlib.aas_client_movement.onGround`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L993)

<a id="function-function-mq3-engine-local-qvm-match-moveroutereachability-function-moveroutereachability-context-area-origin-goalarea-travelflags-src-mq3-engine-local-qvm-match-ml-1797848199"></a>
### moveRouteReachability

```ml
function moveRouteReachability(context, area, origin, goalArea, travelFlags)
```

Compute move route reachability in engine.local_qvm_match; the normal completion returns `aasRoutingCache.areaReachabilityToGoalArea(context.aasRouteCache, area, origin, goalArea, travelFlags)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aasRouteCache`. |
| `area` | `dynamic` | — | Area num passed as `areaNum` to `mq3.botlib.aas_routing_cache.areaReachabilityToGoalArea`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.botlib.aas_routing_cache.areaReachabilityToGoalArea`. |
| `goalArea` | `dynamic` | — | Goal area num passed as `goalAreaNum` to `mq3.botlib.aas_routing_cache.areaReachabilityToGoalArea`. |
| `travelFlags` | `dynamic` | — | Travel flags passed as `travelFlags` to `mq3.botlib.aas_routing_cache.areaReachabilityToGoalArea`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1194)

<a id="function-function-mq3-engine-local-qvm-match-moveroutetraveltime-function-moveroutetraveltime-context-area-origin-goalarea-travelflags-src-mq3-engine-local-qvm-match-ml-599602779"></a>
### moveRouteTravelTime

```ml
function moveRouteTravelTime(context, area, origin, goalArea, travelFlags)
```

Return `mq3.botlib.aas_routing_cache.weightedTravelTime(context.aasRouteCache, area, origin, goalArea, travelFlags)` from `engine.local_qvm_match.moveRouteTravelTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aasRouteCache`. |
| `area` | `dynamic` | — | Area num passed as `areaNum` to `mq3.botlib.aas_routing_cache.weightedTravelTime`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.botlib.aas_routing_cache.weightedTravelTime`. |
| `goalArea` | `dynamic` | — | Goal area num passed as `goalAreaNum` to `mq3.botlib.aas_routing_cache.weightedTravelTime`. |
| `travelFlags` | `dynamic` | — | Travel flags passed as `travelFlags` to `mq3.botlib.aas_routing_cache.weightedTravelTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1203)

<a id="function-function-mq3-engine-local-qvm-match-movesignedrandom-function-movesignedrandom-context-src-mq3-engine-local-qvm-match-ml-1301812439"></a>
### moveSignedRandom

```ml
function moveSignedRandom(context)
```

Return `mq3.compat.numeric.fsub(n.fmul(2.0, aiGoalSelection.randomFloat(context.aiGoalSelection)), 1.0)` from `engine.local_qvm_match.moveSignedRandom`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aiGoalSelection`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1208)

<a id="function-function-mq3-engine-local-qvm-match-moveswimming-function-moveswimming-context-origin-src-mq3-engine-local-qvm-match-ml-758884141"></a>
### moveSwimming

```ml
function moveSwimming(context, origin)
```

Return `mq3.botlib.aas_movement_queries.swimming(context, aasPointContents, origin)` from `engine.local_qvm_match.moveSwimming`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.botlib.aas_movement_queries.swimming`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.botlib.aas_movement_queries.swimming`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L978)

<a id="function-function-mq3-engine-local-qvm-match-movewalkdirection-function-movewalkdirection-context-state-direction-speed-type-src-mq3-engine-local-qvm-match-ml-1945047140"></a>
### moveWalkDirection

```ml
function moveWalkDirection(context, state, direction, speed, type)
```

Update `state.moveFlags` in engine.local_qvm_match; the normal completion returns `aiMoveRuntime.emitMovement(movement, state, horizontal, speed)`.

Direct state writes: `state.moveFlags`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aiMoveRuntime`, `aasMovement`. |
| `state` | `dynamic` | — | Record exposing `moveFlags`, `origin`, `entityNum`, `velocity`, `thinkTime`. Updated in place: `moveFlags`. |
| `direction` | `dynamic` | — | Direction used in `direction[0]` and `direction[1]`. |
| `speed` | `dynamic` | — | Speed passed as `speed` to `mq3.engine.local_qvm_match.moveBarrierJump`. |
| `type` | `dynamic` | — | Type used in `(type & aiMoveRuntime.MOVE_JUMP)` and `(type & aiMoveRuntime.MOVE_CROUCH)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1155)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictioncommands-function-nativepredictioncommands-context-src-mq3-engine-local-qvm-match-ml-1374941635"></a>
### nativePredictionCommands

```ml
function nativePredictionCommands(context)
```

Compute native prediction commands in engine.local_qvm_match; the normal completion returns `result.toArray()`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `commandNumber`, `usercmdHistory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1859)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictionentitypoint-function-nativepredictionentitypoint-host-value-point-src-mq3-engine-local-qvm-match-ml-516348009"></a>
### nativePredictionEntityPoint

```ml
function nativePredictionEntityPoint(host, value, point)
```

Compute native prediction entity point in engine.local_qvm_match; the normal completion returns `collision.transformedPointContents(host.context.collisionWorld, point, ent.modelindex, ent.origin, ent.angles)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `value` | `dynamic` | — | Record exposing `state`. |
| `point` | `dynamic` | — | Point passed as `point` to `mq3.collision.world.transformedPointContents`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1835)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictionentitytrace-function-nativepredictionentitytrace-host-value-start-mins-maxs-finish-mask-src-mq3-engine-local-qvm-match-ml-1840573042"></a>
### nativePredictionEntityTrace

```ml
function nativePredictionEntityTrace(host, value, start, mins, maxs, finish, mask)
```

Compute native prediction entity trace in engine.local_qvm_match; the normal completion returns `nativePredictionResult(result, ent.number)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `value` | `dynamic` | — | Record exposing `state`, `lerpOrigin`, `lerpAngles`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.collision.world.transformedTrace`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.world.transformedTrace`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.world.transformedTrace`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.collision.world.transformedTrace`. |
| `mask` | `dynamic` | — | Mask passed as `mask` to `mq3.collision.world.transformedTrace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1821)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictionmover-function-nativepredictionmover-host-origin-ground-fromtime-totime-src-mq3-engine-local-qvm-match-ml-672250450"></a>
### nativePredictionMover

```ml
function nativePredictionMover(host, origin, ground, fromTime, toTime)
```

Compute engine.local_qvm_match.nativePredictionMover as `[origin[0], origin[1], origin[2]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `origin` | `dynamic` | — | Origin used in `origin[0]` and `origin[1]`. |
| `ground` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `fromTime` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `toTime` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1851)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictionresult-function-nativepredictionresult-result-entitynum-src-mq3-engine-local-qvm-match-ml-185078944"></a>
### nativePredictionResult

```ml
function nativePredictionResult(result, entityNum)
```

Return `mq3.game.movement.Collision(result.trace, result.endpos, entityNum)` from `engine.local_qvm_match.nativePredictionResult`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Record exposing `trace`, `endpos`. |
| `entityNum` | `dynamic` | — | Initial `entityNum` field stored in the returned or constructed `mq3.game.movement.Collision` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1802)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictionservices-function-nativepredictionservices-context-src-mq3-engine-local-qvm-match-ml-2124931471"></a>
### nativePredictionServices

```ml
function nativePredictionServices(context)
```

Compute native prediction services in engine.local_qvm_match; the normal completion returns `host`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.client.cgame_predict.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1854)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictiontriggertouch-function-nativepredictiontriggertouch-host-value-origin-mins-maxs-src-mq3-engine-local-qvm-match-ml-1601793763"></a>
### nativePredictionTriggerTouch

```ml
function nativePredictionTriggerTouch(host, value, origin, mins, maxs)
```

Compute native prediction trigger touch in engine.local_qvm_match; the normal completion returns `result.trace.startsolid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `value` | `dynamic` | — | Record exposing `state`. |
| `origin` | `dynamic` | — | Start passed as `start` to `mq3.collision.world.boxTrace`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.world.boxTrace`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.world.boxTrace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1842)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictionworldpoint-function-nativepredictionworldpoint-host-point-src-mq3-engine-local-qvm-match-ml-96913658"></a>
### nativePredictionWorldPoint

```ml
function nativePredictionWorldPoint(host, point)
```

Return `mq3.collision.world.pointContents(host.context.collisionWorld, point, 0)` from `engine.local_qvm_match.nativePredictionWorldPoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `point` | `dynamic` | — | Point passed as `point` to `mq3.collision.world.pointContents`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1830)

<a id="function-function-mq3-engine-local-qvm-match-nativepredictionworldtrace-function-nativepredictionworldtrace-host-start-mins-maxs-finish-mask-src-mq3-engine-local-qvm-match-ml-1372553475"></a>
### nativePredictionWorldTrace

```ml
function nativePredictionWorldTrace(host, start, mins, maxs, finish, mask)
```

Compute native prediction world trace in engine.local_qvm_match; the normal completion returns `nativePredictionResult(value, entityNum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.collision.world.boxTrace`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.world.boxTrace`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.world.boxTrace`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.collision.world.boxTrace`. |
| `mask` | `dynamic` | — | Mask passed as `mask` to `mq3.collision.world.boxTrace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1810)

<a id="function-function-mq3-engine-local-qvm-match-observenativeeffects-function-observenativeeffects-context-renderstart-hudstart-retailactive-src-mq3-engine-local-qvm-match-ml-1025155027"></a>
### observeNativeEffects

```ml
function observeNativeEffects(context, renderStart, hudStart, retailActive)
```

Feed the native cg_effects mirror from the semantic event stream.  These calls execute the original parameter and lifetime logic but remain non-dispatching while cgame.qvm owns presentation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `nativeEffects`, `now`, `nativeEvents`, `nativeParticles`, `nativeMarks`. |
| `renderStart` | `dynamic` | — | Render start used in `(renderStart < len(context.nativeEvents.render))`. |
| `hudStart` | `dynamic` | — | Hud start used in `(hudStart < len(context.nativeEvents.hud))`. |
| `retailActive` | `dynamic` | — | Retail active passed as `retailActive` to `mq3.client.cgame_effects.spawnEffect`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1870)

<a id="function-function-mq3-engine-local-qvm-match-observenativeweapons-function-observenativeweapons-context-renderstart-retailactive-ps-src-mq3-engine-local-qvm-match-ml-1376903713"></a>
### observeNativeWeapons

```ml
function observeNativeWeapons(context, renderStart, retailActive, ps)
```

Run weapon side effects from the same decoded event records.  The native mirror resolves media, traces and impact decisions while retail cgame.qvm remains the only dispatcher.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `nativeWeapons`, `now`, `nativeEvents`, `latestSnapshot`. |
| `renderStart` | `dynamic` | — | Render start used in `(renderStart < len(context.nativeEvents.render))`. |
| `retailActive` | `dynamic` | — | Retail active passed as `retailActive` to `mq3.client.cgame_weapons.fireWeapon`. |
| `ps` | `dynamic` | — | Record exposing `stats`, `ammo`, `weapon`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1901)

<a id="function-function-mq3-engine-local-qvm-match-openfile-function-openfile-context-name-mode-src-mq3-engine-local-qvm-match-ml-1982578695"></a>
### openFile

```ml
function openFile(context, name, mode)
```

Open file in engine.local_qvm_match; the normal completion returns `common.OpenResult(handle, len(data))`.

Direct state writes: `context.files`, `context.nextFile`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `archive`, `serverStream`, `uiLanCacheHost`, `files`, `nextFile`. Updated in place: `files`, `nextFile`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.format.pk3.read`. |
| `mode` | `dynamic` | — | Mode used in `(mode < 1)` and `(mode > 3)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L394)

<a id="function-function-mq3-engine-local-qvm-match-pcadddefine-function-pcadddefine-context-vm-base-src-mq3-engine-local-qvm-match-ml-280882925"></a>
### pcAddDefine

```ml
function pcAddDefine(context, vm, base)
```

Return `mq3.botlib.be_interface.PC_AddGlobalDefine(context.pcRegistry, common.readString(vm, common.argument(vm, base, 1)))` from `engine.local_qvm_match.pcAddDefine`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `pcRegistry`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2521)

<a id="function-function-mq3-engine-local-qvm-match-pcfreesource-function-pcfreesource-context-vm-base-src-mq3-engine-local-qvm-match-ml-1877721907"></a>
### pcFreeSource

```ml
function pcFreeSource(context, vm, base)
```

Return `mq3.botlib.be_interface.PC_FreeSourceHandle(context.pcRegistry, common.argument(vm, base, 1))` from `engine.local_qvm_match.pcFreeSource`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `pcRegistry`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2531)

<a id="function-function-mq3-engine-local-qvm-match-pcload-function-pcload-context-name-src-mq3-engine-local-qvm-match-ml-55216186"></a>
### pcLoad

```ml
function pcLoad(context, name)
```

Compute pc load in engine.local_qvm_match; the normal completion returns `data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `archive`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.format.pk3.read`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L456)

<a id="function-function-mq3-engine-local-qvm-match-pcloadsource-function-pcloadsource-context-vm-base-src-mq3-engine-local-qvm-match-ml-2020522047"></a>
### pcLoadSource

```ml
function pcLoadSource(context, vm, base)
```

Return `mq3.botlib.be_interface.PC_LoadSourceHandle(context.pcRegistry, common.readString(vm, common.argument(vm, base, 1)))` from `engine.local_qvm_match.pcLoadSource`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `pcRegistry`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2526)

<a id="function-function-mq3-engine-local-qvm-match-pcreadtoken-function-pcreadtoken-context-vm-base-src-mq3-engine-local-qvm-match-ml-630226163"></a>
### pcReadToken

```ml
function pcReadToken(context, vm, base)
```

Compute pc read token in engine.local_qvm_match; the normal completion returns `1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `pcRegistry`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2536)

<a id="function-function-mq3-engine-local-qvm-match-pcsourceline-function-pcsourceline-context-vm-base-src-mq3-engine-local-qvm-match-ml-1917035147"></a>
### pcSourceLine

```ml
function pcSourceLine(context, vm, base)
```

Compute pc source line in engine.local_qvm_match; the normal completion returns `1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `pcRegistry`. |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2544)

<a id="function-function-mq3-engine-local-qvm-match-pointcontents-function-pointcontents-context-point-passentity-src-mq3-engine-local-qvm-match-ml-86696553"></a>
### pointContents

```ml
function pointContents(context, point, passEntity)
```

Return `mq3.server.world.pointContents(context.spatialScene, point, passEntity)` from `engine.local_qvm_match.pointContents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `spatialScene`. |
| `point` | `dynamic` | — | Point passed as `point` to `mq3.server.world.pointContents`. |
| `passEntity` | `dynamic` | — | Pass entity passed as `passEntity` to `mq3.server.world.pointContents`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1311)

<a id="function-function-mq3-engine-local-qvm-match-predictvisibletrace-function-predictvisibletrace-context-start-finish-passentity-contents-src-mq3-engine-local-qvm-match-ml-1550091172"></a>
### predictVisibleTrace

```ml
function predictVisibleTrace(context, start, finish, passEntity, contents)
```

Compute predict visible trace in engine.local_qvm_match; the normal completion returns `serverWorld.trace(context.spatialScene, start, finish, zero, zero, passEntity, contents, false).trace.fraction`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `spatialScene`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.server.world.trace`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.server.world.trace`. |
| `passEntity` | `dynamic` | — | Pass entity passed as `passEntity` to `mq3.server.world.trace`. |
| `contents` | `dynamic` | — | Mask passed as `mask` to `mq3.server.world.trace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1241)

<a id="function-function-mq3-engine-local-qvm-match-publishbotsnapshots-function-publishbotsnapshots-value-src-mq3-engine-local-qvm-match-ml-739252831"></a>
### publishBotSnapshots

```ml
function publishBotSnapshots(value)
```

Compute publish bot snapshots in engine.local_qvm_match; the normal completion returns `publishBotSnapshotsPrepared(value, input)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `game`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2027)

<a id="function-function-mq3-engine-local-qvm-match-publishbotsnapshotsprepared-function-publishbotsnapshotsprepared-value-input-src-mq3-engine-local-qvm-match-ml-1073173251"></a>
### publishBotSnapshotsPrepared

```ml
function publishBotSnapshotsPrepared(value, input)
```

Compute publish bot snapshots prepared in engine.local_qvm_match; the normal completion returns `published`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`, `game`. |
| `input` | `dynamic` | — | Record exposing `world`, `host`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2038)

<a id="function-function-mq3-engine-local-qvm-match-qagamefilelist-function-qagamefilelist-context-vm-base-src-mq3-engine-local-qvm-match-ml-1145772491"></a>
### qagameFileList

```ml
function qagameFileList(context, vm, base)
```

Compute qagame file list in engine.local_qvm_match; the normal completion returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.uiFileList`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L703)

<a id="function-function-mq3-engine-local-qvm-match-qagamerealtime-function-qagamerealtime-context-src-mq3-engine-local-qvm-match-ml-1958816979"></a>
### qagameRealTime

```ml
function qagameRealTime(context)
```

Return `mq3.vm.cgame_misc_traps.sampleRealTime()` from `engine.local_qvm_match.qagameRealTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1409)

<a id="function-function-mq3-engine-local-qvm-match-qagameseek-function-qagameseek-context-handle-offset-origin-src-mq3-engine-local-qvm-match-ml-262310994"></a>
### qagameSeek

```ml
function qagameSeek(context, handle, offset, origin)
```

Return `mq3.qcommon.memory_file_seek.seek(context.files, handle, offset, origin)` from `engine.local_qvm_match.qagameSeek`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `files`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.qcommon.memory_file_seek.seek`. |
| `offset` | `dynamic` | — | Offset passed as `offset` to `mq3.qcommon.memory_file_seek.seek`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.qcommon.memory_file_seek.seek`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1417)

<a id="function-function-mq3-engine-local-qvm-match-queueinputcommand-function-queueinputcommand-value-text-src-mq3-engine-local-qvm-match-ml-1578977576"></a>
### queueInputCommand

```ml
function queueInputCommand(value, text)
```

Queue input command in engine.local_qvm_match; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.command_buffer.addText`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2894)

<a id="constant-constant-mq3-engine-local-qvm-match-r-absmax-const-r-absmax-476-src-mq3-engine-local-qvm-match-ml-1217611740"></a>
### R_ABSMAX

```ml
const R_ABSMAX = 476
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L162)

<a id="constant-constant-mq3-engine-local-qvm-match-r-absmin-const-r-absmin-464-src-mq3-engine-local-qvm-match-ml-797543911"></a>
### R_ABSMIN

```ml
const R_ABSMIN = 464
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L161)

<a id="constant-constant-mq3-engine-local-qvm-match-r-bmodel-const-r-bmodel-432-src-mq3-engine-local-qvm-match-ml-1349772606"></a>
### R_BMODEL

```ml
const R_BMODEL = 432
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L157)

<a id="constant-constant-mq3-engine-local-qvm-match-r-contents-const-r-contents-460-src-mq3-engine-local-qvm-match-ml-1403037075"></a>
### R_CONTENTS

```ml
const R_CONTENTS = 460
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L160)

<a id="constant-constant-mq3-engine-local-qvm-match-r-currentangles-const-r-currentangles-500-src-mq3-engine-local-qvm-match-ml-66871386"></a>
### R_CURRENTANGLES

```ml
const R_CURRENTANGLES = 500
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L164)

<a id="constant-constant-mq3-engine-local-qvm-match-r-currentorigin-const-r-currentorigin-488-src-mq3-engine-local-qvm-match-ml-1746609945"></a>
### R_CURRENTORIGIN

```ml
const R_CURRENTORIGIN = 488
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L163)

<a id="constant-constant-mq3-engine-local-qvm-match-r-linkcount-const-r-linkcount-420-src-mq3-engine-local-qvm-match-ml-1788208971"></a>
### R_LINKCOUNT

```ml
const R_LINKCOUNT = 420
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L154)

<a id="constant-constant-mq3-engine-local-qvm-match-r-linked-const-r-linked-416-src-mq3-engine-local-qvm-match-ml-2077103600"></a>
### R_LINKED

```ml
const R_LINKED = 416
```

The pinned 1.32b g_public.h intentionally embeds entityState_t at the start of entityShared_t. gentity_t consequently contains s followed by r.s and the engine-owned shared fields below. These are QVM byte offsets, not host layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L153)

<a id="constant-constant-mq3-engine-local-qvm-match-r-maxs-const-r-maxs-448-src-mq3-engine-local-qvm-match-ml-2042709915"></a>
### R_MAXS

```ml
const R_MAXS = 448
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L159)

<a id="constant-constant-mq3-engine-local-qvm-match-r-mins-const-r-mins-436-src-mq3-engine-local-qvm-match-ml-2056096262"></a>
### R_MINS

```ml
const R_MINS = 436
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L158)

<a id="constant-constant-mq3-engine-local-qvm-match-r-ownernum-const-r-ownernum-512-src-mq3-engine-local-qvm-match-ml-1093719155"></a>
### R_OWNERNUM

```ml
const R_OWNERNUM = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L165)

<a id="constant-constant-mq3-engine-local-qvm-match-r-singleclient-const-r-singleclient-428-src-mq3-engine-local-qvm-match-ml-1036301873"></a>
### R_SINGLECLIENT

```ml
const R_SINGLECLIENT = 428
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L156)

<a id="constant-constant-mq3-engine-local-qvm-match-r-svflags-const-r-svflags-424-src-mq3-engine-local-qvm-match-ml-467328867"></a>
### R_SVFLAGS

```ml
const R_SVFLAGS = 424
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L155)

<a id="function-function-mq3-engine-local-qvm-match-readfile-function-readfile-context-handle-count-src-mq3-engine-local-qvm-match-ml-167213814"></a>
### readFile

```ml
function readFile(context, handle, count)
```

Read file in engine.local_qvm_match; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `files`. |
| `handle` | `dynamic` | — | Zero-based index into `context.files`. |
| `count` | `dynamic` | — | Count used in `(count < 0)` and `(count > available)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L434)

<a id="function-function-mq3-engine-local-qvm-match-readloadedaas-function-readloadedaas-host-name-src-mq3-engine-local-qvm-match-ml-1619772469"></a>
### readLoadedAas

```ml
function readLoadedAas(host, name)
```

Compute engine.local_qvm_match.readLoadedAas as `host[0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host used in `host[0]`. |
| `name` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L715)

<a id="function-function-mq3-engine-local-qvm-match-readvector-function-readvector-data-at-src-mq3-engine-local-qvm-match-ml-1219529373"></a>
### readVector

```ml
function readVector(data, at)
```

Compute engine.local_qvm_match.readVector as `[n.bitsFloat(n.readI32(data, at)), n.bitsFloat(n.readI32(data, (at + 4))), n.bitsFloat(n.readI32(data, (at + 8)))]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.compat.numeric.readI32`. |
| `at` | `dynamic` | — | Offset passed as `offset` to `mq3.compat.numeric.readI32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L540)

<a id="function-function-mq3-engine-local-qvm-match-recordlocalusercmd-function-recordlocalusercmd-context-clientnum-command-src-mq3-engine-local-qvm-match-ml-563564517"></a>
### recordLocalUsercmd

```ml
function recordLocalUsercmd(context, clientNum, command)
```

Update `context.commandNumber` in engine.local_qvm_match.

Direct state writes: `context.commandNumber`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `usercmds`, `commandNumber`, `usercmdHistory`. Updated in place: `commandNumber`. |
| `clientNum` | `dynamic` | — | Client num used in `(clientNum < 0)` and `(clientNum == 0)`. |
| `command` | `dynamic` | — | Command passed as `command` to `mq3.client.command_ring.store`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1683)

- [mq3.engine.local_qvm_match.Refdef](Type-mq3-engine-local-qvm-match-refdef-2029122708.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-refreshserverstream-function-refreshserverstream-value-now-src-mq3-engine-local-qvm-match-ml-900506955"></a>
### refreshServerStream

```ml
function refreshServerStream(value, now)
```

Test refresh server stream in engine.local_qvm_match; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |
| `now` | `dynamic` | — | Now operand used by `refreshServerStream`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2747)

<a id="function-function-mq3-engine-local-qvm-match-refreshui-function-refreshui-value-time-src-mq3-engine-local-qvm-match-ml-1895122644"></a>
### refreshUi

```ml
function refreshUi(value, time)
```

Compute refresh ui in engine.local_qvm_match; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `ui`, `context`. |
| `time` | `dynamic` | — | Value passed as `value` to `mq3.client.ui_lan_queries.setRealtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3294)

<a id="function-function-mq3-engine-local-qvm-match-registerasset-function-registerasset-context-name-src-mq3-engine-local-qvm-match-ml-377597408"></a>
### registerAsset

```ml
function registerAsset(context, name)
```

Return `mq3.engine.local_qvm_match.registerTypedAsset(context, "asset", name)` from `engine.local_qvm_match.registerAsset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.registerTypedAsset`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.engine.local_qvm_match.registerTypedAsset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2162)

<a id="function-function-mq3-engine-local-qvm-match-registermodel-function-registermodel-context-name-src-mq3-engine-local-qvm-match-ml-1308069742"></a>
### registerModel

```ml
function registerModel(context, name)
```

Register model in engine.local_qvm_match; the normal completion returns `handle`.

Direct state writes: `context.modelAssets`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `collisionWorld`, `markMap`, `archive`, `modelAssets`, `assets`. Updated in place: `modelAssets`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.engine.local_qvm_match.typedAssetHandle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2168)

<a id="function-function-mq3-engine-local-qvm-match-registerqvmfont-function-registerqvmfont-context-vm-base-src-mq3-engine-local-qvm-match-ml-245636643"></a>
### registerQvmFont

```ml
function registerQvmFont(context, vm, base)
```

Register qvm font in engine.local_qvm_match; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `fontRegistry`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2511)

<a id="function-function-mq3-engine-local-qvm-match-registershader-function-registershader-context-name-src-mq3-engine-local-qvm-match-ml-2053519810"></a>
### registerShader

```ml
function registerShader(context, name)
```

Return `mq3.engine.local_qvm_match.registerShaderKind(context, "shader", name)` from `engine.local_qvm_match.registerShader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.registerShaderKind`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.engine.local_qvm_match.registerShaderKind`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2200)

<a id="function-function-mq3-engine-local-qvm-match-registershaderkind-function-registershaderkind-context-kind-name-src-mq3-engine-local-qvm-match-ml-448790880"></a>
### registerShaderKind

```ml
function registerShaderKind(context, kind, name)
```

Register shader kind in engine.local_qvm_match; the normal completion returns `registerTypedAsset(context, kind, shaderRemap.resolve(context.shaderRemaps, name))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `shaderRemaps`, `assetKinds`. |
| `kind` | `dynamic` | — | Kind passed as `kind` to `mq3.renderer.shader_remap.handle`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.renderer.shader_remap.handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2193)

<a id="function-function-mq3-engine-local-qvm-match-registershadernomip-function-registershadernomip-context-name-src-mq3-engine-local-qvm-match-ml-459574268"></a>
### registerShaderNoMip

```ml
function registerShaderNoMip(context, name)
```

Return `mq3.engine.local_qvm_match.registerShaderKind(context, "shaderNoMip", name)` from `engine.local_qvm_match.registerShaderNoMip`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.registerShaderKind`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.engine.local_qvm_match.registerShaderKind`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2204)

<a id="function-function-mq3-engine-local-qvm-match-registerskin-function-registerskin-context-name-src-mq3-engine-local-qvm-match-ml-362935286"></a>
### registerSkin

```ml
function registerSkin(context, name)
```

Return `mq3.engine.local_qvm_match.registerTypedAsset(context, "skin", name)` from `engine.local_qvm_match.registerSkin`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.registerTypedAsset`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.engine.local_qvm_match.registerTypedAsset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2188)

<a id="function-function-mq3-engine-local-qvm-match-registertypedasset-function-registertypedasset-context-kind-name-src-mq3-engine-local-qvm-match-ml-231397380"></a>
### registerTypedAsset

```ml
function registerTypedAsset(context, kind, name)
```

Register typed asset in engine.local_qvm_match; the normal completion returns `len(context.assets)`.

Direct state writes: `context.assets`, `context.assetKinds`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `assets`, `assetKinds`. Updated in place: `assets`, `assetKinds`. |
| `kind` | `dynamic` | — | Kind used in `(context.assetKinds + [kind])` and `(context.assetKinds[index] == kind)`. |
| `name` | `dynamic` | — | Name used in `(context.assets + [name])` and `(context.assets[index] == name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2144)

<a id="function-function-mq3-engine-local-qvm-match-remaprenderershader-function-remaprenderershader-context-oldname-newname-timeoffset-src-mq3-engine-local-qvm-match-ml-881650414"></a>
### remapRendererShader

```ml
function remapRendererShader(context, oldName, newName, timeOffset)
```

Compute remap renderer shader in engine.local_qvm_match; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `shaderRemaps`, `assets`, `assetKinds`. |
| `oldName` | `dynamic` | — | Name passed as `name` to `mq3.engine.local_qvm_match.registerShader`. |
| `newName` | `dynamic` | — | Name passed as `name` to `mq3.engine.local_qvm_match.registerShader`. |
| `timeOffset` | `dynamic` | — | Offset passed as `offset` to `mq3.renderer.shader_remap.apply`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2554)

<a id="function-function-mq3-engine-local-qvm-match-removecommand-function-removecommand-context-name-src-mq3-engine-local-qvm-match-ml-1992684496"></a>
### removeCommand

```ml
function removeCommand(context, name)
```

Remove command in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `commandState`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.command_buffer.removeCommand`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2220)

<a id="function-function-mq3-engine-local-qvm-match-renderermodel-function-renderermodel-context-handle-src-mq3-engine-local-qvm-match-ml-828308817"></a>
### rendererModel

```ml
function rendererModel(context, handle)
```

Compute renderer model in engine.local_qvm_match; the normal completion returns `context.modelAssets[(handle - 1)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `assets`, `assetKinds`, `modelAssets`. |
| `handle` | `dynamic` | — | Handle used in `(handle - 1)` and `(handle <= 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2418)

<a id="function-function-mq3-engine-local-qvm-match-renderermodelbounds-function-renderermodelbounds-context-handle-src-mq3-engine-local-qvm-match-ml-1857690883"></a>
### rendererModelBounds

```ml
function rendererModelBounds(context, handle)
```

Compute renderer model bounds in engine.local_qvm_match; the normal completion returns `modelBounds.md3(model)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `collisionWorld`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.engine.local_qvm_match.rendererModel`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2425)

- [mq3.engine.local_qvm_match.RenderView](Type-mq3-engine-local-qvm-match-renderview-918227297.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-restartvm-function-restartvm-machineruntime-slot-src-mq3-engine-local-qvm-match-ml-1865379647"></a>
### restartVm

```ml
function restartVm(machineRuntime, slot)
```

Return `mq3.vm.runtime.restart(machineRuntime, slot)` from `engine.local_qvm_match.restartVm`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `machineRuntime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.vm.runtime.restart`. |
| `slot` | `dynamic` | — | Slot passed as `slot` to `mq3.vm.runtime.restart`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L219)

<a id="function-function-mq3-engine-local-qvm-match-runbotframe-function-runbotframe-value-hosttime-src-mq3-engine-local-qvm-match-ml-974368614"></a>
### runBotFrame

```ml
function runBotFrame(value, hostTime)
```

Compute run bot frame in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `game`, `context`. |
| `hostTime` | `dynamic` | — | Time passed as `time` to `mq3.botlib.server_bridge.setTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1736)

<a id="function-function-mq3-engine-local-qvm-match-runframe-function-runframe-value-servertime-src-mq3-engine-local-qvm-match-ml-1623437759"></a>
### runFrame

```ml
function runFrame(value, serverTime)
```

Return `mq3.engine.local_qvm_match.runServerFrame(value, serverTime)` from `engine.local_qvm_match.runFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.engine.local_qvm_match.runServerFrame`. |
| `serverTime` | `dynamic` | — | Server time passed as `serverTime` to `mq3.engine.local_qvm_match.runServerFrame`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1718)

<a id="function-function-mq3-engine-local-qvm-match-runserverframe-function-runserverframe-value-servertime-src-mq3-engine-local-qvm-match-ml-1200788951"></a>
### runServerFrame

```ml
function runServerFrame(value, serverTime)
```

Return `mq3.engine.local_qvm_match.runServerTickMode(value, serverTime, true)` from `engine.local_qvm_match.runServerFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.engine.local_qvm_match.runServerTickMode`. |
| `serverTime` | `dynamic` | — | Server time passed as `serverTime` to `mq3.engine.local_qvm_match.runServerTickMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1724)

<a id="function-function-mq3-engine-local-qvm-match-runservertick-function-runservertick-value-servertime-src-mq3-engine-local-qvm-match-ml-816372353"></a>
### runServerTick

```ml
function runServerTick(value, serverTime)
```

Return `mq3.engine.local_qvm_match.runServerTickMode(value, serverTime, false)` from `engine.local_qvm_match.runServerTick`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.engine.local_qvm_match.runServerTickMode`. |
| `serverTime` | `dynamic` | — | Server time passed as `serverTime` to `mq3.engine.local_qvm_match.runServerTickMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1730)

<a id="function-function-mq3-engine-local-qvm-match-runservertickmode-function-runservertickmode-value-servertime-bottick-src-mq3-engine-local-qvm-match-ml-1066505801"></a>
### runServerTickMode

```ml
function runServerTickMode(value, serverTime, botTick)
```

Compute run server tick mode in engine.local_qvm_match; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`, `game`. |
| `serverTime` | `dynamic` | — | Time passed as `time` to `mq3.botlib.server_bridge.setTime`. |
| `botTick` | `dynamic` | — | Bot tick operand used by `runServerTickMode`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1753)

<a id="function-function-mq3-engine-local-qvm-match-savebotroutes-function-savebotroutes-context-src-mq3-engine-local-qvm-match-ml-467087635"></a>
### saveBotRoutes

```ml
function saveBotRoutes(context)
```

Compute save bot routes in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `aasRouteCache`, `aasCachePath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L725)

<a id="function-function-mq3-engine-local-qvm-match-sectorlistcommand-function-sectorlistcommand-commandstate-context-src-mq3-engine-local-qvm-match-ml-622313723"></a>
### sectorListCommand

```ml
function sectorListCommand(commandState, context)
```

Compute engine.local_qvm_match.sectorListCommand as `(serverWorld.SV_SectorList_f(context.spatialScene, emitPrint, context) == 64)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `context` | `dynamic` | — | Record exposing `spatialScene`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L366)

<a id="function-function-mq3-engine-local-qvm-match-seedcvars-function-seedcvars-registry-src-mq3-engine-local-qvm-match-ml-192257151"></a>
### seedCvars

```ml
function seedCvars(registry)
```

Compute seed cvars in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Registry passed as `registry` to `mq3.client.qvm_frame_input.registerConfig`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1338)

<a id="function-function-mq3-engine-local-qvm-match-seeddesktopbindings-function-seeddesktopbindings-context-src-mq3-engine-local-qvm-match-ml-877106781"></a>
### seedDesktopBindings

```ml
function seedDesktopBindings(context)
```

Initial desktop controls. Saved menu bindings replace these on map changes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameKeys`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1399)

<a id="function-function-mq3-engine-local-qvm-match-sendclientcommand-function-sendclientcommand-context-name-src-mq3-engine-local-qvm-match-ml-1366753590"></a>
### sendClientCommand

```ml
function sendClientCommand(context, name)
```

Send client command in engine.local_qvm_match; updates `context.console`.

Direct state writes: `context.console`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `serverStream`, `console`, `pendingClientCommands`. Updated in place: `console`. |
| `name` | `dynamic` | — | Name used in `("client " + name)` and `context.pendingClientCommands.add(name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2226)

<a id="function-function-mq3-engine-local-qvm-match-sendservercommand-function-sendservercommand-context-client-text-src-mq3-engine-local-qvm-match-ml-502127967"></a>
### sendServerCommand

```ml
function sendServerCommand(context, client, text)
```

Send server command in engine.local_qvm_match; updates `context.console`.

Direct state writes: `context.console`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `console`, `cgameServerCommands`, `botServer`, `clientStates`. Updated in place: `console`. |
| `client` | `dynamic` | — | Client passed as `client` to `mq3.botlib.server_bridge.queueConsoleMessage`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.client.server_command_stream.queue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L488)

<a id="function-function-mq3-engine-local-qvm-match-servergamecommand-function-servergamecommand-commandstate-src-mq3-engine-local-qvm-match-ml-1200573004"></a>
### serverGameCommand

```ml
function serverGameCommand(commandState)
```

Compute server game command in engine.local_qvm_match; the normal completion returns `(result != 0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1652)

<a id="function-function-mq3-engine-local-qvm-match-setbrushmodel-function-setbrushmodel-context-entity-name-src-mq3-engine-local-qvm-match-ml-2001194077"></a>
### setBrushModel

```ml
function setBrushModel(context, entity, name)
```

Set brush model in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `collisionWorld`, `gameEntities`, `entityStride`. |
| `entity` | `dynamic` | — | Entity passed as `entity` to `mq3.engine.local_qvm_match.entityIndex`. |
| `name` | `dynamic` | — | Name used in `name[0]` and `len(name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L581)

<a id="function-function-mq3-engine-local-qvm-match-setconfigstring-function-setconfigstring-context-index-text-src-mq3-engine-local-qvm-match-ml-1876967942"></a>
### setConfigstring

```ml
function setConfigstring(context, index, text)
```

Set configstring in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `configstrings`. |
| `index` | `dynamic` | — | Index used in `(index >= 0)` and `(index < MAX_CONFIGSTRINGS)`. |
| `text` | `dynamic` | — | Text operand used by `setConfigstring`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L500)

<a id="function-function-mq3-engine-local-qvm-match-setkeybinding-function-setkeybinding-value-key-text-src-mq3-engine-local-qvm-match-ml-1527451675"></a>
### setKeyBinding

```ml
function setKeyBinding(value, key, text)
```

Set key binding in engine.local_qvm_match; the normal completion returns `cgameKeys.setBinding(value.context.cgameKeys, key, text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.vm.cgame_key_traps.setBinding`. |
| `text` | `dynamic` | — | Value passed as `value` to `mq3.vm.cgame_key_traps.setBinding`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2890)

<a id="function-function-mq3-engine-local-qvm-match-setkeydown-function-setkeydown-value-key-down-src-mq3-engine-local-qvm-match-ml-842274354"></a>
### setKeyDown

```ml
function setKeyDown(value, key, down)
```

Set key down in engine.local_qvm_match; the normal completion returns `cgameKeys.setDown(value.context.cgameKeys, key, down)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.vm.cgame_key_traps.setDown`. |
| `down` | `dynamic` | — | Value passed as `value` to `mq3.vm.cgame_key_traps.setDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2881)

<a id="function-function-mq3-engine-local-qvm-match-setuiconnection-function-setuiconnection-value-connstate-connectpacketcount-servername-messagestring-src-mq3-engine-local-qvm-match-ml-786082209"></a>
### setUiConnection

```ml
function setUiConnection(value, connState, connectPacketCount, servername, messageString)
```

Set ui connection in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |
| `connState` | `dynamic` | — | Conn state passed as `connState` to `mq3.client.ui_host_lifecycle.createClientState`. |
| `connectPacketCount` | `dynamic` | — | Connect packet count passed as `connectPacketCount` to `mq3.client.ui_host_lifecycle.createClientState`. |
| `servername` | `dynamic` | — | Servername passed as `servername` to `mq3.client.ui_host_lifecycle.createClientState`. |
| `messageString` | `dynamic` | — | Message string passed as `messageString` to `mq3.client.ui_host_lifecycle.createClientState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3306)

<a id="function-function-mq3-engine-local-qvm-match-setuimenu-function-setuimenu-value-menu-src-mq3-engine-local-qvm-match-ml-1320664122"></a>
### setUiMenu

```ml
function setUiMenu(value, menu)
```

Set ui menu in engine.local_qvm_match; the normal completion returns `uiVm.setActiveMenu(value.ui, menu)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `ui`. |
| `menu` | `dynamic` | — | Menu passed as `menu` to `mq3.client.ui_vm.setActiveMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3298)

<a id="function-function-mq3-engine-local-qvm-match-setuiupdateinfo-function-setuiupdateinfo-value-updateinfostring-src-mq3-engine-local-qvm-match-ml-1701241043"></a>
### setUiUpdateInfo

```ml
function setUiUpdateInfo(value, updateInfoString)
```

Set ui update info in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |
| `updateInfoString` | `dynamic` | — | Update info string used in `typeof(updateInfoString)` and `(typeof(updateInfoString) != "string")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3314)

<a id="function-function-mq3-engine-local-qvm-match-setusercmdvalue-function-setusercmdvalue-context-value-sensitivity-src-mq3-engine-local-qvm-match-ml-439539003"></a>
### setUsercmdValue

```ml
function setUsercmdValue(context, value, sensitivity)
```

Return `mq3.client.cgame_usercmd.set(context.cgameUsercmd, value, sensitivity)` from `engine.local_qvm_match.setUsercmdValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameUsercmd`. |
| `value` | `dynamic` | — | Weapon passed as `weapon` to `mq3.client.cgame_usercmd.set`. |
| `sensitivity` | `dynamic` | — | Sensitivity passed as `sensitivity` to `mq3.client.cgame_usercmd.set`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2298)

<a id="function-function-mq3-engine-local-qvm-match-setuserinfo-function-setuserinfo-context-index-text-src-mq3-engine-local-qvm-match-ml-14628622"></a>
### setUserinfo

```ml
function setUserinfo(context, index, text)
```

Set userinfo in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `userinfos`. |
| `index` | `dynamic` | — | Index used in `(index >= 0)` and `(index < len(context.userinfos))`. |
| `text` | `dynamic` | — | Text operand used by `setUserinfo`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L513)

<a id="function-function-mq3-engine-local-qvm-match-shutdown-function-shutdown-value-src-mq3-engine-local-qvm-match-ml-1820924873"></a>
### shutdown

```ml
function shutdown(value)
```

Compute shutdown in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`, `ui`, `cgame`, `game`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3321)

<a id="function-function-mq3-engine-local-qvm-match-signed16-function-signed16-value-src-mq3-engine-local-qvm-match-ml-1428695893"></a>
### signed16

```ml
function signed16(value)
```

Compute signed 16 in engine.local_qvm_match; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value & 65535)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1115)

<a id="function-function-mq3-engine-local-qvm-match-snapshot-function-snapshot-value-clientnum-src-mq3-engine-local-qvm-match-ml-1473650044"></a>
### snapshot

```ml
function snapshot(value, clientNum)
```

Compute snapshot in engine.local_qvm_match; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`, `cgame`. |
| `clientNum` | `dynamic` | — | Client num passed as `clientNum` to `mq3.engine.local_qvm_match.snapshotCore`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1964)

- [mq3.engine.local_qvm_match.Snapshot](Type-mq3-engine-local-qvm-match-snapshot-1670007188.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-snapshotareasconnected-function-snapshotareasconnected-host-first-second-src-mq3-engine-local-qvm-match-ml-1853250142"></a>
### snapshotAreasConnected

```ml
function snapshotAreasConnected(host, first, second)
```

Return `mq3.collision.visibility.areasConnected(host.context.collisionWorld.visibility, first, second)` from `engine.local_qvm_match.snapshotAreasConnected`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `first` | `dynamic` | — | Area 1 passed as `area1` to `mq3.collision.visibility.areasConnected`. |
| `second` | `dynamic` | — | Area 2 passed as `area2` to `mq3.collision.visibility.areasConnected`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1797)

<a id="function-function-mq3-engine-local-qvm-match-snapshotbytes-function-snapshotbytes-context-number-src-mq3-engine-local-qvm-match-ml-1570091802"></a>
### snapshotBytes

```ml
function snapshotBytes(context, number)
```

Compute snapshot bytes in engine.local_qvm_match; the normal completion returns `cgameSyscall.BytesResult(true, output)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `serverStream`, `latestSnapshot`, `snapshotNumber`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.engine.local_qvm_match.streamSnapshotBytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2112)

<a id="function-function-mq3-engine-local-qvm-match-snapshotbytesscratch-function-snapshotbytesscratch-context-number-src-mq3-engine-local-qvm-match-ml-1742620964"></a>
### snapshotBytesScratch

```ml
function snapshotBytesScratch(context, number)
```

syscall_cgame copies the result into QVM memory synchronously. Keep one host buffer per match and clear the unused entity tail between snapshots.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `serverStream`, `cgameSnapshotScratch`, `latestSnapshot`, `snapshotNumber`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.engine.local_qvm_match.streamSnapshotBytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2123)

<a id="function-function-mq3-engine-local-qvm-match-snapshotclusterpvs-function-snapshotclusterpvs-host-cluster-src-mq3-engine-local-qvm-match-ml-237423286"></a>
### snapshotClusterPvs

```ml
function snapshotClusterPvs(host, cluster)
```

Return `mq3.collision.visibility.clusterPVS(host.context.collisionWorld.visibility, cluster)` from `engine.local_qvm_match.snapshotClusterPvs`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `cluster` | `dynamic` | — | Cluster passed as `cluster` to `mq3.collision.visibility.clusterPVS`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1792)

<a id="function-function-mq3-engine-local-qvm-match-snapshotcore-function-snapshotcore-value-clientnum-src-mq3-engine-local-qvm-match-ml-1586285384"></a>
### snapshotCore

```ml
function snapshotCore(value, clientNum)
```

Compute snapshot core in engine.local_qvm_match; the normal completion returns `snapshotCorePrepared(value, clientNum, input)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.engine.local_qvm_match.snapshotInput`. |
| `clientNum` | `dynamic` | — | Client num passed as `clientNum` to `mq3.engine.local_qvm_match.snapshotCorePrepared`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1942)

<a id="function-function-mq3-engine-local-qvm-match-snapshotcoreprepared-function-snapshotcoreprepared-value-clientnum-input-src-mq3-engine-local-qvm-match-ml-564173704"></a>
### snapshotCorePrepared

```ml
function snapshotCorePrepared(value, clientNum, input)
```

Compute snapshot core prepared in engine.local_qvm_match; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`, `game`. |
| `clientNum` | `dynamic` | — | Zero-based index into `context.linked`. |
| `input` | `dynamic` | — | Record exposing `world`, `host`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1950)

<a id="function-function-mq3-engine-local-qvm-match-snapshotinput-function-snapshotinput-value-src-mq3-engine-local-qvm-match-ml-1169512333"></a>
### snapshotInput

```ml
function snapshotInput(value)
```

Compute snapshot input in engine.local_qvm_match; the normal completion returns `SnapshotInput(buildWorld, host, decoded)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `game`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1923)

- [mq3.engine.local_qvm_match.SnapshotInput](Type-mq3-engine-local-qvm-match-snapshotinput-48200440.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-snapshotleafarea-function-snapshotleafarea-host-leaf-src-mq3-engine-local-qvm-match-ml-1153079088"></a>
### snapshotLeafArea

```ml
function snapshotLeafArea(host, leaf)
```

Return `mq3.collision.visibility.leafArea(host.context.collisionWorld.visibility, leaf)` from `engine.local_qvm_match.snapshotLeafArea`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `leaf` | `dynamic` | — | Leaf passed as `leaf` to `mq3.collision.visibility.leafArea`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1779)

<a id="function-function-mq3-engine-local-qvm-match-snapshotleafcluster-function-snapshotleafcluster-host-leaf-src-mq3-engine-local-qvm-match-ml-371741920"></a>
### snapshotLeafCluster

```ml
function snapshotLeafCluster(host, leaf)
```

Return `mq3.collision.visibility.leafCluster(host.context.collisionWorld.visibility, leaf)` from `engine.local_qvm_match.snapshotLeafCluster`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `leaf` | `dynamic` | — | Leaf passed as `leaf` to `mq3.collision.visibility.leafCluster`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1783)

<a id="function-function-mq3-engine-local-qvm-match-snapshotpointleaf-function-snapshotpointleaf-host-origin-src-mq3-engine-local-qvm-match-ml-737119374"></a>
### snapshotPointLeaf

```ml
function snapshotPointLeaf(host, origin)
```

Return `mq3.collision.world.pointLeafnum(host.context.collisionWorld, origin)` from `engine.local_qvm_match.snapshotPointLeaf`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `origin` | `dynamic` | — | Point passed as `point` to `mq3.collision.world.pointLeafnum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1775)

<a id="function-function-mq3-engine-local-qvm-match-snapshotproductive-function-snapshotproductive-value-clientnum-src-mq3-engine-local-qvm-match-ml-945293176"></a>
### snapshotProductive

```ml
function snapshotProductive(value, clientNum)
```

Production snapshots are consumed by the authoritative retail cgame QVM. Differential native prediction/effect/HUD mirrors belong in probes, not in the frame loop; they otherwise duplicate most client work for every tick.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |
| `clientNum` | `dynamic` | — | Client num passed as `clientNum` to `mq3.engine.local_qvm_match.snapshotCorePrepared`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2016)

<a id="function-function-mq3-engine-local-qvm-match-snapshotwriteareabits-function-snapshotwriteareabits-host-bits-area-src-mq3-engine-local-qvm-match-ml-43747119"></a>
### snapshotWriteAreaBits

```ml
function snapshotWriteAreaBits(host, bits, area)
```

Return `mq3.collision.visibility.writeAreaBits(host.context.collisionWorld.visibility, bits, area)` from `engine.local_qvm_match.snapshotWriteAreaBits`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `bits` | `dynamic` | — | Buffer passed as `buffer` to `mq3.collision.visibility.writeAreaBits`. |
| `area` | `dynamic` | — | Area passed as `area` to `mq3.collision.visibility.writeAreaBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1788)

- [mq3.engine.local_qvm_match.SoundCommand](Type-mq3-engine-local-qvm-match-soundcommand-396981036.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-soundevent-function-soundevent-kind-entity-channel-handle-origin-velocity-axis-flag-text-text2-src-mq3-engine-local-qvm-match-ml-169641728"></a>
### soundEvent

```ml
function soundEvent(kind, entity, channel, handle, origin, velocity, axis, flag, text, text2)
```

Create `mq3.engine.local_qvm_match.SoundCommand` with kind=kind; entity=entity; channel=channel; handle=handle; origin=origin; velocity=velocity; axis=axis; flag=flag; text=text; text2=text2.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — | Initial `kind` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record. |
| `entity` | `dynamic` | — | Initial `entity` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record. |
| `channel` | `dynamic` | — | Initial `channel` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record. |
| `handle` | `dynamic` | — | Initial `handle` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record. |
| `origin` | `dynamic` | — | Initial `origin` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record. |
| `velocity` | `dynamic` | — | Initial `velocity` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record. |
| `axis` | `dynamic` | — | Initial `axis` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record. |
| `flag` | `dynamic` | — | Initial `flag` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record. |
| `text` | `dynamic` | — | Initial `text` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record. |
| `text2` | `dynamic` | — | Initial `text2` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2395)

<a id="function-function-mq3-engine-local-qvm-match-soundvector-function-soundvector-vm-address-label-src-mq3-engine-local-qvm-match-ml-362516767"></a>
### soundVector

```ml
function soundVector(vm, address, label)
```

Compute sound vector in engine.local_qvm_match; the normal completion returns `common.readFloatVector(vm, address, 3, label)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readFloatVector`. |
| `address` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.readFloatVector`. |
| `label` | `dynamic` | — | Label passed as `label` to `mq3.vm.syscall_common.readFloatVector`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2383)

<a id="function-function-mq3-engine-local-qvm-match-streamsnapshotbytes-function-streamsnapshotbytes-context-number-output-src-mq3-engine-local-qvm-match-ml-2128290889"></a>
### streamSnapshotBytes

```ml
function streamSnapshotBytes(context, number, output)
```

Compute stream snapshot bytes in engine.local_qvm_match; the normal completion returns `cgameSyscall.BytesResult(true, output)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `serverStream`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.client.server_stream.at`. |
| `output` | `dynamic` | — | Output passed as `output` to `mq3.client.cl_cgame_runtime.encodeSnapshot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2103)

<a id="function-function-mq3-engine-local-qvm-match-submitusercmd-function-submitusercmd-value-clientnum-command-src-mq3-engine-local-qvm-match-ml-1770195777"></a>
### submitUsercmd

```ml
function submitUsercmd(value, clientNum, command)
```

Compute submit usercmd in engine.local_qvm_match; the normal completion returns `submitUsercmdAtHostTime(value, clientNum, command, command.serverTime)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.engine.local_qvm_match.submitUsercmdAtHostTime`. |
| `clientNum` | `dynamic` | — | Client num passed as `clientNum` to `mq3.engine.local_qvm_match.submitUsercmdAtHostTime`. |
| `command` | `dynamic` | — | Record exposing `serverTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1699)

<a id="function-function-mq3-engine-local-qvm-match-submitusercmdathosttime-function-submitusercmdathosttime-value-clientnum-command-hosttime-src-mq3-engine-local-qvm-match-ml-785168868"></a>
### submitUsercmdAtHostTime

```ml
function submitUsercmdAtHostTime(value, clientNum, command, hostTime)
```

Compute submit usercmd at host time in engine.local_qvm_match; the normal completion returns `gameVm.clientThink(value.game, clientNum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`, `game`. |
| `clientNum` | `dynamic` | — | Client num passed as `clientNum` to `mq3.engine.local_qvm_match.recordLocalUsercmd`. |
| `command` | `dynamic` | — | Command passed as `command` to `mq3.engine.local_qvm_match.recordLocalUsercmd`. |
| `hostTime` | `dynamic` | — | Host time used in `(hostTime < 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1707)

<a id="function-function-mq3-engine-local-qvm-match-syncclienttextinput-function-syncclienttextinput-value-src-mq3-engine-local-qvm-match-ml-1966487803"></a>
### syncClientTextInput

```ml
function syncClientTextInput(value)
```

Synchronize client text input in engine.local_qvm_match; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2917)

<a id="function-function-mq3-engine-local-qvm-match-syncconsoleinputcatcher-function-syncconsoleinputcatcher-context-src-mq3-engine-local-qvm-match-ml-1474879751"></a>
### syncConsoleInputCatcher

```ml
function syncConsoleInputCatcher(context)
```

Synchronize console input catcher in engine.local_qvm_match; updates `context.uiKeyCatcher`.

Direct state writes: `context.uiKeyCatcher`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `clientTextInput`, `cgameKeys`. Updated in place: `uiKeyCatcher`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L316)

<a id="function-function-mq3-engine-local-qvm-match-syncconsoleruntime-function-syncconsoleruntime-context-src-mq3-engine-local-qvm-match-ml-635375083"></a>
### syncConsoleRuntime

```ml
function syncConsoleRuntime(context)
```

Synchronize console runtime in engine.local_qvm_match; the normal completion returns `runtime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `clientTextInput`, `now`, `uiClient`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L319)

<a id="function-function-mq3-engine-local-qvm-match-syncspatialentity-function-syncspatialentity-context-index-src-mq3-engine-local-qvm-match-ml-1314439605"></a>
### syncSpatialEntity

```ml
function syncSpatialEntity(context, index)
```

Synchronize spatial entity in engine.local_qvm_match; the normal completion returns `ent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `gameEntities`, `entityStride`, `spatialScene`. |
| `index` | `dynamic` | — | Zero-based index into `context.spatialScene.entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L554)

<a id="function-function-mq3-engine-local-qvm-match-takestreamcommands-function-takestreamcommands-value-src-mq3-engine-local-qvm-match-ml-71196225"></a>
### takeStreamCommands

```ml
function takeStreamCommands(value)
```

Compute take stream commands in engine.local_qvm_match; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2773)

<a id="function-function-mq3-engine-local-qvm-match-toggleclientconsole-function-toggleclientconsole-value-src-mq3-engine-local-qvm-match-ml-989849529"></a>
### toggleClientConsole

```ml
function toggleClientConsole(value)
```

Compute toggle client console in engine.local_qvm_match; the normal completion returns `toggleConsoleCommand(value.context.commandState, value.context)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2967)

<a id="function-function-mq3-engine-local-qvm-match-toggleconsolecommand-function-toggleconsolecommand-commandstate-context-src-mq3-engine-local-qvm-match-ml-1566587545"></a>
### toggleConsoleCommand

```ml
function toggleConsoleCommand(commandState, context)
```

Test toggle console command in engine.local_qvm_match; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `context` | `dynamic` | — | Record exposing `clientTextInput`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L338)

<a id="function-function-mq3-engine-local-qvm-match-traceworld-function-traceworld-context-start-mins-maxs-finish-passentity-mask-capsule-src-mq3-engine-local-qvm-match-ml-288896713"></a>
### traceWorld

```ml
function traceWorld(context, start, mins, maxs, finish, passEntity, mask, capsule)
```

Trace world in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `spatialScene`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.server.world.trace`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.server.world.trace`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.server.world.trace`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.server.world.trace`. |
| `passEntity` | `dynamic` | — | Pass entity passed as `passEntity` to `mq3.server.world.trace`. |
| `mask` | `dynamic` | — | Mask passed as `mask` to `mq3.server.world.trace`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.server.world.trace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1303)

<a id="function-function-mq3-engine-local-qvm-match-typedassethandle-function-typedassethandle-context-kind-name-src-mq3-engine-local-qvm-match-ml-434623608"></a>
### typedAssetHandle

```ml
function typedAssetHandle(context, kind, name)
```

Compute typed asset handle in engine.local_qvm_match; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `assets`, `assetKinds`. |
| `kind` | `dynamic` | — | Kind used in `(context.assetKinds[index] == kind)` and `((context.assetKinds[index] == kind) and (context.assets[index] == name))`. |
| `name` | `dynamic` | — | Name used in `(context.assets[index] == name)` and `((context.assetKinds[index] == kind) and (context.assets[index] == name))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2156)

<a id="function-function-mq3-engine-local-qvm-match-uibinding-function-uibinding-context-key-src-mq3-engine-local-qvm-match-ml-985437138"></a>
### uiBinding

```ml
function uiBinding(context, key)
```

Return `mq3.vm.cgame_key_traps.getBinding(context.cgameKeys, key)` from `engine.local_qvm_match.uiBinding`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameKeys`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.vm.cgame_key_traps.getBinding`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2833)

<a id="function-function-mq3-engine-local-qvm-match-uicdkey-function-uicdkey-context-src-mq3-engine-local-qvm-match-ml-1386187599"></a>
### uiCdKey

```ml
function uiCdKey(context)
```

Compute engine.local_qvm_match.uiCdKey as `"0000000000000000"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3193)

<a id="function-function-mq3-engine-local-qvm-match-uicinematicdraw-function-uicinematicdraw-context-handle-src-mq3-engine-local-qvm-match-ml-1678928419"></a>
### uiCinematicDraw

```ml
function uiCinematicDraw(context, handle)
```

Compute ui cinematic draw in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cinematics`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.client.cinematic_runtime.draw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3233)

<a id="function-function-mq3-engine-local-qvm-match-uicinematicextents-function-uicinematicextents-context-handle-x-y-w-h-src-mq3-engine-local-qvm-match-ml-278143737"></a>
### uiCinematicExtents

```ml
function uiCinematicExtents(context, handle, x, y, w, h)
```

Compute ui cinematic extents in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cinematics`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.client.cinematic_runtime.setExtents`. |
| `x` | `dynamic` | — | X passed as `x` to `mq3.client.cinematic_runtime.setExtents`. |
| `y` | `dynamic` | — | Y passed as `y` to `mq3.client.cinematic_runtime.setExtents`. |
| `w` | `dynamic` | — | Width passed as `width` to `mq3.client.cinematic_runtime.setExtents`. |
| `h` | `dynamic` | — | Height passed as `height` to `mq3.client.cinematic_runtime.setExtents`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3241)

<a id="function-function-mq3-engine-local-qvm-match-uicinematicrun-function-uicinematicrun-context-handle-src-mq3-engine-local-qvm-match-ml-579014365"></a>
### uiCinematicRun

```ml
function uiCinematicRun(context, handle)
```

Return `mq3.client.cinematic_runtime.run(context.cinematics, handle, context.now)` from `engine.local_qvm_match.uiCinematicRun`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cinematics`, `now`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.client.cinematic_runtime.run`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3229)

<a id="function-function-mq3-engine-local-qvm-match-uicinematicstop-function-uicinematicstop-context-handle-src-mq3-engine-local-qvm-match-ml-1591900091"></a>
### uiCinematicStop

```ml
function uiCinematicStop(context, handle)
```

Return `mq3.client.cinematic_runtime.stop(context.cinematics, handle)` from `engine.local_qvm_match.uiCinematicStop`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cinematics`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.client.cinematic_runtime.stop`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3225)

<a id="function-function-mq3-engine-local-qvm-match-uiclearkeys-function-uiclearkeys-context-src-mq3-engine-local-qvm-match-ml-324857193"></a>
### uiClearKeys

```ml
function uiClearKeys(context)
```

Return `mq3.vm.cgame_key_traps.clearStates(context.cgameKeys)` from `engine.local_qvm_match.uiClearKeys`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameKeys`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2852)

<a id="function-function-mq3-engine-local-qvm-match-uiclearkeysproductive-function-uiclearkeysproductive-context-src-mq3-engine-local-qvm-match-ml-766082535"></a>
### uiClearKeysProductive

```ml
function uiClearKeysProductive(context)
```

Compute ui clear keys productive in engine.local_qvm_match; the normal completion returns `uiClearKeys(context)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `inputClearFn`, `inputClearContext`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2855)

<a id="function-function-mq3-engine-local-qvm-match-uiclientstate-function-uiclientstate-context-src-mq3-engine-local-qvm-match-ml-1228788311"></a>
### uiClientState

```ml
function uiClientState(context)
```

Return `mq3.client.ui_host_lifecycle.encodeClientState(context.uiClient)` from `engine.local_qvm_match.uiClientState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiClient`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2821)

<a id="function-function-mq3-engine-local-qvm-match-uiclipboard-function-uiclipboard-context-src-mq3-engine-local-qvm-match-ml-447647351"></a>
### uiClipboard

```ml
function uiClipboard(context)
```

Compute engine.local_qvm_match.uiClipboard as `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2818)

<a id="function-function-mq3-engine-local-qvm-match-uiconfigstring-function-uiconfigstring-context-index-src-mq3-engine-local-qvm-match-ml-1171305321"></a>
### uiConfigString

```ml
function uiConfigString(context, index)
```

Compute ui config string in engine.local_qvm_match; the normal completion returns `context.configstrings[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `configstrings`. |
| `index` | `dynamic` | — | Zero-based index into `context.configstrings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2825)

<a id="function-function-mq3-engine-local-qvm-match-uidesktopmodlist-function-uidesktopmodlist-dataroot-src-mq3-engine-local-qvm-match-ml-1197026554"></a>
### uiDesktopModList

```ml
function uiDesktopModList(dataRoot)
```

Compute ui desktop mod list in engine.local_qvm_match; the normal completion returns `mods.toArray()`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dataRoot` | `dynamic` | — | Data root used in `(dataRoot == "")` and `fs.joinPath(dataRoot, "..")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2982)

<a id="function-function-mq3-engine-local-qvm-match-uifilelist-function-uifilelist-context-path-extension-src-mq3-engine-local-qvm-match-ml-1002450825"></a>
### uiFileList

```ml
function uiFileList(context, path, extension)
```

Compute ui file list in engine.local_qvm_match; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLanCacheHost`, `archive`. |
| `path` | `dynamic` | — | Path used in `(path == "demos")` and `(path == "$modlist")`. |
| `extension` | `dynamic` | — | Extension used in `strings.toLowerAscii(extension)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3034)

<a id="function-function-mq3-engine-local-qvm-match-uigamecommand-function-uigamecommand-commandstate-src-mq3-engine-local-qvm-match-ml-2108986878"></a>
### uiGameCommand

```ml
function uiGameCommand(commandState)
```

Compute ui game command in engine.local_qvm_match; the normal completion returns `(result != 0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L1658)

<a id="function-function-mq3-engine-local-qvm-match-uigetcatcher-function-uigetcatcher-context-src-mq3-engine-local-qvm-match-ml-480860967"></a>
### uiGetCatcher

```ml
function uiGetCatcher(context)
```

Return `mq3.vm.cgame_key_traps.getCatcher(context.cgameKeys)` from `engine.local_qvm_match.uiGetCatcher`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameKeys`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2870)

<a id="function-function-mq3-engine-local-qvm-match-uigetoverstrike-function-uigetoverstrike-context-src-mq3-engine-local-qvm-match-ml-419309727"></a>
### uiGetOverstrike

```ml
function uiGetOverstrike(context)
```

Return `mq3.vm.cgame_key_traps.getOverstrike(context.cgameKeys)` from `engine.local_qvm_match.uiGetOverstrike`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameKeys`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2845)

<a id="function-function-mq3-engine-local-qvm-match-uikeydown-function-uikeydown-context-key-src-mq3-engine-local-qvm-match-ml-546377958"></a>
### uiKeyDown

```ml
function uiKeyDown(context, key)
```

Return `mq3.vm.cgame_key_traps.isDown(context.cgameKeys, key)` from `engine.local_qvm_match.uiKeyDown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameKeys`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.vm.cgame_key_traps.isDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2842)

<a id="function-function-mq3-engine-local-qvm-match-uikeyname-function-uikeyname-context-key-src-mq3-engine-local-qvm-match-ml-518397648"></a>
### uiKeyName

```ml
function uiKeyName(context, key)
```

Return `mq3.vm.cgame_key_traps.keynumToString(key)` from `engine.local_qvm_match.uiKeyName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.vm.cgame_key_traps.keynumToString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2829)

<a id="function-function-mq3-engine-local-qvm-match-uilanadd-function-uilanadd-context-source-name-address-src-mq3-engine-local-qvm-match-ml-1968397871"></a>
### uiLanAdd

```ml
function uiLanAdd(context, source, name, address)
```

Return `mq3.client.ui_lan_browser.add(context.uiLan, source, name, address)` from `engine.local_qvm_match.uiLanAdd`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLan`. |
| `source` | `dynamic` | — | Source passed as `source` to `mq3.client.ui_lan_browser.add`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.client.ui_lan_browser.add`. |
| `address` | `dynamic` | — | Address passed as `address` to `mq3.client.ui_lan_browser.add`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3081)

<a id="function-function-mq3-engine-local-qvm-match-uilanclearping-function-uilanclearping-context-index-src-mq3-engine-local-qvm-match-ml-263155101"></a>
### uiLanClearPing

```ml
function uiLanClearPing(context, index)
```

Return `mq3.client.ui_lan_browser.clearPing(context.uiLan, index)` from `engine.local_qvm_match.uiLanClearPing`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLan`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.client.ui_lan_browser.clearPing`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3093)

<a id="function-function-mq3-engine-local-qvm-match-uilancompare-function-uilancompare-context-source-sortkey-sortdir-first-second-src-mq3-engine-local-qvm-match-ml-1627882684"></a>
### uiLanCompare

```ml
function uiLanCompare(context, source, sortKey, sortDir, first, second)
```

Return `mq3.client.ui_lan_browser.compare(context.uiLan, source, sortKey, sortDir, first, second)` from `engine.local_qvm_match.uiLanCompare`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLan`. |
| `source` | `dynamic` | — | Source passed as `source` to `mq3.client.ui_lan_browser.compare`. |
| `sortKey` | `dynamic` | — | Sort key passed as `sortKey` to `mq3.client.ui_lan_browser.compare`. |
| `sortDir` | `dynamic` | — | Sort dir passed as `sortDir` to `mq3.client.ui_lan_browser.compare`. |
| `first` | `dynamic` | — | First passed as `first` to `mq3.client.ui_lan_browser.compare`. |
| `second` | `dynamic` | — | Second passed as `second` to `mq3.client.ui_lan_browser.compare`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3157)

<a id="function-function-mq3-engine-local-qvm-match-uilanisvisible-function-uilanisvisible-context-source-index-src-mq3-engine-local-qvm-match-ml-536471492"></a>
### uiLanIsVisible

```ml
function uiLanIsVisible(context, source, index)
```

Return `mq3.client.ui_lan_browser.isVisible(context.uiLan, source, index)` from `engine.local_qvm_match.uiLanIsVisible`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLan`. |
| `source` | `dynamic` | — | Source passed as `source` to `mq3.client.ui_lan_browser.isVisible`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.client.ui_lan_browser.isVisible`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3131)

<a id="function-function-mq3-engine-local-qvm-match-uilanload-function-uilanload-context-src-mq3-engine-local-qvm-match-ml-768982545"></a>
### uiLanLoad

```ml
function uiLanLoad(context)
```

Return `mq3.client.ui_lan_cache.load(context.uiLan, context.uiLanCacheHost)` from `engine.local_qvm_match.uiLanLoad`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLan`, `uiLanCacheHost`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3072)

<a id="function-function-mq3-engine-local-qvm-match-uilanmarkvisible-function-uilanmarkvisible-context-source-index-visible-src-mq3-engine-local-qvm-match-ml-333825758"></a>
### uiLanMarkVisible

```ml
function uiLanMarkVisible(context, source, index, visible)
```

Return `mq3.client.ui_lan_browser.markVisible(context.uiLan, source, index, visible)` from `engine.local_qvm_match.uiLanMarkVisible`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLan`. |
| `source` | `dynamic` | — | Source passed as `source` to `mq3.client.ui_lan_browser.markVisible`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.client.ui_lan_browser.markVisible`. |
| `visible` | `dynamic` | — | Visible passed as `visible` to `mq3.client.ui_lan_browser.markVisible`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3126)

<a id="function-function-mq3-engine-local-qvm-match-uilanping-function-uilanping-context-index-src-mq3-engine-local-qvm-match-ml-1529683"></a>
### uiLanPing

```ml
function uiLanPing(context, index)
```

Return `mq3.client.ui_lan_browser.getPing(context.uiLan, index)` from `engine.local_qvm_match.uiLanPing`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLan`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.client.ui_lan_browser.getPing`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3097)

<a id="function-function-mq3-engine-local-qvm-match-uilanpingcount-function-uilanpingcount-context-src-mq3-engine-local-qvm-match-ml-2014966563"></a>
### uiLanPingCount

```ml
function uiLanPingCount(context)
```

Return `mq3.client.ui_lan_browser.pingCount(context.uiLan)` from `engine.local_qvm_match.uiLanPingCount`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLan`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3089)

<a id="function-function-mq3-engine-local-qvm-match-uilanpinginfo-function-uilanpinginfo-context-index-src-mq3-engine-local-qvm-match-ml-41741463"></a>
### uiLanPingInfo

```ml
function uiLanPingInfo(context, index)
```

Return `mq3.client.ui_lan_browser.getPingInfo(context.uiLan, index)` from `engine.local_qvm_match.uiLanPingInfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLan`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.client.ui_lan_browser.getPingInfo`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3101)

<a id="function-function-mq3-engine-local-qvm-match-uilanremove-function-uilanremove-context-source-address-src-mq3-engine-local-qvm-match-ml-663335026"></a>
### uiLanRemove

```ml
function uiLanRemove(context, source, address)
```

Return `mq3.client.ui_lan_browser.remove(context.uiLan, source, address)` from `engine.local_qvm_match.uiLanRemove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLan`. |
| `source` | `dynamic` | — | Source passed as `source` to `mq3.client.ui_lan_browser.remove`. |
| `address` | `dynamic` | — | Address passed as `address` to `mq3.client.ui_lan_browser.remove`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3086)

<a id="function-function-mq3-engine-local-qvm-match-uilanresetpings-function-uilanresetpings-context-source-src-mq3-engine-local-qvm-match-ml-1752763802"></a>
### uiLanResetPings

```ml
function uiLanResetPings(context, source)
```

Return `mq3.client.ui_lan_browser.resetPings(context.uiLan, source)` from `engine.local_qvm_match.uiLanResetPings`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLan`. |
| `source` | `dynamic` | — | Source passed as `source` to `mq3.client.ui_lan_browser.resetPings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3142)

<a id="function-function-mq3-engine-local-qvm-match-uilansave-function-uilansave-context-src-mq3-engine-local-qvm-match-ml-529591739"></a>
### uiLanSave

```ml
function uiLanSave(context)
```

Return `mq3.client.ui_lan_cache.save(context.uiLan, context.uiLanCacheHost)` from `engine.local_qvm_match.uiLanSave`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLan`, `uiLanCacheHost`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3075)

<a id="function-function-mq3-engine-local-qvm-match-uilanserveraddress-function-uilanserveraddress-context-source-index-src-mq3-engine-local-qvm-match-ml-1154254868"></a>
### uiLanServerAddress

```ml
function uiLanServerAddress(context, source, index)
```

Return `mq3.client.ui_lan_browser.address(context.uiLan, source, index)` from `engine.local_qvm_match.uiLanServerAddress`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLan`. |
| `source` | `dynamic` | — | Source passed as `source` to `mq3.client.ui_lan_browser.address`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.client.ui_lan_browser.address`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3110)

<a id="function-function-mq3-engine-local-qvm-match-uilanservercount-function-uilanservercount-context-source-src-mq3-engine-local-qvm-match-ml-967307644"></a>
### uiLanServerCount

```ml
function uiLanServerCount(context, source)
```

Return `mq3.client.ui_lan_browser.count(context.uiLan, source)` from `engine.local_qvm_match.uiLanServerCount`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLan`. |
| `source` | `dynamic` | — | Source passed as `source` to `mq3.client.ui_lan_browser.count`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3105)

<a id="function-function-mq3-engine-local-qvm-match-uilanserverinfo-function-uilanserverinfo-context-source-index-src-mq3-engine-local-qvm-match-ml-135954884"></a>
### uiLanServerInfo

```ml
function uiLanServerInfo(context, source, index)
```

Return `mq3.client.ui_lan_browser.serverInfo(context.uiLan, source, index)` from `engine.local_qvm_match.uiLanServerInfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLan`. |
| `source` | `dynamic` | — | Source passed as `source` to `mq3.client.ui_lan_browser.serverInfo`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.client.ui_lan_browser.serverInfo`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3115)

<a id="function-function-mq3-engine-local-qvm-match-uilanserverping-function-uilanserverping-context-source-index-src-mq3-engine-local-qvm-match-ml-1177729924"></a>
### uiLanServerPing

```ml
function uiLanServerPing(context, source, index)
```

Return `mq3.client.ui_lan_browser.serverPing(context.uiLan, source, index)` from `engine.local_qvm_match.uiLanServerPing`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLan`. |
| `source` | `dynamic` | — | Source passed as `source` to `mq3.client.ui_lan_browser.serverPing`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.client.ui_lan_browser.serverPing`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3120)

<a id="function-function-mq3-engine-local-qvm-match-uilanserverstatus-function-uilanserverstatus-context-address-src-mq3-engine-local-qvm-match-ml-1193607833"></a>
### uiLanServerStatus

```ml
function uiLanServerStatus(context, address)
```

Compute ui lan server status in engine.local_qvm_match; the normal completion returns `uiLanQueries.serverStatus(context.uiLanQueries, address)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLanQueries`, `uiLan`, `now`. |
| `address` | `dynamic` | — | Address passed as `address` to `mq3.client.ui_lan_browser.serverStatus`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3146)

<a id="function-function-mq3-engine-local-qvm-match-uilanupdatepings-function-uilanupdatepings-context-source-src-mq3-engine-local-qvm-match-ml-569583000"></a>
### uiLanUpdatePings

```ml
function uiLanUpdatePings(context, source)
```

Compute ui lan update pings in engine.local_qvm_match; the normal completion returns `uiLanQueries.updateVisiblePings(context.uiLanQueries, source)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `uiLanQueries`, `uiLan`, `now`. |
| `source` | `dynamic` | — | Source passed as `source` to `mq3.client.ui_lan_browser.updateVisiblePings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3135)

<a id="function-function-mq3-engine-local-qvm-match-uilocalsound-function-uilocalsound-context-handle-channel-src-mq3-engine-local-qvm-match-ml-1837573318"></a>
### uiLocalSound

```ml
function uiLocalSound(context, handle, channel)
```

Update `context.soundCommands` in engine.local_qvm_match.

Direct state writes: `context.soundCommands`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `soundCommands`. Updated in place: `soundCommands`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.engine.local_qvm_match.soundEvent`. |
| `channel` | `dynamic` | — | Channel passed as `channel` to `mq3.engine.local_qvm_match.soundEvent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3169)

<a id="function-function-mq3-engine-local-qvm-match-uiloosedemos-function-uiloosedemos-result-dataroot-wanted-src-mq3-engine-local-qvm-match-ml-1083808136"></a>
### uiLooseDemos

```ml
function uiLooseDemos(result, dataRoot, wanted)
```

Compute ui loose demos in engine.local_qvm_match; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Values passed as `values` to `mq3.engine.local_qvm_match.uiUnique`. |
| `dataRoot` | `dynamic` | — | Root passed as `root` to `mq3.engine.local_qvm_match.desktopFilePath`. |
| `wanted` | `dynamic` | — | Wanted used in `(wanted == "")` and `strings.endsWith(lowerName, wanted)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3019)

<a id="function-function-mq3-engine-local-qvm-match-uipb-function-uipb-context-status-src-mq3-engine-local-qvm-match-ml-604421649"></a>
### uiPb

```ml
function uiPb(context, status)
```

Compute engine.local_qvm_match.uiPb as `void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `status` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3212)

<a id="function-function-mq3-engine-local-qvm-match-uiplaycinematic-function-uiplaycinematic-context-name-x-y-w-h-bits-src-mq3-engine-local-qvm-match-ml-281931764"></a>
### uiPlayCinematic

```ml
function uiPlayCinematic(context, name, x, y, w, h, bits)
```

Return `mq3.client.cinematic_runtime.play(context.cinematics, name, x, y, w, h, bits, context.now)` from `engine.local_qvm_match.uiPlayCinematic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cinematics`, `now`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.client.cinematic_runtime.play`. |
| `x` | `dynamic` | — | X passed as `x` to `mq3.client.cinematic_runtime.play`. |
| `y` | `dynamic` | — | Y passed as `y` to `mq3.client.cinematic_runtime.play`. |
| `w` | `dynamic` | — | Width passed as `width` to `mq3.client.cinematic_runtime.play`. |
| `h` | `dynamic` | — | Height passed as `height` to `mq3.client.cinematic_runtime.play`. |
| `bits` | `dynamic` | — | Bits passed as `bits` to `mq3.client.cinematic_runtime.play`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3221)

<a id="function-function-mq3-engine-local-qvm-match-uirealtime-function-uirealtime-context-src-mq3-engine-local-qvm-match-ml-294429287"></a>
### uiRealTime

```ml
function uiRealTime(context)
```

Compute engine.local_qvm_match.uiRealTime as `[n.quotient(context.now, 1000), bytes(uiMedia.QTIME_SIZE, 0)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `now`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3184)

<a id="function-function-mq3-engine-local-qvm-match-uiregistersound-function-uiregistersound-context-name-compressed-src-mq3-engine-local-qvm-match-ml-906267845"></a>
### uiRegisterSound

```ml
function uiRegisterSound(context, name, compressed)
```

Return `mq3.engine.local_qvm_match.registerTypedAsset(context, "sound", name)` from `engine.local_qvm_match.uiRegisterSound`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.registerTypedAsset`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.engine.local_qvm_match.registerTypedAsset`. |
| `compressed` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3162)

<a id="function-function-mq3-engine-local-qvm-match-uiremap-function-uiremap-context-oldname-newname-timeoffset-src-mq3-engine-local-qvm-match-ml-1087033818"></a>
### uiRemap

```ml
function uiRemap(context, oldName, newName, timeOffset)
```

Compute ui remap in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context passed as `context` to `mq3.engine.local_qvm_match.remapRendererShader`. |
| `oldName` | `dynamic` | — | Old name passed as `oldName` to `mq3.engine.local_qvm_match.remapRendererShader`. |
| `newName` | `dynamic` | — | New name passed as `newName` to `mq3.engine.local_qvm_match.remapRendererShader`. |
| `timeOffset` | `dynamic` | — | Time offset passed as `timeOffset` to `mq3.engine.local_qvm_match.remapRendererShader`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3190)

<a id="function-function-mq3-engine-local-qvm-match-uiseek-function-uiseek-context-handle-offset-origin-src-mq3-engine-local-qvm-match-ml-2077635546"></a>
### uiSeek

```ml
function uiSeek(context, handle, offset, origin)
```

Compute engine.local_qvm_match.uiSeek as `- 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `handle` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `offset` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `origin` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3208)

<a id="function-function-mq3-engine-local-qvm-match-uisetbinding-function-uisetbinding-context-key-text-src-mq3-engine-local-qvm-match-ml-460410493"></a>
### uiSetBinding

```ml
function uiSetBinding(context, key, text)
```

Compute ui set binding in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameKeys`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.vm.cgame_key_traps.setBinding`. |
| `text` | `dynamic` | — | Value passed as `value` to `mq3.vm.cgame_key_traps.setBinding`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2838)

<a id="function-function-mq3-engine-local-qvm-match-uisetcatcher-function-uisetcatcher-context-value-src-mq3-engine-local-qvm-match-ml-1330758810"></a>
### uiSetCatcher

```ml
function uiSetCatcher(context, value)
```

Update `context.uiKeyCatcher` in engine.local_qvm_match.

Direct state writes: `context.uiKeyCatcher`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameKeys`. Updated in place: `uiKeyCatcher`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.vm.cgame_key_traps.setCatcher`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2876)

<a id="function-function-mq3-engine-local-qvm-match-uisetcdkey-function-uisetcdkey-context-key-src-mq3-engine-local-qvm-match-ml-561483280"></a>
### uiSetCdKey

```ml
function uiSetCdKey(context, key)
```

Compute engine.local_qvm_match.uiSetCdKey as `void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `key` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3197)

<a id="function-function-mq3-engine-local-qvm-match-uisetcolor-function-uisetcolor-context-color-src-mq3-engine-local-qvm-match-ml-1271296320"></a>
### uiSetColor

```ml
function uiSetColor(context, color)
```

Return `mq3.renderer.command_queue.setColor(context.renderQueue, color)` from `engine.local_qvm_match.uiSetColor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `renderQueue`. |
| `color` | `dynamic` | — | Rgba passed as `rgba` to `mq3.renderer.command_queue.setColor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3064)

<a id="function-function-mq3-engine-local-qvm-match-uisetoverstrike-function-uisetoverstrike-context-value-src-mq3-engine-local-qvm-match-ml-306075018"></a>
### uiSetOverstrike

```ml
function uiSetOverstrike(context, value)
```

Return `mq3.vm.cgame_key_traps.setOverstrike(context.cgameKeys, value)` from `engine.local_qvm_match.uiSetOverstrike`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `cgameKeys`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.vm.cgame_key_traps.setOverstrike`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2849)

<a id="function-function-mq3-engine-local-qvm-match-uistartmusic-function-uistartmusic-context-intro-trackloop-src-mq3-engine-local-qvm-match-ml-420019570"></a>
### uiStartMusic

```ml
function uiStartMusic(context, intro, trackLoop)
```

Update `context.soundCommands` in engine.local_qvm_match.

Direct state writes: `context.soundCommands`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `soundCommands`. Updated in place: `soundCommands`. |
| `intro` | `dynamic` | — | Text passed as `text` to `mq3.engine.local_qvm_match.soundEvent`. |
| `trackLoop` | `dynamic` | — | Text 2 passed as `text2` to `mq3.engine.local_qvm_match.soundEvent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3181)

<a id="function-function-mq3-engine-local-qvm-match-uistopmusic-function-uistopmusic-context-src-mq3-engine-local-qvm-match-ml-479295153"></a>
### uiStopMusic

```ml
function uiStopMusic(context)
```

Update `context.soundCommands` in engine.local_qvm_match.

Direct state writes: `context.soundCommands`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `soundCommands`. Updated in place: `soundCommands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3174)

<a id="function-function-mq3-engine-local-qvm-match-uistretchpic-function-uistretchpic-context-values-shader-src-mq3-engine-local-qvm-match-ml-1881177806"></a>
### uiStretchPic

```ml
function uiStretchPic(context, values, shader)
```

Return `mq3.renderer.command_queue.stretchPicValues(context.renderQueue, values, shader)` from `engine.local_qvm_match.uiStretchPic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `renderQueue`. |
| `values` | `dynamic` | — | Values passed as `values` to `mq3.renderer.command_queue.stretchPicValues`. |
| `shader` | `dynamic` | — | Shader handle passed as `shaderHandle` to `mq3.renderer.command_queue.stretchPicValues`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3069)

<a id="function-function-mq3-engine-local-qvm-match-uiunique-function-uiunique-values-value-src-mq3-engine-local-qvm-match-ml-359805103"></a>
### uiUnique

```ml
function uiUnique(values, value)
```

Compute ui unique in engine.local_qvm_match; the normal completion returns `(values + [value])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Values used in `(values + [value])`. |
| `value` | `dynamic` | — | Value used in `(values + [value])` and `strings.toLowerAscii(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2976)

<a id="function-function-mq3-engine-local-qvm-match-uiverifycdkey-function-uiverifycdkey-context-key-checksum-src-mq3-engine-local-qvm-match-ml-1345454823"></a>
### uiVerifyCdKey

```ml
function uiVerifyCdKey(context, key, checksum)
```

Compute engine.local_qvm_match.uiVerifyCdKey as `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `key` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `checksum` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L3202)

<a id="function-function-mq3-engine-local-qvm-match-unlinkentity-function-unlinkentity-context-entity-src-mq3-engine-local-qvm-match-ml-835707934"></a>
### unlinkEntity

```ml
function unlinkEntity(context, entity)
```

Compute unlink entity in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `spatialScene`. |
| `entity` | `dynamic` | — | Entity passed as `entity` to `mq3.engine.local_qvm_match.entityIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L626)

<a id="function-function-mq3-engine-local-qvm-match-updateaasentity-function-updateaasentity-context-vm-base-src-mq3-engine-local-qvm-match-ml-330797949"></a>
### updateAasEntity

```ml
function updateAasEntity(context, vm, base)
```

Update aas entity in engine.local_qvm_match; the normal completion returns `aasEntities.AAS_UpdateEntity(context.aasEntities, number, state, bounds)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `botlib`, `aasEntities`, `collisionWorld`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L767)

<a id="function-function-mq3-engine-local-qvm-match-updateclientconsole-function-updateclientconsole-value-now-framemsec-src-mq3-engine-local-qvm-match-ml-598295128"></a>
### updateClientConsole

```ml
function updateClientConsole(value, now, frameMsec)
```

Update client console in engine.local_qvm_match; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `context`. |
| `now` | `dynamic` | — | Now operand used by `updateClientConsole`; its reads are shown in the implementation. |
| `frameMsec` | `dynamic` | — | Frame msec operand used by `updateClientConsole`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2954)

<a id="function-function-mq3-engine-local-qvm-match-updatescreen-function-updatescreen-context-src-mq3-engine-local-qvm-match-ml-1325828907"></a>
### updateScreen

```ml
function updateScreen(context)
```

Compute engine.local_qvm_match.updateScreen as `void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2234)

- [mq3.engine.local_qvm_match.UserSettings](Type-mq3-engine-local-qvm-match-usersettings-1631405870.md) — struct
<a id="function-function-mq3-engine-local-qvm-match-vminfocommand-function-vminfocommand-commandstate-machineruntime-src-mq3-engine-local-qvm-match-ml-298854993"></a>
### vmInfoCommand

```ml
function vmInfoCommand(commandState, machineRuntime)
```

Compute info command in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.emit`. |
| `machineRuntime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.vm.runtime.info`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L250)

<a id="function-function-mq3-engine-local-qvm-match-vmprofilecommand-function-vmprofilecommand-commandstate-machineruntime-src-mq3-engine-local-qvm-match-ml-1955188885"></a>
### vmProfileCommand

```ml
function vmProfileCommand(commandState, machineRuntime)
```

Compute profile command in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.emit`. |
| `machineRuntime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.vm.runtime.profile`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L242)

<a id="function-function-mq3-engine-local-qvm-match-vmruntimeaddcommand-function-vmruntimeaddcommand-host-name-machineruntime-src-mq3-engine-local-qvm-match-ml-677537586"></a>
### vmRuntimeAddCommand

```ml
function vmRuntimeAddCommand(host, name, machineRuntime)
```

Compute runtime add command in engine.local_qvm_match; the normal completion returns `commands.addContextCommand(host.context.commandState, name, vmInfoCommand, machineRuntime)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.command_buffer.addContextCommand`. |
| `machineRuntime` | `dynamic` | — | Context passed as `context` to `mq3.qcommon.command_buffer.addContextCommand`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L258)

<a id="function-function-mq3-engine-local-qvm-match-vmruntimedeveloper-function-vmruntimedeveloper-host-src-mq3-engine-local-qvm-match-ml-1928387616"></a>
### vmRuntimeDeveloper

```ml
function vmRuntimeDeveloper(host)
```

Compute engine.local_qvm_match.vmRuntimeDeveloper as `(cvar.variableIntegerValue(host.context.cvars, "developer") != 0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L238)

<a id="function-function-mq3-engine-local-qvm-match-vmruntimeregister-function-vmruntimeregister-host-name-value-flags-src-mq3-engine-local-qvm-match-ml-943298985"></a>
### vmRuntimeRegister

```ml
function vmRuntimeRegister(host, name, value, flags)
```

Compute runtime register in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.cvar.get`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.cvar.get`. |
| `flags` | `dynamic` | — | Flags passed as `flags` to `mq3.qcommon.cvar.get`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L235)

<a id="function-function-mq3-engine-local-qvm-match-writecgamemarks-function-writecgamemarks-context-vm-base-cache-src-mq3-engine-local-qvm-match-ml-1128144419"></a>
### writeCgameMarks

```ml
function writeCgameMarks(context, vm, base, cache)
```

Write cgame marks in engine.local_qvm_match; the normal completion returns `len(result.fragments)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `markMap`, `collisionWorld`. |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `cache` | `dynamic` | — | Cache passed as `cache` to `mq3.renderer.mark_fragments.projectWithCache`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2482)

<a id="function-function-mq3-engine-local-qvm-match-writefile-function-writefile-context-handle-data-src-mq3-engine-local-qvm-match-ml-1585405023"></a>
### writeFile

```ml
function writeFile(context, handle, data)
```

Write file in engine.local_qvm_match; the normal completion returns `len(data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `files`. |
| `handle` | `dynamic` | — | Zero-based index into `context.files`. |
| `data` | `dynamic` | — | Data used in `len(data)` and `fs.appendAllBytes(path, data)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L443)

<a id="function-function-mq3-engine-local-qvm-match-writespatialentity-function-writespatialentity-context-index-src-mq3-engine-local-qvm-match-ml-1908738781"></a>
### writeSpatialEntity

```ml
function writeSpatialEntity(context, index)
```

Write spatial entity in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record exposing `gameEntities`, `entityStride`, `spatialScene`, `linked`. |
| `index` | `dynamic` | — | Zero-based index into `context.spatialScene.entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L569)

<a id="function-function-mq3-engine-local-qvm-match-writevector-function-writevector-data-at-value-src-mq3-engine-local-qvm-match-ml-823677804"></a>
### writeVector

```ml
function writeVector(data, at, value)
```

Write vector in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.compat.numeric.writeU32`. |
| `at` | `dynamic` | — | At used in `(at + (axis * 4))` and `n.writeU32(data, (at + (axis * 4)), n.floatBits(value[axis]))`. |
| `value` | `dynamic` | — | Value used in `value[axis]` and `n.floatBits(value[axis])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L547)

<a id="function-function-mq3-engine-local-qvm-match-writewords-function-writewords-output-offset-words-src-mq3-engine-local-qvm-match-ml-965889647"></a>
### writeWords

```ml
function writeWords(output, offset, words)
```

Write words in engine.local_qvm_match.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Data passed as `data` to `mq3.compat.numeric.writeU32`. |
| `offset` | `dynamic` | — | Offset used in `(offset + (index * 4))` and `n.writeU32(output, (offset + (index * 4)), words[index])`. |
| `words` | `dynamic` | — | Words used in `len(words)` and `words[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/engine/local_qvm_match.ml#L2056)
