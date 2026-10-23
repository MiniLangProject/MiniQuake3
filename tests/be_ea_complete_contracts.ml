import mq3.botlib.elementary_actions as ea

struct Context events end struct
function recordCommand(c,client,text) c.events=c.events+[str(client)+":"+text];return 0 end function
function require(ok,label) if not ok then return error(7560,"be_ea complete: "+label) end if;return 1 end function
function main(args)
  c=Context([]);setupState=ea.EA_Setup(2);state=ea.create(2,recordCommand,c);checks=0
  checks=checks+require(setupState.initialized and setupState.maxClients==2 and len(setupState.inputs)==2,"EA_Setup")
  ea.EA_Say(state,0,"a");ea.EA_SayTeam(state,0,"b");ea.EA_Tell(state,0,1,"c");ea.EA_UseItem(state,0,"d");ea.EA_DropItem(state,0,"e");ea.EA_UseInv(state,0,"f");ea.EA_DropInv(state,0,"g");ea.EA_Command(state,1,"h")
  checks=checks+require(c.events==["0:say a","0:say_team b","0:tell 1, c","0:use d","0:drop e","0:invuse f","0:invdrop g","1:h"],"all command formatting")
  ea.EA_Gesture(state,0);ea.EA_Attack(state,0);ea.EA_Talk(state,0);ea.EA_Use(state,0);ea.EA_Respawn(state,0);ea.EA_Crouch(state,0);ea.EA_Walk(state,0);ea.EA_MoveUp(state,0);ea.EA_MoveDown(state,0);ea.EA_MoveForward(state,0);ea.EA_MoveBack(state,0);ea.EA_MoveLeft(state,0);ea.EA_MoveRight(state,0);ea.EA_Action(state,0,ea.ACTION_NEGATIVE)
  expected=ea.ACTION_GESTURE|ea.ACTION_ATTACK|ea.ACTION_TALK|ea.ACTION_USE|ea.ACTION_RESPAWN|ea.ACTION_CROUCH|ea.ACTION_WALK|ea.ACTION_MOVEUP|ea.ACTION_MOVEDOWN|ea.ACTION_MOVEFORWARD|ea.ACTION_MOVEBACK|ea.ACTION_MOVELEFT|ea.ACTION_MOVERIGHT|ea.ACTION_NEGATIVE
  checks=checks+require(ea.EA_GetInput(state,0,0.125).actionflags==expected,"actions")
  ea.EA_SelectWeapon(state,0,17);ea.EA_Move(state,0,[1.0,2.0,3.0],401.0);ea.EA_View(state,0,[4.0,5.0,6.0]);value=ea.EA_GetInput(state,0,0.25);checks=checks+require(value.weapon==17 and value.dir==[1.0,2.0,3.0] and value.speed==400.0 and value.viewangles==[4.0,5.0,6.0] and value.thinktime==0.25,"input fields")
  ea.EA_Move(state,0,[0.0,0.0,0.0],-401.0);checks=checks+require(ea.EA_GetInput(state,0,0.0).speed==-400.0,"negative clamp")
  before=ea.EA_GetInput(state,0,0.5);ea.EA_EndRegular(state,0,1.0);after=ea.EA_GetInput(state,0,0.5);checks=checks+require(before.dir==after.dir and before.actionflags==after.actionflags,"EndRegular no-op")
  ea.EA_Jump(state,1);ea.EA_ResetInput(state,1);checks=checks+require(ea.EA_GetInput(state,1,0.0).actionflags==ea.ACTION_JUMPEDLASTFRAME,"jump latch")
  ea.EA_Jump(state,1);ea.EA_DelayedJump(state,1);checks=checks+require(ea.EA_GetInput(state,1,0.0).actionflags==ea.ACTION_JUMPEDLASTFRAME,"held jump suppression")
  ea.EA_ResetInput(state,1);ea.EA_DelayedJump(state,1);checks=checks+require(ea.EA_GetInput(state,1,0.0).actionflags==ea.ACTION_DELAYEDJUMP,"delayed jump")
  checks=checks+require((try(ea.EA_Attack(state,2))) is error,"bounds")
  ea.EA_Shutdown(setupState);ea.shutdown(state);checks=checks+require(not setupState.initialized and len(setupState.inputs)==0,"EA_Shutdown")
  print("PASS: "+str(checks)+" complete be_ea contracts");return 0
end function
