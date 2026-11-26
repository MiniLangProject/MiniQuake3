// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Canonical public Botlib ABI contracts shared by game QVM and native Botlib.
package mq3.botlib.public_headers

/// Character capacity of a fixed-size botlib ABI string field.
const MAX_STRINGFIELD=80
/// Traveling temporary not possible.
const TFL_INVALID=0x00000001
/// AAS route-permission bit for walk.
const TFL_WALK=0x00000002
/// AAS route-permission bit for crouch.
const TFL_CROUCH=0x00000004
/// Jumping onto a barrier.
const TFL_BARRIERJUMP=0x00000008
/// AAS route-permission bit for jump.
const TFL_JUMP=0x00000010
/// Climbing a ladder.
const TFL_LADDER=0x00000020
/// Walking of a ledge.
const TFL_WALKOFFLEDGE=0x00000080
/// AAS route-permission bit for swim.
const TFL_SWIM=0x00000100
/// Jumping out of the water.
const TFL_WATERJUMP=0x00000200
/// AAS route-permission bit for teleport.
const TFL_TELEPORT=0x00000400
/// AAS route-permission bit for elevator.
const TFL_ELEVATOR=0x00000800
/// AAS route-permission bit for rocket jump.
const TFL_ROCKETJUMP=0x00001000
/// AAS route-permission bit for BFG jump.
const TFL_BFGJUMP=0x00002000
/// AAS route-permission bit for grappling hook.
const TFL_GRAPPLEHOOK=0x00004000
/// AAS route-permission bit for double jump.
const TFL_DOUBLEJUMP=0x00008000
/// AAS route-permission bit for ramp jump.
const TFL_RAMPJUMP=0x00010000
/// AAS route-permission bit for strafe jump.
const TFL_STRAFEJUMP=0x00020000
/// AAS route-permission bit for jump pad.
const TFL_JUMPPAD=0x00040000
/// Travel through air.
const TFL_AIR=0x00080000
/// Travel through water.
const TFL_WATER=0x00100000
/// Travel through slime.
const TFL_SLIME=0x00200000
/// Travel through lava.
const TFL_LAVA=0x00400000
/// Travel through donotenter area.
const TFL_DONOTENTER=0x00800000
/// AAS route-permission bit for bobbing mover.
const TFL_FUNCBOB=0x01000000
/// AAS route-permission bit for flight.
const TFL_FLIGHT=0x02000000
/// Move over a bridge.
const TFL_BRIDGE=0x04000000
/// AAS travel restriction marking an area or reachability unavailable to team one.
const TFL_NOTTEAM1=0x08000000
/// AAS travel restriction marking an area or reachability unavailable to team two.
const TFL_NOTTEAM2=0x10000000
/// Combined mask of the travel permissions enabled for an ordinary bot route.
const TFL_DEFAULT=TFL_WALK|TFL_CROUCH|TFL_BARRIERJUMP|TFL_JUMP|TFL_LADDER|TFL_WALKOFFLEDGE|TFL_SWIM|TFL_WATERJUMP|TFL_TELEPORT|TFL_ELEVATOR|TFL_AIR|TFL_WATER|TFL_JUMPPAD|TFL_FUNCBOB
/// Zero movement-prediction event mask, requesting no event-specific stop.
const SE_NONE=0
/// The ground is hit.
const SE_HITGROUND=1
/// There's no ground.
const SE_LEAVEGROUND=2
/// Water is entered.
const SE_ENTERWATER=4
/// Slime is entered.
const SE_ENTERSLIME=8
/// Lava is entered.
const SE_ENTERLAVA=16
/// The ground is hit with damage.
const SE_HITGROUNDDAMAGE=32
/// There's a gap.
const SE_GAP=64
/// Touching a jump pad area.
const SE_TOUCHJUMPPAD=128
/// Movement-prediction stop-event bit for touching a teleporter.
const SE_TOUCHTELEPORTER=256
/// The given stoparea is entered.
const SE_ENTERAREA=512
/// A ground face in the area is hit.
const SE_HITGROUNDAREA=1024
/// Hit the specified bounding box.
const SE_HITBOUNDINGBOX=2048
/// Touching a cluster portal.
const SE_TOUCHCLUSTERPORTAL=4096
/// Alternative-route goal selector for all.
const ALTROUTEGOAL_ALL=1
/// Alternative-route goal selector for cluster portals.
const ALTROUTEGOAL_CLUSTERPORTALS=2
/// Alternative-route goal selector for view portals.
const ALTROUTEGOAL_VIEWPORTALS=4
/// Route-prediction result indicating that no requested stop event occurred.
const RSE_NONE=0
/// No route to goal.
const RSE_NOROUTE=1
/// Stop as soon as on of the given travel types is used.
const RSE_USETRAVELTYPE=2
/// Stop when entering the given contents.
const RSE_ENTERCONTENTS=4
/// Stop when entering the given area.
const RSE_ENTERAREA=8
/// Maximum character capacity of a bot chat or console message.
const MAX_MESSAGE_SIZE=256
/// Maximum length of an initial-chat category name.
const MAX_CHATTYPE_NAME=32
/// Maximum number of captured variables in a bot chat match.
const MAX_MATCHVARIABLES=8
/// Chat gender selector for neutral or unspecified pronoun choices.
const CHAT_GENDERLESS=0
/// Chat gender selector for female pronoun choices.
const CHAT_GENDERFEMALE=1
/// Chat gender selector for male pronoun choices.
const CHAT_GENDERMALE=2
/// Chat destination selecting all players.
const CHAT_ALL=0
/// Chat destination selecting the bot's team.
const CHAT_TEAM=1
/// Chat destination selecting one explicitly addressed client.
const CHAT_TELL=2
/// Maximum number of temporarily avoided goal identifiers retained per bot.
const MAX_AVOIDGOALS=256
/// Maximum number of goals stored on one bot goal stack.
const MAX_GOALSTACK=8
/// Zero goal-property mask, with no additional goal flags set.
const GFL_NONE=0
/// Bot goal-property flag marking item.
const GFL_ITEM=1
/// Bot goal-property flag marking roam.
const GFL_ROAM=2
/// Bot goal-property flag marking dropped.
const GFL_DROPPED=4
/// Bot movement-mode identifier for walk.
const MOVE_WALK=1
/// Bot movement-mode identifier for crouch.
const MOVE_CROUCH=2
/// Bot movement-mode identifier for jump.
const MOVE_JUMP=4
/// Bot movement-mode identifier for grapple.
const MOVE_GRAPPLE=8
/// Bot movement-mode identifier for rocket jump.
const MOVE_ROCKETJUMP=16
/// Bot movement-mode identifier for BFG jump.
const MOVE_BFGJUMP=32
/// Bot is performing a barrier jump.
const MFL_BARRIERJUMP=1
/// Bot is in the ground.
const MFL_ONGROUND=2
/// Bot is swimming.
const MFL_SWIMMING=4
/// Bot is against a ladder.
const MFL_AGAINSTLADDER=8
/// Bot is waterjumping.
const MFL_WATERJUMP=16
/// Bot is being teleported.
const MFL_TELEPORTED=32
/// Bot is being pulled by the grapple.
const MFL_GRAPPLEPULL=64
/// Bot is using the grapple hook.
const MFL_ACTIVEGRAPPLE=128
/// Bot has reset the grapple.
const MFL_GRAPPLERESET=256
/// Bot should walk slowly.
const MFL_WALK=512
/// Bot uses view for movement.
const MOVERESULT_MOVEMENTVIEW=1
/// Bot uses view for swimming.
const MOVERESULT_SWIMVIEW=2
/// Bot is waiting for something.
const MOVERESULT_WAITING=4
/// Bot has set the view in movement code.
const MOVERESULT_MOVEMENTVIEWSET=8
/// Bot uses weapon for movement.
const MOVERESULT_MOVEMENTWEAPON=16
/// Bot is ontop of obstacle.
const MOVERESULT_ONTOPOFOBSTACLE=32
/// Bot is ontop of a func_bobbing.
const MOVERESULT_ONTOPOF_FUNCBOB=64
/// Bot is ontop of an elevator (func_plat).
const MOVERESULT_ONTOPOF_ELEVATOR=128
/// Bot is blocked by an avoid spot.
const MOVERESULT_BLOCKEDBYAVOIDSPOT=256
/// Maximum number of temporarily avoided reachabilities retained per bot.
const MAX_AVOIDREACH=1
/// Maximum number of spatial avoidance spots retained per bot.
const MAX_AVOIDSPOTS=32
/// Avoidance-spot mode that removes the previously registered spots.
const AVOID_CLEAR=0
/// Avoidance-spot mode that always rejects paths through the spot.
const AVOID_ALWAYS=1
/// Avoidance-spot mode that influences path choice without blocking all movement.
const AVOID_DONTBLOCK=2
/// Elevator is up.
const RESULTTYPE_ELEVATORUP=1
/// Waiting for func bobbing to arrive.
const RESULTTYPE_WAITFORFUNCBOBBING=2
/// Grapple path is obstructed.
const RESULTTYPE_BADGRAPPLEPATH=4
/// Stuck in solid area, this is bad.
const RESULTTYPE_INSOLIDAREA=8
/// Projectile damages through window.
const PFL_WINDOWDAMAGE=1
/// Set when projectile returns to owner.
const PFL_RETURN=2
/// Set when projectile is fired with key-up event.
const WFL_FIRERELEASED=1
/// Damage on impact.
const DAMAGETYPE_IMPACT=1
/// Weapon damage-property bit for radial.
const DAMAGETYPE_RADIAL=2
/// Damage to all entities visible to the projectile.
const DAMAGETYPE_VISIBLE=4
/// Serialized format or interface version expected by public headers.
const BOTLIB_API_VERSION=2
/// Base directory used to locate bot configuration and script files.
const BOTFILESBASEFOLDER="botfiles"
/// Debug-drawing palette identifier for none.
const LINECOLOR_NONE=-1
/// Debug-drawing palette identifier for red.
const LINECOLOR_RED=1
/// Debug-drawing palette identifier for green.
const LINECOLOR_GREEN=2
/// Debug-drawing palette identifier for blue.
const LINECOLOR_BLUE=3
/// Debug-drawing palette identifier for yellow.
const LINECOLOR_YELLOW=4
/// Debug-drawing palette identifier for orange.
const LINECOLOR_ORANGE=5
/// Bot-library diagnostic severity for message.
const PRT_MESSAGE=1
/// Bot-library diagnostic severity for warning.
const PRT_WARNING=2
/// Bot-library diagnostic severity for error.
const PRT_ERROR=3
/// Bot-library diagnostic severity for fatal.
const PRT_FATAL=4
/// Bot-library diagnostic severity for exit.
const PRT_EXIT=5
/// Console-message category for ordinary bot console output.
const CMS_NORMAL=0
/// Console-message category for received chat text.
const CMS_CHAT=1
/// Bot-library status indicating successful completion.
const BLERR_NOERROR=0
/// Bot-library error indicating that setup has not completed.
const BLERR_LIBRARYNOTSETUP=1
/// Bot-library error indicating an out-of-range entity number.
const BLERR_INVALIDENTITYNUMBER=2
/// Bot-library error indicating that no AAS navigation map is loaded.
const BLERR_NOAASFILE=3
/// Bot-library error indicating that the AAS map file could not be opened.
const BLERR_CANNOTOPENAASFILE=4
/// Bot-library error indicating an invalid AAS file signature.
const BLERR_WRONGAASFILEID=5
/// Bot-library error indicating an unsupported or mismatched AAS map version.
const BLERR_WRONGAASFILEVERSION=6
/// Bot-library error indicating an unreadable or malformed AAS data lump.
const BLERR_CANNOTREADAASLUMP=7
/// Bot-library error indicating that an initial-chat script could not be loaded.
const BLERR_CANNOTLOADICHAT=8
/// Bot-library error indicating that an item-weight script could not be loaded.
const BLERR_CANNOTLOADITEMWEIGHTS=9
/// Bot-library error indicating that item configuration could not be loaded.
const BLERR_CANNOTLOADITEMCONFIG=10
/// Bot-library error indicating that weapon weights could not be loaded.
const BLERR_CANNOTLOADWEAPONWEIGHTS=11
/// Bot-library error indicating that weapon configuration could not be loaded.
const BLERR_CANNOTLOADWEAPONCONFIG=12
/// Bot input-action bit requesting attack.
const ACTION_ATTACK=0x0000001
/// Bot input-action bit requesting use.
const ACTION_USE=0x0000002
/// Bot input-action bit requesting respawn.
const ACTION_RESPAWN=0x0000008
/// Bot input-action bit requesting jump.
const ACTION_JUMP=0x0000010
/// Bot input-action bit requesting upward movement.
const ACTION_MOVEUP=0x0000020
/// Bot input-action bit requesting crouch.
const ACTION_CROUCH=0x0000080
/// Bot input-action bit requesting downward movement.
const ACTION_MOVEDOWN=0x0000100
/// Bot input-action bit requesting forward movement.
const ACTION_MOVEFORWARD=0x0000200
/// Bot input-action bit requesting backward movement.
const ACTION_MOVEBACK=0x0000800
/// Bot input-action bit requesting leftward movement.
const ACTION_MOVELEFT=0x0001000
/// Bot input-action bit requesting rightward movement.
const ACTION_MOVERIGHT=0x0002000
/// Bot input-action bit requesting a delayed jump.
const ACTION_DELAYEDJUMP=0x0008000
/// Bot input-action bit requesting talk.
const ACTION_TALK=0x0010000
/// Bot input-action bit requesting gesture.
const ACTION_GESTURE=0x0020000
/// Bot input-action bit requesting walk.
const ACTION_WALK=0x0080000
/// Bot input-action bit requesting affirmative.
const ACTION_AFFIRMATIVE=0x0100000
/// Bot input-action bit requesting negative.
const ACTION_NEGATIVE=0x0200000
/// Bot input-action bit requesting a capture-the-flag order.
const ACTION_GETFLAG=0x0800000
/// Bot input-action bit requesting a base-defense order.
const ACTION_GUARDBASE=0x1000000
/// Bot input-action bit requesting patrol.
const ACTION_PATROL=0x2000000
/// Bot input-action bit requesting a follow-me order.
const ACTION_FOLLOWME=0x8000000

