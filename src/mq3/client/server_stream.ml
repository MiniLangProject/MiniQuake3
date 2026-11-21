// SPDX-License-Identifier: GPL-2.0-or-later
// Shared Cgame snapshot access for wire-protocol demos and server connections.
package mq3.client.server_stream

import mq3.client.gamestate as gamestate
import mq3.client.snapshot_command as snapshots
import mq3.client.snapshot_parse as entities
import mq3.shared.info as info
import mq3.compat.textnumbers as streamNumbers

const SNAPFLAG_NOT_ACTIVE = 2

struct Stream protocol epoch demoPlaying pure end struct

function ready(protocol)
  if protocol==void then return false end if
  snap=protocol.dispatcher.snapshotState.snap
  return snap.valid and (snap.snapFlags&SNAPFLAG_NOT_ACTIVE)==0
end function

function mapName(protocol)
  return info.value(gamestate.configString(protocol.gamestateState,0),"mapname")
end function

function attach(protocol,demoPlaying)
  pure=not demoPlaying and streamNumbers.atoi(info.value(gamestate.configString(protocol.gamestateState,1),"sv_pure"))!=0
  return Stream(protocol,protocol.dispatcher.snapshotState,demoPlaying,pure)
end function

function at(stream,number)
  epoch=stream.epoch
  if number<0 or number>epoch.snap.messageNum or epoch.snap.messageNum-number>=snapshots.PACKET_BACKUP then return void end if
  snapshot=epoch.snapshots[number&snapshots.PACKET_MASK]
  if not snapshot.valid or snapshot.messageNum!=number then return void end if
  if epoch.entityState.parseEntitiesNum-snapshot.parseEntitiesNum>=entities.MAX_PARSE_ENTITIES then return void end if
  return snapshot
end function

function entity(stream,snapshot,index)
  return entities.parsedEntity(stream.epoch.entityState,snapshot.parseEntitiesNum+index)
end function
