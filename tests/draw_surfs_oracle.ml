import mq3.renderer.draw_surfs as draw

function packed(shaderIndex,entityNum,fogNum,dlightMap)
  queue=draw.createDefault();draw.add(queue,0,shaderIndex,entityNum,fogNum,dlightMap)
  item=queue.drawSurfs[0];fields=draw.decompose(item.sort)
  print("P|"+str(shaderIndex)+"|"+str(entityNum)+"|"+str(fogNum)+"|"+str(dlightMap)+"|"+str(item.sort)+"|"+str(fields.shaderIndex)+"|"+str(fields.entityNum)+"|"+str(fields.fogNum)+"|"+str(fields.dlightMap))
end function

function main(args)
  packed(0,0,0,0);packed(1,2,3,1);packed(91,777,19,2);packed(16383,1023,31,3)
  keys=[393216,0,131071,131072,15,14,2097152,524416,524288,262271,262144,4];items=[]
  for i=0 to len(keys)-1 items=items+[draw.DrawSurf(keys[i],i,i)] end for
  items=draw.sortStable(items);line="Q"
  for each item in items line=line+"|"+str(item.sort)+":"+str(item.surface) end for
  print(line);return 0
end function
