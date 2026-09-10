import mq3.client.playable_projectile_models as models
import mq3.client.playable_projectile_view as view
import mq3.client.playable_item_models as itemModels
import mq3.client.playable_viewer as viewer
import mq3.format.md3 as md3
import mq3.renderer.playable_materials as materials
import mq3.renderer.surface_md3 as mesh

function require(ok,text) if not ok then return error(7601,text) end if;return 1 end function
function near(a,b) d=a-b;if d<0.0 then d=0.0-d end if;return d<0.002 end function

function modelAsset(style)
  packed=[[mesh.vertex(64,0,0,0x40),mesh.vertex(0,64,0,0x40),mesh.vertex(0,0,64,0x40)]]
  surface=md3.Surface("body",["textures/projectile/body"],mesh.surface(1,3,1,[0,1,2],[[0.0,0.0],[1.0,0.0],[0.0,1.0]],packed))
  model=md3.Model("projectile",0,1,0,1,0,[],[],[surface],[[-1.0,-1.0,-1.0],[1.0,1.0,1.0]])
  image=materials.Image(1,1,bytes(4,255));binding=itemModels.Binding(0,"body","textures/projectile/body","textures/projectile/body.tga",image,12)
  backing=itemModels.Asset("projectile","projectile","test.md3","",model,[binding],itemModels.cacheModelTriangles(model),1.0,0.0,0.0,0.0)
  return models.Asset(style,models.KIND_MODEL,"test.md3","",backing,-1,"",void,0.0)
end function

function spriteAsset()
  image=materials.Image(2,2,bytes(16,255))
  return models.Asset(view.STYLE_PLASMA,models.KIND_SPRITE,"","sprites/plasma1",void,20,"sprites/plasmaa.jpg",image,16.0)
end function

function catalog(assets)
  return models.Catalog(assets,[],void,0,20,8,[])
end function

