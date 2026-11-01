import mq3.audio.qvm_sound_assets as assets
import mq3.audio.qvm_playback as playback
import mq3.audio.snd_compressed_paint as compressed
import mq3.audio.wav as wav

struct Command kind entity channel handle origin velocity axis flag text text2 end struct

function req(ok,text) if not ok then return error(7652,text) end if;return 1 end function
function sound16(values,rate)
  data=bytes(len(values)*2,0);for i=0 to len(values)-1 data[i*2]=values[i]&255;data[i*2+1]=(values[i]>>8)&255 end for
  return wav.Sound(rate,1,16,2,rate*2,data)
end function
function stereo16(values,rate)
  data=bytes(len(values)*2,0);for i=0 to len(values)-1 data[i*2]=values[i]&255;data[i*2+1]=(values[i]>>8)&255 end for
  return wav.Sound(rate,2,16,4,rate*4,data)
end function
function command(kind,entity,channel,handle,origin,velocity,axis,flag,text,text2) return Command(kind,entity,channel,handle,origin,velocity,axis,flag,text,text2) end function
function read16(data,offset) value=data[offset]|(data[offset+1]<<8);if value>=32768 then value=value-65536 end if;return value end function
function le32(value) return bytes([value&255,(value>>8)&255,(value>>16)&255,(value>>24)&255]) end function

