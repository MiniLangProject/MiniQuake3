import mq3.audio.snd_loop_doppler as doppler
import mq3.audio.snd_paint_pipeline as paint
import mq3.audio.wav as wav

function req(ok,message) if not ok then return error(7671,message) end if;return 1 end function
function sound(values) data=bytes(len(values)*2,0);for i=0 to len(values)-1 data[i*2]=values[i]&255;data[i*2+1]=(values[i]>>8)&255 end for;return wav.Sound(22050,1,16,2,44100,data) end function
function main(args)
  count=0;listener=[0.0,0.0,0.0];origin=[10.0,0.0,0.0]
  first=doppler.update(listener,origin,[100.0,0.0,0.0],1.0,false,true)
  count=count+req(first.active and first.scale>1.20 and first.scale<1.22 and first.oldScale==1.0,"receding loop enables Baseq3 Doppler")
  next=doppler.update(listener,origin,[100.0,0.0,0.0],first.scale,true,true)
  count=count+req(next.oldScale==1.0,"Baseq3 reset keeps old loop Doppler scale at one")
  slow=doppler.update(listener,origin,[1.0,0.0,0.0],1.0,false,true);count=count+req(not slow.active and slow.scale<1.0,"scale at or below one disables original Doppler branch while retaining computed scale")
  count=count+req(not doppler.update(listener,origin,[100.0,0.0,0.0],1.0,false,false).active,"real loops bypass Doppler")
  count=count+req(try(doppler.update(listener,[1.0,2.0],[0.0,0.0,0.0],1.0,false,true)) is error,"invalid vectors rejected")
  samples=[];for i=0 to 1023 samples=samples+[i] end for;tone=sound(samples);buffer=array(4,0)
  painted=paint.paintSfxLoopDoppler(buffer,tone,void,0,2,0,256,256,1,true,2.0,1.0)
  count=count+req(painted==2 and buffer==[0,0,2,2],"productive PCM loop paint consumes Doppler-scaled source intervals")
  print("PASS: "+str(count)+" loop Doppler contracts");return 0
end function
