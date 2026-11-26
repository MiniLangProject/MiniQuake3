// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// g_utils lifecycle and target selection. Game fields grow with ported rules;
// the full network entityState lives in s, the server collision fields in r.
package mq3.game.entities
import mq3.game.cvar_maintenance as cvarMaintenance
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
import mq3.game.snapshot as snapshot
import mq3.game.constants as c
import mq3.game.movement as movement
import mq3.server.world as sv
import mq3.compat.numeric as n
import std.string as strings
/// `Client` record for entities, containing `ps`, `team`, `cmdAngles`, `noclip` and `damage_armor` and related fields.
struct Client
  /// Authoritative player state used for movement, prediction, and snapshot delivery.
  ps
  /// Team assignment associated with the client, bot, or action.
  team
  /// View-angle values supplied by the current input command.
  cmdAngles
  /// Nonzero when movement bypasses normal world collision.
  noclip
  /// Accumulated damage absorbed by armor before the damage feedback is emitted.
  damage_armor
  /// Accumulated damage applied to health before the damage feedback is emitted.
  damage_blood
  /// Accumulated knockback contribution of recent damage.
  damage_knockback
  /// Direction or position used to calculate the incoming-damage indicator.
  damage_from
  /// Nonzero when the accumulated damage came from the world rather than an ordinary attacker.
  damage_fromWorld
  /// Client identifier credited with the most recent incoming damage.
  lasthurt_client
  /// Cause-of-damage identifier for the most recent incoming damage.
  lasthurt_mod
  /// Timestamp at which this player last damaged the flag carrier.
  lasthurtcarrier
  /// Number of accuracy-eligible weapon hits credited to the client.
  accuracy_hits
  /// Active grappling-hook entity associated with the client.
  hook
  /// Client connection state used to distinguish disconnected, connecting, and active clients.
  connected
  /// Spectator mode selected from the SPECTATOR_* constants.
  spectatorState
  /// Client slot being followed by a spectator.
  spectatorClient
  /// Timestamp used to order spectators waiting to enter play.
  spectatorTime
  /// Game timestamp at which the client entered play.
  enterTime
  /// Number of accuracy-eligible shots fired by the client.
  accuracy_shots
  /// Player name advertised in user information and score/chat messages.
  netname
  /// Nonzero when this client or match is ready to leave the intermission.
  readyToExit
  /// Client identifier of the most recent player killed by this client.
  lastkilled_client
  /// Timestamp associated with the client or bot next respawn decision.
  respawnTime
  /// Timestamp at which the current player award/reward display expires.
  rewardTime
  /// Timestamp of the most recent kill credited to this client.
  lastKillTime
  /// Weapon selection requested by the input command.
  cmdWeapon
  /// Timestamp at which this player last killed an enemy flag carrier.
  lastfraggedcarrier
  /// Number of enemy flag-carrier kills credited to the player.
  fragcarrier
  /// Count of flag-carrier defense awards credited to the player.
  carrierdefense
  /// Count of base-defense awards credited to the player.
  basedefense
  /// Nonzero when the client is allowed to predict item pickups.
  predictItemPickup
  /// Number of flag captures credited to the player.
  captures
  /// Number of own-flag recoveries credited to the player.
  flagrecovery
  /// Number of capture assists credited to the player.
  assists
  /// Timestamp at which the player last returned its team flag.
  lastreturnedflag
  /// Timestamp at which the player started carrying the flag.
  flagsince
  /// Nonzero when this client is the local listen-server client.
  localClient
  /// Nonzero while selecting or performing the client first spawn.
  initialSpawn
  /// Nonzero when player movement uses a fixed simulation step.
  pmoveFixed
  /// Maximum normal health used when spawning or replenishing the client.
  maxHealth
  /// Team participation state used by spawn/team rules.
  teamStateState
  /// Team-location identifier advertised for the client.
  teamStateLocation
  /// Number of global votes initiated by the client.
  voteCount
  /// Number of team votes initiated by the client.
  teamVoteCount
  /// Nonzero when this client requests team-overlay information.
  teamInfo
  /// Tournament wins retained in the client session.
  wins
  /// Tournament losses retained in the client session.
  losses
  /// Nonzero when this client is the designated leader of its team.
  teamLeader
  /// Server-time value carried by the current input command.
  cmdServerTime
  /// Button bits supplied by the current input command.
  cmdButtons
  /// Forward/backward movement request carried by the input command.
  cmdForwardmove
  /// Right/left movement request carried by the input command.
  cmdRightmove
  /// Up/down movement request carried by the input command.
  cmdUpmove
  /// Timestamp of the most recently received user command.
  lastCmdTime
  /// Button bits from the current user command.
  buttons
  /// Button bits from the preceding user command.
  oldbuttons
  /// Button presses retained until game logic consumes the transition.
  latched_buttons
  /// Previously recorded origin, used to compare or interpolate movement.
  oldOrigin
  /// Consecutive accuracy/hit count used by player award logic.
  accurateCount
  /// Deadline after which an inactive client is removed or moved to spectators.
  inactivityTime
  /// Nonzero after the client has received its inactivity warning.
  inactivityWarning
  /// Game timestamp at which the player runs out of breathable air.
  airOutTime
  /// Nonzero while the weapon firing control is held across frames.
  fireHeld
  /// Deadline before which the client may not switch teams again.
  switchTeamTime
  /// Unconsumed time accumulated for periodic client effects.
  timeResidual
  /// Persistent team-arena powerup currently associated with the client.
  persistantPowerup
  /// Per-weapon timing state used while replenishing or consuming ammunition.
  ammoTimes
  /// Expiration time of the mission-pack invulnerability effect.
  invulnerabilityTime
  /// Identifier linking a client portal source and destination.
  portalID
