import mq3.client.playable_item_models as models
import mq3.format.md3 as md3
import mq3.renderer.playable_materials as materials
import mq3.renderer.player_skins as skins
import mq3.renderer.surface_md3 as mesh

struct FakeItem classname origin active end struct

function require(ok,text) if not ok then return error(7561,text) end if;return 1 end function
function near(a,b) d=a-b;if d<0.0 then d=0.0-d end if;return d<0.001 end function

function surface(name,shader,offset)
  packed=[[mesh.vertex(offset+64,0,0,0x40),mesh.vertex(offset,64,0,0x40),mesh.vertex(offset,0,64,0x40),mesh.vertex(offset+64,64,0,0x40)]]
  data=mesh.surface(1,4,2,[0,1,2,1,3,2],[[0.0,0.0],[1.0,0.0],[0.0,1.0],[1.0,1.0]],packed)
  return md3.Surface(name,[shader],data)
end function

function asset(classname)
  one=surface("body","textures/item/body",0);two=surface("glow","textures/item/glow",64)
  model=md3.Model(classname,0,1,0,2,0,[],[],[one,two],[[-1.0,-1.0,-1.0],[2.0,2.0,2.0]])
  image=materials.Image(1,1,bytes(4,255))
  bindings=[models.Binding(0,"body","textures/item/body","textures/item/body.tga",image,7),models.Binding(1,"glow","textures/item/glow","textures/item/glow.tga",image,8)]
  cached=models.cacheModelTriangles(model)
  return models.Asset(classname,"weapon","models/test.md3","",model,bindings,cached,2.0,12.0,4.0,100.0)
end function

