// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 g_cmds.c cheats, inventory, team task and view-position commands.
package mq3.game.utility_commands
import mq3.game.constants as c
import mq3.game.command_args as commandArgs
import mq3.game.entities as utilityEntities
import mq3.game.items as utilityItems
import mq3.game.movement as utilityMovement
import mq3.game.deaths as utilityDeaths
import mq3.game.intermission as utilityIntermission
import mq3.game.teleport as utilityTeleport
import mq3.game.session as utilitySessions
import mq3.game.votes as utilityVotes
import mq3.collision.brush as utilityBrush
import mq3.shared.info as utilityInfo
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import std.string as strings

/// Use `level.serverCommandFn` to perform `utilitySend`.
/// @param level Game-level state; accesses `serverCommandFn`.
/// @param ent Game entity; accesses `slot`.
/// @param message Message text supplied to the diagnostic or chat operation.
function utilitySend(level,ent,message)
  if ent == void then return error(488,"Utility command requires an entity") end if
  if level.serverCommandFn == void then return error(488,"Utility command requires server-command delivery") end if
  level.serverCommandFn(level,ent.slot,message); return void
end function

/// Apply `mq3.game.utility_commands.utilitySend` while evaluating `cheatsOk`.
/// @param level Game-level state; accesses `cheats`.
/// @param ent Game entity; accesses `health`.
function cheatsOk(level,ent)
  if level.cheats == 0 then
    utilitySend(level,ent,"print \"Cheats are not enabled on this server.\n\""); return false
  end if
  if ent == void then return error(488,"Cheat command requires an entity") end if
  if ent.health <= 0 then
    utilitySend(level,ent,"print \"You must be alive to use this command.\n\""); return false
  end if
  return true
end function

/// Apply `mq3.shared.info.textBytes` while evaluating `utilityFindItem`.
/// @param name Name used to identify the requested entry.
function utilityFindItem(name)
  // BG_FindItem compares pickup_name, not the entity classname. The order is
  // bg_itemlist + 1 through the baseq3 sentinel, matching spawn_tables.items.
  names = ["","Armor Shard","Armor","Heavy Armor","5 Health","25 Health","50 Health","Mega Health",
    "Gauntlet","Shotgun","Machinegun","Grenade Launcher","Rocket Launcher","Lightning Gun","Railgun",
    "Plasma Gun","BFG10K","Grappling Hook","Shells","Bullets","Grenades","Cells","Lightning","Rockets",
    "Slugs","Bfg Ammo","Personal Teleporter","Medkit","Quad Damage","Battle Suit","Speed",
    "Invisibility","Regeneration","Flight","Red Flag","Blue Flag"]
  utilityInfo.textBytes(name); index = 1
  while index < len(names)
    if strings.equalsIgnoreCaseAscii(names[index],name) then return index end if
    index = index+1
  end while
  return 0
end function

