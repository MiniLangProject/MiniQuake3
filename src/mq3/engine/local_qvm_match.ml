// SPDX-License-Identifier: GPL-2.0-or-later
// In-process Baseq3 QVM match host. This is the bridge from the engine services
// to the retail qagame/cgame modules, independent of the playable preview.
package mq3.engine.local_qvm_match

import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.shared.parser as parser
import mq3.qcommon.cvar as cvar
import mq3.qcommon.cvar_commands as cvarCommands
import mq3.qcommon.command_buffer as commands
import mq3.vm.runtime as runtime
import mq3.vm.syscall_common as common
import mq3.vm.syscall_qagame as qagame
import mq3.vm.syscall_qagame_world as qworld
import mq3.server.game_vm as gameVm
import mq3.server.init_runtime as serverInit
import mq3.server.abi as serverAbi
import mq3.game.entitystate as entitystate
import mq3.game.playerstate as playerstate
import mq3.game.constants as gameConstants
import mq3.vm.syscall_cgame as cgameSyscall
import mq3.vm.cgame_key_traps as cgameKeys
import mq3.vm.cgame_pc_traps as cgamePc
import mq3.vm.cgame_misc_traps as cgameMisc
import mq3.client.cgame_vm as cgameVm
import mq3.client.server_command_stream as serverCommandStream
import mq3.client.server_stream as serverStream
import mq3.client.cl_cgame_runtime as clientCgame
import mq3.client.gamestate as gamestate
import mq3.client.ui_vm as uiVm
import mq3.client.ui_host_lifecycle as uiHost
import mq3.vm.syscall_ui as uiSyscall
import mq3.vm.syscall_ui_media as uiMedia
import mq3.compat.numeric as n
import mq3.renderer.scene_queue as sceneQueue
import mq3.renderer.command_queue as renderQueue
import mq3.collision.world as collision
import mq3.collision.visibility as visibility
import mq3.server.world as serverWorld
import mq3.server.snapshot_build as snapshotBuild
import mq3.botlib.lifecycle_runtime as botlibRuntime
import mq3.botlib.be_interface as botInterface
import mq3.botlib.aas_runtime as aasRuntime
import mq3.botlib.aas_sample as aasSample
import mq3.botlib.aas_routing as aasRouting
import mq3.botlib.aas_routing_cache as aasRoutingCache
import mq3.botlib.aas_route_extras as aasRouteExtras
import mq3.botlib.aas_route_extra_syscalls as aasRouteExtraSyscalls
import mq3.botlib.aas_syscalls as aasSyscalls
import mq3.botlib.aas_bspq3 as aasBspq3
import mq3.botlib.aas_entities as aasEntities
import mq3.botlib.aas_query_syscalls as aasQuerySyscalls
import mq3.botlib.aas_movement_queries as aasMovementQueries
import mq3.format.aas as aasFormat
import mq3.botlib.be_aas_file as aasFile
import mq3.botlib.elementary_actions as elementaryActions
import mq3.botlib.elementary_action_syscalls as elementaryActionSyscalls
import mq3.botlib.ai_characters as aiCharacters
import mq3.botlib.ai_character_syscalls as aiCharacterSyscalls
import mq3.botlib.ai_resource_pools as aiResourcePools
import mq3.botlib.ai_resource_syscalls as aiResourceSyscalls
import mq3.botlib.ai_chat_profiles as aiChatProfiles
import mq3.botlib.ai_chat_syscalls as aiChatSyscalls
import mq3.botlib.ai_console_messages as aiConsoleMessages
import mq3.botlib.ai_item_weights as aiItemWeights
import mq3.botlib.ai_item_weight_syscalls as aiItemWeightSyscalls
import mq3.botlib.ai_level_items as aiLevelItems
import mq3.botlib.ai_goal_state as aiGoalState
import mq3.botlib.ai_goal_state_syscalls as aiGoalStateSyscalls
import mq3.botlib.ai_goal_selection as aiGoalSelection
import mq3.botlib.ai_goal_selection_syscalls as aiGoalSelectionSyscalls
import mq3.botlib.ai_chat_strings as aiChatStrings
import mq3.botlib.ai_chat_string_syscalls as aiChatStringSyscalls
import mq3.botlib.ai_chat_matches as aiChatMatches
import mq3.botlib.ai_chat_match_syscalls as aiChatMatchSyscalls
import mq3.botlib.ai_chat_output as aiChatOutput
import mq3.botlib.ai_chat_output_syscalls as aiChatOutputSyscalls
import mq3.botlib.ai_chat_goal_tail as aiChatGoalTail
import mq3.botlib.ai_chat_goal_tail_syscalls as aiChatGoalTailSyscalls
import mq3.botlib.ai_move_runtime as aiMoveRuntime
import mq3.botlib.ai_move_syscalls as aiMoveSyscalls
import mq3.botlib.ai_predict_visible_position as aiPredictVisible
import mq3.botlib.ai_predict_visible_position_syscalls as aiPredictVisibleSyscalls
import mq3.botlib.ai_map_goals as aiMapGoals
import mq3.botlib.ai_map_goal_syscalls as aiMapGoalSyscalls
import mq3.botlib.ai_weapon_weights as aiWeaponWeights
import mq3.botlib.ai_weapon_weight_syscalls as aiWeaponWeightSyscalls
import mq3.botlib.ai_weapon_combat as aiWeaponCombat
import mq3.botlib.ai_weapon_combat_syscalls as aiWeaponCombatSyscalls
import mq3.botlib.ai_avoid_spots as aiAvoidSpots
import mq3.botlib.ai_avoid_spot_syscalls as aiAvoidSpotSyscalls
import mq3.botlib.server_bridge as botServerBridge
import mq3.botlib.server_imports as botServerImports
import mq3.botlib.aas_client_movement as aasClientMovement
import mq3.botlib.aas_client_trace as aasClientTrace
import mq3.botlib.aas_client_movement_syscalls as aasClientMovementSyscalls
import mq3.botlib.aas_trace_areas as aasTraceAreas
import mq3.renderer.playable_light_grid as lightGrid
import mq3.renderer.model_tags as modelTags
import mq3.renderer.model_bounds as modelBounds
import mq3.renderer.mark_fragments as markFragments
import mq3.vm.cgame_collision_cache as cgameCollisionCache
import mq3.renderer.qvm_scene_geometry as qvmSceneGeometry
import mq3.renderer.shader_remap as shaderRemap
import mq3.renderer.pvs_query as rendererPvs
import mq3.qcommon.memory_file_seek as memoryFileSeek
import mq3.format.md3 as md3
import mq3.vm.font_abi as fontAbi
import mq3.vm.pc_parser as pcParser
import mq3.client.cinematic_runtime as cinematics
import mq3.client.cgame_usercmd as cgameUsercmd
import mq3.client.command_ring as matchCommandRing
import mq3.client.qvm_frame_input as clientFrameInput
import mq3.client.cgame_console_commands as nativeCgameCommands
import mq3.client.cgame_snapshot as nativeCgameSnapshot
import mq3.client.cgame_predict as nativeCgamePredict
import mq3.game.movement as nativeMovement
import mq3.game.trajectory as gameTrajectory
import mq3.client.cgame_event as nativeCgameEvent
import mq3.client.cgame_playerstate as nativeCgamePlayerstate
import mq3.client.cgame_ents as nativeCgameEnts
import mq3.client.cgame_localents as nativeCgameLocalents
import mq3.client.cgame_effects as nativeCgameEffects
import mq3.client.cgame_weapons as nativeCgameWeapons
import mq3.client.cgame_view as nativeCgameView
import mq3.client.cgame_drawtools as nativeCgameDrawtools
import mq3.client.cgame_draw as nativeCgameDraw
import mq3.client.cgame_particles as nativeCgameParticles
import mq3.client.cgame_servercmds as nativeCgameServercmds
import mq3.client.cgame_main as nativeCgameMain
import mq3.client.cgame_marks as nativeCgameMarks
import mq3.client.cgame_players as nativeCgamePlayers
import mq3.client.key_bindings_config as bindingConfig
import mq3.client.console_input as consoleInput
import mq3.client.cl_console as clientConsole
import mq3.client.ui_lan_browser as uiLan
import mq3.client.ui_lan_cache as uiLanCache
import mq3.client.ui_lan_ingress as uiLanIngress
import mq3.client.ui_lan_queries as uiLanQueries
import mq3.client.ui_lan_udp as uiLanUdp
import mq3.platform.win_main_runtime as botCacheWinMain
import std.fs as fs
import std.string as strings
import std.ds.list as lists
import mq3.format.mod_stack as modStack

/// Number of server configuration-string slots exposed through VM traps.
const MAX_CONFIGSTRINGS=1024
/// Maximum number of client slots supported by this interface.
const MAX_CLIENTS=64
// The pinned 1.32b g_public.h intentionally embeds entityState_t at the start
// of entityShared_t. gentity_t consequently contains s followed by r.s and the
// engine-owned shared fields below. These are QVM byte offsets, not host layout.
const R_LINKED=416
/// Byte offset of the link count field in the QVM shared-entity record.
const R_LINKCOUNT=420
/// Byte offset of the server flags field in the QVM shared-entity record.
const R_SVFLAGS=424
/// Byte offset of the single-client selector field in the QVM shared-entity record.
const R_SINGLECLIENT=428
/// Byte offset of the brush-model flag field in the QVM shared-entity record.
const R_BMODEL=432
/// Byte offset of the local minimum bounds field in the QVM shared-entity record.
const R_MINS=436
/// Byte offset of the local maximum bounds field in the QVM shared-entity record.
const R_MAXS=448
/// Byte offset of the contents flags field in the QVM shared-entity record.
const R_CONTENTS=460
/// Byte offset of the absolute minimum bounds field in the QVM shared-entity record.
const R_ABSMIN=464
/// Byte offset of the absolute maximum bounds field in the QVM shared-entity record.
const R_ABSMAX=476
/// Byte offset of the current origin field in the QVM shared-entity record.
const R_CURRENTORIGIN=488
/// Byte offset of the current angles field in the QVM shared-entity record.
const R_CURRENTANGLES=500
/// Byte offset of the owner entity number field in the QVM shared-entity record.
const R_OWNERNUM=512

/// FileCursor record for engine.local_qvm_match, containing `data`, `offset`, `writePath`.
struct FileCursor
  /// Buffered contents of the file opened through the VM filesystem traps.
  data
  /// Byte offset of the current cursor or data range.
  offset
  /// Destination path used when the file cursor is closed or flushed.
  writePath
end struct
/// Refdef record for engine.local_qvm_match, containing `x`, `y`, `width`, `height`, `fovX`, `fovY`, and 5 further fields.
struct Refdef
  /// Horizontal position of the view or drawing rectangle, in pixels.
  x
  /// Vertical position of the view or drawing rectangle, in pixels.
  y
  /// Width in pixels of the client-game viewport decoded from the VM request.
  width
  /// Height in pixels of the client-game viewport decoded from the VM request.
  height
  /// Horizontal camera field of view, in degrees.
  fovX
  /// Vertical camera field of view, in degrees.
  fovY
  /// Camera origin in world coordinates.
  vieworg
  /// Camera orientation represented by three basis vectors.
  viewaxis
  /// Client-game view time in milliseconds decoded from the VM rendering request.
  time
  /// View-definition flags controlling world and special-effect rendering.
  flags
  /// Area-visibility mask; set bits suppress rendering of the associated areas.
  areaMask
end struct
/// SoundCommand record for engine.local_qvm_match, containing `kind`, `entity`, `channel`, `handle`, `origin`, `velocity`, and 4 further fields.
struct SoundCommand
  /// Sound request operation, such as starting playback, updating the listener, or stopping music.
  kind
  /// Entity identifier associated with the VM sound request.
  entity
  /// Selected sound or MIDI channel associated with the operation.
  channel
  /// Resource handle used to identify the registered or opened object.
  handle
  /// World position supplied by a positional sound, looping sound, entity update, or listener request.
  origin
  /// Velocity supplied with the sound or entity update.
  velocity
  /// Listener orientation basis carried by a spatial-sound listener update.
  axis
  /// Operation-specific Boolean or flag passed through the VM sound request.
  flag
  /// Text payload, script source, or message associated with this record.
  text
  /// Second text argument carried by the VM sound request.
  text2
end struct
/// RenderView record for engine.local_qvm_match, containing `refdef`, `scene`.
struct RenderView
  /// Camera, viewport, timing, and rendering flags for the view.
  refdef
  /// Scene entities, lights, and polygons collected for drawing.
  scene
end struct
/// Context record for engine.local_qvm_match, containing `archive`, `entityParser`, `cvars`, `commandState`, `configstrings`, `userinfos`, and 106 further fields.
struct Context
  /// Asset archive used to resolve game resources by virtual path.
  archive
  /// Cursor used to read key/value entities from the BSP entity lump.
  entityParser
  /// Console variables and their current runtime values.
  cvars
  /// Runtime state of the command parser and command buffer.
  commandState
  /// Server configuration strings exposed to game and client VMs.
  configstrings
  /// Per-client user-information strings exposed through VM traps.
  userinfos
  /// Latest input commands supplied to the game VM for each client.
  usercmds
  /// Open VM file handles and their associated cursors.
  files
  /// Next handle identifier allocated when a VM opens a file.
  nextFile
  /// Messages captured from diagnostic print operations.
  prints
  /// Errors recorded by this subsystem or its host callbacks.
  errors
  /// Console output and commands exchanged with the VM host.
  console
  /// Game entity records shared with the game VM.
  gameEntities
  /// Game client records shared with the game VM.
  gameClients
  /// Number of game entities currently exposed by the VM.
  entityCount
  /// Distance in bytes between consecutive game entity records.
  entityStride
  /// Distance in bytes between consecutive game client records.
  clientStride
  /// Current host time in milliseconds.
  now
  /// Number of local game-host frames executed.
  frames
  /// Entity-link state used by server collision and spatial queries.
  linked
  /// Registered resource handles and their backing asset data.
  assets
  /// Resource kinds associated with registered asset handles.
  assetKinds
  /// Model data associated with registered model handles.
  modelAssets
  /// Cached world geometry used when projecting impact marks.
  markGeometry
  /// Sound requests collected from game or client VM traps.
  soundCommands
  /// Most recently published client snapshot.
  latestSnapshot
  /// Sequence number of the latest available client snapshot.
  snapshotNumber
  /// Most recent camera and viewport definition submitted by the client VM.
  latestRefdef
  /// Scene entities, lights, and polygons collected for drawing.
  scene
  /// Queued scene and drawing commands produced by the client VM.
  renderQueue
  /// Filesystem root used to resolve game, client-game, and UI QVM modules.
  qvmRoot
  /// Loaded world data used for point contents and collision traces.
  collisionWorld
  /// Spatial index containing entities used by collision queries.
  spatialScene
  /// Runtime services used to execute the loaded QVM machines.
  machineRuntime
  /// Sequence number of the current client user command.
  commandNumber
  /// Ring or history buffer containing recent client user commands.
  usercmdHistory
  /// Client-game collision query adapter and scratch state.
  cgameCollisionQueries
  /// Client-game model-tag lookup adapter and scratch state.
  cgameTagQueries
  /// Baked lighting grid used to light dynamic entities.
  lightGrid
  /// Input-capture flags controlling which keys are routed to the UI VM.
  uiKeyCatcher
  /// Number of UI frame updates processed by the host.
  uiFrames
  /// Camera and scene submissions collected for rendering.
  renderViews
  /// World-surface map used when clipping projected marks.
  markMap
  /// Font assets and glyph metadata registered by the VMs.
  fontRegistry
  /// Parser-source handles used by the VM parser traps.
  pcRegistry
  /// Active cinematic handles, decoded frames, and playback state.
  cinematics
  /// Invocation counts for client-game VM system calls.
  cgameTrapCounts
  /// Bot-library state exposed to game VM system calls.
  botlib
  /// Loaded area-awareness navigation data used by bot queries.
  aas
  /// Routing state used to find paths through the AAS navigation graph.
  aasRouter
  /// Cached travel-time and route results for the AAS graph.
  aasRouteCache
  /// File path used to load or persist the AAS routing cache.
  aasCachePath
  /// BSP entity data exposed to bot-library queries.
  botBspEntities
  /// Shader name substitutions and associated effect-time offsets.
  shaderRemaps
  /// Per-client state maintained by the local game host.
  clientStates
  /// Number of bot-client allocations requested through VM traps.
  botAllocations
  /// Number of bot-client releases requested through VM traps.
  botFrees
  /// Movement and button actions accumulated by bot elementary-action traps.
  elementaryActions
  /// Most recently dispatched bot-library system-call identifier.
  lastBotTrap
  /// Dynamic entity states supplied to the AAS navigation subsystem.
  aasEntities
  /// Loaded bot-character profiles and characteristic values.
  aiCharacters
  /// Handle pools and resources owned by the bot AI subsystems.
  aiResources
  /// State and scratch data for predicted AAS movement queries.
  aasMovement
  /// Item desirability weights used by bot goal selection.
  aiItemWeights
  /// Bot chat contexts and conversation state.
  aiChat
  /// Weapon preference weights used by bot combat decisions.
  aiWeaponWeights
  /// Server-side adapter for bot clients and bot frame updates.
  botServer
  /// Console-message queues consumed by bot AI.
  aiConsole
  /// Cursor over map entity text exposed by renderer traps.
  rendererEntityTokens
  /// Level item catalog used by bot goal queries.
  aiLevelItems
  /// Goal stacks and avoid-goal state for active bots.
  aiGoalState
  /// State used to select long-term and nearby bot goals.
  aiGoalSelection
  /// Named chat strings and substitution data for bot conversations.
  aiChatStrings
  /// Chat-message matching rules and captured variables.
  aiChatMatches
  /// Extended chat and goal trap state maintained by the host.
  aiChatGoalTail
  /// Bot movement contexts used by movement decision traps.
  aiMoveRuntime
  /// State used to predict positions visible to a bot.
  aiVisiblePosition
  /// Generated chat messages awaiting delivery to the game.
  aiChatOutput
  /// Map-defined goal records used by bot navigation.
  aiMapGoals
  /// LAN server browser state exposed to the UI VM.
  uiLan
  /// Key bindings and key-capture state exposed to the client-game VM.
  cgameKeys
  /// Host adapter used to persist or restore the UI server cache.
  uiLanCacheHost
  /// Client-game overrides applied when constructing user commands.
  cgameUsercmd
  /// Incoming network data routed to the UI LAN browser.
  uiLanIngress
  /// Outstanding LAN server-information and status queries.
  uiLanQueries
  /// UDP transport used by UI LAN browser requests.
  uiLanUdp
  /// Server-command history exposed to the client-game VM.
  cgameServerCommands
  /// Client connection state exposed to UI system calls.
  uiClient
  /// Native client-game command processing state.
  nativeCgameCommands
  /// Text-entry state for client console and UI input.
  clientTextInput
  /// Native client-game snapshot processing state.
  nativeSnapshots
  /// Native client-game player-state transition state.
  nativePlayerState
  /// Native client-game entity-event processing state.
  nativeEvents
  /// Native client-game entity presentation state.
  nativeEntities
  /// Native client-game temporary and local entity state.
  nativeLocalEntities
  /// Native client-game transient visual-effect state.
  nativeEffects
  /// Native client-game weapon rendering and effect state.
  nativeWeapons
  /// Native client-game camera and view calculation state.
  nativeView
  /// Native client-game drawing primitives and HUD helpers.
  nativeDrawtools
  /// Native client-game HUD and overlay drawing state.
  nativeDraw
  /// Native client-game particle simulation state.
  nativeParticles
  /// Native client-game server-command dispatch state.
  nativeServerCmds
  /// Native client-game lifecycle and frame orchestration state.
  nativeMain
  /// Native client-game persistent impact-mark state.
  nativeMarks
  /// Native client-game player model and animation state.
  nativePlayers
  /// Loaded game VM instance or native game state used by the local match.
  game
  /// Memoized client-game queries reused within the current frame.
  cgameQueryMemo
  /// Host state supplied when captured input must be cleared.
  inputClearContext
  /// Host callback used to perform input clear operations for this subsystem.
  inputClearFn
  /// Client console commands waiting for execution.
  pendingClientCommands
  /// Reusable storage for client-game snapshot trap results.
  cgameSnapshotScratch
  /// Stream that carries local server messages to the client.
  serverStream
end struct
/// Boot record for engine.local_qvm_match, containing `game`, `runtime`, `context`, `cgame`, `ui`.
struct Boot
  /// Loaded game VM instance or native game state used by the local match.
  game
  /// Runtime object used to execute the subsystem's operations.
  runtime
  /// Shared local-match host state used by the loaded game, client-game, and UI VMs.
  context
  /// Loaded client-game VM instance used by the local match.
  cgame
  /// Loaded user-interface VM instance used by the local match.
  ui
end struct
/// Snapshot record for engine.local_qvm_match, containing `serverTime`, `playerState`, `entities`, `areaBits`.
struct Snapshot
  /// Server timestamp of the snapshot, in milliseconds.
  serverTime
  /// Player movement and gameplay state carried by the snapshot.
  playerState
  /// Entity records associated with the current world, scene, or snapshot.
  entities
  /// Bit mask describing the snapshot's visible or accessible areas.
  areaBits
end struct
// The original engine keeps one cvar/key/userinfo store alive while moving
// from ui.qvm into a local game.  MiniQuake3 boots the heavy game host only
// after the UI selects a map, so explicitly carry that persistent state across
// the host boundary instead of silently reverting menu choices and bindings.
struct UserSettings
  /// Console variables and their current runtime values.
  cvars
  /// Bindings associating names or handles with their backing resources.
  bindings
  /// Per-client user-information strings exposed through VM traps.
  userinfos
  /// Bot-related console commands awaiting execution.
  pendingBotCommands
end struct

/// Create the engine.local_qvm_match error for `fail` with 7640 and the supplied diagnostic text.
/// @param message Message used in `("local QVM match: " + message)` and `error(7640, ("local QVM match: " + message))`.
function fail(message) return error(7640,"local QVM match: "+message) end function

/// Compute image loader in engine.local_qvm_match; the normal completion returns `data`.
/// @param services Record exposing `context`.
/// @param path Name passed as `name` to `mq3.format.pk3.findEntry`.
function imageLoader(services,path)
  active=services.context.archive.modArchive
  if active!=void then
    modEntry=pk3.findEntry(active,path)
    if modEntry!=void then return pk3.readEntry(active,modEntry) end if
  end if
  if services.context.qvmRoot!="" then
    data=try(fs.readAllBytes(services.context.qvmRoot+"/"+path));if not (data is error) then return data end if
    encoded=bytes(path);if len(encoded)>3 then shortPath=decode(slice(encoded,3,len(encoded)-3));data=try(fs.readAllBytes(services.context.qvmRoot+"/"+shortPath));if not (data is error) then return data end if end if
  end if
  data=try(pk3.read(services.context.archive,path));if data is error then return void end if;return data
end function
/// Return `mq3.vm.runtime.load(machineRuntime, name, syscall)` from `engine.local_qvm_match.loadVm`.
/// @param machineRuntime Runtime passed as `runtime` to `mq3.vm.runtime.load`.
/// @param name Name passed as `name` to `mq3.vm.runtime.load`.
/// @param syscall Syscall passed as `syscall` to `mq3.vm.runtime.load`.
function loadVm(machineRuntime,name,syscall) return runtime.load(machineRuntime,name,syscall) end function
/// Return `mq3.vm.runtime.call(machineRuntime, slot, args)` from `engine.local_qvm_match.callVm`.
/// @param machineRuntime Runtime passed as `runtime` to `mq3.vm.runtime.call`.
/// @param slot Slot passed as `slot` to `mq3.vm.runtime.call`.
/// @param args Args passed as `args` to `mq3.vm.runtime.call`.
function callVm(machineRuntime,slot,args) return runtime.call(machineRuntime,slot,args) end function
/// Return `mq3.vm.runtime.restart(machineRuntime, slot)` from `engine.local_qvm_match.restartVm`.
/// @param machineRuntime Runtime passed as `runtime` to `mq3.vm.runtime.restart`.
/// @param slot Slot passed as `slot` to `mq3.vm.runtime.restart`.
function restartVm(machineRuntime,slot) return runtime.restart(machineRuntime,slot) end function
/// Return `mq3.vm.runtime.free(machineRuntime, slot)` from `engine.local_qvm_match.freeVm`.
/// @param machineRuntime Runtime passed as `runtime` to `mq3.vm.runtime.free`.
/// @param slot Slot passed as `slot` to `mq3.vm.runtime.free`.
function freeVm(machineRuntime,slot) return runtime.free(machineRuntime,slot) end function
/// Return `mq3.vm.runtime.loadMode(machineRuntime, name, syscall, interpret)` from `engine.local_qvm_match.loadClientVm`.
/// @param machineRuntime Runtime passed as `runtime` to `mq3.vm.runtime.loadMode`.
/// @param name Name passed as `name` to `mq3.vm.runtime.loadMode`.
/// @param syscall Syscall passed as `syscall` to `mq3.vm.runtime.loadMode`.
/// @param interpret Mode passed as `mode` to `mq3.vm.runtime.loadMode`.
function loadClientVm(machineRuntime,name,syscall,interpret) return runtime.loadMode(machineRuntime,name,syscall,interpret) end function
/// Compute runtime register in engine.local_qvm_match.
/// @param host Record exposing `context`.
/// @param name Name passed as `name` to `mq3.qcommon.cvar.get`.
/// @param value Value passed as `value` to `mq3.qcommon.cvar.get`.
/// @param flags Flags passed as `flags` to `mq3.qcommon.cvar.get`.
function vmRuntimeRegister(host,name,value,flags) cvar.get(host.context.cvars,name,value,flags);return void end function
/// Compute engine.local_qvm_match.vmRuntimeDeveloper as `(cvar.variableIntegerValue(host.context.cvars, "developer") != 0)`.
/// @param host Record exposing `context`.
function vmRuntimeDeveloper(host) return cvar.variableIntegerValue(host.context.cvars,"developer")!=0 end function
/// Compute profile command in engine.local_qvm_match.
/// @param commandState State passed as `state` to `mq3.qcommon.command_buffer.emit`.
/// @param machineRuntime Runtime passed as `runtime` to `mq3.vm.runtime.profile`.
function vmProfileCommand(commandState,machineRuntime)
  report=runtime.profile(machineRuntime);if len(report)==0 then return void end if
  for each row in report[0] commands.emit(commandState,str(row[0])+"% "+str(row[1])+" "+row[2]+"\n") end for
  commands.emit(commandState,str(report[1])+" total\n");return void
end function
/// Compute info command in engine.local_qvm_match.
/// @param commandState State passed as `state` to `mq3.qcommon.command_buffer.emit`.
/// @param machineRuntime Runtime passed as `runtime` to `mq3.vm.runtime.info`.
function vmInfoCommand(commandState,machineRuntime)
  commands.emit(commandState,"Registered virtual machines:\n")
  for each row in runtime.info(machineRuntime) commands.emit(commandState,row[0]+" : "+row[1]+"\n") end for;return void
end function
/// Compute runtime add command in engine.local_qvm_match; the normal completion returns `commands.addContextCommand(host.context.commandState, name, vmInfoCommand, machineRuntime)`.
/// @param host Record exposing `context`.
/// @param name Name passed as `name` to `mq3.qcommon.command_buffer.addContextCommand`.
/// @param machineRuntime Context passed as `context` to `mq3.qcommon.command_buffer.addContextCommand`.
function vmRuntimeAddCommand(host,name,machineRuntime)
  if name=="vmprofile" then return commands.addContextCommand(host.context.commandState,name,vmProfileCommand,machineRuntime) end if
  return commands.addContextCommand(host.context.commandState,name,vmInfoCommand,machineRuntime)
end function
/// Compute engine.local_qvm_match.milliseconds as `context.now`.
/// @param context Record exposing `now`.
function milliseconds(context) return context.now end function
/// Emit print in engine.local_qvm_match; updates `context.prints`.
///
/// Direct state writes: `context.prints`.
/// @param context Record exposing `uiLanCacheHost`, `prints`, `clientTextInput`, `now`. Updated in place: `prints`.
/// @param text Text passed as `text` to `mq3.client.cl_console.CL_ConsolePrint`.
function emitPrint(context,text)
  // The desktop console owns a bounded scrollback. Standalone probes retain
  // their transcript, since they have no interactive desktop session.
  if context.uiLanCacheHost.context.root=="" then context.prints=context.prints+[text] end if
  if context.clientTextInput!=void and context.clientTextInput.consoleRuntime!=void then
    context.clientTextInput.consoleRuntime.realtime=context.now
    clientConsole.CL_ConsolePrint(context.clientTextInput.consoleRuntime,text,640)
  end if
  return void
end function
/// Emit error in engine.local_qvm_match; updates `context.errors`.
///
/// Direct state writes: `context.errors`.
/// @param context Record exposing `errors`. Updated in place: `errors`.
/// @param text Text used in `(context.errors + [text])`.
function emitError(context,text) context.errors=context.errors+[text];return void end function
/// Update `context.console` in engine.local_qvm_match; the normal completion returns `commands.executeText(context.commandState, when, text)`.
///
/// Direct state writes: `context.console`.
/// @param context Record exposing `console`, `uiLanQueries`, `now`, `commandState`. Updated in place: `console`.
/// @param when When passed as `when` to `mq3.qcommon.command_buffer.executeText`.
/// @param text Text passed as `text` to `mq3.qcommon.command_buffer.executeText`.
function consoleCommand(context,when,text)
  context.console=context.console+[[when,text]]
  command=strings.trim(text);parts=strings.split(command," ");if len(parts)==0 then return void end if
  name=strings.toLowerAscii(parts[0])
  if context.uiLanQueries!=void then uiLanQueries.setRealtime(context.uiLanQueries,context.now) end if
  if name=="localservers" and context.uiLanQueries!=void then return uiLanQueries.scanLocal(context.uiLanQueries) end if
  if name=="globalservers" and len(parts)>=3 and context.uiLanQueries!=void then
    master=toNumber(parts[1]);keywords=[];if len(parts)>3 then for index=3 to len(parts)-1 if parts[index]!="" then keywords=keywords+[parts[index]] end if end for end if
    return uiLanQueries.scanGlobal(context.uiLanQueries,master,parts[2],keywords,false)
  end if
  return commands.executeText(context.commandState,when,text)
end function
/// Return `mq3.qcommon.command_buffer.addText(context.commandState, text)` from `engine.local_qvm_match.consoleInputCommand`.
/// @param context Record exposing `commandState`.
/// @param text Text passed as `text` to `mq3.qcommon.command_buffer.addText`.
function consoleInputCommand(context,text) return commands.addText(context.commandState,text) end function
/// Compute console input reliable in engine.local_qvm_match.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.sendClientCommand`.
/// @param text Name passed as `name` to `mq3.engine.local_qvm_match.sendClientCommand`.
function consoleInputReliable(context,text) sendClientCommand(context,text);return void end function
/// Synchronize console input catcher in engine.local_qvm_match; updates `context.uiKeyCatcher`.
///
/// Direct state writes: `context.uiKeyCatcher`.
/// @param context Record exposing `clientTextInput`, `cgameKeys`. Updated in place: `uiKeyCatcher`.
function syncConsoleInputCatcher(context) context.uiKeyCatcher=context.clientTextInput.catcher;cgameKeys.setCatcher(context.cgameKeys,context.clientTextInput.catcher);return void end function
/// Synchronize console runtime in engine.local_qvm_match; the normal completion returns `runtime`.
/// @param context Record exposing `clientTextInput`, `now`, `uiClient`.
function syncConsoleRuntime(context) runtime=context.clientTextInput.consoleRuntime;if runtime!=void then runtime.realtime=context.now;context.clientTextInput.connectionState=context.uiClient.connState;runtime.connectionState=context.clientTextInput.connectionState;runtime.keyCatchers=context.clientTextInput.catcher;runtime.uiOrCgameCatcher=runtime.keyCatchers&(clientConsole.KEYCATCH_UI|clientConsole.KEYCATCH_CGAME);runtime.consoleInput.catcher=runtime.keyCatchers end if;return runtime end function
/// Test console scroll in engine.local_qvm_match; the normal completion returns `false`.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.syncConsoleRuntime`.
/// @param operation Operation used in `(operation == "top")` and `(operation == "pageup")`.
/// @param count Count used in `(count < 1)`.
function consoleScroll(context,operation,count)
  runtime=syncConsoleRuntime(context);if runtime==void then return false end if;if count<1 then count=1 end if
  if operation=="pageup" then for index=1 to count clientConsole.Con_PageUp(runtime) end for;return true end if
  if operation=="pagedown" then for index=1 to count clientConsole.Con_PageDown(runtime) end for;return true end if
  if operation=="top" then clientConsole.Con_Top(runtime);return true end if
  if operation=="bottom" then clientConsole.Con_Bottom(runtime);return true end if
  return false
end function
/// Return `mq3.qcommon.command_buffer.executeText(context.commandState, commands.EXEC_APPEND, "d1\n")` from `engine.local_qvm_match.consoleStartDemoLoop`.
/// @param context Record exposing `commandState`.
function consoleStartDemoLoop(context) return commands.executeText(context.commandState,commands.EXEC_APPEND,"d1\n") end function
/// Test toggle console command in engine.local_qvm_match; the normal completion returns `true`.
/// @param commandState Reserved argument; this implementation does not read its value.
/// @param context Record exposing `clientTextInput`.
function toggleConsoleCommand(commandState,context) runtime=syncConsoleRuntime(context);if runtime==void then consoleInput.toggleConsole(context.clientTextInput) else clientConsole.Con_ToggleConsole_f(runtime) end if;syncConsoleInputCatcher(context);return true end function
/// Test message mode command in engine.local_qvm_match; the normal completion returns `true`.
/// @param commandState Reserved argument; this implementation does not read its value.
/// @param context Record exposing `clientTextInput`.
function messageModeCommand(commandState,context) runtime=syncConsoleRuntime(context);if runtime==void then consoleInput.beginMessage(context.clientTextInput,false,-1) else clientConsole.Con_MessageMode_f(runtime) end if;syncConsoleInputCatcher(context);return true end function
/// Test message mode2 command in engine.local_qvm_match; the normal completion returns `true`.
/// @param commandState Reserved argument; this implementation does not read its value.
/// @param context Record exposing `clientTextInput`.
function messageMode2Command(commandState,context) runtime=syncConsoleRuntime(context);if runtime==void then consoleInput.beginMessage(context.clientTextInput,true,-1) else clientConsole.Con_MessageMode2_f(runtime) end if;syncConsoleInputCatcher(context);return true end function
/// Compute message mode3 command in engine.local_qvm_match; the normal completion returns `result`.
/// @param commandState Reserved argument; this implementation does not read its value.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.syncConsoleRuntime`.
function messageMode3Command(commandState,context) runtime=syncConsoleRuntime(context);if runtime==void then return false end if;result=clientConsole.Con_MessageMode3_f(runtime);syncConsoleInputCatcher(context);return result end function
/// Compute message mode4 command in engine.local_qvm_match; the normal completion returns `result`.
/// @param commandState Reserved argument; this implementation does not read its value.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.syncConsoleRuntime`.
function messageMode4Command(commandState,context) runtime=syncConsoleRuntime(context);if runtime==void then return false end if;result=clientConsole.Con_MessageMode4_f(runtime);syncConsoleInputCatcher(context);return result end function
/// Clear console command in engine.local_qvm_match; the normal completion returns `clientConsole.Con_Clear_f(runtime)`.
/// @param commandState Reserved argument; this implementation does not read its value.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.syncConsoleRuntime`.
function clearConsoleCommand(commandState,context) runtime=syncConsoleRuntime(context);if runtime==void then return false end if;return clientConsole.Con_Clear_f(runtime) end function
/// Compute dump console command in engine.local_qvm_match; the normal completion returns `not (typeof(result) == "error")`.
/// @param commandState State passed as `state` to `mq3.qcommon.command_buffer.argc`.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.syncConsoleRuntime`.
function dumpConsoleCommand(commandState,context) runtime=syncConsoleRuntime(context);if runtime==void or commands.argc(commandState)!=2 then return false end if;result=clientConsole.Con_Dump_f(runtime,commands.argv(commandState,1));return not (result is error) end function
/// Compute engine.local_qvm_match.sectorListCommand as `(serverWorld.SV_SectorList_f(context.spatialScene, emitPrint, context) == 64)`.
/// @param commandState Reserved argument; this implementation does not read its value.
/// @param context Record exposing `spatialScene`.
function sectorListCommand(commandState,context) return serverWorld.SV_SectorList_f(context.spatialScene,emitPrint,context)==64 end function
/// Return `mq3.client.cgame_main.crosshairPlayer(context.nativeMain)` from `engine.local_qvm_match.consoleCrosshairPlayer`.
/// @param context Record exposing `nativeMain`.
function consoleCrosshairPlayer(context) return nativeCgameMain.crosshairPlayer(context.nativeMain) end function
/// Return `mq3.client.cgame_main.lastAttacker(context.nativeMain)` from `engine.local_qvm_match.consoleLastAttacker`.
/// @param context Record exposing `nativeMain`.
function consoleLastAttacker(context) return nativeCgameMain.lastAttacker(context.nativeMain) end function

