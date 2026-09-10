import mq3.client.playable_ambient_sounds as ambient

function req(ok,text) if not ok then return error(7611,text) end if;return 1 end function
function entitynub(name,noise,flags,origin) return [["classname",name],["noise",noise],["spawnflags",flags],["origin",origin]] end function

function main(args)
  c=0
  defs=ambient.loopDefinitions([
    entitynub("target_speaker","sound/world/fire1.wav","1","1 2 3"),
    entitynub("TARGET_SPEAKER","sound/world/wind","5","4 5 6"),
    entitynub("target_speaker","*death1.wav","1","0 0 0"),
    entitynub("target_speaker","sound/world/off.wav","0","0 0 0"),
    entitynub("light","sound/world/no.wav","1","0 0 0")])
  c=c+req(len(defs)==2,"only looped-on map speakers")
  c=c+req(defs[0].noise=="sound/world/fire1.wav","wav path retained")
  c=c+req(defs[1].noise=="sound/world/wind.wav","wav suffix supplied")
  c=c+req(defs[0].origin==[1,2,3],"origin parsed")
  c=c+req(not defs[0].globalSound and defs[1].globalSound,"global flag parsed")
  c=c+req(ambient.soundPath("")=="","empty path ignored")
  c=c+req(ambient.soundPath("*pain.wav")=="","custom player sound ignored")
  c=c+req(ambient.soundPath("Sound/World/FIRE1.WAV")=="sound/world/fire1.wav","paths normalized")
  c=c+req(len(ambient.loopDefinitions([]))==0,"empty entity list")
  c=c+req(try(ambient.loopDefinitions(void)) is error,"missing entities rejected")
  soundA=[1];soundB=[2]
  catalog=ambient.Catalog([
    ambient.Speaker("fire.wav",[0,0,0],false,soundA),
    ambient.Speaker("wind.wav",[0,0,0],true,soundB),
    ambient.Speaker("wind.wav",[1,0,0],true,soundB),
    ambient.Speaker("missing.wav",[0,0,0],true,void)],[],[])
  globals=ambient.globalLoops(catalog)
  c=c+req(len(globals)==1,"spatial and missing loops suppressed")
  c=c+req(globals[0][0]=="wind.wav" and globals[0][1]==soundB,"global loop retained")
  c=c+req(len(ambient.globalLoops(void))==0,"missing catalog has no loops")
  print("PASS: "+str(c)+" playable ambient-sound contracts");return 0
end function
