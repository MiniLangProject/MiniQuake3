// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete C-named g_active.c surface.  Production logic remains split into
// client_active, client_frame and triggers so the server frame and spawn paths
// execute the same implementations exposed here.
package mq3.game.g_active
import mq3.game.client_active as clientActive
import mq3.game.client_frame as frame
import mq3.game.triggers as triggers

/// Forward `P_DamageFeedback` to `mq3.game.client_frame.damageFeedback` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param player Player entity; accesses `client`, `pain_debounce_time`, `flags` and `health`. May update `player.pain_debounce_time` in place.
function P_DamageFeedback(level,player) return frame.damageFeedback(level,player) end function
/// Forward `P_WorldEffects` to `mq3.game.client_frame.worldEffects` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `client`, `waterlevel`, `health`, `damage` and `pain_debounce_time` and related fields. May update `ent.damage` and `ent.pain_debounce_time` in place.
function P_WorldEffects(level,ent) return frame.worldEffects(level,ent) end function
/// Forward `G_SetClientSound` to `mq3.game.client_frame.setClientSound` and return the delegated result.
/// @param level Game-level state; accesses `sndFry`.
/// @param ent Game entity; accesses `waterlevel`, `watertype` and `client`. May update `ent.client.ps.loopSound` in place.
function G_SetClientSound(level,ent) return frame.setClientSound(level,ent) end function
/// Forward `ClientImpacts` to `mq3.game.client_active.impacts` and return the delegated result.
/// @param level Game-level state; accesses `entities`.
/// @param ent Game entity; accesses `r` and `touch`.
/// @param pm Player movement context; accesses `k`.
function ClientImpacts(level,ent,pm) return clientActive.impacts(level,ent,pm) end function
/// Forward `G_TouchTriggers` to `mq3.game.triggers.touch` and return the delegated result.
/// @param level Game-level state; accesses `scene`, `entities`, `doorTouch` and `time`.
/// @param ent Game entity; accesses `client`, `r` and `touch`. May update `ent.client.ps.jumppad_frame` and `ent.client.ps.jumppad_ent` in place.
function G_TouchTriggers(level,ent) return triggers.touch(level,ent) end function
/// Forward `SpectatorThink` to `mq3.game.client_active.spectatorThink` and return the delegated result.
/// @param level Game-level state; accesses `followCycleFn`.
/// @param ent Game entity; accesses `client` and `s`. May update `ent.s.origin` in place.
/// @param cmd Input user command; accesses `buttons`.
function SpectatorThink(level,ent,cmd) return clientActive.spectatorThink(level,ent,cmd) end function
/// Forward `ClientInactivityTimer` to `mq3.game.client_active.inactivityTimer` and return the delegated result.
/// @param level Game-level state; accesses `inactivity`, `time`, `dropClientFn` and `serverCommandFn`.
/// @param client Client state; accesses `inactivityTime`, `inactivityWarning`, `cmdForwardmove`, `cmdRightmove` and `cmdUpmove` and related fields. May update `client.inactivityTime` and `client.inactivityWarning` in place.
/// @param slot Slot in the owning table or pool.
function ClientInactivityTimer(level,client,slot) return clientActive.inactivityTimer(level,client,slot) end function
/// Forward `ClientTimerActions` to `mq3.game.client_active.timerActions` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `client` and `health`. May update `ent.health` in place.
/// @param msec Elapsed time in milliseconds.
function ClientTimerActions(level,ent,msec) return clientActive.timerActions(level,ent,msec) end function
/// Forward `ClientIntermissionThink` to `mq3.game.client_active.intermissionThink` and return the delegated result.
/// @param client Client state; accesses `ps`, `oldbuttons`, `buttons`, `cmdButtons` and `readyToExit`. May update `client.ps.eFlags`, `client.oldbuttons` and `client.buttons` and additional fields in place.
function ClientIntermissionThink(client) return clientActive.intermissionThink(client) end function
/// Forward `ClientEvents` to `mq3.game.client_active.clientEvents` and return the delegated result.
/// @param level Game-level state; accesses `dmflags`, `time`, `fireWeaponFn`, `spawner` and `itemDropFn`.
/// @param ent Game entity; accesses `client`, `s`, `pain_debounce_time` and `health`. May update `ent.pain_debounce_time` and `ent.health` in place.
/// @param oldEventSequence Player event sequence value before processing the current command.
function ClientEvents(level,ent,oldEventSequence) return clientActive.clientEvents(level,ent,oldEventSequence) end function
/// Forward `StuckInOtherClient` to `mq3.game.client_active.stuckInOtherClient` and return the delegated result.
/// @param level Game-level state; accesses `maxclients` and `entities`.
/// @param ent Game entity; accesses `r`.
function StuckInOtherClient(level,ent) return clientActive.stuckInOtherClient(level,ent) end function
/// Forward `SendPendingPredictableEvents` to `mq3.game.client_frame.sendPendingPredictableEvents` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ps Player movement state; accesses `entityEventSequence`, `eventSequence`, `events`, `externalEvent` and `origin` and related fields. May update `ps.externalEvent` in place.
function SendPendingPredictableEvents(level,ps) return frame.sendPendingPredictableEvents(level,ps) end function
/// Forward `ClientThink_real` to `mq3.game.client_active.realThink` and return the delegated result.
/// @param level Game-level state; accesses `time`, `pmoveMsec`, `cvarSetFn`, `pmoveFixed` and `intermissiontime` and related fields.
/// @param ent Game entity; accesses `client`, `slot`, `flags`, `r` and `eventTime` and related fields. May update `ent.flags`, `ent.r.mins` and `ent.r.maxs` and additional fields in place.
function ClientThink_real(level,ent) return clientActive.realThink(level,ent) end function
/// Forward `ClientThink` to `mq3.game.client_active.think` and return the delegated result.
/// @param level Game-level state; accesses `entities`, `usercmdFn`, `time` and `synchronousClients`.
/// @param clientNum Client slot number.
function ClientThink(level,clientNum) return clientActive.think(level,clientNum) end function
/// Forward `G_RunClient` to `mq3.game.client_active.runClient` and return the delegated result.
/// @param level Game-level state; accesses `synchronousClients` and `time`.
/// @param ent Game entity; accesses `r` and `client`. May update `ent.client.cmdServerTime` in place.
function G_RunClient(level,ent) return clientActive.runClient(level,ent) end function
/// Forward `SpectatorClientEndFrame` to `mq3.game.client_frame.spectatorEndFrame` and return the delegated result.
/// @param level Game-level state; accesses `follow1`, `follow2`, `clients` and `clientBeginFn`.
/// @param ent Game entity; accesses `client` and `slot`.
function SpectatorClientEndFrame(level,ent) return frame.spectatorEndFrame(level,ent) end function
/// Forward `ClientEndFrame` to `mq3.game.client_frame.endFrame` and return the delegated result.
/// @param level Game-level state; accesses `time`, `intermissiontime` and `smoothClients`.
/// @param ent Game entity; accesses `client`, `s` and `health`. May update `ent.s.eFlags` in place.
function ClientEndFrame(level,ent) return frame.endFrame(level,ent) end function