end struct
/// `Entity` record for entities, containing `slot`, `s`, `r`, `client` and `inuse` and related fields.
struct Entity
  /// Index of the entity/client slot represented by this record.
  slot
  /// Network-visible entity state used to build snapshots for clients.
  s
  /// Engine-shared entity state used for world linking, collision, and visibility.
  r
  /// Client record attached to a player entity, or void for a non-player entity.
  client
  /// Nonzero when this entity, client, or bot record currently represents a live allocated object.
  inuse
  /// Map entity class name used to select a spawn function.
  classname
  /// Game timestamp at which the entity slot was last released.
  freetime
  /// Nonzero when ordinary entity cleanup must retain this entity slot.
  neverFree
  /// Timestamp of the most recently recorded entity event.
  eventTime
  /// Nonzero when the entity should be freed after its transient event expires.
  freeAfterEvent
  /// Entity callback invoked when another entity touches it.
  touch
  /// Target-name selector identifying entities activated by this entity.
  target
  /// Name by which other map entities can target this entity.
  targetname
  /// Class-specific bit flags read from the map entity definition.
  spawnflags
  /// Primary model resource name read from a map entity definition.
  model
  /// Secondary model resource name read from a map entity definition.
  model2
  /// Movement or travel speed used by this game object.
  speed
  /// Text associated with the map entity or trigger action.
  message
  /// Team assignment associated with the client, bot, or action.
  team
  /// Configured delay between repeated uses of the map entity.
  wait
  /// Random variation added to the map entity activation/repeat delay.
  random
  /// Class-specific count/amount read from the map entity definition.
  count
  /// Current health value used by damage, death, and healing logic.
  health
  /// Damage amount applied by this entity, attack, or operation.
  damage
  /// Shader name selected for a map-triggered remapping operation.
  targetShaderName
  /// Replacement shader name applied by the map-triggered remapping operation.
  targetShaderNewName
  /// FL_* game entity flags controlling gameplay behavior.
  flags
  /// Normalized direction along which the entity moves or fires.
  movedir
  /// Game timestamp at which the entity think callback should next run.
  nextthink
  /// Entity callback invoked when its nextthink deadline is reached.
  think
  /// Entity callback invoked when the entity is activated by another object.
  use
  /// Entity that triggered the current activation chain.
  activator
  /// Nonzero when the entity should be unlinked after its transient event expires.
  unlinkAfterEvent
  /// Nonzero when generic entity physics should advance this object.
  physicsObject
  /// Registered sound index used by this map entity.
  noise_index
  /// Deadline preventing repeated fly/mover sound emission.
  fly_sound_debounce_time
  /// Next path or train entity in the mover route.
  nextTrain
  /// Nonzero when damage processing is allowed to reduce this entity health.
  takedamage
  /// Current position/transition state of a moving map object.
  moverState
  /// First mover endpoint in world coordinates.
  pos1
  /// Second mover endpoint in world coordinates.
  pos2
  /// Mover callback invoked when the mover reaches an endpoint.
  reached
  /// Mover callback invoked when another object obstructs movement.
  blocked
  /// Sound played when the mover arrives at its first endpoint.
  soundPos1
  /// Sound played while the mover travels from its first endpoint to its second.
  sound1to2
  /// Sound played while the mover travels from its second endpoint to its first.
  sound2to1
  /// Sound played when the mover arrives at its second endpoint.
  soundPos2
  /// Looping sound selected while the entity is active or moving.
  soundLoop
  /// Current enemy entity selected by the bot decision logic.
  enemy
  /// Entity callback invoked when a damage event causes a pain response.
  pain
  /// Entity callback invoked when damage kills the entity.
  die
  /// Game timestamp retained by the entity behavior.
  timestamp
  /// Entity that created or owns this transient object.
  parent
  /// Entity currently resolved as the active target.
  target_ent
  /// Damage at the center of the radial splash-damage effect.
  splashDamage
  /// Maximum world-space radius affected by splash damage.
  splashRadius
  /// MOD_* identifier used to attribute direct damage and death.
  methodOfDeath
  /// MOD_* identifier used to attribute splash damage and death.
  splashMethodOfDeath
  /// Contents mask used to select surfaces/entities that can block this object.
  clipmask
  /// Bounce factor used when this physics object collides with a surface.
  physicsBounce
  /// Item definition associated with this pickup entity.
  item
  /// Master entity coordinating this entity team or mover group.
  teammaster
  /// Next entity linked into this entity team or mover group.
  teamchain
  /// Depth classification of the player immersion in liquid.
  waterlevel
  /// CONTENTS_* mask identifying the liquid around the player.
  watertype
  /// Deadline preventing repeated pain responses in rapid succession.
  pain_debounce_time