/// Compute desktop file path in engine.local_qvm_match; the normal completion returns `fs.joinPath(root, relative)`.
/// @param root Root used in `(root == "")` and `fs.joinPath(root, relative)`.
/// @param name Name used in `typeof(name)` and `(name == "")`.
function desktopFilePath(root,name)
  if root=="" or typeof(name)!="string" or name=="" then return "" end if
  relative=strings.replaceAll(name,"\\","/")
  for each component in strings.split(relative,"/")
    if component=="" or component[0]=="." or strings.endsWith(component,".") or strings.endsWith(component," ") then return "" end if
    for each ch in bytes(component)
      if ch<32 or ch==34 or ch==42 or ch==58 or ch==60 or ch==62 or ch==63 or ch==124 then return "" end if
    end for
  end for
  return fs.joinPath(root,relative)
end function
/// Open file in engine.local_qvm_match; the normal completion returns `common.OpenResult(handle, len(data))`.
///
/// Direct state writes: `context.files`, `context.nextFile`.
/// @param context Record exposing `archive`, `serverStream`, `uiLanCacheHost`, `files`, `nextFile`. Updated in place: `files`, `nextFile`.
/// @param name Name passed as `name` to `mq3.format.pk3.read`.
/// @param mode Mode used in `(mode < 1)` and `(mode > 3)`.
function openFile(context,name,mode)
  data=bytes(0,0);writePath=""
  if mode==0 then
    data=try(pk3.read(context.archive,name))
    if data is error then
      if context.serverStream!=void and context.serverStream.pure then
        lower=strings.toLowerAscii(name)
        if not (strings.endsWith(lower,".cfg") or strings.endsWith(lower,".menu") or strings.endsWith(lower,".game") or strings.endsWith(lower,".dm_68") or strings.endsWith(lower,".dat")) then
          return common.OpenResult(0,-1)
        end if
      end if
      path=desktopFilePath(context.uiLanCacheHost.context.root,name)
      if path=="" or not fs.isFile(path) then return common.OpenResult(0,-1) end if
      data=try(fs.readAllBytes(path));if data is error then return common.OpenResult(0,-1) end if
    end if
  else
    if mode<1 or mode>3 then return common.OpenResult(0,-1) end if
    writePath=desktopFilePath(context.uiLanCacheHost.context.root,name)
    lower=strings.toLowerAscii(name)
    // QVM output is data only. Never let a module replace game archives,
    // executables, or the QVMs that will be loaded during the next launch.
    if writePath=="" or not (strings.endsWith(lower,".log") or strings.endsWith(lower,".txt") or strings.endsWith(lower,".cfg") or strings.endsWith(lower,".game")) then return common.OpenResult(0,-1) end if
    created=void
    if mode==1 then created=try(fs.writeAllBytes(writePath,data))
    else created=try(fs.appendAllBytes(writePath,data)) end if
    if created is error or not created then return common.OpenResult(0,-1) end if
  end if
  handle=1
  while handle<len(context.files) and context.files[handle]!=void and context.files[handle].offset>=0 handle=handle+1 end while
  if handle>=len(context.files) then
    capacity=len(context.files)*2;if capacity<16 then capacity=16 end if
    expanded=array(capacity,void);if len(context.files)>0 then copyArray(expanded,0,context.files,0,len(context.files)) end if;context.files=expanded
  end if
  if handle>=context.nextFile then context.nextFile=handle+1 end if
  context.files[handle]=FileCursor(data,0,writePath);return common.OpenResult(handle,len(data))
end function
/// Read file in engine.local_qvm_match; the normal completion returns `result`.
/// @param context Record exposing `files`.
/// @param handle Zero-based index into `context.files`.
/// @param count Count used in `(count < 0)` and `(count > available)`.
function readFile(context,handle,count)
  if handle<=0 or handle>=len(context.files) or context.files[handle]==void or context.files[handle].offset<0 or count<0 then return bytes(0,0) end if
  cursor=context.files[handle];available=len(cursor.data)-cursor.offset;if available<=0 then return bytes(0,0) end if;if count>available then count=available end if
  result=slice(cursor.data,cursor.offset,count);cursor.offset=cursor.offset+count;return result
end function
/// Write file in engine.local_qvm_match; the normal completion returns `len(data)`.
/// @param context Record exposing `files`.
/// @param handle Zero-based index into `context.files`.
/// @param data Data used in `len(data)` and `fs.appendAllBytes(path, data)`.
function writeFile(context,handle,data)
  if handle<=0 or handle>=len(context.files) or context.files[handle]==void then return 0 end if
  path=context.files[handle].writePath;if path=="" then return 0 end if
  written=try(fs.appendAllBytes(path,data));if written is error or not written then return 0 end if
  return len(data)
end function
/// Close file in engine.local_qvm_match.
/// @param context Record exposing `files`.
/// @param handle Handle used in `(handle > 0)` and `(handle < len(context.files))`.
function closeFile(context,handle) if handle>0 and handle<len(context.files) then context.files[handle]=void end if;return void end function
/// Compute pc load in engine.local_qvm_match; the normal completion returns `data`.
/// @param context Record exposing `archive`.
/// @param name Name passed as `name` to `mq3.format.pk3.read`.
function pcLoad(context,name) data=try(pk3.read(context.archive,name));if data is error then return void end if;return data end function

/// Update `context.gameEntities`, `context.gameClients`, `context.entityCount`, `context.entityStride` in engine.local_qvm_match.
///
/// Direct state writes: `context.gameEntities`, `context.gameClients`, `context.entityCount`, `context.entityStride`, `context.clientStride`.
/// @param context Updated in place: `gameEntities`, `gameClients`, `entityCount`, `entityStride`, `clientStride`.
/// @param entities Entities operand used by `locateGameData`; its reads are shown in the implementation.
/// @param count Count operand used by `locateGameData`; its reads are shown in the implementation.
/// @param entityStride Entity stride operand used by `locateGameData`; its reads are shown in the implementation.
/// @param clients Clients operand used by `locateGameData`; its reads are shown in the implementation.
/// @param clientStride Client stride operand used by `locateGameData`; its reads are shown in the implementation.
function locateGameData(context,entities,count,entityStride,clients,clientStride)
  context.gameEntities=entities;context.gameClients=clients;context.entityCount=count;context.entityStride=entityStride;context.clientStride=clientStride;return void
end function
/// Update `context.console` in engine.local_qvm_match.
///
/// Direct state writes: `context.console`.
/// @param context Record exposing `clientStates`, `game`, `userinfos`, `linked`, `botServer`, `console`. Updated in place: `console`.
/// @param client Client num passed as `clientNum` to `mq3.server.game_vm.clientDisconnect`.
/// @param text Text used in `("drop " + text)` and `(context.console + [[client, ("drop " + text)]])`.
function dropClient(context,client,text)
  if client<0 or client>=len(context.clientStates) or context.clientStates[client]==0 then return void end if
  if context.game!=void then disconnected=gameVm.clientDisconnect(context.game,client);if disconnected is error then emitError(context,str(disconnected)) end if end if
  if context.clientStates[client]==2 then freeBot(context,client) else context.clientStates[client]=0;context.userinfos[client]="";context.linked[client]=false;botServerBridge.resetClient(context.botServer,client) end if
  context.console=context.console+[[client,"drop "+text]];return void
end function
/// Send server command in engine.local_qvm_match; updates `context.console`.
///
/// Direct state writes: `context.console`.
/// @param context Record exposing `console`, `cgameServerCommands`, `botServer`, `clientStates`. Updated in place: `console`.
/// @param client Client passed as `client` to `mq3.botlib.server_bridge.queueConsoleMessage`.
/// @param text Text passed as `text` to `mq3.client.server_command_stream.queue`.
function sendServerCommand(context,client,text)
  context.console=context.console+[[client,text]]
  if context.cgameServerCommands!=void and (client<0 or client==0) then serverCommandStream.queue(context.cgameServerCommands,text) end if
  if context.botServer!=void then
    if client>=0 then botServerBridge.queueConsoleMessage(context.botServer,client,text)
    else for index=0 to len(context.clientStates)-1 if context.clientStates[index]==2 then botServerBridge.queueConsoleMessage(context.botServer,index,text) end if end for end if
  end if;return void
end function
/// Set configstring in engine.local_qvm_match.
/// @param context Record exposing `configstrings`.
/// @param index Index used in `(index >= 0)` and `(index < MAX_CONFIGSTRINGS)`.
/// @param text Text operand used by `setConfigstring`; its reads are shown in the implementation.
function setConfigstring(context,index,text) if index>=0 and index<MAX_CONFIGSTRINGS then context.configstrings[index]=text end if;return void end function
/// Get configstring in engine.local_qvm_match; the normal completion returns `context.configstrings[index]`.
/// @param context Record exposing `configstrings`.
/// @param index Zero-based index into `context.configstrings`.
function getConfigstring(context,index) if index<0 or index>=MAX_CONFIGSTRINGS then return "" end if;return context.configstrings[index] end function
/// Get userinfo in engine.local_qvm_match; the normal completion returns `context.userinfos[index]`.
/// @param context Record exposing `userinfos`.
/// @param index Zero-based index into `context.userinfos`.
function getUserinfo(context,index) if index<0 or index>=len(context.userinfos) then return "" end if;return context.userinfos[index] end function
/// Set userinfo in engine.local_qvm_match.
/// @param context Record exposing `userinfos`.
/// @param index Index used in `(index >= 0)` and `(index < len(context.userinfos))`.
/// @param text Text operand used by `setUserinfo`; its reads are shown in the implementation.
function setUserinfo(context,index,text) if index>=0 and index<len(context.userinfos) then context.userinfos[index]=text end if;return void end function
/// Get serverinfo in engine.local_qvm_match; the normal completion returns `cvar.infoString(context.cvars, cvar.SERVERINFO)`.
/// @param context Record exposing `serverStream`, `configstrings`, `cvars`.
function getServerinfo(context)
  if context.serverStream!=void then return context.configstrings[0] end if
  // SV_SpawnServer publishes Cvar_InfoString(CVAR_SERVERINFO) as CS_SERVERINFO.
  // CG_ParseServerinfo reads maxclients from that configstring, not from the
  // separate GAME_GET_SERVERINFO trap used by qagame.
  return cvar.infoString(context.cvars,cvar.SERVERINFO)
end function
/// Compute entity index in engine.local_qvm_match; the normal completion returns `index`.
/// @param context Record exposing `entityStride`, `gameEntities`, `entityCount`.
/// @param entity Entity used in `(entity < context.gameEntities)` and `(entity - context.gameEntities)`.
function entityIndex(context,entity)
  if context.entityStride<=0 or entity<context.gameEntities then return -1 end if
  delta=entity-context.gameEntities;if delta%context.entityStride!=0 then return -1 end if
  index=delta/context.entityStride;if index<0 or index>=context.entityCount then return -1 end if;return index
end function
/// Compute game machine in engine.local_qvm_match; the normal completion returns `context.machineRuntime.current.machine`.
/// @param context Record exposing `machineRuntime`.
function gameMachine(context)
  if context.machineRuntime==void or context.machineRuntime.current==void then return fail("game VM is not active during world syscall") end if
  return context.machineRuntime.current.machine
end function
/// Compute engine.local_qvm_match.readVector as `[n.bitsFloat(n.readI32(data, at)), n.bitsFloat(n.readI32(data, (at + 4))), n.bitsFloat(n.readI32(data, (at + 8)))]`.
/// @param data Data passed as `data` to `mq3.compat.numeric.readI32`.
/// @param at Offset passed as `offset` to `mq3.compat.numeric.readI32`.
function readVector(data,at)
  return [n.bitsFloat(n.readI32(data,at)),n.bitsFloat(n.readI32(data,at+4)),n.bitsFloat(n.readI32(data,at+8))]
end function
/// Write vector in engine.local_qvm_match.
/// @param data Data passed as `data` to `mq3.compat.numeric.writeU32`.
/// @param at At used in `(at + (axis * 4))` and `n.writeU32(data, (at + (axis * 4)), n.floatBits(value[axis]))`.
/// @param value Value used in `value[axis]` and `n.floatBits(value[axis])`.
function writeVector(data,at,value)
  for axis=0 to 2 n.writeU32(data,at+axis*4,n.floatBits(value[axis])) end for
  return void
end function
/// Synchronize spatial entity in engine.local_qvm_match; the normal completion returns `ent`.
/// @param context Record exposing `gameEntities`, `entityStride`, `spatialScene`.
/// @param index Zero-based index into `context.spatialScene.entities`.
function syncSpatialEntity(context,index)
  machine=gameMachine(context);base=context.gameEntities+index*context.entityStride;data=machine.data
  state=entitystate.load(data,base);if state is error then return state end if
  ent=context.spatialScene.entities[index];ent.number=index;ent.modelindex=state.modelindex;ent.solid=state.solid
  ent.origin=state.origin;ent.angles=state.angles
  ent.linked=n.readI32(data,base+R_LINKED)!=0;ent.linkcount=n.readI32(data,base+R_LINKCOUNT)
  ent.svFlags=n.readI32(data,base+R_SVFLAGS);ent.singleClient=n.readI32(data,base+R_SINGLECLIENT);ent.bmodel=n.readI32(data,base+R_BMODEL)!=0
  ent.mins=readVector(data,base+R_MINS);ent.maxs=readVector(data,base+R_MAXS);ent.contents=n.readI32(data,base+R_CONTENTS)
  ent.absmin=readVector(data,base+R_ABSMIN);ent.absmax=readVector(data,base+R_ABSMAX)
  ent.currentOrigin=readVector(data,base+R_CURRENTORIGIN);ent.currentAngles=readVector(data,base+R_CURRENTANGLES);ent.ownerNum=n.readI32(data,base+R_OWNERNUM)
  return ent
end function
/// Write spatial entity in engine.local_qvm_match.
/// @param context Record exposing `gameEntities`, `entityStride`, `spatialScene`, `linked`.
/// @param index Zero-based index into `context.spatialScene.entities`.
function writeSpatialEntity(context,index)
  machine=gameMachine(context);base=context.gameEntities+index*context.entityStride;data=machine.data;ent=context.spatialScene.entities[index]
  linked=0;if ent.linked then linked=1 end if
  bmodel=0;if ent.bmodel then bmodel=1 end if
  n.writeU32(data,base+R_LINKED,linked);n.writeU32(data,base+R_LINKCOUNT,ent.linkcount);n.writeU32(data,base+R_BMODEL,bmodel)
  n.writeU32(data,base+176,ent.solid);writeVector(data,base+R_ABSMIN,ent.absmin);writeVector(data,base+R_ABSMAX,ent.absmax)
  context.linked[index]=ent.linked;return void
end function
/// Set brush model in engine.local_qvm_match.
/// @param context Record exposing `collisionWorld`, `gameEntities`, `entityStride`.
/// @param entity Entity passed as `entity` to `mq3.engine.local_qvm_match.entityIndex`.
/// @param name Name used in `name[0]` and `len(name)`.
function setBrushModel(context,entity,name)
  if name==void or len(name)<2 or name[0]!="*" then return fail("invalid inline brush model name") end if
  index=entityIndex(context,entity);if index<0 then return fail("brush model entity is outside game data") end if
  model=toNumber(decode(slice(bytes(name),1,len(bytes(name))-1)));handle=collision.inlineModel(context.collisionWorld,model);bounds=collision.modelBounds(context.collisionWorld,handle)
  machine=gameMachine(context);base=context.gameEntities+index*context.entityStride
  n.writeU32(machine.data,base+160,model);n.writeU32(machine.data,base+R_BMODEL,1);n.writeU32(machine.data,base+R_CONTENTS,-1)
  writeVector(machine.data,base+R_MINS,bounds[0]);writeVector(machine.data,base+R_MAXS,bounds[1])
  linkEntity(context,entity);return void
end function
/// Compute in pvs in engine.local_qvm_match; the normal completion returns `visibility.clusterVisible(context.collisionWorld.visibility, sourceCluster, cluster)`.
/// @param context Record exposing `spatialScene`, `collisionWorld`.
/// @param a P 1 passed as `p1` to `mq3.server.world.inPVS`.
/// @param b P 2 passed as `p2` to `mq3.server.world.inPVS`.
/// @param ignorePortals Ignore portals operand used by `inPvs`; its reads are shown in the implementation.
function inPvs(context,a,b,ignorePortals)
  if not ignorePortals then return serverWorld.inPVS(context.spatialScene,a,b) end if
  first=collision.pointLeafnum(context.collisionWorld,a);second=collision.pointLeafnum(context.collisionWorld,b)
  cluster=visibility.leafCluster(context.collisionWorld.visibility,second);sourceCluster=visibility.leafCluster(context.collisionWorld.visibility,first)
  return visibility.clusterVisible(context.collisionWorld.visibility,sourceCluster,cluster)
end function
/// Compute adjust portal in engine.local_qvm_match.
/// @param context Record exposing `spatialScene`, `collisionWorld`.
/// @param entity Entity passed as `entity` to `mq3.engine.local_qvm_match.entityIndex`.
/// @param isOpen Open passed as `open` to `mq3.collision.visibility.adjustAreaPortalState`.
function adjustPortal(context,entity,isOpen)
  index=entityIndex(context,entity);if index<0 then return fail("area portal entity is outside game data") end if
  ent=context.spatialScene.entities[index]
  if ent.areanum2!=-1 then return visibility.adjustAreaPortalState(context.collisionWorld.visibility,ent.areanum,ent.areanum2,isOpen) end if
  return void
end function
/// Return `mq3.collision.visibility.areasConnected(context.collisionWorld.visibility, a, b)` from `engine.local_qvm_match.areasConnected`.
/// @param context Record exposing `collisionWorld`.
/// @param a Area 1 passed as `area1` to `mq3.collision.visibility.areasConnected`.
/// @param b Area 2 passed as `area2` to `mq3.collision.visibility.areasConnected`.
function areasConnected(context,a,b) return visibility.areasConnected(context.collisionWorld.visibility,a,b) end function
/// Compute link entity in engine.local_qvm_match.
/// @param context Record exposing `spatialScene`.
/// @param entity Entity passed as `entity` to `mq3.engine.local_qvm_match.entityIndex`.
function linkEntity(context,entity)
  index=entityIndex(context,entity);if index<0 then return fail("linked entity is outside game data") end if
  syncSpatialEntity(context,index);serverWorld.linkEntity(context.spatialScene,index);writeSpatialEntity(context,index);return void
end function
/// Compute unlink entity in engine.local_qvm_match.
/// @param context Record exposing `spatialScene`.
/// @param entity Entity passed as `entity` to `mq3.engine.local_qvm_match.entityIndex`.
function unlinkEntity(context,entity)
  index=entityIndex(context,entity);if index<0 then return fail("unlinked entity is outside game data") end if
  serverWorld.unlinkEntity(context.spatialScene,index);writeSpatialEntity(context,index);return void
end function
/// Update `context.botAllocations` in engine.local_qvm_match; the normal completion returns `- 1`.
///
/// Direct state writes: `context.botAllocations`.
/// @param context Record exposing `clientStates`, `botServer`, `botAllocations`, `gameEntities`, `entityStride`, `machineRuntime`. Updated in place: `botAllocations`.
function allocateBot(context)
  for index=0 to len(context.clientStates)-1
    if context.clientStates[index]==0 then
      botServerBridge.resetClient(context.botServer,index);context.clientStates[index]=2;context.botAllocations=context.botAllocations+1
      if context.gameEntities>0 and context.entityStride>0 and context.machineRuntime.current!=void then machine=gameMachine(context);n.writeU32(machine.data,context.gameEntities+index*context.entityStride,index) end if
      return index
    end if
  end for
  return -1
end function
/// Update `context.botFrees` in engine.local_qvm_match.
///
/// Direct state writes: `context.botFrees`.
/// @param context Record exposing `clientStates`, `userinfos`, `usercmds`, `now`, `botFrees`, `botServer`, `gameEntities` and further fields. Updated in place: `botFrees`.
/// @param index Client passed as `client` to `mq3.botlib.server_bridge.resetClient`.
function freeBot(context,index)
  if index<0 or index>=len(context.clientStates) then return fail("bad bot client slot "+str(index)) end if
  context.clientStates[index]=0;context.userinfos[index]="";context.usercmds[index]=qworld.userCommand(context.now,[0,0,0],0,2,0,0,0);context.botFrees=context.botFrees+1;botServerBridge.resetClient(context.botServer,index)
  if context.gameEntities>0 and context.entityStride>0 and context.machineRuntime.current!=void then machine=gameMachine(context);base=context.gameEntities+index*context.entityStride;n.writeU32(machine.data,base+R_SVFLAGS,n.readI32(machine.data,base+R_SVFLAGS)&(~8)) end if
  return void
end function
/// Update `context.console` in engine.local_qvm_match.
///
/// Direct state writes: `context.console`.
/// @param context Record exposing `console`. Updated in place: `console`.
/// @param client Client used in `(context.console + [[client, ("bot " + text)]])`.
/// @param text Text used in `("bot " + text)` and `(context.console + [[client, ("bot " + text)]])`.
function botClientCommand(context,client,text) context.console=context.console+[[client,"bot "+text]];return void end function
/// Compute bot character read in engine.local_qvm_match; the normal completion returns `data`.
/// @param context Record exposing `archive`.
/// @param path Name passed as `name` to `mq3.format.pk3.read`.
function botCharacterRead(context,path) data=try(pk3.read(context.archive,path));if data is error then return void end if;return data end function
/// Compute entity token in engine.local_qvm_match; the normal completion returns `qagame.TokenResult((token != ""), token)`.
/// @param context Record exposing `entityParser`.
function entityToken(context)
  token=parser.parseExt(context.entityParser,true)
  return qagame.TokenResult(token!="",token)
end function
/// Compute engine.local_qvm_match.entityString as `context.entityParser`.
/// @param context Record exposing `entityParser`.
function entityString(context) return context.entityParser end function
/// Compute engine.local_qvm_match.clearClient as `void`.
/// @param context Reserved argument; this implementation does not read its value.
/// @param index Reserved argument; this implementation does not read its value.
function clearClient(context,index) return void end function
/// Compute bot enable in engine.local_qvm_match; the normal completion returns `variable.integer`.
/// @param context Record exposing `cvars`.
function botEnable(context) variable=cvar.find(context.cvars,"bot_enable");if variable==void then return 0 end if;return variable.integer end function
/// Compute botlib var set in engine.local_qvm_match; the normal completion returns `botInterface.Export_BotLibVarSet(context.botlib, name, value)`.
/// @param context Record exposing `botlib`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function botlibVarSet(context,vm,base)
  name=common.readString(vm,common.argument(vm,base,1));if name is error then return name end if
  value=common.readString(vm,common.argument(vm,base,2));if value is error then return value end if
  return botInterface.Export_BotLibVarSet(context.botlib,name,value)
end function
/// Compute botlib var get in engine.local_qvm_match; the normal completion returns `botInterface.BLERR_NOERROR`.
/// @param context Record exposing `botlib`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function botlibVarGet(context,vm,base)
  name=common.readString(vm,common.argument(vm,base,1));if name is error then return name end if
  capacity=common.argument(vm,base,3);value=botInterface.Export_BotLibVarGet(context.botlib,name,capacity);written=common.writeBuffer(vm,common.argument(vm,base,2),capacity,value,"botlib variable output");if written is error then return written end if;return botInterface.BLERR_NOERROR
end function
/// Compute qagame file list in engine.local_qvm_match; the normal completion returns `count`.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.uiFileList`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function qagameFileList(context,vm,base)
  path=common.readString(vm,common.argument(vm,base,1));if path is error then return path end if
  extension=common.readString(vm,common.argument(vm,base,2));if extension is error then return extension end if
  capacity=common.argument(vm,base,4);if capacity<0 then return fail("negative qagame file-list capacity") end if
  entries=uiFileList(context,path,extension);data=bytes(capacity,0);cursor=0;count=0
  for each name in entries encoded=bytes(name);if cursor+len(encoded)+1>capacity then break end if;copyBytes(data,cursor,encoded,0,len(encoded));cursor=cursor+len(encoded)+1;count=count+1 end for
  if capacity>0 then written=common.writeRaw(vm,common.argument(vm,base,3),data,capacity,"qagame file list output");if written is error then return written end if end if
  return count
end function
/// Compute engine.local_qvm_match.readLoadedAas as `host[0]`.
/// @param host Host used in `host[0]`.
/// @param name Reserved argument; this implementation does not read its value.
function readLoadedAas(host,name) return host[0] end function
/// Compute bot cache directory in engine.local_qvm_match; the normal completion returns `fs.joinPath(context.qvmRoot, "maps")`.
/// @param context Record exposing `archive`, `qvmRoot`.
function botCacheDirectory(context)
  if context.archive.modArchive!=void then return fs.joinPath(context.archive.path,"maps") end if
  if context.qvmRoot=="" then return "" end if
  return fs.joinPath(context.qvmRoot,"maps")
end function
/// Compute save bot routes in engine.local_qvm_match.
/// @param context Record exposing `aasRouteCache`, `aasCachePath`.
function saveBotRoutes(context)
  if context.aasRouteCache==void or context.aasCachePath=="" then return void end if
  directory=botCacheDirectory(context)
  if not botCacheWinMain.Sys_Mkdir(directory) or not aasRoutingCache.saveRcd(context.aasRouteCache,context.aasCachePath) then
    emitPrint(context,"Could not write bot route cache "+context.aasCachePath+"\n")
  end if
  return void
end function
/// Update `context.aas`, `context.aasRouter`, `context.aasRouteCache`, `context.aasCachePath` in engine.local_qvm_match; the normal completion returns `botInterface.BLERR_NOERROR`.
///
/// Direct state writes: `context.aas`, `context.aasRouter`, `context.aasRouteCache`, `context.aasCachePath`.
/// @param context Record exposing `botlib`, `aiVisiblePosition`, `archive`, `aas`, `aasEntities`, `aasRouter`, `aasRouteCache` and further fields. Updated in place: `aas`, `aasRouter`, `aasRouteCache`, `aasCachePath`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function botlibLoadMap(context,vm,base)
  name=common.readString(vm,common.argument(vm,base,1));if name is error then return name end if
  result=botInterface.Export_BotLibLoadMap(context.botlib,name,botInterface.services(context));if result!=botInterface.BLERR_NOERROR then return result end if
  saveBotRoutes(context)
  context.aas=void;context.aasRouter=void;context.aasRouteCache=void;context.aiVisiblePosition.router=void
  data=try(pk3.read(context.archive,"maps/"+name+".aas"));if data is error then context.aas=void;return 3 end if
  aasHost=aasFile.services([data]);aasHost.readFileFn=readLoadedAas;aasState=aasFile.create(aasHost);loaded=aasFile.AAS_LoadAASFile(aasState,"maps/"+name+".aas",void);if loaded!=aasFile.BLERR_NOERROR then context.aas=void;return loaded end if;map=aasState.map
  context.aas=aasRuntime.create(map);if context.aas is error then context.aas=void;return 7 end if
  aasEntities.bindRuntime(context.aasEntities,context.aas)
  context.aasRouter=aasRouting.create(context.aas);if context.aasRouter is error then context.aas=void;context.aasRouter=void;return 7 end if
  context.aasRouteCache=aasRoutingCache.create(context.aasRouter,4096)
  context.aasCachePath=""
  cacheDirectory=botCacheDirectory(context)
  if cacheDirectory!="" and not strings.contains(name,"/") and not strings.contains(name,"\\") and not strings.contains(name,":") then
    context.aasCachePath=fs.joinPath(cacheDirectory,name+".rcd")
    aasRoutingCache.loadRcd(context.aasRouteCache,context.aasCachePath)
  end if
  context.aiMoveRuntime.aas=context.aas;context.aiMoveRuntime.router=context.aasRouter;context.aiVisiblePosition.router=context.aasRouter
  gameType=botlibRuntime.integerVariable(context.botlib,"g_gametype",0);aiLevelItems.bind(context.aiLevelItems,context.aasEntities,context.aas,context.botBspEntities,gameType,context,levelItemPlace)
  aiMapGoals.initialize(context.aiMapGoals,context.aas,context.botBspEntities)
  aiGoalSelection.setDroppedWeight(context.aiGoalSelection,botlibFloat(context,"droppedweight",1000.0))
  initialized=aiLevelItems.initialize(context.aiLevelItems);if initialized is error then return initialized end if
  return botInterface.BLERR_NOERROR
end function
/// Update aas entity in engine.local_qvm_match; the normal completion returns `aasEntities.AAS_UpdateEntity(context.aasEntities, number, state, bounds)`.
/// @param context Record exposing `botlib`, `aasEntities`, `collisionWorld`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.argument`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function updateAasEntity(context,vm,base)
  number=common.argument(vm,base,1);address=common.argument(vm,base,2)
  result=botInterface.Export_BotLibUpdateEntityPlain(context.botlib,number,address!=0);if result!=botInterface.BLERR_NOERROR then return result end if
  if context.aasEntities==void then return result end if
  if address==0 then return aasEntities.AAS_UpdateEntity(context.aasEntities,number,void,void) end if
  state=aasQuerySyscalls.readEntityState(vm,address);if state is error then return state end if
  bounds=void
  if state.solid==aasEntities.SOLID_BSP then model=try(collision.inlineModel(context.collisionWorld,state.modelindex));if not (model is error) then bounds=collision.modelBounds(context.collisionWorld,model) end if end if
  return aasEntities.AAS_UpdateEntity(context.aasEntities,number,state,bounds)
end function
/// Return `mq3.engine.local_qvm_match.pointContents(context, point, - 1)` from `engine.local_qvm_match.aasPointContents`.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.pointContents`.
/// @param point Point passed as `point` to `mq3.engine.local_qvm_match.pointContents`.
function aasPointContents(context,point) return pointContents(context,point,-1) end function
/// Apply `mq3.botlib.aas_runtime.presenceTypeBoundingBox`, `mq3.botlib.aas_client_trace.trace`, `mq3.server.world.trace` for aas movement trace in engine.local_qvm_match.
/// @param context Record exposing `aas`, `spatialScene`.
/// @param start Start passed as `start` to `mq3.botlib.aas_client_trace.trace`.
/// @param finish Finish passed as `finish` to `mq3.botlib.aas_client_trace.trace`.
/// @param presence Presence type passed as `presenceType` to `mq3.botlib.aas_runtime.presenceTypeBoundingBox`.
/// @param passEntity Pass entity used in `(passEntity >= 0)`.
function aasMovementTrace(context,start,finish,presence,passEntity)
  bounds=aasRuntime.presenceTypeBoundingBox(presence);if bounds is error then return bounds end if
  ignored=passEntity;if ignored<0 then ignored=1023 end if
  staticTrace=aasClientTrace.trace(context.aas,start,finish,presence);if staticTrace is error then return staticTrace end if
  // AAS areas encode static solid/playerclip presence. Keep the server-world
  // trace only for linked entities, matching AAS_AreaEntityCollision.
  dynamic=void;if passEntity>=0 then dynamic=serverWorld.trace(context.spatialScene,start,finish,bounds[0],bounds[1],ignored,0x10001,false) end if
  if dynamic!=void and dynamic.entityNum!=1022 and dynamic.entityNum!=1023 and (dynamic.trace.startsolid or dynamic.trace.fraction<staticTrace.fraction) then
    return aasClientMovement.Trace(dynamic.trace.startsolid,dynamic.trace.fraction,dynamic.endpos,dynamic.entityNum,0,0,dynamic.trace.planeMetadata,dynamic.trace.normal)
  end if
  return aasClientMovement.Trace(staticTrace.startsolid,staticTrace.fraction,staticTrace.endpos,staticTrace.ent,staticTrace.lastarea,staticTrace.area,staticTrace.planenum,staticTrace.normal)
end function
/// Return `mq3.botlib.aas_runtime.pointAreaNum(context.aas, point)` from `engine.local_qvm_match.aasMovementPointArea`.
/// @param context Record exposing `aas`.
/// @param point Point passed as `point` to `mq3.botlib.aas_runtime.pointAreaNum`.
function aasMovementPointArea(context,point) return aasRuntime.pointAreaNum(context.aas,point) end function
/// Return `mq3.botlib.aas_runtime.pointPresenceType(context.aas, point)` from `engine.local_qvm_match.aasMovementPointPresence`.
/// @param context Record exposing `aas`.
/// @param point Point passed as `point` to `mq3.botlib.aas_runtime.pointPresenceType`.
function aasMovementPointPresence(context,point) return aasRuntime.pointPresenceType(context.aas,point) end function
/// Compute aas movement area contents in engine.local_qvm_match; the normal completion returns `info.contents`.
/// @param context Record exposing `aas`.
/// @param area Area num passed as `areaNum` to `mq3.botlib.aas_runtime.areaInfo`.
function aasMovementAreaContents(context,area)
  info=aasRuntime.areaInfo(context.aas,area);if info is error then return 0 end if;return info.contents
end function
/// Return `mq3.botlib.aas_trace_areas.trace(context.aas, start, finish, maximum)` from `engine.local_qvm_match.aasMovementTraceAreas`.
/// @param context Record exposing `aas`.
/// @param start Start passed as `start` to `mq3.botlib.aas_trace_areas.trace`.
/// @param finish Finish passed as `finish` to `mq3.botlib.aas_trace_areas.trace`.
/// @param maximum Maximum passed as `maximum` to `mq3.botlib.aas_trace_areas.trace`.
function aasMovementTraceAreas(context,start,finish,maximum) return aasTraceAreas.trace(context.aas,start,finish,maximum) end function
/// Compute botlib float in engine.local_qvm_match; the normal completion returns `n.f32(toNumber(value))`.
/// @param context Record exposing `botlib`.
/// @param name Name passed as `name` to `mq3.botlib.lifecycle_runtime.varGet`.
/// @param fallback Value returned unchanged by this function.
function botlibFloat(context,name,fallback) value=botlibRuntime.varGet(context.botlib,name);if value=="" then return fallback end if;return n.f32(toNumber(value)) end function
/// Compute configure aas movement in engine.local_qvm_match.
/// @param context Record exposing `aasMovement`.
function configureAasMovement(context)
  cfg=context.aasMovement.settings
  cfg.friction=botlibFloat(context,"phys_friction",6.0);cfg.stopspeed=botlibFloat(context,"phys_stopspeed",100.0);cfg.gravity=botlibFloat(context,"phys_gravity",800.0)
  cfg.waterfriction=botlibFloat(context,"phys_waterfriction",1.0);cfg.watergravity=botlibFloat(context,"phys_watergravity",400.0)
  cfg.maxwalkvelocity=botlibFloat(context,"phys_maxwalkvelocity",320.0);cfg.maxcrouchvelocity=botlibFloat(context,"phys_maxcrouchvelocity",100.0);cfg.maxswimvelocity=botlibFloat(context,"phys_maxswimvelocity",150.0)
  cfg.walkaccelerate=botlibFloat(context,"phys_walkaccelerate",10.0);cfg.airaccelerate=botlibFloat(context,"phys_airaccelerate",1.0);cfg.swimaccelerate=botlibFloat(context,"phys_swimaccelerate",4.0)
  cfg.maxstep=botlibFloat(context,"phys_maxstep",19.0);cfg.maxsteepness=botlibFloat(context,"phys_maxsteepness",0.7);cfg.maxbarrier=botlibFloat(context,"phys_maxbarrier",33.0);cfg.jumpvel=botlibFloat(context,"phys_jumpvel",270.0);return void
end function
/// Compute jump pad target in engine.local_qvm_match.
/// @param context Record exposing `botBspEntities`.
/// @param name Name used in `(name == "")` and `(targetName[1] == name)`.
function jumpPadTarget(context,name)
  if name=="" then return void end if
  for entityNum=1 to len(context.botBspEntities)-1
    entity=context.botBspEntities[entityNum];targetName=aiMapGoals.epair(entity,"targetname")
    if targetName[0] and targetName[1]==name then return aiMapGoals.vectorValue(entity,"origin") end if
  end for
  return void
