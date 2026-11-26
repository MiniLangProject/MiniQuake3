// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Canonical contracts from the Baseq3 game AI headers.
package mq3.game.bot_ai_headers

/// Upper bound on nodeswitches represented by mq3.game.bot_ai_headers.
const MAX_NODESWITCHES=50
/// Capture-the-flag scoring or timing parameter for flag none.
const CTF_FLAG_NONE=0
/// Capture-the-flag scoring or timing parameter for flag red.
const CTF_FLAG_RED=1
/// Capture-the-flag scoring or timing parameter for flag blue.
const CTF_FLAG_BLUE=2
/// Capture-the-flag scoring or timing parameter for skin redteam.
const CTF_SKIN_REDTEAM="red"
/// Capture-the-flag scoring or timing parameter for skin blueteam.
const CTF_SKIN_BLUETEAM="blue"
/// Maximum number of item definitions indexed by the game and client game.
const MAX_ITEMS=256
/// Bot-state flag marking straferight.
const BFL_STRAFERIGHT=1
/// Bot-state flag marking attacked.
const BFL_ATTACKED=2
/// Bot-state flag marking attackjumped.
const BFL_ATTACKJUMPED=4
/// Bot-state flag marking aimatenemy.
const BFL_AIMATENEMY=8
/// Bot-state flag marking avoidright.
const BFL_AVOIDRIGHT=16
/// Bot-state flag marking idealviewset.
const BFL_IDEALVIEWSET=32
/// Bot-state flag marking fightsuicidal.
const BFL_FIGHTSUICIDAL=64
/// Long-term bot goal identifier selecting teamhelp behavior.
const LTG_TEAMHELP=1
/// Long-term bot goal identifier selecting teamaccompany behavior.
const LTG_TEAMACCOMPANY=2
/// Long-term bot goal identifier selecting defend a key area behavior.
const LTG_DEFENDKEYAREA=3
/// Long-term bot goal identifier selecting capture the flag behavior.
const LTG_GETFLAG=4
/// Long-term bot goal identifier selecting rush the base behavior.
const LTG_RUSHBASE=5
/// Long-term bot goal identifier selecting return the flag behavior.
const LTG_RETURNFLAG=6
/// Long-term bot goal identifier selecting camp behavior.
const LTG_CAMP=7
/// Long-term bot goal identifier selecting follow a camp order behavior.
const LTG_CAMPORDER=8
/// Long-term bot goal identifier selecting patrol behavior.
const LTG_PATROL=9
/// Long-term bot goal identifier selecting getitem behavior.
const LTG_GETITEM=10
/// Long-term bot goal identifier selecting kill behavior.
const LTG_KILL=11
/// Long-term bot goal identifier selecting harvest behavior.
const LTG_HARVEST=12
/// Long-term bot goal identifier selecting attackenemybase behavior.
const LTG_ATTACKENEMYBASE=13
/// Long-term bot goal identifier selecting makelove under behavior.
const LTG_MAKELOVE_UNDER=14
/// Long-term bot goal identifier selecting makelove ontop behavior.
const LTG_MAKELOVE_ONTOP=15
/// Duration in seconds allowed for the bot team task to help.
const TEAM_HELP_TIME=60
/// Duration in seconds allowed for the bot team task to accompany.
const TEAM_ACCOMPANY_TIME=600
/// Duration in seconds allowed for the bot team task to defend a key area.
const TEAM_DEFENDKEYAREA_TIME=600
/// Duration in seconds allowed for the bot team task to camp.
const TEAM_CAMP_TIME=600
/// Duration in seconds allowed for the bot team task to patrol.
const TEAM_PATROL_TIME=600
/// Duration in seconds allowed for the bot team task to lead.
const TEAM_LEAD_TIME=600
/// Duration in seconds allowed for the bot team task to getitem.
const TEAM_GETITEM_TIME=60
/// Lifetime in seconds of a bot order to kill a designated enemy.
const TEAM_KILL_SOMEONE=180
/// Duration in seconds allowed for the bot team task to attackenemybase.
const TEAM_ATTACKENEMYBASE_TIME=600
/// Duration in seconds allowed for the bot team task to harvest.
const TEAM_HARVEST_TIME=120
/// Capture-the-flag scoring or timing parameter for capture the flag time.
const CTF_GETFLAG_TIME=600
/// Capture-the-flag scoring or timing parameter for rush the base time.
const CTF_RUSHBASE_TIME=120
/// Capture-the-flag scoring or timing parameter for return the flag time.
const CTF_RETURNFLAG_TIME=180
/// Capture-the-flag scoring or timing parameter for roam time.
const CTF_ROAM_TIME=60
/// Patrol behavior flag enabling loop.
const PATROL_LOOP=1
/// Patrol behavior flag enabling reverse.
const PATROL_REVERSE=2
/// Patrol behavior flag enabling back.
const PATROL_BACK=4
/// Bot team-task preference bit indicating a preference for defender.
const TEAMTP_DEFENDER=1
/// Bot team-task preference bit indicating a preference for attacker.
const TEAMTP_ATTACKER=2
/// Capture-the-flag strategy identifier selecting agressive.
const CTFS_AGRESSIVE=1
/// AAS presence-mask value selecting the none collision shape.
const PRESENCE_NONE=1
/// AAS presence-mask value selecting the normal collision shape.
const PRESENCE_NORMAL=2
/// AAS presence-mask value selecting the crouch collision shape.
const PRESENCE_CROUCH=4
/// Upper bound on proxmines represented by mq3.game.bot_ai_headers.
const MAX_PROXMINES=64
/// Upper bound on activatestack represented by mq3.game.bot_ai_headers.
const MAX_ACTIVATESTACK=8
/// Upper bound on activateareas represented by mq3.game.bot_ai_headers.
const MAX_ACTIVATEAREAS=32

