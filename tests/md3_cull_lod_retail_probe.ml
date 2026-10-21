import mq3.format.pk3 as pk3
import mq3.format.md3 as md3
import mq3.format.bsp as bsp
import mq3.renderer.qvm_scene_geometry as geometry
import mq3.renderer.scene_queue as scene
import mq3.compat.numeric as n
struct Refdef viewaxis vieworg time fovX fovY flags end struct
function wf(data,at,value) n.writeU32(data,at,n.floatBits(value));return void end function
function payload(origin)
  data=bytes(140,0);n.writeU32(data,8,1);for row=0 to 2 for column=0 to 2 value=0.0;if row==column then value=1.0 end if;wf(data,28+row*12+column*4,value) end for end for;wf(data,68,origin[0]);wf(data,72,origin[1]);wf(data,76,origin[2]);data[116]=255;data[117]=255;data[118]=255;data[119]=255;return data
end function
function triangles(model) count=0;for each surface in model.surfaces count=count+surface.mesh.numTriangles end for;return count end function
function render(asset,origin)
  state=scene.create(1,0);state.registered=true;scene.addEntity(state,0,payload(origin));cache=geometry.createFrameCache(void,64);refdef=Refdef([[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]],[0.0,0.0,0.0],0,90.0,90.0,0)
  return geometry.buildRecordsWithFrameCacheReuseCulledShadowsFogLod(scene.sceneEntities(state),scene.scenePolys(state),["model"],[asset],refdef,8192,cache,void,void,0,void,5.0,0)
end function
function main(args)
  if len(args)!=1 then return error(7695,"usage: md3_cull_lod_retail_probe <pak0.pk3>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,"maps/q3ctf1.bsp"));if map is error then return map end if;if map.counts[13]<=0 then return error(7695,"retail map lacks draw surfaces") end if
  base=md3.load(pk3.read(archive,"models/players/sarge/lower.md3"));if base is error then return base end if
  lod1=md3.load(pk3.read(archive,"models/players/sarge/lower_1.md3"));if lod1 is error then return lod1 end if
  lod2=md3.load(pk3.read(archive,"models/players/sarge/lower_2.md3"));if lod2 is error then return lod2 end if
  asset=geometry.md3Lods([base,lod1,lod2]);baseCount=triangles(base);lod1Count=triangles(lod1);lod2Count=triangles(lod2)
  if not (baseCount>lod1Count and lod1Count>lod2Count and lod2Count>0) then return error(7695,"retail Sarge LOD triangle ordering mismatch") end if
  near=render(asset,[20.0,0.0,0.0]);if near is error then return near end if;far=render(asset,[4000.0,0.0,0.0]);if far is error then return far end if;rear=render(asset,[-200.0,0.0,0.0]);if rear is error then return rear end if
  if near.triangleCount!=baseCount or far.triangleCount!=lod2Count or rear.triangleCount!=0 then return error(7695,"productive retail LOD/cull selection mismatch") end if
  print("PASS: retail MD3 LOD/cull mapSurfaces="+str(map.counts[13])+" triangles="+str(baseCount)+"/"+str(lod1Count)+"/"+str(lod2Count));return 0
end function
