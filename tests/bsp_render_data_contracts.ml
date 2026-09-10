import mq3.compat.numeric as n
import mq3.format.bsp as bsp
import mq3.renderer.bsp_render_data as render

function require(ok,text) if not ok then return error(7411,text) end if;return 1 end function
function putI(data,offset,value) return n.writeU32(data,offset,value) end function
function putF(data,offset,value) return n.writeU32(data,offset,n.floatBits(value)) end function
function fixture()
  data=bytes(51000,0);offsets=array(17,0);lengths=array(17,0);counts=array(17,0)
  offsets[1]=0;counts[1]=2;lengths[1]=144
  offsets[10]=160;counts[10]=14;lengths[10]=616
  positions=[[0.0,0.0,0.0],[2.0,0.0,0.0],[2.0,2.0,0.0],[0.0,2.0,0.0],[0.0,0.0,3.0],[0.0,0.0,0.0],[1.0,0.0,0.0],[2.0,0.0,0.0],[0.0,1.0,0.0],[1.0,1.0,32.0],[2.0,1.0,0.0],[0.0,2.0,0.0],[1.0,2.0,0.0],[2.0,2.0,0.0]]
  for i=0 to 13
    off=160+i*44
    for axis=0 to 2 putF(data,off+axis*4,positions[i][axis]) end for
    putF(data,off+12,i+0.125);putF(data,off+16,i+0.25);putF(data,off+20,i+0.5);putF(data,off+24,i+0.75)
    data[off+40]=10+i;data[off+41]=20+i;data[off+42]=30+i;data[off+43]=40+i
  end for
  offsets[11]=800;counts[11]=9;lengths[11]=36
  mesh=[0,1,2,0,2,3,0,1,4];for i=0 to 8 putI(data,800+i*4,mesh[i]) end for
  offsets[13]=900;counts[13]=3;lengths[13]=312
  putI(data,900,1);putI(data,900+8,1);putI(data,900+12,0);putI(data,900+16,4);putI(data,900+20,0);putI(data,900+24,6);putI(data,900+28,0)
  putI(data,1004,0);putI(data,1004+8,3);putI(data,1004+12,0);putI(data,1004+16,5);putI(data,1004+20,6);putI(data,1004+24,3);putI(data,1004+28,0xffffffff)
  putI(data,1108,0);putI(data,1108+8,2);putI(data,1108+12,5);putI(data,1108+16,9);putI(data,1108+20,0);putI(data,1108+24,0);putI(data,1108+28,0);putI(data,1108+96,3);putI(data,1108+100,3)
  offsets[14]=1300;counts[14]=1;lengths[14]=49152
  data[1300]=1;data[1301]=2;data[1302]=3;data[1300+49149]=251;data[1300+49150]=252;data[1300+49151]=253
  return bsp.BSP(data,offsets,lengths,counts)
end function