end function
/// Compute best reachable jump pad area in engine.local_qvm_match; the normal completion returns `0`.
/// @param context Record exposing `botBspEntities`, `collisionWorld`, `aas`, `aasMovement`.
/// @param itemOrigin Item origin used in `itemOrigin[0]` and `itemOrigin[1]`.
/// @param itemMins Item mins used in `itemMins[0]` and `itemMins[1]`.
/// @param itemMaxs Item maxs used in `itemMaxs[0]` and `itemMaxs[1]`.
function bestReachableJumpPadArea(context,itemOrigin,itemMins,itemMaxs)
  bboxMins=[itemOrigin[0]+itemMins[0],itemOrigin[1]+itemMins[1],itemOrigin[2]+itemMins[2]];bboxMaxs=[itemOrigin[0]+itemMaxs[0],itemOrigin[1]+itemMaxs[1],itemOrigin[2]+itemMaxs[2]]
  for entityNum=1 to len(context.botBspEntities)-1
    entity=context.botBspEntities[entityNum];classname=aiMapGoals.epair(entity,"classname");if not classname[0] or classname[1]!="trigger_push" then continue end if
    modelPair=aiMapGoals.epair(entity,"model");if not modelPair[0] or len(modelPair[1])<2 or modelPair[1][0]!="*" then continue end if
    modelIndex=toNumber(decode(slice(bytes(modelPair[1]),1,len(bytes(modelPair[1]))-1)));handle=collision.inlineModel(context.collisionWorld,modelIndex);if handle is error then continue end if
    bounds=collision.modelBounds(context.collisionWorld,handle);if bounds is error then continue end if;absMins=bounds[0];absMaxs=bounds[1]
    origin=[(absMins[0]+absMaxs[0])*0.5,(absMins[1]+absMaxs[1])*0.5,(absMins[2]+absMaxs[2])*0.5]
    areaStart=origin;testStart=[origin[0],origin[1],origin[2]+64.0];startTrace=aasMovementTrace(context,testStart,origin,aasRuntime.PRESENCE_CROUCH,-1);if not (startTrace is error) and not startTrace.startsolid then areaStart=startTrace.endpos end if;areaStart=[areaStart[0],areaStart[1],areaStart[2]+0.125]
    crouchBounds=aasRuntime.presenceTypeBoundingBox(aasRuntime.PRESENCE_CROUCH);linkMins=[absMins[0]-crouchBounds[1][0],absMins[1]-crouchBounds[1][1],absMins[2]-crouchBounds[1][2]];linkMaxs=[absMaxs[0]-crouchBounds[0][0],absMaxs[1]-crouchBounds[0][1],absMaxs[2]-crouchBounds[0][2]]
    areas=aasRuntime.bboxAreas(context.aas,linkMins,linkMaxs,context.aas.map.counts[aasFormat.LUMP_AREAS]);hasJumpPad=false
    for each linkedArea in areas info=aasRuntime.areaInfo(context.aas,linkedArea);if not (info is error) and (info.contents&aiLevelItems.AREACONTENTS_JUMPPAD)!=0 then hasJumpPad=true;break end if end for
    if not hasJumpPad then continue end if
    targetPair=aiMapGoals.epair(entity,"target");if not targetPair[0] then continue end if;target=jumpPadTarget(context,targetPair[1]);if target==void then continue end if
    height=target[2]-origin[2];gravity=context.aasMovement.settings.gravity;if height<=0.0 or gravity<=0.0 then continue end if;time=n.fsqrt(height/(0.5*gravity));if time==0.0 then continue end if
    direction=[target[0]-origin[0],target[1]-origin[1],target[2]-origin[2]];length=n.fsqrt(direction[0]*direction[0]+direction[1]*direction[1]+direction[2]*direction[2]);if length==0.0 then continue end if
    forward=length/time*1.1;velocity=[direction[0]/length*forward,direction[1]/length*forward,time*gravity]
    move=aasClientMovement.predictWithBBox(context.aasMovement,-1,areaStart,aasRuntime.PRESENCE_NORMAL,false,velocity,[0.0,0.0,0.0],0,30,0.1,aasClientMovement.SE_HITBOUNDINGBOX,0,bboxMins,bboxMaxs,false)
    if not (move is error) and move.frames<30 then
      bestArea=0;bestVolume=0.0
      for each linkedArea in areas info=aasRuntime.areaInfo(context.aas,linkedArea);if info is error or (info.contents&aiLevelItems.AREACONTENTS_JUMPPAD)==0 then continue end if;volume=aasRuntime.areaVolume(context.aas,linkedArea);if volume>=bestVolume then bestArea=linkedArea;bestVolume=volume end if end for
      return bestArea
    end if
  end for
  return 0
end function
/// Compute level item place in engine.local_qvm_match; the normal completion returns `[0, settled]`.
/// @param context Record exposing `spatialScene`, `aas`.
/// @param origin Point passed as `point` to `mq3.engine.local_qvm_match.pointContents`.
/// @param mins Mins passed as `mins` to `mq3.server.world.trace`.
/// @param maxs Maxs passed as `maxs` to `mq3.server.world.trace`.
/// @param floating Floating used in `(floating and ((pointContents(context, origin, - 1) & aasClientMovement.CONTENTS_WATER) == 0))`.
function levelItemPlace(context,origin,mins,maxs,floating)
  settled=[origin[0],origin[1],origin[2]]
  if floating and (pointContents(context,origin,-1)&aasClientMovement.CONTENTS_WATER)==0 then
    nearby=[origin[0],origin[1],origin[2]-32.0];ground=serverWorld.trace(context.spatialScene,origin,nearby,mins,maxs,0,0x10001,false)
    if not ground.trace.startsolid and ground.trace.fraction>=1.0 then jumpArea=bestReachableJumpPadArea(context,origin,mins,maxs);if jumpArea==0 then return [0,settled] end if;return [jumpArea,settled] end if
  end if
  if not floating then
    finish=[origin[0],origin[1],origin[2]-100.0];result=serverWorld.trace(context.spatialScene,origin,finish,mins,maxs,0,aasClientMovement.CONTENTS_SOLID,false)
    if not result.trace.startsolid then settled=[result.endpos[0],result.endpos[1],result.endpos[2]] end if
  end if
  candidate=[settled[0],settled[1],settled[2]];area=aasRuntime.pointAreaNum(context.aas,candidate)
  for up=0 to 4
    if area!=0 then break end if
    for spread=0 to 4
      if area!=0 then break end if
      // At zero spread every side pair is identical; at zero height it was
      // already tested before the search.
      if spread==0 and up==0 then continue end if
      for xside=-1 to 1
        if area!=0 then break end if
        for yside=-1 to 1
          if spread==0 and (xside!=-1 or yside!=-1) then continue end if
          candidate=[settled[0]+spread*4.0*xside,settled[1]+spread*4.0*yside,settled[2]+up*4.0];area=aasRuntime.pointAreaNum(context.aas,candidate);if area!=0 then break end if
        end for
      end for
    end for
  end for
  if area!=0 then
    start=[candidate[0],candidate[1],candidate[2]+0.25];finish=[candidate[0],candidate[1],candidate[2]-50.0];trace=aasMovementTrace(context,start,finish,aasRuntime.PRESENCE_CROUCH,-1)
    if not (trace is error) and not trace.startsolid then droppedArea=aasRuntime.pointAreaNum(context.aas,trace.endpos);if droppedArea!=0 then return [droppedArea,[trace.endpos[0],trace.endpos[1],trace.endpos[2]]] end if end if
    return [area,candidate]
  end if
  absoluteMins=[settled[0]+mins[0],settled[1]+mins[1],settled[2]+mins[2]];absoluteMaxs=[settled[0]+maxs[0],settled[1]+maxs[1],settled[2]+maxs[2]]
  areas=aasRuntime.bboxAreas(context.aas,absoluteMins,absoluteMaxs,64)
  for each fallbackArea in areas if aasRuntime.areaReachability(context.aas,fallbackArea)>0 then return [fallbackArea,settled] end if end for
  return [0,settled]
end function
/// Return `mq3.botlib.aas_runtime.getTime(context.aas)` from `engine.local_qvm_match.goalStateTime`.
/// @param context Record exposing `aas`.
function goalStateTime(context) return aasRuntime.getTime(context.aas) end function
/// Return `mq3.botlib.ai_level_items.goalName(context.aiLevelItems, number)` from `engine.local_qvm_match.goalStateName`.
/// @param context Record exposing `aiLevelItems`.
/// @param number Number passed as `number` to `mq3.botlib.ai_level_items.goalName`.
function goalStateName(context,number) return aiLevelItems.goalName(context.aiLevelItems,number) end function
/// Compute goal state log in engine.local_qvm_match.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.emitPrint`.
/// @param text Text passed as `text` to `mq3.engine.local_qvm_match.emitPrint`.
function goalStateLog(context,text) emitPrint(context,text);return void end function
/// Compute goal state print in engine.local_qvm_match.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.emitPrint`.
/// @param level Reserved argument; this implementation does not read its value.
/// @param text Text passed as `text` to `mq3.engine.local_qvm_match.emitPrint`.
function goalStatePrint(context,level,text) emitPrint(context,text);return void end function
/// Return `mq3.botlib.ai_goal_selection.randomFloat(context.aiGoalSelection)` from `engine.local_qvm_match.chatOutputRandom`.
/// @param context Record exposing `aiGoalSelection`.
function chatOutputRandom(context) return aiGoalSelection.randomFloat(context.aiGoalSelection) end function
/// Compute goal selection travel time in engine.local_qvm_match; the normal completion returns `aasRoutingCache.itemTravelTime(context.aasRouteCache, area, origin, goalArea, travelFlags)`.
/// @param context Record exposing `aasRouteCache`.
/// @param area Area num passed as `areaNum` to `mq3.botlib.aas_routing_cache.itemTravelTime`.
/// @param origin Origin passed as `origin` to `mq3.botlib.aas_routing_cache.itemTravelTime`.
/// @param goalArea Goal area num passed as `goalAreaNum` to `mq3.botlib.aas_routing_cache.itemTravelTime`.
/// @param travelFlags Travel flags passed as `travelFlags` to `mq3.botlib.aas_routing_cache.itemTravelTime`.
function goalSelectionTravelTime(context,area,origin,goalArea,travelFlags)
  if context.aasRouteCache==void then return 0 end if;return aasRoutingCache.itemTravelTime(context.aasRouteCache,area,origin,goalArea,travelFlags)
end function
/// Return `mq3.botlib.aas_routing_cache.itemQuery(context.aasRouteCache, area, origin, travelFlags)` from `engine.local_qvm_match.goalSelectionItemQuery`.
/// @param context Record exposing `aasRouteCache`.
/// @param area Area passed as `area` to `mq3.botlib.aas_routing_cache.itemQuery`.
/// @param origin Origin passed as `origin` to `mq3.botlib.aas_routing_cache.itemQuery`.
/// @param travelFlags Flags passed as `flags` to `mq3.botlib.aas_routing_cache.itemQuery`.
function goalSelectionItemQuery(context,area,origin,travelFlags)
  return aasRoutingCache.itemQuery(context.aasRouteCache,area,origin,travelFlags)
end function
/// Compute goal selection trace in engine.local_qvm_match; the normal completion returns `serverWorld.trace(context.spatialScene, start, finish, zero, zero, viewer, contents, false).trace`.
/// @param context Record exposing `spatialScene`.
/// @param start Start passed as `start` to `mq3.server.world.trace`.
/// @param finish Finish passed as `finish` to `mq3.server.world.trace`.
/// @param viewer Pass entity passed as `passEntity` to `mq3.server.world.trace`.
/// @param contents Mask passed as `mask` to `mq3.server.world.trace`.
function goalSelectionTrace(context,start,finish,viewer,contents)
  zero=[0.0,0.0,0.0];return serverWorld.trace(context.spatialScene,start,finish,zero,zero,viewer,contents,false).trace
end function
/// Compute move ground trace in engine.local_qvm_match; the normal completion returns `aiMoveRuntime.GroundTrace(result.trace.startsolid, result.trace.fraction, result.entityNum, result.endpos)`.
/// @param context Record exposing `spatialScene`.
/// @param start Start passed as `start` to `mq3.server.world.trace`.
/// @param mins Mins passed as `mins` to `mq3.server.world.trace`.
/// @param maxs Maxs passed as `maxs` to `mq3.server.world.trace`.
/// @param finish Finish passed as `finish` to `mq3.server.world.trace`.
/// @param client Pass entity passed as `passEntity` to `mq3.server.world.trace`.
/// @param contents Mask passed as `mask` to `mq3.server.world.trace`.
function moveGroundTrace(context,start,mins,maxs,finish,client,contents)
  result=serverWorld.trace(context.spatialScene,start,finish,mins,maxs,client,contents,false);return aiMoveRuntime.GroundTrace(result.trace.startsolid,result.trace.fraction,result.entityNum,result.endpos)
end function
/// Return `mq3.botlib.aas_movement_queries.swimming(context, aasPointContents, origin)` from `engine.local_qvm_match.moveSwimming`.
/// @param context Context passed as `context` to `mq3.botlib.aas_movement_queries.swimming`.
/// @param origin Origin passed as `origin` to `mq3.botlib.aas_movement_queries.swimming`.
function moveSwimming(context,origin) return aasMovementQueries.swimming(context,aasPointContents,origin) end function
/// Compute move client trace in engine.local_qvm_match; the normal completion returns `aiMoveRuntime.GroundTrace(result.startsolid, result.fraction, result.ent, result.endpos)`.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.aasMovementTrace`.
/// @param start Start passed as `start` to `mq3.engine.local_qvm_match.aasMovementTrace`.
/// @param finish Finish passed as `finish` to `mq3.engine.local_qvm_match.aasMovementTrace`.
/// @param presence Presence passed as `presence` to `mq3.engine.local_qvm_match.aasMovementTrace`.
/// @param passEntity Pass entity passed as `passEntity` to `mq3.engine.local_qvm_match.aasMovementTrace`.
function moveClientTrace(context,start,finish,presence,passEntity)
  result=aasMovementTrace(context,start,finish,presence,passEntity);if result is error then return result end if;return aiMoveRuntime.GroundTrace(result.startsolid,result.fraction,result.ent,result.endpos)
end function
/// Return `mq3.botlib.aas_client_movement.onGround(context.aasMovement, origin, presence, passEntity, context.aasMovement.settings.maxsteepness)` from `engine.local_qvm_match.moveOnGround`.
/// @param context Record exposing `aasMovement`.
/// @param origin Origin passed as `origin` to `mq3.botlib.aas_client_movement.onGround`.
/// @param presence Presence passed as `presence` to `mq3.botlib.aas_client_movement.onGround`.
/// @param passEntity Pass entity passed as `passEntity` to `mq3.botlib.aas_client_movement.onGround`.
function moveOnGround(context,origin,presence,passEntity) return aasClientMovement.onGround(context.aasMovement,origin,presence,passEntity,context.aasMovement.settings.maxsteepness) end function
/// Return `mq3.botlib.aas_sample.againstLadder(context.aas, origin)` from `engine.local_qvm_match.moveAgainstLadder`.
/// @param context Record exposing `aas`.
/// @param origin Origin passed as `origin` to `mq3.botlib.aas_sample.againstLadder`.
function moveAgainstLadder(context,origin) return aasSample.againstLadder(context.aas,origin) end function
/// Compute move gap distance in engine.local_qvm_match; the normal completion returns `0.0`.
/// @param context Record exposing `aasMovement`.
/// @param origin Start passed as `start` to `mq3.engine.local_qvm_match.aasMovementTrace`.
/// @param direction Direction used in `direction[0]` and `direction[1]`.
/// @param entityNum Pass entity passed as `passEntity` to `mq3.engine.local_qvm_match.aasMovementTrace`.
function moveGapDistance(context,origin,direction,entityNum)
  finish=[origin[0],origin[1],origin[2]-60.0]
  ground=aasMovementTrace(context,origin,finish,aasRuntime.PRESENCE_CROUCH,entityNum)
  if ground is error or ground.fraction>=1.0 then return 1.0 end if
  groundZ=ground.endpos[2]+1.0
  settings=context.aasMovement.settings
  for step=1 to 12
    distance=8.0*step
    start=[origin[0]+distance*direction[0],origin[1]+distance*direction[1],groundZ+24.0]
    finish=[start[0],start[1],start[2]-48.0-settings.maxbarrier]
    ground=aasMovementTrace(context,start,finish,aasRuntime.PRESENCE_CROUCH,entityNum)
    if ground is error then return distance end if
    if not ground.startsolid then
      if ground.endpos[2]<groundZ-settings.maxstep-8.0 then
        lower=[ground.endpos[0],ground.endpos[1],ground.endpos[2]-20.0]
        if (aasPointContents(context,lower)&aasClientMovement.CONTENTS_WATER)!=0 then return 0.0 end if
        return distance
      end if
      groundZ=ground.endpos[2]
    end if
  end for
  return 0.0
end function
/// Compute move block trace in engine.local_qvm_match; the normal completion returns `aiMoveRuntime.GroundTrace(result.trace.startsolid, result.trace.fraction, result.entityNum, result.endpos)`.
/// @param context Record exposing `aasMovement`, `spatialScene`.
/// @param state Record exposing `presenceType`, `origin`, `entityNum`.
/// @param direction Direction used in `direction[2]` and `direction[0]`.
/// @param checkBottom Reserved argument; this implementation does not read its value.
function moveBlockTrace(context,state,direction,checkBottom)
  bounds=aasRuntime.presenceTypeBoundingBox(state.presenceType);if bounds is error then return bounds end if;mins=[bounds[0][0],bounds[0][1],bounds[0][2]];maxs=[bounds[1][0],bounds[1][1],bounds[1][2]]
  vertical=direction[2];if vertical<0.0 then vertical=0.0-vertical end if;if vertical<0.7 then mins[2]=mins[2]+context.aasMovement.settings.maxstep;maxs[2]=maxs[2]-10.0 end if
  finish=[state.origin[0]+3.0*direction[0],state.origin[1]+3.0*direction[1],state.origin[2]+3.0*direction[2]];result=serverWorld.trace(context.spatialScene,state.origin,finish,mins,maxs,state.entityNum,0x02010001,false)
  return aiMoveRuntime.GroundTrace(result.trace.startsolid,result.trace.fraction,result.entityNum,result.endpos)
end function
/// Compute move jump run start in engine.local_qvm_match; the normal completion returns `predicted.endpos`.
/// @param context Record exposing `aasMovement`.
/// @param state Reserved argument; this implementation does not read its value.
/// @param reach Record exposing `start`, `finish`.
function moveJumpRunStart(context,state,reach)
  direction=[reach.start[0]-reach.finish[0],reach.start[1]-reach.finish[1],0.0];direction=aiMoveRuntime.normalize(direction)[1];start=[reach.start[0],reach.start[1],reach.start[2]+1.0];command=[direction[0]*400.0,direction[1]*400.0,0.0]
  predicted=aasClientMovement.predict(context.aasMovement,-1,start,aasRuntime.PRESENCE_NORMAL,true,[0.0,0.0,0.0],command,1,2,0.1,124,0,false);if predicted is error then return predicted end if
  if (predicted.stopevent&(aasClientMovement.SE_ENTERSLIME|aasClientMovement.SE_ENTERLAVA|aasClientMovement.SE_HITGROUNDDAMAGE))!=0 then return start end if;return predicted.endpos
end function
/// Compute engine.local_qvm_match.moveGravity as `context.aasMovement.settings.gravity`.
/// @param context Record exposing `aasMovement`.
function moveGravity(context) return context.aasMovement.settings.gravity end function
/// Compute move horizontal velocity for jump in engine.local_qvm_match; the normal completion returns `[true, speed]`.
/// @param context Record exposing `aasMovement`.
/// @param zVelocity Left floating-point operand.
/// @param start Start used in `start[2]` and `start[0]`.
/// @param finish Finish used in `finish[2]` and `finish[0]`.
function moveHorizontalVelocityForJump(context,zVelocity,start,finish)
  gravity=context.aasMovement.settings.gravity;maxVelocity=botlibFloat(context,"phys_maxvelocity",320.0);ratio=n.fdiv(zVelocity,gravity);maxJump=n.fmul(n.fmul(0.5,gravity),n.fmul(ratio,ratio));height=n.fsub(n.fadd(start[2],maxJump),finish[2])
  if height<0.0 then return [false,maxVelocity] end if;time=n.fsqrt(n.fdiv(height,n.fmul(0.5,gravity)));denominator=n.fadd(time,ratio);if denominator==0.0 then return [false,maxVelocity] end if
  dx=n.fsub(finish[0],start[0]);dy=n.fsub(finish[1],start[1]);speed=n.fdiv(n.fsqrt(n.fadd(n.fmul(dx,dx),n.fmul(dy,dy))),denominator);if speed>maxVelocity then return [false,maxVelocity] end if;return [true,speed]
end function
/// Compute engine.local_qvm_match.moveEntityModel as `aasEntities.info(context.aasEntities, entity).modelindex`.
/// @param context Record exposing `aasEntities`.
/// @param entity Number passed as `number` to `mq3.botlib.aas_entities.info`.
function moveEntityModel(context,entity) return aasEntities.info(context.aasEntities,entity).modelindex end function
/// Compute move model type in engine.local_qvm_match; the normal completion returns `0`.
/// @param context Record exposing `botBspEntities`.
/// @param model Model used in `str(model)` and `(model <= 0)`.
function moveModelType(context,model)
  if model<=0 then return 0 end if
  wanted="*"+str(model)
  for entityNum=1 to len(context.botBspEntities)-1
    entity=context.botBspEntities[entityNum];modelPair=aiMapGoals.epair(entity,"model");if not modelPair[0] or modelPair[1]!=wanted then continue end if
    classname=aiMapGoals.epair(entity,"classname")
    if not classname[0] then continue end if
    if classname[1]=="func_plat" then return aiMoveRuntime.MODELTYPE_FUNC_PLAT end if
    if classname[1]=="func_bobbing" then return aiMoveRuntime.MODELTYPE_FUNC_BOB end if
    if classname[1]=="func_door" then return aiMoveRuntime.MODELTYPE_FUNC_DOOR end if
    if classname[1]=="func_static" then return aiMoveRuntime.MODELTYPE_FUNC_STATIC end if
  end for;return 0
end function
/// Compute move model reachability in engine.local_qvm_match; the normal completion returns `0`.
/// @param context Record exposing `aasRouter`.
/// @param model Model used in `(reach.faceNum == model)` and `((reach.faceNum & 65535) == model)`.
function moveModelReachability(context,model)
  if context.aasRouter==void then return 0 end if
  for reachNum=1 to len(context.aasRouter.reaches)-1
    reach=context.aasRouter.reaches[reachNum];kind=reach.travelType&aasRouting.TRAVELTYPE_MASK
    if kind==aasRouting.TRAVEL_ELEVATOR and reach.faceNum==model then return reachNum end if
    if kind==aasRouting.TRAVEL_FUNCBOB and (reach.faceNum&65535)==model then return reachNum end if
  end for;return 0
end function
/// Compute move mover info in engine.local_qvm_match.
/// @param context Record exposing `aasEntities`.
/// @param model Model used in `(info.modelindex == model)` and `(info.valid and (info.modelindex == model))`.
function moveMoverInfo(context,model)
  if context.aasEntities==void then return void end if
  for entityNum=0 to len(context.aasEntities.entities)-1 info=aasEntities.info(context.aasEntities,entityNum);if info.valid and info.modelindex==model then return info end if end for;return void
end function
/// Compute move elevator state in engine.local_qvm_match; the normal completion returns `aiMoveRuntime.ElevatorState(onMover, down, bottom, context.aasMovement.settings.maxbarrier)`.
/// @param context Record exposing `collisionWorld`, `spatialScene`, `aasEntities`, `aasMovement`.
/// @param state Record exposing `origin`, `entityNum`.
/// @param reach Record exposing `faceNum`, `start`.
function moveElevatorState(context,state,reach)
  model=reach.faceNum&65535;mover=moveMoverInfo(context,model);if mover==void then return void end if
  handle=try(collision.inlineModel(context.collisionWorld,model));if handle is error then return void end if;bounds=collision.modelBounds(context.collisionWorld,handle);if bounds is error then return void end if
  bottom=[n.fadd(mover.origin[0],n.fmul(0.5,n.fadd(bounds[0][0],bounds[1][0]))),n.fadd(mover.origin[1],n.fmul(0.5,n.fadd(bounds[0][1],bounds[1][1]))),reach.start[2]]
  down=n.fadd(mover.origin[2],bounds[1][2])<reach.start[2];onMover=true
  for axis=0 to 1 if state.origin[axis]>n.fadd(n.fadd(mover.origin[axis],bounds[1][axis]),16.0) or state.origin[axis]<n.fsub(n.fadd(mover.origin[axis],bounds[0][axis]),16.0) then onMover=false end if end for
  if onMover then
    start=[state.origin[0],state.origin[1],n.fadd(state.origin[2],24.0)];finish=[state.origin[0],state.origin[1],n.fsub(state.origin[2],48.0)];trace=serverWorld.trace(context.spatialScene,start,finish,[-16.0,-16.0,-8.0],[16.0,16.0,8.0],state.entityNum,0x10001,false)
    hit=aasEntities.info(context.aasEntities,trace.entityNum);onMover=not trace.trace.startsolid and not trace.trace.allsolid and trace.entityNum!=aiMoveRuntime.ENTITYNUM_NONE and hit.valid and hit.modelindex==model
  end if
  return aiMoveRuntime.ElevatorState(onMover,down,bottom,context.aasMovement.settings.maxbarrier)
end function
/// Compute signed 16 in engine.local_qvm_match; the normal completion returns `result`.
/// @param value Value used in `(value & 65535)`.
function signed16(value) result=value&65535;if result>32767 then result=result-65536 end if;return result end function
/// Compute move func bob state in engine.local_qvm_match; the normal completion returns `aiMoveRuntime.FuncBobState(onMover, start, finish, origin, bottom, context.aasMovement.settings.maxbarrier)`.
/// @param context Record exposing `collisionWorld`, `spatialScene`, `aasEntities`, `aasMovement`.
/// @param state Record exposing `origin`, `entityNum`.
/// @param reach Record exposing `faceNum`, `edgeNum`, `start`.
function moveFuncBobState(context,state,reach)
  model=reach.faceNum&65535;mover=moveMoverInfo(context,model);if mover==void then return void end if
  handle=try(collision.inlineModel(context.collisionWorld,model));if handle is error then return void end if;bounds=collision.modelBounds(context.collisionWorld,handle);if bounds is error then return void end if
  mid=[n.fmul(0.5,n.fadd(bounds[0][0],bounds[1][0])),n.fmul(0.5,n.fadd(bounds[0][1],bounds[1][1])),n.fmul(0.5,n.fadd(bounds[0][2],bounds[1][2]))];start=[mid[0],mid[1],mid[2]];finish=[mid[0],mid[1],mid[2]];origin=[mover.origin[0],mover.origin[1],mover.origin[2]]
  flags=reach.faceNum>>16;first=signed16(reach.edgeNum>>16);second=signed16(reach.edgeNum)
  if (flags&1)!=0 then start[0]=first;finish[0]=second;origin=[n.fadd(origin[0],mid[0]),mid[1],mid[2]]
  else if (flags&2)!=0 then start[1]=first;finish[1]=second;origin=[mid[0],n.fadd(origin[1],mid[1]),mid[2]]
  else start[2]=first;finish[2]=second;origin=[mid[0],mid[1],n.fadd(origin[2],mid[2])] end if
  bottom=[n.fadd(mover.origin[0],mid[0]),n.fadd(mover.origin[1],mid[1]),reach.start[2]];onMover=true
  for axis=0 to 1 if state.origin[axis]>n.fadd(n.fadd(mover.origin[axis],bounds[1][axis]),16.0) or state.origin[axis]<n.fsub(n.fadd(mover.origin[axis],bounds[0][axis]),16.0) then onMover=false end if end for
  if onMover then
    traceStart=[state.origin[0],state.origin[1],n.fadd(state.origin[2],24.0)];traceFinish=[state.origin[0],state.origin[1],n.fsub(state.origin[2],48.0)];trace=serverWorld.trace(context.spatialScene,traceStart,traceFinish,[-16.0,-16.0,-8.0],[16.0,16.0,8.0],state.entityNum,0x10001,false)
    hit=aasEntities.info(context.aasEntities,trace.entityNum);onMover=not trace.trace.startsolid and not trace.trace.allsolid and trace.entityNum!=aiMoveRuntime.ENTITYNUM_NONE and hit.valid and hit.modelindex==model
  end if
  return aiMoveRuntime.FuncBobState(onMover,start,finish,origin,bottom,context.aasMovement.settings.maxbarrier)
end function
/// Test move barrier jump in engine.local_qvm_match; the normal completion returns `true`.
/// @param context Record exposing `aasMovement`.
/// @param state Record exposing `origin`, `entityNum`, `thinkTime`.
/// @param direction Direction used in `direction[0]` and `direction[1]`.
/// @param speed Right floating-point operand.
function moveBarrierJump(context,state,direction,speed)
  up=[state.origin[0],state.origin[1],n.fadd(state.origin[2],context.aasMovement.settings.maxbarrier)];trace=aasMovementTrace(context,state.origin,up,aasRuntime.PRESENCE_NORMAL,state.entityNum);if trace is error or trace.startsolid or n.fsub(trace.endpos[2],state.origin[2])<context.aasMovement.settings.maxstep then return false end if
  horizontal=aiMoveRuntime.normalize([direction[0],direction[1],0.0])[1];start=[trace.endpos[0],trace.endpos[1],trace.endpos[2]];finish=[n.fadd(state.origin[0],n.fmul(n.fmul(state.thinkTime,speed),n.fmul(0.5,horizontal[0]))),n.fadd(state.origin[1],n.fmul(n.fmul(state.thinkTime,speed),n.fmul(0.5,horizontal[1]))),trace.endpos[2]]
  trace=aasMovementTrace(context,start,finish,aasRuntime.PRESENCE_NORMAL,state.entityNum);if trace is error or trace.startsolid then return false end if;start=[trace.endpos[0],trace.endpos[1],trace.endpos[2]];finish=[trace.endpos[0],trace.endpos[1],state.origin[2]]
  trace=aasMovementTrace(context,start,finish,aasRuntime.PRESENCE_NORMAL,state.entityNum);if trace is error or trace.startsolid or trace.fraction>=1.0 or n.fsub(trace.endpos[2],state.origin[2])<context.aasMovement.settings.maxstep then return false end if;return true
end function
/// Update `state.moveFlags` in engine.local_qvm_match; the normal completion returns `aiMoveRuntime.emitMovement(movement, state, horizontal, speed)`.
///
/// Direct state writes: `state.moveFlags`.
/// @param context Record exposing `aiMoveRuntime`, `aasMovement`.
/// @param state Record exposing `moveFlags`, `origin`, `entityNum`, `velocity`, `thinkTime`. Updated in place: `moveFlags`.
/// @param direction Direction used in `direction[0]` and `direction[1]`.
/// @param speed Speed passed as `speed` to `mq3.engine.local_qvm_match.moveBarrierJump`.
/// @param type Type used in `(type & aiMoveRuntime.MOVE_JUMP)` and `(type & aiMoveRuntime.MOVE_CROUCH)`.
function moveWalkDirection(context,state,direction,speed,type)
  movement=context.aiMoveRuntime
  horizontal=aiMoveRuntime.normalize([direction[0],direction[1],0.0])[1]
  if moveBarrierJump(context,state,horizontal,speed) then
    aiMoveRuntime.emitJump(movement,state)
    state.moveFlags=state.moveFlags|aiMoveRuntime.MFL_BARRIERJUMP
    return aiMoveRuntime.emitMovement(movement,state,horizontal,speed)
  end if
  state.moveFlags=state.moveFlags&(~aiMoveRuntime.MFL_BARRIERJUMP)
  jump=(type&aiMoveRuntime.MOVE_JUMP)!=0
  crouch=(type&aiMoveRuntime.MOVE_CROUCH)!=0
  presence=aasRuntime.PRESENCE_NORMAL
  if crouch and not jump then presence=aasRuntime.PRESENCE_CROUCH end if
  if not jump then jump=moveGapDistance(context,state.origin,horizontal,state.entityNum)>0.0 end if
  hazard=aasClientMovement.SE_ENTERSLIME|aasClientMovement.SE_ENTERLAVA|aasClientMovement.SE_HITGROUNDDAMAGE
  events=hazard|aasClientMovement.SE_ENTERWATER
  maxFrames=2;cmdFrames=2;up=0.0
  if jump then maxFrames=30;cmdFrames=1;up=400.0;events=events|aasClientMovement.SE_HITGROUND end if
  origin=[state.origin[0],state.origin[1],state.origin[2]+0.5]
  command=[horizontal[0]*speed,horizontal[1]*speed,up]
  prediction=aasClientMovement.predict(context.aasMovement,state.entityNum,origin,presence,true,state.velocity,command,cmdFrames,maxFrames,0.1,events,0,false)
  if prediction is error or (prediction.stopevent&hazard)!=0 or (jump and prediction.frames>=maxFrames) then return false end if
  if (prediction.stopevent&aasClientMovement.SE_HITGROUND)!=0 then
    landingDirection=aiMoveRuntime.normalize(prediction.velocity)[1]
    if moveGapDistance(context,prediction.endpos,landingDirection,state.entityNum)>0.0 then return false end if
    if moveGapDistance(context,prediction.endpos,horizontal,state.entityNum)>0.0 then return false end if
  end if
  displacement=[prediction.endpos[0]-state.origin[0],prediction.endpos[1]-state.origin[1],0.0]
  if aiMoveRuntime.distance(displacement,[0.0,0.0,0.0])<speed*state.thinkTime*0.5 then return false end if
  if jump then aiMoveRuntime.emitJump(movement,state) end if
  if crouch then aiMoveRuntime.emitCrouch(movement,state) end if
  return aiMoveRuntime.emitMovement(movement,state,horizontal,speed)
end function
/// Compute move route reachability in engine.local_qvm_match; the normal completion returns `aasRoutingCache.areaReachabilityToGoalArea(context.aasRouteCache, area, origin, goalArea, travelFlags)`.
/// @param context Record exposing `aasRouteCache`.
/// @param area Area num passed as `areaNum` to `mq3.botlib.aas_routing_cache.areaReachabilityToGoalArea`.
/// @param origin Origin passed as `origin` to `mq3.botlib.aas_routing_cache.areaReachabilityToGoalArea`.
/// @param goalArea Goal area num passed as `goalAreaNum` to `mq3.botlib.aas_routing_cache.areaReachabilityToGoalArea`.
/// @param travelFlags Travel flags passed as `travelFlags` to `mq3.botlib.aas_routing_cache.areaReachabilityToGoalArea`.
function moveRouteReachability(context,area,origin,goalArea,travelFlags)
  if context.aasRouteCache==void then return 0 end if;return aasRoutingCache.areaReachabilityToGoalArea(context.aasRouteCache,area,origin,goalArea,travelFlags)
end function
/// Return `mq3.botlib.aas_routing_cache.weightedTravelTime(context.aasRouteCache, area, origin, goalArea, travelFlags)` from `engine.local_qvm_match.moveRouteTravelTime`.
/// @param context Record exposing `aasRouteCache`.
/// @param area Area num passed as `areaNum` to `mq3.botlib.aas_routing_cache.weightedTravelTime`.
/// @param origin Origin passed as `origin` to `mq3.botlib.aas_routing_cache.weightedTravelTime`.
/// @param goalArea Goal area num passed as `goalAreaNum` to `mq3.botlib.aas_routing_cache.weightedTravelTime`.
/// @param travelFlags Travel flags passed as `travelFlags` to `mq3.botlib.aas_routing_cache.weightedTravelTime`.
function moveRouteTravelTime(context,area,origin,goalArea,travelFlags)
  return aasRoutingCache.weightedTravelTime(context.aasRouteCache,area,origin,goalArea,travelFlags)
end function
/// Return `mq3.compat.numeric.fsub(n.fmul(2.0, aiGoalSelection.randomFloat(context.aiGoalSelection)), 1.0)` from `engine.local_qvm_match.moveSignedRandom`.
/// @param context Record exposing `aiGoalSelection`.
function moveSignedRandom(context) return n.fsub(n.fmul(2.0,aiGoalSelection.randomFloat(context.aiGoalSelection)),1.0) end function
/// Compute botlib text in engine.local_qvm_match; the normal completion returns `value`.
/// @param context Record exposing `botlib`.
/// @param name Name passed as `name` to `mq3.botlib.lifecycle_runtime.varGet`.
/// @param fallback Value returned unchanged by this function.
function botlibText(context,name,fallback) value=botlibRuntime.varGet(context.botlib,name);if value=="" then return fallback end if;return value end function
/// Delegate `moveGrappleConfig` to `mq3.botlib.ai_move_runtime.GrappleConfig` and return its result.
/// @param context Record exposing `botlib`.
function moveGrappleConfig(context)
  return aiMoveRuntime.GrappleConfig(botlibRuntime.integerVariable(context.botlib,"offhandgrapple",0)!=0,botlibRuntime.integerVariable(context.botlib,"weapindex_grapple",10),botlibText(context,"cmd_grappleon","grappleon"),botlibText(context,"cmd_grappleoff","grappleoff"))
end function
/// Compute move grapple state in engine.local_qvm_match; the normal completion returns `0`.
/// @param context Record exposing `botlib`, `aasEntities`.
/// @param state Reserved argument; this implementation does not read its value.
/// @param reach Reserved argument; this implementation does not read its value.
function moveGrappleState(context,state,reach)
  entityType=botlibRuntime.integerVariable(context.botlib,"entitytypemissile",3);weapon=botlibRuntime.integerVariable(context.botlib,"weapindex_grapple",10)
  for entityNum=1 to len(context.aasEntities.entities)-1 info=aasEntities.info(context.aasEntities,entityNum);if info.valid and info.type==entityType and info.weapon==weapon then return 1 end if end for;return 0
end function
/// Compute move grapple trace in engine.local_qvm_match; the normal completion returns `serverWorld.trace(context.spatialScene, eye, target, zero, zero, entityNum, 65537, false).endpos`.
/// @param context Record exposing `spatialScene`.
/// @param eye Start passed as `start` to `mq3.server.world.trace`.
/// @param target Finish passed as `finish` to `mq3.server.world.trace`.
/// @param entityNum Pass entity passed as `passEntity` to `mq3.server.world.trace`.
function moveGrappleTrace(context,eye,target,entityNum)
  zero=[0.0,0.0,0.0];return serverWorld.trace(context.spatialScene,eye,target,zero,zero,entityNum,0x10001,false).endpos
end function
/// Compute predict visible trace in engine.local_qvm_match; the normal completion returns `serverWorld.trace(context.spatialScene, start, finish, zero, zero, passEntity, contents, false).trace.fraction`.
/// @param context Record exposing `spatialScene`.
/// @param start Start passed as `start` to `mq3.server.world.trace`.
/// @param finish Finish passed as `finish` to `mq3.server.world.trace`.
/// @param passEntity Pass entity passed as `passEntity` to `mq3.server.world.trace`.
/// @param contents Mask passed as `mask` to `mq3.server.world.trace`.
function predictVisibleTrace(context,start,finish,passEntity,contents)
  zero=[0.0,0.0,0.0];return serverWorld.trace(context.spatialScene,start,finish,zero,zero,passEntity,contents,false).trace.fraction
