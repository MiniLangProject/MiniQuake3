import mq3.renderer.md3_entity as entity
struct Fog bounds end struct
struct Frame localOrigin radius end struct
function emit(name,fogs,frame,origin,noWorld) value=entity.computeFogNum(fogs,origin,frame,noWorld);if value is error then return value end if;print(name+"|N"+str(value));return void end function
function main(args)
  frame0=Frame([1.0,2.0,3.0],2.0);frame1=Frame([-5.0,0.0,0.0],1.0)
  fog1=Fog([[0.0,0.0,0.0],[10.0,10.0,10.0]]);fog2=Fog([[-20.0,-20.0,-20.0],[20.0,20.0,20.0]])
  result=emit("first-wins",[void,fog1,fog2],frame0,[0.0,0.0,0.0],false);if result is error then return result end if
  result=emit("outside",[void,fog1,fog2],frame0,[30.0,30.0,30.0],false);if result is error then return result end if
  result=emit("touch-max",[void,fog1],frame0,[11.0,-2.0,-3.0],false);if result is error then return result end if
  result=emit("touch-min",[void,fog1],frame0,[-3.0,-2.0,-3.0],false);if result is error then return result end if
  result=emit("frame-select",[void,fog1],frame1,[13.0,5.0,5.0],false);if result is error then return result end if
  result=emit("no-world",[void,fog1,fog2],frame0,[0.0,0.0,0.0],true);if result is error then return result end if
  return 0
end function