function main(args)
  count=0
  tone=sound16([1000,2000,3000,4000],22050);other=sound16([-1000,-2000,-3000,-4000],22050)
  intro=stereo16([111,222],22050);musicLoop=stereo16([333,444,555,666],22050)
  mu=compressed.Compressed(compressed.METHOD_MULAW,[compressed.Block(bytes([0,128]),2,0,0)],2)
  catalog=assets.Catalog(void,[assets.Clip(3,"sound/a.wav",tone,void),assets.Clip(8,"sound/b.wav",other,void),assets.Clip(9,"music/intro.wav",intro,void),assets.Clip(10,"music/loop.wav",musicLoop,void),assets.Clip(11,"sound/compressed.wav",tone,mu)],[],5)
  count=count+req(assets.canonicalPath("/SOUND/A")=="sound/a.wav","canonical sound path")
  count=count+req(assets.canonicalPath("music\\SONIC5.WAV")=="music/sonic5.wav","QVM backslash path normalized")
  count=count+req(assets.canonicalPath("*death1.wav")=="*death1.wav","custom sound name retained")
  count=count+req(assets.retailPath("*DEATH1.WAV","Sarge")=="sound/player/sarge/death1.wav","custom player sound resolved")
  count=count+req(assets.clipForHandle(catalog,3).path=="sound/a.wav" and assets.clipForHandle(catalog,4)==void,"global handle lookup")
  count=count+req(assets.clipForPath(catalog,"SOUND/B").handle==8,"case-insensitive canonical path lookup")
  count=count+req(try(assets.load(void,[],[])) is error,"asset loader requires archive")
  format=bytes([1,0,1,0,64,31,0,0,64,31,0,0,1,0,8,0]);body=bytes("WAVEfmt ")+le32(16)+format+bytes("data")+le32(1)+bytes([128]);retailOdd=bytes("RIFF")+le32(len(body))+body
  count=count+req(assets.decodeRetailWav(retailOdd).samples==bytes([128]),"retail missing final RIFF padding accepted")

  state=playback.create(catalog,22050,2)
  count=count+req(state.listener.entity==0 and len(state.entityOrigins)==1024,"playback defaults")
  count=count+req(len(state.clipHandles)==12 and state.clipHandles[3].path=="sound/a.wav" and state.clipHandles[4]==void,"sound handles indexed once at playback creation")
  count=count+req(try(playback.create(catalog,3999,2)) is error and try(playback.create(catalog,22050,0)) is error,"playback limits")
  axis=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]
  applied=playback.apply(state,[
    command("position",7,0,0,[0.0,100.0,0.0],void,void,false,"",""),
    command("listener",0,0,0,[0.0,0.0,0.0],void,axis,false,"",""),
    command("start",7,2,3,void,void,void,false,"",""),
    command("local",-1,6,8,void,void,void,false,"","")
  ])
  count=count+req(applied.applied==4 and applied.missing==0 and len(state.voices)==2,"start/local/listener commands applied")
  chunk=playback.render(state)
  count=count+req(chunk.frames==2 and len(chunk.samples)==8 and chunk.audibleVoices==2,"one-shot PCM chunk")
  count=count+req(read16(chunk.samples,0)>read16(chunk.samples,2),"entity sound follows Baseq3 listener-axis left while local sound remains centered")
  count=count+req(len(state.voices)==2 and state.voices[0].cursor==2.0,"voice cursor retained")
  playback.render(state);count=count+req(len(state.voices)==0,"finished one-shots retired")

  playback.apply(state,[command("start",7,1,3,void,void,void,false,"",""),command("start",7,1,8,void,void,void,false,"","")])
  count=count+req(len(state.voices)==2 and state.voices[0].handle==3 and state.voices[1].handle==8,"Baseq3 entchannel does not eagerly override while free channels remain")
  missing=playback.apply(state,[command("start",1,0,99,[0.0,0.0,0.0],void,void,false,"","")])
  count=count+req(missing.missing==1 and len(state.voices)==2,"unresolved handle counted without bogus voice")

  playback.apply(state,[command("loop",10,0,3,[0.0,-100.0,0.0],[1.0,2.0,3.0],void,false,"","")])
  count=count+req(len(state.loops)==1 and state.loops[0].velocity==[1.0,2.0,3.0],"normal loop created")
  loopChunk=playback.render(state);count=count+req(loopChunk.audibleLoops==1 and read16(loopChunk.samples,2)>read16(loopChunk.samples,0),"loop spatialized on Baseq3 listener-axis right")
  cursor=state.loops[0].cursor
  playback.apply(state,[command("loop",10,0,3,[0.0,100.0,0.0],[0.0,0.0,0.0],void,false,"","")])
  count=count+req(len(state.loops)==1 and state.loops[0].cursor==cursor and state.loops[0].origin[1]==100.0,"same loop updates without phase reset")
  playback.apply(state,[command("clearLoops",-1,0,0,void,void,void,false,"","")]);count=count+req(len(state.loops)==0,"frame-clear removes normal loops")

  playback.apply(state,[command("loop",11,0,3,[0.0,0.0,0.0],[0.0,0.0,0.0],void,true,"",""),command("clearLoops",-1,0,0,void,void,void,false,"","")])
  count=count+req(len(state.loops)==1 and state.loops[0].realLoop,"real loop survives ordinary frame clear")
  playback.apply(state,[command("clearLoops",-1,0,0,void,void,void,true,"","")]);count=count+req(len(state.loops)==0,"kill-all clears real loops")
  playback.apply(state,[command("loop",12,0,3,[0.0,0.0,0.0],[0.0,0.0,0.0],void,true,"","")]);playback.apply(state,[command("stopLoop",12,0,0,void,void,void,false,"","")])
  count=count+req(len(state.loops)==0,"explicit loop stop")

  grouped=playback.create(catalog,22050,2);playback.apply(grouped,[command("listener",0,0,0,[0.0,0.0,0.0],void,axis,false,"",""),command("loop",20,0,3,[0.0,100.0,0.0],[0.0,0.0,0.0],void,false,"",""),command("loop",21,0,3,[0.0,-100.0,0.0],[0.0,0.0,0.0],void,false,"","")])
  groupedChunk=playback.render(grouped)
  count=count+req(groupedChunk.audibleLoops==1,"identical QVM loop effects share one Baseq3 loop channel")
  count=count+req(read16(groupedChunk.samples,0)==read16(groupedChunk.samples,2) and read16(groupedChunk.samples,0)>0,"opposite merged loops sum into balanced stereo")
  count=count+req(grouped.loops[0].cursor==grouped.loops[1].cursor and grouped.loopPaintedFrames==2,"merged loops share painted-time phase")
  dopplerState=playback.create(catalog,22050,2);playback.apply(dopplerState,[command("listener",0,0,0,[0.0,0.0,0.0],void,axis,false,"",""),command("loop",30,0,3,[10.0,0.0,0.0],[100.0,0.0,0.0],void,false,"","")]);dopplerChunk=playback.render(dopplerState)
  count=count+req(dopplerState.loops[0].doppler and dopplerState.loops[0].dopplerScale>1.0 and dopplerChunk.audibleLoops==1,"QVM loop velocity drives productive Baseq3 Doppler paint")

  painted=playback.create(catalog,22050,1);playback.apply(painted,[command("local",-1,1,3,void,void,void,false,"","")]);paintedChunk=playback.render(painted)
  count=count+req(read16(paintedChunk.samples,0)==395 and read16(paintedChunk.samples,2)==395,"QVM one-shot uses Baseq3 24.8 paint scale and default s_volume 0.8")
  count=count+req(paintedChunk.limiterGain==1.0 and paintedChunk.audibleVoices==1,"painted one-shot transfers without float limiter")
  compressedState=playback.create(catalog,22050,2);playback.apply(compressedState,[command("local",-1,1,11,void,void,void,false,"","")]);compressedChunk=playback.render(compressedState)
  count=count+req(read16(compressedChunk.samples,0)==12497 and read16(compressedChunk.samples,4)==(-12498),"QVM sfx compression tag selects MuLaw paint path")

  invalid=playback.apply(state,[command("listener",0,0,0,[0.0,0.0],void,axis,false,"",""),command("unknown",0,0,0,void,void,void,false,"","")])
  count=count+req(invalid.ignored==2,"invalid and unknown commands ignored")
  musicState=playback.create(catalog,22050,4)
  music=playback.apply(musicState,[command("music",-1,0,0,void,void,void,false,"music/intro.wav","music/loop.wav")])
  count=count+req(music.applied==1 and musicState.music!=void and musicState.music.inIntro,"background intro starts before loop")
  musicChunk=playback.render(musicState)
  count=count+req(musicChunk.audibleLoops==1 and read16(musicChunk.samples,0)==111 and read16(musicChunk.samples,2)==222,"stereo background intro preserved")
  count=count+req(read16(musicChunk.samples,4)==333 and read16(musicChunk.samples,6)==444 and read16(musicChunk.samples,12)==333,"background switches to repeating loop")
  count=count+req(not musicState.music.inIntro and musicState.music.cursor==1.0,"background loop phase retained")
  emptyMusic=playback.apply(musicState,[command("music",-1,0,0,void,void,void,false,"","")]);count=count+req(emptyMusic.applied==1 and musicState.music!=void,"empty background start leaves current track playing")
  playback.apply(musicState,[command("stopMusic",-1,0,0,void,void,void,false,"","")]);count=count+req(musicState.music==void,"background track stopped")
  queued=[command("local",-1,0,3,void,void,void,false,"","")];beforeVoices=len(state.voices);consumed=playback.consume(state,queued);firstApplied=consumed.applied;again=playback.consume(state,queued)
  count=count+req(firstApplied==1 and again.applied==0 and state.commandCursor==1,"append-only QVM command queue consumed once")
  reset=playback.consume(state,[]);count=count+req(reset.applied==0 and state.commandCursor==0,"command queue reset detected")

  print("PASS: "+str(count)+" QVM playback contracts");return 0
end function