end function
/// Update `context.lastBotTrap`, `context.aas`, `context.aasRouter`, `context.aasRouteCache` in engine.local_qvm_match; the normal completion returns `error(7643, ("local QVM match: unsupported retail qagame trap " + str(op)))`.
///
/// Direct state writes: `context.lastBotTrap`, `context.aas`, `context.aasRouter`, `context.aasRouteCache`, `context.aasCachePath`, `context.aasEntities`.
/// @param context Record exposing `aiMoveRuntime`, `aiVisiblePosition`, `aiLevelItems`, `aiMapGoals`, `aiChatStrings`, `aiChatMatches`, `aiChatOutput` and further fields. Updated in place: `lastBotTrap`, `aas`, `aasRouter`, `aasRouteCache`, `aasCachePath`, `aasEntities`.
/// @param vm Vm passed as `vm` to `mq3.engine.local_qvm_match.qagameFileList`.
/// @param base Base passed as `base` to `mq3.engine.local_qvm_match.qagameFileList`.
/// @param op Op passed as `op` to `mq3.botlib.server_imports.SV_BotDispatch`.
function extendedQagame(context,vm,base,op)
  if op==38 then return qagameFileList(context,vm,base) end if
  if op>=200 and op<600 then context.lastBotTrap=op end if
  if op==200 then saveBotRoutes(context);context.aas=void;context.aasRouter=void;context.aasRouteCache=void;context.aasCachePath="";context.aiMoveRuntime.aas=void;context.aiMoveRuntime.router=void;context.aiVisiblePosition.router=void;aiLevelItems.shutdown(context.aiLevelItems);aiMapGoals.clear(context.aiMapGoals);aiChatStrings.clear(context.aiChatStrings);aiChatMatches.clear(context.aiChatMatches);aiChatOutput.clear(context.aiChatOutput);result=botInterface.Export_BotLibSetup(context.botlib,botInterface.services(context));if result==0 then context.aasEntities=aasEntities.create(context.botlib.maxentities);configured=aiConsoleMessages.configureFromBotlib(context.aiConsole,context.botlib);if configured is error then return configured end if;configureAasMovement(context);aiItemWeights.setReloadCharacters(context.aiItemWeights,botlibRuntime.integerVariable(context.botlib,"bot_reloadcharacters",0));noChat=botlibRuntime.integerVariable(context.botlib,"nochat",0)!=0;loaded=aiChatOutput.setup(context.aiChatOutput,noChat);if loaded is error then return loaded end if;matchFile=botlibText(context,"matchfile","match.c");matched=try(aiChatMatches.load(context.aiChatMatches,matchFile));if matched is error then context.aiChatMatches.loaded=true end if end if;return result end if
  if op==201 then saveBotRoutes(context);context.aas=void;context.aasRouter=void;context.aasRouteCache=void;context.aasCachePath="";context.aiVisiblePosition.router=void;aiCharacters.shutdown(context.aiCharacters);aiChatProfiles.clearCache(context.aiChat);aiChatStrings.clear(context.aiChatStrings);aiChatMatches.clear(context.aiChatMatches);aiChatOutput.shutdown(context.aiChatOutput);aiMapGoals.clear(context.aiMapGoals);aiConsoleMessages.shutdown(context.aiConsole);aiResourcePools.shutdown(context.aiResources);aiLevelItems.shutdown(context.aiLevelItems);aiItemWeights.shutdown(context.aiItemWeights);aiWeaponWeights.shutdown(context.aiWeaponWeights);result=botInterface.Export_BotLibShutdown(context.botlib,botInterface.services(context),context.pcRegistry);if result==0 then context.aasEntities=aasEntities.create(1024) end if;return result end if
  if op==202 then return botlibVarSet(context,vm,base) end if
  if op==203 then return botlibVarGet(context,vm,base) end if
  if op==204 then return pcAddDefine(context,vm,base) end if
  if op==205 then time=n.bitsFloat(common.argument(vm,base,1));result=botInterface.Export_BotLibStartFrame(context.botlib,time,botInterface.services(context));if result==0 then aasRuntime.setTime(context.aas,time);aasEntities.startFrame(context.aasEntities,time);aiConsoleMessages.setTime(context.aiConsole,time) end if;return result end if
  if op==206 then return botlibLoadMap(context,vm,base) end if
  if op==207 then return updateAasEntity(context,vm,base) end if
  if op==208 then return botInterface.BotExportTest(common.argument(vm,base,1),common.argument(vm,base,2),common.argument(vm,base,3),common.argument(vm,base,4)) end if
  if op>=botServerBridge.OP_GET_SNAPSHOT_ENTITY and op<=botServerBridge.OP_USER_COMMAND then return botServerImports.SV_BotDispatch(context.botServer,vm,base,op) end if
  if op==309 then point=common.readFloatVector(vm,common.argument(vm,base,1),3,"AAS point contents");if point is error then return point end if;host=botServerImports.services(context);host.pointContentsFn=pointContents;return aasBspq3.AAS_PointContents(host,point) end if
  if op==303 then return aasQuerySyscalls.entityInfo(context.aasEntities,vm,common.argument(vm,base,1),common.argument(vm,base,2)) end if
  if op==308 then return aasQuerySyscalls.trace(context.aas,vm,base) end if
  if op==317 then origin=common.readFloatVector(vm,common.argument(vm,base,1),3,"AAS swimming origin");if origin is error then return origin end if;if aasMovementQueries.swimming(context,aasPointContents,origin) then return 1 end if;return 0 end if
  if op==318 then return aasClientMovementSyscalls.dispatch(context.aasMovement,vm,base) end if
  if op>=300 and op<400 then return aasSyscalls.dispatchCached(context.aas,context.aasRouter,context.aasRouteCache,context.botBspEntities,vm,base,op) end if
  if op>=400 and op<=423 then return elementaryActionSyscalls.dispatch(context.elementaryActions,vm,base,op) end if
  if op>=500 and op<=506 then return aiCharacterSyscalls.dispatch(context.aiCharacters,vm,base,op) end if
  if op>=aiConsoleMessages.OP_QUEUE_CONSOLE_MESSAGE and op<=aiConsoleMessages.OP_NUM_CONSOLE_MESSAGE then return aiConsoleMessages.dispatch(context.aiConsole,vm,base,op) end if
  if aiChatOutput.supportsTrap(op) then return aiChatOutputSyscalls.dispatch(context.aiChatOutput,vm,base,op) end if
  if op>=aiChatMatches.OP_STRING_CONTAINS and op<=aiChatMatches.OP_MATCH_VARIABLE then return aiChatMatchSyscalls.dispatch(context.aiChatMatches,vm,base,op) end if
  if op>=aiChatStrings.OP_UNIFY_WHITE_SPACES and op<=aiChatProfiles.OP_SET_CHAT_NAME then return aiChatStringSyscalls.dispatch(context.aiChatStrings,context.aiChat,vm,base,op) end if
  if op==aiItemWeights.OP_LOAD_ITEM_WEIGHTS or op==aiItemWeights.OP_FREE_ITEM_WEIGHTS then return aiItemWeightSyscalls.dispatch(context.aiItemWeights,context.aiResources,vm,base,op) end if
  if op==aiWeaponCombat.OP_CHOOSE_BEST_FIGHT_WEAPON or op==aiWeaponCombat.OP_GET_WEAPON_INFO then return aiWeaponCombatSyscalls.dispatch(context.aiWeaponWeights,context.aiResources,vm,base,op) end if
  if op==aiWeaponWeights.OP_LOAD_WEAPON_WEIGHTS then return aiWeaponWeightSyscalls.dispatch(context.aiWeaponWeights,context.aiResources,vm,base,op) end if
  if op==aiAvoidSpots.OP_ADD_AVOID_SPOT then return aiAvoidSpotSyscalls.dispatch(context.aiResources,vm,base) end if
  if aiGoalState.supportsTrap(op) then return aiGoalStateSyscalls.dispatch(context.aiGoalState,vm,base,op) end if
  if aiGoalSelection.supportsTrap(op) then return aiGoalSelectionSyscalls.dispatch(context.aiGoalSelection,vm,base,op) end if
  if aiChatGoalTail.supportsTrap(op) then return aiChatGoalTailSyscalls.dispatch(context.aiChatGoalTail,vm,base,op) end if
  if aiMapGoals.supportsTrap(op) then return aiMapGoalSyscalls.dispatch(context.aiMapGoals,vm,base,op) end if
  if aiMoveRuntime.supportsTrap(op) then return aiMoveSyscalls.dispatch(context.aiMoveRuntime,vm,base,op) end if
  if op==aiPredictVisible.OP_PREDICT_VISIBLE_POSITION then return aiPredictVisibleSyscalls.dispatch(context.aiVisiblePosition,vm,base,op) end if
  if op==aiLevelItems.OP_INIT_LEVEL_ITEMS then initialized=aiLevelItems.initialize(context.aiLevelItems);if initialized is error then return initialized end if;mapped=aiMapGoals.initialize(context.aiMapGoals,context.aas,context.botBspEntities);if mapped is error then return mapped end if;return 0 end if
  if op==aiLevelItems.OP_UPDATE_ENTITY_ITEMS then updated=aiLevelItems.update(context.aiLevelItems);if updated is error then return updated end if;return 0 end if
  if aasRouteExtras.supportsTrap(op) then return aasRouteExtraSyscalls.dispatchCached(context.aas,context.aasRouter,context.aasRouteCache,vm,base,op) end if
  if op==aiResourcePools.OP_FREE_CHAT_STATE then aiConsoleMessages.clearChat(context.aiConsole,common.argument(vm,base,1));return aiResourceSyscalls.dispatch(context.aiResources,vm,base,op) end if
  if aiResourcePools.supportsTrap(op) then return aiResourceSyscalls.dispatch(context.aiResources,vm,base,op) end if
  return error(7643,"local QVM match: unsupported retail qagame trap "+str(op))
end function

/// Trace world in engine.local_qvm_match.
/// @param context Record exposing `spatialScene`.
/// @param start Start passed as `start` to `mq3.server.world.trace`.
/// @param mins Mins passed as `mins` to `mq3.server.world.trace`.
/// @param maxs Maxs passed as `maxs` to `mq3.server.world.trace`.
/// @param finish Finish passed as `finish` to `mq3.server.world.trace`.
/// @param passEntity Pass entity passed as `passEntity` to `mq3.server.world.trace`.
/// @param mask Mask passed as `mask` to `mq3.server.world.trace`.
/// @param capsule Capsule passed as `capsule` to `mq3.server.world.trace`.
function traceWorld(context,start,mins,maxs,finish,passEntity,mask,capsule)
  result=serverWorld.trace(context.spatialScene,start,finish,mins,maxs,passEntity,mask,capsule);trace=result.trace
  return qworld.TraceResult(trace.allsolid,trace.startsolid,trace.fraction,result.endpos,trace.normal,trace.distance,trace.planeMetadata&255,(trace.planeMetadata>>8)&255,trace.surfaceFlags,trace.contents,result.entityNum)
end function
/// Return `mq3.server.world.pointContents(context.spatialScene, point, passEntity)` from `engine.local_qvm_match.pointContents`.
/// @param context Record exposing `spatialScene`.
/// @param point Point passed as `point` to `mq3.server.world.pointContents`.
/// @param passEntity Pass entity passed as `passEntity` to `mq3.server.world.pointContents`.
function pointContents(context,point,passEntity) return serverWorld.pointContents(context.spatialScene,point,passEntity) end function
/// Return `mq3.server.world.areaEntities(context.spatialScene, mins, maxs, capacity)` from `engine.local_qvm_match.entitiesInBox`.
/// @param context Record exposing `spatialScene`.
/// @param mins Mins passed as `mins` to `mq3.server.world.areaEntities`.
/// @param maxs Maxs passed as `maxs` to `mq3.server.world.areaEntities`.
/// @param capacity Capacity passed as `capacity` to `mq3.server.world.areaEntities`.
function entitiesInBox(context,mins,maxs,capacity) return serverWorld.areaEntities(context.spatialScene,mins,maxs,capacity) end function
/// Compute entity contact in engine.local_qvm_match; the normal completion returns `serverWorld.entityContact(context.spatialScene, mins, maxs, index, capsule)`.
/// @param context Record exposing `spatialScene`.
/// @param mins Mins passed as `mins` to `mq3.server.world.entityContact`.
/// @param maxs Maxs passed as `maxs` to `mq3.server.world.entityContact`.
/// @param entity Entity passed as `entity` to `mq3.engine.local_qvm_match.entityIndex`.
/// @param capsule Capsule passed as `capsule` to `mq3.server.world.entityContact`.
function entityContact(context,mins,maxs,entity,capsule)
  index=entityIndex(context,entity);if index<0 then return fail("contact entity is outside game data") end if
  return serverWorld.entityContact(context.spatialScene,mins,maxs,index,capsule)
end function
/// Get usercmd in engine.local_qvm_match; the normal completion returns `context.usercmds[index]`.
/// @param context Record exposing `usercmds`, `now`.
/// @param index Zero-based index into `context.usercmds`.
function getUsercmd(context,index)
  if index<0 or index>=len(context.usercmds) then return qworld.userCommand(context.now,[0,0,0],0,2,0,0,0) end if
  return context.usercmds[index]
end function

/// Compute seed cvars in engine.local_qvm_match.
/// @param registry Registry passed as `registry` to `mq3.client.qvm_frame_input.registerConfig`.
function seedCvars(registry)
  clientFrameInput.registerConfig(registry)
  cvar.get(registry,"mapname","q3dm1",cvar.SERVERINFO|cvar.ROM)
  cvar.get(registry,"sv_maxclients","8",cvar.SERVERINFO|cvar.LATCH)
  cvar.get(registry,"g_gametype","0",cvar.SERVERINFO|cvar.LATCH)
  cvar.get(registry,"bot_enable","1",cvar.LATCH)
  cvar.get(registry,"g_log","",cvar.ARCHIVE)
  cvar.get(registry,"dedicated","0",cvar.ROM)
  return void
end function

/// Compute capture user settings in engine.local_qvm_match; the normal completion returns `UserSettings(savedCvars.toArray(), bindings, userinfos, [])`.
/// @param value Record exposing `context`.
function captureUserSettings(value)
  if value==void or value.context==void then return void end if
  savedCvars=lists.List.withCapacity(value.context.cvars.numIndexes)
  for index=0 to value.context.cvars.numIndexes-1
    variable=value.context.cvars.indexes[index]
    savedCvars.add([variable.name,variable.string,variable.resetString,variable.latchedString,variable.flags])
  end for
  bindings=array(cgameKeys.MAX_KEYS,void)
  for key=0 to cgameKeys.MAX_KEYS-1 bindings[key]=value.context.cgameKeys.bindings[key] end for
  userinfos=array(MAX_CLIENTS,"")
  for client=0 to MAX_CLIENTS-1 userinfos[client]=value.context.userinfos[client] end for
  return UserSettings(savedCvars.toArray(),bindings,userinfos,[])
end function

/// Apply saved cvars in engine.local_qvm_match.
/// @param registry Registry passed as `registry` to `mq3.qcommon.cvar.get`.
/// @param settings Record exposing `cvars`.
function applySavedCvars(registry,settings)
  if settings==void then return void end if
  for each saved in settings.cvars
    // mapname and the running-state cvars describe the newly-created host and
    // must never be inherited from the disconnected UI shell.
    if not stringEqualsIgnoreCaseAscii(saved[0],"mapname") and not stringEqualsIgnoreCaseAscii(saved[0],"sv_running") and not stringEqualsIgnoreCaseAscii(saved[0],"cl_running") then
      variable=cvar.get(registry,saved[0],saved[2],saved[4]);if variable is error then return variable end if
      variable=cvar.set2(registry,saved[0],saved[1],true);if variable is error then return variable end if
      if saved[3]!=void then variable.latchedString=saved[3] end if
    end if
  end for
  return void
end function

/// Apply saved client state in engine.local_qvm_match.
/// @param context Record exposing `cgameKeys`, `userinfos`, `commandState`.
/// @param settings Record exposing `bindings`, `userinfos`, `pendingBotCommands`.
function applySavedClientState(context,settings)
  if settings==void then return void end if
  count=len(settings.bindings);if count>cgameKeys.MAX_KEYS then count=cgameKeys.MAX_KEYS end if
  for key=0 to count-1 context.cgameKeys.bindings[key]=settings.bindings[key] end for
  count=len(settings.userinfos);if count>MAX_CLIENTS then count=MAX_CLIENTS end if
  for client=0 to count-1 context.userinfos[client]=settings.userinfos[client] end for
  // Start Server emits addbot after map in the old command buffer. The menu
  // shell is discarded at that boundary, so replay only these bot commands.
  for each text in settings.pendingBotCommands commands.addText(context.commandState,text+"\n") end for
  return void
end function

// Initial desktop controls. Saved menu bindings replace these on map changes.
/// @param context Record exposing `cgameKeys`.
function seedDesktopBindings(context)
  for each pair in [[119,"+forward"],[97,"+moveleft"],[115,"+back"],[100,"+moveright"],[32,"+moveup"],[99,"+movedown"],[137,"+movedown"],[178,"+attack"],[179,"+zoom"],[9,"+scores"],[138,"+speed"],[116,"messagemode"],[121,"messagemode2"],[103,"+button3"],[91,"weapprev"],[93,"weapnext"],[132,"+forward"],[133,"+back"],[134,"+left"],[135,"+right"]]
    cgameKeys.setBinding(context.cgameKeys,pair[0],pair[1])
  end for
  for weapon=1 to 9 cgameKeys.setBinding(context.cgameKeys,48+weapon,"weapon "+str(weapon)) end for
  return void
end function

/// Return `mq3.vm.cgame_misc_traps.sampleRealTime()` from `engine.local_qvm_match.qagameRealTime`.
/// @param context Reserved argument; this implementation does not read its value.
function qagameRealTime(context)
  return cgameMisc.sampleRealTime()
end function
/// Return `mq3.qcommon.memory_file_seek.seek(context.files, handle, offset, origin)` from `engine.local_qvm_match.qagameSeek`.
/// @param context Record exposing `files`.
/// @param handle Handle passed as `handle` to `mq3.qcommon.memory_file_seek.seek`.
/// @param offset Offset passed as `offset` to `mq3.qcommon.memory_file_seek.seek`.
/// @param origin Origin passed as `origin` to `mq3.qcommon.memory_file_seek.seek`.
function qagameSeek(context,handle,offset,origin) return memoryFileSeek.seek(context.files,handle,offset,origin) end function

/// Compute boot configured named mode settings in engine.local_qvm_match; the normal completion returns `boot`.
/// @param archive Initial `archive` field stored in the returned or constructed `mq3.engine.local_qvm_match.Context` record.
/// @param map Record exposing `data`, `offsets`, `lengths`.
/// @param now Server time passed as `serverTime` to `mq3.vm.syscall_qagame_world.userCommand`.
/// @param qvmRoot Initial `qvmRoot` field stored in the returned or constructed `mq3.engine.local_qvm_match.Context` record.
/// @param botsEnabled Bots enabled operand used by `bootConfiguredNamedModeSettings`; its reads are shown in the implementation.
/// @param mapName Value passed as `value` to `mq3.qcommon.cvar.set2`.
/// @param startGame Start game used in `(startGame and (map == void))` and `(((archive == void) or (now < 0)) or (startGame and (map == void)))`.
/// @param settings Settings passed as `settings` to `mq3.engine.local_qvm_match.applySavedCvars`.
function bootConfiguredNamedModeSettings(archive,map,now,qvmRoot,botsEnabled,mapName,startGame,settings)
  if archive==void or now<0 or (startGame and map==void) then return fail("archive, game map and non-negative time are required") end if
  entityBytes=bytes(0,0);if map!=void then entityBytes=slice(map.data,map.offsets[0],map.lengths[0]) end if
  serverLifecycle=serverInit.runtime();serverInit.SV_Init(serverLifecycle,void);registry=serverLifecycle.registry;seedCvars(registry);cvar.set2(registry,"sv_hostname","MiniQuake3",true);restored=applySavedCvars(registry,settings);if restored is error then return restored end if;cvar.set2(registry,"mapname",mapName,true)
  if botsEnabled then cvar.set2(registry,"bot_enable","1",true) end if
  scene=sceneQueue.create(4096,65536);scene.registered=true;scene.worldLoaded=map!=void
  collisionWorld=void;spatialScene=void
  if map!=void then collisionLoad=collision.CM_LoadMap(collision.mapState(true),"maps/"+mapName+".bsp",map.data,false);if collisionLoad is error then return collisionLoad end if;collisionWorld=collisionLoad.world;spatialScene=serverWorld.create(collisionWorld) end if
  initialCommand=qworld.userCommand(now,[0,0,0],0,2,0,0,0)
  grid=void;if map!=void then grid=lightGrid.load(map);if grid is error then return grid end if end if
  bspWorld=aasBspq3.create();if map!=void then loadedBsp=aasBspq3.AAS_LoadBSPFile(bspWorld,decode(entityBytes));if loadedBsp is error then return loadedBsp end if end if
  botBspEntities=bspWorld.entities
  commandState=commands.create();abiServer=serverAbi.server();serverLifecycle.sv.configstrings=abiServer.configstrings;configstrings=serverLifecycle.sv.configstrings;cgameServerCommands=serverCommandStream.create(commandState,configstrings)
  uiClient=uiHost.createClientState(uiHost.CA_DISCONNECTED,0,-1,"localhost","","");if uiClient is error then return uiClient end if
  nativeServerCmds=nativeCgameServercmds.create();nativeServerCmds.configstrings=configstrings
  nativeMain=nativeCgameMain.create();nativeMain.configstrings=configstrings
  context=Context(archive,parser.create(entityBytes),registry,commandState,configstrings,array(MAX_CLIENTS,"\\name\\Sarge\\rate\\25000"),array(MAX_CLIENTS,initialCommand),[void],1,[],[],[],0,0,0,0,0,now,0,array(1024,false),[],[],[],markFragments.geometryCache(),[],void,0,void,scene,renderQueue.createFast(void,void,256),qvmRoot,collisionWorld,spatialScene,void,0,matchCommandRing.create(),0,0,grid,0,0,[],map,fontAbi.create(archive),void,cinematics.create(archive),array(100,0),botlibRuntime.create(),void,void,void,"",botBspEntities,shaderRemap.create(),array(MAX_CLIENTS,0),0,0,void,0,aasEntities.create(1024),void,aiResourcePools.create(),void,void,void,void,void,void,cgameMisc.createEntityTokens(entityBytes),void,void,void,void,void,void,void,void,void,void,uiLan.create(),cgameKeys.create(),uiLanCache.diskServices(""),cgameUsercmd.create(),void,void,void,cgameServerCommands,uiClient,nativeCgameCommands.create(),void,nativeCgameSnapshot.create(1024),nativeCgamePlayerstate.create(),nativeCgameEvent.create(1024),nativeCgameEnts.create(1024),nativeCgameLocalents.initLocalEntities(void,true),nativeCgameEffects.create(),nativeCgameWeapons.create(),nativeCgameView.create(),nativeCgameDrawtools.create(),nativeCgameDraw.state(),nativeCgameParticles.create(nativeCgameParticles.MAX_PARTICLES,true),nativeServerCmds,nativeMain,nativeCgameMarks.create(nativeCgameMarks.MAX_MARK_POLYS,true),nativeCgamePlayers.create(),void,cgameCollisionCache.create(),void,void,lists.List.withCapacity(8),bytes(cgameSyscall.SNAPSHOT_SIZE,0),void)
  commands.initCommands(context.commandState);installed=cvarCommands.install(registry,context.commandState);if installed is error then return installed end if
  bindingState=bindingConfig.create(context.cgameKeys);bindingState.printFn=emitPrint;bindingState.printContext=context
  installed=bindingConfig.install(bindingState,context.commandState);if installed is error then return installed end if
  seedDesktopBindings(context)
  restored=applySavedClientState(context,settings);if restored is error then return restored end if
  textServices=consoleInput.services(context);textServices.commandFn=consoleInputCommand;textServices.reliableFn=consoleInputReliable;textServices.printFn=emitPrint;textServices.scrollFn=consoleScroll
  context.clientTextInput=consoleInput.create(78,textServices)
  consoleServices=clientConsole.services(context);consoleServices.startDemoLoopFn=consoleStartDemoLoop;consoleServices.crosshairPlayerFn=consoleCrosshairPlayer;consoleServices.lastAttackerFn=consoleLastAttacker;clientConsole.Con_Init(clientConsole.create(context.clientTextInput,consoleServices),640)
  if not commands.addContextCommand(context.commandState,"toggleconsole",toggleConsoleCommand,context) then return fail("toggleconsole command already registered") end if
  if not commands.addContextCommand(context.commandState,"messagemode",messageModeCommand,context) then return fail("messagemode command already registered") end if
  if not commands.addContextCommand(context.commandState,"messagemode2",messageMode2Command,context) then return fail("messagemode2 command already registered") end if
  if not commands.addContextCommand(context.commandState,"messagemode3",messageMode3Command,context) then return fail("messagemode3 command already registered") end if
  if not commands.addContextCommand(context.commandState,"messagemode4",messageMode4Command,context) then return fail("messagemode4 command already registered") end if
  if not commands.addContextCommand(context.commandState,"clear",clearConsoleCommand,context) then return fail("clear command already registered") end if
  if not commands.addContextCommand(context.commandState,"condump",dumpConsoleCommand,context) then return fail("condump command already registered") end if
  if not commands.addContextCommand(context.commandState,"sectorlist",sectorListCommand,context) then return fail("sectorlist command already registered") end if
  context.aasMovement=aasClientMovement.services(context);context.aasMovement.traceFn=aasMovementTrace;context.aasMovement.pointContentsFn=aasPointContents;context.aasMovement.pointAreaFn=aasMovementPointArea;context.aasMovement.pointPresenceFn=aasMovementPointPresence;context.aasMovement.areaContentsFn=aasMovementAreaContents;context.aasMovement.traceAreasFn=aasMovementTraceAreas
  maxClients=serverInit.SV_BoundMaxClients(serverLifecycle,1)
  context.clientStates=array(maxClients,0)
  context.elementaryActions=elementaryActions.create(maxClients,botClientCommand,context)
  context.aiCharacters=aiCharacters.create(maxClients,context,botCharacterRead)
  context.aiItemWeights=aiItemWeights.create(context,botCharacterRead)
  aiItemWeights.setQvmInventoryLayout(context.aiItemWeights,true)
  context.aiLevelItems=aiLevelItems.create(context.aiItemWeights)
  context.aiGoalState=aiGoalState.create(context.aiResources,context,goalStateTime,goalStateName,goalStateLog,goalStatePrint)
  goalServices=aiGoalSelection.services(context);goalServices.travelTimeFn=goalSelectionTravelTime;goalServices.traceFn=goalSelectionTrace;goalServices.itemQueryFn=goalSelectionItemQuery
  context.aiGoalSelection=aiGoalSelection.create(context.aiLevelItems,context.aiGoalState,goalServices)
  aiGoalSelection.setRandomSeed(context.aiGoalSelection,now)
  context.aiChatStrings=aiChatStrings.create(context,botCharacterRead)
  context.aiChatMatches=aiChatMatches.create(context,botCharacterRead)
  context.aiChat=aiChatProfiles.create(context.aiResources,context,botCharacterRead)
  context.aiChatOutput=aiChatOutput.create(context.aiChat,context.aiChatStrings,context.elementaryActions,context,botCharacterRead,goalStateTime,chatOutputRandom)
  context.aiChatGoalTail=aiChatGoalTail.create(context.aiChat,context.aiGoalState,context.aiLevelItems)
  moveServices=aiMoveRuntime.services(context);moveServices.groundTraceFn=moveGroundTrace;moveServices.entityModelFn=moveEntityModel;moveServices.modelTypeFn=moveModelType;moveServices.modelReachabilityFn=moveModelReachability;moveServices.swimmingFn=moveSwimming;moveServices.clientTraceFn=moveClientTrace;moveServices.elementaryActions=context.elementaryActions;moveServices.onGroundFn=moveOnGround;moveServices.blockTraceFn=moveBlockTrace;moveServices.jumpRunStartFn=moveJumpRunStart;moveServices.gravityFn=moveGravity;moveServices.horizontalVelocityForJumpFn=moveHorizontalVelocityForJump;moveServices.elevatorStateFn=moveElevatorState;moveServices.barrierJumpFn=moveBarrierJump;moveServices.routeReachabilityFn=moveRouteReachability;moveServices.randomFn=moveSignedRandom;moveServices.pointContentsFn=aasPointContents;moveServices.funcBobStateFn=moveFuncBobState;moveServices.grappleConfigFn=moveGrappleConfig;moveServices.grappleStateFn=moveGrappleState;moveServices.grappleTraceFn=moveGrappleTrace
  moveServices.againstLadderFn=moveAgainstLadder
  moveServices.gapDistanceFn=moveGapDistance
  moveServices.walkDirectionFn=moveWalkDirection
  moveServices.routeTravelTimeFn=moveRouteTravelTime
  context.aiMoveRuntime=aiMoveRuntime.create(context.aiResources,void,void,moveServices)
  context.aiVisiblePosition=aiPredictVisible.create(void,context,predictVisibleTrace)
  context.aiMapGoals=aiMapGoals.create()
  context.aiWeaponWeights=aiWeaponWeights.create(context,botCharacterRead,context.aiItemWeights)
  context.botServer=botServerBridge.create(maxClients);botServerBridge.setTime(context.botServer,now)
  context.aiConsole=aiConsoleMessages.create(context.aiResources)
  context.pcRegistry=pcParser.create(context,pcLoad)
  runtimeHost=runtime.services();runtimeHost.context=context;runtimeHost.loadFn=imageLoader;runtimeHost.symbolFn=imageLoader;runtimeHost.developerFn=vmRuntimeDeveloper;runtimeHost.registerCvarFn=vmRuntimeRegister;runtimeHost.addCommandFn=vmRuntimeAddCommand
  machineRuntime=runtime.create(runtimeHost);if machineRuntime is error then return machineRuntime end if;context.machineRuntime=machineRuntime;runtime.init(machineRuntime)
  // Quake III starts ui.qvm while disconnected.  Do not initialize the much
  // heavier qagame/cgame pair until the user actually chooses a map.
  if not startGame then return Boot(void,machineRuntime,context,void,void) end if
  shared=common.services(registry,context.commandState,context);shared.printFn=emitPrint;shared.errorFn=emitError;shared.millisecondsFn=milliseconds;shared.consoleFn=consoleCommand
  shared.openFn=openFile;shared.readFn=readFile;shared.writeFn=writeFile;shared.closeFn=closeFile
  gameSyscalls=qagame.services(shared,context);gameSyscalls.locateGameDataFn=locateGameData;gameSyscalls.dropClientFn=dropClient;gameSyscalls.sendServerCommandFn=sendServerCommand
  gameSyscalls.setConfigstringFn=setConfigstring;gameSyscalls.getConfigstringFn=getConfigstring;gameSyscalls.getUserinfoFn=getUserinfo;gameSyscalls.setUserinfoFn=setUserinfo
  gameSyscalls.getServerinfoFn=getServerinfo;gameSyscalls.setBrushModelFn=setBrushModel;gameSyscalls.inPvsFn=inPvs;gameSyscalls.adjustAreaPortalFn=adjustPortal;gameSyscalls.areasConnectedFn=areasConnected
  gameSyscalls.linkEntityFn=linkEntity;gameSyscalls.unlinkEntityFn=unlinkEntity;gameSyscalls.botAllocateClientFn=allocateBot;gameSyscalls.botFreeClientFn=freeBot;gameSyscalls.entityTokenFn=entityToken
  gameSyscalls.fileListFn=uiFileList;gameSyscalls.realTimeFn=qagameRealTime;gameSyscalls.seekFn=qagameSeek
  gameSyscalls.extendedFn=extendedQagame
  world=qworld.services(context);world.traceFn=traceWorld;world.pointContentsFn=pointContents;world.entitiesInBoxFn=entitiesInBox;world.entityContactFn=entityContact;world.getUsercmdFn=getUsercmd;gameSyscalls.worldServices=world
  host=gameVm.services(machineRuntime,qagame.callback(gameSyscalls),loadVm,callVm,restartVm,freeVm);host.context=context;host.millisecondsFn=milliseconds;host.entityStringFn=entityString;host.clearClientEntityFn=clearClient;host.botEnableFn=botEnable
  game=gameVm.create(host);if game is error then return game end if;context.game=game
  // SV_SpawnServer runs three GAME_RUN_FRAME calls before admitting clients.
  // In particular FinishSpawningItem runs at init+200ms; without this warmup
  // target_give can touch a still-uninitialized item (modelindex zero).
  settleStart=now-200
  context.now=settleStart
  initialized=gameVm.initialize(game,settleStart,maxClients);if initialized is error then return initialized end if
  for warmup=0 to 2
    context.now=settleStart+warmup*100
    settled=gameVm.runFrame(game,context.now);if settled is error then return settled end if
  end for
  context.now=now
  // Local matches do not call SV_SpawnServer; publish its server-info
  // configstring before CG_INIT copies the gamestate into cgame.qvm.
  context.configstrings[serverInit.CS_SERVERINFO]=getServerinfo(context)
  // Server commands (including addbot) must dispatch before CG_INIT; the
  // original Start Server UI leaves them queued behind the map transition.
  boot=Boot(game,machineRuntime,context,void,void)
  context.commandState.context=boot;context.commandState.serverRunning=true;context.commandState.serverGameCommandFn=serverGameCommand
  return boot
end function
/// Return `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings(archive, map, now, qvmRoot, botsEnabled, mapName, startGame, void)` from `engine.local_qvm_match.bootConfiguredNamedMode`.
/// @param archive Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param map Map passed as `map` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param now Now passed as `now` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param qvmRoot Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param botsEnabled Bots enabled passed as `botsEnabled` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param mapName Map name passed as `mapName` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param startGame Start game passed as `startGame` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
function bootConfiguredNamedMode(archive,map,now,qvmRoot,botsEnabled,mapName,startGame) return bootConfiguredNamedModeSettings(archive,map,now,qvmRoot,botsEnabled,mapName,startGame,void) end function
/// Return `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings(archive, map, now, qvmRoot, botsEnabled, mapName, true, void)` from `engine.local_qvm_match.bootConfiguredNamed`.
/// @param archive Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param map Map passed as `map` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param now Now passed as `now` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param qvmRoot Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param botsEnabled Bots enabled passed as `botsEnabled` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param mapName Map name passed as `mapName` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
function bootConfiguredNamed(archive,map,now,qvmRoot,botsEnabled,mapName) return bootConfiguredNamedModeSettings(archive,map,now,qvmRoot,botsEnabled,mapName,true,void) end function
/// Return `mq3.engine.local_qvm_match.bootConfiguredNamed(archive, map, now, qvmRoot, botsEnabled, "q3dm1")` from `engine.local_qvm_match.bootConfigured`.
/// @param archive Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfiguredNamed`.
/// @param map Map passed as `map` to `mq3.engine.local_qvm_match.bootConfiguredNamed`.
/// @param now Now passed as `now` to `mq3.engine.local_qvm_match.bootConfiguredNamed`.
/// @param qvmRoot Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfiguredNamed`.
/// @param botsEnabled Bots enabled passed as `botsEnabled` to `mq3.engine.local_qvm_match.bootConfiguredNamed`.
function bootConfigured(archive,map,now,qvmRoot,botsEnabled) return bootConfiguredNamed(archive,map,now,qvmRoot,botsEnabled,"q3dm1") end function

