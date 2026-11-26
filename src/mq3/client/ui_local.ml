// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Public old-q3_ui ABI and menu layout from code/q3_ui/ui_local.h. Concrete
// behavior remains in the ui_* modules; this is their shared contract surface.
package mq3.client.ui_local

import mq3.client.keycodes as q3keys

/// UI virtual-machine interface version expected by the engine.
const UI_API_VERSION=4
/// Horizontal offset used to position the right-hand menu text column.
const RCOLUMN_OFFSET=16
/// Horizontal offset used to position the left-hand menu text column.
const LCOLUMN_OFFSET=-16
/// Logical step range used to map a menu slider between its minimum and maximum.
const SLIDER_RANGE=10
/// Maximum length of a console or editable input line.
const MAX_EDIT_LINE=256
/// Capacity limit for the menudepth collection or bounded storage used by this client module.
const MAX_MENUDEPTH=8
/// Capacity limit for the menuitems collection or bounded storage used by this client module.
const MAX_MENUITEMS=64
/// Capacity limit for the favoriteservers collection or bounded storage used by this client module.
const MAX_FAVORITESERVERS=16

/// Menu-widget kind selecting null behavior and widget-specific data.
const MTYPE_NULL=0
/// Menu-widget kind selecting slider behavior and widget-specific data.
const MTYPE_SLIDER=1
/// Menu-widget kind selecting action behavior and widget-specific data.
const MTYPE_ACTION=2
/// Menu-widget kind selecting spincontrol behavior and widget-specific data.
const MTYPE_SPINCONTROL=3
/// Menu-widget kind selecting field behavior and widget-specific data.
const MTYPE_FIELD=4
/// Menu-widget kind selecting radiobutton behavior and widget-specific data.
const MTYPE_RADIOBUTTON=5
/// Menu-widget kind selecting bitmap behavior and widget-specific data.
const MTYPE_BITMAP=6
/// Menu-widget kind selecting text behavior and widget-specific data.
const MTYPE_TEXT=7
/// Menu-widget kind selecting scrolllist behavior and widget-specific data.
const MTYPE_SCROLLLIST=8
/// Menu-widget kind selecting ptext behavior and widget-specific data.
const MTYPE_PTEXT=9
/// Menu-widget kind selecting btext behavior and widget-specific data.
const MTYPE_BTEXT=10
/// Menu-item flag used to blink the item while it is drawn.
const QMF_BLINK=1
/// Menu-item flag used to draw the item's text with the small font.
const QMF_SMALLFONT=2
/// Menu-item flag used to align the item to the left of its horizontal anchor.
const QMF_LEFT_JUSTIFY=4
/// Menu-item flag used to center the item around its horizontal anchor.
const QMF_CENTER_JUSTIFY=8
/// Menu-item flag used to align the item to the right of its horizontal anchor.
const QMF_RIGHT_JUSTIFY=16
/// Menu-item flag used to restrict editable text to numeric input.
const QMF_NUMBERSONLY=32
/// Menu-item flag used to draw the item in its highlighted style.
const QMF_HIGHLIGHT=64
/// Menu-item flag used to highlight the item only while it has focus.
const QMF_HIGHLIGHT_IF_FOCUS=128
/// Menu-item flag used to pulse the item only while it has focus.
const QMF_PULSEIFFOCUS=256
/// Menu-item flag used to record that the pointer currently focuses this item.
const QMF_HASMOUSEFOCUS=512
/// Menu-item flag used to suppress the ordinary on/off text for a radio button.
const QMF_NOONOFFTEXT=1024
/// Menu-item flag used to allow selection through the pointer but skip keyboard navigation.
const QMF_MOUSEONLY=2048
/// Menu-item flag used to omit the item from display and normal selection.
const QMF_HIDDEN=4096
/// Menu-item flag used to display the item as unavailable.
const QMF_GRAYED=8192
/// Menu-item flag used to exclude the item from interactive activation.
const QMF_INACTIVE=16384
/// Menu-item flag used to preserve the item's caller-supplied initialization.
const QMF_NODEFAULTINIT=32768
/// Menu-item flag used to delegate rendering to the item's owner-draw callback.
const QMF_OWNERDRAW=65536
/// Menu-item flag used to animate the item's color or brightness with a pulse.
const QMF_PULSE=131072
/// Menu-item flag used to convert entered characters to lowercase.
const QMF_LOWERCASE=262144
/// Menu-item flag used to convert entered characters to uppercase.
const QMF_UPPERCASE=524288
/// Menu-item flag used to suppress ordinary menu feedback sounds for this item.
const QMF_SILENT=1048576
/// Menu callback event reporting that the item was gotfocus.
const QM_GOTFOCUS=1
/// Menu callback event reporting that the item was lostfocus.
const QM_LOSTFOCUS=2
/// Activation event exported by the native UI compatibility declarations for consumers implementing
/// menu-item callbacks.
const QM_ACTIVATED=3
/// Postgame award identifier selecting the accuracy award category.
const AWARD_ACCURACY=0
/// Postgame award identifier selecting the impressive award category.
const AWARD_IMPRESSIVE=1
/// Postgame award identifier selecting the excellent award category.
const AWARD_EXCELLENT=2
/// Postgame award identifier selecting the gauntlet award category.
const AWARD_GAUNTLET=3
/// Postgame award identifier selecting the frags award category.
const AWARD_FRAGS=4
/// Postgame award identifier selecting the perfect award category.
const AWARD_PERFECT=5

