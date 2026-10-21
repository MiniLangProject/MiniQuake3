import mq3.client.cgame_view as view
import mq3.game.constants as c
import mq3.game.playerstate as playerstate

function req(value,message) if not value then return error(7780,message) end if;return 1 end function
function close(a,b,e) d=a-b;if d<0 then d=-d end if;return d<=e end function
function ready()
  s=view.create();ps=playerstate.create();ps.stats[c.STAT_HEALTH]=100;ps.stats[c.STAT_DEAD_YAW]=123;ps.viewheight=26;ps.clientNum=2;s.snap=view.snapshot(ps,0,[1,2,3]);s.predicted=playerstate.copy(ps);return s
end function

function main(args)
  count=0;s=ready();s.refdef.vieworg=[1.0,2.0,3.0]
  count=count+req(not view.testModel(s,["testmodel"],0),"testmodel argc")
  count=count+req(view.testModel(s,["testmodel","models/a.md3","0.25"],7),"testmodel register")
  count=count+req(s.testModelName=="models/a.md3" and s.testModel.frame==1 and s.testModel.oldframe==0 and close(s.testModel.backlerp,0.25,0.0001),"testmodel fields")
  count=count+req(s.testModel.origin==[101.0,2.0,3.0] and not s.testGun,"testmodel placement")
  count=count+req(view.testGun(s,["testgun","models/g.md3"],8) and s.testGun and s.testModel.renderfx==(view.RF_MINLIGHT|view.RF_DEPTHHACK|view.RF_FIRST_PERSON),"testgun")
  count=count+req(view.testModelNextFrame(s)==1 and view.testModelPrevFrame(s)==0 and view.testModelPrevFrame(s)==0,"frame cycle")
  count=count+req(view.testModelNextSkin(s)==1 and view.testModelPrevSkin(s)==0 and view.testModelPrevSkin(s)==0,"skin cycle")
  s.gunX=2.0;s.gunY=3.0;s.gunZ=4.0;s.refdef.vieworg=[10.0,20.0,30.0];before=s.suppressed;action=view.addTestModel(s,8,true);count=count+req(action.kind=="test-model" and not action.dispatched and s.suppressed==before+1,"test model retail suppression")
  count=count+req(s.testModel.origin==[12.0,23.0,34.0],"test gun axes")

  s.viewsize=10;s.vidWidth=801;s.vidHeight=601;count=count+req(view.calcVrect(s)==30 and s.viewsize==30,"vrect lower clamp")
  count=count+req(s.refdef.width==240 and s.refdef.height==180 and s.refdef.x==280 and s.refdef.y==210,"vrect even dimensions")
  s.viewsize=120;count=count+req(view.calcVrect(s)==100 and s.refdef.width==800 and s.refdef.height==600,"vrect upper clamp")
  s.predicted.pm_type=c.PM_INTERMISSION;s.viewsize=40;count=count+req(view.calcVrect(s)==100,"intermission vrect");s.predicted.pm_type=0

  s.time=1000;count=count+req(view.zoomDown(s) and s.zoomed and s.zoomTime==1000 and not view.zoomDown(s),"zoom down edge")
  s.time=1100;count=count+req(view.zoomUp(s) and not s.zoomed and s.zoomTime==1100 and not view.zoomUp(s),"zoom up edge")
  s.refdef.width=640;s.refdef.height=480;s.fov=200.0;s.zoomFov=0.5;s.time=2000;s.zoomTime=0;count=count+req(not view.calcFov(s) and close(s.refdef.fovX,160.0,0.001),"fov clamps")
  count=count+req(s.refdef.fovY>0.0 and s.zoomSensitivity==1.0,"fov vertical")
  s.fov=90.0;s.zoomFov=30.0;s.zoomed=true;s.zoomTime=2000;s.time=2075;view.calcFov(s);count=count+req(close(s.refdef.fovX,60.0,0.01) and s.zoomSensitivity<1.0,"zoom interpolation")
  s.contents=view.CONTENTS_WATER;s.time=2500;count=count+req(view.calcFov(s),"underwater flag");s.contents=0

  s=ready();s.predicted.origin=[0.0,0.0,10.0];s.predicted.viewangles=[0.0,0.0,0.0];s.predicted.velocity=[100.0,0.0,0.0];s.predicted.bobCycle=64;s.time=500;s.refdef=view.refDef();s.refdef.width=640;s.refdef.height=480
  view.calcViewValues(s);count=count+req(s.refdef.vieworg[2]>30.0 and s.xySpeed==100.0 and s.bobFracSin>0.99,"first person bob")
  count=count+req(s.refdef.viewaxis[0][0]>0.9,"view axis")
  s.stepTime=450;s.stepChange=10.0;s.refdef.vieworg=[0.0,0.0,20.0];view.stepOffset(s);count=count+req(close(s.refdef.vieworg[2],12.5,0.001),"step smoothing")
  s.predicted.stats[c.STAT_HEALTH]=0;s.snap.ps.stats[c.STAT_HEALTH]=0;s.refdef.vieworg=[0.0,0.0,0.0];s.viewAngles=[0.0,0.0,0.0];view.offsetFirstPersonView(s);count=count+req(s.viewAngles==[-15.0,123,40.0] and s.refdef.vieworg[2]==26.0,"dead view")

  s=ready();s.time=200;s.damageTime=100;s.damageValue=10.0;s.damageX=0.5;s.damageY=-0.5;s.refdef.vieworg=[1.0,2.0,3.0];blob=view.damageBlendBlob(s,true);count=count+req(blob.radius==30.0 and blob.shader==s.viewBloodShader and not blob.dispatched,"damage blob")
  count=count+req(blob.rgba[3]==160 and s.suppressed==1,"damage alpha")
  s.ragePro=true;count=count+req(view.damageBlendBlob(s,false)==void,"ragepro damage suppression");s.ragePro=false

  count=count+req(not view.addBufferedSound(s,0),"zero buffered sound")
  count=count+req(view.addBufferedSound(s,11) and view.addBufferedSound(s,12),"buffer sounds")
  s.time=1000;count=count+req(view.playBufferedSounds(s,true)==11 and s.soundTime==1750 and s.audio[len(s.audio)-1].kind=="buffered-announcer","play buffer")
  s.time=1200;count=count+req(view.playBufferedSounds(s,false)==0,"buffer delay");s.time=1800;count=count+req(view.playBufferedSounds(s,false)==12,"buffer second")
  s=ready();for i=1 to view.MAX_SOUNDBUFFER view.addBufferedSound(s,i) end for;count=count+req(s.soundBufferOut==1,"buffer overwrite oldest")

  s=ready();s.time=4500;s.oldTime=3500;s.snap.ps.powerups[0]=5000;s.snap.ps.powerups[1]=10000;count=count+req(view.powerupTimerSounds(s,true)==1 and not s.audio[0].dispatched,"powerup wearoff boundary")
  s=ready();s.infoScreenText="loading";count=count+req(not view.drawActiveFrame(s,100,0,false,true) and s.actions[len(s.actions)-1].kind=="draw-information","loading frame")
  s=ready();s.snap.snapFlags=view.SNAPFLAG_NOT_ACTIVE;count=count+req(not view.drawActiveFrame(s,100,0,false,true),"inactive frame")
  s=ready();s.timescale=1.0;s.timescaleFadeEnd=0.5;s.timescaleFadeSpeed=1.0;s.time=0;count=count+req(view.drawActiveFrame(s,100,0,false,true),"active frame")
  count=count+req(s.clientFrame==1 and s.refdef.time==100 and s.refdef.areamask==[1,2,3],"frame state")
  count=count+req(s.actions[len(s.actions)-1].kind=="draw-active" and s.emitted==0 and s.suppressed==len(s.actions),"frame retail boundaries")
  count=count+req(s.timescale<1.0 and s.frameTime==100,"timescale fade")
  beforeOld=s.oldTime;view.drawActiveFrame(s,120,view.STEREO_RIGHT,false,true);count=count+req(s.oldTime==beforeOld,"stereo timing")
  view.clearBoundaries(s);count=count+req(len(s.actions)==0 and len(s.scene)==0 and len(s.audio)==0,"clear boundaries")
  print("PASS: "+str(count)+" native cg_view contracts");return 0
end function
