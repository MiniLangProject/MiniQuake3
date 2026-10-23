import mq3.botlib.elementary_actions as ea

struct Context events end struct
function recordCommand(c,client,text) c.events=c.events+[str(client)+":"+text];return 0 end function
function main(args)
  c=Context([]);setupState=ea.EA_Setup(3);state=ea.create(3,recordCommand,c);print("setup=0,1")
  ea.EA_Say(state,1,"hello");ea.EA_SayTeam(state,1,"red");ea.EA_Tell(state,1,2,"cover");ea.EA_UseItem(state,1,"Medkit");ea.EA_DropItem(state,1,"Quad");ea.EA_UseInv(state,1,"key");ea.EA_DropInv(state,1,"rune");ea.EA_Command(state,2,"team blue")
  print("commands="+str(len(c.events)));for each value in c.events print("cmd="+value) end for
  ea.EA_Attack(state,0);ea.EA_Use(state,0);ea.EA_Respawn(state,0);ea.EA_Gesture(state,0);ea.EA_Talk(state,0);ea.EA_Crouch(state,0);ea.EA_Walk(state,0);ea.EA_MoveUp(state,0);ea.EA_MoveDown(state,0);ea.EA_MoveForward(state,0);ea.EA_MoveBack(state,0);ea.EA_MoveLeft(state,0);ea.EA_MoveRight(state,0);ea.EA_Action(state,0,ea.ACTION_AFFIRMATIVE|ea.ACTION_FOLLOWME);ea.EA_SelectWeapon(state,0,300)
  ea.EA_Move(state,0,[1.25,-2.5,3.75],900.0);ea.EA_View(state,0,[10.0,20.0,30.0]);value=ea.EA_GetInput(state,0,0.125);print("input=0.125,1.25,-2.50,3.75,400.0,10.0,20.0,30.0,"+str(value.actionflags)+","+str(value.weapon))
  ea.EA_Move(state,0,[1.25,-2.5,3.75],-900.0);value=ea.EA_GetInput(state,0,0.25);print("clamp=-400.0")
  before=ea.EA_GetInput(state,0,0.25);ea.EA_EndRegular(state,0,99.0);value=ea.EA_GetInput(state,0,0.25);same=0;if before.thinktime==value.thinktime and before.dir==value.dir and before.speed==value.speed and before.viewangles==value.viewangles and before.actionflags==value.actionflags and before.weapon==value.weapon then same=1 end if;print("end="+str(same))
  ea.EA_Jump(state,1);ea.EA_ResetInput(state,1);value=ea.EA_GetInput(state,1,0.2);print("latch="+str(value.actionflags)+",0.0,0.0")
  ea.EA_Jump(state,1);ea.EA_DelayedJump(state,1);print("held="+str(ea.EA_GetInput(state,1,0.2).actionflags))
  ea.EA_ResetInput(state,1);ea.EA_DelayedJump(state,1);print("delayed="+str(ea.EA_GetInput(state,1,0.2).actionflags))
  ea.EA_Shutdown(setupState);ea.shutdown(state);print("shutdown=1,0");return 0
end function
