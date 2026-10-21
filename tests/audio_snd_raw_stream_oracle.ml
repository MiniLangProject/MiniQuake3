import mq3.audio.snd_raw_stream as raw

function pcm16(values) data=bytes(len(values)*2,0);for index=0 to len(values)-1 data[index*2]=values[index]&255;data[index*2+1]=(values[index]>>8)&255 end for;return data end function
function show(name,state,first) line=name+"|"+str(state.rawEnd);for time=first to state.rawEnd-1 index=time&raw.RAW_MASK;line=line+"|"+str(state.left[index])+","+str(state.right[index]) end for;print(line) end function
function reset(rate,soundTime,rawEnd) state=raw.create(rate);state.soundTime=soundTime;state.rawEnd=rawEnd;return state end function
function main(args)
  state=reset(22050,0,0);raw.enqueue(state,3,22050,2,2,pcm16([1000,-2000,3000,-4000,5000,-6000]),1.0);show("stereo16",state,0)
  state=reset(22050,0,0);raw.enqueue(state,2,11025,2,1,pcm16([1000,-2000]),0.5);show("mono16-half-rate",state,0)
  state=reset(22050,0,0);raw.enqueue(state,2,22050,1,2,bytes([255,128,127,0]),0.25);show("stereo8",state,0)
  state=reset(22050,0,0);raw.enqueue(state,4,44100,1,1,bytes([0,64,128,255]),1.0);show("mono8-double-rate",state,0)
  state=reset(22050,5,2);raw.enqueue(state,1,22050,2,1,pcm16([1000]),1.0);show("reset-minimum",state,5)
  return 0
end function