/// Return the ordered constant names table for public headers: 156 entries beginning with `"MAX_STRINGFIELD"` and `"TFL_INVALID"`.
function constantNames() return ["MAX_STRINGFIELD","TFL_INVALID","TFL_WALK","TFL_CROUCH","TFL_BARRIERJUMP","TFL_JUMP","TFL_LADDER","TFL_WALKOFFLEDGE","TFL_SWIM","TFL_WATERJUMP","TFL_TELEPORT","TFL_ELEVATOR","TFL_ROCKETJUMP","TFL_BFGJUMP","TFL_GRAPPLEHOOK","TFL_DOUBLEJUMP","TFL_RAMPJUMP","TFL_STRAFEJUMP","TFL_JUMPPAD","TFL_AIR","TFL_WATER","TFL_SLIME","TFL_LAVA","TFL_DONOTENTER","TFL_FUNCBOB","TFL_FLIGHT","TFL_BRIDGE","TFL_NOTTEAM1","TFL_NOTTEAM2","TFL_DEFAULT","SE_NONE","SE_HITGROUND","SE_LEAVEGROUND","SE_ENTERWATER","SE_ENTERSLIME","SE_ENTERLAVA","SE_HITGROUNDDAMAGE","SE_GAP","SE_TOUCHJUMPPAD","SE_TOUCHTELEPORTER","SE_ENTERAREA","SE_HITGROUNDAREA","SE_HITBOUNDINGBOX","SE_TOUCHCLUSTERPORTAL","ALTROUTEGOAL_ALL","ALTROUTEGOAL_CLUSTERPORTALS","ALTROUTEGOAL_VIEWPORTALS","RSE_NONE","RSE_NOROUTE","RSE_USETRAVELTYPE","RSE_ENTERCONTENTS","RSE_ENTERAREA","MAX_MESSAGE_SIZE","MAX_CHATTYPE_NAME","MAX_MATCHVARIABLES","CHAT_GENDERLESS","CHAT_GENDERFEMALE","CHAT_GENDERMALE","CHAT_ALL","CHAT_TEAM","CHAT_TELL","MAX_AVOIDGOALS","MAX_GOALSTACK","GFL_NONE","GFL_ITEM","GFL_ROAM","GFL_DROPPED","MOVE_WALK","MOVE_CROUCH","MOVE_JUMP","MOVE_GRAPPLE","MOVE_ROCKETJUMP","MOVE_BFGJUMP","MFL_BARRIERJUMP","MFL_ONGROUND","MFL_SWIMMING","MFL_AGAINSTLADDER","MFL_WATERJUMP","MFL_TELEPORTED","MFL_GRAPPLEPULL","MFL_ACTIVEGRAPPLE","MFL_GRAPPLERESET","MFL_WALK","MOVERESULT_MOVEMENTVIEW","MOVERESULT_SWIMVIEW","MOVERESULT_WAITING","MOVERESULT_MOVEMENTVIEWSET","MOVERESULT_MOVEMENTWEAPON","MOVERESULT_ONTOPOFOBSTACLE","MOVERESULT_ONTOPOF_FUNCBOB","MOVERESULT_ONTOPOF_ELEVATOR","MOVERESULT_BLOCKEDBYAVOIDSPOT","MAX_AVOIDREACH","MAX_AVOIDSPOTS","AVOID_CLEAR","AVOID_ALWAYS","AVOID_DONTBLOCK","RESULTTYPE_ELEVATORUP","RESULTTYPE_WAITFORFUNCBOBBING","RESULTTYPE_BADGRAPPLEPATH","RESULTTYPE_INSOLIDAREA","PFL_WINDOWDAMAGE","PFL_RETURN","WFL_FIRERELEASED","DAMAGETYPE_IMPACT","DAMAGETYPE_RADIAL","DAMAGETYPE_VISIBLE","BOTLIB_API_VERSION","BOTFILESBASEFOLDER","LINECOLOR_NONE","LINECOLOR_RED","LINECOLOR_GREEN","LINECOLOR_BLUE","LINECOLOR_YELLOW","LINECOLOR_ORANGE","PRT_MESSAGE","PRT_WARNING","PRT_ERROR","PRT_FATAL","PRT_EXIT","CMS_NORMAL","CMS_CHAT","BLERR_NOERROR","BLERR_LIBRARYNOTSETUP","BLERR_INVALIDENTITYNUMBER","BLERR_NOAASFILE","BLERR_CANNOTOPENAASFILE","BLERR_WRONGAASFILEID","BLERR_WRONGAASFILEVERSION","BLERR_CANNOTREADAASLUMP","BLERR_CANNOTLOADICHAT","BLERR_CANNOTLOADITEMWEIGHTS","BLERR_CANNOTLOADITEMCONFIG","BLERR_CANNOTLOADWEAPONWEIGHTS","BLERR_CANNOTLOADWEAPONCONFIG","ACTION_ATTACK","ACTION_USE","ACTION_RESPAWN","ACTION_JUMP","ACTION_MOVEUP","ACTION_CROUCH","ACTION_MOVEDOWN","ACTION_MOVEFORWARD","ACTION_MOVEBACK","ACTION_MOVELEFT","ACTION_MOVERIGHT","ACTION_DELAYEDJUMP","ACTION_TALK","ACTION_GESTURE","ACTION_WALK","ACTION_AFFIRMATIVE","ACTION_NEGATIVE","ACTION_GETFLAG","ACTION_GUARDBASE","ACTION_PATROL","ACTION_FOLLOWME"] end function
/// Return the ordered constant values table for public headers: 156 entries beginning with `MAX_STRINGFIELD` and `TFL_INVALID`.
function constantValues() return [MAX_STRINGFIELD,TFL_INVALID,TFL_WALK,TFL_CROUCH,TFL_BARRIERJUMP,TFL_JUMP,TFL_LADDER,TFL_WALKOFFLEDGE,TFL_SWIM,TFL_WATERJUMP,TFL_TELEPORT,TFL_ELEVATOR,TFL_ROCKETJUMP,TFL_BFGJUMP,TFL_GRAPPLEHOOK,TFL_DOUBLEJUMP,TFL_RAMPJUMP,TFL_STRAFEJUMP,TFL_JUMPPAD,TFL_AIR,TFL_WATER,TFL_SLIME,TFL_LAVA,TFL_DONOTENTER,TFL_FUNCBOB,TFL_FLIGHT,TFL_BRIDGE,TFL_NOTTEAM1,TFL_NOTTEAM2,TFL_DEFAULT,SE_NONE,SE_HITGROUND,SE_LEAVEGROUND,SE_ENTERWATER,SE_ENTERSLIME,SE_ENTERLAVA,SE_HITGROUNDDAMAGE,SE_GAP,SE_TOUCHJUMPPAD,SE_TOUCHTELEPORTER,SE_ENTERAREA,SE_HITGROUNDAREA,SE_HITBOUNDINGBOX,SE_TOUCHCLUSTERPORTAL,ALTROUTEGOAL_ALL,ALTROUTEGOAL_CLUSTERPORTALS,ALTROUTEGOAL_VIEWPORTALS,RSE_NONE,RSE_NOROUTE,RSE_USETRAVELTYPE,RSE_ENTERCONTENTS,RSE_ENTERAREA,MAX_MESSAGE_SIZE,MAX_CHATTYPE_NAME,MAX_MATCHVARIABLES,CHAT_GENDERLESS,CHAT_GENDERFEMALE,CHAT_GENDERMALE,CHAT_ALL,CHAT_TEAM,CHAT_TELL,MAX_AVOIDGOALS,MAX_GOALSTACK,GFL_NONE,GFL_ITEM,GFL_ROAM,GFL_DROPPED,MOVE_WALK,MOVE_CROUCH,MOVE_JUMP,MOVE_GRAPPLE,MOVE_ROCKETJUMP,MOVE_BFGJUMP,MFL_BARRIERJUMP,MFL_ONGROUND,MFL_SWIMMING,MFL_AGAINSTLADDER,MFL_WATERJUMP,MFL_TELEPORTED,MFL_GRAPPLEPULL,MFL_ACTIVEGRAPPLE,MFL_GRAPPLERESET,MFL_WALK,MOVERESULT_MOVEMENTVIEW,MOVERESULT_SWIMVIEW,MOVERESULT_WAITING,MOVERESULT_MOVEMENTVIEWSET,MOVERESULT_MOVEMENTWEAPON,MOVERESULT_ONTOPOFOBSTACLE,MOVERESULT_ONTOPOF_FUNCBOB,MOVERESULT_ONTOPOF_ELEVATOR,MOVERESULT_BLOCKEDBYAVOIDSPOT,MAX_AVOIDREACH,MAX_AVOIDSPOTS,AVOID_CLEAR,AVOID_ALWAYS,AVOID_DONTBLOCK,RESULTTYPE_ELEVATORUP,RESULTTYPE_WAITFORFUNCBOBBING,RESULTTYPE_BADGRAPPLEPATH,RESULTTYPE_INSOLIDAREA,PFL_WINDOWDAMAGE,PFL_RETURN,WFL_FIRERELEASED,DAMAGETYPE_IMPACT,DAMAGETYPE_RADIAL,DAMAGETYPE_VISIBLE,BOTLIB_API_VERSION,BOTFILESBASEFOLDER,LINECOLOR_NONE,LINECOLOR_RED,LINECOLOR_GREEN,LINECOLOR_BLUE,LINECOLOR_YELLOW,LINECOLOR_ORANGE,PRT_MESSAGE,PRT_WARNING,PRT_ERROR,PRT_FATAL,PRT_EXIT,CMS_NORMAL,CMS_CHAT,BLERR_NOERROR,BLERR_LIBRARYNOTSETUP,BLERR_INVALIDENTITYNUMBER,BLERR_NOAASFILE,BLERR_CANNOTOPENAASFILE,BLERR_WRONGAASFILEID,BLERR_WRONGAASFILEVERSION,BLERR_CANNOTREADAASLUMP,BLERR_CANNOTLOADICHAT,BLERR_CANNOTLOADITEMWEIGHTS,BLERR_CANNOTLOADITEMCONFIG,BLERR_CANNOTLOADWEAPONWEIGHTS,BLERR_CANNOTLOADWEAPONCONFIG,ACTION_ATTACK,ACTION_USE,ACTION_RESPAWN,ACTION_JUMP,ACTION_MOVEUP,ACTION_CROUCH,ACTION_MOVEDOWN,ACTION_MOVEFORWARD,ACTION_MOVEBACK,ACTION_MOVELEFT,ACTION_MOVERIGHT,ACTION_DELAYEDJUMP,ACTION_TALK,ACTION_GESTURE,ACTION_WALK,ACTION_AFFIRMATIVE,ACTION_NEGATIVE,ACTION_GETFLAG,ACTION_GUARDBASE,ACTION_PATROL,ACTION_FOLLOWME] end function
/// Return the ordered type names table for public headers: 25 entries beginning with `"solid_t"` and `"aas_trace_t"`.
function typeNames() return ["solid_t","aas_trace_t","aas_entityinfo_t","aas_areainfo_t","aas_clientmove_t","aas_altroutegoal_t","aas_predictroute_t","bot_consolemessage_t","bot_matchvariable_t","bot_match_t","bot_goal_t","bot_initmove_t","bot_moveresult_t","bot_avoidspot_t","projectileinfo_t","weaponinfo_t","bot_input_t","bsp_surface_t","bsp_trace_t","bot_entitystate_t","botlib_import_t","aas_export_t","ea_export_t","ai_export_t","botlib_export_t"] end function
/// Return the ordered declaration names table for public headers: 113 entries beginning with `"BotLoadCharacter"` and `"BotFreeCharacter"`.
function declarationNames() return ["BotLoadCharacter","BotFreeCharacter","Characteristic_Float","Characteristic_BFloat","Characteristic_Integer","Characteristic_BInteger","Characteristic_String","BotShutdownCharacters","BotSetupChatAI","BotShutdownChatAI","BotAllocChatState","BotFreeChatState","BotQueueConsoleMessage","BotRemoveConsoleMessage","BotNextConsoleMessage","BotNumConsoleMessages","BotInitialChat","BotNumInitialChats","BotReplyChat","BotChatLength","BotEnterChat","BotGetChatMessage","StringContains","BotFindMatch","BotMatchVariable","UnifyWhiteSpaces","BotReplaceSynonyms","BotLoadChatFile","BotSetChatGender","BotSetChatName","GeneticParentsAndChildSelection","BotResetGoalState","BotResetAvoidGoals","BotRemoveFromAvoidGoals","BotPushGoal","BotPopGoal","BotEmptyGoalStack","BotDumpAvoidGoals","BotDumpGoalStack","BotGoalName","BotGetTopGoal","BotGetSecondGoal","BotChooseLTGItem","BotChooseNBGItem","BotTouchingGoal","BotItemGoalInVisButNotVisible","BotGetLevelItemGoal","BotGetNextCampSpotGoal","BotGetMapLocationGoal","BotAvoidGoalTime","BotSetAvoidGoalTime","BotInitLevelItems","BotUpdateEntityItems","BotInterbreedGoalFuzzyLogic","BotSaveGoalFuzzyLogic","BotMutateGoalFuzzyLogic","BotLoadItemWeights","BotFreeItemWeights","BotAllocGoalState","BotFreeGoalState","BotSetupGoalAI","BotShutdownGoalAI","BotResetMoveState","BotMoveToGoal","BotMoveInDirection","BotResetAvoidReach","BotResetLastAvoidReach","BotReachabilityArea","BotMovementViewTarget","BotPredictVisiblePosition","BotAllocMoveState","BotFreeMoveState","BotInitMoveState","BotAddAvoidSpot","BotSetBrushModelTypes","BotSetupMoveAI","BotShutdownMoveAI","BotSetupWeaponAI","BotShutdownWeaponAI","BotChooseBestFightWeapon","BotGetWeaponInfo","BotLoadWeaponWeights","BotAllocWeaponState","BotFreeWeaponState","BotResetWeaponState","EA_Say","EA_SayTeam","EA_Command","EA_Action","EA_Crouch","EA_Walk","EA_MoveUp","EA_MoveDown","EA_MoveForward","EA_MoveBack","EA_MoveLeft","EA_MoveRight","EA_Attack","EA_Respawn","EA_Talk","EA_Gesture","EA_Use","EA_SelectWeapon","EA_Jump","EA_DelayedJump","EA_Move","EA_View","EA_EndRegular","EA_GetInput","EA_ResetInput","EA_Setup","EA_Shutdown","GetBotLibAPI"] end function
/// Return the ordered struct names table for public headers: 24 entries beginning with `"aas_trace_t"` and `"aas_entityinfo_t"`.
function structNames() return ["aas_trace_t","aas_entityinfo_t","aas_areainfo_t","aas_clientmove_t","aas_altroutegoal_t","aas_predictroute_t","bot_consolemessage_t","bot_matchvariable_t","bot_match_t","bot_goal_t","bot_initmove_t","bot_moveresult_t","bot_avoidspot_t","projectileinfo_t","weaponinfo_t","bot_input_t","bsp_surface_t","bsp_trace_t","bot_entitystate_t","botlib_import_t","aas_export_t","ea_export_t","ai_export_t","botlib_export_t"] end function
/// Return the ordered field names table for public headers: 333 entries beginning with `"startsolid"` and `"fraction"`.
function fieldNames() return ["startsolid","fraction","endpos","ent","lastarea","area","planenum","valid","type","flags","ltime","update_time","number","origin","angles","old_origin","lastvisorigin","mins","maxs","groundent","solid","modelindex","modelindex2","frame","event","eventParm","powerups","weapon","legsAnim","torsoAnim","contents","flags","presencetype","cluster","mins","maxs","center","endpos","endarea","velocity","trace","presencetype","stopevent","endcontents","time","frames","origin","areanum","starttraveltime","goaltraveltime","extratraveltime","endpos","endarea","stopevent","endcontents","endtravelflags","numareas","time","handle","time","type","message","prev","next","offset","length","string","type","subtype","variables","origin","areanum","mins","maxs","entitynum","number","flags","iteminfo","origin","velocity","viewoffset","entitynum","client","thinktime","presencetype","viewangles","or_moveflags","failure","type","blocked","blockentity","traveltype","flags","weapon","movedir","ideal_viewangles","origin","radius","type","name","model","flags","gravity","damage","radius","visdamage","damagetype","healthinc","push","detonation","bounce","bouncefric","bouncestop","valid","number","name","model","level","weaponindex","flags","projectile","numprojectiles","hspread","vspread","speed","acceleration","recoil","offset","angleoffset","extrazvelocity","ammoamount","ammoindex","activate","reload","spinup","spindown","proj","thinktime","dir","speed","viewangles","actionflags","weapon","name","flags","value","allsolid","startsolid","fraction","endpos","plane","exp_dist","sidenum","surface","contents","ent","type","flags","origin","angles","old_origin","mins","maxs","groundent","solid","modelindex","modelindex2","frame","event","eventParm","powerups","weapon","legsAnim","torsoAnim","Print","Trace","EntityTrace","PointContents","inPVS","BSPEntityData","BSPModelMinsMaxsOrigin","BotClientCommand","GetMemory","FreeMemory","AvailableMemory","HunkAlloc","FS_FOpenFile","FS_Read","FS_Write","FS_FCloseFile","FS_Seek","DebugLineCreate","DebugLineDelete","DebugLineShow","DebugPolygonCreate","DebugPolygonDelete","AAS_EntityInfo","AAS_Initialized","AAS_PresenceTypeBoundingBox","AAS_Time","AAS_PointAreaNum","AAS_PointReachabilityAreaIndex","AAS_TraceAreas","AAS_BBoxAreas","AAS_AreaInfo","AAS_PointContents","AAS_NextBSPEntity","AAS_ValueForBSPEpairKey","AAS_VectorForBSPEpairKey","AAS_FloatForBSPEpairKey","AAS_IntForBSPEpairKey","AAS_AreaReachability","AAS_AreaTravelTimeToGoalArea","AAS_EnableRoutingArea","AAS_PredictRoute","AAS_AlternativeRouteGoals","AAS_Swimming","AAS_PredictClientMovement","EA_Command","EA_Say","EA_SayTeam","EA_Action","EA_Gesture","EA_Talk","EA_Attack","EA_Use","EA_Respawn","EA_MoveUp","EA_MoveDown","EA_MoveForward","EA_MoveBack","EA_MoveLeft","EA_MoveRight","EA_Crouch","EA_SelectWeapon","EA_Jump","EA_DelayedJump","EA_Move","EA_View","EA_EndRegular","EA_GetInput","EA_ResetInput","BotLoadCharacter","BotFreeCharacter","Characteristic_Float","Characteristic_BFloat","Characteristic_Integer","Characteristic_BInteger","Characteristic_String","BotAllocChatState","BotFreeChatState","BotQueueConsoleMessage","BotRemoveConsoleMessage","BotNextConsoleMessage","BotNumConsoleMessages","BotInitialChat","BotNumInitialChats","BotReplyChat","BotChatLength","BotEnterChat","BotGetChatMessage","StringContains","BotFindMatch","BotMatchVariable","UnifyWhiteSpaces","BotReplaceSynonyms","BotLoadChatFile","BotSetChatGender","BotSetChatName","BotResetGoalState","BotResetAvoidGoals","BotRemoveFromAvoidGoals","BotPushGoal","BotPopGoal","BotEmptyGoalStack","BotDumpAvoidGoals","BotDumpGoalStack","BotGoalName","BotGetTopGoal","BotGetSecondGoal","BotChooseLTGItem","BotChooseNBGItem","BotTouchingGoal","BotItemGoalInVisButNotVisible","BotGetLevelItemGoal","BotGetNextCampSpotGoal","BotGetMapLocationGoal","BotAvoidGoalTime","BotSetAvoidGoalTime","BotInitLevelItems","BotUpdateEntityItems","BotLoadItemWeights","BotFreeItemWeights","BotInterbreedGoalFuzzyLogic","BotSaveGoalFuzzyLogic","BotMutateGoalFuzzyLogic","BotAllocGoalState","BotFreeGoalState","BotResetMoveState","BotMoveToGoal","BotMoveInDirection","BotResetAvoidReach","BotResetLastAvoidReach","BotReachabilityArea","BotMovementViewTarget","BotPredictVisiblePosition","BotAllocMoveState","BotFreeMoveState","BotInitMoveState","BotAddAvoidSpot","BotChooseBestFightWeapon","BotGetWeaponInfo","BotLoadWeaponWeights","BotAllocWeaponState","BotFreeWeaponState","BotResetWeaponState","GeneticParentsAndChildSelection","BotLibSetup","BotLibShutdown","BotLibVarSet","BotLibVarGet","PC_AddGlobalDefine","PC_LoadSourceHandle","PC_FreeSourceHandle","PC_ReadTokenHandle","PC_SourceFileAndLine","BotLibStartFrame","BotLibLoadMap","BotLibUpdateEntity","Test","aas","ea","ai"] end function
/// Return a new array `["startsolid","fraction","endpos","ent","lastarea","area","planenum"]` for `aas_trace_tFields`.
function aas_trace_tFields() return ["startsolid","fraction","endpos","ent","lastarea","area","planenum"] end function
/// Return the ordered aas entityinfo t fields table for public headers: 23 entries beginning with `"valid"` and `"type"`.
function aas_entityinfo_tFields() return ["valid","type","flags","ltime","update_time","number","origin","angles","old_origin","lastvisorigin","mins","maxs","groundent","solid","modelindex","modelindex2","frame","event","eventParm","powerups","weapon","legsAnim","torsoAnim"] end function
/// Return a new array `["contents","flags","presencetype","cluster","mins","maxs","center"]` for `aas_areainfo_tFields`.
function aas_areainfo_tFields() return ["contents","flags","presencetype","cluster","mins","maxs","center"] end function
/// Return a new array `["endpos","endarea","velocity","trace","presencetype","stopevent","endcontents","time","frames"]` for `aas_clientmove_tFields`.
function aas_clientmove_tFields() return ["endpos","endarea","velocity","trace","presencetype","stopevent","endcontents","time","frames"] end function
/// Return a new array `["origin","areanum","starttraveltime","goaltraveltime","extratraveltime"]` for `aas_altroutegoal_tFields`.
function aas_altroutegoal_tFields() return ["origin","areanum","starttraveltime","goaltraveltime","extratraveltime"] end function
/// Return a new array `["endpos","endarea","stopevent","endcontents","endtravelflags","numareas","time"]` for `aas_predictroute_tFields`.
function aas_predictroute_tFields() return ["endpos","endarea","stopevent","endcontents","endtravelflags","numareas","time"] end function
/// Return a new array `["handle","time","type","message","prev","next"]` for `bot_consolemessage_tFields`.
function bot_consolemessage_tFields() return ["handle","time","type","message","prev","next"] end function
/// Return a new array `["offset","length"]` for `bot_matchvariable_tFields`.
function bot_matchvariable_tFields() return ["offset","length"] end function
/// Return a new array `["string","type","subtype","variables"]` for `bot_match_tFields`.
function bot_match_tFields() return ["string","type","subtype","variables"] end function
/// Return a new array `["origin","areanum","mins","maxs","entitynum","number","flags","iteminfo"]` for `bot_goal_tFields`.
function bot_goal_tFields() return ["origin","areanum","mins","maxs","entitynum","number","flags","iteminfo"] end function
/// Return a new array `["origin","velocity","viewoffset","entitynum","client","thinktime","presencetype","viewangles","or_moveflags"]` for `bot_initmove_tFields`.
function bot_initmove_tFields() return ["origin","velocity","viewoffset","entitynum","client","thinktime","presencetype","viewangles","or_moveflags"] end function
/// Return a new array `["failure","type","blocked","blockentity","traveltype","flags","weapon","movedir","ideal_viewangles"]` for `bot_moveresult_tFields`.
function bot_moveresult_tFields() return ["failure","type","blocked","blockentity","traveltype","flags","weapon","movedir","ideal_viewangles"] end function
/// Return a new array `["origin","radius","type"]` for `bot_avoidspot_tFields`.
function bot_avoidspot_tFields() return ["origin","radius","type"] end function
/// Return a new array `["name","model","flags","gravity","damage","radius","visdamage","damagetype","healthinc","push","detonation","bounce","bouncefric","bouncestop"]` for `projectileinfo_tFields`.
function projectileinfo_tFields() return ["name","model","flags","gravity","damage","radius","visdamage","damagetype","healthinc","push","detonation","bounce","bouncefric","bouncestop"] end function
/// Return the ordered weaponinfo t fields table for public headers: 24 entries beginning with `"valid"` and `"number"`.
function weaponinfo_tFields() return ["valid","number","name","model","level","weaponindex","flags","projectile","numprojectiles","hspread","vspread","speed","acceleration","recoil","offset","angleoffset","extrazvelocity","ammoamount","ammoindex","activate","reload","spinup","spindown","proj"] end function
/// Return a new array `["thinktime","dir","speed","viewangles","actionflags","weapon"]` for `bot_input_tFields`.
function bot_input_tFields() return ["thinktime","dir","speed","viewangles","actionflags","weapon"] end function
/// Return a new array `["name","flags","value"]` for `bsp_surface_tFields`.
function bsp_surface_tFields() return ["name","flags","value"] end function
/// Return a new array `["allsolid","startsolid","fraction","endpos","plane","exp_dist","sidenum","surface","contents","ent"]` for `bsp_trace_tFields`.
function bsp_trace_tFields() return ["allsolid","startsolid","fraction","endpos","plane","exp_dist","sidenum","surface","contents","ent"] end function
/// Return the ordered bot entitystate t fields table for public headers: 18 entries beginning with `"type"` and `"flags"`.
function bot_entitystate_tFields() return ["type","flags","origin","angles","old_origin","mins","maxs","groundent","solid","modelindex","modelindex2","frame","event","eventParm","powerups","weapon","legsAnim","torsoAnim"] end function
/// Return the ordered botlib import t fields table for public headers: 22 entries beginning with `"Print"` and `"Trace"`.
function botlib_import_tFields() return ["Print","Trace","EntityTrace","PointContents","inPVS","BSPEntityData","BSPModelMinsMaxsOrigin","BotClientCommand","GetMemory","FreeMemory","AvailableMemory","HunkAlloc","FS_FOpenFile","FS_Read","FS_Write","FS_FCloseFile","FS_Seek","DebugLineCreate","DebugLineDelete","DebugLineShow","DebugPolygonCreate","DebugPolygonDelete"] end function
/// Return the ordered aas export t fields table for public headers: 22 entries beginning with `"AAS_EntityInfo"` and `"AAS_Initialized"`.
function aas_export_tFields() return ["AAS_EntityInfo","AAS_Initialized","AAS_PresenceTypeBoundingBox","AAS_Time","AAS_PointAreaNum","AAS_PointReachabilityAreaIndex","AAS_TraceAreas","AAS_BBoxAreas","AAS_AreaInfo","AAS_PointContents","AAS_NextBSPEntity","AAS_ValueForBSPEpairKey","AAS_VectorForBSPEpairKey","AAS_FloatForBSPEpairKey","AAS_IntForBSPEpairKey","AAS_AreaReachability","AAS_AreaTravelTimeToGoalArea","AAS_EnableRoutingArea","AAS_PredictRoute","AAS_AlternativeRouteGoals","AAS_Swimming","AAS_PredictClientMovement"] end function
/// Return the ordered ea export t fields table for public headers: 24 entries beginning with `"EA_Command"` and `"EA_Say"`.
function ea_export_tFields() return ["EA_Command","EA_Say","EA_SayTeam","EA_Action","EA_Gesture","EA_Talk","EA_Attack","EA_Use","EA_Respawn","EA_MoveUp","EA_MoveDown","EA_MoveForward","EA_MoveBack","EA_MoveLeft","EA_MoveRight","EA_Crouch","EA_SelectWeapon","EA_Jump","EA_DelayedJump","EA_Move","EA_View","EA_EndRegular","EA_GetInput","EA_ResetInput"] end function
/// Return the ordered ai export t fields table for public headers: 75 entries beginning with `"BotLoadCharacter"` and `"BotFreeCharacter"`.
function ai_export_tFields() return ["BotLoadCharacter","BotFreeCharacter","Characteristic_Float","Characteristic_BFloat","Characteristic_Integer","Characteristic_BInteger","Characteristic_String","BotAllocChatState","BotFreeChatState","BotQueueConsoleMessage","BotRemoveConsoleMessage","BotNextConsoleMessage","BotNumConsoleMessages","BotInitialChat","BotNumInitialChats","BotReplyChat","BotChatLength","BotEnterChat","BotGetChatMessage","StringContains","BotFindMatch","BotMatchVariable","UnifyWhiteSpaces","BotReplaceSynonyms","BotLoadChatFile","BotSetChatGender","BotSetChatName","BotResetGoalState","BotResetAvoidGoals","BotRemoveFromAvoidGoals","BotPushGoal","BotPopGoal","BotEmptyGoalStack","BotDumpAvoidGoals","BotDumpGoalStack","BotGoalName","BotGetTopGoal","BotGetSecondGoal","BotChooseLTGItem","BotChooseNBGItem","BotTouchingGoal","BotItemGoalInVisButNotVisible","BotGetLevelItemGoal","BotGetNextCampSpotGoal","BotGetMapLocationGoal","BotAvoidGoalTime","BotSetAvoidGoalTime","BotInitLevelItems","BotUpdateEntityItems","BotLoadItemWeights","BotFreeItemWeights","BotInterbreedGoalFuzzyLogic","BotSaveGoalFuzzyLogic","BotMutateGoalFuzzyLogic","BotAllocGoalState","BotFreeGoalState","BotResetMoveState","BotMoveToGoal","BotMoveInDirection","BotResetAvoidReach","BotResetLastAvoidReach","BotReachabilityArea","BotMovementViewTarget","BotPredictVisiblePosition","BotAllocMoveState","BotFreeMoveState","BotInitMoveState","BotAddAvoidSpot","BotChooseBestFightWeapon","BotGetWeaponInfo","BotLoadWeaponWeights","BotAllocWeaponState","BotFreeWeaponState","BotResetWeaponState","GeneticParentsAndChildSelection"] end function
/// Return the ordered botlib export t fields table for public headers: 16 entries beginning with `"BotLibSetup"` and `"BotLibShutdown"`.
function botlib_export_tFields() return ["BotLibSetup","BotLibShutdown","BotLibVarSet","BotLibVarGet","PC_AddGlobalDefine","PC_LoadSourceHandle","PC_FreeSourceHandle","PC_ReadTokenHandle","PC_SourceFileAndLine","BotLibStartFrame","BotLibLoadMap","BotLibUpdateEntity","Test","aas","ea","ai"] end function
/// Test `value==BOTLIB_API_VERSION` as the condition for `validApiVersion`.
/// @param value Operand used to evaluate the returned expression `value==BOTLIB_API_VERSION`.
function validApiVersion(value) return value==BOTLIB_API_VERSION end function
/// Test `value>=CHAT_GENDERLESS and value<=CHAT_GENDERMALE` as the condition for `validChatGender`.
/// @param value Operand used to evaluate the returned expression `value>=CHAT_GENDERLESS and value<=CHAT_GENDERMALE`.
function validChatGender(value) return value>=CHAT_GENDERLESS and value<=CHAT_GENDERMALE end function
/// Test `(flags&required)==required` as the condition for `hasTravel`.
/// @param flags Operand used to evaluate the returned expression `(flags&required)==required`.
/// @param required Operand used to evaluate the returned expression `(flags&required)==required`.
function hasTravel(flags,required) return (flags&required)==required end function
/// Return `TFL_DEFAULT` for `defaultTravelFlags`.
function defaultTravelFlags() return TFL_DEFAULT end function
/// Return a new array `[156,25,113,24,333]` for `inventoryCounts`.
function inventoryCounts() return [156,25,113,24,333] end function
/// Return a new array `[4,36,140,52,84,24,36,276,8,328,56,68,52,20,208,552,40,24,84,112,88,88,96,300,536]` for `abiSizes`.
function abiSizes() return [4,36,140,52,84,24,36,276,8,328,56,68,52,20,208,552,40,24,84,112,88,88,96,300,536] end function
