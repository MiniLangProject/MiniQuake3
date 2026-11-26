// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 SanitizeString, ClientNumberFromString and follow commands.
package mq3.game.follow_commands
import mq3.game.team_changes as teamChanges
import mq3.game.client_info as clientInfo
import mq3.game.votes as votes
import mq3.shared.info as infoStrings
import mq3.compat.textnumbers as textnum
import mq3.compat.numeric as n

/// Apply `mq3.shared.info.textBytes` while evaluating `sanitize`. Return paths include `decode(bytes(output))`.
/// @param text Text to parse, format or deliver.
function sanitize(text)
  data = infoStrings.textBytes(text); output = []; index = 0
  while index < len(data)
    part = data[index]; index = index+1
    if part == 27 then
      // Native in += 2 would pass the terminator for a trailing ESC.
      if index == len(data) then return error(492,"Incomplete ESC pair in client name") end if
      index = index+1; continue
    end if
    // Native x86 char is signed: high bytes also satisfy *in < 32.
    if part < 32 or part >= 128 then continue end if
    if part >= 65 and part <= 90 then part = part+32 end if
    output = output+[part]
  end while
  return decode(bytes(output))
end function
/// Require a valid client entity and return its client state for a spectator-follow command.
/// @param ent Game entity; accesses `client` and `slot`.
function caller(ent)
  if ent == void or ent.client == void or ent.slot < 0 or ent.slot >= 64 then return error(492,"Follow command requires a client entity") end if
  return ent.client
end function
/// Apply `mq3.game.follow_commands.caller`, `mq3.game.client_info.infoClientLimit` and `mq3.shared.info.textBytes` while evaluating `clientNumber`. Return paths include `-1`.
/// @param level Game-level state; accesses `maxclients` and `clients`.
/// @param ent Game entity; accesses `slot`.
/// @param text Text to parse, format or deliver.
function clientNumber(level,ent,text)
  caller(ent); clientInfo.infoClientLimit(level); data = infoStrings.textBytes(text)
  if len(data) > 1023 then return error(492,"Client lookup exceeds native name storage") end if
  if len(data) > 0 and data[0] >= 48 and data[0] <= 57 then
    slot = textnum.atoi(text)
    if slot < 0 or slot >= level.maxclients then votes.send(level,ent.slot,"print \"Bad client slot: "+str(slot)+"\n\""); return -1 end if
    if level.clients[slot].connected != 2 then votes.send(level,ent.slot,"print \"Client "+str(slot)+" is not active\n\""); return -1 end if
    return slot
  end if
  wanted = sanitize(text); index = 0
  while index < level.maxclients
    client = level.clients[index]
    if client.connected == 2 and sanitize(client.netname) == wanted then return index end if
    index = index+1
  end while
  votes.send(level,ent.slot,"print \"User "+text+" is not on the server\n\""); return -1
end function
/// Set `ent.client.spectatorState` to `2` and `ent.client.spectatorClient` to `slot` in `mq3.game.follow_commands.follow`.
/// @param level Game-level state; accesses `clients` and `spawner`.
/// @param ent Game entity; accesses `client`. May update `ent.client.spectatorState` and `ent.client.spectatorClient` in place.
/// @param argv Command argument strings in their original order.
function follow(level,ent,argv)
  client = caller(ent)
  if len(argv) != 2 then
    if client.spectatorState == 2 then teamChanges.stopFollowing(level,ent) end if
    return void
  end if
  slot = clientNumber(level,ent,infoStrings.copy(argv[1],1024))
  if slot == -1 then return void end if
  if level.clients[slot] == ent.client or level.clients[slot].team == 3 then return void end if
  if level.spawner == void then return error(492,"Follow requires game spawn state") end if
  if level.spawner.gametype == 1 and client.team == 0 then client.losses = n.add32(client.losses,1) end if
  if client.team != 3 then teamChanges.setTeam(level,ent,"spectator") end if
  ent.client.spectatorState = 2; ent.client.spectatorClient = slot; return void
end function
/// Set `ent.client.spectatorClient` to `slot` and `ent.client.spectatorState` to `2` in `mq3.game.follow_commands.cycle`.
/// @param level Game-level state; accesses `spawner`, `maxclients` and `clients`.
/// @param ent Game entity; accesses `client`. May update `ent.client.spectatorClient` and `ent.client.spectatorState` in place.
/// @param direction Value passed as argument 2 to `mq3.compat.numeric.add32`.
function cycle(level,ent,direction)
  client = caller(ent)
  if level.spawner == void then return error(492,"Follow cycle requires game spawn state") end if
  if level.spawner.gametype == 1 and client.team == 0 then client.losses = n.add32(client.losses,1) end if
  if client.spectatorState == 0 then teamChanges.setTeam(level,ent,"spectator") end if
  // The original checks direction only after its loss/team-change effects.
  if direction != 1 and direction != -1 then return error(492,"Invalid follow cycle direction") end if
  clientInfo.infoClientLimit(level)
  if level.maxclients == 0 then return error(492,"Follow cycle requires a nonempty client range") end if
  original = ent.client.spectatorClient; slot = original; visited = 0
  while visited < level.maxclients
    slot = n.add32(slot,direction)
    if slot >= level.maxclients then slot = 0 end if
    if slot < 0 then slot = level.maxclients-1 end if
    visited = visited+1
    if level.clients[slot].connected == 2 and level.clients[slot].team != 3 then
      ent.client.spectatorClient = slot; ent.client.spectatorState = 2; return void
    end if
    if slot == original then return void end if
  end while
  // No candidate and an out-of-range original can never terminate in C.
  return error(492,"Unresolvable follow cycle start")
end function
