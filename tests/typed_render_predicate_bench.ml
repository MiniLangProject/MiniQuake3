import mq3.renderer.playable_world_batch as worldBatch
import mq3.renderer.qvm_scene_batch as sceneBatch

struct BenchTriangle textureIndex renderfx end struct

function main(args)
  if len(args)!=2 then return 2 end if
  operation=args[0];iterations=toNumber(args[1]);if iterations<1 then return 2 end if
  flags=array(64,false);for index=0 to 63 if index%9==0 then flags[index]=true end if end for
  triangle=BenchTriangle(0,0);count=0
  for index=0 to iterations-1
    triangle.textureIndex=index&63;triangle.renderfx=index&15
    if operation=="sky" then if worldBatch.isSky(triangle,flags) then count=count+1 end if
    else if operation=="depth" then if sceneBatch.depthHack(triangle) then count=count+1 end if
    else if operation=="both" then if worldBatch.isSky(triangle,flags) or sceneBatch.depthHack(triangle) then count=count+1 end if
    else return 2 end if
  end for
  print "checksum="+str(count)
  return 0
end function
