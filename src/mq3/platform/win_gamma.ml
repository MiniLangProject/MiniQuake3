// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Safe Win32 gamma-ramp state and host boundary from code/win32/win_gamma.c.
package mq3.platform.win_gamma

/// Driver category for a standalone OpenGL minidriver.
const GLDRV_STANDALONE=1

/// Data record for `mq3.platform.win_gamma.Action`; groups `boundary`, `kind`, `ramp`, `dispatched`.
struct Action
  /// Host operation boundary at which this platform action is dispatched.
  boundary
  /// Gamma operation selecting a Win32 or 3Dfx ramp update or restoration.
  kind
  /// Gamma-ramp samples carried by the platform action.
  ramp
  /// Whether the recorded action was delivered to its host implementation.
  dispatched
end struct
/// Data record for `mq3.platform.win_gamma.State`; groups `deviceSupportsGamma`, `ignoreHardwareGamma`, `driverType`, `hasDc`, `has3dfx`, `isWin2k`, and 6 further fields.
struct State
  /// Whether the display supports hardware gamma-ramp updates.
  deviceSupportsGamma
  /// Whether hardware gamma-ramp updates are disabled by configuration.
  ignoreHardwareGamma
  /// Graphics-driver integration category used by platform compatibility handling.
  driverType
  /// Whether a valid display device context is available.
  hasDc
  /// Whether the graphics driver uses the legacy 3Dfx path.
  has3dfx
  /// Whether the detected Windows version uses the Windows 2000 gamma restrictions.
  isWin2k
  /// Original display gamma ramp saved for restoration.
  oldRamp
  /// Gamma ramp currently selected by the platform layer.
  currentRamp
  /// Platform operations recorded for dispatch or inspection.
  actions
  /// Nonfatal diagnostics retained by the subsystem.
  warnings
  /// Debug messages recorded while processing platform actions.
  debug
  /// Whether the real platform backend is active for action dispatch.
  retailActive
end struct

/// Builds `rows[channel]` in `mq3.platform.win_gamma.blankRamp`; returns `rows`.
function blankRamp() rows=array(3,void);for channel=0 to 2 rows[channel]=array(256,0) end for;return rows end function
/// Builds `result[channel][index]` in `mq3.platform.win_gamma.copyRamp`; returns `result`.
/// @param source Nested indexed data; outer entries read at `channel`.
function copyRamp(source) result=blankRamp();if source==void or len(source)!=3 then return result end if;for channel=0 to 2 if len(source[channel])>=256 then for index=0 to 255 result[channel][index]=source[channel][index]&65535 end for end if end for;return result end function
/// Constructs `mq3.platform.win_gamma.State` with `deviceSupportsGamma` = `false`, `oldRamp` = `blankRamp()`, `currentRamp` = `blankRamp()`, `actions` = `[]` and the supplied remaining values.
/// @param ignoreHardwareGamma Initial value for `mq3.platform.win_gamma.State.ignoreHardwareGamma`.
/// @param driverType Initial value for `mq3.platform.win_gamma.State.driverType`.
/// @param hasDc Initial value for `mq3.platform.win_gamma.State.hasDc`.
/// @param has3dfx Initial value for `mq3.platform.win_gamma.State.has3dfx`.
/// @param isWin2k Initial value for `mq3.platform.win_gamma.State.isWin2k`.
/// @param retailActive Initial value for `mq3.platform.win_gamma.State.retailActive`.
function create(ignoreHardwareGamma,driverType,hasDc,has3dfx,isWin2k,retailActive) return State(false,ignoreHardwareGamma,driverType,hasDc,has3dfx,isWin2k,blankRamp(),blankRamp(),[],[],[],retailActive) end function
/// Computes `(value>>8)&255` for `mq3.platform.win_gamma.highByte`.
/// @param value Input used in the result expression `(value>>8)&255`.
function highByte(value) return (value>>8)&255 end function
/// Updates `state.warnings` in `mq3.platform.win_gamma.warn`; returns `text`.
/// @param state Mutable record or buffer; this call updates `state.warnings`.
/// @param text Input used by `state.warnings=state.warnings+[text]`.
function warn(state,text) state.warnings=state.warnings+[text];return text end function
/// Updates `state.actions` in `mq3.platform.win_gamma.emit`; returns `value`.
/// @param state Mutable record or buffer; this call updates `state.actions`.
/// @param kind Value used for `mq3.platform.win_gamma.Action.kind`.
/// @param ramp Value forwarded as `source` to `mq3.platform.win_gamma.copyRamp`.
function emit(state,kind,ramp) value=Action("win32-gamma",kind,copyRamp(ramp),not state.retailActive);state.actions=state.actions+[value];return value end function

