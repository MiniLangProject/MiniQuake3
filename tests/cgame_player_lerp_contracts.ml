import mq3.format.player_animation as anim
function req(value,label) if not value then return error(7521,"cgame lerp contract: "+label) end if;return 1 end function
function a(first,count,loops,lerp,initial,reversed,flip) return anim.Animation(first,count,loops,lerp,initial,reversed,flip) end function
function main(args)
  count=0;values=array(36,a(0,1,0,1,1,false,false));values[1]=a(10,4,2,50,100,false,false);config=anim.Config(values,"normal",[0.0,0.0,0.0],"male",false,false)
  state=anim.lerpFrame();count=count+req(state.animation==void and state.animationNumber== -1,"fresh state")
  sample=anim.runLerpFrame(config,state,1,1.0,0,true);count=count+req(state.frame==10 and state.oldFrame==0 and state.frameTime==100,"initial lerp scheduled")
  sample=anim.runLerpFrame(config,state,1,1.0,50,true);count=count+req(sample.backlerp==0.5 and state.oldFrameTime==0,"initial backlerp")
  sample=anim.runLerpFrame(config,state,1,1.0,100,true);count=count+req(sample.oldFrame==10 and sample.frame==11 and sample.backlerp==1.0,"frame boundary semantics")
  sample=anim.runLerpFrame(config,state,1,1.0,1000,true);count=count+req(state.frameTime==1000 and sample.backlerp==0.0,"hitch frame clamp")
  before=state.animationTime;sample=anim.runLerpFrame(config,state,129,1.0,1010,true);count=count+req(state.animationNumber==129 and state.animationTime!=before,"toggle bit restarts animation")
  cleared=anim.clearLerpFrame(config,state,1,2000);count=count+req(cleared.frame==10 and cleared.oldFrame==10 and cleared.frameTime==2000,"clear sets first frame")
  sample=anim.runLerpFrame(config,state,1,1.0,2000,false);count=count+req(sample.frame==0 and sample.oldFrame==0 and sample.backlerp==0.0,"animation disable")
  count=count+req(try(anim.runLerpFrame(config,state,40,1.0,2001,true)) is error,"bad animation rejected")
  count=count+req(try(anim.runLerpFrame(config,state,1,-1.0,2001,true)) is error,"negative speed rejected")
  print("PASS: "+str(count)+" cgame-player-lerp contracts");return 0
end function
