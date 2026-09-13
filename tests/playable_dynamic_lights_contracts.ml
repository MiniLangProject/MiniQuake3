import mq3.renderer.playable_dynamic_lights as lights
import mq3.compat.numeric as n

struct Vertex position end struct
struct Triangle vertices textureIndex end struct
struct RenderData triangles end struct
function require(ok,text) if not ok then return error(7631,text) end if;return 1 end function
function near(a,b) d=a-b;if d<0.0 then d=0.0-d end if;return d<0.00001 end function

function main(args)
  count=0;image=lights.textureImage();count=count+require(image.width==16 and image.height==16 and len(image.pixels)==1024,"Baseq3 dlight texture is 16 by 16 RGBA")
  brightness=0;for texel=0 to 255 brightness=brightness+image.pixels[texel*4] end for
  count=count+require(brightness==27600 and image.pixels[0]==0 and image.pixels[(7*16+7)*4]==255,"inverse-square dlight texels match Baseq3")
  catalog=lights.createCatalog(320);count=count+require(catalog.textureSlot==320,"dlight texture reserves its native slot")
  light=lights.Light([0.0,0.0,0.0],10.0,[1.0,0.5,0.25],false);center=lights.vertex(light,[0.0,0.0,0.0]);count=count+require(center.uv==[0.5,0.5] and center.color==[255,127,63,255] and center.clip==0,"center vertex receives full projected light")
  edge=lights.vertex(light,[0.0,0.0,7.5]);count=count+require(edge.color==[127,63,31,255],"outer Z half fades linearly")
  outside=lights.vertex(light,[20.0,0.0,0.0]);count=count+require((outside.clip & 1)!=0,"outside projected S coordinate sets clip bit")
  a=Vertex([0.0,0.0,0.0]);b=Vertex([1.0,0.0,0.0]);c=Vertex([0.0,1.0,0.0]);farA=Vertex([20.0,0.0,0.0]);farB=Vertex([21.0,0.0,0.0]);farC=Vertex([20.0,1.0,0.0])
  batch=lights.build(RenderData([Triangle([a,b,c],1),Triangle([farA,farB,farC],1),Triangle([a,b,c],2)]),[false,true,false]);count=count+require(len(batch.triangles)==2,"receive flags exclude sky, translucent and nodlight surfaces")
  updated=lights.update(batch,catalog,light);count=count+require(updated==1 and n.readI32(batch.commands.data,0)==320,"shared clip bits reject fully outside triangles")
  count=count+require(near(n.bitsFloat(n.readU32(batch.commands.data,32)),0.5) and near(n.bitsFloat(n.readU32(batch.commands.data,36)),0.5) and batch.commands.data[116]==255 and batch.commands.data[117]==127,"retained command carries projected UV and light color")
  print("PASS: "+str(count)+" playable dynamic-light contracts");return 0
end function
