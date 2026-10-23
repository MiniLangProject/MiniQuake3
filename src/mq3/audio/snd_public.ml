// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete public sound-system facade for code/client/snd_public.h.
package mq3.audio.snd_public
function declarationNames() return ["S_Init","S_Shutdown","S_StartSound","S_StartLocalSound","S_StartBackgroundTrack","S_StopBackgroundTrack","S_RawSamples","S_StopAllSounds","S_ClearLoopingSounds","S_AddLoopingSound","S_AddRealLoopingSound","S_StopLoopingSound","S_Respatialize","S_UpdateEntityPosition","S_Update","S_DisableSounds","S_BeginRegistration","S_RegisterSound","S_DisplayFreeMemory","S_ClearSoundBuffer","SNDDMA_Activate","S_UpdateBackgroundTrack"] end function
function validRawFormat(rate,width,channels) return rate>0 and (width==1 or width==2) and (channels==1 or channels==2) end function
function validEntity(entity) return entity>=0 and entity<1024 end function
function soundCommandKind(name) names=declarationNames();for index=0 to len(names)-1 if names[index]==name then return index end if end for;return -1 end function