end struct
/// `Level` record for entities, containing `scene`, `entities`, `num_entities`, `time` and `startTime` and related fields.
struct Level
  /// Shared scene/world representation used by game entities and collision.
  scene
  /// Game entity records indexed by entity number.
  entities
  /// Number of entity slots currently included in the level entity table.
  num_entities
  /// Current server game time in milliseconds.
  time
  /// Server timestamp at which the level began.
  startTime
  /// Pseudo-random seed carried by the game state for repeatable random choices.
  randSeed
  /// Injected callback for damage; invoked through the Level service/state record.
  damageFn
  /// Door-touch handler retained by the level for mover interaction.
  doorTouch
  /// Injected callback for observe; invoked through the Level service/state record.
  observeFn
  /// Opaque caller-supplied context available to level simulation, entity, client, match, and
  /// host-observation callbacks.
  context
  /// Map-entity spawning state or dispatcher associated with the level.
  spawner
  /// Accumulated shader-name remappings applied by map targets.
  shaderRemaps
  /// Injected callback for run entity; invoked through the Level service/state record.
  runEntityFn
  /// Nonzero after target-location entities have been linked.
  locationLinked
  /// Head of the linked list of level location entities.
  locationHead
  /// Timestamp/marker recording that an intermission transition has been queued.
  intermissionQueued
  /// Configured scale applied to damage-induced knockback.
  knockback
  /// Nonzero when teammates may damage each other.
  friendlyFire
  /// Injected callback for trace observe; invoked through the Level service/state record.
  traceObserveFn
  /// Previous game-frame time used for motion and rollback calculations.
  previousTime
  /// Per-item registration markers used to advertise required pickup assets.
  itemRegistered
  /// Setting controlling blood and gib effects.
  blood
  /// Next corpse-queue slot to reuse when a player body is copied.
  bodyQueIndex
  /// Reusable corpse-entity slots maintained by the level.
  bodyQue
  /// Camera position chosen for the intermission view.
  intermission_origin
  /// Camera orientation chosen for the intermission view.
  intermission_angle
  /// Client records indexed by client slot.
  clients
  /// Configured number of client slots active in this game state.
  maxclients
  /// VM console-variable record controlling the active client limit.
  maxclientsCvar
  /// Client slot numbers ordered by the current rank/score calculation.
  sortedClients
  /// Scores indexed by the active team identifiers.
  teamScores
  /// First active client automatically selected for spectator following.
  follow1
  /// Second active client automatically selected for spectator following.
  follow2
  /// Number of clients currently connected to the game.
  numConnectedClients
  /// Number of connected clients assigned to a playing team rather than spectators.
  numNonSpectatorClients
  /// Number of clients currently participating in play.
  numPlayingClients
  /// Number of clients eligible to participate in the global vote.
  numVotingClients
  /// Counts of clients eligible to participate in each team vote.
  numteamVotingClients
  /// Timestamp at which the intermission began.
  intermissiontime
  /// Configured match time limit in minutes.
  timelimit
  /// Configured score/frag threshold that ends the match.
  fraglimit
  /// Configured number of flag captures that ends the match.
  capturelimit
  /// Nonzero when this client or match is ready to leave the intermission.
  readyToExit
  /// Timestamp controlling the transition out of intermission.
  exitTime
  /// Injected callback for server command; invoked through the Level service/state record.
  serverCommandFn
  /// Injected callback for game log; invoked through the Level service/state record.
  gameLogFn
  /// Injected callback for match transition; invoked through the Level service/state record.
  matchTransitionFn
  /// Next death-animation variant selected by game death logic.
  deathAnimIndex
  /// Injected callback for item drop; invoked through the Level service/state record.
  itemDropFn
  /// Injected callback for flag return; invoked through the Level service/state record.
  flagReturnFn
  /// Injected callback for team message; invoked through the Level service/state record.
  teamMessageFn
  /// Injected callback for client spawn; invoked through the Level service/state record.
  clientSpawnFn
  /// Current capture-the-flag state of the red flag.
  redFlagStatus
  /// Current capture-the-flag state of the blue flag.
  blueFlagStatus
  /// Current state of the neutral flag in one-flag capture the flag.
  neutralFlagStatus
  /// Timestamp at which the red flag was most recently taken.
  redTakenTime
  /// Timestamp at which the blue flag was most recently taken.
  blueTakenTime
  /// Timestamp of the most recent flag capture.
  lastFlagCapture
  /// Team credited with the most recent flag capture.
  lastCaptureTeam
  /// Configured respawn delay for weapon pickups.
  weaponRespawn
  /// Configured weapon-pickup respawn delay in team games.
  weaponTeamRespawn
  /// Configured inactivity timeout applied to clients.
  inactivity
  /// Injected callback for user information; invoked through the Level service/state record.
  userinfoFn
  /// Injected callback for user command; invoked through the Level service/state record.
  usercmdFn
  /// Injected callback for client think; invoked through the Level service/state record.
  clientThinkFn
  /// Injected callback for client end frame; invoked through the Level service/state record.
  clientEndFrameFn
  /// Injected callback for move intermission; invoked through the Level service/state record.
  moveIntermissionFn
  /// Registered sound index for the environmental frying sound.
  sndFry
  /// Setting controlling client movement extrapolation/smoothing.
  smoothClients
  /// Injected callback for client begin; invoked through the Level service/state record.
  clientBeginFn
  /// Downward acceleration used by the player or entity movement simulation.
  gravity
  /// Configured normal player movement speed.
  playerSpeed
  /// Deathmatch-option bit mask supplied by server configuration.
  dmflags
  /// Nonzero when player movement uses a fixed simulation step.
  pmoveFixed
  /// Fixed movement-step duration in milliseconds.
  pmoveMsec
  /// Nonzero when commands are processed synchronously with game frames.
  synchronousClients
  /// Configured delay after which a dead client is forced to respawn.
  forceRespawn
  /// Injected callback for console variable set; invoked through the Level service/state record.
  cvarSetFn
  /// Injected callback for drop client; invoked through the Level service/state record.
  dropClientFn
  /// Injected callback for follow cycle; invoked through the Level service/state record.
  followCycleFn
  /// Injected callback for gauntlet attack; invoked through the Level service/state record.
  gauntletAttackFn
  /// Injected callback for fire weapon; invoked through the Level service/state record.
  fireWeaponFn
  /// Injected callback for bot test AAS; invoked through the Level service/state record.
  botTestAasFn
  /// Injected callback for respawn; invoked through the Level service/state record.
  respawnFn
  /// Injected callback for player die; invoked through the Level service/state record.
  playerDieFn
  /// Game frames processed since level initialization.
  framenum
  /// Nonzero while waiting for a requested map restart to take effect.
  restarted
  /// Injected callback for frame stage; invoked through the Level service/state record.
  frameStageFn
  /// Control value requesting a listing of allocated entities.
  listEntity
  /// Warmup deadline/state advertised to clients.
  warmup
  /// Warmup-setting revision already processed by game logic.
  warmupModificationCount
  /// Current revision of the warmup console variable.
  warmupCvarModificationCount
  /// Injected callback for tournament add; invoked through the Level service/state record.
  tournamentAddFn
  /// Injected callback for console command; invoked through the Level service/state record.
  consoleCommandFn
  /// Console command or text associated with the active global vote.
  voteString
  /// Timestamp at which the active global vote began.
  voteTime
  /// Scheduled time for executing a successful vote command.
  voteExecuteTime
  /// Number of yes votes received for the active global vote.
  voteYes
  /// Number of no votes received for the active global vote.
  voteNo
  /// Per-team commands/text associated with active team votes.
  teamVoteString
  /// Per-team start timestamps of active team votes.
  teamVoteTime
  /// Per-team counts of yes votes.
  teamVoteYes
  /// Per-team counts of no votes.
  teamVoteNo
  /// Injected callback for client user information changed; invoked through the Level service/state
  /// record.
  clientUserinfoChangedFn
  /// Timestamp of the most recent team-location broadcast.
  lastTeamLocationTime
  /// State for periodic cvar synchronization and side effects.
  cvarMaintenance
  /// Game cvar table and its VM-facing variable records.
  gameCvars
  /// Injected callback for update console variables; invoked through the Level service/state record.
  updateCvarsFn
  /// Human-readable description advertised for the active global vote.
  voteDisplayString
  /// Setting controlling whether clients may initiate votes.
  allowVote
  /// Nonzero when prior session data must be discarded during level setup.
  newSession
  /// Setting allowing clients to join a playing team automatically.
  teamAutoJoin
  /// Maximum number of clients permitted to participate in play.
  maxGameClients
  /// Injected callback for filter packet; invoked through the Level service/state record.
  filterPacketFn
  /// Injected callback for bot connect; invoked through the Level service/state record.
  botConnectFn
  /// Injected callback for game print; invoked through the Level service/state record.
  gamePrintFn
  /// Injected callback for console variable string; invoked through the Level service/state record.
  cvarStringFn
  /// Setting requiring balanced player counts when changing teams.
  teamForceBalance
  /// Injected callback for remove queued bot begin; invoked through the Level service/state record.
  removeQueuedBotBeginFn
  /// Injected callback for bot shutdown; invoked through the Level service/state record.
  botShutdownFn
  /// Map name selected for the next level transition.
  changemap
  /// Injected callback for bot interbreed end match; invoked through the Level service/state record.
  botInterbreedEndMatchFn
  /// Injected callback for update tournament info; invoked through the Level service/state record.
  updateTournamentInfoFn
  /// Injected callback for spawn victory pads; invoked through the Level service/state record.
  spawnVictoryPadsFn
  /// Setting controlling whether cheat commands are allowed.
  cheats
  /// Setting selecting dedicated-server operation and its mode.
  dedicated
  /// Injected callback for user information set; invoked through the Level service/state record.
  userinfoSetFn
  /// Damage multiplier applied by the active quad-damage effect.
  quadfactor
  /// Shared weapon firing/projectile state maintained by the level.
  weaponState
  /// IP filtering state used by connection checks and server commands.
  ipFilters
  /// Fixed game-arena allocation state owned by the level.
  memoryState
  /// Server-command dispatcher and associated game command state.
  serverCommands
  /// Next allowed red-base-under-attack announcement time.
  redObeliskAttackedTime
  /// Next allowed blue-base-under-attack announcement time.
  blueObeliskAttackedTime
  /// State shared by bot allocation, setup, shutdown, and frame processing.
  lifecycleState
  /// Handle of the game event log file.
  logFile
  /// Injected callback for log write; invoked through the Level service/state record.
  logWriteFn
  /// Entity representing first place on the victory podium.
  podium1
  /// Entity representing second place on the victory podium.
  podium2
  /// Entity representing third place on the victory podium.
  podium3
  /// Level-owned bot creation, initialization, and cleanup state.
  botLifecycleState
  /// Goal/entity reference for the neutral harvester obelisk.
  neutralObelisk
  /// Configured maximum health of a mission-pack obelisk.
  obeliskHealth
  /// Interval between obelisk health regeneration steps.
  obeliskRegenPeriod
  /// Health restored by one obelisk regeneration step.
  obeliskRegenAmount
  /// Delay before a destroyed obelisk becomes active again.
  obeliskRespawnDelay
  /// Injected callback for obelisk attack; invoked through the Level service/state record.
  obeliskAttackFn
