import mq3.platform.win_gamma as gamma

function channel(mode) values=array(256,0);for index=0 to 255 if mode==0 then values[index]=index else if mode==1 then values[index]=255-index else values[index]=255 end if end for;return values end function
function ramp() rows=array(3,void);for channel=0 to 2 rows[channel]=array(256,0);for index=0 to 255 rows[channel][index]=index<<8 end for end for;return rows end function
function bit(value) if value then return 1 end if;return 0 end function
function main(args)
  state=gamma.create(false,0,true,false,false,false);gamma.WG_CheckHardwareGamma(state,true,ramp());print("check "+str(bit(state.deviceSupportsGamma))+" "+str(state.oldRamp[0][0])+" "+str(state.oldRamp[2][255])+" "+str(len(state.warnings)))
  value=ramp();for channel=0 to 2 value[channel][255]=0 end for;state=gamma.create(false,0,true,false,false,false);gamma.WG_CheckHardwareGamma(state,true,value);print("broken "+str(bit(state.deviceSupportsGamma))+" "+str(len(state.warnings)))
  value=ramp();for channel=0 to 2 value[channel][181]=65535 end for;state=gamma.create(false,0,true,false,false,false);gamma.WG_CheckHardwareGamma(state,true,value);print("suspicious "+str(state.oldRamp[0][181])+" "+str(state.oldRamp[1][254])+" "+str(state.oldRamp[2][255])+" "+str(len(state.warnings)))
  state=gamma.create(false,0,true,false,false,false);gamma.WG_CheckHardwareGamma(state,true,ramp());gamma.GLimp_SetGamma(state,channel(1),channel(0),channel(2));print("set "+str(state.currentRamp[0][0])+" "+str(state.currentRamp[0][255])+" "+str(state.currentRamp[1][32])+" "+str(state.currentRamp[2][0])+" 1")
  state.isWin2k=true;gamma.GLimp_SetGamma(state,channel(2),channel(2),channel(2));print("w2k "+str(state.currentRamp[0][0])+" "+str(state.currentRamp[0][126])+" "+str(state.currentRamp[0][127])+" "+str(state.currentRamp[0][128]))
  state=gamma.create(false,0,true,false,false,false);gamma.WG_CheckHardwareGamma(state,true,ramp());gamma.WG_RestoreGamma(state);print("restore "+str(state.currentRamp[0][0])+" "+str(state.currentRamp[2][255]))
  state=gamma.create(false,0,true,true,true,false);gamma.WG_CheckHardwareGamma(state,true,ramp());gamma.GLimp_SetGamma(state,channel(2),channel(2),channel(2));print("3dfx "+str(bit(state.deviceSupportsGamma))+" 1 "+str(state.currentRamp[0][0]));return 0
end function