/// Return `mq3.engine.local_qvm_match.bootConfigured(archive, map, now, qvmRoot, false)` from `engine.local_qvm_match.bootWithQvms`.
/// @param archive Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfigured`.
/// @param map Map passed as `map` to `mq3.engine.local_qvm_match.bootConfigured`.
/// @param now Now passed as `now` to `mq3.engine.local_qvm_match.bootConfigured`.
/// @param qvmRoot Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfigured`.
function bootWithQvms(archive,map,now,qvmRoot) return bootConfigured(archive,map,now,qvmRoot,false) end function
/// Return `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings(archive, map, now, qvmRoot, false, mapName, true, settings)` from `engine.local_qvm_match.bootWithQvmsSettingsNamed`.
/// @param archive Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param map Map passed as `map` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param mapName Map name passed as `mapName` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param now Now passed as `now` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param qvmRoot Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param settings Settings passed as `settings` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
function bootWithQvmsSettingsNamed(archive,map,mapName,now,qvmRoot,settings) return bootConfiguredNamedModeSettings(archive,map,now,qvmRoot,false,mapName,true,settings) end function
/// Return `mq3.engine.local_qvm_match.bootWithQvmsSettingsNamed(archive, map, "q3dm1", now, qvmRoot, settings)` from `engine.local_qvm_match.bootWithQvmsSettings`.
/// @param archive Archive passed as `archive` to `mq3.engine.local_qvm_match.bootWithQvmsSettingsNamed`.
/// @param map Map passed as `map` to `mq3.engine.local_qvm_match.bootWithQvmsSettingsNamed`.
/// @param now Now passed as `now` to `mq3.engine.local_qvm_match.bootWithQvmsSettingsNamed`.
/// @param qvmRoot Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootWithQvmsSettingsNamed`.
/// @param settings Settings passed as `settings` to `mq3.engine.local_qvm_match.bootWithQvmsSettingsNamed`.
function bootWithQvmsSettings(archive,map,now,qvmRoot,settings) return bootWithQvmsSettingsNamed(archive,map,"q3dm1",now,qvmRoot,settings) end function
/// Return `mq3.engine.local_qvm_match.bootConfiguredNamedMode(archive, map, now, qvmRoot, false, "q3dm1", false)` from `engine.local_qvm_match.bootUiShell`.
/// @param archive Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfiguredNamedMode`.
/// @param map Map passed as `map` to `mq3.engine.local_qvm_match.bootConfiguredNamedMode`.
/// @param now Now passed as `now` to `mq3.engine.local_qvm_match.bootConfiguredNamedMode`.
/// @param qvmRoot Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfiguredNamedMode`.
function bootUiShell(archive,map,now,qvmRoot) return bootConfiguredNamedMode(archive,map,now,qvmRoot,false,"q3dm1",false) end function
/// Return `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings(archive, map, now, qvmRoot, false, "q3dm1", false, settings)` from `engine.local_qvm_match.bootUiShellSettings`.
/// @param archive Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param map Map passed as `map` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param now Now passed as `now` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param qvmRoot Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param settings Settings passed as `settings` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
function bootUiShellSettings(archive,map,now,qvmRoot,settings) return bootConfiguredNamedModeSettings(archive,map,now,qvmRoot,false,"q3dm1",false,settings) end function
/// Return `mq3.engine.local_qvm_match.bootConfigured(archive, map, now, qvmRoot, true)` from `engine.local_qvm_match.bootWithBots`.
/// @param archive Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfigured`.
/// @param map Map passed as `map` to `mq3.engine.local_qvm_match.bootConfigured`.
/// @param now Now passed as `now` to `mq3.engine.local_qvm_match.bootConfigured`.
/// @param qvmRoot Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfigured`.
function bootWithBots(archive,map,now,qvmRoot) return bootConfigured(archive,map,now,qvmRoot,true) end function
/// Return `mq3.engine.local_qvm_match.bootConfiguredNamed(archive, map, now, qvmRoot, true, mapName)` from `engine.local_qvm_match.bootWithBotsNamed`.
/// @param archive Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfiguredNamed`.
/// @param map Map passed as `map` to `mq3.engine.local_qvm_match.bootConfiguredNamed`.
/// @param mapName Map name passed as `mapName` to `mq3.engine.local_qvm_match.bootConfiguredNamed`.
/// @param now Now passed as `now` to `mq3.engine.local_qvm_match.bootConfiguredNamed`.
/// @param qvmRoot Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfiguredNamed`.
function bootWithBotsNamed(archive,map,mapName,now,qvmRoot) return bootConfiguredNamed(archive,map,now,qvmRoot,true,mapName) end function
/// Return `mq3.engine.local_qvm_match.bootConfigured(archive, map, now, "", false)` from `engine.local_qvm_match.boot`.
/// @param archive Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfigured`.
/// @param map Map passed as `map` to `mq3.engine.local_qvm_match.bootConfigured`.
/// @param now Now passed as `now` to `mq3.engine.local_qvm_match.bootConfigured`.
function boot(archive,map,now) return bootConfigured(archive,map,now,"",false) end function

/// Compute connect local in engine.local_qvm_match.
/// @param value Record exposing `context`, `game`.
/// @param clientNum Client num passed as `clientNum` to `mq3.server.game_vm.clientConnect`.
function connectLocal(value,clientNum)
  if value==void or clientNum<0 or clientNum>=len(value.context.clientStates) or value.context.clientStates[clientNum]!=0 then return fail("local client slot is unavailable") end if
  denied=gameVm.clientConnect(value.game,clientNum,true,false);if denied is error then return denied end if
  if denied!=0 then return fail("GAME_CLIENT_CONNECT rejected local client") end if
  value.context.clientStates[clientNum]=1;begun=gameVm.clientBegin(value.game,clientNum);if begun is error then value.context.clientStates[clientNum]=0;value.context.userinfos[clientNum]="";botServerBridge.resetClient(value.context.botServer,clientNum);return begun end if
  if value.context.uiClient.clientNum<0 then value.context.uiClient.clientNum=clientNum end if;value.context.uiClient.connState=uiHost.CA_ACTIVE;value.context.uiClient.connectPacketCount=0;value.context.uiClient.messageString=""
  return void
end function

/// Execute game console in engine.local_qvm_match; the normal completion returns `gameVm.consoleCommand(value.game)`.
/// @param value Record exposing `context`, `game`.
/// @param text Text passed as `text` to `mq3.qcommon.command_buffer.tokenizeString`.
function executeGameConsole(value,text)
  if value==void or typeof(text)!="string" then return fail("match and console text are required") end if
  commands.tokenizeString(value.context.commandState,text);return gameVm.consoleCommand(value.game)
end function

// qcommon/Cmd_ExecuteString callback chain.  These callbacks deliberately use
// the already-tokenized shared command state, which is also what trap_Argv and
// trap_Args read while the QVM export is running.
/// @param commandState Record exposing `context`.
function clientGameCommand(commandState)
  value=commandState.context;if value==void or value.cgame==void then return false end if
  name=commands.argv(commandState,0)
  // The QVM owns cg.showScores and requests the server scores itself.
  // Consuming these bindings in the native observer leaves the visible QVM
  // scoreboard empty even though qagame returns both player records.
  if commands.sameInsensitive(name,"+scores") or commands.sameInsensitive(name,"-scores") then
    result=cgameVm.consoleCommand(value.cgame);if result is error then return result end if;return result!=0
  end if
  if nativeCgameCommands.isNativeBaseCommand(name) then
    target=-1;attacker=-1
    if commands.sameInsensitive(name,"tcmd") or commands.sameInsensitive(name,"tell_target") or commands.sameInsensitive(name,"vtell_target") then target=cgameVm.crosshairPlayer(value.cgame);if target is error then return target end if end if
    if commands.sameInsensitive(name,"tell_attacker") or commands.sameInsensitive(name,"vtell_attacker") then attacker=cgameVm.lastAttacker(value.cgame);if attacker is error then return attacker end if end if
    native=nativeCgameCommands.dispatchBase(value.context.cvars,commandState,target,attacker,value.context.nativeCgameCommands)
    for each pair in native.cvarSets cvar.set2(value.context.cvars,pair[0],pair[1],false) end for
    for each text in native.consoleCommands commands.executeText(value.context.commandState,commands.EXEC_APPEND,text) end for
    for each text in native.clientCommands sendClientCommand(value.context,text) end for
    for each text in native.prints emitPrint(value.context,text) end for
    return true
  end if
  result=cgameVm.consoleCommand(value.cgame);if result is error then return result end if;return result!=0
end function
/// Compute server game command in engine.local_qvm_match; the normal completion returns `(result != 0)`.
/// @param commandState Record exposing `context`.
function serverGameCommand(commandState)
  value=commandState.context;if value==void or value.game==void then return false end if
  result=gameVm.consoleCommand(value.game);if result is error then return result end if;return result!=0
end function
/// Compute ui game command in engine.local_qvm_match; the normal completion returns `(result != 0)`.
/// @param commandState Record exposing `context`.
function uiGameCommand(commandState)
  value=commandState.context;if value==void or value.ui==void then return false end if
  result=uiVm.consoleCommand(value.ui,value.context.now);if result is error then return result end if;return result!=0
end function
/// Test forward client command in engine.local_qvm_match; the normal completion returns `true`.
/// @param commandState Record exposing `context`.
/// @param text Name passed as `name` to `mq3.engine.local_qvm_match.sendClientCommand`.
function forwardClientCommand(commandState,text)
  value=commandState.context;if value==void then return false end if
  sendClientCommand(value.context,text);return true
end function
/// Execute client console in engine.local_qvm_match; the normal completion returns `commands.executeText(value.context.commandState, commands.EXEC_NOW, text)`.
/// @param value Record exposing `context`.
/// @param text Text passed as `text` to `mq3.qcommon.command_buffer.executeText`.
function executeClientConsole(value,text)
  if value==void or typeof(text)!="string" then return fail("match and console text are required") end if
  return commands.executeText(value.context.commandState,commands.EXEC_NOW,text)
end function

/// Update `context.commandNumber` in engine.local_qvm_match.
///
/// Direct state writes: `context.commandNumber`.
/// @param context Record exposing `usercmds`, `commandNumber`, `usercmdHistory`. Updated in place: `commandNumber`.
/// @param clientNum Client num used in `(clientNum < 0)` and `(clientNum == 0)`.
/// @param command Command passed as `command` to `mq3.client.command_ring.store`.
function recordLocalUsercmd(context,clientNum,command)
  if clientNum<0 or clientNum>=len(context.usercmds) or command==void then return fail("valid usercmd client is required") end if
  context.usercmds[clientNum]=command
  // CG_INIT uses local client 0. A follow-spectator snapshot may contain a
  // different playerState.clientNum; it must never redirect the local ring.
  if clientNum==0 then
    context.commandNumber=n.i32(context.commandNumber+1)
    stored=matchCommandRing.store(context.usercmdHistory,context.commandNumber,command);if stored is error then return stored end if
  end if
  return void
end function

/// Compute submit usercmd in engine.local_qvm_match; the normal completion returns `submitUsercmdAtHostTime(value, clientNum, command, command.serverTime)`.
/// @param value Value passed as `value` to `mq3.engine.local_qvm_match.submitUsercmdAtHostTime`.
/// @param clientNum Client num passed as `clientNum` to `mq3.engine.local_qvm_match.submitUsercmdAtHostTime`.
/// @param command Record exposing `serverTime`.
function submitUsercmd(value,clientNum,command)
  if command==void then return fail("valid usercmd is required") end if;return submitUsercmdAtHostTime(value,clientNum,command,command.serverTime)
end function
/// Compute submit usercmd at host time in engine.local_qvm_match; the normal completion returns `gameVm.clientThink(value.game, clientNum)`.
/// @param value Record exposing `context`, `game`.
/// @param clientNum Client num passed as `clientNum` to `mq3.engine.local_qvm_match.recordLocalUsercmd`.
/// @param command Command passed as `command` to `mq3.engine.local_qvm_match.recordLocalUsercmd`.
/// @param hostTime Host time used in `(hostTime < 0)`.
function submitUsercmdAtHostTime(value,clientNum,command,hostTime)
  if value==void or clientNum<0 or clientNum>=len(value.context.clientStates) or command==void or hostTime<0 then return fail("valid match, client, usercmd and host time are required") end if
  if value.context.clientStates[clientNum]==0 then return fail("usercmd client is not active") end if
  recorded=recordLocalUsercmd(value.context,clientNum,command);if recorded is error then return recorded end if
  value.context.now=hostTime
  return gameVm.clientThink(value.game,clientNum)
end function

/// Return `mq3.engine.local_qvm_match.runServerFrame(value, serverTime)` from `engine.local_qvm_match.runFrame`.
/// @param value Value passed as `value` to `mq3.engine.local_qvm_match.runServerFrame`.
/// @param serverTime Server time passed as `serverTime` to `mq3.engine.local_qvm_match.runServerFrame`.
function runFrame(value,serverTime)
  return runServerFrame(value,serverTime)
end function
/// Return `mq3.engine.local_qvm_match.runServerTickMode(value, serverTime, true)` from `engine.local_qvm_match.runServerFrame`.
/// @param value Value passed as `value` to `mq3.engine.local_qvm_match.runServerTickMode`.
/// @param serverTime Server time passed as `serverTime` to `mq3.engine.local_qvm_match.runServerTickMode`.
function runServerFrame(value,serverTime)
  return runServerTickMode(value,serverTime,true)
end function
/// Return `mq3.engine.local_qvm_match.runServerTickMode(value, serverTime, false)` from `engine.local_qvm_match.runServerTick`.
/// @param value Value passed as `value` to `mq3.engine.local_qvm_match.runServerTickMode`.
/// @param serverTime Server time passed as `serverTime` to `mq3.engine.local_qvm_match.runServerTickMode`.
function runServerTick(value,serverTime)
  return runServerTickMode(value,serverTime,false)
end function
/// Compute run bot frame in engine.local_qvm_match.
/// @param value Record exposing `game`, `context`.
/// @param hostTime Time passed as `time` to `mq3.botlib.server_bridge.setTime`.
function runBotFrame(value,hostTime)
  if value.game.botEnable==0 or hostTime<=value.context.botServer.lastFrameTime then return void end if
  context=value.context
  context.now=hostTime
  botServerBridge.setTime(context.botServer,hostTime)
  botFrame=gameVm.botStartFrame(value.game,hostTime);if botFrame is error then return botFrame end if
  context.botServer.lastFrameTime=hostTime
  for each pending in botServerBridge.takePending(context.botServer)
    clientNum=pending[0];recorded=recordLocalUsercmd(context,clientNum,pending[1]);if recorded is error then return recorded end if
    thought=gameVm.clientThink(value.game,clientNum);if thought is error then return thought end if
  end for
  return void
end function
/// Compute run server tick mode in engine.local_qvm_match; the normal completion returns `result`.
/// @param value Record exposing `context`, `game`.
/// @param serverTime Time passed as `time` to `mq3.botlib.server_bridge.setTime`.
/// @param botTick Bot tick operand used by `runServerTickMode`; its reads are shown in the implementation.
function runServerTickMode(value,serverTime,botTick)
  if value.context.uiLanCacheHost.context.root=="" then
    executed=commands.execute(value.context.commandState);if executed is error then return executed end if
  end if
  value.context.now=serverTime;botServerBridge.setTime(value.context.botServer,serverTime)
  // CL_SendClientCommand is delivered to GAME_CLIENT_COMMAND on the next
  // server tick. In particular, CG_ScoresDown's "score" must reach qagame.
  pending=value.context.pendingClientCommands.toArray();value.context.pendingClientCommands.clear()
  for each text in pending
    if value.context.clientStates[0]!=0 then
      commands.tokenizeString(value.context.commandState,text)
      delivered=gameVm.clientCommand(value.game,0);if delivered is error then return delivered end if
    end if
  end for
  if botTick then botFrame=runBotFrame(value,serverTime);if botFrame is error then return botFrame end if end if
  result=gameVm.runFrame(value.game,serverTime);if result is error then return result end if
  value.context.frames=value.context.frames+1;return result
end function

/// Return `mq3.collision.world.pointLeafnum(host.context.collisionWorld, origin)` from `engine.local_qvm_match.snapshotPointLeaf`.
/// @param host Record exposing `context`.
/// @param origin Point passed as `point` to `mq3.collision.world.pointLeafnum`.
function snapshotPointLeaf(host,origin) return collision.pointLeafnum(host.context.collisionWorld,origin) end function
/// Return `mq3.collision.visibility.leafArea(host.context.collisionWorld.visibility, leaf)` from `engine.local_qvm_match.snapshotLeafArea`.
/// @param host Record exposing `context`.
/// @param leaf Leaf passed as `leaf` to `mq3.collision.visibility.leafArea`.
function snapshotLeafArea(host,leaf) return visibility.leafArea(host.context.collisionWorld.visibility,leaf) end function
/// Return `mq3.collision.visibility.leafCluster(host.context.collisionWorld.visibility, leaf)` from `engine.local_qvm_match.snapshotLeafCluster`.
/// @param host Record exposing `context`.
/// @param leaf Leaf passed as `leaf` to `mq3.collision.visibility.leafCluster`.
function snapshotLeafCluster(host,leaf) return visibility.leafCluster(host.context.collisionWorld.visibility,leaf) end function
/// Return `mq3.collision.visibility.writeAreaBits(host.context.collisionWorld.visibility, bits, area)` from `engine.local_qvm_match.snapshotWriteAreaBits`.
/// @param host Record exposing `context`.
/// @param bits Buffer passed as `buffer` to `mq3.collision.visibility.writeAreaBits`.
/// @param area Area passed as `area` to `mq3.collision.visibility.writeAreaBits`.
function snapshotWriteAreaBits(host,bits,area) return visibility.writeAreaBits(host.context.collisionWorld.visibility,bits,area) end function
/// Return `mq3.collision.visibility.clusterPVS(host.context.collisionWorld.visibility, cluster)` from `engine.local_qvm_match.snapshotClusterPvs`.
/// @param host Record exposing `context`.
/// @param cluster Cluster passed as `cluster` to `mq3.collision.visibility.clusterPVS`.
function snapshotClusterPvs(host,cluster) return visibility.clusterPVS(host.context.collisionWorld.visibility,cluster) end function
/// Return `mq3.collision.visibility.areasConnected(host.context.collisionWorld.visibility, first, second)` from `engine.local_qvm_match.snapshotAreasConnected`.
/// @param host Record exposing `context`.
/// @param first Area 1 passed as `area1` to `mq3.collision.visibility.areasConnected`.
/// @param second Area 2 passed as `area2` to `mq3.collision.visibility.areasConnected`.
function snapshotAreasConnected(host,first,second) return visibility.areasConnected(host.context.collisionWorld.visibility,first,second) end function

/// Return `mq3.game.movement.Collision(result.trace, result.endpos, entityNum)` from `engine.local_qvm_match.nativePredictionResult`.
/// @param result Record exposing `trace`, `endpos`.
/// @param entityNum Initial `entityNum` field stored in the returned or constructed `mq3.game.movement.Collision` record.
function nativePredictionResult(result,entityNum) return nativeMovement.Collision(result.trace,result.endpos,entityNum) end function
/// Compute native prediction world trace in engine.local_qvm_match; the normal completion returns `nativePredictionResult(value, entityNum)`.
/// @param host Record exposing `context`.
/// @param start Start passed as `start` to `mq3.collision.world.boxTrace`.
/// @param mins Mins passed as `mins` to `mq3.collision.world.boxTrace`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.world.boxTrace`.
/// @param finish Finish passed as `finish` to `mq3.collision.world.boxTrace`.
/// @param mask Mask passed as `mask` to `mq3.collision.world.boxTrace`.
function nativePredictionWorldTrace(host,start,mins,maxs,finish,mask)
  value=collision.boxTrace(host.context.collisionWorld,start,finish,mins,maxs,0,mask,false);if value is error then return value end if;entityNum=1023;if value.trace.fraction!=1.0 then entityNum=1022 end if;return nativePredictionResult(value,entityNum)
end function
/// Compute native prediction entity trace in engine.local_qvm_match; the normal completion returns `nativePredictionResult(result, ent.number)`.
/// @param host Record exposing `context`.
/// @param value Record exposing `state`, `lerpOrigin`, `lerpAngles`.
/// @param start Start passed as `start` to `mq3.collision.world.transformedTrace`.
/// @param mins Mins passed as `mins` to `mq3.collision.world.transformedTrace`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.world.transformedTrace`.
/// @param finish Finish passed as `finish` to `mq3.collision.world.transformedTrace`.
/// @param mask Mask passed as `mask` to `mq3.collision.world.transformedTrace`.
function nativePredictionEntityTrace(host,value,start,mins,maxs,finish,mask)
  ent=value.state;model=0;origin=value.lerpOrigin;angles=[0.0,0.0,0.0]
  if ent.solid==nativeCgamePredict.SOLID_BMODEL then model=ent.modelindex;angles=value.lerpAngles;origin=gameTrajectory.evaluate(ent.pos,host.context.nativeSnapshots.prediction.physicsTime);if origin is error then return origin end if
  else x=ent.solid&255;down=(ent.solid>>8)&255;up=((ent.solid>>16)&255)-32;model=collision.tempBoxModel(host.context.collisionWorld,[-x*1.0,-x*1.0,-down*1.0],[x*1.0,x*1.0,up*1.0],false);if model is error then return model end if end if
  result=collision.transformedTrace(host.context.collisionWorld,start,finish,mins,maxs,model,mask,origin,angles,false,host.context.collisionWorld.patchesReady);if result is error then return result end if;return nativePredictionResult(result,ent.number)
end function
/// Return `mq3.collision.world.pointContents(host.context.collisionWorld, point, 0)` from `engine.local_qvm_match.nativePredictionWorldPoint`.
/// @param host Record exposing `context`.
/// @param point Point passed as `point` to `mq3.collision.world.pointContents`.
function nativePredictionWorldPoint(host,point) return collision.pointContents(host.context.collisionWorld,point,0) end function
/// Compute native prediction entity point in engine.local_qvm_match; the normal completion returns `collision.transformedPointContents(host.context.collisionWorld, point, ent.modelindex, ent.origin, ent.angles)`.
/// @param host Record exposing `context`.
/// @param value Record exposing `state`.
/// @param point Point passed as `point` to `mq3.collision.world.transformedPointContents`.
function nativePredictionEntityPoint(host,value,point) ent=value.state;return collision.transformedPointContents(host.context.collisionWorld,point,ent.modelindex,ent.origin,ent.angles) end function
/// Compute native prediction trigger touch in engine.local_qvm_match; the normal completion returns `result.trace.startsolid`.
/// @param host Record exposing `context`.
/// @param value Record exposing `state`.
/// @param origin Start passed as `start` to `mq3.collision.world.boxTrace`.
/// @param mins Mins passed as `mins` to `mq3.collision.world.boxTrace`.
/// @param maxs Maxs passed as `maxs` to `mq3.collision.world.boxTrace`.
function nativePredictionTriggerTouch(host,value,origin,mins,maxs)
  result=collision.boxTrace(host.context.collisionWorld,origin,origin,mins,maxs,value.state.modelindex,-1,false);if result is error then return result end if;return result.trace.startsolid
end function
/// Compute engine.local_qvm_match.nativePredictionMover as `[origin[0], origin[1], origin[2]]`.
/// @param host Reserved argument; this implementation does not read its value.
/// @param origin Origin used in `origin[0]` and `origin[1]`.
/// @param ground Reserved argument; this implementation does not read its value.
/// @param fromTime Reserved argument; this implementation does not read its value.
/// @param toTime Reserved argument; this implementation does not read its value.
function nativePredictionMover(host,origin,ground,fromTime,toTime) return [origin[0],origin[1],origin[2]] end function
/// Compute native prediction services in engine.local_qvm_match; the normal completion returns `host`.
/// @param context Context passed as `context` to `mq3.client.cgame_predict.services`.
function nativePredictionServices(context)
  host=nativeCgamePredict.services(context);host.worldTraceFn=nativePredictionWorldTrace;host.entityTraceFn=nativePredictionEntityTrace;host.worldPointFn=nativePredictionWorldPoint;host.entityPointFn=nativePredictionEntityPoint;host.triggerTouchFn=nativePredictionTriggerTouch;host.moverAdjustFn=nativePredictionMover;return host
end function
/// Compute native prediction commands in engine.local_qvm_match; the normal completion returns `result.toArray()`.
/// @param context Record exposing `commandNumber`, `usercmdHistory`.
function nativePredictionCommands(context)
  result=lists.List.withCapacity(64);first=context.commandNumber-63;for number=first to context.commandNumber command=matchCommandRing.get(context.usercmdHistory,context.commandNumber,number);if command is error then return command end if;if command!=void then result.add(command) end if end for;return result.toArray()
end function

// Feed the native cg_effects mirror from the semantic event stream.  These
// calls execute the original parameter and lifetime logic but remain
// non-dispatching while cgame.qvm owns presentation.
/// @param context Record exposing `nativeEffects`, `now`, `nativeEvents`, `nativeParticles`, `nativeMarks`.
/// @param renderStart Render start used in `(renderStart < len(context.nativeEvents.render))`.
/// @param hudStart Hud start used in `(hudStart < len(context.nativeEvents.hud))`.
/// @param retailActive Retail active passed as `retailActive` to `mq3.client.cgame_effects.spawnEffect`.
function observeNativeEffects(context,renderStart,hudStart,retailActive)
  effects=context.nativeEffects;effects.time=context.now;effects.predictedClient=context.nativeEvents.predictedClient;particles=context.nativeParticles;particles.time=context.now;particles.retailActive=retailActive
  if renderStart<len(context.nativeEvents.render) then
    for index=renderStart to len(context.nativeEvents.render)-1
      action=context.nativeEvents.render[index];second=action.origin2;if second==void then second=[0.0,0.0,0.0] end if
      if action.kind=="spawn-effect" then nativeCgameEffects.spawnEffect(effects,action.origin,retailActive)
      else if action.kind=="jump-pad-smoke" then nativeCgameEffects.smokePuff(effects,action.origin,[0.0,0.0,0.0],32.0,1.0,1.0,1.0,1.0,1000.0,context.now,0,0,"smokePuff",retailActive);nativeCgameParticles.particleImpactSmokePuff(particles,"smokePuff",action.origin)
      else if action.kind=="bullet-hit-flesh" then nativeCgameEffects.bleed(effects,action.origin,action.other,retailActive);nativeCgameParticles.particleBleed(particles,"bloodTrail",action.origin,second,action.other,600)
      else if action.kind=="gib-player" then nativeCgameEffects.gibPlayer(effects,action.origin,retailActive)
      else if action.kind=="EV_KAMIKAZE" then nativeCgameEffects.kamikazeEffect(effects,action.origin,retailActive)
      else if action.kind=="EV_OBELISKEXPLODE" then nativeCgameEffects.obeliskExplode(effects,action.origin,action.entity,retailActive)
      else if action.kind=="EV_OBELISKPAIN" then nativeCgameEffects.obeliskPain(effects,action.origin,retailActive)
      else if action.kind=="EV_INVUL_IMPACT" then nativeCgameEffects.invulnerabilityImpact(effects,action.origin,second,retailActive)
      else if action.kind=="EV_JUICED" then nativeCgameEffects.invulnerabilityJuiced(effects,action.origin,retailActive)
      else if action.kind=="EV_LIGHTNINGBOLT" then nativeCgameEffects.lightningBoltBeam(effects,action.origin,second,retailActive)
      else if action.kind=="missile-hit-wall" or action.kind=="missile-hit-metal" then nativeCgameMarks.impactMark(context.nativeMarks,"gfx/damage/burn_med_mrk",action.origin,second,0.0,1.0,1.0,1.0,1.0,false,32.0,false,void) end if
    end for
  end if
  if hudStart<len(context.nativeEvents.hud) then
    for index=hudStart to len(context.nativeEvents.hud)-1 action=context.nativeEvents.hud[index];if action.kind=="score-plum" then nativeCgameEffects.scorePlum(effects,action.entity,action.origin,action.parm,retailActive) end if end for
  end if
  return void
end function

// Run weapon side effects from the same decoded event records.  The native
// mirror resolves media, traces and impact decisions while retail cgame.qvm
// remains the only dispatcher.
/// @param context Record exposing `nativeWeapons`, `now`, `nativeEvents`, `latestSnapshot`.
/// @param renderStart Render start used in `(renderStart < len(context.nativeEvents.render))`.
/// @param retailActive Retail active passed as `retailActive` to `mq3.client.cgame_weapons.fireWeapon`.
/// @param ps Record exposing `stats`, `ammo`, `weapon`.
function observeNativeWeapons(context,renderStart,retailActive,ps)
  weapons=context.nativeWeapons;weapons.time=context.now;weapons.health=ps.stats[gameConstants.STAT_HEALTH];weapons.owned=ps.stats[gameConstants.STAT_WEAPONS];weapons.ammo=ps.ammo;weapons.weaponSelect=ps.weapon
  if renderStart<len(context.nativeEvents.render) then
    for index=renderStart to len(context.nativeEvents.render)-1
      action=context.nativeEvents.render[index];second=action.origin2;if second==void then second=[0.0,0.0,0.0] end if
      if action.kind=="fire-weapon" then
        cent=nativeCgameWeapons.entity(action.entity);cent.weapon=action.weapon;cent.origin=action.origin;cent.angles=second
        for each source in context.latestSnapshot.entities if source.number==action.entity then cent.powerups=source.powerups;cent.eFlags=source.eFlags end if end for
        result=nativeCgameWeapons.fireWeapon(weapons,cent,retailActive);if result is error then return result end if
      else if action.kind=="missile-hit-player" then result=nativeCgameWeapons.missileHitPlayer(weapons,action.weapon,action.origin,second,action.other,retailActive);if result is error then return result end if
      else if action.kind=="missile-hit-wall" then result=nativeCgameWeapons.missileHitWall(weapons,action.weapon,action.entity,action.origin,second,nativeCgameWeapons.IMPACTSOUND_DEFAULT,[1.0,1.0,1.0],[1.0,1.0,1.0],retailActive);if result is error then return result end if
      else if action.kind=="missile-hit-metal" then result=nativeCgameWeapons.missileHitWall(weapons,action.weapon,action.entity,action.origin,second,nativeCgameWeapons.IMPACTSOUND_METAL,[1.0,1.0,1.0],[1.0,1.0,1.0],retailActive);if result is error then return result end if
      else if action.kind=="shotgun-fire" then result=nativeCgameWeapons.shotgunFire(weapons,action.origin,second,action.parm,action.other,false,false,retailActive);if result is error then return result end if end if
    end for
  end if
  return void
end function

/// SnapshotInput record for engine.local_qvm_match, containing `world`, `host`, `decodedEntities`.
struct SnapshotInput
  /// Loaded world geometry and associated scene state.
  world
  /// Host address or host-service adapter associated with the operation.
  host
  /// Entity records decoded from the current snapshot.
  decodedEntities
end struct
/// Compute snapshot input in engine.local_qvm_match; the normal completion returns `SnapshotInput(buildWorld, host, decoded)`.
/// @param value Record exposing `game`, `context`.
function snapshotInput(value)
  if value==void or value.game==void then return fail("active game is required") end if
  context=value.context;machine=value.game.slot.machine
  if machine==void or context.gameClients<=0 or context.entityStride<=0 then return fail("qagame did not locate its state") end if
  mapped=array(context.entityCount,void);decoded=0
  for index=0 to context.entityCount-1
    spatial=context.spatialScene.entities[index]
    if not spatial.linked or (spatial.svFlags&snapshotBuild.SVF_NOCLIENT)!=0 then continue end if
    state=entitystate.load(machine.data,context.gameEntities+index*context.entityStride);if state is error then return state end if;state.number=index
    mapped[index]=snapshotBuild.snapshotEntity(state,true,spatial.svFlags,spatial.singleClient,spatial.clusters,spatial.lastCluster,spatial.areanum,spatial.areanum2)
    decoded=decoded+1
  end for
  ringCapacity=context.entityCount;if ringCapacity>snapshotBuild.MAX_SNAPSHOT_ENTITIES then ringCapacity=snapshotBuild.MAX_SNAPSHOT_ENTITIES end if;if ringCapacity<1 then ringCapacity=1 end if
  buildWorld=snapshotBuild.world(true,mapped,ringCapacity);host=snapshotBuild.services(snapshotPointLeaf,snapshotLeafArea,snapshotLeafCluster,snapshotWriteAreaBits,snapshotClusterPvs,snapshotAreasConnected,context)
  return SnapshotInput(buildWorld,host,decoded)
end function
/// Compute snapshot core in engine.local_qvm_match; the normal completion returns `snapshotCorePrepared(value, clientNum, input)`.
/// @param value Value passed as `value` to `mq3.engine.local_qvm_match.snapshotInput`.
/// @param clientNum Client num passed as `clientNum` to `mq3.engine.local_qvm_match.snapshotCorePrepared`.
function snapshotCore(value,clientNum)
  input=snapshotInput(value);if input is error then return input end if
  return snapshotCorePrepared(value,clientNum,input)
end function
/// Compute snapshot core prepared in engine.local_qvm_match; the normal completion returns `result`.
/// @param value Record exposing `context`, `game`.
/// @param clientNum Zero-based index into `context.linked`.
/// @param input Record exposing `world`, `host`.
function snapshotCorePrepared(value,clientNum,input)
  if value==void or clientNum<0 or clientNum>=MAX_CLIENTS or input==void then return fail("valid match, client and snapshot input are required") end if
  context=value.context;machine=value.game.slot.machine
  ps=playerstate.load(machine.data,context.gameClients+clientNum*context.clientStride);if ps is error then return ps end if
  buildWorld=input.world;host=input.host
  frame=snapshotBuild.buildClientSnapshot(buildWorld,host,ps,context.linked[clientNum],false);if frame is error then return frame end if
  entities=array(frame.numEntities,void)
  if frame.numEntities>0 then for index=0 to frame.numEntities-1 entities[index]=buildWorld.ring[(frame.firstEntity+index)%buildWorld.ringCapacity] end for end if
  result=Snapshot(context.now,ps,entities,frame.areaBits);context.latestSnapshot=result;context.snapshotNumber=context.snapshotNumber+1;return result
end function

/// Compute snapshot in engine.local_qvm_match; the normal completion returns `result`.
/// @param value Record exposing `context`, `cgame`.
/// @param clientNum Client num passed as `clientNum` to `mq3.engine.local_qvm_match.snapshotCore`.
function snapshot(value,clientNum)
  result=snapshotCore(value,clientNum);if result is error then return result end if
  context=value.context;entities=result.entities
  initial=context.nativeSnapshots.snap==void;transitionStart=len(context.nativeSnapshots.playerStateTransitions)
  observed=nativeCgameSnapshot.publish(context.nativeSnapshots,context.snapshotNumber,result,0,context.cgameServerCommands.commandSequence,context.now);if observed is error then return observed end if
  // Validate the same snapshot/usercmd boundary as cgame.qvm on copied state.
  // This observer shares native Pmove/collision without dispatching effects.
  if context.nativeSnapshots.prediction==void then context.nativeSnapshots.prediction=nativeCgamePredict.create() end if
  commandList=nativePredictionCommands(context);if commandList is error then return commandList end if;predictionGameType=0;predictionSetting=cvar.find(context.cvars,"g_gametype");if predictionSetting!=void then predictionGameType=predictionSetting.integer end if;predictionFixed=false;predictionSetting=cvar.find(context.cvars,"pmove_fixed");if predictionSetting!=void then predictionFixed=predictionSetting.integer!=0 end if;predictionMsec=8;predictionSetting=cvar.find(context.cvars,"pmove_msec");if predictionSetting!=void then predictionMsec=predictionSetting.integer end if
  predicted=nativeCgamePredict.predict(context.nativeSnapshots.prediction,context.nativeSnapshots.snap,context.nativeSnapshots.nextSnap,context.now,context.now,commandList,false,false,false,context.nativeSnapshots.nextFrameTeleport,context.nativeSnapshots.thisFrameTeleport,predictionGameType,true,predictionFixed,predictionMsec,nativePredictionServices(context));if predicted is error then return predicted end if
  // The native mirror reaches the same semantic audio/render/HUD boundaries.
  // While the retail cgame is active it decodes but suppresses every action,
  // preventing duplicate sounds and effects beside cgame.qvm.
  eventRenderStart=len(context.nativeEvents.render);eventHudStart=len(context.nativeEvents.hud);retailActive=value.cgame!=void
  eventObserved=nativeCgameEvent.observeSnapshot(context.nativeEvents,result,retailActive);if eventObserved is error then return eventObserved end if
  observeNativeEffects(context,eventRenderStart,eventHudStart,retailActive)
  weaponObserved=observeNativeWeapons(context,eventRenderStart,retailActive,result.playerState);if weaponObserved is error then return weaponObserved end if
  entityObserver=context.nativeEntities;entityObserver.time=context.now;entityObserver.gametype=predictionGameType
  entitySnapshot=nativeCgameEnts.Snapshot(result.serverTime,result.playerState,result.entities);entityObserved=nativeCgameEnts.addPacketEntities(entityObserver,entitySnapshot,void,void,retailActive);if entityObserved is error then return entityObserved end if
  playerObserver=context.nativePlayers;playerObserver.time=context.now;playerObserver.frameTime=50;playerObserver.gametype=predictionGameType;playerObserver.localClientNum=result.playerState.clientNum
  for each playerState in result.entities
    if playerState.eType==gameConstants.ET_PLAYER and playerState.clientNum>=0 and playerState.clientNum<nativeCgamePlayers.MAX_CLIENTS and playerObserver.clients[playerState.clientNum].infoValid then
      player=nativeCgamePlayers.entity(playerState.number,playerState.clientNum);player.eFlags=playerState.eFlags;player.powerups=playerState.powerups;player.legsAnim=playerState.legsAnim;player.torsoAnim=playerState.torsoAnim;player.generic1=playerState.generic1;player.origin=[playerState.pos.trBase[0],playerState.pos.trBase[1],playerState.pos.trBase[2]];player.angles=[playerState.apos.trBase[0],playerState.angles2[1],playerState.apos.trBase[2]]
      emptyTrace=nativeCgamePlayers.Trace(1.0,[0.0,0.0,0.0],[0.0,0.0,1.0],false,false,0);observed=nativeCgamePlayers.player(playerObserver,player,result.playerState.persistant[gameConstants.PERS_TEAM],emptyTrace,0,0,emptyTrace,retailActive);if observed is error then return observed end if
    end if
  end for
  predictedState=result.playerState
  if predictedState.clientNum>=0 and predictedState.clientNum<nativeCgamePlayers.MAX_CLIENTS and playerObserver.clients[predictedState.clientNum].infoValid then
    predictedPlayer=nativeCgamePlayers.entity(predictedState.clientNum,predictedState.clientNum);predictedPlayer.eFlags=predictedState.eFlags;predictedPlayer.legsAnim=predictedState.legsAnim;predictedPlayer.torsoAnim=predictedState.torsoAnim;predictedPlayer.generic1=predictedState.generic1;predictedPlayer.origin=[predictedState.origin[0],predictedState.origin[1],predictedState.origin[2]];predictedPlayer.angles=[predictedState.viewangles[0],predictedState.movementDir,predictedState.viewangles[2]]
    predictedPlayer.powerups=0;for powerupIndex=0 to len(predictedState.powerups)-1 if predictedState.powerups[powerupIndex]!=0 then predictedPlayer.powerups=predictedPlayer.powerups|(1<<powerupIndex) end if end for
    predictedTrace=nativeCgamePlayers.Trace(1.0,[0.0,0.0,0.0],[0.0,0.0,1.0],false,false,0);predictedObserved=nativeCgamePlayers.player(playerObserver,predictedPlayer,predictedState.persistant[gameConstants.PERS_TEAM],predictedTrace,0,0,predictedTrace,retailActive);if predictedObserved is error then return predictedObserved end if
  end if
  nativeCgameLocalents.addLocalEntities(context.nativeLocalEntities,context.now,0,result.playerState.origin)
  viewObserver=context.nativeView;viewObserver.predicted=playerstate.copy(result.playerState);viewObserver.snap=nativeCgameView.snapshot(playerstate.copy(result.playerState),0,[]);viewObserver.viewAngles=[result.playerState.viewangles[0],result.playerState.viewangles[1],result.playerState.viewangles[2]];viewObserver.weaponSelect=result.playerState.weapon
  viewObserved=nativeCgameView.drawActiveFrame(viewObserver,context.now,0,false,retailActive);if viewObserved is error then return viewObserved end if
  nativeCgameParticles.addParticles(context.nativeParticles,context.now,viewObserver.refdef.vieworg,viewObserver.refdef.viewaxis[0],viewObserver.refdef.viewaxis[1],viewObserver.refdef.viewaxis[2])
  nativeCgameMarks.addMarks(context.nativeMarks,context.now)
  drawObserver=context.nativeDrawtools;drawObserver.time=context.now;drawObserver.health=result.playerState.stats[gameConstants.STAT_HEALTH];drawObserver.armor=result.playerState.stats[gameConstants.STAT_ARMOR];drawObserver.refX=viewObserver.refdef.x;drawObserver.refY=viewObserver.refdef.y;drawObserver.refWidth=viewObserver.refdef.width;drawObserver.refHeight=viewObserver.refdef.height
  nativeDraw=context.nativeDraw;nativeDraw.time=context.now;nativeDraw.serverTime=result.serverTime;nativeDraw.latestSnapshotNum=context.snapshotNumber;nativeDraw.serverCommandSequence=context.cgameServerCommands.commandSequence;nativeDraw.levelStartTime=context.nativeServerCmds.levelStartTime;nativeDraw.team=result.playerState.persistant[gameConstants.PERS_TEAM];nativeDraw.gametype=predictionGameType;nativeDraw.clientNum=result.playerState.clientNum;nativeDraw.health=result.playerState.stats[gameConstants.STAT_HEALTH];nativeDraw.armor=result.playerState.stats[gameConstants.STAT_ARMOR];nativeDraw.weapon=result.playerState.weapon;nativeDraw.weaponTime=result.playerState.weaponTime;nativeDraw.pmType=result.playerState.pm_type;nativeDraw.pmFlags=result.playerState.pm_flags;nativeDraw.refX=viewObserver.refdef.x;nativeDraw.refY=viewObserver.refdef.y;nativeDraw.refWidth=viewObserver.refdef.width;nativeDraw.refHeight=viewObserver.refdef.height;nativeDraw.warmup=context.nativeServerCmds.warmup;nativeDraw.voteTime=context.nativeServerCmds.voteTime;nativeDraw.voteString=context.nativeServerCmds.voteString;nativeDraw.voteYes=context.nativeServerCmds.voteYes;nativeDraw.voteNo=context.nativeServerCmds.voteNo;nativeDraw.teamVoteTime=context.nativeServerCmds.teamVoteTime;nativeDraw.teamVoteString=context.nativeServerCmds.teamVoteString;nativeDraw.teamVoteYes=context.nativeServerCmds.teamVoteYes;nativeDraw.teamVoteNo=context.nativeServerCmds.teamVoteNo
  nativeCgameDraw.drawActive(nativeDraw,0,true,nativeCgameDraw.TraceResult(-1,false,false),retailActive)
  observer=context.nativePlayerState;observer.time=context.now;observer.serverTime=result.serverTime
  setting=cvar.find(context.cvars,"g_gametype");if setting!=void then observer.gametype=setting.integer end if;setting=cvar.find(context.cvars,"timelimit");if setting!=void then observer.timelimit=setting.integer end if;setting=cvar.find(context.cvars,"fraglimit");if setting!=void then observer.fraglimit=setting.integer end if
  if initial then nativeCgamePlayerstate.respawn(observer,result.playerState) end if
  if transitionStart<len(context.nativeSnapshots.playerStateTransitions) then for transitionIndex=transitionStart to len(context.nativeSnapshots.playerStateTransitions)-1 pair=context.nativeSnapshots.playerStateTransitions[transitionIndex];nativeCgamePlayerstate.transitionPlayerState(observer,pair[0],pair[1]) end for end if
  botServerBridge.publishSnapshot(context.botServer,clientNum,entities);published=publishBotSnapshots(value);if published is error then return published end if;return result
