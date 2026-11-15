import mq3.renderer.playable_fog as fog
import mq3.compat.numeric as n

struct Vertex position end struct
struct Triangle vertices fogIndex end struct
struct RenderData triangles end struct

function require(ok,text) if not ok then return error(7621,text) end if;return 1 end function
function near(a,b,tolerance) difference=a-b;if difference<0.0 then difference=0.0-difference end if;return difference<tolerance end function
function main(args)
  count=0;volume=fog.Fog("fog",[0.25,0.5,0.75],100.0,1.0/800.0,[[-10.0,-10.0,-10.0],[10.0,10.0,10.0]],[0.0,0.0,0.0,0.0],false)
  count=count+require(fog.fogFactor(0.0,31.0/32.0)==0.0,"negative adjusted distance has no fog")
  count=count+require(near(fog.fogFactor(0.125+1.0/512.0,31.0/32.0),1.0,0.0001),"opaque depth reaches full fog")
  count=count+require(near(fog.density(volume,[25.0,0.0,0.0],[0.0,0.0,0.0],[1.0,0.0,0.0]),0.5,0.01),"quarter opaque distance follows square-root fog table")
  count=count+require(fog.density(volume,[100.0,0.0,0.0],[0.0,0.0,0.0],[1.0,0.0,0.0])>0.999,"opaque distance clamps")
  clipped=fog.Fog("clip",[1.0,0.0,0.0],100.0,1.0/800.0,[[-10.0,-10.0,-10.0],[10.0,10.0,10.0]],[1.0,0.0,0.0,0.0],true)
  count=count+require(fog.density(clipped,[-5.0,0.0,0.0],[-10.0,0.0,0.0],[1.0,0.0,0.0])==0.0,"point outside clipped fog has no density")
  image=fog.textureImage();count=count+require(image.width==256 and image.height==32 and len(image.pixels)==32768,"retail fog lookup has 256 by 32 RGBA texels")
  count=count+require(image.pixels[3]==0 and image.pixels[len(image.pixels)-1]==255 and image.pixels[0]==255,"fog lookup preserves transparent near and opaque far texels")
  alphaSum=0;for texel=0 to 256*32-1 alphaSum=alphaSum+image.pixels[texel*4+3] end for;count=count+require(alphaSum==1709140,"fog lookup matches the Baseq3 alpha-table checksum")
  catalog=fog.Catalog([void,volume],-1,image);count=count+require(fog.assignTexture(catalog,319)==1 and catalog.textureSlot==319,"fog lookup receives a retained texture slot")
  a=Vertex([25.0,0.0,0.0]);b=Vertex([25.0,1.0,0.0]);c=Vertex([25.0,0.0,1.0]);batch=fog.build(RenderData([Triangle([a,b,c],1)]),catalog)
  count=count+require(batch.commands.count==1 and len(batch.sourcePositions)==1,"fogged triangle becomes a retained overlay")
  fog.update(batch,catalog,[0.0,0.0,0.0],[1.0,0.0,0.0]);count=count+require(n.readI32(batch.commands.data,0)==319 and batch.commands.data[116]==63 and batch.commands.data[117]==127 and batch.commands.data[118]==191 and batch.commands.data[119]==255,"fog overlay binds lookup and writes opaque retail vertex color")
  count=count+require(near(n.bitsFloat(n.readU32(batch.commands.data,32)),25.0/800.0+1.0/512.0,0.00001) and near(n.bitsFloat(n.readU32(batch.commands.data,36)),31.0/32.0,0.00001),"fog overlay writes view-dependent lookup coordinates")
  sources=array(4096,void)
  for index=0 to 4095 sources[index]=Triangle([Vertex([index*1.0,0.0,0.0]),b,c],index%4-1) end for
  many=fog.build(RenderData(sources),catalog);ordered=many.commands.count==1024 and many.commands.capacity==1024 and len(many.sourcePositions)==1024 and len(many.fogIndexes)==1024
  for index=0 to 1023 ordered=ordered and many.sourcePositions[index][0][0]==index*4+2 and many.fogIndexes[index]==1 end for
  count=count+require(ordered,"large fog builder filters invalid volumes while retaining source triangle order and matching fog indexes")
  empty=fog.build(RenderData([Triangle([a,b,c],0),Triangle([a,b,c],2)]),catalog)
  count=count+require(empty.commands.count==0 and empty.commands.capacity==1 and len(empty.sourcePositions)==0 and len(empty.fogIndexes)==0,"empty fog filter preserves minimum command capacity without retained positions")
  print("PASS: "+str(count)+" playable fog contracts");return 0
end function