/// Update `ent.health`, `ent.client.ps.stats[c.STAT_WEAPONS]`, `ent.client.ps.ammo[index]` and `ent.client.ps.stats[c.STAT_ARMOR]` and related state during `give`.
/// @param level Game-level state; accesses `cheats`.
/// @param ent Game entity; accesses `client`, `health` and `r`. May update `ent.health`, `ent.client.ps.stats[c.STAT_WEAPONS]` and `ent.client.ps.ammo[index]` and additional fields in place.
/// @param argv Command argument strings in their original order.
function give(level,ent,argv)
  if not cheatsOk(level,ent) then return void end if
  name = commandArgs.concat(argv,1); giveAll = strings.equalsIgnoreCaseAscii(name,"all")
  if ent.client == void then return error(488,"Give requires a client entity") end if
  if giveAll or strings.equalsIgnoreCaseAscii(name,"health") then
    // Original Cmd_Give_f changes entity health without synchronizing STAT_HEALTH.
    ent.health = ent.client.ps.stats[c.STAT_MAX_HEALTH]
    if not giveAll then return void end if
  end if
  if giveAll or strings.equalsIgnoreCaseAscii(name,"weapons") then
    ent.client.ps.stats[c.STAT_WEAPONS] = (1 << c.WP_NUM_WEAPONS)-1-(1 << c.WP_GRAPPLING_HOOK)-(1 << c.WP_NONE)
    if not giveAll then return void end if
  end if
  if giveAll or strings.equalsIgnoreCaseAscii(name,"ammo") then
    for index = 0 to 15
      ent.client.ps.ammo[index] = 999
    end for
    if not giveAll then return void end if
  end if
  if giveAll or strings.equalsIgnoreCaseAscii(name,"armor") then
    ent.client.ps.stats[c.STAT_ARMOR] = 200
    if not giveAll then return void end if
  end if
  award = -1
  if strings.equalsIgnoreCaseAscii(name,"excellent") then award = c.PERS_EXCELLENT_COUNT
  else if strings.equalsIgnoreCaseAscii(name,"impressive") then award = c.PERS_IMPRESSIVE_COUNT
  else if strings.equalsIgnoreCaseAscii(name,"gauntletaward") then award = c.PERS_GAUNTLET_FRAG_COUNT
  else if strings.equalsIgnoreCaseAscii(name,"defend") then award = c.PERS_DEFEND_COUNT
  else if strings.equalsIgnoreCaseAscii(name,"assist") then award = c.PERS_ASSIST_COUNT end if
  if award != -1 then
    ent.client.ps.persistant[award] = n.add32(ent.client.ps.persistant[award],1); return void
  end if
  if not giveAll then
    item = utilityFindItem(name)
    if item == 0 then return void end if
    given = utilityEntities.spawn(level); given.s.origin = utilityMovement.copy(ent.r.currentOrigin)
    given.classname = utilityItems.itemName(item)
    utilityItems.spawnItem(level,given,item); utilityItems.finishSpawning(level,given)
    trace = utilityBrush.Trace(0.0,[0.0,0.0,0.0],0.0,0,0,false,false,0)
    hit = utilityMovement.Collision(trace,[0.0,0.0,0.0],0)
    utilityItems.touch(level,given,ent,hit)
    if given.inuse then utilityEntities.free(level,given) end if
  end if
  return void
end function

/// Set `ent.flags` to `ent.flags ^ 0x10` in `mq3.game.utility_commands.god`. Return paths include `utilitySend(level,ent,"print \""+message+"\"")`.
/// @param level Game-level state; accesses `cheats`.
/// @param ent Game entity; accesses `flags`. May update `ent.flags` in place.
function god(level,ent)
  if not cheatsOk(level,ent) then return void end if
  ent.flags = ent.flags ^ 0x10; message = "godmode ON\n"
  if (ent.flags & 0x10) == 0 then message = "godmode OFF\n" end if
  return utilitySend(level,ent,"print \""+message+"\"")
end function

/// Set `ent.flags` to `ent.flags ^ 0x20` in `mq3.game.utility_commands.notarget`. Return paths include `utilitySend(level,ent,"print \""+message+"\"")`.
/// @param level Game-level state; accesses `cheats`.
/// @param ent Game entity; accesses `flags`. May update `ent.flags` in place.
function notarget(level,ent)
  if not cheatsOk(level,ent) then return void end if
  ent.flags = ent.flags ^ 0x20; message = "notarget ON\n"
  if (ent.flags & 0x20) == 0 then message = "notarget OFF\n" end if
  return utilitySend(level,ent,"print \""+message+"\"")
end function

/// Set `ent.client.noclip` to `not ent.client.noclip` in `mq3.game.utility_commands.noclip`. Return paths include `utilitySend(level,ent,"print \""+message+"\"")`.
/// @param level Game-level state; accesses `cheats`.
/// @param ent Game entity; accesses `client`. May update `ent.client.noclip` in place.
function noclip(level,ent)
  if not cheatsOk(level,ent) then return void end if
  if ent.client == void then return error(488,"Noclip requires a client entity") end if
  message = "noclip ON\n"
  if ent.client.noclip then message = "noclip OFF\n" end if
  ent.client.noclip = not ent.client.noclip
  return utilitySend(level,ent,"print \""+message+"\"")
end function

/// Apply `mq3.game.utility_commands.cheatsOk`, `mq3.game.utility_commands.utilitySend` and `mq3.game.intermission.begin` while evaluating `levelshot`. Return paths include `utilitySend(level,ent,"clientLevelShot")`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `health`.
function levelshot(level,ent)
  if not cheatsOk(level,ent) then return void end if
  if level.spawner == void then return error(488,"Levelshot requires game spawn state") end if
  if level.spawner.gametype != 0 then return utilitySend(level,ent,"print \"Must be in g_gametype 0 for levelshot\n\"") end if
  utilityIntermission.begin(level)
  return utilitySend(level,ent,"clientLevelShot")
