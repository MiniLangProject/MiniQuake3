// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete C-named g_active.c surface.  Production logic remains split into
// client_active, client_frame and triggers so the server frame and spawn paths
// execute the same implementations exposed here.
package mq3.game.g_active
import mq3.game.client_active as clientActive
import mq3.game.client_frame as frame
import mq3.game.triggers as triggers

function P_DamageFeedback(level,player) return frame.damageFeedback(level,player) end function
function P_WorldEffects(level,ent) return frame.worldEffects(level,ent) end function
function G_SetClientSound(level,ent) return frame.setClientSound(level,ent) end function
function ClientImpacts(level,ent,pm) return clientActive.impacts(level,ent,pm) end function
function G_TouchTriggers(level,ent) return triggers.touch(level,ent) end function
function SpectatorThink(level,ent,cmd) return clientActive.spectatorThink(level,ent,cmd) end function
function ClientInactivityTimer(level,client,slot) return clientActive.inactivityTimer(level,client,slot) end function
function ClientTimerActions(level,ent,msec) return clientActive.timerActions(level,ent,msec) end function
function ClientIntermissionThink(client) return clientActive.intermissionThink(client) end function
function ClientEvents(level,ent,oldEventSequence) return clientActive.clientEvents(level,ent,oldEventSequence) end function
function StuckInOtherClient(level,ent) return clientActive.stuckInOtherClient(level,ent) end function
function SendPendingPredictableEvents(level,ps) return frame.sendPendingPredictableEvents(level,ps) end function
function ClientThink_real(level,ent) return clientActive.realThink(level,ent) end function
function ClientThink(level,clientNum) return clientActive.think(level,clientNum) end function
function G_RunClient(level,ent) return clientActive.runClient(level,ent) end function
function SpectatorClientEndFrame(level,ent) return frame.spectatorEndFrame(level,ent) end function
function ClientEndFrame(level,ent) return frame.endFrame(level,ent) end function