end function

// Production snapshots are consumed by the authoritative retail cgame QVM.
// Differential native prediction/effect/HUD mirrors belong in probes, not in
// the frame loop; they otherwise duplicate most client work for every tick.
/// @param value Record exposing `context`.
/// @param clientNum Client num passed as `clientNum` to `mq3.engine.local_qvm_match.snapshotCorePrepared`.
function snapshotProductive(value,clientNum)
  // All recipients observe the same entity state. Keep this shared input local:
  // a subsequent QVM call or same-time state mutation must trigger new decoding.
  input=snapshotInput(value);if input is error then return input end if
  result=snapshotCorePrepared(value,clientNum,input);if result is error then return result end if
  botServerBridge.publishSnapshot(value.context.botServer,clientNum,result.entities)
  published=publishBotSnapshotsPrepared(value,input);if published is error then return published end if;return result
end function

/// Compute publish bot snapshots in engine.local_qvm_match; the normal completion returns `publishBotSnapshotsPrepared(value, input)`.
/// @param value Record exposing `game`, `context`.
function publishBotSnapshots(value)
  if value==void or value.game==void then return 0 end if
  context=value.context;machine=value.game.slot.machine
  if machine==void or context.gameClients<=0 or context.entityStride<=0 then return 0 end if
  hasBots=false;for each state in context.clientStates if state==2 then hasBots=true end if end for;if not hasBots then return 0 end if
  input=snapshotInput(value);if input is error then return input end if
  return publishBotSnapshotsPrepared(value,input)
end function
/// Compute publish bot snapshots prepared in engine.local_qvm_match; the normal completion returns `published`.
/// @param value Record exposing `context`, `game`.
/// @param input Record exposing `world`, `host`.
function publishBotSnapshotsPrepared(value,input)
  context=value.context;machine=value.game.slot.machine
  buildWorld=input.world;host=input.host;published=0
  for bot=0 to len(context.clientStates)-1
    if context.clientStates[bot]==2 then
      ps=playerstate.load(machine.data,context.gameClients+bot*context.clientStride);if ps is error then return ps end if
      frame=snapshotBuild.buildClientSnapshot(buildWorld,host,ps,context.linked[bot],false);if frame is error then return frame end if
      entities=array(frame.numEntities,void);if frame.numEntities>0 then for index=0 to frame.numEntities-1 entities[index]=buildWorld.ring[(frame.firstEntity+index)%buildWorld.ringCapacity] end for end if
      result=botServerBridge.publishSnapshot(context.botServer,bot,entities);if result is error then return result end if;published=published+1
    end if
  end for
  return published
end function

/// Write words in engine.local_qvm_match.
/// @param output Data passed as `data` to `mq3.compat.numeric.writeU32`.
/// @param offset Offset used in `(offset + (index * 4))` and `n.writeU32(output, (offset + (index * 4)), words[index])`.
/// @param words Words used in `len(words)` and `words[index]`.
function writeWords(output,offset,words)
  for index=0 to len(words)-1 n.writeU32(output,offset+index*4,words[index]) end for
  return void
end function

/// Compute game state bytes in engine.local_qvm_match; the normal completion returns `output`.
/// @param context Record exposing `configstrings`.
function gameStateBytes(context)
  output=bytes(cgameSyscall.GAMESTATE_SIZE,0);cursor=1
  for index=0 to MAX_CONFIGSTRINGS-1
    text=context.configstrings[index]
    if text!="" then
      encoded=bytes(text);if cursor+len(encoded)+1>16000 then return fail("configstring gameState overflow") end if
      n.writeU32(output,index*4,cursor);copyBytes(output,4096+cursor,encoded,0,len(encoded));cursor=cursor+len(encoded)+1
    end if
  end for
  n.writeU32(output,20096,cursor);return output
end function

/// Compute glconfig bytes in engine.local_qvm_match; the normal completion returns `output`.
/// @param context Reserved argument; this implementation does not read its value.
function glconfigBytes(context)
  output=bytes(cgameSyscall.GLCONFIG_SIZE,0);n.writeU32(output,11264,4096);n.writeU32(output,11268,2)
  n.writeU32(output,11304,1280);n.writeU32(output,11308,720);n.writeU32(output,11312,n.floatBits(1280.0/720.0));return output
end function

/// Encode snapshot in engine.local_qvm_match; the normal completion returns `output`.
///
/// Direct state writes: `output elements`.
/// @param context Record exposing `cgameServerCommands`.
/// @param value Record exposing `serverTime`, `areaBits`, `playerState`, `entities`.
/// @param output Mutable sequence written at `(12 + index)`.
function encodeSnapshot(context,value,output)
  n.writeU32(output,8,value.serverTime)
  for index=0 to snapshotBuild.MAX_MAP_AREA_BYTES-1 output[12+index]=value.areaBits[index] end for
  writeWords(output,44,playerstate.words(value.playerState))
  count=len(value.entities);if count>256 then count=256 end if;n.writeU32(output,512,count)
  if count>0 then for index=0 to count-1 writeWords(output,516+index*entitystate.BYTE_SIZE,entitystate.words(value.entities[index])) end for end if
  // snapshot_t stores the reliable command sequence after its 256 entities.
  // Cgame advances CG_ExecuteNewServerCommands to this value when promoted.
  n.writeU32(output,53768,context.cgameServerCommands.commandSequence)
  return output
end function
/// Compute stream snapshot bytes in engine.local_qvm_match; the normal completion returns `cgameSyscall.BytesResult(true, output)`.
/// @param context Record exposing `serverStream`.
/// @param number Number passed as `number` to `mq3.client.server_stream.at`.
/// @param output Output passed as `output` to `mq3.client.cl_cgame_runtime.encodeSnapshot`.
function streamSnapshotBytes(context,number,output)
  stream=context.serverStream;shot=serverStream.at(stream,number)
  if shot==void then return cgameSyscall.BytesResult(false,bytes(0,0)) end if
  clientCgame.encodeSnapshot(stream.epoch,shot,output)
  return cgameSyscall.BytesResult(true,output)
end function
/// Compute snapshot bytes in engine.local_qvm_match; the normal completion returns `cgameSyscall.BytesResult(true, output)`.
/// @param context Record exposing `serverStream`, `latestSnapshot`, `snapshotNumber`.
/// @param number Number passed as `number` to `mq3.engine.local_qvm_match.streamSnapshotBytes`.
function snapshotBytes(context,number)
  if context.serverStream!=void then return streamSnapshotBytes(context,number,bytes(cgameSyscall.SNAPSHOT_SIZE,0)) end if
  value=context.latestSnapshot
  if value==void or number!=context.snapshotNumber then return cgameSyscall.BytesResult(false,bytes(0,0)) end if
  output=encodeSnapshot(context,value,bytes(cgameSyscall.SNAPSHOT_SIZE,0))
  return cgameSyscall.BytesResult(true,output)
end function
// syscall_cgame copies the result into QVM memory synchronously. Keep one
// host buffer per match and clear the unused entity tail between snapshots.
/// @param context Record exposing `serverStream`, `cgameSnapshotScratch`, `latestSnapshot`, `snapshotNumber`.
/// @param number Number passed as `number` to `mq3.engine.local_qvm_match.streamSnapshotBytes`.
function snapshotBytesScratch(context,number)
  if context.serverStream!=void then return streamSnapshotBytes(context,number,context.cgameSnapshotScratch) end if
  value=context.latestSnapshot
  if value==void or number!=context.snapshotNumber then return cgameSyscall.BytesResult(false,bytes(0,0)) end if
  output=context.cgameSnapshotScratch
  fillBytes(output,0,len(output),0);encodeSnapshot(context,value,output)
  return cgameSyscall.BytesResult(true,output)
end function

/// Compute current snapshot in engine.local_qvm_match; the normal completion returns `cgameSyscall.SnapshotNumber(context.snapshotNumber, serverTime)`.
/// @param context Record exposing `now`, `latestSnapshot`, `snapshotNumber`.
function currentSnapshot(context)
  serverTime=context.now;if context.latestSnapshot!=void then serverTime=context.latestSnapshot.serverTime end if
  return cgameSyscall.SnapshotNumber(context.snapshotNumber,serverTime)
end function
/// Register typed asset in engine.local_qvm_match; the normal completion returns `len(context.assets)`.
///
/// Direct state writes: `context.assets`, `context.assetKinds`.
/// @param context Record exposing `assets`, `assetKinds`. Updated in place: `assets`, `assetKinds`.
/// @param kind Kind used in `(context.assetKinds + [kind])` and `(context.assetKinds[index] == kind)`.
/// @param name Name used in `(context.assets + [name])` and `(context.assets[index] == name)`.
function registerTypedAsset(context,kind,name)
  index=0
  while index<len(context.assets)
    if context.assetKinds[index]==kind and context.assets[index]==name then return index+1 end if
    index=index+1
  end while
  context.assets=context.assets+[name];context.assetKinds=context.assetKinds+[kind];return len(context.assets)
end function
/// Compute typed asset handle in engine.local_qvm_match; the normal completion returns `0`.
/// @param context Record exposing `assets`, `assetKinds`.
/// @param kind Kind used in `(context.assetKinds[index] == kind)` and `((context.assetKinds[index] == kind) and (context.assets[index] == name))`.
/// @param name Name used in `(context.assets[index] == name)` and `((context.assetKinds[index] == kind) and (context.assets[index] == name))`.
function typedAssetHandle(context,kind,name)
  index=0;while index<len(context.assets) if context.assetKinds[index]==kind and context.assets[index]==name then return index+1 end if;index=index+1 end while;return 0
end function
/// Return `mq3.engine.local_qvm_match.registerTypedAsset(context, "asset", name)` from `engine.local_qvm_match.registerAsset`.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.registerTypedAsset`.
/// @param name Name passed as `name` to `mq3.engine.local_qvm_match.registerTypedAsset`.
function registerAsset(context,name) return registerTypedAsset(context,"asset",name) end function
/// Register model in engine.local_qvm_match; the normal completion returns `handle`.
///
/// Direct state writes: `context.modelAssets`.
/// @param context Record exposing `collisionWorld`, `markMap`, `archive`, `modelAssets`, `assets`. Updated in place: `modelAssets`.
/// @param name Name passed as `name` to `mq3.engine.local_qvm_match.typedAssetHandle`.
function registerModel(context,name)
  existing=typedAssetHandle(context,"model",name);if existing!=0 then return existing end if
  loaded=void
  if len(name)>1 and name[0]=="*" then
    index=toNumber(decode(slice(bytes(name),1,len(bytes(name))-1)));checked=try(collision.inlineModel(context.collisionWorld,index));if checked is error then return 0 end if;loaded=try(qvmSceneGeometry.loadInlineModel(context.markMap,index,65536));if loaded is error then return 0 end if
  else
    if not strings.endsWith(strings.toLowerAscii(name),".md3") then return 0 end if
    data=try(pk3.read(context.archive,name));if data is error then return 0 end if;parsed=try(md3.loadPacked(data));if parsed is error then return 0 end if
    levels=[md3.normalizeSurfaceNames(parsed)];stem=decode(slice(bytes(name),0,len(bytes(name))-4))
    for lod=1 to 2
      lodData=try(pk3.read(context.archive,stem+"_"+str(lod)+".md3"));if lodData is error then break end if
      lodModel=try(md3.loadPacked(lodData));if lodModel is error then break end if;levels=levels+[md3.normalizeSurfaceNames(lodModel)]
    end for
    loaded=qvmSceneGeometry.md3Lods(levels)
  end if
  handle=registerTypedAsset(context,"model",name);while len(context.modelAssets)<len(context.assets) context.modelAssets=context.modelAssets+[void] end while;context.modelAssets[handle-1]=loaded;return handle
end function
/// Return `mq3.engine.local_qvm_match.registerTypedAsset(context, "skin", name)` from `engine.local_qvm_match.registerSkin`.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.registerTypedAsset`.
/// @param name Name passed as `name` to `mq3.engine.local_qvm_match.registerTypedAsset`.
function registerSkin(context,name) return registerTypedAsset(context,"skin",name) end function
/// Register shader kind in engine.local_qvm_match; the normal completion returns `registerTypedAsset(context, kind, shaderRemap.resolve(context.shaderRemaps, name))`.
/// @param context Record exposing `shaderRemaps`, `assetKinds`.
/// @param kind Kind passed as `kind` to `mq3.renderer.shader_remap.handle`.
/// @param name Name passed as `name` to `mq3.renderer.shader_remap.handle`.
function registerShaderKind(context,kind,name)
  remapped=shaderRemap.handle(context.shaderRemaps,context.assetKinds,kind,name);if remapped!=0 then return remapped end if
  return registerTypedAsset(context,kind,shaderRemap.resolve(context.shaderRemaps,name))
end function
/// Return `mq3.engine.local_qvm_match.registerShaderKind(context, "shader", name)` from `engine.local_qvm_match.registerShader`.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.registerShaderKind`.
/// @param name Name passed as `name` to `mq3.engine.local_qvm_match.registerShaderKind`.
function registerShader(context,name) return registerShaderKind(context,"shader",name) end function
/// Return `mq3.engine.local_qvm_match.registerShaderKind(context, "shaderNoMip", name)` from `engine.local_qvm_match.registerShaderNoMip`.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.registerShaderKind`.
/// @param name Name passed as `name` to `mq3.engine.local_qvm_match.registerShaderKind`.
function registerShaderNoMip(context,name) return registerShaderKind(context,"shaderNoMip",name) end function
/// Add command in engine.local_qvm_match; updates `context.console`.
///
/// Direct state writes: `context.console`.
/// @param context Record exposing `commandState`, `console`. Updated in place: `console`.
/// @param name Name passed as `name` to `mq3.qcommon.command_buffer.addCommand`.
function addCommand(context,name)
  // CG_InitConsoleCommands registers completion-only commands.  Keeping them
  // in the real Cmd registry is what lets Cmd_ExecuteString fall through to
  // CG_CONSOLE_COMMAND, exactly like a NULL xcommand_t in Baseq3.
  commands.addCommand(context.commandState,name,void)
  context.console=context.console+[[0,"add "+name]];return void
end function
/// Remove command in engine.local_qvm_match.
/// @param context Record exposing `commandState`.
/// @param name Name passed as `name` to `mq3.qcommon.command_buffer.removeCommand`.
function removeCommand(context,name) commands.removeCommand(context.commandState,name);return void end function
/// Send client command in engine.local_qvm_match; updates `context.console`.
///
/// Direct state writes: `context.console`.
/// @param context Record exposing `serverStream`, `console`, `pendingClientCommands`. Updated in place: `console`.
/// @param name Name used in `("client " + name)` and `context.pendingClientCommands.add(name)`.
function sendClientCommand(context,name)
  if context.serverStream!=void and context.serverStream.demoPlaying then return void end if
  if context.serverStream==void then context.console=context.console+[[0,"client "+name]] end if
  context.pendingClientCommands.add(name)
  return void
end function
/// Compute engine.local_qvm_match.updateScreen as `void`.
/// @param context Reserved argument; this implementation does not read its value.
function updateScreen(context) return void end function
/// Load world in engine.local_qvm_match.
/// @param context Record exposing `rendererEntityTokens`.
/// @param name Reserved argument; this implementation does not read its value.
function loadWorld(context,name)
  reset=cgameMisc.resetEntityTokens(context.rendererEntityTokens);if reset is error then return reset end if
  return void
end function
/// Clear scene in engine.local_qvm_match.
/// @param context Record exposing `scene`.
function clearScene(context) sceneQueue.clearScene(context.scene);return void end function
/// Compute command configstring in engine.local_qvm_match.
/// @param context Record exposing `configstrings`.
/// @param index Index used in `(index >= 0)` and `(index < len(context.configstrings))`.
/// @param value Value operand used by `commandConfigstring`; its reads are shown in the implementation.
function commandConfigstring(context,index,value) if index>=0 and index<len(context.configstrings) then context.configstrings[index]=value end if;return void end function
/// Update `context.prints` in engine.local_qvm_match.
///
/// Direct state writes: `context.prints`.
/// @param context Updated in place: `prints`.
function commandClearNotify(context) context.prints=[];return void end function
/// Return `mq3.client.command_ring.clear(context.usercmdHistory)` from `engine.local_qvm_match.commandClearUsercmds`.
/// @param context Record exposing `usercmdHistory`.
function commandClearUsercmds(context) return matchCommandRing.clear(context.usercmdHistory) end function
/// Update `context.uiKeyCatcher` in engine.local_qvm_match.
///
/// Direct state writes: `context.uiKeyCatcher`.
/// @param context Record exposing `uiKeyCatcher`. Updated in place: `uiKeyCatcher`.
function commandCloseConsole(context) context.uiKeyCatcher=context.uiKeyCatcher&~1;return void end function
/// Return `mq3.qcommon.command_buffer.addText(context.commandState, text)` from `engine.local_qvm_match.commandQueueConsole`.
/// @param context Record exposing `commandState`.
/// @param text Text passed as `text` to `mq3.qcommon.command_buffer.addText`.
function commandQueueConsole(context,text) return commands.addText(context.commandState,text) end function
/// Compute cgame server command in engine.local_qvm_match; the normal completion returns `fetched`.
/// @param context Record exposing `serverStream`, `cgameServerCommands`, `commandState`, `nativeServerCmds`, `now`.
/// @param number Number passed as `number` to `mq3.client.server_command_stream.get`.
function cgameServerCommand(context,number)
  host=serverCommandStream.services();host.context=context;host.configstringFn=commandConfigstring;host.clearNotifyFn=commandClearNotify;host.clearUsercmdsFn=commandClearUsercmds;host.closeConsoleFn=commandCloseConsole;host.queueConsoleFn=commandQueueConsole;host.serverRunning=context.serverStream==void
  fetched=serverCommandStream.get(context.cgameServerCommands,host,number);if fetched is error or not fetched or context.serverStream!=void then return fetched end if
  // The QVM remains authoritative.  Run the complete native cg_servercmds
  // state transition from the same tokenized command, suppressing its host
  // boundaries so chat, voice, shader and HUD effects cannot be duplicated.
  args=[];for index=0 to commands.argc(context.commandState)-1 args=args+[commands.argv(context.commandState,index)] end for
  context.nativeServerCmds.time=context.now;context.nativeServerCmds.serverCommandSequence=number;nativeCgameServercmds.serverCommand(context.nativeServerCmds,args,[],false);nativeCgameServercmds.playBufferedVoiceChats(context.nativeServerCmds,false)
  return fetched
end function
/// Compute engine.local_qvm_match.currentCmdNumber as `context.commandNumber`.
/// @param context Record exposing `commandNumber`.
function currentCmdNumber(context) return context.commandNumber end function
/// Compute client usercmd in engine.local_qvm_match; the normal completion returns `cgameSyscall.BytesResult(true, output)`.
/// @param context Record exposing `usercmdHistory`, `commandNumber`.
/// @param number Command number passed as `commandNumber` to `mq3.client.command_ring.get`.
function clientUsercmd(context,number)
  command=matchCommandRing.get(context.usercmdHistory,context.commandNumber,number);if command is error then return command end if
  if command==void then return cgameSyscall.BytesResult(false,bytes(0,0)) end if
  output=bytes(cgameSyscall.USERCMD_SIZE,0);n.writeU32(output,0,command.serverTime)
  for axis=0 to 2 n.writeU32(output,4+axis*4,command.angles[axis]) end for
  n.writeU32(output,16,command.buttons);output[20]=command.weapon&255;output[21]=command.forwardmove&255;output[22]=command.rightmove&255;output[23]=command.upmove&255
  return cgameSyscall.BytesResult(true,output)
end function
/// Return `mq3.client.cgame_usercmd.set(context.cgameUsercmd, value, sensitivity)` from `engine.local_qvm_match.setUsercmdValue`.
/// @param context Record exposing `cgameUsercmd`.
/// @param value Weapon passed as `weapon` to `mq3.client.cgame_usercmd.set`.
/// @param sensitivity Sensitivity passed as `sensitivity` to `mq3.client.cgame_usercmd.set`.
function setUsercmdValue(context,value,sensitivity) return cgameUsercmd.set(context.cgameUsercmd,value,sensitivity) end function
/// Compute cgame user cmd value in engine.local_qvm_match; the normal completion returns `cgameUsercmd.weapon(value.context.cgameUsercmd)`.
/// @param value Record exposing `context`.
function cgameUserCmdValue(value) if value==void or value.context==void then return 0 end if;return cgameUsercmd.weapon(value.context.cgameUsercmd) end function
/// Compute cgame sensitivity in engine.local_qvm_match; the normal completion returns `cgameUsercmd.sensitivity(value.context.cgameUsercmd)`.
/// @param value Record exposing `context`.
function cgameSensitivity(value) if value==void or value.context==void then return 1.0 end if;return cgameUsercmd.sensitivity(value.context.cgameUsercmd) end function
/// Compute engine.local_qvm_match.memoryRemaining as `((8 * 1024) * 1024)`.
/// @param context Reserved argument; this implementation does not read its value.
function memoryRemaining(context) return 8*1024*1024 end function

/// Return `mq3.vm.syscall_common.readFloatVector(vm, common.argument(vm, base, index), 3, label)` from `engine.local_qvm_match.cgameVector`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readFloatVector`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param index Index passed as `index` to `mq3.vm.syscall_common.argument`.
/// @param label Label passed as `label` to `mq3.vm.syscall_common.readFloatVector`.
function cgameVector(vm,base,index,label) return common.readFloatVector(vm,common.argument(vm,base,index),3,label) end function
/// Compute cgame nullable vector in engine.local_qvm_match; the normal completion returns `common.readFloatVector(vm, address, 3, label)`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.argument`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param index Index passed as `index` to `mq3.vm.syscall_common.argument`.
/// @param label Label passed as `label` to `mq3.vm.syscall_common.readFloatVector`.
function cgameNullableVector(vm,base,index,label)
  address=common.argument(vm,base,index);if address==0 then return void end if
  return common.readFloatVector(vm,address,3,label)
end function
/// Apply `mq3.vm.syscall_qagame_world.TraceResult` for cgame trace result in engine.local_qvm_match.
/// @param result Record exposing `trace`, `endpos`.
function cgameTraceResult(result)
  trace=result.trace
  return qworld.TraceResult(trace.allsolid,trace.startsolid,trace.fraction,result.endpos,trace.normal,trace.distance,trace.planeMetadata&255,(trace.planeMetadata>>8)&255,trace.surfaceFlags,trace.contents,0)
end function
/// Compute cgame box trace reference in engine.local_qvm_match; the normal completion returns `qworld.writeTrace(vm, output, cgameTraceResult(result))`.
/// @param context Record exposing `collisionWorld`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.argument`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param capsule Capsule passed as `capsule` to `mq3.collision.world.transformedTrace`.
/// @param transformed Transformed operand used by `cgameBoxTraceReference`; its reads are shown in the implementation.
function cgameBoxTraceReference(context,vm,base,capsule,transformed)
  output=common.argument(vm,base,1);start=cgameVector(vm,base,2,"cgame trace start");finish=cgameVector(vm,base,3,"cgame trace end")
  mins=cgameNullableVector(vm,base,4,"cgame trace mins");maxs=cgameNullableVector(vm,base,5,"cgame trace maxs")
  model=common.argument(vm,base,6);mask=common.argument(vm,base,7);result=void
  if transformed then
    origin=cgameVector(vm,base,8,"cgame trace origin");angles=cgameVector(vm,base,9,"cgame trace angles")
    result=collision.transformedTrace(context.collisionWorld,start,finish,mins,maxs,model,mask,origin,angles,capsule,context.collisionWorld.patchesReady)
  else result=collision.boxTrace(context.collisionWorld,start,finish,mins,maxs,model,mask,capsule) end if
  return qworld.writeTrace(vm,output,cgameTraceResult(result))
end function
/// Update `context.cgameCollisionQueries` in engine.local_qvm_match; the normal completion returns `cgameBoxTraceReference(context, vm, base, capsule, transformed)`.
///
/// Direct state writes: `context.cgameCollisionQueries`.
/// @param context Record exposing `cgameCollisionQueries`, `collisionWorld`. Updated in place: `cgameCollisionQueries`.
/// @param vm Vm passed as `vm` to `mq3.collision.world.writeVmTemporaryBoxTrace`.
/// @param base Base passed as `base` to `mq3.collision.world.writeVmTemporaryBoxTrace`.
/// @param capsule Capsule passed as `capsule` to `mq3.engine.local_qvm_match.cgameBoxTraceReference`.
/// @param transformed Transformed passed as `transformed` to `mq3.engine.local_qvm_match.cgameBoxTraceReference`.
function cgameBoxTrace(context,vm,base,capsule,transformed)
  context.cgameCollisionQueries=context.cgameCollisionQueries+1
  if transformed and not capsule and collision.writeVmTemporaryBoxTrace(context.collisionWorld,vm,base) then return 0 end if
  return cgameBoxTraceReference(context,vm,base,capsule,transformed)
end function
/// Update `context.cgameCollisionQueries` in engine.local_qvm_match.
///
/// Direct state writes: `context.cgameCollisionQueries`.
/// @param context Record exposing `cgameCollisionQueries`, `cgameQueryMemo`. Updated in place: `cgameCollisionQueries`.
/// @param vm Vm passed as `vm` to `mq3.vm.cgame_collision_cache.trace`.
/// @param base Base passed as `base` to `mq3.vm.cgame_collision_cache.trace`.
/// @param capsule Capsule passed as `capsule` to `mq3.vm.cgame_collision_cache.trace`.
/// @param transformed Transformed passed as `transformed` to `mq3.vm.cgame_collision_cache.trace`.
function cgameBoxTraceCached(context,vm,base,capsule,transformed)
  context.cgameCollisionQueries=context.cgameCollisionQueries+1
  return cgameCollisionCache.trace(context.cgameQueryMemo,context,vm,base,capsule,transformed,cgameBoxTraceReference)
end function
/// Decode refdef in engine.local_qvm_match.
/// @param vm Record exposing `data`.
/// @param address Value passed as `value` to `mq3.vm.syscall_common.pointer`.
function decodeRefdef(vm,address)
  at=common.pointer(vm,address,368,"refdef")
  axis=[readVector(vm.data,at+36),readVector(vm.data,at+48),readVector(vm.data,at+60)]
  return Refdef(n.readI32(vm.data,at),n.readI32(vm.data,at+4),n.readI32(vm.data,at+8),n.readI32(vm.data,at+12),n.bitsFloat(n.readI32(vm.data,at+16)),n.bitsFloat(n.readI32(vm.data,at+20)),readVector(vm.data,at+24),axis,n.readI32(vm.data,at+72),n.readI32(vm.data,at+76),slice(vm.data,at+80,32))
end function
/// Compute sound vector in engine.local_qvm_match; the normal completion returns `common.readFloatVector(vm, address, 3, label)`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readFloatVector`.
/// @param address Address passed as `address` to `mq3.vm.syscall_common.readFloatVector`.
/// @param label Label passed as `label` to `mq3.vm.syscall_common.readFloatVector`.
function soundVector(vm,address,label) if address==0 then return void end if;return common.readFloatVector(vm,address,3,label) end function
/// Create `mq3.engine.local_qvm_match.SoundCommand` with kind=kind; entity=entity; channel=channel; handle=handle; origin=origin; velocity=velocity; axis=axis; flag=flag; text=text; text2=text2.
/// @param kind Initial `kind` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record.
/// @param entity Initial `entity` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record.
/// @param channel Initial `channel` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record.
/// @param handle Initial `handle` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record.
/// @param origin Initial `origin` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record.
/// @param velocity Initial `velocity` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record.
/// @param axis Initial `axis` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record.
/// @param flag Initial `flag` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record.
/// @param text Initial `text` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record.
/// @param text2 Initial `text2` field stored in the returned or constructed `mq3.engine.local_qvm_match.SoundCommand` record.
function soundEvent(kind,entity,channel,handle,origin,velocity,axis,flag,text,text2) return SoundCommand(kind,entity,channel,handle,origin,velocity,axis,flag,text,text2) end function
/// Add cgame polys in engine.local_qvm_match; the normal completion returns `0`.
/// @param context Record exposing `scene`.
/// @param vm Record exposing `data`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param multiple Multiple operand used by `addCgamePolys`; its reads are shown in the implementation.
function addCgamePolys(context,vm,base,multiple)
  shader=common.argument(vm,base,1);numVerts=common.argument(vm,base,2);numPolys=1;if multiple then numPolys=common.argument(vm,base,4) end if
  if numVerts<=0 or numPolys<0 then return fail("invalid cgame polygon counts") end if
  if numPolys==0 then return 0 end if
  // The VM byte length is a 32-bit quantity. All fitting byte counts are
  // exact in binary64, and oversized products are rejected before allocation.
  if numVerts*(24.0*numPolys)>len(vm.data) then return fail("invalid cgame polygon storage count") end if
  total=numVerts*numPolys
  at=common.pointer(vm,common.argument(vm,base,3),total*24,"polyVert array");vertices=array(total,void)
  for index=0 to total-1
    offset=at+index*24;vertices[index]=sceneQueue.PolyVert(readVector(vm.data,offset),[n.bitsFloat(n.readI32(vm.data,offset+12)),n.bitsFloat(n.readI32(vm.data,offset+16))],[vm.data[offset+20],vm.data[offset+21],vm.data[offset+22],vm.data[offset+23]])
  end for
  sceneQueue.addPolysDecoded(context.scene,shader,numVerts,vertices,numPolys);return 0
end function
/// Compute renderer model in engine.local_qvm_match; the normal completion returns `context.modelAssets[(handle - 1)]`.
/// @param context Record exposing `assets`, `assetKinds`, `modelAssets`.
/// @param handle Handle used in `(handle - 1)` and `(handle <= 0)`.
function rendererModel(context,handle)
  if handle<=0 or handle>len(context.assets) or context.assetKinds[handle-1]!="model" or handle>len(context.modelAssets) then return void end if
  return context.modelAssets[handle-1]
end function
/// Compute renderer model bounds in engine.local_qvm_match; the normal completion returns `modelBounds.md3(model)`.
/// @param context Record exposing `collisionWorld`.
/// @param handle Handle passed as `handle` to `mq3.engine.local_qvm_match.rendererModel`.
function rendererModelBounds(context,handle)
  model=rendererModel(context,handle);if model==void then return [[0.0,0.0,0.0],[0.0,0.0,0.0]] end if
  if qvmSceneGeometry.isInlineModel(model) then return collision.modelBounds(context.collisionWorld,collision.inlineModel(context.collisionWorld,model[0].index)) end if
  if typeof(model)=="string" then index=toNumber(decode(slice(bytes(model),1,len(bytes(model))-1)));return collision.modelBounds(context.collisionWorld,collision.inlineModel(context.collisionWorld,index)) end if
  model=qvmSceneGeometry.primaryMd3(model);if model==void then return [[0.0,0.0,0.0],[0.0,0.0,0.0]] end if
  return modelBounds.md3(model)
end function
/// Update `context.cgameTagQueries` in engine.local_qvm_match; the normal completion returns `0`.
///
/// Direct state writes: `context.cgameTagQueries`.
/// @param context Record exposing `cgameTagQueries`. Updated in place: `cgameTagQueries`.
/// @param vm Record exposing `data`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function lerpModelTag(context,vm,base)
  context.cgameTagQueries=context.cgameTagQueries+1;output=common.pointer(vm,common.argument(vm,base,1),48,"orientation output")
  model=rendererModel(context,common.argument(vm,base,2));orientation=modelTags.missingOrientation()
  if model!=void and typeof(model)!="string" and not qvmSceneGeometry.isInlineModel(model) then
    model=qvmSceneGeometry.primaryMd3(model)
    tagModel=modelTags.md3(model.tags,model.bounds[0],model.bounds[1]);orientation=modelTags.lerpTag(modelTags.model(void,tagModel),common.argument(vm,base,3),common.argument(vm,base,4),n.bitsFloat(common.argument(vm,base,5)),common.readString(vm,common.argument(vm,base,6)))
    if orientation is error then return orientation end if
  end if
  writeVector(vm.data,output,orientation.origin);for row=0 to 2 writeVector(vm.data,output+12+row*12,orientation.axis[row]) end for
  if orientation.found then return 1 end if;return 0
end function
/// Compute light for point in engine.local_qvm_match; the normal completion returns `1`.
/// @param context Record exposing `lightGrid`, `scene`.
/// @param vm Vm passed as `vm` to `mq3.engine.local_qvm_match.cgameVector`.
/// @param base Base passed as `base` to `mq3.engine.local_qvm_match.cgameVector`.
function lightForPoint(context,vm,base)
  if context.lightGrid==void or not context.lightGrid.valid then return 0 end if
  lightGrid.setDynamicLights(context.lightGrid,sceneQueue.sceneLights(context.scene));sample=lightGrid.entitySample(context.lightGrid,cgameVector(vm,base,1,"light point"))
  common.writeFloatVector(vm,common.argument(vm,base,2),sample.ambient,"ambient light");common.writeFloatVector(vm,common.argument(vm,base,3),sample.directed,"directed light");common.writeFloatVector(vm,common.argument(vm,base,4),sample.direction,"light direction");return 1