/// Stores UI local menu framework record, including `cursor`, `cursor_prev`, `nitems`, `items`, `draw`, `key` and additional values.
struct MenuFramework
  /// Compatibility member corresponding to native `menuframework_s.cursor`; the original declaration is
  /// `int cursor`.
  cursor
  /// Compatibility member corresponding to native `menuframework_s.cursor_prev`; the original
  /// declaration is `int cursor_prev`.
  cursor_prev
  /// Number of entries currently present in the menu or selection list.
  nitems
  /// Compatibility member corresponding to native `menuframework_s.items`; the original declaration is
  /// `void *items[MAX_MENUITEMS]`.
  items
  /// Compatibility member corresponding to native `menuframework_s.draw`; the original declaration is
  /// `void (*draw) (void)`.
  draw
  /// Registered sound handle used for key; mirrors native `menuframework_s.key`.
  key
  /// Enables cyclic keyboard-focus navigation among the selectable entries of the original UI
  /// compatibility records.
  wrapAround
  /// Whether the menu framework covers the entire UI instead of appearing over the underlying game
  /// view.
  fullscreen
  /// Compatibility member corresponding to native `menuframework_s.showlogo`; the original declaration
  /// is `qboolean showlogo`.
  showlogo
end struct
/// Stores UI local menu common record, including `type`, `name`, `id`, `x`, `y`, `left` and additional values.
struct MenuCommon
  /// Compatibility member corresponding to native `menucommon_s.type`; the original declaration is `int
  /// type`.
  type
  /// Menu item label or bitmap resource name interpreted according to the common item's type.
  name
  /// Event-routing identifier of this selectable control in the original UI compatibility records.
  id
  /// Horizontal position of this menu control in the virtual layout used by the original UI
  /// compatibility records.
  x
  /// Vertical position of this menu control in the virtual layout used by the original UI compatibility
  /// records.
  y
  /// Left boundary of the interactive or clipped region.
  left
  /// Top boundary of the interactive or clipped region.
  top
  /// Right boundary of the interactive or clipped region.
  right
  /// Bottom boundary of the interactive or clipped region.
  bottom
  /// Owning menu or container used to route this item's events and layout.
  parent
  /// Index of this item within its owning menu's item list.
  menuPosition
  /// Compatibility member corresponding to native `menucommon_s.flags`; the original declaration is
  /// `unsigned flags`.
  flags
  /// Compatibility member corresponding to native `menucommon_s.callback`; the original declaration is
  /// `void (*callback)( void *self, int event )`.
  callback
  /// Optional callback used to draw the item's status-bar help or contextual information.
  statusbar
  /// Compatibility member corresponding to native `menucommon_s.ownerdraw`; the original declaration is
  /// `void (*ownerdraw)( void *self )`.
  ownerdraw
end struct
/// Stores UI local m field record, including `cursor`, `scroll`, `widthInChars`, `buffer`, `maxchars`.
struct MField
  /// Compatibility member corresponding to native `mfield_t.cursor`; the original declaration is `int
  /// cursor`.
  cursor
  /// Compatibility member corresponding to native `mfield_t.scroll`; the original declaration is `int
  /// scroll`.
  scroll
  /// Number of character columns visible in the editable text or console field.
  widthInChars
  /// Compatibility member corresponding to native `mfield_t.buffer`; the original declaration is `char
  /// buffer[MAX_EDIT_LINE]`.
  buffer
  /// Compatibility member corresponding to native `mfield_t.maxchars`; the original declaration is `int
  /// maxchars`.
  maxchars
