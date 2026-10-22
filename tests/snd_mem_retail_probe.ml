import mq3.audio.snd_mem_runtime as runtime
import mq3.format.pk3 as pk3

struct Context archive reads frees end struct
function require(ok,message) if not ok then return error(7762,message) end if;return 1 end function
function readFile(context,name) context.reads=context.reads+1;return pk3.read(context.archive,name) end function
function freeFile(context,data) context.frees=context.frees+1 end function
function millis(context) return 41 end function

function main(args)
  if len(args)!=1 then return error(7762,"usage: snd_mem_retail_probe <pak0.pk3>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  context=Context(archive,0,0);host=runtime.Services(readFile,freeFile,millis,void,void,void,context);state=runtime.create(22050,host);runtime.SND_setup(state,1);checks=0
  names=["sound/weapons/rocket/rocklf1a.wav","sound/misc/menu1.wav","sound/feedback/1_frag.wav"]
  total=0
  for each name in names
    sound=runtime.Sfx(name,false,0,void,0,0);checks=checks+require(runtime.S_LoadSound(state,sound),"Retail WAV did not load: "+name)
    checks=checks+require(sound.soundCompressionMethod==0 and sound.soundLength>0 and sound.soundData!=void,"Retail PCM cache fields: "+name);total=total+sound.soundLength
  end for
  checks=checks+require(context.reads==3 and context.frees==3,"Retail file lifecycle")
  checks=checks+require(total>1000 and state.totalInUse>0,"Retail decoded PCM cache")
  print("PASS: "+str(checks)+" Retail snd_mem contracts samples="+str(total));return 0
end function
