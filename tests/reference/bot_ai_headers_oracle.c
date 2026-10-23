// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
#include <stdio.h>
#define WIN32 1
#include "../../Quake-III-Arena-original-source/code/game/g_local.h"
#include "../../Quake-III-Arena-original-source/code/game/q_shared.h"
#include "../../Quake-III-Arena-original-source/code/game/botlib.h"
#include "../../Quake-III-Arena-original-source/code/game/be_aas.h"
#include "../../Quake-III-Arena-original-source/code/game/be_ea.h"
#include "../../Quake-III-Arena-original-source/code/game/be_ai_char.h"
#include "../../Quake-III-Arena-original-source/code/game/be_ai_chat.h"
#include "../../Quake-III-Arena-original-source/code/game/be_ai_gen.h"
#include "../../Quake-III-Arena-original-source/code/game/be_ai_goal.h"
#include "../../Quake-III-Arena-original-source/code/game/be_ai_move.h"
#include "../../Quake-III-Arena-original-source/code/game/be_ai_weap.h"
#include "../../Quake-III-Arena-original-source/code/game/ai_main.h"
#include "../../Quake-III-Arena-original-source/code/game/ai_dmq3.h"
#include "../../Quake-III-Arena-original-source/code/game/ai_chat.h"
#include "../../Quake-III-Arena-original-source/code/game/ai_cmd.h"
#include "../../Quake-III-Arena-original-source/code/game/ai_dmnet.h"
#include "../../Quake-III-Arena-original-source/code/game/ai_team.h"
#include "../../Quake-III-Arena-original-source/code/game/ai_vcmd.h"

int main(void) {
  printf("%d,%d,%d,%d,%s,%s,%d,%d,%d,%d,%d,%d,%d,%d,"
         "%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,"
         "%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,"
         "%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",
    MAX_NODESWITCHES, CTF_FLAG_NONE, CTF_FLAG_RED, CTF_FLAG_BLUE,
    CTF_SKIN_REDTEAM, CTF_SKIN_BLUETEAM, MAX_ITEMS,
    BFL_STRAFERIGHT, BFL_ATTACKED, BFL_ATTACKJUMPED, BFL_AIMATENEMY,
    BFL_AVOIDRIGHT, BFL_IDEALVIEWSET, BFL_FIGHTSUICIDAL,
    LTG_TEAMHELP, LTG_TEAMACCOMPANY, LTG_DEFENDKEYAREA, LTG_GETFLAG,
    LTG_RUSHBASE, LTG_RETURNFLAG, LTG_CAMP, LTG_CAMPORDER, LTG_PATROL,
    LTG_GETITEM, LTG_KILL, LTG_HARVEST, LTG_ATTACKENEMYBASE,
    LTG_MAKELOVE_UNDER, LTG_MAKELOVE_ONTOP,
    TEAM_HELP_TIME, TEAM_ACCOMPANY_TIME, TEAM_DEFENDKEYAREA_TIME,
    TEAM_CAMP_TIME, TEAM_PATROL_TIME, TEAM_LEAD_TIME, TEAM_GETITEM_TIME,
    TEAM_KILL_SOMEONE, TEAM_ATTACKENEMYBASE_TIME, TEAM_HARVEST_TIME,
    CTF_GETFLAG_TIME, CTF_RUSHBASE_TIME, CTF_RETURNFLAG_TIME, CTF_ROAM_TIME,
    PATROL_LOOP, PATROL_REVERSE, PATROL_BACK, TEAMTP_DEFENDER,
    TEAMTP_ATTACKER, CTFS_AGRESSIVE, PRESENCE_NONE, PRESENCE_NORMAL,
    PRESENCE_CROUCH, MAX_PROXMINES, MAX_ACTIVATESTACK, MAX_ACTIVATEAREAS);
  return 0;
}