// WG_CheckHardwareGamma
/// @param state Mutable record or buffer; this call updates `state.deviceSupportsGamma`, `state.oldRamp`, `state.oldRamp[channel][index]`.
/// @param querySucceeded Value assigned to `state.deviceSupportsGamma`.
/// @param queriedRamp Value forwarded as `source` to `mq3.platform.win_gamma.copyRamp`.
function WG_CheckHardwareGamma(state,querySucceeded,queriedRamp)
  state.deviceSupportsGamma=false
  if state.has3dfx then
    state.deviceSupportsGamma=querySucceeded;if querySucceeded then state.oldRamp=copyRamp(queriedRamp) end if;return state.deviceSupportsGamma
  end if
  if state.driverType==GLDRV_STANDALONE or state.ignoreHardwareGamma then return false end if
  state.deviceSupportsGamma=querySucceeded;if not querySucceeded then return false end if;state.oldRamp=copyRamp(queriedRamp)
  if highByte(state.oldRamp[0][255])<=highByte(state.oldRamp[0][0]) or highByte(state.oldRamp[1][255])<=highByte(state.oldRamp[1][0]) or highByte(state.oldRamp[2][255])<=highByte(state.oldRamp[2][0]) then
    state.deviceSupportsGamma=false;warn(state,"WARNING: device has broken gamma support, generated gamma.dat\n")
  end if
  if highByte(state.oldRamp[0][181])==255 then
    warn(state,"WARNING: suspicious gamma tables, using linear ramp for restoration\n")
    for index=0 to 254 for channel=0 to 2 state.oldRamp[channel][index]=index<<8 end for end for
  end if
  return state.deviceSupportsGamma
end function

/// Builds `table[channel][index]`, `table[channel][127]` in `mq3.platform.win_gamma.buildRamp`; returns `table`.
/// @param red Input used by `channels=[red,green,blue]`.
/// @param green Input used by `channels=[red,green,blue]`.
/// @param blue Input used by `channels=[red,green,blue]`.
/// @param isWin2k Input tested by `isWin2k`.
function buildRamp(red,green,blue,isWin2k)
  table=blankRamp();channels=[red,green,blue]
  for channel=0 to 2 for index=0 to 255 value=channels[channel][index]&255;table[channel][index]=(value<<8)|value end for end for
  if isWin2k then
    for channel=0 to 2
      for index=0 to 127 limit=(128+index)<<8;if table[channel][index]>limit then table[channel][index]=limit end if end for
      if table[channel][127]>(254<<8) then table[channel][127]=254<<8 end if
    end for
  end if
  for channel=0 to 2 for index=1 to 255 if table[channel][index]<table[channel][index-1] then table[channel][index]=table[channel][index-1] end if end for end for
  return table
end function

// GLimp_SetGamma
/// @param state Mutable record or buffer; this call updates `state.currentRamp`, `state.debug`.
/// @param red Value forwarded as `red` to `mq3.platform.win_gamma.buildRamp`.
/// @param green Value forwarded as `green` to `mq3.platform.win_gamma.buildRamp`.
/// @param blue Value forwarded as `blue` to `mq3.platform.win_gamma.buildRamp`.
function GLimp_SetGamma(state,red,green,blue)
  if not state.deviceSupportsGamma or state.ignoreHardwareGamma or not state.hasDc then return false end if
  table=buildRamp(red,green,blue,state.isWin2k);state.currentRamp=copyRamp(table)
  if state.isWin2k then state.debug=state.debug+["performing W2K gamma clamp.\n"] else state.debug=state.debug+["skipping W2K gamma clamp.\n"] end if
  if state.has3dfx then emit(state,"set-3dfx",table) else emit(state,"set-win32",table) end if;return true
end function

// WG_RestoreGamma
/// @param state Mutable record or buffer; this call updates `state.currentRamp`.
function WG_RestoreGamma(state)
  if not state.deviceSupportsGamma then return false end if;state.currentRamp=copyRamp(state.oldRamp)
  if state.has3dfx then emit(state,"restore-3dfx",state.oldRamp) else emit(state,"restore-desktop",state.oldRamp) end if;return true
end function

// mapGammaMax is disabled in the released build.  Preserve the exact initial
// probe ramp so the dormant diagnostic can still be compared and inspected.
function mapGammaMax()
  table=blankRamp();for index=0 to 255 value=65535;if index<128 then value=index<<9 end if;for channel=0 to 2 table[channel][index]=value end for end for;return table
end function
