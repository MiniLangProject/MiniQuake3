import mq3.renderer.mark_fragments as marks
import mq3.renderer.bsp_render_data as renderData
import mq3.collision.world as collision
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.compat.numeric as n

function dot(a,b) return a[0]*b[0]+a[1]*b[1]+a[2]*b[2] end function
function cross(a,b) return [a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]] end function
function normalize(value) length=n.fsqrt(dot(value,value));if length<=0.0 then return [0.0,0.0,0.0] end if;return [value[0]/length,value[1]/length,value[2]/length] end function
function scaled(origin,a,amount,b,other) return [origin[0]+a[0]*amount+b[0]*other,origin[1]+a[1]*amount+b[1]*other,origin[2]+a[2]*amount+b[2]*other] end function
function main(args)
  if len(args)!=1 then print("usage: mark_fragments_retail_probe <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if;map=bsp.load(pk3.read(archive,"maps/q3dm1.bsp"));if map is error then return map end if
  world=collision.load(map.data);if world is error then return world end if;geometry=renderData.all(map,30000);if geometry is error then return geometry end if
  attempts=0
  for each triangle in geometry.triangles
    faceAt=map.offsets[13]+triangle.faceIndex*104;if n.readI32(map.data,faceAt+8)!=renderData.MST_PLANAR then continue end if
    normal=normalize(triangle.vertices[0].normal);tangent=normalize(cross([0.0,0.0,1.0],normal));if tangent==[0.0,0.0,0.0] then tangent=[1.0,0.0,0.0] end if;bitangent=normalize(cross(normal,tangent))
    center=[(triangle.vertices[0].position[0]+triangle.vertices[1].position[0]+triangle.vertices[2].position[0])/3.0+normal[0]*0.25,(triangle.vertices[0].position[1]+triangle.vertices[1].position[1]+triangle.vertices[2].position[1])/3.0+normal[1]*0.25,(triangle.vertices[0].position[2]+triangle.vertices[1].position[2]+triangle.vertices[2].position[2])/3.0+normal[2]*0.25]
    points=[scaled(center,tangent,-2.0,bitangent,-2.0),scaled(center,tangent,-2.0,bitangent,2.0),scaled(center,tangent,2.0,bitangent,2.0),scaled(center,tangent,2.0,bitangent,-2.0)]
    projection=[-20.0*normal[0],-20.0*normal[1],-20.0*normal[2]];result=marks.project(map,world,points,projection,384,128);if result is error then return result end if;attempts=attempts+1
    if len(result.fragments)>0 then print("PASS: retail q3dm1 mark fragments="+str(len(result.fragments))+" points="+str(len(result.points))+" candidates="+str(result.candidateSurfaces)+" attempts="+str(attempts));return 0 end if
    if attempts>=64 then break end if
  end for
  return error(7695,"no retail q3dm1 planar mark fragment found")
end function