function main(args)
  count=0
  count=count+require(models.definition(view.STYLE_ROCKET).modelPath=="models/ammo/rocket/rocket.md3","rocket retail MD3")
  count=count+require(models.definition(view.STYLE_PLASMA).shaderName=="sprites/plasma1" and models.definition(view.STYLE_PLASMA).kind==models.KIND_SPRITE,"plasma retail sprite")
  count=count+require(near(models.definition(view.STYLE_PLASMA).radius,16.0),"plasma retail radius")
  count=count+require(models.definition(view.STYLE_GRENADE).modelPath=="models/ammo/grenade1.md3","grenade retail MD3")
  count=count+require(models.definition(view.STYLE_BFG).modelPath=="models/weaphits/bfg.md3","BFG retail MD3")
  count=count+require(models.definition(99)==void,"unsupported style")
  count=count+require(models.definition(view.STYLE_ROCKET).expectedTextures==4 and models.definition(view.STYLE_BFG).expectedTextures==2,"declared slot needs")

  rocket=modelAsset(view.STYLE_ROCKET);plasma=spriteAsset();assets=catalog([rocket,plasma])
  count=count+require(models.find(assets,view.STYLE_ROCKET)==rocket and models.find(assets,view.STYLE_GRENADE)==void,"catalog lookup")
  count=count+require(models.containsStyle([view.STYLE_ROCKET,view.STYLE_BFG],view.STYLE_BFG),"style set hit")
  count=count+require(not models.containsStyle([view.STYLE_ROCKET],view.STYLE_PLASMA),"style set miss")
  models.appendFallback(assets,view.STYLE_BFG);models.appendFallback(assets,view.STYLE_BFG)
  count=count+require(len(assets.skipped)==1,"fallback styles unique")

  moving=view.flying(7,view.STYLE_ROCKET,[0.0,0.0,0.0],[10.0,0.0,0.0],0)
  axis=models.snapshotAxis(moving,0)
  count=count+require(near(axis[0][0],1.0) and near(axis[0][1],0.0),"travel direction becomes forward axis")
  count=count+require(near(axis[1][0],0.0) and near(axis[2][0],0.0),"perpendicular missile axes")
  count=count+require(near(axis[1][1]*axis[2][2]-axis[1][2]*axis[2][1],axis[0][0]),"right-handed missile basis")
  spun=models.snapshotAxis(moving,1000)
  count=count+require(not near(spun[1][1],axis[1][1]),"cg.time divided by four roll")
  stationary=view.flying(8,view.STYLE_ROCKET,[2.0,3.0,4.0],[2.0,3.0,4.0],0)
  stationaryAxis=models.snapshotAxis(stationary,0)
  count=count+require(stationaryAxis[0]==[0.0,0.0,1.0],"stationary missile points upward")
  count=count+require(try(models.snapshotAxis(moving,-1)) is error,"negative orientation time rejected")

  camera=viewer.camera([0.0,0.0,0.0],0.0,0.0,320.0,0.1)
  rendered=models.renderSnapshot(assets,moving,camera,0,10)
  count=count+require(not rendered.fallback and len(rendered.triangles)==1,"MD3 snapshot triangle")
  count=count+require(rendered.triangles[0].style==view.STYLE_ROCKET and rendered.triangles[0].textureSlot==12,"MD3 material metadata")
  count=count+require(near(rendered.triangles[0].positions[0][0],11.0),"MD3 placed and travel-oriented")
  count=count+require(len(models.renderSnapshot(assets,moving,camera,0,0).triangles)==0,"zero model triangle budget")

  plasmaShot=view.flying(9,view.STYLE_PLASMA,[90.0,0.0,0.0],[100.0,0.0,0.0],0)
  plasmaRendered=models.renderSnapshot(assets,plasmaShot,camera,0,2)
  count=count+require(not plasmaRendered.fallback and len(plasmaRendered.triangles)==2,"plasma billboard triangles")
  count=count+require(plasmaRendered.triangles[0].shaderName=="sprites/plasma1" and plasmaRendered.triangles[0].imageName=="sprites/plasmaa.jpg","plasma shader image retained")
  count=count+require(plasmaRendered.triangles[0].textureSlot==20,"plasma texture slot")
  p=plasmaRendered.triangles[0].positions[0]
  count=count+require(near(p[0],100.0) and near(p[1],16.0) and near(p[2],-16.0),"camera-facing 16-unit plasma corners")
  count=count+require(models.renderSnapshot(assets,plasmaShot,camera,0,1).fallback,"incomplete sprite budget falls back")
  count=count+require(try(models.renderSnapshot(assets,plasmaShot,void,0,2)) is error,"plasma requires camera")

  missing=view.flying(10,view.STYLE_GRENADE,[0.0,0.0,0.0],[1.0,0.0,0.0],0)
  count=count+require(models.renderSnapshot(assets,missing,camera,0,10).fallback,"missing asset uses effect fallback")
  impact=view.defaultImpact(11,view.STYLE_ROCKET,[1.0,0.0,0.0],[0.0,0.0,1.0],0)
  count=count+require(models.renderSnapshot(assets,impact,camera,100,10).fallback,"impact remains effect fallback")
  count=count+require(try(models.renderSnapshot(assets,moving,camera,0,-1)) is error,"negative budget rejected")
  count=count+require(try(models.renderSnapshot(assets,moving,camera,0,models.MAX_TRIANGLES_PER_PROJECTILE+1)) is error,"oversize budget rejected")

  batch=models.renderSnapshots(assets,[moving,plasmaShot,missing],camera,0,2,3)
  count=count+require(len(batch.triangles)==3,"whole-frame projectile budget")
  count=count+require(len(batch.fallbackSnapshots)==1 and batch.fallbackSnapshots[0].style==view.STYLE_GRENADE,"batch fallback snapshots")
  count=count+require(try(models.renderSnapshots(assets,[],camera,0,-1,1)) is error,"negative batch budget rejected")

  print("PASS: "+str(count)+" playable projectile-model contracts");return 0
end function