end struct
/// Stores UI local menu field record, including `generic`, `field`.
struct MenuField
  /// Common menu-item record containing the shared identity, layout, and callback data.
  generic
  /// Compatibility member corresponding to native `menufield_s.field`; the original declaration is
  /// `mfield_t field`.
  field
end struct
/// Stores UI local menu slider record, including `generic`, `minvalue`, `maxvalue`, `curvalue`, `range`.
struct MenuSlider
  /// Common menu-item record containing the shared identity, layout, and callback data.
  generic
  /// Compatibility member corresponding to native `menuslider_s.minvalue`; the original declaration is
  /// `float minvalue`.
  minvalue
  /// Compatibility member corresponding to native `menuslider_s.maxvalue`; the original declaration is
  /// `float maxvalue`.
  maxvalue
  /// Compatibility member corresponding to native `menuslider_s.curvalue`; the original declaration is
  /// `float curvalue`.
  curvalue
  /// Compatibility member corresponding to native `menuslider_s.range`; the original declaration is
  /// `float range`.
  range
end struct
/// Stores UI local menu list record, including `generic`, `oldvalue`, `curvalue`, `numitems`, `top`, `itemnames` and additional values.
struct MenuList
  /// Common menu-item record containing the shared identity, layout, and callback data.
  generic
  /// Compatibility member corresponding to native `menulist_s.oldvalue`; the original declaration is
  /// `int oldvalue`.
  oldvalue
  /// Compatibility member corresponding to native `menulist_s.curvalue`; the original declaration is
  /// `int curvalue`.
  curvalue
  /// Number of entries currently present in the menu or selection list.
  numitems
  /// Top boundary of the interactive or clipped region.
  top
  /// Compatibility member corresponding to native `menulist_s.itemnames`; the original declaration is
  /// `const char **itemnames`.
  itemnames
  /// Character-cell width of each column in the native-compatible scrolling list.
  width
  /// Number of visible item rows per column in the native-compatible scrolling list.
  height
  /// Column descriptors used to lay out a listbox's displayed data.
  columns
  /// Compatibility member corresponding to native `menulist_s.seperation`; the original declaration is
  /// `int seperation`.
  seperation
end struct
/// Stores UI local menu action record, including `generic`.
struct MenuAction
  /// Common menu-item record containing the shared identity, layout, and callback data.
  generic
end struct
/// Stores UI local menu radio button record, including `generic`, `curvalue`.
struct MenuRadioButton
  /// Common menu-item record containing the shared identity, layout, and callback data.
  generic
  /// Compatibility member corresponding to native `menuradiobutton_s.curvalue`; the original
  /// declaration is `int curvalue`.
  curvalue
end struct
/// Stores UI local menu bitmap record, including `generic`, `focuspic`, `errorpic`, `shader`, `focusshader`, `width` and additional values.
struct MenuBitmap
  /// Common menu-item record containing the shared identity, layout, and callback data.
  generic
  /// Compatibility member corresponding to native `menubitmap_s.focuspic`; the original declaration is
  /// `char* focuspic`.
  focuspic
  /// Fallback image asset used when the menu bitmap's requested image cannot be loaded.
  errorpic
  /// Cached renderer material handle for the normal bitmap image, separate from the focus-image handle.
  shader
  /// Renderer resource handle used for focusshader; mirrors native `menubitmap_s.focusshader`.
  focusshader
  /// Bitmap drawing width in the native-compatible menu coordinate system.
  width
  /// Bitmap drawing height in the native-compatible menu coordinate system.
  height
  /// Compatibility member corresponding to native `menubitmap_s.focuscolor`; the original declaration
  /// is `float* focuscolor`.
  focuscolor
end struct
/// Stores UI local menu text record, including `generic`, `style`, `color`.
struct MenuText
  /// Common menu-item record containing the shared identity, layout, and callback data.
  generic
  /// Compatibility member corresponding to native `menutext_s.string`; the original declaration is
  /// `char* string`.
  string
  /// UI drawing-style flags controlling alignment, font selection, and text emphasis.
  style
  /// RGBA text color referenced by the native-compatible menu text item.
  color
