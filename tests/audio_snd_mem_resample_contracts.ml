import mq3.audio.snd_mem_resample as sndmem
import mq3.audio.qvm_sound_assets as assets
import mq3.audio.wav as wav

function req(ok,message) if not ok then return error(7661,message) end if;return 1 end function
function read16(data,offset) value=data[offset]|(data[offset+1]<<8);if value>=32768 then value=value-65536 end if;return value end function
function pcm16(values) data=bytes(len(values)*2,0);for i=0 to len(values)-1 data[i*2]=values[i]&255;data[i*2+1]=(values[i]>>8)&255 end for;return data end function

function main(args)
  count=0
  same=sndmem.resampleRaw(pcm16([-32768,-1,0,1,32767]),22050,2,5,22050)
  count=count+req(len(same)==10,"same-rate frame count")
  count=count+req(read16(same,0)==-32768 and read16(same,8)==32767,"signed 16-bit extrema preserved")
  eight=sndmem.resampleRaw(bytes([0,127,128,255]),22050,1,4,22050)
  count=count+req(read16(eight,0)==-32768 and read16(eight,2)==-256,"unsigned 8-bit negative conversion")
  count=count+req(read16(eight,4)==0 and read16(eight,6)==32512,"unsigned 8-bit positive conversion")
  up=sndmem.resampleRaw(pcm16([100,200,300]),11025,2,3,22050)
  count=count+req(len(up)==12,"upsampling doubles output count")
  count=count+req(read16(up,0)==100 and read16(up,2)==100 and read16(up,4)==200 and read16(up,6)==200,"upsampling uses Baseq3 nearest source sample")
  down=sndmem.resampleRaw(pcm16([10,20,30,40]),44100,2,4,22050)
  count=count+req(len(down)==4 and read16(down,0)==10 and read16(down,2)==30,"downsampling decimates")
  count=count+req(sndmem.outputCount(7,16000,22050)==9,"fractional output count truncates like C")
  mono8=wav.Sound(11025,1,8,1,11025,bytes([0,128,255]))
  converted=assets.normalizeEffect(mono8)
  count=count+req(converted.sampleRate==22050 and converted.channels==1,"effect output rate and channels")
  count=count+req(converted.bitsPerSample==16 and converted.blockAlign==2 and converted.byteRate==44100,"effect output PCM format")
  count=count+req(len(converted.samples)==12,"effect sample count is resampled")
  mono16=wav.Sound(22050,1,16,2,44100,pcm16([-77,88]));converted16=sndmem.convert(mono16,22050)
  count=count+req(converted16.samples==mono16.samples,"same-rate PCM values retained")
  mono16.samples[0]=0;count=count+req(converted16.samples[0]!=0,"converted PCM owns its bytes")
  stereo=wav.Sound(22050,2,16,4,88200,pcm16([1,2]))
  count=count+req(try(assets.normalizeEffect(stereo)) is error,"registered stereo effect rejected like S_LoadSound")
  count=count+req(try(sndmem.resampleRaw(void,22050,2,1,22050)) is error,"void PCM rejected")
  count=count+req(try(sndmem.resampleRaw(bytes([0]),22050,3,1,22050)) is error,"unsupported width rejected")
  count=count+req(try(sndmem.resampleRaw(bytes([0]),3999,1,1,22050)) is error,"low input rate rejected")
  count=count+req(try(sndmem.resampleRaw(bytes([0]),22050,1,1,192001)) is error,"high output rate rejected")
  count=count+req(try(sndmem.resampleRaw(bytes([0]),22050,1,2,22050)) is error,"truncated PCM rejected")
  count=count+req(typeof(sndmem.signed16(pcm16([-32768]),0))=="int","signed16 result retains integer tag")
  count=count+req(try(sndmem.signed16(bytes([0]),0)) is error,"signed16 preserves bounds error")
  count=count+req(try(sndmem.signed16("bad",0)) is error,"signed16 rejects non-PCM data")
  print("PASS: "+str(count)+" snd_mem resample contracts");return 0
end function
