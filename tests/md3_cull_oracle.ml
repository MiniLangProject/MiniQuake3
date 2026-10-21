import mq3.renderer.md3_entity as entity
function emit(name,sameFrame,scaled,newResult,oldResult,boxResult) print(name+"|C"+str(entity.cullModelDecision(sameFrame,scaled,newResult,oldResult,boxResult))) end function
function main(args)
  emit("same-out",true,false,2,2,0)
  emit("same-in",true,false,0,0,2)
  emit("same-clip-box-out",true,false,1,1,2)
  emit("pair-both-out",false,false,2,2,0)
  emit("pair-disagree-box-in",false,false,2,0,0)
  emit("scaled-box-clip",true,true,2,2,1)
  return 0
end function
