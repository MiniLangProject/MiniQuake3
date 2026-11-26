// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete public engine/CGame ABI from code/cgame/cg_public.h.
package mq3.client.cgame_public

/// Number of recent user commands retained in the command-history ring.
const CMD_BACKUP=64
/// Mask that maps a user-command sequence number into the command-history ring.
const CMD_MASK=63
/// Capacity limit for the entities in snapshot collection or bounded storage used by this client
/// module.
const MAX_ENTITIES_IN_SNAPSHOT=256
/// Version of the engine-import interface expected by the CGame adapter.
const CGAME_IMPORT_API_VERSION=4

/// CGame event-handling mode selecting the none interface.
const CGAME_EVENT_NONE=0
/// CGame event-handling mode selecting the teammenu interface.
const CGAME_EVENT_TEAMMENU=1
/// CGame event-handling mode selecting the scoreboard interface.
const CGAME_EVENT_SCOREBOARD=2
/// CGame event-handling mode selecting the edithud interface.
const CGAME_EVENT_EDITHUD=3

/// CG engine-syscall ordinal used to print text through the engine console.
const CG_PRINT=0
/// CG engine-syscall ordinal used to raise an engine error.
const CG_ERROR=1
/// CG engine-syscall ordinal used to query the engine millisecond timer.
const CG_MILLISECONDS=2
/// CG engine-syscall ordinal used to register a configuration variable.
const CG_CVAR_REGISTER=3
/// CG engine-syscall ordinal used to refresh a mirrored configuration variable.
const CG_CVAR_UPDATE=4
/// CG engine-syscall ordinal used to set a configuration variable.
const CG_CVAR_SET=5
/// CG engine-syscall ordinal used to read a configuration variable as text.
const CG_CVAR_VARIABLESTRINGBUFFER=6
/// CG engine-syscall ordinal used to query the number of console-command arguments.
const CG_ARGC=7
/// CG engine-syscall ordinal used to read a console-command argument.
const CG_ARGV=8
/// CG engine-syscall ordinal used to read the remaining console-command argument text.
const CG_ARGS=9
/// CG engine-syscall ordinal used to open a file in the virtual filesystem.
const CG_FS_FOPENFILE=10
/// CG engine-syscall ordinal used to read bytes from a virtual file.
const CG_FS_READ=11
/// CG engine-syscall ordinal used to write bytes to a virtual file.
const CG_FS_WRITE=12
/// CG engine-syscall ordinal used to close a virtual file.
const CG_FS_FCLOSEFILE=13
/// CG engine-syscall ordinal used to queue an engine console command.
const CG_SENDCONSOLECOMMAND=14
/// CG engine-syscall ordinal used to register a console-command name.
const CG_ADDCOMMAND=15
/// CG engine-syscall ordinal used to send a reliable client command to the server.
const CG_SENDCLIENTCOMMAND=16
/// CG engine-syscall ordinal used to request an immediate screen update.
const CG_UPDATESCREEN=17
/// CG engine-syscall ordinal used to load the map's collision world.
const CG_CM_LOADMAP=18
/// CG engine-syscall ordinal used to query the number of inline collision models.
const CG_CM_NUMINLINEMODELS=19
/// CG engine-syscall ordinal used to resolve an inline collision-model handle.
const CG_CM_INLINEMODEL=20
/// CG engine-syscall ordinal used to load a collision model.
const CG_CM_LOADMODEL=21
/// CG engine-syscall ordinal used to construct a temporary box collision model.
const CG_CM_TEMPBOXMODEL=22
/// CG engine-syscall ordinal used to query collision contents at a world position.
const CG_CM_POINTCONTENTS=23
/// CG engine-syscall ordinal used to query point contents in a transformed model.
const CG_CM_TRANSFORMEDPOINTCONTENTS=24
/// CG engine-syscall ordinal used to sweep a box through the collision world.
const CG_CM_BOXTRACE=25
/// CG engine-syscall ordinal used to sweep a box against a transformed collision model.
const CG_CM_TRANSFORMEDBOXTRACE=26
/// CG engine-syscall ordinal used to clip decal geometry against world surfaces.
const CG_CM_MARKFRAGMENTS=27
/// CG engine-syscall ordinal used to play a positional sound event.
const CG_S_STARTSOUND=28
/// CG engine-syscall ordinal used to play a non-positional local sound.
const CG_S_STARTLOCALSOUND=29
/// CG engine-syscall ordinal used to clear the frame's looping-sound submissions.
const CG_S_CLEARLOOPINGSOUNDS=30
/// CG engine-syscall ordinal used to submit an entity's looping positional sound.
const CG_S_ADDLOOPINGSOUND=31
/// CG engine-syscall ordinal used to update an entity position used for sound spatialization.
const CG_S_UPDATEENTITYPOSITION=32
/// CG engine-syscall ordinal used to update the listener origin and orientation.
const CG_S_RESPATIALIZE=33
/// CG engine-syscall ordinal used to register a sound resource.
const CG_S_REGISTERSOUND=34
/// CG engine-syscall ordinal used to start the background music introduction and loop tracks.
const CG_S_STARTBACKGROUNDTRACK=35
/// CG engine-syscall ordinal used to load the level's renderer world data.
const CG_R_LOADWORLDMAP=36
/// CG engine-syscall ordinal used to register a model resource.
const CG_R_REGISTERMODEL=37
/// CG engine-syscall ordinal used to register a skin resource.
const CG_R_REGISTERSKIN=38
/// CG engine-syscall ordinal used to register a shader resource.
const CG_R_REGISTERSHADER=39
/// CG engine-syscall ordinal used to clear the renderer's pending scene.
const CG_R_CLEARSCENE=40
/// CG engine-syscall ordinal used to append a renderer entity to the pending scene.
const CG_R_ADDREFENTITYTOSCENE=41
/// CG engine-syscall ordinal used to append a polygon to the pending scene.
const CG_R_ADDPOLYTOSCENE=42
/// CG engine-syscall ordinal used to append a dynamic light to the pending scene.
const CG_R_ADDLIGHTTOSCENE=43
/// CG engine-syscall ordinal used to render the accumulated scene through a view definition.
const CG_R_RENDERSCENE=44
/// CG engine-syscall ordinal used to set the color modulation used by subsequent 2D drawing.
const CG_R_SETCOLOR=45
/// CG engine-syscall ordinal used to draw a shader-backed rectangle with texture coordinates.
const CG_R_DRAWSTRETCHPIC=46
/// CG engine-syscall ordinal used to query a model's axis-aligned bounds.
const CG_R_MODELBOUNDS=47
/// CG engine-syscall ordinal used to interpolate an attachment tag between model animation frames.
const CG_R_LERPTAG=48
/// CG engine-syscall ordinal used to read the renderer configuration.
const CG_GETGLCONFIG=49
/// CG engine-syscall ordinal used to read server configuration strings.
const CG_GETGAMESTATE=50
/// CG engine-syscall ordinal used to query the latest available snapshot sequence and server time.
const CG_GETCURRENTSNAPSHOTNUMBER=51
/// CG engine-syscall ordinal used to read a server snapshot.
const CG_GETSNAPSHOT=52
/// CG engine-syscall ordinal used to read a reliable server command.
const CG_GETSERVERCOMMAND=53
/// CG engine-syscall ordinal used to query the latest local user-command sequence.
const CG_GETCURRENTCMDNUMBER=54
/// CG engine-syscall ordinal used to read a local user command.
const CG_GETUSERCMD=55
/// CG engine-syscall ordinal used to set the CGame value and sensitivity multiplier attached to user
/// commands.
const CG_SETUSERCMDVALUE=56
/// CG engine-syscall ordinal used to register a shader without mipmapped image sampling.
const CG_R_REGISTERSHADERNOMIP=57
/// CG engine-syscall ordinal used to query remaining VM memory.
const CG_MEMORY_REMAINING=58
/// CG engine-syscall ordinal used to register a font resource and its glyph metrics.
const CG_R_REGISTERFONT=59
/// CG engine-syscall ordinal used to query whether an engine key is currently pressed.
const CG_KEY_ISDOWN=60
/// CG engine-syscall ordinal used to read the active input-capture bitmask.
const CG_KEY_GETCATCHER=61
/// CG engine-syscall ordinal used to replace the active input-capture bitmask.
const CG_KEY_SETCATCHER=62
/// CG engine-syscall ordinal used to find a key bound to a command.
const CG_KEY_GETKEY=63
/// CG engine-syscall ordinal used to add a preprocessor definition to the script parser.
const CG_PC_ADD_GLOBAL_DEFINE=64
/// CG engine-syscall ordinal used to open a script-parser source handle.
const CG_PC_LOAD_SOURCE=65
/// CG engine-syscall ordinal used to release a script-parser source handle.
const CG_PC_FREE_SOURCE=66
/// CG engine-syscall ordinal used to read the next preprocessed source token.
const CG_PC_READ_TOKEN=67
/// CG engine-syscall ordinal used to query the source location for a parser handle.
const CG_PC_SOURCE_FILE_AND_LINE=68
/// CG engine-syscall ordinal used to stop background music playback.
const CG_S_STOPBACKGROUNDTRACK=69
/// CG engine-syscall ordinal used to read the host calendar and clock.
const CG_REAL_TIME=70
/// CG engine-syscall ordinal used to round a vector using the native protocol convention.
const CG_SNAPVECTOR=71
/// CG engine-syscall ordinal used to unregister a console-command name.
const CG_REMOVECOMMAND=72
/// CG engine-syscall ordinal used to sample renderer lighting at a world position.
const CG_R_LIGHTFORPOINT=73
/// CG engine-syscall ordinal used to open and start a cinematic stream.
const CG_CIN_PLAYCINEMATIC=74
/// CG engine-syscall ordinal used to stop a cinematic stream.
const CG_CIN_STOPCINEMATIC=75
/// CG engine-syscall ordinal used to advance a cinematic decoder.
const CG_CIN_RUNCINEMATIC=76
/// CG engine-syscall ordinal used to draw the current cinematic frame.
const CG_CIN_DRAWCINEMATIC=77
/// CG engine-syscall ordinal used to set a cinematic's screen rectangle.
const CG_CIN_SETEXTENTS=78
/// CG engine-syscall ordinal used to remap a shader to a replacement shader and time offset.
const CG_R_REMAP_SHADER=79
/// CG engine-syscall ordinal used to submit a continuous looping positional sound.
const CG_S_ADDREALLOOPINGSOUND=80
/// CG engine-syscall ordinal used to stop the looping sound associated with an entity.
const CG_S_STOPLOOPINGSOUND=81
/// CG engine-syscall ordinal used to construct a temporary capsule collision model.
const CG_CM_TEMPCAPSULEMODEL=82
/// CG engine-syscall ordinal used to sweep a capsule through the collision world.
const CG_CM_CAPSULETRACE=83
/// CG engine-syscall ordinal used to sweep a capsule against a transformed collision model.
const CG_CM_TRANSFORMEDCAPSULETRACE=84
/// CG engine-syscall ordinal used to append an additive dynamic light to the pending scene.
const CG_R_ADDADDITIVELIGHTTOSCENE=85
/// CG engine-syscall ordinal used to read the next map-entity token.
const CG_GET_ENTITY_TOKEN=86
/// CG engine-syscall ordinal used to append several polygons to the pending scene.
const CG_R_ADDPOLYSTOSCENE=87
/// CG engine-syscall ordinal used to test renderer potential visibility between positions.
const CG_R_INPVS=88
/// CG engine-syscall ordinal used to seek within a virtual file.
const CG_FS_SEEK=89
/// CG engine-syscall ordinal used to fill a VM memory range with a byte value.
const CG_MEMSET=100
/// CG engine-syscall ordinal used to copy a VM memory range.
const CG_MEMCPY=101
/// CG engine-syscall ordinal used to copy a bounded string inside VM memory.
const CG_STRNCPY=102
/// CG engine-syscall ordinal used to evaluate sine for a VM numeric operation.
const CG_SIN=103
/// CG engine-syscall ordinal used to evaluate cosine for a VM numeric operation.
const CG_COS=104
/// CG engine-syscall ordinal used to evaluate the angle of a two-component vector.
const CG_ATAN2=105
/// CG engine-syscall ordinal used to evaluate a square root for a VM numeric operation.
const CG_SQRT=106
/// CG engine-syscall ordinal used to round a VM numeric value down to an integer.
const CG_FLOOR=107
/// CG engine-syscall ordinal used to round a VM numeric value up to an integer.
const CG_CEIL=108
/// CG engine-syscall ordinal used to print an integer through the VM diagnostic interface.
const CG_TESTPRINTINT=109
/// CG engine-syscall ordinal used to print a floating-point value through the VM diagnostic interface.
const CG_TESTPRINTFLOAT=110
/// CG engine-syscall ordinal used to evaluate inverse cosine for a VM numeric operation.
const CG_ACOS=111