/// Return the ordered constant names table for bot ai headers: 55 entries beginning with `"MAX_NODESWITCHES"` and `"CTF_FLAG_NONE"`.
function constantNames() return ["MAX_NODESWITCHES","CTF_FLAG_NONE","CTF_FLAG_RED","CTF_FLAG_BLUE","CTF_SKIN_REDTEAM","CTF_SKIN_BLUETEAM","MAX_ITEMS","BFL_STRAFERIGHT","BFL_ATTACKED","BFL_ATTACKJUMPED","BFL_AIMATENEMY","BFL_AVOIDRIGHT","BFL_IDEALVIEWSET","BFL_FIGHTSUICIDAL","LTG_TEAMHELP","LTG_TEAMACCOMPANY","LTG_DEFENDKEYAREA","LTG_GETFLAG","LTG_RUSHBASE","LTG_RETURNFLAG","LTG_CAMP","LTG_CAMPORDER","LTG_PATROL","LTG_GETITEM","LTG_KILL","LTG_HARVEST","LTG_ATTACKENEMYBASE","LTG_MAKELOVE_UNDER","LTG_MAKELOVE_ONTOP","TEAM_HELP_TIME","TEAM_ACCOMPANY_TIME","TEAM_DEFENDKEYAREA_TIME","TEAM_CAMP_TIME","TEAM_PATROL_TIME","TEAM_LEAD_TIME","TEAM_GETITEM_TIME","TEAM_KILL_SOMEONE","TEAM_ATTACKENEMYBASE_TIME","TEAM_HARVEST_TIME","CTF_GETFLAG_TIME","CTF_RUSHBASE_TIME","CTF_RETURNFLAG_TIME","CTF_ROAM_TIME","PATROL_LOOP","PATROL_REVERSE","PATROL_BACK","TEAMTP_DEFENDER","TEAMTP_ATTACKER","CTFS_AGRESSIVE","PRESENCE_NONE","PRESENCE_NORMAL","PRESENCE_CROUCH","MAX_PROXMINES","MAX_ACTIVATESTACK","MAX_ACTIVATEAREAS"] end function
/// Return the ordered constant values table for bot ai headers: 55 entries beginning with `MAX_NODESWITCHES` and `CTF_FLAG_NONE`.
function constantValues() return [MAX_NODESWITCHES,CTF_FLAG_NONE,CTF_FLAG_RED,CTF_FLAG_BLUE,CTF_SKIN_REDTEAM,CTF_SKIN_BLUETEAM,MAX_ITEMS,BFL_STRAFERIGHT,BFL_ATTACKED,BFL_ATTACKJUMPED,BFL_AIMATENEMY,BFL_AVOIDRIGHT,BFL_IDEALVIEWSET,BFL_FIGHTSUICIDAL,LTG_TEAMHELP,LTG_TEAMACCOMPANY,LTG_DEFENDKEYAREA,LTG_GETFLAG,LTG_RUSHBASE,LTG_RETURNFLAG,LTG_CAMP,LTG_CAMPORDER,LTG_PATROL,LTG_GETITEM,LTG_KILL,LTG_HARVEST,LTG_ATTACKENEMYBASE,LTG_MAKELOVE_UNDER,LTG_MAKELOVE_ONTOP,TEAM_HELP_TIME,TEAM_ACCOMPANY_TIME,TEAM_DEFENDKEYAREA_TIME,TEAM_CAMP_TIME,TEAM_PATROL_TIME,TEAM_LEAD_TIME,TEAM_GETITEM_TIME,TEAM_KILL_SOMEONE,TEAM_ATTACKENEMYBASE_TIME,TEAM_HARVEST_TIME,CTF_GETFLAG_TIME,CTF_RUSHBASE_TIME,CTF_RETURNFLAG_TIME,CTF_ROAM_TIME,PATROL_LOOP,PATROL_REVERSE,PATROL_BACK,TEAMTP_DEFENDER,TEAMTP_ATTACKER,CTFS_AGRESSIVE,PRESENCE_NONE,PRESENCE_NORMAL,PRESENCE_CROUCH,MAX_PROXMINES,MAX_ACTIVATESTACK,MAX_ACTIVATEAREAS] end function
/// Return a new array `["bot_waypoint_t","bot_activategoal_t","bot_state_t"]` for `typeNames`.
function typeNames() return ["bot_waypoint_t","bot_activategoal_t","bot_state_t"] end function
/// Return a new array `["inuse","name","goal","next","prev"]` for `waypointFieldNames`.
function waypointFieldNames() return ["inuse","name","goal","next","prev"] end function
/// Return a new array `["inuse","goal","time","start_time","justused_time","shoot","weapon","target","origin","areas","numareas","areasdisabled","next"]` for `activateGoalFieldNames`.
function activateGoalFieldNames() return ["inuse","goal","time","start_time","justused_time","shoot","weapon","target","origin","areas","numareas","areasdisabled","next"] end function
/// Return the ordered bot state field names table for bot ai headers: 145 entries beginning with `"inuse"` and `"botthink_residual"`.
function botStateFieldNames() return ["inuse","botthink_residual","client","entitynum","cur_ps","last_eFlags","lastucmd","entityeventTime","settings","ainode","thinktime","origin","velocity","presencetype","eye","areanum","inventory","tfl","flags","respawn_wait","lasthealth","lastkilledplayer","lastkilledby","botdeathtype","enemydeathtype","botsuicide","enemysuicide","setupcount","map_restart","entergamechat","num_deaths","num_kills","revenge_enemy","revenge_kills","lastframe_health","lasthitcount","chatto","walker","ltime","entergame_time","ltg_time","nbg_time","respawn_time","respawnchat_time","chase_time","enemyvisible_time","check_time","stand_time","lastchat_time","kamikaze_time","invulnerability_time","standfindenemy_time","attackstrafe_time","attackcrouch_time","attackchase_time","attackjump_time","enemysight_time","enemydeath_time","enemyposition_time","defendaway_time","defendaway_range","rushbaseaway_time","attackaway_time","harvestaway_time","ctfroam_time","killedenemy_time","arrive_time","lastair_time","teleport_time","camp_time","camp_range","weaponchange_time","firethrottlewait_time","firethrottleshoot_time","notblocked_time","blockedbyavoidspot_time","predictobstacles_time","predictobstacles_goalareanum","aimtarget","enemyvelocity","enemyorigin","kamikazebody","proxmines","numproxmines","character","ms","gs","cs","ws","enemy","lastenemyareanum","lastenemyorigin","weaponnum","viewangles","ideal_viewangles","viewanglespeed","ltgtype","teammate","decisionmaker","ordered","order_time","owndecision_time","teamgoal","altroutegoal","reachedaltroutegoal_time","teammessage_time","teamgoal_time","teammatevisible_time","teamtaskpreference","lastgoal_decisionmaker","lastgoal_ltgtype","lastgoal_teammate","lastgoal_teamgoal","lead_teammate","lead_teamgoal","lead_time","leadvisible_time","leadmessage_time","leadbackup_time","teamleader","askteamleader_time","becometeamleader_time","teamgiveorders_time","lastflagcapture_time","numteammates","redflagstatus","blueflagstatus","neutralflagstatus","flagstatuschanged","forceorders","flagcarrier","ctfstrategy","subteam","formation_dist","formation_teammate","formation_angle","formation_dir","formation_origin","formation_goal","activatestack","activategoalheap","checkpoints","patrolpoints","curpatrolpoint","patrolflags"] end function
/// Return the ordered declaration names table for bot ai headers: 135 entries beginning with `"BotChat_EnterGame"` and `"BotChat_ExitGame"`.
function declarationNames() return ["BotChat_EnterGame","BotChat_ExitGame","BotChat_StartLevel","BotChat_EndLevel","BotChat_HitTalking","BotChat_HitNoDeath","BotChat_HitNoKill","BotChat_Death","BotChat_Kill","BotChat_EnemySuicide","BotChat_Random","BotChatTime","BotValidChatPosition","BotChatTest","BotMatchMessage","BotPrintTeamGoal","AIEnter_Intermission","AIEnter_Observer","AIEnter_Respawn","AIEnter_Stand","AIEnter_Seek_ActivateEntity","AIEnter_Seek_NBG","AIEnter_Seek_LTG","AIEnter_Seek_Camp","AIEnter_Battle_Fight","AIEnter_Battle_Chase","AIEnter_Battle_Retreat","AIEnter_Battle_NBG","AINode_Intermission","AINode_Observer","AINode_Respawn","AINode_Stand","AINode_Seek_ActivateEntity","AINode_Seek_NBG","AINode_Seek_LTG","AINode_Battle_Fight","AINode_Battle_Chase","AINode_Battle_Retreat","AINode_Battle_NBG","BotResetNodeSwitches","BotDumpNodeSwitches","BotSetupDeathmatchAI","BotShutdownDeathmatchAI","BotDeathmatchAI","BotFreeWaypoints","BotChooseWeapon","BotSetupForMovement","BotUpdateInventory","BotUpdateBattleInventory","BotBattleUseItems","BotIsDead","BotIsObserver","BotIntermission","BotInLavaOrSlime","EntityIsDead","EntityIsInvisible","EntityIsShooting","EntityHasKamikaze","BotSetUserInfo","BotSetTeamStatus","ClientName","EasyClientName","ClientSkin","BotSynonymContext","BotSetLastOrderedTask","BotTeamGoals","BotAggression","BotFeelingBad","BotWantsToRetreat","BotWantsToChase","BotWantsToHelp","BotCanAndWantsToRocketJump","BotHasPersistantPowerupAndWeapon","BotWantsToCamp","BotAttackMove","BotSameTeam","TeamPlayIsOn","BotTeamFlagCarrier","BotTeamFlagCarrierVisible","BotEnemyFlagCarrierVisible","BotVisibleTeamMatesAndEnemies","InFieldOfVision","BotFindEnemy","BotRoamGoal","BotEntityVisible","BotAimAtEnemy","BotCheckAttack","BotAIBlocked","BotAIPredictObstacles","BotEnableActivateGoalAreas","BotPopFromActivateGoalStack","BotClearActivateGoalStack","BotTeam","BotOppositeTeam","BotCTFCarryingFlag","BotRememberLastOrderedTask","BotCTFSeekGoals","BotCTFRetreatGoals","Bot1FCTFCarryingFlag","BotHarvesterCarryingCubes","Bot1FCTFSeekGoals","Bot1FCTFRetreatGoals","BotObeliskSeekGoals","BotObeliskRetreatGoals","BotGoHarvest","BotHarvesterSeekGoals","BotHarvesterRetreatGoals","BotTeamCubeCarrierVisible","BotEnemyCubeCarrierVisible","BotGetAlternateRouteGoal","BotAlternateRoute","BotCreateWayPoint","BotFindWayPoint","stristr","ClientFromName","ClientOnSameTeamFromName","BotPointAreaNum","BotMapScripts","BotResetState","NumBots","BotEntityInfo","BotAI_Print","BotAI_BotInitialChat","BotAI_Trace","BotAI_GetClientState","BotAI_GetEntityState","BotAI_GetSnapshotEntity","BotTeamLeader","BotTeamAI","BotGetTeamMateTaskPreference","BotSetTeamMateTaskPreference","BotVoiceChat","BotVoiceChatOnly","BotVoiceChatCommand","BotVoiceChat_Defend"] end function
/// Return the ordered global names table for bot ai headers: 16 entries beginning with `"notleader"` and `"gametype"`.
function globalNames() return ["notleader","gametype","maxclients","bot_grapple","bot_rocketjump","bot_fastchat","bot_nochat","bot_testrchat","bot_challenge","ctf_redflag","ctf_blueflag","ctf_neutralflag","redobelisk","blueobelisk","neutralobelisk","floattime"] end function
/// Test `value==PRESENCE_NONE or value==PRESENCE_NORMAL or value==PRESENCE_CROUCH` as the condition for `validPresence`.
/// @param value Operand used to evaluate the returned expression `value==PRESENCE_NONE or value==PRESENCE_NORMAL or value==PRESENCE_CROUCH`.
function validPresence(value) return value==PRESENCE_NONE or value==PRESENCE_NORMAL or value==PRESENCE_CROUCH end function
/// Test `value==TEAMTP_DEFENDER or value==TEAMTP_ATTACKER` as the condition for `validTeamTaskPreference`.
/// @param value Operand used to evaluate the returned expression `value==TEAMTP_DEFENDER or value==TEAMTP_ATTACKER`.
function validTeamTaskPreference(value) return value==TEAMTP_DEFENDER or value==TEAMTP_ATTACKER end function
/// Test `value>=LTG_TEAMHELP and value<=LTG_MAKELOVE_ONTOP` as the condition for `validLongTermGoal`.
/// @param value Operand used to evaluate the returned expression `value>=LTG_TEAMHELP and value<=LTG_MAKELOVE_ONTOP`.
function validLongTermGoal(value) return value>=LTG_TEAMHELP and value<=LTG_MAKELOVE_ONTOP end function
/// Choose reverse or looping patrol traversal from the patrol flag mask.
/// @param flags Value used by `nextPatrolDirection` in `if (flags&PATROL_REVERSE)!=0 then return PATROL_BACK end if`.
function nextPatrolDirection(flags) if (flags&PATROL_REVERSE)!=0 then return PATROL_BACK end if;return PATROL_LOOP end function
/// Return a new array `[55,3,135,16,163]` for `headerCounts`.
function headerCounts() return [55,3,135,16,163] end function