end function
/// Update `context.latestRefdef`, `context.renderViews` in engine.local_qvm_match; the normal completion returns `0`.
///
/// Direct state writes: `context.latestRefdef`, `context.renderViews`.
/// @param context Record exposing `scene`, `renderViews`. Updated in place: `latestRefdef`, `renderViews`.
/// @param vm Vm passed as `vm` to `mq3.engine.local_qvm_match.decodeRefdef`.
/// @param address Address passed as `address` to `mq3.engine.local_qvm_match.decodeRefdef`.
function captureRenderView(context,vm,address)
  refdef=decodeRefdef(vm,address);context.latestRefdef=refdef;view=sceneQueue.finishScene(context.scene);context.renderViews=context.renderViews+[RenderView(refdef,view)];return 0
end function
/// Return `mq3.engine.local_qvm_match.writeCgameMarks(context, vm, base, void)` from `engine.local_qvm_match.cgameMarkFragmentsReference`.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.writeCgameMarks`.
/// @param vm Vm passed as `vm` to `mq3.engine.local_qvm_match.writeCgameMarks`.
/// @param base Base passed as `base` to `mq3.engine.local_qvm_match.writeCgameMarks`.
function cgameMarkFragmentsReference(context,vm,base) return writeCgameMarks(context,vm,base,void) end function
/// Return `mq3.engine.local_qvm_match.writeCgameMarks(context, vm, base, context.markGeometry)` from `engine.local_qvm_match.cgameMarkFragmentsPrepared`.
/// @param context Record exposing `markGeometry`.
/// @param vm Vm passed as `vm` to `mq3.engine.local_qvm_match.writeCgameMarks`.
/// @param base Base passed as `base` to `mq3.engine.local_qvm_match.writeCgameMarks`.
function cgameMarkFragmentsPrepared(context,vm,base) return writeCgameMarks(context,vm,base,context.markGeometry) end function
/// Write cgame marks in engine.local_qvm_match; the normal completion returns `len(result.fragments)`.
/// @param context Record exposing `markMap`, `collisionWorld`.
/// @param vm Record exposing `data`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param cache Cache passed as `cache` to `mq3.renderer.mark_fragments.projectWithCache`.
function writeCgameMarks(context,vm,base,cache)
  numPoints=common.argument(vm,base,1);maxPoints=common.argument(vm,base,4);maxFragments=common.argument(vm,base,6)
  if numPoints<3 or numPoints>1024 or maxPoints<0 or maxPoints>131072 or maxFragments<0 or maxFragments>131072 then return fail("invalid cgame mark-fragment counts") end if
  pointsAt=common.pointer(vm,common.argument(vm,base,2),numPoints*12,"mark source points");points=array(numPoints,void)
  for index=0 to numPoints-1 points[index]=readVector(vm.data,pointsAt+index*12) end for
  projection=common.readFloatVector(vm,common.argument(vm,base,3),3,"mark projection")
  result=markFragments.projectWithCache(context.markMap,context.collisionWorld,points,projection,maxPoints,maxFragments,cache);if result is error then return result end if
  if len(result.points)>0 then outputAt=common.pointer(vm,common.argument(vm,base,5),maxPoints*12,"mark point output");for index=0 to len(result.points)-1 writeVector(vm.data,outputAt+index*12,result.points[index]) end for end if
  if len(result.fragments)>0 then fragmentsAt=common.pointer(vm,common.argument(vm,base,7),maxFragments*8,"mark fragment output");for index=0 to len(result.fragments)-1 fragment=result.fragments[index];n.writeU32(vm.data,fragmentsAt+index*8,fragment.firstPoint);n.writeU32(vm.data,fragmentsAt+index*8+4,fragment.numPoints) end for end if
  return len(result.fragments)
end function
/// Return `mq3.engine.local_qvm_match.cgameMarkFragmentsReference(context, vm, base)` from `engine.local_qvm_match.cgameMarkFragments`.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.cgameMarkFragmentsReference`.
/// @param vm Vm passed as `vm` to `mq3.engine.local_qvm_match.cgameMarkFragmentsReference`.
/// @param base Base passed as `base` to `mq3.engine.local_qvm_match.cgameMarkFragmentsReference`.
function cgameMarkFragments(context,vm,base) return cgameMarkFragmentsReference(context,vm,base) end function
/// Compute cgame mark fragments cached in engine.local_qvm_match; the normal completion returns `cgameCollisionCache.markFragments(context.cgameQueryMemo, context, vm, base, cgameMarkFragmentsPrepared)`.
/// @param context Record exposing `cgameQueryMemo`.
/// @param vm Vm passed as `vm` to `mq3.engine.local_qvm_match.cgameMarkFragmentsReference`.
/// @param base Base passed as `base` to `mq3.engine.local_qvm_match.cgameMarkFragmentsReference`.
function cgameMarkFragmentsCached(context,vm,base)
  if context.cgameQueryMemo==void or not context.cgameQueryMemo.enabled then return cgameMarkFragmentsReference(context,vm,base) end if
  return cgameCollisionCache.markFragments(context.cgameQueryMemo,context,vm,base,cgameMarkFragmentsPrepared)
end function

/// Register qvm font in engine.local_qvm_match; the normal completion returns `0`.
/// @param context Record exposing `fontRegistry`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function registerQvmFont(context,vm,base)
  name=common.readString(vm,common.argument(vm,base,1));pointSize=common.argument(vm,base,2);address=common.argument(vm,base,3)
  loaded=fontAbi.load(context.fontRegistry,context,registerShaderNoMip,name,pointSize);if loaded is error then return loaded end if
  if loaded.found then common.writeRaw(vm,address,loaded.data,fontAbi.FONT_INFO_SIZE,"fontInfo_t output") end if
  return 0
end function
/// Return `mq3.botlib.be_interface.PC_AddGlobalDefine(context.pcRegistry, common.readString(vm, common.argument(vm, base, 1)))` from `engine.local_qvm_match.pcAddDefine`.
/// @param context Record exposing `pcRegistry`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function pcAddDefine(context,vm,base) return botInterface.PC_AddGlobalDefine(context.pcRegistry,common.readString(vm,common.argument(vm,base,1))) end function
/// Return `mq3.botlib.be_interface.PC_LoadSourceHandle(context.pcRegistry, common.readString(vm, common.argument(vm, base, 1)))` from `engine.local_qvm_match.pcLoadSource`.
/// @param context Record exposing `pcRegistry`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.readString`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function pcLoadSource(context,vm,base) return botInterface.PC_LoadSourceHandle(context.pcRegistry,common.readString(vm,common.argument(vm,base,1))) end function
/// Return `mq3.botlib.be_interface.PC_FreeSourceHandle(context.pcRegistry, common.argument(vm, base, 1))` from `engine.local_qvm_match.pcFreeSource`.
/// @param context Record exposing `pcRegistry`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.argument`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function pcFreeSource(context,vm,base) return botInterface.PC_FreeSourceHandle(context.pcRegistry,common.argument(vm,base,1)) end function
/// Compute pc read token in engine.local_qvm_match; the normal completion returns `1`.
/// @param context Record exposing `pcRegistry`.
/// @param vm Vm passed as `vm` to `mq3.vm.syscall_common.argument`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function pcReadToken(context,vm,base)
  token=botInterface.PC_ReadTokenHandle(context.pcRegistry,common.argument(vm,base,1));if token is error then return token end if;if token==void then return 0 end if
  data=pcParser.encode(token);if data is error then return data end if;common.writeRaw(vm,common.argument(vm,base,2),data,pcParser.TOKEN_SIZE,"pc_token_t output");return 1
end function
/// Compute pc source line in engine.local_qvm_match; the normal completion returns `1`.
/// @param context Record exposing `pcRegistry`.
/// @param vm Record exposing `data`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
function pcSourceLine(context,vm,base)
  location=botInterface.PC_SourceFileAndLine(context.pcRegistry,common.argument(vm,base,1));if location==void then return 0 end if
  common.writeBuffer(vm,common.argument(vm,base,2),64,location[0],"parser source filename");lineAt=common.pointer(vm,common.argument(vm,base,3),4,"parser source line");n.writeU32(vm.data,lineAt,location[1]);return 1
end function

/// Compute remap renderer shader in engine.local_qvm_match; the normal completion returns `0`.
/// @param context Record exposing `shaderRemaps`, `assets`, `assetKinds`.
/// @param oldName Name passed as `name` to `mq3.engine.local_qvm_match.registerShader`.
/// @param newName Name passed as `name` to `mq3.engine.local_qvm_match.registerShader`.
/// @param timeOffset Offset passed as `offset` to `mq3.renderer.shader_remap.apply`.
function remapRendererShader(context,oldName,newName,timeOffset)
  // R_RemapShader resolves both names before attaching the replacement to all
  // existing shader variants. Registration here gives the in-memory handle
  // registry the same stable objects for scene and 2D material resolution.
  registerShader(context,oldName);registerShader(context,newName)
  result=shaderRemap.apply(context.shaderRemaps,context.assets,context.assetKinds,oldName,newName,timeOffset);if result is error then return result end if
  return 0
end function

/// Update `context.cgameCollisionQueries`, `context.soundCommands`, `context.uiKeyCatcher` in engine.local_qvm_match; the normal completion returns `error(7643, ("local QVM match: unsupported retail cgame trap " + str(op)))`.
///
/// Direct state writes: `context.cgameCollisionQueries`, `context.soundCommands`, `context.uiKeyCatcher`.
/// @param context Record exposing `collisionWorld`, `cgameCollisionQueries`, `soundCommands`, `scene`, `renderQueue`, `uiKeyCatcher`, `rendererEntityTokens` and further fields. Updated in place: `cgameCollisionQueries`, `soundCommands`, `uiKeyCatcher`.
/// @param vm Record exposing `data`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param op Op used in `str(op)` and `(op == 18)`.
function extendedCgame(context,vm,base,op)
  // Capture every retail sound/renderer submission. Structured decoding is
  // added per trap while the original module remains the sole scene producer.
  if op==18 then checksumAt=common.argument(vm,base,2);if checksumAt!=0 then output=common.pointer(vm,checksumAt,4,"map checksum output");if output is error then return output end if;n.writeU32(vm.data,output,0) end if;return 0 end if
  if op==19 then return len(context.collisionWorld.models) end if
  if op==20 then return collision.inlineModel(context.collisionWorld,common.argument(vm,base,1)) end if
  if op==21 then return 0 end if
  if op==22 or op==82 then return collision.tempBoxModel(context.collisionWorld,cgameVector(vm,base,1,"temporary mins"),cgameVector(vm,base,2,"temporary maxs"),op==82) end if
  if op==23 then context.cgameCollisionQueries=context.cgameCollisionQueries+1;return collision.pointContents(context.collisionWorld,cgameVector(vm,base,1,"point contents"),common.argument(vm,base,2)) end if
  if op==24 then context.cgameCollisionQueries=context.cgameCollisionQueries+1;return collision.transformedPointContents(context.collisionWorld,cgameVector(vm,base,1,"transformed point"),common.argument(vm,base,2),cgameVector(vm,base,3,"model origin"),cgameVector(vm,base,4,"model angles")) end if
  if op==25 or op==83 then return cgameBoxTrace(context,vm,base,op==83,false) end if
  if op==26 or op==84 then return cgameBoxTrace(context,vm,base,op==84,true) end if
  if op==27 then return cgameMarkFragments(context,vm,base) end if
  if op==28 then context.soundCommands=context.soundCommands+[soundEvent("start",common.argument(vm,base,2),common.argument(vm,base,3),common.argument(vm,base,4),soundVector(vm,common.argument(vm,base,1),"sound origin"),void,void,false,"","")];return 0 end if
  if op==29 then context.soundCommands=context.soundCommands+[soundEvent("local",-1,common.argument(vm,base,2),common.argument(vm,base,1),void,void,void,false,"","")];return 0 end if
  if op==30 then context.soundCommands=context.soundCommands+[soundEvent("clearLoops",-1,0,0,void,void,void,common.argument(vm,base,1)!=0,"","")];return 0 end if
  if op==31 or op==80 then context.soundCommands=context.soundCommands+[soundEvent("loop",common.argument(vm,base,1),0,common.argument(vm,base,4),soundVector(vm,common.argument(vm,base,2),"loop origin"),soundVector(vm,common.argument(vm,base,3),"loop velocity"),void,op==80,"","")];return 0 end if
  if op==32 then context.soundCommands=context.soundCommands+[soundEvent("position",common.argument(vm,base,1),0,0,soundVector(vm,common.argument(vm,base,2),"entity sound origin"),void,void,false,"","")];return 0 end if
  if op==33 then
    axes=[];axisAt=common.argument(vm,base,3);if axisAt!=0 then for row=0 to 2 axes=axes+[common.readFloatVector(vm,axisAt+row*12,3,"listener axis")] end for end if
    context.soundCommands=context.soundCommands+[soundEvent("listener",common.argument(vm,base,1),0,0,soundVector(vm,common.argument(vm,base,2),"listener origin"),void,axes,common.argument(vm,base,4)!=0,"","")];return 0
  end if
  if op==34 then return registerTypedAsset(context,"sound",common.readString(vm,common.argument(vm,base,1))) end if
  if op==35 then context.soundCommands=context.soundCommands+[soundEvent("music",-1,0,0,void,void,void,false,common.readString(vm,common.argument(vm,base,1)),common.readString(vm,common.argument(vm,base,2)))];return 0 end if
  if op==69 then context.soundCommands=context.soundCommands+[soundEvent("stopMusic",-1,0,0,void,void,void,false,"","")];return 0 end if
  if op==70 then sample=cgameMisc.sampleRealTime();if sample is error then return sample end if;return cgameMisc.realTime(vm,common.argument(vm,base,1),sample) end if
  if op==71 then return cgameMisc.snapVector(vm,common.argument(vm,base,1)) end if
  if op==81 then context.soundCommands=context.soundCommands+[soundEvent("stopLoop",common.argument(vm,base,1),0,0,void,void,void,false,"","")];return 0 end if
  if op==41 then
    at=common.pointer(vm,common.argument(vm,base,1),140,"refEntity");sceneQueue.addEntity(context.scene,n.readI32(vm.data,at),slice(vm.data,at,140));return 0
  end if
  if op==42 then return addCgamePolys(context,vm,base,false) end if
  if op==43 or op==85 then
    origin=common.readFloatVector(vm,common.argument(vm,base,1),3,"light origin");intensity=n.bitsFloat(common.argument(vm,base,2));red=n.bitsFloat(common.argument(vm,base,3));green=n.bitsFloat(common.argument(vm,base,4));blue=n.bitsFloat(common.argument(vm,base,5))
    sceneQueue.addDynamicLight(context.scene,origin,intensity,red,green,blue,op==85);return 0
  end if
  if op==44 then return captureRenderView(context,vm,common.argument(vm,base,1)) end if
  if op==45 then
    address=common.argument(vm,base,1);color=void;if address!=0 then color=common.readFloatVector(vm,address,4,"render color") end if;renderQueue.setColor(context.renderQueue,color);return 0
  end if
  if op==46 then
    values=array(8,0.0);for index=1 to 8 values[index-1]=n.bitsFloat(common.argument(vm,base,index)) end for
    renderQueue.stretchPicValues(context.renderQueue,values,common.argument(vm,base,9));return 0
  end if
  if op==47 then
    mins=common.pointer(vm,common.argument(vm,base,2),12,"model mins");maxs=common.pointer(vm,common.argument(vm,base,3),12,"model maxs")
    bounds=rendererModelBounds(context,common.argument(vm,base,1));writeVector(vm.data,mins,bounds[0]);writeVector(vm.data,maxs,bounds[1]);return 0
  end if
  if op==48 then return lerpModelTag(context,vm,base) end if
  if op==59 then return registerQvmFont(context,vm,base) end if
  if op==60 then return 0 end if
  if op==61 then return context.uiKeyCatcher end if
  if op==62 then context.uiKeyCatcher=common.argument(vm,base,1);return 0 end if
  if op==63 then return 0 end if
  if op==64 then return pcAddDefine(context,vm,base) end if
  if op==65 then return pcLoadSource(context,vm,base) end if
  if op==66 then return pcFreeSource(context,vm,base) end if
  if op==67 then return pcReadToken(context,vm,base) end if
  if op==68 then return pcSourceLine(context,vm,base) end if
  if op==73 then return lightForPoint(context,vm,base) end if
  if op==74 then return uiPlayCinematic(context,common.readString(vm,common.argument(vm,base,1)),common.argument(vm,base,2),common.argument(vm,base,3),common.argument(vm,base,4),common.argument(vm,base,5),common.argument(vm,base,6)) end if
  if op==75 then return uiCinematicStop(context,common.argument(vm,base,1)) end if
  if op==76 then return uiCinematicRun(context,common.argument(vm,base,1)) end if
  if op==77 then uiCinematicDraw(context,common.argument(vm,base,1));return 0 end if
  if op==78 then uiCinematicExtents(context,common.argument(vm,base,1),common.argument(vm,base,2),common.argument(vm,base,3),common.argument(vm,base,4),common.argument(vm,base,5));return 0 end if
  if op==79 then
    oldName=common.readString(vm,common.argument(vm,base,1));if oldName is error then return oldName end if
    newName=common.readString(vm,common.argument(vm,base,2));if newName is error then return newName end if
    timeOffset=common.readString(vm,common.argument(vm,base,3));if timeOffset is error then return timeOffset end if
    return remapRendererShader(context,oldName,newName,timeOffset)
  end if
  if op==86 then return cgameMisc.entityToken(vm,common.argument(vm,base,1),common.argument(vm,base,2),context.rendererEntityTokens) end if
  if op==87 then return addCgamePolys(context,vm,base,true) end if
  if op==88 then if rendererPvs.inPVS(context.collisionWorld,cgameVector(vm,base,1,"PVS point 1"),cgameVector(vm,base,2,"PVS point 2")) then return 1 end if;return 0 end if
  if op==89 then return memoryFileSeek.seek(context.files,common.argument(vm,base,1),common.argument(vm,base,2),common.argument(vm,base,3)) end if
  if op>=18 and op<=35 or op>=41 and op<=48 or op>=59 and op<=71 or op>=73 and op<=89 then return 0 end if
  return error(7643,"local QVM match: unsupported retail cgame trap "+str(op))
end function

/// Compute extended cgame host in engine.local_qvm_match; the normal completion returns `extendedCgame(context, vm, base, op)`.
/// @param context Record exposing `cgameTrapCounts`.
/// @param vm Vm passed as `vm` to `mq3.engine.local_qvm_match.cgameBoxTraceCached`.
/// @param base Base passed as `base` to `mq3.engine.local_qvm_match.cgameBoxTraceCached`.
/// @param op Op passed as `op` to `mq3.engine.local_qvm_match.extendedCgame`.
function extendedCgameHost(context,vm,base,op)
  // Only the complete local-match Context owns diagnostics. Keeping this
  // wrapper outside the renderer implementation lets focused trap fixtures use
  // the minimal fields required by the trap they exercise.
  if op>=0 and op<len(context.cgameTrapCounts) then context.cgameTrapCounts[op]=context.cgameTrapCounts[op]+1 end if
  if op==25 or op==83 then return cgameBoxTraceCached(context,vm,base,op==83,false) end if
  if op==27 then return cgameMarkFragmentsCached(context,vm,base) end if
  return extendedCgame(context,vm,base,op)
end function

/// Update `value.cgame` in engine.local_qvm_match; the normal completion returns `client`.
///
/// Direct state writes: `value.cgame`.
/// @param value Record exposing `context`, `runtime`. Updated in place: `cgame`.
function bootCgame(value)
  if value==void or value.context.latestSnapshot==void then return fail("snapshot is required before cgame initialization") end if
  context=value.context;shared=common.services(context.cvars,context.commandState,context)
  shared.printFn=emitPrint;shared.errorFn=emitError;shared.millisecondsFn=milliseconds;shared.consoleFn=consoleCommand
  shared.openFn=openFile;shared.readFn=readFile;shared.writeFn=writeFile;shared.closeFn=closeFile
  syscalls=cgameSyscall.services(shared,context);syscalls.addCommandFn=addCommand;syscalls.removeCommandFn=removeCommand;syscalls.sendClientCommandFn=sendClientCommand;syscalls.updateScreenFn=updateScreen
  syscalls.loadWorldFn=loadWorld;syscalls.registerModelFn=registerModel;syscalls.registerSkinFn=registerSkin;syscalls.registerShaderFn=registerShader;syscalls.registerShaderNoMipFn=registerShaderNoMip;syscalls.clearSceneFn=clearScene
  syscalls.getGlconfigFn=glconfigBytes;syscalls.getGameStateFn=gameStateBytes;syscalls.getCurrentSnapshotNumberFn=currentSnapshot;syscalls.getSnapshotFn=snapshotBytesScratch;syscalls.getServerCommandFn=cgameServerCommand
  syscalls.getCurrentCmdNumberFn=currentCmdNumber;syscalls.getUserCmdFn=clientUsercmd;syscalls.setUserCmdValueFn=setUsercmdValue;syscalls.memoryRemainingFn=memoryRemaining;syscalls.extendedFn=extendedCgameHost
  syscalls.keyServices=cgameKeys.stateServices(context.cgameKeys)
  syscalls.pcServices=cgamePc.registryServices(context.pcRegistry)
  host=cgameVm.services(value.runtime,cgameSyscall.callback(syscalls),loadClientVm,callVm,freeVm);host.context=context;host.millisecondsFn=milliseconds;host.serverInfoFn=getServerinfo
  client=cgameVm.create(host);if client is error then return client end if
  // Cmd_ExecuteString owns the original dispatch order.  Install the live
  // QVM callbacks before CG_INIT so its completion-only registrations are
  // immediately usable by the same command state.
  value.cgame=client;context.commandState.context=value;context.commandState.clientRunning=true;context.commandState.serverRunning=context.serverStream==void
  context.commandState.clientGameCommandFn=clientGameCommand;context.commandState.serverGameCommandFn=serverGameCommand;context.commandState.uiGameCommandFn=uiGameCommand;context.commandState.forwardCommandFn=forwardClientCommand
  processedSnapshot=context.snapshotNumber-1;if processedSnapshot<0 then processedSnapshot=0 end if
  clientNum=0
  if context.serverStream!=void then clientNum=context.serverStream.protocol.gamestateState.clientNum end if
  initialized=try(cgameVm.initialize(client,processedSnapshot,context.cgameServerCommands.lastExecuted,clientNum,0,0));if initialized is error then return initialized end if
  if context.serverStream!=void then return client end if
  nativeInit=nativeCgameMain.init(context.nativeMain,processedSnapshot,context.cgameServerCommands.lastExecuted,0,context.configstrings[nativeCgameMain.CS_GAME_VERSION],640,480,[],true);if nativeInit is error then return nativeInit end if
  for clientNum=0 to nativeCgamePlayers.MAX_CLIENTS-1
    playerConfig=context.configstrings[nativeCgameMain.CS_PLAYERS+clientNum]
    if playerConfig!="" then
      nativeCgamePlayers.newClientInfo(context.nativePlayers,clientNum,playerConfig,"",true,true);clientInfo=context.nativePlayers.clients[clientNum]
      if len(clientInfo.animations)==0 then for animationIndex=0 to nativeCgamePlayers.MAX_TOTALANIMATIONS-1 clientInfo.animations=clientInfo.animations+[nativeCgamePlayers.animation(0,1,1,100,100,false,false)] end for end if
    end if
  end for
  nativeCgameCommands.syncVmCvars(context.nativeCgameCommands,context.cvars);return client
end function

// R_ToggleSmpFrame owns frame capacities; RE_ClearScene only separates views
// within that frame. Reset before cgame/UI draw calls, never per RenderScene:
// the main view, portal views and 3D HUD must share one bounded submission set.
/// @param value Record exposing `context`.
function beginRendererFrame(value)
  if value==void or value.context==void then return fail("match renderer context is required") end if
  sceneQueue.toggleFrame(value.context.scene);renderQueue.reset(value.context.renderQueue)
  value.context.renderViews=[];return void
end function

/// Compute draw cgame in engine.local_qvm_match; the normal completion returns `drawn`.
/// @param value Record exposing `cgame`, `context`.
/// @param serverTime Server time passed as `serverTime` to `mq3.client.cgame_vm.drawActiveFrame`.
function drawCgame(value,serverTime)
  if value==void or value.cgame==void then return fail("cgame is not active") end if
  begun=beginRendererFrame(value);if begun is error then return begun end if
  value.context.now=serverTime;drawn=cgameVm.drawActiveFrame(value.cgame,serverTime,0,false);if drawn is error then return drawn end if;renderQueue.snapshot(value.context.renderQueue);value.context.nativeMain.time=serverTime;nativeCgameMain.vmMain(value.context.nativeMain,nativeCgameMain.CG_DRAW_ACTIVE_FRAME,[serverTime,0,0],[],value.context.nativeMain.gameVersion,640,480,true);nativeCgameCommands.syncVmCvars(value.context.nativeCgameCommands,value.context.cvars);return drawn
end function

// The native cgame mirror above is a differential-audit observer. Running it
// and rescanning its complete cvar table on every retail-QVM frame contributes
// no authoritative output. The playable path therefore executes only the
// original cgame QVM; probes continue to use drawCgame and retain the observer.
/// @param value Record exposing `cgame`.
/// @param serverTime Server time passed as `serverTime` to `mq3.engine.local_qvm_match.drawCgameProductiveInFrame`.
function drawCgameProductive(value,serverTime)
  if value==void or value.cgame==void then return fail("cgame is not active") end if
  begun=beginRendererFrame(value);if begun is error then return begun end if
  return drawCgameProductiveInFrame(value,serverTime)
end function

/// Compute draw cgame productive in frame in engine.local_qvm_match; the normal completion returns `drawn`.
/// @param value Record exposing `cgame`, `context`.
/// @param serverTime Server time passed as `serverTime` to `mq3.client.cgame_vm.drawActiveFrame`.
function drawCgameProductiveInFrame(value,serverTime)
  if value==void or value.cgame==void then return fail("cgame is not active") end if
  context=value.context;context.now=serverTime
  demoPlaying=context.serverStream!=void and context.serverStream.demoPlaying
  drawn=cgameVm.drawActiveFrame(value.cgame,serverTime,0,demoPlaying);if drawn is error then return drawn end if
  renderQueue.snapshot(context.renderQueue);return drawn
end function

/// Test refresh server stream in engine.local_qvm_match; the normal completion returns `true`.
/// @param value Record exposing `context`.
/// @param now Now operand used by `refreshServerStream`; its reads are shown in the implementation.
function refreshServerStream(value,now)
  if value==void or value.context.serverStream==void then return fail("server stream is not active") end if
  context=value.context;stream=context.serverStream;dispatcher=stream.protocol.dispatcher
  if stream.epoch!=dispatcher.snapshotState then return false end if
  context.now=now
  shot=stream.epoch.snap
  if shot.valid and (context.latestSnapshot==void or context.snapshotNumber!=shot.messageNum) then
    count=shot.numEntities;if count>256 then count=256 end if;entities=array(count,void)
    if count>0 then
      for index=0 to count-1
        entity=try(serverStream.entity(stream,shot,index));if entity is error then return entity end if
        entities[index]=entity
      end for
    end if
    context.latestSnapshot=Snapshot(shot.serverTime,shot.playerState,entities,shot.areaMask)
    context.snapshotNumber=shot.messageNum
  end if
  if context.cgameServerCommands.commandSequence!=dispatcher.serverCommandSequence then
    syncedCommands=try(serverCommandStream.setSequence(context.cgameServerCommands,dispatcher.serverCommandSequence,dispatcher.serverCommands))
    if syncedCommands is error then return syncedCommands end if
  end if
  return true
end function

/// Compute take stream commands in engine.local_qvm_match; the normal completion returns `result`.
/// @param value Record exposing `context`.
function takeStreamCommands(value)
  if value==void or value.context.serverStream==void then return [] end if
  pending=value.context.pendingClientCommands
  if pending.len()==0 then return [] end if
  result=pending.toArray();pending.clear();return result
end function

/// Compute boot server stream in engine.local_qvm_match; the normal completion returns `value`.
/// @param archive Archive passed as `archive` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param map Map passed as `map` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param mapName Map name passed as `mapName` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param qvmRoot Qvm root passed as `qvmRoot` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param settings Settings passed as `settings` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
/// @param protocol Record exposing `gamestateState`.
/// @param demoPlaying Demo playing passed as `demoPlaying` to `mq3.client.server_stream.attach`.
/// @param sourceName Servername passed as `servername` to `mq3.client.ui_host_lifecycle.createClientState`.
/// @param now Now passed as `now` to `mq3.engine.local_qvm_match.bootConfiguredNamedModeSettings`.
function bootServerStream(archive,map,mapName,qvmRoot,settings,protocol,demoPlaying,sourceName,now)
  if not serverStream.ready(protocol) then return fail("server stream has no active snapshot") end if
  gameState=protocol.gamestateState
  if gameState.clientNum<0 or gameState.clientNum>=MAX_CLIENTS or gameState.serverCommandSequence<0 then return fail("invalid server gamestate") end if
  value=try(bootConfiguredNamedModeSettings(archive,map,now,qvmRoot,false,mapName,false,settings))
  if value is error then return value end if
  context=value.context
  context.serverStream=serverStream.attach(protocol,demoPlaying)
  context.cgameServerCommands.demoPlaying=demoPlaying
  context.cgameServerCommands.lastExecuted=gameState.serverCommandSequence
  context.uiClient=uiHost.createClientState(uiHost.CA_ACTIVE,0,gameState.clientNum,sourceName,"","")
  for index=0 to MAX_CONFIGSTRINGS-1 context.configstrings[index]=gamestate.configString(gameState,index) end for
  refreshed=try(refreshServerStream(value,now))
  if refreshed is error then shutdown(value);return refreshed end if
  client=try(bootCgame(value));if client is error then shutdown(value);return client end if
  if len(context.errors)>0 then
    reason=context.errors[0]
    if context.serverStream.pure and strings.startsWith(reason,"Client/Server game mismatch:") then
      reason=reason+" (This server needs compatible protocol-68 client QVMs inside the approved PK3s.)"
    end if
    shutdown(value)
    return fail(reason)
  end if
  return value
end function

/// Compute engine.local_qvm_match.uiClipboard as `""`.
/// @param context Reserved argument; this implementation does not read its value.
function uiClipboard(context) return "" end function
/// Return `mq3.client.ui_host_lifecycle.encodeClientState(context.uiClient)` from `engine.local_qvm_match.uiClientState`.
/// @param context Record exposing `uiClient`.
function uiClientState(context) return uiHost.encodeClientState(context.uiClient) end function
/// Compute ui config string in engine.local_qvm_match; the normal completion returns `context.configstrings[index]`.
/// @param context Record exposing `configstrings`.
/// @param index Zero-based index into `context.configstrings`.
function uiConfigString(context,index) if index<0 or index>=len(context.configstrings) then return void end if;return context.configstrings[index] end function
/// Return `mq3.vm.cgame_key_traps.keynumToString(key)` from `engine.local_qvm_match.uiKeyName`.
/// @param context Reserved argument; this implementation does not read its value.
/// @param key Key passed as `key` to `mq3.vm.cgame_key_traps.keynumToString`.
function uiKeyName(context,key) return cgameKeys.keynumToString(key) end function
/// Return `mq3.vm.cgame_key_traps.getBinding(context.cgameKeys, key)` from `engine.local_qvm_match.uiBinding`.
/// @param context Record exposing `cgameKeys`.
/// @param key Key passed as `key` to `mq3.vm.cgame_key_traps.getBinding`.
function uiBinding(context,key) return cgameKeys.getBinding(context.cgameKeys,key) end function
/// Compute ui set binding in engine.local_qvm_match.
/// @param context Record exposing `cgameKeys`.
/// @param key Key passed as `key` to `mq3.vm.cgame_key_traps.setBinding`.
/// @param text Value passed as `value` to `mq3.vm.cgame_key_traps.setBinding`.
function uiSetBinding(context,key,text) cgameKeys.setBinding(context.cgameKeys,key,text);return void end function
/// Return `mq3.vm.cgame_key_traps.isDown(context.cgameKeys, key)` from `engine.local_qvm_match.uiKeyDown`.
/// @param context Record exposing `cgameKeys`.
/// @param key Key passed as `key` to `mq3.vm.cgame_key_traps.isDown`.
function uiKeyDown(context,key) return cgameKeys.isDown(context.cgameKeys,key) end function
/// Return `mq3.vm.cgame_key_traps.getOverstrike(context.cgameKeys)` from `engine.local_qvm_match.uiGetOverstrike`.
/// @param context Record exposing `cgameKeys`.
function uiGetOverstrike(context) return cgameKeys.getOverstrike(context.cgameKeys) end function
/// Return `mq3.vm.cgame_key_traps.setOverstrike(context.cgameKeys, value)` from `engine.local_qvm_match.uiSetOverstrike`.
/// @param context Record exposing `cgameKeys`.
/// @param value Value passed as `value` to `mq3.vm.cgame_key_traps.setOverstrike`.
function uiSetOverstrike(context,value) return cgameKeys.setOverstrike(context.cgameKeys,value) end function
/// Return `mq3.vm.cgame_key_traps.clearStates(context.cgameKeys)` from `engine.local_qvm_match.uiClearKeys`.
/// @param context Record exposing `cgameKeys`.
function uiClearKeys(context) return cgameKeys.clearStates(context.cgameKeys) end function
/// Compute ui clear keys productive in engine.local_qvm_match; the normal completion returns `uiClearKeys(context)`.
/// @param context Record exposing `inputClearFn`, `inputClearContext`.
function uiClearKeysProductive(context)
  // UI_ForceMenuOff calls Key_ClearStates; release actual command sources too.
  if context.inputClearFn!=void then released=context.inputClearFn(context.inputClearContext);if released is error then return released end if end if
  return uiClearKeys(context)
end function
/// Test attach input clear in engine.local_qvm_match; the normal completion returns `true`.
/// @param value Record exposing `context`.
/// @param context Context used in `(value.context == void)` and `((value == void) or (value.context == void))`.
/// @param callback Callback invoked for callback; the call sites below define the callback arguments.
function attachInputClear(value,context,callback)
  if value==void or value.context==void then return fail("match is required for input clear") end if
  value.context.inputClearContext=context;value.context.inputClearFn=callback;return true
end function
/// Return `mq3.vm.cgame_key_traps.getCatcher(context.cgameKeys)` from `engine.local_qvm_match.uiGetCatcher`.
/// @param context Record exposing `cgameKeys`.
function uiGetCatcher(context) return cgameKeys.getCatcher(context.cgameKeys) end function
/// Update `context.uiKeyCatcher` in engine.local_qvm_match.
///
/// Direct state writes: `context.uiKeyCatcher`.
/// @param context Record exposing `cgameKeys`. Updated in place: `uiKeyCatcher`.
/// @param value Value passed as `value` to `mq3.vm.cgame_key_traps.setCatcher`.
function uiSetCatcher(context,value) context.uiKeyCatcher=value;cgameKeys.setCatcher(context.cgameKeys,value);return void end function
/// Set key down in engine.local_qvm_match; the normal completion returns `cgameKeys.setDown(value.context.cgameKeys, key, down)`.
/// @param value Record exposing `context`.
/// @param key Key passed as `key` to `mq3.vm.cgame_key_traps.setDown`.
/// @param down Value passed as `value` to `mq3.vm.cgame_key_traps.setDown`.
function setKeyDown(value,key,down) if value==void or value.context==void then return false end if;return cgameKeys.setDown(value.context.cgameKeys,key,down) end function
/// Compute key binding in engine.local_qvm_match; the normal completion returns `cgameKeys.getBinding(value.context.cgameKeys, key)`.
/// @param value Record exposing `context`.
/// @param key Key passed as `key` to `mq3.vm.cgame_key_traps.getBinding`.
function keyBinding(value,key) if value==void or value.context==void then return "" end if;return cgameKeys.getBinding(value.context.cgameKeys,key) end function
/// Set key binding in engine.local_qvm_match; the normal completion returns `cgameKeys.setBinding(value.context.cgameKeys, key, text)`.
/// @param value Record exposing `context`.
/// @param key Key passed as `key` to `mq3.vm.cgame_key_traps.setBinding`.
/// @param text Value passed as `value` to `mq3.vm.cgame_key_traps.setBinding`.
function setKeyBinding(value,key,text) if value==void or value.context==void then return false end if;return cgameKeys.setBinding(value.context.cgameKeys,key,text) end function
/// Queue input command in engine.local_qvm_match; the normal completion returns `true`.
/// @param value Record exposing `context`.
/// @param text Text passed as `text` to `mq3.qcommon.command_buffer.addText`.
function queueInputCommand(value,text) if value==void or value.context==void then return false end if;commands.addText(value.context.commandState,text);return true end function
/// Compute binding config text in engine.local_qvm_match; the normal completion returns `bindingConfig.bindingText(bindingConfig.create(value.context.cgameKeys))`.
/// @param value Record exposing `context`.
function bindingConfigText(value) if value==void or value.context==void then return "unbindall\n" end if;return bindingConfig.bindingText(bindingConfig.create(value.context.cgameKeys)) end function
/// Load binding config in engine.local_qvm_match; the normal completion returns `bindingConfig.loadText(bindingConfig.create(value.context.cgameKeys), value.context.commandState, text)`.
/// @param value Record exposing `context`.
/// @param text Text passed as `text` to `mq3.client.key_bindings_config.loadText`.
function loadBindingConfig(value,text) if value==void or value.context==void then return fail("match and binding config text are required") end if;return bindingConfig.loadText(bindingConfig.create(value.context.cgameKeys),value.context.commandState,text) end function
/// Compute key catcher in engine.local_qvm_match; the normal completion returns `cgameKeys.getCatcher(value.context.cgameKeys)`.
/// @param value Record exposing `context`.
function keyCatcher(value) if value==void or value.context==void then return 0 end if;return cgameKeys.getCatcher(value.context.cgameKeys) end function
/// Test any key down in engine.local_qvm_match; the normal completion returns `false`.
/// @param value Record exposing `context`.
function anyKeyDown(value)
  if value==void or value.context==void then return false end if
  for each down in value.context.cgameKeys.down if down then return true end if end for;return false
