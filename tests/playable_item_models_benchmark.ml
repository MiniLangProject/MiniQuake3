import mq3.client.playable_item_models as models
import mq3.format.md3 as md3
import mq3.renderer.playable_materials as materials
import mq3.renderer.surface_md3 as mesh
import mq3.platform.playable_window as window

const SIDE=32
const FRAMES=40

function buildAsset()
  packed=[];tex=[]
  for y=0 to SIDE-1
    for x=0 to SIDE-1
      packed=packed+[mesh.vertex(x*64,y*64,(x+y)%5*8,0x40)]
      tex=tex+[[x/(SIDE-1.0),y/(SIDE-1.0)]]
    end for
  end for
  indexes=[]
  for y=0 to SIDE-2
    for x=0 to SIDE-2
      a=y*SIDE+x;b=a+1;c=a+SIDE;d=c+1
      indexes=indexes+[a,b,c,b,d,c]
    end for
  end for
  count=(SIDE-1)*(SIDE-1)*2
  surface=md3.Surface("grid",["textures/grid"],mesh.surface(1,SIDE*SIDE,count,indexes,tex,[packed]))
  model=md3.Model("grid",0,1,0,1,0,[],[],[surface],[[0.0,0.0,0.0],[SIDE*1.0,SIDE*1.0,1.0]])
  image=materials.Image(1,1,bytes(4,255));binding=models.Binding(0,"grid","textures/grid","textures/grid.tga",image,7)
  return models.Asset("grid","benchmark","grid.md3","",model,[binding],models.cacheModelTriangles(model),1.0,0.0,0.0,0.0)
end function

function legacySource(asset)
  return md3.renderTriangles(asset.model,0,0,0,0.0,100000)
end function

function legacyRender(asset,source,value)
  result=array(len(source),void);binding=asset.bindings[0]
  for triangleIndex=0 to len(source)-1
    input=source[triangleIndex];positions=array(3,void);normals=array(3,void)
    for corner=0 to 2
      p=input.positions[corner];px=p[0]*value.scale;py=p[1]*value.scale;pz=p[2]*value.scale
      positions[corner]=[px*value.axis[0][0]+py*value.axis[1][0]+pz*value.axis[2][0]+value.origin[0],px*value.axis[0][1]+py*value.axis[1][1]+pz*value.axis[2][1]+value.origin[1],px*value.axis[0][2]+py*value.axis[1][2]+pz*value.axis[2][2]+value.origin[2]]
      n=input.normals[corner];nx=n[0];ny=n[1];nz=n[2]
      normals[corner]=[nx*value.axis[0][0]+ny*value.axis[1][0]+nz*value.axis[2][0],nx*value.axis[0][1]+ny*value.axis[1][1]+nz*value.axis[2][1],nx*value.axis[0][2]+ny*value.axis[1][2]+nz*value.axis[2][2]]
    end for
    result[triangleIndex]=models.Triangle(positions,input.texCoords,normals,binding.textureSlot,binding.imageName,binding.shaderName,asset.classname,input.surfaceIndex)
  end for
  return result
end function

function sameTriangles(a,b)
  if len(a)!=len(b) then return false end if
  for i=0 to len(a)-1
    if a[i].positions!=b[i].positions or a[i].normals!=b[i].normals or a[i].texCoords!=b[i].texCoords then return false end if
    if a[i].textureSlot!=b[i].textureSlot or a[i].shaderName!=b[i].shaderName or a[i].surfaceIndex!=b[i].surfaceIndex then return false end if
  end for
  return true
end function

function main(args)
  asset=buildAsset();source=legacySource(asset)
  value=models.transform([17.0,-9.0,4.0],models.yawAxis(37.0),1.25)
  legacy=legacyRender(asset,source,value);optimized=models.renderAsset(asset,value,len(source))
  if not sameTriangles(legacy,optimized) then return error(7562,"optimized triangles differ from legacy output") end if
  started=window.milliseconds();total=0
  for frame=0 to FRAMES-1 result=legacyRender(asset,source,value);total=total+len(result) end for
  legacyMs=window.milliseconds()-started
  started=window.milliseconds()
  for frame=0 to FRAMES-1 result=models.renderAsset(asset,value,len(source));total=total+len(result) end for
  optimizedMs=window.milliseconds()-started
  if total!=len(source)*FRAMES*2 then return error(7563,"benchmark output count changed") end if
  print("playable item-model benchmark: triangles="+str(len(source))+" frames="+str(FRAMES)+" legacy_ms="+str(legacyMs)+" optimized_ms="+str(optimizedMs)+" legacy_vertex_transforms="+str(len(source)*3)+" optimized_vertex_transforms="+str(SIDE*SIDE))
  return 0
end function