end struct
/// Create a client record with initialized player state, session data, statistics and gameplay timers.
/// @param state Initial value stored in `mq3.game.entities.Client.ps`.
/// @param team Team identifier used by the game rules.
/// @param cmdAngles Initial value stored in `mq3.game.entities.Client.cmdAngles`.
function createClient(state,team,cmdAngles)
  return Client(state,team,cmdAngles,false,0,0,0,[0.0,0.0,0.0],false,0,0,0.0,0,void,0,0,0,0,0,0,"",false,0,0,0,0,0,0.0,0,0,0,false,0,0,0,0.0,0.0,
    false,false,false,0,0,0,0,0,false,0,0,false,0,0,0,0,0,0,0,0,0,[0.0,0.0,0.0],0,0,false,0,false,0,0,void,array(16,0),0,0)
end function
/// Reset the existing client record to the default values used when binding a new player.
/// @param client Client state; accesses `ps`, `team`, `cmdAngles`, `noclip` and `damage_armor` and related fields. May update `client.ps`, `client.team` and `client.cmdAngles` and additional fields in place.
function resetClient(client)
  // Keep the persistent client object identity while zeroing every modeled field.
  fresh = createClient(ps.create(),0,[0,0,0])
  client.ps = fresh.ps; client.team = fresh.team; client.cmdAngles = fresh.cmdAngles
  client.noclip = fresh.noclip; client.damage_armor = fresh.damage_armor; client.damage_blood = fresh.damage_blood
  client.damage_knockback = fresh.damage_knockback; client.damage_from = fresh.damage_from; client.damage_fromWorld = fresh.damage_fromWorld
  client.lasthurt_client = fresh.lasthurt_client; client.lasthurt_mod = fresh.lasthurt_mod; client.lasthurtcarrier = fresh.lasthurtcarrier
  client.accuracy_hits = fresh.accuracy_hits; client.hook = fresh.hook; client.connected = fresh.connected
  client.spectatorState = fresh.spectatorState; client.spectatorClient = fresh.spectatorClient; client.spectatorTime = fresh.spectatorTime
  client.enterTime = fresh.enterTime; client.accuracy_shots = fresh.accuracy_shots; client.netname = fresh.netname
  client.readyToExit = fresh.readyToExit; client.lastkilled_client = fresh.lastkilled_client; client.respawnTime = fresh.respawnTime
  client.rewardTime = fresh.rewardTime; client.lastKillTime = fresh.lastKillTime; client.cmdWeapon = fresh.cmdWeapon
  client.lastfraggedcarrier = fresh.lastfraggedcarrier; client.fragcarrier = fresh.fragcarrier; client.carrierdefense = fresh.carrierdefense
  client.basedefense = fresh.basedefense; client.predictItemPickup = fresh.predictItemPickup; client.captures = fresh.captures
  client.flagrecovery = fresh.flagrecovery; client.assists = fresh.assists; client.lastreturnedflag = fresh.lastreturnedflag
  client.flagsince = fresh.flagsince; client.localClient = fresh.localClient; client.initialSpawn = fresh.initialSpawn
  client.pmoveFixed = fresh.pmoveFixed; client.maxHealth = fresh.maxHealth; client.teamStateState = fresh.teamStateState
  client.teamStateLocation = fresh.teamStateLocation; client.voteCount = fresh.voteCount; client.teamVoteCount = fresh.teamVoteCount
  client.teamInfo = fresh.teamInfo; client.wins = fresh.wins; client.losses = fresh.losses
  client.teamLeader = fresh.teamLeader; client.cmdServerTime = fresh.cmdServerTime; client.cmdButtons = fresh.cmdButtons
  client.cmdForwardmove = fresh.cmdForwardmove; client.cmdRightmove = fresh.cmdRightmove; client.cmdUpmove = fresh.cmdUpmove
  client.lastCmdTime = fresh.lastCmdTime; client.buttons = fresh.buttons; client.oldbuttons = fresh.oldbuttons
  client.latched_buttons = fresh.latched_buttons; client.oldOrigin = fresh.oldOrigin; client.accurateCount = fresh.accurateCount
  client.inactivityTime = fresh.inactivityTime; client.inactivityWarning = fresh.inactivityWarning; client.airOutTime = fresh.airOutTime
  client.fireHeld = fresh.fireHeld; client.switchTeamTime = fresh.switchTeamTime; client.timeResidual = fresh.timeResidual
  client.persistantPowerup = fresh.persistantPowerup; client.ammoTimes = fresh.ammoTimes; client.invulnerabilityTime = fresh.invulnerabilityTime
  client.portalID = fresh.portalID
  return void
