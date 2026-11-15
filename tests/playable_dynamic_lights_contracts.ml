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
  axis=[[0.0,1.0,0.0],[-1.0,0.0,0.0],[0.0,0.0,1.0]];origin=[10.0,20.0,0.0]
  local=lights.localPoint([7.0,22.0,0.0],origin,axis);count=count+require(local==[2.0,3.0,0.0],"R_DlightBmodel inverse orientation transforms world lights into brush coordinates")
  bounds=[[-1.0,-1.0,-1.0],[1.0,1.0,1.0]];edgeLight=lights.Light([10.0,22.0,0.0],1.0,[1.0,1.0,1.0],false);count=count+require(lights.affectsBounds(edgeLight,origin,axis,bounds),"R_DlightBmodel includes a light exactly one radius beyond local bounds")
  outsideLight=lights.Light([10.0,22.01,0.0],1.0,[1.0,1.0,1.0],false);count=count+require(not lights.affectsBounds(outsideLight,origin,axis,bounds),"R_DlightBmodel rejects a light beyond expanded local bounds")
  orientedData=RenderData([Triangle([Vertex([10.0,20.0,0.0]),Vertex([10.0,21.0,0.0]),Vertex([9.0,20.0,0.0])],1)]);oriented=lights.buildOriented(orientedData,[false,true],[origin],[axis],[bounds]);if oriented is error then return oriented end if
  orientedCount=lights.update(oriented,catalog,lights.Light([7.0,22.0,0.0],10.0,[1.0,1.0,1.0],false));ou=n.bitsFloat(n.readU32(oriented.commands.data,32));ov=n.bitsFloat(n.readU32(oriented.commands.data,36));count=count+require(orientedCount==1 and near(ou,0.7) and near(ov,0.8),"rotated brush dlight projection uses local S/T while retaining world vertices")
  sources=array(4096,void);sourceOrigins=array(4096,void);sourceAxes=array(4096,void);sourceBounds=array(4096,void)
  for index=0 to 4095
    sources[index]=Triangle([Vertex([index*1.0,0.0,0.0]),b,c],index%4-1);sourceOrigins[index]=[index*1.0,2.0,3.0];sourceAxes[index]=axis;sourceBounds[index]=bounds
  end for
  many=lights.build(RenderData(sources),[true,false]);manyOriented=lights.buildOriented(RenderData(sources),[true,false],sourceOrigins,sourceAxes,sourceBounds)
  ordered=len(many.triangles)==1024 and many.commands.capacity==1024 and len(manyOriented.triangles)==1024
  for index=0 to 1023
    sourceIndex=index*4+1
    ordered=ordered and many.triangles[index].vertices[0].position[0]==sourceIndex and manyOriented.triangles[index].vertices[0].position[0]==sourceIndex and manyOriented.origins[index]==sourceOrigins[sourceIndex] and manyOriented.axes[index]==sourceAxes[sourceIndex] and manyOriented.bounds[index]==sourceBounds[sourceIndex]
  end for
  count=count+require(ordered,"large filtered world/oriented builders retain triangle order and aligned origin/axis/bounds")
  empty=lights.build(RenderData(sources),[false,false]);emptyOriented=lights.buildOriented(RenderData(sources),[false,false],sourceOrigins,sourceAxes,sourceBounds)
  count=count+require(len(empty.triangles)==0 and empty.commands.capacity==1 and len(emptyOriented.triangles)==0 and len(emptyOriented.origins)==0 and emptyOriented.commands.capacity==1,"empty filtered world/oriented builders preserve valid minimum command capacity")
  print("PASS: "+str(count)+" playable dynamic-light contracts");return 0
end function
