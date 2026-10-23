// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Public game/server ABI from code/game/g_public.h. Import opcodes live in
// mq3.game.syscalls and export dispatch lives in mq3.server.game_vm.
package mq3.game.g_public

const GAME_API_VERSION=8
const SVF_NOCLIENT=0x00000001
const SVF_CLIENTMASK=0x00000002
const SVF_BOT=0x00000008
const SVF_BROADCAST=0x00000020
const SVF_PORTAL=0x00000040
const SVF_USE_CURRENT_ORIGIN=0x00000080
const SVF_SINGLECLIENT=0x00000100
const SVF_NOSERVERINFO=0x00000200
const SVF_CAPSULE=0x00000400
const SVF_NOTSINGLECLIENT=0x00000800

const GAME_INIT=0
const GAME_SHUTDOWN=1
const GAME_CLIENT_CONNECT=2
const GAME_CLIENT_BEGIN=3
const GAME_CLIENT_USERINFO_CHANGED=4
const GAME_CLIENT_DISCONNECT=5
const GAME_CLIENT_COMMAND=6
const GAME_CLIENT_THINK=7
const GAME_RUN_FRAME=8
const GAME_CONSOLE_COMMAND=9
const BOTAI_START_FRAME=10

struct EntityShared s linked linkcount svFlags singleClient bmodel mins maxs contents absmin absmax currentOrigin currentAngles ownerNum end struct
struct SharedEntity s r end struct
function typeNames() return ["entityShared_t","sharedEntity_t"] end function

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
