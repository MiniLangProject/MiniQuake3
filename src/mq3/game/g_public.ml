// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Public game/server ABI from code/game/g_public.h. Import opcodes live in
// mq3.game.syscalls and export dispatch lives in mq3.server.game_vm.
package mq3.game.g_public

/// Version of the game-module import/export ABI implemented by this facade.
const GAME_API_VERSION=8
/// Server entity-flag bit controlling noclient.
const SVF_NOCLIENT=0x00000001
/// Server entity-flag bit controlling clientmask.
const SVF_CLIENTMASK=0x00000002
/// Server entity-flag bit controlling bot.
const SVF_BOT=0x00000008
/// Server entity-flag bit controlling broadcast.
const SVF_BROADCAST=0x00000020
/// Server entity-flag bit controlling portal.
const SVF_PORTAL=0x00000040
/// Server entity-flag bit controlling use current origin.
const SVF_USE_CURRENT_ORIGIN=0x00000080
/// Server entity-flag bit controlling singleclient.
const SVF_SINGLECLIENT=0x00000100
/// Server entity-flag bit controlling noserverinfo.
const SVF_NOSERVERINFO=0x00000200
/// Server entity-flag bit controlling capsule.
const SVF_CAPSULE=0x00000400
/// Server entity-flag bit controlling notsingleclient.
const SVF_NOTSINGLECLIENT=0x00000800

/// Game-module VM command identifier selecting init.
const GAME_INIT=0
/// Game-module VM command identifier selecting shutdown.
const GAME_SHUTDOWN=1
/// Game-module VM command identifier selecting client connect.
const GAME_CLIENT_CONNECT=2
/// Game-module VM command identifier selecting client begin.
const GAME_CLIENT_BEGIN=3
/// Game-module VM command identifier selecting client user information changed.
const GAME_CLIENT_USERINFO_CHANGED=4
/// Game-module VM command identifier selecting client disconnect.
const GAME_CLIENT_DISCONNECT=5
/// Game-module VM command identifier selecting client command.
const GAME_CLIENT_COMMAND=6
/// Game-module VM command identifier selecting client think.
const GAME_CLIENT_THINK=7
/// Game-module VM command identifier selecting run frame.
const GAME_RUN_FRAME=8
/// Game-module VM command identifier selecting console command.
const GAME_CONSOLE_COMMAND=9
/// VM command requesting one bot-AI frame from the game module.
const BOTAI_START_FRAME=10

/// `EntityShared` record for g public, containing `s`, `linked`, `linkcount`, `svFlags` and `singleClient` and related fields.
struct EntityShared
  /// Network-visible entity state used to build snapshots for clients.
  s
  /// Nonzero when the entity is linked into the engine world structures.
  linked
  /// Counter incremented when the engine relinks this entity.
  linkcount
  /// Server-side entity flags controlling visibility, client filtering, and engine handling.
  svFlags
  /// Client slot used by server flags that restrict or exclude snapshot visibility.
  singleClient
  /// Nonzero when the entity collision shape is a BSP brush model.
  bmodel
  /// Lower local entity bound exposed to the server for collision and spatial linking.
  mins
  /// Upper local entity bound exposed to the server for collision and spatial linking.
  maxs
  /// CONTENTS_* mask describing the collision contents of this object or query result.
  contents
  /// Lower corner of the entity bounds after transformation into world space.
  absmin
  /// Upper corner of the entity bounds after transformation into world space.
  absmax
  /// Current engine-side origin used for linking and collision queries.
  currentOrigin
  /// Current engine-side orientation used for linking and transformed collision queries.
  currentAngles
  /// Entity number of the owner; used to avoid collisions with or attribute actions to the owner.
  ownerNum
end struct
/// `SharedEntity` record for g public, containing `s` and `r`.
struct SharedEntity
  /// Network-visible entity state used to build snapshots for clients.
  s
  /// Engine-shared entity state used for world linking, collision, and visibility.
  r
end struct
/// Return a new array `["entityShared_t","sharedEntity_t"]` for `typeNames`.
function typeNames() return ["entityShared_t","sharedEntity_t"] end function

/// Apply NOCLIENT, SINGLECLIENT, NOTSINGLECLIENT and CLIENTMASK visibility flags to a client slot.
/// @param svFlags Value used by `sendsToClient` in `if (svFlags&SVF_NOCLIENT)!=0 then return false end if`.
/// @param singleClient Operand used to evaluate the returned expression `(singleClient&(1<<clientNum))!=0`.
/// @param clientNum Client slot number.
function sendsToClient(svFlags,singleClient,clientNum)
  if (svFlags&SVF_NOCLIENT)!=0 then return false end if
  if (svFlags&SVF_SINGLECLIENT)!=0 and singleClient!=clientNum then return false end if
  if (svFlags&SVF_NOTSINGLECLIENT)!=0 and singleClient==clientNum then return false end if
  if (svFlags&SVF_CLIENTMASK)!=0 then
    if clientNum<0 or clientNum>=32 then return false end if
    return (singleClient&(1<<clientNum))!=0
  end if
  return true
end function
