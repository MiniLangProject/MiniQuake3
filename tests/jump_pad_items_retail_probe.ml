import mq3.engine.local_qvm_match as match
import mq3.format.bsp as bsp
import mq3.format.pk3 as pk3

function require(ok,label) if not ok then return error(7699,"retail jump-pad items: "+label) end if;return 1 end function
function main(args)
  if len(args)!=2 then return error(7699,"usage: jump_pad_items_retail_probe <pak0.pk3> <qvm-directory>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if;map=bsp.load(pk3.read(archive,"maps/q3dm17.bsp"));if map is error then return map end if
  state=match.bootWithBotsNamed(archive,map,"q3dm17",1000,args[1]);if state is error then return state end if;items=state.context.aiLevelItems.levelItems
  floating=0;reachable=0
  for each item in items
    if item.origin[2]>=700.0 and item.origin[2]<900.0 then floating=floating+1;if item.goalAreaNum>0 then reachable=reachable+1 end if end if
  end for
  count=0;count=count+require(floating==8,"all eight suspended q3dm17 items loaded");count=count+require(reachable==8,"all suspended q3dm17 items have jump-pad reachable areas")
  stopped=try(match.shutdown(state));count=count+require(not (stopped is error),"match shutdown")
  print("PASS: "+str(count)+" q3dm17 suspended-item contracts floating="+str(floating)+" reachable="+str(reachable));return 0
end function