/// CG VM entry-point ordinal used to initialize the CGame VM.
const CG_INIT=0
/// CG VM entry-point ordinal used to shut down the CGame VM.
const CG_SHUTDOWN=1
/// CG VM entry-point ordinal used to handle a CGame console command.
const CG_CONSOLE_COMMAND=2
/// CG VM entry-point ordinal used to render a CGame frame.
const CG_DRAW_ACTIVE_FRAME=3
/// CG VM entry-point ordinal used to query the player currently under the crosshair.
const CG_CROSSHAIR_PLAYER=4
/// CG VM entry-point ordinal used to query the latest attacker.
const CG_LAST_ATTACKER=5
/// CG VM entry-point ordinal used to deliver a key event to CGame.
const CG_KEY_EVENT=6
/// CG VM entry-point ordinal used to deliver pointer motion to CGame.
const CG_MOUSE_EVENT=7
/// CG VM entry-point ordinal used to switch CGame event-handling mode.
const CG_EVENT_HANDLING=8

/// Stores client game public snapshot metadata and contents, including `snapFlags`, `ping`, `serverTime`, `areamask`, `ps`, `numEntities` and additional values.
struct Snapshot
  /// Snapshot flags describing rate delay and dropped-command conditions.
  snapFlags
  /// Latency in milliseconds attached to the snapshot exposed through the public client-game interface.
  ping
  /// Server simulation timestamp in milliseconds exposed through the public client-game snapshot
  /// interface.
  serverTime
  /// Portal-area visibility bitset associated with the current snapshot or rendered view.
  areamask
  /// Complete player-state record carried by the snapshot.
  ps
  /// Number of entity-state entries represented by the snapshot or scene.
  numEntities
  /// Entity-state or renderer-entity entries represented by the current snapshot or scene.
  entities
  /// Number of reliable server commands associated with the snapshot.
  numServerCommands
  /// Reliable server-command sequence that must be processed before this public client-game snapshot
  /// becomes current.
  serverCommandSequence
