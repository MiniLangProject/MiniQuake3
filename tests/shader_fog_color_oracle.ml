import mq3.renderer.playable_materials as materials
function emit(name,mode)
  colors=[[200,150,100,50],[17,63,129,201],[255,1,128,64]];density=[0.0,0.25,1.0];text=name+"|"
  for index=0 to 2
    color=materials.modulateForFog(colors[index],density[index],mode)
    for channel=0 to 3 if index!=0 or channel!=0 then text=text+"," end if;text=text+str(color[channel]) end for
  end for
  print(text);return 1
end function
function main(args) emit("rgb","rgb");emit("alpha","alpha");emit("rgba","rgba");return 0 end function