end function
/// Compute key is down in engine.local_qvm_match; the normal completion returns `cgameKeys.isDown(value.context.cgameKeys, key)`.
/// @param value Record exposing `context`.
/// @param key Key passed as `key` to `mq3.vm.cgame_key_traps.isDown`.
function keyIsDown(value,key) if value==void or value.context==void then return false end if;return cgameKeys.isDown(value.context.cgameKeys,key) end function
/// Synchronize client text input in engine.local_qvm_match; the normal completion returns `true`.
/// @param value Record exposing `context`.
function syncClientTextInput(value)
  if value==void or value.context==void or value.context.clientTextInput==void then return false end if
  value.context.clientTextInput.catcher=cgameKeys.getCatcher(value.context.cgameKeys);value.context.clientTextInput.connectionState=value.context.uiClient.connState;return true
end function
/// Compute client text key in engine.local_qvm_match; the normal completion returns `handled`.
/// @param value Record exposing `context`.
/// @param key Key passed as `key` to `mq3.client.console_input.consoleKey`.
/// @param shift Shift passed as `shift` to `mq3.client.console_input.consoleKey`.
/// @param ctrl Ctrl passed as `ctrl` to `mq3.client.console_input.consoleKey`.
function clientTextKey(value,key,shift,ctrl)
  if not syncClientTextInput(value) then return false end if
  handled=false;if (value.context.clientTextInput.catcher&consoleInput.KEYCATCH_CONSOLE)!=0 then handled=consoleInput.consoleKey(value.context.clientTextInput,key,shift,ctrl) else handled=consoleInput.caughtKey(value.context.clientTextInput,key,shift,ctrl) end if;cgameKeys.setCatcher(value.context.cgameKeys,value.context.clientTextInput.catcher);value.context.uiKeyCatcher=value.context.clientTextInput.catcher;return handled
end function
/// Compute client message escape in engine.local_qvm_match; the normal completion returns `handled`.
/// @param value Record exposing `context`.
function clientMessageEscape(value)
  if not syncClientTextInput(value) then return false end if
  handled=consoleInput.messageKey(value.context.clientTextInput,consoleInput.K_ESCAPE,false,false);cgameKeys.setCatcher(value.context.cgameKeys,value.context.clientTextInput.catcher);value.context.uiKeyCatcher=value.context.clientTextInput.catcher;return handled
end function
/// Compute client text char in engine.local_qvm_match; the normal completion returns `handled`.
/// @param value Record exposing `context`.
/// @param ch Ch passed as `ch` to `mq3.client.console_input.charEvent`.
function clientTextChar(value,ch)
  if not syncClientTextInput(value) then return false end if
  if ch==96 or ch==126 then return true end if
  handled=false;if (value.context.clientTextInput.catcher&consoleInput.KEYCATCH_CONSOLE)!=0 then handled=consoleInput.charEvent(value.context.clientTextInput,value.context.clientTextInput.console,ch) else handled=consoleInput.caughtChar(value.context.clientTextInput,ch) end if;cgameKeys.setCatcher(value.context.cgameKeys,value.context.clientTextInput.catcher);return handled
end function
/// Compute client text state in engine.local_qvm_match; the normal completion returns `value.context.clientTextInput`.
/// @param value Record exposing `context`.
function clientTextState(value) if value==void or value.context==void then return void end if;return value.context.clientTextInput end function
/// Compute client console state in engine.local_qvm_match; the normal completion returns `value.context.clientTextInput.consoleRuntime`.
/// @param value Record exposing `context`.
function clientConsoleState(value) if value==void or value.context==void or value.context.clientTextInput==void then return void end if;return value.context.clientTextInput.consoleRuntime end function
/// Update client console in engine.local_qvm_match; the normal completion returns `true`.
/// @param value Record exposing `context`.
/// @param now Now operand used by `updateClientConsole`; its reads are shown in the implementation.
/// @param frameMsec Frame msec operand used by `updateClientConsole`; its reads are shown in the implementation.
function updateClientConsole(value,now,frameMsec)
  runtime=clientConsoleState(value);if runtime==void then return false end if;runtime.realtime=now;runtime.realFrametime=frameMsec;value.context.clientTextInput.connectionState=value.context.uiClient.connState;runtime.connectionState=value.context.clientTextInput.connectionState;runtime.keyCatchers=value.context.clientTextInput.catcher;runtime.uiOrCgameCatcher=runtime.keyCatchers&(clientConsole.KEYCATCH_UI|clientConsole.KEYCATCH_CGAME);clientConsole.Con_RunConsole(runtime);return true
end function
/// Compute client console view in engine.local_qvm_match; the normal completion returns `clientConsole.Con_DrawConsole(clientConsoleState(value), 640, 640, 480, version)`.
/// @param value Value passed as `value` to `mq3.engine.local_qvm_match.updateClientConsole`.
/// @param now Now passed as `now` to `mq3.engine.local_qvm_match.updateClientConsole`.
/// @param frameMsec Frame msec passed as `frameMsec` to `mq3.engine.local_qvm_match.updateClientConsole`.
/// @param version Version passed as `version` to `mq3.client.cl_console.Con_DrawConsole`.
function clientConsoleView(value,now,frameMsec,version)
  if not updateClientConsole(value,now,frameMsec) then return void end if;return clientConsole.Con_DrawConsole(clientConsoleState(value),640,640,480,version)
end function
/// Compute toggle client console in engine.local_qvm_match; the normal completion returns `toggleConsoleCommand(value.context.commandState, value.context)`.
/// @param value Record exposing `context`.
function toggleClientConsole(value) if value==void or value.context==void then return false end if;return toggleConsoleCommand(value.context.commandState,value.context) end function
/// Begin client message in engine.local_qvm_match; the normal completion returns `true`.
/// @param value Record exposing `context`.
/// @param team Team passed as `team` to `mq3.client.console_input.beginMessage`.
/// @param playerNum Player num passed as `playerNum` to `mq3.client.console_input.beginMessage`.
function beginClientMessage(value,team,playerNum) if value==void or value.context==void then return false end if;consoleInput.beginMessage(value.context.clientTextInput,team,playerNum);syncConsoleInputCatcher(value.context);return true end function
/// Compute ui unique in engine.local_qvm_match; the normal completion returns `(values + [value])`.
/// @param values Values used in `(values + [value])`.
/// @param value Value used in `(values + [value])` and `strings.toLowerAscii(value)`.
function uiUnique(values,value)
  for each current in values if strings.toLowerAscii(current)==strings.toLowerAscii(value) then return values end if end for
  return values+[value]
end function
/// Compute ui desktop mod list in engine.local_qvm_match; the normal completion returns `mods.toArray()`.
/// @param dataRoot Data root used in `(dataRoot == "")` and `fs.joinPath(dataRoot, "..")`.
function uiDesktopModList(dataRoot)
  if dataRoot=="" then return [] end if
  installRoot=fs.joinPath(dataRoot,"..")
  names=try(fs.listDir(installRoot));if names is error then return [] end if
  mods=lists.List.withCapacity(8)
  for each name in names
    if modStack.validName(name) and not stringEqualsIgnoreCaseAscii(name,"baseq3") then
      directory=desktopFilePath(installRoot,name)
      if directory!="" and modStack.regularDirectory(directory) then
        candidates=try(fs.listDir(directory))
        if not (candidates is error) then
          for each leaf in candidates
            if strings.endsWith(strings.toLowerAscii(leaf),".pk3") and fs.isFile(fs.joinPath(directory,leaf)) then
              description=name;descPath=fs.joinPath(directory,"description.txt")
              if fs.isFile(descPath) then
                size=try(fs.fileSize(descPath))
                if not (size is error) and size<=4096 then
                  text=try(fs.readAllText(descPath))
                  if not (text is error) then
                    lines=strings.split(text,"\n")
                    if len(lines)>0 and strings.trim(lines[0])!="" then description=commands.copyString(strings.trim(lines[0]),49) end if
                  end if
                end if
              end if
              mods.add(name);mods.add(description);break
            end if
          end for
        end if
      end if
    end if
  end for
  return mods.toArray()
end function
/// Compute ui loose demos in engine.local_qvm_match; the normal completion returns `result`.
/// @param result Values passed as `values` to `mq3.engine.local_qvm_match.uiUnique`.
/// @param dataRoot Root passed as `root` to `mq3.engine.local_qvm_match.desktopFilePath`.
/// @param wanted Wanted used in `(wanted == "")` and `strings.endsWith(lowerName, wanted)`.
function uiLooseDemos(result,dataRoot,wanted)
  directory=desktopFilePath(dataRoot,"demos")
  if directory=="" or not fs.isDir(directory) then return result end if
  names=try(fs.listDir(directory));if names is error then return result end if
  for each name in names
    lowerName=strings.toLowerAscii(name)
    if (wanted=="" or strings.endsWith(lowerName,wanted)) and fs.isFile(fs.joinPath(directory,name)) then result=uiUnique(result,name) end if
  end for
  return result
end function

/// Compute ui file list in engine.local_qvm_match; the normal completion returns `result`.
/// @param context Record exposing `uiLanCacheHost`, `archive`.
/// @param path Path used in `(path == "demos")` and `(path == "$modlist")`.
/// @param extension Extension used in `strings.toLowerAscii(extension)`.
function uiFileList(context,path,extension)
  dataRoot=context.uiLanCacheHost.context.root
  if path=="$modlist" then return uiDesktopModList(dataRoot) end if
  prefix=path;if prefix!="" and not strings.endsWith(prefix,"/") then prefix=prefix+"/" end if
  lowerPrefix=strings.toLowerAscii(prefix);wanted=strings.toLowerAscii(extension);directories=wanted=="/"
  if wanted!="" and not directories and wanted[0]!="." then wanted="."+wanted end if
  result=[]
  for each entry in context.archive.entries
    lowerName=strings.toLowerAscii(entry.name)
    if strings.startsWith(lowerName,lowerPrefix) and len(entry.name)>len(prefix) then
      relative=decode(slice(bytes(entry.name),len(bytes(prefix)),len(bytes(entry.name))-len(bytes(prefix))))
      parts=strings.split(relative,"/")
      if directories then
        if len(parts)>1 and parts[0]!="" then result=uiUnique(result,parts[0]) end if
      else if len(parts)==1 and (wanted=="" or strings.endsWith(lowerName,wanted)) then
        result=result+[relative]
      end if
    end if
  end for
  if path=="demos" and not directories then
    result=uiLooseDemos(result,dataRoot,wanted)
    if context.archive.modArchive!=void and dataRoot!="" then
      result=uiLooseDemos(result,fs.joinPath(fs.joinPath(dataRoot,".."),"baseq3"),wanted)
    end if
  end if
  return result
end function
/// Return `mq3.renderer.command_queue.setColor(context.renderQueue, color)` from `engine.local_qvm_match.uiSetColor`.
/// @param context Record exposing `renderQueue`.
/// @param color Rgba passed as `rgba` to `mq3.renderer.command_queue.setColor`.
function uiSetColor(context,color) return renderQueue.setColor(context.renderQueue,color) end function
/// Return `mq3.renderer.command_queue.stretchPicValues(context.renderQueue, values, shader)` from `engine.local_qvm_match.uiStretchPic`.
/// @param context Record exposing `renderQueue`.
/// @param values Values passed as `values` to `mq3.renderer.command_queue.stretchPicValues`.
/// @param shader Shader handle passed as `shaderHandle` to `mq3.renderer.command_queue.stretchPicValues`.
function uiStretchPic(context,values,shader) return renderQueue.stretchPicValues(context.renderQueue,values,shader) end function
/// Return `mq3.client.ui_lan_cache.load(context.uiLan, context.uiLanCacheHost)` from `engine.local_qvm_match.uiLanLoad`.
/// @param context Record exposing `uiLan`, `uiLanCacheHost`.
function uiLanLoad(context) return uiLanCache.load(context.uiLan,context.uiLanCacheHost) end function
/// Return `mq3.client.ui_lan_cache.save(context.uiLan, context.uiLanCacheHost)` from `engine.local_qvm_match.uiLanSave`.
/// @param context Record exposing `uiLan`, `uiLanCacheHost`.
function uiLanSave(context) return uiLanCache.save(context.uiLan,context.uiLanCacheHost) end function
/// Return `mq3.client.ui_lan_browser.add(context.uiLan, source, name, address)` from `engine.local_qvm_match.uiLanAdd`.
/// @param context Record exposing `uiLan`.
/// @param source Source passed as `source` to `mq3.client.ui_lan_browser.add`.
/// @param name Name passed as `name` to `mq3.client.ui_lan_browser.add`.
/// @param address Address passed as `address` to `mq3.client.ui_lan_browser.add`.
function uiLanAdd(context,source,name,address) return uiLan.add(context.uiLan,source,name,address) end function
/// Return `mq3.client.ui_lan_browser.remove(context.uiLan, source, address)` from `engine.local_qvm_match.uiLanRemove`.
/// @param context Record exposing `uiLan`.
/// @param source Source passed as `source` to `mq3.client.ui_lan_browser.remove`.
/// @param address Address passed as `address` to `mq3.client.ui_lan_browser.remove`.
function uiLanRemove(context,source,address) return uiLan.remove(context.uiLan,source,address) end function
/// Return `mq3.client.ui_lan_browser.pingCount(context.uiLan)` from `engine.local_qvm_match.uiLanPingCount`.
/// @param context Record exposing `uiLan`.
function uiLanPingCount(context) return uiLan.pingCount(context.uiLan) end function
/// Return `mq3.client.ui_lan_browser.clearPing(context.uiLan, index)` from `engine.local_qvm_match.uiLanClearPing`.
/// @param context Record exposing `uiLan`.
/// @param index Index passed as `index` to `mq3.client.ui_lan_browser.clearPing`.
function uiLanClearPing(context,index) return uiLan.clearPing(context.uiLan,index) end function
/// Return `mq3.client.ui_lan_browser.getPing(context.uiLan, index)` from `engine.local_qvm_match.uiLanPing`.
/// @param context Record exposing `uiLan`.
/// @param index Index passed as `index` to `mq3.client.ui_lan_browser.getPing`.
function uiLanPing(context,index) return uiLan.getPing(context.uiLan,index) end function
/// Return `mq3.client.ui_lan_browser.getPingInfo(context.uiLan, index)` from `engine.local_qvm_match.uiLanPingInfo`.
/// @param context Record exposing `uiLan`.
/// @param index Index passed as `index` to `mq3.client.ui_lan_browser.getPingInfo`.
function uiLanPingInfo(context,index) return uiLan.getPingInfo(context.uiLan,index) end function
/// Return `mq3.client.ui_lan_browser.count(context.uiLan, source)` from `engine.local_qvm_match.uiLanServerCount`.
/// @param context Record exposing `uiLan`.
/// @param source Source passed as `source` to `mq3.client.ui_lan_browser.count`.
function uiLanServerCount(context,source) return uiLan.count(context.uiLan,source) end function
/// Return `mq3.client.ui_lan_browser.address(context.uiLan, source, index)` from `engine.local_qvm_match.uiLanServerAddress`.
/// @param context Record exposing `uiLan`.
/// @param source Source passed as `source` to `mq3.client.ui_lan_browser.address`.
/// @param index Index passed as `index` to `mq3.client.ui_lan_browser.address`.
function uiLanServerAddress(context,source,index) return uiLan.address(context.uiLan,source,index) end function
/// Return `mq3.client.ui_lan_browser.serverInfo(context.uiLan, source, index)` from `engine.local_qvm_match.uiLanServerInfo`.
/// @param context Record exposing `uiLan`.
/// @param source Source passed as `source` to `mq3.client.ui_lan_browser.serverInfo`.
/// @param index Index passed as `index` to `mq3.client.ui_lan_browser.serverInfo`.
function uiLanServerInfo(context,source,index) return uiLan.serverInfo(context.uiLan,source,index) end function
/// Return `mq3.client.ui_lan_browser.serverPing(context.uiLan, source, index)` from `engine.local_qvm_match.uiLanServerPing`.
/// @param context Record exposing `uiLan`.
/// @param source Source passed as `source` to `mq3.client.ui_lan_browser.serverPing`.
/// @param index Index passed as `index` to `mq3.client.ui_lan_browser.serverPing`.
function uiLanServerPing(context,source,index) return uiLan.serverPing(context.uiLan,source,index) end function
/// Return `mq3.client.ui_lan_browser.markVisible(context.uiLan, source, index, visible)` from `engine.local_qvm_match.uiLanMarkVisible`.
/// @param context Record exposing `uiLan`.
/// @param source Source passed as `source` to `mq3.client.ui_lan_browser.markVisible`.
/// @param index Index passed as `index` to `mq3.client.ui_lan_browser.markVisible`.
/// @param visible Visible passed as `visible` to `mq3.client.ui_lan_browser.markVisible`.
function uiLanMarkVisible(context,source,index,visible) return uiLan.markVisible(context.uiLan,source,index,visible) end function
/// Return `mq3.client.ui_lan_browser.isVisible(context.uiLan, source, index)` from `engine.local_qvm_match.uiLanIsVisible`.
/// @param context Record exposing `uiLan`.
/// @param source Source passed as `source` to `mq3.client.ui_lan_browser.isVisible`.
/// @param index Index passed as `index` to `mq3.client.ui_lan_browser.isVisible`.
function uiLanIsVisible(context,source,index) return uiLan.isVisible(context.uiLan,source,index) end function
/// Compute ui lan update pings in engine.local_qvm_match; the normal completion returns `uiLanQueries.updateVisiblePings(context.uiLanQueries, source)`.
/// @param context Record exposing `uiLanQueries`, `uiLan`, `now`.
/// @param source Source passed as `source` to `mq3.client.ui_lan_browser.updateVisiblePings`.
function uiLanUpdatePings(context,source)
  if context.uiLanQueries==void then return uiLan.updateVisiblePings(context.uiLan,source) end if
  uiLanQueries.setRealtime(context.uiLanQueries,context.now);return uiLanQueries.updateVisiblePings(context.uiLanQueries,source)
end function
/// Return `mq3.client.ui_lan_browser.resetPings(context.uiLan, source)` from `engine.local_qvm_match.uiLanResetPings`.
/// @param context Record exposing `uiLan`.
/// @param source Source passed as `source` to `mq3.client.ui_lan_browser.resetPings`.
function uiLanResetPings(context,source) return uiLan.resetPings(context.uiLan,source) end function
/// Compute ui lan server status in engine.local_qvm_match; the normal completion returns `uiLanQueries.serverStatus(context.uiLanQueries, address)`.
/// @param context Record exposing `uiLanQueries`, `uiLan`, `now`.
/// @param address Address passed as `address` to `mq3.client.ui_lan_browser.serverStatus`.
function uiLanServerStatus(context,address)
  if context.uiLanQueries==void then return uiLan.serverStatus(context.uiLan,address) end if
  uiLanQueries.setRealtime(context.uiLanQueries,context.now);return uiLanQueries.serverStatus(context.uiLanQueries,address)
end function
/// Return `mq3.client.ui_lan_browser.compare(context.uiLan, source, sortKey, sortDir, first, second)` from `engine.local_qvm_match.uiLanCompare`.
/// @param context Record exposing `uiLan`.
/// @param source Source passed as `source` to `mq3.client.ui_lan_browser.compare`.
/// @param sortKey Sort key passed as `sortKey` to `mq3.client.ui_lan_browser.compare`.
/// @param sortDir Sort dir passed as `sortDir` to `mq3.client.ui_lan_browser.compare`.
/// @param first First passed as `first` to `mq3.client.ui_lan_browser.compare`.
/// @param second Second passed as `second` to `mq3.client.ui_lan_browser.compare`.
function uiLanCompare(context,source,sortKey,sortDir,first,second) return uiLan.compare(context.uiLan,source,sortKey,sortDir,first,second) end function
/// Return `mq3.engine.local_qvm_match.registerTypedAsset(context, "sound", name)` from `engine.local_qvm_match.uiRegisterSound`.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.registerTypedAsset`.
/// @param name Name passed as `name` to `mq3.engine.local_qvm_match.registerTypedAsset`.
/// @param compressed Reserved argument; this implementation does not read its value.
function uiRegisterSound(context,name,compressed) return registerTypedAsset(context,"sound",name) end function
/// Update `context.soundCommands` in engine.local_qvm_match.
///
/// Direct state writes: `context.soundCommands`.
/// @param context Record exposing `soundCommands`. Updated in place: `soundCommands`.
/// @param handle Handle passed as `handle` to `mq3.engine.local_qvm_match.soundEvent`.
/// @param channel Channel passed as `channel` to `mq3.engine.local_qvm_match.soundEvent`.
function uiLocalSound(context,handle,channel) context.soundCommands=context.soundCommands+[soundEvent("local",-1,channel,handle,void,void,void,false,"","")];return void end function
/// Update `context.soundCommands` in engine.local_qvm_match.
///
/// Direct state writes: `context.soundCommands`.
/// @param context Record exposing `soundCommands`. Updated in place: `soundCommands`.
function uiStopMusic(context) context.soundCommands=context.soundCommands+[soundEvent("stopMusic",-1,0,0,void,void,void,false,"","")];return void end function
/// Update `context.soundCommands` in engine.local_qvm_match.
///
/// Direct state writes: `context.soundCommands`.
/// @param context Record exposing `soundCommands`. Updated in place: `soundCommands`.
/// @param intro Text passed as `text` to `mq3.engine.local_qvm_match.soundEvent`.
/// @param trackLoop Text 2 passed as `text2` to `mq3.engine.local_qvm_match.soundEvent`.
function uiStartMusic(context,intro,trackLoop) context.soundCommands=context.soundCommands+[soundEvent("music",-1,0,0,void,void,void,false,intro,trackLoop)];return void end function
/// Compute engine.local_qvm_match.uiRealTime as `[n.quotient(context.now, 1000), bytes(uiMedia.QTIME_SIZE, 0)]`.
/// @param context Record exposing `now`.
function uiRealTime(context) return [n.quotient(context.now,1000),bytes(uiMedia.QTIME_SIZE,0)] end function
/// Compute ui remap in engine.local_qvm_match.
/// @param context Context passed as `context` to `mq3.engine.local_qvm_match.remapRendererShader`.
/// @param oldName Old name passed as `oldName` to `mq3.engine.local_qvm_match.remapRendererShader`.
/// @param newName New name passed as `newName` to `mq3.engine.local_qvm_match.remapRendererShader`.
/// @param timeOffset Time offset passed as `timeOffset` to `mq3.engine.local_qvm_match.remapRendererShader`.
function uiRemap(context,oldName,newName,timeOffset) remapRendererShader(context,oldName,newName,timeOffset);return void end function
/// Compute engine.local_qvm_match.uiCdKey as `"0000000000000000"`.
/// @param context Reserved argument; this implementation does not read its value.
function uiCdKey(context) return "0000000000000000" end function
/// Compute engine.local_qvm_match.uiSetCdKey as `void`.
/// @param context Reserved argument; this implementation does not read its value.
/// @param key Reserved argument; this implementation does not read its value.
function uiSetCdKey(context,key) return void end function
/// Compute engine.local_qvm_match.uiVerifyCdKey as `true`.
/// @param context Reserved argument; this implementation does not read its value.
/// @param key Reserved argument; this implementation does not read its value.
/// @param checksum Reserved argument; this implementation does not read its value.
function uiVerifyCdKey(context,key,checksum) return true end function
/// Compute engine.local_qvm_match.uiSeek as `- 1`.
/// @param context Reserved argument; this implementation does not read its value.
/// @param handle Reserved argument; this implementation does not read its value.
/// @param offset Reserved argument; this implementation does not read its value.
/// @param origin Reserved argument; this implementation does not read its value.
function uiSeek(context,handle,offset,origin) return -1 end function
/// Compute engine.local_qvm_match.uiPb as `void`.
/// @param context Reserved argument; this implementation does not read its value.
/// @param status Reserved argument; this implementation does not read its value.
function uiPb(context,status) return void end function
/// Return `mq3.client.cinematic_runtime.play(context.cinematics, name, x, y, w, h, bits, context.now)` from `engine.local_qvm_match.uiPlayCinematic`.
/// @param context Record exposing `cinematics`, `now`.
/// @param name Name passed as `name` to `mq3.client.cinematic_runtime.play`.
/// @param x X passed as `x` to `mq3.client.cinematic_runtime.play`.
/// @param y Y passed as `y` to `mq3.client.cinematic_runtime.play`.
/// @param w Width passed as `width` to `mq3.client.cinematic_runtime.play`.
/// @param h Height passed as `height` to `mq3.client.cinematic_runtime.play`.
/// @param bits Bits passed as `bits` to `mq3.client.cinematic_runtime.play`.
function uiPlayCinematic(context,name,x,y,w,h,bits) return cinematics.play(context.cinematics,name,x,y,w,h,bits,context.now) end function
/// Return `mq3.client.cinematic_runtime.stop(context.cinematics, handle)` from `engine.local_qvm_match.uiCinematicStop`.
/// @param context Record exposing `cinematics`.
/// @param handle Handle passed as `handle` to `mq3.client.cinematic_runtime.stop`.
function uiCinematicStop(context,handle) return cinematics.stop(context.cinematics,handle) end function
/// Return `mq3.client.cinematic_runtime.run(context.cinematics, handle, context.now)` from `engine.local_qvm_match.uiCinematicRun`.
/// @param context Record exposing `cinematics`, `now`.
/// @param handle Handle passed as `handle` to `mq3.client.cinematic_runtime.run`.
function uiCinematicRun(context,handle) return cinematics.run(context.cinematics,handle,context.now) end function
/// Compute ui cinematic draw in engine.local_qvm_match.
/// @param context Record exposing `cinematics`.
/// @param handle Handle passed as `handle` to `mq3.client.cinematic_runtime.draw`.
function uiCinematicDraw(context,handle) cinematics.draw(context.cinematics,handle);return void end function
/// Compute ui cinematic extents in engine.local_qvm_match.
/// @param context Record exposing `cinematics`.
/// @param handle Handle passed as `handle` to `mq3.client.cinematic_runtime.setExtents`.
/// @param x X passed as `x` to `mq3.client.cinematic_runtime.setExtents`.
/// @param y Y passed as `y` to `mq3.client.cinematic_runtime.setExtents`.
/// @param w Width passed as `width` to `mq3.client.cinematic_runtime.setExtents`.
/// @param h Height passed as `height` to `mq3.client.cinematic_runtime.setExtents`.
function uiCinematicExtents(context,handle,x,y,w,h) cinematics.setExtents(context.cinematics,handle,x,y,w,h);return void end function

/// Compute extended ui in engine.local_qvm_match; the normal completion returns `error(7643, ("local QVM match: unsupported retail UI trap " + str(op)))`.
/// @param context Record exposing `scene`.
/// @param vm Record exposing `data`.
/// @param base Address passed as `address` to `mq3.vm.syscall_common.argument`.
/// @param op Op used in `str(op)` and `(op == 22)`.
function extendedUi(context,vm,base,op)
  if op==22 then at=common.pointer(vm,common.argument(vm,base,1),140,"UI refEntity");sceneQueue.addEntity(context.scene,n.readI32(vm.data,at),slice(vm.data,at,140));return 0 end if
  if op==23 then return addCgamePolys(context,vm,base,false) end if
  if op==24 then
    origin=common.readFloatVector(vm,common.argument(vm,base,1),3,"UI light origin")
    sceneQueue.addDynamicLight(context.scene,origin,n.bitsFloat(common.argument(vm,base,2)),n.bitsFloat(common.argument(vm,base,3)),n.bitsFloat(common.argument(vm,base,4)),n.bitsFloat(common.argument(vm,base,5)),false);return 0
  end if
  if op==25 then return captureRenderView(context,vm,common.argument(vm,base,1)) end if
  if op==29 then return lerpModelTag(context,vm,base) end if
  if op==30 then return 0 end if
  if op==55 then return registerQvmFont(context,vm,base) end if
  if op==56 then
    mins=common.pointer(vm,common.argument(vm,base,2),12,"UI model mins");maxs=common.pointer(vm,common.argument(vm,base,3),12,"UI model maxs")
    bounds=rendererModelBounds(context,common.argument(vm,base,1));writeVector(vm.data,mins,bounds[0]);writeVector(vm.data,maxs,bounds[1]);return 0
  end if
  if op==57 then return pcAddDefine(context,vm,base) end if
  if op==58 then return pcLoadSource(context,vm,base) end if
  if op==59 then return pcFreeSource(context,vm,base) end if
  if op==60 then return pcReadToken(context,vm,base) end if
  if op==61 then return pcSourceLine(context,vm,base) end if
  return error(7643,"local QVM match: unsupported retail UI trap "+str(op))
end function

/// Update `value.ui` in engine.local_qvm_match; the normal completion returns `ui`.
///
/// Direct state writes: `value.ui`.
/// @param value Record exposing `context`, `runtime`. Updated in place: `ui`.
function bootUi(value)
  if value==void then return fail("match is required before UI initialization") end if
  context=value.context;context.uiLanIngress=uiLanIngress.create(context.uiLan);if context.uiLanIngress is error then return context.uiLanIngress end if
  live=try(uiLanUdp.open(context.uiLanIngress));if not (live is error) then context.uiLanUdp=live;context.uiLanQueries=uiLanQueries.create(context.uiLan,context.uiLanIngress,uiLanUdp.services(live)) end if
  shared=common.services(context.cvars,context.commandState,context);shared.printFn=emitPrint;shared.errorFn=emitError;shared.millisecondsFn=milliseconds;shared.consoleFn=consoleCommand
  shared.openFn=openFile;shared.readFn=readFile;shared.writeFn=writeFile;shared.closeFn=closeFile
  syscalls=uiSyscall.services(shared,context);syscalls.client.clipboardFn=uiClipboard;syscalls.client.glconfigFn=glconfigBytes;syscalls.client.clientStateFn=uiClientState;syscalls.client.configStringFn=uiConfigString
  syscalls.keys.keyNameFn=uiKeyName;syscalls.keys.bindingFn=uiBinding;syscalls.keys.setBindingFn=uiSetBinding;syscalls.keys.isDownFn=uiKeyDown;syscalls.keys.getOverstrikeFn=uiGetOverstrike;syscalls.keys.setOverstrikeFn=uiSetOverstrike;syscalls.keys.clearFn=uiClearKeysProductive;syscalls.keys.getCatcherFn=uiGetCatcher;syscalls.keys.setCatcherFn=uiSetCatcher
  syscalls.renderer.registerModelFn=registerModel;syscalls.renderer.registerSkinFn=registerSkin;syscalls.renderer.registerShaderNoMipFn=registerShaderNoMip;syscalls.renderer.clearSceneFn=clearScene;syscalls.renderer.setColorFn=uiSetColor;syscalls.renderer.drawStretchPicFn=uiStretchPic;syscalls.renderer.updateScreenFn=updateScreen
  syscalls.lan.loadFn=uiLanLoad;syscalls.lan.saveFn=uiLanSave;syscalls.lan.addFn=uiLanAdd;syscalls.lan.removeFn=uiLanRemove;syscalls.lan.pingQueueCountFn=uiLanPingCount;syscalls.lan.clearPingFn=uiLanClearPing;syscalls.lan.getPingFn=uiLanPing;syscalls.lan.getPingInfoFn=uiLanPingInfo;syscalls.lan.serverCountFn=uiLanServerCount;syscalls.lan.serverAddressFn=uiLanServerAddress;syscalls.lan.serverInfoFn=uiLanServerInfo;syscalls.lan.serverPingFn=uiLanServerPing;syscalls.lan.markVisibleFn=uiLanMarkVisible;syscalls.lan.isVisibleFn=uiLanIsVisible;syscalls.lan.updatePingsFn=uiLanUpdatePings;syscalls.lan.resetPingsFn=uiLanResetPings;syscalls.lan.serverStatusFn=uiLanServerStatus;syscalls.lan.compareFn=uiLanCompare
  syscalls.fileListFn=uiFileList;syscalls.memoryRemainingFn=memoryRemaining;syscalls.extendedFn=extendedUi;media=uiMedia.services(context);media.sound.registerFn=uiRegisterSound;media.sound.startLocalFn=uiLocalSound;media.sound.stopBackgroundFn=uiStopMusic;media.sound.startBackgroundFn=uiStartMusic
  media.cinematic.playFn=uiPlayCinematic;media.cinematic.stopFn=uiCinematicStop;media.cinematic.runFn=uiCinematicRun;media.cinematic.drawFn=uiCinematicDraw;media.cinematic.setExtentsFn=uiCinematicExtents
  media.platform.realTimeFn=uiRealTime;media.platform.remapShaderFn=uiRemap;media.platform.getCdKeyFn=uiCdKey;media.platform.setCdKeyFn=uiSetCdKey;media.platform.verifyCdKeyFn=uiVerifyCdKey;media.platform.seekFn=uiSeek;media.platform.pbStatusFn=uiPb;syscalls.mediaServices=media
  host=uiVm.services(value.runtime,uiSyscall.callback(syscalls),loadClientVm,callVm,freeVm);ui=uiVm.create(host);if ui is error then if context.uiLanUdp!=void then uiLanUdp.close(context.uiLanUdp);context.uiLanUdp=void end if;return ui end if
  initialized=uiVm.initialize(ui,context.uiClient.connState,0,1);if initialized is error then if context.uiLanUdp!=void then uiLanUdp.close(context.uiLanUdp);context.uiLanUdp=void end if;return initialized end if;value.ui=ui;return ui
end function
/// Compute refresh ui in engine.local_qvm_match; the normal completion returns `result`.
/// @param value Record exposing `ui`, `context`.
/// @param time Value passed as `value` to `mq3.client.ui_lan_queries.setRealtime`.
function refreshUi(value,time) if value==void or value.ui==void then return fail("UI is not active") end if;value.context.now=time;if value.context.uiLanQueries!=void then uiLanQueries.setRealtime(value.context.uiLanQueries,time) end if;if value.context.uiLanUdp!=void then uiLanUdp.pump(value.context.uiLanUdp,64) end if;result=uiVm.refresh(value.ui,time);if not (result is error) then renderQueue.snapshot(value.context.renderQueue);value.context.uiFrames=value.context.uiFrames+1 end if;return result end function
/// Set ui menu in engine.local_qvm_match; the normal completion returns `uiVm.setActiveMenu(value.ui, menu)`.
/// @param value Record exposing `ui`.
/// @param menu Menu passed as `menu` to `mq3.client.ui_vm.setActiveMenu`.
function setUiMenu(value,menu) if value==void or value.ui==void then return fail("UI is not active") end if;return uiVm.setActiveMenu(value.ui,menu) end function

/// Set ui connection in engine.local_qvm_match.
/// @param value Record exposing `context`.
/// @param connState Conn state passed as `connState` to `mq3.client.ui_host_lifecycle.createClientState`.
/// @param connectPacketCount Connect packet count passed as `connectPacketCount` to `mq3.client.ui_host_lifecycle.createClientState`.
/// @param servername Servername passed as `servername` to `mq3.client.ui_host_lifecycle.createClientState`.
/// @param messageString Message string passed as `messageString` to `mq3.client.ui_host_lifecycle.createClientState`.
function setUiConnection(value,connState,connectPacketCount,servername,messageString)
  if value==void or value.context==void then return fail("match is required for UI connection state") end if
  current=value.context.uiClient;next=uiHost.createClientState(connState,connectPacketCount,current.clientNum,servername,current.updateInfoString,messageString);if next is error then return next end if
  value.context.uiClient=next;return void
end function
/// Set ui update info in engine.local_qvm_match.
/// @param value Record exposing `context`.
/// @param updateInfoString Update info string used in `typeof(updateInfoString)` and `(typeof(updateInfoString) != "string")`.
function setUiUpdateInfo(value,updateInfoString)
  if value==void or value.context==void or typeof(updateInfoString)!="string" then return fail("match and update info are required") end if
  value.context.uiClient.updateInfoString=updateInfoString;return void
end function

/// Compute shutdown in engine.local_qvm_match.
/// @param value Record exposing `context`, `ui`, `cgame`, `game`.
function shutdown(value) if value!=void then cinematics.closeAll(value.context.cinematics);if value.ui!=void then cgameKeys.setCatcher(value.context.cgameKeys,cgameKeys.getCatcher(value.context.cgameKeys)&(~uiHost.KEYCATCH_UI));uiVm.shutdown(value.ui) end if;if value.context.uiLanUdp!=void then ignored=try(uiLanUdp.close(value.context.uiLanUdp));value.context.uiLanUdp=void end if;if value.cgame!=void then nativeCgameMain.shutdown(value.context.nativeMain,true);cgameVm.shutdown(value.cgame) end if;result=void;if value.game!=void then result=gameVm.shutdown(value.game) end if;aiChatProfiles.clearCache(value.context.aiChat);aiChatStrings.clear(value.context.aiChatStrings);aiChatMatches.clear(value.context.aiChatMatches);aiConsoleMessages.shutdown(value.context.aiConsole);aiResourcePools.shutdown(value.context.aiResources);aiLevelItems.shutdown(value.context.aiLevelItems);aiItemWeights.shutdown(value.context.aiItemWeights);aiWeaponWeights.shutdown(value.context.aiWeaponWeights);return result end if;return void end function
