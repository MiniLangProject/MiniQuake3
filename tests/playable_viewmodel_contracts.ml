import mq3.client.playable_viewmodel as viewmodel
import mq3.client.playable_viewer as viewer
import mq3.format.md3 as md3

function require(ok,text) if not ok then return error(7621,text) end if;return 1 end function
function near(a,b) d=a-b;if d<0.0 then d=0.0-d end if;return d<0.002 end function

function main(args)
  count=0
  config=viewmodel.defaults()
  count=count+require(config.horizontalFov==90.0 and config.gunX==0.0 and config.gunY==0.0 and config.gunZ==0.0 and config.modelScale==1.0,"Baseq3 defaults")
  software=viewmodel.softwareRendererSettings();count=count+require(software.gunX==25.0 and software.gunY==-1.1 and software.gunZ==2.0 and software.modelScale==1.0,"software depthhack compensation is isolated")
  count=count+require(viewmodel.fovOffset(90.0)==0.0 and near(viewmodel.fovOffset(110.0),-4.0),"high FOV lowers gun")
  count=count+require(near(viewmodel.landingOffset(75,0,-8.0),-1.0),"landing deflect")
  count=count+require(near(viewmodel.landingOffset(300,0,-8.0),-1.0) and viewmodel.landingOffset(450,0,-8.0)==0.0,"landing return")
  camera=viewer.camera([10.0,20.0,30.0],0.0,0.0,320.0,0.1)
  idle=viewmodel.BobSample(0,0.0,0.0)
  pose=viewmodel.calculate(camera,idle,0,-1000,0.0,config)
  cameraAxes=viewer.cameraBasis(camera)
  count=count+require(pose.origin==camera.position and pose.axis[0]==cameraAxes[0] and pose.axis[1]==[0.0,1.0,0.0] and pose.axis[2]==cameraAxes[2] and pose.scale==1.0,"idle hand uses Baseq3 AnglesToAxis")
  custom=viewmodel.settings(110.0,1.0,2.0,3.0,0.75)
  pose=viewmodel.calculate(camera,idle,0,-1000,0.0,custom)
  count=count+require(near(pose.origin[0],11.0) and near(pose.origin[1],22.0) and near(pose.origin[2],29.0) and pose.scale==0.75,"gun and FOV offsets use view axes")
  even=viewmodel.calculate(camera,viewmodel.BobSample(64,1.0,100.0),0,-1000,0.0,config)
  odd=viewmodel.calculate(camera,viewmodel.BobSample(192,1.0,100.0),0,-1000,0.0,config)
  count=count+require(even.axis!=pose.axis,"moving weapon receives bob angles")
  count=count+require(even.axis[0][1]>0.0 and odd.axis[0][1]<0.0,"odd bob cycle reverses yaw and roll")
  state=viewmodel.tracker();first=viewmodel.advance(state,[320.0,0.0,0.0],true,1000);next=viewmodel.advance(state,[320.0,0.0,0.0],true,1100)
  count=count+require(first.cycle==0 and next.cycle==40 and next.fraction>0.8,"run bob cycle advances at Baseq3 rate")
  stopped=viewmodel.advance(state,[0.0,0.0,0.0],true,1110)
  count=count+require(stopped.cycle==0 and stopped.fraction==0.0,"standing resets bob cycle")
  transformed=viewmodel.transform(pose)
  count=count+require(transformed.origin==pose.origin and transformed.axis==pose.axis and transformed.scale==pose.scale,"renderer transform adapter")
  recoiled=viewmodel.withRecoil(pose,camera,1000)
  count=count+require(near(recoiled.origin[0],pose.origin[0]-1.6) and near(recoiled.origin[2],pose.origin[2]-0.7),"preview recoil composes after Baseq3 pose")
  count=count+require(viewmodel.withRecoil(pose,camera,0).origin==pose.origin,"zero recoil is position-neutral")
  frame=viewmodel.frameTransform(camera,idle,0,-1000,0.0,1000,custom)
  count=count+require(frame.origin==recoiled.origin and frame.scale==0.75,"single-call frame integration")
  tag=md3.Tag("tag_weapon",[-6.921875,-2.890625,-7.171875],[[1.0,0.0,0.0],[0.0,0.0,-1.0],[0.0,1.0,0.0]])
  attachment=viewmodel.Attachment("weapon_machinegun","machinegun_hand.md3",[[tag]])
  count=count+require(viewmodel.handPath("weapon_machinegun")=="models/weapons2/machinegun/machinegun_hand.md3" and viewmodel.handPath("ammo_bullets")=="","retail hand model paths")
  attached=viewmodel.attachWeapon(viewmodel.calculate(camera,idle,0,-1000,0.0,config),attachment,0,0,0.0)
  count=count+require(near(attached.origin[0],3.078125) and near(attached.origin[1],17.109375) and near(attached.origin[2],22.828125),"weapon attached through hand tag")
  count=count+require(attached.axis==[[1.0,0.0,0.0],[0.0,0.0,-1.0],[0.0,1.0,0.0]],"tag and hand axes compose in Baseq3 order")
  second=md3.Tag("tag_weapon",[-8.0,-4.0,-6.0],[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]);attachment.frames=attachment.frames+[[second]]
  blended=viewmodel.attachmentTag(attachment,0,1,0.5);count=count+require(near(blended.origin[0],-7.4609375) and near(blended.origin[1],-3.4453125),"animated hand tag interpolation")
  animation=viewmodel.weaponAnimation("weapon_machinegun")
  idleFrame=viewmodel.sampleWeaponAnimation(animation,"weapon_machinegun",1000,-1000);count=count+require(idleFrame.frame==0 and not idleFrame.switching,"idle weapon frame")
  drop=viewmodel.sampleWeaponAnimation(animation,"weapon_shotgun",1100,-1000);lateDrop=viewmodel.sampleWeaponAnimation(animation,"weapon_shotgun",1299,-1000)
  count=count+require(drop.classname=="weapon_machinegun" and drop.frame==6 and lateDrop.frame==9 and lateDrop.switching,"old weapon drop frames")
  raise=viewmodel.sampleWeaponAnimation(animation,"weapon_shotgun",1300,-1000);ready=viewmodel.sampleWeaponAnimation(animation,"weapon_shotgun",1550,-1000)
  count=count+require(raise.classname=="weapon_shotgun" and raise.frame==0 and raise.switching and not ready.switching,"new weapon raise interval")
  attack=viewmodel.sampleWeaponAnimation(animation,"weapon_shotgun",2070,2000);count=count+require(attack.oldFrame==1 and attack.frame==2 and attack.backlerp>0.9,"15-fps attack hand interpolation")
  count=count+require(try(viewmodel.settings(180.0,0.0,0.0,0.0,1.0)) is error,"invalid FOV rejected")
  count=count+require(try(viewmodel.advance(state,[0.0],true,1200)) is error,"invalid velocity rejected")
  count=count+require(try(viewmodel.advance(state,[0.0,0.0,0.0],true,1000)) is error,"backwards time rejected")
  print("PASS: "+str(count)+" playable viewmodel contracts");return 0
end function