end struct
/// Stores UI local lerp frame record, including `oldFrame`, `oldFrameTime`, `frame`, `frameTime`, `backlerp`, `yawAngle` and additional values.
struct LerpFrame
  /// Previous animation frame used as the interpolation starting point.
  oldFrame
  /// Client time in milliseconds at which the previous animation frame was exact.
  oldFrameTime
  /// Current menu preview-model frame being approached by interpolation from oldFrame.
  frame
  /// UI realtime timestamp in milliseconds at which interpolation reaches the current menu
  /// preview-model frame.
  frameTime
  /// Previous-frame weight used to interpolate the tracked animation presented by the original UI
  /// compatibility records.
  backlerp
  /// Smoothed yaw angle used to orient the animated body part.
  yawAngle
  /// True while the body part is turning toward its target yaw.
  yawing
  /// Smoothed pitch angle used to orient the animated body part.
  pitchAngle
  /// True while the body part is turning toward its target pitch.
  pitching
  /// Selected animation identifier, including the animation-toggle bit when present.
  animationNumber
  /// Animation description supplying frame ranges and playback timing.
  animation
  /// Client time in milliseconds at which the first frame of the animation becomes exact.
  animationTime
end struct
/// Stores UI local player info record, including `legsModel`, `legsSkin`, `legs`, `torsoModel`, `torsoSkin`, `torso` and additional values.
struct PlayerInfo
  /// Model resource selected for the legs presentation.
  legsModel
  /// Skin resource applied to the legs model presentation.
  legsSkin
  /// Animation and interpolation state for the player's legs.
  legs
  /// Model resource selected for the torso presentation.
  torsoModel
  /// Skin resource applied to the torso model presentation.
  torsoSkin
  /// Animation and interpolation state for the player's torso.
  torso
  /// Head-model resource used when drawing a player, head icon, or preview.
  headModel
  /// Skin resource applied to the player's head model.
  headSkin
  /// Animation descriptions indexed by the native player-animation identifiers.
  animations
  /// Model resource selected for the weapon presentation.
  weaponModel
  /// Model resource selected for the barrel presentation.
  barrelModel
  /// Model resource selected for the flash presentation.
  flashModel
  /// RGB components of the weapon's muzzle-flash dynamic light.
  flashDlightColor
  /// Client timestamp at which the entity's muzzle-flash effect began.
  muzzleFlashTime
  /// Euler camera angles used to construct the client view.
  viewAngles
  /// Compatibility member corresponding to native `playerInfo_t.moveAngles`; the original declaration
  /// is `vec3_t moveAngles`.
  moveAngles
  /// Compatibility member corresponding to native `playerInfo_t.currentWeapon`; the original
  /// declaration is `weapon_t currentWeapon`.
  currentWeapon
  /// Compatibility member corresponding to native `playerInfo_t.legsAnim`; the original declaration is
  /// `int legsAnim`.
  legsAnim
  /// Compatibility member corresponding to native `playerInfo_t.torsoAnim`; the original declaration is
  /// `int torsoAnim`.
  torsoAnim
  /// Requested preview weapon identifier retained in the native-compatible player-info record during a
  /// weapon switch.
  weapon
  /// Compatibility member corresponding to native `playerInfo_t.lastWeapon`; the original declaration
  /// is `weapon_t lastWeapon`.
  lastWeapon
  /// Compatibility member corresponding to native `playerInfo_t.pendingWeapon`; the original
  /// declaration is `weapon_t pendingWeapon`.
  pendingWeapon
  /// Compatibility member corresponding to native `playerInfo_t.weaponTimer`; the original declaration
  /// is `int weaponTimer`.
  weaponTimer
  /// Compatibility member corresponding to native `playerInfo_t.pendingLegsAnim`; the original
  /// declaration is `int pendingLegsAnim`.
  pendingLegsAnim
  /// Compatibility member corresponding to native `playerInfo_t.torsoAnimationTimer`; the original
  /// declaration is `int torsoAnimationTimer`.
  torsoAnimationTimer
  /// Compatibility member corresponding to native `playerInfo_t.pendingTorsoAnim`; the original
  /// declaration is `int pendingTorsoAnim`.
  pendingTorsoAnim
  /// Compatibility member corresponding to native `playerInfo_t.legsAnimationTimer`; the original
  /// declaration is `int legsAnimationTimer`.
  legsAnimationTimer
  /// Compatibility member corresponding to native `playerInfo_t.chat`; the original declaration is
  /// `qboolean chat`.
  chat
  /// Model resource selected for the new presentation.
  newModel
  /// True while the weapon barrel is in its spinning state.
  barrelSpinning
  /// Current rotational angle of the spinning weapon barrel.
  barrelAngle
  /// Client timestamp used to advance or stop weapon-barrel rotation.
  barrelTime
  /// Compatibility member corresponding to native `playerInfo_t.realWeapon`; the original declaration
  /// is `int realWeapon`.
  realWeapon
