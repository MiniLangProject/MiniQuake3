import mq3.renderer.qvm_scene_geometry as geometry
import mq3.renderer.scene_queue as scene
import mq3.renderer.surface_md3 as mesh
import mq3.renderer.view_math as viewMath
import mq3.format.md3 as md3
import mq3.compat.numeric as numeric
import mq3.platform.playable_window as window

const SIDE=32
const ENTITIES=12
const FRAMES=8
struct Refdef viewaxis flags end struct

function wf(data,at,value) numeric.writeU32(data,at,numeric.floatBits(value));return void end function
function payload(x)
  data=bytes(140,0);numeric.writeU32(data,8,1);for row=0 to 2 for column=0 to 2 value=0.0;if row==column then value=1.0 end if;wf(data,28+row*12+column*4,value) end for end for
  wf(data,68,x);numeric.writeU32(data,80,0);numeric.writeU32(data,96,0);data[116]=255;data[117]=255;data[118]=255;data[119]=255;return data
end function
function model()
  packed=[];tex=[]
  for y=0 to SIDE-1 for x=0 to SIDE-1 packed=packed+[mesh.vertex(x*8,y*8,(x+y)%3,0x40)];tex=tex+[[x/(SIDE-1.0),y/(SIDE-1.0)]] end for end for
  indexes=[];for y=0 to SIDE-2 for x=0 to SIDE-2 a=y*SIDE+x;b=a+1;c=a+SIDE;d=c+1;indexes=indexes+[a,b,c,b,d,c] end for end for
  count=(SIDE-1)*(SIDE-1)*2;surface=md3.Surface("grid",["textures/grid"],mesh.surface(1,SIDE*SIDE,count,indexes,tex,[packed]));frame=md3.Frame([0.0,0.0,0.0],[32.0,32.0,1.0],[0.0,0.0,0.0],32.0,"frame0")
  return md3.Model("grid.md3",0,1,0,1,0,[frame],[[]],[surface],[[0.0,0.0,0.0],[32.0,32.0,1.0]])
end function
function legacyPass(state,value,normalTable)
  checksum=0.0
  for each raw in scene.sceneEntities(state)
    entity=scene.decodeEntity(raw);source=md3.renderTrianglesCached(value,0,entity.frame,entity.oldframe,entity.backlerp,8192,normalTable);orientation=viewMath.orientation(entity.origin,entity.axis)
    for each triangle in source for corner=0 to 2 point=viewMath.localPointToWorld(triangle.positions[corner],orientation);normal=viewMath.localNormalToWorld(triangle.normals[corner],orientation);checksum=checksum+point[0]+normal[0] end for end for
  end for
  return checksum
end function
function optimizedPass(state,value,refdef,cache)
  built=geometry.buildRecordsWithFrameCache(scene.sceneEntities(state),scene.scenePolys(state),["model"],[value],refdef,8192,cache,void);if built is error then return built end if
  checksum=0.0;for each triangle in built.triangles for corner=0 to 2 checksum=checksum+triangle.positions[corner][0]+triangle.normals[corner][0] end for end for
  return [checksum,built]
end function
function main(args)
  value=model();state=scene.create(ENTITIES,0);state.registered=true;state.worldLoaded=true;for index=0 to ENTITIES-1 scene.addEntity(state,0,payload(index*3.0)) end for
  refdef=Refdef([[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]],1);normalTable=geometry.createNormalTable();cache=geometry.createFrameCache(normalTable,16)
  legacy=legacyPass(state,value,normalTable);optimized=optimizedPass(state,value,refdef,cache);if optimized is error then return optimized end if
  delta=legacy-optimized[0];if delta<0.0 then delta=0.0-delta end if;if delta>0.001 then return error(7678,"optimized geometry changed output") end if
  started=window.milliseconds();for frame=0 to FRAMES-1 legacy=legacyPass(state,value,normalTable) end for;legacyMs=window.milliseconds()-started
  started=window.milliseconds();for frame=0 to FRAMES-1 optimized=optimizedPass(state,value,refdef,cache) end for;optimizedMs=window.milliseconds()-started
  triangleCount=(SIDE-1)*(SIDE-1)*2*ENTITIES;legacyTransforms=triangleCount*3;optimizedTransforms=SIDE*SIDE*ENTITIES
  if optimized[1].vertexTransforms!=optimizedTransforms or cache.misses!=1 then return error(7678,"optimized work counters changed") end if
  print("QVM geometry benchmark: triangles="+str(triangleCount)+" frames="+str(FRAMES)+" legacy_ms="+str(legacyMs)+" optimized_ms="+str(optimizedMs)+" legacy_vertex_transforms="+str(legacyTransforms)+" optimized_vertex_transforms="+str(optimizedTransforms)+" cache_hits="+str(cache.hits)+" cache_misses="+str(cache.misses));return 0
end function
