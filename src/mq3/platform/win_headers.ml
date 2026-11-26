// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Canonical MiniLang ownership of glw_win.h, win_local.h and resource.h.
package mq3.platform.win_headers

const DIRECTSOUND_VERSION=0x0300
const DIRECTINPUT_VERSION=0x0300

const IDS_STRING1=1
const IDI_ICON1=1
const IDB_BITMAP1=1
const IDB_BITMAP2=128
const IDC_CURSOR1=129
const IDC_CURSOR2=130
const IDC_CURSOR3=131
const _APS_NO_MFC=1
const _APS_NEXT_RESOURCE_VALUE=132
const _APS_NEXT_COMMAND_VALUE=40001
const _APS_NEXT_CONTROL_VALUE=1005
const _APS_NEXT_SYMED_VALUE=101

// Native handles and callbacks are represented by managed host handles.  The
// field order mirrors the original records; the constants below retain the
// original 32-bit ABI used by the released Windows executable.
struct GLWState wndproc hDC hGLRC hinstOpenGL allowdisplaydepthchange pixelFormatSet desktopBitsPixel desktopWidth desktopHeight cdsFullscreen log_fp end struct
/// Data record for `mq3.platform.win_headers.WinVars`; groups `reflib_library`, `reflib_active`, `hWnd`, `hInstance`, `activeApp`, `isMinimized`, and 2 further fields.
struct WinVars reflib_library reflib_active hWnd hInstance activeApp isMinimized osversion sysMsgTime end struct

const GLWSTATE_X86_SIZE=44
const WINVARS_X86_SIZE=176
const OSVERSIONINFOA_X86_SIZE=148

/// Lists the 11 declared names for `mq3.platform.win_headers.glwStateFieldNames`, including `wndproc`, `hDC`, `hGLRC`, `hinstOpenGL`.
function glwStateFieldNames() return ["wndproc","hDC","hGLRC","hinstOpenGL","allowdisplaydepthchange","pixelFormatSet","desktopBitsPixel","desktopWidth","desktopHeight","cdsFullscreen","log_fp"] end function
/// Returns `[0,4,8,12,16,20,24,28,32,36,40]` for `mq3.platform.win_headers.glwStateX86Offsets`.
function glwStateX86Offsets() return [0,4,8,12,16,20,24,28,32,36,40] end function
/// Lists the 8 declared names for `mq3.platform.win_headers.winVarsFieldNames`, including `reflib_library`, `reflib_active`, `hWnd`, `hInstance`.
function winVarsFieldNames() return ["reflib_library","reflib_active","hWnd","hInstance","activeApp","isMinimized","osversion","sysMsgTime"] end function
/// Returns `[0,4,8,12,16,20,24,172]` for `mq3.platform.win_headers.winVarsX86Offsets`.
function winVarsX86Offsets() return [0,4,8,12,16,20,24,172] end function
/// Lists the 17 declared names for `mq3.platform.win_headers.winLocalFunctionNames`, including `IN_MouseEvent`, `Sys_QueEvent`, `Sys_CreateConsole`, `Sys_DestroyConsole`.
function winLocalFunctionNames() return ["IN_MouseEvent","Sys_QueEvent","Sys_CreateConsole","Sys_DestroyConsole","Sys_ConsoleInput","Sys_GetPacket","IN_Init","IN_Shutdown","IN_JoystickCommands","IN_Move","IN_DeactivateWin32Mouse","IN_Activate","IN_Frame","MainWndProc","Conbuf_AppendText","SNDDMA_Activate","SNDDMA_InitDS"] end function
/// Lists the 12 declared names for `mq3.platform.win_headers.resourceMacroNames`, including `IDS_STRING1`, `IDI_ICON1`, `IDB_BITMAP1`, `IDB_BITMAP2`.
function resourceMacroNames() return ["IDS_STRING1","IDI_ICON1","IDB_BITMAP1","IDB_BITMAP2","IDC_CURSOR1","IDC_CURSOR2","IDC_CURSOR3","_APS_NO_MFC","_APS_NEXT_RESOURCE_VALUE","_APS_NEXT_COMMAND_VALUE","_APS_NEXT_CONTROL_VALUE","_APS_NEXT_SYMED_VALUE"] end function
/// Lists the 2 declared names for `mq3.platform.win_headers.versionMacroNames`, including `DIRECTSOUND_VERSION`, `DIRECTINPUT_VERSION`.
function versionMacroNames() return ["DIRECTSOUND_VERSION","DIRECTINPUT_VERSION"] end function

/// Constructs `mq3.platform.win_headers.GLWState` with `wndproc` = `void`, `hDC` = `void`, `hGLRC` = `void`, `hinstOpenGL` = `void` and the supplied remaining values.
function createGLWState()
  return GLWState(void,void,void,void,false,false,0,0,0,false,void)
end function
/// Constructs `mq3.platform.win_headers.WinVars` with `reflib_library` = `void`, `reflib_active` = `false`, `hWnd` = `void`, `hInstance` = `void` and the supplied remaining values.
function createWinVars()
  return WinVars(void,false,void,void,false,false,void,0)
end function

