import mq3.renderer.qvm_scene_geometry as geometry
import mq3.renderer.scene_queue as scene
import mq3.renderer.surface_md3 as mesh
import mq3.renderer.playable_light_grid as lightGrid
import mq3.format.md3 as md3
import mq3.compat.numeric as n

struct Refdef viewaxis end struct
function req(value,label) if not value then return error(7679,"QVM scene geometry contract: "+label) end if;return 1 end function
function wf(data,at,value) n.writeU32(data,at,n.floatBits(value));return void end function
function basePayload(origin)
  data=bytes(140,0);n.writeU32(data,8,1)
  for row=0 to 2 for column=0 to 2 value=0.0;if row==column then value=1.0 end if;wf(data,28+row*12+column*4,value) end for end for
  wf(data,68,origin[0]);wf(data,72,origin[1]);wf(data,76,origin[2]);n.writeU32(data,80,0);n.writeU32(data,96,0);wf(data,100,0.0)
  data[116]=10;data[117]=20;data[118]=30;data[119]=40;return data
end function
function fixtureModel()
  packed=[[mesh.vertex(64,0,0,0),mesh.vertex(0,64,0,0),mesh.vertex(0,0,64,0)]]
  surface=md3.Surface("unit",["models/unit"],mesh.surface(1,3,1,[0,1,2],[[0.0,0.0],[1.0,0.0],[0.0,1.0]],packed))
  frame=md3.Frame([-1.0,-1.0,-1.0],[1.0,1.0,1.0],[0.0,0.0,0.0],2.0,"frame0")
  return md3.Model("unit.md3",0,1,0,1,0,[frame],[[]],[surface],[[-1.0,-1.0,-1.0],[1.0,1.0,1.0]])
