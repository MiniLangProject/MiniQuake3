import mq3.format.player_animation as anim
import mq3.compat.numeric as numeric
function hex32(value) digits="0123456789abcdef";textValue="";for i=0 to 7 textValue=digits[(value>>(i*4))&15]+textValue end for;return textValue end function
function a(first,count,loops,lerp,initial,reversed,flip) return anim.Animation(first,count,loops,lerp,initial,reversed,flip) end function
function emit(name,state) print(name+"|"+str(state.oldFrame)+","+str(state.frame)+","+str(state.oldFrameTime)+","+str(state.frameTime)+","+hex32(numeric.floatBits(state.backlerp))+","+str(state.animationNumber)+","+str(state.animationTime)) end function
function run(config,state,name,index,scale,now,enabled) value=anim.runLerpFrame(config,state,index,scale,now,enabled);if value is error then return value end if;emit(name,state);return void end function
function main(args)
  values=array(36,a(0,1,0,1,1,false,false));values[1]=a(100,5,2,50,75,false,false);values[2]=a(200,4,0,40,40,true,false);values[3]=a(300,3,0,60,60,false,true)
  config=anim.Config(values,"normal",[0.0,0.0,0.0],"male",false,false);state=anim.lerpFrame()
  run(config,state,"n0",1,1.0,0,true);run(config,state,"n25",1,1.0,25,true);run(config,state,"n75",1,1.0,75,true);run(config,state,"n100",1,1.0,100,true);run(config,state,"n160",1,1.0,160,true);run(config,state,"n500",1,1.0,500,true)
  run(config,state,"toggle",129,1.0,520,true);run(config,state,"toggle2",129,1.0,595,true)
  state=anim.lerpFrame();run(config,state,"reverse",2,1.0,120,true);run(config,state,"reverseEnd",2,1.0,500,true)
  state=anim.lerpFrame();run(config,state,"flip",3,1.0,60,true);run(config,state,"flip2",3,1.0,120,true);run(config,state,"flipEnd",3,1.0,600,true)
  state=anim.lerpFrame();run(config,state,"haste",1,1.5,200,true);run(config,state,"haste2",1,1.5,250,true);run(config,state,"disabled",1,1.0,300,false)
  return 0
end function