function main(args)
  count=0
  count=count+require(models.definition("weapon_machinegun").modelPath=="models/weapons2/machinegun/machinegun.md3","machinegun retail path")
  count=count+require(models.definition("WEAPON_ROCKETLAUNCHER").modelPath=="models/weapons2/rocketl/rocketl.md3","case-insensitive rocket path")
  count=count+require(models.definition("weapon_grenadelauncher").modelPath=="models/weapons2/grenadel/grenadel.md3","grenade launcher path")
  count=count+require(models.definition("weapon_plasmagun").modelPath=="models/weapons2/plasma/plasma.md3","plasma path")
  count=count+require(models.definition("weapon_grapplinghook").modelPath=="models/weapons2/grapple/grapple.md3","grapple path")
  count=count+require(models.definition("ammo_bullets").modelPath=="models/powerups/ammo/machinegunam.md3","bullet ammo path")
  count=count+require(models.definition("ammo_grenades").modelPath=="models/powerups/ammo/grenadeam.md3","grenade ammo path")
  count=count+require(models.definition("ammo_cells").modelPath=="models/powerups/ammo/plasmaam.md3","cell ammo path")
  count=count+require(models.definition("ammo_slugs").modelPath=="models/powerups/ammo/railgunam.md3","slug ammo path")
  count=count+require(models.definition("item_health_small").modelPath=="models/powerups/health/small_cross.md3","small health path")
  count=count+require(models.definition("item_health").modelPath=="models/powerups/health/medium_cross.md3","medium health path")
  count=count+require(models.definition("item_health_mega").category=="health","mega health category")
  count=count+require(models.definition("item_armor_shard").modelPath=="models/powerups/armor/shard.md3","armor shard path")
  count=count+require(models.definition("item_armor_combat").modelPath=="models/powerups/armor/armor_yel.md3","yellow armor path")
  count=count+require(models.definition("item_armor_body").modelPath=="models/powerups/armor/armor_red.md3","red armor path")
  count=count+require(models.definition("item_quad").modelPath=="models/powerups/instant/quad.md3","quad path")
  count=count+require(models.definition("item_enviro").modelPath=="models/powerups/instant/enviro.md3","battle suit path")
  count=count+require(models.definition("item_invis").modelPath=="models/powerups/instant/invis.md3","invisibility path")
  count=count+require(models.definition("holdable_medkit").modelPath=="models/powerups/holdable/medkit.md3","medkit path")
  count=count+require(models.definition("misc_model")==void,"unknown classname ignored")
  sample=asset("weapon_machinegun")
  skin=skins.Skin("",[skins.Mapping("body","textures/skin/body")],0)
  count=count+require(models.surfaceShader(sample.model.surfaces[0],skin)=="textures/skin/body","skin overrides embedded surface shader")
  count=count+require(models.surfaceShader(sample.model.surfaces[1],skin)=="textures/item/glow","embedded shader fallback")
  count=count+require(models.imageStem("models/item/skin.TGA")=="models/item/skin","TGA base-image stem")
  count=count+require(models.imageStem("models/item/skin.jpeg")=="models/item/skin","JPEG base-image stem")
  count=count+require(models.bindingForSurface(sample,0).textureSlot==7 and models.bindingForSurface(sample,1).textureSlot==8,"surface bindings retain slots")
  count=count+require(models.bindingForSurface(sample,2)==void,"missing binding")
  triangles=models.renderAsset(sample,models.identityTransform(),8)
  count=count+require(len(triangles)==4,"all model triangles")
  count=count+require(triangles[0].textureSlot==7 and triangles[2].textureSlot==8,"surface texture slots")
  count=count+require(triangles[0].imageName=="textures/item/body.tga" and triangles[0].shaderName=="textures/item/body","image and shader retained")
  count=count+require(near(triangles[0].positions[0][0],1.0),"MD3 vertex decoded")
  limited=models.renderAsset(sample,models.identityTransform(),3)
  count=count+require(len(limited)==3 and limited[2].surfaceIndex==1,"whole-model triangle budget")
  count=count+require(len(models.renderAsset(sample,models.identityTransform(),0))==0,"zero triangle budget")
  count=count+require(try(models.renderAsset(sample,models.identityTransform(),-1)) is error,"negative triangle budget rejected")
  placed=models.transform([10.0,20.0,30.0],models.yawAxis(90.0),2.0)
  transformed=models.renderAsset(sample,placed,1)
  count=count+require(near(transformed[0].positions[0][0],10.0) and near(transformed[0].positions[0][1],22.0) and near(transformed[0].positions[0][2],30.0),"public weapon transform")
  count=count+require(try(models.renderAsset(sample,models.transform([0.0],models.identityAxis(),1.0),1)) is error,"malformed transform rejected")
  bob=models.itemTransform(sample,[1.0,2.0,3.0],0,0)
  count=count+require(near(bob.origin[0],1.0) and near(bob.origin[1],2.0) and near(bob.origin[2],15.0),"item height and bob origin")
  later=models.itemTransform(sample,[1.0,2.0,3.0],0,1000)
  count=count+require(not near(later.origin[2],bob.origin[2]),"time-driven bob")
  count=count+require(not near(later.axis[0][0],bob.axis[0][0]),"time-driven rotation")
  count=count+require(try(models.itemTransform(sample,[0.0,0.0],0,0)) is error,"bad item origin rejected")
  catalog=models.Catalog([sample],[models.Texture("textures/item/body.tga",sample.bindings[0].image,7)],void,0,7,1,0)
  count=count+require(models.find(catalog,"WEAPON_MACHINEGUN")==sample,"case-insensitive catalog lookup")
  count=count+require(models.find(catalog,"weapon_railgun")==void,"catalog miss")
  entries=[FakeItem("weapon_machinegun",[0.0,0.0,0.0],true),FakeItem("weapon_machinegun",[10.0,0.0,0.0],true),FakeItem("weapon_machinegun",[20.0,0.0,0.0],false)]
  batch=models.renderItems(catalog,entries,0,1,3,10)
  count=count+require(batch.drawnItems==1 and batch.skippedItems==1 and len(batch.triangles)==3,"item count and per-item budget")
  batch=models.renderItems(catalog,entries,0,2,4,5)
  count=count+require(batch.drawnItems==2 and len(batch.triangles)==5,"whole-frame triangle budget")
  count=count+require(try(models.renderItems(catalog,entries,0,-1,1,1)) is error,"negative frame budget rejected")
  print("PASS: "+str(count)+" playable item-model contracts");return 0
end function
