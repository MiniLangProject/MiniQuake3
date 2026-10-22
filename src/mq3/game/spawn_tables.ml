// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Generated from pinned g_spawn.c/bg_misc.c, baseq3 only.
package mq3.game.spawn_tables
function fields()
  return [["classname", "classname", "F_LSTRING"], ["origin", "s.origin", "F_VECTOR"], ["model", "model", "F_LSTRING"], ["model2", "model2", "F_LSTRING"], ["spawnflags", "spawnflags", "F_INT"], ["speed", "speed", "F_FLOAT"], ["target", "target", "F_LSTRING"], ["targetname", "targetname", "F_LSTRING"], ["message", "message", "F_LSTRING"], ["team", "team", "F_LSTRING"], ["wait", "wait", "F_FLOAT"], ["random", "random", "F_FLOAT"], ["count", "count", "F_INT"], ["health", "health", "F_INT"], ["light", "", "F_IGNORE"], ["dmg", "damage", "F_INT"], ["angles", "s.angles", "F_VECTOR"], ["angle", "s.angles", "F_ANGLEHACK"], ["targetShaderName", "targetShaderName", "F_LSTRING"], ["targetShaderNewName", "targetShaderNewName", "F_LSTRING"]]
end function
function classes()
  return ["info_player_start", "info_player_deathmatch", "info_player_intermission", "info_null", "info_notnull", "info_camp", "func_plat", "func_button", "func_door", "func_static", "func_rotating", "func_bobbing", "func_pendulum", "func_train", "func_group", "func_timer", "trigger_always", "trigger_multiple", "trigger_push", "trigger_teleport", "trigger_hurt", "target_give", "target_remove_powerups", "target_delay", "target_speaker", "target_print", "target_laser", "target_score", "target_teleporter", "target_relay", "target_kill", "target_position", "target_location", "target_push", "light", "path_corner", "misc_teleporter_dest", "misc_model", "misc_portal_surface", "misc_portal_camera", "shooter_rocket", "shooter_grenade", "shooter_plasma", "team_CTF_redplayer", "team_CTF_blueplayer", "team_CTF_redspawn", "team_CTF_bluespawn", "item_botroam", "team_redobelisk", "team_blueobelisk", "team_neutralobelisk"]
end function
function items()
  return ["", "item_armor_shard", "item_armor_combat", "item_armor_body", "item_health_small", "item_health", "item_health_large", "item_health_mega", "weapon_gauntlet", "weapon_shotgun", "weapon_machinegun", "weapon_grenadelauncher", "weapon_rocketlauncher", "weapon_lightning", "weapon_railgun", "weapon_plasmagun", "weapon_bfg", "weapon_grapplinghook", "ammo_shells", "ammo_bullets", "ammo_grenades", "ammo_cells", "ammo_lightning", "ammo_rockets", "ammo_slugs", "ammo_bfg", "holdable_teleporter", "holdable_medkit", "item_quad", "item_enviro", "item_haste", "item_invis", "item_regen", "item_flight", "team_CTF_redflag", "team_CTF_blueflag"]
end function
function missionpackItems()
  // Team Arena appends these descriptors after the complete Baseq3 table.
  return items()+["holdable_kamikaze","holdable_portal","holdable_invulnerability","ammo_nails","ammo_mines","ammo_belt","item_scout","item_guard","item_doubler","item_ammoregen","team_CTF_neutralflag","item_redcube","item_bluecube","weapon_nailgun","weapon_prox_launcher","weapon_chaingun"]
end function