end struct
/// Stores UI local ui static record, including `frametime`, `realtime`, `cursorx`, `cursory`, `menusp`, `activemenu` and additional values.
struct UIStatic
  /// Elapsed client time in milliseconds since the preceding frame.
  frametime
  /// Most recent UI refresh timestamp in milliseconds retained in the shared UI state.
  realtime
  /// Horizontal position of the UI pointer in the menu coordinate system.
  cursorx
  /// Vertical position of the UI pointer in the menu coordinate system.
  cursory
  /// Compatibility member corresponding to native `uiStatic_t.menusp`; the original declaration is `int
  /// menusp`.
  menusp
  /// Compatibility member corresponding to native `uiStatic_t.activemenu`; the original declaration is
  /// `menuframework_s* activemenu`.
  activemenu
  /// Compatibility member corresponding to native `uiStatic_t.stack`; the original declaration is
  /// `menuframework_s* stack[MAX_MENUDEPTH]`.
  stack
  /// Renderer configuration reported by the engine for the current display.
  glconfig
  /// Compatibility member corresponding to native `uiStatic_t.debug`; the original declaration is
  /// `qboolean debug`.
  debug
  /// Shader resource selected for white rendering.
  whiteShader
  /// Shader resource selected for menu back rendering.
  menuBackShader
  /// Shader resource selected for menu back no logo rendering.
  menuBackNoLogoShader
  /// Renderer resource handle used for charset; mirrors native `uiStatic_t.charset`.
  charset
  /// Renderer resource handle used for charset prop; mirrors native `uiStatic_t.charsetProp`.
  charsetProp
  /// Renderer resource handle used for charset prop glow; mirrors native `uiStatic_t.charsetPropGlow`.
  charsetPropGlow
  /// Renderer resource handle used for charset prop b; mirrors native `uiStatic_t.charsetPropB`.
  charsetPropB
  /// Renderer resource handle used for cursor; mirrors native `uiStatic_t.cursor`.
  cursor
  /// Renderer resource handle used for rb on; mirrors native `uiStatic_t.rb_on`.
  rb_on
  /// Renderer resource handle used for rb off; mirrors native `uiStatic_t.rb_off`.
  rb_off
  /// Compatibility member corresponding to native `uiStatic_t.scale`; the original declaration is
  /// `float scale`.
  scale
  /// Horizontal adjustment used when centering the virtual UI on a wider display.
  bias
  /// Compatibility member corresponding to native `uiStatic_t.demoversion`; the original declaration is
  /// `qboolean demoversion`.
  demoversion
  /// Compatibility member corresponding to native `uiStatic_t.firstdraw`; the original declaration is
  /// `qboolean firstdraw`.
  firstdraw
end struct