function main(args)
  count=0;map=fixture();result=render.extract(map,[0,1,2],20)
  count=count+require(result.surfaceCount==3,"supported surface count")
  count=count+require(result.triangleCount==11,"triangle count including patch")
  count=count+require(result.skippedSurfaceCount==0,"all renderable surfaces accepted")
  count=count+require(result.patchSurfaceCount==1,"patch surface count")
  count=count+require(len(result.triangles)==11,"all triangles emitted")
  count=count+require(not result.truncated,"complete result")
  first=result.triangles[0]
  count=count+require(first.textureIndex==1,"texture index")
  count=count+require(first.lightmapIndex==0,"lightmap index")
  count=count+require(first.faceIndex==0 and first.triangleIndex==0,"triangle provenance")
  count=count+require(first.vertices[0].position==[0.0,0.0,0.0],"position zero")
  count=count+require(first.vertices[1].position==[2.0,0.0,0.0],"position one")
  count=count+require(first.vertices[2].position==[2.0,2.0,0.0],"position two")
  count=count+require(first.vertices[0].baseUV==[0.125,0.25],"base uv")
  count=count+require(first.vertices[0].lightmapUV==[0.5,0.75],"lightmap uv")
  count=count+require(first.vertices[0].color==[10,20,30,40],"vertex color")
  count=count+require(result.triangles[1].vertices[2].position==[0.0,2.0,0.0],"second triangle winding")
  count=count+require(result.triangles[1].triangleIndex==1,"local triangle index")
  count=count+require(result.triangles[2].textureIndex==0,"soup texture")
  count=count+require(result.triangles[2].lightmapIndex==-1,"unlit soup")
  count=count+require(result.triangles[2].vertices[2].position==[0.0,0.0,3.0],"soup position")
  patch=result.triangles[3]
  count=count+require(patch.faceIndex==2 and patch.textureIndex==0 and patch.lightmapIndex==0,"patch provenance")
  count=count+require(result.triangles[4].vertices[2].position==[1.0,1.0,8.0],"quadratic patch midpoint")
  count=count+require(result.triangles[4].vertices[2].baseUV==[9.125,9.25],"patch base UV interpolation")
  count=count+require(result.triangles[4].vertices[2].lightmapUV==[9.5,9.75],"patch lightmap UV interpolation")
  count=count+require(result.triangles[4].vertices[2].color==[19,29,39,49],"patch vertex-color interpolation")
  coarse=render.extractWithPatchError(map,[2],20,20.0)
  count=count+require(coarse.triangleCount==2,"configurable patch error")
  duplicate=render.extract(map,[1,0,1],20)
  count=count+require(duplicate.surfaceCount==2 and duplicate.triangleCount==3,"duplicate faces removed")
  count=count+require(duplicate.triangles[0].faceIndex==1 and duplicate.triangles[1].faceIndex==0,"caller order retained")
  limited=render.extract(map,[0,1],2)
  count=count+require(len(limited.triangles)==2,"triangle limit exact")
  count=count+require(limited.triangleCount==3 and limited.truncated,"limit records full count")
  zero=render.extract(map,[0],0)
  count=count+require(len(zero.triangles)==0 and zero.triangleCount==2 and zero.truncated,"zero limit")
  empty=render.extract(map,[],10)
  count=count+require(empty.surfaceCount==0 and empty.triangleCount==0 and not empty.truncated,"empty face list")
  all=render.all(map,20)
  count=count+require(all.surfaceCount==3 and all.skippedSurfaceCount==0,"all face helper")
  rgb=render.lightmapRgb(map,0)
  count=count+require(len(rgb)==49152,"RGB lightmap size")
  count=count+require(rgb[0]==1 and rgb[1]==2 and rgb[2]==3,"RGB first pixel")
  count=count+require(rgb[49149]==251 and rgb[49150]==252 and rgb[49151]==253,"RGB last pixel")
  rgba=render.lightmapRgba(map,0)
  count=count+require(len(rgba)==65536,"RGBA lightmap size")
  count=count+require(rgba[0]==1 and rgba[1]==2 and rgba[2]==3 and rgba[3]==255,"RGBA first pixel")
  count=count+require(rgba[65532]==251 and rgba[65533]==252 and rgba[65534]==253 and rgba[65535]==255,"RGBA last pixel")
  count=count+require(try(render.extract(void,[0],1)) is error,"invalid map")
  count=count+require(try(render.extract(map,void,1)) is error,"missing face list")
  count=count+require(try(render.extract(map,[0],-1)) is error,"negative limit")
  count=count+require(try(render.extract(map,[3],1)) is error,"face index bounds")
  count=count+require(try(render.lightmapRgb(map,1)) is error,"lightmap index bounds")
  count=count+require(try(render.extractWithPatchError(map,[2],20,0.0)) is error,"positive patch error required")
  bad=fixture();putI(bad.data,900,2);count=count+require(try(render.extract(bad,[0],10)) is error,"texture index bounds")
  bad=fixture();putI(bad.data,900+28,1);count=count+require(try(render.extract(bad,[0],10)) is error,"lightmap index bounds on face")
  bad=fixture();putI(bad.data,900+28,0xfffffffe);count=count+require(try(render.extract(bad,[0],10)) is error,"negative lightmap lower bound")
  bad=fixture();putI(bad.data,900+24,5);count=count+require(try(render.extract(bad,[0],10)) is error,"mesh count triangle alignment")
  bad=fixture();putI(bad.data,800,4);count=count+require(try(render.extract(bad,[0],10)) is error,"relative meshvert bounds")
  bad=fixture();putI(bad.data,900+12,13);putI(bad.data,900+16,2);count=count+require(try(render.extract(bad,[0],10)) is error,"vertex range bounds")
  bad=fixture();bad.offsets[10]=50980;count=count+require(try(render.extract(bad,[0],10)) is error,"vertex storage bounds")
  bad=fixture();bad.offsets[14]=2000;count=count+require(try(render.lightmapRgb(bad,0)) is error,"lightmap storage bounds")
  bad=fixture();putI(bad.data,1004+20,9);count=count+require(try(render.extract(bad,[0,1],2)) is error,"validation continues after limit")
  bad=fixture();putI(bad.data,1108+96,4);count=count+require(try(render.extract(bad,[2],20)) is error,"patch width must be odd")
  print("PASS: "+str(count)+" BSP render-data contracts")
  return 0
end function