end function
/// Create an inactive entity record with the default game, collision and event fields.
/// @param slot Slot in the owning table or pool.
/// @param r Initial value stored in `mq3.game.entities.Entity.r`.
function blank(slot,r)
  return Entity(slot,es.create(),r,void,false,void,0,false,0,false,void,void,void,0,void,void,0.0,void,void,0.0,0.0,0,0,0,void,void,0,[0.0,0.0,0.0],0,void,void,void,false,false,0,0,void,false,0,[0.0,0.0,0.0],[0.0,0.0,0.0],void,void,0,0,0,0,0,void,void,void,0,void,void,0,0,0,0,0,0.0,void,void,void,0,0,0)
end function
/// Apply `mq3.server.world.create`, `mq3.game.cvar_maintenance.create` and `mq3.game.entities.blank` while evaluating `create`. Return paths include `level`.
/// @param world Initial value stored in `mq3.server.world.Scene.world`.
function create(world)
  scene = sv.create(world); level = Level(scene,[],64,0,0,1,void,void,void,void,void,[],void,false,void,0,1000.0,0,void,0,array(256,0),1,0,[],[0.0,0.0,0.0],[0.0,0.0,0.0],[],0,0,array(64,0),array(4,0),0,0,0,0,0,0,array(2,0),0,0,0,0,false,0,void,void,void,0,void,void,void,void,0,0,0,0,0,0.0,0,5,30,0,void,void,void,void,void,0,false,void,800,320,0,false,8,false,0,void,void,void,void,void,void,void,void,0,false,void,0,20,0,0,void,void,
    "",0,0,0,0,array(2,""),array(2,0),array(2,0),array(2,0),void,0,cvarMaintenance.create(),void,void,"",0,false,0,0,void,void,void,void,0,void,void,void,void,void,void,0,0,void,0.0,void,void,void,void,0,0,void,0,void,void,void,void,void,void,250,1,1,10,void)
  for i = 0 to 1023
    level.entities = level.entities+[blank(i,scene.entities[i])]
  end for
  for i = 0 to 63
    level.clients = level.clients+[createClient(ps.create(),0,[0,0,0])]
  end for
  return level