/// Lists the type names catalog for UI local in its declared source order.
function typeNames() return ["menuframework_s","menucommon_s","mfield_t","menufield_s","menuslider_s","menulist_s","menuaction_s","menuradiobutton_s","menubitmap_s","menutext_s","lerpFrame_t","playerInfo_t","uiStatic_t","awardType_t","voidfunc_f"] end function
/// Computes `(flags&(QMF_GRAYED|QMF_INACTIVE|QMF_HIDDEN))==0` for UI local `menuAcceptsInput`.
/// @param flags Value used by `return (flags&(QMF_GRAYED|QMF_INACTIVE|QMF_HIDDEN))==0`.
function menuAcceptsInput(flags) return (flags&(QMF_GRAYED|QMF_INACTIVE|QMF_HIDDEN))==0 end function
/// Calls `mq3.client.keycodes.isCharacterEvent`, `mq3.client.keycodes.characterCode` from UI local `normalizeCharacterEvent`. The final path returns `key`.
/// @param key Key or control identifier used to select the corresponding UI local entry.
function normalizeCharacterEvent(key) if q3keys.isCharacterEvent(key) then return q3keys.characterCode(key) end if;return key end function
/// Lists the 226 UI local declared functions strings in their declared order, beginning with `"Menu_Cache"`, `"Menu_Focus"`, `"Menu_AddItem"`.
function declaredFunctions() return ["Menu_Cache","Menu_Focus","Menu_AddItem","Menu_AdjustCursor","Menu_Draw","Menu_ItemAtCursor","Menu_ActivateItem","Menu_SetCursor","Menu_SetCursorToItem","Menu_DefaultKey","Bitmap_Init","Bitmap_Draw","ScrollList_Draw","ScrollList_Key","MField_Clear","MField_KeyDownEvent","MField_CharEvent","MField_Draw","MenuField_Init","MenuField_Draw","MenuField_Key","MainMenu_Cache","UI_MainMenu","UI_RegisterCvars","UI_UpdateCvars","UI_CreditMenu","InGame_Cache","UI_InGameMenu","ConfirmMenu_Cache","UI_ConfirmMenu","UI_ConfirmMenu_Style","UI_Message","UI_SetupMenu_Cache","UI_SetupMenu","UI_TeamMainMenu","TeamMain_Cache","UI_DrawConnectScreen","UI_ControlsMenu","Controls_Cache","UI_DemosMenu","Demos_Cache","UI_CinematicsMenu","UI_CinematicsMenu_f","UI_CinematicsMenu_Cache","UI_ModsMenu","UI_ModsMenu_Cache","UI_CDKeyMenu","UI_CDKeyMenu_Cache","UI_CDKeyMenu_f","UI_PlayerModelMenu","PlayerModel_Cache","UI_PlayerSettingsMenu","PlayerSettings_Cache","UI_PreferencesMenu","Preferences_Cache","UI_SpecifyLeagueMenu","SpecifyLeague_Cache","UI_SpecifyServerMenu","SpecifyServer_Cache","UI_ArenaServersMenu","ArenaServers_Cache","UI_StartServerMenu","StartServer_Cache","ServerOptions_Cache","UI_BotSelectMenu","UI_BotSelectMenu_Cache","UI_ServerInfoMenu","ServerInfo_Cache","UI_GraphicsOptionsMenu","GraphicsOptions_Cache","DriverInfo_Cache","UI_DrawPlayer","UI_PlayerInfo_SetModel","UI_PlayerInfo_SetInfo","UI_RegisterClientModelname","UI_Init","UI_Shutdown","UI_KeyEvent","UI_MouseEvent","UI_Refresh","UI_ConsoleCommand","UI_ClampCvar","UI_DrawNamedPic","UI_DrawHandlePic","UI_FillRect","UI_DrawRect","UI_UpdateScreen","UI_SetColor","UI_LerpColor","UI_DrawBannerString","UI_ProportionalSizeScale","UI_DrawProportionalString","UI_DrawProportionalString_AutoWrapped","UI_ProportionalStringWidth","UI_DrawString","UI_DrawChar","UI_CursorInRect","UI_AdjustFrom640","UI_DrawTextBox","UI_IsFullscreen","UI_SetActiveMenu","UI_PushMenu","UI_PopMenu","UI_ForceMenuOff","UI_Argv","UI_Cvar_VariableString","UI_StartDemoLoop","UI_SPLevelMenu_Cache","UI_SPLevelMenu","UI_SPLevelMenu_f","UI_SPLevelMenu_ReInit","UI_SPArena_Start","UI_SPPostgameMenu_Cache","UI_SPPostgameMenu_f","UI_SPSkillMenu","UI_SPSkillMenu_Cache","trap_Print","trap_Error","trap_Milliseconds","trap_Cvar_Register","trap_Cvar_Update","trap_Cvar_Set","trap_Cvar_VariableValue","trap_Cvar_VariableStringBuffer","trap_Cvar_SetValue","trap_Cvar_Reset","trap_Cvar_Create","trap_Cvar_InfoStringBuffer","trap_Argc","trap_Argv","trap_Cmd_ExecuteText","trap_FS_FOpenFile","trap_FS_Read","trap_FS_Write","trap_FS_FCloseFile","trap_FS_GetFileList","trap_FS_Seek","trap_R_RegisterModel","trap_R_RegisterSkin","trap_R_RegisterShaderNoMip","trap_R_ClearScene","trap_R_AddRefEntityToScene","trap_R_AddPolyToScene","trap_R_AddLightToScene","trap_R_RenderScene","trap_R_SetColor","trap_R_DrawStretchPic","trap_UpdateScreen","trap_CM_LerpTag","trap_S_StartLocalSound","trap_S_RegisterSound","trap_Key_KeynumToStringBuf","trap_Key_GetBindingBuf","trap_Key_SetBinding","trap_Key_IsDown","trap_Key_GetOverstrikeMode","trap_Key_SetOverstrikeMode","trap_Key_ClearStates","trap_Key_GetCatcher","trap_Key_SetCatcher","trap_GetClipboardData","trap_GetClientState","trap_GetGlconfig","trap_GetConfigString","trap_LAN_GetServerCount","trap_LAN_GetServerAddressString","trap_LAN_GetServerInfo","trap_LAN_GetPingQueueCount","trap_LAN_ServerStatus","trap_LAN_ClearPing","trap_LAN_GetPing","trap_LAN_GetPingInfo","trap_MemoryRemaining","trap_GetCDKey","trap_SetCDKey","trap_VerifyCDKey","trap_SetPbClStatus","UI_AddBots_Cache","UI_AddBotsMenu","UI_RemoveBots_Cache","UI_RemoveBotsMenu","UI_TeamOrdersMenu","UI_TeamOrdersMenu_f","UI_TeamOrdersMenu_Cache","UI_LoadConfig_Cache","UI_LoadConfigMenu","UI_SaveConfigMenu_Cache","UI_SaveConfigMenu","UI_DisplayOptionsMenu_Cache","UI_DisplayOptionsMenu","UI_SoundOptionsMenu_Cache","UI_SoundOptionsMenu","UI_NetworkOptionsMenu_Cache","UI_NetworkOptionsMenu","UI_GetArenaInfoByNumber","UI_GetArenaInfoByMap","UI_GetSpecialArenaInfo","UI_GetNumArenas","UI_GetNumSPArenas","UI_GetNumSPTiers","UI_GetBotInfoByNumber","UI_GetBotInfoByName","UI_GetNumBots","UI_GetBestScore","UI_SetBestScore","UI_TierCompleted","UI_ShowTierVideo","UI_CanShowTierVideo","UI_GetCurrentGame","UI_NewGame","UI_LogAwardData","UI_GetAwardLevel","UI_SPUnlock_f","UI_SPUnlockMedals_f","UI_InitGameinfo","Rankings_DrawText","Rankings_DrawName","Rankings_DrawPassword","Rankings_Cache","UI_RankingsMenu","Login_Cache","UI_LoginMenu","Signup_Cache","UI_SignupMenu","RankStatus_Cache","UI_RankStatusMenu"] end function
/// Lists the 79 UI local declared globals strings in their declared order, beginning with `"ui_ffa_fraglimit"`, `"ui_ffa_timelimit"`, `"ui_tourney_fraglimit"`.
function declaredGlobals() return ["ui_ffa_fraglimit","ui_ffa_timelimit","ui_tourney_fraglimit","ui_tourney_timelimit","ui_team_fraglimit","ui_team_timelimit","ui_team_friendly","ui_ctf_capturelimit","ui_ctf_timelimit","ui_ctf_friendly","ui_arenasFile","ui_botsFile","ui_spScores1","ui_spScores2","ui_spScores3","ui_spScores4","ui_spScores5","ui_spAwards","ui_spVideos","ui_spSkill","ui_spSelection","ui_browserMaster","ui_browserGameType","ui_browserSortKey","ui_browserShowFull","ui_browserShowEmpty","ui_brassTime","ui_drawCrosshair","ui_drawCrosshairNames","ui_marks","ui_server1","ui_server2","ui_server3","ui_server4","ui_server5","ui_server6","ui_server7","ui_server8","ui_server9","ui_server10","ui_server11","ui_server12","ui_server13","ui_server14","ui_server15","ui_server16","ui_cdkey","ui_cdkeychecked","menu_in_sound","menu_move_sound","menu_out_sound","menu_buzz_sound","menu_null_sound","weaponChangeSound","menu_text_color","menu_grayed_color","menu_dark_color","menu_highlight_color","menu_red_color","menu_black_color","menu_dim_color","color_black","color_white","color_yellow","color_blue","color_orange","color_red","color_dim","name_color","list_color","listbar_color","text_color_disabled","text_color_normal","text_color_highlight","ui_medalNames","ui_medalPicNames","ui_medalSounds","m_entersound","uis"] end function
