// SPDX-License-Identifier: GPL-2.0-or-later
// Shared Cgame snapshot access for wire-protocol demos and server connections.
package mq3.client.server_stream

import mq3.client.gamestate as gamestate
import mq3.client.snapshot_command as snapshots
import mq3.client.snapshot_parse as entities
import mq3.shared.info as info
import mq3.compat.textnumbers as streamNumbers

/// Snapshot flag indicating that the server state is not yet active for normal gameplay.
const SNAPFLAG_NOT_ACTIVE = 2

/// Stores server stream stream record, including `protocol`, `epoch`, `demoPlaying`, `pure`.
struct Stream
  /// Network protocol version advertised or required by the client connection.
  protocol
  /// When constructing this record, `attach` supplies `protocol.dispatcher.snapshotState` for this
  /// member. Used by `at` and `entity` during subsequent processing.
  epoch
  /// True while the client receives its game data from a recorded demo.
  demoPlaying
  /// When constructing this record, `attach` supplies `pure` for this member.
  pure
end struct

/// Evaluates server stream `ready` and returns `false`, `snap.valid and (snap.snapFlags&SNAPFLAG_NOT_ACTIVE)==0` according to its guard/selection conditions.
/// @param protocol Record read through `protocol.dispatcher.snapshotState.snap`.
function ready(protocol)
  if protocol==void then return false end if
  snap=protocol.dispatcher.snapshotState.snap
  return snap.valid and (snap.snapFlags&SNAPFLAG_NOT_ACTIVE)==0
end function

/// Adapts `mq3.shared.info.value` to server stream `mapName`, returning its result for `gamestate.configString(protocol.gamestateState,0), "mapname"`.
/// @param protocol Record read through `protocol.gamestateState`.
function mapName(protocol)
  return info.value(gamestate.configString(protocol.gamestateState,0),"mapname")
end function

/// Calls `mq3.compat.textnumbers.atoi`, `mq3.shared.info.value`, `mq3.client.gamestate.configString` and additional helpers from server stream `attach`. The final path returns `Stream(protocol,protocol.dispatcher.snapshotState,demoPlaying,pure)`.
/// @param protocol Record read through `protocol.gamestateState`, `protocol.dispatcher.snapshotState`.
/// @param demoPlaying Value used by `pure=not demoPlaying and streamNumbers.atoi(info.value(gamestate.configString(protocol.gamestateState,1),"sv_pure"))!=0`.
function attach(protocol,demoPlaying)
  pure=not demoPlaying and streamNumbers.atoi(info.value(gamestate.configString(protocol.gamestateState,1),"sv_pure"))!=0
  return Stream(protocol,protocol.dispatcher.snapshotState,demoPlaying,pure)
end function

/// Evaluates server stream `at` and returns `void`, `snapshot` according to its guard/selection conditions.
/// @param stream Record read through `stream.epoch`.
/// @param number Value tested by `number<0 or number>epoch.snap.messageNum or epoch.snap.messageNum-number>=snapshots.PACKET_BACKUP`, `not snapshot.valid or snapshot.messageNum!=number` before the calculation continues.
function at(stream,number)
  epoch=stream.epoch
  if number<0 or number>epoch.snap.messageNum or epoch.snap.messageNum-number>=snapshots.PACKET_BACKUP then return void end if
  snapshot=epoch.snapshots[number&snapshots.PACKET_MASK]
  if not snapshot.valid or snapshot.messageNum!=number then return void end if
  if epoch.entityState.parseEntitiesNum-snapshot.parseEntitiesNum>=entities.MAX_PARSE_ENTITIES then return void end if
  return snapshot
end function

/// Adapts `mq3.client.snapshot_parse.parsedEntity` to server stream `entity`, returning its result for `stream.epoch.entityState, snapshot.parseEntitiesNum+index`.
/// @param stream Record read through `stream.epoch.entityState`.
/// @param snapshot Record read through `snapshot.parseEntitiesNum`.
/// @param index Argument 2 of `mq3.client.snapshot_parse.parsedEntity`; passed as `snapshot.parseEntitiesNum+index`.
function entity(stream,snapshot,index)
  return entities.parsedEntity(stream.epoch.entityState,snapshot.parseEntitiesNum+index)
end function
