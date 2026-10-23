// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Public old-q3_ui ABI and menu layout from code/q3_ui/ui_local.h. Concrete
// behavior remains in the ui_* modules; this is their shared contract surface.
package mq3.client.ui_local

import mq3.client.keycodes as q3keys

const UI_API_VERSION=4
const RCOLUMN_OFFSET=16
const LCOLUMN_OFFSET=-16
const SLIDER_RANGE=10
const MAX_EDIT_LINE=256
const MAX_MENUDEPTH=8
const MAX_MENUITEMS=64
const MAX_FAVORITESERVERS=16

const MTYPE_NULL=0
const MTYPE_SLIDER=1
const MTYPE_ACTION=2
const MTYPE_SPINCONTROL=3
const MTYPE_FIELD=4
const MTYPE_RADIOBUTTON=5
const MTYPE_BITMAP=6
const MTYPE_TEXT=7
const MTYPE_SCROLLLIST=8
const MTYPE_PTEXT=9
const MTYPE_BTEXT=10
const QMF_BLINK=1
const QMF_SMALLFONT=2
const QMF_LEFT_JUSTIFY=4
const QMF_CENTER_JUSTIFY=8
const QMF_RIGHT_JUSTIFY=16
const QMF_NUMBERSONLY=32
const QMF_HIGHLIGHT=64
const QMF_HIGHLIGHT_IF_FOCUS=128
const QMF_PULSEIFFOCUS=256
const QMF_HASMOUSEFOCUS=512
const QMF_NOONOFFTEXT=1024
const QMF_MOUSEONLY=2048
const QMF_HIDDEN=4096
const QMF_GRAYED=8192
const QMF_INACTIVE=16384
const QMF_NODEFAULTINIT=32768
const QMF_OWNERDRAW=65536
const QMF_PULSE=131072
const QMF_LOWERCASE=262144
const QMF_UPPERCASE=524288
const QMF_SILENT=1048576
const QM_GOTFOCUS=1
const QM_LOSTFOCUS=2
const QM_ACTIVATED=3
const AWARD_ACCURACY=0
const AWARD_IMPRESSIVE=1
const AWARD_EXCELLENT=2
const AWARD_GAUNTLET=3
const AWARD_FRAGS=4
const AWARD_PERFECT=5

struct MenuFramework cursor cursor_prev nitems items draw key wrapAround fullscreen showlogo end struct
struct MenuCommon type name id x y left top right bottom parent menuPosition flags callback statusbar ownerdraw end struct
struct MField cursor scroll widthInChars buffer maxchars end struct
struct MenuField generic field end struct
struct MenuSlider generic minvalue maxvalue curvalue range end struct
struct MenuList generic oldvalue curvalue numitems top itemnames width height columns seperation end struct
struct MenuAction generic end struct
struct MenuRadioButton generic curvalue end struct
struct MenuBitmap generic focuspic errorpic shader focusshader width height focuscolor end struct
struct MenuText generic string style color end struct
struct LerpFrame oldFrame oldFrameTime frame frameTime backlerp yawAngle yawing pitchAngle pitching animationNumber animation animationTime end struct
struct PlayerInfo legsModel legsSkin legs torsoModel torsoSkin torso headModel headSkin animations weaponModel barrelModel flashModel flashDlightColor muzzleFlashTime viewAngles moveAngles currentWeapon legsAnim torsoAnim weapon lastWeapon pendingWeapon weaponTimer pendingLegsAnim torsoAnimationTimer pendingTorsoAnim legsAnimationTimer chat newModel barrelSpinning barrelAngle barrelTime realWeapon end struct
struct UIStatic frametime realtime cursorx cursory menusp activemenu stack glconfig debug whiteShader menuBackShader menuBackNoLogoShader charset charsetProp charsetPropGlow charsetPropB cursor rb_on rb_off scale bias demoversion firstdraw end struct