end function
/// Set `ent.client` to `client` and `level.clients[ent.slot]` to `client` in `mq3.game.entities.bindClient`. Return paths include `client`.
/// @param level Game-level state; accesses `clients`. May update `level.clients[ent.slot]` in place.
/// @param ent Game entity; accesses `slot` and `client`. May update `ent.client` in place.
/// @param client Operand used to evaluate the returned expression `client`.
function bindClient(level,ent,client)
  if ent.slot < 0 or ent.slot >= 64 then return error(495,"Invalid client binding slot") end if
  ent.client = client; level.clients[ent.slot] = client
  return client
end function
/// Use `level.observeFn` to perform `observe`.
/// @param level Game-level state; accesses `observeFn`.
/// @param kind Value passed as argument 2 to `level.observeFn`.
/// @param ent Value passed as argument 3 to `level.observeFn`.
function observe(level,kind,ent)
  if level.observeFn != void then level.observeFn(level,kind,ent) end if
  return void
end function
/// Initialize an allocated game entity for use by the level and its collision services.
/// @param ent Game entity; accesses `inuse`, `classname`, `s`, `slot` and `r`. May update `ent.inuse`, `ent.classname` and `ent.s.number` and additional fields in place.
function initEntity(ent)
  ent.inuse = true; ent.classname = "noclass"; ent.s.number = ent.slot; ent.r.number = ent.slot; ent.r.ownerNum = 1023
  return ent