end function
function main(args)
  count=0;state=scene.create(8,64);state.registered=true;state.worldLoaded=true
  modelPayload=basePayload([10.0,20.0,30.0]);scene.addEntity(state,0,modelPayload)
  spritePayload=basePayload([2.0,3.0,4.0]);n.writeU32(spritePayload,8,0);n.writeU32(spritePayload,112,9);wf(spritePayload,132,2.0);wf(spritePayload,136,0.0);scene.addEntity(state,2,spritePayload)
  verts=[scene.PolyVert([0.0,0.0,0.0],[0.0,0.0],[255,0,0,255]),scene.PolyVert([1.0,0.0,0.0],[1.0,0.0],[0,255,0,255]),scene.PolyVert([0.0,1.0,0.0],[0.0,1.0],[0,0,255,255])]
  scene.addPolys(state,7,3,verts,1);refdef=Refdef([[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]])
  output=geometry.build(state,["model"],[fixtureModel()],refdef,8);if output is error then return output end if
  count=count+req(output.modelEntities==1 and output.spriteEntities==1 and output.polySurfaces==1,"submission counts")
  count=count+req(len(output.triangles)==4,"expanded triangle count")
  count=count+req(output.triangles[0].positions[0]==[11.0,20.0,30.0],"model entity transform")
  count=count+req(output.triangles[0].texCoords[1]==[1.0,0.0] and output.triangles[0].shaderName=="models/unit","MD3 surface material")
  count=count+req(output.triangles[0].colors==[[10,20,30,40],[10,20,30,40],[10,20,30,40]] and output.triangles[0].surfaceName=="unit" and output.triangles[0].modelHandle==1,"entity colors, surface and handle")
  count=count+req(output.triangles[1].shaderHandle==9 and output.triangles[1].positions[0]==[2.0,5.0,6.0],"camera-facing sprite")
  count=count+req(output.triangles[3].shaderHandle==7 and output.triangles[3].positions[2]==[0.0,1.0,0.0] and output.triangles[3].colors==[[255,0,0,255],[0,255,0,255],[0,0,255,255]],"polygon fan retains vertex colors")
  count=count+req(output.skippedInline==0 and output.skippedUnsupported==0,"no skipped supported geometry")
  bad=scene.create(1,0);bad.registered=true;n.writeU32(modelPayload,80,2);scene.addEntity(bad,0,modelPayload)
  count=count+req(try(geometry.build(bad,["model"],[fixtureModel()],refdef,8)) is error,"invalid animation rejected")
  count=count+req(try(geometry.build(state,["model"],[fixtureModel()],refdef,-1)) is error,"negative triangle limit rejected")
  count=count+req(try(geometry.createFrameCache(void,0)) is error,"frame cache capacity validated")
  cachedState=scene.create(2,0);cachedState.registered=true;cachedState.worldLoaded=true;cachedA=basePayload([1.0,2.0,3.0]);cachedB=basePayload([4.0,5.0,6.0]);scene.addEntity(cachedState,0,cachedA);scene.addEntity(cachedState,0,cachedB)
  cache=geometry.createFrameCache(void,8);cached=geometry.buildRecordsWithFrameCache(scene.sceneEntities(cachedState),scene.scenePolys(cachedState),["model"],[fixtureModel()],refdef,8,cache,void);if cached is error then return cached end if
  count=count+req(len(cached.triangles)==2 and cached.triangles[0].positions[0]==[2.0,2.0,3.0] and cached.triangles[1].positions[0]==[5.0,5.0,6.0],"cached geometry remains entity-local")
  count=count+req(cache.misses==1 and cache.hits==1,"equal model frames share interpolation")
  count=count+req(cached.sourceVertices==6 and cached.vertexTransforms==6,"unique surface vertices transformed once per entity")
  count=count+req(cache.transformMisses==2 and cache.transformHits==0,"different entity transforms receive distinct cache entries")
  repeated=geometry.buildRecordsWithFrameCache(scene.sceneEntities(cachedState),scene.scenePolys(cachedState),["model"],[fixtureModel()],refdef,8,cache,void);if repeated is error then return repeated end if
  same=len(repeated.triangles)==len(cached.triangles) and repeated.triangles[0].positions==cached.triangles[0].positions and repeated.triangles[0].normals==cached.triangles[0].normals and repeated.triangles[1].positions==cached.triangles[1].positions and repeated.triangles[1].texCoords==cached.triangles[1].texCoords
  count=count+req(cache.misses==1 and cache.hits==3 and same,"persistent cache is bit-identical")
  count=count+req(cache.transformMisses==2 and cache.transformHits==2,"persistent transform cache reuses both entities")
  reused=geometry.buildRecordsWithFrameCacheReuse(scene.sceneEntities(cachedState),scene.scenePolys(cachedState),["model"],[fixtureModel()],refdef,8,cache,void,repeated);if reused is error then return reused end if
  count=count+req(reused==repeated and reused.triangles[0].positions[0]==[2.0,2.0,3.0] and reused.triangles[1].positions[0]==[5.0,5.0,6.0],"retained geometry storage preserves exact model output")
  transform=geometry.TransformEntry(1,0,0,0,0.0,[0.0,0.0,0.0],refdef.viewaxis,[[0.0,0.0,0.0]],[[1.0,0.0,0.0]],void,void,void,-1,void)
  sampleA=lightGrid.Sample([10.0,20.0,30.0],[100.0,0.0,0.0],[1.0,0.0,0.0],1.0);colorsA=geometry.cachedVertexColors(transform,sampleA,200);colorsAgain=geometry.cachedVertexColors(transform,sampleA,200)
  count=count+req(colorsA==[[110,20,30,200]] and colorsAgain==colorsA,"identical entity lighting reuses byte-identical vertex colors")
  sampleB=lightGrid.Sample([20.0,20.0,30.0],[0.0,0.0,0.0],[1.0,0.0,0.0],1.0);colorsB=geometry.cachedVertexColors(transform,sampleB,201)
  count=count+req(colorsB==[[20,20,30,201]] and colorsA==[[110,20,30,200]],"changed lighting creates new colors without mutating an older view")
  print "PASS: "+str(count)+" QVM scene geometry contracts";return 0
end function
