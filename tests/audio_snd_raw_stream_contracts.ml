import mq3.audio.snd_raw_stream as raw
import mq3.audio.qvm_playback as playback
import mq3.audio.qvm_sound_assets as assets
import mq3.audio.wav as wav

struct Audio samples frames sampleRate channels bitsPerSample blockAlign end struct
struct Command kind entity channel handle origin velocity axis flag text text2 end struct
function require(condition,message) if not condition then return error(7713,"snd raw stream: "+message) end if;return 1 end function
function pcm16(values) data=bytes(len(values)*2,0);for index=0 to len(values)-1 data[index*2]=values[index]&255;data[index*2+1]=(values[index]>>8)&255 end for;return data end function
function read16(data,offset) value=data[offset]|(data[offset+1]<<8);if value>=32768 then value=value-65536 end if;return value end function
function command(kind,handle) return Command(kind,-1,0,handle,void,void,void,false,"","") end function
function main(args)
  count=0
  state=raw.create(22050);count=count+require(state.rawEnd==0 and state.soundTime==0 and len(state.left)==raw.MAX_RAW_SAMPLES,"ring defaults")
  count=count+require(try(raw.create(3999)) is error and try(raw.enqueue(state,1,22050,3,1,bytes(3,0),1.0)) is error,"format limits")
  produced=raw.enqueue(state,2,22050,2,2,pcm16([1000,-2000,3000,-4000]),1.0)
  count=count+require(produced==2 and state.left[0]==256000 and state.right[1]==(-1024000),"direct stereo 16-bit conversion")
  paint=array(8,99);painted=raw.paint(state,paint,0,4);count=count+require(painted==2 and paint[0]==256000 and paint[1]==(-512000) and paint[4]==99,"raw paint copies available frames only")
  half=raw.create(22050);count=count+require(raw.enqueue(half,2,11025,2,1,pcm16([1000,-2000]),0.5)==4 and half.left[0]==128000 and half.left[1]==128000 and half.left[2]==(-256000),"mono stream resamples with Baseq3 source indexing")
  reset=raw.create(22050);reset.rawEnd=2;raw.setSoundTime(reset,5);raw.enqueue(reset,1,22050,1,1,bytes([255]),1.0);count=count+require(reset.rawEnd==6 and reset.left[5]==8323072,"late stream starts at current sound time")
  reset.rawEnd=raw.MAX_RAW_SAMPLES-1;reset.soundTime=0;raw.enqueue(reset,2,22050,2,1,pcm16([7,9]),1.0);count=count+require(reset.left[raw.MAX_RAW_SAMPLES-1]==1792 and reset.left[0]==2304,"raw ring wraps at 16384 frames")

  toneData=pcm16([1000,1000]);tone=wav.Sound(22050,1,16,2,44100,toneData);catalog=assets.Catalog(void,[assets.Clip(1,"tone.wav",tone,void)],[],1)
  mixed=playback.create(catalog,22050,2);audio=Audio(pcm16([100,100,200,200]),2,22050,2,16,4);count=count+require(playback.queueRaw(mixed,audio,1.0)==2,"cinematic PCM enters playback raw ring")
  playback.apply(mixed,[command("local",1)]);chunk=playback.render(mixed)
  count=count+require(read16(chunk.samples,0)==495 and read16(chunk.samples,2)==495 and read16(chunk.samples,4)==595,"raw stream and QVM one-shot share integer paintbuffer")
  count=count+require(playback.render(mixed).frames==2 and mixed.loopPaintedFrames==4,"playback timeline advances after mixed raw chunk")
  print("PASS: "+str(count)+" snd raw-stream contracts");return 0
end function
