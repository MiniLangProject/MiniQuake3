import mq3.client.ui_players as p

function req(ok,label) if not ok then return error(7981,"UI players contract: "+label) end if;return 1 end function
function animText() text="footsteps default\nheadoffset 0 0 0\nsex m\n";for i=0 to 30 text=text+str(i*10)+" 4 2 10\n" end for;return text end function
function files()
  return ["models/players/sarge/lower.md3","models/players/sarge/upper.md3","models/players/sarge/head.md3","models/players/sarge/lower_default.skin","models/players/sarge/upper_default.skin","models/players/sarge/head_default.skin","models/weapons2/machinegun/machinegun.md3","models/weapons2/machinegun/machinegun_barrel.md3","models/weapons2/machinegun/machinegun_flash.md3","sprites/balloon3"]
end function
function source() return p.assetSource(files(),[["models/players/sarge/animation.cfg",animText()]],false) end function
function close(a,b) d=a-b;if d<0 then d=0-d end if;return d<0.01 end function
function main(args)
  count=0;animations=p.UI_ParseAnimationFile("animation.cfg",animText());count=count+req(animations!=void and len(animations)==31 and animations[0].firstFrame==0 and animations[13].firstFrame==60 and animations[0].frameLerp==100,"animation parser and leg frame correction")
  count=count+req(p.UI_ParseAnimationFile("bad","1 2 3 4")==void and p.UI_ParseAnimationFile("missing",void)==void,"animation rejection")
  src=source();pi=p.create();count=count+req(p.UI_RegisterClientModelname(src,pi,"sarge/red") and pi.legsSkin=="models/players/sarge/lower_default.skin" and len(pi.animations)==31,"model skin fallback")
  count=count+req(len(src.actions)==6,"model and fallback skin registrations")
  empty=p.assetSource([],[],false);missing=p.create();count=count+req(not p.UI_RegisterClientModelname(empty,missing,"sarge/default"),"missing model rejection")
  p.UI_PlayerInfo_SetWeapon(src,pi,p.WP_SHOTGUN);count=count+req(pi.currentWeapon==p.WP_SHOTGUN and pi.realWeapon==p.WP_MACHINEGUN and pi.weaponModel!="","weapon fallback keeps requested weapon")
  p.UI_PlayerInfo_SetWeapon(src,pi,p.WP_NONE);count=count+req(pi.realWeapon==p.WP_NONE and pi.weaponModel=="","weapon none")
  p.UI_ForceLegsAnim(pi,p.LEGS_JUMP);count=count+req((pi.legsAnim&~p.ANIM_TOGGLEBIT)==p.LEGS_JUMP and pi.legsAnimationTimer==1000,"force jump")
  pi.pendingLegsAnim=p.LEGS_IDLE;p.UI_SetLegsAnim(pi,p.LEGS_LAND);count=count+req(pi.pendingLegsAnim==0 and (pi.legsAnim&~p.ANIM_TOGGLEBIT)==p.LEGS_IDLE,"pending legs")
  p.UI_ForceTorsoAnim(pi,p.TORSO_GESTURE);count=count+req(pi.torsoAnimationTimer==2300,"gesture timer");p.UI_ForceTorsoAnim(pi,p.TORSO_ATTACK);count=count+req(pi.torsoAnimationTimer==500,"attack timer")
  pi.legsAnim=p.LEGS_JUMP;pi.legsAnimationTimer=500;p.UI_LegsSequencing(pi);count=count+req(pi.jumpHeight>55.0,"jump arc");pi.legsAnimationTimer=0;p.UI_LegsSequencing(pi);count=count+req((pi.legsAnim&~p.ANIM_TOGGLEBIT)==p.LEGS_LAND and pi.legsAnimationTimer==130,"jump landing")
  pi.animations=animations;lf=p.lerpFrame();p.UI_RunLerpFrame(pi,lf,p.LEGS_IDLE,0);p.UI_RunLerpFrame(pi,lf,p.LEGS_IDLE,100);count=count+req(lf.animation!=void and lf.frame>=animations[p.LEGS_IDLE].firstFrame,"lerp frame")
  swung=p.UI_SwingAngles(90.0,25.0,90.0,0.3,0.0,false,16);count=count+req(swung[1] and swung[0]>0.0,"angle swing starts")
  pi.viewAngles=[0.0,0.0,0.0];pi.moveAngles=[0.0,0.0,0.0];count=count+req(p.UI_MovedirAdjustment(pi)==0.0,"forward movedir");pi.moveAngles=[0.0,90.0,0.0];count=count+req(p.UI_MovedirAdjustment(pi)==45.0,"strafe movedir")
  pi.torsoAnim=p.TORSO_ATTACK;pi.barrelSpinning=false;angle=p.UI_MachinegunSpinAngle(pi,100);count=count+req(pi.barrelSpinning and pi.barrelTime==100 and angle>0.0,"barrel starts");pi.torsoAnim=p.TORSO_STAND;angle=p.UI_MachinegunSpinAngle(pi,200);count=count+req(not pi.barrelSpinning and pi.barrelTime==200,"barrel coasts")
  src=source();pi=p.create();p.UI_PlayerInfo_SetModel(src,pi,"sarge/default");count=count+req(pi.newModel and pi.currentWeapon==p.WP_MACHINEGUN and pi.pendingWeapon==-1,"set model defaults");p.UI_PlayerInfo_SetInfo(src,pi,p.LEGS_IDLE,p.TORSO_STAND,[0.0,150.0,0.0],[0.0,0.0,0.0],p.WP_MACHINEGUN,true);count=count+req(not pi.newModel and pi.chat and (pi.legsAnim&~p.ANIM_TOGGLEBIT)==p.LEGS_IDLE,"new model info")
  pi.realtime=100;p.UI_PlayerInfo_SetInfo(src,pi,p.LEGS_IDLE,p.TORSO_ATTACK,[0.0,150.0,0.0],[0.0,0.0,0.0],p.WP_GAUNTLET,false);count=count+req(pi.pendingWeapon==p.WP_GAUNTLET and pi.weaponTimer==350,"delayed weapon")
  p.UI_PlayerInfo_SetInfo(src,pi,p.BOTH_DEATH1,p.BOTH_DEATH1,[0.0,0.0,0.0],[0.0,0.0,0.0],p.WP_NONE,false);count=count+req(pi.weapon==p.WP_NONE and pi.currentWeapon==p.WP_NONE,"death clears weapon")
  parent=p.renderEntity("parent","m","s","");parent.origin=[1.0,2.0,3.0];orientation=p.Orientation([2.0,0.0,0.0],p.identityAxis(),true);child=p.renderEntity("child","c","","");p.UI_PositionEntityOnTag(child,parent,orientation);count=count+req(child.origin[0]==3.0 and child.backlerp==parent.backlerp,"tag placement")
  parent.axis=[[0.0,-1.0,0.0],[1.0,0.0,0.0],[0.0,0.0,1.0]];orientation.axis=[[1.0,0.0,0.0],[0.0,0.0,-1.0],[0.0,1.0,0.0]];child.axis=[[0.0,0.0,1.0],[0.0,1.0,0.0],[-1.0,0.0,0.0]];expected=p.matrixMultiply(p.matrixMultiply(child.axis,orientation.axis),parent.axis);p.UI_PositionRotatedEntityOnTag(child,parent,orientation);count=count+req(child.axis==expected,"rotated tag matrix order")
  src=source();pi=p.create();p.UI_PlayerInfo_SetModel(src,pi,"sarge/default");p.UI_PlayerInfo_SetInfo(src,pi,p.LEGS_IDLE,p.TORSO_STAND,[0.0,150.0,0.0],[0.0,0.0,0.0],p.WP_MACHINEGUN,true);rows=p.UI_DrawPlayer(src,0.0,0.0,320.0,560.0,pi,1000,16,false);count=count+req(len(rows)>=9 and rows[0].kind=="clear-scene" and rows[len(rows)-1].kind=="render-scene","typed preview scene")
  print("PASS: "+str(count)+" UI players contracts");return 0
end function