end function
/// Set `level.num_entities` to `level.num_entities+1` in `mq3.game.entities.spawn`. Return paths include `initEntity(ent)`.
/// @param level Game-level state; accesses `num_entities`, `entities`, `startTime` and `time`. May update `level.num_entities` in place.
function spawn(level)
  if level.num_entities < 64 or level.num_entities > 1022 then return error(483,"Invalid game entity count") end if
  i = 64
  while i < level.num_entities
    ent = level.entities[i]
    if not ent.inuse and not (ent.freetime > n.add32(level.startTime,2000) and n.i32(level.time-ent.freetime) < 1000) then return initEntity(ent) end if
    i = i+1
  end while
  // In the original valid range, the force pass is unreachable: 1022 != 1024.
  if i == 1022 then return error(483,"G_Spawn: no free entities") end if
  level.num_entities = level.num_entities+1; ent = level.entities[i]
  observe(level,3,ent)
  return initEntity(ent)
end function
/// Check whether any non-client entity slot below the active entity limit is unused.
/// @param level Game-level state; accesses `num_entities` and `entities`.
function entitiesFree(level)
  i = 64
  while i < level.num_entities
    if not level.entities[i].inuse then return true end if
    i = i+1
  end while
  return false
end function
/// Update `ent.r.number`, `ent.r.modelindex`, `ent.r.solid` and `ent.r.origin` and related state during `syncSpatial`.
/// @param ent Game entity; accesses `r` and `s`. May update `ent.r.number`, `ent.r.modelindex` and `ent.r.solid` and additional fields in place.
function syncSpatial(ent)
  ent.r.number = ent.s.number; ent.r.modelindex = ent.s.modelindex; ent.r.solid = ent.s.solid
  ent.r.origin = movement.copy(ent.s.origin); ent.r.angles = movement.copy(ent.s.angles)
  return void
end function
/// Set `ent.s.solid` to `ent.r.solid` in `mq3.game.entities.link`.
/// @param level Game-level state; accesses `scene`.
/// @param ent Game entity; accesses `slot`, `s` and `r`. May update `ent.s.solid` in place.
function link(level,ent)
  syncSpatial(ent); sv.linkEntity(level.scene,ent.slot); ent.s.solid = ent.r.solid
  observe(level,1,ent)
  return void
end function
/// Apply `mq3.server.world.unlinkEntity` and `mq3.game.entities.observe` while evaluating `unlink`.
/// @param level Game-level state; accesses `scene`.
/// @param ent Game entity; accesses `slot`.
function unlink(level,ent)
  sv.unlinkEntity(level.scene,ent.slot); observe(level,2,ent)
  return void
end function
/// Unlink and release a game entity while preserving the entity-slot lifecycle rules.
/// @param level Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place.
/// @param ent Game entity; accesses `neverFree`, `r`, `slot`, `s` and `client` and related fields. May update `ent.r`, `ent.s` and `ent.client` and additional fields in place.
function free(level,ent)
  unlink(level,ent)
  if ent.neverFree then return void end if
  // The server's svEntity metadata is separate from the zeroed gentity in C.
  old = ent.r; r = sv.entity(ent.slot); r.number = 0
  r.clusters = old.clusters; r.lastCluster = old.lastCluster; r.areanum = old.areanum; r.areanum2 = old.areanum2; r.nextEntity = old.nextEntity
  ent.r = r; level.scene.entities[ent.slot] = r
  ent.s = es.create(); ent.client = void; ent.inuse = false; ent.classname = "freed"; ent.freetime = level.time
  ent.neverFree = false; ent.eventTime = 0; ent.freeAfterEvent = false; ent.touch = void; ent.target = void; ent.targetname = void; ent.spawnflags = 0
  ent.model = void; ent.model2 = void; ent.speed = 0.0; ent.message = void; ent.team = void; ent.wait = 0.0; ent.random = 0.0
  ent.count = 0; ent.health = 0; ent.damage = 0; ent.targetShaderName = void; ent.targetShaderNewName = void; ent.flags = 0
  ent.movedir = [0.0,0.0,0.0]; ent.nextthink = 0; ent.think = void
  ent.use = void; ent.activator = void; ent.unlinkAfterEvent = false; ent.physicsObject = false
  ent.noise_index = 0; ent.fly_sound_debounce_time = 0; ent.nextTrain = void
  ent.takedamage = false; ent.moverState = 0; ent.pos1 = [0.0,0.0,0.0]; ent.pos2 = [0.0,0.0,0.0]
  ent.reached = void; ent.blocked = void; ent.soundPos1 = 0; ent.sound1to2 = 0; ent.sound2to1 = 0; ent.soundPos2 = 0; ent.soundLoop = 0
  ent.enemy = void; ent.pain = void; ent.die = void; ent.timestamp = 0
  ent.parent = void; ent.target_ent = void; ent.splashDamage = 0; ent.splashRadius = 0; ent.methodOfDeath = 0; ent.splashMethodOfDeath = 0; ent.clipmask = 0; ent.physicsBounce = 0.0
  ent.item = void; ent.teammaster = void; ent.teamchain = void
  ent.waterlevel = 0; ent.watertype = 0
  ent.pain_debounce_time = 0
  return void
