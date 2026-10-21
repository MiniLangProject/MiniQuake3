import mq3.client.cgame_players as p
function req(value,message) if not value then return error(7858,message) end if;return 1 end function
function trace(fraction,z,flags) return p.Trace(fraction,[0.0,0.0,z],[0.0,0.0,1.0],false,false,flags) end function
function animText() text="footsteps boot headoffset 1 2 3 sex f fixedlegs fixedtorso ";for i=0 to p.MAX_ANIMATIONS-1 text=text+str(i*5)+" 5 2 10 " end for;return text end function
function main(args)
  count=0;s=p.create();ci=s.clients[0];ci.sounds[0]="death";count=count+req(p.customSound(s,0,"*death1.wav",true)=="death","custom sound");count=count+req(p.customSound(s,0,"sound/a.wav",true)=="sound/a.wav" and not s.actions[0].dispatched,"normal sound")
  count=count+req(p.parseAnimationFile("animation.cfg",animText(),ci) and len(ci.animations)==p.MAX_TOTALANIMATIONS,"animation parse");count=count+req(ci.footsteps==1 and ci.gender==1 and ci.fixedlegs and ci.headOffset==[1.0,2.0,3.0],"animation directives");count=count+req(ci.animations[p.LEGS_BACKCR].reversed and ci.animations[p.FLAG_RUN].numFrames==16,"derived animations")
  s.files=["models/players/sarge/lower_default.skin","models/players/sarge/upper_default.skin","models/players/sarge/head_default.skin","models/players/sarge/icon_default.tga"];count=count+req(p.fileExists(s,s.files[0]),"file exists");count=count+req(p.findClientModelFile(s,ci,"","sarge","default","lower","skin")==s.files[0],"model file");count=count+req(p.findClientHeadFile(s,ci,"","sarge","default","head","skin")==s.files[2],"head file")
  count=count+req(p.registerClientModelname(s,ci,"sarge","default","sarge","default","",animText(),false),"register model");count=count+req(ci.legsModel=="models/players/sarge/lower.md3" and ci.modelIcon==s.files[3],"model assets")
  count=count+req(p.colorFromString("1")==[0.0,0.0,1.0] and p.colorFromString("7")==[1.0,1.0,1.0],"colors")
  other=p.clientInfo();p.copyClientInfoModel(ci,other);count=count+req(other.legsModel==ci.legsModel and len(other.animations)==36,"copy model")
  ci.infoValid=true;ci.name="One";ci.team=p.TEAM_RED;ci.modelName="sarge";ci.skinName="default";ci.headModelName="sarge";ci.headSkinName="default";s.clients[0]=ci;same=p.clientInfo();same.infoValid=true;same.team=p.TEAM_RED;same.modelName="sarge";same.skinName="default";same.headModelName="sarge";same.headSkinName="default";count=count+req(p.scanForExistingClientInfo(s,same) and same.legsModel==ci.legsModel,"reuse")
  config="\\n\\Ranger\\t\\1\\model\\sarge/default\\hmodel\\sarge/default\\c1\\4\\c2\\2";count=count+req(p.newClientInfo(s,1,config,animText(),false,false) and s.clients[1].name=="Ranger" and s.clients[1].color1==[1.0,0.0,0.0],"new client")
  lf=p.lerpFrame();p.clearLerpFrame(s,ci,lf,p.LEGS_RUN);s.time=100;p.runLerpFrame(s,ci,lf,p.LEGS_RUN,1.0);count=count+req(lf.frame>=ci.animations[p.LEGS_RUN].firstFrame,"lerp")
  swung=p.swingAngles(16,90.0,25.0,90.0,0.3,0.0,true);count=count+req(swung[0]>0.0 and swung[1],"swing")
  cent=p.entity(2,0);cent.painTime=50;s.time=100;cent.painDirection=1;count=count+req(p.addPainTwitch(s,cent,[0.0,0.0,0.0])[2]==15.0,"pain")
  cent.legs.animationNumber=p.LEGS_RUN;cent.powerups=(1<<p.PW_HASTE)|(1<<p.PW_QUAD)|(1<<p.PW_FLIGHT);count=count+req(p.hasteTrail(s,cent,true),"haste");p.playerPowerups(s,cent,true);count=count+req(len(s.actions)>=3,"powerups")
  cent.eFlags=p.EF_TALK;count=count+req(p.playerSprites(s,cent,p.TEAM_RED,true),"sprite");plane=p.playerShadow(s,cent,trace(0.5,10.0,0),true);count=count+req(plane==11.0,"shadow");count=count+req(p.playerSplash(s,cent,32,0,trace(0.5,2.0,0),true),"splash")
  cent.powerups=1<<p.PW_QUAD;count=count+req(p.addRefEntityWithPowerups(s,cent,p.TEAM_RED,"torso",true)==2,"powerup shader")
  verts=[p.vertex([0.0,0.0,0.0]),p.vertex([1.0,0.0,0.0])];count=count+req(p.lightVerts([0.0,0.0,1.0],verts,[10.0,20.0,30.0],[100.0,100.0,100.0],[0.0,0.0,1.0]) and verts[0].color==[110,120,130,255],"light verts")
  cent.eFlags=0;cent.powerups=0;cent.legsAnim=p.LEGS_RUN;cent.torsoAnim=6;count=count+req(p.player(s,cent,p.TEAM_RED,trace(0.5,0.0,0),0,0,trace(1.0,0.0,0),true),"player assembly");count=count+req(not s.actions[0].dispatched,"retail suppression")
  p.resetPlayerEntity(s,cent);count=count+req(cent.trailTime==s.time,"reset")
  print("PASS: "+str(count)+" native cg_players contracts");return 0
end function