end function

/// Use `level.gamePrintFn` to perform `utilityInfoDiagnostic`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param message Message text supplied to the diagnostic or chat operation.
function utilityInfoDiagnostic(level,message)
  if level.gamePrintFn == void then return error(488,"Info mutation requires game diagnostic delivery") end if
  level.gamePrintFn(level,message); return void
end function

/// Use `level.userinfoFn` and `level.userinfoSetFn` to perform `teamTask`. Return paths include `utilityVotes.userinfoChanged(level,clientSlot)`.
/// @param level Game-level state; accesses `userinfoFn` and `userinfoSetFn`.
/// @param ent Game entity; accesses `client`.
/// @param argv Command argument strings in their original order.
function teamTask(level,ent,argv)
  if ent == void then return error(488,"Team task requires an entity") end if
  clientSlot = utilitySessions.sessionSlot(level,ent.client)
  if len(argv) != 2 then return void end if
  task = textnum.atoi(commandArgs.argument(argv,1,1024))
  if level.userinfoFn == void then return error(488,"Team task requires engine userinfo delivery") end if
  info = utilityInfo.copy(level.userinfoFn(level,clientSlot),1024)
  info = utilityInfo.setValue(info,"teamtask",str(task),level,utilityInfoDiagnostic)
  if level.userinfoSetFn == void then return error(488,"Team task requires engine userinfo storage") end if
  level.userinfoSetFn(level,clientSlot,info)
  return utilityVotes.userinfoChanged(level,clientSlot)
end function

/// Update `ent.flags`, `ent.client.ps.stats[c.STAT_HEALTH]` and `ent.health` during `kill`. Return paths include `utilityDeaths.playerDie(level,ent,ent,ent,100000,c.MOD_SUICIDE)`.
/// @param level Game-level state; accesses `intermissiontime`, `time`, `scene`, `maxclients` and `clients` and related fields. May update `level.deathAnimIndex` in place.
/// @param ent Game entity; accesses `client`, `health` and `flags`. May update `ent.flags`, `ent.client.ps.stats[c.STAT_HEALTH]` and `ent.health` in place.
function kill(level,ent)
  if ent == void or ent.client == void then return error(488,"Kill requires a client entity") end if
  if ent.client.team == c.TEAM_SPECTATOR or ent.health <= 0 then return void end if
  ent.flags = ent.flags & ~0x10; ent.client.ps.stats[c.STAT_HEALTH] = -999; ent.health = -999
  return utilityDeaths.playerDie(level,ent,ent,ent,100000,c.MOD_SUICIDE)
end function

/// Apply `mq3.game.utility_commands.utilitySend`, `mq3.game.command_args.argument` and `mq3.game.teleport.player` while evaluating `setViewpos`. Return paths include `utilityTeleport.player(level,ent,origin,angles)`.
/// @param level Game-level state; accesses `cheats`.
/// @param ent Game entity; accesses `slot`.
/// @param argv Command argument strings in their original order.
function setViewpos(level,ent,argv)
  // This command checks only cheats, deliberately allowing dead players.
  if level.cheats == 0 then return utilitySend(level,ent,"print \"Cheats are not enabled on this server.\n\"") end if
  if len(argv) != 5 then return utilitySend(level,ent,"print \"usage: setviewpos x y z yaw\n\"") end if
  origin = [0.0,0.0,0.0]; angles = [0.0,0.0,0.0]
  for axis = 0 to 2
    origin[axis] = n.f32(textnum.atof(commandArgs.argument(argv,axis+1,1024)))
  end for
  angles[1] = n.f32(textnum.atof(commandArgs.argument(argv,4,1024)))
  return utilityTeleport.player(level,ent,origin,angles)
end function

/// Return `void` for `stats`.
/// @param level Not read by this implementation; retained in the `stats` signature.
/// @param ent Not read by this implementation; retained in the `stats` signature.
function stats(level,ent)
  // The entire Cmd_Stats_f body is commented out in the pinned baseq3 source.
  return void
end function
