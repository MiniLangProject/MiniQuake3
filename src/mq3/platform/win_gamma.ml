// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Safe Win32 gamma-ramp state and host boundary from code/win32/win_gamma.c.
package mq3.platform.win_gamma

const GLDRV_STANDALONE=1

struct Action boundary kind ramp dispatched end struct
struct State deviceSupportsGamma ignoreHardwareGamma driverType hasDc has3dfx isWin2k oldRamp currentRamp actions warnings debug retailActive end struct

function blankRamp() rows=array(3,void);for channel=0 to 2 rows[channel]=array(256,0) end for;return rows end function
function copyRamp(source) result=blankRamp();if source==void or len(source)!=3 then return result end if;for channel=0 to 2 if len(source[channel])>=256 then for index=0 to 255 result[channel][index]=source[channel][index]&65535 end for end if end for;return result end function
function create(ignoreHardwareGamma,driverType,hasDc,has3dfx,isWin2k,retailActive) return State(false,ignoreHardwareGamma,driverType,hasDc,has3dfx,isWin2k,blankRamp(),blankRamp(),[],[],[],retailActive) end function
function highByte(value) return (value>>8)&255 end function
function warn(state,text) state.warnings=state.warnings+[text];return text end function
function emit(state,kind,ramp) value=Action("win32-gamma",kind,copyRamp(ramp),not state.retailActive);state.actions=state.actions+[value];return value end function

// WG_CheckHardwareGamma
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
function GLimp_SetGamma(state,red,green,blue)
  if not state.deviceSupportsGamma or state.ignoreHardwareGamma or not state.hasDc then return false end if
  table=buildRamp(red,green,blue,state.isWin2k);state.currentRamp=copyRamp(table)
  if state.isWin2k then state.debug=state.debug+["performing W2K gamma clamp.\n"] else state.debug=state.debug+["skipping W2K gamma clamp.\n"] end if
  if state.has3dfx then emit(state,"set-3dfx",table) else emit(state,"set-win32",table) end if;return true
end function

// WG_RestoreGamma
function WG_RestoreGamma(state)
  if not state.deviceSupportsGamma then return false end if;state.currentRamp=copyRamp(state.oldRamp)
  if state.has3dfx then emit(state,"restore-3dfx",state.oldRamp) else emit(state,"restore-desktop",state.oldRamp) end if;return true
end function

// mapGammaMax is disabled in the released build.  Preserve the exact initial
// probe ramp so the dormant diagnostic can still be compared and inspected.
function mapGammaMax()
  table=blankRamp();for index=0 to 255 value=65535;if index<128 then value=index<<9 end if;for channel=0 to 2 table[channel][index]=value end for end for;return table
end function
