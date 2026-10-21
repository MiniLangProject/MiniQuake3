import mq3.renderer.playable_dynamic_lights as lights
import mq3.compat.numeric as numeric
function hex32(value) digits=bytes("0123456789abcdef");text="";for i=0 to 7 shift=(7-i)*4;text=text+decode(bytes([digits[(value>>shift)&15]])) end for;return text end function
function emit(name,origin,axis,bounds,values)
  mask=0;transformed=[];index=0
  for each light in values
    local=lights.localPoint(light.origin,origin,axis);transformed=transformed+[local]
    if lights.affectsBounds(light,origin,axis,bounds) then mask=mask|(1<<index) end if
    index=index+1
  end for
  need=0;if mask!=0 then need=1 end if;text=name+"|"+str(mask)+"|"+str(need)
  for each local in transformed text=text+"|"+hex32(numeric.floatBits(local[0]))+","+hex32(numeric.floatBits(local[1]))+","+hex32(numeric.floatBits(local[2])) end for
  print(text);return 1
end function
function main(args)
  identity=[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]];bounds=[[-1.0,-1.0,-1.0],[1.0,1.0,1.0]]
  emit("I",[0.0,0.0,0.0],identity,bounds,[lights.Light([0.0,0.0,0.0],1.0,[1.0,1.0,1.0],false),lights.Light([2.0,0.0,0.0],1.0,[1.0,1.0,1.0],false),lights.Light([2.01,0.0,0.0],1.0,[1.0,1.0,1.0],false),lights.Light([0.0,-2.0,0.0],1.0,[1.0,1.0,1.0],false)])
  rotated=[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]]
  emit("R",[10.0,20.0,0.0],rotated,bounds,[lights.Light([7.0,22.0,0.0],2.0,[1.0,1.0,1.0],false),lights.Light([7.0,22.0,0.0],2.01,[1.0,1.0,1.0],false),lights.Light([10.0,20.0,5.0],3.99,[1.0,1.0,1.0],false)])
  return 0
end function