end struct

/// Lists the type names catalog for client game public in its declared source order.
function typeNames() return ["snapshot_t","cgameImport_t","cgameExport_t"] end function
/// Computes `count>=0 and count<=MAX_ENTITIES_IN_SNAPSHOT` for client game public `validSnapshotEntityCount`.
/// @param count Value used by `return count>=0 and count<=MAX_ENTITIES_IN_SNAPSHOT`.
function validSnapshotEntityCount(count) return count>=0 and count<=MAX_ENTITIES_IN_SNAPSHOT end function
/// Computes `requested>current-CMD_BACKUP and requested<=current` for client game public `validCommandNumber`.
/// @param current Value used by `return requested>current-CMD_BACKUP and requested<=current`.
/// @param requested Value used by `return requested>current-CMD_BACKUP and requested<=current`.
function validCommandNumber(current,requested) return requested>current-CMD_BACKUP and requested<=current end function
/// Computes `value>=CGAME_EVENT_NONE and value<=CGAME_EVENT_EDITHUD` for client game public `validEventHandling`.
/// @param value Value used by `return value>=CGAME_EVENT_NONE and value<=CGAME_EVENT_EDITHUD`.
function validEventHandling(value) return value>=CGAME_EVENT_NONE and value<=CGAME_EVENT_EDITHUD end function
