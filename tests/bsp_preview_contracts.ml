import mq3.compat.numeric as n
import mq3.format.bsp as bsp
import mq3.renderer.bsp_preview as preview

function require(ok,text) if not ok then return error(7405,text) end if;return 1 end function
function putI(data,offset,value) return n.writeU32(data,offset,value) end function
function putF(data,offset,value) return n.writeU32(data,offset,n.floatBits(value)) end function
function fixture()
  data=bytes(800,0);offsets=array(17,0);lengths=array(17,0);counts=array(17,0)
  offsets[10]=0;counts[10]=5;lengths[10]=220
  points=[[0.0,0.0,0.0],[2.0,0.0,0.0],[2.0,2.0,0.0],[0.0,2.0,0.0],[0.0,0.0,3.0]]
  for i=0 to 4 for axis=0 to 2 putF(data,i*44+axis*4,points[i][axis]) end for end for
  offsets[11]=240;counts[11]=9;lengths[11]=36
  mesh=[0,1,2,0,2,3,0,1,4];for i=0 to 8 putI(data,240+i*4,mesh[i]) end for
  offsets[5]=300;counts[5]=3;lengths[5]=12;putI(data,300,0);putI(data,304,1);putI(data,308,0)
  offsets[4]=320;counts[4]=2;lengths[4]=96
  putI(data,320+32,0);putI(data,320+36,2);putI(data,368+32,2);putI(data,368+36,1)
  offsets[13]=440;counts[13]=3;lengths[13]=312
  putI(data,440+8,1);putI(data,440+12,0);putI(data,440+16,4);putI(data,440+20,0);putI(data,440+24,6)
  putI(data,544+8,3);putI(data,544+12,0);putI(data,544+16,5);putI(data,544+20,6);putI(data,544+24,3)
  putI(data,648+8,2);putI(data,648+12,0);putI(data,648+16,4);putI(data,648+20,0);putI(data,648+24,6)
  return bsp.BSP(data,offsets,lengths,counts)
end function

function main(args)
  count=0;map=fixture();faces=preview.visibleFaces(map,[0,1])
  count=count+require(faces==[0,1],"visible faces retain order and deduplicate")
  count=count+require(preview.visibleFaces(map,[1,0])==[0,1],"first occurrence order is deterministic")
  count=count+require(preview.visibleFaces(map,[])==[],"empty visibility set")
  count=count+require(try(preview.visibleFaces(map,[2])) is error,"leaf index bounds")
  p=preview.wireframe(map,[0],100)
  count=count+require(p.surfaceCount==1,"planar surface counted")
  count=count+require(p.triangleCount==2,"planar triangles counted")
  count=count+require(len(p.lines)==5,"shared diagonal deduplicated")
  count=count+require(not p.truncated,"complete result is not truncated")
  count=count+require(p.lines[0].a==[0.0,0.0,0.0],"first endpoint decoded")
  count=count+require(p.lines[0].b==[2.0,0.0,0.0],"second endpoint decoded")
  count=count+require(p.lines[1].a==[2.0,0.0,0.0] and p.lines[1].b==[2.0,2.0,0.0],"edge order")
  count=count+require(p.lines[2].a==[2.0,2.0,0.0] and p.lines[2].b==[0.0,0.0,0.0],"winding retained")
  count=count+require(p.lines[0].face==0 and p.lines[0].triangle==0,"line provenance")
  count=count+require(p.lines[3].triangle==1,"second triangle provenance")
  limited=preview.wireframe(map,[0],3)
  count=count+require(len(limited.lines)==3,"line limit exact")
  count=count+require(limited.truncated,"line limit reports truncation")
  count=count+require(limited.triangleCount==2,"limit still validates all triangles")
  zero=preview.wireframe(map,[0],0)
  count=count+require(len(zero.lines)==0 and zero.truncated,"zero line limit")
  soup=preview.wireframe(map,[1],10)
  count=count+require(soup.surfaceCount==1 and soup.triangleCount==1,"triangle soup accepted")
  count=count+require(len(soup.lines)==3,"triangle soup edges")
  count=count+require(soup.lines[1].b==[0.0,0.0,3.0],"triangle soup vertex coordinates")
  patch=preview.wireframe(map,[2],10)
  count=count+require(patch.surfaceCount==0 and len(patch.lines)==0,"patch omitted")
  all=preview.allFaces(map,20)
  count=count+require(all.surfaceCount==2 and all.triangleCount==3,"all supported faces")
  count=count+require(len(all.lines)==7,"global shared edges deduplicated")
  visible=preview.visibleWireframe(map,[0],20)
  count=count+require(visible.surfaceCount==2 and visible.triangleCount==3,"visible wireframe composition")
  count=count+require(try(preview.wireframe(map,[3],10)) is error,"face bounds")
  count=count+require(try(preview.wireframe(map,[0],-1)) is error,"negative line limit")
  bad=fixture();putI(bad.data,440+24,5)
  count=count+require(try(preview.wireframe(bad,[0],10)) is error,"meshvert count must form triangles")
  bad=fixture();putI(bad.data,240,4)
  count=count+require(try(preview.wireframe(bad,[0],10)) is error,"meshvert constrained to face vertices")
  bad=fixture();putI(bad.data,440+12,4);putI(bad.data,440+16,2)
  count=count+require(try(preview.wireframe(bad,[0],10)) is error,"face vertex range checked")
  bad=fixture();bad.offsets[10]=790
  count=count+require(try(preview.wireframe(bad,[0],10)) is error,"vertex record data checked")
  count=count+require(try(preview.wireframe(void,[0],10)) is error,"invalid map rejected")
  count=count+require(try(preview.wireframe(map,void,10)) is error,"missing face list rejected")
  count=count+require(try(preview.visibleFaces(map,void)) is error,"missing leaf list rejected")
  print("PASS: "+str(count)+" BSP preview contracts")
  return 0
end function
