import mq3.audio.snd_paint_pipeline as pipeline
import mq3.audio.wav as wav

function req(ok,message) if not ok then return error(7667,message) end if;return 1 end function
function sound16(values,channels) data=bytes(len(values)*2,0);for i=0 to len(values)-1 data[i*2]=values[i]&255;data[i*2+1]=(values[i]>>8)&255 end for;return wav.Sound(22050,channels,16,channels*2,22050*channels*2,data) end function
function read16(data,offset) value=data[offset]|(data[offset+1]<<8);if value>=32768 then value=value-65536 end if;return value end function
function main(args)
  count=0;mono=sound16([1000,-2000,3000],1);samples=pipeline.monoSamples(mono)
  count=count+req(len(samples)==1024,"PCM padded to sndBuffer chunk")
  count=count+req(samples[0]==1000 and samples[1]==-2000 and samples[2]==3000 and samples[3]==0,"mono PCM preserved")
  stereo=sound16([1000,-1000,3000,1000],2);stereoSamples=pipeline.monoSamples(stereo)
  count=count+req(stereoSamples[0]==0 and stereoSamples[1]==2000,"stereo PCM downmixed")
  eight=wav.Sound(22050,1,8,1,22050,bytes([0,128,255]));eightSamples=pipeline.monoSamples(eight)
  count=count+req(eightSamples[0]==-32768 and eightSamples[1]==0 and eightSamples[2]==32512,"8-bit PCM converted")
  paint=array(8,0);painted=pipeline.paintOneShot(paint,mono,1,4,0,127,127,204)
  count=count+req(painted==2,"one-shot clips at sound end")
  count=count+req(paint[0]<0 and paint[2]>0 and paint[4]==0,"one-shot paints requested source offset")
  count=count+req(pipeline.paintOneShot(paint,mono,3,2,0,127,127,204)==0,"finished one-shot paints nothing")
  loopPaint=array(12,0);count=count+req(pipeline.paintLoop(loopPaint,mono,2,6,0,127,127,204)==6,"loop fills complete interval")
  count=count+req(loopPaint[0]>0 and loopPaint[2]>0 and loopPaint[4]<0,"loop wraps at sample end")
  raw=array(4,0);pipeline.paintRaw(raw,[100,-200],[300,-400],0,2,1.0)
  count=count+req(raw==[25600,76800,-51200,-102400],"stereo raw stream enters 24.8 paint scale")
  output=pipeline.transfer16([256,-256,8388608,-8388864],2)
  count=count+req(len(output)==8,"signed stereo transfer layout")
  count=count+req(read16(output,0)==1 and read16(output,2)==-1,"interior transfer values")
  count=count+req(read16(output,4)==32767 and read16(output,6)==-32768,"transfer saturates")
  count=count+req(pipeline.nextPowerOfTwo(1)==1 and pipeline.nextPowerOfTwo(3)==4 and pipeline.nextPowerOfTwo(2048)==2048,"DMA ring sizing")
  count=count+req(try(pipeline.monoSamples(void)) is error,"void sound rejected")
  count=count+req(try(pipeline.paintLoop(array(2,0),wav.Sound(22050,1,16,2,44100,bytes([])),0,1,0,1,1,204)) is error,"empty loop rejected")
  count=count+req(try(pipeline.paintRaw(array(4,0),[1],[1],0,2,1.0)) is error,"truncated raw stream rejected")
  count=count+req(pipeline.DEFAULT_SND_VOLUME==204,"Baseq3 default s_volume 0.8 quantized")
  print("PASS: "+str(count)+" snd paint-pipeline contracts");return 0
end function