function typeNames() return ["menuframework_s","menucommon_s","mfield_t","menufield_s","menuslider_s","menulist_s","menuaction_s","menuradiobutton_s","menubitmap_s","menutext_s","lerpFrame_t","playerInfo_t","uiStatic_t","awardType_t","voidfunc_f"] end function
function menuAcceptsInput(flags) return (flags&(QMF_GRAYED|QMF_INACTIVE|QMF_HIDDEN))==0 end function
function normalizeCharacterEvent(key) if q3keys.isCharacterEvent(key) then return q3keys.characterCode(key) end if;return key end function
function declaredFunctions() return ["Menu_Cache","Menu_Focus","Menu_AddItem","Menu_AdjustCursor","Menu_Draw","Menu_ItemAtCursor","Menu_ActivateItem","Menu_SetCursor","Menu_SetCursorToItem","Menu_DefaultKey","Bitmap_Init","Bitmap_Draw","ScrollList_Draw","ScrollList_Key","MField_Clear","MField_KeyDownEvent","MField_CharEvent","MField_Draw","MenuField_Init","MenuField_Draw","MenuField_Key","MainMenu_Cache","UI_MainMenu","UI_RegisterCvars","UI_UpdateCvars","UI_CreditMenu","InGame_Cache","UI_InGameMenu","ConfirmMenu_Cache","UI_ConfirmMenu","UI_ConfirmMenu_Style","UI_Message","UI_SetupMenu_Cache","UI_SetupMenu","UI_TeamMainMenu","TeamMain_Cache","UI_DrawConnectScreen","UI_ControlsMenu","Controls_Cache","UI_DemosMenu","Demos_Cache","UI_CinematicsMenu","UI_CinematicsMenu_f","UI_CinematicsMenu_Cache","UI_ModsMenu","UI_ModsMenu_Cache","UI_CDKeyMenu","UI_CDKeyMenu_Cache","UI_CDKeyMenu_f","UI_PlayerModelMenu","PlayerModel_Cache","UI_PlayerSettingsMenu","PlayerSettings_Cache","UI_PreferencesMenu","Preferences_Cache","UI_SpecifyLeagueMenu","SpecifyLeague_Cache","UI_SpecifyServerMenu","SpecifyServer_Cache","UI_ArenaServersMenu","ArenaServers_Cache","UI_StartServerMenu","StartServer_Cache","ServerOptions_Cache","UI_BotSelectMenu","UI_BotSelectMenu_Cache","UI_ServerInfoMenu","ServerInfo_Cache","UI_GraphicsOptionsMenu","GraphicsOptions_Cache","DriverInfo_Cache","UI_DrawPlayer","UI_PlayerInfo_SetModel","UI_PlayerInfo_SetInfo","UI_RegisterClientModelname","UI_Init","UI_Shutdown","UI_KeyEvent","UI_MouseEvent","UI_Refresh","UI_ConsoleCommand","UI_ClampCvar","UI_DrawNamedPic","UI_DrawHandlePic","UI_FillRect","UI_DrawRect","UI_UpdateScreen","UI_SetColor","UI_LerpColor","UI_DrawBannerString","UI_ProportionalSizeScale","UI_DrawProportionalString","UI_DrawProportionalString_AutoWrapped","UI_ProportionalStringWidth","UI_DrawString","UI_DrawChar","UI_CursorInRect","UI_AdjustFrom640","UI_DrawTextBox","UI_IsFullscreen","UI_SetActiveMenu","UI_PushMenu","UI_PopMenu","UI_ForceMenuOff","UI_Argv","UI_Cvar_VariableString","UI_StartDemoLoop","UI_SPLevelMenu_Cache","UI_SPLevelMenu","UI_SPLevelMenu_f","UI_SPLevelMenu_ReInit","UI_SPArena_Start","UI_SPPostgameMenu_Cache","UI_SPPostgameMenu_f","UI_SPSkillMenu","UI_SPSkillMenu_Cache","trap_Print","trap_Error","trap_Milliseconds","trap_Cvar_Register","trap_Cvar_Update","trap_Cvar_Set","trap_Cvar_VariableValue","trap_Cvar_VariableStringBuffer","trap_Cvar_SetValue","trap_Cvar_Reset","trap_Cvar_Create","trap_Cvar_InfoStringBuffer","trap_Argc","trap_Argv","trap_Cmd_ExecuteText","trap_FS_FOpenFile","trap_FS_Read","trap_FS_Write","trap_FS_FCloseFile","trap_FS_GetFileList","trap_FS_Seek","trap_R_RegisterModel","trap_R_RegisterSkin","trap_R_RegisterShaderNoMip","trap_R_ClearScene","trap_R_AddRefEntityToScene","trap_R_AddPolyToScene","trap_R_AddLightToScene","trap_R_RenderScene","trap_R_SetColor","trap_R_DrawStretchPic","trap_UpdateScreen","trap_CM_LerpTag","trap_S_StartLocalSound","trap_S_RegisterSound","trap_Key_KeynumToStringBuf","trap_Key_GetBindingBuf","trap_Key_SetBinding","trap_Key_IsDown","trap_Key_GetOverstrikeMode","trap_Key_SetOverstrikeMode","trap_Key_ClearStates","trap_Key_GetCatcher","trap_Key_SetCatcher","trap_GetClipboardData","trap_GetClientState","trap_GetGlconfig","trap_GetConfigString","trap_LAN_GetServerCount","trap_LAN_GetServerAddressString","trap_LAN_GetServerInfo","trap_LAN_GetPingQueueCount","trap_LAN_ServerStatus","trap_LAN_ClearPing","trap_LAN_GetPing","trap_LAN_GetPingInfo","trap_MemoryRemaining","trap_GetCDKey","trap_SetCDKey","trap_VerifyCDKey","trap_SetPbClStatus","UI_AddBots_Cache","UI_AddBotsMenu","UI_RemoveBots_Cache","UI_RemoveBotsMenu","UI_TeamOrdersMenu","UI_TeamOrdersMenu_f","UI_TeamOrdersMenu_Cache","UI_LoadConfig_Cache","UI_LoadConfigMenu","UI_SaveConfigMenu_Cache","UI_SaveConfigMenu","UI_DisplayOptionsMenu_Cache","UI_DisplayOptionsMenu","UI_SoundOptionsMenu_Cache","UI_SoundOptionsMenu","UI_NetworkOptionsMenu_Cache","UI_NetworkOptionsMenu","UI_GetArenaInfoByNumber","UI_GetArenaInfoByMap","UI_GetSpecialArenaInfo","UI_GetNumArenas","UI_GetNumSPArenas","UI_GetNumSPTiers","UI_GetBotInfoByNumber","UI_GetBotInfoByName","UI_GetNumBots","UI_GetBestScore","UI_SetBestScore","UI_TierCompleted","UI_ShowTierVideo","UI_CanShowTierVideo","UI_GetCurrentGame","UI_NewGame","UI_LogAwardData","UI_GetAwardLevel","UI_SPUnlock_f","UI_SPUnlockMedals_f","UI_InitGameinfo","Rankings_DrawText","Rankings_DrawName","Rankings_DrawPassword","Rankings_Cache","UI_RankingsMenu","Login_Cache","UI_LoginMenu","Signup_Cache","UI_SignupMenu","RankStatus_Cache","UI_RankStatusMenu"] end function
function declaredGlobals() return ["ui_ffa_fraglimit","ui_ffa_timelimit","ui_tourney_fraglimit","ui_tourney_timelimit","ui_team_fraglimit","ui_team_timelimit","ui_team_friendly","ui_ctf_capturelimit","ui_ctf_timelimit","ui_ctf_friendly","ui_arenasFile","ui_botsFile","ui_spScores1","ui_spScores2","ui_spScores3","ui_spScores4","ui_spScores5","ui_spAwards","ui_spVideos","ui_spSkill","ui_spSelection","ui_browserMaster","ui_browserGameType","ui_browserSortKey","ui_browserShowFull","ui_browserShowEmpty","ui_brassTime","ui_drawCrosshair","ui_drawCrosshairNames","ui_marks","ui_server1","ui_server2","ui_server3","ui_server4","ui_server5","ui_server6","ui_server7","ui_server8","ui_server9","ui_server10","ui_server11","ui_server12","ui_server13","ui_server14","ui_server15","ui_server16","ui_cdkey","ui_cdkeychecked","menu_in_sound","menu_move_sound","menu_out_sound","menu_buzz_sound","menu_null_sound","weaponChangeSound","menu_text_color","menu_grayed_color","menu_dark_color","menu_highlight_color","menu_red_color","menu_black_color","menu_dim_color","color_black","color_white","color_yellow","color_blue","color_orange","color_red","color_dim","name_color","list_color","listbar_color","text_color_disabled","text_color_normal","text_color_highlight","ui_medalNames","ui_medalPicNames","ui_medalSounds","m_entersound","uis"] end function
