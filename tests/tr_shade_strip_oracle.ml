import mq3.renderer.tr_shade_runtime as shade
function emit(name,indexes)
  result=shade.R_DrawStripElements(indexes);stream=[]
  for each strip in result.strips stream=stream+[-1]+strip+[-2] end for
  text="";if len(stream)>0 then for index=0 to len(stream)-1 if index>0 then text=text+"," end if;text=text+str(stream[index]) end for end if
  print(name+"|"+str(result.begins)+","+str(result.vertexes)+"|"+text);return 1
end function
function main(args)
  emit("empty",[]);emit("tri",[0,1,2]);emit("odd",[0,1,2,2,1,3]);emit("even",[0,1,2,2,1,3,2,3,4]);emit("split",[0,1,2,4,5,6]);return 0
end function