end function
/// Set `ent.nextthink` to `0` in `mq3.game.entities.runThink`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `nextthink` and `think`. May update `ent.nextthink` in place.
function runThink(level,ent)
  thinktime = n.f32(ent.nextthink)
  if thinktime <= 0 or thinktime > n.f32(level.time) then return void end if
  ent.nextthink = 0
  if ent.think == void then return error(485,"NULL ent->think") end if
  ent.think(level,ent)
  return void
end function
/// Update `ent.s.pos.trBase`, `ent.s.pos.trType`, `ent.s.pos.trTime` and `ent.s.pos.trDuration` and related state during `setOrigin`.
/// @param ent Game entity; accesses `s` and `r`. May update `ent.s.pos.trBase`, `ent.s.pos.trType` and `ent.s.pos.trTime` and additional fields in place.
/// @param origin World-space position as three coordinates.
function setOrigin(ent,origin)
  ent.s.pos.trBase = movement.copy(origin); ent.s.pos.trType = c.TR_STATIONARY; ent.s.pos.trTime = 0; ent.s.pos.trDuration = 0
  ent.s.pos.trDelta = [0.0,0.0,0.0]; ent.r.currentOrigin = movement.copy(origin)
  return void
end function
/// Use `level.gamePrintFn` to perform `diagnostic`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param text Text to parse, format or deliver.
function diagnostic(level,text)
  if len(bytes(text)) > 1023 then return error(485,"Game diagnostic exceeds original G_Printf buffer") end if
  if level.gamePrintFn != void then level.gamePrintFn(level,text) end if
  return void
end function
/// Convert a native diagnostic string to text up to its first zero byte, with a null-pointer placeholder.
/// @param text Text to parse, format or deliver.
function diagnosticArgument(text)
  if text == void then return "(null)" end if
  data = bytes(text); size = 0
  while size < len(data) and data[size] != 0
    size = size+1
  end while
  return decode(slice(data,0,size))
end function
/// Use `level.gamePrintFn` to perform `vtos`. Return paths include `text`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param vector Three-component array; components 0, 1 and 2 are used in their stored order.
function vtos(level,vector)
  // Original g_utils.c vtos uses float-to-int truncation and Com_sprintf into
  // 32 bytes. Return owned text instead of one of eight static native buffers.
  text = "("+str(n.trunc32(vector[0]))+" "+str(n.trunc32(vector[1]))+" "+str(n.trunc32(vector[2]))+")"
  data = bytes(text); size = len(data)
  if size >= 32 then
    if level.gamePrintFn != void then level.gamePrintFn(level,"Com_sprintf: overflow of "+str(size)+" in 32\n") end if
    return decode(slice(data,0,31))
  end if
  return text
end function
/// Apply `mq3.game.entities.spawn`, `mq3.game.movement.copy` and `mq3.game.snapshot.snapVector` while evaluating `tempEntity`. Return paths include `ent`.
/// @param level Game-level state; accesses `time`.
/// @param origin World-space position as three coordinates.
/// @param event Player or entity event identifier.
function tempEntity(level,origin,event)
  ent = spawn(level); ent.s.eType = c.ET_EVENTS+event; ent.classname = "tempEntity"
  ent.eventTime = level.time; ent.freeAfterEvent = true
  snapped = movement.copy(origin); snapshot.snapVector(snapped); setOrigin(ent,snapped); link(level,ent)
  return ent
end function
/// Set `level.randSeed` to `n.add32(n.mul32(level.randSeed,214013),2531011)` in `mq3.game.entities.random`. Return paths include `(n.u32(level.randSeed) >> 16) & 32767`.
/// @param level Game-level state; accesses `randSeed`. May update `level.randSeed` in place.
function random(level)
  // Native Windows rand profile; separate from Q_rand and the QVM rand profile.
  level.randSeed = n.add32(n.mul32(level.randSeed,214013),2531011)
  return (n.u32(level.randSeed) >> 16) & 32767
end function
/// Use `level.gamePrintFn` to perform `pickTarget`. Return paths include `choices[random(level) % len(choices)]`.
/// @param level Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`.
/// @param name Name used to identify the requested entry.
function pickTarget(level,name)
  if name == void then
    if level.gamePrintFn != void then level.gamePrintFn(level,"G_PickTarget called with NULL targetname\n") end if
    return void
  end if
  choices = []; i = 0
  while i < level.num_entities
    ent = level.entities[i]; i = i+1
    if ent.inuse and ent.targetname != void and strings.equalsIgnoreCaseAscii(ent.targetname,name) then
      choices = choices+[ent]
      if len(choices) == 32 then break end if
    end if
  end while
  if len(choices) == 0 then
    if level.gamePrintFn != void then level.gamePrintFn(level,"G_PickTarget: target "+name+" not found\n") end if
    return void
  end if
  return choices[random(level) % len(choices)]
end function
