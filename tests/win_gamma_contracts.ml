import mq3.platform.win_gamma as gamma

function require(ok,label) if not ok then return error(7910,"win gamma contract: "+label) end if;return 1 end function
function channel(mode) value=array(256,0);for index=0 to 255 if mode==0 then value[index]=index else if mode==1 then value[index]=255-index else value[index]=255 end if end for;return value end function
function ramp(mode) rows=array(3,void);for channelIndex=0 to 2 rows[channelIndex]=array(256,0);for index=0 to 255 if mode==0 then rows[channelIndex][index]=index<<8 else if mode==1 then rows[channelIndex][index]=(255-index)<<8 else rows[channelIndex][index]=65535 end if end for end for;return rows end function

function main(args)
  count=0;linear=ramp(0);state=gamma.create(false,0,true,false,false,false)
  count=count+require(gamma.WG_CheckHardwareGamma(state,true,linear) and state.deviceSupportsGamma,"linear desktop ramp accepted")
  count=count+require(state.oldRamp[0][0]==0 and state.oldRamp[2][255]==65280,"queried ramp copied")
  red=channel(1);green=channel(0);blue=channel(2);count=count+require(gamma.GLimp_SetGamma(state,red,green,blue),"supported DC sets gamma")
  count=count+require(state.currentRamp[0][0]==65535 and state.currentRamp[0][255]==65535,"decreasing channel is made monotonic")
  count=count+require(state.currentRamp[1][32]==8224 and state.currentRamp[2][0]==65535,"byte values expand to duplicated 16-bit lanes")
  count=count+require(len(state.actions)==1 and state.actions[0].kind=="set-win32" and state.actions[0].dispatched,"normal set uses Win32 host boundary")
  count=count+require(gamma.WG_RestoreGamma(state) and state.currentRamp[2][255]==65280 and state.actions[1].kind=="restore-desktop","desktop restore uses captured ramp")

  broken=ramp(0);for channelIndex=0 to 2 broken[channelIndex][255]=0 end for;state=gamma.create(false,0,true,false,false,false);count=count+require(not gamma.WG_CheckHardwareGamma(state,true,broken) and len(state.warnings)==1,"non-increasing hardware ramp rejected")
  suspicious=ramp(0);suspicious[0][181]=65535;suspicious[1][181]=65535;suspicious[2][181]=65535;state=gamma.create(false,0,true,false,false,false);gamma.WG_CheckHardwareGamma(state,true,suspicious);count=count+require(state.oldRamp[0][181]==(181<<8) and state.oldRamp[2][254]==(254<<8),"suspicious prior crash ramp gets linear restoration")
  count=count+require(state.oldRamp[0][255]==65280,"original index 255 remains untouched like released loop")

  state=gamma.create(false,0,true,true,false,true);count=count+require(gamma.WG_CheckHardwareGamma(state,true,linear),"3dfx query bypasses standalone rules");gamma.GLimp_SetGamma(state,channel(0),channel(0),channel(0));count=count+require(state.actions[0].kind=="set-3dfx" and not state.actions[0].dispatched,"Retail mirror suppresses 3dfx host call")
  ignored=gamma.create(true,0,true,false,false,false);count=count+require(not gamma.WG_CheckHardwareGamma(ignored,true,linear) and not gamma.GLimp_SetGamma(ignored,channel(0),channel(0),channel(0)),"ignorehwgamma disables query and set")
  standalone=gamma.create(false,gamma.GLDRV_STANDALONE,true,false,false,false);count=count+require(not gamma.WG_CheckHardwareGamma(standalone,true,linear),"standalone non-3dfx driver is rejected")
  noDc=gamma.create(false,0,false,false,false,false);noDc.deviceSupportsGamma=true;count=count+require(not gamma.GLimp_SetGamma(noDc,channel(0),channel(0),channel(0)),"missing render DC prevents set")

  w2k=gamma.create(false,0,true,false,true,false);w2k.deviceSupportsGamma=true;gamma.GLimp_SetGamma(w2k,channel(2),channel(2),channel(2));count=count+require(w2k.currentRamp[0][0]==32768 and w2k.currentRamp[0][126]==65024 and w2k.currentRamp[0][127]==65024,"Windows 2000 clamp and monotonic pass match released order")
  probe=gamma.mapGammaMax();count=count+require(probe[0][0]==0 and probe[1][127]==65024 and probe[2][128]==65535 and probe[2][255]==65535,"dormant mapGammaMax seed ramp preserved")
  print("PASS: "+str(count)+" Win32 gamma contracts / 4 symbols");return 0
end function
