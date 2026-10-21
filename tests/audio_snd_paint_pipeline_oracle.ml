import mq3.audio.snd_paint_pipeline as pipeline
import mq3.audio.wav as wav

function sound(values) data=bytes(len(values)*2,0);for i=0 to len(values)-1 data[i*2]=values[i]&255;data[i*2+1]=(values[i]>>8)&255 end for;return wav.Sound(22050,1,16,2,44100,data) end function
function show(label,paint,count) text=label;for i=0 to count-1 text=text+"|"+str(paint[i*2])+"|"+str(paint[i*2+1]) end for;print(text);return void end function
function main(args)
  one=sound([1000,-2000,3000,-4000,5000,-6000]);looping=sound([100,200,300,400]);other=sound([-500,750,-1000])
  paint=array(16,0);pipeline.paintOneShot(paint,one,0,8,0,127,63,204);pipeline.paintLoop(paint,looping,0,8,0,40,80,204);show("one-loop",paint,8)
  paint=array(8,0);pipeline.paintOneShot(paint,one,2,4,0,100,120,204);pipeline.paintLoop(paint,looping,3,4,0,70,30,204);show("offset",paint,4)
  paint=array(12,0);pipeline.paintOneShot(paint,one,0,6,0,255,255,204);pipeline.paintOneShot(paint,other,0,6,0,200,50,204);show("two-shots",paint,6)
  return 0
end function
