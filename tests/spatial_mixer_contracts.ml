import mq3.audio.spatial_mixer as mixer
import mq3.audio.wav as wav

function require(ok,text) if not ok then return error(7640,text) end if;return 1 end function
function close(a,b) d=a-b;if d<0.0 then d=0.0-d end if;return d<0.0001 end function
function sound8(values,channels,rate) return wav.Sound(rate,channels,8,channels,rate*channels,bytes(values)) end function
function sound16(values,channels,rate)
  data=bytes(len(values)*2,0);for i=0 to len(values)-1 data[i*2]=values[i]&255;data[i*2+1]=(values[i]>>8)&255 end for
  return wav.Sound(rate,channels,16,channels*2,rate*channels*2,data)
end function
function read16(data,offset) value=data[offset]|(data[offset+1]<<8);if value>=32768 then value=value-65536 end if;return value end function

function main(args)
  count=0
  state=mixer.create(22050,4);count=count+require(state.outputRate==22050 and state.chunkFrames==4,"state configuration")
  count=count+require(try(mixer.create(3999,4)) is error,"low output rate rejected")
  count=count+require(try(mixer.create(192001,4)) is error,"high output rate rejected")
  count=count+require(try(mixer.create(22050,0)) is error,"zero chunk rejected")
  count=count+require(try(mixer.create(22050,4097)) is error,"large chunk rejected")

  center=mixer.spatialize([0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,1.0,0.0],1.0,false)
  count=count+require(close(center.left,0.5) and close(center.right,0.5),"coincident source centered")
  count=count+require(close(center.distance,0.0) and close(center.attenuation,1.0),"coincident source full volume")
  near=mixer.spatialize([80.0,0.0,0.0],[0.0,0.0,0.0],[0.0,1.0,0.0],0.75,false)
  count=count+require(close(near.left,0.375) and close(near.right,0.375),"full-volume radius")
  right=mixer.spatialize([0.0,100.0,0.0],[0.0,0.0,0.0],[0.0,1.0,0.0],1.0,false)
  count=count+require(close(right.attenuation,0.984),"Baseq3 distance attenuation")
  count=count+require(close(right.left,0.0) and close(right.right,0.984),"source pans right")
  left=mixer.spatialize([0.0,-100.0,0.0],[0.0,0.0,0.0],[0.0,1.0,0.0],1.0,false)
  count=count+require(close(left.left,0.984) and close(left.right,0.0),"source pans left")
  front=mixer.spatialize([100.0,0.0,0.0],[0.0,0.0,0.0],[0.0,1.0,0.0],1.0,false)
  count=count+require(close(front.left,0.492) and close(front.right,0.492),"front source centered")
  far=mixer.spatialize([1330.0,0.0,0.0],[0.0,0.0,0.0],[0.0,1.0,0.0],1.0,false)
  count=count+require(close(far.left,0.0) and close(far.right,0.0),"far source inaudible")
  globalGain=mixer.spatialize([9999.0,0.0,0.0],[0.0,0.0,0.0],[0.0,1.0,0.0],0.4,true)
  count=count+require(close(globalGain.left,0.4) and close(globalGain.right,0.4),"global source bypasses spatialization")
  silent=mixer.spatialize([0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,1.0,0.0],0.0,false)
  count=count+require(silent.left==0.0 and silent.right==0.0,"zero-volume source silent")

  mono8=sound8([0,128,255],1,22050)
  count=count+require(mixer.monoSample(mono8,0)==-32768 and mixer.monoSample(mono8,1)==0 and mixer.monoSample(mono8,2)==32512,"unsigned 8-bit conversion")
  count=count+require(mixer.monoSample(mono8,3)==-32768,"sample lookup wraps")
  mono16=sound16([-32768,-1,0,32767],1,22050)
  count=count+require(mixer.monoSample(mono16,0)==-32768 and mixer.monoSample(mono16,1)==-1,"signed 16-bit conversion")
  count=count+require(mixer.monoSample(mono16,3)==32767,"positive signed sample")
  stereo=sound16([1000,-1000,3000,1000],2,22050)
  count=count+require(mixer.monoSample(stereo,0)==0 and mixer.monoSample(stereo,1)==2000,"stereo downmix")

  count=count+require(try(mixer.addLoop(void,1,[0.0,0.0,0.0],mono8,1.0,false)) is error,"missing state rejected")
  count=count+require(try(mixer.addLoop(state,1,[0.0,0.0],mono8,1.0,false)) is error,"short origin rejected")
  count=count+require(try(mixer.addLoop(state,1,[0.0,0.0,0.0],void,1.0,false)) is error,"missing sound rejected")
  count=count+require(try(mixer.addLoop(state,1,[0.0,0.0,0.0],mono8,1.1,false)) is error,"large volume rejected")
  count=count+require(try(mixer.addSharedLoop(state,2,7,[0.0,0.0,0.0],mono8,1.0,false)) is error,"shared loop key validated")
  count=count+require(mixer.addLoop(state,1,[0.0,0.0,0.0],mono8,1.0,false)==0,"loop added")
  count=count+require(try(mixer.addLoop(state,1,[1.0,0.0,0.0],mono8,1.0,false)) is error,"duplicate id rejected")
  count=count+require(not mixer.setEnabled(state,99,false),"unknown source not toggled")
  count=count+require(mixer.setEnabled(state,1,false) and not state.sources[0].enabled,"source disabled")
  chunk=mixer.render(state,[0.0,0.0,0.0],[0.0,1.0,0.0])
  count=count+require(chunk.audibleSources==0 and read16(chunk.samples,0)==0,"disabled source omitted")
  count=count+require(mixer.setEnabled(state,1,true),"source enabled")
  chunk=mixer.render(state,[0.0,0.0,0.0],[0.0,1.0,0.0])
  count=count+require(chunk.frames==4 and len(chunk.samples)==16,"stereo chunk layout")
  count=count+require(chunk.audibleSources==1,"audible source counted")
  count=count+require(read16(chunk.samples,0)==-16384 and read16(chunk.samples,2)==-16384,"centered sample written to both channels")
  count=count+require(close(state.sources[0].cursor,1.0),"loop phase advances and wraps")
  count=count+require(try(mixer.render(state,[0.0,0.0],[0.0,1.0,0.0])) is error,"invalid listener rejected")
  count=count+require(try(mixer.render(state,[0.0,0.0,0.0],[0.0,2.0,0.0])) is error,"unnormalized right rejected")

  limiting=mixer.create(22050,1);loud=sound16([32767],1,22050)
  for id=1 to 4 mixer.addLoop(limiting,id,[0.0,0.0,0.0],loud,1.0,true) end for
  chunk=mixer.render(limiting,[0.0,0.0,0.0],[0.0,1.0,0.0])
  count=count+require(chunk.peak>32767.0 and chunk.limiterGain<1.0,"overload activates limiter")
  count=count+require(read16(chunk.samples,0)==32767 and read16(chunk.samples,2)==32767,"limiter prevents wrapping")

  shared=mixer.create(22050,1);sharedSound=sound16([1000,2000],1,22050)
  mixer.addSharedLoop(shared,10,"fire",[0.0,0.0,0.0],sharedSound,1.0,true);mixer.addSharedLoop(shared,11,"fire",[0.0,0.0,0.0],sharedSound,1.0,true)
  chunk=mixer.render(shared,[0.0,0.0,0.0],[0.0,1.0,0.0])
  count=count+require(chunk.audibleSources==2 and read16(chunk.samples,0)==2000 and close(shared.sources[0].cursor,shared.sources[1].cursor),"shared in-phase sources sum and advance together")

  distinct=mixer.create(22050,1);mixer.addSharedLoop(distinct,20,"shared-key",[0.0,0.0,0.0],sound16([1000],1,22050),1.0,true);mixer.addSharedLoop(distinct,21,"shared-key",[0.0,0.0,0.0],sound16([-500],1,22050),1.0,true)
  chunk=mixer.render(distinct,[0.0,0.0,0.0],[0.0,1.0,0.0]);count=count+require(read16(chunk.samples,0)==500,"equal grouping keys never alias different PCM assets")

  resample=mixer.create(22050,2);mixer.addLoop(resample,7,[0.0,0.0,0.0],sound8([128,129,130,131],1,11025),1.0,true)
  chunk=mixer.render(resample,[0.0,0.0,0.0],[0.0,1.0,0.0])
  count=count+require(read16(chunk.samples,0)==0 and read16(chunk.samples,4)==0,"nearest resampling repeats source frame")
  count=count+require(close(resample.sources[0].cursor,1.0),"fractional resample phase retained")
  print("PASS: "+str(count)+" spatial mixer contracts")
  return 0
end function
